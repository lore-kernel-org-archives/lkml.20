Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793075515;
	b=SdTTGrj1b0B7YlfEjb21xWvQ+JNfb8VvCm62R1QCQ0Rb1GQkJAOtI8qc6Ii2d+8CZq8s
	 XtQI8djX1JsZAQ4ceL16V29Ll3S8uK1m4EvWF4j3se73Zhy2eYyYay3f4812tGs0NNr4G
	 kip2b8OhGDOKzgbZe8JtvHpUKvpEISke2LiJyZzImNctlZe9RClWCmj4Eo5drlJG7syGI
	 NPC4EwlUHrvHnyM2NNr3F6PgeyykamHxSlOPDdltRirYTssOzAbFAqW91a6djq4rpiAPa
	 /+vj+ErBKGZy1o6ZserAyP93lHwsfbMJv/+UdqoC4B7vuEq2JodnQmKiqaI/yiJQjdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793075515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9XcXpTHmLfHB2Be+0WH2R/6aY5PlfN5yRc5K8VlYOZ4=;
	b=pd7lIxnEWeibCeMWZQ8PGHV4mX7I44WlW4L4CnIXh230IBV+5lagvtDVcCkzSnSlpd8r
	 j7bxQqjmaDNzi7J4AtOzpqy/DfhPciG8SGaozn+WQxKBS6LSDFJ7cbnyucG5QHk/nP/Tn
	 RwoIHmtnoM6+RTExZmabI7jLclUcn1fYU7ALYzx2Sl9vLPEVZkqtLtiW0X69nB3JXDF06
	 2TziWchqHCyEfBciRumCZoQ13XUJFNWTA5TX9VNVlkbileSG18kTl45ZP9I5TIlg/hajx
	 uk+8esJuBks1PobPsj4qeJ04YgH8VUNes919u+7ZBLi8X2AJcvr4XSROQaCeg4sxzXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ft+kc9d7;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123A8606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 123A8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ft+kc9d7
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a064fac8cbso2243491b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793075513; x=1793680313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9XcXpTHmLfHB2Be+0WH2R/6aY5PlfN5yRc5K8VlYOZ4=;
        b=Ft+kc9d70C01oMLfCbLd9iWGPhjlf1sER8D1d7A4Xht4btHHd978r+0PHX6XK4pGDc
         zsk96tl1jWKHoqatlBACQde7hGlwGuFGfiU9zb+jAxWfc4g/065naoYH2FHrkQCvQ0UY
         Y3NbFR2W0R8uYkZgLMT46jgTrMLKEe0rrBNwkCfLMC7KSIghk3ZOVWRxlbx1PnQykHiJ
         r3vF7QmJp3BqYeqPc5Ohkp2GpGFE045NNyg30cIehDS2fdqa5fmu6XLx0myEDfV1OQDb
         xMma0Hoq0nkUyw58L1WkLPU+R4cLeE6PVWruk73dIVoeeovUfnsj4/sNIVaiPytviYNj
         hvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793075513; x=1793680313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9XcXpTHmLfHB2Be+0WH2R/6aY5PlfN5yRc5K8VlYOZ4=;
        b=ivGU0BmgDwmRoFApXdYmePVZbnY91e+2AIFcy5hm5pBxLhpRuNE5t6xq3YG+cS83ns
         Io64Jvp/oZSKsuoOYdNMTK8IWfDyq2MbTVe34gA7i6VLZwXJw70NcTW9IpXM3SMp+Gor
         u+1rWjMrdj1XSGGoFlYXbeiFwradVEzrOGsgGBCLxJjU/MbLZhXWupqUK5FDsq+EXyFX
         aTvVJU0BVyRj+OyQARuXMzktXVk7fNoh82Z0pJP879die/6h23kfCM8FPtD3V8s/ZJvw
         CYjREn8s3eTroQLqREGEIasT2Ce08QQ9pQktroA2OxAyCozUMxaEVzyWN8iv/nCkphpn
         iVzw==
X-Forwarded-Encrypted: i=1; AKwUvBzZrStHDailmjoTA7arUO073NYLfYXwGvQQMi/8O6+uErJ29ty2fNmM9dGKWO+ropEiIfsppOB57rKdcpY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKF9YzkVrif/ea5XZICdI90Io0BP3e41zDGkf82eNIx/m1teOQ7
	T+PCsYojQXJJC9g0H6IKiRpCJ8zojfzJNSix3B/OS62JkQzQ0zDKETA2
X-Gm-Gg: AYBFou0fi+1mhDPwbov9C22GHgn041U+d06SCoeVfHsgZJ/2ITUavEtcG5UUEYIQK67
	k7aiPdQCGP3g4KskoSl5Fpr4F0RF8Cj+xXgIAabGTR9QcItcIn5AUDJdKY/hBbdlG+gDMUWwQva
	Hiw8JLkrBR/GcNG9nMvSNtV0hxOcn21yGP0hM/ipaJqPRoYpYbNbq8szc5xXifIp0isHP8ahPr/
	jHTJ+O/0JryFmoZnLEHukAHM4FfB44zQq3gZx3TmrDR6Jq5SP5Ken1xXN5gYzfRNVA8KspzC5PQ
	Nh8Ambyr8uEDS4hkz0UfWmpmCysWe5gz6hO48wM9QPHB0pyx5veOEqZ/tB8ORR9q+ogxPQToZ4/
	5/KuiQecHk5c8+ECtkNBExIPbLYwnEU31scMHEqb/Qrkcr2wEMyqtqshEEU+Wo0RZ4s65+psdI7
	lLirECyDo+AooXr6X9DMD2keTl7cd2OdFzNJvrEPE58CDaWk34zybUSwUy29GlBvvx56aqobK6g
	nH1lXzbLvlkf5JrwjKrBucOgSz0cM/rmhwec38n4i+mAVqNBvCCpXtZTjIRGdf9O0K76Mbt
X-Received: by 2002:a05:6a00:2d91:b0:89e:f8e9:205e with SMTP id d2e1a72fcca58-8a369072e1bmr6269839b3a.40.1793075513176;
        Mon, 26 Oct 2026 21:31:53 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d85e22sm1887537b3a.8.2026.10.26.21.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 21:31:52 -0700 (PDT)
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
Subject: [PATCH v2] ocfs2: keep locking_state within the cluster connection lifetime
Date: Tue, 27 Oct 2026 12:31:44 +0800
Message-Id: <pm-ocfs2-objects-candidate-0011-v7-61e3ef8b1ad44ac2e817@gmail.com>
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

The locking_state reader calls ocfs2_dlm_lvb() through the selected
cluster stack. Its debug-object reference keeps the tracking list alive,
but does not keep that stack selected without a cluster connection.

DLM initialization publishes the file before establishing its connection,
and DLM shutdown drops the connection while the file still exists. Both
the mount error unwind in ocfs2_mount_volume() and ocfs2_dismount_volume()
remove the debugfs subtree only after ocfs2_dlm_shutdown() has returned.
Whenever the disconnect releases the last stack reference, which is the
case for a failed mount and for any unmount without a pending hangup, a
concurrent reader dereferences a NULL active_stack:

  Mount error unwind                  Debugfs reader
  ------------------                  --------------
  ocfs2_mount_volume(): out_dlm
    ocfs2_dlm_shutdown()
      disconnect last cluster
        clear active_stack
                                      read locking_state
                                        ocfs2_dlm_seq_show()
                                          ocfs2_dlm_lvb()
                                            dereference active_stack
  fill_super(): out_debugfs
    remove debugfs subtree

Publish the debug files only after the connection and the mount lock
resources are initialized, so a failed DLM initialization has no debug
reference to drop. Remove them again in the common DLM shutdown helper
before the connection is dropped: debugfs removal waits for readers that
are inside the file operations, and the parent directory is still present
at that point in every caller. This covers the mount error unwind, the
ocfs2_fill_super() failures after a successful mount that dismount with
mnt_err set, and unmounts whose disconnect releases the stack directly.

Only the relevant frames of the report are kept:

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000001: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
RIP: 0010:ocfs2_dlm_lvb+0x38/0xf0
Call Trace:
 <TASK>
 ocfs2_dlm_seq_show+0x36a/0xb70
 seq_read_iter+0x480/0x1110
 seq_read+0x362/0x5a0
 full_proxy_read+0x11f/0x180
 vfs_read+0x1a0/0xc20
 ksys_read+0x111/0x200
 </TASK>

Fixes: 286eaa95c5c5 ("ocfs2: Break out stackglue into modules.")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
Changes in v2:
- Remove locking_state and locking_filter in ocfs2_dlm_shutdown() before the
  disconnect instead of only in the ocfs2_mount_volume() error unwind; the
  old placement missed ocfs2_fill_super() dismounting after a late failure
  and unmounts without a pending hangup, as the Sashiko review of v1 pointed
  out.
- Drop the super.c hunk; the patch now only touches dlmglue.c.

Link to v1: https://lore.kernel.org/r/pm-ocfs2-objects-candidate-0011-v6-14cf2458f4fc90780f76@gmail.com

 fs/ocfs2/dlmglue.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/fs/ocfs2/dlmglue.c b/fs/ocfs2/dlmglue.c
index 88d946466083..412ab0808c59 100644
--- a/fs/ocfs2/dlmglue.c
+++ b/fs/ocfs2/dlmglue.c
@@ -3356,6 +3356,14 @@ static void ocfs2_dlm_shutdown_debug(struct ocfs2_super *osb)
 {
 	struct ocfs2_dlm_debug *dlm_debug = osb->osb_dlm_debug;
 
+	/*
+	 * Drain the readers before the cluster stack goes away: the
+	 * locking_state reader resolves ocfs2_dlm_lvb() through the
+	 * stack. Every caller removes the parent directory later.
+	 */
+	debugfs_lookup_and_remove("locking_state", osb->osb_debug_root);
+	debugfs_lookup_and_remove("locking_filter", osb->osb_debug_root);
+
 	if (dlm_debug)
 		ocfs2_put_dlm_debug(dlm_debug);
 }
@@ -3370,8 +3378,6 @@ int ocfs2_dlm_init(struct ocfs2_super *osb)
 		goto local;
 	}
 
-	ocfs2_dlm_init_debug(osb);
-
 	/* launch downconvert thread */
 	osb->dc_task = kthread_run(ocfs2_downconvert_thread, osb, "ocfs2dc-%s",
 			osb->uuid_str);
@@ -3411,9 +3417,10 @@ int ocfs2_dlm_init(struct ocfs2_super *osb)
 	ocfs2_orphan_scan_lock_res_init(&osb->osb_orphan_scan.os_lockres, osb);
 
 	osb->cconn = conn;
+	if (conn)
+		ocfs2_dlm_init_debug(osb);
 bail:
 	if (status < 0) {
-		ocfs2_dlm_shutdown_debug(osb);
 		if (osb->dc_task)
 			kthread_stop(osb->dc_task);
 	}
@@ -3443,10 +3450,11 @@ void ocfs2_dlm_shutdown(struct ocfs2_super *osb,
 	ocfs2_lock_res_free(&osb->osb_orphan_scan.os_lockres);
 
 	if (osb->cconn) {
+		/* The disconnect below may release the selected stack. */
+		ocfs2_dlm_shutdown_debug(osb);
+
 		ocfs2_cluster_disconnect(osb->cconn, hangup_pending);
 		osb->cconn = NULL;
-
-		ocfs2_dlm_shutdown_debug(osb);
 	}
 }
 
