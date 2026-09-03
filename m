Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACB74DF4A8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449067; cv=none; b=g2B68JpJtOR4WOl04g9G6nAe+2yDz/evTkB9d1FoI+zx1ljFAMeNU2DRqkjsJ3nROwKvdmy3NyCRLSeIlY0znNwCqH/cwbNUCGLfIQNTQCJrFZmspCnEJ6eIkx9Tm+ziPNLmERhYstFNuQSO3uudnm1ATtR+MuKWfySfGD/O4lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449067; c=relaxed/simple;
	bh=hiRQlPpIGglFRXty3EYqUEUerglqeZb/X1JgjZonIb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Coj4pwEdht4wUHBkODiooLAvIsQ3iWnUnFJ0dWwDuMvxByz1TYBaL762dM03y9DNxFc+SjxbBXjwJJ8Qzz4Ah+88LQyVgX/yKdXgRdLOwCyEZVx/stOlWmC18dSG/e1XXPIRwybMYo3XRpKQTIUEj06OZv1NHgO3YB2as8W04HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3rm6rR2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3rm6rR2"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4954c08a7c8so2229175e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788449064; x=1789053864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fKRvoFT0iXNtYocSHfeIp3eZzwJLnARoSnyrks3zVww=;
        b=a3rm6rR2VzC2DjoCMYpu/51tp4kJsSlCTlyXIFe8sLzTEgr8cmyl4TXsATSQN7qmh5
         ExBYf0WSpsQHt8lSo649XNihnRkxxxgsa7jAnNymL6bwZzhrXUI1FrsaX8bOExNrz1Md
         Q1wMqdYpyw5Yi6gAettqJ7Eo9onsMm20BLbCcLFABCKRvJEvdZItsiXRjKg/HD1Ly6iY
         JPGyieFbe7wwwqRN3Yr8s0K8+39wTjW+zHkM2tnALOWbcnCfELsaX6zfulZJjp4UJc8d
         OJTZMF8tiP1ZusOVm8vHsuLYAxfLlnZqwHbkL0QbUDpC7UT3ZBfv0LK9Rb6XhT7lDifV
         jFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449064; x=1789053864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fKRvoFT0iXNtYocSHfeIp3eZzwJLnARoSnyrks3zVww=;
        b=hwndR0zTrM3X9KH4P8koHCJvoPgLcF1qsRf5ne0tdvPoDDFaAx+WoVpWzge6+TSW4E
         RMSUMxnck2EkfYmBGzLgEt9KPMiU1t58qmPnwZ1GJz+BvSRWnzJx2r0wwJ3rKktwOY0L
         gYrJu6iBxDrdg0WY+yRLshsgvb4gxp7GBwH3O+JLEMYUCChDOh97iGNDaMihV73aXWyP
         e5IO64ZpI3e6Xq0XArb0o8NIH8pEv40NRSx63E6jJIchHK3T7OAEoSWtNGYdgQ3AkddQ
         Yt2qTC7SouUtWgjHZg4lg8wzcmmS3Q6q1xd21WPeVivZKJpnkcWpi1UijVN6MK24mYH/
         XneA==
X-Forwarded-Encrypted: i=1; AKwUvBytVwC8xCLUG9LSM1czHMbNQbiq8BYZzNhBZtCf2RsfWpsb3t/omrjqudNeqMHG+LFfygFKIuxSzlyY8xg=@vger.kernel.org
X-Gm-Message-State: AFuF++lXoFMhapkX5Rb4WvFjg4rsBG6S6vBTwgpS5VUiV/Dtp6dMpa7f
	ih/1NpBuZfBDWpw4HFWXveNGaWo/s1Bp28Js7iJTqy728MELElmVX9Xs
X-Gm-Gg: AYBFou2VKVsRBHPLRC5M7eVkipCpcccxsndu3xMXGj3jAFXKUZvY9IbDCZcAccs0fiT
	vw6FGyhU32VwJPMoid425X6IRx2F55msDr1RHtIpypQcB5dr4v2KBghbmLAWCh1HmeaYQ1q/Oeh
	gaVxppvNuUZVRc2MeI4j5vBUS7QBIB97n7qjc5xC1DjgVb3qm96l+m0tyhBPcJTu3kzbfZI+QxX
	edff1s+egzZvVlUzDeL2cJ3zUw+sZfkLoba5WXDFy8eTLEncqBygEfKMc6ZW5YqMZyJ0fhVHgiE
	dFJWm0ELC2ZGmWY0f/IDlWYzwDKZZGvImHMD7RPqyf/1gekSMbYJHGuIn9Q+y6DgCkgafhVs6Ky
	JPhdTLorV6D3cR8HclLp/544IH9p0C2YqnP2hIrBmYxmSChkq5zDx4LAh/LNkEGPJz+jbT7yDVn
	JINK0n0ZEya2vhk5RTqoeFxVSsPpWO7FnN/nf9PlpACFP1iXazm/I4c+QIlAEjCUq8Ckb45fCvS
	4oMqlLZhcvARzVKo+VyI8RThMsL5teG1QvwvVhXPN6ZUy55U5bNLBA//tTSKyxTD7fs/PWtDW8Q
	t8/eQYojFakR3Q==
X-Received: by 2002:a05:600c:310e:b0:49b:9241:7ff0 with SMTP id 5b1f17b1804b1-49ce558f8d6mr118094475e9.0.1788449063470;
        Thu, 03 Sep 2026 08:24:23 -0700 (PDT)
Received: from pop-os.. (98.102.222.87.dynamic.jazztel.es. [87.222.102.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60bae6sm96098935e9.9.2026.09.03.08.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:24:22 -0700 (PDT)
From: Miguel Garcia <miguelgarciaroman8@gmail.com>
To: stable@vger.kernel.org
Cc: pvmohammedanees2003@gmail.com,
	akpm@linux-foundation.org,
	joseph.qi@linux.alibaba.com,
	mark@fasheh.com,
	jlbec@evilplan.org,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6.1.y] ocfs2: fix deadlock in ocfs2_get_system_file_inode
Date: Thu,  3 Sep 2026 17:24:21 +0200
Message-ID: <20260903152421.1801322-1-miguelgarciaroman8@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mohammed Anees <pvmohammedanees2003@gmail.com>

commit 7bf1823e010e8db2fb649c790bd1b449a75f52d8 upstream.

syzbot has found a possible deadlock in ocfs2_get_system_file_inode [1].

The scenario is depicted here,

	CPU0					CPU1
lock(&ocfs2_file_ip_alloc_sem_key);
                               lock(&osb->system_file_mutex);
                               lock(&ocfs2_file_ip_alloc_sem_key);
lock(&osb->system_file_mutex);

The function calls which could lead to this are:

CPU0
ocfs2_mknod - lock(&ocfs2_file_ip_alloc_sem_key);
.
.
.
ocfs2_get_system_file_inode - lock(&osb->system_file_mutex);

CPU1 -
ocfs2_fill_super - lock(&osb->system_file_mutex);
.
.
.
ocfs2_read_virt_blocks - lock(&ocfs2_file_ip_alloc_sem_key);

This issue can be resolved by making the down_read -> down_read_try
in the ocfs2_read_virt_blocks.

[1] https://syzkaller.appspot.com/bug?extid=e0055ea09f1f5e6fabdd

Link: https://lkml.kernel.org/r/20240924093257.7181-1-pvmohammedanees2003@gmail.com
Signed-off-by: Mohammed Anees <pvmohammedanees2003@gmail.com>
Reviewed-by: Joseph Qi <joseph.qi@linux.alibaba.com>
Reported-by: <syzbot+e0055ea09f1f5e6fabdd@syzkaller.appspotmail.com>
Closes: https://syzkaller.appspot.com/bug?extid=e0055ea09f1f5e6fabdd
Tested-by: syzbot+e0055ea09f1f5e6fabdd@syzkaller.appspotmail.com
Cc: Mark Fasheh <mark@fasheh.com>
Cc: Joel Becker <jlbec@evilplan.org>
Cc: Junxiao Bi <junxiao.bi@oracle.com>
Cc: Changwei Ge <gechangwei@live.cn>
Cc: Gang He <ghe@suse.com>
Cc: Jun Piao <piaojun@huawei.com>
Cc:  <stable@vger.kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Miguel Garcia <miguelgarciaroman8@gmail.com>
---
 fs/ocfs2/extent_map.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/ocfs2/extent_map.c b/fs/ocfs2/extent_map.c
index bb3a56b7f9a7c..5e86c7e2c8212 100644
--- a/fs/ocfs2/extent_map.c
+++ b/fs/ocfs2/extent_map.c
@@ -981,7 +981,13 @@ int ocfs2_read_virt_blocks(struct inode *inode, u64 v_block, int nr,
 	}
 
 	while (done < nr) {
-		down_read(&OCFS2_I(inode)->ip_alloc_sem);
+		if (!down_read_trylock(&OCFS2_I(inode)->ip_alloc_sem)) {
+			rc = -EAGAIN;
+			mlog(ML_ERROR,
+				 "Inode #%llu ip_alloc_sem is temporarily unavailable\n",
+				 (unsigned long long)OCFS2_I(inode)->ip_blkno);
+			break;
+		}
 		rc = ocfs2_extent_map_get_blocks(inode, v_block + done,
 						 &p_block, &p_count, NULL);
 		up_read(&OCFS2_I(inode)->ip_alloc_sem);
-- 
2.43.0

