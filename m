Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486363C1D70
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540093; cv=none; b=rV4IIk63Eh/tRUqzfonlsXYhShVOhlJW9C7Bzx5jQs+MKmS+c2jz6NW5OMpMiYj4v3dfBGK2jVfdDddBQlzv+IdxaiuqHR8HTLQLqLmTm0HYIB/sI95705hMPAc65fpDwWOfODOZonEtIV+3nVqlRmnFEWQTbPbhTm6ltkA5pho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540093; c=relaxed/simple;
	bh=fsQsZ+2NTBEQHO1bSyIeaS0icE1pgKIaijb3ej7DD3Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=TocF/G9/h2jdvB2EjBEkg/jSa50+yx0OqclW7JvuPYSp/OIiltTvbPH6T/F5TPXAXexwXSUXXxaPECPlmMZ3orO96cI0NiXkIGdgn9Nt+GUk3S/i/sDM/AF5TY9LGHEGrNNqe35q/jM1jyaZJok0pvmuawk/935y/bHs4I4kuEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CKVkCFZS; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CKVkCFZS"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-872024e2b4eso1997916b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 03:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791540091; x=1792144891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2r2j+124EZwxoHjlkMce/YRKhVj0c9JCcBiSTT0WCc=;
        b=CKVkCFZS7U1pL0nuhlzh2M+pSZLrRjrUzucD29NMjbkaPlVG41KxDQI2c8KcBcebuS
         92jtNr7Rs2PfrJv7kb0bm2vBt3BzDDCg4l7EcTUlHiuO3tiS2A9cptRipuyZ9WxS8pG4
         2LlSo6r+VfD3Y7+8QLsa9EqLzbbwTAtWfoJdEFBPyCjroFd7p1H038dcVYxCwuXXHLAU
         WN2O/8O1mcBcBnVuBddcM1jKneAV0ceUYgzXOatRESk9SsmDndYoQ63+m+zIbB7EOFzb
         wFC3Pz/K84qLi+/m2gJtTnBTeogiaHiE7E7go7ykM1rKHSKEUlTQYpq23MJk39MKm5tK
         Xl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540091; x=1792144891;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J2r2j+124EZwxoHjlkMce/YRKhVj0c9JCcBiSTT0WCc=;
        b=TeImYWIX1bkR6GlZipBIZ8rmZ14/sHn6s2PWBQdpH4IWkQjbhAKGMJdaEswzrWaImE
         8a1ArlWkjmC2npY+WUwFKhb95ZsrbG4uvHhewdorAjC0rN+V0OyGM+JIGrgXUinHxV05
         zwuW7GsSGCH3zzps3CsF3+ciMc/mVqAuaC+elQaHiLP7ikb216biGohmTRNLkc6zwAAj
         iyfQeQd/vdgv83Zs2il4jtlfIlZZ3snOA6UoFS5DRQU0qud3C0CKhl3w9iGhMJU3QPFZ
         mS4WMqdDzrPssApb7KDrpO3NNTPCwpGp2Xy6s2DpnAIrP2dU8yZRKC/RdmieTemt2sNy
         71yw==
X-Forwarded-Encrypted: i=1; AKwUvByAbCRw7e5ljJKYAvjfovzAfz5G1shzNTL4ImqY+RodIvaRZfBGPbAFjaGHIpxYMNPsCc6Al5T+8SyZiwE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+kamMWNQ4IOWyYni6s3iQ6iuLIDFl3yAmMt8atYOlYTsMF94l
	r10/Kr6pLrYvs/HnfCrSdTm5iq3Fbx/WX5m1NIXBbWX4LM2DmLeRSMnk
X-Gm-Gg: AYBFou3tyZrMN/C38Xy1D6VAkUtZHQ9HSpC41WvroTTplGZ4ookYELcbss5q4l9ucJL
	/l85rWYPcDDc4Ji5OOtRTjVIzJu6lhJHQHzk5691oLuJupQkQCMzoxsSwN8X7MGM5mnnWXwv+a5
	PieWOVUj46NAkkKRmbgsRjDIdz9EpTWYq3TM9AES3tkJz0X03kf9vmKT9Uy8v4lJxvVGhKGkLdV
	yA/7wgLKi2SnvGzq2c4twLMTqrxWdLZJt3DVNuPu2Fw03Fsve+1TrflYuedileSkCGidbHeTYL+
	TY/C8WirWWGHTPp8348ESKyNvMmX+GMWCPhQ1QfzjxxHkA+Pry9nyie/anELEcpQ8tzrBQ1rrVh
	AZRhY1LGDemToPG5ovYtS/+SyguKU3PEB78ngxYxz7lMXudeEnEE9ZOAc8651V7HPujwCQ6JjZF
	IY3ryNs7DGcDg0+aghJukertGu5xV5vRaMo/jruxUe9CgW8xTgekTwmsl1UQU47bGzb5akRnlwP
	7YG
X-Received: by 2002:a05:6a00:4195:b0:874:705d:f643 with SMTP id d2e1a72fcca58-897c77da504mr1014452b3a.37.1791540091477;
        Fri, 09 Oct 2026 03:01:31 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3107373sm657534b3a.9.2026.10.09.03.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:01:31 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com,
	kees@kernel.org,
	jack@suse.cz,
	rppt@kernel.org,
	hexlabsecurity@proton.me,
	sunil.mushran@oracle.com,
	akpm@linux-foundation.org
Cc: ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ocfs2/dlm: Serialize recovery list teardown with debug reads
Date: Fri,  9 Oct 2026 18:01:24 +0800
Message-Id: <pm-ocfs2-objects-candidate-0049-v2-a5d5091b8900dc3f9849@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Recovery participant records must remain alive while debug_state_print()
walks reco.node_data and formats their fields. The formatter holds
dlm->spinlock, but dlm_destroy_recovery_area() detaches the list under
dlm_reco_state_lock and frees the records without taking dlm->spinlock.

When a recovery master finishes recovering a dead node, a concurrent
open of the domain's dlm_state file can reach the participant list after
the master's last dlm->spinlock section. The following ordering is
possible:

    Debugfs open                      Recovery thread
    debug_state_print()
      lock dlm->spinlock
      select participant
                                      dlm_destroy_recovery_area()
                                        lock dlm_reco_state_lock
                                        detach participant list
                                        unlock dlm_reco_state_lock
                                        kfree(participant)
      read node->state/node_num
      unlock dlm->spinlock

The field read or the next list iteration then accesses freed memory.
Debugfs removal protects the domain lifetime, but session completion
leaves the file installed, so it does not drain this open callback.

Take dlm->spinlock around the existing locked list detachment. A debug
reader must now finish before detachment, and later readers see an empty
list. Keep the frees outside both locks. This also covers cleanup after
partial allocation failure in dlm_init_recovery_area().

KASAN report as below:

    BUG: KASAN: slab-use-after-free in debug_state_open+0x1169/0x12d0
    Read of size 4 at addr ffff88810662ef80 by task dlm-state-stres/896

    CPU: 1 UID: 0 PID: 896 Comm: dlm-state-stres Not tainted 7.3.0-rc4-next-20260921-pmb-ocfs2-functional-v1+ #1 PREEMPT(lazy)
    Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
    Call Trace:
     <TASK>
     dump_stack_lvl+0x93/0xd0
     print_report+0xce/0x630
     ? debug_state_open+0x1169/0x12d0
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __virt_addr_valid+0x20e/0x420
     ? debug_state_open+0x1169/0x12d0
     kasan_report+0xe0/0x110
     ? debug_state_open+0x1169/0x12d0
     debug_state_open+0x1169/0x12d0
     ? __pfx_debug_state_open+0x10/0x10
     full_proxy_open_regular+0x193/0x310
     do_dentry_open+0x595/0x12d0
     ? __pfx_full_proxy_open_regular+0x10/0x10
     vfs_open_consume+0xd1/0x400
     ? srso_alias_return_thunk+0x5/0xfbef5
     path_openat+0x18d0/0x2020
     ? __pfx_path_openat+0x10/0x10
     do_file_open+0x21e/0x470
     ? __pfx_do_file_open+0x10/0x10
     ? _raw_spin_unlock+0x23/0x40
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? alloc_fd+0x3a6/0x6b0
     do_sys_openat2+0xf4/0x1b0
     ? __pfx_do_sys_openat2+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __fput+0x5b5/0xa60
     __x64_sys_openat+0x136/0x1e0
     ? __pfx___x64_sys_openat+0x10/0x10
     do_syscall_64+0x114/0x620
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
    [Register dump omitted.]
     </TASK>

    Allocated by task 880:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     __kasan_kmalloc+0xaa/0xb0
     __kmalloc_cache_noprof+0x28d/0x610
     dlm_remaster_locks+0x147/0x1d90
     dlm_do_recovery+0xde1/0x1580
     dlm_recovery_thread+0x109/0x300
     kthread+0x351/0x460
     ret_from_fork+0x659/0x940
     ret_from_fork_asm+0x1a/0x30

    Freed by task 880:
     kasan_save_stack+0x33/0x60
     kasan_save_track+0x14/0x30
     kasan_save_free_info+0x3b/0x60
     __kasan_slab_free+0x5f/0x80
     kfree+0x308/0x580
     dlm_destroy_recovery_area+0x285/0x460
     dlm_remaster_locks+0x17c4/0x1d90
     dlm_do_recovery+0xde1/0x1580
     dlm_recovery_thread+0x109/0x300
     kthread+0x351/0x460
     ret_from_fork+0x659/0x940
     ret_from_fork_asm+0x1a/0x30

    The buggy address belongs to the object at ffff88810662ef80
     which belongs to the cache kmalloc-32 of size 32
    The buggy address is located 0 bytes inside of
     freed 32-byte region [ffff88810662ef80, ffff88810662efa0)

    [Page and memory-state dumps omitted.]

Fixes: 007dce53a29c ("ocfs2/dlm: Dump the dlm state in a debugfs file")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---

diff --git a/fs/ocfs2/dlm/dlmrecovery.c b/fs/ocfs2/dlm/dlmrecovery.c
index 9d4a2695b9594d1ad8bd60de9cec8ee701355f09..5719c2b88e4292cff38e26b10b29c8a4a0deccda 100644
--- a/fs/ocfs2/dlm/dlmrecovery.c
+++ b/fs/ocfs2/dlm/dlmrecovery.c
@@ -764,9 +764,12 @@ static void dlm_destroy_recovery_area(struct dlm_ctxt *dlm)
 	struct dlm_reco_node_data *ndata, *next;
 	LIST_HEAD(tmplist);
 
+	/* Serialize list detachment with debug_state_print(). */
+	spin_lock(&dlm->spinlock);
 	spin_lock(&dlm_reco_state_lock);
 	list_splice_init(&dlm->reco.node_data, &tmplist);
 	spin_unlock(&dlm_reco_state_lock);
+	spin_unlock(&dlm->spinlock);
 
 	list_for_each_entry_safe(ndata, next, &tmplist, list) {
 		list_del_init(&ndata->list);
