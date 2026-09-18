Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80A6515890
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748081; cv=none; b=nqvb0dEMk74XFegJUtFHkj0JzEONk8uEbc1UwBDcIEGaW1Xe2BWjJa0S2yFOHmoHjhYwEyavw8hUTjz7ALMcP67/GEhR9aoOau8n5LJ6LLfmFQItyEgS1lkodVTwE5ODtv7ltmfi/MOh4WHVhbAbcmNVRwYsaGNjb+TVNcbP1Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748081; c=relaxed/simple;
	bh=BPHwYC+/3zydmxdp+H0MV5n7mum1DHw+RAMwW9cldiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IoTZoXDQziDTYw/3pyWNEq+yqy2S/FBnRJ0LGhsvXNIcTW98vPDRCLm3Y18gKE1GOL914jJT/8Yc1Et7XWeNMUVdMTuHCYXj2DI4pZ30aMRK8gIaRbtZ8V32WOLT2HfJHk88j2jHbEvvstOXWd1yk6dE8Svw8/IHU9u7jTjDn80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UMSBMPqO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UMSBMPqO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6397D1F00898;
	Fri, 18 Sep 2026 16:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748080;
	bh=QbYLgua3LTRCkHC2dRvKQSbxhGctAFKekAK0EDDmZSU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UMSBMPqO8Wnq9czmGejil4XXGqU+RtD33pykqoNceiGbGOR3FhEfWGsEdR6/+YYp5
	 MvMwHsljDqr5Ym7RSNgHZtmw/Wf4B9ErzLVO7yq+CIHY6GQtMTr6Wz059JmuCyB1Dj
	 isxtlJevCFivSWcKZcPW8KsZvucON1RxNznHLSdIiYVB6w+ocxv6RlLZLSww7/tlus
	 /3Em1SfAUDKdy0UVnLR9/ZaNNWgYGDLcMFWrHXaa1/mDQWEmbtXPmNPi/n5VjN9Trg
	 2JOmMon8k+7OSoUD1jQtJSB/juWVd40zsEeQwtaOt08SWCD6AD8mGz164psJ6qTA9C
	 4YdkwCHepl+/w==
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
Subject: [PATCH v2 07/21] selftests/bpf: arm64: Use TPIDRRO_EL0 instead of SP_EL0 for 'current'
Date: Fri, 18 Sep 2026 17:13:51 +0100
Message-ID: <20260918161407.2300-8-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918161407.2300-1-will@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
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
2.55.0.1082.g2b9226bbc0-goog

