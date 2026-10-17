Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0634D4848A9
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 14:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792248839; cv=none; b=YusnAwIdBL4U13+SYuRqvBuHfRxG7EgqpDTOfDCtg1y444FjBsdHDv4le0gt85QpEaK6i8+Eny4kOCjijewNlM63g1dOYGz/qfcOcji0jzrqPfy+3OebjlCNWMTpEQTQA2kKcWrk9RGeU60rEjUvoj7fi5cK256fR+nzdFbaJIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792248839; c=relaxed/simple;
	bh=QGkkL2Br9nOFTntWsohnZUbwzb7F2vn9vpbJDAOpngU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=oMTQbCaNtwNIMQNA+3Nc8mAYPcgu20t5k/QvWt4k2HiFi9Jw3VjELvDm9+UEypEuXaiZpvAQSZloP6vRiX+x51/kub1rh44VDmGRcWK+CZy1U/YFPMtxpH4U8OaVMeDZgdx7XOCjuO0UZcZvTJ29SPNGJUjheTyJNVn6IzAjHuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=RE6EIXmO; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="RE6EIXmO"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48de6a62a4cso578585f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792248836; x=1792853636; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hiKDA+pCxvcmNuKm7oMIMiLNyrcd5EU9PaDKDAFb1ZA=;
        b=RE6EIXmOplmwvceNWrWHy5LBMLEv0OAC8H4ZiPbddBV3OtUMzfB1iPCIltukGXxhvd
         mMhNPBOScidmTegqDSPOhYkEz5dIKwIjB42kyW533Ife41doiTLlPEkGWcJeJfv+8G5m
         mF4gPfEg7o8UthOG6AdXWhIZ7Y7R4T9Z2vPlpFHSzZV7nQLOssLzyRb/uKTPtYEuDGIb
         NgKNvLeTuBg7sTdBvygXD0jO3blOSFnCRraATyDyxlZ2u5UfzwENCNAwc+H1zndPLFD1
         zN355hvvRAwwk88iWWgQNfBdsgasZG4Fw9qQAuKhcfXrnxBlFZiaG37jjlHp3Mk8btVg
         8d+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792248836; x=1792853636;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hiKDA+pCxvcmNuKm7oMIMiLNyrcd5EU9PaDKDAFb1ZA=;
        b=sYFG+Acz5am0n8HwT/AEp0TJoazZKeN98KXXjM1YkB0K2XCeu2f5ZY3SVF+k+Mwajk
         S/ijt2D+FJQG9Hnw2Z1wzN/SoviIS0ydWmI0JVGrNYxxpcEK3vcn5IAuHMjDorF2+HQf
         WXkeIEp3n6r5vScXlRyhyhXYirZ6DhRgYjUjew3Kpso6yIEXZTPvMTVmqKxIKcoEfwhd
         1Z/SqJP8SmOpGoO1yaZetMl1dfoUNLG7jTQbVi3ovB6GNao9YseRqA/Fd2Xe0OfV+jLU
         gpsCDTxberIvHARGaQzz+3fijNtdaztiYGMJHKeJHvsV+u5QR0HhBGlPOtUDexN9ds3t
         Mnsg==
X-Forwarded-Encrypted: i=1; AKwUvBxyZ91BWc8boXOzoy0bdgIZs5e97M8dXRMuKu0HKQHC9vVP7rK5lDb/nEjt/dGToVoKV59eE1IgPx8qdJs=@vger.kernel.org
X-Gm-Message-State: AFq9FYImcGCPK2EocRZ+8ftw/dt2g5whQqMK1NS+YBJGdvesMwDy3MlQ
	g7+RoekjgfXRqhhrFehPWqCLNvIDoU7WlUpbXx05zvdB5+uKgT8n9nN1c8H4LOCwt8g=
X-Gm-Gg: AYBFou3qlthpbkjSgRfvvdBnghxog5wuTZYNgyAfqS7zSgKC7mgi505FUL6Gs5TIZED
	pNiacjQceBGQ8CJXEcL5gpgV6mVfWZCrapVtuYZi4ZzaX3/xnfKAZI9QwJED6tueevHE7AMbtrm
	OTdbfyVTyf/uevbSXHJjFnUvY0CydoeaQ5myKhLjlZbf4sIqliYy67FU/2zDXH0MdePJYuiq+OV
	FgzHkJrNqqLHoe7PVGsZNRwVMMpbljFSplC6Yilhag5JGJ0secueyx36QraGSiUrauRryDP81ah
	aReTa7++RLlWC7n9uEkVrdpSgv505vFZM8BV9MKtMiRMWTVESw1IqO9y7+MPzSqA/xEdJ4Vf3Eq
	l18dzuf1KCCMPCklJdVrCVoC7Owr+vx4VAMKw7uJxipwpjqspMyUxeO5skyBCFMUq201+gmUPna
	mHnZElijSyM/Z4+BV1KSzrEcHr0dY/1JKUMszkGehH6DfPNodtDwq8F2GaAalM5BLbKZcuNqCX1
	WLpKPUgNhY0h0XYwA==
X-Received: by 2002:a5d:69c3:0:b0:48d:f831:2681 with SMTP id ffacd0b85a97d-48e07f9c04emr3912331f8f.38.1792248836373;
        Sat, 17 Oct 2026 07:53:56 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5035bbsm11683485f8f.44.2026.10.17.07.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:53:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v10 06/10] clk: Create
 devm_clk_hw_register_fixed_rate_parent_hw()
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org
In-Reply-To: <20261015-perso-ma35d1-upstream-clk-v10-6-47c97b54a809@bootlin.com>
References: <20261015-perso-ma35d1-upstream-clk-v10-0-47c97b54a809@bootlin.com>
 <20261015-perso-ma35d1-upstream-clk-v10-6-47c97b54a809@bootlin.com>
Date: Sat, 17 Oct 2026 16:53:42 +0200
Message-Id: <179224882241.859276.3068400770588177354.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=543; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=QGkkL2Br9nOFTntWsohnZUbwzb7F2vn9vpbJDAOpngU=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFmXexj3VFp7rN9ucmVlQYXo+uJV97vPuik3FKzN0dvAc
 yEnL0i5o5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABOR1WBkODlR7IHFf528iI1X
 /i/aHic+02uHx8LYcm8Lg3WbjXaKuDP89z+wrdmo2azRkSO5eCNfZH+wZRH7Vc+bs3Z7m0kEvd7
 HAAA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On Thu, 15 Oct 2026 18:01:19 +0200, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> clk-provider.h exposes many different helpers to help registering
> clocks. Most of them expose both a 'basic' variant and their 'devm_'
> extension (with just the last parameter of the inner function call
> becoming true instead of false). Do the same with:
> 
>      clk_hw_register_fixed_rate_parent_hw() by creating
> devm_clk_hw_register_fixed_rate_parent_hw().
> 
> [...]

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

