Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47CB475340;
	Fri, 11 Sep 2026 12:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789130363; cv=none; b=C6V8bKRrrNyqMNrtRB/XJaxD73vn2FI6t/3/o+1Q6T6c/uUTweJVY7cNCmzqCZizlutmKnEoJR3VXeuGMDyHCkgwDWK8bbC8eq3JmCtNCs3RQxVbzokSJZt4SDWHYxVpRwfO3zaF8EVNL+8JFlVIC+Q8eHSh/blihDbsrgIYVx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789130363; c=relaxed/simple;
	bh=V52LrPSJYBCG0ZBPvLo88XzMhmjeTj74iqiNXlUGvik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rc54p+wqcTcMJCuLd98XksRCC1ZaUPvTT9hqjvO6+wj/q5LgYedc0klNQqp7q09aViCB7v8Hlymr83d4iSS99wDIGvFYHzNZwOASwq2cIiersJyCBn9yihKd1ABfGR85x84EDWKsnztpZ3dvDd8V3OxaiIWThU5CG4gu8mCTAD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jreIqzr7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jreIqzr7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE1B1F00898;
	Fri, 11 Sep 2026 12:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789130358;
	bh=K1U2uLTe8xKS3R6i/dNx58RNdM91azUJqPcLbv1tcnM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jreIqzr7E1gcx+u3Oiql/PfB3Ccwi5IJl/ue9KQwcdfuxlR0Bk3s6kmlkI6wtjKgS
	 nLXGKbWt19P3idQ71IFGfS0ZOk1Snd20sKv6k+e+6/9OBBtiQ3CkdrkLtAZSut87dq
	 Tco8aN2EQoUXj96+WPw2FDVANEv+KQiaA+mVlly3ewm5JusiK6f1WCYp/LiZw2J3Mt
	 a7ZPHzQ3cHWutjBHCpUQV5HbHv4MGFCSzKQ5QlBX3HbqK1nfZGimHJpDp3Vf9dLpsk
	 VMSqZsCSGzwiwAIj1OitO4qBLMU+wirwzJJrsWYcoBBMeicvFlDptA9k0bOJj3ZS9N
	 zhILaCYlPkJmg==
From: Sumit Garg <sumit.garg@kernel.org>
Date: Fri, 11 Sep 2026 18:08:57 +0530
Subject: [PATCH 3/3] media: venus: Skip SCM call for non-SCM PAS backend
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-video-optee-pas-v1-v1-3-7bbddaaac5ba@kernel.org>
References: <20260911-video-optee-pas-v1-v1-0-7bbddaaac5ba@kernel.org>
In-Reply-To: <20260911-video-optee-pas-v1-v1-0-7bbddaaac5ba@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3

From: Sumit Garg <sumit.garg@oss.qualcomm.com>

qcom_scm_mem_protect_video_var() is only serviced by the SCM backend;
with OP-TEE the TEE owns secure memory protection. Use
qcom_pas_get_backend() to issue the SCM call only for the SCM backend.

Assisted-by: Copilot:claude-opus-4.8
Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/firmware.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 3a38ff985822..719dda290606 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -16,6 +16,7 @@
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/sizes.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/string.h>
 
 #include "core.h"
 #include "firmware.h"
@@ -214,6 +215,7 @@ int venus_boot(struct venus_core *core)
 	struct device *dev = core->dev;
 	const struct venus_resources *res = core->res;
 	const char *fwpath = NULL;
+	const char *pas_backend;
 	phys_addr_t mem_phys;
 	size_t mem_size;
 	int ret;
@@ -245,6 +247,14 @@ int venus_boot(struct venus_core *core)
 		return ret;
 
 	if (core->use_tz && res->cp_size) {
+		/*
+		 * qcom_scm_mem_protect_video_var() only applies to the SCM
+		 * backend; other backends (e.g. OP-TEE) own secure memory
+		 * protection and do not service this call.
+		 */
+		pas_backend = qcom_pas_get_backend();
+		if (!pas_backend || strcmp(pas_backend, QCOM_PAS_BACKEND_SCM))
+			return ret;
 		/*
 		 * Clues for porting using downstream data:
 		 * cp_start = 0

-- 
2.53.0

