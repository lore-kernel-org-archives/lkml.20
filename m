Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D8A5237A7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799419; cv=none; b=YMD9aZRWJdQH4GhDhdoLSoirw+OK84to0Q1s/AKsY1XSfsNh6CSWLCl3hSJ/HX5bVzyCluyiW0i3P1cD9H1+SiC46eJ/gxS9q7Cirhzc4CQF6MfGG3UKThgZlUDVKrnYd5cCei8Y11e9QcXYYQLZPFw+Ydmh2TrPa43ZhUP1pn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799419; c=relaxed/simple;
	bh=gTlx6is6XrvyjPhpwA9V1ozLMB+EJsZwN2tebLKC/H8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iD+kbFny1g4+umQOeE4oEoF3ix2XpigLxhwGRuqc3rO3FlyF9PRv+C19Udb53Gu6ddwjawnyzGOjOL4Yw3SPIrtkJ9hHlG5rw+Tjvmhd9BfYBEaPttP8NKfHXhRPLTNEigJo34PoUW1idr9Aa1BH57wR+ruihemjUGQ2camuvXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dpz8P5fl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dpz8P5fl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D06851F00A3E;
	Mon,  7 Sep 2026 16:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799417;
	bh=n+K80nAxXhSm5NIt4T8l1ArolcUXrF2HTgu45U32pCw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Dpz8P5flXB+f/mwxgnYVOmBx3XGJ4U0LMXVV6eh377oHMDt3NQEZHqh3xMpVKJFqU
	 7ke0Vf52rXfj34OteLR6GA/ECF+K9jB5o1NzSwM3lCRsb05RwZkXbeDN0RfRSzdqZp
	 D/vznvXSkPJe3edlXmBm2omlgTele7/zVMKnMo0lZCGFdThsZQe9SgcaaOUXS5bqT3
	 L+Qn0iHFlfUdLLpTHvPbav4gutLllDuIhlaoB9ROZy+GamkVzSOgh9lvEtamSIuXv2
	 sjN67/YA33G/e0TT1SwarAWb9U8WNAQ/8njsj7pPj1cB1gdIgeyfkq4OOVUQE9WjSR
	 TgdujM6Q7XTew==
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
Subject: [PATCH 11/21] arm64: percpu: Annotate __kern_my_cpu_offset() as '__always_inline'
Date: Mon,  7 Sep 2026 17:42:36 +0100
Message-ID: <20260907164247.17223-12-will@kernel.org>
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

Allow the use of per-cpu variables from noinstr functions by marking
__kern_my_cpu_offset() as '__always_inline'. This will later be relied
upon to detect stack overflow of the overflow stack from noinstr C code.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/percpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 3dc7291b16e9..cb9ae8a1ae87 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -21,7 +21,7 @@ static inline unsigned long __hyp_my_cpu_offset(void)
 	return read_sysreg(tpidr_el2);
 }
 
-static inline unsigned long __kern_my_cpu_offset(void)
+static __always_inline unsigned long __kern_my_cpu_offset(void)
 {
 	unsigned long off;
 
-- 
2.55.0.979.g7e5102b832-goog

