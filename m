Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180146;
	b=v68xTWc2qaQxOaDCxxmiIRNX9dYb42DohgXBD7jDb3KJtfrAnj0bS14NDno//PWelIvY
	 PuC24N/WCs+kPrD7R2ONR1ge35Lyb6RBiUucQW/8VO8qnOS4aKMmouI+L4gbuhBRJPiQO
	 pTEpWrf8jautXaOppzEMFnKU2NccJpIz6V+BbQnogB/vvwWKcCMPDVnRNwlABacWOPowN
	 vqRTHLKsj2iomyISjw5cihMA1XAPGOwR07YFpr3omnewe3jZgW7fb7Cv+U5DHOhyheBgH
	 2VF45ahhWpXruUqdNt38q853DreEa8R+HHV+bHr9SwWiXxmuB+A35hdflXwldJroY1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180146;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hGs8USrteTCnFgTKJDdRh8wPVgKar+hqcdnXt1kAxFo=;
	b=3qyslkCsSLlwALu4ZDsiBehnPA/sEUmQWKUjFux0+P5bUPvME3hIvheHmzTIkSPzcFD3
	 +67bBQnEMoMHU+5ikUd7pF9UlohhZWwEQ9bZeQPZQuCZAhVCzLFVPEo9yaV2IAMP5tTRC
	 k6adu9Wq8aV0QP/SY8hkUI8Gd5nB9+QT0KvasJDdkvB6S/TYk/IJEPY/c7aWMOiDs2MZu
	 NbPVte5ATf3v6IxU3UvFOAsawzCSuuaKcMk4JwNPOz1mRhTvAKFyF5Kh2lW0UfTqrisA+
	 /Dpf1M6jvZ4oWhwDIR0zeNmSvNmmb+uWEFH+BAp1BfO2+zqo13ghwADbryfWfHzN7WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hiruiy6K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A0+7hSUx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF400606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF400606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hiruiy6K;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A0+7hSUx
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KB471667715
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hGs8USrteTCnFgTKJDdRh8
	wPVgKar+hqcdnXt1kAxFo=; b=Hiruiy6KYkekflFte1OntuldCqpqM7L/itqkxY
	CkeekEj9xGTeu5Grz0XlY0x2PEEId+Tp+m38AI1iVuR2p2k6ld6o/xPHiGnWfR6V
	35OrAoUB61bY3jaT6XFvqBe1KVJLgzi1L7kkiqdzvPNChguNKj4Eoky6FKSYnqpp
	2rAkDemEN7fygzAiusW9aeQtnM6DLCTQip9+LA+xOOuG+WqDT6LVepmOPLaSPBP0
	zCfcSWhwUmkkiBazRMV9xtbrj4qjZF6yQiZizFNR56XZ9j72kTi7eRmLHOp2AhjF
	xUffWjlseRnJB/VadQlqN6TsiShQy3TnuQm9C9/dKhggyHvw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12ptwma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:35:45 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd65285537aso352172a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793180145; x=1793784945; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hGs8USrteTCnFgTKJDdRh8wPVgKar+hqcdnXt1kAxFo=;
        b=A0+7hSUxUfyJBF23Vhz199WgIwSJXxOI+Fq5eMfiqe5i5/6Z+ImDBQSRMbNJDZsUa+
         CPSDVykCAA5i05RpdF4WIKDk+TglnArkalpfDLFNRlNvdg3jHRyYL6GsQSZs38i7NreA
         pnn2tkFqGXmW9ySSmSAmpgYgQY4/khfViJYSXv+qeIuE4YCcwRcqETdvR/ef5jkL6A2c
         nQjWmrpkyluSrdjWj6hFeh2iHV8lU3LAfS2l/pPrnq3f0E0CO5SQW0y6DqJwTZdlmH79
         OE8xcKBSJHvvnp2OLmB8/42LnqNSbSWk8bXUFGmO5cwU6VfWYKNCCCaecFxwyJy2hY5P
         3E8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180145; x=1793784945;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hGs8USrteTCnFgTKJDdRh8wPVgKar+hqcdnXt1kAxFo=;
        b=bjaqYyQnItVDDIB6rMruQaNlaPUZIgj1Ker6kt86kdLH+rHxR+oAbSIFRKi10NFXeV
         JSNujhTZCtrUwY9Wl5b7IQezaJNnRTFnHLIwqxj7kIphfVD+qRCm4U4wo1kfRZV9qWVM
         to6fuY8fhPozPb4daf9uVITNXrN0gWmyH8fPLuwYa3tSf6UExXPVOluPhXV4LjIzEF+/
         FXXAVsos4nzrspP8VbW4fR4PFmQvnJ5lj8zkp2PnCsk2LsRF9CJiFd+RkttG+6P08+En
         Y/uUvGT4baekJs1QOE8XXkEX5UAkZWhc8vLJsvVVXl/Lka7ODZy208OE6ec928EAkMKz
         zW4w==
X-Forwarded-Encrypted: i=1; AKwUvBymvi9Mi8Vpi1LekhWOFOxQp/R8vu8hlD36SL/nJ+WYGmNkxlCpmirXEzvjaJwgvXk7MkcexzDD6Dhb/C8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4FrbxOPEMslVLMUAUtnST1Ina3rL8wOdOENTDT2slLFg3Fnwj
	JAyDkrvda518SUMQDVOqjMpheVQmsXPKRVuUTFkjr2r9KaUiLrYd+URSXNziVyobhmYl9oqa7Hz
	XlRavCkfMU3a3jsjX0pZxTMm7WLO7c7W5qP3oUvoLL9y3yOQh6VFfX6CP+KWD89fXqeE=
X-Gm-Gg: AYBFou34be7XT0/GZ17RxXqkeu35yK4ZJkljv5uEE5AxbpyOWagWZRYEPtX7+anUozF
	uBv6k3H84Xc1JTRDsA68YeDkDtmjCETDDDKO+8GY+MIsq9yb97Qv1NlfvzMzufJZr9u7m9nkUw4
	vltoU3dz/JzwabODnObWOVigGrSIRgM2v8sO29mnulf6Bhd6P/TXGwUqO+7PSP765KaIGsevKF8
	VLcM4Q9aC25X1GyBD/mkQoRW29W4GNwZB1hQSC/PIilJ012s3FzP87qv6eryDhh+3D+Idzn97mX
	io3qiwnlXptHDYADx+E83q3yqV4RAVGWW34s6Hgg2NL87bhXweeGZ5HjFj5uUjTEwiF6OGSMDJG
	A2kMgD5SoJmGRSQUcV62EW+1JJsoyYJFo3HJ94dfSAdReKnojQikkAJNm/ipcdSNHibFPEXlU
X-Received: by 2002:a17:90b:2887:b0:3a8:92a3:8baa with SMTP id 98e67ed59e1d1-3ae580ff5a8mr1265564a91.27.1793180144538;
        Wed, 28 Oct 2026 02:35:44 -0700 (PDT)
X-Received: by 2002:a17:90b:2887:b0:3a8:92a3:8baa with SMTP id 98e67ed59e1d1-3ae580ff5a8mr1265536a91.27.1793180144058;
        Wed, 28 Oct 2026 02:35:44 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a5d3fccsm2255502a91.15.2026.10.28.02.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:35:43 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:05:32 +0530
Subject: [PATCH] clk: qcom: gcc-glymur: use collapse-voting for PCIe GDSCs
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
Message-Id: <20261028-gcc_glymur_pcie-v1-1-a2163e1d2b9b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOPB4WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyML3fTk5Pj0nMrc0qL4guTMVN0kY4tEA0tzA3Nz4xQloK6CotS0zAq
 widGxtbUAwWXGqmEAAAA=
X-Change-ID: 20261028-gcc_glymur_pcie-b38a0970773d
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: gIP9AI6F8_WoJIlazSckCqjSu7cozRoS
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae1c1f1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=h9jb8CZW5PYlqcvXSHoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfXyyK/d4nNdsyd
 je0jPoodCbGwzdz7njXOiVihOV+kypBy0Yo9F62bc1X0dkn9rTEi4y9RxzlXc7NUgxcR4GpMUuQ
 WMC9qRhqKEYMolQhU48OeLhSLf7ixO+SUzrpOXQbwHCWrSm4w0+oBObCtuG+IzBIPcVqVuQKLWM
 QW+1D6dKPbJ/7EHJhqWlN2D3KEqNksc6lCKUkWJBDetZvTxj6TwlhitRsKGwF5LqS3cTPcVLAMT
 xj5qy5T3G0tEv9aqXgHWBrTgBEgOr0FDetV5GFwZiS/Zrk70eJr+X5sT8IsSMlkKShXx89SEkcP
 daXBTRj0xYIOuM7A7E5Vv6yIwD3b3GZbGFu4xJXbDdYChwVqnfT/v0HThqEU+VlTwGYBMyaO7e3
 Yio60w4CDxkJEe6lG6BzlTkE0hghFoG2Y2gqa+l4VDJB/i8YPwfeyZaFJHBjVWvNXYxSc/iYvYX
 j6Js3hMLz6jq4gl1gIA==
X-Proofpoint-GUID: gIP9AI6F8_WoJIlazSckCqjSu7cozRoS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX+Wlx8jLXdd/H
 vf12qD2DbmLNHNRhxFvPDQHdxEK60AGy/WO3hadYccwHwPtIMNKe4QNWDDxQpyodYhIjslWLxd1
 K8FMLaYLAuUlg1Jh+QTZR4ZS+RIjTZQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280038

The PCIe GDSCs can be shared with other masters and should use the APCS
collapse-vote register when updating the power state.

This is also needed to disable power domains that boot firmware enabled
through the vote register.

Describe the collapse-vote register and mask for every PCIe and PCIe PHY
GDSC.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index be18a555fe314a41e5335ce8cc100ae8ed226ccb..11be8fa7c7de7c26cc3f69279cc3d5608bbb89a7 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -7581,6 +7581,8 @@ static struct gdsc gcc_pcie_0_tunnel_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(2),
 	.pd = {
 		.name = "gcc_pcie_0_tunnel_gdsc",
 	},
@@ -7593,6 +7595,8 @@ static struct gdsc gcc_pcie_1_tunnel_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(1),
 	.pd = {
 		.name = "gcc_pcie_1_tunnel_gdsc",
 	},
@@ -7605,6 +7609,8 @@ static struct gdsc gcc_pcie_2_tunnel_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(3),
 	.pd = {
 		.name = "gcc_pcie_2_tunnel_gdsc",
 	},
@@ -7617,6 +7623,8 @@ static struct gdsc gcc_pcie_3a_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(4),
 	.pd = {
 		.name = "gcc_pcie_3a_gdsc",
 	},
@@ -7629,6 +7637,8 @@ static struct gdsc gcc_pcie_3a_phy_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0x2,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(5),
 	.pd = {
 		.name = "gcc_pcie_3a_phy_gdsc",
 	},
@@ -7641,6 +7651,8 @@ static struct gdsc gcc_pcie_3b_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(6),
 	.pd = {
 		.name = "gcc_pcie_3b_gdsc",
 	},
@@ -7653,6 +7665,8 @@ static struct gdsc gcc_pcie_3b_phy_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0x2,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(7),
 	.pd = {
 		.name = "gcc_pcie_3b_phy_gdsc",
 	},
@@ -7665,6 +7679,8 @@ static struct gdsc gcc_pcie_4_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(10),
 	.pd = {
 		.name = "gcc_pcie_4_gdsc",
 	},
@@ -7677,6 +7693,8 @@ static struct gdsc gcc_pcie_4_phy_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0x2,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(11),
 	.pd = {
 		.name = "gcc_pcie_4_phy_gdsc",
 	},
@@ -7689,6 +7707,8 @@ static struct gdsc gcc_pcie_5_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(8),
 	.pd = {
 		.name = "gcc_pcie_5_gdsc",
 	},
@@ -7701,6 +7721,8 @@ static struct gdsc gcc_pcie_5_phy_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0x2,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(9),
 	.pd = {
 		.name = "gcc_pcie_5_phy_gdsc",
 	},
@@ -7713,6 +7735,8 @@ static struct gdsc gcc_pcie_6_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(12),
 	.pd = {
 		.name = "gcc_pcie_6_gdsc",
 	},
@@ -7725,6 +7749,8 @@ static struct gdsc gcc_pcie_6_phy_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0x2,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(13),
 	.pd = {
 		.name = "gcc_pcie_6_phy_gdsc",
 	},

---
base-commit: 151a134a4e6ec66f69db8750c66006f5207f7a9d
change-id: 20261028-gcc_glymur_pcie-b38a0970773d

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

