Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794793488;
	b=c5lA1DhY5HSTEx/Y9rcbNSUdzc38mkJ7r8aYJzHso9B87bcb7GuiRXgUnEx1QOpVzWB7
	 lvSTRmJushbFnVYdCfA58OafiTm07OicxxvlON0AOrgHhUt1OrLZRDsC5pLQW7HOjgEoX
	 1A8fJBez3d4ss/ExmA+SnKbigqCG8XrUl/N5o8YOrAPuAsXOMkFuPoi6W7Sfi6EP9V0fC
	 Yfk2XHWv8bOLaxxFBjmt5UrJYEuVrOMQmQFeNF07B8iVCzv0N+kcTFshQUYeuKPjrQHN5
	 2AP9ByjmxmAj7+CKizmdIPJmEjmbqQEJ3NcuYz8J7GHWuSIXjYI5P2Dw4qGTtdSodNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794793488;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=0H3osWMLtIW/sGVyOWkSlMGoRnGeburV1Z1d6wUanME=;
	b=QjXJS9VWbtXzdNKwNKnn8at861zDg7OjPT7FNft+lsMRN0n8OXBzlSE3qK7xYZZPEtuQ
	 3xqGW2ffShaY6nlwzmOChimgKc4dGJ1A1NFtmNtu5cq4KcnY64B5ecpIxkmzWURa0YfDK
	 kqXNxOeVJsPtVu5vCm0Zj3dRvxQrPJvS9pq4nwle0BuXzfpthmWSB5CrrDNH2YgavycRS
	 pTjoEvjRAa63oJzkzsV2Yyz0tR8r+zysbPuphlpL8xnXw4frP0F7kLm0Vawuaw+m6FUWQ
	 rHxhXGgajapdO36YEFW9q2WrCJ2s0yfi7AJ6h0zBlOI0MpKlWDjKFCIy8GsI+svSb1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="RFF5/+1/";
	arc=none smtp.remote-ip=95.215.58.47
Received: from mta1.migadu.com (out-47.mta1.migadu.com [95.215.58.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83645606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83645606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RFF5/+1/
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=n9g002gGdUvJhs5RK9AVAw1HkjwpmBlxvswaJ6Ry8a0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794793485; v=1; x=1795398285;
 b=RFF5/+1/Hrv2+IqeBltZeAERVGUb0LeWWYrRhnIXOSZSEkZnE6oEQznRlzDvycUFdIJoVZMk
 TeNe6RCDPEWRvx7jKjrfhfHg9OMb/GOJf3zM0WT2FyWACMbqzeUKtitqK61ohrkLZsWGOqPAQZg
 cAlIkj/nkoNbSuMHhdTOQOWI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 3d83a667f39792f3;
	Mon, 16 Nov 2026 01:44:45 +0000
X-Mizu-Trace-ID: 3d83a667f39792f3
X-Migadu-Flow: FLOW_OUT
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: David Hildenbrand <david@kernel.org>
Cc: chengming.zhou@linux.dev,
	ljs@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	xu.xin@linux.dev
Subject: [PATCH v3 0/2] mm/ksm: clean up scan_get_next_rmap_item() initialization
Date: Mon, 16 Nov 2026 09:44:34 +0800
Message-Id: <20261116014434.310003-1-xu.xin@linux.dev>
X-Mailer: git-send-email 2.34.1
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

Currently, scan_get_next_rmap_item() has grown quite large and complex.
When introducing new features, such as the only-merge-zero-page mode we
are currently working on, we don't want to add more complexity to it
and don't want to touch rmap_item structures to avoid unnecessary overhead,
so we need to extract some common logic.

With these changes, the entry of scan_get_next_rmap_item() becomes much
cleaner and easier to follow, instead of being cluttered with unrelated
boilerplate such as stale stable_node pruning and cycle initialization.

Let's start by cleaning up these two parts at the beginning (where I think
abstraction is necessary), and we can continue cleaning up further if
needed later.

Changes in v3:
- [PATCH 2/2] Initialize mm_slot = ksm_scan.mm_slot in the else branch when
              continuing the current scan cycle, fixing an uninitialized
              variable warning/bug (kernel test robot).
- [PATCH 2/2] Drop Lorenzo's Reviewed-by tag due to the v2 bug fix.

Changes in v2:
- [PATCH 2/2] Rename scan_begin_new_cycle() to scan_should_start_new_cycle
              and keep it simple (David).
- [PATCH 2/2] Keep lru_add_drain_all() in scan_get_next_rmap_item (David).
- [PATCH 2/2] Use scoped_guard(spinlock, &ksm_mmlist_lock) in
              scan_get_first_mm() (Lorenzo).

Xu Xin (vivo) (2):
  mm/ksm: extract helper functions for scan cycle cleanup
  mm/ksm: add initialization helpers for scan_get_next_rmap_item()

 mm/ksm.c | 101 +++++++++++++++++++++++++++++++++++--------------------
 1 file changed, 65 insertions(+), 36 deletions(-)

-- 
2.34.1

