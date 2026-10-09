Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012074A5C44
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540313; cv=none; b=MNhv1DiRxbmg3DzhL5ZivRuWHfHkiFdbr0/WJEpT0+NPVqJ+FSAUKRhYKOtEsuLW/AUV50XNUVADQtdl0D/jhLzMXs7ks5wmvxI/+AJryATHQlX3gcNTdrowbtaGvrPCQxE1vlqdnjjFqLGPgAwYBwTiwg53bK+NgO/vskEtVqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540313; c=relaxed/simple;
	bh=zeWR0WfokKp9ZtwxmTpL1MQF6hizvBIjf5JyD3r1Rd8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sTheFSuLKUWbGmdwykBjTYkUb747DR5GOFZ/FrqB8N07KShseKoKZJ/AQTYJv4VXhjDZIq3hV2MLl+dra+pezl9dY4pQQctE0f8QAEt2eB2VytOJ9DmWcaHLdvedhsC09pNiZaTkBNWi69lkKt3PvbeAxbe9AWOGKKpsBXPpRzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJR3RRJB; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJR3RRJB"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e618db81c0so20575645ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 03:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791540296; x=1792145096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ogu/BtajEQWyJ3zFLux+gZr1Wq4ynKnt7QP0d0lnwTs=;
        b=FJR3RRJBWC4rVA7aTW+tX2ow6NMO4YAnJSQSlK5RPlj6/ml2qSUdHX64pGApF+ovGw
         1OqZuBppe/+85pUbLlR++q1ovUbG7wGB8xSh4FZhsA2dGdDqtejWx+JHOSKK35l3buHY
         P948ygqua6g7sULWM3GRBwSRGLv6MBdsVLMtYxPccNwHTorgRhhpVr6zwEz108izgr30
         Z8dT9vQTWww6fNHPeUTeCI7l3ZZghcuRMLpGjD4hM8OP4mG/WlnDw+R3xUv//ZUgbxQO
         xjeOHzHrEfp+H1CDU18nZAGZwgovsw+KYzVcON0wQvO5A1tDs3dqE8DlFlOx1baJaAZl
         QS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540296; x=1792145096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ogu/BtajEQWyJ3zFLux+gZr1Wq4ynKnt7QP0d0lnwTs=;
        b=h2Z/BSjHYdHdX4E537JpSchtdje+qoA0RI0oTTqTH7V39j33R8mf8a6idd/kk9+gBt
         mXhqIrPtebercaAiRern9ZQekB3m6ZDexTTtjKy0zKjCeFXCI+KzvjSg9PSuWwAP0qJ2
         Q8TOTX6n1IKh3gPmE9hbS8LEX0W34pSBLncQ7eI86N5NuoRcsewhqa+rOxTqTfSdbZMh
         2MraaSiVS+efhePaVTnwRADrhQ3ObuRcXH2NpUNbuekst0Rn+5Rg6bNkICja0abokcfM
         vmbzrZBNywhAgkhpzOodYq3n4OOLzcsIBv/rRF6uN4/78u1S0YyBO44MK1YlR1K9OKKI
         saIA==
X-Forwarded-Encrypted: i=1; AKwUvBw0TdvDysvHv6TD2H9zihgyelcy2PZDSilrFWOygzvJoyTf6YxouOg4uRZzEG7g869ioGHgZs1t0RYzFxI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHLmu3d0fg9PJ3wsXuuRea+K4FZXkt/iE5psBm4Tqr2Iznskib
	AR3MX1CF1vVUCP9HoOsi86CRlJRHhoKZeun7aoU0Vx01z98Tt6zdyO3I
X-Gm-Gg: AYBFou2nG3/GJTJZcLjk2z+0qA5oVCWwsZtRlrkwPkweP9Eor7i61TexfiOZvSTLu5A
	LxZQkPRsuc+9wHpCn66mDpq/iucmJtYGTvkIOdDQEICqiVZPm8K2/39tuTFWbIl0Vxw/+8ybPaH
	8hXRTDnYhIYXxCZctOnk96RcrCJnvkE/rmTnGYlZF1/QQzp8rEVa2BUmL5MrAbncGebBLiFIYmw
	UtBcoyj0DIcV7eQBhHGdwvhMKRZhcYksInD/LwqW2z4JI9DCdJi9+UDTRtZDtOoxSAAwVIjkkFA
	nrz+f2e8nnsTSqdxwze8oZ8RTGQbjhcHsJw48fuGBVLJ+ylG+prPBAo5syumzOwomwixv7C4C48
	RLVY6l3DMOtJLUHQXyw7pZS2rILqgG6z6TBU2yHtSmK1uc2z3yAzonKuouUrLPOGhN3yaH1es7t
	01GKo52fCkQvgoS1hV4ZKXlOfDHBL6aKGrzSep0PE0bNQjAVpO2Dp7wG2esEc57V+Bbg==
X-Received: by 2002:a17:903:17cc:b0:2df:a972:e48c with SMTP id d9443c01a7336-2e842f37fe2mr11158855ad.55.1791540296059;
        Fri, 09 Oct 2026 03:04:56 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e1643sm6131975ad.70.2026.10.09.03.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:04:55 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com,
	akpm@linux-foundation.org,
	ghe@suse.com
Cc: ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ocfs2: Publish the filecheck owner before adding sysfs attributes
Date: Fri,  9 Oct 2026 18:04:49 +0800
Message-Id: <pm-ocfs2-objects-candidate-0086-v2-646731c4254a02823b4d@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ocfs2_filecheck_create_sysfs() initializes the filecheck allocation
before calling kobject_init_and_add(), but assigns entry->fs_fcheck
only after that call returns. The default attribute group can already
be visible while registration is in progress. A concurrent read can
therefore enter ocfs2_filecheck_attr_show() with a NULL fs_fcheck and
try to lock its fc_lock.

Assign the initialized owner before adding the kobject, so every
activated attribute has valid state. Clear the pointer when addition
fails, preserving the existing teardown guard and error cleanup.

A controlled probe-instrumented test kernel with the original OCFS2
registration ordering produced this Oops during a concurrent sysfs read:

  KASAN: null-ptr-deref in range [0x0000000000000028-0x000000000000002f]
  RIP: 0010:kasan_byte_accessible+0x15/0x30
  Call Trace:
   <TASK>
   __kasan_check_byte+0x13/0x50
   lock_acquire+0x113/0x300
   _raw_spin_lock+0x31/0x40
   ocfs2_filecheck_attr_show+0x138/0x5f0
   ocfs2_filecheck_show+0x5d/0x90
   sysfs_kf_seq_show+0x1d3/0x360
   seq_read_iter+0x480/0x1110
   kernfs_fop_read_iter+0x419/0x5a0
   vfs_read+0x7d2/0xc20
   ksys_read+0x111/0x200
   do_syscall_64+0x114/0x620
   entry_SYSCALL_64_after_hwframe+0x77/0x7f
   </TASK>
  Modules linked in:

Fixes: a860f6eb4c6a ("ocfs2: sysfile interfaces for online file check")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 fs/ocfs2/filecheck.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ocfs2/filecheck.c b/fs/ocfs2/filecheck.c
index be713d7d24a76b9aa8fcded3d83b3d91d124eb6e..862c1ee7099c943b2e3e57e31f887380c6dc8a88 100644
--- a/fs/ocfs2/filecheck.c
+++ b/fs/ocfs2/filecheck.c
@@ -181,2 +181,4 @@ int ocfs2_filecheck_create_sysfs(struct ocfs2_super *osb)
 
+	/* Publish the initialized owner before activating its sysfs callbacks. */
+	entry->fs_fcheck = fcheck;
 	entry->fs_kobj.kset = osb->osb_dev_kset;
@@ -186,2 +188,3 @@ int ocfs2_filecheck_create_sysfs(struct ocfs2_super *osb)
 	if (ret) {
+		entry->fs_fcheck = NULL;
 		kobject_put(&entry->fs_kobj);
@@ -191,3 +194,2 @@ int ocfs2_filecheck_create_sysfs(struct ocfs2_super *osb)
 
-	entry->fs_fcheck = fcheck;
 	return 0;
