Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5984718D6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789076845; cv=pass; b=LSDqTtKBYQi3imtX66l2ELbzy5JxX4FMNwBczbbsEq5CAMXYvjsMfIN/ifX54CN4ibHmeQWaMkPXTUegnRICswWev707okCF/wNmroSHgcuDdgnI7tM0OvGmF79/v8Yb/tzwxlwcS81t1/KVOpNTh+0UMzjO6Iwfy2c1i21R14U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789076845; c=relaxed/simple;
	bh=MzvZV/XlleF9nFmoW3RU0rOHpGBzwcekn1hbt8ZFZE8=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=L19UezFxD5Y0PrYEqxOILodybOrV/5G1cm9fHZyeoRXZqLxw8xHPJsNkGeJcA4pacYhyCRvl/g3QEezQ7SG1TIm3N34XLXCHOaQxLPD+lAlkbkZMSMx6fcbQ5XmFcX8VIFYb54Hbrky6aRhE99SR6Z43mPit2rnMuD1BMwSN0h0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=S94M893m; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="S94M893m"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469d249c5so171119b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:47:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789076843; cv=none;
        d=google.com; s=arc-20260327;
        b=IYV1qJvB1ySGybSO2P52T6G3mvtsLoypBqNLpA219jpcVabci0YKxpJsn1z3ReHJzI
         p2FjPH3Ub7ifu40D50BGWOGfjPgaK1Kf90bx4wV84Xwc6h8/lwj4k90kzBXgMTHZv3OR
         NCSRIrjkUvSVIOhij/vDiR66I9xhPqTUXCbsLcZ1owxFse8R2ktDUp5QMBntVm/HsUif
         ZVlfrZf4S/LnrhnY+8HbMSDJ3VYXvmysyD1uFyAolSWstS9omLCNPX1u9rkOcbv4cuC4
         6ljmRv/IwEbSWHk89KJ84bTyPbbBpwONoR4unE9I+Ywnn0XRb473QWaX30r75K34MHxD
         WK5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=Dl/lrjIBKTQVv+jOBrTw+8RbI9HTEQP7bOs7FBwNKco=;
        fh=WuVpLShq1oZBMjSJoqiNgXsJ2jMNbcpZ/wRLtlW5yJg=;
        b=cbxvYQiqLi34RjSaSwVkiPIqJxdyIOVkx8KpOySlJxdIF5xWl3HBS62YMkEyV4grkR
         NsodcseStdZShHMLdm59//Cr6msh5ZWtCWeCSu0A28gP55bppxtWBf/MMwZRH26ojj3L
         3eJ12Bls/5Ldh/qGgdfmEFr4jIcY6dbafozQwOe37yxBkSy3t3QzH8pbUUcwwH6NVaIx
         uT5uamNEGiy/TSPgCxpqzsL8SnTRkpsNvRLzE0tjNgBPufuc2KnhD11HsJ3tVSoxZwoh
         XI3Vz2Xw1u2Qdz6Kb6kgHiYmAxHVG4ZzeDYZqmWDzNHdGLToSBanrlKGNkBJi1faSOTO
         mWHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789076843; x=1789681643; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dl/lrjIBKTQVv+jOBrTw+8RbI9HTEQP7bOs7FBwNKco=;
        b=S94M893mdJXi04bd8MM2f5zs1sddw6UOf1xB09iAmxQZswufex2KwMA96Pd1lo6wqx
         YzuSsIfOPc6X2Iq6ZaUQG58NkEmkz2t7ZaRDpyVAsa5v/sRGPj5FSYrvIpVLqIB21WO9
         4Sjff2mMVyEUGQjGjGiGSvVqYCRIT27cLPpB6tSmf2UvoPOHo1TNyn8YvqboKcIW3oiI
         DsFajtj0Aqvv+Uqacdwsv4r9LFoAQ/eSEZj1kfDHgX3p65hZKUWeSCRulcPzFaO9j06k
         mZT963/cNn5AvSaw7XSutyOcv4Pvjo0Uw9a5fT1FaENisRtDShAH4ooVWHcTq5Y+Tyen
         VgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789076843; x=1789681643;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Dl/lrjIBKTQVv+jOBrTw+8RbI9HTEQP7bOs7FBwNKco=;
        b=OnuExdaFuudApbn8hY/6rK33brLE6/kf8DznhU+2W7bu/fJwNh8XoSNaf3HLjpDE/o
         Hjz/XM0rhfH0KpyhETVpTHULW6Sn0ywQmWa+ZQpJdJz97q+ugzfOiZzMux7SeGl8o62e
         x6MEC0LnGKcVunfRR/tapcx9kMDyzt5omu3d1rltgyoVhGITyYxGuu0MUyp7o4p0nldI
         eGGzzROu7KPUGyHkdN7uoIvoRBfWM8ggN5JvLcZ5ghiXdgDFCI3vqy8PhNq3BEy7vc76
         wUhU1uGMgfOCz1s4dvmq0gSvuV/ByXpZ5nvo+ITDCY0QycjrlK0CoGBazk+AFSS1CHrK
         Xe3A==
X-Forwarded-Encrypted: i=1; AKwUvBzQXRMUOQGL3MVReKeVYujmBcR6E1uaLMgfCIXw7rLaDLy2UPsYwZESKJrVKHtrSpd6DgYly8w5N8cbNUw=@vger.kernel.org
X-Gm-Message-State: AFuF++n+kffUW3ZWcnQEtuoujamBqATy1Y6uEL3hLvj5WZC7E5MhMPE/
	zAui+Zm/JEVUCngRutVCAIRhQFro+L0LFyjja/rSSJZVngQ9ppOhcYOgmaXUZh2kjJBOA/aebmU
	rASOjRcRhsy5mq7k/BGXbaGf8DE9cm1cx5PahQdMS
X-Gm-Gg: AYBFou0Haxsytq0YezycqGY8mDv46uXAwr/7Psz7yXMyc2T9JwxocP1IRWjfqCIfSIJ
	jWyRM7uopW3g2TOt68VW4TKBmE5G4YtjABye2oVIPF2VeczMRZEtOopebHHL+rCcZ9t59hfqgUU
	mDwd64HvKHwkAEpIdKDCJtwGpTrkgsFu6msjl6tl3E2vgLHhCRIMLYCMHMBvXVbg5oXjH2ipepF
	PTvzcvjPOctrL0ZrAfz8I37z9rdtwSjsm0kyz1dTH81j45B7s+xZ0CpqBLUYrCuZdprdXNmxxkP
	bgXywS+Mn0bJS4VXN55nVNNixes4IomgixWRMTkj9h/d8Sfy5SQP5lxwVJn/LD2Lb5FRihy1eoQ
	v0fuNL2nouuE0M+AN7ZyEKuLEdsiWkRo6Rlp56T1DbeQ=
X-Received: by 2002:a05:6a00:c4c4:b0:869:427:9b0b with SMTP id
 d2e1a72fcca58-86b30e0c7f7mr1052490b3a.1.1789076842087; Thu, 10 Sep 2026
 14:47:22 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 21:47:21 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 21:47:21 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 10 Sep 2026 21:47:21 +0000
X-Gm-Features: AcwNN1UuNgE93mQmrT5ODw4YWg2HNZ_hxuHKP9cOZHTw5nScsf2TNLiEOtPKodE
Message-ID: <CA+0ovChT6BRXp0kntaJ_Eiw-2-z=fpofsvyALiwdORe3zG_YWA@mail.gmail.com>
Subject: [PATCH] ocfs2: don't let the root inode outlive a failed mount
To: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
	Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: falemi@asu.edu, ocfs2-devel@lists.linux.dev, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ocfs2_init_global_system_inodes() installs osb->root_inode before the
second ocfs2_iget() runs, and when that iget fails ocfs2_initialize_super()
jumps to out_dlm_out, which sits below out_system_inodes, so
ocfs2_release_system_inodes() never runs and the kfree(osb) that follows
makes the stranded root inode reference unreachable.  ocfs2_fill_super()
strands the same inode a second way: nothing drops the reference igrab()
takes on osb->root_inode when an out_dismount path ahead of d_make_root()
is taken, so the ocfs2_release_system_inodes() call inside
ocfs2_dismount_volume() cannot free it and the root inode stays hashed on a
superblock whose ocfs2_super has already been freed.  The reported KASAN
slab-use-after-free write hits an ocfs2_inode_cache object that
ocfs2_release_system_inodes() freed during teardown, so an ocfs2 inode
reference that survives that call is a lifetime error on those same objects
and not a bare leak.  Release the system inodes at that failing
ocfs2_iget() and drop the igrab() reference on out_dismount, clearing inode
right after d_make_root(), which consumes it on success and on failure
alike, so it cannot be dropped twice.

Closes: https://lore.kernel.org/all/CA+0ovCjAKQMn7iF8BJR-3+G9_HBRnRFtJxjr-9P9GuKSxFj+3Q@mail.gmail.com/
Signed-off-by: Farhad Alemi <farhad.alemi@berkeley.edu>
---
--- a/fs/ocfs2/super.c
+++ b/fs/ocfs2/super.c
@@ -450,6 +450,7 @@ static int ocfs2_init_global_system_inodes(struct
ocfs2_super *osb)
 	if (IS_ERR(new)) {
 		status = PTR_ERR(new);
 		mlog_errno(status);
+		ocfs2_release_system_inodes(osb);
 		goto bail;
 	}
 	osb->sys_root_inode = new;
@@ -1110,6 +1111,8 @@ static int ocfs2_fill_super(struct super_block
*sb, struct fs_context *fc)
 	}

 	root = d_make_root(inode);
+	/* d_make_root() consumed our reference, on success and on failure. */
+	inode = NULL;
 	if (!root) {
 		status = -ENOMEM;
 		goto out_dismount;
@@ -1163,6 +1166,7 @@ out_dismount:
 	atomic_set(&osb->vol_state, VOLUME_DISABLED);
 	wake_up(&osb->osb_mount_event);
 	ocfs2_free_replay_slots(osb);
+	iput(inode);
 	ocfs2_dismount_volume(sb, 1);
 	goto out;
