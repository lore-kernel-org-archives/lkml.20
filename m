Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794225913;
	b=Kc++v7Ok8IQcKznWYCQRKMWajCuDVf/ndfZhBxYoV2T/2JfZOM3AuZlLQY7N2XL5b7R9
	 baRvzvA5OQJ+OSYvRDTaUB57hVoI2iSh/0WGVupQAwVR32jyb5hSqgxInn0xLsRIfKd2c
	 rMszE6Vvqqs7XyXL0xt9MGTwwDhhCw2kcsNr6AVjjkvCQyY4m2EzFLCt3KsYXciC1ec97
	 vl0d4ajy5GUzV9nSrAaVk0HNt9E71x4rap0WK1fjy2sqTEi5Msh74jHnxfUg8L3NnD9at
	 zBrNQLkpplwp32GcNqabNPqw0LDNqmpmmBhLI6x81J7EOvffVhlus3hCTuMRgsM3PRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794225913;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7QYMXonlT1X/OPGysSVGx2KIKbzgu61tqS/KtO5R6L4=;
	b=ayuOAkmMXngMcignFG9YuU+HAOf7am0H4uZoFgpYR6/K7At0Mu03+dnK/68foXGSl1ep
	 WHrubqVYkKam36PNachiA1uqlC4ZRA9KHTv0cr2qNADnTtYckF6PPmDbeAHSl0AhJGbto
	 HfJB0JDiCr8t/TdajPKT+8ixJmudAsg+WSG1/CFeFvuPf+sS8dhd9TLv5R9dUjpsyomTj
	 D33SKZoFrgqyxuuzYtoSAPDCjkupZTrZPem/jy9MKGbeA/TF99f6UukOblxLxY9cMOky0
	 HrGN6JrPwall6AsXFdN1XycwaOqcIMgaYr47AQkHOX7MaJq/JscUuCvZvsgy8+Lqt4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cxvv80tf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3546C606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cxvv80tf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8725E1F0089F;
	Mon,  9 Nov 2026 12:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794225912;
	bh=7QYMXonlT1X/OPGysSVGx2KIKbzgu61tqS/KtO5R6L4=;
	h=From:To:Cc:Subject:Date;
	b=cxvv80tf4aXmD9C43/MEHNe9zk/XOvqolhWIiXZdZMbWuItd64Qt+Eec5f3n8l3TH
	 bEeXEYYcf2FECsC4387/eB7cZ7Dzz5R8a4Y9NITxgFw57Fx4q2uUiCx0XlzoyIkFIe
	 e4OdrhnHbZHoyCSKGEcTrw7Dn41p6jBtM2nkI1URQFwSoTPAQpiDoR3y8bh7nl7ETf
	 FrVXkorB2YhV5Hk/fN7tPjhceB2XfaRA+04R4fYULh4TrbRlGfGhRTBDxzWqnxOy4B
	 lxEGLabfYbu7mcX5Pt+8TBuKYaf/YydINE9Tke532vWOT8D3B9rOVXXVa4YrzkL2Nw
	 zs9k3s1sFuN0w==
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
Subject: [PATCH v2 0/6] arm64: Fix instrumentation escapes from noinstr path
Date: Mon,  9 Nov 2026 19:44:53 +0800
Message-ID: <20261109114500.20298-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
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

Code marked with noinstr can only safely call other noinstr or
__always_inline functions. When reading arm64 source code, I found
necessary noinstr markers is missing somewhere. So I asked AI to scan
the arm64, this series is the result.

Since v1:
  Mainly address sashiko review comments:
  - add always inline to per cpu helpers
  - use tif_test_bit() instead of test_thread_flag() in sme_enter_from_user_mode
    and sme_exit_to_user_mode
  - a new patch to mark kasan_hw_tags_enabled always inlined
  - a new patch to Disable branch profiling for architecture library code

Jisheng Zhang (6):
  arm64: percpu: Always inline helpers used by noinstr code
  arm64: entry: Always inline helpers used by non-instrumentable paths
  kasan: Always inline kasan_hw_tags_enabled()
  arm64: stacktrace: Always inline internal stack boundary helpers
  arm64: lib: Disable branch profiling for architecture library code
  arm64: alternatives: Make branch and ADRP offset helpers noinst

 arch/arm64/include/asm/cpufeature.h        |  8 +--
 arch/arm64/include/asm/entry-common.h      |  2 +-
 arch/arm64/include/asm/fpsimd.h            |  8 +--
 arch/arm64/include/asm/mte-kasan.h         |  4 +-
 arch/arm64/include/asm/mte.h               | 10 ++--
 arch/arm64/include/asm/percpu.h            | 18 +++----
 arch/arm64/include/asm/stacktrace.h        | 16 +++---
 arch/arm64/include/asm/stacktrace/common.h | 12 ++---
 arch/arm64/lib/Makefile                    |  4 ++
 arch/arm64/lib/insn.c                      | 57 ++++++++++++++--------
 include/linux/kasan-enabled.h              |  4 +-
 11 files changed, 82 insertions(+), 61 deletions(-)

-- 
2.55.0

