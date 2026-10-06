Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D593148D0
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791269535; cv=none; b=Ub1ZQ1tiD6xTBA4OHN7J0ajU5LaIsHdtpFmgGgk3vy1vQ95OFEt0Wco8cTu9vtpBcd+nHTVJsZWw9Dqs+JkDUnDvj2dsjrA0H342qjswJssBq0I0M5BybwPjd4MpX0eF4kFXD8CjNJHcnU2Eix8GCAy4Lz7jAiW2i3xIGjlNKNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791269535; c=relaxed/simple;
	bh=sXEuhuPbydIc2hl07e1Bu/OzsVyrxTFy5iWRYniIZCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lEjqJMGZi7QKQZZ8WhnE5CdWC9vnLSmYPVwHT1EUdwRfSISc0IRcCB+VkpN1d/pOJZ9evux5JYMoTRqVdqjnmLaX9ZjauW+gQD8FDQUJ5jTjxWmvhIoR971a1mwPGqtRIviJhrjm5x6H663DJYeL2DfKq7GiS9xTA3YZoPc1hrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=czHTelQx; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="czHTelQx"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33fb4680717so7217841eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791269533; x=1791874333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZzqvAx4iFT6Nq0wHCIP+vtsVoXt5n1py2cHhYmK9d5E=;
        b=czHTelQxxRj89cD+sGN0HyPiyWsQ/2imhVeuBcEQ/2d1oczYEgzdDytpW6NG9ra3pk
         3awn9TaB1JyL3W/tJ/JAZnwOxFjkWWfiG0f8RUx/saebjQ6qbsuTrWW34Cjs+NQ2Vp4R
         P/ToqI59vc7vAM7SVH9JBGp5LPK1Db7BEiCom0cxOuoH0wUr9WMpa4ypyK64TFcVlbxR
         oCcAP6HWeFH/uNi2GjrZLNoUT6vFv0weQVm5lwKTMLRATaHpmu+EvEgy2BCG7EDWpiZV
         01OtuDq6AvtsmOaD+GJQ+nnrxEOthcJcIL2A2Wvcl2HgngLS65p23ywwyBCJWI78QxVv
         h2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791269533; x=1791874333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZzqvAx4iFT6Nq0wHCIP+vtsVoXt5n1py2cHhYmK9d5E=;
        b=TBI75yGSIIHdOVORGj5U7TqZtpuJQEzH1d3/nBxR8y5pxSHrIfz7MKr+foSil2EX7m
         ig1gmd23Voz4iA5TmQQYS5NcIeJ/Abcgyu5aIKaGtwUQxeFuyCJWDX3wwkwvIyCH9MLv
         4+7oK3FG1sVgE/mGHiA9GA8nAE6Un7b8YOC9mMv0VeXXTio6rI2d1PzKqjehECiTim2s
         s4VLLqwayicu6slyoj5B63rJ++N6qcrk86iykRdFg5l3xzZ+DPeGfOoZcF4J5GxYJUso
         ynJinNMtEExWdrLnymZ/S7Vj7N4COOVe70Q/OT6LKOR2AUMPvTJBaMQUSMJ7z9p4jmQG
         JAvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEDsdA2G/Zu3t6BRbE+UlTne66nmhz5vcpUwtx8h9KzOpBOkw3/TRoQQxqZOgffqHm3e1837OJJvSi0sY=@vger.kernel.org
X-Gm-Message-State: AFuF++k2T0dEXVC+zI+2HlSw6WySU+k1qccEPclmE8GEIxw7UbVeIsYj
	jBhQSEJy0RPRZYuzFnJcxyYNhDqam4hse3mjyDibZFYxcOQfcMookuw9
X-Gm-Gg: AYBFou0YFKg2zXpwDtsJZDlJdRXP2f12qoWIAsWN6GNObBH3no25OiG3QUqF3tjucN2
	0T3GNuIgrUeYiFPQ3vKxvIT0PvvorxOFFXFJGArD0xkpuRFepcTsU/+hclia51LmV52ZgOGPZiL
	Yg4+LC/Y+xmRQXx5hxucBqKlNaNUnUv7IuLfA1kjiByJTgbH6576f+ImuzseyySkxJU6ldeFjy7
	9TV7WNl62w4YyvmC4opDSUQTlPCK0uLILpKsk2+3lPdXSbsyHfjR2egri93/k11FKSJEQvAwxRx
	5NkdTtabykiKFyNsiGbkHBIHi2K+jsP7jQ6vuudwrlmVJGWc5TcVHP/kqW5IZvaKfmAtDxWuHrG
	MuqlcilvtMaE6gaLZKK1Zl+Doux2iMNpWUNzQCNuv4McNUHHTyWC5rrMT5omX0/sRKIRHvlbyFR
	rBdWeHVcCPGtBuJ+tNVNHVHN0REelzPhrPWUhDFAzJCQZGdyKwwzowtag+FEqLxA==
X-Received: by 2002:a05:693c:20c8:10b0:351:4bff:6d6b with SMTP id 5a478bee46e88-3514bff6e22mr859281eec.16.1791269533292;
        Mon, 05 Oct 2026 23:52:13 -0700 (PDT)
Received: from gmail.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351468b2cfasm6306463eec.2.2026.10.05.23.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:52:13 -0700 (PDT)
From: pdsj2807@gmail.com
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de
Cc: Frank.Li@nxp.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Palak Raval <pdsj2807@gmail.com>
Subject: [PATCH] staging: media: imx: fix function call formatting
Date: Tue,  6 Oct 2026 12:22:00 +0530
Message-ID: <20261006065203.3645059-1-pdsj2807@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Palak Raval <pdsj2807@gmail.com>

Move the first argument of IMX_BUS_FMTS() to the same line as the
opening parenthesis to address the checkpatch warning.

Signed-off-by: Palak Raval <pdsj2807@gmail.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index f119477cac6b..978770cf3907 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -16,8 +16,7 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 	/*** YUV formats start here ***/
 	{
 		.fourcc	= V4L2_PIX_FMT_UYVY,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_UYVY8_2X8,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_UYVY8_2X8,
 			MEDIA_BUS_FMT_UYVY8_1X16
 		),
 		.cs     = IPUV3_COLORSPACE_YUV,
-- 
2.43.0

