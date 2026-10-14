Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC9A32D0FC
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791950587; cv=none; b=YEtLeu3tHLe7am5c7uTFi6SfK93wfzWc/WRg4kL3ppsaDTuv1IE82bk/Hriqq6Rjlk7onsA3e7R4EvPkfIctQfUOn4i7h9+GDlmaK2sO8X34I2bZ3pQGE777rJnezmvrqa+8SdMAuspkPH5eWps7+RP0l1vUzXtSkDZQhZBaypg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791950587; c=relaxed/simple;
	bh=N27GfF/aeXt4Lq0RNt6dQo1+aQjT6kEm4OAi7y+mL5U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=gyXPNcNY8VGBDSWsiQ2zO/GAwP4pbFrPZq/o10cFIVupNlyQ2B7NAJf9zD53xy6VVyuZCsGNvUY+hMuk3xeAS8XCYVbpl+0LEehXLS4EHJjzOCHTYTg48+yaFUkzZQO7/4eoj2Y7hzjkU83jT1U898XHGQMcuFqC2dkcF1a+Oos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLgRhHWt; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLgRhHWt"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso5206a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 21:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791950585; x=1792555385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3zQfqQvUUSUX/8/9x6ZyNgJ6KcYRnctiVv4ojnaD9r8=;
        b=VLgRhHWt24I38Li08YmIy6dZhNwiLIxny8cTmxdR/25DpaiEn4bu4vTu/2hnV3ZuwI
         D6/OGzXB6rEn4B1BN42EpRUTkhfPEBblw4KQ1myNNzjnL/l1vxeETytjEIJ2y24kB6rm
         mKENlbgirh5pvzrhdlEDBHFIQvfJqc8H4bSTelxhR+jdQ0lVr3bJbl+SE/6SQ2YJ/C9g
         vIv9DLnLK57jfNH6mfGAzBRxl/vcm4viTfx/vj85zEfp8X9sUyGjkSCtY5pCjO5E3nPA
         9UfBie+Zy/U2GKvENCsmHtsSEoa7l2jsR14uAe8DlajwfIzV+ba5NBzWybrWRcou6gND
         oepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791950585; x=1792555385;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3zQfqQvUUSUX/8/9x6ZyNgJ6KcYRnctiVv4ojnaD9r8=;
        b=fCZKmGntEEMbbvs+ppXn/Ok3vdv9R1H+18CkOYOKtHZmrlOsk1R5U+TgUG6we18b92
         eH+IiPzThfRdA860kpYXn1TxOAHn9+Wcio3euch+/sGD2QcQHNiB9chXD3O/d+UMqCiq
         ygcCBCh/xI3XvY0On+4jfQHrZRyK2HrO9/O5sB+/RqPP8Yk7HVj30LpQBtwo27aQdmvI
         SGYAJ9HVsxv1u/u6edSaEhEM5W80TzUk53NtKn2rfKJmHfPtEOgR4hVbF3fJnEOdH6Rv
         lcu7WC9mLOKENDLt6C42J5Up/nDUVvrgcPErWVViqKzI6TJHCT+Hb6J1jLeOFUMwWOpK
         YktA==
X-Forwarded-Encrypted: i=1; AKwUvBzip67TGXSfvm1o9C3WFhvGaOlaHrAadnTLnre+t7LBFrDA9vAdk3aXP/TXmbYmK0jtKNbeFv51OOim358=@vger.kernel.org
X-Gm-Message-State: AFq9FYKw9EUajPQxxMDyXq9uaFoGeQtPoYnXFDnG7IrKxgU1f3K2TrfO
	Yq5NYKVEVq6y1gYT5MSl9LccqdA4qQbPPyqYQ5Pzu3V7jN2/wA0oH5Sm
X-Gm-Gg: AYBFou3z5Q7yQyBeOx12SDPfW3ehbN88s8bjaqqiflDwzwpwNwCl1ahn5P5CrDEmaF+
	TxYz4+zB6rJr/k3Wyk1kzjdfhbBudS/OVYC1Arjg31zbNk2qodpHc7yjijC9bc86d4Q6+14drKN
	KySyx4otgl5GWTYbGJKLd4IeOKTZL5xzYjdf/9cLCHT3NR/nSEe41cOikkAVdbc+LWA2AFY6Hfm
	b7JOzacP1iDSqNxfQpgWMjziEqAQuDs/8ZK7aFg+rm+0AOBEvJyvGnFhqloD32Mqg3bJJNSrIDJ
	TSBvlR1HGbdHHaSXHmvEio/9k1q344sU+DDDfsFqq8OcAKU4fKU4QS5yyBnw/rSq6rfHbYu/nSa
	T61WWpTcE7RH6iJdO+pGvHX+EpSsnwOnXZgO8EnTepfiK065gyfOHD1YqWe12+ppvWWttwUFsP+
	w/i22hpaNFjh+e9CZVejNKIN93MMwELc/KWnkTJOjSier94CVmy81aA/bsvCOu2kq1mA==
X-Received: by 2002:a17:90b:4b92:b0:3a8:545f:520d with SMTP id 98e67ed59e1d1-3ab3ac9f939mr11478111a91.32.1791950584896;
        Tue, 13 Oct 2026 21:03:04 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac632711a8sm1043068a91.1.2026.10.13.21.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 21:03:04 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ALSA: emux: Guard the OSS argument during port initialization
Date: Wed, 14 Oct 2026 12:02:50 +0800
Message-Id: <pm-pmb-f8d6ccb28f196910444f-v2-c253bf022b6e954a7bdc@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The OSS argument must be non-NULL before reset_port_mode() writes its
event_passing field. snd_emux_open_seq_oss() assigns p->oss_arg only
after snd_emux_create_port() attaches the writable sequencer port, so
this field is still NULL when the callback first becomes reachable.

With sequencer OSS and an EMUX provider enabled, another sequencer
client can learn the new address from a PORT_START announcement and
send a direct SNDRV_SEQ_EVENT_OSS channel-mode command, with marker
0xfe and command byte 0x8a. The following ordering is possible:

  OSS opener                        Sequencer writer
  snd_emux_create_port()
    snd_seq_event_port_attach()
      publish port, announce
                                    receive PORT_START
                                    snd_seq_write()
                                      snd_emux_event_oss_input()
                                        reset_port_mode()
                                          write via NULL oss_arg
  p->oss_arg = arg

The callback's write precedes the opener's assignment. The core's port
reference keeps the private data allocated but does not wait for its
initialization. The write therefore dereferences NULL and can panic the
kernel, as shown by the report below.

Take a single READ_ONCE() snapshot of oss_arg and update event_passing
only when that snapshot is non-NULL. Pair it with WRITE_ONCE() in the
open path, so the check and write use the same pointer despite
concurrent initialization. The open path still sets the initial mode
after assigning the argument, and subsequent channel-mode events retain
their existing handling.

KASAN report as below:

    Oops: general protection fault, probably for non-canonical address 0xdffffc0000000003: 0000 [#1] SMP KASAN NOPTI
    KASAN: null-ptr-deref in range [0x0000000000000018-0x000000000000001f]
    CPU: 2 UID: 0 PID: 495 Comm: fixture Tainted: G           O        7.2.0-rc6-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
    Tainted: [O]=OOT_MODULE
    Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
    RIP: 0010:snd_emux_event_oss_input+0xa76/0xdd0
    Code: fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 e1 02 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 5d 78 48 8d 7b 18 48 89 fa 48 c1 ea 03 <0f> b6 04 02 84 c0 74 08 3c 03 0f 8e 40 03 00 00 c7 43 18 00 00 00
    RSP: 0018:ffff88810a937888 EFLAGS: 00010216
    RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff84f391b2
    RDX: 0000000000000003 RSI: 0000000000000000 RDI: 0000000000000018
    RBP: ffff8881179fc000 R08: 0000000000000001 R09: 0000000000000001
    R10: ffffffff89444257 R11: ffff888107dd3a00 R12: 1ffff11021526f17
    R13: 0000000000000000 R14: 0000000000000001 R15: ffff888112cda000
    FS:  00007fdd13c9f780(0000) GS:ffff8881fd826000(0000) knlGS:0000000000000000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: 00007fdd13e2f943 CR3: 00000001057ba005 CR4: 0000000000770ef0
    PKRU: 55555554
    Call Trace:
     <TASK>
     ? __pfx_snd_emux_event_oss_input+0x10/0x10
     ? snd_seq_port_use_ptr+0x40/0x170
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? find_held_lock+0x2b/0x80
     ? snd_seq_port_use_ptr+0x10c/0x170
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lock_release+0xc8/0x280
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_snd_emux_event_oss_input+0x10/0x10
     __snd_seq_deliver_single_event+0x105/0x1a0
     ? snd_seq_port_use_ptr+0x111/0x170
     snd_seq_deliver_single_event+0x2fc/0x770
     ? __pfx_snd_seq_deliver_single_event+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? add_lock_to_list+0x9d/0x1e0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? check_prev_add+0x34c/0xe80
     snd_seq_deliver_event+0x45a/0x760
     ? __pfx_snd_seq_deliver_event+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lock_acquire+0x17b/0x2f0
     snd_seq_client_enqueue_event.constprop.0+0x278/0x430
     ? __pfx_snd_seq_client_enqueue_event.constprop.0+0x10/0x10
     ? __might_fault+0xdd/0x190
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __might_fault+0x14e/0x190
     ? _raw_spin_unlock_irq+0x28/0x50
     snd_seq_write+0x30a/0x5e0
     ? __pfx_snd_seq_write+0x10/0x10
     ? selinux_file_permission+0x122/0x570
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? security_file_permission+0x26/0x80
     vfs_write+0x25a/0x1010
     ? __pfx_snd_seq_write+0x10/0x10
     ? __pfx_vfs_write+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? trace_hardirqs_on+0x18/0x160
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __call_rcu_common.constprop.0+0x5c1/0xbd0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __fput+0x5ba/0xa60
     ksys_write+0x1b7/0x200
     ? __pfx_ksys_write+0x10/0x10
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
    RIP: 0033:0x7fdd13d31687
    Code: 48 89 fa 4c 89 df e8 58 b3 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
    RSP: 002b:00007fff073e9f20 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
    RAX: ffffffffffffffda RBX: 00007fdd13c9f780 RCX: 00007fdd13d31687
    RDX: 000000000000001c RSI: 00007fff073e9fc0 RDI: 0000000000000003
    RBP: 0000000000000003 R08: 0000000000000000 R09: 0000000000000000
    R10: 0000000000000000 R11: 0000000000000202 R12: 0000561260c48082
    R13: 0000561260c48011 R14: 0000561260c4809d R15: 0000000000000002
     </TASK>
    Modules linked in: snd_emux_validation(O)
    ---[ end trace 0000000000000000 ]---
    RIP: 0010:snd_emux_event_oss_input+0xa76/0xdd0
    Code: fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 e1 02 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 5d 78 48 8d 7b 18 48 89 fa 48 c1 ea 03 <0f> b6 04 02 84 c0 74 08 3c 03 0f 8e 40 03 00 00 c7 43 18 00 00 00
    RSP: 0018:ffff88810a937888 EFLAGS: 00010216
    RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff84f391b2
    RDX: 0000000000000003 RSI: 0000000000000000 RDI: 0000000000000018
    RBP: ffff8881179fc000 R08: 0000000000000001 R09: 0000000000000001
    R10: ffffffff89444257 R11: ffff888107dd3a00 R12: 1ffff11021526f17
    R13: 0000000000000000 R14: 0000000000000001 R15: ffff888112cda000
    FS:  00007fdd13c9f780(0000) GS:ffff8881fd826000(0000) knlGS:0000000000000000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: 00007fdd13e2f943 CR3: 00000001057ba005 CR4: 0000000000770ef0
    PKRU: 55555554
    Kernel panic - not syncing: Fatal exception
    Kernel Offset: disabled
    Rebooting in 1 seconds..

Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---

diff --git a/sound/synth/emux/emux_oss.c b/sound/synth/emux/emux_oss.c
index 1145c7956afde167a451a3446ffd78ffce09cb65..30e353e7323d1129f1260cc6a3228bb7deacd4ef 100644
--- a/sound/synth/emux/emux_oss.c
+++ b/sound/synth/emux/emux_oss.c
@@ -124,7 +124,7 @@ snd_emux_open_seq_oss(struct snd_seq_oss_arg *arg, void *closure)
 	arg->private_data = p;
 	arg->addr.client = p->chset.client;
 	arg->addr.port = p->chset.port;
-	p->oss_arg = arg;
+	WRITE_ONCE(p->oss_arg, arg);
 
 	reset_port_mode(p, arg->seq_mode);
 
@@ -141,16 +141,24 @@ snd_emux_open_seq_oss(struct snd_seq_oss_arg *arg, void *closure)
 static void
 reset_port_mode(struct snd_emux_port *port, int midi_mode)
 {
+	struct snd_seq_oss_arg *arg;
+
+	/* OSS events can arrive before the open path has set oss_arg. */
+	arg = READ_ONCE(port->oss_arg);
+
 	if (midi_mode) {
 		port->port_mode = SNDRV_EMUX_PORT_MODE_OSS_MIDI;
 		port->drum_flags = DEFAULT_DRUM_FLAGS;
 		port->volume_atten = 0;
-		port->oss_arg->event_passing = SNDRV_SEQ_OSS_PROCESS_KEYPRESS;
+		if (arg)
+			arg->event_passing =
+				SNDRV_SEQ_OSS_PROCESS_KEYPRESS;
 	} else {
 		port->port_mode = SNDRV_EMUX_PORT_MODE_OSS_SYNTH;
 		port->drum_flags = 0;
 		port->volume_atten = 32;
-		port->oss_arg->event_passing = SNDRV_SEQ_OSS_PROCESS_EVENTS;
+		if (arg)
+			arg->event_passing = SNDRV_SEQ_OSS_PROCESS_EVENTS;
 	}
 }
 
