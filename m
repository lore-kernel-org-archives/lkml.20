Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793314131;
	b=iF80jKNQ1El03CqPk1+wnT1xl9YE0aGPWifprnpvDDraGxCcdpkdkbsr7gWvFoTQN1Az
	 GV9HtaHehDmm5fN+3kJk6eeiQAiFE/T2XrxPdN95nq84NuG3YI9TXSzzMxAA8xN0rGoy2
	 39E8QtyzRMphPG+8jMzNkZQ1zXlPr+eM/rJ6cToFl0d5vFIluw3woQx/LrH5+hknRrXZb
	 IKynE59uWa6RwcJmnCnpcxG5nOctoct+SrxbEfmsZfD5JGJdm5+Y3VAmgtcxWN7pDe2ac
	 2izHkRIPzIJJqYQpIEXtx/cmjZjhhceI/e69vBLTmgv5AHUpJEoANHKxdd9G8aC5aDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793314131;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/7wmfqpqBqHZu2/Loju2AE5ZUskXeCIDwEQSBEfIOLM=;
	b=rnRYny/sA/sBu7fhwrJwpxrqjTmaAtOs6ZTDh+1uvYBStYnnR62IJv/3l9NQdcG18Khq
	 y18OW1mzchAh5dzzZas6BgSmGkMqBxqx/hNXm7d57Ac1y99Ct9j0HnLuSMV23GZ18IyiR
	 L3Bd624jJf52oGK5PmYJ8bNas8xFfmpFVLASAi1ESUKtGF2neSXACuyQey4EoiIKMbNXE
	 TI1O01Xfr4xFEADM3fF1gq9BXeoYLRm4e52FttEdXORNQQELFs2azQcBY+dqD5TUWBsSI
	 CPI1Wk+4czxsOnRnDqEVO2yzLMpwLhyq8cfIJmvZKxHPJ6PFphTPOzSdKs7c9E1bjEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QCU+PYJW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC944606A31A;
	Thu, 29 Oct 2026 22:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QCU+PYJW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AE6B1F01816;
	Thu, 29 Oct 2026 22:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793314130;
	bh=/7wmfqpqBqHZu2/Loju2AE5ZUskXeCIDwEQSBEfIOLM=;
	h=From:To:Cc:Subject:Date;
	b=QCU+PYJWBFNLD308NFlV7u9k/uhO7+uOVMsU9Swgf/wecGr0yqxoDtrKBKx+9Ff5I
	 gSbu4Aiwr3LqsDq0ffDAPpv5bOBPwdqi50CrM9Fn6FJ50fLyeJROfPv2/i9fsI4xpi
	 tkm08ww1RaK2SckVV+LzKnrpo3KhUWhzS9zJKwp8G0DZeaHB0SzHHO1kPc/MMZufla
	 UcM2DShax4maF/nEmK4gA/5nX4OGfdCUHpxo3zOmKPBvhzYcKUD5smdFAGbVAh5MEA
	 /8ZjJ14eoc95gi/vLTHi2l4zhf0d7F+rfUKIBSikIPA2UnesXzOxV4DSj+bZdXa+Rq
	 uz5pC+Kn6ID3g==
From: Danilo Krummrich <dakr@kernel.org>
To: robh@kernel.org,
	saravanak@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] of: unittest: Require BUG_ON_DATA_CORRUPTION to be disabled
Date: Thu, 29 Oct 2026 23:44:24 +0100
Message-ID: <20261029224843.1155201-1-dakr@kernel.org>
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

With CONFIG_OF_UNITTEST=y and CONFIG_BUG_ON_DATA_CORRUPTION=y, the
machine no longer boots after commit 5b5224220747 ("refcount: Use
CONFIG_BUG_ON_DATA_CORRUPTION for UAF-related errors").

of_unittest_lifecycle() deliberately calls of_node_put() after the
node's reference count has reached zero. The test expects a warning and
continues to check that a subsequent put does not produce another
warning. With BUG_ON_DATA_CORRUPTION enabled, refcount underflow now
triggers BUG() instead. This panics the kernel during boot:

	kernel BUG at lib/refcount.c:37!
	Oops: invalid opcode: 0000 [#1] SMP NOPTI
	CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Tainted: G                 N  7.3.0+ #14 PREEMPT(full)
	RIP: 0010:refcount_warn_saturate+0x89/0x90
	Call Trace:
	 of_unittest_lifecycle+0x158/0x310
	 of_unittest+0x105/0x130
	 do_one_initcall+0x127/0x350
	 do_initcall_level+0x7c/0xe0
	 do_initcalls+0x59/0xa0
	 kernel_init_freeable+0x118/0x1a0
	 kernel_init+0x1f/0x140
	Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

Make OF_UNITTEST depend on !BUG_ON_DATA_CORRUPTION and explain the
restriction in its help text.

Fixes: 5b5224220747 ("refcount: Use CONFIG_BUG_ON_DATA_CORRUPTION for UAF-related errors")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
Alternatively, we could also just remove the refcount underflow tests. It seems
they are not really testing anything OF specific, but rather test the refcount
implementation.
---
 drivers/of/Kconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index 50697cc3b07e..316e32b35b17 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -21,6 +21,7 @@ if OF
 config OF_UNITTEST
 	bool "Device Tree runtime unit tests"
 	depends on OF_EARLY_FLATTREE
+	depends on !BUG_ON_DATA_CORRUPTION
 	select IRQ_DOMAIN
 	select OF_RESOLVE
 	help
@@ -32,7 +33,9 @@ config OF_UNITTEST
 	  will taint the kernel with TAINT_TEST. The tests will cause ERROR and
 	  WARNING messages to print on the console. The tests will cause stack
 	  traces to print on the console.  It is possible that the tests will
-	  leave the devicetree in a corrupted state.
+	  leave the devicetree in a corrupted state.  BUG_ON_DATA_CORRUPTION
+	  must be disabled because the tests deliberately trigger refcount
+	  underflows and expect execution to continue.
 
 	  The unittest output will be verbose.  Copy the output to a file
 	  via capturing the console output or via the dmesg command.  Process

base-commit: a287f97d4256b5f5527f5b5a54f8ada55e1482c7
-- 
2.56.0

