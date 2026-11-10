Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322980;
	b=4Y6rBqLIqhfUa/PyIczLVFM1C/03cvQqvgIOLe999YLNhQnTUWplKVFxZ9WqR4ohzjg9
	 GCokX71zufs3s86ToW1/f7h7iB7QB6XL1HVqP8ZLJLWa2DnOzCCxTZLR3rFbwI1cGFkRw
	 GY0Pu31wEpl5L4V5KC3p/S+ZkuDLSqcHHs6grSWZ8Cvm2ezE8hqaDh+0dOWqRjdcdxOkJ
	 O6gyM4QJcSSlTKIGE0XxhZON+dItXUVfgOln9KEyvi/jMTiRxhkSXJ6MFCWJ5UzEa7j4f
	 B+Xzs2l5kGL88CnBvF+rl/jnjNAWuNphFuC7R+TgvdxdB1D/lkF8Zf6JR+7KJ2bg8fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q67Hxg+0MYife6GtZIdwoZarR9f9DxzBGDp5ujmu0vc=;
	b=Co2MIdQYxKY5yyAQUeBXqGE+0lr4IxxJ8BE6vkur0gcZg5QFeShfXLC3NhiwIifgc1wC
	 QI5l9MKs+H8wagzpanghneNjv+Cobo/7t5ZIjN8NgqUJDU3qxVsnSFrsptOhbvwxKOX/F
	 DnjLPrdjSX8jikyy7Nv+hf0uxPGTldRb3WInfdXur5IWJhbdlVEoaQkJoq2TytiQzJw0Y
	 1jKLM6nZIrcFcbdYq/mua9PSFDES9kJxXxTMSLQQ0ezKHWexpijLPAUvaFgharTgxLAfq
	 fKRTQXCTQ/bdUcQMLIIxxAMGnSqqoL1C5t8Cihh1xGeIPKGdxLgRNEeWwTlIuotkNKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h1Fnf0wM;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0F7606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD0F7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h1Fnf0wM
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ea7987517aso11907455ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794322979; x=1794927779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q67Hxg+0MYife6GtZIdwoZarR9f9DxzBGDp5ujmu0vc=;
        b=h1Fnf0wMNRbWnbB6jZGwEwGodBchnjkok98JgdLi+EkdpSYbn4x0Vyzjl//fmrqfUT
         JPHUQv0ombEfOtPoz49uAozdoZeNJNUn8ELEstiT1kmHu8eWhDh4SS2BFXaqBLHtqC1F
         ws7yhN5JNShhW04yKjp/CFQcFaENKBOPx3NVt9aGEhvQGZKH5t6l3l/QscAzzWHmol6W
         5U7iHFYtcB6+Yb0Arvz+2zWM6/v+d3Bcaa+4VpV10MYcQLtwM9aLIyvWEh6NZwuJheNr
         eicvEroNSJ8nl/dVvTxaqglFvnIqAgGAeyOtYvGm+OIqZC0oHm01Gduff6uKT/WKud2a
         D2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794322979; x=1794927779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q67Hxg+0MYife6GtZIdwoZarR9f9DxzBGDp5ujmu0vc=;
        b=HeIBlmZKO+tEYtuqyuZZh7EoZQ59FHny6bXUp14X1FlbGEdm2I2NflsWtbE9SuYUhu
         t8D7zp8mBaL/LLq+vtj/g3vzyMLWW3QyiI8zM9XH8bKBemYTfv98fpcgUNVyCc2ITOmZ
         QFaqgLRu3mOIlkBURsKAE+K9ohYRedDr1yBs3QWAKJ/8IDXNaR+bO1D0serQtBfuI+mW
         DYdwAfHtyUAjhGNL3WpwyK6eUBHGB2/3Lxd4bAP4oJbWMaJyRpSfTwlQrJLOJ1EafCGx
         O8PNwfPGLY3k+YWF5tmvaAe5a3Ewp92xprWOFW+PFFkO9T00i8CTif5pTIZBtvE2WhN8
         0lPg==
X-Forwarded-Encrypted: i=1; AL+hErEgrI/kVMRlJuKyS+cWWZgA++7RCBIAvzHLrHt2k1K3I369g6yozf0DOQw06JhIddoQJWC57CyZNYUTGSo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kJjmGm/6yZRG6xHhCEnzehbwzpcbCxJouenFXyjVgtV4kHcES
	mtgNqfNC19aFOkVTl/Ryp9SXfZ1mdBTUa4h/P1Dw3id/s7S9S2DliBK6
X-Gm-Gg: AYBFou1IBdvL00G8OSmGj6uLvwkzO/oJ4I5FfhLsIOB5G0ze5P8VCgkSMCOLiiUCXLU
	TVvC/I6ZnnN3f5b5jrHT+OKqigZdnsz5dVQNcvYha+q8bGJJ6ouDy17e7pHVT41XEudqfgxArew
	Iowa+AS50GmoboF2cgbYtU7pyTrsjDjDz8ZBuZ4rKP7eKZzGH2PCUfxX3UxztkInVcrpxr3qpSs
	RlXGL3Few8pGhV7J1x46qVG+LzAz2WPQXeCSo3YgHKiq+gXIIEIULJjN9npRVOosLw4X0Hxv47D
	ltFm1v2XsUYU75vmSeflRWQERJ3ksN3IRNcCMRDdfplFOSXKd6gJ3gSuTsCrnkMcezVMwwqSgoy
	Cx7bfbdwFRH1FY3gbcW1/8wsqnRldqCwgdcwImrfcF8gah/E52n4fPg+xzuXhmCaA5sOvEj4BuV
	fGA583DpWpqAQOknNhqtdNWYrETjUNyjSNz/TOV4Eqs15Mzhgqz2nya+29+VfGC6zSioma2Lk4N
	4/SX5yM06xBF+g8+yVrjG9KXrAZgc1I5ggyxAXH93y6tedYbm8XvexeKSIepBPEkKoVW1YZQU0Z
	3pJ1MtWNIufqsg5+ZBj2jfoV7WBrWs5iMoicNIbrSDFCk8aaXj0G
X-Received: by 2002:a17:903:2a87:b0:2e9:8202:509c with SMTP id d9443c01a7336-2edb8f92d42mr26427195ad.7.1794322979043;
        Tue, 10 Nov 2026 07:02:59 -0800 (PST)
Received: from ubuntu ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d9ba8esm10233085ad.44.2026.11.10.07.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:02:58 -0800 (PST)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luis Henriques <luis@igalia.com>,
	Miklos Szeredi <mszeredi@redhat.com>,
	stable@vger.kernel.org
Subject: [PATCH] fuse: defer dentry_tree_work until fuse_dentry_tree_init()
Date: Wed, 11 Nov 2026 00:02:46 +0900
Message-ID: <20261110150250.71520-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.53.0
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

inval_wq_set() schedules dentry_tree_work when inval_wq is enabled.

But inval_wq_set() can be called at boot or module load before
fuse_dentry_tree_init() initializes the work, so __queue_delayed_work()
warns and the work never starts.

So defer scheduling the work until fuse_dentry_tree_init() sets it up.

Fixes: ab84ad597386 ("fuse: new work queue to periodically invalidate expired dentries")
Cc: stable@vger.kernel.org
Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
QEMU based test result
- booted with "fuse.inval_wq=5"

1) AS-IS (before fix)
[    0.011073] Kernel command line: rootwait root=/dev/vda console=tty1 console=ttyS0 nokaslr  fuse.inval_wq=5
[    0.011114] ------------[ cut here ]------------
[    0.011115] WARNING: kernel/workqueue.c:2704 at __queue_delayed_work+0x11a/0x140, CPU#0: swapper/0
[    0.011124] Modules linked in:
[    0.011128] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 7.4.0-rc1-00010-gab9787d7e66a #1 PREEMPT(undef) 
[    0.011130] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[    0.011131] RIP: 0010:__queue_delayed_work+0x11a/0x140
[    0.011133] Code: c4 08 48 89 df 5b e9 85 28 0a 00 90 0f 0b 90 4c 8b 42 08 48 8d 42 08 49 39 c0 0f 84 1c ff ff ff 90 0f 0b 90 e9 13 ff ff ff 90 <0f> 0b 90 e9 ec fe ff ff bff
[    0.011134] RSP: 0000:ffffffff82e03e00 EFLAGS: 00010003 ORIG_RAX: 0000000000000000
[    0.011135] RAX: 0000000000000000 RBX: 0000000000000040 RCX: 0000000000001388
[    0.011136] RDX: ffffffff83a3f320 RSI: 0000000000000000 RDI: 0000000000000040
[    0.011136] RBP: 0000000000000000 R08: 0000000000000082 R09: 0000000000000001
[    0.011136] R10: 000000000000000a R11: 000000000000000a R12: ffffffff82c09fd0
[    0.011137] R13: ffff88807ffcfb89 R14: 0000000000000000 R15: 0000000000001388
[    0.011140] FS:  0000000000000000(0000) GS:ffff8880fa26e000(0000) knlGS:0000000000000000
[    0.011141] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.011141] CR2: ffff888003a67000 CR3: 0000000002e30000 CR4: 00000000000000b0
[    0.011142] Call Trace:
[    0.011143]  <TASK>
[    0.011143]  queue_delayed_work_on+0x6a/0x80
[    0.011145]  inval_wq_set+0xc4/0xe0
[    0.011149]  parse_args+0x299/0x3c0
[    0.011151]  ? __pfx_unknown_bootoption+0x10/0x10
[    0.011154]  start_kernel+0x3b8/0x7c0
[    0.011156]  ? __pfx_unknown_bootoption+0x10/0x10
[    0.011157]  x86_64_start_reservations+0x24/0x30
[    0.011160]  x86_64_start_kernel+0xd1/0xe0
[    0.011162]  common_startup_64+0x13e/0x158
[    0.011165]  </TASK>
[    0.011166] ---[ end trace 0000000000000000 ]---
[    0.011173] ------------[ cut here ]------------

2) TO-BE (after fix)
- no error while booting, and also fuse_dentry_tree_work works well.

---
 fs/fuse/dir.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index da23ccd8685c..6965a77a871f 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -39,6 +39,7 @@ static struct delayed_work dentry_tree_work;
 /* Minimum invalidation work queue frequency */
 #define FUSE_DENTRY_INVAL_FREQ_MIN 5
 
+static bool inval_wq_ready;
 unsigned __read_mostly inval_wq;
 static int inval_wq_set(const char *val, const struct kernel_param *kp)
 {
@@ -62,6 +63,10 @@ static int inval_wq_set(const char *val, const struct kernel_param *kp)
 
 	*((unsigned int *)kp->arg) = num;
 
+	/* Defer the work until fuse_dentry_tree_init() sets it up. */
+	if (!inval_wq_ready)
+		return 0;
+
 	if (num && !old)
 		schedule_delayed_work(&dentry_tree_work,
 				      secs_to_jiffies(num));
@@ -224,6 +229,11 @@ void fuse_dentry_tree_init(void)
 		dentry_hash[i].tree = RB_ROOT;
 	}
 	INIT_DELAYED_WORK(&dentry_tree_work, fuse_dentry_tree_work);
+	inval_wq_ready = true;
+
+	if (inval_wq)
+		schedule_delayed_work(&dentry_tree_work,
+				      secs_to_jiffies(inval_wq));
 }
 
 void fuse_dentry_tree_cleanup(void)

base-commit: ab9787d7e66ac7e6e94fc975b37c5b56fff98ca9
-- 
2.53.0

