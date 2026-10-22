Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670177;
	b=xC9E091Nky9vSDScZQmkJkFc9mVMwkD5Jo1BrabAJXd5jezz4AylJZKmrp0JNUAqr+OK
	 xzaCMzdaVrhfMvR/AG68dOgoPahgBmrI0YeBnw1boHTEFI5qgybDKrf1Oyg+5ueRTOajs
	 u+p/2qmrThRjEcM3dxv5CrKumefgYkmH0soD3QfcX7yu8FnY7tyonazn94OCB9V+zhLZZ
	 kvFd6TNpK87wkQ2Mo4/un3UthM3AQPFIJELoc3CdmJ6b8IAhtro9hazw8sZ+iNresIFiK
	 SucGQyX0RsKQy8flzqza2WoRtWiuIfj43moFHxUvesXTZ7Ej203QlAaflOd8M/tvCDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670177;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=y/Nyw+9tbXHq5h2zJIpH4R0CK2KIZ4P9h67T0HNPyeY=;
	b=WpOOqlXHSK/zr7G/fOnSJGCG0dOmQ+w7lqEFo9yTUexv+K6sDrTOyaQ4DVWDq6RrPVnF
	 gNtec4JJKmwdcGotMngtEqNj0+LZOraHORjpyEoslRR0/m7WtSLBnVBgGiIWxLkEfQUT+
	 eGe9EAO+5L7pftgrXbRM3z6fJDFyCWSjEMFUX6Ma3RGa6Vcj3M9RRn/7hTKI5wlp5T7uk
	 DiiMwj8M3Pr3cvPToLov7CJnU3dy4vCeGDwaOV8grUGQ6CMQo2S7aDSKSU93zwCJG8NZ5
	 SIDKboLOrD5OQRtOGD5EV3KRJs7g3ctbRKtCPf0n0AMiPASetH7y0tayhstL9QwCLQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nFN2i9pb;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647D7606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 647D7606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nFN2i9pb
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so716560a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792670177; x=1793274977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/Nyw+9tbXHq5h2zJIpH4R0CK2KIZ4P9h67T0HNPyeY=;
        b=nFN2i9pbyoII519u3IEY+yKKA55HX2bf7rSs2xK2jJx6QkQktfVyC2PmfwceTwiWMc
         XCg/qgCr0JCbZCU9cnKALn0gPQeZDLjpDSpn0Z8lL9tWVCtL1BmT2ubEdXw0BmhIvdY8
         IDS+aonWM92TIEnNa6rLuSdXJwEBk0A5lX2yUeXkoOpcbKBn6tix3NZaEjKcRQDoQ9R2
         lLIP6TC7GZ0lXkpPD2vGeT9whSFPSOrPfnMtisHDKagFBpnY1eF89wSDCn764SR3LiBS
         jXUjVetRtx2UxVcazSEsIL4BtZ8ba3r4wSZDEY3+DGGWJbgk6vdcXRgTCefGEnwW22GA
         YaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792670177; x=1793274977;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y/Nyw+9tbXHq5h2zJIpH4R0CK2KIZ4P9h67T0HNPyeY=;
        b=vlNEymnyGsnBJmKpIG+U9P98UVoH3Rxrc0okTJ+YdhsU4E+woJa1X6q9IaS4k/wVg/
         VFUpxS0zW9FbMxGKlKqF6h4KTDZkc/GF64HmJKs6CPAVP91QFwmIwC0rlh5toLN9+X9z
         QJQp8JxQ8fVfXgNhzohr2T5HH880pzo9aP3PqLXQj2UyhJ/WsO+O/yGL8bXR6XaDnSgw
         6tCtKE4gq4SY1svqcvDwJErnodm6954b8ieHN04Md2iOgd06wseBk8VGFpGYBCZggKwo
         NQJrDzxQOIO87vVFbFGSxSOXVVWBCim3dKN8MYSw3tnywmTZweLdJc1y2u4qubzPhyvR
         txMw==
X-Forwarded-Encrypted: i=1; AKwUvBybhYRrO7jJxCCK8uP7EUAEbVN5gWgS4+wq8qGd0TtpjLbfOLEIHmr5SWr+v2eNMWYZ/bjZKcDCN30BMl0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5ayeyGUgUqwyr3TGdPyAdSkG4jrTdcz8YlF6MXjBykv4A4BOy
	/qQJ3Vt/O347INj7QbxjXmLZH1foJ+bth/fUauX1M/I4XEtOPQ5xHq9L
X-Gm-Gg: AYBFou3Dk6MjQfBjRz7snRxXwghxV2lDO9CAaT7ObrvuXsp5AtuD+lE1N9RJffxhzzJ
	uF70pep9W65ym7SB0VUr72J7/+/Yuo6/J1oSf9lhfGWPN5wyK9y+UFV4vueZdNkMGd6ScFCqtTm
	MxiJ1anIqafs0RKEIeANrLRHWCFPnaGQlAtwaZvpXYSLfWpPSwyTPyEzE4MgUnD8gZuI5wy18t7
	G7GLkcruWHzOQ2sGZC+dPkXuK074T++qD5XarjL3xYKzWoL2cyg60Zr+ubBZqHuq5y7PgHwAg5n
	uwrHtCg9mNm0VoIPxduLgRvWffGbKuv8nd73GEjzJK74BQSgu4Vt2I5j2uOJjSGkyao2E6j+OTj
	+CeY4af3rqlgR8k/s4/vSZ1qdhkeFMT24PAabx03wjlKzdF1PYsHHEZnDW8zP4LUH3ed5d1QUoc
	tM+lxjEbbG77mMz9odqo6NlkF295i6XSKCwJ5wykhK7mKoP3RxnpEIAhnOO1WYLuYithJqdnOhK
	pxF7Fpl0IHdf+WPP2DQzPsF36u5Js2RoX3boqZdl3L1yfk8JWA=
X-Received: by 2002:a17:90b:37cf:b0:3ab:c674:d83c with SMTP id 98e67ed59e1d1-3ad86ed34a8mr4414056a91.27.1792670176644;
        Thu, 22 Oct 2026 04:56:16 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6b8645bf7sm1158727a12.28.2026.10.22.04.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:56:16 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v2] Bluetooth: Create debugfs directory before running selftests
Date: Thu, 22 Oct 2026 19:56:09 +0800
Message-Id: <pm-bluetooth-objects-candidate-0188-v10-ad807db51e45722aae62@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Selftest debugfs files must be removed before the module storage
containing their file operations is freed. With CONFIG_BT=m, bt_init()
calls bt_selftest() before creating bt_debugfs. test_ecdh() and
run_selftests() therefore pass a NULL parent to debugfs_create_file(),
publishing selftest_ecdh and selftest_smp at debugfs root. bt_exit()
removes only the bluetooth directory, leaving these files behind.

Both file operations tables have a module owner, so an open descriptor
prevents normal unload. However, with debugfs and either selftest enabled,
unloading Bluetooth without any open descriptors leaves the root entries
pointing at the old module. A later open permits the following ordering:

    Module init/unload                Reader
    bt_init()
      bt_selftest()
        publish selftest files at root
      create bluetooth directory
    bt_exit()
      remove bluetooth directory
    free_module()
                                      open root selftest file
                                        full_proxy_open_regular()
                                          __debugfs_file_get()
                                            read real_fops members

Here free_module() completes before the reader opens the file. Debugfs
active-user tracking still permits access because the root entry was
never removed. The open reads freed file operations before it can acquire
the owner reference, which can cause a kernel fault.

Create bt_debugfs before running the selftests so their result files are
covered by the existing recursive cleanup on initialization failure and
module exit. On selftest failure, jump directly to the directory cleanup
without running cleanup for subsystems that have not been initialized.
Removing the result files revokes new opens and drains active operations
before module storage is freed.

Before the selftest file operations gained module owners, reading a held
root ECDH descriptor after unload produced the Oops below. The owner
reference closes that held-descriptor window; removing the root entries
also closes the remaining post-unload open window.

Oops report as below (preceding and following console output omitted):

    BUG: unable to handle page fault for address: fffffbfff805758f
    #PF: supervisor read access in kernel mode
    #PF: error_code(0x0000) - not-present page
    PGD 1a7ff6067 P4D 1a7ff6067 PUD 1a7ff2067 PMD 100ad6067 PTE 0
    Oops: Oops: 0000 [#1] SMP KASAN NOPTI
    CPU: 3 UID: 0 PID: 424 Comm: cat Not tainted
    7.2.0-rc6-pmb-bt-functional-v1+ #2 PREEMPT(lazy)
    Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix,
    1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
    RIP: 0010:full_proxy_read+0x103/0x180
    Code: fc ff df 48 c1 e9 03 80 3c 01 00 0f 85 82 00 00 00 48 b8 00 00 00
    00 00 fc ff df 49 8b 5d 00 48 8d 7b 18 48 89 fa 48 c1 ea 03 <80> 3c 02
    00 75 70 48 8b 43 18 48 89 ef 48 8b 34 24 4c 89 f9 4c 89
    RSP: 0018:ffff88810d95fcf0 EFLAGS: 00010212
    RAX: dffffc0000000000 RBX: ffffffffc02bac60 RCX: 1ffff110220d5080
    RDX: 1ffffffff805758f RSI: 0000000000000004 RDI: ffffffffc02bac78
    RBP: ffff888116e98700 R08: 0000000000000001 R09: ffffed1021b2bf8f
    R10: 0000000000000003 R11: ffff888110d59d00 R12: ffff8881085a82f0
    R13: ffff8881106a8400 R14: 0000000000040000 R15: ffff88810d95fea8
    FS:  00007fadb62ba780(0000) GS:ffff8881fdc22000(0000)
    knlGS:0000000000000000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: fffffbfff805758f CR3: 0000000106a42001 CR4: 0000000000770ef0
    PKRU: 55555554
    Call Trace:
     <TASK>
     ? __pfx_full_proxy_read+0x10/0x10
     vfs_read+0x1a0/0xc20
     ? __pfx_vfs_read+0x10/0x10
     ksys_read+0x111/0x200
     ? __pfx_ksys_read+0x10/0x10
     ? irqentry_exit+0xbe/0x820
     ? srso_alias_return_thunk+0x5/0xfbef5
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
    RIP: 0033:0x7fadb634c687
    Code: 48 89 fa 4c 89 df e8 58 b3 00 00 8b 93 08 03 00 00 59 5e 48 83 f8
    fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f
    1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
    RSP: 002b:00007ffd26510c30 EFLAGS: 00000202 ORIG_RAX: 0000000000000000
    RAX: ffffffffffffffda RBX: 00007fadb62ba780 RCX: 00007fadb634c687
    RDX: 0000000000040000 RSI: 00007fadb6214000 RDI: 0000000000000000
    RBP: 0000000000040000 R08: 0000000000000000 R09: 0000000000000000
    R10: 0000000000000000 R11: 0000000000000202 R12: 00007fadb6214000
    R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000040000
     </TASK>
    Modules linked in: [last unloaded: bluetooth]
    CR2: fffffbfff805758f
    ---[ end trace 0000000000000000 ]---

Clear bt_debugfs after removing the directory on initialization failure
so later built-in initialization cannot reuse a removed parent.

Fixes: 6de50f9fdb60 ("Bluetooth: Export ECDH selftest result in debugfs")
Fixes: 64dd374eac15 ("Bluetooth: Export SMP selftest result in debugfs")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
Changes in v2:
- Address the stale bt_debugfs pointer concern raised by Sashiko:
  https://sashiko.dev/#/patchset/87920
- Clear bt_debugfs after initialization cleanup.

Link to v1: https://lore.kernel.org/r/pm-bluetooth-objects-candidate-0188-v7-e3c91e5159902df34c8c@gmail.com

diff --git a/net/bluetooth/af_bluetooth.c b/net/bluetooth/af_bluetooth.c
--- a/net/bluetooth/af_bluetooth.c
+++ b/net/bluetooth/af_bluetooth.c
@@ -935,11 +935,11 @@
 
 	BT_INFO("Core ver %s", VERSION);
 
+	bt_debugfs = debugfs_create_dir("bluetooth", NULL);
+
 	err = bt_selftest();
 	if (err < 0)
-		return err;
-
-	bt_debugfs = debugfs_create_dir("bluetooth", NULL);
+		goto cleanup_debugfs;
 
 	bt_leds_init();
 
@@ -983,7 +983,9 @@
 	bt_sysfs_cleanup();
 cleanup_led:
 	bt_leds_cleanup();
+cleanup_debugfs:
 	debugfs_remove_recursive(bt_debugfs);
+	bt_debugfs = NULL;
 	return err;
 }
 
