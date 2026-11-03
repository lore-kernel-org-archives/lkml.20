Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712366;
	b=OdApvjBqlyhnq9e5HcmTKdXqCoPC897f+PR7EbUnLI5q5e7jWD62rNUrCFGAJtX9FRGt
	 Nh/Q8M3Z+AH0uqF7eTfiodAGgf4QVu2MqYFgS1WgXxJ98v4W4r/5rvPVXNtmN6bpjeBzv
	 jxeRqtcs/cdDliEwmnYjoANbYJute1MWodPL3xb56TWUFMuNwE1QXcDoariDzhBv3qW4L
	 RL/ATVCAIubOKE4WJuxg7aAf48YJOYSXK6O3P1eSmCg9TgxKGDa0cGDiuhBta3TGZWJdi
	 uJIMhtUCVAA3mniGWkmEKtCB6HK8YuCTtNt4MSAT4OGM7O0gJaas+BfFOpUDLcR7nVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=m14hYTJ7sImfdrXTR6Vi6PKPRVQE6sf9x/T+B5eWk1U=;
	b=FNFcCqKrVQNwSOTNSoYXTjHHEJTzzna3xz72k59CFHdoMZQuFpYwW1cto50IJxdcKUQV
	 8W0HzT4fkYzPkxnLN1VEifgFAEu25Z1YCoptUmSZBMTyKJoe5nHcfm0bJw0oHFyuerB8+
	 UKA2vGG3lkcY+0koEH7kyG1/7mOSH14QXSK2M99ydjCfjTDGvJM4xBD6jXO5BJOpZTx8A
	 O4+hdTFAkWGtBAWoRKqQjWFD6d9dS+dGbjabr/1BWsyZtEbRt+X4b2ojI0kDMRuCdzC2/
	 NsYHB18x4CsdCkXsSBqytTl9cl1pYnGKFDpN3wmYyO/0IzoRraWhK1+vaAzqMYB6mfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aj+3v9d0;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1778606D80D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1778606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aj+3v9d0
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so33405045e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712364; x=1794317164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m14hYTJ7sImfdrXTR6Vi6PKPRVQE6sf9x/T+B5eWk1U=;
        b=Aj+3v9d0Hq7t7Ledk6BYDcJDaLvC3dM0100jRx0QmC9n90jczMR7vZSML4vJ98Ih3t
         tVbhx+eMCw8i9ZU8wCit3kJCt5c4TxKApPh9Ngtmd8n5hTmANwU2eZJjj8zFITDGVIBL
         DnFGUvO77uA7tWlwRdzWDwfSer03uOPU6JKL/OhaoX3+uKMDUAsU6erYRyj+ZWvhRjPj
         HqeLLtwfJCrzE2M+Hx+6bl9WiulNp2zMCvino2D31qZZ15IfD41Fe+wTBTXzzo3yLksm
         dHCyziv4ys6FVDlir0E3BDCuuONtzuU6pRrkUAllyZqBm4zjd51VEgD15zA9+YasRuTo
         VLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712364; x=1794317164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m14hYTJ7sImfdrXTR6Vi6PKPRVQE6sf9x/T+B5eWk1U=;
        b=fyqTatgB3oZ7b+W6kJizwSmvSVN9ES6px86o7//ZLMJ24u7pxdcnR/vO0BYnK0q/BX
         2JwUOOHled76kKIb6M8HunrVf90N0u7tI64LbAXES1EwE5udB3JnSpqmVe75fkn15hXK
         lONHYq4Thf5ZzDUdJcaz3ALcgfyZVrCLMBz1IhmBUa9NmUiYeCFu9cnMIzwxHG6FuDAi
         tj7VBNpNhqhl5rcsMqTRtmOC6/EzmnJnquE9RPRhcrQneNIkmRvIvDcqrPpRlHUmxoGe
         XTxS2CngdEs1vSV1cVT+OPwQe5q4c1rLoPaCfzaE/Zwk6wZWzbLYSR6Q59OgVXz7ZPId
         waCA==
X-Forwarded-Encrypted: i=1; AKwUvBxnAL8GZ65Un5iNP1TLHHqGmEivrNkgtGhoTJ0V1upoJ81D2sktwLf3ARV7JPTXca8lsjWAKVVkSu+H1YU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZO8ztuIBlGi6IyzepvDWsRv+w0tedJRSghbFV8lwc1pEGzSZK
	ILsykC2xJgJDz0jz39M4WMiFZYxHgNEtj3L1aRvqwZRZYRHQjpl5D5wN
X-Gm-Gg: AYBFou2P91A65gHmT7bUqNW9qTBi3Vtc/bDl2eGtnPiiMAFqlBx9aNvgQEfLBv5Osi9
	579CjZaqrJ7q5fJLLB2jxIycs0/y/C+icK+mHJOZBNKV4ReZqEfDwdqbkj/9vTGCbz4Jpt5TtAO
	vRHV1mNWcoTfjl1tbsgBTyY5CZcGTgjRkS4LulCoC2jndhHn45SXq96rJznH9ddTQSj4Vn2waj+
	VeolQ/h27REFJgb8EqhA18xpQoLcdf8MbRfE62bQkYq4BACj46tJ9Z0JhYRx+6hJcibeXxJJpwX
	FMSX47fFRHuBDm9XOdf3VnfTA+WRw32OAQcVqeM9c0iTiSJqgqBLfruzrkT8MIXwpH5CLv8h9m6
	RxeixuvkGxToXTLnjg7owPvuIKeyuEysxNvH90OikJE3xEG6VT58tbPdZqz+qn3r0NBzgZh1Zlr
	Ni9TfEg8iLZFZlZ2Kv6fn0ZoJNJPea1SohyRsEW+f+GTxMEaHI492Hu3lmOBulZKv1K8GByMtVb
	oW/jF+xFchPZHpP4N2BJqGq9GMXXc3+quwdbVvAsjYzJLi2rU0IAA4kbdXDPfxM76ouohykcTBh
	1XznZjd2QGR/3c3lMLhscOnD/JoBNaVwn6GS3Hdww0kXkKe2RbOtWQ0rjR8feKzFnER5KhQPkDC
	t5A==
X-Received: by 2002:a05:600c:b8a:b0:4ab:c447:49df with SMTP id 5b1f17b1804b1-4ac182dca8emr289609215e9.23.1793712364145;
        Tue, 03 Nov 2026 05:26:04 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebc1sm84725725e9.1.2026.11.03.05.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:26:03 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH 3/5] ASoC: rockchip_pdm: select REGMAP_MMIO
Date: Tue,  3 Nov 2026 14:25:35 +0100
Message-ID: <20261103132537.3717496-4-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
References: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rockchip_pdm calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  rockchip_pdm.c:(.text+0xef4): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_SOC_ROCKCHIP_PDM unselectable.

Reproduced on v7.3, x86_64, with CONFIG_SND_SOC_ROCKCHIP_PDM=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: fc05a5b22253 ("ASoC: rockchip: add support for pdm controller")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/rockchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/rockchip/Kconfig b/sound/soc/rockchip/Kconfig
index 0f8ef6868356..e0ded1fa4da5 100644
--- a/sound/soc/rockchip/Kconfig
+++ b/sound/soc/rockchip/Kconfig
@@ -25,6 +25,7 @@ config SND_SOC_ROCKCHIP_I2S_TDM
 
 config SND_SOC_ROCKCHIP_PDM
 	tristate "Rockchip PDM Controller Driver"
+	select REGMAP_MMIO
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	select RATIONAL
 	help
-- 
2.43.0

