Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE13463B60
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761274; cv=none; b=chu5gsAO+hKSAIoHHDBnOXiXu6qBVswYaUfCEc7drYayFuMxhbjyBYcWAGri9fpd6wukVgVG52yT44nIvt7N7xuWGnf9QcUoA2JLdObYvxUc+dkOrW6GBw25HeSZW9S6XfM6o9NAc1h3ReMbwA0+R3b0xbWVFQXXKO3+B/XwpRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761274; c=relaxed/simple;
	bh=QQgHgspM1/eGjoz2/XWrLFkLlJAF5sIRawerbKeJyJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aokL7dxlFRyz7LoY+bHFiAEqjwkJU3aaBSC7BJGQBGKAcKgqdk/mCVzLsFo1vdBb9VCj97e+3WnVe5p2fhIpMuKYbZN09MS2kyCmNHokLllz8kp5TQPQxipzSqX86zOjIhc32kZBWWuVbjbgPcJftj5qBPDxQSS8hcP+E5cUbvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=bi+kc7S0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=H4drzaP7; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="bi+kc7S0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="H4drzaP7"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 30B081400197;
	Wed, 26 Aug 2026 12:21:09 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 26 Aug 2026 12:21:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1787761269; x=
	1787847669; bh=Bv2FLl1ikHMiScnydjr4vJ1LmDfldI8n6iuNGCnTKZw=; b=b
	i+kc7S0ld/EJOGlID7nHa2apNgtC69ZYY4g3eOsBEQl5Ce7G/p+BG70IJxyccwER
	xIxYoj/GeOzAQ/QwNGH/A8Up7QN1YoXXZTpR1hho1ZGyVF/jDN1mUjWshGPY7Afb
	foBsbqmBenqWmJvnug5fGv/ZXenhtW/j/vldCSqq8Ybsv97Nqk/HUibjrwrpUhCu
	byo9JSmgzenmZW8NOmI5GwHZB3uP6wc8+Bp8XsLhtgNLME08Wu2ry24uLqMqjOL3
	cOqfp36UHTWya5mNoJTswJ9Ah9Lguj4T/9MKcZL7iGM8Bi6XnBQnRU1PUPyURFpm
	i+XbOv9AE+Cb06F3AfuwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1787761269; x=1787847669; bh=B
	v2FLl1ikHMiScnydjr4vJ1LmDfldI8n6iuNGCnTKZw=; b=H4drzaP7J4XHlzvKC
	2h/dA0kWrlACAxqOyCDE5FwFYfxKRCivUfdy8c4skJCxNvsGKSxNFGYEK0AxU2xv
	x191DX0yjQDTfg+WjxR3d2lnHvz87miO++1WcsadjLzKfyJ45qA0rpjpoLDpKQSK
	d5F4IfqjBWHJcNyMmGE/0Yjsvk4S0LOff0UhUVgioZ/iBgso23ERHivlTHMmbzTM
	O7YOBG+Yhaws0DUsh9rK3HG9RD5xBLJakLrRaYRqnFjsHRGTMK6i+xlAgFFZF6dA
	LdrOdmHnGd34esDwjvi4rTnZdmdZCJaOfjd28Iopbr+DYRckSQ2vuuBDI8abSGtd
	n5I2Q==
X-ME-Sender: <xms:dBKPal7H1olP2_Gqhn2UH1s6rv8obdoEc86GuvYXsYGmLMeL8ufWrA>
    <xme:dBKPau0Vfj-sMLpxFGSW7MIe6R31mG09j5QWYJ4bzqLfyeG2PsdQU3qo8jdkSz8gw
    aiMNE5PdpxIkNIIVQSsKxpUZefXYmc79eTcp5D2a9SV7Cl7PRDEW5A>
X-ME-Received: <xmr:dBKPaingv89MNTLj5awaCDVmX1_KnwL_NzO2HdV-dUA5h2cppm32IykPwbQ>
X-ME-Proxy-Cause: dmFkZTGBpY7kNoX77sZdPDdL91xDvRNv92b/+8WOYmCGA6aQH9Q102aXniwcYcn+2R3bEj
    uCi/l1igqxgbq+7uoWVnSfVnmmWrLGz8UPAjIXOdULdKf7WqwDtIartGLCCo68+ug+tCv7
    Ph9+mj9AZr2Dj3uoVsu8zcjpqcESEL6Qo+qhix3q57KDkOugB1EyJGuvn3/JCvR9j1Dad7
    o+mC30PVOUmdi3WxO4xeazK74tOpUh5phSdSI4XIlRDA8FYZNVwP9p7PMSP1kYV7SphUR1
    NVW71rOnvC5bor+jWHffeUW4ibVwJbIPbYc8TjXE3UYxed4i2ZOZ49wwSEox1MjCbLFsSu
    YPKLkIkQUnFzSfmoRy09Yk+6QAiQBNOL3kgRmFbcNEP+pkMk0/HwajWkkbMvDEzbG7ih8j
    9VmjLPs0GHvU90MMBTO4IgmRP25L9euMYxF42Qnlcb5IJB4Yj4FWrmjvmydrOhYwH4txfP
    N0sGRbfkIRMlAotV03Pf6h+qHYq5kx1wkP9qeFqLirkNozh7KFRsFG0POuQgSn7ocDa1Tr
    TmxNd75KRYhV/7XI82QPUB5FHfaJr/hNTvoz7JcqS8jlcKPr2c1v9a5pAB6LVmnBUD8ljB
    fRa/pR5DZ0LmzlPvoYi11c5SXpBp1O9ry12oYVB9BFPnFUKCOwYend85kwgw
X-ME-Proxy: <xmx:dBKPakggiS7Gn5F5p9eYQauGaQnk5Vgu3a4O3IQxeIhvCJxmP091tg>
    <xmx:dBKPanQhg0Kom7A4zV0NXiVbfFF4g2eYoyOrw2RpRj6rAXxfgIkt3A>
    <xmx:dBKPahgS_C1KAEZCP3e_-StlPxcng4O78xp4py2uC2-BZHPL7QqL_Q>
    <xmx:dBKParhjVNU9I2uSccGsCJ4JLXu9I0C_VM_YmV2l5w-E7wgxtadjxw>
    <xmx:dRKPas2A7RQCxvHf1KcXejxmQ7gw1pk4PRb9bbbj6P3quHoQxDVJgXee>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Aug 2026 12:21:08 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	hannes@cmpxchg.org,
	usama.arif@linux.dev
Cc: lance.yang@linux.dev,
	ziy@nvidia.com,
	hughd@google.com,
	baolin.wang@linux.alibaba.com,
	baohua@kernel.org,
	liam@infradead.org,
	nico.pache@linux.dev,
	dev.jain@arm.com,
	ryan.roberts@arm.com,
	balbirs@nvidia.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCH 1/5] mm/huge_memory: do not touch frozen folios in deferred_split_isolate()
Date: Wed, 26 Aug 2026 17:20:57 +0100
Message-ID: <20260826162101.1314941-2-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826162101.1314941-1-kirill@shutemov.name>
References: <20260826162101.1314941-1-kirill@shutemov.name>
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

Reported-by: Lance Yang <lance.yang@linux.dev>
Link: https://lore.kernel.org/all/20260824131224.73344-1-lance.yang@linux.dev/
Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
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

