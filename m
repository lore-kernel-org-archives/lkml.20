Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482127;
	b=oFFwp+SwAydTkpnWyQQUU/2zmnnMPLo4C/XKl8QFLkzDqrYlHHSCqGb/0eaeaQTmiLqg
	 QTJZwprERMJo5dlJuMRuk7vO2PEBqKSy1QASQhr9XlSDVhb+BmvsCMp4f7euilboPHTfx
	 tUldU9TJEZczlKniOlJjyKJqmA8YlimAIEltxVDhl+gkjY8+Dt+jC3OHejs+9MjncmbmR
	 fMgEy6gNZOXbM9a1EIHHZn3Z35Qs9d8kcs4hrKowAD5EX5p2PPKvn+kas3gzt9NKapeeT
	 KG0gR3QM2g/Klh5HdhgteMKWGdqHkqdK/C7+loePYxPVq5coMnQfsCN/iBCzhX5XrVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482127;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=SuWKI/RUrqXAHxQn1RyYywEeadNWv9dy2AG43KMbWRg=;
	b=d51JHOF1MhnldfJNZIO+maTQQd5ID6yw9EaR9XYoXWJlMpGAmp3zMp4HbC6YkJGcmp1g
	 sbl9+KiH97JqE5DkuwaQoGI+H20QC1VYktACW69vWHwHcGcVg2zuaGh0AQh3NS5EGVIHK
	 vgCXrZcWc5XQ8LKgBTy0DWnLCPxvGt15ntWrkh/us/1oyX9MVYUr6Y9+HukkCA+b+LOrc
	 sGMHOMPtHBTmAVRXFY9tW/CcQuwz2eNGBrElD3lTqOlxD7egXjCGQI7bZ+nb+4O9EO4Zg
	 oqXAK02ck3Ly8GRcrSUg2+kzT5ROgS3FXo1gyJQaCpeaJT4zgrGauE3FItFWnFI2qUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zHc4DU9u;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=NUIaLfL5;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0474606A319;
	Tue, 20 Oct 2026 07:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0474606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zHc4DU9u;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=NUIaLfL5
Date: Tue, 20 Oct 2026 09:42:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792482123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SuWKI/RUrqXAHxQn1RyYywEeadNWv9dy2AG43KMbWRg=;
	b=zHc4DU9uVGws6yzHHa9NO/l7OoEaXxR+mkXy5M9iFzwrNq7EsK4VRXKjy3EVJp7Q1iLsXo
	nVIfTEijBf6WdkzpnI/hbDpxcjpDjqWXHOa4nm1Y+0/hl/AzthsIK3Sf5QIsEsN/k6lIgJ
	PFLnIZ0SvPuI0z1Uz0tKvGRIc+KZw0w+0HOJSKLL7hn+LyNZPhgiq7NO11kbJbSRkZLDXh
	8j5rArUCmTshptRF9AaHTjxM54v18leNtCrgwawybTKfinNH3alQDZxNhVkeu/fjI0TBxd
	Zzk47MwB5kxvedyMomsQzf2BXbro19QCPI7xsehY4iYrBInl2xCla0MyqP9ZqA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792482123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SuWKI/RUrqXAHxQn1RyYywEeadNWv9dy2AG43KMbWRg=;
	b=NUIaLfL5rD4fWCZZjCNXdenRMCpfsTt5DUlzX8yP8vmPTEuadwgtBf1MoUXIcRE4FlMT7o
	kElxRLlYiZ41ozDw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ilia Lin <ilialin@codeaurora.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 3/3] regulator: qcom_spmi: don't take a sleeping lock in
 the SAW IPI
Message-ID: <20261020074201.Hug86drL@linutronix.de>
References: <20261019-fix-qcom-saw-v1-0-9c7ba3fc2493@oss.qualcomm.com>
 <20261019-fix-qcom-saw-v1-3-9c7ba3fc2493@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261019-fix-qcom-saw-v1-3-9c7ba3fc2493@oss.qualcomm.com>

On 2026-10-19 17:39:21 [+0300], Dmitry Baryshkov wrote:
> --- a/drivers/regulator/qcom_spmi-regulator.c
> +++ b/drivers/regulator/qcom_spmi-regulator.c
> @@ -2523,12 +2532,22 @@ static int qcom_spmi_regulator_probe(struct platform_device *pdev)
>  	if (!reg)
>  		return -ENODEV;
>  
> -	syscon = of_parse_phandle(node, "qcom,saw-reg", 0);
> -	if (syscon) {
> -		saw_regmap = syscon_node_to_regmap(syscon);
> -		of_node_put(syscon);
> -		if (IS_ERR(saw_regmap))
> -			dev_err(dev, "ERROR reading SAW regmap\n");
> +	saw = of_parse_phandle(node, "qcom,saw-reg", 0);
> +	if (saw) {
> +		saw_base = devm_of_iomap(dev, saw, 0, NULL);

I was asking if the syscon could be made using a raw_spinlock_t if all
users do simple reads/writes.
	https://lore.kernel.org/all/20260929-rbrue-suez-upstreaming-mtk-pinctrl-raw-regmap-v1-1-db92943f42cb@gmail.com/T/#u

If the qcom,saw-reg registers are not shared anywhere, then this should
work, too.

> +		of_node_put(saw);

Sebastian
