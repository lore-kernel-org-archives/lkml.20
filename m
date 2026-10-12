Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1511B4A4850
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819768; cv=none; b=XKO9ie95hw8O7hDMCNvelAb3lozw1Tx9iyuUNROV0T6v7WrfHzLZaRBqsFrwFLC1GgYdM6fbfbhlZJ9y5w081nHbk1oQdIb4/SP8+qROT2u0AyXiMZW4LTeQBvatFoHVuuJn1tTlEE5SLwuUXZWbUYkSFh33YGfjhhu+2CSYkwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819768; c=relaxed/simple;
	bh=M9dpQi4tgba0alF8ToireGxXNWyOZbiXHyjQLcZzwDE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JptmkiPsLNUsPs9X/sgSuqA3d4PiZR6uQO37YbO+IZXZxxKorMIoGNpTb2aLzLbzcpsFFKbTOOb4tLxGlSaEgt6qET3SEU7wtTjqhbAM0iFU4UspzRz0RJi/MJFUuIfc6Ar1DeWbdVmfDYB1ZeEN/6lDSogh1lJSELr37kNAPqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVpcPjgW; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVpcPjgW"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3a7fecf8440so965804a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791819766; x=1792424566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u/2jqcJ/ml0TlpXSlqx8y6UB+yt84Zsc+jol0ebsN+s=;
        b=UVpcPjgWho+0O5cr65op1QK+LT8ao/hnHs6SUxzeXYUO+Y+46PC6HV1DoNNCoUA2DQ
         TCg/Iax8cdkgF9fTYMsNzZNWrseGHuNSTZ3REAaEKS+KBhcTNA5iX5ga2sX62foVzUUV
         Wwv7HcWUHT7JHEf0/aIppOz1wrVCui/MtWvWh9C94INhnnk3Y5XYFMqhHQ3ucWEKVUiq
         GX5/nz1LG9vVbv0sOFATzYLufQQhdF1Jt8y1ThmDgomlSGJ88HMVXV3qAyeQt8g5ZcX2
         F4PkjLPj3/ArWxXp19euDw0eX58pZ11tGczyd4HjH5V+PlBQMxAZLTFiMao7mhMzCTQw
         /7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819766; x=1792424566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u/2jqcJ/ml0TlpXSlqx8y6UB+yt84Zsc+jol0ebsN+s=;
        b=2DdkztCPa4dfGyQYTHdma/Bo8fYeYXTlHQk4jgmRkB8vKWI7u6/1ulZTC9xpwPXA1T
         6tk3UhGGcdebaI7RD3sbVrhUj/GeWvCHz5UMHdDY4LhYsaVkCbfdQROPFMjswUwqZw3v
         0fSbWVgLJoKN79LNpFKEleEsghDSWDUKg8jOUcaIKXNQ1pXCqDh5BLZm0goROEj1PmZg
         8Ue8WBw4A1EhNx80DTg0gi9alAJgxlNDKTzYFNRlN1VTs3J+QsdIDCwlxCixipwb8XH8
         RDYezgmqjb23BqTRf3kwmVFaBmgwmUTys343VbRewbmKsnDgampNU+VogOf+aKMej0QO
         TsXg==
X-Forwarded-Encrypted: i=1; AKwUvBz1/osG+Q0WC347NS/eWWc8wKphK+lOJ5HjNWsc9+mAOhntVAUWasaxitb6v035KKdaIBl82m8bGIDW9DY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuLRPw2PjBWZzZGb3glovd6TkXd6YAB8VrSQXGqH/yoiOJ7cK4
	CitCF9qWs2+Xg58PzAhKMEUOxOSfztSOqkP6zpBgk5mC5IZkffes5OPz
X-Gm-Gg: AYBFou2pQK4/naDixiJjij22ee5sf8M09OIj7AG1uVkGC9O3DrCPK4hWORgw9RUyIxp
	QN/uU2/rGCeKQ3TnJWz05GElQoZhccXkSgLPXHyyT0L/02sFHGskJlePlqnnCpwN7h+KVMQ2WjY
	O/lDRQFmuKNiv1tFCBYPzw6/FnA0rPlje9XaFuBnIk1ZdTDrzBKkLCBsTs9WuuO9CVViYq4baAo
	YXb2GvHtg01GdVUZ9Yv1aMkybKzZ9Pw0k0EniPVnEKhdRitP3BsMrKCjgdcA7nCt0lu+BbhUhYz
	hUffA1m8/v0AURnI2+4E0x8HEG1ULnScK0x1MsVaFqVP9kXNt6d/d4ZdL2iNCFV7aS/vI1Aiiwu
	JnbOXLVUjHg8deM2nsz1CfGS92xR7vi6hg0HEXpeX224RGn6Id+RNQWTfcA+6ttzoeAsSaYR7sm
	+yP2gjhVnt73cJQeVsFOmRKSszbXK41uww9KazHcv2oOgEuuQflkeUHsUtEaU8WIZCwQ2NvrOZ+
	78E111CKdNOmqwk
X-Received: by 2002:a17:90b:1d03:b0:3a5:de8:2c4f with SMTP id 98e67ed59e1d1-3ab3b04c2d0mr6638993a91.65.1791819766331;
        Mon, 12 Oct 2026 08:42:46 -0700 (PDT)
Received: from ROGZephyrusG16Air ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36f46dfesm17098384a91.8.2026.10.12.08.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 08:42:45 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: linux-input@vger.kernel.org
Cc: jikos@kernel.org,
	bentiss@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: add ALWAYS_POLL quirk for YJX-CHIP EWEADN wireless receivers
Date: Mon, 12 Oct 2026 23:42:40 +0800
Message-ID: <20261012154240.33221-1-nbg2974@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 2.4 GHz receiver in EWEADN G5 wireless mice (YJX-CHIP A8A5:2255)
presents its mouse data on a standard interrupt IN endpoint. usbhid
only submits read URBs for an input device while a userspace consumer
holds it open, so on boot or replug the mouse pointer stays dead until
something opens the node.

The same receiver ships with a number of other EWEADN models (A6, A7,
E7, E9, E11, G2SE A, GS02 Pro, S7, S9SE, X23), so the quirk covers
the whole family.

Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Liang Haowen <nbg2974@gmail.com>
---
 drivers/hid/hid-ids.h    | 3 +++
 drivers/hid/hid-quirks.c | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index cb7f16d..1ccdfa5 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1633,6 +1633,9 @@
 #define USB_VENDOR_ID_YEALINK		0x6993
 #define USB_DEVICE_ID_YEALINK_P1K_P4K_B2K	0xb001
 
+#define USB_VENDOR_ID_YJXCHIP		0xa8a5
+#define USB_DEVICE_ID_YJXCHIP_MOUSE	0x2255
+
 #define USB_VENDOR_ID_ZEROPLUS		0x0c12
 
 #define USB_VENDOR_ID_ZYDACRON	0x13EC
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 96a36c5..92bd84e 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -222,6 +222,8 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_WISEGROUP_LTD2, USB_DEVICE_ID_SMARTJOY_DUAL_PLUS), HID_QUIRK_NOGET | HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_WISEGROUP, USB_DEVICE_ID_QUAD_USB_JOYPAD), HID_QUIRK_NOGET | HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_XIN_MO, USB_DEVICE_ID_XIN_MO_DUAL_ARCADE), HID_QUIRK_MULTI_INPUT },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_YJXCHIP, USB_DEVICE_ID_YJXCHIP_MOUSE),
+		HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_GROUP_AUDIO), HID_QUIRK_NOGET },
 
 	{ 0 }
-- 
2.55.0

