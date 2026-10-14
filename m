Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55FC39D3D0
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791950822; cv=none; b=EyFYiudV+0eRLkIE719s3rn3/GppJK5MdERIVBX2lKRqkbKpUyRpJYGdyqy4gipxL1JDaNUYUC79iCwcK1cQ3o0sHncUsyWNqJO5BM5gego7YF0p3CMB0V1PybhQtLDhL8D+gNA2bF+GMmaozyZbDnWs7HNi9AY0wone6xnMvwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791950822; c=relaxed/simple;
	bh=1KtpDOY+h7GnZkqwCxm3kdRRjz+Hk65mq56qgc6Fflg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=DBHl6ArjsrwWlS+UidIf9A/dLbqkt7H1hrvUBlvJ1LNvX90SLVM1vTQm5IHa/ZgGO1haNeTAkkhgKahwHte5MxAtpnECd11J1tgftHU1SujUE8UiGFl0cdStSJu5IERhJ1gbpPC7kGJSiqlU3Pye4gx5iS1rvC7bIFGMr24RXBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lTKu+WIq; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lTKu+WIq"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-398b3c37877so1806578a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 21:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791950818; x=1792555618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fI+aIdg5Eg5PyjED5uc03DU2xv7jEMp47g/G9P6kJ88=;
        b=lTKu+WIq3TRNWuh5SkHS/bVHvf2oKt8b4JNSkAb9BuLZymssKqN6n38p2QoNxvyfRE
         X8krfMORniVCj7493DYmR+dHlJubngRFmTgSHBZFasCgBNArQ69HxSplYiuuMyZmdviq
         oM2G8T5yVpBCjGVylUAWhV5Sx1Z/rHlEfaK6CDc6fgYNaDx/7/cfzO7p4LEwbdM/e/5/
         MPerlnMzhbHGeaJPTDIH0jkyOzhSEQ4wV9oxjkl0gdPe3/3AVGhMhvGPd4ebYMpWdLR0
         G/0ZBZN7c1TylXQujHXP12EAnRtPR2m0vc9eWzU+tYJwNMXaPWyE1OGzjUjdW586zvJQ
         oP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791950818; x=1792555618;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fI+aIdg5Eg5PyjED5uc03DU2xv7jEMp47g/G9P6kJ88=;
        b=O9uUHscymzkpkxJ8sHHNmg6ivzhSmLZXDk7EXFAB5kAB/GSjZY/DKwNgW5m04KQQPU
         Kqr3FZaBFwDrjnmo4XtfKg4DToG/V4J/uEqLWrRNwQHM6enUXkp866oT0xpXUjcumtrm
         /oLzWwMm4zEERXFzQHiAjo6dy14fM4hAcwprzs42f2051KvuUxI2RQkv5rO9vSGPFHMq
         CtrWvILin59TVJ1P43U823iniEFuOFYGVSqEWTm4l0ctAr/6/C90gnn2UbqpMH5/lOem
         allIOguaLIP9t62JQNZMDhUdapqqx1ommDFwdTjO6EbWlt8QypyxQL8g7vHBnIWEasNq
         yleA==
X-Forwarded-Encrypted: i=1; AKwUvBwVyDXbLMau9m4ZBWgHO3YRkkN4Lb9ZUtW+7Jn5+SC8y1Nh55iKxHetZzabNI5fR/ZfgqVETTjH7WjuSB0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1zZBU8VqvDX1IHW7UVBsnq6zWDCdvJPAoIhD51RpxW+80ExzQ
	m7FO2+JZE0hBLPMPocSDd2IX6WRSTbbH7wzE+Og7PYgmYGqJook97GMT
X-Gm-Gg: AYBFou1THULEoNUr69QSiAH0tWrvYNJFYEmrPh2TpFQnknWhkg0hOFVJMt7k+ja57KC
	RPJ1CFfqaWQRqKohNoBrIqONcwY78Q4V0EmM+OM+yRq44fBqqtQ5act1yi11E82H4fyt0R4Ltv5
	WC2JLVF8aotIWGBfxv7iYFluAbXXTfSNS4dZfs40L2Ym6i+hCwPgiGaV2qHFifuMplOlH3qpj62
	+UtNADsRZkdVYMG0niA2+E7SUuOj6Ja4OU7CxA4rp2U8n6HxmEKishGvDTI30SSQQrfbfKpMz5U
	ZrzpzLMA7XaUlzFmSjETrnA1Pnveyztd/Gruuc/sBSU1Fuk1LoxOhNA/hQ6LC0C4qIHrjcPZ+1q
	MoW29R2igNRqcps2d3/7QtPcwXH9hGpC8jKz2dh5V1afkMpuTHw9pAZdFpZexF1yVlvFGXdxW9z
	IZdU31fCYeRX+CCdbdm7gT4q2p3TpMAtzuiWIhLNvlyt69TZU6j7CXPch4ifYgxYXL7/8mupJim
	/c6
X-Received: by 2002:a17:90a:d44b:b0:3ab:365f:ebdd with SMTP id 98e67ed59e1d1-3ab3ad2029bmr11757991a91.37.1791950817907;
        Tue, 13 Oct 2026 21:06:57 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac760fc92csm544113a91.14.2026.10.13.21.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 21:06:57 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	kees@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ALSA: seq: oss: Prevent duplicate MIDI device teardown
Date: Wed, 14 Oct 2026 12:06:52 +0800
Message-Id: <pm-pmb-7c5128efe2110a87b872-v2-c718183fd693e73d8e95@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Each OSS MIDI alias and its coder must have one final-release owner.
find_slot() pins the alias under register_lock, but
snd_seq_oss_midi_check_exit_port() clears its slot in a separate critical
section without checking whether another callback already removed it.
The use counter protects active users, but draining it does not elect a
single remover.

This requires overlapping raw kernel-client port controls for the same
client. snd_seq_kernel_client_ctl() does not take ioctl_mutex, and
snd_seq_delete_port() releases ports_mutex before returning to the
DELETE_PORT handler's PORT_EXIT broadcast. If the old deletion is delayed
before that broadcast, a new port can reuse the vacant address. Its
PORT_START finds and keeps the old alias. Deleting the replacement then
produces a second PORT_EXIT for the same address. Non-atomic subscriber
delivery holds a read rwsem, so the two receive_announce() callbacks can
run concurrently:

  Old-port deletion                 Replacement-port controls
  -----------------                 -------------------------
  Unlink and drain old port
  Delay before PORT_EXIT            Create port at the same address
                                    PORT_START keeps existing alias
                                    Delete port; PORT_EXIT pins mdev
  PORT_EXIT pins the same mdev
  Clear slot; drop pin              Clear slot; drop pin
  Wait for users to drain           Wait for users to drain
                                    Free coder; pause before kfree(mdev)
  Free coder again: read
  freed coder->buf

Both callbacks can select the same alias before either clears its slot.
After both drop their pins, both waits can return. The second call to
snd_midi_event_free() can then read the freed coder's buffer pointer,
as in the report below, and attempt to release the same objects twice.

Check that the pinned alias still occupies its slot under register_lock
before clearing it. A callback that finds it already removed drops its
pin and returns. Only the callback that removes the alias drains users
and frees the coder and record. The pin keeps the record alive through
this check, and the wait remains outside the spinlock.

KASAN report as below:

    ==================================================================
    BUG: KASAN: slab-use-after-free in snd_midi_event_free+0x53/0x60
    Read of size 8 at addr ffff888107074518 by task alsa-seq-fixtur/492

    CPU: 3 UID: 0 PID: 492 Comm: alsa-seq-fixtur Not tainted 7.2.0-rc6-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
    Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     ? snd_midi_event_free+0x53/0x60
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __virt_addr_valid+0x20d/0x410
     ? snd_midi_event_free+0x53/0x60
     kasan_report+0xe0/0x110
     ? snd_midi_event_free+0x53/0x60
     snd_midi_event_free+0x53/0x60
     snd_seq_oss_midi_check_exit_port+0x1d8/0x370
     receive_announce+0x1b8/0x370
     ? __pfx_receive_announce+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __lock_acquire+0x466/0x2260
     ? snd_seq_port_use_ptr+0x40/0x170
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? find_held_lock+0x2b/0x80
     ? snd_seq_port_use_ptr+0x10c/0x170
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lock_release+0xc8/0x280
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_receive_announce+0x10/0x10
     __snd_seq_deliver_single_event+0x105/0x1a0
     ? snd_seq_port_use_ptr+0x111/0x170
     snd_seq_deliver_single_event+0x2fc/0x770
     ? __pfx_snd_seq_deliver_single_event+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_down_read_nested+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? do_raw_read_unlock+0x49/0xe0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? _raw_read_unlock+0x23/0x40
     snd_seq_deliver_event+0x351/0x760
     ? __pfx_snd_seq_deliver_event+0x10/0x10
     ? _raw_spin_unlock_irqrestore+0x44/0x60
     ? trace_hardirqs_on+0x18/0x160
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? _raw_spin_unlock_irqrestore+0x44/0x60
     ? srso_alias_return_thunk+0x5/0xfbef5
     snd_seq_kernel_client_dispatch+0x13f/0x170
     snd_seq_system_broadcast+0x100/0x150
     ? __pfx_snd_seq_system_broadcast+0x10/0x10
     ? mark_held_locks+0x40/0x70
     ? _raw_spin_unlock_irqrestore+0x44/0x60
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lockdep_hardirqs_on_prepare+0xea/0x1a0
     ? srso_alias_return_thunk+0x5/0xfbef5
     snd_seq_ioctl_delete_port+0x179/0x4b0
     call_seq_client_ctl+0x90/0x110
     snd_seq_kernel_client_ctl+0x8a/0x100
     pmbd_case_delete_port+0xa6/0xf0
     ? __pfx_pmbd_case_delete_port+0x10/0x10
     ? __might_fault+0xdd/0x190
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __might_fault+0x14e/0x190
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? strim+0x19c/0x200
     pmbd_case_control_write+0x2c5/0x470
     ? __pfx_pmbd_case_control_write+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __debugfs_file_get+0x1bd/0x7f0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lock_acquire+0x17b/0x2f0
     ? ksys_write+0x111/0x200
     full_proxy_write+0x11f/0x180
     vfs_write+0x25a/0x1010
     ? __pfx_full_proxy_write+0x10/0x10
     ? __pfx___mutex_lock+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lock_acquire+0x17b/0x2f0
     ? __pfx_vfs_write+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __fget_files+0x1e1/0x370
     ksys_write+0x111/0x200
     ? __pfx_ksys_write+0x10/0x10
     ? rseq_register.isra.0+0x1f3/0x2e0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? exit_to_user_mode_loop+0x3a5/0x570
     ? srso_alias_return_thunk+0x5/0xfbef5
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
    RIP: 0033:0x7f3532e4e9ee
    Code: 08 0f 85 f5 4b ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 80 00 00 00 00 48 83 ec 08
    RSP: 002b:00007f3532dafe08 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
    RAX: ffffffffffffffda RBX: 00007f3532db06c0 RCX: 00007f3532e4e9ee
    RDX: 000000000000000a RSI: 000055efbd747156 RDI: 0000000000000003
    RBP: 000055efbd747156 R08: 0000000000000000 R09: 0000000000000000
    R10: 0000000000000000 R11: 0000000000000246 R12: 000000000000000a
    R13: 0000000000000000 R14: 00007ffe7894e7f0 R15: 00007f35325b0000
     </TASK>

    Allocated by task 490:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kmalloc_cache_noprof+0x251/0x610
     snd_midi_event_new+0x74/0x210
     snd_seq_oss_midi_check_new_port+0x329/0x610
     receive_announce+0x277/0x370
     __snd_seq_deliver_single_event+0x105/0x1a0
     snd_seq_deliver_single_event+0x2fc/0x770
     snd_seq_deliver_event+0x351/0x760
     snd_seq_kernel_client_dispatch+0x13f/0x170
     snd_seq_system_broadcast+0x100/0x150
     snd_seq_ioctl_create_port+0x39a/0x9d0
     call_seq_client_ctl+0x90/0x110
     snd_seq_kernel_client_ctl+0x8a/0x100
     pmbd_case_create_port+0xcc/0x160
     pmbd_case_control_write+0x21d/0x470
     full_proxy_write+0x11f/0x180
     vfs_write+0x25a/0x1010
     ksys_write+0x111/0x200
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    Freed by task 493:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     kfree+0x307/0x580
     snd_midi_event_free+0x48/0x60
     snd_seq_oss_midi_check_exit_port+0x1d8/0x370
     receive_announce+0x1b8/0x370
     __snd_seq_deliver_single_event+0x105/0x1a0
     snd_seq_deliver_single_event+0x2fc/0x770
     snd_seq_deliver_event+0x351/0x760
     snd_seq_kernel_client_dispatch+0x13f/0x170
     snd_seq_system_broadcast+0x100/0x150
     snd_seq_ioctl_delete_port+0x179/0x4b0
     call_seq_client_ctl+0x90/0x110
     snd_seq_kernel_client_ctl+0x8a/0x100
     pmbd_case_delete_port+0xa6/0xf0
     pmbd_case_control_write+0x398/0x470
     full_proxy_write+0x11f/0x180
     vfs_write+0x25a/0x1010
     ksys_write+0x111/0x200
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    The buggy address belongs to the object at ffff888107074500
     which belongs to the cache kmalloc-96 of size 96
    The buggy address is located 24 bytes inside of
     freed 96-byte region [ffff888107074500, ffff888107074560)

    The buggy address belongs to the physical page:
    page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x107074
    flags: 0x200000000000000(node=0|zone=2)
    page_type: f5(slab)
    raw: 0200000000000000 ffff888100042280 dead000000000122 0000000000000000
    raw: 0000000000000000 0000000000200020 00000000f5000000 0000000000000000
    page dumped because: kasan: bad access detected

    Memory state around the buggy address:
     ffff888107074400: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
     ffff888107074480: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
    >ffff888107074500: fa fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
                                ^
     ffff888107074580: fa fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
     ffff888107074600: fa fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
    ==================================================================

Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---

diff --git a/sound/core/seq/oss/seq_oss_midi.c b/sound/core/seq/oss/seq_oss_midi.c
index 70f94df651446e68af238e3a62180851a037ef76..b456bd37d87bc3d7363b5665fb65ab80c7a9aa36 100644
--- a/sound/core/seq/oss/seq_oss_midi.c
+++ b/sound/core/seq/oss/seq_oss_midi.c
@@ -211,6 +211,11 @@ snd_seq_oss_midi_check_exit_port(int client, int port)
 	mdev = find_slot(client, port);
 	if (mdev) {
 		scoped_guard(spinlock_irqsave, &register_lock) {
+			/* Only one callback may release the device. */
+			if (midi_devs[mdev->seq_device] != mdev) {
+				snd_use_lock_free(&mdev->use_lock);
+				return 0;
+			}
 			midi_devs[mdev->seq_device] = NULL;
 		}
 		snd_use_lock_free(&mdev->use_lock);
