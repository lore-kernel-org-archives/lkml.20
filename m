Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794892311;
	b=soEwARwS4b2KPc9PnCbpOxFWQmZuDvbA4Yq2PgZsapoU/8dZrcf71y4dNKlhGYLb7ZLS
	 q2HekgFZZNN6f+Ch0/j93ExqKxSXtZOAcy0CqsbEbDmKbWvK0fdNmOGp8RT43iqm+ZYfa
	 WQiwrL9wG8SOEMsJYFcKBc+UcAqp6kBEmAQ8gymx/L010xXWyZN93szCQ7rp2adsW5vPh
	 1bXPgLSpKPAG24nbVVZyDSJ0ewRp9I8jGJsKQno3TlRsoCEpA3jEkw5UhzF06mGxeZyxJ
	 rVek2vKudoTqfDeCEYj+3tRJt5MTkgGGDVH4N1A4UXpGqV0mGoUnPRFv4Zwc/GotuTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794892311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=cFIGFgrqmh7vJ8p05TfgpCv8oubT+IqY4VjNLXb1IxQ=;
	b=eqKwSJkgnjy4R45SJmm9aEY8xa2c6fobfLmWaUmkLt8wkBYHm3J1SlQjP7O4w37cCN1Q
	 REqWZInD9lM2oD/7I/PitALcLxY+1c/1JRtbnmdKM5Faxr8zDM7eQZpBJpkIXQYeFAfjp
	 a6iJ/AzaBplpkg/0hbRe2D4rg3Ycl/NC7dh58H4ZiG7Brc11OR2E8w2qLYId6wdD6u7Rj
	 iyxUOqyUfqz1duBcWF46/tf6VHjqtDEY1t15auW89/7q0XgoTsrdnYLU1jFsDoAJrVETr
	 PWRfQ2j7KPZtymm77H6sfXRHWRoUGhisuehnsGyr5R7BMqFkf8uDbQ60pB8Ke8lrEAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KUkwjxqY;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB371606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB371606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KUkwjxqY
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a2af4c8d00so8824734c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794892310; x=1795497110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cFIGFgrqmh7vJ8p05TfgpCv8oubT+IqY4VjNLXb1IxQ=;
        b=KUkwjxqY2sX91TEyDbP1VuzvxqZymLLpQ+APbi/GqefwJjM/dcMbwXeu6DoGvVCCKO
         rZ252LO3XGO1Ih5y0zh54MGbH9ApJIXFv6JPpO5TycX8ykPqIRy7cLnAOa7ZeF5nvqzL
         Vlof9WZBSz9XtVoxSnA0W13OMOQ2M30DKveLTBIytt97q+PQqAQCcuroQVKT+9AiI8is
         qfKjdips5pOpfuJGVXPxZ0eEfYSO87ZWe1nAdNSHE3RMyvcL5ZNZkFPPNH0NdIfLlNRT
         ZZ4etEKl6xRaYYdM9Z9ZdzxS0kDRCRxYOsxV0MWBTsTzLPIHRjf7+xjXQlUhoVGNvXqk
         u07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794892310; x=1795497110;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFIGFgrqmh7vJ8p05TfgpCv8oubT+IqY4VjNLXb1IxQ=;
        b=urKE4H6bP4a7QMEXu0Zw0YI11sstJjektc5ISP5YgNRJyDYdPqpMnhDa6V3NKf9XiV
         jVXCb+JCKqxAWR5o0/l30D2aZd7WZTOcKU0yeTjwSvtiQsJlKTtMNQPjCs3arybnOtyD
         VH5FbTg4wDngYaiAB8S9es5wvX36ZsXY/8uA3f6gO6x+vpDhrwk8GqKY3xsCDNHTEcp9
         Q4nMrtsmdcDpSQauMn2PjgCb5yRbhfeczoJhTeVL/ON7CXS8Ah8sRifqPR4t0CW7g1i9
         /4y90AUdA6Nm8GakBFLZue6aJevfogvKDc5jQkb4fK0b6ySGYTar223ynReZwQ7czX8y
         pOcA==
X-Forwarded-Encrypted: i=1; AL+hErGnjT9LveunwSI9x/qU43tCehk8sS75BcSWyvV7HNoqaobWMgHAlfdv3ZfSKtOdqFlOwJIYfOvSxX0AH28=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Jls5pE1pWUIJCS9X2lPLtuJfsJlbGaI7AsVeDC262b/YXvEH7
	tLuPrE0UH1UPdXFya6JoVX281CjXKhWNouD7N4rLU6ggOGWZy0aGe+5y4cnoP1ZqrP6fZlSXaWA
	Ko2Ov
X-Gm-Gg: AYBFou2QIEMmUXs0iyQMwAnKR2rCCGg1Pt0YqRNdGMglQAQfrTxmwlmQYif5WAeqnGu
	WWZfTV2IpQgZkIiuYXmz57Jsi/8CmfSor3E7DKlDL/gTHsG/S9+Q8fI63iyBwan5Mg7XgswIDAx
	ypia09rFVbEfUChjpabY49qqtbEpnpSyaPpSGHp69i4BHfUq7ijqCwAKfHZr8xsEGym9TvU1Ror
	39RHyfuwlOeNWGR7Xv/xpzYnoEjokWbitJURuEOPiDg6K7di2+9QobRtdZxH+Z6mX2+5EjR8+5k
	DFUF0sypQdseoTMtpmvDLc4BE8U5QT9bOHDitd2fFbjtvcSP7D64FEVHjppgnkbnTrficivUOY/
	vQ5Eqay3NJ1GbegC7Tzy+uyu/CwKN954p+GNVxtpCLo0uHpOXzIhOolF0NNvSiTws2dJq6lHM9o
	aspsq+iETwKHLhAsBx3XCz2QFh/iT7+L1lx3qzvVIkxMxeeuEXPyTwzppcyhdbatLZAOnR5KxDl
	w04b0IivyAKtRc17tS9HMSokPJ5E22cY0isT2TDGyPgHY4VljaWudO00FDgOfyOWvx722ZDs3OS
	TF6wPDo/97esg+C8DyiBaya1kKnX3A==
X-Received: by 2002:a05:701a:cc87:20b0:1b5:3878:aa29 with SMTP id a92af1059eb24-1b53878b8c1mr2057482c88.38.1794892309617;
        Mon, 16 Nov 2026 21:11:49 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm53754284c88.9.2026.11.16.21.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 21:11:48 -0800 (PST)
Date: Tue, 17 Nov 2026 10:41:45 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: rajanyadav0307@gmail.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] cpufreq: sun50i: Handle boards with the
 allwinner,sun50i-a133 compatible
Message-ID: <avviEW1-h495D0B5@vireshk-B250M-D3H>
References: <20261104-a133-fix-v1-1-d0b5ad3d4c5d@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104-a133-fix-v1-1-d0b5ad3d4c5d@gmail.com>

On 04-11-26, 22:07, Rajan Yadav via B4 Relay wrote:
> From: Rajan Yadav <rajanyadav0307@gmail.com>
> 
> The Teclast P80 uses "allwinner,sun50i-a133" as its only SoC
> compatible, as documented in the arm/sunxi.yaml binding. Neither the
> sun50i cpufreq driver nor the cpufreq-dt-platdev blocklist lists it.
> cpufreq-dt then probes on its own, finds only opp-microvolt-speedN
> properties and fails:
> 
>   cpu cpu0: opp_parse_microvolt: opp-microvolt missing although OPP managing regulators
>   cpu cpu0: _of_add_opp_table_v2: Failed to add OPP, -22
>   cpu cpu0: OPP table can't be empty
> 
> so the board runs without CPU frequency scaling.
> 
> Add the compatible to both lists.
> 
> Tested on a KickPi K5C (A133) with its root compatible changed to
> "allwinner,sun50i-a133" only: on v7.4-rc1 cpufreq fails as above, with
> this change the sun50i driver probes and the A100 speed1 OPPs are used.
> v6.18 fails the same way, also with "kickpi,k5c" listed first.
> 
> Claude Code (Anthropic) drafted this change and its message from my test
> logs; I reviewed and tested it.
> 
> Fixes: 60b064eb82e6 ("arm64: dts: allwinner: A133: add basic support for Teclast P80 tablet")
> Signed-off-by: Rajan Yadav <rajanyadav0307@gmail.com>
> ---
> This fixes the Teclast P80 support added in v7.4-rc1, so I think it can
> go in as a fix for 7.4. I do not have a Teclast P80; I reproduced the
> failure on a KickPi K5C as described above. A series with A133 speed
> grade support, which Andre asked for, follows separately.
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c   | 1 +
>  drivers/cpufreq/sun50i-cpufreq-nvmem.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index bce4c87573a..6bdeba47749 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -110,6 +110,7 @@ static const struct of_device_id blocklist[] __initconst = {
>  	{ .compatible = "airoha,en7581", },
>  
>  	{ .compatible = "allwinner,sun50i-a100" },
> +	{ .compatible = "allwinner,sun50i-a133", },
>  	{ .compatible = "allwinner,sun50i-h6", },
>  	{ .compatible = "allwinner,sun50i-h616", },
>  	{ .compatible = "allwinner,sun50i-h618", },
> diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> index 9261d148a16..5d4ff192e99 100644
> --- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> @@ -324,6 +324,7 @@ static struct platform_driver sun50i_cpufreq_driver = {
>  static const struct of_device_id sun50i_cpufreq_match_list[] = {
>  	{ .compatible = "allwinner,sun50i-h6" },
>  	{ .compatible = "allwinner,sun50i-a100" },
> +	{ .compatible = "allwinner,sun50i-a133" },
>  	{ .compatible = "allwinner,sun50i-h616" },
>  	{ .compatible = "allwinner,sun50i-h618" },
>  	{ .compatible = "allwinner,sun50i-h700" },
> 

Applied. Thanks.

-- 
viresh
