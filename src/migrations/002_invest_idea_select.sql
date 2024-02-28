CREATE
OR REPLACE FUNCTION get_invest_ideas(_buy_date_start date, _sell_date_end date) RETURNS TABLE(
	investIdeaId bigint,
	investIdeaName varchar,
	securityId bigint,
	securityName varchar,
	investIdeaDescription varchar,
	growthFactorId bigint,
	growthFactorDescription varchar,
	buyDate date,
	buyRate decimal,
	sellDate date,
	sellRate decimal
) LANGUAGE plpgsql AS $$ begin return query
select
	ii.id investIdeaId,
	ii."name" investIdeaName,
	s.id securityId,
	s."name" securityName,
	ii.description investIdeaDescription,
	gf.id growthFactorId,
	gf.description growthFactorDescription,
	ii.buy_date buyDate,
	ii.buy_rate buyRate,
	ii.sell_date sellDate,
	ii.sell_rate sellRate
from
	invest_ideas ii
	join securities s on s.id = ii.security_id
	join invest_ideas_growth_factors iigf ON iigf.invest_idea_id = ii.id
	join growth_factors gf on gf.id = iigf.growth_factor_id
where
	ii.expiration_date < now()
	and ii.buy_date > _buy_date_start
	and ii.sell_date < _sell_date_end;

end $$;