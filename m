Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66A948F018
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940965; cv=none; b=ttNxV5OAFh0wjRAOnSSAmHdR7fRB9bl2/4a4P2aW1j+sUS2kUsDxF3V0L5uSkBEwNzsZH+J1QRcyR8ssHOxPaRd5rEhzfP3CYbZQ4exydQZGPLO4YmbFv7GozVJCzrX8hbaVO6HmxqHVvp772prt+mlhDlwpBJW9hANRCc/Y17I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940965; c=relaxed/simple;
	bh=Mvt3ZfbxN2EZTNrZNa1t1/S6/6X9opcfGpDnBhE4aVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LiAwaeQJ8Cgqwz/FXpr026AVWRuTmaMGd0DUOIXqAyaMXORrxvjA812RXVskL4Vkz3suVdhAzToGeXWiQBdMi6AUNqF0Pl+Ceetn98svuihrzDAol1t5sMymnfkMzemZmWKY2PmdGG0DUSXh5/gg7Iih+GjqO7cIzIIX0s0fbQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oyFmBC3k; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oyFmBC3k"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-485843aeab8so6130428f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788940962; x=1789545762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LX3djUYrG1AMjG6o/03rqJKEBPTLs3HZVWxqrxj6VsA=;
        b=oyFmBC3kOE5nuRzJoLpNyI04H/D385mXSfILvhN6hrlVl1qTIUdI0W7TcMM2oH3kFB
         SaJuF0oJjzws+ejJlmeAPx0iiIjPq0RLSgoAUHpCY/TGLmIiAkKQl9DmaZfFTTBxIHKV
         iB3Yc6RsmD3y7y376iaCVFITXbQmZoUXb5vYV6uhzneHWkugT9leNwGczJlDceLn39rc
         yfCqZ4SCSecY8AaJa/FKGrnUDu3USntz11ZAt3N9f4l9xgjSPpGj5DkknUxHxMm+TXNm
         w+TwQr6cXEjQBLq2FTElkvgwAR9T6sKMuHESyOLmdclC5xrmWsO7KAL9BuFSG4yL9Smi
         TuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940962; x=1789545762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LX3djUYrG1AMjG6o/03rqJKEBPTLs3HZVWxqrxj6VsA=;
        b=ANTuote7SD7l6X3XeLP7oDWHfWmcvRq1vALHuRAJGQJ2AQ7eDSBo651kXNuMPn9pVa
         fsuS0SJo5jl02vam/aRwUQdI4EiAkcfoOHkzoQE2MYbfmDwRgTdJGT5aXUB/R2D6oyue
         JB6rxphJvtjNiA4n19qf0Vb9u42fZsl8YRYm8T/oUx/qOwLvxZ4GH/CRrfrXs367bbc+
         LnoOoJZ3d61+Oq1n+XuFMFTLvp9DtHV870X2lZcjfZbGcC64Xl/1JlZUVM0O01jBIBCG
         7u+F2ag7x+WwdE+8s+YU9+DII0ezoLzN7us5rOM1Kg9RwV3seBzRA585VFzUjQk1ps2B
         Ut3A==
X-Forwarded-Encrypted: i=1; AKwUvBy6ZQp9rTPaDj/aK9soxyRad9G3G4d4c6QCoVmiqevD86aTrc67gzTxiEAM2XSUOnJ5hf8Y27UptyAbZWs=@vger.kernel.org
X-Gm-Message-State: AFuF++lbxiC2h2a30wd1n2xU8247DKz/cIEjrYOdbAZN4jQnfDRPSmLr
	bqq+k1gqJlXS015EkPuGMmP20/YfSvMJiTAi6TN+j0KwHdlwqwl5YRxz
X-Gm-Gg: AYBFou0r/AjXYC1OqUmjWrbgrTKUliPscMGBjNp2K6qW9vldmaBXRlOls+7zZJ6k/OV
	uA4o78iG8g6fHYmuMiNkcQc9bgGBjHl+jRYHc7uY6XAJ8h4qL6N6ybKZbwS7RZyIf6TX/8pzx85
	1wUDUsTuqamfo57pyE/kbyiwnJqrmBMO2AOycOU+c5DumHnjALOK/PbWXNU7b/E2D6PXZAZ1KkX
	fFJFcqKF1Uoss8B16B7zc9N25uaPbg5H4xFOJyRTdabWrAiAjYqsIrrHkhKpGx/7M27M8hLS7sl
	W483HD+pFEW64WiGabk6H85cNdJvO5H1c2cd4FvOtWWBP5oTvw95RGkQ5rJxG+wxHLJl8oFRiER
	aq42HeJToQW3gwbyz2ZXmXp2JafXlpmFzLlCWctv3QgJlRnV5TT+XKjyYM7LBjO46z2Ws/+w2LO
	R2ZhvDWf27ICFWjT7dOio5evMCLyIjnghVRlSwkmckCPGu0KP9plXeGCZ/fUPGniSR+/Bw+dwZU
	tLl48R0RI+Bh7PKKuDYgdT1RhEAQCA=
X-Received: by 2002:a05:600d:8490:20b0:49c:f89b:f82 with SMTP id 5b1f17b1804b1-49cf89b1bc2mr518048925e9.12.1788940961836;
        Wed, 09 Sep 2026 01:02:41 -0700 (PDT)
Received: from chubuchnyi-ThinkPad-P1-Gen-4i.lan ([158.173.155.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f8192sm412817125e9.3.2026.09.09.01.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:02:41 -0700 (PDT)
From: Aleksandr Chubuchnyi <chubuchnyi@gmail.com>
To: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	mani@kernel.org,
	michael.riesch@collabora.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/5] media: i2c: imx296: Add missing v4l2_subdev_cleanup() call
Date: Wed,  9 Sep 2026 11:02:23 +0300
Message-ID: <473ee7933c3a0b83d0e8fe9359c47b5c7697bf97.1788940469.git.chubuchnyi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788940469.git.chubuchnyi@gmail.com>
References: <cover.1788940469.git.chubuchnyi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The subdev active state allocated by v4l2_subdev_init_finalize() is leaked
on unbind.

Fixes: cb33db2b6ccf ("media: i2c: IMX296 camera sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Aleksandr Chubuchnyi <chubuchnyi@gmail.com>
---
 drivers/media/i2c/imx296.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/imx296.c b/drivers/media/i2c/imx296.c
index 69636db11..855137b5a 100644
--- a/drivers/media/i2c/imx296.c
+++ b/drivers/media/i2c/imx296.c
@@ -870,6 +870,7 @@ static int imx296_subdev_init(struct imx296 *sensor)
 
 static void imx296_subdev_cleanup(struct imx296 *sensor)
 {
+	v4l2_subdev_cleanup(&sensor->subdev);
 	media_entity_cleanup(&sensor->subdev.entity);
 	v4l2_ctrl_handler_free(&sensor->ctrls);
 }
-- 
2.43.0

