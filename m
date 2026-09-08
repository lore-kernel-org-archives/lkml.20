Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A3148E0F5
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 19:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788895288; cv=none; b=Sd5P/i7GUc7ty/gCiN5XXOM2bMA0UjnkNVQhMuwPNZH+TBmXfQtwWHYdUzEY/flxKvvJpPORaYVlePbh7fsAssNg1HMmn9qkl8Ivkof3UGmvmOjY11qRCYTCCDVFU7O6/wSOSFW7y6bl09RnTvOZdWK6diAmH1c6bakoSLccK3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788895288; c=relaxed/simple;
	bh=4EOC3wW3OamsK9JdLlJUqHEbH0Xlwq31V0h4ZN+fFs4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=M8v2WZsuJiruEHAVigzvrj96BbXd9AGn+MdkaeMEa4vV+XPdzgWAh+sheSCc0LRVG2Xn4Lbjgz+72yd1HPNNkcwgsTo+7/1O7rrs3sh5MtcfAZyL1D7smDmk4EBhvZeDzZXQOHixgDsaKc3Yj59BJkfa0gFbMrJaO3Gu36/+16A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JtHW880O; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JtHW880O"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d91ded8174so39998285ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 12:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788895280; x=1789500080; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QRL3dA3Rcc+XFjHN/uSduejfnR4cK/ww1jXye5/2bAo=;
        b=JtHW880OZKwpnLHFEGBSY+sl5vX7psArdkuk0hNZzeYrNxTfwgaBF37j9sp1iBIH3I
         k2739g95F5GRbGWf4vFGuuR4UaVovTcvcTQo9TrB6SuPE7ErcQqWiJx4OlO3njoqNb8O
         49TxoHLSwgmNbgsTR4gj0w+Ly8osUWLazS9VB7lKqX1Qw+JR9rERKbmy8a88ZF8gtDOO
         sbtBtis6nbK3zNkfmRUj7BLK3XsQttDm+/RuYlmFOyHTiEgNAuiaNyO9ut5egEmyX5cb
         jpiYlEMf2SnI9qP4M+67EkSW9mLDxhqmygeWqi7dnFh3cFo/DVsmBEBV+LNP0TSx368Y
         PQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788895280; x=1789500080;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QRL3dA3Rcc+XFjHN/uSduejfnR4cK/ww1jXye5/2bAo=;
        b=psWfoL9Q+Bjxn/drx1Sg7IMlgNxu/ZfvSxHGQti1KQJjAlysxzj7seEXurpMO2aHtQ
         V/gxaZmf18xJeMjzIJtzzvYI+AdC21GYfduMCjJcJ0XFDEJtqoOd1NLSg6hOOeGR6sTF
         PbfRAVF+nvL45xVaL5ijFgyOlqQwHKk1Owwc8NPFe0P5VjFrpisITg8TTVCNk7DeKHEW
         lFLR3tX/979HsB0EIRdkPVnppGv6FF8IOC9UWSSyrc6QRBZ8dH7C0cld5A44JKG3asCF
         q9HP+sTeBvJUtlIBUfMLVoafibbTshM4bri1YfE+0NaNH3i2zv1Eh5hcvYAHxEGJjttT
         VgPg==
X-Forwarded-Encrypted: i=1; AKwUvBwMIVFNG4SmOMyj3J7TVu0LIJiBIDCfmLlPrxz78y/TNcBc5XI6mYgkC9iw1PzoYh5pZejlIa9brrjnteA=@vger.kernel.org
X-Gm-Message-State: AFuF++kqvdo9HYy60C3Dw7Rw4BCWP+HR8t1fdjMMb/MmHaeum2t/2rJ0
	Pz1fjmcAdPJ9ikEL+L0/XmWSYolEY2PBt/PcTu51NXqYNytVUPu+/mZm
X-Gm-Gg: AYBFou2g0LkDZTiP41mcClJx34/4Y280C7bShAIIylwEh8jm/GCLLph+ZJCS6rPgrc/
	jjH/2HTGZo+4srZ2X3Ib/fI9wxPcfk6v3hx2wFC8v7BROA9fSkW+vCv/Vjr0Cwxpxoz7/O8pXPX
	l2hgNiem5qYHGVC9+tBo2jJ9+qLAGhRV2o1+tUvaB0KhK1aiqaUyAhMQTGAGxvcVboy5cwGjH4f
	AoVhTHQWM+NFTyloOsf6r0X6WAUo+wyMvy73ZhszqB3D7bqy0K78aYBghnRRhNqsejx9JfysYK2
	RgTMyZU66VCSoFeWuR36T+UjfxjFo4MR7p41MOyx1xentkNCz51AN5G+WBibm4h85E2lWngOyam
	D7Mw2WYXzVeYBjF+8F3sFM+vXC2cnPJ5+3vcVCRaqxpAh4vM0Es0vcISrowYar+gD9DTksBjO5R
	sjM6azMZVbKedUKN1i0ndF48qt9vMcUVpgWeU+zMlyx0XEDPgi/6zw27MtEzOMBd4vuuJB7A==
X-Received: by 2002:a17:90b:4d06:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-39b2614df74mr43780160a91.1.1788895280501;
        Tue, 08 Sep 2026 12:21:20 -0700 (PDT)
Received: from [127.0.0.1] ([2601:1c2:e01:85f0:7a30:bd30:851c:db6a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b4b72f62esm22280244a91.5.2026.09.08.12.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:21:19 -0700 (PDT)
From: Eric Anderson <ejona86@gmail.com>
Date: Tue, 08 Sep 2026 12:20:39 -0700
Subject: [PATCH] mfd: rk8xx: Register poweroff handler in atomic phase
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-veyron-shutdown-v1-1-066ecb80f5f2@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMOw6EMAwA0asg1xspgBYRroK2IGCDKRIU8xXi7
 mShfMXMCYKBUaBKTgi4srB3EekngXZoXI+Ku2jIdFZoo0u14hG8UzIsc+c3p7SxOTVE9ksGYjU
 FJN6fY/17LYsdsZ3/G7iuG7YHi7VzAAAA
X-Change-ID: 20260908-veyron-shutdown-09b3faffb5f9
To: Lee Jones <lee@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Eric Anderson <ejona86@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788895279; l=2014;
 i=ejona86@gmail.com; s=20260908; h=from:subject:message-id;
 bh=4EOC3wW3OamsK9JdLlJUqHEbH0Xlwq31V0h4ZN+fFs4=;
 b=FkumfeDmjPIZ+aWz2xwq2LP+5HBrHZM+CLurBl5Ry/sURLJWMXpanBX3OOeJt2BLTWAZXQPCx
 UhkOcz7NFjACLbtHD4RrcYgMhyh5oPfSWSiXsEsq9VM48w+ntHe6C2Q
X-Developer-Key: i=ejona86@gmail.com; a=ed25519;
 pk=2H3Lzec9LRMjV4nOTpsCkU4+6npwE5AujP1dyNqM4lE=

This fixes a regression from v6.1 to v6.6 where Google Veyron devices
(rk3288) would not power off after being shut down.

Prior to commit 4fec8a5a85c4 ("mfd: rk808: Convert to device managed
resources"), pm_power_off was called by legacy_pm_power_off() which
itself was registered using SYS_OFF_MODE_POWER_OFF. But in that commit
the registration of rk808_power_off() moved to
SYS_OFF_MODE_POWER_OFF_PREPARE. At the very least, the code should be
consistent between SYS_OFF_MODE_POWER_OFF and SYS_OFF_MODE_RESTART; both
should be *_PREPARE or both not.

It appears interrupt delivery is already shut down (but not disabled)
when SYS_OFF_MODE_POWER_OFF_PREPARE is triggered, so
regmap_update_bits() in rk808_power_off() does not complete
successfully. Registering rk808_power_off() as SYS_OFF_MODE_POWER_OFF
runs with interrupts disabled which causes polling I/O to be used
instead, and the device to power down.

Fixes: 4fec8a5a85c4 ("mfd: rk808: Convert to device managed resources")
Signed-off-by: Eric Anderson <ejona86@gmail.com>
Assisted-by: Gemini:gemini-3.5-flash
---
 drivers/mfd/rk8xx-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
index 3dcf6abfda74..21182df45d1b 100644
--- a/drivers/mfd/rk8xx-core.c
+++ b/drivers/mfd/rk8xx-core.c
@@ -875,7 +875,7 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 	if (device_property_read_bool(dev, "system-power-controller") ||
 	    device_property_read_bool(dev, "rockchip,system-power-controller")) {
 		ret = devm_register_sys_off_handler(dev,
-				    SYS_OFF_MODE_POWER_OFF_PREPARE, SYS_OFF_PRIO_HIGH,
+				    SYS_OFF_MODE_POWER_OFF, SYS_OFF_PRIO_HIGH,
 				    &rk808_power_off, rk808);
 		if (ret)
 			return dev_err_probe(dev, ret,

---
base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
change-id: 20260908-veyron-shutdown-09b3faffb5f9

Best regards,
--  
Eric Anderson <ejona86@gmail.com>

