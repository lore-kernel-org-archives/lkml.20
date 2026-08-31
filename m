Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F4939D3EB
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788146992; cv=none; b=g8c80wBKqp5Nsx788gbjeaPAHluUf+Hy6VpQtqkAvfbjFOEE/j7j5sGy6sfLhXoU2lHN5jNjgMCH6yZddiS7alGVeWUSI82Yl9z51n7WFRrR7Oxsjt13NHoqUj1oKyNtNWIILa5tKU+tgBztgfbaK1yM4jU3BI9zAWCRBjgM/74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788146992; c=relaxed/simple;
	bh=ICN0fhEYAQIRJvpNLpTfhI1xj2zttrmVlyuJdKEoMY8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I214U11AQKW65jGaUgduIRfwCLJ9v6w3A2a0XukQieCo0uTYSAcG0OCmDi/7vSQFW3mCknjdB2hPWf2A9rd1Qf/PZoD9zPak1wa2JsO3qU0hpQW38H6vMM1ceJgwbktQQ6fkIT1dsdXiFqKbcMDKNZPQtURRxyG6FtGQA79/tf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FnbzJyQd; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FnbzJyQd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=JkB90OmhSiKbUInM1FjPrIGLHdQ9iitHP/rmHdiVGyE=; b=FnbzJyQdfXsl8a8Lwz6VZ9eFMS
	tnoG6hfYV3PfzZO28J92ydPtGUuUez/j1g1XNKQHVLPy8Xgd9b4fcmzxgPcav3s+4905et7gH97Pd
	klI6nse7Ju6KumoSS0FZJ/rWMPJ/FpoGRW1Yg1/lqXNFDWqV0eqNlioWedd66OPMhx4ClFWg0WNUD
	kvuzaeRbA3u8BJir5qeQuunXJfZ+XbDG0oDwHQYzSjzBslsqQDmmtXGeSvzTC96BUJKjh0HcN+oOt
	6btLukKVZ6GAWP/Zw9qhwJpDry4hUJqOyCujqe+XsILIl0bTyheSzy6En9/SCIbHKu2+81lh8N+r1
	nL9IRnug==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0siT-00000008PL7-0SWT;
	Mon, 31 Aug 2026 03:29:49 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>
Subject: [PATCH v3] xtensa: atomics: drop kernel-doc comments
Date: Sun, 30 Aug 2026 20:29:47 -0700
Message-ID: <20260831032947.3430049-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The arch-specific kernel-doc comments were supposed to be deleted in
commit: ef558b4b7bbb
("locking/atomic: treewide: delete arch_atomic_*() kerneldoc"), [1]
but these were missed, so delete them now.

Warning: ./arch/xtensa/include/asm/atomic.h:45 expecting prototype for
  atomic_read(). Prototype was for arch_atomic_read() instead
Warning: ./arch/xtensa/include/asm/atomic.h:54 expecting prototype for
  atomic_set(). Prototype was for arch_atomic_set() instead

Link [1]:
https://lore.kernel.org/all/al3q54jxOKZujYue@J2N7QTR9R3.cambridge.arm.com/
Fixes: ef558b4b7bbb ("locking/atomic: treewide: delete arch_atomic_*() kerneldoc")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Mark Rutland <mark.rutland@arm.com>
---
v2: drop the arch-specific kernel-doc comments (Mark R.)
v3: rebase & resend

Cc: Chris Zankel <chris@zankel.net>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Gary Guo <gary@garyguo.net>

 arch/xtensa/include/asm/atomic.h |   13 -------------
 1 file changed, 13 deletions(-)

--- linux-next-20260828.orig/arch/xtensa/include/asm/atomic.h
+++ linux-next-20260828/arch/xtensa/include/asm/atomic.h
@@ -37,21 +37,8 @@
  * where no register reference will cause an overflow.
  */
 
-/**
- * atomic_read - read atomic variable
- * @v: pointer of type atomic_t
- *
- * Atomically reads the value of @v.
- */
 #define arch_atomic_read(v)		READ_ONCE((v)->counter)
 
-/**
- * atomic_set - set atomic variable
- * @v: pointer of type atomic_t
- * @i: required value
- *
- * Atomically sets the value of @v to @i.
- */
 #define arch_atomic_set(v,i)		WRITE_ONCE((v)->counter, (i))
 
 #if XCHAL_HAVE_EXCLUSIVE
