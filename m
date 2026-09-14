Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72012313E2C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789353781; cv=none; b=kLA5yXodZ4sa+93XUZ/vykUcXRrT261BaPPy+jE1PJPSNWm6J995xLvWawm44rB3PT/aTeAGY7SDDzX5veB79zJBpuMTPC0Phg4i+s2NQyFl1H7oqK6HyBi0h8J94uafQ+TSOJauEhhTZdn74kgISGZNkH39TTSyUC4mEx1QV40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789353781; c=relaxed/simple;
	bh=azDpHypCFmxLda1NALxVvN7aw45bukozhuDx4ej+seI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TRIt3WOoTgjiep/lmr01CCTfFAxrbEUHSsWjAtGOIVtfhkCo8M5ykLtxD0Rn7Hoz5o2mfXCLlZipAANKhIe1xk6yt88SDvlD2tjS5FMgb8powEh5r4UbYfAK5D8+hDkY0K0/s14wvIiN6sh08u7fIw2dNY+yILJvLTJP6m6DX4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LxWyrMq4; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxWyrMq4"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so2696371a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789353780; x=1789958580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/qmshfoHf/3XH39fqg85nyx5ztRNNQEfwMbJuzYIVkc=;
        b=LxWyrMq4KNeAizWWqqsJxmS/3Lau3+idhj1qRhKuf6vhqt8ttsLbFJQPTQ7NC4KALF
         nJqp3Z8HI9vzXuC+MAmlALEh05n/iV58NfTSfHnLKoFnoCZS18mSz4CIHhhnRnRcZKIn
         aWZc3Udh5vibbj/o4oGWkT+AEtlfssvW8Hn10C7gv8cjTtCIxloD/vk7Wm+uykhROO0F
         fcoJgPFW7/G1fMW1tPI7c2aVkjfwxtwy/HciBRQ78r6gPYlm2Q/vwe5+W9/aQHkz/cFe
         Ha/037kyPBfGmKQCtpvAeCH8TsJnNGPU8k6JseCJ13BmSuRRmiFRkhsGbf//uHOkwilN
         vXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789353780; x=1789958580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qmshfoHf/3XH39fqg85nyx5ztRNNQEfwMbJuzYIVkc=;
        b=tWAWxKByf+j9l3YAOzp+JVC6GObUYuRw0yFwtXuusrVMLZZPEHLH9YIsT26PLEYb1P
         20Uu4OTGlKgrfNIvo8wIofkMmJn18mgUJRPE036brrI1x9htbFzsmEMO0R/zMPdLXrX8
         jJRAaqQ0jDZJDlG+vDiTaZ5lRFlVHupIW1EdDDLVL+sE7S1kV66qKhpoMjbX4UoMcdhw
         h9zXnso5GtRtJ76yuBOH8p91YVCvMh7A56eRNQtBnYT06Z0eNA5c33kbKudLIeVXdyir
         OpBZxb1GOTKoCvcHN92LsyfvPSMvVyIrIjHpil6fHHASaMmrNkApfp7/97H3z3niPwn9
         T8qg==
X-Forwarded-Encrypted: i=1; AKwUvBxaFS4fHKRGEE1YUNFwKqOtFfDNaSaP1OOZ/uIATMJCzb467kysD8unAhPVv0aZuFI3hIN0APld9nv4gxc=@vger.kernel.org
X-Gm-Message-State: AFuF++nGFo0CgtlJPr1hFiMbHiLXvrNnD7EPyjc63IVosDAnfx4qwdPI
	UscLFgkWCe7nHpcuCVDByBEHZ5hs0RbsPAIMXgjHnx9WniCsvrN77pWKsfqDaNM3
X-Gm-Gg: AYBFou2179lkdv4CnTovD7uQn3vsY/GBcqwLCXGTZWI1eqmDAH0F8TlKQPRESHfysmT
	UrOxFRnZ+wMp1HYTDnw2jTBk1ka8OOIVVphY/osk5pVUv/ncK7eSOOw3V0PT8UPO3cQZwnOKwju
	sPz5MejTuihG1dMtVjs4nRGuR8Dwud6XQSCuSHDu15NXaXX+erSRAtLI8YqGsh7LLrgqrPoc/yt
	JWQHLCnHXuSlMDfCY//FE9xLLwV2zLcpKcv6F5+5cvhSLx3mPIZ6x3bdW4LrjZXkxR8SiXGpYuX
	Ndw1wFlmQxw6L4ZVXLF0vkMSmRIWx44a9UYW/rTbT4kTvxHvHd7hj6e+FNvSHmfzfVMKg+zRS2Q
	lHRRyoOjJVMT1gXUXGysxLeRYPNRgfI6CR/owFkmoO7kgCjSENXd/TSKpAhTbcJMGAR5OL6yvl+
	tcFcmwttiXDbzJvp7y5jGftnFpGOBEm7GIXtE+MPqp9Phz443LYnaB0GMyAyFBWgaPpyawMLhvg
	5CM87M26Tfx6w==
X-Received: by 2002:a17:90b:3b42:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39debfa6792mr1445300a91.9.1789353779738;
        Sun, 13 Sep 2026 19:42:59 -0700 (PDT)
Received: from fa283618c643.. ([106.37.146.76])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95092c06sm18396545a91.4.2026.09.13.19.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 19:42:59 -0700 (PDT)
From: Xiaolei Wang <xiaoleiwangxiaolei@gmail.com>
To: hverkuil+cisco@kernel.org,
	sakari.ailus@linux.intel.com,
	mehdi.djait@linux.intel.com,
	u.kleine-koenig@baylibre.com,
	laurent.pinchart@ideasonboard.com,
	jacopo@jmondi.org,
	p.zabel@pengutronix.de,
	ezequiel@vanguardiasur.com.ar,
	mchehab+samsung@kernel.org,
	festevam@gmail.com,
	xiaoleiwangxiaolei@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@kernel.org
Subject: [PATCH v2] media: i2c: ov5645: Keep the sensor in software power-down during init
Date: Mon, 14 Sep 2026 10:42:40 +0800
Message-Id: <20260914024240.152741-1-xiaoleiwangxiaolei@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the RK3576 platform, after ov5645_global_init_setting completes and
before stream on, the CSI host reports a high rate of CRC errors:

  MIPI_CSI2 ERR1:0x1000000 (crc,vc: 0)

These errors occur exclusively in the window between init completion and
stream on. Once preview starts and the sensor outputs valid HS data, no
further CRC errors are observed.

Commit 092e8eb90a7d ("media: i2c: ov5645: Fix power sequence") reworked
the power sequence to properly enter LP-11 during power-up. As part of
this change, the SYSTEM_CTRL0_STOP (0x42) write on the power-up path was
replaced with usleep_range(500, 1000). Since ov5645_global_init_setting[]
ends with SYSTEM_CTRL0_START (0x02), the sensor core is left awake from
the end of initialisation all the way to stream on, driving the data
lanes while the host is not expecting any traffic. Reverting the commit
resolves the CRC errors, confirming it as the triggering change.

ov5645_global_init_setting[] writes SYSTEM_CTRL0 four times: STOP at the
very beginning, then START, STOP and START again near the end. Register
writes are accepted over I2C while the sensor is in software power-down,
so there is no reason to leave it briefly, and the three trailing writes
serve no purpose. Drop them and keep the sensor in software power-down
for the whole initialisation sequence. It is woken up only by
ov5645_enable_streams(), once the host is ready to receive data.

This preserves the LP-11 compliance improvements from commit
092e8eb90a7d ("media: i2c: ov5645: Fix power sequence"), as the MIPI PHY
stays powered and parked in LP-11, while eliminating the CRC errors on
RK3576.

While at it, use the register macros for the remaining SYSTEM_CTRL0
write.

Fixes: 092e8eb90a7d ("media: i2c: ov5645: Fix power sequence")
Cc: stable@kernel.org
Signed-off-by: Xiaolei Wang <xiaoleiwangxiaolei@gmail.com>
---

Changes in v2:
  - Instead of appending another SYSTEM_CTRL0_STOP write, remove the three
    redundant SYSTEM_CTRL0 writes at the end of the init sequence, so the
    sensor simply stays in software power-down from the initial STOP until
    stream on
  - Use OV5645_SYSTEM_CTRL0 / OV5645_SYSTEM_CTRL0_STOP instead of raw
    values for the remaining write

Link to v1: https://patchwork.linuxtv.org/project/linux-media/patch/20260826085432.1482348-1-xiaoleiwangxiaolei@gmail.com/

 drivers/media/i2c/ov5645.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index c772ef6e51d2..2985966ab09f 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -115,7 +115,7 @@ static inline struct ov5645 *to_ov5645(struct v4l2_subdev *sd)
 
 static const struct reg_value ov5645_global_init_setting[] = {
 	{ 0x3103, 0x11 },
-	{ 0x3008, 0x42 },
+	{ OV5645_SYSTEM_CTRL0, OV5645_SYSTEM_CTRL0_STOP },
 	{ 0x3103, 0x03 },
 	{ 0x3503, 0x07 },
 	{ 0x3002, 0x1c },
@@ -198,7 +198,6 @@ static const struct reg_value ov5645_global_init_setting[] = {
 	{ 0x5a00, 0x08 },
 	{ 0x5a21, 0x00 },
 	{ 0x5a24, 0x00 },
-	{ 0x3008, 0x02 },
 	{ 0x3503, 0x00 },
 	{ 0x5180, 0xff },
 	{ 0x5181, 0xf2 },
@@ -347,8 +346,6 @@ static const struct reg_value ov5645_global_init_setting[] = {
 	{ 0x3a11, 0x60 },
 	{ 0x3a1f, 0x14 },
 	{ 0x0601, 0x02 },
-	{ 0x3008, 0x42 },
-	{ 0x3008, 0x02 },
 	{ OV5645_IO_MIPI_CTRL00, 0x40 },
 	{ OV5645_MIPI_CTRL00, 0x24 },
 	{ OV5645_PAD_OUTPUT00, 0x70 }
-- 
2.34.1

