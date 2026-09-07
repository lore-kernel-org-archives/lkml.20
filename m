Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7488E5221E4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799405; cv=none; b=WzA5eRthiz4op9L8SQmBGoLZDfUmNm/D5Go/ytoFYkwjkVD1iiSKXiuRvIr5CUe1suMW1Mf3wkb6lrPk6NZ1oD4S2slWUXrZCqncMcrM34UBvpVYuG72RAE45ln8n/Dml79lTtYd12W2hTE5wAdK5Y2LZlf0iJb5+inek2QKccQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799405; c=relaxed/simple;
	bh=HLCshW8xxv6VsiacUYB6HYqss6+4m80cl5CLJJhEEoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VkU4vMTgwkWrqX1DwwPf3xlRPDZdi/MFiDil39UsocFnZA+8noxDMzdrELodZTaBy0A3Jdx+KFyuYczqOHb5sdwSxQsp0IfvAdgegawIWZ4US81+RBS/+oV7ZJ6DWhV0vN6awQfzyE2BtgA2OJV7tNTQBQ09Kwcwmr47rLzFyDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CQjhS6Sh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CQjhS6Sh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E4AB1F00A3A;
	Mon,  7 Sep 2026 16:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799404;
	bh=4ETxX+Ovhc6XcQfH1JJJPmgYMOVMu2SBJPq49n1St2c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CQjhS6Sh5LSuVnGsWrDayRTZgrnPSjn/2w2PspnGGYU3yy8jYWr/hPpLTJIWqbeeY
	 hfUqIVnGK2+URINnFL9/KY7CqBv/xbZJ9UEHqoowMEuiIDJSaJCpItwGvC6AefkS1Q
	 sDxWiP8Y6kuHvD9HF+wCF9XNDjUXG+9B0gL4uQZothEMg/0npy6quZk7wEFsXZJKuR
	 LfCCKrYX2cKijc3EhIih9HZ9nD3BaKmdYlhkoTkgc5M7IT9ZKMaTrY/TXEuxkIaZEK
	 KA6SNzMyZeJIyqmAUWaJbpk5rDVwBsATbTc/CkqoXPeK7Em3cLjXr86OoBlSC6YWWS
	 mvZlROZs55LqA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 07/21] selftests/bpf: arm64: Use TPIDRRO_EL0 instead of SP_EL0 for 'current'
Date: Mon,  7 Sep 2026 17:42:32 +0100
Message-ID: <20260907164247.17223-8-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164247.17223-1-will@kernel.org>
References: <20260907164247.17223-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current task pointer now lives in TPIDRRO_EL0 instead of SP_EL0, so
update the bpf selftests with the new register allocation.

Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 tools/testing/selftests/bpf/progs/verifier_jit_inline.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/progs/verifier_jit_inline.c b/tools/testing/selftests/bpf/progs/verifier_jit_inline.c
index 02e562f56f9d..a3d6c095acc3 100644
--- a/tools/testing/selftests/bpf/progs/verifier_jit_inline.c
+++ b/tools/testing/selftests/bpf/progs/verifier_jit_inline.c
@@ -9,7 +9,7 @@ __success __retval(0)
 __arch_x86_64
 __jited("	addq	%gs:{{.*}}, %rax")
 __arch_arm64
-__jited("	mrs	x8, SP_EL0")
+__jited("	mrs	x8, TPIDRRO_EL0")
 __arch_riscv64
 __jited("	mv	a5, tp")
 __arch_loongarch
-- 
2.55.0.979.g7e5102b832-goog

