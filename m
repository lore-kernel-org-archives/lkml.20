Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313949;
	b=4oXdvlChIQI20/RIbLJR7MbZP8ElCVIhRq/e/Ga8wPRSs7eogV7zfQIkyuJaCr8YVgaz
	 EsCPhWhJVpdnIjjrQIV9iuJ4Ldh+sYBzTqRZWGWY5G2V8oSc6ZwjSRqTpjVLahf5cSsII
	 1dwd6h28CozSaUQk052fhQ+vF7dhkJxwYPnpFhpZQFML6p1dx2WWo5i0LstnV0cmVwmyI
	 ApjourqhUf0agzVJ/YqO4lqNaT232zgGR3uf/HYI15nu2s5qLBEgQSOjzJBdDpd2IBYwb
	 xnmOPqPjLJWO3+0E1Fbw2YpgbdRknMVo4KdIHmxDw1BUZeb5RSu0+WMD/E9XGHruEZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lmxqKZZVg8hW4bTmhQL70087cSnpYuyKRLOfUsTG3fY=;
	b=vWTtmx3wv+SdMN748XMEgkmzWTQoVOGs+MhSFtF1771Ak4oWUQPI88EQKBxRT3sv/pjX
	 ZAJihwd7SyRaOqXjUC+WWME2Plhe8AoiIBnjIL9fneER/+abfp9t/tAQGqnZsF+F6yZpK
	 QmX5DL1D3vLn/Hdg+AXPrLt3F0I8ra4HuWnBrpHy7ZA3vwCH9MtlI/bSoE9i3RAKawudY
	 ukGKOusOlFhg5qfznX5fW4hUa843jWsLkixhaKAD3ubZsyMMGJMZQe8lG+sAQNbANXQBe
	 dwEOSoq+esDyrLnVDOd7dTnYaIhe8yryeeTuXWJLJ+1Rgs5Sh3tz94pVlEmgQsDhG/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nXiuWMpQ;
	arc=none smtp.remote-ip=74.125.227.201
Received: from mail-pi2-f9.google.com (mail-pi2-f9.google.com [74.125.227.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3987B606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3987B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nXiuWMpQ
Received: by mail-pi2-f9.google.com with SMTP id 41be03b00d2f7-cdd9779aac8so102457a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794313948; x=1794918748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lmxqKZZVg8hW4bTmhQL70087cSnpYuyKRLOfUsTG3fY=;
        b=nXiuWMpQw2XE5OpmrLBlkLkG4WeT4cbD4hAHIhDXA7Gdh/vzo6oT2ByCMdOAJofh5K
         TVdTTC2DL9axJK9NoNDWlBDmnJENNjCsMDFwufhTwfU/eWlbavuup7K7bQ4YnU0Bq6gP
         5VPwNcmL3PjL4NG5Xqq0R03k054zMvDVLN3c1dnkdfvDghOBTUT5vv6DN/hb1BklNe2l
         bKXrzPviFvI3tQd6yB2Z8XIUwLu61b6ZRE1BSvUKcBr0nf2L91o+/ku1X9RwHlfFx/05
         eA2LdGL4qWIjHZbU4bD1lzzB6TvAGC732m7FPMei/CvWowez5nWIPip6S8YbJcMjv1ie
         st/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313948; x=1794918748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lmxqKZZVg8hW4bTmhQL70087cSnpYuyKRLOfUsTG3fY=;
        b=fgwKN4JLdaP2HkjrWSuCwKAuFjA98GMPo51RD2ftcfb5WVemV1yD6HiI9bwf7bIvNf
         4r2s4hid/5bRbYqunGpWGbgIKxvbhlCPru+SYAxGSOkGf/Ze5T1d2NSTlb/yrx5F9YGp
         rE63uKoNtxx+qqNcp8HzZvYhgpA3lDHVi+7sNcS7nLcAlxR4KNB+4QtVT3oQcQooWmWk
         cuMwOpu82bABWA+oo4yMIkaNvKRcwjs4MGGhoJ66tbmjSDhFh7KvO9K4xoXvX2Use+82
         yNzhHyNmQskv+maCCHKNnNjANLLnnOhlie31Hp5VEQH5l96AE5Idz5t4+KPdpes0HQEk
         1fQA==
X-Forwarded-Encrypted: i=1; AL+hErF4/1qtrU9uuM0RXGAB+C4cmUl1TLyYKJm3RRDCz6AOJAMXU4Rp6fyDccjjXe3q3CMHzOUl4rci7MiT4m8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ghx8C5GtFmfyLEkwIOeOMEId7rJsYeVNgEHpCqA35txZ3RP8J
	R5RJ2Ibo9UlJx+2fQ21xeixKLYJKGkWwAoyzrHIPpRRyedQCxh61ncBs
X-Gm-Gg: AYBFou36+SmGW1qVJdW9wNciPYK+0RlpooL0pqYHU9aLAVKlAmI9G9VtQK7IbkoHUYZ
	GgFgOTBVCdNUEdXT3YjaBUL/9BOxJyP8AvrJzayY98RDXrrVtjLik5nxx8bNTN/Bpvj23aNR7Oi
	XpQurBQuEXkJRqPYdOuzvOrWfGfqtcCCxmV1hCHHyGiwwOvmzYIIcrJNySY/QQG5uMeLYbpIi9p
	Z6W7UGXrbu/wJI/R81llUv5pTm0JGb5JLp180YPXhqy1iNNhz10+tt+A9b6PREDtskYU0X6NP9U
	HhIjLwjfITBDtZhspHVlwm4ieBvA42d9LatSNFXRzzT0+vkzBVuvmcpzEUMPS8M2nlKWWajKIGy
	9e0Oto6v6aNMAadreMZf9wQ/UV9iv8NrWfLhl/9Q5XkPxoMZYglElwKvfxQtJnMYu3IdZw+aF3O
	IR9Ex5F9bSgrucG9hXkFAqd0oYbmjA1HNIRmTuitfxWQxVEdrf+CDwwr97I95dB/BZ2TBqmwYZu
	aF2kj82McJ7yB2VBu9UqSG1IOYhng0DtkzTJ6sMfq529lbb+P+FLl6Tz7ON8GezX6C2Y79mjcTN
	h7LNufv3IOt5t5iqIRSDJfCcB2rhGH9rfE2Y8Bpzpg==
X-Received: by 2002:a05:6a21:3d8c:b0:3de:79fe:13f with SMTP id adf61e73a8af0-3f18efad460mr1762586637.38.1794313948383;
        Tue, 10 Nov 2026 04:32:28 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baa506bca4sm815282b3a.0.2026.11.10.04.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:32:27 -0800 (PST)
From: Wandun Chen <chenwandun1@gmail.com>
To: david@kernel.org,
	hughd@google.com,
	akpm@linux-foundation.org
Cc: ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mm/migrate: improve mlock tracking for PTE-mapped large folios
Date: Tue, 10 Nov 2026 20:32:18 +0800
Message-ID: <20261110123218.1579490-1-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Wandun Chen <chenwandun@lixiang.com>

Commit ab521b4142aa ("mm/rmap: improve mlock tracking for large folios")
mlocks a large folio when all its pages are added in one rmap operation.
However, when a PTE-mapped large folio is migrated, remove_migration_pte()
restores PTEs individually, passing nr_pages = 1 to the rmap helpers. As a
result, PG_mlocked is not set on the destination folio.

Reclaim can restore mlock in try_to_unmap(), but Mlocked in /proc/meminfo
remains undercounted until that scan occurs.

Restore mlock once the full mapping has been restored in a locked VMA
under one page table lock, rather than waiting for try_to_unmap() to
restore the mlock state.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 mm/migrate.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 94033c222e04..140e291d4587 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -353,6 +353,7 @@ static bool remove_migration_pte(struct folio *folio,
 {
 	struct rmap_walk_arg *rmap_walk_arg = arg;
 	DEFINE_FOLIO_VMA_WALK(pvmw, rmap_walk_arg->folio, vma, addr, PVMW_SYNC | PVMW_MIGRATION);
+	unsigned long nr_ptes = 0;
 
 	while (page_vma_mapped_walk(&pvmw)) {
 		rmap_t rmap_flags = RMAP_NONE;
@@ -446,9 +447,16 @@ static bool remove_migration_pte(struct folio *folio,
 			else
 				folio_add_file_rmap_pte(folio, new, vma);
 			set_pte_at(vma->vm_mm, pvmw.address, pvmw.pte, pte);
+
+			nr_ptes++;
 		}
-		if (READ_ONCE(vma->vm_flags) & VM_LOCKED)
+		if (READ_ONCE(vma->vm_flags) & VM_LOCKED) {
+			if (folio_test_large(folio) &&
+			    nr_ptes == folio_nr_pages(folio) &&
+			    !(pvmw.flags & PVMW_PGTABLE_CROSSED))
+				mlock_vma_folio(folio, vma);
 			mlock_drain_local();
+		}
 
 		trace_remove_migration_pte(pvmw.address, pte_val(pte),
 					   compound_order(new));
-- 
2.43.0

