Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5C6511194
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983769; cv=none; b=OkIPsw/xuS3jbxeQyefg5kfj/xIkooBPJwivL6l3cvfn423u93s2bDZxysO7T9DhV0bMiA5scWHBJoSIH2FNPcQxgSX9j3BrEdWrn9TJAttVcuNTs9Jpze8lWT2lX3raPvJdwzFImz9wAn5/pQ06EVUT55a9BmKnTAz5fhNnjNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983769; c=relaxed/simple;
	bh=KD8qmU8PwyhxB0YHC+67j/clWMmY6xBL4+hnjb7XBxY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UfZauEsfmVYvAaSZby9WFt3ZM27bLfxRPe1l+uPlgKuYt7HSl87+PS2n7IFfu9XuEpzXOLvK+XldIFGuxJJ357Hcvlp9+HBpbntr4Gaf8IUbm5B+/iuXevxvGqmzw8G/my8bab9uEbXPYTlGLd6S3FX093WGqudkUnQqzqb+mfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IfV8S4NQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IfV8S4NQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD001F000FF;
	Wed, 14 Oct 2026 13:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791983767;
	bh=N/Kx0frmkxosvQcop9AdOprS27rR/qXNkOdGxt6bKsI=;
	h=From:To:Cc:Subject:Date;
	b=IfV8S4NQS0MqMSLTMwNl1QtVDDkd4UFmd5o0O0OGBCKj/A4Te/Y8nCmicx7OVbrwq
	 6DOy8g4oT/WhRQ7kj6Ob0FSCFmHLmTwhMvQFGI9QK3hFL6CdwN4EUKuYNzuDQiSNjX
	 bArrNH0X6myiUQssLkLoGWrMMxej/xMGzZRMKfmW0ZbzCse+Z0b7fldUO91ZcIHFOM
	 d+Hs+e1vRtiAbij056A7JxS/5qBI5Tv/WmDU6XUSkVyv9eK67kKv/B8cPngMEYBECe
	 Kbbcgcll6kLnGn2PCbYd1kYd4Ae9KvsUUTW1OzIR0NwYzxDhr8QQUw4u2VZQbY+yqn
	 uca2v4+jYSvKg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Alexander Graf <graf@amazon.com>
Cc: kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Bing Jiao <bingjiao@google.com>
Subject: [PATCH] kho: do not reserve empty per-node bootmem areas
Date: Wed, 14 Oct 2026 15:15:44 +0200
Message-ID: <20261014131547.259138-1-pratyush@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Pratyush Yadav (Google)" <pratyush@kernel.org>

Some nodes do not allocate any early boot memory. An example is
hotpluggable nodes with movable_node enabled. So the scratch size for
them ends up being zero. Zero size allocations normally don't play well
with memblock. Memblock returns an address, but then doesn't actually
reserve anything. This address ends up being recorded in kho_bootmem
with a size of 0. In case of hotpluggable nodes with movable_nodes, the
allocation on the node actually fails because memblock refuses to
allocate there, and so KHO fails to initialize.

Skip bootmem reservation for such nodes entirely.

To keep the code more robust, avoid overloading kho_bootmem_cnt. use
max_nr_bootmem to store the size of kho_bootmem array. This ensures that
the location of kho_bootmem_cnt assignment does not affect the cleanup
paths.

Fixes: 3dc92c311498 ("kexec: add Kexec HandOver (KHO) generation helpers")
Reported-by: Bing Jiao <bingjiao@google.com>
Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
---
 kernel/liveupdate/kexec_handover.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 7018e25e4eda..6f1f55fe3181 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -831,8 +831,8 @@ bool kho_bootmem_overlap(phys_addr_t phys, size_t size)
  */
 static void __init kho_reserve_bootmem(void)
 {
+	int nid, i = 0, max_nr_bootmem;
 	phys_addr_t addr, size;
-	int nid, i = 0;
 
 	if (!kho_enable)
 		return;
@@ -840,8 +840,8 @@ static void __init kho_reserve_bootmem(void)
 	bootmem_size_update();
 
 	/* FIXME: deal with node hot-plug/remove */
-	kho_bootmem_cnt = nodes_weight(node_states[N_MEMORY]) + 2;
-	size = kho_bootmem_cnt * sizeof(*kho_bootmem);
+	max_nr_bootmem = nodes_weight(node_states[N_MEMORY]) + 2;
+	size = max_nr_bootmem * sizeof(*kho_bootmem);
 	kho_bootmem = memblock_alloc(size, PAGE_SIZE);
 	if (!kho_bootmem) {
 		pr_err("Failed to reserve bootmem array\n");
@@ -882,6 +882,9 @@ static void __init kho_reserve_bootmem(void)
 	 */
 	for_each_node_state(nid, N_MEMORY) {
 		size = bootmem_size_node(nid);
+		if (!size)
+			continue;
+
 		addr = memblock_alloc_range_nid(size, BOOTMEM_ALIGNMENT_BYTES,
 						0, MEMBLOCK_ALLOC_ACCESSIBLE,
 						nid, true);
@@ -895,13 +898,19 @@ static void __init kho_reserve_bootmem(void)
 		i++;
 	}
 
+	/*
+	 * Nodes that needed no bootmem were skipped, so fewer areas than
+	 * initially estimated may have been reserved.
+	 */
+	kho_bootmem_cnt = i;
+
 	return;
 
 err_free_bootmem_areas:
 	for (i--; i >= 0; i--)
 		memblock_phys_free(kho_bootmem[i].addr, kho_bootmem[i].size);
 err_free_bootmem_desc:
-	memblock_free(kho_bootmem, kho_bootmem_cnt * sizeof(*kho_bootmem));
+	memblock_free(kho_bootmem, max_nr_bootmem * sizeof(*kho_bootmem));
 err_disable_kho:
 	pr_warn("Failed to reserve bootmem, disabling kexec handover\n");
 	kho_enable = false;

base-commit: e1fe7daedae7a4a23aca6dbd58e1746750b632dc
-- 
2.56.0.385.gd3acb90ef8-goog

