Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E184FC8D1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790121521; cv=none; b=CpHIncA+3qPYdj/K0JZS2ghiy3jFQ2G19l9Av4qOO8H7sbf1rIlFzQRZZqSjtxpsVBuY3RozeWytuM0e5ZxUCML6PdFfRmicgoF+eKbwOrEJRUoovPOKf/sNkv47Mo4XSXtDZlGJU/uOzAdVo1v2KobT3iLelRLsmUWJnJ2XmO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790121521; c=relaxed/simple;
	bh=EK7vI9KcRnwekK8Ynl1zk9PVNmfiyEBbTFnZNQww8Vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CPlgCHd1m5v8Rxe9FLjgiBYLRXmpItHnaq/giAS3T1mh1Hr70B27rwAjre7I7OZQvqArmvEw7zXOoXCJZ4HJwpPtiMB+3+UZtvwq2AxAP9pcCZ4VmKGFvOZXu/XUkGgGcqvDAMo8hovCipxWPwXJJ7KYa4k/lVy04HHv/luEVxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=kuchFlsf; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="kuchFlsf"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76ec395so4199211cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790121518; x=1790726318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cv67mS8beABpbmQAZ394RKqHc9TebilH66SXRMDKuYM=;
        b=kuchFlsfo8e/wdQdQUZBvc3/ALkKndlwQhowxd4RKdio+DBMgYD3jA/8H9dEnv+Woj
         E+77CsEAjJ1TMzuUwX+9BAsx0pMgkpTXufqGa1e0s6XwZVEGpdmmO4RHudb9M47V+cAe
         CtujIHn1BZ/Jlz5ISZB1ZPwEWLvg1xz7bxBJ16CjRIcwvOD82AtqGKuAjgc+lmgOWKtl
         PiM7gvCHrbAnqaTx5e+UUjmqyjDKsUyTMgy1ckmlNhJDQaUpbeMGpXle8+jdS1q7UN1Z
         tH5I6dpQ4Ayw/OPelgRMxfaZSk3Qv3nfUBPE+hoPv61xcSonF+ZV/ssQRb2H4AKiMYqE
         p1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790121518; x=1790726318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cv67mS8beABpbmQAZ394RKqHc9TebilH66SXRMDKuYM=;
        b=IHgYwMmvNUrfv4iOBW2nZXhGJxOsWw2jMtj9tyNugjZnjpIvlgVJJM36B1i2UK/Jza
         y9ejDSIvYyhP+K3XAKA9O3iZtU7ST6LZGW5JOpHObED38cZmgfGUI3muHbgJlvvGt7/o
         Gh8EAmLJ8LMG9c82b3S+9wTE20vaTOwy7yJxEjLTcI3MIyYDBWL8fkZxWd4OXWk+W3km
         dl9mMBN6b/cjWb7W222IEeJiPehLBsT04hn+Wk2vRPgiYGr2b9d9P2NjI7REGoP+nn+G
         xmTU6oLpSUvN4a3zVsWwg27RuLaVEPI/mNdZkqy/kLgeOktQCE+g25xzA4Jhq8pqvHl9
         v5Kg==
X-Gm-Message-State: AFuF++kecb73NCA/m8ttpClvH8lF+UmyqJM5LjVvl8HdoWbVscAlblwC
	oiq6WVWlTdveapR4WqOIV/xZqSbXfvxtbTSmp+ArBptfQzIHyS9kHnd09JrdyceCFfQ=
X-Gm-Gg: AYBFou20rjLXEWIOnYhRs77qRAmygBWhSe3I/TYViKHVmhJQZC6GjPfavO7PvXbtk/3
	osM+fTCABIoXmvTyHYuakrImKqau4u7X1IqHctuIqh189XUnH3PgU3a5hsGqnfU42in2h/gDAOi
	81m2kTjBZYmK3n1OmqEQ93GxBvJ5HeYykKoFV0DyGlwHn6XuLPZQNMw15z5GqvscHso78mrrPik
	Zody717i/+zVhEoibBbHSPfgvnZ20g0TKFNac5TpGhlX9MW8Ie6ImhHKe2KW/n6cNx5rfGy1Ju7
	pdnK+4AzM/98qBHWAT2tjgJA+0pwRnthaGRySXMqiY+L3kmoCHgm4ykl5chbR8G8lmje3KiwE8c
	EkJBMUVRwLv8QQRue4mHL9hrCCScx9sx2Qs8hYPuR+EkwyAklb8qz9ZDlvhxSy30QnfF1YgUyfJ
	E8W3HT3pHH2Cni2W5MDWpj6d4q/s2hQzUCGHssU+whJo22sJB+ULEY5X8J+Lq8xshRnZ2I9BtPe
	qilPHgFmu2icNZ3H5LdqmHm7HKEqCz463S4CiHqj6LeMT7xwDYwNGNIXy2f
X-Received: by 2002:a05:622a:6101:b0:532:b08b:45cd with SMTP id d75a77b69052e-532eacd610fmr16957421cf.31.1790121517717;
        Tue, 22 Sep 2026 16:58:37 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb3c6715sm8323261cf.30.2026.09.22.16.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:58:36 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org,
	david@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	"Gregory Price (Meta)" <gourry@gourry.net>
Subject: [PATCH 02/10] mm/madvise: name the shared LRU PMD callback
Date: Tue, 22 Sep 2026 19:58:22 -0400
Message-ID: <20260922235830.2350770-3-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922235830.2350770-1-gourry@gourry.net>
References: <20260922235830.2350770-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MADV_COLD and MADV_PAGEOUT page-walk callback is named after its PTE
implementation even though it is registered as a PMD callback and serves
both LRU operations.

Rename it to madvise_lru_pmd_entry() before separating the PMD and PTE
paths.

No functional change intended.

Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/madvise.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 00b1be655a8b5..83d54ab385da8 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -361,9 +361,8 @@ static inline int madvise_folio_pte_batch(unsigned long addr, unsigned long end,
 				     FPB_MERGE_YOUNG_DIRTY);
 }
 
-static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
-				unsigned long addr, unsigned long end,
-				struct mm_walk *walk)
+static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
+		unsigned long end, struct mm_walk *walk)
 {
 	struct madvise_walk_private *private = walk->private;
 	struct mmu_gather *tlb = private->tlb;
@@ -581,7 +580,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 }
 
 static const struct mm_walk_ops cold_walk_ops = {
-	.pmd_entry = madvise_cold_or_pageout_pte_range,
+	.pmd_entry = madvise_lru_pmd_entry,
 	.walk_lock = PGWALK_RDLOCK,
 };
 
-- 
2.53.0-Meta

