Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF9B285058
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 03:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791690920; cv=none; b=NhigURKz1Qli6wI9wQVyueNnxv13TpwimYD4+fP9nuHaEYaCIy+jZt06ZRpRH+i8jZgn5bU0Brt0+E+tY29ymuE6bgSPOX2laH/xna06a1flvy0qLGKyTH6POUGMRGwzJYps4TU9ZVFESFR7Qgo6L9l3A8ORWECw+nq3VzBKykc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791690920; c=relaxed/simple;
	bh=UkSSvCPn665T7qjvHXcBhTS128UxN+1EA30arBtBacU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oyt2kklMBIIj9u9StP6DFAS1/wje7urwB+LjtPUWvOZ0n8IB2c3NB28YUE2WJT01+kWR/TMgJ+alChl9u1OpI99NdQq4cZM6HH8BfD5Fi+ID1GJmGpCQB/325df1SpLpPNTUl79pbQudBYM5WBkbp+llpxxIN9/afOIxE5m9290=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wc19gO+k; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wc19gO+k"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4956869750eso7260105e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 20:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791690918; x=1792295718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vaUdEu4koPIKyGQFeZFD5bATRmYQBh/annrTgOkgSHA=;
        b=Wc19gO+k8aTVOUTlF1XS5s4b8hQCgetJ80uxaco1nxt89XhBgYf7hVAXsOk9rfyylM
         vbnO/HTR/ch9YIor7Uao7SVFlEs/EdEpzBRKCcJgSqSBzqfHNyPSUQvQnU597iawVBEw
         s/H3SBiKtTlL4iPUjzrXjcFhw+tM18cc4ylF6EQOEFYL9LJNt844RmhtQnRAHeBxvOBp
         ErH6kFwlXN0srDcPdNlt365E+nMz0omNJOpgdN7iMCT1Wek8NrnciLdjH63ZDdcY9RFb
         IGWuldr0G4VuSAbLvbEgWrzWuu/seAiG4gncxNH3A2v28fwSBGBNufam9vHDcjuTIfT/
         s5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791690918; x=1792295718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vaUdEu4koPIKyGQFeZFD5bATRmYQBh/annrTgOkgSHA=;
        b=EOeXKSvDoeI4hcYA4hfBu60LkVMeImPazhENXrC3pUtuu9Irqaj7/k4HK6tfGnFChM
         Erieu83b2BsUjBjBTHvBgxM+iNtHxY0rDJNVG7T/YAxP90fzzBUFdrkgW31P9zI9At6b
         GkMl9gOHAnTF2CbpG8O+I+MjZIucZZfGkdnXz92ux4xpx+/MzjJ7MaIFRMWSSsYRJb+6
         Cjg4k65GCiNEfj75kWGCmKe3MQ6nNgN0aT7dgcamtmHRrU40h/yMrZoEzwBcb8HKd+ju
         McC4b30zRWeCq3rE3Yhpgu7/rmL8UzL1pwEqVRfl8kAJf7PgNPZCdOji1vMk56ICw51M
         YeWQ==
X-Forwarded-Encrypted: i=1; AKwUvBywqvB3kW/BgYb1fWxAA2VtlajXXclKC5XabXda9yYhRb6gymEufWictbL37qx7bU1e2fjuqnhG6xW083A=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9Ot+D6AwDct9PS0dot/u/auCOWi8XndIKzviIO5oCDm/2/Ktg
	MjNibxB6LvDzwntCoOtQJs0Oz7hM1aNddfi+7EiB2nbXLaOumXkuxBMm
X-Gm-Gg: AYBFou3j5MGFQkr/hg3R62Mn8plN/GMw6t+kKTwIH863Yl1lz6Sk8Up9hBERTRO3VS4
	YXa26iE8GhJrqgTpkHTWlexJAQR1LecqQkBqSY0a1tagBMp0Z4guWFbymOq4/I8+ypoUV63blwG
	n8oaie14FHS9l7SaEJhf70JUtfnD9oXlyR0EqFssy9//pqh4bGWeEBObBc4LObddu/JwdyDPo8h
	26CLizHuZvNtpwc+Nb5qcB2Pd4U1/REM2wooLDJ2tYz/FvT7kU6m/rMQ56F13Gp74JBDnQ8C+vr
	Vl/mGgVe4dER+awkpgiUBBcrA/osDMn3sKaPRi8GLEB2SdVK0S0lzW27ref/C5MO4koUrQ4Qgk3
	bNRBM3ZHiFGH4Sny+xI6w597Uj/948B0HK0Qgwvta2WV2gcueN3GYKV1XJWuzaUE8/hkkN3NTp6
	7sGx3Ns1HhNWZ9mmTQZihL+DuN4va288iGktMU1iIlx0BdQ3xCmS80aiOulgFbo7xm00OZeqlhN
	cKrYpHtzrOL2gY5kO7qUgY=
X-Received: by 2002:a05:600c:8218:b0:49f:ffdc:939d with SMTP id 5b1f17b1804b1-4a18e49d9f5mr108349205e9.9.1791690917510;
        Sat, 10 Oct 2026 20:55:17 -0700 (PDT)
Received: from LAPTOP-AVI.taile24b5.ts.net ([2a06:c701:4778:c500:e952:dc8f:95c1:823c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2caf4sm202624345e9.10.2026.10.10.20.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 20:55:15 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] ASoC: stm32: spdifrx: fix synchronization state check
Date: Sun, 11 Oct 2026 06:54:59 +0300
Message-ID: <20261011035459.2289403-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interrupt handler uses a logical AND to check whether SPDIFRX
was in the SYNC state before clearing errors. Since both SYNC (1)
and ENABLE (3) are nonzero, this also treats ENABLE as SYNC (and
any other non-zero value that might be added).

The logical && basically just converts this to check for != 0.

So errors occurring while SPDIFRX is enabled cause the driver
to retry synch instead of disconnecting the PCM stream.

Fix is to change the logical && to equality (==) and only retry
when exactly in sync state.

Fixes: 0c93c291321f2 ("ASoC: stm32: spdifrx: retry synchronization in sync state")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 sound/soc/stm/stm32_spdifrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 0ece547407739..88863dbd05d9b 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -720,7 +720,7 @@ static irqreturn_t stm32_spdifrx_isr(int irq, void *devid)
 
 	if (err) {
 		regmap_read(spdifrx->regmap, STM32_SPDIFRX_CR, &cr);
-		sync_state = FIELD_GET(SPDIFRX_CR_SPDIFEN_MASK, cr) &&
+		sync_state = FIELD_GET(SPDIFRX_CR_SPDIFEN_MASK, cr) ==
 			     SPDIFRX_SPDIFEN_SYNC;
 
 		/* SPDIFRX is in STATE_STOP. Disable SPDIFRX to clear errors */

base-commit: 611680f6050a66b84e5cc0af33862a83d1f7a200
-- 
2.43.0

