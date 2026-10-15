Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10633EF0C8
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792043812; cv=none; b=e8cALJ1VsjQl6E9umx0MlE/a10mUvoZgVc5jFt34xzbbKxDsSrCSUb4HjNnx5LLMx/ltOATkaaRBJpjTgaptIVOsguPdUHF8VqnH2wkGcD8C/f103/rRcyJsLO46zr3VXu0yIQlEvS6dzFg15VfoDb9CBBmXHAooxSdsGUzzXIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792043812; c=relaxed/simple;
	bh=VD0MOGj8c+D9A4oi5sDX59ihZ2d+3q6sErJRVwcwI4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b0AMQGx9oTxGA+IAZNCYsGdDxn7MYYrkdjUZcI7Y4/H6Wu3g2r3vx1fT69ooSWy39CuIpZgZitfMFxdFJ0wdDVMtRcjawXsoDsypuS3q74H/72E37Vl1s+X7wxc6YMt7YjhnTuiYvwhiByUukkrGSqTFb8WRKjEROVu29mOSYSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QDxaOF2K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YUmCjSfh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QDxaOF2K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YUmCjSfh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3wm9p1889713
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	svxigOfWqT9yxzCsW1RkrGfA5I91W4byHHdiQ7fm8tk=; b=QDxaOF2Kt05kj4aQ
	Rvg0rgIm+sQXZMaK1LMsDh9T0g6YEs9K8liizEv8x6sqMrKmTlGPBNJ6iwrzCIEA
	V1mQ1hwOBz/7Bi1xV1ahQczps+ir1q8YYXsv+8PHLBPwW9NvVgqPVsYDrpbmLLx0
	srN/jdpE5KdUKL5wpTwQ+6BNA0f3b3LQT0v67oA2lpjhBsmBlWiRAV4cF9BxLg0i
	ttVqES/K3Fixl6P0cjlsAGncZPVohdxNOSwodTQoeDiOu5RV1DO8br3z6SoQ1Gd+
	Ax63zv3KtcgktrU+H0LOTrqcpmE62EV8JXlkS5t0KhaIXaOYQ2fgWhE60VncSnzC
	2ibHeA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda0ckn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:56:49 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso7424983eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792043808; x=1792648608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=svxigOfWqT9yxzCsW1RkrGfA5I91W4byHHdiQ7fm8tk=;
        b=YUmCjSfhica1lsueq999L9w072u+02eacafxwICKNqvImjujcIJJZ/V5K1vUxz2x62
         DcszM0dqZkbnU933mGxjYQRA57qM2u6sO7HrLXTIy5taiwveNMQun6AzDZ1hYJ30Scnk
         Ownw3z3QgoGfXKs2OU4Fp/JNJcf8vPTtnxvo0XVAZiUL/JEk/CJ5pZWs2qWDj+DYWVwY
         nSH+m3D7ed/Dtw3xsPZ2eHGxCvWyph9HHstFkbWmtnPXOm46ZCfRKDJnpzhbLHrmgNNf
         m+3tBOgyELbB4ijvNYVBMQZY9KqNx42iNaTcFW+ne9I5XfXMuqqU5w6ch43ymbL4SwHw
         1eJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043808; x=1792648608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=svxigOfWqT9yxzCsW1RkrGfA5I91W4byHHdiQ7fm8tk=;
        b=JR/lpnPyOHioQZyjLvfz5ejfN/sFV0GlimFoFBDtF9guIHzNUJ7X2OOQIRcJGPubs5
         J1t0wnC/b+4l7+jjdYDLnT1XugzzZXJp6UvI/RxNjMvng6LFokuA4cF8MPaIxW0odius
         VvoUgj7w+Dvkm16s+28varU0bIRYA2sxu8J6O+RiqL0+MiX5smq/14iNhBYwc/uqm0y/
         A/76tfS0HQvj0YeJELpAhJbiCht60D7HPYkzkq1soHNh4iL2hxrrXvlMXAQ8cwU4bYUk
         gchsXoeLXRUAHMvVpy99wZoUBFf7V/rdBiOyQoUTfhoe8ncUzdhhPa9fiswqqmS2xWws
         wFxA==
X-Forwarded-Encrypted: i=1; AKwUvBzj3mZSvOUR2qjJV4GE4kA9lhjj/h1rMk6h1/ior79xFRd7K4RD5di61R2YF3wgTSUd0VUq8bLg/unIurk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK52vSllLy6ytZcd6eeN8oVynVlzZLZ1cw+vb6DH4wJE7cDaiWx
	waxCdfRsQeHOE31n2m5otX6uw2dndsfxUIVXELfGQdqlkmlU/dKD07IIyjtf6s5Rf4RHjFagM0r
	5ri3JcUtZh+ENkgFR6aG07KG0OXcscTypD8KCJ+gDXvddZ5bqRpty7SOMuSpxchPlMZo=
X-Gm-Gg: AYBFou275asahLhIlm85RR9nkrs7UenLF2BSanM1s0csUMkADYvo7/hU3u/DChYLz1b
	9SAx4PguXs17I1Y3Mdz6A0pBGc5uv+tGqzuM05S0OO8oWIaeXYwkd7ACttQH5igLHQ/Jb1IOTJn
	qOCYpTuYQP55j4wX+Wi37VTBdWNq75Qm0CClwHgL/eQcwRKS1pSryZJNqNpyEjClAc+f1XC6qc9
	0fHG/du9Q3Q2PJ69Ju0Pr0+By6nRPyBNB/yB7irhHoRWug+y+xF0b8RwoW35J8M2j0ogYm+0V6t
	F1orclsh+czlhO2oG5i6uXSzBMi5XyzTUvrvO9UIUnsjpM1bRxbdqHAe0Fex/QAVlDcq5fEOYBH
	LFLH6+p1g0ZdzUP4B2YMHAs7wAWCSnUiA1PWjb9+1cuZX+X/pSO+4BO8EhRtxYOBNTNrb7uzjlu
	hElGFwJRilLB8=
X-Received: by 2002:a05:7300:6825:b0:353:8103:ecae with SMTP id 5a478bee46e88-35381040302mr24384853eec.23.1792043808317;
        Wed, 14 Oct 2026 22:56:48 -0700 (PDT)
X-Received: by 2002:a05:7300:6825:b0:353:8103:ecae with SMTP id 5a478bee46e88-35381040302mr24384824eec.23.1792043807795;
        Wed, 14 Oct 2026 22:56:47 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c61eaa0sm64791975eec.0.2026.10.14.22.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:56:47 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:25:52 +0530
Subject: [PATCH v2 4/4] remoteproc: qcom: pas: Add Glymur OOBMSS PAS
 parameters
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-oob-support-glymur-v2-4-715435f52dd7@oss.qualcomm.com>
References: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
In-Reply-To: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792043784; l=2056;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=VD0MOGj8c+D9A4oi5sDX59ihZ2d+3q6sErJRVwcwI4Y=;
 b=AFOiVnhP2hcM2B9a/LokZyh7K/8mEyXDh5GT/vbEF9/SIU0VUTGVV/dCVZYZ06OREb4w3OkvC
 1P8mpZF2WIUAmZrYZ+AkP3XUDZ4WHze+I8OwAszTyPbiXxxjXsR91WD
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfX2lGyomLjyWxg
 iDytM2A/jb+SP18FP0HmJpu0zFhXy9eu0qvRMBAWB5gmfektcsmhqDcB+ibbrt5wbehf05QsI5n
 D+AaQOfQa6UYuWWnRaxDs4EVC1Mn/Wg=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad06b21 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=PB0afdDVj_GKkQGSUhQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: VvWtNbSbFyodbzZrzo62ueEnAIgbWrLk
X-Proofpoint-ORIG-GUID: VvWtNbSbFyodbzZrzo62ueEnAIgbWrLk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfX2MtAIJWIPg/0
 /a4c9O6Wmkg+tEriaUF9rcTvb9MPxzJ2MQ2xWp8B1W2dXw1ZLie7wQc0anDM76QHnJJirZHv9xo
 VnEHls7ec5OhkTJZK9KE0gSkn5L0M2ZyPImk7gkhINSve+lakR8tdVrboZG9hTs3s2/8E2/1Ry0
 M5Vl5Kyj+eZ7zlKrf0ltFNDfNU0oxLS1aKi30jg4lhj8nfng+dLD7yMbRpI0tRN43nVaVIqSsr4
 YiG26tu83ctbS5Gc2J7AIKWC/fF8kK8ekcQvFLv4RM5lzOy8RdeRCRzBdOvCgWpIFEyWcmGdxOG
 y0rMowH3QiOyyVnNxvnPKAGKPuP2wzocokzpBPP/o4/kYWM3/cssR6nXRb6uPtyaWqT/uYtkAaq
 amUJHDU9j2IX4K7kxDIXCpk1K/1tdUCB/e/Hw29JNV2zlER0pxEivsO71jfAuJ9GC9QJRKpUPhU
 GFuhH7/tk8R8AjuIE4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150023

The OOBMSS consists of separate OOB-TEE and OOB-NS Zephyr subsystems,
each with its own firmware, DTB, and dedicated PAS ID. Add support for
the OOBMSS PAS loader on Glymur platforms.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 374cafd04b62..ecefc6a72fd2 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -2080,6 +2080,30 @@ static const struct qcom_pas_data glymur_soccp_resource = {
 	.needs_tzmem = true,
 };
 
+static const struct qcom_pas_data glymur_oobmss_resource = {
+	.crash_reason_smem = 669,
+	.firmware_name = "oobmss_tee.mbn",
+	.dtb_firmware_name = "oobmss_qc_dtb.mbn",
+	.secondary_firmware_name = "oobmss_ns.mbn",
+	.secondary_dtb_firmware_name = "oobmss_oem_dtb.mbn",
+	.pas_id = 0x42,
+	.dtb_pas_id = 0x43,
+	.secondary_pas_id = 0x44,
+	.secondary_dtb_pas_id = 0x45,
+	.proxy_pd_names = (char *[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.ssr_name = "oobmss",
+	.sysmon_name = "oobmss",
+	.ssctl_id = 0x21,
+	.auto_boot = true,
+	.early_boot = true,
+	.needs_tzmem = true,
+	.decrypt_shutdown = true,
+};
+
 static const struct qcom_pas_data eliza_cdsp_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mbn",
@@ -2108,6 +2132,7 @@ static const struct qcom_pas_data eliza_cdsp_resource = {
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,eliza-cdsp-pas", .data = &eliza_cdsp_resource },
+	{ .compatible = "qcom,glymur-oobmss-pas", .data = &glymur_oobmss_resource },
 	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
 	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },

-- 
2.34.1

