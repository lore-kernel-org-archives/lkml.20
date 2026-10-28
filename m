Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793230228;
	b=y9R0bL2JBF32vqpBlNbPFJ/uFHz4rCb2bp3wEJWYf7pwrHpf+OdMBWyInxWgBiBtSMcn
	 A/M+Xf1Ejbs4pXfkADJJL/d69c130TbVUfADFWM3MjvsUrjHGInl4eHsXErhicoXcH90l
	 NSg18FbC9HUEXB8L2oNRVEeOra0PXqrpLWXW7Z1a/CQjAUjntiz2bcMXs7tmMDEnjpQDW
	 iCia037dkJ3HdEGS0xilnuFJfwvPPyA5PmR2w8nItIOWBEANcg3YKNZttWSYxr4nDGxVU
	 d2QV7i6zFjenFnuaQwab5oLM1JYGU/0sWGfydOMB3HznIOAX/hu5MFa+HirblCnpoSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793230228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ib1ZcMXput/XpyZyTI5HHPBrtgceutvMQD9cp5NCdq4=;
	b=XdaWL8o+bHwG3UHcLBx4nZKvMCdkqGqBix07YSgY3UqN9Ookk0x8OcaDqCXtDYuGRwb4
	 i/1CgxpXf8zGocTrDjzkp0n47tp+HQYreADnxkC2JTfwNJo8ZVhiSmAf9uGN9YrK8kZLY
	 g/7TEgWfSyM73IJWeFqKTONxiBc+m+8jhWTQ/qNLefy8mhVLZlO9hvMfeyFwkEpIkaWAP
	 Btj/fBRphli+IyYsYbYFhdX7ryHn0IKODkZuIXeD4/cJeuPG2Kkl5MVOZXqlsRZeTQLfq
	 zy0QAN+TBjBkSxrp7XvuUYCu7X61EexygzLlmJdB3gucC4KMGN3ecvKdDIWFq/v1b4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yXeG5uCB;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA11606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BA11606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yXeG5uCB
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so17072165e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793230226; x=1793835026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ib1ZcMXput/XpyZyTI5HHPBrtgceutvMQD9cp5NCdq4=;
        b=yXeG5uCB6sRZpQ2nDhZmmvZoTKhj5pO47nqFEZiDlbytbYjS9u+1wOMClNnQj/KXqL
         VqpsowpPLsBhEKCL43lXCPjDwvz++paymk5nlmN9tVh2NnR6ycgGqOApYNM8vFzGXgYM
         32GbVKxb1l4OGk39LtgVvrTUL7BUSTzVwM4HnhqaiYk2hvqEKdzQohDzx/DAxLcUX9rg
         h8ndPczKO97NdhB1/ab1GrPSlIT6p6fzTkWSjrOHdgcfC1Ksoadz/MNyVK7gp7j4iH6u
         DN51abFnRVezKisb/kjx/R50K2gfYbBUvE22laYeCMDzM6c96kuhTCYR8Y2WEqXlKXgG
         P7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793230226; x=1793835026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ib1ZcMXput/XpyZyTI5HHPBrtgceutvMQD9cp5NCdq4=;
        b=sHNhV2ias1jNV1ci9+nfHV39uDmRmoHfRq9TgQ1vy25u5Lf/GDkMhV9TaHFwzd54oe
         aDBOEaT8mKBQqn3s4JaI4iJHiSDDieb/CNuJwcoU6F36rq8MJIaWT1X5/F/lUWUVA9To
         iOU7BGGVGfLodAKlo4/zFqI0kQPmpGk65PqTLAIfChwX87S5AXefWb8OUxaIx5qzQ2TA
         hOY6FR30WkBWyzDqUx9PSVE36RCS/isuBWq9+g/AsUSqaoWoO8KFlxAS/l79wTEBV26P
         QmM326ugvYoJA+AXyKbvZ+kVU00jsKucbunDEKKiLmqTpb8zRu43x4dgicV9egDIX60h
         uHfg==
X-Forwarded-Encrypted: i=1; AKwUvBzY57hjXgaO74RePpCrDSsFPGGU7iBqRSU9gpGa1irbGUfnvBNYvIgK8bIVVnQ1L1KmEIxxYnREP74XsAo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLO3lKSTXMsJuVZId1Oy+SNwop/6qPk5r+Uuzm61O/cmEfSpgeX
	WL/3+N7eONuLXjXZPCHIohWs7pmmTIbG5oQkLD4VazpLMARh2z3pal9P
X-Gm-Gg: AYBFou1KyzzaM2pIFKFlzetAWzmWwdDF3Y5qrLQ3sD1Ou69PWrTnmnpoI/KWxlb6Tl+
	Fk1PgYDB1XeDNqbD4UC6L5L4c69JPR5KfEDZIf5G+MfEKeJpGHciGkc85aX3T3jDkE/Wc51pnmk
	C59aGSYiQH5TEl9geQtP94iB1Ll4UhNyA5POykqw9bCU2ulIXoBkmMTVCxrqG7db/LqkcJXTLnC
	/73Y1FIChZMl6sXhUwHa8ahd8E6BB28zZcfi24qTp1Q2kvZC2H7MfVw93yitAZ4+SG+a+x9Ota1
	QA0sDFiQiswW1GryV4r5ApER+DfF3VqyOkzREp3IENDXS+rKZFE8NOGbH15XvjWXX7PBuJZ5vqX
	2zkLCm0Fr98XNW72WINfEZFBOMX3738WEgpwBy/cVCYLgWVWbMbZrG67iSopcunGPOwo6PTaeeF
	MMFXZAsj97FvUs2yEuwU/j6tvKwcVl8oAyxU4S6Sm/VzJejEX62Lkl8WZ8/1vqt83pV/sCTjt+5
	34KhSNR7Ck22R2DcxgDZytu/Wd5ks7+Aym3TPAGvpFMDzotCJbYxinG7lthwY/fX0YplcYDu+/p
	w12w9lpG9jZGJt7u099f
X-Received: by 2002:a05:600c:a48:b0:4a2:1196:db0e with SMTP id 5b1f17b1804b1-4a9678c010dmr83851295e9.30.1793230225943;
        Wed, 28 Oct 2026 16:30:25 -0700 (PDT)
Received: from cachyos ([205.147.29.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a92e104d8csm48192785e9.0.2026.10.28.16.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 16:30:24 -0700 (PDT)
From: Viktor Sharha <vsharha07@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Viktor Sharha <vsharha07@gmail.com>
Subject: [PATCH] HID: quirks: add ALWAYS_POLL quirk for Keychron Link receiver
Date: Wed, 28 Oct 2026 23:29:45 +0000
Message-ID: <20261028232945.20169-1-vsharha07@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The Keychron Link 2.4 GHz receiver (3434:d030) exposes a joystick on an
interface of its own. Keychron's Hall-effect keyboards, such as the
K4 HE, send a burst of joystick reports on that interface every time
the user switches actuation profile, even when no profile uses the
joystick.

Desktop environments do not open joystick devices, so usbhid does not
poll that interface and the reports are never read. The receiver then
stops delivering keyboard input on its other interfaces until the host
re-enumerates it or the keyboard is switched to wired mode and back. A
key held during the switch also keeps auto-repeating, because its
release never arrives.

Holding the joystick device open, or booting with
usbhid.quirks=0x3434:0xd030:0x00000400, avoids the problem. Windows is
not affected, as it polls every HID interface.

Link: https://github.com/Keychron/qmk_firmware/issues/532
Signed-off-by: Viktor Sharha <vsharha07@gmail.com>
---
 drivers/hid/hid-ids.h    | 3 +++
 drivers/hid/hid-quirks.c | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 91319aa65..856181478 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -802,6 +802,9 @@
 #define USB_VENDOR_ID_KENSINGTON	0x047d
 #define USB_DEVICE_ID_KS_SLIMBLADE	0x2041
 
+#define USB_VENDOR_ID_KEYCHRON		0x3434
+#define USB_DEVICE_ID_KEYCHRON_LINK	0xd030
+
 #define USB_VENDOR_ID_KWORLD		0x1b80
 #define USB_DEVICE_ID_KWORLD_RADIO_FM700	0xd700
 
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 793db001a..d56516aad 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -116,6 +116,8 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_INNOMEDIA, USB_DEVICE_ID_INNEX_GENESIS_ATARI), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_JESS, USB_DEVICE_ID_AULA_MINI_60_HE_PRO),
 		HID_QUIRK_ALWAYS_POLL },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_KEYCHRON, USB_DEVICE_ID_KEYCHRON_LINK),
+		HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_PIXART_USB_OPTICAL_MOUSE_ID2), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_EASYPEN_M406), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_EASYPEN_M506), HID_QUIRK_MULTI_INPUT },
-- 
2.56.0

