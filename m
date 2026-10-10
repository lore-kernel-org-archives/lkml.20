Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884D73672A5
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791619160; cv=none; b=XLtexQKw3ZjFikN3yaj8Rque/sQqIFkz50dkYxLIQmpU3TGQDQ5Wp6fWc58WpnCv8sth4zz2nleMr1SoVqYi/l3FWfKA9IXRr28zWdzpl1PFjVZjScAb8upZaxMHOQeivYBR8b7CzE+qH2Wh9vzIxp3LjN0jEInd6BfaD5IcidM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791619160; c=relaxed/simple;
	bh=9u7mhNEFHCE05NqmAOMdQcChY+v4ULSQ7Jb6PRyvZkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HwTgWMrfI5MiadtmFhFsDoCGBCvQVAmDKMce0YVzdlSlb6zZVBDB6ePymbBnqGeVoxbiCuxdiLYY89GaTwQIE1Y3ph0DyVEwaxv/PMx/w6zhIg8yxIQId+GI88RyQZMnqyHk7U9X+yO3aaUz+j/yLSTe9m8glNvRm1EVuPey4M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=PxLM302R; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="PxLM302R"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ab3260b35dso228516a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 00:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791619159; x=1792223959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R9enHGmaDPvvJJBwJoSb9UIn3R22GPADXFoJJNtoblo=;
        b=PxLM302RYKnUdZRbV9InLIF5i2AoaHIA9QkDXGktz/wmXJeZzN6jsW/h2tByc08wZx
         uxv25ipMiX1kvp5LgjdQAhlzuR3eiPSn2cf7B/vsJq2+1oeUySU9Kw/nLov4zEKkKAjD
         3b6OOBkZFEWs6FwOiCoUdgVN5NJh2L5a1D+p75rrPbG9fEubgGqlUu3b+CgYMmEkBkfL
         TdwOz9rnKTNWba/2KLy31nr4AINugsL0LMW8rxG+vpfC+f4eJ4gAROy6xpMUlCh8CY+H
         hbWqmm6kn8C/wH2TUbbvAsglwvdOCJoA/V8qX4TFAJZAcQNH8RCE6R3EiEwwrjzOfQoP
         Y+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791619159; x=1792223959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R9enHGmaDPvvJJBwJoSb9UIn3R22GPADXFoJJNtoblo=;
        b=k+xZQ18XaJeVXJ9wl4Jr6jM4z1K34XHNLxddXvuDHQO0K9BfqEQdPhURDxPnccFo2m
         3W4kbEgNJ/fgaecbvr7hmXD0Ht1YGq8ykc4lGeRORaRKIFKoySZSxRpIIYrZoHwp6ahE
         GWXJ55tk7ochJiqTb7G+TpBJZAUT3cq/BJs5imvVpgwi/qxPs+iJ4Dmt3nUC7f3b83Tb
         i8a14pEreKvcbZ+2CgewSAUgirurooby7x8y7utpkNYQK7MjGx93XkXkdvv+jSOQzO3H
         9oW0arR/3vvSsRlH553cD92CI97R6MLlUDMugqMCQofFBNs5e9/mRFA0OzVXtMRv6JRs
         3BIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlg30brATwWUm9+fnMhhjAjqFT3mNMTDwb/6u9NlauPafvk9sOWny34U+6gCXhOBb1/xDU1LALfjwHGY0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCe4AwF67wO1dyTPp3frLeC6J6fQas23XUb4s5bK2RZ93XWH/Q
	fJwbBxfAl8n8U4iYR2/k7orTN5Or6A7/N91VTymYs4GvCmUD6jUZcNGERyYNjIX5lg4=
X-Gm-Gg: AYBFou1jue4sM/LzM0Zsw54wV6zQOqOcBFTQDt7YiRzcbRPmT30WOpRZkid8Yd78acT
	dUD0Z5ep4es4B4f18px9Mh5ZDJKZ/Ja43J/R4df/N0FmPoUtkd4xgDzF0sJxV3Q85wcjkjsjeUl
	CeUx4We8IT+0v/JuIEzjHbljPveNPDkKjOVJJa1ONwgQXafh4mpsmPLpuEN04OqFNo6pjY+Oyau
	/kdoYaa2v04kfnVF1cgUbBw8rez9Ll5rc8X/rTplNZmrr1yJ6k6JWAreoUk4Tb3SdrDINj1QTTI
	yvFlCMGXKhkiwcQL8bYRsZYijN/AMHbbxRMR+FMqcNz5R4VveP/8XqpssHF/XlAvxCDL0IIPNRx
	41Rw1g4B4TpISbnzooNFBa++62LYn3CszEaRPkcFjs8G7M61a5srmQnf+RNfd06lCaahZmvGFVS
	6RNOmhfdMKkvOj3EY0TZ/Lv3AamkQgxYVOB8+lkSjoOFqtbFNXZ4cphQXmUqlCUY/tf3SGIu84X
	J656Ffvt60YVpvT1IwuXIfa9yHLjR6SYBFPbw==
X-Received: by 2002:a17:90b:224c:b0:3a8:5d33:c615 with SMTP id 98e67ed59e1d1-3ab3a8d0ea3mr3496429a91.39.1791619158743;
        Sat, 10 Oct 2026 00:59:18 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([139.177.225.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab57c05724sm3473569a91.4.2026.10.10.00.59.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 00:59:18 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH v4 6/6] mm/mm_init: add zone mismatch warning during page init
Date: Sat, 10 Oct 2026 15:57:55 +0800
Message-ID: <20261010075755.83339-7-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261010075755.83339-1-songmuchun@bytedance.com>
References: <20261010075755.83339-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For vmemmap-optimized sections, tail struct pages may be backed by
shared vmemmap pages. Those shared pages must carry the same page zone
ID as the struct pages initialized for the section.

Warn in __init_single_page() if the shared tail page has a different
page_zone_id(), which would indicate inconsistent initialization.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v4:
- Factor the zone check into a local helper (suggested by Mike Rapoport)
- Collect Reviewed-by from Lance Yang

v3:
- Collect Acked-by from Qi Zheng

v2:
- New patch.
---
 mm/mm_init.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 1650d6bc1211..6deae33db882 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -593,6 +593,15 @@ static void __init find_zone_movable_pfns_for_nodes(void)
 	node_states[N_MEMORY] = saved_node_state;
 }
 
+static inline void vmemmap_optimization_verify_zone(struct page *page)
+{
+	const unsigned int order = pfn_to_section_compound_order(page_to_pfn(page));
+
+	VM_WARN_ON_ONCE(vmemmap_optimizable_order(order) &&
+			page_zone_id(page + VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES) !=
+			page_zone_id(page));
+}
+
 void __meminit __init_single_page(struct page *page, unsigned long pfn,
 				unsigned long zone, int nid)
 {
@@ -609,6 +618,7 @@ void __meminit __init_single_page(struct page *page, unsigned long pfn,
 	if (!is_highmem_idx(zone))
 		set_page_address(page, __va(pfn << PAGE_SHIFT));
 #endif
+	vmemmap_optimization_verify_zone(page);
 }
 
 #ifdef CONFIG_NUMA
-- 
2.54.0

