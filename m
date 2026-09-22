Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF24331EC2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790056862; cv=none; b=Po8bsSGkJPpZ5sM0wYYRc6ubDKg4yqRaRbezjfeL+wzZqjnfs4h+WPOG6J7ClfXNq3qGn1Dif/BjmKnv6yXj4hMqZlD2nJ/I6J0M04egqeNbGMTNeKUTYFQo9Da+877H3E8rmoiZgk+1UrCLN696zE6duA3cEcK/y4FrRfpY0G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790056862; c=relaxed/simple;
	bh=jwRMV2lzKqCP4gBEUdEB/8pqORMqENAic+GrSVlSju4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S6AqVzGlkhaY300LraQSGDWFylzjtLt5odsKInJjurB8yn8w+6gkIqACrLpY/jcYlJCuh8RqhanOJeAcREJoaOWzSNRRNnqK9WDoT1jncrecqmMAiTVUL/t4idOhobLOhE3PpktN4Bjyp3KibaYGGFqtllzenHTc+trcyyqPcd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G71mR5n7; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G71mR5n7"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cebcb8d7so1172339a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790056860; x=1790661660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zD1+CNlJQSHstEQSAiUKt4lsgldAJyFYDs7AdpQW/fI=;
        b=G71mR5n7u5uBIaEkWovdkzDbEm7eSKroqorKclzmceDZYP7qfulTmGzB6IgJIIT++v
         CfhL94tqSZTTU00i+eVXXr+VfBacc7K0VzxJeqzvJ0Mv36KDAz16Vob1T4q1GXfoYaPU
         SXAHYLwJgK3Nmil/0x6V21TAtfyj6HRqIXDChl/WLESrnwW3lDJFd8j6zNFnZP/bNx6y
         0I5e7jxie38G90pc/1cb3MWrpsJW8IRxil5MfFf2tAsejhkv+sVAMXE8FFURSs7c4t8k
         2gVqiWB9EM3wFS/lI88kwpxHhv/CQSmcl+L1T1L+ZXaaIdJ4uym3Q6MUh0lwzdjynl1K
         N/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790056860; x=1790661660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zD1+CNlJQSHstEQSAiUKt4lsgldAJyFYDs7AdpQW/fI=;
        b=Z/ygC74BwtTAT286fRVfXy0yyulUVLIhg9rIWfoPmgYu0FZBVybHlnmdjariGDyYLU
         ZTOBO+r98Fe0YdLtW+1czSh1JkZCVHr7Z+MiGyO7EvUks2kwG3NYg34OuVB6d7eJrCt6
         t8VxC5loqUk3NH0nIvD7x7RLhSGnei6RMaAvHaQHOgLKmf7QEA6ubrh/ZuZq7qgW3nhs
         CFq7Huls0SpOwzS3F2AjzXz5Uvq5Y2g/H0FAy0jHPMQhqdzrfUuaQ3jCrJQks1lV51sm
         9mraBkH4+CBBv+0u/L95YFrgBITSZ+BjXYhr79Y5zPmRnJoAbkL86EntqfJo4JW++YN/
         bamw==
X-Forwarded-Encrypted: i=1; AKwUvBwcr5epPZzMxlruMmAZb4lxYbRh7k7i/pgrQDWDHHSj3I4gIaSdd9wyLG5TTrxWW2aMvuk3N0PQKkgaWIU=@vger.kernel.org
X-Gm-Message-State: AFuF++nvsgD4E1UlXYIbIY0jZvkXRxQ/inpvcdo/gsYg9NX93AyNRo6h
	ysMr1ojhoBpL+LlEplOlJJ/RYMCRntrmXDj4muyOTTOYm0XDeoI0wi+O
X-Gm-Gg: AYBFou0IqSCTdzrL1YqZUlMEQ4tTGKkkX7hW2OngoO4qa3lOVAVbqV1vwWbuiliUbER
	2mgNdij1KRlbnCqEkOyujKyGgGc7uPiOWKfMixXAaLQdTeoD5BVxxVwu2vyfPD075UioGHTOQ55
	bgzLM5cgDULrQOMT3ZOAbDieed2IdmzEpdDHimdXNShD8vtrKgop057PQYLRsoc+id1kO200S8S
	k68LK4JL8aLtIsa8bgqvhGFFqv2mIu7mg6Ll0kAWnHGCNi9bQ54hZ+X6ovX5PvVaqhf7eJ/5mDx
	2gvQLWdfEQf80XGvHdpZ6TIqCKZ5qWzLzKNOCM4rt2bBsa1IhYrvQDRPeDvloHs8hgsw/xM2Tje
	bcGOVLVA1TMjNK2G71urhU965/qN4xpTyo5Zk2N/dQS4BiRKYGLc48XntEBF2aBoIjmXmr2ZDEG
	NdI578at+Fviuqn9p2Hil93nrsL4KolXYh1zfWj6VeM2nOj00k5JK2iLFrprRZt4rNbeoy4Lcic
	4c/uer87vXdfFci8MRz4VhJWrj/tt3bRA==
X-Received: by 2002:a17:90a:d2cf:b0:39d:feca:f48d with SMTP id 98e67ed59e1d1-3a0735e2284mr40422a91.3.1790056859956;
        Mon, 21 Sep 2026 23:00:59 -0700 (PDT)
Received: from localhost.localdomain ([202.189.109.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06dfd6705sm1423138a91.0.2026.09.21.23.00.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 23:00:59 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com
Cc: ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ocfs2: Protect local_alloc_state updates in load/shutdown
Date: Tue, 22 Sep 2026 14:00:48 +0800
Message-ID: <20260922060048.13158-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

My static analyzer identified a potential issue in 'fs/ocfs2/localalloc.c':
osb->local_alloc_state is documented as protected by osb->osb_lock in
struct ocfs2_super, and most of the code follows that rule:
ocfs2_local_alloc_seen_free_bits(), ocfs2_la_enable_worker() and
ocfs2_recalc_la_window() all update the field with the lock held.

ocfs2_load_local_alloc() and ocfs2_shutdown_local_alloc() update
local_alloc_state, and local_alloc_bh next to it, without taking osb_lock, so
those stores can race with the reads and writes done by the local alloc
reserve path.  Those two writers predate the locking convention and were
never converted.

Take osb->osb_lock when updating both fields.

Fixes: ccd979bdbce9 ("[PATCH] OCFS2: The Second Oracle Cluster Filesystem")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
 fs/ocfs2/localalloc.c | 6 ++++++
 1 file changed, 6 insertions(+), 0 deletions(-)

diff --git a/fs/ocfs2/localalloc.c b/fs/ocfs2/localalloc.c
--- a/fs/ocfs2/localalloc.c
+++ b/fs/ocfs2/localalloc.c
@@ -342,8 +342,10 @@ int ocfs2_load_local_alloc(struct ocfs2_super *osb)
 		goto bail;
 	}
 
+	spin_lock(&osb->osb_lock);
 	osb->local_alloc_bh = alloc_bh;
 	osb->local_alloc_state = OCFS2_LA_ENABLED;
+	spin_unlock(&osb->osb_lock);
 
 bail:
 	if (status < 0)
@@ -392,7 +394,9 @@ void ocfs2_shutdown_local_alloc(struct ocfs2_super *os
 		goto out;
 	}
 
+	spin_lock(&osb->osb_lock);
 	osb->local_alloc_state = OCFS2_LA_DISABLED;
+	spin_unlock(&osb->osb_lock);
 
 	ocfs2_resmap_uninit(&osb->osb_la_resmap);
 
@@ -441,8 +445,10 @@ void ocfs2_shutdown_local_alloc(struct ocfs2_super *os
 	ocfs2_journal_dirty(handle, bh);
 
 	brelse(bh);
+	spin_lock(&osb->osb_lock);
 	osb->local_alloc_bh = NULL;
 	osb->local_alloc_state = OCFS2_LA_UNUSED;
+	spin_unlock(&osb->osb_lock);
 
 	status = ocfs2_sync_local_to_main(osb, handle, alloc_copy,
 					  main_bm_inode, main_bm_bh);
-- 
2.43.0
