Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794225924;
	b=ldYawCeC5+sQHXmO+NUx3Nhef4ej2fslKlnJhp6evYYQ1hkwabwybnn4nTbIQSZwlfia
	 Q1z3ZH7EtQKRsmoQy69ycmrng1qnK6ezuz4vrJj8TBJR9QRgtNrs2p9aE+y8wFuE5eqHL
	 vQeDIO8vwEeeFIfoJ99LE/EpM+06HOdr+dD6Bf19Q9Q/auEU0XcKazbZTTXH98A/PT7ip
	 XFongrIKY4biFJIH4jOPWkUfRo7N3yijVkSJuXUFQhmg3S8/E4fHX1SuQzRlpR8693O8x
	 KrkOiOwuKKuGYW8qUG/qqpa4Yk3DkZ9B8rlczRaLJ68d0wqwolH4n0qCXsrdV6welKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794225924;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=RuOhAvZnPjP1XPHFbitmFrHHdHIPhu/o1Rlh2k3boNo=;
	b=rcPIFHCTg4HvnoVZwF/GdYg9zKtObbY3VKigzImnoVuJGziTlVLffKLRJPsO4Rg6jQUQ
	 Qh5vT3jAhFtV0MIx5a/4u9B5jU8XtaNpnja3HI9F1Q2PIvexpS/FhMxCkjAagonytYZhD
	 0oJl9Yx7b26f6V22TNCYOVbPgL83b2828gbzPH/T7Gw6kVnx2hM7n/nr/bUE2S6B+vG5S
	 dbAAez/izXsoU963A39C6mKiYGktpFUrky6KLs486k8jYdotiTTnoGu77fLfJUsfmdKig
	 jKAHIxID+mPJng5olLIaLzrbsZp17vhPBgiBvFn4OUWPypFkViRMLgWBwi8bX8NbHbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="EIiHA/jn";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4C0606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EIiHA/jn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9429B1F0089F;
	Mon,  9 Nov 2026 12:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794225924;
	bh=RuOhAvZnPjP1XPHFbitmFrHHdHIPhu/o1Rlh2k3boNo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EIiHA/jnHvo+Q4fpvT8AJOyb2hpOJY7Xo9vMny81pnTTP4xxoyuWC2gRSKz4nw+f7
	 vZuiWM6/9cL7w6O9dQjHrrvVLyWmsheXkoPwm9iiXuOETC0zQurR5JjE2S4z8ASP7e
	 rjU5+0PyNPxmONuxlmN+MbIrdWuSerwdAud1UIbuzvyn8mb50OOM8MPqN5eFkS+yrH
	 BPd+uz+qRkC3tHmfgoyj3amIn3bnNLznREzxXgOyE8HLPQwMrXaT7Cc8kEpaLoTAY4
	 z52qrphTGlnFIfOo54i5BRzjhKJFuLwz3foLVPpES4nlVrKmWlx/Naki/dR4qzP/ys
	 c5V6fWR8imoJw==
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
Subject: [PATCH v2 3/6] kasan: Always inline kasan_hw_tags_enabled()
Date: Mon,  9 Nov 2026 19:44:56 +0800
Message-ID: <20261109114500.20298-4-jszhang@kernel.org>
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

The arm64 MTE entry and exit helpers call kasan_hw_tags_enabled()
from noinstr code. Although kasan_enabled() is __always_inline, its
wrapper kasan_hw_tags_enabled() uses plain inline.

With CONFIG_KASAN_HW_TAGS=y and CONFIG_CC_OPTIMIZE_FOR_SIZE=y, GCC
emits kasan_hw_tags_enabled() in .text and calls it from .noinstr.text.

Mark both definitions __always_inline so the runtime check inherits
its callers' instrumentation restrictions.

Verified that the out-of-line symbol and calls disappear from the
arm64 entry-common.o object after rebuilding.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Assisted-by: LLM
---
 include/linux/kasan-enabled.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/kasan-enabled.h b/include/linux/kasan-enabled.h
index 9eca967d8526..14a9e9fd6c6b 100644
--- a/include/linux/kasan-enabled.h
+++ b/include/linux/kasan-enabled.h
@@ -35,12 +35,12 @@ static inline void kasan_enable(void) {}
 #endif /* CONFIG_ARCH_DEFER_KASAN || CONFIG_KASAN_HW_TAGS */
 
 #ifdef CONFIG_KASAN_HW_TAGS
-static inline bool kasan_hw_tags_enabled(void)
+static __always_inline bool kasan_hw_tags_enabled(void)
 {
 	return kasan_enabled();
 }
 #else
-static inline bool kasan_hw_tags_enabled(void)
+static __always_inline bool kasan_hw_tags_enabled(void)
 {
 	return false;
 }
-- 
2.55.0

