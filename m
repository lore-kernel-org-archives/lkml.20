Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655571;
	b=xXCMkHJ5Zha8OLRXM9vsPExL7QlWPuJA2X5hZzC3bR2Jo4gqar//uPCxxAKWs2/aAVXn
	 MkORCpUa8ungWIz12+HBgeXjUxnxhSb2Z4gGRiZX5N3wRIMjJ2wGUe0jImpJaa0i8CyX0
	 269Zifx82qTgPxnI+e+u43UnWPIvZQoEFOMl0tUMct16Ly89SnTEZocLqyi7Btq/MW7iZ
	 hG/75/xQ1RelTKYi2XTUDYIE85QCP7JqjVKqmIxN3cV4UFzBqNXg0GHAKmYYa1HwYW3kW
	 gMQNDmEYtv3CBkDOsy0EWunBHTFHWyOKl5Yev3w/D03stdtRtXDmq7dEC1Yct5KUc4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yojspyjk6M/XCMUXwgemrJOhlA57VD8UrAkmCoHaT+M=;
	b=NM9irX1ZpVLT/JQMmP9cNyVvygUy+QmeSDn0G2EFmOFH36xtm7SPRJ9TQDIF1OVgguE6
	 CKFEgVKXApxiYEBKkTxw5Jb9uXwjAFiUdd8nJOJl3X0WvpOw5SwjUp0ZBf5CkpPOnZDbo
	 hf74qIFCsYqH2CjwcDuOMBK1MxFlELA1t52jH6wva7mbmKAsVvmB1LhWhLb0hp+XVGxxI
	 Yh8lPTkVCXAo8DlXHNqedKfJBrprhF3VF+3RrG1mO85lNMw+E0N1PvRHaTa5St5Y+Jxll
	 VMVD51RK9gH4hlVuqkRigkph5mpHNaAnnHA3KcojXujNX8uKX8bBurOvaSWMWLRBIBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Vmj9pFsE;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE614606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:26:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE614606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Vmj9pFsE
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15ea896ddc8so2624533c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794655570; x=1795260370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yojspyjk6M/XCMUXwgemrJOhlA57VD8UrAkmCoHaT+M=;
        b=Vmj9pFsEQ/S2z5X6V9lWXqXuC0Hz9CHAmf3gNjCbHT0noCdvcf+34B0kFdPCxPnjN9
         F1QWs3Xp9i70g62lofYJilwisuB8w3LugZQu3CBY1VK7qtFUOw7hAhbpV6W8hCyVWilG
         1sHEQTXC9ikByO5N20N0PUyCHRH3M/REfrjKLEinYEb3eqrWb5+6fZxUDv7DvuamY/Aj
         32oVaAQCyiXBmnpGXBk/soYbpVXJopgbwHfMUHdE8yHf/zLPfEJo/0B40hWX8l1Q6Yc8
         hKq6y5Vu5x20EGEdRMvx3PSLc6jwjX80D4Ji7/269OWBXX2lnfq4eNXKORMdfZoZ0TFx
         2NXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655570; x=1795260370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yojspyjk6M/XCMUXwgemrJOhlA57VD8UrAkmCoHaT+M=;
        b=F0SiN0zWofZcDXFWtYGeIZOlY7QoS5rLyb/UhJzCaWNU9MSikwpJhKidVuZq4MD2Xs
         uQJIN3Qyq3EaTRXeGsfKbqUVtCNNk98FmQL8k9REntA8xTYQF+TUryc6ZiRbnn1qnrwu
         QTUCmSJd2SXn9kVnsk2UQNQrkKTzG0PUQmAZNEZIthc5PuMTz/g3eElk7JmH7W3D1bRU
         wQtcMOLEUbW8KwjkWqREyTFBmIoFKJbs5gr+tSWABkhgpCxwPAuToEc/OeQHL9r1cLb2
         Sl3mVMd3dVM746/NKi0uzVoTQPCzarJIweil61iYA827+Ta64j2J1vvWl5q6Anrt9hHG
         6QPQ==
X-Forwarded-Encrypted: i=1; AL+hErFRbz+ygDTuYcXiK6QjWeOQFxRuJq7ttpMKSBjBIIECCDMtmtv4IYfVbtmi4e+96+K8oZYemPgyJq7v/gc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AnWw1tn2fi4kheEEq+x9NlJ4vJEMEn2krjqavTGyRWuiWZs1u
	ZlEfOi6dUIcSKUJ1ZlZ5M2TqeDxsiH+KPVmz5ePt0QlsQ8y89n7vSX0+Xn/zlYDM8oc=
X-Gm-Gg: AYBFou1xwvt8lkYGKwa6SIVNv6JXflo1BIFdf11+ccpJRvg8x4A3omC9FYzWRD9YYWN
	i69Lk3Wv7j9ecoZMhItPzWnwI7KeJRfwCgehCMf3+vlas5Yxi6Ndhcwql/eE1NP72i8EL3j3DtI
	zi2Q/V6WJR050mX1N8k7xgtAorJONekO1MS9hPvN0rHTtPN9hCcJo1VaZtluzkGqz2OnuSGiC3D
	+27xBniHKVCSEA/FYnUHSvjTtqN5iv3Fgv0Q7Wd+oem02Db+2Kt5HOUFhuegXiFfn/fpwTGDTYo
	nnyWw4zm9iLHJD5CcQ2/H6N8T34Gg6EcNMqnmIpvHaAX3uLNIooBzJqZXIYaqq4kYePQYyHjsss
	Yn/u5Fx5FugFL7gQln+Tgobi2ATti7lgdIArAOK9lHn3zgbVJyBSBhNOf0uXSm469W2rZnye8mZ
	/akan5UG5E18Uz4P9o/XdezMi9faiJe6fQ1wrlpp6TY2OwKevvmSG3xP0f5CJd80zUiCFXX+Hfk
	g8+gq3IErUDstbfb4hc/8x6bkqcztxaur/G3BngVqG5gbwZ4g677O+7Va0lPR2ZrQH3IRl50hp/
	gu/J8Ni+Iri1RkeZkbabGzd/SJRs/uXbeas6bKoH0ZBE/G3EiDIJFPtDL28kpVq15X+rnpgEjj1
	mjagAKw==
X-Received: by 2002:a05:7300:5609:b0:377:a1c8:a628 with SMTP id 5a478bee46e88-3796676addcmr4689862eec.6.1794655569869;
        Sat, 14 Nov 2026 03:26:09 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:9d36:3b30:f4a3:7b5f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm16190627eec.5.2026.11.14.03.26.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 03:26:09 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Miaohe Lin <linmiaohe@huawei.com>
Cc: Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>,
	Jiaqi Yan <jiaqiyan@google.com>,
	"Jose A . Perez de Azpillaga" <azpijr@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 2/3] mm/hugetlb_vmemmap: fix PMD split TLB flush race
Date: Sat, 14 Nov 2026 19:25:22 +0800
Message-ID: <20261114112523.75208-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261114112523.75208-1-songmuchun@bytedance.com>
References: <20261114112523.75208-1-songmuchun@bytedance.com>
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

Bulk HVO optimization converts vmemmap PMDs for a list of folios into
PTE tables before issuing a single global TLB flush. After publishing
a PTE table, a concurrent single-folio optimization can observe it and
remap its PTEs before the deferred flush:

CPU0                             CPU1
hugetlb_vmemmap_optimize_folios()
  hugetlb_vmemmap_pteify_folio()
    vmemmap_split_pmd()
      pmd_populate_kernel()
      /* TLB flush deferred */
                                 hugetlb_vmemmap_optimize_folio()
                                   vmemmap_pmd_entry()
                                   /* sees a PTE table */
                                   vmemmap_optimize_pte()
                                     set_pte_at()
  flush_tlb_all()

Modern MMUs permit overlapping TLB entries with different mapping
granularities only when they translate to the same physical address. In
this race, the stale PMD translation still points at the original vmemmap
backing range while the new PTE can point at a shared or replacement
vmemmap page for the same virtual address.

Serialize deferred PMD splitting against PTE remapping with the HVO
rwsem. Hold it for write across the split-only pteify batch and its TLB
flush, then downgrade it before remapping the folios' vmemmap pages.
This guarantees that no PTE remapper can observe a newly split PMD until
the stale PMD translations have been invalidated.

Fixes: f4b7e3efaddb ("hugetlb: batch PMD split for bulk vmemmap dedup")
Cc: stable@vger.kernel.org
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-fbdc3410-a4cf-457e-88e6-684380fbadfe
Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
v3:
- Collect Reviewed-by from Jose A. Perez de Azpillaga
---
 mm/hugetlb_vmemmap.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 79ca68dff635..6fba3184356c 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -311,6 +311,9 @@ static inline int vmemmap_restore_range(unsigned long start, unsigned long end,
  * is skipped, the caller must flush TLBs after all pteify operations are complete
  * before remapping the folio's vmemmap pages.
  *
+ * Note: The caller must hold vmemmap_remap_rwsem for write from the first
+ * pteify operation through the final TLB flush.
+ *
  * Return: %0 on success, negative error code otherwise.
  */
 static int vmemmap_pteify_folio(const struct folio *folio, unsigned long flags)
@@ -321,6 +324,8 @@ static int vmemmap_pteify_folio(const struct folio *folio, unsigned long flags)
 		.flags		= flags,
 	};
 
+	rwsem_assert_held_write(&vmemmap_remap_rwsem);
+
 	return vmemmap_remap_range(start, end, &walk);
 }
 
@@ -400,6 +405,7 @@ static int vmemmap_restore_folio(const struct folio *folio, unsigned long flags)
 	if (ret)
 		return ret;
 
+	guard(rwsem_read)(&vmemmap_remap_rwsem);
 	return vmemmap_restore_range(start, end, &vmemmap_pages, flags);
 }
 
@@ -568,6 +574,7 @@ void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_l
 	if (list_empty(folio_list))
 		return;
 
+	down_write(&vmemmap_remap_rwsem);
 	list_for_each_entry(folio, folio_list, lru) {
 		int ret;
 
@@ -592,12 +599,14 @@ void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_l
 			break;
 	}
 
-	if (!nr_to_optimize)
+	if (!nr_to_optimize) {
+		up_write(&vmemmap_remap_rwsem);
 		return;
+	}
 
 	flush_tlb_all();
+	downgrade_write(&vmemmap_remap_rwsem);
 
-	guard(rwsem_read)(&vmemmap_remap_rwsem);
 	list_for_each_entry(folio, folio_list, lru) {
 		int ret;
 
@@ -620,6 +629,7 @@ void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_l
 	}
 
 	flush_tlb_all();
+	up_read(&vmemmap_remap_rwsem);
 	free_vmemmap_page_list(&vmemmap_pages);
 }
 
-- 
2.54.0

