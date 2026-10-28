Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793222380;
	b=qK5AaddFcNfJQWPovxPCXKkCpeE3AlVHC5GoYeaJ4WawjSfF1/urdLdzrpPxPdWxyH4o
	 uYFR/ndMyAenRvLJfXsDV6RnDGQdEoAVEZjLPDjkMLlIAfQmfcK5UPEjmKrsNkmJtvI3r
	 KrTAbQefxRlk/vWldx+TqFv+eBLWFNymsSDrBpPeoP5S/G4GZ++Vh4xF8hKgODUO8/CCy
	 o03D7wEmmNc0N61HxC9dxK1Fj6noHEj2ZAPw6SyhDfFRTjP7tMLuWWZoLZLIUBSAZVFtI
	 P6irTqRM165eBU8aUp62tBa4eRdI4lWHxkIhgz+XSeP2fI0d9uAZj1erOCWojFKMaoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793222380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=woeAztA9ioPxkj5kTODOYAAuCzoQVvGCjxTGUXdVMNE=;
	b=MbZR3UlNHFBlBefELC+AFEW3Qj4BMLx2hE90ILgObSaqGDRY1q7b2CAQ9De0tk8sjL3Y
	 4/o47S/K4QNGHdHL2E2a6XiC8WQwe7qSm5uI+Wwhy03ersIHITsR8qhVb2E35pyGVLIuy
	 nA0V0hwkFfF/1GXMX84RvxmTC0pa6iyO0v55hcaIjhbcMYFIj5JjF9irLv4gFLzONITvt
	 MjUAbEFliL/kPV82BZjHP9IBXMMIxa8DqxL0+yW68+cqCwXimbROQc3RVUoMGH1VxykLb
	 1BeqJP916EbYQIVECcFeHS5Cgk+a0x4DdBxw4/M3cw4d2zDdx2HWWldrevasGHqgB8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=miZVMHoT;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7098606A331
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7098606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=miZVMHoT
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91c7b00a75fso16471436d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793222379; x=1793827179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=woeAztA9ioPxkj5kTODOYAAuCzoQVvGCjxTGUXdVMNE=;
        b=miZVMHoTwh4kj5fkiBd0hF0gK7UL5cNKpnWcb8G2K2IKG0Czjpj7c6+PNIRW4bXEH+
         3405nazlipTweXHSRLoleeiXgf/SQhyA9RycHVfblUcAv81Y+AFBQ6nFI3QiP3fnpDlL
         wZC506klRTbePLDZ7gtusLwkT31N/kymze5E2lcCPtsIf+dDcypiIqNOUgwupUG78AOa
         8RsG26eN53nvj3byhhxqyxYdUx+oAEHm74FNMA+wHBWhJyvnIkt9B70ObzM3+pgXPmV1
         5RhBo/c1Y0KvDCvqiXuyRE7GxaItHIXeQ696vMr6/zqsW/UQy4WKhmKQ8VAafySdNu9O
         R52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793222379; x=1793827179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=woeAztA9ioPxkj5kTODOYAAuCzoQVvGCjxTGUXdVMNE=;
        b=QKNYytV2G7R+cjGABYweiGkpKxI2wcEv9+APwSA1MNGAVHClvE2AarXXak+uKPfi3D
         GQYqHmNL4Dx4Djqf5SJVA3TOGlFWt0o0zuxH1npOom7oDoCfoSnOpDciT0aq8Jiiavpo
         /eXol+v8eNhQTIR7M2AGDQsi5q76o2Ij1fFqISamZwtw+MHcGePOV1w+b1OnB+sWZse4
         zlRz9AL2GgzOnEYdkNML7V5+VAP5u9m6AX6rRYN+t9YjUWhVMzjbSW9XsF38LfwbghIK
         dNmY6TBS5KeRa6qIm1Au0duzeUekRdlASTup3uZUxRl4RpEr1Uvv0OD6I7lBcr+RZZmd
         W9Hw==
X-Gm-Message-State: AFq9FYLIHjVjk/fXR8Zzrajnvh4ujEb4LsAdMvjJqS58n0A8l89OXUf7
	ONd5iVDq8iYZNlnTyzoKGuQ2xL6aq+/Ntckh4HoY7n/t7QZlP2OcXIfyUWGYxf3JaDtpVwwKuub
	eyjoxD0o=
X-Gm-Gg: AYBFou0C/ZNwofQzc+ssGhfBK3zpk/hlRWQXC6YatfF3tsjdyXro6lP6kR2FNa0T16L
	NdhR7T9W9c3oKXNIQPn8i2aWoeIx5Sr9sDFwHu58iNoQsogpWk8vdMK54d57U3OP8m8Xq6bOubR
	1evwKKiRW/7qM80XKrvPPki5IsmpLj/9QmjOlTvFaCelfk7Z3OT1M9luR+ZMk/iC8PwX6S/Es1Y
	D+rJXLbP15y4vpooTvznEw0ffmm2mTKfxIf0dIZCCFQQz83vJxwtaSU/4vALvwb6t/+DW+Cmpr7
	uGDNnja9TaHvk80xuNG5rqF3QlyBKfdr9jDvFANoKpyYpMp33hyid9CNdWV4LTk2UmO/j3Wzpiq
	4LGJ3WHkdeOQi521t7zi+d/Yxy7ajU9vBsVK5xpV2OuJWcKLRstSuR7k0m28pzs5gwEjpqevM5A
	EHU2i+bpCakFWY0vOaocNBSE2i11luZ/thlN5WjX1zHkySaF2Nvo2rRBpLuJRcj1rjbHuGb/nbN
	1nO4AGVaWFNAdqszfmDTcJBNeTACXv6JMghxpBOWWRzgvLv/Azn78MVHqKMOSEnfpwvI9QQVqzX
	A/Yc7JKxIE7iAYgMk2BDKYOwQBBSXjMV/sfIq6y7VLofAEfETII9NS+2GQGWPzoNISsofiOSS1G
	wcdd7wXMVYmFPQno=
X-Received: by 2002:a05:6214:501e:b0:919:5a24:d77c with SMTP id 6a1803df08f44-91c7cf99ea6mr58383016d6.31.1793222378818;
        Wed, 28 Oct 2026 14:19:38 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47a6d598sm139778966d6.3.2026.10.28.14.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:19:38 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	muchun.song@linux.dev,
	osalvador@suse.de,
	david@kernel.org,
	akpm@linux-foundation.org,
	gourry@gourry.net,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	mgorman@techsingularity.net,
	anshuman.khandual@arm.com,
	stable@vger.kernel.org
Subject: [PATCH v4 4/8] mm/mmzone: read each zoneref slot once when filtering by nodemask
Date: Wed, 28 Oct 2026 17:19:26 -0400
Message-ID: <20261028211930.3504634-5-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028211930.3504634-1-gourry@gourry.net>
References: <20261028211930.3504634-1-gourry@gourry.net>
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

__next_zones_zonelist() tests a slot's zone for NULL, then reads the
slot again to look up the zone's node. Offlining a zone's last block
rebuilds the zonelists in place, so the second read can return the
terminator:

  CPU 0                             CPU 1
  __next_zones_zonelist(nodemask)
    zonelist_zone(slot 1) = NORMAL
                                    offline_pages()
                                      build_all_zonelists()
                                        [MOVABLE, NORMAL, NULL]
                                        -> [NORMAL, NULL]
    zref_in_nodemask(slot 1)
      zone_to_nid(NULL)

Current GCC and clang merge the two reads, but nothing requires it.
With mm/mmzone.o built with -fno-inline -fno-ipa-sra, holding a
nodemask allocation between the reads while the node's last movable
block goes offline oopses every time:

  BUG: kernel NULL pointer dereference, address: 0000000000000060
  RIP: 0010:zone_to_nid+0x0/0x10
  Call Trace:
   zref_in_nodemask+0x9/0x20
   __next_zones_zonelist+0x23/0x70
   prepare_alloc_pages.constprop.0+0x16c/0x190
   __alloc_frozen_pages_noprof+0xaf/0x330

Read the slot once and test that zone. A NULL zone still ends the walk.

Fixes: 11cd8638c37f ("mm, page_alloc: remove stop_machine from build_all_zonelists")
Cc: stable@vger.kernel.org
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/mmzone.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/mm/mmzone.c b/mm/mmzone.c
index 9cc9ef588580..009f1dd75dde 100644
--- a/mm/mmzone.c
+++ b/mm/mmzone.c
@@ -43,13 +43,14 @@ struct zone *next_zone(struct zone *zone)
 	return zone;
 }
 
-static inline int zref_in_nodemask(struct zoneref *zref,
-				   const nodemask_t *nodes)
+/* A NULL zone terminates the zonelist, so it ends the search. */
+static inline bool zone_in_nodemask(const struct zone *zone,
+				    const nodemask_t *nodes)
 {
 #ifdef CONFIG_NUMA
-	return node_isset(zonelist_node_idx(zref), *nodes);
+	return !zone || node_isset(zone_to_nid(zone), *nodes);
 #else
-	return 1;
+	return true;
 #endif /* CONFIG_NUMA */
 }
 
@@ -67,7 +68,7 @@ struct zoneref *__next_zones_zonelist(struct zoneref *z,
 			z++;
 	else
 		while (zonelist_zone_idx(z) > highest_zoneidx ||
-				(zonelist_zone(z) && !zref_in_nodemask(z, nodes)))
+		       !zone_in_nodemask(READ_ONCE(z->zone), nodes))
 			z++;
 
 	return z;
-- 
2.56.0

