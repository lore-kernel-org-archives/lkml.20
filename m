Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001779;
	b=ILQeYqFgXRurNI8kY2Afl/y6Qm11HBkAfKqY5nP5IyxFAjEkZVaPNwpBfZMgscZ8aTNI
	 aIPRq0BkfEz+/gTFsSuK++88JwMG4Yr6Z1QtJvtVKx7XIXLXzDkiesKSLDF56m0rAoly4
	 9VeSWJo7CBNzmte7RqYJGZK0AXz81MbfNNvpR8ByRNfY3rcZZK38rkStL5l2Bz6lsVnXO
	 ejMT2ubkzH+dS4/EDkZOwr2BIku3hr6S/qcIp9lO+E8SeOxUVzyXe+vJSOFmFyIK0zH7B
	 CdJP92d5gLKRwVdZ0/A2IkZw5JZ8QeCG7AK5ux3oowqohgDJpD7y/hjk+dj0msm4SuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001779;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ua/GwnSU9LJOYkv1rGO2E2qJAAhF1zPUAvQ24xV9DW4=;
	b=e0uM3YEyWwLPT0GHbuheCHOMVFXmHDvQAocYyBrRWxwKLbn9ELaik1f/mc3k/xnq65BX
	 QKMdRNeyHiQlgoEvmELHfAmioFemD9skUNm5JmkENbCGDz/J+1tGw013Yu7RyO+4J/0Gj
	 osz/Ivug7zQLxsYcxYAJI/Ry9XUKEdtFY6vKz4rZ81OarkED62z0aLBljEWFa1PiavilY
	 Q3p5EslNougY727U14dWLDQSlEXgSiwXheg++iipeKeKKnSUGLI+Ss1Wt6cJtirFapakt
	 4wK8UUfiThIjJyTWI9XJh0KJzX5RA9GwYW8+XTByu5DX4YwqFv2F4p6jXxFNT8RlmQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WcjhJfZU;
	arc=none smtp.remote-ip=91.218.175.97
Received: from mta0.migadu.com (out-97.mta0.migadu.com [91.218.175.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EA2606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58EA2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WcjhJfZU
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ExnTYg0MMPYD5DKsFA/XjypuB+/Tj0Yq/PSjWL3PWFU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793001776; v=1; x=1793606576;
 b=WcjhJfZUBWDDeP3G8YA2I4b7K9KTAu11yEfy66DjFdpFcH4GkqMxswFEm3tGxAr2Or2ozjXl
 giBdo+8Q0rmZX4xUMveYJxnHu0UYGwvGGw4dHO8Bp40eXRZZs4aHYgjtMDa1w2BugZeRgE6haJ0
 xkb/1Nim+C2Sy4he5yGdBuCU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fd68075ab15c9be6;
	Mon, 26 Oct 2026 08:02:56 +0000
X-Mizu-Trace-ID: fd68075ab15c9be6
X-Migadu-Flow: FLOW_OUT
From: Hao Ge <hao.ge@linux.dev>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Hao Ge <hao.ge@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>,
	Dev Jain <dev.jain@arm.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Subject: [PATCH v3 04/10] mm/vmalloc: propagate errors in vmap_pages_p*d_range()
Date: Mon, 26 Oct 2026 16:03:23 +0800
Message-Id: <20261026080329.140244-5-hao.ge@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261026080329.140244-1-hao.ge@linux.dev>
References: <20261026080329.140244-1-hao.ge@linux.dev>
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

vmap_pages_pmd_range(), vmap_pages_pud_range() and
vmap_pages_p4d_range() return -ENOMEM whenever the level below them
fails.  But vmap_pages_pte_range() can also return -EINVAL for a
page without a valid pfn and -EBUSY for a pte that is already
mapped.  Pass the error up as-is instead, like the vmap_p*d_range()
helpers for vmap_page_range() do.

Signed-off-by: Hao Ge <hao.ge@linux.dev>
---
 mm/vmalloc.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 7131f60d1a8e..d60b99b81ec9 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -600,16 +600,18 @@ static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
 {
 	pmd_t *pmd;
 	unsigned long next;
+	int err = 0;
 
 	pmd = pmd_alloc_track(&init_mm, pud, addr, mask);
 	if (!pmd)
 		return -ENOMEM;
 	do {
 		next = pmd_addr_end(addr, end);
-		if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask))
-			return -ENOMEM;
+		err = vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask);
+		if (err)
+			break;
 	} while (pmd++, addr = next, addr != end);
-	return 0;
+	return err;
 }
 
 static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
@@ -618,16 +620,18 @@ static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
 {
 	pud_t *pud;
 	unsigned long next;
+	int err = 0;
 
 	pud = pud_alloc_track(&init_mm, p4d, addr, mask);
 	if (!pud)
 		return -ENOMEM;
 	do {
 		next = pud_addr_end(addr, end);
-		if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask))
-			return -ENOMEM;
+		err = vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask);
+		if (err)
+			break;
 	} while (pud++, addr = next, addr != end);
-	return 0;
+	return err;
 }
 
 static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
@@ -636,16 +640,18 @@ static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
 {
 	p4d_t *p4d;
 	unsigned long next;
+	int err = 0;
 
 	p4d = p4d_alloc_track(&init_mm, pgd, addr, mask);
 	if (!p4d)
 		return -ENOMEM;
 	do {
 		next = p4d_addr_end(addr, end);
-		if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask))
-			return -ENOMEM;
+		err = vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask);
+		if (err)
+			break;
 	} while (p4d++, addr = next, addr != end);
-	return 0;
+	return err;
 }
 
 static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
-- 
2.25.1

