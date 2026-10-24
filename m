Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792858809;
	b=fe5fM6Czib0ddhbiBPSP1oZrRjCFX6t/T9OsRHCbmXm0zxPWz6AyZkY8PM4ezPway8CY
	 4gJ5Bd0iX5OMC5KbsdaiXoZjF/lbVDkga+mfJReNH85T2agZkEIZzutvOOxj5Vbw+0BBc
	 nRbD5MLGq/pd3iYZdRmDDtAf3/hNtw0Sjs/GcBO4hahoyqQL2ipwI4apdNrxsu0Sdn/Na
	 cDQ5YAmIvUWNwnVadZIYowm5CAnCSaXzzy281sbMnjydSmrCqdspWbGA/LcllovcYd1DP
	 pJqg4EtEFlpP1qSriT1uhrlGUZG9bGo+ZwAShxDi3tNoXk0i1YsPFRzsErOyN86+KTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792858809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xwmLnAa6b4VIfgYdyaQibjdMJAMiidZmgGGch02/UIc=;
	b=QoDiGr4x17I3zIowTTZAzlE1Ln8vpWMn4XZsRsDCgMbC2sKUoEoq4lpiKiEIzqXbtk7f
	 v16pAY3YP0D+qulVa1Pj55Q95Yp+RuswwARWpwCaEPRmloYgLrRg2KnE805LnWiA/6Quc
	 54u1U4TmLMiYwQhKf+JQKgYki3Bat/1e8u4/3vxmbl4ItojCbyqjpYAAlCdeoqlon//Ua
	 9RGgKQah+meDMyuncGQ6QIIlgn4ApcQrrXA4KmbKj8A+7K5zuDOPoXRnJDqUEcn+YFPIE
	 c3Iih4+59ytbeyLgpI8kuUBoWUqdRiWSMPwO7Wu9aEjjf4tyhNZ/AyUfZ/nA49fSrEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=grHHy9fn;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073A2606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 16:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 073A2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=grHHy9fn
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd69954c755so1237611a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792858807; x=1793463607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xwmLnAa6b4VIfgYdyaQibjdMJAMiidZmgGGch02/UIc=;
        b=grHHy9fnVHuY1405Ef2orje57iOKu31LW3gCJQfMRR37YW2XFisFHAz89/1atQFlQf
         rJJpHMfaqScvwbEJ1AVGvoUs0loPiS4et2nYDmtYZDRkifwBCN7ebptGLZmrWKDGGY1r
         QzLaifCkRDHXAx77Lq2G5xI7WRjbvAoHQ7S325lPufCq/Ev4qDe8BxK+O1/K6hO5ZAYY
         blieZqe7NZt/qJvea+8EcUmtBxhFy4Swkdd41XGccPXG7TwUAP2T2QRW0JXuAlMIyO6K
         DiTYDg9NsBHkuTbgi4LWiLF0gCJJ5Tlg6jCwTdjKoSCtv0b5pqZifPiRRLJ507mlTvan
         KpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792858807; x=1793463607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xwmLnAa6b4VIfgYdyaQibjdMJAMiidZmgGGch02/UIc=;
        b=Qq879QTShjUAeJA0MTZutoUdAhjl0YxU0ALUiUplmwC/pQ1+Fq+ZTB/xriaYcqdnou
         AbPFIBjkqzQEga3vPJQIxlnJwi5wyD6Y45XeJQUi7iWdpcz1Qe/m87vQGX8XpFIdn76S
         Qx/Sd9Cg0xCUIIjxFCrNdmwvdPBgjgxjUs9UMd1wLgr+ufG6FOeci7AbJJ0b3hI/NXbi
         lRdt/MLIJPBn0Vc1pIFEP5O7Ed6cSI5tNxylMHAW7NuYRKNTdp89cj43uchaXysG2x9J
         hcJnTydqanEBdSxrq3h3ONEUC7FUKi/UTir5HpRMhzfZu/bb1FQNVzYZ9HUwhww8JTZK
         RQtg==
X-Forwarded-Encrypted: i=1; AKwUvBzYFa0LNhtaBNRiq1Z72Ii51TTqyNc+LJPPAhDthcMTfEiP6BZKUuaRdxU2ewPczrhl72f7Kf3Fma3qfzc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcaE/TIQFQTxRmKItTuB61AuHYyQnEWzYhu2kGq67c+TTd1YOh
	ER954+q02vLj+fjHO3id6YgAwl9sdpTXj5z5e8jwBnEtbb8lTsFKCnrn
X-Gm-Gg: AYBFou28SGobVhm2OyFBPmt4iAq8H+G8jHqVLCce6gpXCnhJLRfN8pREDVa2uDqXhrN
	jGQiIeNQ/Vl6SmcZvo8VInIEVCGtBiqPE4oNk2UI0Uo0bDTX4WTqO48DLfztI7vMSOnO4Mawqnh
	J4uvD4/726/AqpEJyOvzR/mFneRvuWLXC7Apsk0Jx6nJIjsteCdScEYH+jtnFJwjo5POvypC9N2
	wSmkEXCzXPwNXQkHNq9GzRzZhTgqbh+zDaX4cIqL7QPWADWLU8DvStKPQBNSg53zBes0OZu/gfK
	Q0DUlIEzjerTs26IKHRw4jTLnCFfhsNAYGeJbeUd9zwoFn+8eyvM4mwHlYX44vhOADSc0urKlpe
	oy8ZOkGbRZu1bHuPKUB9q5f8EbylnCmNmcmvyGHR3+FLrRR2P2z0lS3FKj3eMQKPexvROWcrmu3
	XhjY0n9ViqVA12vp+hQN/h5nB2CQnEyQwbCpawL7QESL6KPJ3Lt+GgN28Gqrwqht6SIR+WQ2aV8
	XmmRWdJquvADF2AcJD58Hc0n3VXKiGHuKfiGfdDmA+BQ438Fq0=
X-Received: by 2002:a17:90b:1645:b0:3ac:9c37:9418 with SMTP id 98e67ed59e1d1-3adead50acfmr2166488a91.19.1792858807236;
        Sat, 24 Oct 2026 09:20:07 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeb8240b5sm2180033a91.0.2026.10.24.09.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 09:20:06 -0700 (PDT)
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
Subject: [PATCH v2] ocfs2: validate move extents against a stable EOF
Date: Sun, 25 Oct 2026 00:20:00 +0800
Message-Id: <pm-ocfs2-move-extents-isize-rrw-v4-d4b80ed0748f84dc3f8e@gmail.com>
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

The move-extents range must be bounded by the inode size used for extent
movement. ocfs2_ioctl_move_extents() checks and clamps the request before
taking the local inode and cluster locks in ocfs2_move_extents(). It also
uses separate i_size_read() calls for the range check and subtraction.

A concurrent truncate can invalidate the first check and make the later
unsigned subtraction underflow:

  Move-extents ioctl                  Truncate
  ------------------                  --------
  check me_start <= i_size
                                      take inode and cluster locks
                                      shrink EOF below me_start
                                      release locks
  compare me_start + me_len with EOF
  set me_len = EOF - me_start
    [unsigned underflow]
  acquire inode and cluster locks
  select extents using the bad range

A truncate after clamping can also leave the range extending beyond EOF.
Conversely, the cached size may be smaller than the size refreshed when
the cluster inode lock is acquired. Early validation can then reject a
valid start or permanently shorten the requested length and threshold.
The me_start + me_len comparison can also wrap for a large input length.

Validate and adjust the original request once, after inode_lock(), the
exclusive rw lock and ocfs2_inode_lock() have stabilized and refreshed
the size. Read EOF once, reject a start beyond it, and bound the length
by EOF minus start. Normalize the threshold using the same EOF snapshot.
This keeps zero as the default-threshold sentinel until validation uses
the size that will govern extent movement.

Move goal validation after range adjustment as well. Its allocation-group
capacity check uses me_len and must see the EOF-clamped length. Both
validation failures use the existing inode-lock unwind path before any
extent movement or transaction starts.

Fixes: 53069d4e7695 ("Ocfs2/move_extents: move/defrag extents within a certain range.")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
Changes in v2:
- Validate and normalize the original range only once, after inode and
  cluster locking have stabilized and refreshed EOF.
- Move goal validation after range adjustment because its allocation-group
  capacity check depends on me_len.

Link to v1: https://lore.kernel.org/r/pm-ocfs2-move-extents-isize-rrw-v3-b2a7508c41108cc2d00b@gmail.com

 fs/ocfs2/move_extents.c | 68 ++++++++++++++++++++++-------------------
 1 file changed, 37 insertions(+), 31 deletions(-)

diff --git a/fs/ocfs2/move_extents.c b/fs/ocfs2/move_extents.c
index ad1678ee7cc4..f2682ef6bf2b 100644
--- a/fs/ocfs2/move_extents.c
+++ b/fs/ocfs2/move_extents.c
@@ -907,6 +907,30 @@ out:
 	return ret;
 }
 
+static int ocfs2_validate_and_adjust_move_range(struct inode *inode,
+						struct ocfs2_move_extents *range)
+{
+	u64 i_size = i_size_read(inode);
+
+	if (range->me_start > i_size)
+		return -EINVAL;
+
+	if (range->me_len > i_size - range->me_start)
+		range->me_len = i_size - range->me_start;
+
+	/*
+	 * The default threshold for defragmentation is 1 MiB, which
+	 * matches the maximum OCFS2 cluster size.
+	 */
+	if (!range->me_threshold)
+		range->me_threshold = 1024 * 1024;
+
+	if (range->me_threshold > i_size)
+		range->me_threshold = i_size;
+
+	return 0;
+}
+
 static int ocfs2_move_extents(struct ocfs2_move_extents_context *context)
 {
 	int status;
@@ -936,6 +960,19 @@ static int ocfs2_move_extents(struct ocfs2_move_extents_context *context)
 		goto out_rw_unlock;
 	}
 
+	status = ocfs2_validate_and_adjust_move_range(inode, context->range);
+	if (status) {
+		mlog_errno(status);
+		goto out_inode_unlock;
+	}
+
+	/* The goal check depends on the adjusted range length. */
+	if (!context->auto_defrag) {
+		status = ocfs2_validate_and_adjust_move_goal(inode, context->range);
+		if (status)
+			goto out_inode_unlock;
+	}
+
 	/*
 	 * remember ip_xattr_sem also needs to be held if necessary
 	 */
@@ -1028,27 +1065,8 @@ int ocfs2_ioctl_move_extents(struct file *filp, void __user *argp)
 		goto out_free;
 	}
 
-	if (range.me_start > i_size_read(inode)) {
-		status = -EINVAL;
-		goto out_free;
-	}
-
-	if (range.me_start + range.me_len > i_size_read(inode))
-			range.me_len = i_size_read(inode) - range.me_start;
-
 	context->range = &range;
 
-	/*
-	 * ok, the default threshold for the defragmentation
-	 * is 1M, since our maximum clustersize was 1M also.
-	 * any thought?
-	 */
-	if (!range.me_threshold)
-		range.me_threshold = 1024 * 1024;
-
-	if (range.me_threshold > i_size_read(inode))
-		range.me_threshold = i_size_read(inode);
-
 	if (range.me_flags & ~(OCFS2_MOVE_EXT_FL_AUTO_DEFRAG |
 			       OCFS2_MOVE_EXT_FL_PART_DEFRAG)) {
 		status = -EINVAL;
@@ -1060,23 +1078,11 @@ int ocfs2_ioctl_move_extents(struct file *filp, void __user *argp)
 
 		if (range.me_flags & OCFS2_MOVE_EXT_FL_PART_DEFRAG)
 			context->partial = 1;
-	} else {
-		/*
-		 * first best-effort attempt to validate and adjust the goal
-		 * (physical address in block), while it can't guarantee later
-		 * operation can succeed all the time since global_bitmap may
-		 * change a bit over time.
-		 */
-
-		status = ocfs2_validate_and_adjust_move_goal(inode, &range);
-		if (status)
-			goto out_copy;
 	}
 
 	status = ocfs2_move_extents(context);
 	if (status)
 		mlog_errno(status);
-out_copy:
 	/*
 	 * movement/defragmentation may end up being partially completed,
 	 * that's the reason why we need to return userspace the finished
