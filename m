Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E839838CFE1;
	Fri, 11 Sep 2026 12:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789130359; cv=none; b=c2Ci938JrEDI3Elwzo1DC/QTcnxH4UvutazXxMlcn9X64OU2L60iyQA8yW+Yw23GFqG/hZ1FCpIGLIj6utw7rNKsCdFxJHFKR4+roTy/EkqigZPb8rB0jcQgVRPwduT8om6KiPKnCiAl3DIUkIRGaOYFc7myKPAAVMg6CyfajnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789130359; c=relaxed/simple;
	bh=owpyveLHT0E2gZ6qfHvuYVlsGGwb7yQYbmIDzyIRqiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UcVml2gvAMS8uyX4pnjt5ZYHhW/WJQI2IrRsiUTEVnzGziH+dKzxRqte8z05q1Y+YRxkKE1RO7SawFxJgPHdfSKnJg+Og1gFNzFo2reTifLtTmb+56Y1zOkb5xBROG7jMRIRbiyFOoaWP7ebdtql+a2b0bJOuOoCgh5xuaILjoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QWgxCm6f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QWgxCm6f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20FB1F0089C;
	Fri, 11 Sep 2026 12:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789130354;
	bh=gAxYXCi3F1z9vDbU8UKdtio2EkghuEvjVX57djuNuiw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QWgxCm6fmoZn4vyt/x4gzeUzH8KVrhKV/JUeleAPPZbe1m05tS3CD6mCZeTouNP9q
	 xoufNAeq0TPHZ3skqNETmw4xiCGZ7E9tsrN9xAt72oipKsFhJYsEvv8nA+DcklBIhC
	 wQib1ZLsQbwC66NV+A9FppXwSEhjZLRT1cnL1odGXCR5EkLUUY6xUrA9oretMOFCoN
	 rhi0wT11/zV47zkL5fV860cncFOnAfF1KdIt3n76epEwP5itNr4YsVxtx2mayd/XOZ
	 XLUHvl1LCsaqIcVaX2ulb+KU/S39uesw/t3k5CXXJ7z6adFn56/TtDBlbZVnAbiXo5
	 UbXiKM28EXVmA==
From: Sumit Garg <sumit.garg@kernel.org>
Date: Fri, 11 Sep 2026 18:08:56 +0530
Subject: [PATCH 2/3] media: iris: Skip SCM call for non-SCM PAS backend
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-video-optee-pas-v1-v1-2-7bbddaaac5ba@kernel.org>
References: <20260911-video-optee-pas-v1-v1-0-7bbddaaac5ba@kernel.org>
In-Reply-To: <20260911-video-optee-pas-v1-v1-0-7bbddaaac5ba@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
X-Mailer: b4 0.14.3

From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>

qcom_scm_mem_protect_video_var() is only serviced by the SCM backend;
with OP-TEE the TEE owns secure memory protection. Use
qcom_pas_get_backend() to issue the SCM call only for the SCM backend.

Assisted-by: Copilot:claude-opus-4.8
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_firmware.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 21cdf1c39835..7fbe71e21bcb 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -9,6 +9,7 @@
 #include <linux/of_address.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/string.h>
 
 #include "iris_core.h"
 #include "iris_firmware.h"
@@ -158,6 +159,7 @@ static int iris_load_fw_to_memory(struct iris_core *core)
 int iris_fw_load(struct iris_core *core)
 {
 	const struct tz_cp_config *cp_config;
+	const char *pas_backend;
 	int i, ret;
 
 	ret = iris_load_fw_to_memory(core);
@@ -172,6 +174,15 @@ int iris_fw_load(struct iris_core *core)
 		return ret;
 	}
 
+	/*
+	 * qcom_scm_mem_protect_video_var() only applies to the SCM backend;
+	 * other backends (e.g. OP-TEE) own secure memory protection and do
+	 * not service this call.
+	 */
+	pas_backend = qcom_pas_get_backend();
+	if (!pas_backend || strcmp(pas_backend, QCOM_PAS_BACKEND_SCM))
+		return 0;
+
 	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
 		cp_config = &core->iris_platform_data->tz_cp_config_data[i];
 		ret = qcom_scm_mem_protect_video_var(cp_config->cp_start,

-- 
2.53.0

