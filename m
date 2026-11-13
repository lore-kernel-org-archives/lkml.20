Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596064;
	b=2nD1/0D/M29d/X/LlgIPR5rsdyjGb01g4dgwL76gHOpZKWOVl42uuwJKhxyttE0vrvuP
	 QHTRJ3qHsjh/7UvSMGY0E5+TBwlEsvADZlpELLC/XBbcDoKSaw9Tbr26XBvtyS41BBb87
	 aPqWSXWSDKc3ujoyeVA3mQuDfcDjyvdTVA3qQfMpvOod3ly6TSRYBSaAtSJPbPrFBOBa8
	 bEhzbtJGM5QwwVhiwv7gYN+XL1fnWcU+CfMNyn/g4H7BZcJnuOTw0KlSpnCkmYobnOzIU
	 Xi/7Iko2tPzmJTackAsVm8fg1gl5oJVBGyt+XUYnKieyjS8wCaQRYUHs65EW+4Bxj6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596064;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1pg51pe/31RdnPvnOyGiz66zvNpNhsnA7dx1wDRzP8k=;
	b=X91a4aC05iNNHtv+HdakApmsSGcFs6kdbMHUZiUXTbJBJPfPj2c1aaT4IFaJOttn1tsh
	 F9d4erfZCw9kBdOizQjO8dJnqHfXHyzFZLeOfZZL742gExky6NeRl90cJ17/ec1pso1GV
	 dTarYWUhOgyqxGgnSjnGTcw5SMsddQiDJp2I8+iFUtaH0Obag3LaBdpEz2quVmvM2CsmW
	 r/Q7vDwitK+O40PEq9fJx8H+Mrcv7V6gGurrYsI/KuiKmy0HU38YsoV03+iqfcAqyG5kC
	 TES8/yrXfg/orE29tMnITPc0DgT41Kc+1IGpcdHHpV2TMM1LX0/Y3I319L/wabzCEJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lDCGc4Da;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="NU/LF8dM";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A834C606A336
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:54:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A834C606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lDCGc4Da;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NU/LF8dM
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRAoD552194
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:54:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1pg51pe/31R
	dnPvnOyGiz66zvNpNhsnA7dx1wDRzP8k=; b=lDCGc4DanLItTTOu1ctUWq1jtJ1
	8Mcr4M/OWQsWRK74Oy0WG7wmQlJBJiSAv1+kcfVmGq/eLGeucU3XBnA4u2e8/PJ8
	1udRvJL4lLFj8n6/h43MI0v2u3v7C6IdV7XR4tIXuplhwdVVYWiTMdd/8pcjuRWT
	ucsf0Zj5k6lNsyZ000zx8HCiIczfeMe6KGW0SWvjGx2bqkTXSeTRyeRDRm8qBJUH
	TD11VyNs2XLxm3ag8IYy7VynBWFNiurEX0CJUXS5REBMps9HBhWbn7AdZqR8ckg1
	kA3NBuGaNMX+4JXUFOpX+sSHHEDFf7DY1+NzKNdx8vkDY+OIhBfUB3KWC3g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwcc6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:54:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f26e6abe9so1568049eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596062; x=1795200862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1pg51pe/31RdnPvnOyGiz66zvNpNhsnA7dx1wDRzP8k=;
        b=NU/LF8dMjd9+LbaVrcWPEnRq0V0Ef+ikn170WdO2IYsdueRfDgQ7u8/fXpuJo75yie
         r/34p5X6HL71/YP6UwTNr7umk9zqTExeYlASEP7kPQ6q9tv5NcSeFlAI0UQDc5B1Q/wx
         Cme/S/SgtgoymxqPWMAurkBt83T8VjCSWcG0LJdvJZKxxWejv6Up6oVTe1lgFNp14NC8
         jZLdb667iYhtLvVNC/JpgcFLhTONkCyY9SjJkOboBRLrQYGOrvZFja2yQ/nv5QXwURbo
         os9xLk68GpGTlTOBt9C7ea21ZGjgbsOCBsAUJpigCdgMkgsgbvWGrVCgy+6m4uKq2Uaz
         zlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596062; x=1795200862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1pg51pe/31RdnPvnOyGiz66zvNpNhsnA7dx1wDRzP8k=;
        b=XtXid0RS6jvClEPBRrMt+12kH7NMLjxh1jeBjo8NGiPdUe7M6waUIwjm4AleTwXKi8
         cT1x9SOpmbD8xlNmWGLhfAfXahIB84v3qOi3AUDhmiDXxPIBZZ5N5OTw9rYd6Y8YHJ0E
         6CtvwXWkbS1NPyq6MIVTJ+cdfiPqu/7xe5zl0GLZxfAK4BDkgSBEw5qHQprVonQsXkKl
         ypzhp+TP1HBKhd1UawMrVfh32mMRtNI5Ww8dPCuNevVb3nePnu0tkOg2ibhBN+C7qsY/
         UTDKyKJG2elIGYtEu3OifVa761+/1jJp3BwBUDKDm9h192egR4tU/cp9siYjlZxaFcBe
         FC7A==
X-Forwarded-Encrypted: i=1; AL+hErHYGIRYSmid6btbESI4icjCaCACU+HoVdyhF5C4WscjIroAaiCg4/B5AGini8+zeVt7m309RfaX4NMDkCQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z95kwb4jhj8wMSfO0yJZ7g4ugzhLhOcOYR+ISbRmhE3Jr8eLghz
	nYnOe9r924Dol32NJK1u/aAh1FDnr2XmsEP8zu4J9idv+9yjoJLXq/jOzOiFX7208tebcrx6UUW
	52wjecyS0/roxykDn73g1kk01R8a05uJYFwCU0O6J0y7AdhtJkjV7PpPxVeSLhmXjLPY=
X-Gm-Gg: AYBFou0thUlvNOL8Rv7VaKWb3evrZjga1WjvzK+GHxhD0oIaor6k+3/0cNGudR2xjjT
	15sUfskSNbBEMmSTvgDWwChs68j71c244232HgxuSTqxQE8RAz7essWLSL/212+EIKU59OBy8UF
	2/g7IPojbsEALGWnmKm1hOxwPNAL3XGYE1du2L7uWp1Lzer38SQe97EIQ0E5M83BsWLiz4IN36C
	N+QwU/qiOWbBdEUW1p3k+lLtDdnX1D7p9mgGdriyiVg4E5rFsiydLv+XxZ9c6dMMoMLaWTGdchq
	rhhgXX4eBeqVaL4qIfo71/OWDDeMsebFBft67+C8z4c9JMCKl79hdrbd0dF9yTEp8n5si4oR3Kg
	xK739C0vybfO5nFFTe8XEdrm7hKFAyXIRzTg3TPLbQxU6Fj00yZ8eLlhyEYeEFTN/5ehs/CN8u9
	w=
X-Received: by 2002:a05:693c:41cf:10b0:34e:9923:e372 with SMTP id 5a478bee46e88-37967506841mr2876423eec.29.1794596061477;
        Fri, 13 Nov 2026 10:54:21 -0800 (PST)
X-Received: by 2002:a05:693c:41cf:10b0:34e:9923:e372 with SMTP id 5a478bee46e88-37967506841mr2876388eec.29.1794596060847;
        Fri, 13 Nov 2026 10:54:20 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm15547667eec.21.2026.11.13.10.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:54:20 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 7/9] wifi: ath12k: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Sat, 14 Nov 2026 00:20:07 +0530
Message-ID: <20261113185009.157893-8-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
References: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af75cde cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=tFPd4D2tFowRDCwbfnIA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: y4RViuOGUeVmIFZ4w-TS4ArliBcp9Cvy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX1qpsSXEETWvV
 lHomnj5RxdS6vGzi0E8O72eZY45HAfqILE5MKU+M6Tdfrr/HTyfC34acF0N1PaZ6MJgzEQO1JpP
 TC9UU0Fk5ou03Vujh0CJr21xJBl/JMH8m/9aclFrwlaAljyi6Mjaq9WWXHQv0T9ZM+8S2DIXdQ5
 u7vVvfpM4rHC8Wf+R9GDAuUSKp9fRnW4oIxKKE7r9B27KfagWZ+hgwea1SeGmRcdTrBmW1/tvFE
 XIXeegKzhkJajLmfOSmk69DT6RNDvrTQ/WvrSNFMOXG7TErOwtTtaXPXV+hLw4F7U3JaSLuAmlB
 qrRSwBkOzJ3Psm9iU3cIyKR3eTLdF82MVejVJlThRubqCbt+B1/OYcjMSVNjUnV77ffnuGFv3UC
 lJlBs0sP+e4eBd92akPyKv2zptOy7fymc/jZP5TMJ/RlkB+aa9k6GtybglUUGmPiywxgPWMp2DP
 X/b2oP8dKJSmVI950Jg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX+NhM+LBrCDwI
 VrBcyA9TZC3TsVAj6pVzMn8y8vhoPJ3bat4D9bHNTuUxe9n97xLiKWr/7cGMgj4ai4Dey6zLYAq
 OZowb535kclM5x6kNA0k4Hmlk0blcto=
X-Proofpoint-GUID: y4RViuOGUeVmIFZ4w-TS4ArliBcp9Cvy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075

ath12k_ahb_power_up() calls qcom_mdt_load(), which bundles metadata
initialization, memory setup, and segment loading into a single API that
does not expose a PAS context. Later it calls qcom_pas_auth_and_reset() for
TrustZone authentication, which is the intended behaviour. However, a new
qcom_mdt_pas_load() has recently been introduced that works with a PAS
context and can handle everything qcom_mdt_load() provides, along with
additional functionality such as shmbridge creation and retrieving memory
from the shmbridge buffer when the same remote processor needs to run while
Linux runs at EL2.

Replace qcom_mdt_load() with qcom_pas_context_init() +
qcom_mdt_pas_load() and replace qcom_pas_auth_and_reset() with
qcom_pas_prepare_and_auth_reset(), using a stack-allocated struct
qcom_pas_context in ath12k_ahb_power_up(). The non-scm_auth path
retains qcom_mdt_load_no_init() with the caller-provided mem_region.

Apply the same pattern to ath12k_ahb_load_auth_shared_fw() for
consistency.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 8a3919675134..75d3141f968f 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -418,6 +418,7 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 	struct ath12k_ahb_rproc_info *rproc_info = ab_ahb->rproc_info;
 	char fw_name[ATH12K_USERPD_FW_NAME_LEN];
 	char fw2_name[ATH12K_USERPD_FW_NAME_LEN];
+	struct qcom_pas_context ctx;
 	struct device *dev = ab->dev;
 	const struct firmware *fw, *fw2;
 	unsigned long time_left;
@@ -451,14 +452,15 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 		ATH12K_AHB_UPD_SWID;
 
 	/* Load FW image to a reserved memory location */
-	if (ab_ahb->scm_auth_enabled)
-		ret = qcom_mdt_load(dev, fw, fw_name, pasid, rproc_info->mem_region,
-				    rproc_info->mem_phys, rproc_info->mem_size,
-				    NULL);
-	else
+	if (ab_ahb->scm_auth_enabled) {
+		qcom_pas_context_init(&ctx, dev, pasid,
+				      rproc_info->mem_phys, rproc_info->mem_size);
+		ret = qcom_mdt_pas_load(&ctx, fw, fw_name, NULL);
+	} else {
 		ret = qcom_mdt_load_no_init(dev, fw, fw_name, rproc_info->mem_region,
 					    rproc_info->mem_phys, rproc_info->mem_size,
 					    NULL);
+	}
 	if (ret) {
 		ath12k_err(ab, "Failed to load MDT segments: %d\n", ret);
 		goto err_fw;
@@ -492,7 +494,7 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 
 	if (ab_ahb->scm_auth_enabled) {
 		/* Authenticate FW image using peripheral ID */
-		ret = qcom_pas_auth_and_reset(pasid);
+		ret = qcom_pas_prepare_and_auth_reset(&ctx);
 		if (ret) {
 			ath12k_err(ab, "failed to boot the remote processor %d\n", ret);
 			goto err_fw2;
@@ -1056,6 +1058,7 @@ static int ath12k_ahb_load_auth_shared_fw(struct ath12k_base *ab,
 					  struct ath12k_ahb_rproc_info *rproc_info,
 					  const char *fw_name, u32 pasid)
 {
+	struct qcom_pas_context ctx;
 	int ret;
 
 	const struct firmware *fw __free(firmware) = NULL;
@@ -1074,14 +1077,16 @@ static int ath12k_ahb_load_auth_shared_fw(struct ath12k_base *ab,
 	ath12k_dbg(ab, ATH12K_DBG_AHB, "loading firmware %s, size %zd\n", fw_name,
 		   fw->size);
 
-	ret = qcom_mdt_load(ab->dev, fw, fw_name, pasid, rproc_info->mem_region,
-			    rproc_info->mem_phys, rproc_info->mem_size, NULL);
+	qcom_pas_context_init(&ctx, ab->dev, pasid,
+			      rproc_info->mem_phys, rproc_info->mem_size);
+
+	ret = qcom_mdt_pas_load(&ctx, fw, fw_name, NULL);
 	if (ret) {
 		ath12k_err(ab, "failed to load RO firmware %s: %d\n", fw_name, ret);
 		return ret;
 	}
 
-	ret = qcom_pas_auth_and_reset(pasid);
+	ret = qcom_pas_prepare_and_auth_reset(&ctx);
 	if (ret)
 		ath12k_err(ab, "failed to authenticate and boot shared firmware: %d\n",
 			   ret);
-- 
2.55.0

