Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794541131;
	b=axoONXrlhxxtnthRahNhkSNkJap8MeFitQ3AKy9w6CyyrFmzJBQOzDMnwgzLHfDiXxoV
	 AVK8AnXTDymZY4znGA6NIdQf/8mKF+q0Df7f7JsWNQr5l01oWeQyJedwZRmu0NWtqoUYu
	 /3IvK16yiLiQFpBxvXmNNavImFeYO8X7VggAoja6h1RrWwki8V2xWKTzkvmQno0725AEn
	 /5XOdJzE4y8V+dFpFLJrPFtBvaiQzbLdWuWd5l1uHm0C+yYKXZF0uEotWuQc0V7vh6wSy
	 lcKGUfQa13QL8ignClgOo8/VnneCVkcs/q0UkWxp0Q5oI1OaDu1XJk/rbxX/hAOCswg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794541131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eJED9RvAZ4gBzrtrvfpCnmjx/MMKsZ4K/q+3GDdJTPY=;
	b=X7XR9aaEeOkzh1sHdhSd67gkfCEgADjU+vdJs2x98aNTwCEsnuW0rHq5UlQZHxNINkb6
	 vFIxLjA9K5qcizx5tMWBPB4qsjokv5979wB85BCLdSR14AIKrNCKYw4WJC18j+FB/sW0C
	 JzpQIWslZP1dxW74VqzaZbkqhJjUSFoqQ0iAkIHlBqazFwRmXnb/fb5NKKiDd3vOIQPET
	 eyithU3wxqaA7X9upk3fn7f2IksJp90zziyWs1Cwd7m/PxfABwDVsYiZXFvOxmDZMcefi
	 pxiOftrjw+FYW4UTPaRKPOkrJGoNzNNZhn5sn+qby7kcvatuXPrUCkEZ+HyTsSDQ+9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=k-tech.co.jp;
	spf=pass smtp.mailfrom=k-tech.co.jp;
	dkim=pass header.d=k-tech.co.jp header.i=@k-tech.co.jp header.a=rsa-sha256 header.s=google header.b=iryKG6mY;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2CC606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:38:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF2CC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=k-tech.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=k-tech.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=k-tech.co.jp header.i=@k-tech.co.jp header.a=rsa-sha256 header.s=google header.b=iryKG6mY
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdb9f760337so801945a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=k-tech.co.jp; s=google; t=1794541130; x=1795145930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eJED9RvAZ4gBzrtrvfpCnmjx/MMKsZ4K/q+3GDdJTPY=;
        b=iryKG6mYs73xjEAyu3dBySoYUm1Vh9I4P6vYEYqiCw1bwVWOXJoOeLz2J2dXh5tahT
         flzDQH1WeBD/jt2rORMVABHLxDlg13OiZnefFtTSDIWwiij0AZTNgOX9UYlgDV0Ipm/o
         ebOcK6ykpQen24SnJQ7pEGRoV3+y+6DelDOe420hb1noWE7yFCwR9XrUz6Bl6i6LlrSx
         kpZHtJbCu3t68EUQ/9wI6NN76umY1543ZzHxbWo2GDJ3TKDucsuoErN+TG5idBxYvNX7
         S7re5D0Fe8n2Lh5yFGUVSIK+1DQ4ESJRKSpIIwJD/vlhPK0fUTU7sQhrDiPowiUDwQrz
         ac2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794541130; x=1795145930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eJED9RvAZ4gBzrtrvfpCnmjx/MMKsZ4K/q+3GDdJTPY=;
        b=pd/L/mD+83IVGR5PcdUablVzRC6Sx3z+y/rJmdwxnWrdNnHJaKg8OJSc0R52pT/toJ
         e/kdUg9ESXDFRNr8pkAFf0U7m8XSB45isB/fsC/ZNOHrg+x+pAx9flz8XqwbYUsTL72g
         qEFDJBsLcIdV2WkoROWZepwyMss36YMnBMAO4cFGulYAui5LpoiEKNkvIH64hmtnMK/F
         ozxHIrrfXmYiQBtccu7m232dVV9dHVuObKVRagY/5V7D5OPn1tKkkbRdECx8bxblrYQf
         m4FUcZqdPYj1xcURHkICvR8u2VO0PhLFzdhsgdv5u8dNXmRirwo+4NS20EqjQLlejzVg
         4IFw==
X-Forwarded-Encrypted: i=1; AL+hErFQgS2EkC5kyuWiU1/kvwWwCEhNEztwhxYaL82WftAV3+0IqaWCRqQhNTdlRXtkogQVmFV3PBcJ9eI0jKE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9luvPNqBYt9wSN4LME/LQnWlzOxT27c53vnYGQwMdl40moCmtM
	PzlPtjJ6GhnLRvP9iORJDOcnhihVMPWm5QkKR81ifftdFvCgpnWpWImfepEMu0JGAlc=
X-Gm-Gg: AYBFou1n1eZ6HYpK6qvZhFTUmBeXouJjxkp/KFg4LXjjIZ8cdDaroMRP6fb7vHu3suc
	+56YrDt09BPqI/62vNJbkLaarBzvwXQaOm5VwEoKqslfVatLpa9FfblfNja4yHR+mLCds/zh1iD
	pXWriCGDpgMW7zVTrnxLfb31v/hb2JgJMACehLIOFHJ7wmn5BDCWRZcbntPQ2D+UPe5fQ5kCuHD
	V4WZ2Jl194PCKPwZ733DPB9StiEieeI8e6OfFdslNhkT0CB8yuCJlg+MRXmYRaYgvQXBvvsnhWt
	F9NfWgHwrrPGbtvkj1Ad9nlxF9AsOpmhsd2bgIx67Hj/sQfzDrvJRFBkDtxlyMsc6k6YaYtBhe6
	YfrRqNPCWH1rrPthvXgCWfXtOi9eI1lHzW3NUweKw1o2Hdswg1VhlixNchQ70L5ppQFP/nKxf0u
	vN6z9PFjEeC+K0y4MtqElldA/6KXtxQvQ6d6R96KK0jNM9aALUnOJ7f4mMqk0HrEalLcs38y2P2
	yjUDf7M3Mqt77ZMM7S7JgImkDq5vvc8buaFUEK3kCFmGuPrOHO2sBam5hzuOGtqH85aK1/+o1hG
	E4TUBadYusilDnXkELLXPPNdYyUWoAH+bcnF0/UBFVj+1f1vLuManbXuIFoZZS+2Rnid9optg3f
	KF8EaLDtZlf9jRjs81feMdE+kOAiThRzsZ6LGUw==
X-Received: by 2002:a17:90b:3806:b0:3a0:d82b:237b with SMTP id 98e67ed59e1d1-3b1b0ca57damr556451a91.25.1794541129791;
        Thu, 12 Nov 2026 19:38:49 -0800 (PST)
Received: from localhost.localdomain (g74.115-65-36.ppp.wakwak.ne.jp. [115.65.36.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec43699sm2059374a91.10.2026.11.12.19.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 19:38:49 -0800 (PST)
From: Yuichiro Goto <goto@k-tech.co.jp>
To: a.hindborg@kernel.org
Cc: leitao@debian.org,
	viro@zeniv.linux.org.uk,
	linux-kernel@vger.kernel.org,
	Yuichiro Goto <goto@k-tech.co.jp>,
	stable@vger.kernel.org
Subject: [PATCH] configfs: wait for pending RCU callbacks on module exit
Date: Fri, 13 Nov 2026 12:38:33 +0900
Message-ID: <20261113033833.124797-1-goto@k-tech.co.jp>
X-Mailer: git-send-email 2.47.3
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

configfs inodes are freed from an RCU callback: destroy_inode() queues
i_callback() with call_rcu(), and i_callback() then calls the
->free_inode() of the super block, configfs_free_inode(). Nothing in
configfs_exit() waits for these callbacks, so the module can go away
while some of them are still pending, and they later jump into freed
module text.

USB gadget hits this easily. libcomposite pins configfs with
simple_pin_fs() when it registers its subsystem and drops the internal
mount on unregister, which frees the root inode. Unloading the modules
right after that, e.g.

  modprobe usb_f_rndis
  modprobe -r usb_f_rndis

oopses a few seconds later with CONFIG_RCU_LAZY=y, which batches
call_rcu() callbacks for up to 10 seconds:

  Unable to handle kernel paging request at virtual address bf17e810 when execute
  Internal error: Oops: 80000007 [#1] SMP ARM
  Modules linked in: ... [last unloaded: configfs]
  CPU: 0 UID: 0 PID: 16 Comm: rcuos/0 Not tainted 6.18.63 #4 VOLUNTARY
  Hardware name: Freescale i.MX6 Ultralite (Device Tree)
  PC is at 0xbf17e810
  LR is at rcu_do_batch+0x190/0x510
  ...
  Call trace:
   rcu_do_batch from rcu_nocb_cb_kthread+0xc8/0x310
   rcu_nocb_cb_kthread from kthread+0xe8/0x248
   kthread from ret_from_fork+0x14/0x28

RCU_LAZY only widens the window. The same oops also happens on a
v5.4-based kernel, which has no RCU_LAZY, with the same two commands.

Call rcu_barrier() in configfs_exit() once the file system is
unregistered, so that no new inodes can be created and all pending
configfs_free_inode() calls have finished before the module is freed.

Fixes: e9c03af21cc7 ("configfs: calculate the symlink target only once")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yuichiro Goto <goto@k-tech.co.jp>
---
 fs/configfs/mount.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/configfs/mount.c b/fs/configfs/mount.c
index d8cac1cbf3bd..c65d8ff419b2 100644
--- a/fs/configfs/mount.c
+++ b/fs/configfs/mount.c
@@ -164,6 +164,8 @@ static void __exit configfs_exit(void)
 {
 	unregister_filesystem(&configfs_fs_type);
 	sysfs_remove_mount_point(kernel_kobj, "config");
+	/* Pending RCU callbacks may still call configfs_free_inode() */
+	rcu_barrier();
 	kmem_cache_destroy(configfs_dir_cachep);
 	configfs_dir_cachep = NULL;
 }
-- 
2.47.3

