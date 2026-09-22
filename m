Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB753C062A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790111279; cv=none; b=sKn1qsTkcSe2A0IDlAu7c79Y87AOeeX00oyqtO/iO2R8MiSYdWf7mquGv0hz+TzPleIXS9yDqZJ5sAgYEOmauLeo8NXHGOs6NiAsemYOSrHKTQcmYMjSTnzyAsBPxQKqY7MMTslBPFEo8HdVQKA4ycZFnRy8WvSC39NSAOlPspw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790111279; c=relaxed/simple;
	bh=CCkVQQ02A+XZd8aWHExIUK3cAu/PF8VsO3Lst1ch1wo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jhGzULkA+PS2cpSGQW3obdr5pjPyHTfBM0d0XPA+HpI8Q3EC7hRw44ANuf2dnez9qug6nPF55iEe/3hdCmmnRzLQ2DglEqVsRKnbhEkaiB+BFNQ43GPmcbPmtnVuBWLbh1cehvgbne86bhGvDWIbS49ANrYf+p1Zj4Gjqn1lPjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CPUvC4me; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i4eU6W43; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CPUvC4me";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i4eU6W43"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI72BL2033272
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IGuHISyj+a79YHgjzH8qsmYMqpdsZs9kFQ4ZI3iLzc8=; b=CPUvC4meGUur+uy5
	tVoNel582JDy4Gdf18KfGaVOF9Mf2KpUymaV0li2Jv6U6eZs3w8t8zRaSHTPHiwP
	YtvhAtlWJldkwPesbl0ZD8UP2i7Fr1DCMTk3sGZf2RpAOrdy/bfLuIdZe3VuIQyY
	LqLiCmdAlwjx3xwxa+8djXBu717yVNYybc8UfQ0T4E0PDcafhpqSaAgSJaXIhC9/
	ozOKgKXtdZcpsXmlBIOiqwDQACB59kZxHyOqBNZX87uryn0xn65rYVbx55k3/uc5
	S97PAFLEwnPyEb5d0hC8FIFeXkQfkh8ahQLQOsTImLCVTiUgsBlPMlO9DVYclwr1
	4D84og==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c121p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:07:50 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14388794dcfso232994c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790111268; x=1790716068; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGuHISyj+a79YHgjzH8qsmYMqpdsZs9kFQ4ZI3iLzc8=;
        b=i4eU6W43uUcDbMsGoics8l/jV0XB/WX9FMBcJmV8I9mPRnSDKrltnHcMK/3ahbwqtt
         SDajRxiZ9YzXMDTosmoizBTtqR0uhe6lbhAZU6h4qoqCeSqUleV3WsaZ4Xy5IYjN2K7k
         4dTpwfkFw3B1eJalGkr8jaCkLJyXN+B4oZnxD6FYiDAO4nDPpy6D61Bd56dBk/eh5sVC
         LsuKqcfbjNzRYdxHJZ0oqomznKCoiLXlRZp3dn/PRdK1SqDRAqCxvPDV+oaNSqFM2uYH
         3o4AJobW+N6O9QRQh1yd6sUi94yP9z3nz694KOahj3IdtDGiUgVmg1VYmegpBVcgxAvb
         DYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790111268; x=1790716068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IGuHISyj+a79YHgjzH8qsmYMqpdsZs9kFQ4ZI3iLzc8=;
        b=A0QoQwt9iBirZe3hPVME9jxp47q1vECXCeHMmIpzfyG0uHdGU5jujmM8rre+SODRm2
         RRIVmcNJqkvjRDCQ5Kmj1ieaQH0qxeRRAZayPMZKDtmwviVfLLoRBKef4ZmD8YBbbAVK
         l8/0DvzQWMTsH5+dKgsBjtWqKVoKlVGy6LzcYEmtLag9FFTpxBEv0co6CSJ0H27RWjSL
         UON5VDXACAPBz8Uru2Xqa3MQ8fuNzVrY0jkTSxczD31eDlzWaSQ5uoPEf5mV1Jk9eqgl
         yDQ762QQsxOTeGQc1GLQAD3K2d6rw2ZSXO7Gv66+uBVPZ96ss574faodndn/xgbm1SBf
         2S6A==
X-Forwarded-Encrypted: i=1; AKwUvBz1R62rnkRnyJsSFOg4ldV6/j59aihNo7fOajNSoDO6Va5B+Gh72lauWRux/xQhUN9+CfgopO7RBvjPvt0=@vger.kernel.org
X-Gm-Message-State: AFuF++kWdKQRHUimSeVImOWSVi9yDF83Si27G3cckPsKfKuduT/M9G6A
	ort4rXs75TxhcI9UDfUajpUX7CBaIEXLMlxwNpdQSovKGWCazK6YJKUy5jGWtol5fVERyORQmYZ
	EJ4VponA3HsZHnhg5cWuJX3d7U6JA92Hg7q65VEPrPnwmwYE5RMNwLP96N8PRXPfmhiA=
X-Gm-Gg: AYBFou0Yfx0oRJe1jF5ErhwieM2QKsWF2qZ9HrelFGlTBEUmndQerZ624cJZ6z9Khke
	UmV3yiNtKsxPremQ7O/kFlrNGYM4wgRh+Wdh9ioexkHPyJuhQFoplBexe145R8e0X1Uy+OMUAXm
	mXB+CPjyQwbRjKRVE3AsNcbomhAG8Y0c4P245zHCZimrTDm8vlMdTcFFEg/xFAFoEhtoTuYGQP5
	WKYL4xep/nb0OStsKGkkn5gNUT1fmsDb0eAwpyRx+A3/VGg4NdD8TalWeGFWetPcfd0+lkKfJHP
	80F64nbjEfa3KGf4DHHktMIdCw2FWk0wSZHlW4JOD45YAhhGR96wyqVWhdYGzf10rkk8D6o/DuI
	E2boeUJ50/77+vTHFDM7CqRR1yQ==
X-Received: by 2002:a05:701b:4208:20b0:141:4a06:ad64 with SMTP id a92af1059eb24-144f90bb165mr692611c88.10.1790111267820;
        Tue, 22 Sep 2026 14:07:47 -0700 (PDT)
X-Received: by 2002:a05:701b:4208:20b0:141:4a06:ad64 with SMTP id a92af1059eb24-144f90bb165mr692570c88.10.1790111267108;
        Tue, 22 Sep 2026 14:07:47 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm1157207c88.13.2026.09.22.14.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 14:07:46 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 02:37:33 +0530
Subject: [PATCH 2/2] soc: qcom: socinfo: Add SM8975 SoC ID
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-socinfo-v1-2-f0d1aaee9323@oss.qualcomm.com>
References: <20260923-hawi-socinfo-v1-0-f0d1aaee9323@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-socinfo-v1-0-f0d1aaee9323@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790111254; l=674;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=CCkVQQ02A+XZd8aWHExIUK3cAu/PF8VsO3Lst1ch1wo=;
 b=lfS0tsTbqzXwgmy7dSrn/cs+dxnymFhBN8mJbWxRC4NzBJZfizJik1igG2m34OdhNdoqAuVOr
 96PSl2C9Wy8Axs+sI4/q8kkPxY8jd5BsOpqjE7CZDdsQslHjlfC+Q7T
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NyBTYWx0ZWRfX8/XNhWieuHQa
 1GzJAgyNn0UtL/CE0OUvaIMdttkE2AyJI9D193Od/wseIjfrKSbrj2L3ehMbpyJu4KRHD0IYvm8
 jxmln2wPf7ivWDQFKvHr268q1k2vLBn5U6mL2oCquD335Yu0IGGcdONb7CGn+MJ4ACKtFIxi9tp
 B0zEBiGAVShZumaPEGeUgg2RUXozszpIbF9dLQb56bmuNaJDLqIzYYYIP9iggNUFq3BokY3yKwO
 rOK1+9IpNR4mmSc8k1oZWVDGo82QYhZMvnUmN6QCMYchsFOusbfCYG1ejg7336Uvxjsl8KljaKa
 9ndOcQFEP4Tjw7ljG+GJFtAJvht++0Mr+LKqUwRXe1QRn5v23zKq731AXNB+PHwCfaj3uH+YjXd
 AQaD0nYuetD3gBJmFyah9vq+TCoZ5zf2waz4O2XUaBii0lDUiMKS7EHC51scMBmKSPqF5M9op73
 8An4g4fDihaRRn4oy3w==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab2ee26 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=c7wgbAQBttT_6Fm1Qd4A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: nqdsk5C2VEj5sr3VU5jtMOv40r6H7gdI
X-Proofpoint-GUID: nqdsk5C2VEj5sr3VU5jtMOv40r6H7gdI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NyBTYWx0ZWRfX/pGEDdkZDwRj
 /hXN422Mf2CzIP3W87exESaZwtsKoVahR1m/s9O5zeSHVT7e7W5uxTPTdpFwxg3KEW6ScHcFllE
 V/UusH2xtIFjOMZN9MldhrBBinvVJqk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220297

Add SoC ID for Qualcomm SM8975 which represents the Hawi platform.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 63ee5cd561a2..ddc717382797 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -542,6 +542,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCS9075) },
 	{ qcom_board_id(QCS615) },
 	{ qcom_board_id(SA8797P) },
+	{ qcom_board_id(SM8975) },
 	{ qcom_board_id(CQ7790M) },
 	{ qcom_board_id(CQ7790S) },
 	{ qcom_board_id(CQ2390M) },

-- 
2.55.0

