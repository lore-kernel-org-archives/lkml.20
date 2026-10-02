Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06753E3C4F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 18:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790967352; cv=pass; b=Yb0UFeBMcQtF/wnhprROtrGyEL42Ps6HmeWFCxLoQzF8i43S5vn5lJco6bbwFF+lhonNuuBEPQTSjta5Irf//SPyrIQPHnqLpAaNAxJoq8vq89xWS+Q0QMFcivWWkWRUvZEXfQvqbcbannuOYloKnjdceXZv8HHswHGGNg3a2AQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790967352; c=relaxed/simple;
	bh=OR38zRZFAFpy4mOZaFXDsm6BWL0amMVzyna9ToNEKKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LVv8k+ANrPJhv/Tpl+knMZpaa1S3gBbUWQpPeDXjC5+8+qrlU2yd9DZ5Sn0b1kbfa3NM/oNvz5un/TZFrXnlGmAHJVjdLm3xlCQ0l+rIkytOmguMw+tFxDM3sdlcxGUh6R1KS6Q3H85fhU5DXqLFCVHHEPYTR0P345GpFXSyves=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ixtdxi2e; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ixtdxi2e"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-895eaf31683so84685997b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 11:55:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790967350; cv=none;
        d=google.com; s=arc-20260327;
        b=XwolsXe5aVijPNqNA3BlpSTtKQsLd0tm5nB2iV/S5pu5yzB8Arc4V/3J21Vlkfqf4G
         80aOyOlGhKamld6tlI2e9IAb1xquXH8HzNvxJds/jdBUkIevOir7WKsx3CIWo57RRo1Z
         KM9IkZc6xwC+YdQqxLvvRcllFrOy0UV0CEB6yg7bM6nBKiof6lAYI4aqVVVyq/AfHWwx
         noyZq6Bt2fU/kUBlGIUdjMCANoe7ukmoexZX5uMtTuQLHH0n+0XUnbuvO7ki1sW94INo
         ZcuPV0W4T9OHK+Fz6QZKBlY4etuY2KJagWfh/BQET99UcpMtDiO646aGJ3Td0p2q1MKk
         H8DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9S5eAE312pd6HZl9cjvi/BgiTHAVYy5cEZ8AWzWw5xo=;
        fh=DVU66comvxLfNmqgCDzC+mdtSdejkRHshrIHKp106Xs=;
        b=sEXKBpZD1RRebr7XroAnEjWo1bhZccCkuCZ/a3n5f4K49dIw2syn7h8oDWM3ej9Fy3
         6y4e09sq7GGdrmltAgLfZlDkJG26bQVe2maTUZdPI+cDZrN68Vp4toghpYucB340yz0A
         ugtaI106bfEn51dZILWea86uKoUsDpEpzOttWqH+PX7MwGIxmfcNOxb1NNyeSyr9OAxu
         sClkELJrgLMx0UaHgqNDT7APGANxrd7dXgjK0Tex2cKBa5Rv/r058LWojxlcQfRd6Jef
         TvPATdGoTaG3dZ6uCODt7JFLM3CSYvxBRrTvHnoXA617P+QHe6AEzpwJWFAhn0FyS+0/
         qPsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790967350; x=1791572150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9S5eAE312pd6HZl9cjvi/BgiTHAVYy5cEZ8AWzWw5xo=;
        b=ixtdxi2epUtKkuXGhSUNb8u7gi3ElY1KdTNYlhK+kZJUHuWz1ZvjK34YDV6lujj/Up
         GSLFC0IAjjq4Ixdmv7MqjzUtqTK8oyDqJzOvg89I/oikJqNofFCRxql+FNBq1lhsUNfr
         Mx63HpGg0Hnnvy6xYrQPmImodN190UZSNgdMUu+EGiBAXkkLW511auUv0DD7tU6M6u16
         uinBUCCSShX9Gkz95Fvx78wvnLoVxtU3eT+GzXvOT6BeoOte2+CunvbWjSgteAMhe1US
         JnopbvRys2LTPbnL8H2ZeXp7OeRuTQSQihOV1IeiHnNFglSX2LX2xTNqu+WAgPxxh2cq
         Z3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790967350; x=1791572150;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9S5eAE312pd6HZl9cjvi/BgiTHAVYy5cEZ8AWzWw5xo=;
        b=sD9sLXdIs+Y1aAVLhdkde7KVN9LxgFZ4eBn0ekvtG6dKi1QHjL38XvnZVtr7R0J9U9
         TIPglT8u/zvFqrvk48TMZNM7Dv6jz8VYUVo/foENbAYP2GHJZCFnMpnWNpSVgYF8bvyP
         uXuHERo02CdbzRlR1LF9l5RDt8AAdwq2zLKhPs0XS+IEl1kuAroMw9FmXkJO2fvYaxSk
         5AiGhmyu+KSOiDEZfSYMuNGGSr0LbeMjB/ok27oG0S7WKw6F+5ofRA/KqZQlqifGg+Bw
         KHW2ubS0UlWH7etapr3jmSl2Aot14rgDT8RSfy20YyaBaZICWp75rwtup3b1uAIwK9g4
         tiug==
X-Forwarded-Encrypted: i=1; AKwUvByuDAddChKhBNwUVXBidk3+P2pUMLKMh0qs0UNjTFTua9R2rEbJt1V2RdJHxVKWBKRbcSzvEK85a77LHHo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/kqaphFrfelSMJXTknH8rtLkUQg+QHpxR9HzsIxkHms1E+ydC
	lpC9loBb9n4mEIb8wp+w08q7zSTKsiDI72XTGeyhKyZ3+vKlHt+EPMlvO2g+6PZuo2ztIuDvmVk
	H1eOMxwep4W5vBjOAf4UyBDOzdFBw08I=
X-Gm-Gg: AYBFou1cQK7gGpN2apjE1RjdNSVu1qiXwyUFhim/ANrzZ7YF9x6OaMAjQMlwbnqpzDo
	441YSRtseWV1KJjWhRNdzKRFytcoIyAlSpxlfBGiF7AYDnwJuMZwnBJs65l0If4dei5zJDKxan/
	19I48+SWlBm1DdXptCDch3m4mZuyp/uLdOkLBRL6XsWro05Wm0O1gEF0PRvFf9AiHqKqcrJPhvx
	g6eRochwpsqUGj+Qdg2cwcEua4aVS5tLYkPFGn+o1AdnUUkl1ZnXeNmqd9e/yf8+ghhY9ZDMfyD
	voQb+BlzigAPq568iFunqRzzKCSaYJ68AjaKJsusIJitw4yc0+DZoTuu
X-Received: by 2002:a05:690e:1243:b0:677:b7e7:f68 with SMTP id
 956f58d0204a3-677b7e71be5mr813923d50.108.1790967349727; Fri, 02 Oct 2026
 11:55:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-04-k3-pm-support-v1-0-0acd2b36b96f@kernel.org> <20260918-04-k3-pm-support-v1-2-0acd2b36b96f@kernel.org>
In-Reply-To: <20260918-04-k3-pm-support-v1-2-0acd2b36b96f@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 2 Oct 2026 20:54:00 +0200
X-Gm-Features: AclHuK9ruP21ynPDiadHS4oYScZ4A0eIuHPpImnDhttohXSuBO4BfsPMVhy9WRo
Message-ID: <CABdCQ=OUTASG8JDBqnJAPJ5aTDUC-BQzCVcw0r=cxrb8CPUO2A@mail.gmail.com>
Subject: Re: [PATCH 2/3] pmdomain: spacemit: Add power domain driver
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El vie, 18 sept 2026 a las 7:49, Yixun Lan (<dlan@kernel.org>) escribi=C3=
=B3:
> [...]
> diff --git a/drivers/pmdomain/spacemit/pm_domains.c b/drivers/pmdomain/sp=
acemit/pm_domains.c
> new file mode 100644
> index 000000000000..d563e4e4e232
> --- /dev/null
> +++ b/drivers/pmdomain/spacemit/pm_domains.c
> [...]
> +static struct spacemit_pmu *gpmu;

Would it make sense to embed the 'struct spacemit_pmu' pointer directly int=
o
'struct spacemit_pm_domain'? Other generic Power Domain drivers (Rockchip,
QCOM, Renesas) use this pattern to keep domain callbacks self-contained and
ready for multi-instance SoCs

> [...]
> +static int spacemit_pd_power_on(struct generic_pm_domain *domain)
> +{
> [...]
> + regmap_read(gpmu->regmap, APMU_POWER_STATUS_REG, &val);

Please check the return value of regmap_read()

> [...]
> + if (ret < 0) {
> + dev_err(&domain->dev, "power-off domain: %d, error\n", spd->pm_index);

Typo: should this say "power-on domain" since this is inside
spacemit_pd_power_on()?

> [...]
> +static bool spacemit_pm_get_state(struct spacemit_pmu *pmu,
> +  struct spacemit_pm_domain *pd)
> +{
> + const struct spacemit_pm_domain_param *p =3D pd->param;
> + u32 reg, bit;
> +
> + regmap_read(pmu->regmap, APMU_POWER_STATUS_REG, &reg);

Please check the return value here as well

> + bit =3D p->use_hw ? BIT(pd->param->bit_hw_pwr_stat) :
> +  BIT(pd->param->bit_pwr_stat);

Since 'p' is initialized to 'pd->param' above, you can use 'p->bit_hw_pwr_s=
tat'
and 'p->bit_pwr_stat' directly here
