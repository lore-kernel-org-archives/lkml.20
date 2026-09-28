Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0BB30CD95
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790570520; cv=none; b=uzxph6A5RdjhyHOkhPnmSipYvNFTf+o9N9abFGYa7VVgf40pGaENiqNrdOGrRwrfBScQdz81MT0yWcBNlGbPgOGTvjs3aMT26ZBUG2O2cYaP6l/e5I/fxpBotMQ1VS41eIopjpg6cHWW1ah9OKMLORnr4md7oQ4JgO9kGS3NJzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790570520; c=relaxed/simple;
	bh=CV6k+K74Uf2jIsRLjJeq5WxSr8aykUQ/m3Q32deRhns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NMIM7AkYOiQ2YQvH6D0D5FjByDfoiMWZh4JB37tL98yV9o7uzg6Agqgx8F6KRAl4f3kRwdNynT3aERosK8Zkf64TAZglm8Tr6S14YuBr2Zv4igpgAvqmeriVpET2jQUTq2iPQoha1b+zWPs9O6fMsgqiF+GO0TRHgQyu36W35Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=iIywsmNj; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="iIywsmNj"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-882f2861859so183015b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790570518; x=1791175318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0OVW9hC5UCKC68y9iOXThuN5MokNCxQyIbNLFUKAbKE=;
        b=iIywsmNj9G7ax0dRB8kcO2x1m/vosw4+3Q15+rgslndxzr8+0KjKaDha0FKXbLm9XU
         f6SKNYB4dhIebx6N3LZLvWKDyZyMes4pwqcHDuFdyz9qZfneqOf9f6+zitRlMwgYZpub
         gWqqXzlJYrbCQgtwwpklLcJaYsRtI+U81R7zyQtdMzUBHflAv/Fd9E9gJkQ5Kdoomj10
         xpTrVIdNLS6KyJ+iljPjEdx6J/Q+QIGBsF0gQheDubmHxW1sW3/fnnKX8Ea4RnB/C3CW
         fRMNYCBZHCPyEimidel9GjBPEF6qrYF5nidKQ/5q3ktyX8Ri+LQQtnr5Y5j8qRXdM2yu
         JwBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790570518; x=1791175318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0OVW9hC5UCKC68y9iOXThuN5MokNCxQyIbNLFUKAbKE=;
        b=SwYmawNLu94FviPAHR7QuixulI8ASLVMN2aTZecS4wNIMch0q5ro/jyvrTU0grLqJ6
         7MG7ZP6jL5nN9XAfiWjMB7oRPHLJq3uN/huVrBiZIvUoPlj22T2eu1wsYd5D/OWry9Fm
         qHQrGW7TiSjGNDLoLxRkcKnRKRQCv2qxPz1v8A/0c8qFFcu1tIwiwcfmyz/CP5dola+J
         B7g0AMpubBsyU2ZtFgW5WxFTNOYYV8nPr/2ZZCwVgi7ktvXxm3B0qN7QP8fNsfSvtAtY
         wMll7g5Adw62hyqZLH5KomYLD3+iD+docMNuMSH6QOm3wLf/4y2Vx/qnYUMca21LX4ar
         fSsg==
X-Forwarded-Encrypted: i=1; AKwUvBwomDlKQ3QUJyjXZ6mSTAUOQsRyHrOicjHUN1mq2mrxMXGg+RRbVdvPJ/vL86QtsTdKGg4vcYVJrppjThQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lbgj+ttXGinjL2L/eKtnqmC/OVSfVMAi1IdNQp0GKtLPeGDKm7
	oN5GHJazTfGVmifNDaFiK5ymP2h774qhr5ac6fo7zciQxVbBf4qPcmoBKRQDpB5VXwQ=
X-Gm-Gg: AYBFou2YsPrCKmF2tGFDXxjz41qQned5eMkcnsNeSLzOIrLSYnVUc4+45+YZ8iHXT+z
	FCs7I8Wpyr2pfcNvgzE1J/I+5Koqrv1TyWRwV773mloRzBOyC7DyhfEf06U0ugc6lspbubRYT4L
	wVgBfJBCm7sOmczCG190Pui/8ZrPn2AQNk62kqTJpZPZPt29WZgFPkK6nWjcIZUfexNEgLmNb16
	oxB1AkX1UNJsn8HhDHknDwYsqKgYtWxsr2op9eJxdWDRw6G68m5LWPijgSvOetbWJtPt8bWQKxl
	ui/LB6icJKFU4ugEJC0y0s2FXH2MKVmEmNHd05j/Cl5fGgLxE1y0Jmsd7t7GsHEQKwihR4hZdeA
	2bMnwye4yyG1DBgFGAEmz7D+NAuz5Jaor/7OarPMxKwVu2j5yCFVyTFVG8I0hhGM/xetCATO/14
	uQL33bGu+qRhq65BrU38/8mrRXi0A7eYxSZk1CbsbLcurYVJjXoJLy2OJ/F6PeFqpJw7Q1wcOLc
	znLO09dBruilyLN7kBZ2BQO0zT29g==
X-Received: by 2002:a05:6a00:3d09:b0:881:236b:748a with SMTP id d2e1a72fcca58-881236b74f5mr3613151b3a.16.1790570518137;
        Sun, 27 Sep 2026 21:41:58 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feae8d827sm3405869b3a.36.2026.09.27.21.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 21:41:57 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH] fixup! mm/sparse-vmemmap: switch device DAX to shared tail vmemmap pages
Date: Mon, 28 Sep 2026 12:41:48 +0800
Message-ID: <20260928044148.3300333-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260927025441.741633-8-songmuchun@bytedance.com>
References: <20260927025441.741633-8-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each PTE mapping the shared device DAX tail page takes a page reference.
A sufficiently large range could therefore cycle the reference count back
to zero if population were allowed to continue after it became
non-positive.

Use try_get_page() so further mappings fail once the reference count is no
longer positive. The section population error path tears down mappings
created for the failed section, while the warning makes this currently
impractical limit visible.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/sparse-vmemmap.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index b617ff1b985d..66de04f8863b 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -278,14 +278,18 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 			/*
 			 * When a PTE/PMD entry is freed from the init_mm
 			 * there's a free_pages() call to this page allocated
-			 * above. Thus this get_page() is paired with the
+			 * above. Thus this try_get_page() is paired with the
 			 * put_page_testzero() on the freeing path.
 			 * This can only called by certain ZONE_DEVICE path,
 			 * and through vmemmap_populate_compound_pages() when
 			 * slab is available.
+			 *
+			 * Use try_get_page() to prevent the shared page refcount
+			 * from overflowing.
 			 */
-			if (flags & VMEMMAP_POPULATE_DAX)
-				get_page(pfn_to_page(ptpfn));
+			if ((flags & VMEMMAP_POPULATE_DAX) &&
+			    !try_get_page(pfn_to_page(ptpfn)))
+				return NULL;
 		}
 		entry = pfn_pte(ptpfn, PAGE_KERNEL);
 		set_pte_at(&init_mm, addr, pte, entry);
-- 
2.54.0

