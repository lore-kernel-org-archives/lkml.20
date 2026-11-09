Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794225932;
	b=bSIxDpptJ/HXGERPZSxYhJvOFwuS5rcseSQ47QxZ8qN6VuUsSf8Opii9V3jw8qTQgXpu
	 PR1xh0GRMWn/qNyHPPkjSdg1Fq3NeUV5HqFficzxOLguz2mCd8ilLKQDwQmzIr5IBiOzl
	 N4re4OB5t+P70x6mW0esNtVGPXd3bBc/Tnxu1VVTvHrHwKewHo7SYP0HQdIaYdbRt2pqr
	 3qQUlwYO3KbRYlG+qgIEShgbYWv6Q2Hkn5MSqGY0tgvVXQ9lCF8d5VlRINuXjoX0LZB+T
	 irvcshmM+KMUIZzGah1Fk35lR3wONqA7+lToT0hrEcVE7kMpySJ8rw9KgT1N8iir7kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794225932;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=6LYzOqgVWc34uRY6ovO7R7m1hhJFjX7us7aa10zp4XA=;
	b=ze5ONbXCF55JBlvAtS2VYW97+OPaNRWMT1gDGbJifqw5/ztMRlc56mDKoZQWPSCF8CLT
	 iUCPYieDGKIQUVqjBlDh2lHuGq1IPlYJn1oAdZlnYdkqY9lFetjVnUWQrk6RPo7+NpEBb
	 PE1adb5H9dbKgkcW7CZTFIDlUwrFNH/Ga5aLdqciezOT46Xq4JRi5d5oeF0fpKHQmULID
	 yMp0zoKWTC1s7XpSbD504J/Dh2eEiwzTiXpFFUTFKuGKJIvXbTV3LP+7IWs0ev5/BcfGJ
	 scTpUwdmrTPEjTFlSrU36seq+/kNvx9GC+Rc4wimh/xFZXhsuCyfDkpAELJus0xQyWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ifqPUIQb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78540606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ifqPUIQb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDEAA1F0089F;
	Mon,  9 Nov 2026 12:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794225932;
	bh=6LYzOqgVWc34uRY6ovO7R7m1hhJFjX7us7aa10zp4XA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ifqPUIQb4197CXOoo3zkk/P+62IWE3W6hw3VXHH7BmaZDJzTj/sylmfjzUn/heM/o
	 Dy3qocNvWVFwIqtPRM05SK7rH7jllGShFdSL1cRyz7QQ/mkOqRGeBPNiZRUO8mrxRm
	 FIachU3c43wQuZXo5Uct+uIktJlmVTYkENycEl9wY+AjWuGD9c6TxAz1oGp/9/UG2+
	 XGuWNxEDTKXdIbIkn+pWSeDgW1jw3znXhbtuXBKg7H3oAZHzcnibIYvO90zTJhWf1j
	 3bP/GAN+qstiydBQLS9s63mMSLiQr3I7JY3AW6z//o+NeybqI0nzbTP8tHEzysVNuR
	 YHkTNUk0CoDNQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Tejun Heo <tj@kernel.org>,
	Dennis Zhou <dennis@kernel.org>,
	Christoph Lameter <cl@gentwo.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Subject: [PATCH v2 5/6] arm64: lib: Disable branch profiling for architecture library code
Date: Mon,  9 Nov 2026 19:44:58 +0800
Message-ID: <20261109114500.20298-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261109114500.20298-1-jszhang@kernel.org>
References: <20261109114500.20298-1-jszhang@kernel.org>
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

arch/arm64/Kbuild disables branch profiling through subdir-ccflags-y.
However, arch/arm64/lib/ is built separately through libs-y and does
not inherit that flag.

Consequently, CONFIG_TRACE_BRANCH_PROFILING can introduce explicit
profiling instrumentation into library code, including helpers used
while applying alternatives. noinstr does not suppress instrumentation
inserted by the branch-profiling macros.

Disable branch profiling in arch/arm64/lib/Makefile to extend the
existing arm64 policy to this directory

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Assisted-by: LLM
---
 arch/arm64/lib/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
index 38ffd359123c..59d714865c00 100644
--- a/arch/arm64/lib/Makefile
+++ b/arch/arm64/lib/Makefile
@@ -1,5 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
+# Built via libs-y, so the flags in arch/arm64/Kbuild do not reach here.
+# Branch profiling isn't noinstr-safe.
+ccflags-$(CONFIG_TRACE_BRANCH_PROFILING) += -DDISABLE_BRANCH_PROFILING
+
 # KCSAN uses udelay for introducing watchpoint delay; avoid recursion.
 KCSAN_SANITIZE_delay.o := n
 
-- 
2.55.0

