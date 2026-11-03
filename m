Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793670776;
	b=Wl78hd66cfXMhJ02bgsmSpO3dsqjOoIEN60HzgDmjUcW6NA5wtzpYjxA5tTUp/QaqZfV
	 5jMDky67gAnjv0O4o4E54IDoyvq6j1VGz491ei7NSjPHx1+Ohc7AEiDToGQSN0wpPrpTq
	 dATOU0bOHBBOrLeNgJsOHfBgAJsMKP85Zit+pojN3LsOn3lW9OrofQxfqgCD9NnUnTdRB
	 wahWrM9wqrk9hqQPYgUfhySV+6zkg0XhnWBoLHIuypKx8qZixFfMlcr5UmHgw7rxIXaBn
	 LH544xWfGBx5fwU+fRsr0b2ADe86US6FzlNByjNTm+4R0uXVCO49vVNli9xR8K3rwjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793670776;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=qNBH5wSw6SnvHcIC43dQoq/LLpdoAfR/77hDRNKZYpM=;
	b=GEWY6il1TTj412KsyWDO9qGXBR6iKTTsWDjxNgH8Z0Yhlb+z8kzYlXYLhPT0hRBEH0HB
	 GdhlXhUd/XaJ7UwLxqIrzNqoauxTNBI7MvquoxxPgXNytWrib6/x54JnaaWFudOfHO48u
	 iAaG4l9I7w4j/ZGfatezsl4CPtqLTsctG75Rr8kOCWvalVfXzD4Oj8QRm9kLIsRTToZnI
	 0hWZ7Bz8FaGH2ZsG7c3QFvOjDnnYwreiavyEVW2ffQmb76kyJwwqwfoHutbQZIRBFIytL
	 mdYTyubF/7KGXuOEG4E/Dw2BJPxwwNQtXq8DgTgI7WwwVSeLQ3wvInaxuPWpvqwpBrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fzWhsQhw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479D1606A33E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fzWhsQhw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B591F000C1;
	Tue,  3 Nov 2026 01:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793670776;
	bh=qNBH5wSw6SnvHcIC43dQoq/LLpdoAfR/77hDRNKZYpM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fzWhsQhwkyduU52JClhUsVSmAaZfEzVoXt6I1EGwPleQZPsf97VCTt6/VwdL4cGTG
	 mPMmyXp24hfBRzLqaswmwv6aeP2+9L7YApWiv9TKkXcWQmBqY0tSLgH9fERHnelpxf
	 wtoebv1ocFLbrDwZV/a3Hzka+u+yzY1uOwCitIXH/glt7jakkwnS5EmNIx0TNTJYO7
	 1MFLa+jrMYl3b1xq9SbJLBBkKQ4F3D1hf9xo8s60PNF4fcLRr25KEel8ta/6Zn7o27
	 eOW4EBlDNOHhBgBdZz4FzPyq2s5MeqR+yiTU5zKUG1SUNY7HdNH+rbkYmnDh3GgZnR
	 bPLXDEupA7RFA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Boqun Feng <boqun@kernel.org>,
	Chuck Wolber <chuck@wolber.net>,
	Ingo Molnar <mingo@redhat.com>,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 06/20] lockdep: Always inline the empty stubs called from noinstr code
Date: Mon,  2 Nov 2026 20:52:24 -0500
Message-ID: <20261103015238.3780910-7-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103015238.3780910-1-sashal@kernel.org>
References: <20261103015238.3780910-1-sashal@kernel.org>
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

With !CONFIG_PROVE_LOCKING, lockdep_hardirqs_on() and
lockdep_hardirqs_off() are empty static inline functions, and so are
lockdep_off() and lockdep_on() with !CONFIG_LOCKDEP, while the real
versions are noinstr functions and macros respectively. They are called
from noinstr code, which the compiler won't inline them into when
building with code coverage instrumentation:

  vmlinux.o: warning: objtool: do_syscall_64+0x7b: call to lockdep_hardirqs_off() leaves .noinstr.text section
  vmlinux.o: warning: objtool: irqentry_nmi_enter+0x4: call to lockdep_off() leaves .noinstr.text section

Make the stubs __always_inline, along with the neighbouring
lockdep_hardirqs_on_prepare() stub for consistency.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/linux/irqflags.h | 6 +++---
 include/linux/lockdep.h  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/irqflags.h b/include/linux/irqflags.h
index 57b074e0cfbbb..e06004255e3d8 100644
--- a/include/linux/irqflags.h
+++ b/include/linux/irqflags.h
@@ -32,9 +32,9 @@ struct task_struct;
 #else
   static inline void lockdep_softirqs_on(unsigned long ip) { }
   static inline void lockdep_softirqs_off(unsigned long ip) { }
-  static inline void lockdep_hardirqs_on_prepare(void) { }
-  static inline void lockdep_hardirqs_on(unsigned long ip) { }
-  static inline void lockdep_hardirqs_off(unsigned long ip) { }
+  static __always_inline void lockdep_hardirqs_on_prepare(void) { }
+  static __always_inline void lockdep_hardirqs_on(unsigned long ip) { }
+  static __always_inline void lockdep_hardirqs_off(unsigned long ip) { }
   static inline void lockdep_cleanup_dead_cpu(unsigned int cpu,
 					      struct task_struct *idle) {}
 #endif
diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index a6451ecbbe9a0..85b864880d069 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -324,11 +324,11 @@ static inline void lockdep_init_task(struct task_struct *task)
 {
 }
 
-static inline void lockdep_off(void)
+static __always_inline void lockdep_off(void)
 {
 }
 
-static inline void lockdep_on(void)
+static __always_inline void lockdep_on(void)
 {
 }
 
-- 
2.53.0

