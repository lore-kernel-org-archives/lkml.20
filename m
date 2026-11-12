Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510756;
	b=2/yXtNDr7SJzAieqHowaA9u6+KVYyu4IBFgnysHOvPxygiOVI5TCJuZsZiIeJwGjrOl1
	 SdJElFGiA84v2d3nM0fp1X7DAFsdR7hR3cfH0NLC9285YpNh9HEfOqK1OE0g5gdSkcEcm
	 VGrGWnWTVBXCN2htDXXF9duBn2W/jy1usrg7anOjP0KEP69Z+yXt5r4eX+83ZRk64iV4X
	 zz1lsj/XLTsRWA6psx+NZJ6Ga62JpwdOB/FPEZkcc2gyMBSBPEpEl1R3xDLt8oUNLG1U8
	 zl9B/Qj6qb5EA42cv59gSNh5jcOj0JLVabsvBdE0B6OlPsna594k3Xc4aINLEbHnASQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510756;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DVkz0UZLTs7I1LooIbYzT7d/+amjhMIGXKxwIrrHSHI=;
	b=fN23deYD/PomFNoCJEPQMbfOTYdQh27srErjBfWojk8MmVJEW4MXLcp0jWIPD7XHP/Ud
	 SF6zd4td38bMcAZpuWnWG6T31sPZoKp3ovknSkIwej7QwAwWzFYbBqfTWpojZYgQZFpjL
	 z5VI11QkmlGGZeTuPpuHgdEgPvRWZNRT1At8ETCEwaH21IvB1f+OWPcWU2J1HlIhUvWY6
	 jhzP2OFS93q+A0gw+Wjk431E6lJbLtfjK7ptuEELfxXZycOHp504ihy+TFPdIAQHTUPym
	 2VI4Mf72ILxGMkXHx5l3TUXfLcd+mj6wfUipruezto1CncZmj4TOQw6rAYLTVIDgo1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MOQ910Wy;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B44E660A260E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B44E660A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MOQ910Wy
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4309F165C;
	Thu, 12 Nov 2026 11:12:32 -0800 (PST)
Received: from e143943.arm.com (unknown [10.57.66.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8B55E3F632;
	Thu, 12 Nov 2026 11:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794510755; bh=PvN8tedJB6Toir/Xd6zuZyZuu5gAER3iy5Ik24jAPnk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MOQ910WyDyxDDppNZCQGQIZXFJi5nFSHmf7UMt0bkNAf1zmLbTroHb5hAWmCFvJuF
	 V94m+4qj8LBnvLrcPG7EMENSnQCNdH/z3CYaE0CsBib4L6imcUO2/Eh+I2dLewRQB1
	 dvGuh9hf0v2WIIUaUuXt/rnUg74Pnbwee6jyBeiw=
From: Beata Michalska <beata.michalska@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Vladimir.Murzin@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	christian.loehle@arm.com,
	suzuki.poulose@arm.com,
	xuewen.yan94@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: topology: Reduce the skew for AMU feedback counter sampling
Date: Thu, 12 Nov 2026 20:12:09 +0100
Message-ID: <20261112191211.3336725-4-beata.michalska@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112191211.3336725-1-beata.michalska@arm.com>
References: <20261112191211.3336725-1-beata.michalska@arm.com>
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
one and can skew the result.

Read both counters in succession if none is actually affected by HW
errata.

And while at it, update the comments to be more accurate (or less
inaccurate).

Signed-off-by: Beata Michalska <beata.michalska@arm.com>
---
 arch/arm64/kernel/topology.c | 38 ++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 30a52659f15c..d00aec6354e4 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -384,10 +384,10 @@ enum cpc_ffh_ctr_id {
 static void cpu_read_corecnt(void *val)
 {
 	/*
-	 * A value of 0 can be returned if the current CPU does not support AMUs
-	 * or if the counter is disabled for this CPU. A return value of 0 at
-	 * counter read is properly handled as an error case by the users of the
-	 * counter.
+	 * Return 0 if the current CPU is affected by a HW erratum.
+	 * Otherwise, return the AMU counter value.
+	 *
+	 * A counter value of 0 is treated as an error by callers.
 	 */
 	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT) ?
 		      0UL : read_corecnt();
@@ -397,10 +397,9 @@ static void cpu_read_constcnt(void *val)
 {
 	/*
 	 * Return 0 if the current CPU is affected by a HW erratum.
-	 * A value of 0 is also returned if the current CPU does not
-	 * support AMUs or if the counter is disabled. A return
-	 * value of 0 at counter read is properly handled as an error
-	 * case by the users of the counter.
+	 * Otherwise, return the AMU counter value.
+	 *
+	 * A counter value of 0 is treated as an error by callers.
 	 */
 	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT) ?
 		      0UL : read_constcnt();
@@ -460,15 +459,24 @@ bool cpc_ffh_supported(void)
 static void amu_read_core_const_ctrs(void *val)
 {
 	struct amu_ffh_ctrs *ctrs = val;
-
+	bool corecntr_broken =
+		this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT);
+	bool constcntr_broken =
+		this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT);
+
+	if (!corecntr_broken && !constcntr_broken) {
+		ctrs->corecnt = read_corecnt();
+		ctrs->constcnt = read_constcnt();
+		return;
+	}
 	/*
-	 * cpu_read_constcnt() incurs slight latency due to the
-	 * ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT check.
-	 * Read it first to minimize the sampling skew between the const
-	 * and core counters.
+	 * Return 0 if the current CPU is affected by a HW erratum.
+	 * Otherwise, return the AMU counter value.
+	 *
+	 * A counter value of 0 is treated as an error by callers.
 	 */
-	cpu_read_constcnt(&ctrs->constcnt);
-	cpu_read_corecnt(&ctrs->corecnt);
+	ctrs->corecnt = corecntr_broken ? 0UL : read_corecnt();
+	ctrs->constcnt = constcntr_broken ? 0UL : read_constcnt();
 }
 
 static bool cpc_ffh_reg_valid(const struct cpc_reg *reg)
-- 
2.43.0

