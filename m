Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47B51E7C23
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 00:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791590663; cv=none; b=Yv8yHjbBbUpu8nXu+QNLyXo+sXnL19EpmoT48uos2R0xvvFNheMmatcP9cV2pMvSyMY7jD9zgsCq2uZ4XIzVNnA8v2Akl5Bkv/7ipmMt3n+o4jLG4mqTZJBcKOnso5UcuZCz5ZZOwGk0cUx6hbJky0+9diXjsNmX42rGIjqa3Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791590663; c=relaxed/simple;
	bh=+f0tPdAjeODdAcr1zqv4ebcec6AY3ZVERwU8ivTsGmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ArcTb1IcTH92yg141fntx/2L0t0Q52DbQWqSncRxoCsxomxCLXb20IGisFvH2gU/dn4p4Gv2FmWti9ju+ADXGHn4eCFjmPd7YpUZ3x7FRNO0kUwGBEUHxmcN8EeUq+fDu25Qt8sh52nD++mWMJ1lJ8R0BsEWS5DeytPXhuAUn4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YT1Ce0cW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YT1Ce0cW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6CC1F000FF;
	Sat, 10 Oct 2026 00:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791590662;
	bh=lN6MEVTLqxQZaRhIMVGcckvM4AhB2Yd9HdbNbDtVrlA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YT1Ce0cWB//Jfkf9IH2b3pr9frpNgdh1jBZMTuzO7uvoNyVQw0UCHL9BWZmTF8x6C
	 xesiD9ilMLB62n/7rvClDXdvRrJh3PT7Nuv0lac3LNDTSJU5k/G3MzV09tk/dvdR17
	 vy0coNf2cjGELhccyD1xavkOkzKtciNPKF+p9vrBi1Mj90sjJcEMLDGeVGWhHBgwBm
	 anQCqDRkKmGEP2p1cCtM7yRhCzbNtfGS1wqBN9Cz0kwNil7LiDNLd/3LDTqfwHkEC7
	 tXUxEqwIs1X1bJSbQYJD7I0zSR2YoDkfJTBACcnGyih9ZNKvZNPpBH/ODV2qk/PxAE
	 oXmPicvMTLTsw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nam Cao <namcao@linutronix.de>
Subject: [PATCH v5 2/3] riscv: word-at-a-time: improve find_zero() for RV32
Date: Sat, 10 Oct 2026 07:44:19 +0800
Message-ID: <20261009234420.29425-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261009234420.29425-1-jszhang@kernel.org>
References: <20261009234420.29425-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

