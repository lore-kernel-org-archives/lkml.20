Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794396946;
	b=XeglQP3fekJbqNiq1BZMGnvmTd3CWScmFwsBpT3u98+kSyGmnCgNLFDMsx2tIk5mW0NG
	 RvHCxaPbhzKaZ2bq6V662RvGXTHZm1ZZb0fUB20wb/JuQnz0eWLSvhDMun5b9mnys2yTW
	 6X6nRVB8oNbFlZjrLNYzSx0p3DazhpNXJ6RW/2arrKfXD3tn0II3sAmgV5Rbjo1GFhxmw
	 G79BE4ncRxAyUCxXsTbVvxOGgwN9XEJwCcO3pBgUEg/VgsE7IuXkKB75RCgg7r7oEfryk
	 77ecBbrexaxwGYbxePEbwe0L3QEkgeIKgkOf/WqEDAYSrORcGxOo9bYdLSCVw9g4wDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qjgu9e/u2YP2/CdjTUrK3P/cx+QqzByH6M6hocqEYA4=;
	b=edPsSAfL09KVnJ9AbaOUI/84EsokjscunL9ktK0TMV8Jt3N3ctUHQiHCRxbxTofzLjK6
	 T2CDHijXOBQLnunkU9G8oV74i3inEqVESpqfQnIgZZmlMXRKp7hoGX+e8IgUX50vXkw5l
	 nRm94vaUGQDUDgiX8CD+uThWXK5va6LdNyHQc9WEeRLhpCAd/JK8LFa7jLM1istU02NTu
	 qecP2p/zuTWUxNjIYrAedPzzuEEAf6zGaBmwBfsk4pJdrKUcUNGefDJ8w/Yw5+RaKe96O
	 2zQFzvEMxCeUSYi+hLvg45KhIjMEzYjDL3lESEnDHxD1/DLLx4+LPp2JygUTj6Bo4mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IZz5rahK;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A36606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3A36606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IZz5rahK
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-498f5fa5103so838623f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794396944; x=1795001744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qjgu9e/u2YP2/CdjTUrK3P/cx+QqzByH6M6hocqEYA4=;
        b=IZz5rahK3u1xJ6pbbicyNfze4TWK1avlmuwSZLVvGi0GHQcORa0pQ4eHi7fvxXILwC
         TQMEcv0cvOFsIOkdysLUeqUzPOVBBA3ThZtvOYgBl7unJn3cAdSVV1PIxHpebBKK3OVs
         oGXVPt0oddx6PuEEWRWDm39r0mxzIeufb50zHf40tj5aoxce/+/sapDrqTwDJDyq7gnb
         I35+EgZ5qMO3WcArRlmIpJKmrmENlO3dBkK7N5cZvSruTtwUsfpP8WXRp2Awl8hU132B
         ih8KDRb4q+RMaY3NDmjcp1pUwv6N00pU6MZslaofKGL30YryAsUK9qdsOJzZNohUhcv1
         1fRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794396944; x=1795001744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qjgu9e/u2YP2/CdjTUrK3P/cx+QqzByH6M6hocqEYA4=;
        b=Ay881DmPYGaQGBHLDd3qMKjb6a9nm2nTP674erOj92nFekijYoZGAzSurbv3tY5DJa
         1E/MQMbBeT+xLm4PTvhQTFR5Bn3e7d2YLxrJOTNu9De0GwnlnqL9tfidhfB5z+3NjNES
         bDJuUFyz/4umG0VTzOtaicFQeOK9oJL8LzAs/gpmZgJNncwMZjSN13M1t/a13WRHfyOW
         cqYLBeZutUh4FfvVDgBDHU0beDbMvvqjpilus2wtCYP/PYSq/TNKpYmVw/JLRmP85mIe
         pWPBs3GFNJmxPnUaSDahhRd4AKJjXVQJjRpgIWfA2vi/n3JRx0qINjzVJaAW/cJo/XEq
         t6PA==
X-Forwarded-Encrypted: i=1; AL+hErFNSVix0LQ2PgMn4hzzm3uoH0sgiS1k6DhXmitPUf0K6rjPNs8O9hsRrxnV81V5hrmxOeYxs48Nt6Zjh+o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rYiujamTRRPyqi3jfZ3qA5FtLalGkyujPgxyImzNLXX9fv+wj
	cl7s9+HberiFnDRh4vTLZDRKtWK61SpfEx3tl+scsdNmW2Yh9cJSDb/k
X-Gm-Gg: AYBFou2rKk1cmmevFjEMh3jLaqdiEPQ+EzjoRFrpjgVk/5ArfZ780YJ9ERlsdatK4P9
	Ch/lk3bI4qnvl7EYN8ZTFClRKBIWBQtfMscHFyHN7ThVv+mAJinsRxBgvDsgMSdoCzxlt0PslSH
	iDTyzC/7KJo90daIeNCiiP9IObBldX/ysDh0EzjKekwMi87t8KLOiMAbexkTPKqp53yAWHGFxpn
	2cljqX7CfrYxAl2zw6i5CoJU9cypMzvkMpTrEZK28idXT8fTO6TZ0/qQ9r8JI1WfsiwadvLiW0D
	GjuXu/44Q5/kmf1JUXHMYtIeRisPUPaJf5NArbrZTXnpqQS2pXndrGvXxLX19dlNWskiWe8xX86
	/1I0x4LNyCQQ6/g4UI2/ZSDH1xjry90kxEnzymZsOtZT6lgV1BiA8OMj5cqCv0/J+CBW4Vt5i2M
	DZvl8CW61aY++04/rEWRKBy1wqzJauVM5aPazD94POQ03gJ9AK21vT+U3NN/UDHSz+XhdohVe2S
	FzjD/dadqcs0yckPJjjaq3rLCsHNyIT+T/aQTQUm/+1BEDpWg8Bd9ZFq1IJQuevcuNjmMUlEMgK
	rA2SmjNIEJQAbZ8=
X-Received: by 2002:a05:6000:2512:b0:48e:17d1:16c9 with SMTP id ffacd0b85a97d-499c86a0bcamr3562940f8f.40.1794396943825;
        Wed, 11 Nov 2026 03:35:43 -0800 (PST)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365cbbe5sm11598683f8f.42.2026.11.11.03.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:35:43 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: David Hildenbrand <david@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rik van Riel <riel@surriel.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Jann Horn <jannh@google.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Joanne Koong <joannelkoong@gmail.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [RFC PATCH 1/2] mm/huge_memory: check split_underused_thp in the caller of deferred_split_folio()
Date: Wed, 11 Nov 2026 12:31:37 +0100
Message-ID: <20261111113535.330078-2-azpijr@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111113535.330078-1-azpijr@gmail.com>
References: <20261111113535.330078-1-azpijr@gmail.com>
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

deferred_split_folio() ignores folios that aren't partially mapped when
shrink_underused is off. map_anon_folio_pmd_nopf() is the only caller
that always passes false, so move the check there. The next patch queues
folios without PG_partially_mapped for another reason.

migrate_folio_move() passes false when the source was queued without the
flag, and now requeues the destination even if shrink_underused was
turned off in the meantime.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 mm/huge_memory.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 0d589be136d2..8c4a69c797ed 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1403,7 +1403,8 @@ void map_anon_folio_pmd_nopf(struct folio *folio, pmd_t *pmd,
 	folio_add_lru_vma(folio, vma);
 	set_pmd_at(vma->vm_mm, haddr, pmd, entry);
 	update_mmu_cache_pmd(vma, haddr, pmd);
-	deferred_split_folio(folio, false);
+	if (split_underused_thp)
+		deferred_split_folio(folio, false);
 }
 
 static void map_anon_folio_pmd_pf(struct folio *folio, pmd_t *pmd,
@@ -4631,9 +4632,6 @@ void deferred_split_folio(struct folio *folio, bool partially_mapped)
 	if (folio_order(folio) <= 1)
 		return;
 
-	if (!partially_mapped && !split_underused_thp)
-		return;
-
 	/*
 	 * Exclude swapcache: originally to avoid a corrupt deferred split
 	 * queue. Nowadays that is fully prevented by __memcg1_swapout();
-- 
2.56.0

