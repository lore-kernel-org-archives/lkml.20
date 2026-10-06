Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB71E2E738B
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 04:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791262140; cv=none; b=aqdX9PA7n8WmZlTKrbX/9IM0i6qFj1SgeHNP1RPxTYCeARN0ytIhhekLPOmegOCK941w0kUJ+Ev4uskrqg67ZSZMoeHK1AQ5U0oqEp2/P9/ugbwELUQLaSaAmVPMkkkVx1f7+STBLfXS8VE5sI0oCB3U3hnJNAbDVL1ByGAuLF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791262140; c=relaxed/simple;
	bh=0XGucEfSTFkwRP7XDjqeT+rZM5a2fwSXqv+Mzeq/nDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ros/3XwUM7YcWoMnu3TzyaEWXWSFLcdP51HCi+ntUcr6gjiFKilpuLdiqAEG61IFgIYKGFVHCEBy1p43f0M1wJxtTPL4GpKsmlwn3lvNzhvl+xuu8eTBaa3zJJPdOy4o7kAZmi6Nimr+bbfEGqVBRCiEl+pP3/4JDFq3Ij21kQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nbMCmHLS; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nbMCmHLS"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30b6dad2382so169466eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 21:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791262138; x=1791866938; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Mk2WRBAwChkq4s/3x9cH1VHTem4z6ve30tIS5Pq+dE=;
        b=nbMCmHLS6fxuEH+lGuwx/OtXk3sjEdKHyvkaDLsDoS41drNR1sHQD2CLXUoe4OMcPh
         Gl/vpmj6p6AciN1JE51/CXNWP2+UOZUKGaRfteILqy3rlDufsgCLPCanfowgmgisOuqK
         vV2y1nXs2SVK9yUfEuUnvjfqjZz29oYW26MD+3WKNyKafCQgKvqhMaYblze4mj+1tgKw
         kowUu/DwRFj6+i6l7Y3jZeFzUmXTIruQP+EIB9ufsFvlaP2Zc7wqesZzAEVZMuGDuP3e
         ns9phdvcMVxN1hKUtx9ORbjC/nhl91T/GqiV0PF8+Ir0yLS32o9qXJPIgiSwlfslTiAR
         r39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791262138; x=1791866938;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Mk2WRBAwChkq4s/3x9cH1VHTem4z6ve30tIS5Pq+dE=;
        b=z4NAgyPdtlWtO8KwC21iaW1RFY0qTfT4pWL9ahtJ6muz6e9Sk0uMxCvFQiPXbMjWV1
         TTDrks7rMdpxG/55tBYTwdeKz8KKQ3/vM4VTX5Z0GWpxTzMsToKiV+Mbj+/6zc4dbO71
         LZTEmsHyUT90//nt2RqWq+i+ic1Wy7KGEPkcsEPjrI0XlBvSOR7LkEz+2W+J5kv9di3U
         3CatOq9Rx09pWD+rOPw4Rl8N//pI4RRRQ3nBZUCuQJfwZABWM/PkOQ60C0MbbPXDxG1F
         d7tyFpg0oxgdZDFq6dGOxF8V6G/vnAdtPnhf8p8d96FEdokaHZxoMjIz4uBIHO2q45PH
         1qQw==
X-Forwarded-Encrypted: i=1; AKwUvBzSrA2xtzwPBUiNQG2VcAdDfc9oyr5jLEYlYFvCjD0NUtW5yuRrg/apn1AlKqdcp9fhPfS5hflKgIqCnvE=@vger.kernel.org
X-Gm-Message-State: AFuF++mntnRZqEBd55WtOZ2EDNFU1/dyFVYmrpcuOSdZ3bqJcdUST0yU
	EaHUS6u6DIjmyllBf+JkNwwEP6HNfRjiOhDyAPEoVWf4W1DuTMvd4zg0D3hLecvpFBA=
X-Gm-Gg: AYBFou2WLyB+m3utg5kMU3/YFQ+PHBTi+ftWDoT62qbh6E+N+Xjg4uVyRrurB6+4MuU
	f+OyNybC1ULr9bmtxtecp2aFl5/y22cnXNlLfbn4LZkvFVfNineXRZ2yIdPf6lfYv6ljtEEwwxG
	MHjZ2WrRBg6MEbL1fcHwuYYdROLKKCD5EWbb27dkER9+6DzztaKsdCEjAp9Awc3ZpTFZNUa8A6z
	RbRkZcw1a3kgnmRJSj3svjLLEwpjilHy31X2JamciN+ryKm9vkRgvlpf8soBEi0JvU+2iecLJ55
	5H6m+O/IXM6kzL2vvEgVomMUZAdic8qrmafEUU6ajgJGLeMynAxeJyLhFIUR4TVYv5opuJK8qAn
	xRVFIbfV+xWyCR03dVBhMdtfIyLnvTckbEDcb4dczW4TALtA3K2xvjpkKKUgjTLSsNdcltHr5/a
	5j7/HLsl6yOEbhXI0ehlwUwux0srFdDshoBtTD/1hNALHos05WRmLBhcLy+3YIjZqW7CRipXPpr
	YIUAKUPu5I=
X-Received: by 2002:a05:7022:6ab:b0:130:7246:10aa with SMTP id a92af1059eb24-15ec6306fd2mr585485c88.12.1791262137611;
        Mon, 05 Oct 2026 21:48:57 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d819cbed6sm6887345c88.4.2026.10.05.21.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 21:48:56 -0700 (PDT)
Date: Tue, 6 Oct 2026 10:18:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: Add Milos to cpufreq-dt-platdev blocklist
Message-ID: <asR9tbmrai1i9nTm@vireshk-B250M-D3H>
References: <20261005-milos-cpufreq-blocklist-v1-1-7af4eba81696@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005-milos-cpufreq-blocklist-v1-1-7af4eba81696@pm.me>

On 05-10-26, 17:47, Alexander Koskovich wrote:
> The Qualcomm Milos platform uses the qcom-cpufreq-hw driver so add it
> to the cpufreq-dt-platdev driver's blocklist.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index 371ca1fe9020..574c5bec4831 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -155,6 +155,7 @@ static const struct of_device_id blocklist[] __initconst = {
>  	{ .compatible = "nvidia,tegra234", },
>  
>  	{ .compatible = "qcom,apq8096", },
> +	{ .compatible = "qcom,milos", },
>  	{ .compatible = "qcom,msm8909", },
>  	{ .compatible = "qcom,msm8996", },
>  	{ .compatible = "qcom,msm8998", },

Applied. Thanks.

-- 
viresh
