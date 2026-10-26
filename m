Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001788;
	b=0Kxxj7ApGLudCySNZjrdq/vE/vt4qAFBUOWnoSegl7UZOBMVqDNVbbElurtPuA/9m2q5
	 bXfhjxolbhxqqDWWDqZRRSjhvNQI/gCBfX6tijLkgbyxZWuZD6pX+2MEFLC7wFWnkpiRS
	 t1ZVsvlL9sO+TLYoR0kWc/GbD4Aq7PG6V+Gevshw7tDSRizNW9mzlMZ6JTxdt+ZsduAia
	 ouYU8ILMYGuuCud2Jej+YCWBSLASAKmawR15DSwvfx5A3QaPqCT7CjdFEqpZfgyoALSc1
	 XfHQ3XDgMIY47mzKDHYhUjDqQkoNMWPfZVAmz90Haa5YCbe1hlNdWLJDUqIDWpQt2Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001788;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3Fm/k61dAGn6pWXm3A71qaZX3bTJAZeBybYud9pjwD8=;
	b=z0sNluXP82IfEuutNoqOr70CByYaGpBfoI8HcIJH6n+DdwhVT/OWLoRD3ImXzldg7A8S
	 UCm8vUypuyoNWSCIbsiujbmwfie3j/1jmzjK4xeFquz06d1KCVeFULShw6wAXy129m97g
	 DxnRfNs4tIIjISwQOHrQ27yZzZNNRJiKrad0hYI4/5SmRsY4pmcS6nwYYx4r2MIdRNmXb
	 ocNzBKgCkdhLvtpa7jMTAnGv4pQBY9wU9b3bgzZQetvVUnxBK0kKzH5EeqqmNmGkImrDF
	 kPoabcKcowQV5h7U13sHwiwZiNFTKJfQWvcSMDTZctdlpZ2Qn95RSMkJ/mxd+phSP8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PfQi0cRB;
	arc=none smtp.remote-ip=91.218.175.111
Received: from mta0.migadu.com (out-111.mta0.migadu.com [91.218.175.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247CA606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 247CA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PfQi0cRB
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yF6bL0ko6Nsx9Q9DKdGf/DM9nR/ox6wnvQ6I+8xeA+o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793001786; v=1; x=1793606586;
 b=PfQi0cRBBGZFWttKVEVfRzvSfFrnLLjC7/JTTq2DHpzdWmyT6Mh/QR0lNmPkw11bVjIQz+nk
 mTNYLHfBiOxipL59Yol5IfhEFT/g7l4d02R2/Adl0qbMgWxmQ5mr2+mCIVDUiPGxoGj+Nx80R73
 /3b9NH1iAcXjd5lmT0IUZBPk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9a29ba5e27180e69;
	Mon, 26 Oct 2026 08:03:06 +0000
X-Mizu-Trace-ID: 9a29ba5e27180e69
X-Migadu-Flow: FLOW_OUT
From: Hao Ge <hao.ge@linux.dev>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Hao Ge <hao.ge@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>,
	Dev Jain <dev.jain@arm.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v3 06/10] mm/vmalloc: reject empty and unaligned ranges in __vmap_pages_range_noflush()
Date: Mon, 26 Oct 2026 16:03:25 +0800
Message-Id: <20261026080329.140244-7-hao.ge@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261026080329.140244-1-hao.ge@linux.dev>
References: <20261026080329.140244-1-hao.ge@linux.dev>
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

__vmap_pages_range_noflush() expects a non-empty, page-aligned
[addr, end) range but does not check it.

An empty range dies in the BUG_ON(addr >= end) of
vmap_small_pages_range_noflush() on the small-page path, while the
huge-page path maps nothing and returns 0.

An unaligned range is caught by vmap_pages_pte_range() on the
small-page path, but the huge-page path misses it, because its
chunks are always page-aligned, so the check in vmap_pte_range()
passes, and the mapping just starts at the page boundary below addr.

Check both at the entry of __vmap_pages_range_noflush() and return
-EINVAL.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Hao Ge <hao.ge@linux.dev>
---
 mm/vmalloc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index c0f33392c6ad..4d74144dfaff 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -698,6 +698,12 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 {
 	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
 
+	if (WARN_ON_ONCE(addr >= end))
+		return -EINVAL;
+
+	if (WARN_ON_ONCE(!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(end)))
+		return -EINVAL;
+
 	if (WARN_ON_ONCE(page_shift < PAGE_SHIFT))
 		return -EINVAL;
 
-- 
2.25.1

