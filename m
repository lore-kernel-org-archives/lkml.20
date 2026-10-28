Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188861;
	b=Y/BTuT7uOVSKHe/4H7/A5wl14kFXJt9v9TwbwuESjkYB5p2W7p/gt03r34GjVX4wrarL
	 QuFcFHvDPpAjHQlfZqWzDvUNvNiq5XBfnIPoz4Mj/JtR6XCRb3gUTYgH4AygsuVKWkBe0
	 a1YxghWZZ1P+Lpb/8PA/z3rkv25VrJo5gVXTa3sp84dggpavm5tFBIeAVEn9KVd8nl9Vz
	 O2G+eFt03zjramwQE/hu8BJ5K3pJBQcck338U+5g7jTujjE5bEbYmT+G9R/yDuD4aQDXZ
	 2FtaQQYv6Ntb/ve9wA8Vcr+i6CVRJCI7qZFYbOUCaDiNAXjLO177APGE8VAPSgGQP+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188861;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=qNBH5wSw6SnvHcIC43dQoq/LLpdoAfR/77hDRNKZYpM=;
	b=rmfBcixfDVIgHdfgfauc9uJonp+oOQWo34agzla9jfDq7gZdYshVYJfYU3gRL3OpT9hL
	 7KkDqTp44cZRZfv6RWrc2kkhoARvx5JAamF/1zilj9yFhNHLYQUhpJcHTDE3plxeOWx8r
	 ltzVaKJbNn7Yt1ph+RDtvZgONyIdbAKup3pfbpjVbbNIX/mJF9NW8qIzwenB9eVN5ajJJ
	 1R1A+0iqfsy/hnFuz6STooDgF1MqRWca79xHhiOT96mSX67MDHN3fm7cJ9iBJltjLKkz1
	 Hiyn6yYD81AQj9Tf25PP5X35w225OeGVoG4X3qr84pLrQBU5CKSPclvv7NFO2kD7d5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="dYOEp/dl";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D23A606A321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dYOEp/dl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6E61F031E4;
	Wed, 28 Oct 2026 12:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793188861;
	bh=qNBH5wSw6SnvHcIC43dQoq/LLpdoAfR/77hDRNKZYpM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dYOEp/dlh8cVg0Emizp2JS/ztTILtZTMk+QiwY06eapZT2ZUzXqEdLNBv2Vg8yCp4
	 omM29VV7uAuRCsqZFyca98q090STI8pf9dN5Ak71H2g42t0zBGNuJFQFMt9vI1q9vd
	 7Afhs8Az5T7fIm1Vd2L/qP0NqLo4weridFGF1Fl3bfLjyHj2DfM0H+pou3mHQ26Wg0
	 apw6LaaCPEYRynnTYZF71FuR0XSF2uRjVhVoY3O03Th4cQOYhk40v9z13fmi70wnMe
	 CNgwXTZYKil1v6xhOXChiSXquyWDQ1pfSP9oA0sqeg6LU9GWRA8CGmFujL7b9vCl7O
	 XVPMAkZ43wh6A==
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
Subject: [RFC PATCH 06/20] lockdep: Always inline the empty stubs called from noinstr code
Date: Wed, 28 Oct 2026 07:59:30 -0400
Message-ID: <20261028120034.871983-7-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028120034.871983-1-sashal@kernel.org>
References: <20261028120034.871983-1-sashal@kernel.org>
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

