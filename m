Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD0544C667
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400928; cv=none; b=nBfyUWSvlueWhoc99omwY7zQSyO+eRj0XX/FRkZYW4VWfmjLY/PlgmT3nv9JlLtDY0/EkcevHitxw92tJwBIu+wY3c172cmEftUYp0rbWHU3kvdfbhnKTkHgj5K8vYOX2MzoLiclm0/LEOloY5jH9YoNCI99n5S9SwCJA8FUYRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400928; c=relaxed/simple;
	bh=41wT4h32lvO/7+w+W+VuZiLHLaB5gMjzc8OiYsaMqFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dNWWieZNuEJ0qaaK6bDA/WbuMAL3eXGd9uDOWYMcAwOwKrs7y8REi4+qPtWdst6IZ+aXULTuDvRftFwsHTYUZ52NZJZEgbLC2OzSQPAUzoJHKNwV79z7HBXUehBet5MrDhZLn4EcZfGpV/DHhU8FHIsuevJVWMTSQM0N2fZW1hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=a/KVuTj2; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="a/KVuTj2"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e60f9af6e6so14435745ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792400926; x=1793005726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wKvHy7y34UnvBEvhC3G16rSuhlzefUt6PxJ3Dpiy+6U=;
        b=a/KVuTj21zWVvW68ElcWMhfkL7WISBaPAlkTFS15GH1nADS2m7zKzQuh70jj0bzdCa
         MFFri8cL6QZ6Pqwc7NPzbA5LjbbzxumR3+q820Pe331XhdxUgzsDtl6wizEx0LO6JbO5
         uUzrhiO0XrU4AddBWJ0VoOBmj6V3v3m/6cXOTmSdoGR5f4b9+wxWtkw+vYCD8dkn250f
         vUeTP0haWEbmYNoPZqHc+xoTSK+P59mVvqFLyW15YjaiZWBRJZOY1LQC1kLK3q7M8vgI
         DbB9QuTEtF2b7B/geHqyxGJFOW+PMTxHEjBNVxcOQcrNVXENdgMAhCOQCOuZNyfK84U0
         nmUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400926; x=1793005726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wKvHy7y34UnvBEvhC3G16rSuhlzefUt6PxJ3Dpiy+6U=;
        b=cUGein63QjT+qEO4vYGdUigWlWsas5dddLU8wnYX/XWlGcQdxN8f6H4TcADmjzZCQe
         RZX5efzARqloc5euGFGseGK7vVI5jjSCE5QYMipSMC94RS0J5H9ibR0798y+caIO4JsY
         rs/EsbFqbREM5orIBWMSWwC4zzJp6fz5vrvi2JEWymUV0Rk2oQn/4iS1emWj8RNdxFzF
         wna3+bx8Ksyd5WjQzhv176fMXp48vg2oQEPFNWNlFVags7sN9tIq52wtMZXjJLzirIVz
         s1V4GjlpotPtjhwm5kbrUAanFawkTrBXUdQ6gObXeufYMQN8IhjXc1JHEtlp+rHg7f7B
         Vdag==
X-Forwarded-Encrypted: i=1; AKwUvBzjqSYDHpqSBorGI3jYvdNenYv4plYEuBFwjR30F9sR/Q7TjPx5P0ZgVH54zTlpeDX/O+LA2w3qyoMF6UA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDKcZja+FVry23x/O1B6rdtoOhD+lIl0Ey6UDzdygqLIcPuq6A
	Fe2HqKUYg1jGvBX16L1IRfNZnFOaVdvzwd0+/7aG4dljprLT+gcTRFvRYjVPa1YuCXc=
X-Gm-Gg: AYBFou2Gyz229L1tKjzPGtcW9y2kF6iQV6k1NzvjhSP5gPr/Vw3Sj4NpDprOpCuaieA
	7DBqRtYBPtLJXcJ5HE9ktKs9tePDaUultidGkhS9/ktzL3BsLugH7VAOShj173A+J2QUlSFFxQO
	BBO9iFx/t98pWasyefilmZueEw1vFrgt9dedYEqJG/7V4ktIe7DR4ufC4IGK0J1LRkluVMedMmT
	nyM2Y3NLhNaBJlNVNcJjfs7cQ4+JfUYmFZQ4Whqkq0q2vOpWl28aOX0RGbuvba6ORt/mIok2Nbn
	luM3KUPeGo+TUoSNnCkrZAk79TjDT4S4qcsbVSMlXL2s58SlqnF7+QfoPNvOLt4GsAPsfAY7fGf
	TBB0kwcZVXqtuj2t2Du+aX3zXVDOZ4odfLao9BnAQfwdiywEpNSJKIRQkDDTOuaGSkjvkTPmBLb
	EdMOrLQtbDW0GMu3Ev41LUHpXqs6yuVX2BiNQ87qGcbyj9jXCsujnBdDqUO7K/lbnPhrABpVZY7
	4Z13bK/bPaLPNdys30=
X-Received: by 2002:a17:903:2c47:b0:2d9:383a:30f1 with SMTP id d9443c01a7336-2e9a6842eb5mr63237055ad.4.1792400926399;
        Mon, 19 Oct 2026 02:08:46 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e305f1dsm36707595ad.0.2026.10.19.02.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:08:45 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Muchun Song <muchun.song@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 1/4] mm/sparse-vmemmap: map shared vmemmap tail pages as read-only
Date: Mon, 19 Oct 2026 17:08:27 +0800
Message-ID: <20261019090830.1917657-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261019090830.1917657-1-songmuchun@bytedance.com>
References: <20261019090830.1917657-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both early HugeTLB HVO and device DAX use the common vmemmap population
path for shared tail mappings. Map these pages read-only so that illegal
writes fault instead of corrupting metadata shared by multiple tail
pages.

For early HugeTLB, this moves existing write protection into initial
population without changing the final mapping. Device DAX gains the same
protection.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 Documentation/mm/vmemmap_dedup.rst | 3 +--
 mm/sparse-vmemmap.c                | 3 +++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/mm/vmemmap_dedup.rst b/Documentation/mm/vmemmap_dedup.rst
index 8c287ae3f86c..76f903975a40 100644
--- a/Documentation/mm/vmemmap_dedup.rst
+++ b/Documentation/mm/vmemmap_dedup.rst
@@ -193,5 +193,4 @@ There's no remapping of vmemmap given that device-dax memory is not part of
 System RAM ranges initialized at boot. Thus the tail page deduplication
 happens at a later stage when we populate the sections.
 
-Deduplicated tail pages are not mapped read-only. The mapping layout is the same
-as HugeTLB.
+The mapping layout is the same as HugeTLB.
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 40eba70c0048..ba0496daf4de 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -295,6 +295,9 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 			return NULL;
 
 		entry = pfn_pte(PHYS_PFN(__pa(p)), PAGE_KERNEL);
+		/* Map the shared tail page as read-only to catch illegal writes. */
+		if (vmemmap_optimizable_pfn(pfn))
+			entry = pte_wrprotect(entry);
 		set_pte_at(&init_mm, addr, pte, entry);
 	} else if (WARN_ON_ONCE(vmemmap_optimizable_pfn(pfn)))
 		return NULL;
-- 
2.54.0

