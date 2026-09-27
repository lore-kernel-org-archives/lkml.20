Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6694379960
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 09:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790500422; cv=none; b=mAN9sY03hq2+L5le3xQPXJ7jCkm1teZ9Pfsa3h3yztCoZ5G6+ieoafznuSnm6uDQtdvu7OW7yRCQv2BYwJSYdFWSMwqQkZ7C06XYB37WwbgUcHO5iYrPkADK+HoP51CNZVyUqf27dUzhg2uIejav8ORnup5T7gaRghGqgmJ9j1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790500422; c=relaxed/simple;
	bh=mYK3aTJFBHM6xRB867W9xv3//FgmlLtPjoZruC0BXSo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VPdtSr9sRmPamPvGwvsAhxHBS+Bxr8kmhtKk8/G81za0v50pZd+2XrFDArSsv/xlG23dCkXkJvpQPWFal9DPxekXVh4t1Wa1tw1AOzlhs1j7lk30hbzokhSWDwEg1Rap3/6B6tMP2BlRiuhgWrrD20GxtICL4OMq7vUJTcX7qIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pNl2Hieg; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pNl2Hieg"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so1314651a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 02:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790500420; x=1791105220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NTbM9diThuu6Z5mJhXi7/OrqdMjxxh1T13jqFXBOHu4=;
        b=pNl2Hiegx3x8xpwOJmuMVARNI4aRu10sR1BkTobfzt6zTBOinGACmXmIU8sZXZGAA9
         H2gIlN0lkRxKFq+gnluHADM0valR/2mpczF1OEOK3TPjwbA/AvhMJI5UPm4E3R+c21gu
         xChRAXd8Fwr8PSjod2o12wEG+OjBB0te2L3pc4wd4PRybRVam1xt7ycvnXnUBjDRcSJ0
         2NMm4/KEF+gRUnOkZMopiSEMD9fdVWKlTGahb20W3Ic4wLrLfyPm3hLyRWVUtZ2b7uak
         Ezq6JdUuhtFyJUQgvh50jRhITsESnHdUgiYou55YAgHZWn29m1h6ujUGMz1izYtBO6UG
         Zi1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790500420; x=1791105220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NTbM9diThuu6Z5mJhXi7/OrqdMjxxh1T13jqFXBOHu4=;
        b=IjdS/+YneMccpxrghsL8Ayj8rnK4hZQSKRm1+1K1Bs/TdEh7G4a6uE4ubG29xY3F34
         UODvTGpce8CGkbXDGSkS8vPD4oUXi9s33kvvEIQ/KA7vnDWWEzYwIMnItApext42xy39
         +ZM1XlcSvJh6p43GcF6iS66PJX+FJIF4khenTtIcNpsehbFDhQkO9wu9Cp7x376s1sJT
         WZvIawkmlafWmpVTPt0rjFAtfkKyPoPXrwVE9YLD6Cj1Gf1W+Z+pFjCRQAORwgdATtRH
         BCfuLaGT55aFApsXyTu/gbJy0Fe7zlsVaZrUo02sYDZKlExWuYCKEFoekUyl+8mDQST5
         PZGw==
X-Forwarded-Encrypted: i=1; AKwUvBx5LTC93Da/McM9GvWfvtCR9gbxK4F/Yz5Kx9oadSVlYN3D+mAHJzBtOzlmE9Pnic+52rx+A4UXYl1Pn4Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIP8n8i/qAI4QWbg5ZG9r49p3lohSXjCTxAzMPLqo/4/mf2A0Db
	GAIbkSh7rjSsjgTnPY/R1CxBfbW4fyy1ej7yNP27kjzsTlIRtFFGpfDZ
X-Gm-Gg: AYBFou1jZ9fV9rIEDTmE7owjsty9B76oNUZ17EiRlfFhBOMJoZuynWJ/YAozOI3MFbO
	WYu2rtUgstD6KhZ/yP9FfrKzyCQBK3+WoLlLfAjBveFbvtG5EtvRT8mbzXU3L3ZOeIBAAS67eQI
	2e08x6T869H02xCCUOUPpsdSbgrRu5FmtaN8jciX/QP9mXJ05UthDscTwFPyjvwwEHHdDOo5C8y
	BPxkFPdoEKuNxTDDTq1Ux6StcvMJbkdf+hlSLLAOXoWuJ1p3B+O/8Hp0L0KEEmPUJcU2ihbhXvI
	HxkGRFGVbP38YfkQNvALp2LXe+9Yg6Hp9Vzhc6h2RHoyBluM1hR6hn2fct69vsCkqRhAGx4DeFs
	1eFY55aXDzSxkx57H5IC8sYNPlXBV+nR5MvIRMk8iDF5rQkuyvS0nDDnQeWGigLNPdpukXJNvmF
	fW+FOp6PTJLZlRXgl4HYEkw4165x2gdTRXIbDmt7OpGlM6oSj+IMOhBG2K3B+UpiLhs/NyTVPSh
	Did6zNvNbq+6ByQM/j8Q1dstUztnyGvzFMvXVGGNcscH8CL6lsMmD1QB337dFVHulNxOvjqG/qd
	15I1EzrjsK9Ino9zy3++Tt40ZRdFGsd3aDjaHVk1UUNvaPuY
X-Received: by 2002:a17:90b:2604:b0:3a0:d9ee:a2e9 with SMTP id 98e67ed59e1d1-3a0d9eeb955mr3228998a91.45.1790500420124;
        Sun, 27 Sep 2026 02:13:40 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.103])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91475206sm26986425ad.82.2026.09.27.02.13.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 27 Sep 2026 02:13:39 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: mkp@kernel.org
Cc: michael.christie@oracle.com,
	d.bogdanov@yadro.com,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yu Zhang <yuz08559@gmail.com>
Subject: [PATCH] scsi: target: Disable interrupts while holding delayed_cmd_lock
Date: Sun, 27 Sep 2026 19:13:29 +1000
Message-ID: <20260927091329.13482-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

target_do_delayed_work() takes dev->delayed_cmd_lock with a plain
spin_lock(). It runs from system_percpu_wq, so interrupts stay enabled
while the lock is held. Every other acquisition of that lock uses
spin_lock_irqsave(): target_handle_task_attr() and
transport_complete_ordered_sync() in target_core_transport.c, and
target_non_ordered_release() in target_core_device.c.

That was safe while every caller of transport_complete_task_attr() ran
in process context: target_complete_ok_work() from
target_completion_wq, transport_complete_qf() from dev->qf_work_queue,
and transport_generic_request_failure() from the submit and execute
paths.

Since commit 06933066d88a ("scsi: target: Add support for completing
commands from backend context") that is no longer true. With
complete_type=1 on a fabric that sets direct_compl_supp,
target_complete() runs target_complete_ok_work() inline in the
backend's completion context, which target_complete_cmd_with_sense()
documents as "May be called from interrupt context". For iblock that
is the bio end_io.

target_complete_ok_work() starts with transport_complete_task_attr(),
which takes delayed_cmd_lock in two ways:

 - Every ORDERED command is put on dev->delayed_cmd_list by
   target_handle_task_attr() and dispatched from there by
   target_do_delayed_work(), which marks it SCF_TASK_ORDERED_SYNC.
   Its completion therefore goes through
   transport_complete_ordered_sync().

 - A SIMPLE command that completes while an ORDERED command is pending
   drops the last reference to the killed dev->non_ordered, and
   percpu_ref_put() then runs target_non_ordered_release() in the
   completing context.

Both take the lock and, if commands are waiting, call
schedule_work(&dev->delayed_cmd_work), which queues on
system_percpu_wq, i.e. on the CPU that took the completion. Further
completions for the same queue are typically delivered there too, so
one arriving while the work holds the lock spins on it forever.

Reaching this needs complete_type=1, which is not the default
(vhost-scsi, the only fabric with direct_compl_supp, defaults to
TARGET_QUEUE_COMPL), a backend whose I/O completes from interrupt
context, and ORDERED commands from the initiator. Linux virtio_scsi
guests send only VIRTIO_SCSI_S_SIMPLE and never take the ordered path;
any guest that uses the ORDERED task attribute, which vhost-scsi
accepts, does.

target_do_delayed_work() is a work item and always runs in process
context, so spin_lock_irq() is sufficient.

Found by inspection; no runtime report. A single ORDERED command goes
through both acquisitions, so with CONFIG_PROVE_LOCKING the first one
completed through direct completion should produce an inconsistent
lock state report on delayed_cmd_lock (hardirq or softirq, depending on
where the backend completes).

Fixes: 06933066d88a ("scsi: target: Add support for completing commands from backend context")
Signed-off-by: Yu Zhang <yuz08559@gmail.com>
---
 drivers/target/target_core_transport.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/target/target_core_transport.c b/drivers/target/target_core_transport.c
index dcfe945..67c0465 100644
--- a/drivers/target/target_core_transport.c
+++ b/drivers/target/target_core_transport.c
@@ -2359,7 +2359,7 @@ void target_do_delayed_work(struct work_struct *work)
 	struct se_device *dev = container_of(work, struct se_device,
 					     delayed_cmd_work);
 
-	spin_lock(&dev->delayed_cmd_lock);
+	spin_lock_irq(&dev->delayed_cmd_lock);
 	while (!dev->ordered_sync_in_progress) {
 		struct se_cmd *cmd;
 
@@ -2380,12 +2380,12 @@ void target_do_delayed_work(struct work_struct *work)
 		dev->ordered_sync_in_progress = true;
 
 		list_del(&cmd->se_delayed_node);
-		spin_unlock(&dev->delayed_cmd_lock);
+		spin_unlock_irq(&dev->delayed_cmd_lock);
 
 		__target_execute_cmd(cmd, true);
-		spin_lock(&dev->delayed_cmd_lock);
+		spin_lock_irq(&dev->delayed_cmd_lock);
 	}
-	spin_unlock(&dev->delayed_cmd_lock);
+	spin_unlock_irq(&dev->delayed_cmd_lock);
 }
 
 static void transport_complete_ordered_sync(struct se_cmd *cmd)
-- 
2.43.0

