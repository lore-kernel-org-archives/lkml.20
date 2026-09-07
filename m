Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41080509EF9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788795063; cv=none; b=WYG7hctYzFgA7/lS6+5xouavgbGmLzpxvDe9Uzux+BZBOlu4om+j1Bup266JgKyyhSg99gC+yyE1wAs//9GnFaVkNFt1pERyEr6QaWu+BV36EYSMcYwZaCWby87zWQLAGV3Q8kGGxTAALG4Xtdtm85yNSDCn+KTK+CJDIQLEVFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788795063; c=relaxed/simple;
	bh=xNviF0x+9Ezvq2RBwqqfdR68vwj/iGmWyIWY9YebzMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aIQbCyfkm25cUDyk5ovJpS26zkF9SyWHUaiMu1CGOeo5XyvK6jSaCB7zilZ2H3Cuo6t4ixTdZ76c93FGFGdtPGL0ZBtA+1hrlREr0zPKTSBAA/2tM9UKAeMQKKg/o62xZgf9yPH4jRJjR2ypHN7Oe3TYsEb1LwRugszplNcm8fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVw6X8N+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVw6X8N+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A27EA1F00A3A;
	Mon,  7 Sep 2026 15:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788795061;
	bh=gPSXCb0eA8BM+P5Y//s4nfh/kZxqoCvqmOhim53CK5s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HVw6X8N+utM+7JDNNFBTJ6314EnGppkvDrdoo/DJ1cIgh6HQDf5/ltQfz0/YndugQ
	 nxlxrNvSvSBJKNPilHQ9ielMzQezBDtSBJhcpX/61E+WFuFtqgoOfGOudln2bnsRsL
	 cH54ofASFpHzZdw91vaozCCtLniOPSFJGd7IKIqB8gguLvElxkUCs+dpbuOcfseq9x
	 2l8C6AewxhCpYJMR/FvK8ND1kM7kxEKIAV0A68s6XYLJj2qNCKfloNrLCYqhwotUNd
	 Qpc87G04ZhZJUYHVFqTt+t5LbHaEsOcA4KfEbeJcSC4xSiHlfDvQFD26XYn/21N2Pq
	 8FoIExiR5SThA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] riscv: word-at-a-time: improve find_zero() without Zbb
Date: Mon,  7 Sep 2026 23:11:07 +0800
Message-ID: <20260907151108.7538-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260907151108.7538-1-jszhang@kernel.org>
References: <20260907151108.7538-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previous commit improved the find_zero() performance for !RISCV_ISA_ZBB.
What about RISCV_ISA_ZBB=y but the HW doesn't support Zbb? We have the
same heavy generic fls64() issue.

Let's improve this situation by checking Zbb extension and fall back
to generic count_masked_bytes() if Zbb isn't supported.

To remove non-necessary zero bits couting on RV32, we also replace the
'fls64(mask) >> 3' with '!mask ? 0 : ((__fls(mask) + 1) >> 3);'

We will get similar performance improvement as previous commit for
RISCV_ISA_ZBB=y but HW doesn't support Zbb.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/word-at-a-time.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include/asm/word-at-a-time.h
index 1dcac57a73dd..f2d16c1eea8d 100644
--- a/arch/riscv/include/asm/word-at-a-time.h
+++ b/arch/riscv/include/asm/word-at-a-time.h
@@ -65,8 +65,9 @@ static inline long count_masked_bytes(long mask)
 
 static inline unsigned long find_zero(unsigned long mask)
 {
-	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB))
-		return fls64(mask) >> 3;
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
+	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
+		return !mask ? 0 : ((__fls(mask) + 1) >> 3);
 
 	return count_masked_bytes(mask);
 }
-- 
2.53.0

