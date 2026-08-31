Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71883C65FD
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167726; cv=none; b=e1Hg8hXmKxBFDLd2u4jQWvL8S3l7qbeAwjC0slSmtNmEs54mCA2483gt/wTux50tBSu4eewYi13nr8d5z6liCB1lh5bkVv0N+eA+2JROquX9buldn8NfOoQEUJz46ikQiKDG5NNDMxKvGicC4LGN/8W/kAU2uCmHhUdPnRoVjWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167726; c=relaxed/simple;
	bh=rsMSUDCAC2VBnP4NiLItYBwCSExo8OgHSqeD7DoWETY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X8KeI3KQqka3TrvbBPEpQYzAlAVwqe4OiTLm/7t1Ya15ci8o5iuIc9Q5o7FyZFsiddPK4VsC3f/mlDPDg+HhsukHFHXqJXVXmVn02iAmf8BfxTA/KtVFcO7sTla/D+kuyUjbEViEtU01zljelILn4tcjUbnprToEeKTk4l//oyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=krU9Kp1O; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JaIZ4ZlZ; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="krU9Kp1O";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JaIZ4ZlZ"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id DD1BB1D0013B;
	Mon, 31 Aug 2026 05:15:21 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 31 Aug 2026 05:15:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1788167721; x=1788254121; bh=47zEvEEejf
	I6CkwDkb4HrVK98gd8CjGifPChtTFi0Gc=; b=krU9Kp1O+XsnhKnj0uMYAUDAYe
	ltUdOTaKpjwOJ7fFyk5l5SMo1pjfBkCyi22HxeKU1Or9YlH/7g7oy1Qu07EcuJj7
	gORts7nPSRq+lSihx89uGbL4HICzRTSeNzFWB3H8j8Q+je++jCJFkobDjrHiBFKl
	Cbw0xGeAhj6rMSre+RuonffG2ZoVYZhQYj3VvTYSuhJoj1MEHcvQwRnTFtnngUnR
	KqdDu2lvlUkvPleWk9UVePpRJJIwiurTt8hhMCSTL2vHd93j020QqtxU3a0L9GSa
	QxXZ5QUUExgQDanpkhOHLEgwb81U8/ZvCTo3oNs2yIH8L4yX4MECzpDJ5iwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1788167721; x=1788254121; bh=47zEvEEejfI6CkwDkb4HrVK98gd8CjGifPC
	htTFi0Gc=; b=JaIZ4ZlZFRs+iz25xK6i3plYlwDb3wqwsIzWHXvhVYqcOojnA91
	QvqzMK8Uod47E+5uogwLLKnB36XDXpf/hmgDqg5TnWTtpavk2yYqs9R3mNc+oxpj
	BwC1PeHpJ5hdTA9R0nsAjAqGTtbxxcvrsVUipGhDCNz9PHak4/KHjpThECBiRZNU
	UXwxhTETI5JfeP0RkXyawFcNxP6ZCjc4KEiFtS5y6PxVcpyf1rGznFOB0IWiFbOM
	9rOcZClLczXCkm29web6+phzG6xlOPz3wIl/g0296hcBW8ISiamQcCDlUYDL/caX
	rIeaUQbGmmblUqwS19K/3z+BP8LHmmeckEA==
X-ME-Sender: <xms:KEaVapcqqqgiIScTP24N-Ya8c4Z_7C9bdi173kqE7IM1bwk-hAbz-A>
    <xme:KEaVaoljBkp7TDfm3VD4L18_NFl-2tbpgBNr_E3MnF9Swmja6pU3Sg1m36YlytIhA
    LTpFXig0oEe78e-iDW8nmK_b_Zu6nkMujq5ZMAVmAueKw-TfWMiGTs>
X-ME-Received: <xmr:KEaVarw2KG6CEfgXwmSichqEldttFxwlsjnOkddyIKzNsWY0eBayuM-65GQ>
X-ME-Proxy-Cause: dmFkZTEwmsnyprdy3iKVf9do7GG1Tdq7gTCVLlgh1ALuAyDZgoqCdetVYe8dJK8LfV9tmC
    35+Lf3uNDBO1aC3hEH1D74pFyjreTzNcjNjpnhAomht74lz/5Jmp+sWsHBmINhaoLDVNzG
    FkPRyHyy5kKBTXtsYzgrLIEBPT0ZOAIJJ+hjlad67SJPTUfA+NRg8f3BKJDvJTIhCCoXzx
    ikWrduxrsS7ksf2kwrCrofZ27omH8pbRDSAi9/wue8aNOruQrHXZtZ+4bpqByQLuxMlOnf
    yeILebFCMGA/wqWr01K7xeT5XaFs/srEFo4F4t76Gjja3jiO/mmZUBWIL4GStDCddjvknj
    eJe8qOqrogQocLvrEmVOSqCGzyMomKDShLZ2eVje73Gb5henYbQXX6ni4k38mf+APtYGf4
    f3Mv2UsM4asTuO5m/dPQidZK5iLUx7wszGKHaouh5R1UhErsx9n1DiLj7NiGitxNBVOms+
    2DNpVuCW3QBkaRiqN6ch6ZIi0ngPxJoM62zypzNv0OkoqRuzU1+1fcLGwbVkUkx0w+RltP
    lVUcoc9QahwzDwgvSeVisuijRMHHJUo5LVVW3LtPoaMp66Wi042BdDWxMs9ijPDz8VQ3L8
    Nv+t39WrWU2IAcIhqsMD1MC5rCK78619xxF71XH9vnQndBzR73w1yOJZiW+A
X-ME-Proxy: <xmx:KEaVarPskolEGc05gBNhclGSdc5G3QxPu25DQxdwuLrTnfwPPQpkvA>
    <xmx:KEaVasij4RjkF4QL9KuJN61uoAu5_2zMBqLoURhsOOCybz6JKhAzRA>
    <xmx:KEaVar_Je9KZ4Lte8KgLJDram6xWSpo5pdXkSC9uLcU9sfTavGhSUQ>
    <xmx:KEaVapLS-SUNcBxMcgpF0s_9iNAqhMHaTZkmNWvxlVSfjYojVFtqpA>
    <xmx:KUaVavha6gglV9F2Lldre_ahD5eEYlq-1QOFe2ySkWQF2V112UYwZa9l>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Aug 2026 05:15:19 -0400 (EDT)
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
Subject: [PATCH v2 0/2] Fix deferred_split_isolate() and drop the split workaround
Date: Mon, 31 Aug 2026 10:15:12 +0100
Message-ID: <20260831091514.1879786-1-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

deferred_split_isolate() probes each queued folio with folio_try_get().
folio_try_get() failure is treated as a lost race with folio_put().

It leads to wrong results when !folio_try_get() was not caused by
folio_put(): for a frozen folio, PG_partially_mapped gets wrongfully
cleared and the folio dropped from the queue.

It came up in the review of my collapse RFC series:

  https://lore.kernel.org/all/20260824131224.73344-1-lance.yang@linux.dev/

The bug is inert in upstream code:

  - __folio_split() works around it;
  - __folio_migrate_mapping() freezes a folio it is about to replace;
  - reclaim freezes only what try_to_unmap() already unmapped.

No stable@ needed. But my collapse rework steps on it, so it is worth
fixing.

The branch the first patch removes also hid an inert, pre-existing bug in
the zone device path:

  https://lore.kernel.org/all/20260827163838.1813081-1-usama.arif@linux.dev/

The first patch fixes deferred_split_isolate().

The second patch removes the workaround for this deferred_split_isolate()
behaviour from __folio_freeze_and_split_unmapped().

Tested in a VM: split_huge_page_test, folio_split_race_test and cow pass.

Also ran a test that leaves 16 partially mapped THPs on the deferred
split queue and drives thp-deferred_split through debugfs, checking
nr_anon_partially_mapped.

v1: https://lore.kernel.org/all/20260826162101.1314941-1-kirill@shutemov.name/

Changes since v1:
  - Spell out in the first patch who clears PG_partially_mapped and the
    stat once the shrinker stops doing it (David Hildenbrand).
  - Add Fixes: and Closes: tags (David Hildenbrand, Zi Yan).
  - Drop the three __folio_freeze_and_split_unmapped() cleanups: Kairui
    Song's swap THP cleanup series already carries the same changes.
  - Collect review tags.

Kiryl Shutsemau (Meta) (2):
  mm/huge_memory: do not touch frozen folios in deferred_split_isolate()
  mm/huge_memory: dequeue the deferred split after the split freeze

 mm/huge_memory.c | 63 +++++++++++++-----------------------------------
 1 file changed, 17 insertions(+), 46 deletions(-)


base-commit: 33f61b12d297562321533c048e034b1fb21c1cf3
-- 
2.54.0

