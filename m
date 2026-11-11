Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794400829;
	b=IAdFaGMC1QtViFNuEuJLcpS/AcISeREPDMJmnqgSb1cwNmy5TwsAseblLTcz50JDc/B6
	 X4Xg7XDWZJqLl9MZgottCvGHEyQbLcDaOp9hl1MK/vTrBfIrIGuy1t9dR0TWw57Omq3NU
	 bd5vYOcfkW20bZwHKQi36WMXUBp5mUPOLFdzHHs2kjzt3pjsghRYc4HN4VrcKdsVbzWek
	 +5s+1H6YKTIIQZHR8URH8jIbhPtMR+gEiKQOGOvjqw4WAmRZixSSf6ZWT/wLA+yZn9JCD
	 /Fknxdeq727LamaItggDVMUQZds20PH+/NhayNMWecvNthgwDYCGEMVE+tNsxwOmMOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400829;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OQisv41zonTwK6MIXLSJWGm8DbW31eQIK/zim4WS9w8=;
	b=5Mh1IeOrpYCm4bFYsac5w1RJWR3CaSFkTdygeiORFtnPIzAQxePadaRnLF1iARR/zNFI
	 ldRyojwkkD453u59ZvL4VPUNM7EHIRnAeNuE0NoFb6agtLQiqrVDI5V8FYVdaTY6OzNz/
	 MJc8STQ/K1VU0ucUlMUcb5xcVB9BtS+1Cs5UDTcMkwobKKWlWyf98IcX7iH2mP4zEEujN
	 DAzRo9ccBjn//CNcSOXtgqb2MCwlyHufdt46YZPXC5zFpWgC3s6GRUc6CYqvoMQ1kK+fZ
	 XEvYWyYmMx2hks+oToThnS6rUbImbCwGEpy7MoUydeclqoEw270GqpNicFCEYJjoipg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ec8SJnfk;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7676F606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7676F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ec8SJnfk
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D90431576;
	Wed, 11 Nov 2026 04:40:25 -0800 (PST)
Received: from e143943.arm.com (unknown [10.57.69.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7D6DD3FA32;
	Wed, 11 Nov 2026 04:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794400828; bh=fdhI5OJ6JP19A+vzyhmagkBe6w4lslzc0+1PixJDvII=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ec8SJnfkAdMPT92Z/+CH6iNkSHpUNNB0dLugjgdBQt0S+egm6Ll2HQgyayzx97WKk
	 SqCF92s4C8Dhfdk9dAkw8oPa7wFCkYCkfUqZkK+rixdaupxhC/zMvN8b32UZR2ml5b
	 TdDYtWWp8mR/dZPsubI8bREGheZ8MxkCC1X17B9A=
From: Beata Michalska <beata.michalska@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Vladimir.Murzin@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	suzuki.poulose@arm.com,
	xuewen.yan94@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: topology: Reduce the skew for AMU feedback counter sampling
Date: Wed, 11 Nov 2026 13:39:29 +0100
Message-ID: <20261111124005.2688820-4-beata.michalska@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111124005.2688820-1-beata.michalska@arm.com>
References: <20261111124005.2688820-1-beata.michalska@arm.com>
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

With the FFH support for CPPC, the AMU feedback counters, core and const
counter, are being sampled to measure CPU performance. Checking for errata
(which can affect both counters) between the reads delays the second
sample and can skew the result.

Take both samples in succession, then discard values from affected
counters. This narrows the sampling interval used for CPPC feedback.

Signed-off-by: Beata Michalska <beata.michalska@arm.com>
---
 arch/arm64/kernel/topology.c | 76 +++++++++++++++++++++++-------------
 1 file changed, 49 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 66ac67bd025e..c968fa5b0c88 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -381,29 +381,45 @@ enum cpc_ffh_ctr_id {
 	CPC_FFH_CTR_CONST = 0x1,
 };
 
-static void cpu_read_corecnt(void *val)
+static inline void cpu_read_corecnt(void *val)
 {
-	/*
-	 * A value of 0 can be returned if the current CPU does not support AMUs
-	 * or if the counter is disabled for this CPU. A return value of 0 at
-	 * counter read is properly handled as an error case by the users of the
-	 * counter.
-	 */
-	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT) ?
-		0UL : read_corecnt();
+	*(u64 *)val = read_corecnt();
 }
 
-static void cpu_read_constcnt(void *val)
+static void cpu_try_read_corecnt(void *val)
 {
-	/*
-	 * Return 0 if the current CPU is affected by a HW erratum.
-	 * A value of 0 is also returned if the current CPU does not
-	 * support AMUs or if the counter is disabled. A return
-	 * value of 0 at counter read is properly handled as an error
-	 * case by the users of the counter.
-	 */
-	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT) ?
-		      0UL : read_constcnt();
+	if (!this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT)) {
+		cpu_read_corecnt(val);
+	} else {
+		/*
+		 * A value of 0 can be returned if the current CPU does not support AMUs
+		 * or if the counter is disabled for this CPU. A return value of 0 at
+		 * counter read is properly handled as an error case by the users of the
+		 * counter.
+		 */
+		*(u64 *)val = 0UL;
+	}
+}
+
+static inline void cpu_read_constcnt(void *val)
+{
+	*(u64 *)val = read_constcnt();
+}
+
+static void cpu_try_read_constcnt(void *val)
+{
+	if (!this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT)) {
+		cpu_read_constcnt(val);
+	} else {
+		/*
+		 * Return 0 if the current CPU is affected by a HW erratum.
+		 * A value of 0 is also returned if the current CPU does not
+		 * support AMUs or if the counter is disabled. A return
+		 * value of 0 at counter read is properly handled as an error
+		 * case by the users of the counter.
+		 */
+		*(u64 *)val = 0UL;
+	}
 }
 
 static inline
@@ -461,14 +477,20 @@ static void amu_read_core_const_ctrs(void *val)
 {
 	struct amu_ffh_ctrs *ctrs = val;
 
+	cpu_read_corecnt(&ctrs->corecnt);
+	cpu_read_constcnt(&ctrs->constcnt);
+
 	/*
-	 * cpu_read_constcnt() incurs slight latency due to the
-	 * ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT check.
-	 * Read it first to minimize the sampling skew between the const
-	 * and core counters.
+	 * Return 0 if the current CPU is affected by a HW erratum.
+	 * A value of 0 is also returned if the current CPU does not
+	 * support AMUs or if the counter is disabled. A return
+	 * value of 0 at counter read is properly handled as an error
+	 * case by the users of the counter.
 	 */
-	cpu_read_constcnt(&ctrs->constcnt);
-	cpu_read_corecnt(&ctrs->corecnt);
+	if (this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT))
+		ctrs->corecnt = 0UL;
+	if (this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT))
+		ctrs->constcnt = 0UL;
 }
 
 static bool cpc_ffh_reg_valid(const struct cpc_reg *reg)
@@ -543,10 +565,10 @@ int cpc_read_ffh(int cpu, struct cpc_reg *reg, u64 *val)
 
 	switch ((u64)reg->address) {
 	case CPC_FFH_CTR_CORE:
-		ret = counters_read_on_cpu(cpu, cpu_read_corecnt, val);
+		ret = counters_read_on_cpu(cpu, cpu_try_read_corecnt, val);
 		break;
 	case CPC_FFH_CTR_CONST:
-		ret = counters_read_on_cpu(cpu, cpu_read_constcnt, val);
+		ret = counters_read_on_cpu(cpu, cpu_try_read_constcnt, val);
 		break;
 	}
 
-- 
2.43.0

