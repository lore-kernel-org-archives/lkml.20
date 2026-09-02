Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145334A262D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359031; cv=none; b=c5BYeWLaf4ISG8bOzK5F8cuZBMXLz2xPwO31GS3WJKuTZBk0jU9DqlgrMgo0aBos5/ypINUGueSCrZUBgOfoZxWr9i8Nkv/Mc0kOs2qjIEqECM1y11J7PSIKpDicdUWS4gAw84OeB7WQBP75iAIled4ZP1UbJH+/j7vaq5/mfRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359031; c=relaxed/simple;
	bh=7Mf6k0qVkozT4YeFG9EjJGBACApFcUwcZixfGal0Bpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XEdWizsPovP9rb4GoJUEW5fO98gSU1M8ZkIOEX9GqL++HiGO9EXbyLo3SZ+l0LOLCmPZrxYY3VWZ/vwzqon0rS86ZgxhILW5OmjF1KmMoV3b7s5AClGznvE5xuJb/aVwoVS79xvoHqPQYS5dhGPiEHmsxI0k8USXXvvQALFXKiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Js3cO1uN; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Js3cO1uN"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so8282655e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788359027; x=1788963827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SM52+0dlyaiG6ccFqkc22ArwQiXLj4h7/RuQ4lLTioI=;
        b=Js3cO1uNRz11TcLZK+JXrkluXlYQq1MTrFceGOyIY9kGlhiHYascXCXu18wWiph+of
         h7tMOLy7Misuz5z83fDyds27/r97ylz9FO3GXRSVkGYl/qAIrRNUVWr2hQA9jzvDurBj
         5SdwA4xuOFe/fQoxuNFYx5O7J6z2Bss/hnIjySXEXo0IYk5z98pSyDMnJvoQCHYptEZE
         fZAi76f+ES8u8oVYbX8y2Um2+nuPmfeKN/5LC/q+xh8scMEaEN66Il16vcw/uzbvObrC
         j+GJkCu/b1RRP6j8QbxZt/qTHo0IuZVqw8GlBOS4Uik2KaCMpGdvfciJE/gBKIVYzcRA
         IuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788359027; x=1788963827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SM52+0dlyaiG6ccFqkc22ArwQiXLj4h7/RuQ4lLTioI=;
        b=gIzk23Df9sCBzzCZzYH8WSFNSW1DJfB0zLE+gVci5TvlgZ9b1gL2sxZvpGmnyuFIiy
         UCF/Z8+Lo24qnxqvLWuyR8rY00PQMSfQHzQXYkoQhMRZCvkWoHRJzitrWLXSR51iiIsW
         x9CCiwlzHXKFQ+Dm/U4IyemiVnhzQ2cLEatj2hv8h/aCSqyhP4SPAYfCwC+1p2xVWcl8
         virbOhv7cdKRR72XEcPz+TtQdPn0NOPuIZqQb+A3Ttc+mv2k1AVNLMiuRKZKoCeej5cV
         aRdX1PlstFcEI8ir7iRWApYgAR/7be3kpxrBKQnDL+0WVF23fQLoMPA4KaKnKEJOg8mF
         b5Ug==
X-Forwarded-Encrypted: i=1; AHgh+RrdvApAHv1AnblpsEXLskxNYPai9G0MVpPWwqAbF7OE7pTDvvTADCkXVuWbjnNTVkBTStVhutNARSFW+vU=@vger.kernel.org
X-Gm-Message-State: AFuF++m6pdH62v7V2Gh5TrkaCRneLxKyBr4cdG7JPK41bmqDoIEJOyIG
	rl4z8ecIaoAc4VdEXlVDpxLdpIHO3wjb+mVmYBGXuMf3r1xfOH5U266o
X-Gm-Gg: AR+sD11XPymniT5LxlCGG+GpV3XP2QojTuUqBAjj7X3s1/L+rII2u1aiEL+C29mdeys
	nxZRPY07tBkYLavvdhSbWNlk8Y36CdRHhiqcoCu2LZOC4+bZaBoVx0A9fofcrGw7DGpibR28Xi4
	mfP3PirKG5W3NF3G6E6TS5jt1+ePB5s6eftVtkKW1GGtXaoeHfxjdOpxYP0ZoIVxBLpvQqCm7y1
	bzs8Lr/Q2HJofCvr+EJ/bolnM8MaWd+BcqxfARjfwHXNKwMgF1aO9MQm3k7YwKyXFOusX/WD7Wt
	sqGP22u6K0fgpk4BiDj8EukptfLkM5t9C3ZNxt3Go7KmqsF+Q4WMeSZSbzzAvyrlz0qzxjeyXDY
	1K/SZsB01wm6YJZg3pxJ6mD6mhT8aqc3owLet2bJGZHKIDIeYqSNH5t/n7IK7UtjQscdInHXw5L
	LRPGNYl6sPlTtrYSg4dVOWi3PJS+sSPS6jg08VZPBi3Fck7/gRJZcgT9Kjmm6xL9WuYUDRNZxef
	2n8mSa2v2ZbsSbGHckcaNmTf+C1Q5eX1e78vm2V5GNcZZCvPQ0NHnakAPMA
X-Received: by 2002:a05:600c:1c27:b0:49c:dcec:bd27 with SMTP id 5b1f17b1804b1-49ce57fd7bamr86987885e9.8.1788359027030;
        Wed, 02 Sep 2026 07:23:47 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net (mob-83-225-30-215.net.vodafone.it. [83.225.30.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm58999265e9.1.2026.09.02.07.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:23:46 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	dan.scally@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v5 1/7] media: i2c: ov5693: Add OVTI5693 ACPI HID
Date: Wed,  2 Sep 2026 16:23:15 +0200
Message-ID: <20260902142322.73523-2-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902142322.73523-1-fernandorimoli11@gmail.com>
References: <20260831181858.325109-1-fernandorimoli11@gmail.com>
 <20260902142322.73523-1-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ov5693 driver only matches the "INT33BE" ACPI HID. Some Intel IPU6
Surface devices (e.g. Microsoft Surface Pro 9) enumerate the OV5693
front camera with the ACPI HID "OVTI5693" instead, so the i2c core never
binds the driver.

Add "OVTI5693" to the ACPI match table. Devices that use "INT33BE"
(e.g. Surface Go 4) are unaffected.

Tested on Surface Pro 9 (IPU6): the sensor enumerates as OVTI5693:00
(ACPI path \_SB_.PC00.I2C3.CAMF) and binds with this change.

Link: https://github.com/linux-surface/linux-surface/pull/2171
Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/i2c/ov5693.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 4cc796bbe..02236f3db 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -1396,6 +1396,7 @@ static const struct dev_pm_ops ov5693_pm_ops = {
 
 static const struct acpi_device_id ov5693_acpi_match[] = {
 	{"INT33BE"},
+	{"OVTI5693"},
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, ov5693_acpi_match);
-- 
2.43.0

