Received: from mta0.migadu.com (out-96.mta0.migadu.com [91.218.175.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE4138F254
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791747622; cv=none; b=cZDAgyafjHU2Nahifs4V5wWAKXp+l3kFOx7mMv7a/CZgURyT0Cg0aac7e06qszi/8J1c5yPHCQpt3P13P/fPKwBeqjVHHOISp3mmaAKb7TD/mTwCL2H0qzTkOVeLhvdVLugWeF1Poc1FEson6WdLkqtAC+Qfj6lYUb+Ihc7U7Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791747622; c=relaxed/simple;
	bh=VrECW6y3UTzCcA5YfnHCh/KC1GIO6HnF3Hx/47w6WF0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WJJcGscqn+NqG9tJLGbML6IiTfG1+/l7VVQBUjLx4DDImgwat8rmQbFNjNGH7nFi50n7oqe6e9STyLt3ALJRW+g2G/CBYiWxbm0/UMuw3WK2X9mSBExP9ELqWB1Uk+jiHBCPbNvWypa1X+UzIJtUPbVBcgd406ulNefOSaZpaho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bavTD7/f; arc=none smtp.client-ip=91.218.175.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bavTD7/f"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VrECW6y3UTzCcA5YfnHCh/KC1GIO6HnF3Hx/47w6WF0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791747619; v=1; x=1792352419;
 b=bavTD7/fc0pl//sHhmGVSRtRVGxVK2g4Sz4mEygm5Roycc9nSO1yNSX2wvYy83X+A+8zK6Cg
 Yg12Bw4C21HN/ITku/7sYeBmwarBIR87YcJAH7A2rJ8D+p294KeT1j0htOyeCPZG8AsAsYqDrJy
 RGCr4dyE2j/GDCQPpEzLY040=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id c1f1836e7e53e850;
	Sun, 11 Oct 2026 19:40:18 +0000
X-Mizu-Trace-ID: c1f1836e7e53e850
X-Migadu-Flow: FLOW_OUT
From: wen.yang@linux.dev
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: Nam Cao <namcao@linutronix.de>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wen Yang <wen.yang@linux.dev>
Subject: [PATCH v7 08/14] rv: Add per-object teardown hook da_extra_cleanup
Date: Mon, 12 Oct 2026 03:39:14 +0800
Message-Id: <68b2e41332eb12ebcd07383402ca6cac1a83b429.1791745088.git.wen.yang@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1791745088.git.wen.yang@linux.dev>
References: <cover.1791745088.git.wen.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wen Yang <wen.yang@linux.dev>

da_monitor_destroy() frees each per-object storage, but a monitor
whose target is allocated separately has no point to free it: the
target is still reachable from the storage until hash_del_rcu().

Add an optional da_extra_cleanup() hook, called for each storage after
da_monitor_free_hook() has disarmed its timer and before the storage is
unlinked.  It defaults to a no-op.  tlob, added later in this series,
uses it to retire and free its per-window record.

Suggested-by: Gabriele Monaco <gmonaco@redhat.com>
Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 include/rv/da_monitor.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/rv/da_monitor.h b/include/rv/da_monitor.h
index f9af56304c9f..97d9e876c891 100644
--- a/include/rv/da_monitor.h
+++ b/include/rv/da_monitor.h
@@ -116,6 +116,16 @@ static struct rv_monitor rv_this;
 #define da_monitor_free_hook(da_mon)
 #endif
 
+/*
+ * Per-object teardown hook, called for each entry after
+ * da_monitor_reset_all() + da_monitor_sync_hook() and before hash_del_rcu().
+ * Runs after da_monitor_free_hook(), so it may free the storage's target.
+ * Default: no-op.
+ */
+#ifndef da_extra_cleanup
+#define da_extra_cleanup(da_mon)
+#endif
+
 /*
  * Type for the target id, default to int but can be overridden.
  * A long type can work as hash table key (PER_OBJ) but will be downgraded to
@@ -715,7 +725,9 @@ static inline void da_monitor_destroy(void)
 	 * pending, we can safely assume no concurrent user.
 	 */
 	hash_for_each_safe(da_monitor_ht, bkt, tmp, mon_storage, node) {
+		/* Before da_extra_cleanup(): it frees what the timer reads. */
 		da_monitor_free_hook(&mon_storage->rv.da_mon);
+		da_extra_cleanup(&mon_storage->rv.da_mon);
 		hash_del_rcu(&mon_storage->node);
 		if (DA_MON_ALLOCATION_STRATEGY == DA_ALLOC_POOL)
 			mempool_free(mon_storage, &da_monitor_pool);
-- 
2.25.1

