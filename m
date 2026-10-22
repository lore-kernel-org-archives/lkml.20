Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660157;
	b=X7mNGwvGyyUJkrGkGimEW+s+I/ClImKvqMQrs/Vj2rob8en4RnvGjshScqwBxFcXtyKz
	 rOdlKfukXl1mFKNciSP8XpfMiRX8Zzw2VPIEIgkcJPAT1WrqcvA5XRboSbcrwRdlicYKe
	 cfl9Iey/iOVYDOZjE4emafO9C143gGPu0dB/YwaTsS1IXov/KgXEoroP+P/oQGKrNqTzG
	 EdD1NXgQG2BXid4eAQa2l+kRtpsnW/O/pbcKb6x+t7jaqQ95tIyyJsVBH2MwiLVFVHaPG
	 YQp0y223vvr16aebWHNnXX+bUkx6YzJUertCBhZKz9v2NlWqt8WFElthmdJN163ThXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lFKRiSem7YLaN/MRPmgMwVevdlnMfUBDEjFcSaNLdvc=;
	b=kRocDpc59v6Xm9UWmoPKjgJ8ew3WHQuBlYSapweTuQsf8G7giZ77BDqEpPLwtOe8Ou7k
	 fCN93bV32g9epjtShvmUqlfhN7JOuTjbwYQBz+9nhcz79iyCC1x55zZj+9ZuXv8Jx7l5V
	 ilWvMiqFxnQmncV23Ty4QyV8j7OcEnxL1T1lrxBRwG8L4LnlVA6TBB8PYx5v2yeb0hECF
	 dh1VcWi9pg5lYSOKUYoaj/9yuopAzZEZw4RnkfCZpbPzdoHHS3VvXqLnqCRFkEmk1NN/7
	 a+8B+OnN/7GxPkO46iB5youX3VNqyJMLmAMBuAiE55lF0Qmhugh+PsynrEzRmGfCNCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HHWowCId;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856F9606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 856F9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HHWowCId
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc751eddf25so794878a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792660157; x=1793264957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lFKRiSem7YLaN/MRPmgMwVevdlnMfUBDEjFcSaNLdvc=;
        b=HHWowCIdQ/KaURB5tsdDq7pFAsBgsLRT1B7zfzgXtatXqIkh8OK5/Yte5Pn5g1YUF4
         HwUqPc+eQOpICFOe7hdxe3oVR0KIIgOAHVZYFv+qRTzpz9DdjBHLPcIHu3UnnEKe7pXN
         NIWVjfDZx2hNVH7+Z2UEr+vtoheeQG2IYWrpDKKR2j44Ll6BwfIqlKOmtDKY8xKR5Vb0
         lFU0juowmzC+N2PLl6FtgDg0KJnaxughBdraa3V3eiuRdKpF8mC9J7Qor4aKmot/ooOL
         NVIslYVMSJZJdwK9QMpLyNqzd9Z6ESANo89kuGQDBFDlLh+CnKS/mGSA3EEgyHJIXzrx
         0h4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660157; x=1793264957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lFKRiSem7YLaN/MRPmgMwVevdlnMfUBDEjFcSaNLdvc=;
        b=NUUe+fXjqr9hEyKmDJHuL2vaoauwOLm0iVIRvu7at1dx2DIXeHYeyYCKfK9NlKLoTi
         DSqMr/bzrM/A0AvtqGzrhq4OzWC/ZWml+OvtE41CnIdIqvhZjOJNDPxFo9eyQz9yYx8b
         VfvkJ0OS5VXeH5Hy8mD6WDou5MEl6M0xd0Snt0xB7Va7V/sxyDWpa4v5AusFku8vlbgz
         svHKW7yHvSxaxsImy2wvIzMz9VYMjXrTUNTLWwuaTC2DslXijtsuIL7lPH8qMldpiziY
         KXBs87vc3w+G3yLoRNj2JfDnrUNQpB1zXPCHdHvYe5GVm0RmW1zrVX+NBi/MSy3aYdww
         yR/Q==
X-Forwarded-Encrypted: i=1; AKwUvBy+Ljaj4VqHqGhZNOR+9yRGBL3jsc7JhgAdp7TxtF4YpVLgTaQdY4l+1AvMy/XKw9qVmQtOACkmWStc7Rk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgs5VQ72/Iiy7BuP7KGKDdI7Jt37KMQ9briSEoTID2BLOK1Iz7
	NJCnlXY9lsdu3egPzXAR9NEJCQoTG/JdEfMu8EruH54jiTH7NlYwnWi2
X-Gm-Gg: AYBFou2OcMYDZzRVzYAcwINpDDyA39Jq1hTPJJSQj+wrKQg/tXgPwnJ5GOTgE5OQUNr
	0W4dKuPBgGPu1YKngog5R8tlKMdAa1u9EfVUPSyLvLvWM75738SJiHqlRn1++z4ftNqQSfDXzff
	FgHhC08m7NmWrDVzxuEoK+azChSQACqRkoyLFbe1aJKB9vXGuwU+2rGgHikC7my5aQg2qWmjJLR
	gUo7aKwTVIhv8oMc8GsHfQkuAP136Yilkl4s53Ga7mClPg9/OpAS8SqcXwPEbF5vAvgvlhDyWiU
	Lo3KXyh2jMPy0CcYhecF7/xAiCH+A2JQI+T9sh/kIyAji56ZyJSdhYRDLFckH7MywY5uImc2pgE
	jLMqhSyjzpT+yfetC8mb5c17kXvSJ4Iv5lAGIS8gFRh16Stk8f2RjSsR0b9fdddFlwNjgDquaow
	ZNPsCt6rnZ05pTLqz351rZ7JaDhUtzC7PSw9bDOEvomIMj93bD2WeSSqNwnsbfmTWfPve25Khqn
	bq1T8f+ZjwBAMbu8OFabxxlzIKMPZLWjehpfca44iVcVGuEFH4=
X-Received: by 2002:a17:90b:5788:b0:3ac:74b3:a8f3 with SMTP id 98e67ed59e1d1-3ad86f43374mr3719443a91.44.1792660156804;
        Thu, 22 Oct 2026 02:09:16 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48a573fsm3460469a91.10.2026.10.22.02.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:09:16 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com
Cc: heming.zhao@suse.com,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v2] ocfs2/dlm: drain join handlers before releasing module text
Date: Thu, 22 Oct 2026 17:09:10 +0800
Message-Id: <pm-ocfs2-objects-candidate-0076-v6-12de5f4628f57fba3be3@gmail.com>
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
Content-Transfer-Encoding: 8bit

The code for a registered DLM handler must remain resident until its
last invocation finishes. dlm_unregister_net_handlers() only removes
dlm_join_handlers from the o2net registry. o2net_handler_get() takes a
kref on the wrapper, but that reference does not pin ocfs2_dlm text.
o2net_process_message() calls nh_func after dropping o2net_handler_lock.

With CONFIG_OCFS2_FS_O2CB=m, ocfs2_dlm can be loaded independently of
ocfs2_stack_o2cb while nodemanager continues handling messages from a
configured, heartbeating peer. If no dependent module or module reference
prevents normal unload, the following ordering is possible:

  Receive worker                       Module unload
  --------------                       -------------
  o2net_handler_get()
    take wrapper kref
    drop handler lock
  <preempted>
                                       dlm_exit()
                                         unregister handlers
                                       release DLM module text
  call saved nh_func
    in released module text

Use o2net_unregister_and_flush_handler_list() in the shared DLM
unregister helper. It first prevents new lookups, then waits for the
ordered o2net workqueue to drain, including a concurrent destruction of
that queue. The acquired invocation therefore finishes before dlm_exit()
returns and the loader releases the callback code. The same helper
covers partial registration and dlm_init() error unwind before module
memory is released.

Skip the drain when the private join-handler list is empty. Early
dlm_init() failures can reach this helper before any handler has been
published. Partial-registration failure also reaches it a second time
after the first call has already unregistered and drained the list.
Neither case needs to take o2net_wq_mutex or drain unrelated work.
The list is changed only by serialized module init/exit paths; a
nonempty list still uses the full unregister-and-flush helper.

Oops report as below:

    Oops: int3: 0000 [#1] SMP KASAN NOPTI
    CPU: 2 UID: 0 PID: 54 Comm: kworker/u16:3 Not tainted 7.3.0-rc4-next-20260921-pmb-ocfs2-functional-v1+ #1 PREEMPT(lazy)

Hardware identification omitted.

    Workqueue: o2net o2net_rx_until_empty [ocfs2_nodemanager]
    RIP: 0010:0xffffffffc0423871
    [Instruction byte dump omitted.]

Register dump omitted.

    Call Trace:
     <TASK>
     ? o2net_rx_until_empty+0x19b1/0x3300 [ocfs2_nodemanager]
     ? __pfx_o2net_rx_until_empty+0x10/0x10 [ocfs2_nodemanager]
     ? lock_acquire+0x190/0x300
     ? process_one_work+0x935/0x1b40
     ? process_one_work+0x834/0x1b40
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? lock_release+0xc8/0x290
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? process_one_work+0x9a8/0x1b40
     ? __pfx_process_one_work+0x10/0x10
     ? lock_acquire+0x190/0x300
     ? lock_is_held_type+0x8f/0x100
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? worker_thread+0x65c/0xe40
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __kthread_parkme+0x177/0x220
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_worker_thread+0x10/0x10
     ? kthread+0x351/0x460
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __pfx_kthread+0x10/0x10
     ? ret_from_fork+0x659/0x940
     ? __pfx_ret_from_fork+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? __switch_to+0x74f/0xf70
     ? __pfx_kthread+0x10/0x10
     ? ret_from_fork_asm+0x1a/0x30
     </TASK>
    Modules linked in: ocfs2_nodemanager [last unloaded: ocfs2_dlm]
    ---[ end trace 0000000000000000 ]---

Fixes: 6714d8e86bf4 ("[PATCH] OCFS2: The Second Oracle Cluster Filesystem")
Cc: <stable@vger.kernel.org>
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
Assisted-by: LLM
---
Changes in v2:
- Skip unregister-and-flush when the private join-handler list is empty,
  covering early dlm_init failures and the second cleanup after
  partial-registration unwind.
- Retain the full unregister-and-flush helper for every nonempty list; do
  not change the generic o2net helper.

Link to v1: https://lore.kernel.org/r/pm-ocfs2-objects-candidate-0076-v5-dd198d8a9358ad81f70e@gmail.com

 fs/ocfs2/dlm/dlmdomain.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/ocfs2/dlm/dlmdomain.c b/fs/ocfs2/dlm/dlmdomain.c
index 97bb9400e24b..a7dc3da6dfc7 100644
--- a/fs/ocfs2/dlm/dlmdomain.c
+++ b/fs/ocfs2/dlm/dlmdomain.c
@@ -2215,7 +2215,8 @@ static LIST_HEAD(dlm_join_handlers);
 
 static void dlm_unregister_net_handlers(void)
 {
-	o2net_unregister_handler_list(&dlm_join_handlers);
+	if (!list_empty(&dlm_join_handlers))
+		o2net_unregister_and_flush_handler_list(&dlm_join_handlers);
 }
 
 static int dlm_register_net_handlers(void)
