Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EF237DEB6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789010384; cv=none; b=KGDZ3jrIOg3kN9PHonLmJyz9i0261zfs1OHEVNMqGpQhO7KrMiEkwPsPUb1W3AYLyPfU4OZIvlZzKsYAGYfIS/FXKt+N+mJ/HphkQsN9l3KxmEDhqW5Y9PheQHc/nWku5YAB1vLNnWm4XeHSUVFfrKZmaSIdDQoDLUB4Wu1vddM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789010384; c=relaxed/simple;
	bh=BUv5prhmLyOf3SgaXv5kmiquPqQcN8saN/zRB8xHGiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nyGHJMz5t5jdHvuMzKuAv0rSO9Ag9K/RVt/DLs+cqqM2Jc/pXxDArOhsAHUwjCFKd3Cv1eBbm/QYbuSftnTaIIoxEIkGN/HkmXfztHir1V3TJPhz3kEtCZmVmVTyPJ9qLwL/GHh7WN57evRylo57WQlNBxhiD9/5YEZVFDc7c9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ocTqXp8P; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ocTqXp8P"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3964e480f76so7737537a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 20:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789010383; x=1789615183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q+3C5HAHgfZOcx9oT2fotA+oPFwWYseet/fp5oyt5ew=;
        b=ocTqXp8PkwLIj23WPFHYyRkpYNFoNVI9Dfad2cCJsO0Sas/WMstQDznxLEqtO8jsIr
         sT6HbePE37LjP2znzoVlb39/Rmgyevi2f0Ps0iNl14MtEnextrbuZM1lj8laPQp7aoOm
         WWMgmBBjGoxSUayNM531qWzASRMKHNOs+4UWwUkY6O3Z0T4S2huZmg3oJoKpfELDyTUu
         sJTCoR/duDeblHbhRP13F2KZr/q4gEEOnHXO8nZWTmQF/SXoSlGKck+4nPDEGocniDoj
         60ZnqGGqYl7mBc9PfmOmZEqfmSd9ojbaJM9fI2ZgR39lZnu0aMoB9w29p+lx4MtOyOxf
         TxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789010383; x=1789615183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q+3C5HAHgfZOcx9oT2fotA+oPFwWYseet/fp5oyt5ew=;
        b=cJwEr2jpIjQj9ocXlvmst1Ep914138cJHwxopy/G1lZVbrVUIK2D4IrHqDo7CO8DCv
         d1E1sZjsc7nxttnVaoGGwJXu918Dz/9pyUnGKxyCIR4mYbdC66Ai933Oy9GUqtfkSJIj
         asryAYmYJ9dICBVm5BfF7pcOLMVVgqotvgola3neK7pcgVTEfhcFvIpsLJ05cbjpmV8l
         kxpSl2jpQTY1zkd7hGVaUqm1Rv5KF6xFs49CjCjJscdZO0M96TVdNlqfFvM5YO5p2Ap7
         /PIdnIpEyfRebc4JdKVJKAVm1CY5wiFCXvMNSmaH9xoZQwZfO8kwtPgFjZW6Ibdcxvdy
         L9QQ==
X-Forwarded-Encrypted: i=1; AKwUvBzW8UQ/ztClB3yCqcwV3k8uCabLPiv6ZazYaxZwPOmryrWlhTI6QGcUTysTBFDVsaya1ZJ/PNqjuJ9BU0M=@vger.kernel.org
X-Gm-Message-State: AFuF++l0uXiRVzRzoU+/yhDmjv+MRcy87658EG4QJJnIM/I+kaGGFrDn
	4NbaHJcoSQb+wavgc7jc90a2GNBUp9if8ogL8y3Bgd/BZmlgWlP9Ovma
X-Gm-Gg: AYBFou2zk+e29//cVhBVbgvlE0VQ9aQguv+nPYKoxRu/joICRzDf207c2iU80ME188u
	M0vnI8EvUKIqWQGkRD4re0f0HnrUQ+3nmu7cPvfHudDPNbMo83/mvYbjVoHJlwtgu0ZmJtvQwvC
	Tw2ty1xf0CMfmjZS0cjvmaEDI2kPzL1Q5fNLjQR59kfrUdEgUMnP94Ip6ejmosbZFg5+P9Cq6rD
	IerTALm+KeSF92z8hU7/HKXuJemCK644Yh6gIQu6tcR3NFSRPhtmtR0kbZ5dFi74V+VPGmzZsDm
	hpTYGT5W1Mzo2mTs4sYgmZdvYalfJDGBp2nBeR3ZbiDfgHMZS1FQe5LADGqxSatK79qEoV81tXJ
	iIuP/kbA0MwIGSrOy5aFNhdChCymvz9U60EVxGcSGdt4jJ5oyfDGc1eE0FQLoblUZ6lg21icTul
	w6/oDzN5QB0f1/tUJYAReNxpFOHVi6/0agOeMR8y4hULwZ9eOVd0KAlBNIuyZuwjMXKYDk0ckVe
	BW7niMdZz/VvP8=
X-Received: by 2002:a17:90a:c106:b0:398:e1f4:bda1 with SMTP id 98e67ed59e1d1-39b2624cf3fmr60325042a91.21.1789010382848;
        Wed, 09 Sep 2026 20:19:42 -0700 (PDT)
Received: from lucas-inspiron153525.. ([181.81.132.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3397d6d1becsm10555546eec.22.2026.09.09.20.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 20:19:42 -0700 (PDT)
From: Lucas Jeffrey <luquijeffrey@gmail.com>
To: dwmw2@infradead.org
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com,
	Lucas Jeffrey <luquijeffrey@gmail.com>
Subject: [PATCH v2] jffs2: initialize inocache and target to NULL when allocating and initializing an jffs2_inode_info
Date: Thu, 10 Sep 2026 00:19:12 -0300
Message-ID: <20260910031912.2283174-1-luquijeffrey@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909023955.1642244-1-luquijeffrey@gmail.com>
References: <20260909023955.1642244-1-luquijeffrey@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a jffs2_inode_info is allocated via new_inode(), due to memory reuse it
can retain stale values from its previous use.

If the new jffs2_inode_info object allocated retains an old reference to a
freed inocache, the function jffs2_new_inode may crash if either
jffs2_init_acl_pre or jffs2_do_new_inode returns an error value because
when calling iput() with the inode it will eventually attempt to free again
the inocache.

There is another failure path which is, if target is not null when allocating
the object in jffs2_alloc_inode, and immediately after returning the newly allocated object,
and if the 'inode_init_always' returns an error value (allocation failure for example)
then the vfs will attempt to free the inode and jffs2_free_inode will attempt to free f->target,
which can be a stale value from a previous allocation, generating a double free/use after free.

Reported-by: syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3a8099322b09d8d073d1
Signed-off-by: Lucas Jeffrey <luquijeffrey@gmail.com>

---

Changes in V2: initializing target field to NULL in jffs2_alloc_inode
---
 fs/jffs2/os-linux.h | 1 +
 fs/jffs2/super.c    | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
index 86ab014a349c..40f17218a276 100644
--- a/fs/jffs2/os-linux.h
+++ b/fs/jffs2/os-linux.h
@@ -52,6 +52,7 @@ static inline void jffs2_init_inode_info(struct jffs2_inode_info *f)
 {
 	f->highest_version = 0;
 	f->fragtree = RB_ROOT;
+	f->inocache = NULL;
 	f->metadata = NULL;
 	f->dents = NULL;
 	f->target = NULL;
diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 81396a092ba8..2343c21b49e6 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -42,6 +42,8 @@ static struct inode *jffs2_alloc_inode(struct super_block *sb)
 	f = alloc_inode_sb(sb, jffs2_inode_cachep, GFP_KERNEL);
 	if (!f)
 		return NULL;
+
+	f->target = NULL;
 	return &f->vfs_inode;
 }
 
-- 
2.43.0

