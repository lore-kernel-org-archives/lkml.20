Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794729529;
	b=wL8XoryGOB5pZgE2BjabcQzCpgI2Kg87gy5iyx/tL5uSJFPvZMPEQZaUygmfYQC9l0Vd
	 ifbav15rzAVy1toNjwFVvQK73b75KF5+fXXJ7Xu1pr5rMgPpJOB4pJvz/ZP9UB5jQ7fu7
	 QCSoSczoa21iOHvG4D3SMVL6X64h8uGLac0p08lv/PIrVnEoiLw5r3D5C1K55DL6XTB7v
	 atQT2DZN//jQDG4GbkUQHmopAkz7Aaf9Y/vwIf0mIcvCXEcWQctLCarUXXA5VNRGzUb+V
	 KqJPGCmeoOgJThoNu+eLpS8cHpvGvJvrYB2o7NKVFC2lEgNH9bS5lgxU9+bkUcWCgCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794729529;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=GWTDxYXkosCm/4nLdsWs8v5Vb0AUZr9LNbv3Ex6rAGg=;
	b=oqTR79ssdhWm1lTftjm8l1EPZAjKfqTPNqtxCf5Bhimi3FFEU8Mf428/w7NMhT8Uuty7
	 ITqc7s1b3eBN6uu85fKUHEyzYYPyvduABAW3zfyxQVhamnKCG0WsSqfGdGjTktcDUKp8Y
	 9r9jo/uU3W/4v+ftNIIBqQcfJjB0N0IXOW2uvCoA+tDXT1eRhWcgXbpsZFYlSpmKPUKJa
	 QJ/+3jyr/x17/yWPtuwEd2dqghpjtYF1C/I6qScV2F5dyCbwjIS6QXK8xbrazOIJtbik5
	 ZaCb1BFJIjeUPXTeS+e8IOPapmt3+Tx4HbIbm6TKDCYzUiW2H4giVFkCJnMWOEaHcxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AP3e9CWV;
	arc=none smtp.remote-ip=95.215.58.161
Received: from mta1.migadu.com (out-161.mta1.migadu.com [95.215.58.161])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06697606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06697606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AP3e9CWV
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rgg6s0ozTHu2TZmu+4x+Y8upPU1pTz8M7b83SmtrD+0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794729526; v=1; x=1795334326;
 b=AP3e9CWVGhqI8jrQgcTRPlyQdhwR0hejiyWK/WKsIuPolg+slW4psDHWQDNKSGTJisbfGTdL
 0IiflADjZkaqyi7r7g33ifpZhFfzHbWwXaHmL9k4GpWe5NpDcrUs6CUw/zMgpCPa983ZpnDWRHZ
 qwSkv/SwBhwHNL8gQOTehhoY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 64c76c5826d27005;
	Sun, 15 Nov 2026 07:58:46 +0000
X-Mizu-Trace-ID: 64c76c5826d27005
X-Migadu-Flow: FLOW_OUT
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: David Hildenbrand <david@kernel.org>
Cc: chengming.zhou@linux.dev,
	ljs@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	xu.xin@linux.dev
Subject: [PATCH v2 0/2] mm/ksm: clean up scan_get_next_rmap_item() initialization
Date: Sun, 15 Nov 2026 15:58:32 +0800
Message-Id: <20261115075832.132109-1-xu.xin@linux.dev>
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

Changes in v2:
- Rename scan_begin_new_cycle() to scan_should_start_new_cycle() and keep
  it simple (David).
- Keep lru_add_drain_all() in scan_get_next_rmap_item() (David).
- Use scoped_guard(spinlock, &ksm_mmlist_lock) in scan_get_first_mm()
  (Lorenzo).
- Collect Reviewed-by and Acked-by tags from v1.

Xu Xin (vivo) (2):
  mm/ksm: extract helper functions for scan cycle cleanup
  mm/ksm: add initialization helpers for scan_get_next_rmap_item()

 mm/ksm.c | 98 +++++++++++++++++++++++++++++++++++---------------------
 1 file changed, 62 insertions(+), 36 deletions(-)

-- 
2.34.1

