Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9540D3F6619
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789111331; cv=none; b=f+H0YqceECo614n9TMo4Fq/vg7YpIaPqspsT8HXtaXuX6iVe5o4ri5oNf6yBoCPsOgXmDUvPe7oWq5+ACmglJuN/HWo3QPhdsvwUuyygJk3gGcItsJUw1Yxxo+29xwY25sMyWoYBMB92mnSWwP+gwHRc4kT3NP3mVbzfpO+LDN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789111331; c=relaxed/simple;
	bh=lFzg1MXITlP0YPhhoCXm2dI0efV/qs7X58nFUlpexRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HLDVXM5W8k5bgo89VzX+1t86KC3+nB2oxapkzjDK4mxK2gb5nSbWgChF7pYhfGxX0CSTCXOOgGwlKgKDAKoBwmkVmOHXt5HAxpW9QKN2IlldCAYnLL3qkhWbrkdL2pr5Sgru4ePLnH5ww68qdaZrI/mfMUI5m83WQ7wQ/j+A6dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0OYgPIl; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0OYgPIl"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2dd020a2e44so5663465ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789111318; x=1789716118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jzIySDJIl2DBofVkPAxMDaItjAN5Njq5eDX0RMJ2Xb4=;
        b=G0OYgPIlJmiX+wwhGdJSRzlmiSBEf2FA9CYiOcz97B/TzQDhnNpAWBndbxrmVCxYPK
         eVZ8Eu+fPOMpr8cGWiXgMedUwqJD1ZmSVUQ1RWSM3kMy3zOwLL1eSzOR5RmExxoFENR1
         yM5IXq6kX+4YDKZWc0UBy093p4WxbLa8UFuq5onTh7P+ITxhow+GtTlAk6M+MqjVt3Dy
         rDcvMKrbpa8fiZXXmgJ3VjjoYRnw+NutKx91vx1LXI2S0fezXXgzKa6z2w0Hc3kbAVJj
         WH/erH9naNoPuXCjBqtJfXQ4PbyMnNgePodqBQhAJ8U7s1sQLdvMqoCTieqpOj/aSaRd
         ts9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789111318; x=1789716118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jzIySDJIl2DBofVkPAxMDaItjAN5Njq5eDX0RMJ2Xb4=;
        b=SJ4qU4E+wPxr28GyonwOAVxzkuyzyP7T5DnvgW9VH7gpj85BbS+vZduoxvjoWVY7KJ
         6WICLntkPhUtX3uaHfBTikMFnDkWVB9V4sxAoC4KUp0aBnKRxiK0HF6K5Ai7Xz6z/Zoa
         7jLY944rh+Rl0tuR4thgsFkARewcpNFnDYEYYpVO+uzly/wLlOpRQ2E3l52fziJHSgQr
         sCT9Jn6C2NAAyiZX/00Q5jQgawXT8uTJULpZ200/o+wkOF6Zx4HW4lcCyDSSvMk09ymY
         CO9Yv4uctyJvAzqGgKcEPwYQzMMjb+sqwBllrjXq3kw2ChPvOaoMtG7zyY4+EFklN4Ki
         4p7g==
X-Forwarded-Encrypted: i=1; AKwUvByt4ouG2k3KdZxmCYJkPfU1X7WFJMSnVGJi8nzN9fHrO1cIL/7rwbQOz0sbBCWqGX1agHOnKCZQwMdBPYA=@vger.kernel.org
X-Gm-Message-State: AFuF++lVha7vq0BMhQbj59TZkp5e9n5Qh4psFKoH7uFPao76ce71TyCx
	lSaPvzNYolsuqzpTr6WdAXg8Nw+QBddt/fXKXwEoMLwJMHUaWJpO73z8
X-Gm-Gg: AYBFou2682zLa9J2ZyI/EAkBUS16owHvy4optJyrnnPwLtguZlC5ExmtWcuVzGTw3ox
	JvoNYcMhZDf8o2cllGisPzJiJuRt5UHKFsIm1scaxUvoY5kWGiTLzGTl/ALsmb+cWi7XY+Rb2Vd
	vHd/nJ/VWMXrP4NwXx7c3ej2jNYFa3pukh63Lgzn0iQpARM1IMrfqVh9ils+eLXIN7NVqqFqXYE
	beL5nyFzbOLlgUr4Y/ApfZWG4k7b7TIaeRlFc9oZCP2hpQKyKCaF161bfET6/WiIcbZbdAlkDxd
	5Zfw6t230YtHauP6xRk9UtAnvcjbdA0q6ZoAxmr2gI2I9uu9ze6bbbv+SxCwEmMYZXZjdAm9IS9
	Bsuw1O9TV57RWTAoc31tT3UlsCbbM/Q/8hppWSHBSJaTe7cGETrk6eW+K4/a8/mrXdSKdXpi/mk
	3VOqqc91lKNT7M1r9LLfbiWq0gZ78BXrAWTPtbUHsohtJrS7Pe3UmLeEer//6I0zsvn29XA7bri
	hyumXpRFD83bn2KqfufHtkdh9zZ
X-Received: by 2002:a17:903:46d0:b0:2ca:660:b1d with SMTP id d9443c01a7336-2dd2a347a88mr58895465ad.11.1789111317511;
        Fri, 11 Sep 2026 00:21:57 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca26b2sm7245945ad.4.2026.09.11.00.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 00:21:56 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: jiangshanlai@gmail.com,
	paulmck@kernel.org,
	josh@joshtriplett.org
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH v3] srcutree: Don't transition atomic SRCU to big in srcu_gp_end()
Date: Fri, 11 Sep 2026 15:21:25 +0800
Message-ID: <20260911072125.2268530-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Atomic SRCU must remain in the small size state. Warn if this
invariant is violated and avoid transitioning to big in that case.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
Changes since v2:
- Also prevent the transition when the atomic SRCU size-state
  invariant is violated, per Paul McKenney's suggestion.
-v2: https://lore.kernel.org/rcu/20260910084629.3695383-1-kunwu.chan@gmail.com/

Changes since v1:
- Drop the !is_atomic guard from v1 and add WARN_ON_ONCE() instead,
  per Paul McKenney's suggestion.
- v1: https://lore.kernel.org/rcu/20260907075829.2073224-8-kunwu.chan@linux.dev/
---
 kernel/rcu/srcutree.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
index 84c022ec8e09..07db4e459b30 100644
--- a/kernel/rcu/srcutree.c
+++ b/kernel/rcu/srcutree.c
@@ -1073,8 +1073,11 @@ static void srcu_gp_end(struct srcu_struct *ssp, bool is_atomic)
 		raw_spin_unlock_irq_rcu_node(sup);
 	}
 
-	/* Transition to big if needed. */
-	if (ss_state != SRCU_SIZE_SMALL && ss_state != SRCU_SIZE_BIG) {
+	/* Transition to big if needed, but never for atomic SRCU. */
+	if (ssp->srcu_reader_flavor == SRCU_READ_FLAVOR_ATOMIC &&
+	    ss_state != SRCU_SIZE_SMALL) {
+		WARN_ON_ONCE(1);
+	} else if (ss_state != SRCU_SIZE_SMALL && ss_state != SRCU_SIZE_BIG) {
 		if (ss_state == SRCU_SIZE_ALLOC)
 			init_srcu_struct_nodes(ssp, GFP_KERNEL);
 		else
-- 
2.43.0

