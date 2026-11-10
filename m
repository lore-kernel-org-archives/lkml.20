Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329875;
	b=SeOiMVNQSUS7xiHEBktfwHokqGPrS3isT48TGxOMJs+C8bfTCQebkx/ZtBpy12vhbCc7
	 2rVOUf7XrSCdDg6pzCNeXJdlxqTIeRAgwhDplazUeS1FhmysnKDDm2sftkYghXF1Hwo5o
	 tlFkXKtLKfso9tgltkpWpr9giJpexRbgTBpReZawY2m8aXgUzIcX+fAl3zQLfiU1X0mF7
	 UcIx/S1JTNypSF3sLJ3uvvQftbthXI7czXpnW3LuWQihrlBURvzOLurgqEPflhtd7NT3r
	 vMhno6lN9MuwCnyYj6BwaFpL/lQf5Mot+dv8Pi8+icUT1z+yOZef+czVyvTOd/9pekQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329875;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=t/rX53MCK+F8+8pu8v3hRh+esRHjUU6DuquJwjMhAJg=;
	b=LHBq1PCOqwC3h6XQMJ+UGoLaS9VXYvI4AIG5HoauF6ByO8j8ewSYaoJoMVlVcyfdWmQD
	 fVy4Je13wURe1ObFKaTGJK/BvBwJo+VAHaGwRmC1kBJpqNskuqBi3VGzFqJb9Vht/rrHk
	 aROFtdiQUuYZaLxufgmMEzGPqy4hTZOjamTghZbo/ixXvqZkktdVwuzG/lGdtQp64Mfbj
	 Mtyh78YVAuf9mAhyKqAZOtWj/Ar27yBlrDfH27ON4975leoA/1wwSvX0V3+3xXHmH2X+0
	 NRE1+b7Dfkym+f6M6zMGAMxyI5iPniFRtUOkOy3ZroYjS/fRiXlTCrLVfuxy8hnDq6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Y8UyGd/R";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CCE606A826
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y8UyGd/R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 606831F008A2;
	Tue, 10 Nov 2026 16:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794329874;
	bh=t/rX53MCK+F8+8pu8v3hRh+esRHjUU6DuquJwjMhAJg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Y8UyGd/RTtTu5gM1mnagjLUP0I72SAKepXsCoEMeT94G0dJnrd0OWgdg34KVjNs+q
	 R5DDn/Oij8+gq7+RktimQ79fuvMP0Kn2CoBkLW8olGlVzk5zEhdGVr9K9WmwfUer5h
	 W9h9ONcrKEB/xPKLuLZh6PqjIqvcvZHrsUyFLkxLYGo64uHKmNxVeks9WeDdFwMsq4
	 LLBlOhOLGAHBMiVlIjGC6vxBqu086+SVY1bkwTCVS2jdKOtn/ugf6zO2I6CQZuMCa6
	 w2fpOZp+qM/Exhqh7nYO8i1oKtixt22KYgrn5TCOM7gKmDO3ZGZcErlC4UGCnf2EB2
	 qq/trWYbHdvcg==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 10 Nov 2026 16:57:43 +0000
Subject: [PATCH 1/3] mm: only assert mmap locks if CONFIG_DEBUG_VM or
 lockdep is set
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
Message-Id: <20261110-tame-vma-asserts-v1-1-be293ff499a7@kernel.org>
References: <20261110-tame-vma-asserts-v1-0-be293ff499a7@kernel.org>
In-Reply-To: <20261110-tame-vma-asserts-v1-0-be293ff499a7@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Shakeel Butt <shakeel.butt@linux.dev>
Cc: ljs@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1695; i=ljs@kernel.org;
 h=from:subject:message-id; bh=vjPP3edYWn/6OBXj1HiySy0Qa49t43GUAeNl0TkpuQc=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLI++/JwFS9umXOT5wFPuuEHteqQcKdkFb/0PHGDeq5O3
 pS6N5kdpSwMYlwMsmKKLM+/iO8PEgmb13nB3w1mDisTyBAGLk4BmMjVTob/EcL2Vi+m7isUm/nl
 8T7to3dbrqe7rJjcOqtFpLV99mJhHYZ/er1rnub/3f/tsu+8vM2n1yZdOvBOyGblnbd+Yjk6HN0
 ufAA=
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

For a long while we have asserted the mmap lock being held regardless of
whether or not the kernel is a debug build or not.

In general, given that these have been added as programmatic asserts that
nobody did something stupid, production kernels are simply wasting their
time checking for this.

It also means there is a two tier system - where some programmatic
asserts (e.g. VM_WARN_ON_ONCE()-checked conditions) are only checked for if
CONFIG_DEBUG_VM is enabled, whereas others are checked unconditionally.

If we genuinely want to unconditionally check for the mmap lock being held
at runtime, then that should be made clear in the code doing it.

Regardless, if CONFIG_LOCKDEP is enabled, ensure that the lockdep
assertions are performed.

Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 include/linux/mmap_lock.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
index 9c3a9c6525c1..9367430ee53c 100644
--- a/include/linux/mmap_lock.h
+++ b/include/linux/mmap_lock.h
@@ -75,12 +75,14 @@ static inline void __mmap_lock_trace_released(struct mm_struct *mm, bool write)
 
 static inline void mmap_assert_locked(const struct mm_struct *mm)
 {
-	rwsem_assert_held(&mm->mmap_lock);
+	if (IS_ENABLED(CONFIG_DEBUG_VM) || IS_ENABLED(CONFIG_LOCKDEP))
+		rwsem_assert_held(&mm->mmap_lock);
 }
 
 static inline void mmap_assert_write_locked(const struct mm_struct *mm)
 {
-	rwsem_assert_held_write(&mm->mmap_lock);
+	if (IS_ENABLED(CONFIG_DEBUG_VM) || IS_ENABLED(CONFIG_LOCKDEP))
+		rwsem_assert_held_write(&mm->mmap_lock);
 }
 
 #ifdef CONFIG_LOCKDEP

-- 
2.56.0

