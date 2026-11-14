Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640220;
	b=vDms4Z8uWF/nV67XAFUDyU2CmGhMLtjhDkdvTy7kCZglVeUbYvUMKS3gwS7GNxNYC1R3
	 GSn4T3vPRnLuV61w1pEgv3q3nm1Vebhj+6Bw3rodBkQSj6+OtHuKOIVvY9IZ0pj21njkw
	 XzH/4BLp2/pmof3bLv/H0nn/bEMtr/kqPJdLkxs93JUZK1R3CM7MJU4ZuPL+5VFNaq60v
	 j71shdr9usdvTvpxgdfAV2m++8kRgaZhNld7MnOpxfHY1f40S3uAXYoSGAeFNY+KLq4X4
	 eFFDTyIJ4pG62hmt0rAvCBV91PK/Lp8gFhn4fsVnqQcLxeif+PTELmbS9+zErDrXQ9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KKsqfMs+Khz2jHdLUAmVstaMz+t2qjUPbSjoMCe8lqE=;
	b=sYjiZGPItNEICZYw1pYL3652QHl6nDUAY9oTBZxNRzWuRLjY7qub6aJWM3ZbJm+jtyn3
	 trkjD4gGT4tviHyezVhiOrj38XoDJPp36tWmcnWt2sj1PdhdNC+T+Sn6GY2jFVqx6MeO2
	 QRJ+rAbS3Ll0i5zPNkypI14RG4F95TX4VhQmZf6fjzgHHX9Aerml/yDngxKF3GXKORB8w
	 fKagdMX5o68L4OYLbl6bsRqaMuqi7+yHo/kmDyx9+ucDfIlrdbDTWIX0/Ias7B27Nlt9A
	 m9QN5e1AMoC+9tY1S+SXrwz7oHVjZN2M6gXLAEPxorb8ofBBGCgenpoB2KSPADJv+yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=DqwCNYMH;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1509606A88F
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1509606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=DqwCNYMH
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91eb46044c4so40932606d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640219; x=1795245019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KKsqfMs+Khz2jHdLUAmVstaMz+t2qjUPbSjoMCe8lqE=;
        b=DqwCNYMHewOC4msVcjcbomSD/RH/iBIkH1g2hmEJMOaualbLATe3pKbpO0F6X+Ys6j
         XI5ID0YU9Rl5GHP2YBUfgaG11qLowljKPp1L/CE3dS0a7sJ0FEZuYrwPHARVno8an/I2
         fKqYLyHw8DCH+YmeSLrTExiH4Rbiy5ZRGzSoqF1J+HyLIWvHk//8j6jliUzRu9EJ90gV
         bzdYIc2cA9NWG2hMcp+mPZpHos6QTVFNDUkTMHEywINAJzvZ14tVQfxCeMwvw86df8Un
         AilmmGsmKQFnPRbl1anjv+ix9zx5Y28uQSVyExIBRJx781NleEdiHu8g5v6XoaUTedMN
         vgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640219; x=1795245019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KKsqfMs+Khz2jHdLUAmVstaMz+t2qjUPbSjoMCe8lqE=;
        b=zDF+A/NsDseOPk7dY8P6rj2MGSerFMqd3KLZr7mZs5Ahdc1OTw+nHbtYP3ih4q3Apy
         e9Me5JFS1j1gVtJp3wkADU/5oozONvEq6YqfovYZgb8ji+kA4Z3Xd64X7E46eMwFvrcK
         Mljm72QOtWzWeykj1UPjtEbbC4JLvCNHMFQ8634e+twSi/2xWXbEUmRsjypB39nEalpL
         lDf9tlMxuYTI7c/5cTCxevsufTIZIU48QpXRDCcxRg2+Pmk5Ab9bulILemhogQpYxy1q
         UEYIeoAw0gRZR3OkJHHX+OSXzPGoPpuHVpMCnj5Mgd+G/B2fa/WNtmA50e99CyNXhpLN
         qQkw==
X-Gm-Message-State: APuU4Z+G8G4jXGRGUqnVRodM3uJDPoVvP+TqgYQbU3KNjj0ncc72PKEQ
	4xgY/wfV4dEzgTR5nEd7QLFYo6PEBqrCTYUa27JqbfiF/MK+23odC1UIt9lu6BiRdfc=
X-Gm-Gg: AYBFou1QQdyTb1OZCg976ptJobojvOcLBeXoT6mbhIqwZVOkLRZCZdA3UWktcUevZSr
	33S8+MU4wGoYBkL2d4EYARPsJxkD2ADaieDw7y5qPB7enfzFBsgVLElA4kV0VY7wvfO1UuRZsIF
	OH+mITnmZlLCSFwyAVaWRSVzrNXUAZeD9P1+UgWL0dkLKA1J8rZv1FrH0tGfFiC9L0lJVV1IcLw
	J0rvSaFcGgFRFC2TKQ7jWUYQkU9cIOpknyIIMrngaOhrfhj2LE0pzZK8Eq/eJfLHfmTT8DyxnY+
	GEU9QumoleOWS697ZHK+SEg2Q6vYzVZOM+7UJo38r5Fk8i+99FucZZ1SigV9xTz8+LMIXNsCPCd
	GbuYglTjIRXmQWkT8y2OPKMp9IX7R9WvQ5/oTGomEi74U5BFRk2W3W3vaAdmnr6oziXUBnrma9+
	h2nYXGR0a21lK52sAI0SQb6wj0/VOuKhXYjssNG3/2FEzFSvLvZdWnmkhqCccBepg6bIrru45Cv
	jI7Zj+2aoSQ05EEcoKpe9QheMS5Vo8y6zz4oOjXkz4MbiVJOC9V1J2FhNroqIzVIQsuZpbUSqst
	S/gXVoU2yvtsfoOmZLkDtJxzXH4vRSFRktLstjrRqKpSIMdfB8HnbqZsbwzwma1JvtYKBXteJHF
	GlIaqGGTU1TZ4inM=
X-Received: by 2002:ad4:5d68:0:b0:91e:a6e7:b445 with SMTP id 6a1803df08f44-91f241e127bmr84458226d6.9.1794640218986;
        Fri, 13 Nov 2026 23:10:18 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:18 -0800 (PST)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-serial@vger.kernel.org,
	linux-pm@vger.kernel.org,
	damon@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	johan@kernel.org,
	jirislaby@kernel.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	pavel@kernel.org,
	lenb@kernel.org,
	hannes@cmpxchg.org,
	brendan.jackman@linux.dev,
	ziy@nvidia.com,
	sj@kernel.org,
	muchun.song@linux.dev,
	osalvador@suse.de,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	xu.xin@linux.dev,
	chengming.zhou@linux.dev,
	gourry@gourry.net,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	matthew.brost@intel.com,
	byungchul@sk.com,
	apopple@nvidia.com,
	rientjes@google.com
Subject: [PATCH 07/22] mm/memory_hotplug: migrate offlined pages to common memory
Date: Sat, 14 Nov 2026 02:09:44 -0500
Message-ID: <20261114070959.3490008-8-gourry@gourry.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114070959.3490008-1-gourry@gourry.net>
References: <20261114070959.3490008-1-gourry@gourry.net>
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

do_migrate_range() / alloc_migration_target() is only capable of
allocating memory on N_MEMORY_COMMON nodes. The destination nodemask
presently starts with N_MEMORY and removes the source-node.

In the current code, if the destination mask becomes empty, the source
node is restored to allow migration during partial offlining.

Consider this configuration:
  Node0 = N_MEMORY_COMMON
  Node1 = N_MEMORY, not N_MEMORY_COMMON

Node 1 keeps the destination mask non-empty, despite being unreachable.
This leaves migration with no usable destination because the source
node is not an eligible allocation target.

Restrict the hot-unplug migration target-list to N_MEMORY_COMMON so it
reflects the nodes the allocator can reach.

All memory is common at this point - behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/memory_hotplug.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 490f400498f14..29ff2c46499b3 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1904,7 +1904,7 @@ static void do_migrate_range(unsigned long start_pfn, unsigned long end_pfn)
 		folio_put(folio);
 	}
 	if (!list_empty(&source)) {
-		nodemask_t nmask = node_states[N_MEMORY];
+		nodemask_t nmask = node_states[N_MEMORY_COMMON];
 		struct migration_target_control mtc = {
 			.nmask = &nmask,
 			.gfp_mask = GFP_KERNEL | __GFP_MOVABLE | __GFP_RETRY_MAYFAIL,
@@ -1919,9 +1919,9 @@ static void do_migrate_range(unsigned long start_pfn, unsigned long end_pfn)
 		mtc.nid = folio_nid(list_first_entry(&source, struct folio, lru));
 
 		/*
-		 * try to allocate from a different node but reuse this node
-		 * if there are no other online nodes to be used (e.g. we are
-		 * offlining a part of the only existing node)
+		 * try to allocate from a different common node but reuse this
+		 * node if there are no other common nodes to be used (e.g. we
+		 * are offlining a part of the only common node)
 		 */
 		node_clear(mtc.nid, nmask);
 		if (nodes_empty(nmask))
-- 
2.53.1-Meta

