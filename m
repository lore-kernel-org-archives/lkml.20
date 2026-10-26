Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793011951;
	b=RRsyGJI1jOHqq6HOmBdNG8kQF0YOuBLamXXsWdc6tBmq6HXcDysXyY//eU7D2lNMLRLE
	 ZuNN2ZxWrCJu8XKYvtyOYdVeTrEuO2wkV9dQF3A5BhZlVKVu1FPJBlUQzEA+HgxpcWY8j
	 jBDW+FXZO7cZQ5rc18R205BijD4KCIFcL68OS5dFPlZhS2cw1h39QJyy0ws1ahRz56dFy
	 2CglhZPz0DR8CEqQt85+bJt0RCIGLmlE0/VOiECvAHJStC7YuDGmj1ZIFNP/vM5qB/5fJ
	 klBkr7ZY9IxxhIGPkj60Nfi8A4zLdteEqEuV9LB3tNe+z9KlWO3kdIByis0EaHdruSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793011951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=owqMREQTLT+Zo8QWHeU7T7LGj9Otntmb2TJUoLFPRXc=;
	b=aUhuVoqxaFaBn2qie9yEYzm4BM60IiVAh77NdjgnGkjFsUq8ORWhQ2XY1BoDS/0a8evv
	 As+IRWsH41autruCfOFq0LRnf80/S+akPutCuJuUvBz3H4jgGc4ZSiRN97+B3Aw70n2al
	 EUPqqC0Kjnc7GGHPL0J0soI/aOQ1ps1x1ojbTwMYFvI06val9FCUpd+B3vQwgDYW1xkma
	 fKEkScSXG0RcQRz+CYm5+i44wA+DzoM9gWaRHrkgPPxdmdoNTq1FKv7JjOurx3iaOo0TQ
	 oYlb+aFaWPXVlN5uO3lrFtvwwFuXM6pSExnI0X0VEGBP7TUT9atZyUQj+/TFKr0CKwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r5er5cJS;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E7D606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1E7D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r5er5cJS
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15ea896ddc8so4859268c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793011950; x=1793616750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=owqMREQTLT+Zo8QWHeU7T7LGj9Otntmb2TJUoLFPRXc=;
        b=r5er5cJSvzXwn7jDrT11oN01E/bRxlwHFle/7BGfEoBV8tSk6Mw3V+nk81Dhd3GQcT
         MCb/IWLYqiCEnymZ4eyPewC5XV4shu2wdobqXW5U0EjqcNw3rmrStXNvSd+cIsJvMF8b
         xn8E2S3A48PMPAJiBrLWHScTUHV0+joxI8xRgKSwF3bwzE2cYwDh96mt6JE4hO3jbaRR
         +wN0dXxYi42CtRUROnKsQaT2w5NK2RCLZrAM+dNkkXhXCgWMkMFxrCAK2rgz2K2cMG7R
         WEV0IdW+MdsFj+95Mf/lrGhYZlFcC6qv4+L5c1aE2TnUHbZr9BzlhYSZ6/cBXKhAdfX7
         lYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793011950; x=1793616750;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=owqMREQTLT+Zo8QWHeU7T7LGj9Otntmb2TJUoLFPRXc=;
        b=m6dbCGPTolVdFElYMt8pgYkRrb8QHn13Ci+VTrDCjtZffuOH1QogiV9bayqIoczRU8
         F0/RwSpRps5bwGCmUy5By06t5bi+PEpZxrFQRZNSDZqL/V2kxq8KYps7LbrXhrJtY3DK
         80l57ilC01AFNJjGJRthRxx8cqlEAZ0xHJevgas+OSOw6/NESArXe85hmofhv/RMRkzQ
         qPzoYuIYCnD+Ap/0/6qyrAa8B9viWRqJeSgwfBSKJ+z9qiFlYT55yP5ksxuMt7uoE1to
         9RH/h24kqFvGRc1GuKdM9HDmtyLb8vNQhtToCKCwZk2zZa2tufAfV5YzSZlzI4IY20sm
         GIwg==
X-Forwarded-Encrypted: i=1; AKwUvBzQ3WQHVyJBkWmhF/ydmGyu6DE7R54C4ffL3zvq3v0PxpgTMTWq6kJO70ukdyjYswFVNW5s+88Tah7nINE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJf6zl/Q2Ts5sieUbo+fDgH+onbvV1gu2r6EMtJNW1o5aHvwty6
	85dBp9U5/AHkm5U6rvASq80HfgT3oH9SsZQcwB0NjkhMgB8Tt1b7WEne
X-Gm-Gg: AYBFou3jaWBydcN/97lvtxU/d49IPVD/IYxjAZFCQNe54NEcopo/iNmFjwFBJfHJn8U
	EJZsahp7wBtTyIBX0AqSHYj7xQoJgSSmo21oTrY0JvPvKUGL1FaNWL7gr1Wyu3rrZlX4yU+D2ao
	aa06+fgrK69K35R0GTiSLfMrHsDP6vsODdwKzoRPjaO41rPupSn1epuVXxpP/8GcH7yMYMC8ypc
	hURv56jSOktBtosVD1R+djE1ymZzOf1FGiYQZCv44JlYm66cV6Zky5i3i+hpBCbnMGFxsKbZtjP
	K2EfvYSnSO2G7faKCm/t/YegBEcHLyqJ/ZWgAPwcpLEIAPW/brGzGwmP3cAYLqpcFQfAN/E8gKp
	H2LymqsnoZ+rcFOEUGklaNh1aboIm4tuD+c7j+mScExPMT1yS776kI0toSp4ABvjXkKrRQMSM4o
	1wWYaJEbmarlvhA64gKVCQ3e5/vAQojZhkUxECAUPCL8Cqo/KDL0EHaytHtKM4ERWIg8Iwxrk/F
	0wBt91GvC+9chhsWkIdyPd1BQnZRNObomO7vMM+8CpA8KlYD29vDGZLHidIcCKPP+GOrX/cIxkF
	K9yL9eEYReh/Oee2tOF7Q0teaS7QK4Nu9RxgQjLN
X-Received: by 2002:a05:701b:420d:10b0:169:bef5:f445 with SMTP id a92af1059eb24-19928f14c3emr10337456c88.4.1793011950077;
        Mon, 26 Oct 2026 03:52:30 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee69sm32439171c88.4.2026.10.26.03.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:52:29 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>
Cc: linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] NFS: pin the superblock across migration recovery
Date: Mon, 26 Oct 2026 03:52:22 -0700
Message-Id: <20261026105222.1150121-1-teel4res@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The NFSv4 state manager walks clp->cl_superblocks under RCU in
nfs4_handle_migration() and nfs4_handle_lease_moved(), then drops the
lock and calls nfs4_try_migration() without holding a reference on the
nfs_server or its superblock.  A concurrent umount can therefore run
nfs_kill_super() -> nfs_free_server() while migration recovery is still
inside nfs4_update_server(): the server is removed from cl_superblocks a
second time (DEBUG_LIST BUG), and once freed by call_rcu() the migration
path still writes server->mig_status and touches server->super->s_root.

Pin the superblock with nfs_sb_active() before dropping RCU, as
nfs_client_for_each_server() already does, and drop it again with
nfs_sb_deactive() on every path: umount then detaches the superblock but
cannot reach nfs_kill_super()/nfs_free_server() until migration recovery
has finished and restored the server's list membership.
nfs4_handle_migration() releases the pin after nfs4_try_migration();
nfs4_handle_lease_moved() releases it on both restart paths and before
its final return.

Umount may now wait for the migration attempt to finish, bounded by the
mount's RPC timeouts, the same trade-off as the other nfs_sb_active()
users.

Link: https://lore.kernel.org/all/20261025180323.349533-1-teel4res@gmail.com/
Fixes: c9fdeb280b8c ("NFS: Add basic migration support to state manager thread")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
v2: add Link, Fixes and stable tags, and remove local validation details from the
commit message.

 fs/nfs/nfs4state.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/fs/nfs/nfs4state.c b/fs/nfs/nfs4state.c
index a5dec04..ff866f6 100644
--- a/fs/nfs/nfs4state.c
+++ b/fs/nfs/nfs4state.c
@@ -2169,8 +2169,12 @@ restart:
 						&server->mig_status))
 			continue;

+		if (!server->super || !nfs_sb_active(server->super))
+			continue;
+
 		rcu_read_unlock();
 		status = nfs4_try_migration(server, cred);
+		nfs_sb_deactive(server->super);
 		if (status < 0) {
 			put_cred(cred);
 			return status;
@@ -2212,13 +2216,20 @@ restart:
 			continue;
 		server->mig_gen = clp->cl_mig_gen;

+		if (!server->super || !nfs_sb_active(server->super))
+			continue;
+
 		rcu_read_unlock();

 		inode = d_inode(server->super->s_root);
 		status = nfs4_proc_fsid_present(inode, cred);
-		if (status != -NFS4ERR_MOVED)
+		if (status != -NFS4ERR_MOVED) {
+			nfs_sb_deactive(server->super);
 			goto restart;	/* wasn't this one */
-		if (nfs4_try_migration(server, cred) == -NFS4ERR_LEASE_MOVED)
+		}
+		status = nfs4_try_migration(server, cred);
+		nfs_sb_deactive(server->super);
+		if (status == -NFS4ERR_LEASE_MOVED)
 			goto restart;	/* there are more */
 		goto out;
 	}
