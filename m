Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68EF1A6820
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 05:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792215197; cv=none; b=Jwi+3LYji+ViXX7Zv3hW/S4KJZYq9CaAvcFNYyT5Kj2ErJ3Tty0KTQ7lRriTpmxD0OLV5DM/4fv7orlgzPAmDi9XMSL2fWbrkCxhnVAcwwLb60TRWYQ7BL8gtNzSEwjod9HyQM7R7As5y5mT2lFPD2gscI99s2MxGInDOaAgQCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792215197; c=relaxed/simple;
	bh=33TYKDzHD2rggUr45Wt4u+YeRQ6ZvxWnoSICEHDivpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qf4+pMdKsmRuY20FLeXU3O+Bsdm2t4PKrZGUpRUC9Dj5gR5cxxWm7LDtU9iIhziW8kzLTBkk4otvGmEVHNba/GSDgby522hPoAg0PE9GKMIx6K108sT7lT2aUL1jAAayu9GlqSSsSt324088vnvGSN4aOdhUYPD1NdfD9wKII/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EIkM7vBn; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EIkM7vBn"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-16ad92569b5so535825c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792215195; x=1792819995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lr8NPS0Zpuk7i4YZHvQ6XKBJuI1y1yFtaeXA00kTa0o=;
        b=EIkM7vBnoh02tZNQTnekfmj0GoJzNbfXjbIUfcMzoSy+KsBNpvP0k8dqVymM3E8oAf
         MK66vS1NpH4XaEvaOC4co7zppWCvd59Z8RFgJU+HzZGWIbaGHaN6xJ8kdh21ZolmkvRc
         IIInE/vLQ1mF9iCWrpQf8bc47d7187hUxjAIRCPhIQy1S5JhvPbfZnkvM2ZD3ZOKhmjJ
         czIwVPQQRMkDyKE0l5/pFiezRy+ot1rjnAI1HyY9YXeH/slx1ZB8THPPBF6Gz7AQc93a
         riJgRogIbS0donp4tJuJ7KfcXtUhvajf6MModfa3cGGy81sn/cWfPr9wXHU/l8ukNKaw
         p5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792215195; x=1792819995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lr8NPS0Zpuk7i4YZHvQ6XKBJuI1y1yFtaeXA00kTa0o=;
        b=2wZDGgBs2ieuqsBsLfbXeRHremh9N2iPy1JNz0lxFQyaIkYl3x6s6da9lcmTzrF7Py
         FEaZgDFv8z03supQhiBwEX/ykky9SStOlmuuVmUQl11DOw53KMYmWlZTjSUVJMEzJ3vN
         CyescVQtNrOfcAwc/iB+gFKRM4JwwNRn81eP5UX6ij738jUYY/oMBol4MHf4K7fJ7uEp
         tWromBiSD+J2nHc9FzVVsPp3yfYpzPrrqanT+Aalemc4HHnE+MWFq8v4ZsukyDMspBj9
         1Iz5L4mjIP48D5FjasnqEHovVjVkxgbPi4MPFAoofBDgZ0Gad9wluoow5pd/4+MojwPP
         /HNA==
X-Forwarded-Encrypted: i=1; AKwUvBwo+/KJrgFSGsDzWTo4srD6Q6OKs47R9CpUlQkOnBFRjVHbB2ombQGtDx3jUCbGLZzYwwVQpZ350yowX18=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+XEb5XItS4jDXrel8of+XqtxTdG5+/0u7lmIeibuVwFLan4Im
	CeNe/1/ImLJWjyxIRKYy61A9G3O/5cPoAbnUKX3IjA22bqxyfi+sZsji
X-Gm-Gg: AYBFou0+xyVfT3E4iU+e3XyNq4WjwEx+ewkuN4H6pjehhtoxRURMNBr0jQ5lpiKteGc
	E2OW9Wd1Uen7mIPgQpmOLNrQHNQ9fPpkyVqqW8fF4Ote1Bl9CTpMqI3+vFl9cg2cfjv4DpLCBe7
	4i8aUKrvyFv65892pd+VBt/+XSkXw64eXl2seaK6lo0HU2OpA4lyZkgjLuIHsKcQ39/+s3Mj7xf
	x7S4fSsPjSLL09WU7rGf1eMEJFcwFs088LWHeIwmIAV/kSde2wNkanW3cpsu593/wh1r1Yuis3+
	x/4xYXhGhSKg01OF7bZsU25kWZ00bjbLWTgEcFr45jNxkM3gwQ0fdFy8hRXx2PC0OL+xPOklX6+
	0uBLuHWgfAzQ5ODiOMfBuP9wnNQKaY2jMctP4fk/Ux7I7j20EXLuqYICODDyybNLAXq5FILblHr
	jJ5Y1To0FJXWiYCFqLw/IQmo7DzZ5QKQBvyvQfB62az2br6eDFYtIsGp76FeKhsX/8PqhKzHXG0
	jKbCytz
X-Received: by 2002:a05:701b:2601:b0:151:f0c5:7a09 with SMTP id a92af1059eb24-18513b99fd0mr3090280c88.43.1792215194486;
        Fri, 16 Oct 2026 22:33:14 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac1:7ac0:50::247:2e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b37ce3fsm9220827c88.14.2026.10.16.22.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 22:33:14 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+788733b16e87faa63deb@syzkaller.appspotmail.com,
	stable@vger.kernel.org,
	matheus.aalmeida@inf.ufrgs.br,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: [PATCH] Input: ff-core - clear flush and event hooks in input_ff_destroy()
Date: Sat, 17 Oct 2026 12:33:09 +0700
Message-ID: <20261017053309.136764-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

input_ff_create() installs input_ff_flush() and input_ff_event() in the
input device, but input_ff_destroy() only clears EV_FF and frees dev->ff,
leaving both hooks dangling.

Callers use input_ff_destroy() in their probe error paths, after which
the input device is still registered. Closing an evdev node then reaches
input_flush_device() -> dev->flush() -> input_ff_flush(), which takes
ff->mutex through the now NULL dev->ff:

  Oops: general protection fault, probably for non-canonical address 0xdffffc0000000015
  KASAN: null-ptr-deref in range [0x00000000000000a8-0x00000000000000af]
  RIP: 0010:__mutex_lock+0x149/0x1550
   input_ff_flush+0x5e/0x170 drivers/input/ff-core.c:231
   input_flush_device+0xd6/0x130 drivers/input/input.c:685
   evdev_release+0xda/0x7f0 drivers/input/evdev.c:440

This is reachable with hid-logitech-hidpp, where hidpp_ff_init() calls
input_ff_destroy() when a later allocation fails.

Reset the hooks in input_ff_destroy(), but only if they are still the
ones installed by input_ff_create(), so that a driver-provided handler
is left alone.

Reported-by: syzbot+788733b16e87faa63deb@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=788733b16e87faa63deb
Fixes: 509ca1a93836 ("Input: implement new force feedback interface")
Cc: stable@vger.kernel.org
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Reproduced in QEMU (7.3-rc5, KASAN) with the syzbot raw-gadget reproducer:
GPF in input_ff_flush() on the first evdev close after hidpp_ff_init()
fails past input_ff_create(); with this patch 392 evdev open/close cycles
are clean. (The emulated G920 does not answer every HID++ command, so the
allocation failure was forced with a temporary local hack.)

An alternative is to test EV_FF in input_ff_flush() as in the syzbot test
patch from matheus.aalmeida@inf.ufrgs.br; I prefer fixing the stale hooks
at the source so that flush and event stay consistent.

 drivers/input/ff-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/input/ff-core.c b/drivers/input/ff-core.c
index 0e5d1d1ceb46..086a6ddf2b5f 100644
--- a/drivers/input/ff-core.c
+++ b/drivers/input/ff-core.c
@@ -345,6 +345,10 @@ void input_ff_destroy(struct input_dev *dev)
 	struct ff_device *ff = dev->ff;
 
 	__clear_bit(EV_FF, dev->evbit);
+	if (dev->flush == input_ff_flush)
+		dev->flush = NULL;
+	if (dev->event == input_ff_event)
+		dev->event = NULL;
 	if (ff) {
 		if (ff->destroy)
 			ff->destroy(ff);
-- 
2.43.0

