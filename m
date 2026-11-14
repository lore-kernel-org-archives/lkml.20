Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640238;
	b=GNX+TSFrBW8z9f3AaRGlkllus0/tFb6g6xZ3UlhHisB6pDBBPcvs7HGx6oAZ3d5ATppB
	 cFH8Iw5lWc7R0rWhf+/l2VlKxdBGT1cXhpXwPKpqR2/dkVwBfJ7Ok4UL08dVmhMVHpGe8
	 yyau4nYQbfgemga+RjIVsJe6Ix0xlVfp8Hy7HbLLqN3dyofi6fO6cprjMCZiLptVjsMGX
	 +VgY6mjiDjH7d6114alXEYef0oLOrhFr+QovohSdAhU6dxX+gLPAwn5mIK2kPLGRCw6Ui
	 8v5R5h+XlmJiwegwKZt9VZifNSF+ezMIIDK84oWNURoJa9jn81cqV4Y5/n7N7nov76A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kuOKXOl2seY2nuHPa7QaSgImf7rgxxNJypl2yP4/rNE=;
	b=iUwFJ0vqWl0ZubxCiTiyDYI8Mhpjoh8mmVyPsSb6KJjxLSsoNw4ISSxLmbsOAmk3fgck
	 4CsrhYhAnL3vgyZqP/k3UTkd3V1Ph1MyeFcfXGgy9OV7oZKCVtYNzMtfH8LvgBl02zbVa
	 btRQ33+dXgDNoWkMc1Y1wr8oHaOyoMK1qK/kFtiwJClDp1DUFmW/9p2D361vCt05j+lHG
	 l6fJ6jd5GsGwcrF5ZT6DgDHFVunRbMU0nzJA1+Muw+V24CDvWjMvXVZCwVf+SmdkgZ25f
	 /GsNm2mUmobYSeT4C2ajQ/lcnOTo6XUtGeG7JX3T6WIoUJQG0SW9mQ3X05kmzaBbKcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Opn3veuc;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E54606B430
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3E54606B430
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Opn3veuc
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91f332a4b2eso5815306d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640236; x=1795245036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kuOKXOl2seY2nuHPa7QaSgImf7rgxxNJypl2yP4/rNE=;
        b=Opn3veucfh+kvFbgkISgvrdMmm4kXolOTYIhF2eOTnH56Rn5HOg3DGGyMg+ODe2KB3
         gAbyeR9HzcrGQCnXkJhNVWTgwfiZVgpQquhoVNX+hlWNSOA6Z1AxynhVLc/maVGmIKuK
         ea/2i2HweXc21QWRZuO8VfNQ50RP4FY9rxVLJEbgrTxhTgbBaza739VjWVjl6qmp2nUo
         xPpKEUiuYVLAM8+NDw+jw3aspKFwg85QWNKIc+PWbuiBjlXZi38CNSmcWiX3XBCFyvL5
         Q+4qvVRtjY0da2Z5NP+394RLisaNoNuHTGXJ/uPM1VUxkv5or28L+GKJtr1WsUWwElGT
         LqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640236; x=1795245036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kuOKXOl2seY2nuHPa7QaSgImf7rgxxNJypl2yP4/rNE=;
        b=ynnsrPOsfzUS0Z5PXmZ73FbicNIYuyR2gqsj4FT3q8HRknQuse7Zvvq8Jy6DXtMxbH
         BvH7AEY/WvQ/LLGS4oDYbVgut139RKu8ffKIheK9K4pyjyDcdwMIYdxi0KDxxqfo8rmx
         O+ejD3np1SV3TvPbLpEMcihSFv6uB14U6GoCXurEN9wMLfu/feB2zkenAJePgIdj+aQz
         vSehEvoRf5QLwafSwnwiHQznvafwfz4nPZbDFSyWDCaQf7VeW2do72bQZ0cvqb4V/HOU
         qQFQksju0UGU17SXSN/ioNKWXccq6UaDt9xc5mvEJEVBxtgd/Xo4u+ZOpyk0y9T7rQl4
         o4zQ==
X-Gm-Message-State: APuU4Z/YFY4vNlFW9WHyebKz8VN4YG9OEbtf0jTNybYlRRHo96l8Y83t
	QVmFVa+hSHHzpO/XuP2eGOy2ZHNGLet7znC+kIVOV2Ad1ttmlHJ6wzziPupvf50mB4k=
X-Gm-Gg: AYBFou25wuYRPxPN062QTYK7KTqrwXPgG3Tjz1Ac3GL7Qd42s5vPw7JlSqj6pi5iblg
	LPt8aIYLiMXDJFyXWtBBrOxthEZM5Azyi7uklNuz1VNpHOfFlm2k9QgfXcv0eporXaqN5w3wJEU
	eSRyNCxy0wfyDZTov/PykI2MQ41gIpJm/RjiAQJ3fyeFsUEn7seN4TID1iCWHZFqFAnQCQL1K0V
	aFv8GyO+zOcQi3PZHBLPi5xDPkbMjt1Cn9K3VngjiojF/y+MZgZ6XQKs0ilmOk0W+lZk5dGhg/A
	clOEYmERRekP5gd+Qy7cHu3MhzOSVICQl1LaERKFPah1fZRlNGnRQZlamaUC4cHCwEtr84TWjRI
	VyYM8klDv7IVXFVC3j5csXKe13NNZtIGntugzNjTuQDWz5iZdi88gzO8ys40DWhYBRfiiEc/u8w
	983wnmdykpPZZWhy3BDhRiDwg+Y6KQG6wWwia6+AG8doUcg7tbhlY9QDL5utWl8fIAZ/tdYCip0
	XGSdxw1/pcExTLi+hQK9ltVrAZX7nxjukD2U98gLsPbpCESVzL7X/kZjWVhfKsEe7WcDm6UfB+y
	8G6xbBE3oIzwr53cFmmv4ttd8UNHsK3SovPVjj/76UW51KG7I4jkmmjaUEpMl2ZyBbIas54L4dP
	SZ3SBVZvOHuqysPc=
X-Received: by 2002:a05:6214:3b85:b0:91c:15ce:66ce with SMTP id 6a1803df08f44-91f24194ac5mr80511276d6.11.1794640236685;
        Fri, 13 Nov 2026 23:10:36 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:36 -0800 (PST)
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
Subject: [PATCH 15/22] mm/oom_kill: compare OOM constraints against common memory
Date: Sat, 14 Nov 2026 02:09:52 -0500
Message-ID: <20261114070959.3490008-16-gourry@gourry.net>
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

Ordinary allocations reach only common-memory zonelists. Compare policy
and cpuset constraints against N_MEMORY_COMMON, so nodes outside it
neither make an otherwise global policy appear constrained nor inflate
the constrained capacity.

All memory is common at this point, so behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/oom_kill.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/mm/oom_kill.c b/mm/oom_kill.c
index 5d48bd862c27b..1ec22bdad1fd4 100644
--- a/mm/oom_kill.c
+++ b/mm/oom_kill.c
@@ -274,9 +274,9 @@ static enum oom_constraint constrained_alloc(struct oom_control *oc)
 	 * get_page_from_freelist().
 	 */
 	if (oc->nodemask &&
-	    !nodes_subset(node_states[N_MEMORY], *oc->nodemask)) {
+	    !nodes_subset(node_states[N_MEMORY_COMMON], *oc->nodemask)) {
 		oc->totalpages = total_swap_pages;
-		for_each_node_mask(nid, *oc->nodemask)
+		for_each_node_mask_state(nid, *oc->nodemask, N_MEMORY_COMMON)
 			oc->totalpages += node_present_pages(nid);
 		return CONSTRAINT_MEMORY_POLICY;
 	}
@@ -289,7 +289,8 @@ static enum oom_constraint constrained_alloc(struct oom_control *oc)
 
 	if (cpuset_limited) {
 		oc->totalpages = total_swap_pages;
-		for_each_node_mask(nid, cpuset_current_mems_allowed)
+		for_each_node_mask_state(nid, cpuset_current_mems_allowed,
+					 N_MEMORY_COMMON)
 			oc->totalpages += node_present_pages(nid);
 		return CONSTRAINT_CPUSET;
 	}
-- 
2.53.1-Meta

