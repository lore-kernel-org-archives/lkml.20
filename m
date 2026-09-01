Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FD8376483
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 05:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788238824; cv=none; b=mNF8m9f8lQ8vVKJF9nH6HfFYvG644X/6ZUSY0AIoxYiK+UDhK6MJ9OGCQmppy7VWs4WEe9vBczkD6bmq+mxJtB+5ietgmKXCn6N1aleQgSHAqmWMM7Vy9E4EeC45vRsuDMovY6UejMVlKciQEh6kIW32WVPbO/1s9RTF+A2xmVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788238824; c=relaxed/simple;
	bh=jy33/Tc52BzbW3MkRv/+6XiOGSKTPkOy55r39xq3KKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZDq/tdnKGOt5xNoDpROTkwv9q/P12PRT57+cwupO5hJyVJJNSoCdeIlVMXZqDnelP86DcuOZ7ga01WrZlz/rA7yZKIOluBwqtTmohyLtCIfsXP0NRxilK3MTu6iG44lf8kKWQ1bedlziuH08l9evoKCrzXhvkEBUeFhivBlBB0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhggRRq7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GhggRRq7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B170B1F00A3F;
	Tue,  1 Sep 2026 05:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788238822;
	bh=n3Q8RF4M/hgya8VOSqKUVI4WBX6zl6C8eGltqGxQCpU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GhggRRq7EsKH9sMWM8k2d1uwhxzAJSJ9aPSF4BJYxuRYt9xWdzISSPhs89uRS9m/I
	 zFMw5vieOpZtlT/2km9PpRFzZi43/8MhQPQgDLc6kKndW0NPTQspq0HjaeDVm4kDty
	 r7KvqKrS/QPIybbO58rC3bcvQKJzqSsgZr3pqSEuwnEXh3l+RoMugsXeRjShgskpNO
	 cdrjp59786xLx9ShpJ11UcCYfEo9E2LqmE467u2xZaKvTVlpso1VloBR458X9e6hwF
	 KfV0OXJe9M7jtIUu0uJOAncLYVZKBaokwoNRaUmQX5up0dTbpzVBvLT7LG+tmdETfu
	 ooqEcrsq7CTQQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 2/3] riscv: word-at-a-time: improve find_zero() without Zbb
Date: Tue,  1 Sep 2026 12:40:30 +0800
Message-ID: <20260901044032.5635-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260901044032.5635-1-jszhang@kernel.org>
References: <20260901044032.5635-1-jszhang@kernel.org>
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
 arch/riscv/include/asm/word-at-a-time.h | 29 ++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include/asm/word-at-a-time.h
index 0c8a9b337f93..ca3d30741ed1 100644
--- a/arch/riscv/include/asm/word-at-a-time.h
+++ b/arch/riscv/include/asm/word-at-a-time.h
@@ -42,9 +42,36 @@ static inline unsigned long create_zero_mask(unsigned long bits)
 	return bits >> 7;
 }
 
+#ifdef CONFIG_64BIT
+/*
+ * Jan Achrenius on G+: microoptimized version of
+ * the simpler "(mask & ONEBYTES) * ONEBYTES >> 56"
+ * that works for the bytemasks without having to
+ * mask them first.
+ */
+static inline long count_masked_bytes(unsigned long mask)
+{
+	return mask*0x0001020304050608ul >> 56;
+}
+
+#else	/* 32-bit case */
+
+/* Carl Chatfield / Jan Achrenius G+ version for 32-bit */
+static inline long count_masked_bytes(long mask)
+{
+	/* (000000 0000ff 00ffff ffffff) -> ( 1 1 2 3 ) */
+	long a = (0x0ff0001+mask) >> 23;
+	/* Fix the 1 for 00 case */
+	return a & mask;
+}
+#endif
+
 static inline unsigned long find_zero(unsigned long mask)
 {
-	return fls64(mask) >> 3;
+	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
+		return !mask ? 0 : ((__fls(mask) + 1) >> 3);
+
+	return count_masked_bytes(mask);
 }
 
 /* The mask we created is directly usable as a bytemask */
-- 
2.51.0

