Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637684848A5
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 06:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790835730; cv=none; b=j0t3J6UO7Jh/QN2K99eNW7cJH9u4Bjy9ECuY3cwvqoA8rsew/Lo5dLnvYoAxHvz8d5OdI/HRVLuJPrwGRBUvSEPKeJB/V5Pt2IpX5vFNz0DmCk03wO3ribTqEwV0Sh33eQREsKRuw/c4a1pK2zo6/9H4iPhvL2maZqdyrvLU5JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790835730; c=relaxed/simple;
	bh=jK8YcmgULqcX6JVEZ4kRXjt5tovYz/f4IYFMschjLGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JCQy8r/AiuI/FabuBMyzVqQlQ1udQ3DTh0jpRxAl5UttIFTZcKQKbmVgXa5b/nU4X7Q9TjUKE9zprRyPkTN4iWK2JmQtQ0O7bVTVqikJPUfClrjE8loYaafqWTsmDKP9MMKAwNgX9liXIjJNvajPPlqIN11eg+arAKSLCCg5hZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K2iA6g8w; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K2iA6g8w"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e630052ebso7040213eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790835727; x=1791440527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y7zcw/ukAiD8lLlXAKYppSFNCW4crk+K0J8KwggLYx4=;
        b=K2iA6g8wbvHkPECXpwO+9T5iw0NOSqhMYLQOuAHXigUm862xvqbeGZu4i8dLYBUpcG
         BREAAMQlLV6Fzr65uxxxGpJW7MZO6bePGyhaWcdliPm4F8hwSIjjnEj+cUK6t1jtjFEL
         3fkKekmeRDumBmBjlWm7erxBFqMpkt6iT1XX/8bd/v+RWZ1/HLwbnkESlHDRSHN+pgf1
         4TUZ/AiXPw5ngly4xlsylLo4F6IjfDE+g0IZEXKgpWjj3xLf7aZmsOMnLO7ySiLTvicy
         PwfL+AUsncVtgJz0Zrb/5zvqVdcfpxUFhyIslxTJIdYaJ4iikwZLNcJc9DP66CcMFwHT
         +pkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790835727; x=1791440527;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y7zcw/ukAiD8lLlXAKYppSFNCW4crk+K0J8KwggLYx4=;
        b=0wFNElldR+XYQDrO7oy74aXIYdflOYLPImdP+hz7s73LlsWa7ioYUNXD44Zvqbzl/s
         chJ4+ESX3Xj8dELBSR2wixsiNSJEKbuny1Ba+YSZ+wbaONZIz14HCeQFnEy4l5Hfjes8
         BGoRBsjaOpB2FaOBMuNXGsg7RgfN+4ZICO/pxtc4qcX4kBDJqwSKU736piXTbFD3DNn3
         8q/Dz7JKmA2ssM3hnvNG5rCAa/hYu0OTL5EhZqqfjiawOH55E0V41rTFkIJdcTHMR8i0
         ZsbqvQe1CpjeV6P2LSO4JBKaSUfomAzLj1heDuBp7SUf8IFoCf6/m16MDQIOxYYRet81
         WiSA==
X-Forwarded-Encrypted: i=1; AKwUvBxvF/fTqnA57ID4LILFjQs9c2koGQ/U3fDfgaJOHLvrKjAVZcHSwdke4OO4BJS+m2Ur44p33YebB66PBgE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWpeDb+7R59cMRqztoBrf+JM5d22uXt2ZNwxYIrXJYlj0vIdNq
	1AOhxdM/yVCPIOahnGTv89PvcTuknCNesefm+cjQ6MFBD374W4v8IsOhQOfLX7lZaUY=
X-Gm-Gg: AYBFou3ObqhBPoi3N/odndZN8D63rU85bQ5RalbvszqlOaftNQ3sbr8/OguFGUpIcC0
	AWKZ2b3JOWSmqHoKMPrTVM4xao3KjAzLiqYiMBACvrL6C9+Pgv8bYHOnHtl3gtNLd580Opb3l2M
	cno/aTYFObLuue3o0SOlXi2U+zUp3I80IvIZRCUi67P2xKZY6JZTwxCAjadw9ztYJplsoRsXpGS
	zdPTKlY8JOcPxISfGRlx8mzAmX7b7kAmwyQKLZCjZfTy//cZaeYggLEEahVBZq+v5445V/aYkmw
	kK6Mqsux9U/FNpumWR/vdyIwZCZ76EdjZi4oso0kfkcViOFoElfWz5u+dHCvcVZX5RWVLlZ+a1L
	nFFko/7zUxAsw3nzjWw1BEJ7tdp4hsIRWylekNr19zxRKNd9ZUxjAl8EmGPjVKkT8BtFMTvQGZe
	PV8PJxA90TghyMq1Wp095mKrmGhxWN1IfmLwEi8FKxTDPgSi169bhA5bHcQwbY3M+txpd5cFk+
X-Received: by 2002:a05:7300:d947:b0:34b:101f:cda2 with SMTP id 5a478bee46e88-34cdc1ce13amr3929856eec.27.1790835727212;
        Wed, 30 Sep 2026 23:22:07 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db3750765sm4040631eec.12.2026.09.30.23.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 23:22:06 -0700 (PDT)
Date: Thu, 1 Oct 2026 11:52:03 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ilia Lin <ilia.lin@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 3/3] cpufreq: qcom-nvmem: add support for QCF3211 &
 IPQ5211
Message-ID: <ar38C5omDdaXQAID@vireshk-B250M-D3H>
References: <20260922-ipq52xx_new_ids-v2-0-4b1a0f3d04b2@oss.qualcomm.com>
 <20260922-ipq52xx_new_ids-v2-3-4b1a0f3d04b2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-ipq52xx_new_ids-v2-3-4b1a0f3d04b2@oss.qualcomm.com>

On 22-09-26, 10:03, Kathiravan Thirumoorthy wrote:
> Like all other SoCs in IPQ5210 family, cpufreq for QCF3211 & IPQ5211 is
> also determined by the eFuse. Add support for the same.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> index efa766e98d86..9f2e6e6c0905 100644
> --- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> @@ -205,6 +205,8 @@ static int qcom_cpufreq_kryo_name_version(struct device *cpu_dev,
>  	case QCOM_ID_QCF2200:
>  	case QCOM_ID_QCF3200:
>  	case QCOM_ID_QCF3210:
> +	case QCOM_ID_QCF3211:
> +	case QCOM_ID_IPQ5211:
>  		drv->versions = (*speedbin == 0xcd) ? BIT(1) : BIT(0);
>  		break;
>  	case QCOM_ID_IPQ5424:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
