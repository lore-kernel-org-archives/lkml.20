Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96DD53444D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788951085; cv=none; b=U3wx10lWypm3TxQXIgHcO3B7nwCQ0eZhctFN9LzMIXCE58g1pJole1HRbFZlgDdxT8mLKFcqneii6m7lfGcq6ocm/SA2WcNR7IWepfYEzIKzEUniqSwCYIZIAeZDybW7LTrlfOk+YAATtSL9pfuLnih6o3kmJFxsHmZomEJ48fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788951085; c=relaxed/simple;
	bh=vDJVRWCy05G/W1impMgDXPlScQt9SGaQUbrN9edkIZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pZlofDdbCJVV0qXQ9UMJ9jkb36PZ8SByToV96dDfw0yWzusx2taBTGWr29ul0NRH0+dX3wz3p23PfG85vcM74ac6Xp6yfQv5zS4oghYXTw5qkD3BmxD26T/67t4h6ENisFnGEWi/HpVd2QPHLizG5TPm7CP6jUMd7i9puMLTebQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EqKi7SKn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LnD/TNZc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EqKi7SKn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LnD/TNZc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689ATQUn2035286
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 10:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=StIud/YqJ+3
	TGGk5d/xvQ+diZ2UDnagtRnqO6Sj9D8o=; b=EqKi7SKnx6ERjTucs1ABOSnMWHj
	YsRg1TqzO9guk0Q5YltHXqNKw7Bn9++iUAYKuLVx5HdWjVEG1lDHPTOdnZEg4C4Z
	lzPZCtz9HEa/MLN8LeVxHcv2uqYKsLJJPXTzgYQjGqMjohLq2zuMUNW3tBro5Cw2
	mZO3ZQWe9dWngx/mAC5PTm9gDuAaT5QIHyeNU4vbQpYDGfsVSd20wXelUo+8wFXC
	wXtb1lcRajMac/Gdl9XIpNcAqVAY64oarS7CI+6fuHCEQHOT0X7Yt2sftesoc+jy
	k2RaEEi64muml72QIvuHOZiHofV24aMCPi9wj2oPPwdwvGAlEjsjGo6uKnw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5rgg2ra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:51:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso4797798a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788951081; x=1789555881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=StIud/YqJ+3TGGk5d/xvQ+diZ2UDnagtRnqO6Sj9D8o=;
        b=LnD/TNZcjc3T0UPgVjUg513Nb+yRg1mjXYBP2/IlceLVNs+wevnfXX6WaQPqmKTP+w
         +2ctUsiA4buTt2sDLbvYudqYOPgAniU8O4XcqAXAZeNTWDluQNicc0i2qrcSf39lg78h
         OxvRsnOkCxIqGaQ2hKDgxz0QSjx3xp/6qIFKULd4Ip/BNMFgtS6rBXhw/UasqWGAYZi3
         rTrqZJaQQLUCL0FYU2mBhaxJ4C4Dq6XYi1qg7w0++ZHblyIdNpjpWZggkAV5GTdeOHXK
         DLHRpYJ1TqB5TqXyB/W/PMF6n0pT7Iq4/Dpa8wdjhwFhu7bfkI2qhe1MBrUiAHJmKFey
         oodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788951081; x=1789555881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=StIud/YqJ+3TGGk5d/xvQ+diZ2UDnagtRnqO6Sj9D8o=;
        b=kfYQVvMGFM4qVWKYorXeVkaJWGztypbf7VC8fPSrNFv4c0nIkAdhZ5mBgnaaqUXprw
         Tu10WY66vOZef8Tv8panTPdHpV+tOgzng1cM5iXCca0ZjsoSg/9dOpVFLFBfi7u47ogD
         FhFJJ4kn2rfIZhk9kV5H84cOyj2SBh0LdaJqZtdW5WfAPaj/+OxL0xHAR7DS9sdoGtqM
         1XjeWVykS0nDvsyviRpkhYwgf81+/THnWIFfAmMzGVBU7aGZVYb4Q2/YSYLD8pnRsqYp
         Quh4eIiCar7JilH3z6i2KWcMCyPZl/HBPvoMy9qJ9PatJkI0vs5ngJGkXzn5I6Ucfsqj
         WOwA==
X-Forwarded-Encrypted: i=1; AKwUvBxdvq4gvE9BJRuFdtjXN7SbH8VAZvUEzfE5G8q8kMuRxiYNBa322udHsftmEUVARO2c8LN/pqTicg+Kz0I=@vger.kernel.org
X-Gm-Message-State: AFuF++mHO/Wwf/3+85HtpLqCEAlNcjyJFUC5pWJoHwMQfJwOwgj2MrFL
	DPqL6REQjTciyO85L3UKyrfBZsKXke1jqEinQsemh8IPRT1B8BzG+zBA7OSc91GOQVPB9pbmB7J
	M/qB8ESkMbbWoOtS5u9DLXZ1muhiUFlg3k9pBHzGNpca06PnI6fGk/L9kQitXP6Srylg=
X-Gm-Gg: AYBFou2+5N/AnHlOBkurGD5/dpHHUyCshKPDDejhNJ1XqwPdcsvPwWQY3Zeq64CQ+Wr
	oNdZrTeLo5bvx1vsfs/P76vWGk59GTcnY9F5s0V15UFNZrEyzYKKayMwgIRVkAE+P9Ba6iW80HO
	Xh5SwjYCr+TbjBA/pHB7sEGu58JZrbs3wGSBnfQ7vdF9iaJjDM2I1thzzs/nmT6IkGi53AFVzP2
	LccL7wjN4jChUboWsmotYIFbP/Hcc+Cvvk7vOxqSau7rBMGjz2NM09YcB88s1rqWRJh6+v82Es0
	yJL3mAE4F6JvYIY9jAzIUgHWi0OFlxM0bKmq5VXrjn1z5LHJ79yJyhq7QSCg+VMFbMu7qjzrXd+
	rsu6W4Fbf4j9Oj5E1oLP9MPE+ZEA=
X-Received: by 2002:a17:90b:2681:b0:38f:5801:dc0e with SMTP id 98e67ed59e1d1-39b261d52a4mr51208614a91.15.1788951081135;
        Wed, 09 Sep 2026 03:51:21 -0700 (PDT)
X-Received: by 2002:a17:90b:2681:b0:38f:5801:dc0e with SMTP id 98e67ed59e1d1-39b261d52a4mr51208549a91.15.1788951080503;
        Wed, 09 Sep 2026 03:51:20 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1434bb7d71fsm12084678c88.15.2026.09.09.03.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:51:19 -0700 (PDT)
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 3/3] remoteproc: qcom_q6v5_pas: add per-PD proxy performance states for Hawi CDSP
Date: Wed,  9 Sep 2026 16:20:49 +0530
Message-ID: <20260909105049.1317985-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com>
References: <20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyMSBTYWx0ZWRfX4ZQaIWW/6k3t
 cMmlWs/JZ/+We0ckfEG4j5IBjnlBnNAPQvorsohQLst4R8MNjAOvEG6ZAUS7RkHzJFYYkeP7V8w
 /AnfIZx5LvTibsJ1rAqzDtCQFiwrrTE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyMSBTYWx0ZWRfXwBvDuz9JvhYB
 6SWgYUbaQ3Bwi/YAZzWjrh8qH8NrdFX44IMi+Rc5lKll0Esb74JWSi0zRKVpNjs+vG/CrxoLLT7
 1vYYZzokvTuDZ0L3jam9bU1rW4aV9Lh36yCoorgeFPQg0eActS+P6CroiW7Ji3WQplGkRsGfc+8
 L6eBae3hf2CesYqycta183vKdhucs20dulS0Ln54IVdtsm7N72E7XBg+mmxV5imKDgzypXJN8mm
 3GJPZuPBnXEDrG7cSiM8nWJFJSBoce/eglOrK0sKNRwCariA5J6lI7fha4KWyYRvkqDCcyC6pIH
 Nvujluykn5XssJgQLVogm3vvLkVd6I4bvCjfu61A2k8ZKFC3i8X6B5cqPPG3vSxyBb9HgKdpOL4
 NCSeuXbtItIbzIiC00LXU6OgVcyEYpQMpVbQxOraqm+gnvb+S2ffPB3U2WjwmBvALOdSvJWsVaw
 RTK2vo3ZMAcuEmgAekg==
X-Authority-Analysis: v=2.4 cv=B6qJFutM c=1 sm=1 tr=0 ts=6aa13a2a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=EzEDkhfgfUAEW4_RwPsA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: RYnvAn_lSz6h-x_GB4cekrJwN4-vakRl
X-Proofpoint-ORIG-GUID: RYnvAn_lSz6h-x_GB4cekrJwN4-vakRl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090121

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
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 50 ++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index c163e66347f8..8ac66db80193 100644
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
 
@@ -167,11 +171,16 @@ static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
 	int i;
 
 	for (i = 0; i < pd_count; i++) {
-		ret = dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
+		unsigned int state = INT_MAX;
+
+		if (pas->proxy_pd_performance_states)
+			state = pas->proxy_pd_performance_states[i];
+
+		ret = dev_pm_genpd_set_performance_state(pds[i], state);
 		if (ret) {
 			dev_err(pas->dev,
 				"failed to set proxy PD %d state %u: %d\n",
-				i, INT_MAX, ret);
+				i, state, ret);
 			goto unroll_pd_votes;
 		}
 		ret = pm_runtime_get_sync(pds[i]);
@@ -879,6 +888,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	pas->info_name = desc->sysmon_name;
 	pas->smem_host_id = desc->smem_host_id;
 	pas->decrypt_shutdown = desc->decrypt_shutdown;
+	pas->proxy_pd_performance_states = desc->proxy_pd_performance_states;
 	pas->region_assign_idx = desc->region_assign_idx;
 	pas->region_assign_count = min_t(int, MAX_ASSIGN_COUNT, desc->region_assign_count);
 	pas->region_assign_vmid = desc->region_assign_vmid;
@@ -914,6 +924,14 @@ static int qcom_pas_probe(struct platform_device *pdev)
 		goto unassign_mem;
 	pas->proxy_pd_count = ret;
 
+	if (WARN(desc->proxy_pd_performance_states &&
+		 desc->num_proxy_pd_performance_states != pas->proxy_pd_count,
+		 "proxy_pd_performance_states count %u != pd count %d\n",
+		 desc->num_proxy_pd_performance_states, pas->proxy_pd_count)) {
+		ret = -EINVAL;
+		goto detach_proxy_pds;
+	}
+
 	ret = qcom_q6v5_init(&pas->q6v5, pdev, rproc, desc->crash_reason_smem,
 			     desc->load_state, qcom_pas_handover);
 	if (ret)
@@ -1804,6 +1822,33 @@ static const struct qcom_pas_data glymur_soccp_resource = {
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
@@ -1833,6 +1878,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,eliza-cdsp-pas", .data = &eliza_cdsp_resource },
 	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
+	{ .compatible = "qcom,hawi-cdsp-pas", .data = &hawi_cdsp_resource },
 	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
-- 
2.55.0

