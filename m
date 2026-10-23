Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738944;
	b=h0hK3M92/xLzU1CMcbkB0ntKJzPp+KE0/7PEVYthLflcd9ryh91teSbYs/Rshabqrals
	 gsJ8WQfTNDlevlRmjhMf6nMieDH5SRhqOE7JazCmMUcCxIwRrm7mpcOi196aXdLJkYSHL
	 PHTtl4LAOV3kov3ZNzsn2kf6r4YMCh4S8ZR2RK9FmDUt77isk7nSPoQMpP+VQEVOpM9hN
	 I97nRiyPHKxBm/H2Ue3Y80nvRlTryeR++/dvnw9zipzb7ITGG71SnkmMdgJrsQDeUJ5kg
	 uoGxiAxCJOUCaIBtwdVekxWIHSLGVDizSXeREo+TX7Zyc/t4s1frwAEEOIC7MD2nnfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738944;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6aNW9dnDX6TbyEdH720nm0hjQAKn0nJnCofDm4yX0So=;
	b=AU3JiVtPhSakyRUHUiUzwN+wqb8QUxAcQMB4uBGr+oRgE3z7nwFqIdwEUn5r4Wxno0Sg
	 OF/EuK8rOguMJhFnXtt6zpwkPPC9bcyx0/bL+f8gpdmeQ20H6y5vaiV58ZhniUarvRnTl
	 Lz3K8EqgwJaOC9fzWpbI6d1KTCITG6hbpgv7N7hmlkGMhiHqcfclf4439IKfpULOc5imX
	 083w+uEUQs8JTurpvyL3Ce3CvTiK6Qy/duuiyBRF/8PA7FxCF/5JnEN234dbE/xPQ21rU
	 WZ0t36mGmI8rOJVJBGkNlpibOTKMI9QgH3NV45OHtea2cgh0R9tnE+niRiZmTErgAJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CkWWPHAy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jyF9m3Pg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884AA60A2623
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 884AA60A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CkWWPHAy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jyF9m3Pg
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1Fk964008225
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6aNW9dnDX6TbyEdH720nm0hjQAKn0nJnCofDm4yX0So=; b=CkWWPHAyDYD1bpsB
	j5Ru1/0ODhwtBUAhbwHf3AbGnqRap6yVn+9A/bvySg3tneSkbhIDxFaDcI8KdFY7
	WM8fahZOQyKWXHg4HnMHuhiZLD2W2XDSNkPfyJWpIxtYfKkfAlf7I1xGVBl09TxU
	HkFk+7FlMg1f7UZ02BZIOertxVSNSnhPi+k+8vsddcaWNSz3kKEhc0ossFMlYyes
	7iZfVEtGjRuDH7CmvpNPlS/fOotlNCiUc8+5BqSiB0/3dHvMvkU/okhtSjZzhvBj
	yaoJD/N/e3EBnQ8IW82AknBgUp1DxVHQSqM8zPSIEdaYjTEX1b3ny65koxzhs77P
	IIPtMA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmasv2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:02:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab67ff8ec3so517379a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738943; x=1793343743; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6aNW9dnDX6TbyEdH720nm0hjQAKn0nJnCofDm4yX0So=;
        b=jyF9m3PgjOBWPZLdIa4wPV/KfdU39RgTeN7amlkFp2zQ8krpPWT1kVpFu9HCvfUTVI
         ld34B0I0o2iE+LORSCQZc+T1mwl0DsApiQhQlo4mbexpwRZIMd0WqXTO1BrFYvu1JMxO
         EENRl+R1DC3PKsnyw70S3O7rGRMHymLsWdc4q9n81NyO/Mryf+AuZgF9AQiLkFLHUxoX
         bsLWmHMd8HeNeMuGYaHdUtYbLSJp3uDH1wrj0Nn+qu3KlIBYn+/mWt2D/c4GE/4LIhg8
         l/Q77+46Ptk2HRLjSiOnYY44CBCDdFLV52ZY189rxruVHDbyWhKpmOJ/SMudN+9r0jUS
         XPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738943; x=1793343743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6aNW9dnDX6TbyEdH720nm0hjQAKn0nJnCofDm4yX0So=;
        b=v0WtwxpKzNSpIz+VzqU8sfmH6oi0okTwaW0Ort5VecqTUdOkd/ttrkZ45faq8kuDtc
         VcGYfFg4ggHMgA2Yyfc4hpCAqIjmGfAcRF59njoF5beYVXlupAjBvHfNhvyFFXneqkGz
         xQCUhNd4pTMFPIDs3ufYm2OpPwP3rTx5NxeeWXpFbw/pla00OlRnKrZ6yyEn6TcZGExe
         4Zu4wjhCnKCLWXDVvby7xMb1m7yynG0UV3Utzi44ao+X8EvzGOTbva0I1cSpm2ZI8042
         whbSI/qTtBga/De6OTQFmg4dLQ1sn7g3AsgImrIFuLN1ghskX0/OJDAaWnPMxUW/eh8b
         lpZg==
X-Forwarded-Encrypted: i=1; AKwUvBwFs9YCzHQKj8fBZi8JyySaZPl0Cs93aZtO/UxGpKtj+xomlBm0PpYiHcv4hVeM6s46N0el/gFG8xwkupM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLt4u9ExPaK44/j3D86NEJ6D7oSnT215u8vRRdAr2OmD+vnpxQ1
	c6GTy79DwxF7qcy3kpdZaIgO7YjvNd1iQZFUTf9YZ2deICbgOoZSs1i13xLEVTE/p8nF8yb49j1
	2AVTy9s3c9H4zn4MFTaD8WHWiwRvCpiH5QCcVBeaZJexHxXo/TZh+3hLxb9xIXrKUfmM=
X-Gm-Gg: AYBFou2Gj2HEkxVRbyHKRorlok4FoP3UDbh19sgsHd1CPUdHDF4lo9fYRgyMOqJX4ai
	q1O85ZeNRbNGB2Foh/TmUaod8lC6gz4tc6XUbp4LUXvaEeV/03Jhg3B9xEuAsvSSqf5EQs+fAPc
	b0mh9YNVfRixRWX5URns/CmUF1QyFlcLLGhta2a8d+dYmHhZ1os2rmKloGdECF43U+Q6GPHCW/Y
	RS0evGauQ2R0CoLgrceP13TcF4x3USdpgditUJlMXkmtB6q3BCddXFTzm6xOzhm//zRRahoAvWp
	treGuvkomE136eZWZCwAw/sOwT2e8rST8xsQWoayAjBSgO4is+nScF2sb0a+C+OMuBl9S/yk16J
	HjpT2W/Z06Dzxvty3+eUXFTldgeT6vSHbW//FNHnRAP4v9mjCBlSTWGj2P1q8/saIUnn6ynpNmy
	JAivznuyyeLDisvD/9Wg28DQ==
X-Received: by 2002:a17:90b:3f8d:b0:3a7:9e3d:b3 with SMTP id 98e67ed59e1d1-3adce7f0654mr926881a91.66.1792738942664;
        Fri, 23 Oct 2026 00:02:22 -0700 (PDT)
X-Received: by 2002:a17:90b:3f8d:b0:3a7:9e3d:b3 with SMTP id 98e67ed59e1d1-3adce7f0654mr926860a91.66.1792738942184;
        Fri, 23 Oct 2026 00:02:22 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:02:21 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:19 +0530
Subject: [PATCH ath-next v3 16/17] wifi: ath12k: Resolve userPD ID per
 device
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-mpp-bringup-v3-16-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb067f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=OMOyA7uMCkrHFcBVPHAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX2+tuMjvN1+hX
 ptEoIkIy3YO/+IqM4bq0F4dJbqC6thpNnVY77dWFn5+l2T7zuBIog5pMZ3gaVfP45shf3jjZGXd
 qsAtDGkJP9LMcJl/NL2Fy0JmK4YTxwo=
X-Proofpoint-GUID: tGzu_92dmUrG1fa9CAdu-C1Nn8pVigKE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX/AHKvEF1Mcpi
 KDx3RPNHn9Gf2dZt5dptcazwVcjHlEGzpyT+OTGmxMjEfDgVIAZqRBzTV4a+dv4SY1aZMsXc/kM
 f8tCKojsJsebH1xDEMlUvM89ARd3Nldc5fDER7tYLy3+80QXJ5ONu6oJw2QfA06iXVNyyTo2wxc
 hIXoxLBV2qOei9Z9pXqQ9Z34WiSeg/V7E7l494LCHn94BjNy7JpCf51i0LEgZvRZrGFkYp97ju4
 EwwFp4msRsXRJubzIt8ZK0ex748Nckw8ImF2ijgehOC8bSV+nMnL2v0vXsx8B1PKEmZTlBtcXoB
 8TBuysy85UtRu7tbdzVLXi34wsemDycJ/yYTYBQ6pY0xk1EHS/8i6YRifOm4CN4xSQq3dAaHQAf
 1A+avtvaB3ZFAk10HeqDQREHPBviMOiw6nYwE9brhkaJR1WKIojozQ7TLus7MZYL0gCH16KywCV
 +0hsqg2rPZ01DvW4LCQ==
X-Proofpoint-ORIG-GUID: tGzu_92dmUrG1fa9CAdu-C1Nn8pVigKE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027

Currently, the userPD ID is hard-coded during AHB probe. This does not
work for multi-PD platforms where different devices can have different
userPD IDs even when they use the same compatible string.

Resolve the userPD ID based on the device address so that the correct ID
is assigned to each device. The userPD ID is used to determine the
firmware name and PAS ID for firmware authentication.

Also set the multi-PD support based on the AHB device descriptor.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
index bff48b2fe124..889361e637af 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
@@ -16,6 +16,10 @@
 #include "core.h"
 #include "hal.h"
 
+static const struct ath12k_ahb_userpd_map ath12k_wifi7_ahb_userpd_map[] = {
+	{ .io_start = 0x0c000000, .upd_id = ATH12K_AHB_USERPD_ID_0 },
+};
+
 static const struct ath12k_ahb_desc ath12k_wifi7_ahb_desc[] = {
 	[ATH12K_HW_IPQ5332_HW10] = {
 		.hw_rev = ATH12K_HW_IPQ5332_HW10,
@@ -43,6 +47,26 @@ static const struct of_device_id ath12k_wifi7_ahb_of_match[] = {
 
 MODULE_DEVICE_TABLE(of, ath12k_wifi7_ahb_of_match);
 
+static u32 ath12k_wifi7_ahb_get_userpd_id(struct ath12k_base *ab)
+{
+	const struct ath12k_ahb_userpd_map *map;
+	struct resource *res;
+	size_t i;
+
+	res = platform_get_resource(ab->pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return 0;
+
+	for (i = 0; i < ARRAY_SIZE(ath12k_wifi7_ahb_userpd_map); i++) {
+		map = &ath12k_wifi7_ahb_userpd_map[i];
+
+		if (map->io_start == res->start)
+			return map->upd_id;
+	}
+
+	return 0;
+}
+
 static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 {
 	const struct ath12k_ahb_desc *desc;
@@ -60,7 +84,8 @@ static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 	ab->hw_rev = desc->hw_rev;
 	ab->hif.ops = desc->ops;
 	ab_ahb->scm_auth_enabled = desc->auth_enabled;
-	ab_ahb->userpd_id = ATH12K_AHB_USERPD_ID_0;
+	ab_ahb->supports_multipd = desc->supports_multipd;
+	ab_ahb->userpd_id = ath12k_wifi7_ahb_get_userpd_id(ab);
 	if (!ab_ahb->userpd_id)
 		return -EOPNOTSUPP;
 

-- 
2.34.1

