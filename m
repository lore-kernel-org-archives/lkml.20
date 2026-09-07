Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D1B34DCC7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788755970; cv=none; b=tWzXlhJpKVG1TEcWpDLfir5v+7J72eX+1HzNU4ph3Ej6eRfC5u+M8FQtWfPHFPE9NuTBtW/Nmp2ObQCVcpLAftHoK9WnX6pvGE1O3CDP69k4UPg6jToncrJpMc3D3sCvGbfjILsC3lp7nLCgADTmD2u8uhVGc0FVCLAscklAzjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788755970; c=relaxed/simple;
	bh=SHkFjsUEK8BRAqvmfnv5vItChhZEKbXF3e++QGo0kBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jGF5w+lzlaeILIFfZG5oLG2hk2cI0l83Qwia0pwCJYldPnmootBEr5R+EqwR94qzgUxT33/ZG8yHTB/9QDVZJmk2+exLS89mUCAMmPqdqnG6JwBQ2XqPWxurhonAQH4VjY0MNOO0t1EEIqPWvQrzZv0Meey+lz+uYU9lDCycPVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PIANc05N; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PIANc05N"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso27371575ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788755967; x=1789360767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OZVd8AEPtHxGrM09Xmw7u8IpkGldFD91EALn5nG1tdA=;
        b=PIANc05N512QUTF5TjEtlbM4w7en9fL8O6BhtCA83roQ0jfUKukb//ho+6RXKySd9G
         FUTw3G0FVSbMNUtMYku3cZHHlvlWyfjjJU1OVIXHzVBQnjMwT2JBWDeHUDO1DzVMkcrq
         AxN6vpFP78ujLulq5uM1dTmRzi+LtC7nNUXT18TUw3Ahk1SOaot5RiQPSLJ/2M8AjXDY
         c4jOM5KGpPU8aUg5vTo0VaGJqfiJ5RwIZVKupuv/lHnbq48TMS7H+gvkXalZhIqrdyU4
         pndd0TNeuW9n0qkAm6pPJvKjOv5aq07RoZ4kaYjA9B1Lf1FeGycUCndnf8+V8OGsGPYn
         uAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755967; x=1789360767;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZVd8AEPtHxGrM09Xmw7u8IpkGldFD91EALn5nG1tdA=;
        b=bNyHNWb4IoD6URwkirUF//ZrFkxKxLrDABSTSFLMZbyktH0Q/oR8AHD2VHfreql6aV
         1+o+UZ3+cHabqE+q860Gt8TjRyEUGZp9FoD7rTl3Mzzsdq8zJ1dN9eo2zTlviqoPMv4y
         mcGXeg5EC5d4TEG65ixnN38kl/3lS6uaGp4nVrGqzyimtGT96TYkL06E7ICmcWLtL4fn
         8PdXrhOZQ2zIrLC2G2AzAZb/X1MV1SIyIh0QxhIdkHEYsUB8JYsFPx1waqbw1SS2DnzV
         lShjEHG3Wr+plcvX9J5C3kgXvLVACmvNbQLhrq+nswo5L3ykGHwPNAGrgtavIHYu/vJX
         wbyw==
X-Forwarded-Encrypted: i=1; AKwUvBzksHgQ44DAsHzuO1FLrPwJbKUvVDU4TMSfDWzw2iP0JwVnSbGWbnw5PUBcHZR5GXO+BiV9t7Vhdc9etlQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k5MaNqFWM3wVxCe3s4ybxvaEss0OIFMW+FEv2Iw3BqP7BbWCx4
	L+7oSujPkv+yS3WB++hNM8N8RGHkm2lJbTIdccDDDqF6d+8YQWfd3iH/1qg2VtLCRD8=
X-Gm-Gg: AYBFou3YiqKTTFYBnE4zCrE5/Lu3ZUBaUE0D1ND2DcX4d8bvo6L/cc8PENbJ5lZMJol
	IXlcVT2fv0xURWRyCggWX3qF2apUaHL16CE13ESH6o5t4H8FpehqZSqWpJSc9kzfpOGzV1ET+gi
	5W+4M9vaV2pUOkFGgYIND4CrlfRRKHsRTARUJAmrei3zUcssm6eDWD+miJtpSGXguy74PkEavcs
	GDZz18lpuglnFSha6txG3kN3OVhUnW4wZkZJh/OILQwcsBATMq3Brvq7S4LZ2DxeYghPNMQdLEM
	Ytoy5XhtLF7GeWg98CDzqfpAKUKBXyDxhBegEJnz4f/ifgbR2lDrWrWl7FtSVNSl6RUsN+5o5yQ
	iL05IJoxzWK4l6Ta5irZ7XhyQzPP+kgNf6KD6GJ0dlHiK5NYKcoHVHP2O9HIeERGDwMX0Nc7gsQ
	5LHK9hQr7Zr+E8D5bsy6Zxn8ccsB4ftCyhQzVB9/iUUCNAJoB7WO38dezudVgiyAk=
X-Received: by 2002:a17:903:37c8:b0:2d9:50:a91b with SMTP id d9443c01a7336-2db12667eeemr299920485ad.16.1788755966732;
        Sun, 06 Sep 2026 21:39:26 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm26643998eec.2.2026.09.06.21.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:39:25 -0700 (PDT)
Date: Mon, 7 Sep 2026 10:09:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sumeet Pawnikar <sumeet4linux@gmail.com>
Cc: rafael@kernel.org, amit.kachhap@gmail.com, daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com, talel@amazon.com,
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
	mmayer@broadcom.com, sumitg@nvidia.com, krzk@kernel.org,
	peter.griffin@linaro.org, myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com, cw00.choi@samsung.com, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, sven@kernel.org,
	j@jannau.net, marcan@marcan.st, casey.connolly@linaro.org,
	sre@kernel.org, wens@kernel.org, t.schramm@manjaro.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de,
	imx@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] cpufreq: Use %pe to print error pointers symbolically
Message-ID: <ap4_-12ta7ThxEjc@vireshk-B250M-D3H>
References: <20260906061755.5103-1-sumeet4linux@gmail.com>
 <20260906061755.5103-4-sumeet4linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906061755.5103-4-sumeet4linux@gmail.com>

On 06-09-26, 11:47, Sumeet Pawnikar wrote:
> Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
> to pr_err() and pr_warn(). The %pe format specifier prints a symbolic error
> name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it
> falls back gracefully and prints the raw integer value. This makes messages
> more readable without any functional change.
> 
> Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
> ---
>  drivers/cpufreq/bmips-cpufreq.c   | 4 ++--
>  drivers/cpufreq/cppc_cpufreq.c    | 4 ++--
>  drivers/cpufreq/qoriq-cpufreq.c   | 4 ++--
>  drivers/cpufreq/s3c64xx-cpufreq.c | 5 ++---
>  4 files changed, 8 insertions(+), 9 deletions(-)

Applied. Thanks.

-- 
viresh
