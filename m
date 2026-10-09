Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400C1414A1E
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533500; cv=none; b=NaRLUntPhMghBMFK8eFlQO0wWdQg1qtxMBYA1FOzDUsRzVFcFxrQ/Skv/Jp2nR3efxOl9FJ+7Y38QbKkU5sWNHN9YfkR6U/UE5nJjmo8Emey9GZjpoUVjVsOl2D4v7UDP+5yxGbOfbr53VI5go79go4fRLn/sYqYITBbHc2df20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533500; c=relaxed/simple;
	bh=HeDRxBrOSXPmm7ASKJRIpyryU/fNruS/AGxremEwaOY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ZFGvW8kye1pO2QKZkGNjqXYdKea8wztlzwuXs9oDJvnlD2yqlI7ofC0TDiFRQPgZzGT5Bc0oRUjtH7GS/SLG51Qs7h5k7Din0Fs/m6bHpirZnjyaCKvfW02yTXjp+onOqCK0ldZEu9H9G15zTyYdo0XTHFTQvtWlLQOBW9VZ5+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dIdzoRW8; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dIdzoRW8"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-873a4edb243so4461743b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 01:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791533490; x=1792138290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jorHnXCyWEhW+lCsEocQ36hL6FicutQ3r2BseWpNOZY=;
        b=dIdzoRW8h8uLimMoeMdBJAIFve+xvzY8S1SW/ZQvuzwXmTU4cCCIHWhFbLnjkIafnP
         7m67OU67cyi13w7vxXp5lyZhH/hney9Em+7y29MQj4Q+NfQceWqZiBeTMmYDeHAMqFD1
         AXTSuMNQpwjq3/L65N6IKEMHxuCYxQb/jbyjDtFNysR/3GTEhGQOyHs9PHWc6EvnPcru
         B+0bF2b6Mk/2FnODWpSRZdgdjRzUkjf9HowN1Dv8V3Z/A4gdVSgqZeMUEd6xjhqWuuuD
         Vp21ff+cFc2QPjQS5zosZE3vLtoXAGccPKXNrb6+unbZlTt3sLz9Vq24nnQyfwbeG7m8
         d12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791533490; x=1792138290;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jorHnXCyWEhW+lCsEocQ36hL6FicutQ3r2BseWpNOZY=;
        b=U0hrREmgf9XkBlRlrW+V99eMiFBTnPNpw5+BGqwOAkhUUS3MTe3SClIeuDjc3Rj2SG
         p58O2PIeo9sPtZKNnUs55d9wYzubea6WhY7UYlfaQrymB3Kxo+4VkwfC5iq5oz6Z3Gz0
         w8UZWIhWFOFBxDv7sjqD7/IPIcBeEnNom9qfXiPKpvOZ6Gw1qy+xDAVXIsd991tvhoVa
         SxafW7bNuPfzuZ3YGcVBboUuwTMVW9zD3B+uGs1my235jCW9TDvFMkG37DwCOaBtnBqV
         hAMTJE+G5suiVyeF1iQcEw4oJ8BPhhuAv2kVRhOzA38deJqAuosxIVJGka89JQlCjgI1
         rrng==
X-Forwarded-Encrypted: i=1; AKwUvByOPfOYt7dZHqVh0+XidJ3QUFrkKyX3ycPPFprUoKDsa8WXiUtx4OdsvrkmSMy+6sdO4TsXVZaJ+E8dfVo=@vger.kernel.org
X-Gm-Message-State: AFuF++nxWDF1iH8/1SBt38toQLIQEWE/BuaA+WmQSl3msbvRAIBzIebv
	QHKg6enEvK7TGE5LQRQJ+Oq3VFpFIsdzfJdl521nu/t4r+2aJB9Ox75E
X-Gm-Gg: AYBFou3Ez9tq4graGpRmA4Y70kc63ZNO61+yjW5Y3YYRWhxjqDHpgZniI9oa0NR6ElH
	ZzODtybRg//NEkIsZDaqQiKDFW+nsZA6C3doyoS0earr/MdwYwXF6S7OOUqN8qXFAf6YDRPO2YN
	N8kx5kmJ+3qTOEeZMzBgvS4eqeQ0msRLNoTdiTsJL5F08FYqVZ0AgMYIHXkYu0Asrq7rRMbSnaW
	dAcCJhNFu8trPEylJvRozsvrBgAmTWJnCLKBtfgRF1VWKSBor2/4mFE37a9veIRMrNLKMefau9K
	5ow1V0fWi0x+kzuhm14QbQP3vwscyoLcjT0AF1eOY4FHQ7TIju9gocW/ZMQLilPBmU8DoGQkI5+
	WKJlmtVh8Jm0fM9DdNXd2iBuE9p7RFExvD6m1WxTwr6ye7Ln0pEDXzE9g9iTY2lW9Pm9MDp1+A9
	WrpQwHrnsbEcpz4goHl4Zlw/efWr6vCGYsASemDPaDDzs7CmVsRn/0/qqNGSH0zziOJg==
X-Received: by 2002:a05:6a21:600f:b0:3dd:85aa:4533 with SMTP id adf61e73a8af0-3e16be72365mr883547637.37.1791533490194;
        Fri, 09 Oct 2026 01:11:30 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e53f8bsm552895a12.24.2026.10.09.01.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:11:29 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com,
	akpm@linux-foundation.org,
	moonafterrain@outlook.com,
	brauner@kernel.org,
	rppt@kernel.org,
	kees@kernel.org,
	julia.lawall@inria.fr,
	kurt.hackel@oracle.com
Cc: ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ocfs2: drain domain handlers before destroying the DLM worker
Date: Fri,  9 Oct 2026 16:11:23 +0800
Message-Id: <pm-ocfs2-objects-candidate-0056-v2-57239c657ac017b50fa1@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The domain workqueue must remain usable until every network handler that
can submit work has finished. dlm_unregister_domain_handlers() removes
handlers from the o2net lookup tree, but an already referenced handler can
still run. Its dlm_grab() reference pins the context, not dlm_worker.

On the final local domain disconnect, a migration receive callback can
have passed dlm_joined() before shutdown changes the domain state, yet
still be preparing its work item when teardown destroys the queue:

  o2net receive worker             Final domain teardown
  --------------------             ---------------------
  Get the handler reference
  dlm_grab(); pass dlm_joined()
                                   Unregister domain handlers
                                   Stop the DLM threads
                                   destroy_workqueue(dlm_worker)
                                   dlm_worker = NULL
  Publish the migration work item
  queue_work(dlm_worker, ...)

The handler lookup reference lets the callback continue after unregister.
The work-list lock does not protect the queue lifetime, and destroying the
queue drains submitted work without waiting for this producer. The late
queue_work() therefore passes NULL to __queue_work() and crashes.

Use o2net_unregister_and_flush_handler_list() at the existing domain
handler unregister point. Removing the handlers prevents new lookups,
and flushing o2net receive work waits for already referenced callbacks
and their post handlers. They can finish submitting while dlm_worker is
still live; the subsequent destroy_workqueue() drains those submissions.
The same unregister helper covers failed registration and join cleanup,
without changing the DLM thread or workqueue teardown order.

KASAN report as below:

    Oops: general protection fault, probably for non-canonical address 0xdffffc0000000038: 0000 [#1] SMP KASAN NOPTI
    KASAN: null-ptr-deref in range [0x00000000000001c0-0x00000000000001c7]
    CPU: 0 UID: 0 PID: 14 Comm: kworker/u8:1 Not tainted 7.3.0-rc4-next-20260921-pmb-bt-functional-v1+ #1 PREEMPT(lazy)

[Hardware details omitted.]

    Workqueue: o2net o2net_rx_until_empty
    RIP: 0010:__queue_work+0x9b/0x1600

[Instruction and register dump omitted.]

    Call Trace:
     <TASK>
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx___queue_work+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? clear_pending_if_disabled+0x83/0x1c0
     ? __pfx_clear_pending_if_disabled+0x10/0x10
     ? __pfx_pmbd_probe_hit_cookie+0x10/0x10
     ? dlm_mig_lockres_handler+0x984/0x1500
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lock_release+0xc8/0x290
     queue_work_on+0xda/0xf0
     dlm_mig_lockres_handler+0x9d5/0x1500
     ? percpu_rwsem_wake_function+0x10/0x480
     ? __pfx_dlm_mig_lockres_handler+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? trace_hardirqs_on+0x18/0x160
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? kvm_clock_get_cycles+0x31/0x60
     ? srso_alias_return_thunk+0x5/0xfbef5
     o2net_rx_until_empty+0x1a55/0x32f0
     ? reacquire_held_locks+0xdd/0x200
     ? __pfx_o2net_rx_until_empty+0x10/0x10
     ? lock_acquire+0x190/0x300
     ? process_one_work+0x935/0x1b40
     ? process_one_work+0x834/0x1b40
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lock_release+0xc8/0x290
     ? srso_alias_return_thunk+0x5/0xfbef5
     process_one_work+0x9a8/0x1b40
     ? __pfx_process_one_work+0x10/0x10
     ? lock_acquire+0x190/0x300
     ? lock_is_held_type+0x8f/0x100
     ? srso_alias_return_thunk+0x5/0xfbef5
     worker_thread+0x65c/0xe40
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __kthread_parkme+0x177/0x220
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_worker_thread+0x10/0x10
     kthread+0x351/0x460
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_kthread+0x10/0x10
     ret_from_fork+0x659/0x940
     ? __pfx_ret_from_fork+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __switch_to+0x74f/0xf70
     ? __pfx_kthread+0x10/0x10
     ret_from_fork_asm+0x1a/0x30
     </TASK>

[Empty module list omitted.]

    ---[ end trace 0000000000000000 ]---

Fixes: 3156d2670166 ("ocfs2: move dlm work to a private work queue")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---

diff --git a/fs/ocfs2/dlm/dlmdomain.c b/fs/ocfs2/dlm/dlmdomain.c
index 97bb9400e24bbf6badea1339dd8de1623fe5bac5..b69baf99a4a6e4d5a5c51664625bafa905dc3bf5 100644
--- a/fs/ocfs2/dlm/dlmdomain.c
+++ b/fs/ocfs2/dlm/dlmdomain.c
@@ -1708,7 +1708,7 @@ static void dlm_unregister_domain_handlers(struct dlm_ctxt *dlm)
 {
 	o2hb_unregister_callback(dlm->name, &dlm->dlm_hb_up);
 	o2hb_unregister_callback(dlm->name, &dlm->dlm_hb_down);
-	o2net_unregister_handler_list(&dlm->dlm_domain_handlers);
+	o2net_unregister_and_flush_handler_list(&dlm->dlm_domain_handlers);
 }
 
 static int dlm_register_domain_handlers(struct dlm_ctxt *dlm)
