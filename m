Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329872;
	b=4TjdS7rZKxCfWzE+Nv381r2IEWZxNEf1fQH+uh3GGnQK3tzs5LOWX4UQBQZdcyxxZ4XN
	 lRcdNwncN1827D7O6qg1q+hMOjq7PGfW3jYyyNfBufvezVOS3lfQNI5A1cs4ksY2cAkWD
	 nYINUnFFHM4XhY2mYKZB5cSlniVyPFvXNtWbG6dDeigUKeaY4O0L4QJFBDbmRRd7qTf6u
	 CF6/EPRV+1QsCGNHT/wPWyzyfCdbhSavzjT/K/KiFEk1DJ5LAtIK+cCg8ZF+GjIyA+EVk
	 91MsmgHy88Kyz69TIF5IEp3p1RXBqhNJe6YueXirmIAHgUJ5P/RAetg3UBTq4mdnbXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329872;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=yX9hjizhMmy5s5UE+lA9T2wHanfAnmcASyLGAaLx7sc=;
	b=m8HXZbYh/niShnPYBqj+3f9/KxVfVxUaBfa6xYlJb/UFZxgqsXIBIQU62s7JkBdR9j4+
	 9RQVjhaA4mN6gH83IWLvxiQ0gBGhf84HzkwBLTiN8LuI6ulEtpogOZsaKTRlpI0vLxjlk
	 belQk7EqFOGehoeljmlge2a3fabBd9zhjQ4TWgaYGMSruZc9XQlMP9UNqBMPuGuPyjd+5
	 bxVD/qqIYUy/KNGESZl2DHxw21Sn16f1XTkAruYNiym57T3xLAFMVcrKR65Qo2xdFq5mY
	 kqdz0iwubr4z4JOgnpg8j4DVcopuH7TNGyhEi3hlOY18ErM0xsoT6bHhqPuvtJhO2sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZVw6VuAb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2289A606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZVw6VuAb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9FD91F0089F;
	Tue, 10 Nov 2026 16:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794329871;
	bh=yX9hjizhMmy5s5UE+lA9T2wHanfAnmcASyLGAaLx7sc=;
	h=From:Subject:Date:To:Cc;
	b=ZVw6VuAbWRO78atvQnc91ZRY4BJ+7QWDZCtCUZwD5jEVfpwEFaAffbw83L2cC1yGS
	 VKSN1m6CUvoWVZ3eLjKlsbIJoqMPQ6hA3qxvPaOpRUeZCya9oOB2ASD0MtrohvW6eg
	 d0vak2WgAM2ebTXLVS2Ite2zrZqGceW1wc6nvpTiEzA+shFb4sHoeR96Og7o66VSka
	 wge3RV1uFUttG+sGo0w8Z1MWguZPhgq4JAZOAhHsjMyjUd5cUXbQKSrL/TokKmscE9
	 jNKyKk8y0aPo1Rne3FvNjaHTiHtFtqpcSHC54OUAsKCw3gTMl16CE+uQ+ntkDzs3Jg
	 AxQgxChbkUsKQ==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: [PATCH 0/3] mm: only assert mmap and VMA locks if CONFIG_DEBUG_VM
 is set
Date: Tue, 10 Nov 2026 16:57:42 +0000
Message-Id: <20261110-tame-vma-asserts-v1-0-be293ff499a7@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMAxA0atIZgNtkSJeRRyCppqhVRopgvTuF
 sc/vP+CchZWmLoXMhdROVML23ewHpR2RtlagzPOW2sN3hQZSyQkbfRWHEZDa/DE7Aw0dmUO8vz
 Lean1A7kYkSNiAAAA
X-Change-ID: 20261110-tame-vma-asserts-480acf6aee20
To: Andrew Morton <akpm@linux-foundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Shakeel Butt <shakeel.butt@linux.dev>
Cc: ljs@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2282; i=ljs@kernel.org;
 h=from:subject:message-id; bh=l5iwL7Qd+mX6ZPWsXKwr0c6XQr5oPSXtaBAMqHbTYcA=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLI++/IclC+d4SBazfRe7PastMRCw0B1u/P9wdcOzPrEc
 rZlW2ttRykLgxgXg6yYIsvzL+L7g0TC5nVe8HeDmcPKBDKEgYtTACby6SPDf4fYQ39UapuEjI6a
 TmH6MKfq/CnRyokfmu6seix3wchwYjMjw1fV6ddD7SyWvt8r7t7xNGbKU/NYpXz/xVZPn3XfkHk
 TzAEA
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

Currently these asserts are all performed at runtime regardless of whether
or not the kernel is intended for debugging mm code (i.e. whether or not
CONFIG_DEBUG_VM is set).

These are explicitly programmatic checks - that is, checking basic
correctness in mm code which interacts with these locks.

The problem with this is that checks like this are generally asserted in mm
code using VM_WARN_ON_ONCE() and similar, and thus only checked if
CONFIG_DEBUG_VM is set.

So having some assertions which are unconditional and some not without it
being clear, creates something of an unintended two-tier system.

Since what is being asserted in these cases is exactly the same kind of
condition as those asserted in VM_WARN_ON_ONCE() assertions, simply
predicate them on CONFIG_DEBUG_VM.

Retain assertions for mmap lock asserts if CONFIG_LOCKDEP is specified in
order that expected lockdep assertions continue to function.

The VMA lock implementation already performs lockdep tracking regardless of
whether CONFIG_DEBUG_VM is set or not, so no changes are required there.

---
Note that this series assumes [0] has landed and builds on it. That patch
is the uncontroversial bit, this series contains the bits that are slightly
more controversial (but not really :)

[0]: https://lore.kernel.org/linux-mm/20261110-vma-fixup-debug-asserts-v1-1-0b2e0680cd7e@kernel.org/

To: Andrew Morton <akpm@linux-foundation.org>
To: Suren Baghdasaryan <surenb@google.com>
To: Liam R. Howlett <liam@infradead.org>
To: Vlastimil Babka <vbabka@kernel.org>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

---
Lorenzo Stoakes (ARM) (3):
      mm: only assert mmap locks if CONFIG_DEBUG_VM or lockdep is set
      mm: only assert VMA locks if CONFIG_DEBUG_VM is set
      mm: convert WARN_ON_ONCE()'s to VM_WARN_ON_ONCE() in VMA lock code

 include/linux/mmap_lock.h | 23 +++++++++++++++++++----
 mm/mmap_lock.c            |  6 +++---
 2 files changed, 22 insertions(+), 7 deletions(-)
---
base-commit: b82f7651c53524960fe38a54aa69677dcddff655
change-id: 20261110-tame-vma-asserts-480acf6aee20

Cheers,
-- 
Lorenzo Stoakes (ARM) <ljs@kernel.org>

