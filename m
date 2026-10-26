Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793012344;
	b=xy02FFuBZFTiRRbeiLatAvWRCNT9I2ur3iaDj85A8i2TDCML7jhZJH5afwyThee1UClP
	 j3yEdaajv0GRJiC7PycRd0/ClOzaPD6wKbJFEwYLpj/w8YeQLRNmwHplj3QCZPsuSBdv7
	 G/icSjn0ku0h6M1QOhwmS6p9a5SC4VKHN5ByZXrTH7SNuS8V17uQ1dqmDuc2TOKqcm2/2
	 O0jJrHUs66+6Guz0/WEybAi7ak64Q6RiMfqfN6VdGs/hNQOzFs6RDrFsgyEbsxpsf3xeR
	 wls1BzVQzyBIodkVQgAH4hB1yAymS31CGvclWdKuMty4TboKOhNdoxku3eVNSDKC6mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Xl+Yg/UNKEqVV/uF8sRZx4ShFAFRNq2WVWeIxaupX3g=;
	b=sOznmSla9V75evk8WuO74+T2UjM1rxovfFSRYRmxRe+tFzoT8e4XBmQ629twm2qMqziv
	 w4rZvnUWNRMV5puvwOg1qqWQaHnc38p5d2kCXclg64ykeQviXr4nQ5zX7SDF/yFNt08TP
	 qXXfIouZSOQzpfe4pG+GMtqSVJjCo9vnZXig+kiVT/10cYDD0sIRn6mfjnVZEFE0EwtVN
	 2Yk4Y8QUEokHKHz4dUp1YTI/HTIbsRKzXnY2Wtrs76c/MBC0cdGJw8/zaWmaWv3u+QE+M
	 K91abjCNnHdLnLxFaN7MlDfZ+Y2rr7IbiY+FZQ0kC5XVpfM87VyvYPPfjIb/ZZQPUAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iv8UIpwU;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBC9606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CBC9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iv8UIpwU
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so1937261a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793012343; x=1793617143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xl+Yg/UNKEqVV/uF8sRZx4ShFAFRNq2WVWeIxaupX3g=;
        b=iv8UIpwUi9eXzRMigy0++OyradCQuvf2ODH3+WNz/MkR/z8PrJVR6C876X3GLcM4GG
         CuKWi5FaS2ckUWNyDdNM1gKbw7tdzqnuupsQSULIAwMcdn5ukzFtGgO37qrGNfUBiXS1
         zo8IovRU8eM7NJQK0ie+OE9fqGf5hwwGeSuK2VvneDSgRVBfwIrzPWFMm5QUlmljd+rY
         shGTEimeMltqLNK7qa6VdheRSXo+io9cCd01QTI3iq9q4bLLK5NLzZtfJzHUcz2YsJSk
         iyO0BNRq/F2h/wOfTRrkaWguohn4T4vNhO5eYDY6T1IkC/rCmzAVFRNsbJlXBIhqLjsY
         Kx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793012343; x=1793617143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xl+Yg/UNKEqVV/uF8sRZx4ShFAFRNq2WVWeIxaupX3g=;
        b=cJ3WL7mRY6Rpyk8Dgbca8zXhiuOhyQUi8LSoZwTUveKqrDlzXlJ4EU9dubGvO2c+Sz
         H4YV6YL84JYhZQ6bZNSH1xV5sLcAgz2JSDVHSN6GyQWs9qaLoY8/+xDrYG1OUOlJuB9X
         orgSC7fLkFSNINonwkvDbjo+EymjHCjM7BDOHEMMM08xQpLJiza5TW8OgRR8lZ//j3Kh
         B3ji1Xscg0jVgkqEMWEGemFzDpsAePDRZofgqoCljiA6hUVlQ989+WM7MmP1is806wL4
         PGX0qGC6/9xZLA27JQjWs1WQdP9AbkVywA+Ms2JiJNN8Jrp6DBhBCwky0rQZZlmy5WoH
         ceUw==
X-Forwarded-Encrypted: i=1; AKwUvBxyHjrNTF3aWeY7/3yt7Bj1RKtDOhELSlprugWY+8oA3yKvaxyL8nKouD+CaPIX63lzbi0GrFSvDLfFCAY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPPGMF4nXAsvUFbZE0uqmx0rpdvRi2ZWDQe2YZkAKl0TF+1IN1
	AQem/xUy16E2VQed0lsoFslZc+OejaUk3BUuW0s2OOpyZ0hX3SE16U1s
X-Gm-Gg: AYBFou19kHRu/u5XQM/uta5dyXO/SSgjXstY61iU5WYw1HUMaZma6SO7Dnaikwjk0Xm
	txKqt8yGZWM3v7AoQRh+4AvN378wZGVO8Au0Mt7s+zn31tjdp2eNi6m4sYNLRw1EyTFxLOK70LH
	gxPT8QCsoeKP68/7K4yg9LEvKsuR6HB85S2e4dzvOOKB5/9js1KTOExIsVw20Ndk7O3SMuc9I/+
	VpfizeyR7TKrhEHrEMZG3y4dzEkpX5oAHZCHf6+K0Xd+kJ9/i2mky4Rg4KiliGICSVIqpJ/MREC
	C+n7iExQQ9j8ERDfHYp5A1RBESp44XUw7d7QTOrWrWXW/TirYeWiGYFRtmjB9tvo7W0+Q/pwz2z
	G604uzu5jRvHg9xZRGbfWpjPub/hCFNnmFuLsT0d6GghpxNB12Jd/QM18DWcbuyJsIH3DYGnJwo
	fBYScZoZ/NJGcRqBj+CkRRw9uDVoyYdzbeBURjK5T+ypJacr6vpx6hknmntCMh94+AfaOOVfd2a
	cvIThfeqjYGOSUS0F7kyKBDsT1qvzo+UufK+9wWT6NsLgwXxldbCOUVVFN8QM+gqra6Pt9P8YQH
	n/Fl0X4dr3d0TO3ig/y5GosZXAQM5Z+XaPf7hkrfJ9u5n0s4RczUgcjNXWbPMjKxaKjG5TU=
X-Received: by 2002:a17:90b:3842:b0:3ac:8527:3fcd with SMTP id 98e67ed59e1d1-3adeae8b8f4mr5611507a91.39.1793012343483;
        Mon, 26 Oct 2026 03:59:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa82sm7980768a91.8.2026.10.26.03.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:59:03 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	Russell King <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/5] ASoC: kirkwood: kirkwood-i2s: Check return value of clk_prepare_enable()
Date: Mon, 26 Oct 2026 17:58:33 +0700
Message-ID: <20261026105835.19052-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026105835.19052-1-phucduc.bui@gmail.com>
References: <20261026105835.19052-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

kirkwood_i2s_dev_probe() ignores the return value of
clk_prepare_enable() when enabling the external clock.

If enabling the clock fails, the driver still selects the external
clock DAI configuration and may later call clk_disable_unprepare()
on a clock that was never successfully enabled, triggering an
unbalanced disable warning.

Check the return value and fail probe if enabling the clock fails.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/kirkwood/kirkwood-i2s.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/kirkwood/kirkwood-i2s.c b/sound/soc/kirkwood/kirkwood-i2s.c
index 29641bd4cc60..395790682355 100644
--- a/sound/soc/kirkwood/kirkwood-i2s.c
+++ b/sound/soc/kirkwood/kirkwood-i2s.c
@@ -701,7 +701,9 @@ static int kirkwood_i2s_dev_probe(struct platform_device *pdev)
 			priv->extclk = ERR_PTR(-EINVAL);
 		} else {
 			dev_info(&pdev->dev, "found external clock\n");
-			clk_prepare_enable(priv->extclk);
+			err = clk_prepare_enable(priv->extclk);
+			if (err < 0)
+				return err;
 			soc_dai = kirkwood_i2s_dai_extclk;
 		}
 	}
-- 
2.43.0

