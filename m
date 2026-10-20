Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515313;
	b=iHGlLFKtYRPAAwhEW+nK3SbBQzwqD4KVBDgxpQkOfhNAfcnCszwadQ19D0kJq/A3i/lJ
	 di8dnGCWciNO+e6E8p4BKSra/YXNvzv/6cySRRTjU4M2piARCr44mvwjK2Fyck+hzlBLw
	 xHYW4NidISjL4BlHKwO08r6kBHbI099GFBshEODPNzIsGvFBsk/MomWGvj1zgPWnMevp5
	 kvbeQX3UbrQyOhoQYnWug+nGp9Fk0xXvMoxTmbXW45i29zxUOxtvIIcLzwMmF1nGx2iD+
	 qieqLcyuRpnskI45QmZC4lxhDN7MReVL/PVWeClX1wAD8Y5siONwVhgKX6YlwPvE0vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515313;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7HIv8+3wjV2z6c3n/IpnC/FTiMl437KJCskzpMB6Smo=;
	b=UN0bL2GC0pG+/Npe6wtRN7w5LH3+beTOENNzJpFiKTo3dmBl6MuNbHPRi7YRVBSAkTvT
	 efAiwp8KZ0QQMAcOJwsCJsiAr6+bd59My3XyTwF1JMD5v22A1LTqBwNo5lW4r4i4yhYS/
	 1troOQBwuKXgW89AFwgazifo9+qfQpzJoeHlbsreuSAHLqLXObzYO292nZbFQ8zsYaDLD
	 3FnygkjV1b/DJNcRZUaqkPUCtCxg8faURuOEdVXi5i+RoCoOUDzOJRxcwlb3XrThiMGC1
	 iSydv2cYBhB6fR95YEleDlViRRXJEA07ElfH00wurbpNQb6WnvvTAJEVcSQCoEorRxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A5CYILyG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bqzm9wuT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A988606A331
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A988606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A5CYILyG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bqzm9wuT
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KGaJ4t1332287
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7HIv8+3wjV2z6c3n/IpnC/FTiMl437KJCskzpMB6Smo=; b=A5CYILyGc/SqwuqX
	9EzQlhlw6F0UH8BIy7VfFnn7UgvDBkuhqu5EqBnKUhpp1Nna/+JleYLy9LEOx8ON
	f4HZ7jiW1WW0GTqfd+V+T3zdIv+BFkoicQb+/ivvz5gmgy+Sk1o36hZ+L4A72GBf
	2EvdocoDmLeVdAID26Z/jRa01YcoLlqObrr3P6zhbg9xKmmJz5M2MGLmfxPstcgY
	W5kNzB1YObizVngp1pTa9socuuASdJnaKe/lHIG7h3oTHNq3GgUSjPJ/WnXmICcG
	pQyGWENZpzPe7iYqUGqGn8x4Ywue1Sr2n9DvdS08FXMi6mWEm51mPBDHTjWjL3Mq
	NW3YfQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd02n2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:55:12 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3662e7a9299so3844478eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792515311; x=1793120111; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7HIv8+3wjV2z6c3n/IpnC/FTiMl437KJCskzpMB6Smo=;
        b=Bqzm9wuTEvK6o3PJ6MjOfItmnOzRsPQQrKUj6+V3x26NBaBNqlWufnpk8PV38zeQbC
         Ngu0o7SxP+PqJ27ynilQu3OpFUHAh68Uz4ESFdNTZmQXaJp4cLHl5fJCPZZsUFPZWKjJ
         mnNgXjK7UhL3XAMyWGJrX6llXD0oHFldIgfwyPW8004p+cg3vy7Z0LJkmmDKcv4e4pD0
         Vw7QSn5miGvVLZLTU8pvQhwsiO+VWfww2L7MiRA6xUdZ/IH+EHoNifdD2FRM489MR591
         F7fAzaJRRmrqNHCGr3cbz7LdBYrqqo+SpyoDDbfZYZmsZi1aLI4zM4PCmk44mDF4X9b9
         lhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792515311; x=1793120111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7HIv8+3wjV2z6c3n/IpnC/FTiMl437KJCskzpMB6Smo=;
        b=THCZ70XTo32iXdCIlTQGzaerGFPlmW/C0QWx0l6vSkmN706PbLvElS9D/DfClsTXkf
         +UR9jUOD2gMzMWsChk4RR67cBkJFRT6gtVSNAhFD1U60jqG4mpYaMy5KhYAQxB/QdWpe
         xeYGk6WRSAIBGNXaOne1bXIuggblK5FAC6mv53Qsn+EzAzloJH+c5eNoEfUyt1WeU9fA
         Ni4CAzhzVpAah2J7OdHN5jmK6xEYeQUGCKs+ufXDeJekg4mi8Bz5//Ljh29IrDzuxofs
         EPcVaFztTAntqKPpI+lux6dtzmDZN7fqslBxvw0WW97JSQLmIhkVUqs/3CGsW+bEaTIV
         L2Cg==
X-Forwarded-Encrypted: i=1; AKwUvBxWc/optBtaG4x4CTZpo9G+tnw2QsZmgXgLYiBilH26JYpKpMsuK+5oOTUl8i6K1lgWH6w+n2rkmlAxU/M=@vger.kernel.org
X-Gm-Message-State: AFq9FYItkzZGHbz59wokTovI6X4fnDAWLN3F0QOPcK2ax4NS+Jtc/and
	Yw7YR7CVw8oxNwYsgvb9ohRWkNnAe4VgwCPSzw2J6Cnnucga5+71lrvIhHSUIuHL4Ay45GDkeb6
	SRN1/Ju9pP7fWNYyPhMY8wiVVfO+j/b2jgihd/A9DM3js/zWn/v4eYetLdOWKrJeXeVg=
X-Gm-Gg: AYBFou2XgmWfCMumfv/TkAJzEBQdp9gxbLVnhjCIQ+vPC4qzo/h2CZ8ce+ayG4MSAzj
	N5xFj3JaPDiTnmT40rVm3HguBd0E5Fp5h53Y4Xet1vt4+TL+40O1VoFl/xcnoi8mrzFSPFtHT2G
	4XNN07Jt7bp9QYIq9YpKS0OW9UvjahYJeE4X30NJkQILsB5HkLta6i2PXqinfbiiFhaXe36F+dx
	TuXTw9jWoP94dB9Un4IrZWRUlRSyL+9gWK9BGgcA4NSTQHTHUlyz+7zwLOj8kUKrZzPkl4wOeP3
	jcQVEmxMEC3bVcigYBE7Ty7kAIBVrWEkpwTeL8tfbsQk8QxvximXOUkPEb9z3ReiY4tLIdYTXni
	rebjhoLPAG5KBi2JdW/JbGWdwmLKuPQwOQjBCf8VdYQbjPnPYo2pl0rfwwWvnSAaaWfBT8/qzde
	QCUXOarhbWWqC7PewHHWZokt+v0yeKydGrPQ==
X-Received: by 2002:a05:7301:6447:b0:358:eccb:af7c with SMTP id 5a478bee46e88-361a312cb5emr21821616eec.33.1792515311237;
        Tue, 20 Oct 2026 09:55:11 -0700 (PDT)
X-Received: by 2002:a05:7301:6447:b0:358:eccb:af7c with SMTP id 5a478bee46e88-361a312cb5emr21821571eec.33.1792515310651;
        Tue, 20 Oct 2026 09:55:10 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608297f4f7sm43204868eec.23.2026.10.20.09.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:55:10 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 22:24:51 +0530
Subject: [PATCH 2/2] soc: qcom: llcc-qcom: Fix whitespace in slice config
 arrays
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
Message-Id: <20261020-lower_case_hex-v1-2-bfac89824646@oss.qualcomm.com>
References: <20261020-lower_case_hex-v1-0-bfac89824646@oss.qualcomm.com>
In-Reply-To: <20261020-lower_case_hex-v1-0-bfac89824646@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA2NyBTYWx0ZWRfX69eEjn/bct5f
 b5DjPRriz7JANyGebC5gf92UDH7QXNCPkDJrrbOiS1fUOmF5fhy7ztFU9xFKA3HdE6Fl3q40n1x
 8BleHML48uq1XqSgeC0JVCKRVv/paKmeCdQlBo1zTr53eZJ9ex6xbQBMmcj62YOuuP6qALKTUvn
 PLz5DqiWCrt3T+zc44FRPkTWjUGllnKuing5fZWYt0qiIMX6d3kiKqz55MuJJR5q09iaennvhiV
 J2xhw5x0u4zRePmYHLkXv2WwKwCbfz42ysbVwZuHLOm2ohYEUwGHTiqHX6bhR/NbPe+H8uWtLGZ
 mNPOeNz/rQfcxIobA1chOqFV3TKjQNJ1waOt+S/Yj5t9qhB6GnLx4Ak6KK4Kv15E49Cu4o3ntAM
 SFwbVqQ1/SIOF9Ki9l0DsjxJdzZRJ1s6hp2EfvTjr9foQlXf8aLuKffp62ELx5RdKhiF3PvrDvw
 XwGqFmEoXedpT7awmlw==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad79cf0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=jZBCRU2YODfr08C3DaYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: coy1213Am4_ce_lxZqtzVn4Qgu-5fQux
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA2NyBTYWx0ZWRfX6taXG9lDJBG/
 dG1I0Ro4afxVHROkHZNxKCkwxqJFZh8OO+AGiBYxXzZeX+qpRll4GQNbpt6H73x2CMDMGdVRzDJ
 BGDRnjlsq2Ksu9Rt6cyjGp5zxE7rYrI=
X-Proofpoint-GUID: coy1213Am4_ce_lxZqtzVn4Qgu-5fQux
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200067

Some slice configuration arrays use two spaces before the opening brace.
Also, sdm845_data has the first element's opening brace on the same line
as the array declaration.

Use a single space before the opening brace and move the first element's
opening brace to a new line to match the rest of the driver.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/llcc-qcom.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 2edc5ec31249..aaebe71e2b01 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -624,7 +624,7 @@ static const struct llcc_slice_config glymur_data[] = {
 	}
 };
 
-static const struct llcc_slice_config ipq5424_data[] =  {
+static const struct llcc_slice_config ipq5424_data[] = {
 	{
 		.usecase_id = LLCC_PPE_RXDESC,
 		.slice_id = 1,
@@ -1176,7 +1176,7 @@ static const struct llcc_slice_config nord_data[] = {
 	},
 };
 
-static const struct llcc_slice_config sa8775p_data[] =  {
+static const struct llcc_slice_config sa8775p_data[] = {
 	{
 		.usecase_id = LLCC_CPUSS,
 		.slice_id = 1,
@@ -1724,7 +1724,7 @@ static const struct llcc_slice_config sar2130p_data[] = {
 	},
 };
 
-static const struct llcc_slice_config sc7180_data[] =  {
+static const struct llcc_slice_config sc7180_data[] = {
 	{
 		.usecase_id = LLCC_CPUSS,
 		.slice_id = 1,
@@ -1761,7 +1761,7 @@ static const struct llcc_slice_config sc7180_data[] =  {
 	},
 };
 
-static const struct llcc_slice_config sc7280_data[] =  {
+static const struct llcc_slice_config sc7280_data[] = {
 	{
 		.usecase_id = LLCC_CPUSS,
 		.slice_id = 1,
@@ -2283,7 +2283,8 @@ static const struct llcc_slice_config sdm670_data[] = {
 	},
 };
 
-static const struct llcc_slice_config sdm845_data[] =  {{
+static const struct llcc_slice_config sdm845_data[] = {
+	{
 		.usecase_id = LLCC_CPUSS,
 		.slice_id = 1,
 		.max_cap = 2816,
@@ -2481,7 +2482,7 @@ static const struct llcc_slice_config shikra_data[] = {
 	},
 };
 
-static const struct llcc_slice_config sm6350_data[] =  {
+static const struct llcc_slice_config sm6350_data[] = {
 	{
 		.usecase_id = LLCC_CPUSS,
 		.slice_id = 1,
@@ -2544,7 +2545,7 @@ static const struct llcc_slice_config sm6350_data[] =  {
 	},
 };
 
-static const struct llcc_slice_config sm7150_data[] =  {
+static const struct llcc_slice_config sm7150_data[] = {
 	{
 		.usecase_id = LLCC_CPUSS,
 		.slice_id = 1,
@@ -2591,7 +2592,7 @@ static const struct llcc_slice_config sm7150_data[] =  {
 	},
 };
 
-static const struct llcc_slice_config sm8150_data[] =  {
+static const struct llcc_slice_config sm8150_data[] = {
 	{
 		.usecase_id = LLCC_CPUSS,
 		.slice_id = 1,
@@ -2784,7 +2785,7 @@ static const struct llcc_slice_config sm8150_data[] =  {
 	},
 };
 
-static const struct llcc_slice_config sm8250_data[] =  {
+static const struct llcc_slice_config sm8250_data[] = {
 	{
 		.usecase_id = LLCC_CPUSS,
 		.slice_id = 1,
@@ -2925,7 +2926,7 @@ static const struct llcc_slice_config sm8250_data[] =  {
 	},
 };
 
-static const struct llcc_slice_config sm8350_data[] =  {
+static const struct llcc_slice_config sm8350_data[] = {
 	{
 		.usecase_id = LLCC_CPUSS,
 		.slice_id = 1,
@@ -3098,7 +3099,7 @@ static const struct llcc_slice_config sm8350_data[] =  {
 	},
 };
 
-static const struct llcc_slice_config sm8450_data[] =  {
+static const struct llcc_slice_config sm8450_data[] = {
 	{
 		.usecase_id = LLCC_CPUSS,
 		.slice_id = 1,
@@ -3307,7 +3308,7 @@ static const struct llcc_slice_config sm8450_data[] =  {
 	},
 };
 
-static const struct llcc_slice_config sm8550_data[] =  {
+static const struct llcc_slice_config sm8550_data[] = {
 	{
 		.usecase_id = LLCC_CPUSS,
 		.slice_id = 1,

-- 
2.34.1

