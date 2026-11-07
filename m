Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060389;
	b=PnPQvTt7ubU7fUUOWS1HprTo1Tdpxfz2bp9OImGcegWHImzv6JXTmuPesozdroDpV7iz
	 Rt3oEPkYSSFN2qdeXhqYZmizCvPkOWO0CLHpA8lIUMNAoq6UP0NA4Kp6GzNRkQo2mBX2U
	 K6KTAmZvmCRYwBQmb1VLcWk8FAbnK8mzh7Mq229vpTUFO8fpC/mFZf8o0a8e/nNnGMvjK
	 K+01hXqiIxl3mQsZTpd+8oIst7+LW19VIh47aoWvg/QXS+nWZQmSYMw3Yo/Ay6YtG0O2l
	 0l0kxn6ysZMOOMDtCpGbozUUWaN+wkbfxebUV3wSmzOq6rBzm8zsibF8l6YaDLdjUIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060389;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=lN6MEVTLqxQZaRhIMVGcckvM4AhB2Yd9HdbNbDtVrlA=;
	b=Fte9uCzsal4GW8Lph/bjvBXu9pVOP9pLwV048kHNxy93fedjCC9brhm3jGqe7J7ju+jD
	 E5VFPPvAJqU/Z5iDuQmQdt8kz2BMipDW1QOlZOFZ7WfVN1YFQ1t+hJue9GylQdROWYP09
	 IyQ7iDna05+KJO71RWGDaggcar3g+KLGSKmnd5zKQ9eT/+rn+gBFWOordqAXFSjlZMTJK
	 Siztzs3ZQjOoa/AjfopYgZQ1pFCQNNuaZxiJnnCI5aYRQV5Fzo4TH92te4ZcW6zB9ERmI
	 YYva3iEOo2yVupvqgoSHS7q2rpMtNaLjW+LGBs1B1SYdyuG+OfxHNnfC4B3JGkmgVJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WOfL5CB5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB9D606A33B
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WOfL5CB5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 581C91F008A5;
	Sat,  7 Nov 2026 14:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794060389;
	bh=lN6MEVTLqxQZaRhIMVGcckvM4AhB2Yd9HdbNbDtVrlA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WOfL5CB5L+dz7EAp/U9cZKaHOfkSdSte8r9Zl9PdDINIP8kqdNTpe9gExHHcQdRc+
	 pWa71RHtpZkQnijX8QDtR2sxvZOhw1XJkuunIrkapyy0Z8G5lX5rR+TBc8EeSF7Xy9
	 hjCn13ZaUNKh0ITroHRosAmPLqHjCFjMi5XJ+ObKs8ooJxToGY1umSXSxx8je0ZoAy
	 IIVg1V9cmBbuPf2ZZfF2NJe0VTF88QYAXA/0mB5gY3NCSBa5YKjf/5bZhLIu5hwBYW
	 em7cxjInqAzt3gc4VjceyoSAIgauthcJrM5S0I8SCsCkzdvi3NnGj/v89tvYNe0gS9
	 XyXH2FrSoeR8A==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nam Cao <namcao@linutronix.de>
Subject: [PATCH RESEND v5 2/3] riscv: word-at-a-time: improve find_zero() for RV32
Date: Sat,  7 Nov 2026 21:46:12 +0800
Message-ID: <20261107134613.17830-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261107134613.17830-1-jszhang@kernel.org>
References: <20261107134613.17830-1-jszhang@kernel.org>
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

To remove non-necessary zero bits couting on RV32, replace the
'fls64(mask) >> 3' with '!mask ? 0 : ((__fls(mask) + 1) >> 3);'

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/include/asm/word-at-a-time.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include/asm/word-at-a-time.h
index ce04d6a088f6..f2d16c1eea8d 100644
--- a/arch/riscv/include/asm/word-at-a-time.h
+++ b/arch/riscv/include/asm/word-at-a-time.h
@@ -67,7 +67,7 @@ static inline unsigned long find_zero(unsigned long mask)
 {
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
 	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
-		return fls64(mask) >> 3;
+		return !mask ? 0 : ((__fls(mask) + 1) >> 3);
 
 	return count_masked_bytes(mask);
 }
-- 
2.51.0

