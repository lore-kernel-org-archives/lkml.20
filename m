Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD44483BED
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790328304; cv=none; b=kvgNhUfxOUeCZUmtEiJzLFnAzbVFSMfS98bzN3O7koRS7o8KUy47FoosFK/IWkJ3O8FRTeRpgno91mpzUpKUqdDmnYXsQd32phwybgyc335bFRuZ40A9galLWHk5OCnhgaiYPNeCf210T9IqhfftjBqQzpZgFKtddHzaK+mxKjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790328304; c=relaxed/simple;
	bh=rsyuw981n4NVhsIaBTUsHYg+kOmfbqnfnOOq108N0y8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=alH2tqNsCU+U/7AYiSEa2kgIJDaqQ+qlPEoopFt8DDkjMmNKTNgm9OS8nKLIgFone3Qv3+sly4AFas6H7Ma4EakFOfYDpvEJ4rzEhm7ZeGRRHuUyUZy7rL94nsb/5IzhxNVWGbHY19KAXtqeSnXDzBpuFCje+uksr6SIUdC8PIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wg2tGkdn; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wg2tGkdn"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-32dec843c37so920059eec.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790328298; x=1790933098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2Xgw42/7p7dsnyTvA1Jhb5iy5oJXJ+/JZaVZl7VGKg=;
        b=Wg2tGkdn9RVFIkNyo0uNbmXlKH3UVq9/GnB1Mm3+tKWdIqF55dZR5N/nOzRRu8RH4w
         deUDuaztTm1WWcVnggP8OWLquX/FwbFLR01a8MTsdVZRXZTHffYfYiDCYBrcoClq4rZ1
         QbQ78XpL1NzrJJFGtTjR7z+wpx5t056QRfpPDoborOP3mjbLQcRMJ9Wr7nWK+m2Xpb3S
         c0/TzFZ5G0Es8PjhH+mCWP+/Q29iviRyWK8L/hi4o09Pv7fvgjlZNlA+7UwkaxNrytUW
         v6dsuoUxNbeN1plfKZZ1X+QH/4HvwvUYdL5OR3cftUQraKRJD9ovtlyjzLbyi1W1J42F
         uliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790328298; x=1790933098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2Xgw42/7p7dsnyTvA1Jhb5iy5oJXJ+/JZaVZl7VGKg=;
        b=UsKPdkQalB71csXosQG+8StCd2O4NqbIw3ScTSMeMl0jaVkBVK+Ddr+fuhNlYMS/iM
         d6ZSkCddwmWjI8aEg48NDVM68nXfH+OLw9fAYWr3d6DoH5vIF9kIlMiJDkUXJb9NHSwa
         AQMHIpOUc+xqMJs1JrzFq1hh4nR1CRbFANxY9uaQHp+jnYbN8o5QEfWuhou/9fw2uKga
         K31zYKRmM0BSRaNd1vDN8Bh6rnvBnBRcWq+SUEO3aCG8V9WtPp0fA+70ktTZQCxEanbw
         FHCXJM2ypzRP0tpZNAi6Vva74i0c6zTYj2MSpDYNZKv8cxMpbXR41TKZqpNektXu82zM
         oZkw==
X-Forwarded-Encrypted: i=1; AKwUvBxZdRPvGBGOTVob2SiXShb655DYLaXqXumxCD5E/JcxnQuEOQqDpBMXCdC3hPHjqwYTT1qzsYpeT8FySPo=@vger.kernel.org
X-Gm-Message-State: AFuF++l3n+m65jzIvqAofepTebLfcu5mCZENCdHfMXp2wTVLu/7nx6HS
	hxIe7TyVZYVjdE/a+0U6CbbhoverigU4yiNI/R4H0EDnz9EYhMCpOaMS
X-Gm-Gg: AYBFou1RLAMz4dMMYp85c+xugsPPGV/2G3Mg5bC/mzv5g9WJv3RhcERgfI/3LrmSELI
	ikUtWH4ogeu/zTcQDfU7bBnCOPZ9RUxa8iCQqRyHDHW3qxZN2Uta8RYv/+TDvTwiksRovp4ufjF
	hxgoKzOPVqn3fsQlClG/ywcMGwn+C2nMPlSgcRPHwAed05fa7TmUNGeFnrMMfAp2Pz24zM6ThYR
	Jvs188GWCTLakbjQIsbQu+tIDq/ht7S7Xm+NIzMxr4mkigmkJt7SS4f5zffCresvnBT1vAXSY/X
	aYUgVMj3vRjSDyaNWj3BbFuxdKs8SjMCfN9jpy2um0VuBT9Qrba2etFVhYO2n2Bd650Swg0yyib
	a8vJg/r8dPegC+3PbQ/mnVwWwNVKyD+QJmFIXAd1SgfdvYqMEH1e2ia/iQ+h4T8Zev5+Z13IeVS
	C4D18zHHGov0vHZWCuv2ARPYZ4PDDews/ZWgyptcIDE1RAcKDYNfPU1cp/oRRjAVacJdUaQ6GYP
	0D8B630Dv2JbOGxD5Dbln6GrUY=
X-Received: by 2002:a05:693c:6082:b0:33c:19bc:d8d2 with SMTP id 5a478bee46e88-340039b5202mr6094857eec.31.1790328297715;
        Fri, 25 Sep 2026 02:24:57 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:8004:98ea:c60f:8ff:fe17:57ff])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145727589sm5035806eec.23.2026.09.25.02.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:24:57 -0700 (PDT)
From: Bihaan Sen <stevewholikesthings@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bihaan Sen <stevewholikesthings@gmail.com>
Subject: [PATCH] Input: xpad - add support for 8BitDo Pro 2 Wired Controller for Xbox
Date: Fri, 25 Sep 2026 14:54:34 +0530
Message-ID: <20260925092439.79904-1-stevewholikesthings@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 8BitDo Pro 2 Wired Controller for Xbox is already matched by the
vendor-wide XPAD_XBOXONE_VENDOR(0x2dc8) entry, but a later hardware
revision reports product ID 0x201e, which has no entry in the
xpad_device table. The device therefore binds and functions but is
exposed to userspace as "Generic X-Box pad".

Add the VID/PID pair so the controller is named correctly.

Signed-off-by: Bihaan Sen <stevewholikesthings@gmail.com>
---
 drivers/input/joystick/xpad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index feb8f368f834..e7af88bfb8da 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -371,6 +371,7 @@ static const struct xpad_device {
 	{ 0x294b, 0x3404, "Snakebyte GAMEPAD RGB X", 0, XTYPE_XBOXONE },
 	{ 0x2993, 0x2001, "TECNO Pocket Go", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x2000, "8BitDo Pro 2 Wired Controller fox Xbox", 0, XTYPE_XBOXONE },
+	{ 0x2dc8, 0x201e, "8BitDo Pro 2 Wired Controller for Xbox", 0, XTYPE_XBOXONE },
 	{ 0x2dc8, 0x200f, "8BitDo Ultimate 3-mode Controller for Xbox", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
 	{ 0x2dc8, 0x3106, "8BitDo Ultimate Wireless / Pro 2 Wired Controller", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x3109, "8BitDo Ultimate Wireless Bluetooth", 0, XTYPE_XBOX360 },
-- 
2.55.0

