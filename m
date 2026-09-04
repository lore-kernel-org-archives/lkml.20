Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12AD3D16FB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508953; cv=none; b=XSXXJJg4B1E690k5Z2TxAPfnxRSjwCONz7w4VnkGXOob0FspXVd6yKLnVCKZcVuFTdSnztW9+WPTwmuyDCZBILZSL33bpZswscEmuhlAtByLaCQ5iMp5FlrTAcFLeP8K+x+A2ePndNSOCtk1u8wdEgnN8e6A8qsMOJlRpekZpdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508953; c=relaxed/simple;
	bh=IWGp/NWkgG/a5CvbWg4n6hVzBMccA2mG1yRRLqy2pl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZE556c/GbO5Vcszq05Le3/lopM0Ueak+Omx+1X1qx+fVwXs/CPsw9fq9GYefWTJUyZIG43RRalHSnnh5+OFGQFe2Q2BqoPstb8J7sLb+1CasBe69SMrUO/asQCb9Tgpycmg87YfPxmCmOAuZLcDCrVKE3ncW6VRgi5bD+dq/uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YAPZWyM2; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YAPZWyM2"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6b132a5009eso556351eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788508951; x=1789113751; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LxXdH2O4yqJZkq6Caw3eDtnAXG7jVWIM1Lm/pGgl0f4=;
        b=YAPZWyM2Ovy2duq5ZRJ7oCvZzUMRIk0DgNiA4QA0RZ4yeSvoc1XsFHs4JtN4Kg/paB
         OeVBE/SDd+6jeImYNCnzP+RrpSufqQavCpFl/fvkMgc1nQoPJV+3+bY+YoLOuQVSRAnu
         r/lw10l7Gx+/KLMomN6fAwLGF7H6ycgXrLWohQONPx4eu7inVPUbiUZB0Pf9vRyLSPy5
         vvZP2LFiYff4uLo/ttCsfwP/2EFzIm8WLCkfYlq95y9A7/Wh/FTV3U/DcwKSPQ2IzJ0L
         /jI7XIn8QUTXE6p84j687ta3j+ftK7nXR7qxgrR/eWoHFSv9IxpT+Z9T0/7i8+26aUt1
         sVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788508951; x=1789113751;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LxXdH2O4yqJZkq6Caw3eDtnAXG7jVWIM1Lm/pGgl0f4=;
        b=W82xD7Lhul0n54TTrP54OvaP4ry3PTAMHdpZc20ps2McZN42+KiQ8qdnMZ0FDALJxX
         lwryph79UY8WxIUhxnc6MNwxC6JNiJOPwISWOiojhQR9lWH0WOA/uwPNKRPR3ifnrs1R
         qQm1EWWSKfTYuXCQrIDBYU3s9m3SkQDMi9aQnk1lk4YnYDSWqphSsDGJu7JNaSB4qZ/N
         fy6dtjK4lh9ziM06+Gbq0+653Cv4Lx+3fpsJeubx0H3AoA88+uVtqJqQ9fqZDQgt4eyO
         YBKC2e955b9UGvNCpmXuBba6FOFCoZX07+en7S2s5YuEGAAiKp6ToJ4eV9Zb3ydgQWlr
         CuZQ==
X-Forwarded-Encrypted: i=1; AKwUvByOF2iAQCl+Aglu53c3FJs3T/Xou0qJRLGTiBuzRWFQb0FN3QPD2kKJMS2PE54FRvYa5WiUUACgu9CaL0M=@vger.kernel.org
X-Gm-Message-State: AFuF++l0gRri7+7x3eIkda0gzfqjtXJKkvQO381K+R1W1mItnKalLnAS
	GaroVAJ66TNqFhiLURRxl522oUaKyAVKl4MVYhi9BVuzSrtiTEdDqWPpJMYbidEJLBY=
X-Gm-Gg: AYBFou1kTeWUsQEPHN93Ja1Rp5HRoQIc1WN+PhoUsOKM8+5h1BfmR1x5SuuM3El/0H6
	byb2XeWDSyjIgfGJgzBMqMBLrR/nTIuhCylCj8oOYiHGtRHLp7yuSyLzdVIaAnh3XzA0K8DX44W
	DYHJDI6tM7uX1CPT/WOW+54AFyoLEKHV1CmpCcCY21x3AYSJIZ0m6Y+IOv1IIJrfMW+azHZg/B3
	JH/3B29DtoTlnU9fun830wja6ADa9aq4sNG64vTBNBCeSEqqXCGRDh/uaqMrZ1lnV2cMYE3peEz
	wwBQSrTUQ0w/dBFMFReNOqFwokNQLsqZeJ+Qksn8AH4O4nRYGu1IalY2vdwrUdmgoH2yaHIix2/
	Z6m7871Ny1WP+OqaZ8AQbFVEv/buVJm97tpjSnUaQtOuAxzCkZ//S5MCr5WoyKSb1zQFqTX5shp
	tx0QlbP4FZM/HPxk6H9ZbdfGb1JkfXqu21V7Vd8ZUGBH5crRZSbCc5KkuwBs7qqmUooaKq/v5rt
	6w=
X-Received: by 2002:a4a:e915:0:b0:6b7:46fa:16a5 with SMTP id 006d021491bc7-6b746fa1ae8mr1522269eaf.58.1788508950532;
        Fri, 04 Sep 2026 01:02:30 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm5356732eec.7.2026.09.04.01.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:02:29 -0700 (PDT)
Date: Fri, 4 Sep 2026 13:32:26 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Frank Zhang <rmxpzlb@gmail.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] rust: rcpufreq_dt: add module alias
Message-ID: <app7EnFj9RMsdJcO@vireshk-B250M-D3H>
References: <20260904075635.14840-1-rmxpzlb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904075635.14840-1-rmxpzlb@gmail.com>

On 04-09-26, 15:56, Frank Zhang wrote:
> Add the missing `platform:cpufreq-dt` module alias so that the driver
> can be automatically loaded when the platform device is registered.
> 
> Fixes: 06149d8f2216 ("cpufreq: Add Rust-based cpufreq-dt driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Frank Zhang <rmxpzlb@gmail.com>
> 
> diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt.rs
> index 10106fa13095..32a508d82f68 100644
> --- a/drivers/cpufreq/rcpufreq_dt.rs
> +++ b/drivers/cpufreq/rcpufreq_dt.rs
> @@ -219,4 +219,5 @@ fn probe<'bound>(
>      authors: ["Viresh Kumar <viresh.kumar@linaro.org>"],
>      description: "Generic CPUFreq DT driver",
>      license: "GPL v2",
> +    alias: ["platform:cpufreq-dt"],
>  }

Applied. Thanks.

-- 
viresh
