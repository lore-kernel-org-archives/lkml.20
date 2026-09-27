Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B512392C3C
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 15:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521952; cv=none; b=rkY11ThI8mGSULaULS1FT/gF8lJhuZrdWhX2eGifiwP2CWASzxk1wn6evvgAHSOsLJ0fpvH8qVj4dW/ytC82CUWgK1lDJX3Qivqlh6yjb551T5qVR8CjxZ9rh9ikw04ynhS8jT88lGG/i16o54W6jOi15tTak5KzYFy4auNlHD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521952; c=relaxed/simple;
	bh=iGxLkAPjn7iwM0RTaaX+V0ufn+VTyGjgMAZb+r2eUQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KZnvOFRczRl1S3l5QgD18p3VpHhy2Hlo67/QcFI53zoRJo6fIxXAvMynA3nIixWzvjXUg1DlWJV0Uj9VemWhBDUhicN+D5RTWgnlk+X1VA8RKfyOkIgTJ/7wPd3AvrCkEAqLQHJykvq3bPQG8Si/J2miLP+K74sVtCppbFpdSaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWMi1aeo; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWMi1aeo"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48884b021dbso643179f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521949; x=1791126749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SnMP+yO9gTVCT1ht/mZTNiN+id9GPVSfGNROClqfyxw=;
        b=HWMi1aeopCUn6Aq2UZDyb2x1F+VqwuTTzaUTcRuU7ieu0kke368/EzFoKFjO0/hMET
         2WtdgHBB40342MS/F/mwf/bsFPEFQ8pb42Tunq5NFzshrwE+2y2S3niOG+8nJsWcp88s
         lz/jP8alWoSs4slRXbA6ZJAkkodkd330OCfiH6yeb1cjwuZUMqrOKsZbJv/fvZv8+W1W
         1JBVMj08efM6oTNw/LXjH4FOWoR6ujuSrQU+/Pwa8DM29h5agpJSVUTATSkGE7Vc1Cpx
         gnB/QJ3/UGKeJg2Ye68Ssz5O2Y7htit7KdrHZxTkhXWk0/O2yEYGi9kFXLnL5z+Opuvd
         ZFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521949; x=1791126749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SnMP+yO9gTVCT1ht/mZTNiN+id9GPVSfGNROClqfyxw=;
        b=Fi4cgj/ZKxLp4O3kEs89dj1yBn3REvUblUuav9yJouMmlJ/qUeo3oLrFxM75clNVPy
         HoO2gGhTrP1MRjqrBAS+LeRmTHnKAUNkxYdc7ZXc4Dwvy2BHAVlNy8NSLAAwayxCJU+G
         3URYKqlF4BigJAxUbPWKKUqMD6sieomjx4crXymLQuSuqSYyo0A01rN5hv7hRvDFVvuA
         89066mdB0mX5Lwv44U88jXN3RNqvopREqycxRI/mloiL5LzNJIzi0zoZ5K/wMj83iQBC
         eFazdWmRMhspMTPn2pfm9kxQzbO0I+E4MOlUVhJFbfPHzSigG2F0dxEiLU5RuLJCQi99
         XJYg==
X-Forwarded-Encrypted: i=1; AKwUvBye7tEjLCbID0fZWWRZhM8SoZoJ8u/piXxYsqnyLrKL6xi524DplweYvtpUarYrUiojdAs81ime/mmqYY8=@vger.kernel.org
X-Gm-Message-State: AFuF++ktctKAHg2T1C6+B20Fi23OBYxywEqngDjVjLCAzHJDunjNozg/
	2S7xrFRIabHuLVYxoZXPjCDVHM64O4TLa3qBCk9J4eOxFBoScEHDhoxx
X-Gm-Gg: AYBFou19JP3wPNpVtYNhJkrwGbZ11LKdgvkbMY79C06stcADCHp/vsYE6v1/iFd/DXK
	NjL77EVb0Exl1UWb1uoN90AdDJTWFNhPtdRXVzj4PvJRBgrSGfWxLBGWZblJtXQwhuWm9CTQ8CS
	hemBhuV8Ngeev19nIQJqAtUM1kZxWolaS3n6MaVJmrScSmQm+FrTn5omsOUtVIQhM/evAfBGWUR
	hMgSadx9UnDwv4zlkqDXnLGQ6OZ9wQxF38YOIFlw7lD6pfPoheMxcvX+x0yBNr4XaotPPMlE4Qt
	Yktyp1K4zTL4Qs8OCibFt8qT/foIt0QdODh6Y0okUh6QmHcjulE8fXCWrFKS40GMuDSgj32miEJ
	7FGXU+P6lpAvzDiWTgGEgko7sPN7bXZdf01EVvrXTdAyT6Qxh3RXT1yTIWeozHxfjXPDDodvFbK
	V36KfCsT6dWoT40mo7BKkRyXCi1twxDxEPEyhbCcApGyLI5D9LaYuhaECw3kTCbAJ4tpyMcU0Pb
	ZXllKcHReT1pj0eRU22PNlNORUyTbqaMMzp/m67xLA=
X-Received: by 2002:a05:600c:4694:b0:4a0:54a:bd36 with SMTP id 5b1f17b1804b1-4a0054abee2mr1501255e9.35.1790521948886;
        Sun, 27 Sep 2026 08:12:28 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:12:28 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 06/11] rtc: sun6i: add Allwinner B288 compatible
Date: Sun, 27 Sep 2026 16:10:11 +0100
Message-ID: <20260927151016.186493-7-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927151016.186493-1-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver only uses one alarm interrupt, so no functional change.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/rtc/rtc-sun6i.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index 7fc60880e409..cd6ac5bb20cd 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -859,6 +859,7 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
 static const struct of_device_id sun6i_rtc_dt_ids[] = {
 	{ .compatible = "allwinner,sun6i-a31-rtc" },
 	{ .compatible = "allwinner,sun8i-a23-rtc" },
+	{ .compatible = "allwinner,sun8i-b288-rtc" },
 	{ .compatible = "allwinner,sun8i-h3-rtc" },
 	{ .compatible = "allwinner,sun8i-r40-rtc" },
 	{ .compatible = "allwinner,sun8i-v3-rtc" },
-- 
2.53.0

