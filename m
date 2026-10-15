Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380333A5E87
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792084320; cv=none; b=sZxOFbDGSCBU81Q+DA9uJPQ8IbRKrKOoFkOxiGmftj+LsRKUjPTkIhonBKBofPhGXNe2gsvlpZsYe3EUagiiGr5TGc06jwIOpIQaZU/3P4i3mL5/jy/p12iTIiec5zsJ1rObNyMYPccAxs3a9U0si5tmx5WxNri5lQO9Bg7oyS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792084320; c=relaxed/simple;
	bh=z0YZjBNUkiK9lE0CsAaTVDevg//c7p0btTBrRMwR2dU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=qkiWwb2CW++XEuKT3Hxn+UMfFCnfkIPI/7uM48zEWdOgdNN4eDgnUS8hVZcHFGTkWlOOeDbM4/sjfibnELEIl/cVPIJhZ47/kL3HyQfHqQ9Sa4WezwXiLyFnS9xWVjLqp7+j/xsvwk57r7nyMXqizp+AlVQfZd5IZjmLO55ASf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHSXZPQg; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHSXZPQg"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso1917236a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792084306; x=1792689106; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dbt7vqIJmAMRcAQT2HcbP9hEBB6OivbQ8YevrsbZx38=;
        b=jHSXZPQglm21iaSCHLQeDZ1Nk7jvMlw7g1CAIUZBsPpompyDi1rfMn8PachJdT/muV
         GmGMsMhhU2nUDMqt1aBst8Dr5hgzE2cwEZFEOjcmqnRWRLu3yZqzjNjpXvzoLbO9Lf+R
         oiNOXtuVRhuMrc6jsT3OWjmhBaMW3yRsvlMDlPmUWvHZl+QiNJMvDqu6q9I7dQjEKHlP
         7UtMGr8r/XS0JtvEzxwlONxTda+eVmNXUPv0yZT5gWlDoNOXnQh0aHFNep0yYnEny3aG
         bnxaqC0pqAJYE8pHp0qFzbv8A+wtd2KCBCCUn8K4gtMI8ySJHduSX0xBaaXrcB7BMKWw
         o/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792084306; x=1792689106;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dbt7vqIJmAMRcAQT2HcbP9hEBB6OivbQ8YevrsbZx38=;
        b=1RqMVh57ZDYfsTL+LpO04Sz84cEOOHB6d3ZzEusCkaVMy51YEN+hXTUU8Qd5Z9F1iv
         XwyGefMkHOoBdhWW4BALX23nlC/JaJOXWCS99oebRaSKz8/E2Bl7DMwUy4H3/YwHfq+R
         pp/594AoCC35rtbFliviWeixA9PClDAqdYLn472dgyoCLK4dMM6ZLbnbqR2sWfw4funh
         7NVY6Ku4AXgPXbxvuxsuzIZDyu1xyl9GQnrT3GwLg2NqEjppZFN6/wbTRYxl/VCAvOyM
         uXIC6FE+0BANJJuVayM5YV6xRs3bAgAB7dIXPX2Oqx8Ypk+6+FILsMo6Ag69tdX2rR8I
         Aykg==
X-Forwarded-Encrypted: i=1; AKwUvBxddH8dRsMa/I95eNEwuYXogUKMDXLddgPYCMaYqIImFHqkFh60jAKs6wDeebKKKVOGsD1JaJRLvyjWKqw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZgLcAEwQb+GC9fQuDTKEELqbibWjcrl77zLBV0wJO5CKhMCKo
	r8CdvogAZtHAMwWbyVwtrd1hhweIu9J9WBxNZb21aqxNC4WIQvamajdE
X-Gm-Gg: AYBFou0mtR1nDYny8+yVbb2r4xk4L8sfbv36DryFBx1s3CU6WQPqR8cYPvbsJ6Yfks2
	Dk987QCQH67I77uv+UqLUx6e5xpJmaJi2I3/sDn/RdgRzpIR5TF01XbGBCtCTbuirp1eP8iFRAt
	11+3AT7eB8AegytsizacDA48VJaUxlR2H436OXBcfsogH4MylQyWGN1cOy2L08kUDkmsh75IjPp
	dRSHTelx+guSfcbUqOMYJXOyrS+CNSFR4aRPU7X+7ilyyRz37weE87HbVTvEsvYqQd5lQkPNiaM
	oCk4nQSs9/d9zpw7HZnquPV3DZpzmouiEs6RV2MBdUFCN9BfBlzx7jRTzvwRzKwTn1GDIsa5/a6
	tDdn/duIYATBhdLJUCBGd/isirl/BuXPawX4E4qIA5YDV5DAxRoLQLB0C4nK7UB2+e2l3yQGwgZ
	JQGNX3M7bkwLNO+uA9oVZq6OBSk0od369tCHZ/v2a6bSFLf1o5js1FlHK2njIzvfzu8w==
X-Received: by 2002:a17:90b:4d0f:b0:3ac:97e3:73a3 with SMTP id 98e67ed59e1d1-3ac97e3ca4bmr2681282a91.6.1792084305933;
        Thu, 15 Oct 2026 10:11:45 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc43a1e1esm158403a91.1.2026.10.15.10.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 10:11:45 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	phucduc.bui@gmail.com,
	cezary.rojewski@intel.com,
	kees+treewide@kernel.org,
	error27@gmail.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ALSA: mixer: oss: Serialize initial slot construction
Date: Fri, 16 Oct 2026 01:11:38 +0800
Message-Id: <pm-pmb-99c1214968ae9fa4d744-v2-df0befb9a699eb50dcec@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

OSS mixer slot callbacks require an initialized private_data payload.
However, snd_mixer_oss_notify_handler() publishes card->mixer_oss before
snd_mixer_oss_build() constructs the default bindings, and
snd_mixer_oss_build_input() stores get_volume before private_data.

With OSS mixer emulation enabled and a native control matching a default
mapping, a volume read can arrive during initial binding construction.
For example, the dummy card provides the Master Volume control before
registration. The following ordering lets the read use the callback
before its payload is attached:

    Card registration                    OSS volume read
    -----------------                    ---------------
    register the OSS mixer device
    publish card->mixer_oss
    store slot->get_volume
                                         open the mixer device
                                         lock reg_mutex
                                         invoke slot->get_volume
                                         load NULL private_data
                                         read slot->present
    store slot->private_data

The read holds reg_mutex, but the initial builder does not acquire it.
The controls_rwsem read lock protects native controls and does not
serialize the builder with another reader. As a result,
snd_mixer_oss_get_volume1() can dereference a NULL payload and Oops.

Hold the existing reg_mutex throughout snd_mixer_oss_build(), as proc
remapping already does for snd_mixer_oss_build_input(). A request can no
longer invoke a callback between its installation and the payload store.
This keeps the existing reg_mutex-before-controls_rwsem lock order.

KASAN report as below:

    Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
    KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
    CPU: 1 UID: 0 PID: 431 Comm: alsa-oss-trigge Tainted: G           O        7.2.0-rc6-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
    Tainted: [O]=OOT_MODULE
    Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
    RIP: 0010:snd_mixer_oss_get_volume1+0xd1/0x610 [snd_mixer_oss]
    Code: 00 c7 03 64 00 00 00 e9 b8 01 00 00 e8 e8 82 44 c1 49 8d 75 04 48 b8 00 00 00 00 00 fc ff df 48 89 f2 48 89 34 24 48 c1 ea 03 <0f> b6 14 02 48 89 f0 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 3f
    RSP: 0018:ffff888104c67cc8 EFLAGS: 00010257
    RAX: dffffc0000000000 RBX: ffff888104c67d80 RCX: ffffffffc0406cb8
    RDX: 0000000000000000 RSI: 0000000000000004 RDI: ffffffff862d93a4
    RBP: ffff888104c67d90 R08: 0000000000000001 R09: 0000000000000001
    R10: ffffffff89406e57 R11: ffff888104c9d700 R12: ffff888113c48038
    R13: 0000000000000000 R14: ffff888113c48000 R15: ffff888104646820
    FS:  00007f7904d29780(0000) GS:ffff8881fd81d000(0000) knlGS:0000000000000000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: 00007f7904e388e0 CR3: 000000010662c002 CR4: 0000000000770ef0
    PKRU: 55555554
    Call Trace:
     <TASK>
     snd_mixer_oss_ioctl1+0x25d/0x16f0 [snd_mixer_oss]
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_snd_mixer_oss_get_volume1+0x10/0x10 [snd_mixer_oss]
     ? __pfx_snd_mixer_oss_ioctl1+0x10/0x10 [snd_mixer_oss]
     ? lock_release+0xc8/0x280
     ? pmbd_site_is_armed+0xa1/0xd0
     ? lockdep_hardirqs_on_prepare+0xea/0x1a0
     ? trace_hardirqs_on+0x18/0x160
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? _raw_spin_unlock_irqrestore+0x44/0x60
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? pmbd_gate_site_armed+0x31/0x1c0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? pmbd_probe_hit_cookie+0xee/0x1c0
     ? __pfx_pmbd_probe_hit_cookie+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? selinux_file_ioctl+0xaa/0x280
     snd_mixer_oss_ioctl+0x4a/0x80 [snd_mixer_oss]
     ? __pfx_snd_mixer_oss_ioctl+0x10/0x10 [snd_mixer_oss]
     __x64_sys_ioctl+0x163/0x1d0
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
    RIP: 0033:0x7f7904e3891b
    Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
    RSP: 002b:00007ffc72071e20 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
    RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f7904e3891b
    RDX: 00007ffc72071e84 RSI: 0000000080044d00 RDI: 0000000000000003
    RBP: 0000000000000003 R08: 0000000000000000 R09: 0000000000000000
    R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffc72072e12
    R13: 00007ffc72072060 R14: 00007f7904f67000 R15: 000055cd1e601d50
     </TASK>
    Modules linked in: snd_dummy(O) snd_mixer_oss(O)
    ---[ end trace 0000000000000000 ]---
    RIP: 0010:snd_mixer_oss_get_volume1+0xd1/0x610 [snd_mixer_oss]
    Code: 00 c7 03 64 00 00 00 e9 b8 01 00 00 e8 e8 82 44 c1 49 8d 75 04 48 b8 00 00 00 00 00 fc ff df 48 89 f2 48 89 34 24 48 c1 ea 03 <0f> b6 14 02 48 89 f0 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 3f
    RSP: 0018:ffff888104c67cc8 EFLAGS: 00010257
    RAX: dffffc0000000000 RBX: ffff888104c67d80 RCX: ffffffffc0406cb8
    RDX: 0000000000000000 RSI: 0000000000000004 RDI: ffffffff862d93a4
    RBP: ffff888104c67d90 R08: 0000000000000001 R09: 0000000000000001
    R10: ffffffff89406e57 R11: ffff888104c9d700 R12: ffff888113c48038
    R13: 0000000000000000 R14: ffff888113c48000 R15: ffff888104646820
    FS:  00007f7904d29780(0000) GS:ffff8881fd81d000(0000) knlGS:0000000000000000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: 00007f7904e388e0 CR3: 000000010662c002 CR4: 0000000000770ef0
    PKRU: 55555554
    Kernel panic - not syncing: Fatal exception
    Kernel Offset: disabled
    Rebooting in 1 seconds..

Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---

diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
index c533d767c29ac0d2099936f0d4af71a12f082769..f1fa42e634fc145b734551c0957f9c2fa9745383 100644
--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -1272,6 +1272,7 @@ static void snd_mixer_oss_build(struct snd_mixer_oss *mixer)
 	};
 	unsigned int idx;
 	
+	guard(mutex)(&mixer->reg_mutex);
 	for (idx = 0; idx < ARRAY_SIZE(table); idx++)
 		snd_mixer_oss_build_input(mixer, &table[idx], 0, 0);
 	if (mixer->mask_recsrc) {
