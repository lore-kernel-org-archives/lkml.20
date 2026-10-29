Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257222;
	b=4tsMA72LZvUjrFwTM9DKY2fyPzk6ezbsimfcUozuTglIygniL1KPOmv4U0VgwVJqkimB
	 NJmheMN1D2L6zOj6iu66S/XN0Ni3alFMlGGt94WjxvKcX8/nGBcKsN4sTKslo0ZjcWQi0
	 DehU7YlT79kZTMd3gYtEACHakKfk56B5xWT4JOQ30VaL2NUyoBoZ2o5jNmcss19ifwwvS
	 OGlMwJg4UhwcMClhHGiY9Oxm+bs9GAFp1Y6hs+Pm+Rz46wsvvGFynvVpSTpCxrvlte8Mb
	 efDxVN8V55Rk39lj77q0xZeoxGwHc2viiwP3WZHAK9Z4AHlUapNKxWog2+g8GhlcUKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e/Ay1TAI3k4EFvZAGF53xm3VA3dt9HJe3tGSfT42bqk=;
	b=ljmpdjg1879iBELKbXsSy9apd8MvJ4RuDLl/+OIot1yZPazJ3OxU/Fnz4+4Ftdm4UIE/
	 x85p3LZ5iluG3OTvRlXgpObe5XFvPXuNPDd0F+RLF+jdSmQjAIShCiKkLQYS3mU8ArIq7
	 l7//MiC9e3SEQfofKLRRhFL1am41IDWCyH+haY4aQgfz4Gr+wa8dzslo79uEXnBxTD0Dm
	 SGS2CDyn7E2CocnDDixEuFM0h+7EPpNUl8H8/InwdDEIugYTRdVnXXu1XVdOeHVsYQLSk
	 qZnpHfxV+3rCGy2EiJuGqu8RXjTlnBqQyMymlik33o59aZK4cDF2oYF6oOI9TZFnJVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xoN701yG;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F82C606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F82C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xoN701yG
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so1254269a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793257221; x=1793862021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e/Ay1TAI3k4EFvZAGF53xm3VA3dt9HJe3tGSfT42bqk=;
        b=xoN701yGP0poJSLS6CtBFv7QYphd2zwCCzC0/FCQJIyJxQLZLQXQ5Zq8tA1/MXRbvW
         kao/Zr2ZZGTyhKyYP6WjqKOk8TxkTgQjhSqyP19LQJWLk/DtD1rO55auxGIzBZUIkJUC
         NKDRpjjU63j8dqHwZqILRNUQmzX1fxIj9p/4gCgl1cziqQXpsTNqGNBV4kt22ieP8N/0
         bq6YI4OOHeFplRWsQJc2jfC4B74LBV0xURfhywKCC//TdtCw8NS5knMmJpzACuQo+M+I
         KgjLt0H+nmAG4V1jJcWZulvU4l5Y0xlLZj227xyznfXhwscd2jwjG0CQnZeNlBr28iuT
         cBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257221; x=1793862021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e/Ay1TAI3k4EFvZAGF53xm3VA3dt9HJe3tGSfT42bqk=;
        b=aU1mdQRWDDShajs4Dcv57Vl6+2y1Sgk06aukGeJ2/nICzAMCDwnl3hiKh7gmfJUpun
         Uj6l8lcnAXQWVtC/OnMXO1DWM+A2MPiZcm8c0l6jEhloRHKC0edBnSBwRTWxBUAOMoyK
         0h5iMRH0qoXrcAtbGjDnqz75GbD7h6H9+QKYkPqR9I5d6YOWzsZS/gaoA2ozsFbpJ57D
         JGiZT3MABXL1jGLfUM+b9dyxfKWNvpGo7hh/v8ucAVqth85/Dy7luX+eiKfYCMymz1NZ
         E8pf+196Y/HLcpJujX1Z1dZ5JFD8dtnid31iPcawaTzGOLYU3bOgDXmwepk716RYoDcg
         LQoA==
X-Forwarded-Encrypted: i=1; AKwUvBy8xo++LweFh+Abkh+/TTY/QoQAh4u6JOvkSUGvR8E1RGulnMgjaXUJ41Vd8adxk/DFJ2rF83L1u9DF++Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxAILdtNuH+ha52V1mrNKd2tJMK1fvDd5vZ+tsiNkaUf29raXW
	F2mZZ3GGvjuYnJ/gAkxYyIRBo1RNySPlliwreZUp0Mk7PwWPVPfe2ueU
X-Gm-Gg: AYBFou0MeWBOtRPlmav4I6x3RYHCKwFxtcmUX9x2wvbz52YQ767HZYeUDVABUNBLDc8
	+AScJ/LR6J7LS89eJ+9x/P0V4By7CagnhUMnXddBlc4rZs89AySfDxIThih/h7PIQ76R1B/D2en
	ap821jsn6rzSeQASO11WUcO0oRFVG0083t11P7MGul8ZhjLwLCPRez/8M1rBGRRNuGVEE3o4Qc3
	wczxxdpiJtv/qF3D4lKP8ye4jWTsL5M2xtdh6A057ZbNeDth4qWw50mcXiv9lrDazCb815JpDkk
	fM3D2vliMCCpnrSNF2marQXY1vat/Araj900k9DCkeNJiwVYPboONGiCXQW4RzuiB2bN8tix4kc
	aZD47s0bHUFAibpjISq2734M0c3sK7RUghdfEKJEkiFb2Vxfyc5Tt3r9kahrNP4YbXRzct3cL7j
	3QyRyMPJoVCeSoyymaxugGVEKHYpvTqh+/37FSvOoszJgUlDVuZxaHMqnpLeH74KSw50l0/vJNV
	HjZ51LcKCyccV15iobJLECwOAo5oUfBIxhmw7BiXzya61Gl6dtAVgH/1SWhxY1FzZdeh7JnhuUB
	BPF1i0Ox2udHRGkupnrT7IS6
X-Received: by 2002:a17:90b:1c01:b0:3aa:f4af:1e0b with SMTP id 98e67ed59e1d1-3ae57e2af4emr3516499a91.8.1793257220765;
        Thu, 29 Oct 2026 00:00:20 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e8fba61sm2765156a91.6.2026.10.29.00.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:00:20 -0700 (PDT)
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
Subject: [PATCH] ocfs2/dlmfs: keep the superblock alive during lock work
Date: Thu, 29 Oct 2026 15:00:13 +0800
Message-Id: <pm-ocfs2-objects-candidate-0054-v6-c3887cceae3b039e591e@gmail.com>
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

Queued dlmfs lock work holds an inode reference, but no active reference
to its superblock. The workqueue is drained on module exit rather than
on each dlmfs unmount, and an inode reference does not stop superblock
shutdown: generic_shutdown_super() reports the busy inode and goes on.

  DLM callback / worker               Unmount
  ---------------------               -------
  queue lock work; igrab(inode)
  worker delayed
                                      drop last active superblock ref
                                      kill_anon_super()
                                        report the busy inode
                                        free the superblock
  finish lock work
  iput(inode)
    access the inode's freed superblock

Flushing the workqueue from a dlmfs kill_sb would not be enough: a
blocking AST can queue new work for an inode that is still alive after
the flush and before eviction, and that work again holds only an inode
reference.

Take an active superblock reference before acquiring the queued inode
reference, with the atomic_inc_not_zero() on s_active that grab_super()
and the NFS and procfs superblock walkers use. Decline to queue if the
superblock is already shutting down; the inode is then being evicted
and user_dlm_destroy_lock() tears the lock down. The existing l_lock
and USER_LOCK_QUEUED flag serialize this with other queue attempts.
Each execution drops its inode reference before releasing the active
superblock reference, outside l_lock. If that releases the last active
reference, the unmount completes on the worker; it only waits for DLM
replies and never for this workqueue.

Only the relevant frames of the report are kept:

Oops: general protection fault, probably for non-canonical address 0xfbd59c0000000026: 0000 [#1] SMP KASAN NOPTI
KASAN: maybe wild-memory-access in range [0xdead000000000130-0xdead000000000137]
Workqueue: user_dlm user_dlm_unblock_lock
RIP: 0010:iput+0x246/0xc10
Call Trace:
 <TASK>
 user_dlm_unblock_lock+0x503/0xa50
 process_one_work+0x9a8/0x1b40
 worker_thread+0x65c/0xe40
 </TASK>

Fixes: 8df08c89c668 ("[PATCH] OCFS2: The Second Oracle Cluster Filesystem")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 fs/ocfs2/dlmfs/userdlm.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/ocfs2/dlmfs/userdlm.c b/fs/ocfs2/dlmfs/userdlm.c
index 617c92e7b925..516e50a5728d 100644
--- a/fs/ocfs2/dlmfs/userdlm.c
+++ b/fs/ocfs2/dlmfs/userdlm.c
@@ -162,7 +162,13 @@ static void user_dlm_unblock_lock(struct work_struct *work);
 
 static void __user_dlm_queue_lockres(struct user_lock_res *lockres)
 {
+	struct inode *inode = user_dlm_inode_from_user_lockres(lockres);
+
 	if (!(lockres->l_flags & USER_LOCK_QUEUED)) {
+		/* Pin the superblock through the worker's iput(). */
+		if (!atomic_inc_not_zero(&inode->i_sb->s_active))
+			return;
+
 		user_dlm_grab_inode_ref(lockres);
 
 		INIT_WORK(&lockres->l_work, user_dlm_unblock_lock);
@@ -275,9 +281,11 @@ static struct ocfs2_locking_protocol user_dlm_lproto = {
 
 static inline void user_dlm_drop_inode_ref(struct user_lock_res *lockres)
 {
-	struct inode *inode;
-	inode = user_dlm_inode_from_user_lockres(lockres);
+	struct inode *inode = user_dlm_inode_from_user_lockres(lockres);
+	struct super_block *sb = inode->i_sb;
+
 	iput(inode);
+	deactivate_super(sb);
 }
 
 static void user_dlm_unblock_lock(struct work_struct *work)
