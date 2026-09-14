Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A1E4137B1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375422; cv=none; b=Lemiwm1TXcpq9rxsoaxBYiqUupvEWEX7vwTJmyluhxxgMaN69u0cgMzDeDg9wFk7mnA9I/FEfSawXkWLlBytb0HgGkeM6rpmEJ9i1zb7qHGvmKBJfAOn7EZLE28w2j/8IMbuS2klOUg1fxI3CftbdI6AdXQYnO3f0yx/G2ETeio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375422; c=relaxed/simple;
	bh=vqE0EoMrlaW3tUQpmOPadAmdMy5Z9QbC3HqKAUDOUuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G24KwVuKpkOEQ1VchLQK/kPeAE9G3SYiYHrn6rzhgjWs1CpZRfPcGCWCS/HgkGbzTHDHy7AG8jGaaJxnObCLSz4WVgeYgBn/LXetCg1Ztwf/9/1OOkeoynOmYuNimwD15qTMAu1saIhEyYYFzXeg7cvJaKp9h8pwYE5cD7sjD3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gX2kYUav; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P62LKLyo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gX2kYUav";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P62LKLyo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E7SBW53351863
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ga1VKYJb4kZ
	EzQaYZ2oJoM7S1SqpasGSncxMKcHofsw=; b=gX2kYUav5ISCq4fftUsbdbQFdV6
	J8F2r/uDVcgmVT8mgZ3CKa3/t1UzhoQFSKV3CaqsonsM70MHWaX+Ws6mTDGD3Zih
	WmnoQeatyWSsGLx0VlXiImMi0U5UmNnhEB+g2DAilope6wPWLIrVrfAhclBsAXuc
	QkDnsONBT+MEjW2t0QhkBhSu2FIa+pA91PeH4HiiWUSAS1d2sX4H7blJPLCruHiG
	BeunEWmAaDfniN6J4khk7TcYSDObvN4vgl25R0zc9ZEXni8/J0eG/rsXj7j/v4dd
	YHtqWmGv/dxIvtoytoSip/Vt1RfJBFQVp9wF7WVYjBoExzMArA1uPHX9WlQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg08nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:43:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso6227589a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789375412; x=1789980212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ga1VKYJb4kZEzQaYZ2oJoM7S1SqpasGSncxMKcHofsw=;
        b=P62LKLyot+WhOKifOkOXK9sViVPDl1+GGp/ml/dyEUP0cVOjTREDpFpph2VlixckMe
         W2KvFuLprLcvCScoQVR7wUAfx0j/CmMkd8xlVims5vXFh06T18zo/WWyxl1ejBLxI2BT
         iYedeujLcJ9HhegpB6XvP9dRDakt74LYEO5je8fCur7kKQJY8i7KP5thKoaYuE+aFzs7
         AHHLSI6gzx8irrMRA514jFRmbRT1BoPxX997iLfRODttz55bsng3siQL1md17Pwnz3Wc
         TdUmetsK22jR+jNbvHDJx7TKXV59Qd+2eDzWXCN4VE5QfQTdMsZsuFszXaQaSNbDURGF
         NTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375412; x=1789980212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ga1VKYJb4kZEzQaYZ2oJoM7S1SqpasGSncxMKcHofsw=;
        b=kaDpRDX3p6URM9NCLDxkNyztvSSo9VEab6CQLFsDJ+Hre+xSVAh/wpHYoK7b+RA0nr
         1mz2muHx2+W9sFX/vFCNMK8B8qpWw2URzMW2vny1L86Xl7lTz4I8KpBqu4EvzVNSn7Gj
         gkWHAUKxeeEHTIV24EQtqerfupw1OlmKNRh6O1Hb2O+QvBeYIMx3/lWg44lvSV6DYH7+
         /djys7hFKdPPKObzXuD67IU+wnmoyKjSFRqKnzpzZsOodezO1MHYwgSUURVfbRsnPoQL
         wdBWmRsr/F37WztiAtGeLCw/IjUZXWgyqIpIT6sk+FU6d+EAo3viqQrDq7MzGWHi/I1U
         LAWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxu+D4GvXa/8Lm3iGK0IjuIUi3QCRR2vTAYf7NMGF2S8DJHoXNvKbXGXp9qKydSeR26ej91x0Yfr9k9uJ0=@vger.kernel.org
X-Gm-Message-State: AFuF++kvHV8cVuUqHYl5WuZSh6GGOWpn2oB8I86DwGwjWV3Xra7qBq1H
	vQ3QUCUeEhqugTpljZ7nPUx6ewMJr1S5R4sBw3xm+8FoGqBMkowiRPbi7ZaebFfVKPsRO4GAZbJ
	6JyadOy42XnjBEdGXRl6EEHCu1jHv0DXPORBmnKnWfwfHNY3pMQIpKwHi+1WyT9leefE=
X-Gm-Gg: AYBFou0FdTrYDeyLPhkQDdxlhBL5+FiD8kJGxXFHRibOk8+9GcNeC87KBiFXh3C1nvk
	C1BxHAK94VmkdbhTPNPY49pY7H52GVAtFKk3QrmOKqNA0E0HPVvkU3UjgBgbA53mXD0GLqLQfpz
	Q+GbDbRv0RLnzuzWEVaNTEGF4yP21FyUJvhUTzQObKRQSkCBTJNCyJx+C+QhlUcme8oJupfntvf
	bbowduUlFGfjI51tjcQPmY06KWjGtcw7JNlvts9f61nzkgc0G1dxsIud4je8dN9qaj40hK1tVM8
	AjL08/L6J4kc3sbBXAsEOCv5jrt5bHkbCRr1uBKNkJ1Vdo5yR8GTcQ4D+uoqlok0wmhbl4ZqZs7
	2hFEQcQu/VxxqND3Ac9GCN8a6T8s=
X-Received: by 2002:a17:90a:ec8d:b0:398:e73e:5a0c with SMTP id 98e67ed59e1d1-39debf548dcmr4039381a91.1.1789375412236;
        Mon, 14 Sep 2026 01:43:32 -0700 (PDT)
X-Received: by 2002:a17:90a:ec8d:b0:398:e73e:5a0c with SMTP id 98e67ed59e1d1-39debf548dcmr4039280a91.1.1789375411648;
        Mon, 14 Sep 2026 01:43:31 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b97994sm44692673c88.12.2026.09.14.01.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:43:31 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
Subject: [PATCH v5 2/2] remoteproc: qcom_q6v5_pas: add per-PD proxy performance states for Hawi CDSP
Date: Mon, 14 Sep 2026 14:13:12 +0530
Message-ID: <20260914084312.3812408-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914084312.3812408-1-mukesh.ojha@oss.qualcomm.com>
References: <20260914084312.3812408-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7b3b4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=EzEDkhfgfUAEW4_RwPsA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: kcPyyu22FKmDOSa9tfo6fdmqEpCG5saF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfX622KzjO1sVt0
 v0z+j0lYa04so1GhCJbopRHC70fdg+i2qciJDpKOtPT38gnQ2eoFRKgE33w/oejZMBwV61q6cyK
 V5HvUAXOByt+GAXhZxltdoio72dTQ2M=
X-Proofpoint-GUID: kcPyyu22FKmDOSa9tfo6fdmqEpCG5saF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfX8QevNP+8UeQp
 SZ20pf4V6xCdi6n3FyR0F4KeSAZ3ZMkuAZ48CH6oX5FIcttyYvz9Qk3XaOCkSMLBDgWS2DiqQOC
 ERC8JxwQvqJ0nV0WO7F0CIO/kl8P5Ngijq8VcbpbjjXQXCnFmoqGMTdm2EfKYkrA2yPY6jVx0oK
 l7Ptt/05PARudaPF1AVVYoI8ocKcHUdLu1L1kqVsS/O9J93r8ALX9iCVXFaXA550upt2mF8RvAW
 m6owxsSbticSDm8jtkJ9w8wb8Q595SKtnyAn+vrecVUF2xn6/bqmZaiaM/+aEgW7Eyrrcx9SxbR
 qxoq2Ydxxv1CTfuau3o0+IVLhYAlotOsrp1o9z2YI5EJ+knXZr04Pi6TJZo8UZZZTFT/5xYDcbf
 xQGLW/NL2oX0sgF/Ay0lQJXWCu5f1ks+h5bWRa7sLfR/VjbaXwuVGe3dWkGYrWrX7vZL0TQ1PLX
 sh7OKiR5wtvaWvWmPVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140121

The proxy power domain enable path requests INT_MAX performance
state for every proxy PD. On Hawi, the NSP proxy power domain's
RPMH power domain has no OPP at INT_MAX, while CX and MXC accept
INT_MAX, mapping to their maximum supported level.

Introduce a proxy_pd_performance_states array in qcom_pas_data
to allow per-PD RPMH levels to be declared explicitly. Platforms
that omit this field retain the existing INT_MAX behaviour.

Add Hawi CDSP remoteproc support with the following proxy PD
performance states:

  CX:  RPMH_REGULATOR_LEVEL_TURBO
  MXC: RPMH_REGULATOR_LEVEL_TURBO
  NSP: RPMH_REGULATOR_LEVEL_NOM

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 49 +++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a005546c265d..879c465c4a7a 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -28,6 +28,7 @@
 #include <linux/soc/qcom/mdt_loader.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
+#include <dt-bindings/power/qcom,rpmhpd.h>
 
 #include "qcom_common.h"
 #include "qcom_pil_info.h"
@@ -51,6 +52,8 @@ struct qcom_pas_data {
 	bool decrypt_shutdown;
 
 	char **proxy_pd_names;
+	const unsigned int *proxy_pd_performance_states;
+	unsigned int num_proxy_pd_performance_states;
 
 	const char *load_state;
 	const char *ssr_name;
@@ -79,6 +82,7 @@ struct qcom_pas {
 	struct regulator *px_supply;
 
 	struct device *proxy_pds[3];
+	const unsigned int *proxy_pd_performance_states;
 
 	int proxy_pd_count;
 
@@ -167,7 +171,12 @@ static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
 	int i;
 
 	for (i = 0; i < pd_count; i++) {
-		dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
+		unsigned int state = INT_MAX;
+
+		if (pas->proxy_pd_performance_states)
+			state = pas->proxy_pd_performance_states[i];
+
+		dev_pm_genpd_set_performance_state(pds[i], state);
 		ret = pm_runtime_get_sync(pds[i]);
 		if (ret < 0) {
 			pm_runtime_put_noidle(pds[i]);
@@ -873,6 +882,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	pas->info_name = desc->sysmon_name;
 	pas->smem_host_id = desc->smem_host_id;
 	pas->decrypt_shutdown = desc->decrypt_shutdown;
+	pas->proxy_pd_performance_states = desc->proxy_pd_performance_states;
 	pas->region_assign_idx = desc->region_assign_idx;
 	pas->region_assign_count = min_t(int, MAX_ASSIGN_COUNT, desc->region_assign_count);
 	pas->region_assign_vmid = desc->region_assign_vmid;
@@ -908,6 +918,15 @@ static int qcom_pas_probe(struct platform_device *pdev)
 		goto unassign_mem;
 	pas->proxy_pd_count = ret;
 
+	if (desc->proxy_pd_performance_states &&
+	    desc->num_proxy_pd_performance_states != pas->proxy_pd_count) {
+		dev_err(&pdev->dev,
+			"proxy_pd_performance_states count %u != pd count %d\n",
+			desc->num_proxy_pd_performance_states, pas->proxy_pd_count);
+		ret = -EINVAL;
+		goto detach_proxy_pds;
+	}
+
 	ret = qcom_q6v5_init(&pas->q6v5, pdev, rproc, desc->crash_reason_smem,
 			     desc->load_state, qcom_pas_handover);
 	if (ret)
@@ -1798,6 +1817,33 @@ static const struct qcom_pas_data glymur_soccp_resource = {
 	.needs_tzmem = true,
 };
 
+static const struct qcom_pas_data hawi_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mdt",
+	.dtb_firmware_name = "cdsp_dtb.mdt",
+	.pas_id = 18,
+	.dtb_pas_id = 0x25,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mxc",
+		"nsp",
+		NULL
+	},
+	.proxy_pd_performance_states = (const unsigned int[]){
+		RPMH_REGULATOR_LEVEL_TURBO,
+		RPMH_REGULATOR_LEVEL_TURBO,
+		RPMH_REGULATOR_LEVEL_NOM,
+	},
+	.num_proxy_pd_performance_states = 3,
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+	.smem_host_id = 5,
+};
+
 static const struct qcom_pas_data eliza_cdsp_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mbn",
@@ -1827,6 +1873,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,eliza-cdsp-pas", .data = &eliza_cdsp_resource },
 	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
+	{ .compatible = "qcom,hawi-cdsp-pas", .data = &hawi_cdsp_resource },
 	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
-- 
2.55.0

