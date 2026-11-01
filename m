Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793499247;
	b=ixs7n2WwrfPOslGADOhTxl3YGZHRkt/tn80bbdRKUxfF4zOBWrEqdrZx7flxUZeLV6OY
	 7Ks8GhFQzRLrPDGwQQXwEtn7bdaBTmgHFWpXkWxZhKGf0Kn2m3CR5xXZ9Ypf61TDKdQEB
	 5+AkD1BGZzilgujuqSeuMbD8BqTWfPA09EbVZDlvCiy9a58objJcHcg1Yd64fU0rljWDN
	 sFTJ8BIyeC9nkGcpOSLy4t34BBBY8DC0/HpvEn8GmRPcY9+LqUNtgqjjAMhfJI2ezfrxl
	 ZjabhQZFnhAtZ/boTK1OGXOzdOTDUP+rsVMsK4oem/fEMj+ZKe9dhMRL3Wr7Likqzdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793499247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8AqB+6Y6YIFn0HjqudvdVztXfdpwTD/bMBAeQqpR7bQ=;
	b=N4ExQSBYZWe+ndkNIh5OxCF0rQ+tcD/w4Zznf9rfKAaBwu8Kd4tE0dcIbQkvpQXQX0s5
	 Zyr4Qqz/oGI16SmjIT1fui0CqzYSN8ykbDBTgiJDc+ptWYSvJRgEjj1zfNt8OrCg9Sy+8
	 LprsOF5gzqK+ih4YvwbHOLuPUcdTCNUBTNfARVKyOkL6A3j/MqD8cfU36EDvQePEr4vlS
	 S0b1jcNAxWegErM447bxPVgTGhYxpSDcM6TkV22c6NvQ6cG8R9REq9D2ABLLuuyFTMKIt
	 DqCAImV1jTjUvxMO26/9a6jTrlLdi1Esdql4O8XiEoMDKYkGaSSrrJ2CpglGB8ivd9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=e1uprEda;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE28C606A336
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 02:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE28C606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=e1uprEda
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93e7ad9f78dso243515485a.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 19:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793499246; x=1794104046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8AqB+6Y6YIFn0HjqudvdVztXfdpwTD/bMBAeQqpR7bQ=;
        b=e1uprEdaqqiQA9+e2NMUujr/+0J/tLKyuPof7IdUsWRkmSUrnjpcANC78AA/1V59Ni
         Sk+lzR4jYGuSBcTOyp///c6mHM0r737liT5T6jIE5Gg/mSVWq8cez3etq7eYAFVDQIyM
         Jfa2Z7IPtMI4qLCJQpoZ6Kj1ViXx7vt8lDFXnChzFtPM3ZQyL1CeryEwDWgGqH3Junne
         +CrWCxItVxvGKFcydmyv6CtmrQO2XDjUn+EcdNDDSbNlatjzGbPiVM0W6La8oVbcWHiK
         7lfmxkLO6Ek8ZdKkTsn8iz5BSxeMXIlFilw2J5I8a9CSAIkc4D2ujRIS79EsZpgxx//a
         8WbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793499246; x=1794104046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8AqB+6Y6YIFn0HjqudvdVztXfdpwTD/bMBAeQqpR7bQ=;
        b=yAm+iOaovuHV3JXFhhrRfs2uoBE2NiLHFwGej0heFj7ezJLIJMvbwMQs5MpEN/ItTh
         EAcWzDHep0Zftl/MZbqR1iVo/X5077NjuDLIx4A/Qv7Um/JP8f/vD1dhksqMTdF4EqFp
         l09yLLtqHkqrsUFecD4rcNAgUpv6U63P6tLh2XqvEkuA4hBYhUqxcg23cKwSw/HP2ddm
         Wlxyb4UcNihNf77gtkMSVmKSO1WMy9KvPZx+N2qt83jdtRzPjY7QXiWwnrRwcUUJOD+u
         e6gKatUli7buvxhu49g4yDqRy4QXJ17Fz0t632tIbKDr+FhYj7s+ynNUtXNG6zEKMCqm
         lLMw==
X-Forwarded-Encrypted: i=1; AKwUvBz16kqZnmBR7akl93ddiLiNvQ+Sn73zyVJpUzcRYIhiEnVfYtISdE24p4KnH/Qe81A3UNBRI7tkk5s3Rlc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVGZ0NIYVr9uARWkZRmjuyTKFSIKQ8Ti+8N8lBsJO13ES7fyGb
	pNbAiWMMq46pyWKbZ+wpzpntTdaG/1vM070f6qaxv5S1PYqaamPqbtM2/IWTsuJz5Vw=
X-Gm-Gg: AYBFou1bdhOPghwX1kb1StshBsucFR5J/B1vgOdxw1StCpttHBBfdgG2hfGVzg1YE24
	1q9d1YA9jO1hTA1EGEQgqbXi1MeHgDPTE2xpVuJDWEOMm7TOicny5kERY63lvcDbzj5At9s7w6U
	B3gNMG1iLToBsqdg2o4i6ZOtuleSIWmAGgS2zTeCufwqmVHFq7pzTyoCrkbdb2uIHqsLvHKSJtg
	6U9NwOibqdiBcoBHlosuR1g43MV2CWd9ad/akv2EAQfeEksIoUYOZMmMVg3QeIXSLBwmixVvcDj
	Oq42zhuS3vlrBIfNPme+rY4wwbJNi1KatGehxyiILnj0Gix3RvEc+GGtXJ8JM7AAHYWfLhiirSO
	1+gViODHGhirpxiZG1BTZhMpZUjMN2SO3Gabj7wDPe72mxGHp6XyDJmUZnA7nYrnuJOxkfL0p2Z
	qKA7Xu3Gla0urhhCHe9tuDJquBxEwb6l6/vCH15Mg72utoe8Iynw/p6/Wi2Ev1JoG+MzxR4CVfV
	+m09Yg8vd7DpeSRcozXtpArpzf46u6XobY2KSoRcpGvczA/2V6hPVOHjFOShgY0PPdXmcMr7InA
	Pqjfd/TJUsO1lewudeMRWZx3siEDnnKHM2cL96fAgy05szrqtNKRDHfkV4XJFjqc2fE91LbiSl9
	7rGswuSe1hg==
X-Received: by 2002:a05:620a:461e:b0:93f:707f:28d2 with SMTP id af79cd13be357-94421712d14mr1095889185a.26.1793499245855;
        Sat, 31 Oct 2026 19:14:05 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425858552sm498131985a.18.2026.10.31.19.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 19:14:05 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	rientjes@google.com,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	muchun.song@linux.dev,
	osalvador@suse.de,
	gourry@gourry.net,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	Bessel.Wang@huawei.com,
	jiang.liu@huawei.com,
	mgorman@techsingularity.net,
	anshuman.khandual@arm.com
Subject: [PATCH v5 12/12] mm/mmzone: remove zonelist_node_idx()
Date: Sat, 31 Oct 2026 22:13:40 -0400
Message-ID: <20261101021340.2251928-13-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101021340.2251928-1-gourry@gourry.net>
References: <20261101021340.2251928-1-gourry@gourry.net>
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

zonelist_node_idx() looks like it returns a field of the zoneref, as
zonelist_zone_idx() does, but it loads the zone from the slot again.

Memory hotplug rewrites zonelists in place, so a caller that has already
checked the slot can get a different zone, or the NULL terminator, from
that second load.

__next_zones_zonelist() and mempolicy_slab_node() had this bug.

Remove the helper and open-code it in its two remaining callers, neither
of which can race with a rebuild.  local_memory_node() runs either inside
__build_all_zonelists() or during CPU bring-up, which holds
cpu_hotplug_lock for write and so excludes mem_hotplug_begin().

The lookup in mpol_misplaced() is unreachable: it needs a policy with
MPOL_F_MOF but not MPOL_F_MORON, and nothing sets one without the other.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 include/linux/mmzone.h | 6 ------
 mm/mempolicy.c         | 2 +-
 mm/page_alloc.c        | 2 +-
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 4bc2318ac37f..72ffb2959c4f 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1439,7 +1439,6 @@ struct zoneref {
  *
  * zonelist_zone()	- Return the struct zone * for an entry in _zonerefs
  * zonelist_zone_idx()	- Return the index of the zone for an entry
- * zonelist_node_idx()	- Return the index of the node for an entry
  */
 struct zonelist {
 	struct zoneref _zonerefs[MAX_ZONES_PER_ZONELIST + 1];
@@ -1864,11 +1863,6 @@ static inline int zonelist_zone_idx(const struct zoneref *zoneref)
 	return zoneref->zone_idx;
 }
 
-static inline int zonelist_node_idx(const struct zoneref *zoneref)
-{
-	return zone_to_nid(zoneref->zone);
-}
-
 struct zoneref *__next_zones_zonelist(struct zoneref *z,
 					enum zone_type highest_zoneidx,
 					const nodemask_t *nodes);
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index cd63c3e2c029..267576054980 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -3087,7 +3087,7 @@ int mpol_misplaced(struct folio *folio, struct vm_fault *vmf,
 				node_zonelist(thisnid, GFP_HIGHUSER),
 				gfp_zone(GFP_HIGHUSER),
 				&pol->nodes);
-		polnid = zonelist_node_idx(z);
+		polnid = zone_to_nid(zonelist_zone(z));
 		break;
 
 	default:
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 91ad979409e5..81c1de714658 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5973,7 +5973,7 @@ int local_memory_node(int node)
 	z = first_zones_zonelist(node_zonelist(node, GFP_KERNEL),
 				   gfp_zone(GFP_KERNEL),
 				   NULL);
-	return zonelist_node_idx(z);
+	return zone_to_nid(zonelist_zone(z));
 }
 #endif
 
-- 
2.56.0

