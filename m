Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333662;
	b=V8EzFH3NKOT5ZFJNRB20IyFQgz0TVPn5KZo0byN3PkqVPr1YJT4asuZmf4hKyF152kda
	 IAwQCPdYfwXGzGiCNYFnbsI763zxWiJ5Uv+KICNrvmWy4fdGD9GmmbfEN4eks3CdamhOH
	 aivTQdtsH9T8RT7uM5CFiDhOSLoFIh6KPTRCRG1s8o1jzbl7WkwIC+nJOz7pQDrgY7KfA
	 cq0SwZjMp2VRtsj4nVBpyxeW5Hwb/xMlBfgqJVWsjEldGTISopWfK94Zq5B/lOmfSrZMN
	 gbaN6BoNGnoO8+ebwIdsPyqwZdazHhCDShVSk3m5HgHG9nxSnRrlALblKt4Jmlq2ssw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ANhVEI2FjVEETl30wKF8XXVG78pCH1hEhuZdh7nY6Zs=;
	b=TeW9hpjbLsuV2KU93Y3LDjaN7ra/Jsq/d2nWlHpFt+pcP2URtVLaD5odIA3C9cJoSrlN
	 kHtuo822gGp+7vqfL6aEtTuXlomyy2Lns7fTqCeUXUXFkcQ142bNSIYOq60+cDg4ItTgb
	 N50eAi4mDnYXHsEsAtG3ejaGqP0OPy53Bcp0NvtxHAVd63s3mipgfPP7y7oibQGUY8T2M
	 Qf74b1aOGfPVdqw9Id8LNeH0ukgnuGD8sI8Y3Pb8xKvrS8bwJppbI4WG7ChH0SbY+tzNg
	 i6HrMCVXrM7T/ZWjg9T04Qmg8jALnPBq8KHKuUl0nOcK9asWAnclYy11LFAJDPjnPYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0pYp5abU;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E9D606A323
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2E9D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0pYp5abU
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso3477201c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794333661; x=1794938461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ANhVEI2FjVEETl30wKF8XXVG78pCH1hEhuZdh7nY6Zs=;
        b=0pYp5abUrfVWNmvzecfNxr80Pj74+oTXrJcVdO9+HKGUOdxCwTcyunl73sIqxJ1JOU
         JQ9ypD9mWPz/6q6I+kCbBRn/mQa2zQln8LNPDVMj8odfqh+QbxlnmJgBpf2p7jbvmzU7
         AKK4GF7nqpuC1bVvHEXfmJoSrW1zICe1L5LPkSh21RE/71sU0K/HU3uwMtz9qhMdkNg/
         cQoGGVkg3SG0D0640U3hAAHD6gUxOhz4F18O/wg1WxFeyiJ2vtEmPih4HFyaYyohjFab
         z/zLpKa5fyNK+RvB+J2w445ZwEr+iEYC3F0wOgulR0aT4eEzRHbbxsOxBsLJL0u9HoBV
         YwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333661; x=1794938461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ANhVEI2FjVEETl30wKF8XXVG78pCH1hEhuZdh7nY6Zs=;
        b=hjpKcKENXsKtJoZF5tnXH4ofbqbtWEvMIttN9Fu+CZnVeWS5tLZY2i1rAkSNi3dtvy
         PBZGrEn5xK69vYnCXRCyAOrCeNGp2Ki4qwloZGyND49HDeif6GbBHZGoKeosvxAfgL+C
         4+JdrGzk33FCFEsXcX0usJueslsuRXSU1nOaxBQf7uBDFE1D8Qj4x3o8XMzLB2qEf1+X
         Tq6htjK3q3lkMyTfJ9WPcJKE3cRrUAGdKDj3wRl7E+EiyyIjPdo16gpK6Q7cgkMR6nhD
         fAhYyPdq04Lhnc7CMaZUF1yIDQExQpuxQr9R74gLzMb/fD8bs7xYQ42RU57pMh/1aGY8
         xoUg==
X-Forwarded-Encrypted: i=1; AL+hErFTJ6tfXs98cMhSFWpjq4pBzZ708iEqcxZsPrnBbw87ybmTCm44zeFC+xSfwUjE8E/MqTzasAW1kcE1mJg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XLEi06IDfMPjw9P2M72kbRZDv66rvkaNLUqgrXa6NJJnJw2z9
	iKdJkntMAwwe1KpKOhIBtsjD2o4Awq9aafhnZ4xItsySq9VBJAmtxQbH
X-Gm-Gg: AYBFou1uheo7N8HQgjOc/gQxSydw0UWKcBa1XGYvoAuNv4s1cx00q+2kRMLT+ht5LgS
	hYknNRxzPoAeH8ROyzG5txfts9ZVgU71xgO5+aUh39E3WJQGQC6j5WTQUj653u+drNZ9VdVPVlJ
	xms3s9FEdm2BdtHBbKyISg6i49mrarbYBZOWVe9dDNpZ9r87FB7xT/H4CEW89IeRmJoE7W5Cmtc
	fHyRzWZGFXRT+Y3k4Z1GzBT86jc/MLOO6RGSfQYSoD/kNwTK9jsvKGfPSi6FRkQ3HZ9QmyfTtTj
	ao3ijoByQuRXjyWl6oQy+bp26fSTeMnzEYfkCms122+awd5MdRTiu2fBCg5xIMKyJdq+3Gbb1gI
	JiHPpbJ/4ZmW/2pYyN38q9j0Jykf7Y4TcvHVlwaDJs7GujQB5OZc8yR/x2dAgqS71j3pJ6Swnsf
	wPIAFwRAkmnr6UMragJdSq2h1ApItUPxS8io0ACGgamyV6XXlNAx8wrAsi2Cy9FAe3hQ1PSbb82
	JAR02YQXWZ2YnELrkQyB0fVNz7zyIddJfhNzDkIvlFvCOEHAroeABivCZ/z9OLs/adYRskc0d1O
	kNPTlvWg3p3fUirX9WmrGEqVWAF/xwqYHjT4lf+gjVYJMKNoRZPQa1+V9bw=
X-Received: by 2002:a05:7022:28a:b0:1a3:87c8:7efc with SMTP id a92af1059eb24-1b3b605185emr4269128c88.39.1794333660619;
        Tue, 10 Nov 2026 10:01:00 -0800 (PST)
Received: from aig-kmd-01.. ([120.133.49.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm7624260c88.14.2026.11.10.10.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:00:59 -0800 (PST)
From: Yin Tirui <yintirui@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com
Cc: ljs@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	ryan.roberts@arm.com,
	nico.pache@linux.dev,
	usama.arif@linux.dev,
	liam@infradead.org,
	kas@kernel.org,
	wangkefeng.wang@huawei.com,
	chenjun102@huawei.com,
	yintirui@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH RFC v2 6/9] mm/huge_memory: add and use split_huge_pmd_anon_rmap()
Date: Wed, 11 Nov 2026 01:59:21 +0800
Message-Id: <20261110175924.2945538-7-yintirui@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110175924.2945538-1-yintirui@gmail.com>
References: <20261110175924.2945538-1-yintirui@gmail.com>
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

The anon-exclusive handling and the PTE-level rmap conversion are written
twice, once for present entries and once for device private ones. Factor
them into one helper.

It returns whether the mapping may still be frozen instead of writing the
caller's freeze back.

No functional change intended.

Signed-off-by: Yin Tirui <yintirui@gmail.com>
---
 mm/huge_memory.c | 90 +++++++++++++++++++++++++-----------------------
 1 file changed, 47 insertions(+), 43 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index dcc8cd380da2..5abcd194bd4d 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3239,6 +3239,43 @@ static void unmap_huge_pmd_entry(struct vm_area_struct *vma,
 		folio_put(folio);
 }
 
+/*
+ * Convert the folio's PMD-level anonymous rmap into PTE-level ones.
+ *
+ * Without "freeze", we'll simply split the PMD, propagating the
+ * PageAnonExclusive() flag for each PTE by setting it for
+ * each subpage -- no need to (temporarily) clear.
+ *
+ * With "freeze" we want to replace mapped pages by
+ * migration entries right away. This is only possible if we
+ * managed to clear PageAnonExclusive() -- see
+ * set_pmd_migration_entry().
+ *
+ * In case we cannot clear PageAnonExclusive(), split the PMD
+ * only and let try_to_migrate_one() fail later.
+ *
+ * See folio_try_share_anon_rmap_pmd(): invalidate PMD first.
+ *
+ * Returns: whether the mapping may still be frozen.
+ */
+static bool split_huge_pmd_anon_rmap(struct folio *folio, struct page *page,
+		struct vm_area_struct *vma, unsigned long haddr, bool freeze,
+		bool anon_exclusive)
+{
+	rmap_t rmap_flags = RMAP_NONE;
+
+	if (freeze &&
+	    (!anon_exclusive || !folio_try_share_anon_rmap_pmd(folio, page)))
+		return true;
+
+	folio_ref_add(folio, HPAGE_PMD_NR - 1);
+	if (anon_exclusive)
+		rmap_flags |= RMAP_EXCLUSIVE;
+	folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR, vma, haddr,
+				 rmap_flags);
+	return false;
+}
+
 static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		unsigned long haddr, bool freeze)
 {
@@ -3320,23 +3357,12 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		anon_exclusive = PageAnonExclusive(page);
 
 		/*
-		 * Device private THP should be treated the same as regular
-		 * folios w.r.t anon exclusive handling. See the comments for
-		 * folio handling and anon_exclusive below.
+		 * Device private folios are treated the same as regular folios
+		 * w.r.t. anon exclusive handling, see
+		 * split_huge_pmd_anon_rmap().
 		 */
-		if (freeze && anon_exclusive &&
-		    folio_try_share_anon_rmap_pmd(folio, page))
-			freeze = false;
-		if (!freeze) {
-			rmap_t rmap_flags = RMAP_NONE;
-
-			folio_ref_add(folio, HPAGE_PMD_NR - 1);
-			if (anon_exclusive)
-				rmap_flags |= RMAP_EXCLUSIVE;
-
-			folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
-						 vma, haddr, rmap_flags);
-		}
+		freeze = split_huge_pmd_anon_rmap(folio, page, vma, haddr,
+						  freeze, anon_exclusive);
 	} else {
 		/*
 		 * Up to this point the pmd is present and huge and userland has
@@ -3360,6 +3386,9 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		 * complete for this pmd), then we flush the SMP TLB and finally
 		 * we write the non-huge version of the pmd entry with
 		 * pmd_populate.
+		 *
+		 * This must also happen before PageAnonExclusive() is read
+		 * below, see folio_try_share_anon_rmap_pmd().
 		 */
 		old_pmd = pmdp_invalidate(vma, haddr, pmd);
 		page = pmd_page(old_pmd);
@@ -3374,34 +3403,9 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 
 		VM_WARN_ON_FOLIO(!folio_ref_count(folio), folio);
 
-		/*
-		 * Without "freeze", we'll simply split the PMD, propagating the
-		 * PageAnonExclusive() flag for each PTE by setting it for
-		 * each subpage -- no need to (temporarily) clear.
-		 *
-		 * With "freeze" we want to replace mapped pages by
-		 * migration entries right away. This is only possible if we
-		 * managed to clear PageAnonExclusive() -- see
-		 * set_pmd_migration_entry().
-		 *
-		 * In case we cannot clear PageAnonExclusive(), split the PMD
-		 * only and let try_to_migrate_one() fail later.
-		 *
-		 * See folio_try_share_anon_rmap_pmd(): invalidate PMD first.
-		 */
 		anon_exclusive = PageAnonExclusive(page);
-		if (freeze && anon_exclusive &&
-		    folio_try_share_anon_rmap_pmd(folio, page))
-			freeze = false;
-		if (!freeze) {
-			rmap_t rmap_flags = RMAP_NONE;
-
-			folio_ref_add(folio, HPAGE_PMD_NR - 1);
-			if (anon_exclusive)
-				rmap_flags |= RMAP_EXCLUSIVE;
-			folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
-						 vma, haddr, rmap_flags);
-		}
+		freeze = split_huge_pmd_anon_rmap(folio, page, vma, haddr,
+						  freeze, anon_exclusive);
 	}
 
 	/*
-- 
2.34.1

