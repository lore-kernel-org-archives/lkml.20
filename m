Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792550682;
	b=Beig3/yeGPlftFUESNYhaiyB1dE07CjDQO3FSeZtmbG31/oA5ScLBnVSAfemZEWZxRzV
	 w2AYdv9FgViYTXoG2AKoImKIV1w+7bKbUALH7WNjm6KM253NJE1aKVwnut4XwxQrjz+19
	 dPBpgqwTWJGRJxCy4fxeEYWsWLCYL4ckWiArW4gs41/aAou+f8C9ozBxH53fe2GlL02Vu
	 AuLPsYC+NObqSyNk15LIrzooD/xK+3EGvpPZGX0fWC9ZzdrzMdzEGouRB6TY8MiGDD9NA
	 kXoJNSBRjc8YumLVaC/47rWB7PpbtIQjZXOI4PaNuVcZIot9W/icTb3ArxVWyPuCFfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792550682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=NLzlKEOsCi9w1u4q3xRYee71IKEIz7iOlD+JfCxLSYE=;
	b=ZeaOCKRbBdvQ4y8n66IJSP6IFGBwzAxjarq97suLulatszba7BxOZzwWFGjVaq5GzPFV
	 /pCCRDqTmGnSs/B5PIBWlmxC39gtjolEpb/Qm1Nj4Bey+iJlKEskA2rwDVWL2RFf+zamw
	 pqikSS//TMvg81vOkuyXn8bhja8VIUFWUv0XC6XKtz3ozWx18S1nVhlg5Y91JepoQLv4b
	 BPV6pSq+VfvI5vbbLs4yb7Oq4w9KaTWG4G0SBpeoQgty2luLc/xivnZYgo5B35QWs9ro5
	 9u09mrISMJELY+UAgoEo2IO5cc4L4hytjdB5YSvRLb0YlGqEc3C7/VSiKzRcebBN0KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Y5mLSoKN;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20AD606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C20AD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Y5mLSoKN
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93f30660e69so17419085a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792550681; x=1793155481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NLzlKEOsCi9w1u4q3xRYee71IKEIz7iOlD+JfCxLSYE=;
        b=Y5mLSoKN1wf+TJ7KGubIjdn3WlM/DL/bPWbC0kwnpROcjNtXwpaJpuPzxEBokXuT7g
         BZ6iWdkbX6kAOkFyY6lqoVxJXNRb9qJ/xGpgnMnpEllAc7mo05t4gpdzxzPSC6aSOIfQ
         F4CsiTTM53I3F4PGtHIVrP7GxKFmHc40BZTl5mmDnlVv5Gt4ajOyfkaRy51E7U5iDdap
         IUP79AkB5miV24Vw0I9767QosQoip5MeU7EZfXs3cfZk5DCfvXgW/HaDrBWveJfGJaUY
         huOWeY6f86eBMB7/2hOi7PYB4WlFVM6HuKTC+zhZzLHjM8f3VfUsa74VkF8XWGd0XOLx
         fb6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792550681; x=1793155481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NLzlKEOsCi9w1u4q3xRYee71IKEIz7iOlD+JfCxLSYE=;
        b=minsVLF/RBOiZMNL13v+5hrE+3YXcYxXnHJfAhyP9Jwzxb35F4kyIMqPXjLn6V+X2y
         30kNux2CqXWvtOcwpRAWOiEpCwUGv+ofnzs5+7+dqkHRPv7odLRxeidEfPA5SEggV51D
         ssTNto7KX4CTswLSxvfdm6S4hjP53ESKGRNen2WlZSh7MfGbcFSU82qA/L8i2f7BZsXq
         aF0r+wq6u+uzGLbjMdp9psjFWj1Xz1GJy8xCXV3VvZMugE9vnCuN5gPZQmJjeTeJm/O0
         +VNRzqRv/iiITgGUZQxW2nMznQsrUL/+L0xkKlxlNZbHmB1xWGmLyJrKH2nW/kLpc8bc
         u5Hw==
X-Gm-Message-State: AFq9FYLPtHXm6ui4a0lbCH3C/qiPlIdLZ64DA2yraeXPrm1pzr0L0mej
	wsavEvLtfd0IJ9q0GHGoUCbnmd9anocjhgz46WGdClR9FXgf9hTZTuHr7m+dkd/XkSo=
X-Gm-Gg: AYBFou1ewMgKX56tTmONfkQwc5JEH+PgxY2Q6DJ5HGFo0TXb3m5IaKIo8N9daIg//Tj
	Z7FaRKhMJNge5q4jkfkwt7CDFiGJ+ZZHqN28GSsh2My66afcmvo+s5TsZLk2BTujSo/u9+ylEko
	XfIkvJGi96x6kGhENxkHhSWczlnz0AbFLEzarc2p3umkPtfohnvYroWjfqATVV//kW70JbQA5Vz
	LxZOymRsgaTRmnuTXguIhAG1rljw2QV3jC31W23375snj4QmD9SLU2+jp6WbVNHa29TC0J0cfG2
	qT6zoWV7rFZxkoWZrexu5YHDkYd/0mlccjKGw7C8QvJxOvq8+4Swkhvy78xlrlC2GaxoBzWB8Ij
	Fvi+5tXqK4BpoupOpoqKu9IVVZwFR3czkZ6ni8x79shrPk4E9DKtWR7aKkgy6ellfp3y6ogCYxn
	TTFIgmOHnqdKnBDK93DosHHSLKJ76cbLG/i9AsKcsJDi1i9z8OGhK+NgBcXzTu+JxNNPPLz4Sqb
	Ui2WRKzgE0t6JlowLfRY66iMWhekK9uf22D92nKhClGvhY/TH7H3zIqvecigWcsfV6S8/HCCnoM
	XS1wBRpO5KHkNINZSd/MVzxkJLh25A8Vl8Mlptkwkw==
X-Received: by 2002:a05:620a:1a17:b0:939:c1d4:e2e1 with SMTP id af79cd13be357-93f57f0bd72mr216584085a.25.1792550680719;
        Tue, 20 Oct 2026 19:44:40 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56dd0022sm140259385a.20.2026.10.20.19.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:44:40 -0700 (PDT)
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
	weixugc@google.com,
	aneesh.kumar@linux.ibm.com
Subject: [PATCH v2] mm/memory-tiers: reset demotion targets of nodes without memory
Date: Tue, 20 Oct 2026 22:44:38 -0400
Message-ID: <20261021024438.1942502-1-gourry@gourry.net>
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

When a node loses its last memory, offline_pages() clears N_MEMORY
before the memory-tier callback rebuilds the demotion targets.
disable_all_demotion_targets() resets only N_MEMORY nodes, so the node
keeps its old node_demotion[] entry while it has no memory. Before
6c542ab75714, the reset covered every online node.

A reclaimer reads the stale entry only between the node regaining memory
and its targets being rebuilt, and it filters the entry against the
current allowed targets, so there is no user-visible effect. To see it,
online and then offline a node's only DIMM: a debugger still finds the
lower-tier node in node_demotion[nid].preferred.

Reset the targets of every node.

Fixes: 6c542ab75714 ("mm/demotion: build demotion targets based on explicit memory tiers")
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
v2: +comment

 mm/memory-tiers.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/mm/memory-tiers.c b/mm/memory-tiers.c
index 25e121851b58..9d872404592e 100644
--- a/mm/memory-tiers.c
+++ b/mm/memory-tiers.c
@@ -378,7 +378,11 @@ static void disable_all_demotion_targets(void)
 	struct memory_tier *memtier;
 	int node;
 
-	for_each_node_state(node, N_MEMORY) {
+	/*
+	 * When the NODE_REMOVED_LAST_MEMORY event fires, N_MEMORY has already
+	 * been dropped from the node, so we must walk every node instead.
+	 */
+	for_each_node(node) {
 		node_demotion[node].preferred = NODE_MASK_NONE;
 		/*
 		 * We are holding memory_tier_lock, it is safe
-- 
2.56.0

