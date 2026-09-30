Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B782150B8A7
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773269; cv=none; b=oheHzqOgpMtMfZp4Ck0WU53awiuC4wt/Pk4iVBrwirf9zgoHCoEHPNmApJATuL0KdngfI4BLBQ5RB6OdqO0JVFrpA/W2at9ylW64ITX3yjvEUySPa33wpr6orAtQbfZIGIkHYvKTByrGZos9vClUOqTuJF2s7sg1QmS77Urp6jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773269; c=relaxed/simple;
	bh=Dj5Z/WohOSJHNdv7o9yzz2I602uR3qs7ixurwEOqtY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pP8U2aJ32HUmcRj19fRyGhdKe8BdcmcTvvCt46f2rCOW/4NhdPRtw+jWqtdpHbg6ZOuHz0l9bqSNaspMt4QLQQCLTiucJUSoQS2CEt+FbktoUvVyfFzfZG4lICasUhwTjVTe/AWBdLV7FgEafnev/i5JPoPpeKQL3K4xi6sF26Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=buhO/FgQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="buhO/FgQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE231F00899;
	Wed, 30 Sep 2026 13:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790773255;
	bh=rKO/591w96jBGNwNPis4Esl3eE44Oz2ZvFVJ98DQOAM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=buhO/FgQDcWs+Pptvxi1gPsHG0met8Q2h3ep61uUtmCS37juIStsyxdMCj657EQHf
	 64vJwZ6Z/JLUvtC3tYEE37/5V2A8BDAgFpxmBt2RKwixKauSxPm86oybIwpfxSLXCj
	 6T/7l4ft+UdKMxCP7NM2I5ZZ7fWgfhHn5nmtDDFbqm5tcX2KvkvpE8uSAoRdM0k0T7
	 IhK+8V2olyrtO7HMaP1HzKiJBITWIzhszbDuPqttif6MsWgf3wuXQRtSoNu//hyZLX
	 LsLi6UT271ovNZ0DjyFOXTD8OAbAynqeSayg2pwfQAiFtuQAwQx6H+PqAdjuh7nxgQ
	 1h74nidrvl0nw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] riscv: word-at-a-time: improve find_zero() for RV32
Date: Wed, 30 Sep 2026 20:40:51 +0800
Message-ID: <20260930124052.21986-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260930124052.21986-1-jszhang@kernel.org>
References: <20260930124052.21986-1-jszhang@kernel.org>
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

