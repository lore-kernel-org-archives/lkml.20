Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794874659;
	b=pSp+p0OWlGapg3t0/JMppAHwDbJvIHhlEzJKs99RCCUosXex980lunc39g5VUX+D4lKs
	 eWmQz+PCldrZmY29yq1XfkK6ZwK/YS7HS23tTCFxmCJeukRSf+ATYMNMchqWhtsJtMYNG
	 3sPlNKCLpgL4jc1x7iQPbJG+4vuz63qXcDAJ2pVCEDBoaK3rnVCWLwGgSEW81KTLFfUXk
	 VwyjmQwlhJd+kin6OvZ4/cRU6xPCVXUM0BTCVWyY/F0E5da4zAzVnSIax0LbmTmCGMA7c
	 7ki1Tu0Yn+NYA+oWwCuXLb+o5vp9RxKE4EL1Reub8k1LejKP7aOnB1waAVNsjDNpfjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794874659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zgWfq2GAKVFYRnbXQJhzTkKnKyBJBEAwL8blc5h7O/Q=;
	b=klklIAifgoXyen6F/lRHagdW98MzJ5sHwGPSVrpRQVPuIjQPP9tnkovHNUJzQdRX1fsw
	 gafXY65Z6JedXqvAIqhXsOCMay5LGP9rTH2BZhM4crk7T1V84dM61QteHIeS0tAEjSb3m
	 ypp4X5cO0bX0a5h1eRB1fSbfC8NAt8GYILJBZk+u+Eb1SfH4LVVZxB8p1cc7Y1v7laIZO
	 zO68Z4c4CtASQkIsYbtht3CXTqHsxaftrykqdBHkXM+AkTJk0pp8tnVMq/DoZZkeZXwhp
	 ncGWovSXtTHRdaa8X2G8oR5v/N33e22opivflAbCC/ORn2RtIIfiOyBQ4+o6pa7MU2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nm28woXf;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE7E606A335
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEE7E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nm28woXf
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so4934724a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794874657; x=1795479457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgWfq2GAKVFYRnbXQJhzTkKnKyBJBEAwL8blc5h7O/Q=;
        b=Nm28woXfxOXeWkP5NYI99nnzo7HPpdJBy3Hs3DbMuf6fhXKY2d0loq8FZnHmo0dUqb
         w7KiVFdWlZHQIu4jwrCQsJmy6zd6zAiKPbXwwhthK3I+kMZHRqUZDunRaW+2NRmbEKEa
         mBF1hHNwZzzzRBXpDwhxtzZm/mKOAUkltFmfFsoqMFW+uwgRBE475+8rpY+8/goNvluq
         CQdVN/gEZXCF3teuKAfD46fqZivfvHTB4v+LDtu0F1UJNIrzRs+SPsxd1f1nLp4wxwB+
         KRiLylU8jMEp0qiisE56YeCAjSbJhMgpEADDxwbIh7nGYZMGExWkJDa+IkIJ2HVDA2Ao
         g2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794874657; x=1795479457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zgWfq2GAKVFYRnbXQJhzTkKnKyBJBEAwL8blc5h7O/Q=;
        b=gkr+WucM/Zt+L/zXkh1UL5fEvMtEwPKWMpEJcrSCzGKCrubiKOSNSqNChU/VGL0V9J
         0A/3n3ARjCdzaPeVaneretcUgtXi5OlgEfZvWYYKykOX0V55q1y0SP+gHE0ajYA4Ye6k
         Vi1VwC3At4hFWqs4n2MJ5Jm3O1NX2T4umlfUSVh7vORfrqIZxamGmaHFJnGUBdf4Eqpe
         HLVAqNxYIgkTwl33lRFpfUyZUmXR081QrWKgsQXC6ckCSnPLX461WJ1hp5hrFQa+xIA4
         y5HXq1ujBNSbM/zz72FLoX+PZC95/ULP2fCA+WaxJrTIUhb9FyyTUmRTt1RjEOXeKfIi
         baVw==
X-Forwarded-Encrypted: i=1; AL+hErGk8oW5Ifo/ZBHoVnCN1fMSCl54dhi8w29FffQqRPrHDjUWwQGIzq9mOMdfUs46G9E0DVt4mt6euwGyPBA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uXssK9kp+f0c7nMfOlnRzyXGVLHlFnVdknhCntivjR5PD6LXx
	ZYR/5k63sQ0kXEC5yskRrcsy95CwgdofxeB0R0StMxOQEHckzj0mjWFC
X-Gm-Gg: AZFdTZdyYH2whcfgkUzBrz0FvVJ+Jmq7G4Tu/bSEWD6WONYpBte0jcnwrctA90TcmDI
	A04BDVPsAkpFgfjPcgNEgqz8b3DaXjAwwBT0MNOyCMKdIls1We1BpuMUeSDxWOvmWwPUSJSryU8
	odIz5ZSVTo6rfV+UC2Y6TeEj+4Y0fsjtbGivA8tRWXrx+Pl5ekC03hiMKH7mG7oGbCBD2Q92grW
	8WWm9p3TU3DN4dcS/ETqCWBzxUAwDVNEv9ev1Pl92cw3vH/Twi6YTCKCbnLbJqSlPKGJGnOB/20
	3sgGPT8yCu1bDYKBq7kGPIqajTIlDjywVUxS2pLJiT/PRBjbwJlbgYwiYSz0jRpsOozTzEfgiN5
	EIYGQeYcz/qD/NDkQMcyaprYveBOb7sh5h32e13X/xfx7GnsdkN6u7uVkxpwszVP4S62UwlEIFm
	ZA2pawQ+u/MWZo/nkW9PP48I64AaKP0hU96UU0RHXTFzCSduoPvkUt8lm/pKJTrKed5mToccp2e
	gOf9WeWBY+TtSAQqc1Cirfkw9t7/LzC4pCR5unXMac690Xc31kmb4fX2aSskkgDmglUEVHPfn1z
	F6+BG5UdbzGu5YkWG6Ec8P5W2F8RFiV0fj5vNKU+4T9yrvphidH1MvECJLtE6sYZ415CLnHdHci
	wwh4lm5f6Ovo35xrHBXijwOxS2hTdV5fNclqQTXcfEX/yTefSvjLtM/q8dcLfNkZQcsJU3M8nDD
	aJmd5domxyOMB59MrFCJ/g69HxKMuR0QacCmQB1Uqz
X-Received: by 2002:a17:90b:3f46:b0:3b0:78c8:d56e with SMTP id 98e67ed59e1d1-3b1b0b8f0acmr12280481a91.27.1794874657124;
        Mon, 16 Nov 2026 16:17:37 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abe77179sm1194081a91.11.2026.11.16.16.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 16:17:36 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Paulo Alcantara <pc@manguebit.org>
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Bharath SM <bharathsm@microsoft.com>,
	Allen Pais <apais@microsoft.com>,
	Rachel Menge <rachelmenge@linux.microsoft.com>,
	Hardik Garg <hargar@linux.microsoft.com>,
	Adam Kim <adamkim@microsoft.com>,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] smb: client: fix busy dentry and inode on unmount from late oplock break
Date: Tue, 17 Nov 2026 00:17:32 +0000
Message-ID: <20261117001733.192399-2-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117001733.192399-1-sidchintamaneni@gmail.com>
References: <20261117001733.192399-1-sidchintamaneni@gmail.com>
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

During unmount, cifs_kill_sb() flushes cifsoplockd_wq and deferredclose_wq
before waiting on cifs_sb->outstanding_rreq for in-flight netfs I/O
requests to finish their cleanup_work in cifs_free_request().

While cifs_kill_sb() is waiting on outstanding_rreq, any cifsFileInfo
referenced by an in-flight request (req->cfile) still has cfile->count >= 1
and remains on tcon->openFileList. If the SMB server sends a lease or
oplock break for that file during this window, the demultiplex thread
(cifsd) finds cfile on tcon->openFileList and calls
cifs_queue_oplock_break(cfile), which takes a new reference on cfile and
queues cfile->oplock_break onto cifsoplockd_wq after cifsoplockd_wq was
already flushed:

  Thread 1 (umount)      Thread 2 (cifsd)       Thread 3 (workers)
  -----------------      ----------------       ------------------
  cifs_kill_sb()
  flush(cifsoplockd_wq)
  flush(deferredclose_wq)
  wait(outstanding_rreq)
    [blocks: rreq == 1]
                         SMB2 Lease Break
                         finds cfile on list
                         cifs_queue_oplock_break()
                           queue(cifsoplockd_wq)
                           cifsFileInfo_get(cfile)
                           [cfile->count: 1 -> 2]
                                                cifs_oplock_break()
                                                  ihold(inode)
                                                cifs_free_request()
                                                  cifsFileInfo_put()
                                                  [cfile->count: 2 -> 1]
                                                  dec(outstanding_rreq)
    [wakes: rreq == 0]
  flush(serverclose_wq)
  flush(fileinfo_put_wq)
  kill_anon_super(sb)
    -> generic_shutdown_super()
       BUG: Dentry still in use (1)
       VFS: Busy inodes after unmount!

Furthermore, cifs_oplock_break() itself holds the inode via ihold() after
dropping cfile and may initiate writeback via filemap_fdatawrite(),
spawning new netfs I/O requests.

Fix this by counting queued oplock breaks in cifs_sb->outstanding_rreq
from when cifs_queue_oplock_break() queues the work until
cifs_oplock_break() finishes, so wait_var_event() in cifs_kill_sb() waits
for both in-flight I/O requests and any late oplock breaks to complete.

Fixes: 340cea84f691 ("cifs: open files should not hold ref on superblock")
Reported-by: Adam Kim <adamkim@microsoft.com>
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 fs/smb/client/cifsfs.c | 10 +++++-----
 fs/smb/client/file.c   |  2 ++
 fs/smb/client/misc.c   |  6 +++++-
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/fs/smb/client/cifsfs.c b/fs/smb/client/cifsfs.c
index 8cff7857b4509..9faba158f8b6a 100644
--- a/fs/smb/client/cifsfs.c
+++ b/fs/smb/client/cifsfs.c
@@ -418,11 +418,11 @@ static void cifs_kill_sb(struct super_block *sb)
 		flush_workqueue(deferredclose_wq);
 
 		/*
-		 * Wait for all in-flight netfs I/O requests to finish their
-		 * cleanup_work so that any cifsFileInfo final puts they queue
-		 * to fileinfo_put_wq/serverclose_wq have been queued, then
-		 * drain the workqueue so the cfile dentry refs are dropped to
-		 * avoid the busy dentry warning.
+		 * Wait for all in-flight netfs I/O requests and oplock breaks
+		 * to finish so that any cifsFileInfo final puts they queue to
+		 * fileinfo_put_wq/serverclose_wq have been queued, then drain
+		 * the workqueue so the cfile dentry refs are dropped to avoid
+		 * the busy dentry warning.
 		 */
 		wait_var_event(&cifs_sb->outstanding_rreq,
 			       !atomic_read(&cifs_sb->outstanding_rreq));
diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
index f51653cb6432a..146ff2adfa244 100644
--- a/fs/smb/client/file.c
+++ b/fs/smb/client/file.c
@@ -4023,6 +4023,8 @@ void cifs_oplock_break(struct work_struct *work)
 out:
 	cifs_done_oplock_break(cinode);
 	iput(inode);
+	if (atomic_dec_and_test(&cifs_sb->outstanding_rreq))
+		wake_up_var(&cifs_sb->outstanding_rreq);
 }
 
 #ifdef CONFIG_SWAP
diff --git a/fs/smb/client/misc.c b/fs/smb/client/misc.c
index 4d0df73d15d7a..72a986bfaefc4 100644
--- a/fs/smb/client/misc.c
+++ b/fs/smb/client/misc.c
@@ -371,6 +371,8 @@ void cifs_put_writer(struct cifsInodeInfo *cinode)
  */
 void cifs_queue_oplock_break(struct cifsFileInfo *cfile)
 {
+	struct cifs_sb_info *cifs_sb = CIFS_SB(d_inode(cfile->dentry)->i_sb);
+
 	/*
 	 * Bump the handle refcount now while we hold the
 	 * open_file_lock to enforce the validity of it for the oplock
@@ -379,8 +381,10 @@ void cifs_queue_oplock_break(struct cifsFileInfo *cfile)
 	 *
 	 * Only take a reference if the work is actually queued.
 	 */
-	if (queue_work(cifsoplockd_wq, &cfile->oplock_break))
+	if (queue_work(cifsoplockd_wq, &cfile->oplock_break)) {
 		cifsFileInfo_get(cfile);
+		atomic_inc(&cifs_sb->outstanding_rreq);
+	}
 }
 
 void cifs_done_oplock_break(struct cifsInodeInfo *cinode)
-- 
2.43.0

