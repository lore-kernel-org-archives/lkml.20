Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894552;
	b=eFsTEstmLgEUW2NaFOglq0UmTDL1QuiGr67n8D5cNoSUkuvK+aOA4gDWdz9pigbFMK3X
	 s1444HG9v44lxQLGoCEvS8lUXL0aFflv+hOdjlB/LP1dNDDa93xLKTcgdEA9yZdccK3AW
	 l9/UbHSUhqpM1ujOI/A3LuvNUhPuOO13dl3yOIkXUR9NDVcIAyigJ3tHz2Nt376yZ66DN
	 VSxCvS1E7GCg9pcU7sO83ghDh40ShnMXnG1+DZiTEVbwJYuIWs0alx2NzsJJ/BlqJDVKO
	 fu+6bBga5Fw8m4Gd/yZ8AQMmMgMIB9EC2fw0NIUQiiVDLd92zNFCokVltjQJdAJmf/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=lEpyyp3Nh2lMfQuU5TyDvWhNl/GQMG+KamM310H/GGU=;
	b=Z9K3xGlcFMnru3cXW7MPjK0Fg2vEL9/SOUPtqBDTatDM9W2Ih4aKUH+ZJ7OrUrkhZjlS
	 iumu60t1H9uD9HiEijyTeoyV1Q/qSZ7uB3l+XKsMsjDIKrQlIdC8jVc0TbhqVFIkNCngH
	 CJQJY4GDnGBHgv7HczL2QrppmuGh/aj+uFOwn++SLQrGdGUHc2r51cBJnvOTF/OKnY2qB
	 kvKThvHLWhGtd2jtOjIiXXeH4GsSUWQruXTGdrxNwtY5+p5n0LYZ2ZWuqzZ3h+1iQkV4J
	 1sf8eB6sS4bz2+/0ACk5XsyhlrJRcKhFLz1094L1/+kJ86D5b4G7d3hFA/9sANgsAsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gH7Sh0gR;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56086070794
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D56086070794
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gH7Sh0gR
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a3c08d6928so3035228c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793894551; x=1794499351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lEpyyp3Nh2lMfQuU5TyDvWhNl/GQMG+KamM310H/GGU=;
        b=gH7Sh0gRaGfLw8Ky8OZtzEnWNrQJsN4tGHcUt4pViK15ULx+i4cv66rQ/bPaNwjRmC
         HjTin+z/heJEuVMWK5BIX/gxkiSDxLQ02Ub2+/467o6vWA1mQT4TmZqG9FS1BFmNb3/y
         hqvT3TXxHB4KcXf5IZ6KN3/DmWIiDVjelt1uUZdriViKVQjbTWjKeyAjkTCusy1QpW1Z
         1yLwliRZPJQTywXXWdlaa6DP+Rw+pUVL0vpHRGNW2SVZpKNUxLdGOqQODzReOmRAb1y+
         x3p+1w0FixdLzi/htremDyYbPYtlNTBAk1SDiW8uquW2/Ar8a2PzfahXxKNukHKqqG+P
         VDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894551; x=1794499351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lEpyyp3Nh2lMfQuU5TyDvWhNl/GQMG+KamM310H/GGU=;
        b=PaKuU5Hv7r0SnvJ5ToLDv5zMXWpDnz6nSUV43kTHMwPBGUNvY9O9oi0lMDM49sKW+B
         pGarD0ipNUtX0srMuakZHb697BAE/fAN4wNrNVtBCWCvaWMIWQ4Z2eFc/hC1fSEd6SDe
         U3GCW2IeVJh8DeNrOR6QQ5ArTDbcfjRhZ3YKVAVbbB3ATGT0oukglFSFQ73h9pNjg3gb
         oXvvOfPCX3f9ukXujxovZ5z7RflXEXY60cGUu3+V9cM0txunMGXwbPpUTW3opYNOSHl9
         3W0pZI1Ub3N0bf88qVe8U4uIVB83zfa2t/QRFvZ8twsTW16Of/S8EpRcyxtHnyFAKcma
         ZkuA==
X-Gm-Message-State: APuU4Z95MzZdswR/ytneynmXnxV1AL1+OgSU6wj+Vdmik9Ss731/deiQ
	NapLa25zsI6h1umvdKMS56m7zdc1RGIhKXY0MtOJ37++cEw3/hjwJX8d6DvZUA==
X-Gm-Gg: AYBFou0l+su+rNevIi9p4sNoVoM/SkK64DyBZzKoLlpatDUHV+PEFdpDd9v8/+Lelha
	O+2fnxnXDMnw3SOYeLxF1ttGqLlaKyBwfT83uqJgDAkMcM8qEw7IG+keHi51zqswz8TOcd1utkd
	ZecVNHKiJtc13VO7V8EiY5rCAL0lCIFTmU75fBPHY/fb/AXf+TK1LN1djZxPpmqLzMHBoTURi1v
	QJROJKbd4kJ3cFAtiiYcQlTUvdeUWxq/TvR01gquunwH8fmM0/hGbbXG0CtOjUg10QOf8GRrFp6
	jxbXvsF4Eh+d2JHuSz248vtTHTdu095aClpR57AAKZu/IzkhBNKuRvMGU+hBvASjUnUvrIQ+OB7
	+KevNqIm4Lvq9mnelCOAnW/nxGDDjPUWp2NiKtAGZZ/avWR3+mcsV6GqHI0149k9e4xm023+/zN
	ZiD5Buhj/Kdt8o2oqDyBPLlb9HSWS3tOn/ILc318dRuiGPdQlYy33wW4K3sizomhX4Gf/WI0gbg
	fhs8u/DTQD3zqOjqhl5To9QAR7tlIT8971RC4+HzpeXFOL6cKVHcr2UErbiaJgoGJvvzsc6zkIg
	rT3O6w3u8URbQU5ceO9D8seYDaQYOfr1VnlD4DlnQshQbwtS8cgt
X-Received: by 2002:a05:7023:904:b0:168:3243:c907 with SMTP id a92af1059eb24-1ad85de518fmr33710895c88.24.1793894550537;
        Thu, 05 Nov 2026 08:02:30 -0800 (PST)
Received: from ubuntu ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c2de58sm16414126c88.12.2026.11.05.08.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:02:30 -0800 (PST)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Akinobu Mita <akinobu.mita@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] fault-inject: fix boot failure with fault injection boot parameters
Date: Fri,  6 Nov 2026 01:01:58 +0900
Message-ID: <20261105160209.1504867-1-ekffu200098@gmail.com>
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

Since commit e9bc360b105c ("fault-inject: use prandom where
cryptographically secure randomness is not needed"), setup_fault_attr()
calls prandom_init_once(), which calls kmalloc() and schedule_work().

But setup_fault_attr() can be called from __setup handlers before slab
and workqueues are initialized, so any fault injection boot parameter
leads to boot failure.

So use DO_ONCE_LITE() instead.

Fixes: e9bc360b105c ("fault-inject: use prandom where cryptographically secure randomness is not needed")
Cc: stable@vger.kernel.org
Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
QEMU-based test results
- build with gcc 16.2 + x86_64, booted with "failslab=1,0,-1,0"

1) AS-IS (before fix) 
[    0.090415] BUG: kernel NULL pointer dereference, address: 0000000000000018
[    0.091661] #PF: supervisor read access in kernel mode
[    0.092639] #PF: error_code(0x0000) - not-present page
[    0.093593] PGD 0 P4D 0 
[    0.094051] Oops: Oops: 0000 [#1] SMP NOPTI
[    0.094800] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 7.3.0 #2 PREEMPT(undef) 
[    0.096178] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[    0.098046] RIP: 0010:__kmalloc_cache_noprof+0x142/0x370
[    0.099024] Code: ea c1 ea 08 41 89 d5 41 83 e5 01 8b 53 1c 0f 1f 44 00 00 45 84 ed 74 12 4d 85 d2 74 0d 4c 89 d7 31 f6 e8 e1 2d e1 00 49 89 c2 <44> 8b 43 18 48 8b 74 24 50 0f 1fb
[    0.102388] RSP: 0000:ffffffff82c03d50 EFLAGS: 00010046
[    0.103326] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
[    0.104604] RDX: 0000000000000001 RSI: 0000000000000020 RDI: 0000000000000000
[    0.105883] RBP: 0000000000000820 R08: ffff88807dda6c70 R09: 46ad46184e3f2c64
[    0.107194] R10: 0000000000000000 R11: 46ad46184e3f2c64 R12: 0000000000000030
[    0.108472] R13: 0000000000000001 R14: 0000000000000008 R15: ffff88807ffd3ab1
[    0.109832] FS:  0000000000000000(0000) GS:ffff8880fa4ac000(0000) knlGS:0000000000000000
[    0.111284] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.112311] CR2: 0000000000000018 CR3: 0000000002c30000 CR4: 00000000000000b0
[    0.113616] Call Trace:
[    0.114059]  <TASK>
[    0.114462]  ? once_disable_jump+0x20/0x80
[    0.115202]  once_disable_jump+0x20/0x80
[    0.115905]  setup_fault_attr+0xe6/0xf0
[    0.116597]  unknown_bootoption+0x111/0x210
[    0.117352]  parse_args+0x14f/0x3c0
[    0.117983]  ? __pfx_unknown_bootoption+0x10/0x10
[    0.118839]  start_kernel+0x3b8/0x7c0
[    0.119539]  ? __pfx_unknown_bootoption+0x10/0x10
[    0.120435]  x86_64_start_reservations+0x24/0x30
[    0.121310]  x86_64_start_kernel+0xd1/0xe0
[    0.122278]  common_startup_64+0x13e/0x158
[    0.124133]  </TASK>
[    0.124756] Modules linked in:
[    0.125309] CR2: 0000000000000018
[    0.125905] ---[ end trace 0000000000000000 ]---
[    0.126741] RIP: 0010:__kmalloc_cache_noprof+0x142/0x370
[    0.127704] Code: ea c1 ea 08 41 89 d5 41 83 e5 01 8b 53 1c 0f 1f 44 00 00 45 84 ed 74 12 4d 85 d2 74 0d 4c 89 d7 31 f6 e8 e1 2d e1 00 49 89 c2 <44> 8b 43 18 48 8b 74 24 50 0f 1fb
[    0.131129] RSP: 0000:ffffffff82c03d50 EFLAGS: 00010046
[    0.132126] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
[    0.133483] RDX: 0000000000000001 RSI: 0000000000000020 RDI: 0000000000000000
[    0.134843] RBP: 0000000000000820 R08: ffff88807dda6c70 R09: 46ad46184e3f2c64
[    0.136206] R10: 0000000000000000 R11: 46ad46184e3f2c64 R12: 0000000000000030
[    0.137565] R13: 0000000000000001 R14: 0000000000000008 R15: ffff88807ffd3ab1
[    0.138928] FS:  0000000000000000(0000) GS:ffff8880fa4ac000(0000) knlGS:0000000000000000
[    0.142705] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.143741] CR2: 0000000000000018 CR3: 0000000002c30000 CR4: 00000000000000b0
[    0.145037] Kernel panic - not syncing: Attempted to kill the idle task!
[    0.146284] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---2) TO-BE (after fix)

2) TO-BE (after fix)
- boot succeeded

---
 lib/fault-inject.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/fault-inject.c b/lib/fault-inject.c
index 02916ef2761c..9182d457baf5 100644
--- a/lib/fault-inject.c
+++ b/lib/fault-inject.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/once_lite.h>
 #include <linux/prandom.h>
 #include <linux/debugfs.h>
 #include <linux/sched.h>
@@ -50,7 +51,12 @@ int setup_fault_attr(struct fault_attr *attr, char *str)
 		return 0;
 	}
 
-	prandom_init_once(&fault_rnd_state);
+	/*
+	 * __setup handlers run before slab and workqueues are initialized,
+	 * but prandom_init_once() calls kmalloc() and schedule_work(). So use
+	 * DO_ONCE_LITE() instead.
+	 */
+	DO_ONCE_LITE(prandom_seed_full_state, &fault_rnd_state);
 
 	attr->probability = probability;
 	attr->interval = interval;

base-commit: c2366a2edc886a5a02d2a43de8b1c6ec09bab840
-- 
2.53.0

