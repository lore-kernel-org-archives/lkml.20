Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACB83D3CE3
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167728; cv=none; b=p7HzjLi6yXx2lV2XmIy2Z+Q2hB8gX68IZ1ONfdOSX3znI+SKHo7WKjpWca0VfC78+ZZhYhjpgNV2JEhteKiFFP9EP059+tjEC+1Srke6Sy2MZO8zGDv5jLxNxMoMd1+s5mQi+jLjOlu0bMNu3ipv0OIS73anNTk2vQNCXlW9d7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167728; c=relaxed/simple;
	bh=b0YUq/41ogJk3rt6f3N8T8Z7WKhPhnQKI10zMCJZNQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IJMPvA5mukqZhsgxYC8f5hBovhL29vi2BeC6PjIoWeVr+ATvlzz6AO5dW7JfIR/xzxgFbOd5l5yqPBxhXTRmTq1X/Tzi6+KV7+s90GDylgPREglswc2yn0PwBAlUUGrXHWPTakBz1coDK4sK7Ws9hNnofHtxrqeymmxh9w0OA60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=IklFHn+q; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iGxsEpi3; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="IklFHn+q";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iGxsEpi3"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5FB6D7A0189;
	Mon, 31 Aug 2026 05:15:24 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 31 Aug 2026 05:15:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788167724; x=
	1788254124; bh=xcSC8O/moZEOV/IBCrJoRWIk1sJaW3eAtyBK3gzLgK0=; b=I
	klFHn+qzP9FHWc7JQo3QEQAyPiSY44gm1yWfzhUDZMBHtgOKGYOkEjcEMLwdy1zM
	MJPTgtWj6wv8bOBpTKfurvXeISDwJmuMC51lU+LN8u66nBebsNmL6juzG80nOwEd
	iSNxErqgrVC+t6cgO9Uorbwzx6j3LKm//JezTRYiNdYN60KFWJwVFQxVCEaYWdAs
	8fykZwHbvC0flc+1CeRhIxtrTmHQvc2iFs6wEkECouJp0whiWnEKanR3i9FOyr+O
	APeT8hv/Qyxgy1BSd0L/Bi/CVXbHeQD9xKusvS0JQ8QBmX4+PzANC1t8H42ojbhR
	th9bgFPIaGjSlE+8+Dtqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1788167724; x=1788254124; bh=x
	cSC8O/moZEOV/IBCrJoRWIk1sJaW3eAtyBK3gzLgK0=; b=iGxsEpi3+41OBnJA2
	46R9jTDsc22wWqIw2EKSXpz0hQSQYaQBAe4r30/UoTELMmR6f23nfEqikjPzZJ1j
	fyC3RzswypepySRSySFIRjdWiQGY3rf1IfHw0nZx/GveNTIrflAFmx0wHiOFYwNa
	MSoEzr+Ak0CNr4gD8GCfqojmNEnl97QPUZ98+1dWfi4NTBgVSq8pzSBGW+a7K7sZ
	yzJokIXD/j2I5MJ+FkLWyT6QecUzJrm1QKkinFUfpoC7ADsIil3wRF0i1foBeRR/
	NaYEPEWQCyPOfgHLX3J9eVxNtc8GMxs6xTuwTuoBrGz1EFyiQfZAA63Hl+hDS5Y2
	oly0w==
X-ME-Sender: <xms:LEaVaqN26qlQ4EyuPVoTSkrC5E24nAFdIOEc0axQs-w5V4f8qWUWxg>
    <xme:LEaVaqWMyRk2aIekO2_hAxXSkzwmDs7USWCNvFvitowFPQ4IQ2JPp7v5vaPbeC4x0
    TQxIwhEd5Nuv6mk9V0D3BhuWHKWxWFIjFsDYNdnx6z1rG95n7-b6PY>
X-ME-Received: <xmr:LEaVaqjf_2jbuS9R9kaNm4H1lBgzKU-LfMPo7EdabowocjUMwkZN3kSoRDI>
X-ME-Proxy-Cause: dmFkZTElGHzZXOzRI/9NIbzc7ym+V5oK/V4P2VoNYRqs6Th5b5h+DvBAIIu3zH8q+lN0yo
    H2vQeS8d6rToUzcLNvWew1vKGaeUzV3a7p18Bx8L+Qohr9uBRowisapZPSCSDRtM3GtC8y
    ZURjdwZEwJ4LMOrmpWhh9wc4BPdajb8dN6I6jNll2FaMe/Z86AFT0cI/vtl0wpOFAg1sMt
    cFGj8IrKy0Z4YDXozBQ2tFLLe2dJN9TawYFZ/1czPfloihuYjUN+3xx3pd2P3MuECG86WL
    H+VzqRhMeUhxhH5iwF+MmguGBplxiKYHHIj7ZdHv36TDJbcwz7IjOJY93tBQ+iYR9aH1ST
    Gu6+nWmQ7pyfMuDz5SfoO60zxnM+KfVrHMmw/KRBAFQeBg6hsogdSQwsZXSpLjiQMCivIL
    b6oqYAuxtIc71IMhHeW32zVEo6n+0k/QlQ2JTnsH/tpw2xt4XtIw/d+BiBxLclaXg7INJi
    7udjy7RF0u+KQnOGYZS3uWvDf5HAnYbrwxIb80GxfagvECMy44eX9VD0W5oAI1soR/QXXy
    wCdjGjYhvjySPSrBu3hItElv18Wh17GeoTFdMSSxvucuyqPptz4tZDU9W+KoBwRUyoIW0F
    T/XscHVlmjhxwnv4JNuKfAf4GLT2rb5J1x5SfPiJmJmS2lKVoBhDdJnFZs4w
X-ME-Proxy: <xmx:LEaVai_huXoAhYJ_A58Ae4LsihOPTzeYDIM2P9qkfukJa_5xPCTDuA>
    <xmx:LEaVapQkb7BwG3hPYCzcpu5ce9UjcM8ZD3k688ok4gkfzkD_-qLQXw>
    <xmx:LEaVapvogh-YfBRYbm9v39eFtNHooLSAo6bhBr6tKGNzquio4RarGg>
    <xmx:LEaVaj6ei5LWKTB5v6MVx_JOFDJjtYDTnQyqQ1sCf11atPlUlN2ehw>
    <xmx:LEaVapRgpkXYYMpM3PCXRoewS3aREWiT2FZ4MjMk0Od1Y0HITg7tP3OV>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Aug 2026 05:15:23 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	hannes@cmpxchg.org,
	usama.arif@linux.dev
Cc: lance.yang@linux.dev,
	ziy@nvidia.com,
	kasong@tencent.com,
	hughd@google.com,
	baolin.wang@linux.alibaba.com,
	baohua@kernel.org,
	liam@infradead.org,
	nico.pache@linux.dev,
	dev.jain@arm.com,
	ryan.roberts@arm.com,
	balbirs@nvidia.com,
	kas@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] mm/huge_memory: do not touch frozen folios in deferred_split_isolate()
Date: Mon, 31 Aug 2026 10:15:13 +0100
Message-ID: <20260831091514.1879786-2-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831091514.1879786-1-kirill@shutemov.name>
References: <20260831091514.1879786-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

deferred_split_isolate() probes each queued folio with folio_try_get().
folio_try_get() failure is treated as a lost race with folio_put(): clear
PG_partially_mapped, correct MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, take
the folio off the queue.

The folio_put() race is the most common case for !folio_try_get(), but
it is not the only option. Another scenario is folio_ref_freeze().

A zero refcount in such cases does not mean the folio is going away.  It
means "don't touch me" and current deferred_split_isolate() doesn't
respect it. It can lead to unqueueing folios from the deferred list for
no reason:

    CPU 0                            CPU 1
    ---------------------------      ------------------------------
    freeze a mapped folio            deferred_split_scan()
      folio_ref_freeze()               folio_try_get() fails
                                       folio_clear_partially_mapped()
                                       NR_ANON_PARTIALLY_MAPPED--
                                       folio off the queue
    give up, put it back
      folio_ref_unfreeze()

The folio is still partially mapped, but it is no longer a split candidate.
Nothing queues it again until part of it is unmapped once more.

Skip the folio instead: whoever freezes the folio, owns it and owner is
responsible for its fate. It also covers the folio_put() case:
__folio_put() unqueues the folio via folio_unqueue_deferred_split().

Nothing is lost by skipping.  Everything that frees a queued folio
unqueues it first, and folio_unqueue_deferred_split() clears
PG_partially_mapped and brings MTHP_STAT_NR_ANON_PARTIALLY_MAPPED down
on the way:

    __folio_put(), folios_put_refs()   mm/folio.c
    __folio_migrate_mapping()          mm/migrate.c
    shrink_folio_list()                mm/vmscan.c

__folio_freeze_and_split_unmapped() does the same by hand, under the
list_lru lock it holds across the freeze.  A freeze that ends in
folio_ref_unfreeze() leaves a folio that is still partially mapped and
still belongs on the queue.

Fixes: 8422acdc97ed ("mm: introduce a pageflag for partially mapped folios")
Reported-by: Lance Yang <lance.yang@linux.dev>
Closes: https://lore.kernel.org/all/20260824131224.73344-1-lance.yang@linux.dev/
Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
---
 mm/huge_memory.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index ced400f72d43..6281ed993243 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -4590,22 +4590,11 @@ static enum lru_status deferred_split_isolate(struct list_head *item,
 	struct folio *folio = container_of(item, struct folio, _deferred_list);
 	struct list_head *freeable = cb_arg;
 
-	if (folio_try_get(folio)) {
-		list_lru_isolate_move(lru, item, freeable);
-		return LRU_REMOVED;
-	}
+	/* Lost race to folio_put() or the folio is under folio_ref_freeze() */
+	if (!folio_try_get(folio))
+		return LRU_SKIP;
 
-	/*
-	 * We lost race with folio_put(). Read folio state before the
-	 * isolate: folio_unqueue_deferred_split() checks list_empty()
-	 * locklessly, so once removed the folio can be freed any time.
-	 */
-	if (folio_test_partially_mapped(folio)) {
-		folio_clear_partially_mapped(folio);
-		mod_mthp_stat(folio_order(folio),
-			      MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, -1);
-	}
-	list_lru_isolate(lru, item);
+	list_lru_isolate_move(lru, item, freeable);
 	return LRU_REMOVED;
 }
 
-- 
2.54.0

