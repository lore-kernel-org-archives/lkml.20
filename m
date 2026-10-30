Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793376761;
	b=02JXlv5hxxVY8diuHjkMI43R5yVjXq1dE9ctfTOP/PRZKa0SRReQxeMryTfuAvLc2AlB
	 DHU9bwXquKBuguT7qpoUD7BpSioL6PuYtFDgbzoBNkXOAjUT3QUP/HYrnyqj7oLo15ubh
	 ViJl/l6j87nvTYVIiZSo+aKpDA/O56NwykwaR2SGJ17Uy690CmTGNjN7Vs/rvXUq4gcf4
	 JGLndpEqZxjR5zkSO6o5EoqkPWhK3q/+LvVrKW7g9CTojM+75zxF3El3RCcYBNlMPM0yd
	 uGYJwbyo4pHILRxNJVnqzwrbLtpQL9922JYk+QTuoaGRIPszrZt3ge2vayKhDMtbZbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793376761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=uBqGgi319yANUlDreD4lJdCrP+kc/0b2EBnj4SdcGgA=;
	b=oaf024PhwnAHgc75qSMD6SRimnQmz/qNgivg79QCbQ/+C+b5vjwf0KV/NaqZcAYIbR0H
	 Y385c8CHTLv0CLrS3hCGl41RS1wmLPG/S7MQT27Ql/6j7NLT5OwQexNmzsatdGYph0KK7
	 4SF1E6TDvaxbT7XFvZrCyNXMyW6PxbmGg/1Yy9IZrtl5huvlSt/M+jWclCIoN3VHSvHD0
	 lAtpnZcgfyTKCyeHwL84GF8t/G/XIgcQ7xx42NLES0CqWlacuNjpJa+V/ET9eoHXyex4b
	 zrvVtx8aO1LTlby/HU1l5vl6+8v0KU14OUT+QdE0W6RC9GlkEc67tvEffD8cLAIINQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=V3xkXO1W;
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EF6606A329
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6EF6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=V3xkXO1W
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91c19fc50abso11422906d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793376760; x=1793981560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uBqGgi319yANUlDreD4lJdCrP+kc/0b2EBnj4SdcGgA=;
        b=V3xkXO1WAgdSrYUFOVJTKrzWiLG4R1wqbNfA0fWyXKxFaf61Z19cujhlimdELtIVPJ
         3rajACVq3Wa5syfFQCy9irgP3Qw74UEPlEssHw8GUVD+AbcNIAy9uzlstrfUkPoxJmO5
         YAmFDMnk0UZEMg0Du1vvTV77nfLKXGNbWo0db9bRTK2yF/GoXXA81EdPqblVRTB2c1oy
         T1RN8KQOT9wXYgY8d3R3wwiVWfGHPNewklslCSEKT079M3fAagQOS0mqcE9Zt2WlGMX4
         gZb70TkpRYZxfG2g5pdGxznqZYZvZLhi9N+uW7veQfJi+tRO2J8XLIL2E3uswr7krSot
         xXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793376760; x=1793981560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBqGgi319yANUlDreD4lJdCrP+kc/0b2EBnj4SdcGgA=;
        b=VhIrr3QAWCfwrfJ02yQo5lKn8+I9MzrFlMrWvZx14kyljBPAXba3NQvUHusw80Onkz
         vURKv8U2Dj9Qrv0xG4SLMbmW9xPdXpbcvDC0DCauDNSDjegUTYuiiSmX8+UITaOwz4H2
         ZkDs5EoOAw9qyC19IuStBzHDdXQw5QT2pM/MKK2XbbZoiIVdaL4w4ec8EEoCvCzXCEsu
         1HclzJLZYOjSdbRbC/zzMhHQUmf53vfoQyuvLQ2uY1xt0lgi+JtX9F07cSIc+cPwyV1a
         3wKdGivKaFr8o4FBIEl7kQWqyRgIquJzF6iFRdH7VS7tijKF9f1hZ0Q9q+XUxVsOQR+z
         DiTQ==
X-Gm-Message-State: AFq9FYLiaRKZSzJi/MWGIsL/b6Q+mb2YzEwvoJLpHXkN07CofhyUYEVr
	qyitpkyUF8xlRxSg6v5/QTYf9iD8uUNrBzZ5TtqFKgQ3jrcOPud7GJQcySrKjvIc30s=
X-Gm-Gg: AYBFou3epRWh/txezemiBAunEwjBWexyz6PrHuBHC3fFUYqy8ZlkG6xqF+4uOM6khMG
	N92wfPPvLTjzRKYzKLYakQ7ktffKUduspRlNeRQCZhYNwyoRp9Sttm6LchoRwKW0JC1Aog5qdGg
	Zu/rkwupkpEYr0G1wi8zxl3nFRNLouoaRXqhvYG2K6ug+iLZvYi+kwnwfUW5u0osuAl21wMvSIa
	rLZTtTCJ7e2xpmYxhH44EzDVshl2qdA6AHNw+YGsyg8cugWcLQaAZfXsYY9hzXrVlrbtesh2N7J
	Par4lSuGTfre5OKK9ClGBN875OXWWfGvARx7BKsRLC2NTbfZyQQ0fVEil2EjUlFa1AoJ6mHVsG9
	5gVSWuDR6a1njyf3WjwtPaLIlTiuM/ihROqoAjO4u6QcP2HWKvsm8ci0nIS9MBtbVGBrUANa3h1
	/GQwSxX+x+U5ric4GoZ6lQHfM2KVNyuWxIw+b8TxzDeXNDyMHacOgQqcTiAoX5wBgovsg9ENsFs
	b2iJzENL0BPe5+AdBcGG5RQrRbdmlt11GQ5CEiGYrJoTDShuquZQ50pZbefCsyH1yqf8pgQxsr2
	mrEs1aS4DFo6Qwp4xjqheAzfVmYpAWCjJ9yxOE8pBcurrP+RgY23U0OaK65nHwEbhmFCV7GScmu
	qM/vQar8YQdcHm84=
X-Received: by 2002:a05:6214:248f:b0:91c:7460:6eb5 with SMTP id 6a1803df08f44-91ca4ad4cc9mr40967836d6.15.1793376759518;
        Fri, 30 Oct 2026 09:12:39 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca8082914sm18501396d6.42.2026.10.30.09.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:12:39 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	gourry@gourry.net,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	harry@kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] mm/mempolicy: recompute automatic interleave weights on memory hotplug
Date: Fri, 30 Oct 2026 12:12:34 -0400
Message-ID: <20261030161234.1505367-1-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
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

In auto mode, weighted interleave derives each node's weight from its
bandwidth, reduced over the nodes in N_MEMORY. HMAT and CXL report a
node's bandwidth once, when the node first gains memory, and nothing
else on the hotplug path recomputes the weights.

This can result in a major skew in distribution and overload tiers
with more data than their respective bandwidth can support, resulting
in a performance regression.

With HMAT bandwidths of 100G for nodes 0-3, and 50G and 25G for kmem
nodes 4 and 5, weighted_interleave/nodeN reads:

  event             node 0-3   node 4   node 5
  node 4 online         7         3        -
  node 4 removed        7         -        -
  node 5 online         7         -        1
  node 4 back           7         1        1
  Expected:             6         3        1

Toggling auto off and on generates the correct result, but we should
detect this and fix it during hotplug. Recompute the weights from the
recorded bandwidth whenever a node gains/loses its first/last memory.

The notifier cannot fail the hotplug, which has already happened, so
warn once if the new weights cannot be allocated. The next recompute
starts from the full bandwidth table and corrects them.

mempolicy_set_node_perf() now only records the bandwidth and calls the
same helper, so the bandwidth is kept even if allocating the new weights
fails. wi_state_lock is dropped between the two steps, which should be
safe because racing writer simply causes it to run with newer state.

Fixes: e341f9c3c841 ("mm/mempolicy: Weighted Interleave Auto-tuning")
Cc: stable@vger.kernel.org
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/mempolicy.c | 84 ++++++++++++++++++++++++++++++++++----------------
 1 file changed, 57 insertions(+), 27 deletions(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 0884c629670d..6f92621e9135 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -238,27 +238,49 @@ static void reduce_interleave_weights(unsigned int *bw, u8 *new_iw)
 		new_iw[nid] /= iw_gcd;
 }
 
+/* Recompute the weights from node_bw_table, unless they were set manually */
+static int wi_state_refresh(void)
+{
+	struct weighted_interleave_state *new_wi_state, *old_wi_state;
+	int i;
+
+	new_wi_state = kmalloc_flex(*new_wi_state, iw_table, nr_node_ids);
+	if (!new_wi_state)
+		return -ENOMEM;
+	new_wi_state->mode_auto = true;
+	for (i = 0; i < nr_node_ids; i++)
+		new_wi_state->iw_table[i] = 1;
+
+	mutex_lock(&wi_state_lock);
+	old_wi_state = rcu_dereference_protected(wi_state,
+					lockdep_is_held(&wi_state_lock));
+	/*
+	 * Hotplug events can arrive before any node reported its bandwidth,
+	 * leaving nothing to compute weights from. NULL wi_state assumes
+	 * auto=true.
+	 */
+	if (!node_bw_table || (old_wi_state && !old_wi_state->mode_auto)) {
+		mutex_unlock(&wi_state_lock);
+		kfree(new_wi_state);
+		return 0;
+	}
+	reduce_interleave_weights(node_bw_table, new_wi_state->iw_table);
+	rcu_assign_pointer(wi_state, new_wi_state);
+	mutex_unlock(&wi_state_lock);
+	wi_state_retire(old_wi_state);
+	return 0;
+}
+
 int mempolicy_set_node_perf(unsigned int node, struct access_coordinate *coords)
 {
-	struct weighted_interleave_state *new_wi_state, *old_wi_state = NULL;
 	unsigned int *old_bw, *new_bw;
 	unsigned int bw_val;
-	int i;
 
 	bw_val = min(coords->read_bandwidth, coords->write_bandwidth);
 	new_bw = kcalloc(nr_node_ids, sizeof(unsigned int), GFP_KERNEL);
 	if (!new_bw)
 		return -ENOMEM;
 
-	new_wi_state = kmalloc_flex(*new_wi_state, iw_table, nr_node_ids);
-	if (!new_wi_state) {
-		kfree(new_bw);
-		return -ENOMEM;
-	}
-	new_wi_state->mode_auto = true;
-	for (i = 0; i < nr_node_ids; i++)
-		new_wi_state->iw_table[i] = 1;
-
 	/*
 	 * Update bandwidth info, even in manual mode. That way, when switching
 	 * to auto mode in the future, iw_table can be overwritten using
@@ -271,25 +293,32 @@ int mempolicy_set_node_perf(unsigned int node, struct access_coordinate *coords)
 		memcpy(new_bw, old_bw, nr_node_ids * sizeof(*old_bw));
 	new_bw[node] = bw_val;
 	node_bw_table = new_bw;
+	mutex_unlock(&wi_state_lock);
 
-	old_wi_state = rcu_dereference_protected(wi_state,
-					lockdep_is_held(&wi_state_lock));
-	if (old_wi_state && !old_wi_state->mode_auto) {
-		/* Manual mode; skip reducing weights and updating wi_state */
-		mutex_unlock(&wi_state_lock);
-		kfree(new_wi_state);
-		goto out;
-	}
+	kfree(old_bw);
+	return wi_state_refresh();
+}
 
-	/* NULL wi_state assumes auto=true; reduce weights and update wi_state*/
-	reduce_interleave_weights(new_bw, new_wi_state->iw_table);
-	rcu_assign_pointer(wi_state, new_wi_state);
+/*
+ * HMAT and CXL report a node's bandwidth only when it first gains memory, so
+ * recompute the weights whenever N_MEMORY changes.
+ */
+static int wi_state_node_notifier(struct notifier_block *nb,
+				  unsigned long action, void *data)
+{
+	struct node_notify *nn = data;
+	int err;
 
-	mutex_unlock(&wi_state_lock);
-	wi_state_retire(old_wi_state);
-out:
-	kfree(old_bw);
-	return 0;
+	if (action != NODE_ADDED_FIRST_MEMORY &&
+	    action != NODE_REMOVED_LAST_MEMORY)
+		return NOTIFY_OK;
+
+	/* The hotplug is done, failing the notification would not undo it */
+	err = wi_state_refresh();
+	if (err)
+		pr_warn_once("failed to recompute weighted interleave weights for node%d: %d\n",
+			     nn->nid, err);
+	return NOTIFY_OK;
 }
 
 /**
@@ -3414,6 +3443,7 @@ void __init numa_policy_init(void)
 	if (do_set_mempolicy(MPOL_INTERLEAVE, 0, &interleave_nodes))
 		pr_err("%s: interleaving failed\n", __func__);
 
+	hotplug_node_notifier(wi_state_node_notifier, DEFAULT_CALLBACK_PRI);
 	check_numabalancing_enable();
 }
 
-- 
2.56.0

