Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013048;
	b=EANpNv//YVnIh+2qXscdNWKrO4YYq8grIMGWUt+kz80HLjG+BPAXGeuhqSMLNJ8zwdDR
	 LWJigA8VfLIJbjPDTBt8wGQNTQ77n4FSEnYEOt+yOeowp9JkGlqg8C90ymftg9tmXejxW
	 jA2NEBeXQENsYBLQoO3B+x5BprCFmZecY5eq8FbmrrbhGM4fjxILeIGZ0/FfA0MAHF4Lr
	 mcR/C63PZVAo03iMM6hGf7sj884x/y0VsayRMLBoBO5aZFGvih05uXODPmKZpx/4YhAxD
	 z6i9R/ROUIKWBEf+nTX+l/wi/Q7g4FtHzYjPkYiXQtywNWTPzpcyuVFlTee4ED5ZT5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hdoTOfo3BJdHq4CV/lOfpmIhiwiyveElHyqS3Aj2E1Y=;
	b=tUVMijB60wEgaSF+w2viWYBQidBJbDUgjEg/4RCtsWctFmt95DN4YPiePbyx6+vqJn25
	 7DI5rxFE0pEidX/uKZp78+L4UZ1d+qxdZOQm8P81sjtVqCNfE7vfznKfmd+vOMLYe/LpR
	 nBNIesv8bg4X5+aO85OdhZnoBppuVun94Jw6cmYTYDDjamla7GDsfPavGNhQ3qsgZvXvC
	 ERftv5/z58PxcoLo6MVecK+D5a8HjzQp7qqs/jOjHb86nbl3aNJI3ITiYgX3NF7IHesxg
	 DTX3mCltrsySXXN8d2NPvBrBwKYw25d8dK7Qmd5axZkvEXVQlTSR6WrvsmT9dVNoEWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lPAs2Fn0;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04102606B968
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04102606B968
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lPAs2Fn0
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ac847f9d78so339484a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013047; x=1793617847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hdoTOfo3BJdHq4CV/lOfpmIhiwiyveElHyqS3Aj2E1Y=;
        b=lPAs2Fn0UlQ54Fqrbwo7zNVdAE9SPQgcmX3z/5ZSn5NeQWwwcMOCsLRKycLroj0CwV
         5NJwwYRNlIiXzZIGWbErqMaqXclP2oAUFgcWE2U8AkEDSUoD9NyYBupI4uj0LZ2syIzH
         DJNKZ14mhUFYt8ohUGo8gJuoXZkOf/1d1DeW3UXhpqFvBzr12Pdrpd6UgzQQubQKT8F0
         svemV4E/dIZsViFoMDr3FMh2AAOHk76J+cUQuHl+7zqXc+XNKbM2j/fdjd50TsYhZhdf
         /vEX7ORw/2L2FHEfegzYtCIgIzdG4VfCpieReeewv4fpIcjsswv0GvlQWVhfbZYUdbMG
         g/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013047; x=1793617847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hdoTOfo3BJdHq4CV/lOfpmIhiwiyveElHyqS3Aj2E1Y=;
        b=i/Fq0SsFKiEaBB3xZmeTySbPgU8uTT1AVAHfhexTszFGgxvtHe3b+qvq9Nz57+Lcn6
         NGEw8M6PVLQ9qbbqxBWYfJVqHo3ILs/0ybsaWp2Y111r8SMb0UQESViqUEq5gy8yEzZk
         6GTdLGtJPGLDz1zGJCDP7k45OpYIy/bJtCaxD2Nwmf/jnx9FdjVPGvii4uUpysuRxMQJ
         S5niMnIOz7WJaN6VhTXxI4pq6pSJCKPbxGulqE5m1Hee4ptDP0TWQy1h/GIMSWMAe4ni
         jkloDuSXGCgnCx/X1a6LDstJ7A3KkYSIia6NJ2tYdksbaRrRHG2jn77l2bSHx50H+yt3
         vFIw==
X-Forwarded-Encrypted: i=1; AKwUvBwMUyt5WcxopThVT+2FOD2YGCYWW7F4+0wTQ1xmfHQWi1wBB3S14+K0P4IrOhkEw7AclULfK2KbfWR3aeE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIL3VD1hCqwE9d1ahpaoUAu71M/f8sfdpFwjFY9JogSk1z7rmCh
	7EZRM48klzinceb4UfblK58trhzspJBwcbxG2DwtKs/l5U7ccMr8gYW/
X-Gm-Gg: AYBFou0BzcxT2ddsyE6pi2A7h88ZbyoBmbhbEODII5xCDL80gxWl/5Kf/DQ4eM4KirM
	sHos/JmQwehQ6sflr1qEzkDTkGPRPweMet4oGVCUpsMrIPGpM934nG0jlfhKHcxrwU6TFmjDF0A
	Owc5dXVCayEOQz+ar6obnMYG3GNMIzOrgEBMjRtW/SoK3k1CZU0XdXqtbGLrrpT/+QT1uAjJ4Mr
	fCAbpIonXR9YjnmLxj5935KLUQBdHf86uL069sBrq7IzCIFCcQ8xI62iPMqrzP9+9/UYN4PGqdF
	SK3QobmxGTJnOzJ4/9590MCiQ+Hbd3L+Ai0m+du6laXc3wWNy7ZnM+9FQZ8thA8r+Mgq2gpAy1f
	/e25v9Bm5eWXZwtrBu4BoU2AWuEZ5W4HfJKVf/pagVD8BmIGqAgOCxzX1SKdkNamcQWV5SAjEad
	IP5N8YMjF2gxTvkUxxSs7Z77vWiF28TWB7CFH0b+VzOeDGjxKA+WCgI1wn5U+JzzkvTrJQGcHNH
	zzRE0Ws0hkkyrDYVg5Yd55zhKx1Ni+X7WblqGU2Mw/ykvL2FfTQ+aoaYqBsxUSDxm9be1Nwge0a
	tgqxaWZ+FNz4DE7QGGpkfNzncRHCiP4DEYpp3zqrwnCEBSYXS2jCiGdKEfvYJIqN5xjN7hcsr59
	9n9fzk4x0XrbsQTXT3AATJLitqAsM7neepxmzRAQGSAzK8Q==
X-Received: by 2002:a17:90b:39a6:b0:3a7:a463:54bb with SMTP id 98e67ed59e1d1-3adeb10f4c4mr9622839a91.5.1793013047320;
        Mon, 26 Oct 2026 04:10:47 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa82sm8023593a91.8.2026.10.26.04.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:46 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Antoine Pichot <antoine.pichot@gmail.com>
Subject: [PATCH 4/7] media: i2c: ov7251: Add orientation and rotation controls
Date: Mon, 26 Oct 2026 20:10:29 +0900
Message-ID: <20261026111032.88355-5-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026111032.88355-1-antoine.pichot@gmail.com>
References: <20261026111032.88355-1-antoine.pichot@gmail.com>
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

Parse the firmware device properties and register the
V4L2_CID_CAMERA_ORIENTATION and V4L2_CID_CAMERA_SENSOR_ROTATION
controls, as documented in
Documentation/driver-api/media/camera-sensor.rst. libcamera uses them to
place the camera and to correct the image orientation.

While at it, bump the control handler size hint to the number of
controls the driver now creates.

On the Microsoft Surface Book 2 the ACPI _PLD (via ipu-bridge) reports
the IR sensor as front facing with no rotation.

Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
---
 drivers/media/i2c/ov7251.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 917285a62d..b6579a56a5 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1591,11 +1591,17 @@ static int ov7251_detect_chip(struct ov7251 *ov7251)
 
 static int ov7251_init_ctrls(struct ov7251 *ov7251)
 {
+	struct v4l2_fwnode_device_properties props;
 	int vblank_max, vblank_def;
 	s64 pixel_rate;
 	int hblank;
+	int ret;
 
-	v4l2_ctrl_handler_init(&ov7251->ctrls, 7);
+	ret = v4l2_fwnode_device_parse(ov7251->dev, &props);
+	if (ret)
+		return ret;
+
+	v4l2_ctrl_handler_init(&ov7251->ctrls, 11);
 	ov7251->ctrls.lock = &ov7251->lock;
 
 	v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
@@ -1642,6 +1648,9 @@ static int ov7251_init_ctrls(struct ov7251 *ov7251)
 					   OV7251_TIMING_MIN_VTS, vblank_max, 1,
 					   vblank_def);
 
+	v4l2_ctrl_new_fwnode_properties(&ov7251->ctrls, &ov7251_ctrl_ops,
+					&props);
+
 	ov7251->sd.ctrl_handler = &ov7251->ctrls;
 
 	if (ov7251->ctrls.error) {
-- 
2.53.0

