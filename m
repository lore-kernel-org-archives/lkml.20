Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794740593;
	b=AUiuDwEpMURzrqGxW1XiMBRecbutnjClUKFXCUqemhhuzoKA0X1jCNywylX0iGbxWEkq
	 qVdiAWNPFivwbcbywiWjpWLd4v3WwfPV8pfJC8XsXH229t02LF5XkmVBK3YuMSTLODMHe
	 FvG03YfO2ADbgqOxww9u4RtDOt+YNa59mnJL1YGL3Gq3hZVwCUnhkhJPDCEvSXErXYVnp
	 lbFerWm2Lp8z1NrBl36JRIDBLGzkCP3STDvqLUbL5xBmWOfcScBRbNWOoQD6uCA8vniJ2
	 RAGOcGssbwrInZwb5KJzX671EsjswM2+O7Berw4qna368GUpHJypGHsrZKTSt1zVeiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794740593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=w1ACO595+ELz+z8hohqisqtB7dSuEVIa1QoS/POdlBI=;
	b=oRqFksijQP8JrmoDJDf2P9RJFJiKjo+lDODQbJoVawj1RNvH8Z2lAcRCv0gtqrLNbo58
	 pc0L+WU44U/B8ciDPcYMJGwAA1lg0LtKDnweM0/VSazlSoASiXvzRozf2E2KTUrGfCLvX
	 u5rwRmzOi1joX5HOs25DEJxZoeqLZ20i66aRp59AAjWMCGwFFQh1Tj7NeCa1gY6KMDDOr
	 FsXG4b+DLmtddCogBe86vzcy81mSw0mMTNf8gy2MASAA44E68EZnmw8jx04E3qKwYrCaP
	 2Q1/Bzuq6mk6dO4A5WEH7XvrAe8STBcz9mbQ0IFPbZtbOPvI4nkZP+m0kKnlMe07l7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WR02KrBz;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E620606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 11:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E620606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WR02KrBz
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so2290255f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 03:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794740591; x=1795345391; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w1ACO595+ELz+z8hohqisqtB7dSuEVIa1QoS/POdlBI=;
        b=WR02KrBzOV/h19PNnmRdTn+XT8cRK5mKsqg9OanSndZSfGTqZFubzv30P77zOMp2qQ
         kQtzYOO+dTHK2YOlLOQ6pS7ZbUlphK3ZryIgbFID4LZ7zxzUZF19PbTUSY5ISwL2u9zL
         F47L+ASapoErsRmS3Dcyby4L6EPVCbmU96Cuxn+jydfTMAJSterK1bG8nxtf1IZ1U00L
         kJCC5GY8cJAhMoOZr26+HN0j3KDa1dSq2fswp9GEA+LetvBHW5RlKGX97gCPSyWOMMdV
         a8I0lQjzX+naCxu7XF+36CNIpCYOEBJmS7EcvCInQSQuLnUcBsBnep2PKV4WC7pOzzJB
         7+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794740591; x=1795345391;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1ACO595+ELz+z8hohqisqtB7dSuEVIa1QoS/POdlBI=;
        b=pLjIYGYZwObTRlJukZmm50GGGlIX6LBXrMJIe9LBUy/AMJ7U3pNrX2M6IKKKg0GdAv
         Bv3xtBpCkz53XHyO0TMN7/cBFdlUEhhdMnJ9k2pPiU8Wqv9b77Aq31mRDk5bdPKJgn6O
         pNK25qYjKKtzJS/MLaM1Ay7I68DgCy/Yi2kUIXt78+llurpHAxoRy5NK3cDp5+skOa6z
         v82F0AY1SSc2cszPmX+GHrDf+wLWD6BW+HBlzwTfWtv+NcDZLITMzAW61gZnfexUO9F6
         ire4UDzsdQoK321uS+O3pQK68qr+BXfX8Tnki2xOUAOQzZTanjSLy2g3bk6YeXZ4HCRg
         Y2fQ==
X-Forwarded-Encrypted: i=1; AL+hErHV2p779x9B77hbi3p44kGUm1uurnWnwJK3/gtJrBkNQtg7//cCQAQxs1dzEcZZZdLf2m2es0/Iia/eEKw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/D/tf1FcetIumqECWFcJKeOCXY0tXpCp7iTvWW5r0z3r89Za+0
	qksFT/ONhVzvdfCyYm4UU/4eByYwdhbMsOtMHYeGeEijLf24bfDIJNMH/Clv/S9G7r8=
X-Gm-Gg: AYBFou3erBM8sSCbLWufcaF1g5H50iz7ReuUm1e/ViExQwI07AbMdT1ZU5ynKNtlCM2
	JtIE7/+zX24AxJDdY0fU4L1g2odbeDUtZB6ku5fuW215wheju2kSYETBz90tSnX0LBs1/qM8sFh
	tgf1J90Iha7uCBhbBKtsCWZiJkmN7kr4mnkCYLIlQFPnZDa97CXlf0raIY5FhRDEsJXlrDvnCax
	si7sqIll59qa5RfruL0JI7Dv015ul7x2Hn+zfUr9oRQLHW/TkWwqPxV8n8ffegc68ofy+nSUTDA
	YAQFMBWRXCk7250lW3VAe8SenmkmGuu0ilISjw16/3S6aL8SYTihvmaa9UpUUY46PULb6nk3rK9
	N2LLIgbUXM5kSeqvFCtVEI17H7p3XWBxyOhL43xQ6D/XzF42/Fs8MLlDn4pzP0o0siowIlr3ivW
	qBMtTgvmz3FexI3C9zbaoC5uAtfe1nNcVetZ+7ia9Eo8Qynwra2D+c6qPb52DJp3TTX8afk+QMS
	q5LxgLTi7LdsnUev+QiiLsltGIwqvNZ9y/Cp8fdqtYL7kzjMFVRCYSPfNRIqcxkjNp1XoDPT8rx
	J14iyKgIpajivE45MvkNt00XiGYhuXij7/Jvmzg+J3TdEjhF
X-Received: by 2002:a5d:584b:0:b0:491:620b:b60f with SMTP id ffacd0b85a97d-49c72ba5d70mr15726879f8f.48.1794740590749;
        Sun, 15 Nov 2026 03:03:10 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm15132051f8f.21.2026.11.15.03.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 03:03:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v1 2/2] clk: tegra114: Add CSI pad clock gates
From: Jerome Brunet <jbrunet@baylibre.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
 linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261113145708.261530-3-clamor95@gmail.com>
References: <20261113145708.261530-1-clamor95@gmail.com>
 <20261113145708.261530-3-clamor95@gmail.com>
Date: Sun, 15 Nov 2026 12:03:00 +0100
Message-Id: <179474058020.3790083.7531788945003507652.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1564; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=lFRDSGY15F4GXWb4HrNUlotV6eaXTV/VaJfiOjVavqU=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFk/J6Zn6+1MEdwhlvNA2UgluMX+9NH9LEf+6Nw4c2C+o
 Uu5D1NeRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACbyj43hf1nIoowvEUd8Dial
 tufF/IuOz3njJib8ZHVTt0aEuLX2IYb/niZ3mq8ufHv5qLraOp/9yxYcfvzMOdXxpP7CDJYT+XH
 L+QE=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Tegra114 has CSI pad bits in both PLLD and PLLD2 clocks that are required
> for the correct work of the CSI block. Add CSI pad A and pad B clock gates
> with PLLD/PLLD2 parents, respectively.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/clk/tegra/clk-tegra114.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
> index ec537efac692..08e425365469 100644
> --- a/drivers/clk/tegra/clk-tegra114.c
> +++ b/drivers/clk/tegra/clk-tegra114.c
> @@ -1041,6 +1041,16 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
>  					     0, 82, periph_clk_enb_refcnt);
>  	clks[TEGRA114_CLK_DSIB] = clk;
>  
> +	/* csia_pad */
> +	clk = clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_RATE_PARENT,
> +				clk_base + PLLD_BASE, 26, 0, &pll_d_lock);
> +	clks[TEGRA114_CLK_CSIA_PAD] = clk;
> +
> +	/* csib_pad */
> +	clk = clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET_RATE_PARENT,
> +				clk_base + PLLD2_BASE, 26, 0, &pll_d2_lock);
> +	clks[TEGRA114_CLK_CSIB_PAD] = clk;
> +

Change seems ok in itself, just a couple of things I'd like to check with you.

Seems both the CSI and DSI can use the PLL D and D2. Can they be used concurrently ?
If yes, are you sure you want to add CLK_SET_RATE_PARENT which the
DSI counter part does not have ?

Also the DSI get the PLL through a fixed factor 'out0' but not the CSI ? is it something
you have checked ? it just seems a little odd.

-- 
Jerome

