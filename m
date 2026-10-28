Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194008;
	b=XVAiP9ksUZItfjNJO6L1UBktHyvKP44C0W2jhqPbmfwKBzpLbi29eVngN/JfN4LBU59x
	 lE15CWiYhOqtghRUAH9Fltt7siXZflj2A/9yrweugaTKhELWOC741XLn3vyA1YHBuqykk
	 glNQN/r3CdM+eF3MRK0To3GRCW5lMuEf56nDaSvgYDjFe7WQG8suvk/4UxzUd/+qyB+fq
	 EdEVZ2F0UnELQuHMq5Thdnvo6/dpBEMGcvSEM89YpY3ZE0T05akpZtgCkoA54FQnnBCYn
	 7vaen+c4/sEkC3+ryX4Yyh2qhX+E+TMIJIa5p/6xTz+yISbo7iRick5trfRt2M+Pq/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194008;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+BFs+a/yE1nGxZn4Kjy6BKUgF7WYUxZLCCRtW2ZfPxQ=;
	b=4KNyn6g09vAYgJbckz8nzYASPNsTQdAmIi3AcFce9NlyL2zTaOxxaE2VbZyT76x8rl3l
	 fhdDW0NBP/EVSH12u5iR0D1OdO314oQQQOERalQ8kk4tDXRjVL9gq6+v5P4qSHDqS+d3y
	 kWuFnsqTEN9Em6vOeTaXX3JV2oYPwECJte2rUueFOKuD+0Db+EVBow37B52BfCGiIBvwL
	 vDoSnry+V8g6/t6oAm/QtPctC18N3ZhHE/SOF4CVKRb3KmMmq6UgATkHqNxfs3kkf6wPV
	 7+88cZ/76Y90KlMCi7Q0nuVqXzdLZmnifFqWdCPDHfnlDQj2vxa+lLMAVJcRR7IwEUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=shutemov.name;
	spf=pass smtp.mailfrom=shutemov.name;
	dkim=pass header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=wkN1Gghj;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=gLG33pWn;
	arc=none smtp.remote-ip=202.12.124.138
Received: from flow-b3-smtp.messagingengine.com (flow-b3-smtp.messagingengine.com [202.12.124.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A98606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:26:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98A98606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=wkN1Gghj;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=gLG33pWn
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id E7FD61301F28
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:26:46 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 28 Oct 2026 09:26:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1793194002; x=1793201202; bh=+BFs+a/yE1
	nGxZn4Kjy6BKUgF7WYUxZLCCRtW2ZfPxQ=; b=wkN1GghjUOU4F4acB0AlmTxl9y
	0yTt40b5LpRv1IyQGrVBq74PpASjIFdep+ZW7S3LJLWeFMUKLbEGhi4tbHrIhan6
	8m2B5+pPfBHbGy/wLHj4N72PD3/jmpFAwwNGj+KnzrH47v//J+jU7ZxbjoNCFjmf
	W78IuDxHnF8oamkmDgwzPjIM1aG0JXSAswPCIXlrKaVz9QfWBZmRDnt9sa+QXs7G
	XlZCD3qHDOQewi+uhmVZ3EEyGarE0GuQrHWQLuTbF9aNVa4hE4szZbNX1/1QvVZz
	R8fyNUl18KNiynR31x0WF05dO2NUVOYfUSmU/PIukqCE++4AvxyxfOpYutMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1793194002; x=1793201202; bh=+BFs+a/yE1nGxZn4Kjy6BKUgF7WYUxZLCCR
	tW2ZfPxQ=; b=gLG33pWn6C0LwRfwWzVPftPrqGRWt8oTxgRUePOlvzQjP3EBTd+
	yaYsql3MmCYDEw6Ldth6Cb9tvvfBbKpnLBMRuYyw2cY4Cm+ooXXlPrkRBpTougBE
	7CfEA9JEvvJFumr4M+ND64wlDL6nqNF0khpFIQIjLsF5vGbhwWojy4scPi6qnY0G
	Ary069WMvbNWIaEsgebfBWkp2jWnX6YiKPrrXOult7iWuOVMzjWZKU+RiJ4/eK/0
	Vqac9yzvOmDQVQpc3GUyhXRXSXegMkI02NWTs65VcEE83B3FoapqvjpsqtbSdx5h
	HjAvuuMqU9C1uP8Hqkm6oifyPqzt7FH817w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793194002; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:cu4U8CayC8kC+D6q2cVmxbf0lDeYvE4rYK8eXvw5Tc+jgj6
	N4IEAz9jyGBAZ4ZFq9N5Sat0TaoLXTBmJLMR23zomxyCYwUjpyi/BoJ8pWB22jGH
	7zTNyEknBtd1HzvjLjeSLsD8FXI0IKAax/yzOv8I/A30L+CGxzde8JRoH5Ztxx6N
	q1agbaWodyReEtIXvwA7zTmT+torAVfMEP2EfsJiwpL9kWWGnbgcf04dlB6QEwoZ
	ec91mLzIo5VCSrniAXberUYQLuWmCtTI2VkiPV5FTNgF0UjtfBxJdx4eD7vo2tqa
	PdWJTgGp3T1x6ffdws59y9K6jC+KkvQhD3mXBrw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:CH1tYYxykiIv1RLbCWw0YN5CssjwRZjejHr3tQ/GpnI=:VtQAXVOylUEgwRm//tK+opODqw4nrYRdQrF2wdKvBdw=;
X-ME-Sender: <xms:Efjhanh5htqG8JCU2f6tlaAll2oSa5FQV43VKyS3wwu5906H23CzuA>
    <xme:EfjhalE_tM76h_E6ctMoTrbM7yWwIevZXFIlB3juK4oczo3kYcSrTViNG6U6vmO_l
    PrMJWCdeNxDCJXRskufFlJ25zO8h3Y_4SIxZXkonu807FGNwVFrdzWy>
X-ME-Received: <xmr:EfjhaqCQ1cZIO6mEoFmJXasBaAttfK1ApobCMb2e_9Lc5iZP-xNBxOa1fbI>
X-ME-Proxy-Cause: dmFkZTFyZBkhzb8SJ3YurTz98jXoxrAYOSV6yvJXRkVCXWaX1UL6gXkfeoPA0eMvF1lpuQ
    YBehhHfXX0goLqnZWpor4J+CA9nfDYcgen9bxZLNA4gZVNkJzFVOOYyecKuMf0KPmk/WLy
    JABIbxkhX9UHWkNp64tDUxgce9NDeYLNxymsnr8Hh/OzuhGF2+slL7brGNrL9pr1t2ELvK
    XsBOqImIT0qtCqdOBMOFTTZ61MmNHlUFJ/kzF0URLFhZauZ2pkQvlIuvuOnUxfrNMU7a+N
    UcHWrfGWxTSLefU7DxGYs3ZV3tYCoVKxGG9z3HTf9uDp77sbcc4ixgm/1kZT21IhPjp+Fp
    8KnC6XRNhS4bo7kA/muidgelZi4875pDDSYiPyQ/Zn+/DOTX0BqdD/43iWaz+jAyqlPn8w
    k1UJ66hPG69/KHz7e8K4GQJ2bOP+g8rV2N8WDJ4RaA4sJpWliaD3mQeYqlfjmLZ9HStiyZ
    XZyln2pmhbhaWSrEa00xpS/NJV69LYKv97pV/bsYUqlWf8mx5qaKLgOtldY/pSb1rMO9JE
    xheZTQ+DJiOFlKvo8SuDpV52pauwIBMufdYOYB/RzDOYWaSla8oYBYoyU75bLXG0KUxZeY
    iroLB1cSjbkH0PCOx7ZNOKrqKZBXQpk1d8aQ1M9XsaZVdy7ggqVxdKtOqr2g
X-ME-Proxy: <xmx:Efjhah-aOO9V4alyJtpFxuAMfr2KObqtG90118qB0jwL4ttCRd6Ltg>
    <xmx:Efjhatg0dspY4E5rJ8jB8YMbvhqRgAiMn6tmC0Vcgd6Amcg8IhKPGA>
    <xmx:EfjhaqYoM9m0ohZrCVp0Zn1AjGAP2AW2GUo935TLng69la39mpqKtw>
    <xmx:EfjhavTKGQkS-Eb9aKaipRWkzgrOYsM8tNCx1t_HmgPb_CaBNajTog>
    <xmx:Evjhai3mtA0pM0HaRzlpwvsJbhZTC7pjdW4PIa6myL1YwZeWqStRDh-0>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Oct 2026 09:26:40 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Kairui Song <kasong@tencent.com>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Dev Jain <dev.jain@arm.com>,
	Harry Yoo <harry@kernel.org>,
	Usama Arif <usama.arif@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 0/3] mm: make watermark checks honour ALLOC_NOFRAGMENT
Date: Wed, 28 Oct 2026 13:26:34 +0000
Message-ID: <20261028132638.2560361-1-kirill@shutemov.name>
X-Mailer: git-send-email 2.56.0
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

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

With defrag_mode, 64K mTHP faults under memory pressure stall in
compaction 18 times as often as without it, and get about a third of the
folios.  Dev Jain reported it [1].

The high-order watermark check counts free pages of every migratetype.
With defrag_mode, every slowpath allocation is ALLOC_NOFRAGMENT, and a
request below pageblock_order cannot take free pages from another
migratetype's pageblock.  Under pressure, that is where the large free
pages end up.  Two callers act on the wrong answer:

  - direct compaction's up-front check returns COMPACT_SUCCESS without
    compacting, so compaction is never deferred;
  - direct reclaim for a costly order stops early, having freed little.

Patches 1-2 give the check the request's migratetype and make it skip
the free lists the request cannot take.  Patch 3 tells direct reclaim
that the allocation is ALLOC_NOFRAGMENT.

Dev's benchmark in a 7G VM with only 64K mTHP enabled, medians of 15
runs:

                              defrag_mode=0  defrag_mode=1  defrag_mode=1
                                                            + series
    compact_stall                      1690          30669          7366
    64K faults allocated              20750           7391         20129
    64K faults falling back to 4K       725          13832          1339

defrag_mode=1 still compacts more than defrag_mode=0: by design, it
keeps 64K faults out of unmovable and reclaimable pageblocks [2].
defrag_mode=0 is unchanged: 20698 64K faults allocated with the series.

[1] https://lore.kernel.org/all/4aa14b41-9b89-494c-8825-55fffd5a541c@arm.com/
[2] https://lore.kernel.org/all/auCDnqJc7fsBpUW2@thinkstation/

Kiryl Shutsemau (Meta) (3):
  mm: page_alloc: add a watermark check that knows the migratetype
  mm: page_alloc: make the high-order watermark check honour
    ALLOC_NOFRAGMENT
  mm: vmscan: tell direct reclaim the allocation is ALLOC_NOFRAGMENT

 include/linux/mmzone.h |  3 --
 mm/compaction.c        | 16 +++++++----
 mm/internal.h          | 10 ++++++-
 mm/page_alloc.c        | 64 +++++++++++++++++++++++++++++++++---------
 mm/vmscan.c            | 24 ++++++++++++----
 5 files changed, 89 insertions(+), 28 deletions(-)


base-commit: d865f2677c44cb2171b833d6775cf692756fa8be
-- 
2.54.0

