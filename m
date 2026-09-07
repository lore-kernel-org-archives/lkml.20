Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E72446BF5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770514; cv=none; b=tCY/MjhR/17Z5gKCABbrEIRnb2uhF6JNd4ZKQJx/lFIBNTCHvuuLjVXYJOjezQpFefe5HUd8ZYmW+2uQ3S30nOgvxhopPDbHXCZtI2qTu6UkMX7GIFAoLxgVz1eS7wYNxEYaOT5FHuf0l628m/R4lGYPPaWAuusrN4Mw0Hg9Ckg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770514; c=relaxed/simple;
	bh=wfXE8uypbKYJA7BC8MjKFDfmD5UiS7JineuAHlHdzVU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NEMtle41B7M89EOxd5wiW/a7pgTvWX/+za3cwcutF2tO/Q5gZYVZwOYo5qA4ApKBcHj7bxrcenZodcmanRle5R4EcEL8yNrX9NTniztTQ7wTkWLsvYDEs53iNT/6kN8+70ealcm5BKT066CFfCqPue4Z6iPXejRxkiHp7B7T+3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rHslAWBB; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rHslAWBB"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4858303de5dso4042278f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788770511; x=1789375311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AKJGGS8rHZVSsitHp/iDOAiBUo3rGEd7SOXEHhtBYe4=;
        b=rHslAWBBqhOLnkn9peWNZwbKTAyASpoplN0RUcEW78yNjECpoHlfaKp7Dm4WaskYAL
         YcgCX3pDrC+evX4GkjUO8buBr+XVpByc5Hu8l9Ypgz10ddFxUa9T4Gck5vYG1i1V9RaN
         bhDKsN5hL3B7nTikbn0OPRn4ZPZtc/nqgO3Qsi40xrwb/7g27j7UWi78jLLhYXy3rcY0
         wxDNbfU2tsnPbDhP5DiN203dYih7T46RVnhRUDIjj20ZsB29qDxdUjUimgb76klCGfet
         mDSaK55puuOCcpiVJgSRoGv4NpbsCahVkxLkbPt1sK0UP5lqHpJu7oMfaHjYh4yOnb/2
         yTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770511; x=1789375311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AKJGGS8rHZVSsitHp/iDOAiBUo3rGEd7SOXEHhtBYe4=;
        b=TVauXHp/zEplOzb80Jv3Y8f7FYzS8BwjQueLTb9SiSruI6XKXsW7cYFX74HZDzJtHg
         aOabhEZkDw+VvmvI5f7k5ZOaDHcCSIdxfGnxgH6G3WUxMK2cByGEhjXRTpYQhmSNg/sH
         rBF5oicHjr8E/MW4nnVwkG6jABcfwpKeLsgDkgrIaKcmWylOP4I1zpOZlIE5HRFkZlON
         gCx7NdGShuXEip7DPIMbBN5Cd8GyfE+S+OrtZ9tTaBfncIaS6sfrq0L05BFmVH5k7Qzj
         VL1PLU+l0IV/KVoRShQozKZ0VH02prtd3+Vd5VOUdLzMILlmY1RwWjluh130x0MlnlKh
         iTBQ==
X-Forwarded-Encrypted: i=1; AKwUvBw95+hFnawbDEN9kOMVLXPkjhYEBb/WpGk9N+8IpBelkq1e8Ii4eBl/imqgP2TfTc9S0LOHxisJIIrnZn0=@vger.kernel.org
X-Gm-Message-State: AFuF++nkOqon6xu+lC/N3aKTWmkDIfUptgGG0pZdTLOjEFUiPL0BD2mc
	J4W788qZJZRZa36CihGptEkgUufqOQ0cGD7s8f4yRIbo12xtuvdusSV2
X-Gm-Gg: AYBFou3+tAhJ/5nVtrxpw7bmsyiY2KumcpiQSGWM5KUGSdEvzJNU8so1tRk1jSQ3Ub7
	4FHIPXhTxRdUcqBXNuZeqiX43kkAXkGsun8sJl24vy3p8EbnLoAPIl0V+OomAPiC6nIndKBfzO8
	UDBfZXxOVUFuChBoB3GJb/C2JmgNd1WsobPqfsurqJYjkShv5T+5G0l86vE3VknQUzBh5FlZQBP
	71i9JA4LwpISi8cxGYiSq9H6Al8wlcn+wqffvjQMEkXla/inhIT25hx5GRy9UwZGU+N9s7yBOWm
	cIoSYcTh6qeA4Hyzj0/gCNl8n+pZH0rEopipKNRC+oa3986MRpcBlryqDVretaJ8K3Sdk0EhfgE
	aYN1ybNow8Dw9e1sOTgHWuoYHssZyVom29p31G/ObFOdF2aA6IRKOhl/AS8sazAlmQi/KVT770X
	yq/KwjGa3Y3dUlNVfHPvtKzUWbmdf4TnKqF8IcdIBT8plTo2B7stJU67b0iGg7C8l5gAOG5ftWu
	XLOTxV+L7BiX2vXSol9FQlIoQeA+5PZw2A8XvzyYrAtcA==
X-Received: by 2002:a05:6000:4555:b0:484:68ed:2afc with SMTP id ffacd0b85a97d-48587059c26mr19692495f8f.11.1788770510854;
        Mon, 07 Sep 2026 01:41:50 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bbb51sm27883762f8f.30.2026.09.07.01.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:41:50 -0700 (PDT)
From: David Laight <david.laight.linux@gmail.com>
To: Waiman Long <longman@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Yafang Shao <laoar.shao@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: David Laight <david.laight.linux@gmail.com>
Subject: [PATCH v4 next 1/9] locking/osq_lock: Add some comments about how it works
Date: Mon,  7 Sep 2026 09:41:25 +0100
Message-Id: <20260907084133.3696-2-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260907084133.3696-1-david.laight.linux@gmail.com>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No code changes, just some extra explanations.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 kernel/locking/osq_lock.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
index b4233dc2c2b0..b17aa704c449 100644
--- a/kernel/locking/osq_lock.c
+++ b/kernel/locking/osq_lock.c
@@ -4,12 +4,33 @@
 #include <linux/osq_lock.h>
 
 /*
- * An MCS like lock especially tailored for optimistic spinning for sleeping
- * lock implementations (mutex, rwsem, etc).
+ * An MCS like spin lock especially tailored for optimistic spinning for
+ * sleeping lock implementations (mutex, rwsem, etc).
+ * Each CPU spins on a local variable to avoid cache-line bounces.
  *
- * Using a single mcs node per CPU is safe because sleeping locks should not be
+ * The CPU that holds the osq_lock checks the mutex/rwsem, the other CPU spin
+ * in osq_lock() until either the osq_lock is obtained or the scheduler
+ * requests the process be preempted.
+ *
+ * Using a single osq node per CPU is safe because sleeping locks should not be
  * called from interrupt context and we have preemption disabled while
  * spinning.
+ *
+ * The osq_nodes for the spinning CPU are put on a double-linked (non circular)
+ * list. The list 'pointers' can either be the address of the osq_node or the
+ * associated CPU number, the CPU numbers are offset by one so that zero can
+ * be used like a NULL ponter.
+ * The mutex/rwsem contains a pointer (CPU number) to the tail of the list.
+ * There is no equivalent pointer to the list head - the 'head' is the
+ * osq_node of the CPU that acquired the osq lock.
+ *
+ * The 'next' pointer of the tail must be NULL, all the other 'next' pointers
+ * must either be valid or transiently NULL.
+ * The 'prev' pointers only need to be valid when node->prev makes sense and,
+ * even then, can be transiently invalid (ie refer to the wrong node).
+ * They are only used for the node->prev->next = node->next update when
+ * 'node' is being removed. Atomically checking node->prev->next == node
+ * ensures the list doesn't get corrupted.
  */
 
 struct optimistic_spin_node {
-- 
2.39.5

