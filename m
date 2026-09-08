Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A482BE05A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874904; cv=none; b=g10kPmUf8TFAqOWbOaP4PSdpi0zkxb4w9AsfQ/mluAZlMOjcp3LBizhnUVPrbHyQRxJfB+CXd050Vbg/p4+TeoJFaNHf0aAOjKwUAZJ+VbVEl0Xhfqg4qv/B4Pode29F+qlnQjIYuf/Vb9mD9SupbInGbD2XwDTLlU9ZIIuy8RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874904; c=relaxed/simple;
	bh=RDPQq58Cd3DI2HDQUMxeKmPp0jGflyU98pZlpLkOxzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=byq8BMiEItLtgyIMb/SOFB9D9wp1zOK6K4PjMN7x+/mckBR8DG4LZHISn2As0T0aqRgyIvwM50lOiTrNK9domdfHK7glZtWOWK4t0A63mtYPdXCRCKPqe7NS9ryJLBAus6mR5ykuwYj8qviy13IRv5hDSXJgBdHQtyiG/I9pYN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AVoYe7Fj; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AVoYe7Fj"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4843e397f74so5216190f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788874889; x=1789479689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RvYCjwpDTspvXYGdD306UQH/AjlQHFsP0gn4FZ66m8g=;
        b=AVoYe7FjfXgLiWHZqu4XN3dTaOuMSymiHXKrYlfZb0EdMefnuQ9p3wYg14u0sTGh2G
         5sdbOKxQjib4eAQ3phxRHwLY07Im51GutTeOdPqwTQaHMlKWcU8/nOt1crRi2VDLNZy8
         dViWMdP+FuVLTKsVcndJYovi4LTyVGsc1vBkbiCmsTsqzFvoOaDZhYe+tNlmGSJS7zpC
         rol3516TQwaMXsplnPB5/jW3OQKj7m4it7haUPHXr8Q408e9rJPEJ46LZF0WSLGmw5fE
         bz6f9t/DKTU+X3zKH20sKiE61hq6MuXYaHHX/FGQkiF4oqb1Cfkk3HKwTo2I6WVxfCJx
         /qyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874889; x=1789479689;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RvYCjwpDTspvXYGdD306UQH/AjlQHFsP0gn4FZ66m8g=;
        b=c2OTqSRpvQFspfQbvBkQcRMaeckBELxTzVvCrGOgNF38NdXBEKcgsfLullXkj87M/v
         q+IEKelOm4hUvXVR3XGn7AxeH9HkMfIHBd7ufufpTDofdq6k5h2B5WAqxRvg5xI5FtCD
         Nh7aHNkSCo+56KAHg/Y3Z8UCmhS21BohBOIdzwZ0Gv8Otv6EnZhvkGxH1feNAYdvJOMF
         ysJDJTiqccs6tbWKRb2ud8vh8XqfmOflAHGjCG2nQ5TowLQK/OO1fKJIdDMHwiQRV7FU
         jHA9eMvv2T8H4HLATlUyFtRsxEWNJ9/HPDDWHmxTE5l/9mHCnEbX3alOCGa8s2YUQbKx
         M/YQ==
X-Forwarded-Encrypted: i=1; AKwUvBzL0rSuj3lO1nrCGVBSCJRcWR3D46698n6IemwYTnUjQbGd7SfFp1liPYtsndFaKIoW+CKXwTkPxfXsqFo=@vger.kernel.org
X-Gm-Message-State: AFuF++neV05z0PZmpbULelUFM+mkiGCEFevj0pCdJslsOaLz0ffpwPVd
	LtGAs+pmedBL9eSA3ndiYJ4JmXyoppzcUFhFoTXA8B5RdR2RlvCI+Bk+Rv/Yh+ZHMxQ=
X-Gm-Gg: AYBFou2u5Xhh44vc6PNnbQPX8KY6fnbBIILcXgNBM2OPSHlOM9sa1uVt7Bkt/qvdzVi
	K+pGR7ywtR1bg6H3mUA5ornjr4BIgsX2n+J+tTdwiUlqBnEzQ1e+pcPRDKzN8AnfsN0sIx5TULa
	xUFixNzHUU+P9E1VMJ4+1wYtnNq4W6LSFL80dQqs7+1oGreaVvNbw9So8QORV2XVln0nCFuaNxA
	OTBaV16zbeu9vYNDpDh8EQgCHFKtzmoPSg1mbuf+rzTyi1/Gp4XsxDCCr4hRuuX9/bNXI+66emE
	kUEFD9Oq1bzRD8qC/jJX5v5xznaon0e2lUGmrHliJb90qwbOCSPOzCcwjD6vTjdxrVGqKg6H2WL
	sQLJ6Ty0wtqQX4XuO/JV/euJbd4bAhlcagvDKc5wvTGCqow+nBhHkgpU9DwX7UmCyNvAYP6/0Hi
	qu3lmsSexxb/Wiz+a+PkLePWjr6OXSFthZSkee2U7LLZjLoLJo5rw4rs1Obn+Bl3iopwNH
X-Received: by 2002:adf:edc8:0:b0:482:e658:7a39 with SMTP id ffacd0b85a97d-4857e5171femr30520180f8f.11.1788874889298;
        Tue, 08 Sep 2026 06:41:29 -0700 (PDT)
Received: from [10.11.12.110] ([79.115.63.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfe14sm36702704f8f.35.2026.09.08.06.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:41:28 -0700 (PDT)
Message-ID: <dd704898-c51d-46e4-bef2-28d863cdee22@linaro.org>
Date: Tue, 8 Sep 2026 16:41:25 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] opp: fix use after free in _update_opp_table_clk()
To: Peter Griffin <peter.griffin@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 andre.draszik@linaro.org, alim.akhtar@samsung.com, krzk@kernel.org,
 kernel-team@android.com, jyescas@google.com
References: <20260908-opp-core-uaf-update-opp-table-v1-1-93d3fc928c5c@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260908-opp-core-uaf-update-opp-table-v1-1-93d3fc928c5c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/8/26 3:37 PM, Peter Griffin wrote:
> dev_pm_opp_put_opp_table() frees the opp_table which is subsquently used
> by dev_err_probe(). This causes an Oops during boot on gs101-oriole.
> 
> cpu cpu0: error 000000006b6b6b6b: Couldn't find clock
> Unable to handle kernel paging request at virtual address 006b6b6b6b6b6cd3
> ...
> Hardware name: Oriole (DT)
> pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : _of_add_table_indexed+0x80/0xbb0
> lr : _of_add_table_indexed+0x6c/0xbb0
> ...
> Call trace:
>  _of_add_table_indexed+0x80/0xbb0 (P)
>  dev_pm_opp_of_cpumask_add_table+0x70/0x120
>  dt_cpufreq_probe+0x23c/0x480
>  platform_probe+0x64/0xb8
> 
> Fixes: 84f05af0975c9 ("opp: Use clk_get_optional() to avoid leaving opp_table->clk as an error pointer")
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> This UAF regression was introduced in v7.3-rc1, and causes an Oops on
> boot for gs101-oriole (in part due to our default upstream kernel dev
> config having memory poisoning enabled, hence the 0x6b6b6b6b
> pattern). It is intended that this patch should get picked for the
> next -rc.
> 
> Peter
> ---
> ---
>  drivers/opp/core.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index 2fafd983de8f5..c8b941cb81b44 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -1581,6 +1581,7 @@ static struct opp_table *_update_opp_table_clk(struct device *dev,
>  					       struct opp_table *opp_table,
>  					       bool getclk)
>  {
> +	int ret;
>  	/*
>  	 * Return early if we don't need to get clk or we have already done it
>  	 * earlier.
> @@ -1607,9 +1608,10 @@ static struct opp_table *_update_opp_table_clk(struct device *dev,
>  	opp_table->clk = clk_get_optional(dev, NULL);
>  
>  	if (IS_ERR(opp_table->clk)) {
> -		dev_pm_opp_put_opp_table(opp_table);
>  		dev_err_probe(dev, PTR_ERR(opp_table->clk), "Couldn't find clock\n");

you can do ret = dev_err_probe(dev, PTR_ERR(opp_table->clk), "Couldn't find clock\n");
> -		return ERR_CAST(opp_table->clk);
> +		ret = PTR_ERR(opp_table->clk);

and you won't need this duplicated line.

with this addressed:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> +		dev_pm_opp_put_opp_table(opp_table);
> +		return ERR_PTR(ret);
>  	}
>  
>  	if (opp_table->clk)
> 
> ---
> base-commit: df2908090cda368b01ff43709f51890076c56157
> change-id: 20260908-opp-core-uaf-update-opp-table-0d9ea3741231
> 
> Best regards,

