Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DAB4A5EC0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360846; cv=none; b=nlnMgQxw5fygivlOuZhate+8ZyD8GR2HKNCnQyCEAXC4QOfwRuUbYI+dNdEQpeUwKsOgTcrtWYkv8DHpIylizi8/Hh8i6BxPMMOENMujggh3dd/lBpdf1z1lJK605KTiS1hNxgx3/Gt9wq9OFJmMOANlfEilNton3AN2oRFaRyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360846; c=relaxed/simple;
	bh=fnLuAuk4DdEaA7jml3VwGJrscDjqw5zgrKIhfNOResY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JQwGHIhP3ijKFPy4ftT1C10cTYrPOVYuq9iekPrappQfC8hGLucv+xQNmggMNMDnyeJY01oVKkKEsxCheIP7NSq4Ye8NpFCuOGm53rupuxqiD7BMNYiSwYN1jfXi45AyXxkbiY+ua4TEvNApg0amRLd8ruSqHxPFZwJ+lnpVjAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0uc2rXA; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0uc2rXA"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47de0093c42so1270930f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360840; x=1788965640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KqTr/x5yNF9r4lu6CVzssQgLLUaZ7eL+KNzZNSw0R0g=;
        b=j0uc2rXAFpFb0VhCOi/yS0YHdIlhYhHeFZdH0QSUcsBjNGzfk/zfSxd9JP9Yd/W6Mi
         GFwAmuQRGvxdXtAf+j8V3vSjjX4ToXx8SrP6Sd5NKTjkkkkZek6H/rTYj0ccg1JjLv87
         3FJf92Wg6GhWlCkr49w/c9vilq53MDXCPmEXkVpDiS2JKyWtmJJFIbQwAFhFOrrhClXo
         dccKVrVofhuS+zBbnQGAMeeXl63WElEnJSGzWu8YjaL9seui62U+jYw85E5pVpHeH2eg
         y0jXilkPuoow0cQHAmqQxjohK6LuEq4OekH9a5TvHhhzILu5G0/+t3VDtmqy6slGAqDz
         TpFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360840; x=1788965640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KqTr/x5yNF9r4lu6CVzssQgLLUaZ7eL+KNzZNSw0R0g=;
        b=DN1woHxTY1iryobqD7IZTnhMrj+CRvY2JU0OHW194+dqeep5pa3gpc7qIMc0dzqnmh
         uP7pW9zYy1sEBkLPjUieND/i1Sbhp1w5wFJrMMpF6U/1iWWtcQrQuj95pCzSvzGryZ7o
         WVadpButIJYjI1IgN4V29/jsveDc8G0RRGCZzh9PPxi8WzZ92h5o3aeDtg9nhBs+H1b1
         Boj44Uo1OO3FlA1mazqOd6hhg+eOMeYt0Zq7iriuDvydrKafPcdRpUw8MlpC8faVs32g
         KycsD3TXAOWqCYh8iKaJYQFO1Rsu5A20t9R3DVKgFW284S3vwwYdNC12ARbnF7gfcMiq
         Ag+g==
X-Forwarded-Encrypted: i=1; AKwUvBxtE5BStAz6tXVL2a43PrW5ZTgYUE3giGeKC6scyqg2NEBJoULqtxHnZeSqPy9cxwy7rpxnI93tfCLPdF4=@vger.kernel.org
X-Gm-Message-State: AFuF++lNOtCh+RTPTh6EnXhvSMnN/M9xFaY87tWPek1C6B23P4O5bEIx
	d0qGl2hYjCUZiAPMUsbGE3Vb+7+clgm45QpAzQ9i25WBK4KOeHk+1kct
X-Gm-Gg: AYBFou1YS/yYMPrNecQYNrRTLPGwt6yLveEGRgtzkwa084LfRloJQ3zIMIHazgvKxWQ
	2gOwnKyVIDSKdC5tr6fd1eKogDOEcLlQSt5ntrfSDeuY/R/mozJt6exdVrcWlYyQ9C+LT5TYXad
	XE7T84TWZKCLNiTsfV0iRZLhcs3A04V0DfjkYi9Kdk1P8mC0CLhtoq9qZ1LSyyQNvdbiHb3NNNb
	qMiGieYi33FyjjcrXDZZ2FRKIlFr+s04kL5O7yIAQeUVJgcpfAiuidj8HA3mnM5yNKwwrFDOeZw
	WdejIYB/TQwWXxRabrTxQGfz6cpLaA1aUOVhUV8LEDqokeS/ZUfPTxh4vY+i2268Ypo+k/LGzhd
	37uyYefP2501ZsLpwdodrZkMJmVvm0xYOc9Wr/iR9YksK3Kxt/bHfQ7Xjcasq/RJ24o/GQZuykM
	LYBeRIAGEsIGVPtbmwuW5EMVARD0gozMwVj65Gkvu1MOeVNb2m0I6HJ0AdRBgZdyEPs28gyICu2
	0xrABG1XK8bNSf2fgMXH2vy2AZDVK8PJAW68tqm+YEN
X-Received: by 2002:a05:6000:4014:b0:482:fb97:2ae0 with SMTP id ffacd0b85a97d-484913b85a0mr10022359f8f.14.1788360840251;
        Wed, 02 Sep 2026 07:54:00 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:53:59 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 06/16] media: intel: ipu-bridge: Add Yoga Book camera sensors
Date: Wed,  2 Sep 2026 16:53:35 +0200
Message-ID: <4ccc1be17658cdf9ff1267d66db6c2b5a65d6e18.1788360629.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788360629.git.mauriziocasciano7@gmail.com>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91 uses INT3477 for its OV8858 rear sensor and
OVTI2740 for its OV2740 front sensor. Add link frequencies consumed by
the sensor drivers when the IPU bridge constructs software endpoints.

This supplies endpoint data only; it does not establish that either
sensor can stream on the Yoga Book hardware.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98d6b..47317c423fad 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -65,6 +65,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
+	/* Omnivision OV8858 */
+	IPU_SENSOR_CONFIG("INT3477", 1, 360000000),
 	/* Omnivision OV5670 */
 	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
 	/* Omnivision OV8865 */
@@ -93,6 +95,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
+	/* Omnivision OV2740 */
+	IPU_SENSOR_CONFIG("OVTI2740", 1, 360000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 	/* Omnivision OV8856 */
-- 
2.53.0

