Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792435636;
	b=f48lp78FL1WDEEj9Pz0rfTkD5s0W58A8yHspL4qwmbQEVuOFtpH+Au4+ka0fC6sdE95t
	 H11hru6SfTNE+eFbkTca5AVDCamnd2laP0/ygLx7kEly2qCqzmKuw/cTKz2dkdSYWeNtZ
	 vV33Ry9NCTnIHW5nNx2f1LrpYx5TJG4jNXPWnvllUNwn2O0vEh/DyGt1vsS5o159AfHTD
	 EQWkAYlgpctzfa95JzFgEyD/8OOLQogGLQPk+J5i+b2feLWhthh8qImUNpfBYw9tajdjn
	 DTi7rDRtezG/m3le+oc9BMMmxuJ5Aiy/wMstjvytvTkTx2MqKWZreniFXiBJ7LQ3xHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792435636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=hbKgm88xqZwylAt4q2OznWtgQkbJqO8+m4FSvU2MBBc=;
	b=dbLivkUN0ZQXZPA39WJnz4TSri5zUVBsfhH4dwAYXvw9vIVEvyXy9HSms9K8a6Sgnnyx
	 rGS0+nsFmVfuK22SRuR0GIygcikti4S2G5dz1+gwano0BGxaNMDMZol8V+h9j2f+j89fH
	 k5RDtOyKTl1NKKJKHgkAgVNWgpGE8ceNdzKp/DP0uEwZOAlRMKP1bX/VzYMPQ7C6yASqi
	 6ZZhkV8x4kWVqlTdSDWapiAB52KQF/nt4vhKIbP58hg8TbCOWZWwye1cG6fWNMGyXD1mM
	 KDbbaPknHwOh9ZFxJK8+YJEZz2SzJLks2Yak/FLzxpsxHsm5V3F7m5i741wChAoQQQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=tNehWdLT;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ABB606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30ABB606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=tNehWdLT
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-917866225aaso22768956d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792435635; x=1793040435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hbKgm88xqZwylAt4q2OznWtgQkbJqO8+m4FSvU2MBBc=;
        b=tNehWdLTzbkrxKoy4JfY9AR/tpf+2We0X1o7PCutb5lhn6HVqVkRwcCvQhOUdwT0q0
         4rFoIMAuHYB1ApM2Gzf6Asg+fECWXXo53+H0NDnW1XftiXckREe7V685vrAJPfK6HLpb
         T2rAyT0NnEDH5vUUATSU1fy4fstM375D2eV4xkHak0uLChoiFvru8GUcv7s+y6V/KK5Q
         8g3nt/2f0IYoppg4Dr/woMksr6ZwGOxgj9j5jupYh19c4KmxcvSlkKK1Cnh5U2QApjO+
         FP36uir4WYT/VJBGCelP6sXFvTUVqPBlbBWMDIIFIJhh55RRZfLhV5fMxZZY/azd3cku
         fVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792435635; x=1793040435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hbKgm88xqZwylAt4q2OznWtgQkbJqO8+m4FSvU2MBBc=;
        b=nFjROUyIijjCfV/fqH5wEHu76dIr6dw2KXYG1Egbx3ffQu3oK0glkr0rkNQ8FSwGH6
         OgPO2Zb3/mIDQR2sMtWHAU0VgaElHs82rytUrdMhw+04Hib/Xsn4RJRqV3otwzQax4lZ
         JDbD06EZ+/wojxkUiH2aMrHKJJJqgGFwl8FN/LoGAUQsUz8NszL0QkKBN1+wUh/dlXRp
         3AaC+mIB3NuPBzYLaHjcg1dj03W5/ID0FKrFkLfqCZk5e7zfgPxyTEi5Llp7mu4AxS0l
         DNklrqeBgFcVUsz5vDXV7NqXEV+gFPqA6GlmJ4/AwOezEJu5e+Ya+kdn2zsVqYl/LgLs
         xQPA==
X-Gm-Message-State: AFq9FYKCXRRY6GGOgdAQB+Jpu0j7l3kRBMZtXcuInx1DeGu+zLXLf+26
	zPGmv/uNuRRwIw79UW+szYdoSWSYL2hmbXy0rM2HucvWOz4eUAKX4OFwHohJHBipxM8=
X-Gm-Gg: AYBFou00DMC2flVyn48LDITB8ufGxGWfYjYABpKEn1Z5X2zCRMC7GXXfs+YebDmba8j
	hBxdXfbMxn9k/+lSqvoBe0XxFoRWxrgsUSnF+4yWUAxynNOFUlCOWIOGgyr/ycGMYKTkDOw+5du
	1ppaFeqJSB+IpueUrRw9GrG02l4yhLghRBFLjPhpw2IzyK1WhtwWy+WCEmm+I7CCQAt3R1WO2NW
	OmhrZsWU9HrjNunZ1y2e29z2MFFz5cbdg2XpMRHGvCZYgorJ6NZsDekpmKzsAtKUhYulzvp6gHa
	OI56d1gRTWWSUP6OuSAAx8lkA/483kj6KintDGKgYET0Tu4GtJJ25MF8eGFVa8NwwuKyZHbXAcV
	mA3vuuH9ctq0tHb44y9vHVHgI7iIXE28DU/QrN4h/IvcZ4dFdjbD+e1h52V8+v+GAaZavfjQfhd
	duuuHofrQcIVLdu6f7Geoi+bxN0we5KvQWr2Oz7nZlYQBWVSMO0OTIYPXir4qaFCscxA6tznw8F
	Zt9+/JNJ3aKjbMa6cE5T49iYLhqIdH+7vC+4S0HcL3gijqSdaN29B6NqILQ
X-Received: by 2002:a05:6214:3f89:b0:915:4229:17a3 with SMTP id 6a1803df08f44-91bdf7ef1bfmr142927206d6.25.1792435635045;
        Mon, 19 Oct 2026 11:47:15 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c040e2ddesm3081366d6.36.2026.10.19.11.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:47:14 -0700 (PDT)
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
Subject: [PATCH] mm/memory-tiers: reset demotion targets of nodes without memory
Date: Mon, 19 Oct 2026 14:47:10 -0400
Message-ID: <20261019184712.3422641-1-gourry@gourry.net>
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
 mm/memory-tiers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/memory-tiers.c b/mm/memory-tiers.c
index 25e121851b586..7197f1a67a340 100644
--- a/mm/memory-tiers.c
+++ b/mm/memory-tiers.c
@@ -378,7 +378,7 @@ static void disable_all_demotion_targets(void)
 	struct memory_tier *memtier;
 	int node;
 
-	for_each_node_state(node, N_MEMORY) {
+	for_each_node(node) {
 		node_demotion[node].preferred = NODE_MASK_NONE;
 		/*
 		 * We are holding memory_tier_lock, it is safe
-- 
2.53.0-Meta

