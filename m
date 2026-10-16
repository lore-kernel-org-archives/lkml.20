Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6F5447238
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792185127; cv=none; b=ZOnN9gqFhTF8XDT1dLs98bj2k8YpCa2eAlWX462JBoa3PztYlquHjaxlM6TylC8jpmiP5xd+ldSqg27tFsUjpGt4b9z+QtqmitTbBz5eE0AXqHEfX/GTTAtVLutwLmujzBBTZlzBZklMlOYp4fr+hueDCwVtSoy45m9kqQQnArQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792185127; c=relaxed/simple;
	bh=vkTR0c01qLKuGP/MBGuCwxrpk2UfwNHK062KXd1/KcM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mdu2Ev5s5iwW9NmgUKthJaLvwdD7KMQcaQRe4r4WmAh5KTuMJcvCHpSs88ZbcaY9mVQwtx3WC9NxWbu9/nfc46Kkmj5sUnG6EYMtV1920eJjf7CCbqMcx0vBZO7ApSGF8YCEVi4mTeteh131wPHHjjOjFZ4OXjEbvWLzOOYVE/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hhIWKh3Q; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hhIWKh3Q"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDBC216F3;
	Fri, 16 Oct 2026 14:12:01 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB81A3F673;
	Fri, 16 Oct 2026 14:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792185125; bh=vkTR0c01qLKuGP/MBGuCwxrpk2UfwNHK062KXd1/KcM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hhIWKh3Q/5nlf7aPdkufCLSSSYQsXy0I7e7u8E1G/pfqOtckLEsGHDxhF4etljP1R
	 X4tVUROFGlCJADnsDTukG5aN+oCXC0YCzTA0y91YKqDI/tMsswMQHIDuljoByuoxwi
	 I6Ntavo/42NzrFodRW1dvvvYHEuhlaIRmL+PcyTM=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 22:11:44 +0100
Subject: [PATCH v2 06/11] coresight: trbe: Save and restore trigger counter
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_buffer_refactor_v2-v2-6-383ac26382fa@arm.com>
References: <20261016-trbe_buffer_refactor_v2-v2-0-383ac26382fa@arm.com>
In-Reply-To: <20261016-trbe_buffer_refactor_v2-v2-0-383ac26382fa@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792185112; l=1650;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=vkTR0c01qLKuGP/MBGuCwxrpk2UfwNHK062KXd1/KcM=;
 b=dyQNi+IMy9C/+FRYKYyUyMYuiCHOCCAEo7Pe5orDfqWdwxv96+k+GABYO4x0FxybQler+3Z71
 3F65qmjw9eXCaQ1qxJ1B4rDLsfsj4SWSxRLisqnweqHTDC0E2KBltrO
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

Add TRBTRG_EL1 to the saved TRBE state and restore it along with the other
TRBE registers.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 8187e264ff3c86d445b96c4935a8dbdf5ad9e77c..391e5013647477ae145d777d406c63355bc38278 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -127,12 +127,14 @@ static int trbe_errata_cpucaps[] = {
  * @trbbaser		- Trace Buffer Base Register value
  * @trbptr		- Trace Buffer Write Pointer Register value
  * @trbsr		- Trace Buffer Status Register value
+ * @trbtrg		- Trace Buffer Trigger Counter Register
  */
 struct trbe_save_state {
 	u64 trblimitr;
 	u64 trbbaser;
 	u64 trbptr;
 	u64 trbsr;
+	u64 trbtrg;
 };
 
 /*
@@ -1537,6 +1539,7 @@ static int arm_trbe_save(struct coresight_device *csdev)
 	state->trbbaser = read_sysreg_s(SYS_TRBBASER_EL1);
 	state->trbptr = read_sysreg_s(SYS_TRBPTR_EL1);
 	state->trbsr = read_sysreg_s(SYS_TRBSR_EL1);
+	state->trbtrg = read_sysreg_s(SYS_TRBTRG_EL1);
 	return 0;
 }
 
@@ -1548,6 +1551,7 @@ static void arm_trbe_restore(struct coresight_device *csdev)
 	write_sysreg_s(state->trbbaser, SYS_TRBBASER_EL1);
 	write_sysreg_s(state->trbptr, SYS_TRBPTR_EL1);
 	write_sysreg_s(state->trbsr, SYS_TRBSR_EL1);
+	write_sysreg_s(state->trbtrg, SYS_TRBTRG_EL1);
 
 	if (!(state->trblimitr & TRBLIMITR_EL1_E)) {
 		write_sysreg_s(state->trblimitr, SYS_TRBLIMITR_EL1);

-- 
2.34.1

