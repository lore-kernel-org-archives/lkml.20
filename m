Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7B74A99AF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789145996; cv=pass; b=mUSnpjlCAcvmmP7qbQhGfJhZQhQTVnxRLPhulHMpGJLMU8HWQTgl8tn1R1yi0haiSb/6iGGjhLQoEvIMe3gA0j0RZ0XPvvA1zrenrwo2h1bqv1Na0WlMHyFkz1XKkbQLOJMICoA2ZZ+kfccqfwL4jugRx/4hK0oomQgqdM4NcxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789145996; c=relaxed/simple;
	bh=qyRF7Tw3fXlY5qpLV+r4H3odLHcbo8qtB8w2c9r/XKI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Q17YeykzgjpZp5ItlhWimCh3DkcOFfirJiPV5lUdQ3x9cYaLBZxefO50ObFnkdfEFCovkMEW3tZdlrbpBrdC9gYf7KLASWW4nS6lY0jXCt4gR9kIq/daWeMwpPJj7ZomyMgCH8sP1b7CduYzLznol9JaI9UnGzd6NTgbvcG1wo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVth/GnG; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVth/GnG"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2637dd37c1so171700266b.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789145989; cv=none;
        d=google.com; s=arc-20260327;
        b=LBFHnIesSSROzNVZ0ifI4tiv00S0vJcYsacgsFcndeNoHxaRdUm26Ffrh5vsiexDSL
         dNS+OlH3NRj0jcIt8OLELdJITGdalDWxBG9nHB3vw4ZpFqFWoFrlBMQALOIRx5eEN6/f
         gktCwcsORNK/ql1IhsmpjpmcZfeF91YmfmZ5y1DWHYR884vosffAYiCMkD0qrOI3LHJr
         BvzbMeswDGRS+Dv3uJTBvFYWpx0Ta/FvZ84T4QFP1AXPID78J6v6um15huJ20tPOqlO0
         K/WMzMgYNS4pUp5lLmxZRmJ29ArsrjYS2Wguh+zD+sdJZim5cIVC2P8uTmlk875kMA+E
         +hMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=2uhrPGOUxIl6L+y/22qICqI3fsFdOGb1uQu3VWhlcuY=;
        fh=muSiummpVsK9dlc624vlSNqlA6I7ejKBx7KrqElyP0o=;
        b=rvx1qkuAJnnnigC6mVd4sheTuG7svlF1TbDfIHNX+IiUk1h2KykSN7fDxw6gHz0UiT
         fjR72ZqmLQIEfCq42o3dNYJmtD5Y1J1FY332fDMOjkQaVzYYKZtpgp4qJnxxzjIqYEAF
         g2cHalGRoD19lTeBphjM8vudIKXwNN+NOBR2rQsrm9Gy4+siCePs14Z9af3clOmixysp
         4Ubl1jmGfVRF9dWWI927j/IUjtAKTxOq7xcrtpEF0EAtYw53GU8pLvzfEYm8u0rGrnOH
         OdJCyJS2WYxYpNHYB0GZ0gFLlqXWK6BINe3A3IihEaKtnK05Alh+v/LNIzFXlO1wZZsj
         QG5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789145989; x=1789750789; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2uhrPGOUxIl6L+y/22qICqI3fsFdOGb1uQu3VWhlcuY=;
        b=GVth/GnGvmdWfHQsknnB3DmL49ugwwUgSHokD+PgdBXTL+E5/bKqBoyHS658Dy6kA5
         Db007AEVNy6VeFDtpAJTXTgt8A2Q6UtWhIQMbB4YmqqVqjrQYroSK2HlwvIzSZS+iyaA
         hLQRs/VrVdYMx5FNg1FPb48Z/i5vTacScw3CQJud0L/75OboMnB4WD20cLl3V/DDJ5zF
         qcr1IZo/M5SaUw9c2nmd7N1X1hnfseXXkmgrE3vO1lQZt4yZE5+BQGYtMOg7QY3puDM0
         PuwqelnG2aJqni25DzXGHBwyipvL8lFrLhoL/KZF9CxI2Pf8ZyJHJyY+5fEXREqEukRM
         e/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789145989; x=1789750789;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2uhrPGOUxIl6L+y/22qICqI3fsFdOGb1uQu3VWhlcuY=;
        b=K3bi4WsMTXIz9b/dY2b3an5bCa4KhT2Xq7bnf2SutKJKWRsWV/0pdOu7Clf8B01ldp
         TvAVzG7srMRA+mEHPzyBQtjOYUGSDUL7TSPvRZoqUf+Y87nClk6O45smCO2dJRX2+YM0
         0S1kGUkw7wFC8u1F9OHUi/3iP2XVFfdJiurn1lDoRSWil7u1ZO//gyA+190qZ6m5+FhO
         fv9w32SphVGRNO3YBmN7SW/wuZm5kW+ekUzGUcaq56ndWDpDSqfQtcCO4G+FAntMMfWa
         vNgMGQ4vo6QEjYOQcy2dAxEZyuHmZpSwv9CqKadY5Fp/IPB0Uw8eXcCKDVw+h/MKHz2i
         GDfA==
X-Forwarded-Encrypted: i=1; AKwUvBzfypqKBZ24ylGfGMFoIzuRToVpcv3UW+zms2ilaMu8fM7Evm6VeYpc2U+CqfyRGmrjcqAzq5/7h9eutbA=@vger.kernel.org
X-Gm-Message-State: AFuF++lmHw49yOORDBdXm0HCClfnCtdDFXFodhbmSeKHuzk3MEvGpFX3
	FArHxNmyPEt1a4nAzPZYb4b7ehCqdy8xwVb4IWL31ou3MXHOa6AqJwfJsjBI7vnbXtobmpqmK0J
	Q7uytXf0iQ9WeqUMs50Nj6n1aOS1Wb/3q8MzI
X-Gm-Gg: AYBFou0ZAWvZ80LZxfvww8dCb3ItZn0jSYqx1+ap6lp5Pk8MZQvj9Cwfcv8/8aXpjQx
	f0DtRaNg9Ud218at/iQV6YmOnfZuq+k0iXE8b3Aj+pH4bjpn3VAj2oY4sxdkqDOHpNIYbzMXEXC
	S3ZcJ3zAxyx7gcISAXpkEB975dsJ02cOevmSWK3453ywli7TUI6tFR3xks7+VKUMzmD1hcCxk/l
	bo5xiKWs7H+L3ABkYE+l404s+kPEGXe/8xdpJuP4yLIO5yt228WSnU2ffVxFazZEKdbrg5esILt
	FfDfiKw9/9NupImR6bjAMYFijEtt6FFpYjIYJRR8SQ1hEegFIYxHm4YL
X-Received: by 2002:a17:907:cf84:b0:c25:cb7a:12d6 with SMTP id
 a640c23a62f3a-c29665b8e3emr247305866b.14.1789145989030; Fri, 11 Sep 2026
 09:59:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jiaming Zhang <r772577952@gmail.com>
Date: Sat, 12 Sep 2026 00:59:09 +0800
X-Gm-Features: AcwNN1UUNO3i6PqN_24xS0_k4t58clubd_7UwfpHS3AgWq85p9ytycCIUTBraVE
Message-ID: <CANypQFabseTuRiyz2pGkc_Qj0moGDnY7KEp1qdTOqkw6gAL3hw@mail.gmail.com>
Subject: [Linux Kernel Bug] possible deadlock in l2cap_chan_connect
To: marcel@holtmann.org, luiz.dentz@gmail.com, linux-bluetooth@vger.kernel.org
Cc: ali@iusegentoo.com, kees@kernel.org, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, nicoyip.dev@gmail.com, suunj1331@gmail.com, 
	syzkaller@googlegroups.com, r772577952@gmail.com
Content-Type: text/plain; charset="UTF-8"

Dear Linux kernel developers and maintainers,

We are writing to report an issue discovered in the Bluetooth subsystem.  The
issue is reproducible on the latest version of linux (v7.3-rc2, commit
df2908090cda368b01ff43709f51890076c56157).  Below is the kernel report:

======================================================
WARNING: possible circular locking dependency detected
7.3.0-rc2 #42 Not tainted
------------------------------------------------------
syz-executor108/9473 is trying to acquire lock:
ffff8880467900b8 (&hdev->lock){+.+.}-{4:4}, at:
l2cap_chan_connect+0xa0/0x1130 net/bluetooth/l2cap_core.c:7281

but task is already holding lock:
ffffffff8fdbc6c0 (rfcomm_mutex){+.+.}-{4:4}, at:
rfcomm_dlc_open+0x95/0xee0 net/bluetooth/rfcomm/core.c:426

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (rfcomm_mutex){+.+.}-{4:4}:
       lock_acquire+0x116/0x350 kernel/locking/lockdep.c:5942
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x184/0x1590 kernel/locking/mutex.c:821
       rfcomm_security_cfm+0x41/0x450 net/bluetooth/rfcomm/core.c:2222
       hci_encrypt_cfm+0x384/0x500 include/net/bluetooth/hci_core.h:2242
       hci_encrypt_change_evt+0x5fa/0xce0 net/bluetooth/hci_event.c:3674
       hci_event_func net/bluetooth/hci_event.c:7887 [inline]
       hci_event_packet+0x665/0xec0 net/bluetooth/hci_event.c:7938
       hci_rx_work+0x3ee/0x1070 net/bluetooth/hci_core.c:4041
       process_one_work kernel/workqueue.c:3396 [inline]
       process_scheduled_works+0xc85/0x18f0 kernel/workqueue.c:3479
       worker_thread+0x8a3/0xda0 kernel/workqueue.c:3560
       kthread+0x38c/0x480 kernel/kthread.c:436
       ret_from_fork+0x509/0xb70 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #1 (hci_cb_list_lock){+.+.}-{4:4}:
       lock_acquire+0x116/0x350 kernel/locking/lockdep.c:5942
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x184/0x1590 kernel/locking/mutex.c:821
       hci_connect_cfm include/net/bluetooth/hci_core.h:2163 [inline]
       hci_remote_features_evt+0x51c/0x920 net/bluetooth/hci_event.c:3786
       hci_event_func net/bluetooth/hci_event.c:7887 [inline]
       hci_event_packet+0x665/0xec0 net/bluetooth/hci_event.c:7938
       hci_rx_work+0x3ee/0x1070 net/bluetooth/hci_core.c:4041
       process_one_work kernel/workqueue.c:3396 [inline]
       process_scheduled_works+0xc85/0x18f0 kernel/workqueue.c:3479
       worker_thread+0x8a3/0xda0 kernel/workqueue.c:3560
       kthread+0x38c/0x480 kernel/kthread.c:436
       ret_from_fork+0x509/0xb70 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #0 (&hdev->lock){+.+.}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3209 [inline]
       check_prevs_add kernel/locking/lockdep.c:3328 [inline]
       validate_chain+0xa41/0x2560 kernel/locking/lockdep.c:3952
       __lock_acquire+0xbe0/0xf10 kernel/locking/lockdep.c:5288
       lock_acquire+0x116/0x350 kernel/locking/lockdep.c:5942
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x184/0x1590 kernel/locking/mutex.c:821
       l2cap_chan_connect+0xa0/0x1130 net/bluetooth/l2cap_core.c:7281
       l2cap_sock_connect+0x5c8/0x7d0 net/bluetooth/l2cap_sock.c:255
       kernel_connect+0x116/0x180 net/socket.c:3755
       rfcomm_session_create net/bluetooth/rfcomm/core.c:808 [inline]
       __rfcomm_dlc_open net/bluetooth/rfcomm/core.c:385 [inline]
       rfcomm_dlc_open+0x924/0xee0 net/bluetooth/rfcomm/core.c:428
       rfcomm_sock_connect+0x2f7/0x650 net/bluetooth/rfcomm/sock.c:421
       connect_socket net/socket.c:2141 [inline]
       __sys_connect_file net/socket.c:2166 [inline]
       __sys_connect+0x30e/0x430 net/socket.c:2183
       __do_sys_connect net/socket.c:2189 [inline]
       __se_sys_connect net/socket.c:2186 [inline]
       __x64_sys_connect+0x7a/0x90 net/socket.c:2186
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x170/0x540 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  &hdev->lock --> hci_cb_list_lock --> rfcomm_mutex

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(rfcomm_mutex);
                               lock(hci_cb_list_lock);
                               lock(rfcomm_mutex);
  lock(&hdev->lock);

 *** DEADLOCK ***

locks held by syz-executor108/9473: 1, last CPU#0:
 #0: ffffffff8fdbc6c0 (rfcomm_mutex){+.+.}-{4:4}, at:
rfcomm_dlc_open+0x95/0xee0 net/bluetooth/rfcomm/core.c:426

stack backtrace:
CPU: 0 UID: 0 PID: 9473 Comm: syz-executor108 Not tainted 7.3.0-rc2
#42 PREEMPT(full)
Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix,
1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x10e/0x190 lib/dump_stack.c:120
 print_circular_bug+0x37e/0x3a0 kernel/locking/lockdep.c:2087
 check_noncircular+0x12f/0x150 kernel/locking/lockdep.c:2219
 check_prev_add kernel/locking/lockdep.c:3209 [inline]
 check_prevs_add kernel/locking/lockdep.c:3328 [inline]
 validate_chain+0xa41/0x2560 kernel/locking/lockdep.c:3952
 __lock_acquire+0xbe0/0xf10 kernel/locking/lockdep.c:5288
 lock_acquire+0x116/0x350 kernel/locking/lockdep.c:5942
 __mutex_lock_common kernel/locking/mutex.c:646 [inline]
 __mutex_lock+0x184/0x1590 kernel/locking/mutex.c:821
 l2cap_chan_connect+0xa0/0x1130 net/bluetooth/l2cap_core.c:7281
 l2cap_sock_connect+0x5c8/0x7d0 net/bluetooth/l2cap_sock.c:255
 kernel_connect+0x116/0x180 net/socket.c:3755
 rfcomm_session_create net/bluetooth/rfcomm/core.c:808 [inline]
 __rfcomm_dlc_open net/bluetooth/rfcomm/core.c:385 [inline]
 rfcomm_dlc_open+0x924/0xee0 net/bluetooth/rfcomm/core.c:428
 rfcomm_sock_connect+0x2f7/0x650 net/bluetooth/rfcomm/sock.c:421
 connect_socket net/socket.c:2141 [inline]
 __sys_connect_file net/socket.c:2166 [inline]
 __sys_connect+0x30e/0x430 net/socket.c:2183
 __do_sys_connect net/socket.c:2189 [inline]
 __se_sys_connect net/socket.c:2186 [inline]
 __x64_sys_connect+0x7a/0x90 net/socket.c:2186
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x170/0x540 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f86d4e40b4d
Code: b3 66 2e 0f 1f 84 00 00 00 00 00 66 90 f3 0f 1e fa 48 89 f8 48
89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d
01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff9b4b4618 EFLAGS: 00000246 ORIG_RAX: 000000000000002a
RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 00007f86d4e40b4d
RDX: 000000000000000a RSI: 0000200000000240 RDI: 0000000000000004
RBP: 0000000000000003 R08: 000000ff00ff7000 R09: 000000ff00ff7000
R10: 000000ff00ff7000 R11: 0000000000000246 R12: 000055558c9a6378
R13: 0000000000000010 R14: 00007f86d4ec50ce R15: 0000000000000001
 </TASK>

Following is the root cause analysis for this issue, note that the
analysis is performed with the assistance of LLM, but we try our best to
ensure the accuracy.

lockdep reports a cycle between three mutexes: hdev->lock, hci_cb_list_lock,
and rfcomm_mutex.  Two paths take the locks in opposite orders.  A connect()
on an RFCOMM socket runs the whole session setup under rfcomm_mutex, and the
L2CAP connection it opens along the way takes hdev->lock:

rfcomm_dlc_open() <-- takes rfcomm_mutex
 rfcomm_session_create()
   kernel_connect()
     l2cap_chan_connect() <-- takes hdev->lock

The other path starts at the controller.  hci_encrypt_cfm() and
hci_auth_cfm() are only ever called from HCI event handlers, which hold
hdev->lock, and the RFCOMM security callback takes rfcomm_mutex from there:

hci_encrypt_change_evt() <-- takes hdev->lock
 hci_encrypt_cfm() <-- takes hci_cb_list_lock
   rfcomm_security_cfm() <-- takes rfcomm_mutex

When the two paths overlap, hci_rx_work() blocks on rfcomm_mutex while
holding hdev->lock, and the connecting task blocks on hdev->lock while
holding rfcomm_mutex.  Neither can make progress, leading to a deadlock.

Following is our suggested solution: The confirmation callback only records
per-channel state that the krfcommd thread acts on later, so it does not
have to run in the event path at all.  Deferring it to an ordered workqueue
keeps that work serialized under rfcomm_mutex and takes rfcomm_mutex out of
the hdev->lock nesting.

We are actively working on a patch, if the above solution is acceptable,
I would be happy to submit a formal patch for review.

The kernel console output, kernel config, syzkaller reproducer, and C
reproducer are available at google drive:
https://drive.google.com/drive/folders/1Q-Eu5dpQCMH80lEtunLGvK-_oheGkT2O?usp=sharing

Please let us know if any further information is required.

Best Regards,
Jiaming Zhang
