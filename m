Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792834840;
	b=X/eYjep5mDCGMOvPPyPf/m1Sncpt+aF4Rr0AmKiYWzHj+3tHvXFIlrTn75GSjMCvrtQ9
	 LtxWA0cmwR940gKxf151bWDx8KKIBMNvQnzg3+/DBBRfIXUZDSYYO1weLziw9laeTGN9c
	 uVIl8nSkzkeXjfoQGO7MCvn4Q+7kpeeIETepFFollzCuL8vXGt65cY/OcJ/P67kMcG3JI
	 JSfN0jDHrrN625fZjwjzEteW8rPK4Gm0MvW7UxIEj9x1/r+NBzaq67JuFfKj66S3NYWNY
	 TAVtuSgWjUcz2XoETILCZvFyOpr62ckiwV2lQ0ZOZ4HlrfyGWwWOnYNBykD1qucN8Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792834840;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ex+TWxwe4n/JOS1zfbwlpsyfmTGeomr5YFka08TJbYI=;
	b=gBS4zfPE1lcz3iU/Sp+G/FQkeLdrDiL0J4ht0kVsr7CAK0VklmGstXKOtc7RXbbj45vy
	 KzZyuCQ7JsdWTpnyGG23B7kmU6Pmbb0oFDXEmRM5ezkC6Jb6nifbnfmVRlE8CrC9mp4WS
	 wqdZbdwdZ5ux9slKR0Q+yXt/MK4vc1fySeYdUYMKaRVJZbkyr/FEE8OpLOjDToUAmlSL8
	 ZEbxPZA8UZn0jFCBDuOFzFUuQee3jmeTTOdcojvjJorXfLtkm+/5+BJr6geZUutqARD+j
	 p4U5HCIYS8xiSZfLmaTx6Yy0EKElArSV3VKcrjfsFFvtDNwLL8DFtzmOAMEvu9DfiLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B8VUa942;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZmXhoGGD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF61C60A2605
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF61C60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B8VUa942;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZmXhoGGD
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8o2jr1122749
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ex+TWxwe4n/
	JOS1zfbwlpsyfmTGeomr5YFka08TJbYI=; b=B8VUa942JdggGPkAmygfqQYXGkZ
	Ce69dL8ezbwpCSTQXnYx4MQ1ErC/HuymQBVbvm6yUgA0a4IV8Rxx6BSSrCchL0wN
	EDA49K0yHpOnB2pnMnuq8HKSwwBW373OaN2DMJ2SN7rqxlIyJ6Tpd9B/tx2xeCeo
	IxIhr7IKatd1FyX/8cnNN/ffPjwRttTu5iYOOm2weXqWygmMeNPh0gVH3PQTsARB
	V9kKhUS7mHu2licifCPGEDBf6mp85OtFPAwFgKcjKTE1TMF+PilrYa5loCIO7gyH
	9XzRK40FPoqopWDkjHxV6VkmtFY9f59OkpgEihs4OjJeqDueaxrwmqo2ZcA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmrugn02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:40:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so314730885a.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792834838; x=1793439638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ex+TWxwe4n/JOS1zfbwlpsyfmTGeomr5YFka08TJbYI=;
        b=ZmXhoGGDsRHbYqLVA1dLNXILXN4xHOhX3r6FX+JSlP0BCBGE4XoSmVaBjbhLmEzHCH
         6LOWdPDnN0GhO7CEB390jx9/I6V/hDlJX/9NnuLcuFE7vAIDG6SH22p2knVLNAvqzONn
         rptrJsdOP79FckGobi3Ryg/TQlyw6G+9xVVjYnI6nn63Wv0vSZw/YoCjGP8OX837hC/2
         tUL1cIzL/va6FAwji+cfecAJ9ntZeuWlVIbVZl1zXYA4b/gLbvHHRxo23k/loqbS+uyP
         Fii1/QtQr0sPYBQsjuXXAA+AMfeu1rr5sD2wQ5Rvt7iWNZA/jFAsRi2QTuXH/3sLrJZa
         ez+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792834838; x=1793439638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ex+TWxwe4n/JOS1zfbwlpsyfmTGeomr5YFka08TJbYI=;
        b=jtIznHet3wSnXow3210rvRIAJFFZa4RHBkhoxI0t+t01xnzjjysR3kE5v7WksPlj86
         Rrroyt7mIIRVOVDBOzamERva17cf6DX3pbI1VnXnP2KDP0tyVoo6hC0kAy/yb4bO6R2E
         RP1U6TF3H+JWFnss9QQ39AUxRX1jILIuVajftUQ3P2FbeFXqo3aShho0LgRzWet7u1Hm
         63XpCZu14DQoY4mj/70IeXjHygPTUWHpsZ1Y1C8ftHTMgtk6ernoggdyRPFLGEh2t8Am
         MDwiH23Rc5YzIqNwvVikHvtVn8JYw4Vp9sDssM/Bp816IuBjpy1boi5u0OL3KEkbvRlT
         1N7A==
X-Forwarded-Encrypted: i=1; AKwUvByQc+I7Z+6ocfwayPXrV3DEGlXL86NHc75oWHohc64fYpK4jCfuIco4OLFmJb/57LxJrwx8a1pfDaZaGUg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLD1ha33TFaCdc+4dv8JdJyHY+pWIGZZso35dw63/qShF4tHRNu
	jKjvGo8vQma78g8MBNcgiKCU7AQHGr8jwQeD8OpjEvkfRMcSJWWOuELNutKPu3HMsLJx5Jh/B7U
	rVf0QZnKuc7LzEIpN/emyi5VQSn4SovMOtBH4wdsJFa7QdRI8tLq/evJ/RQ5OoYP5ZsE=
X-Gm-Gg: AYBFou2gI1ia8A7cjVaWP9EBinHOM0QkI6J/n/wFu54pL/MHMrdtxEre5MalDWraDm3
	veLkTF0xNn+U7DMfJsO/JmX+HD9btNOY+eyqTVwFij+F8WMdZe1McAtRYmDvpPrRJM3Jw5Yx5Pm
	UdmsA/4Snb7kYYO5/XtmGBQ3mv4xqv1obCh+FCnoniGmctO14258fPVU8xsphk1J7ZxEBXwddOH
	t5CiZEemJZqQjw+xXGxixXgJ2IzRHGh1moqjGYq79/wIk1Z1SqXFs5kilGR+MZkl5zwve0iIP4q
	3FLWM4dt75mK2/3hmZcpQ/GrCUpR8EaECHbNJ3A9W2F4jgk5G/97nfKVsW02LbN+Lxr3XbxKxK1
	sT5ERncymxJNmBHA9TOBVL657
X-Received: by 2002:a05:620a:4150:b0:939:4a44:5f99 with SMTP id af79cd13be357-940ef79eef6mr221539385a.10.1792834838222;
        Sat, 24 Oct 2026 02:40:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4150:b0:939:4a44:5f99 with SMTP id af79cd13be357-940ef79eef6mr221536885a.10.1792834837743;
        Sat, 24 Oct 2026 02:40:37 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3bcdsm2857166f8f.13.2026.10.24.02.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:40:36 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] media: qcom: camss: sm8250: do not set VFE core clock rates from CSID
Date: Sat, 24 Oct 2026 12:40:24 +0300
Message-Id: <20261024094027.3095475-4-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com>
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAzOCBTYWx0ZWRfX0c3eg8oSloh0
 0szYSTPMaHad4WfxhA+bFaYi+xoEU9Peo6JIogorAIohAgGSrxSp08U1wYp80WJ4EHZoRy6BnEx
 q5rlM9Bs9ty0r+fI0zAsJbuZ6FxdJG6/6evmcCN6Cwrzd3vdR8wglxwFrYWalbLh2gxutjxyxKo
 AEiSStuw6/w3+GvMTncVVMSfpxQM9AarAkGzcn96B2TEk9pfsHTKBF3nPw53rnuqU0RkeR9RCNu
 I/Q9NJRvmoZ7BuU96+3bRy7tuT8qaZV/15iXAHHD87dQ/iTG3lCk/nnc3E/ipdD2Z6kzwP7TJQT
 nSWIp9PPvfxeG6GzqdUlkovi1K9pA1VA5RNkxzgxksQYzeQEUKnKBC8LLXIohIhdR/yEbXenNg0
 HL1INzT+4sTxGhfjxpkURMWvo2eCkA2L7LoYr3mnSecXgLxj2A13aGnfxwrb/XTNSWN+F2fJRKO
 pe3c705jUeKETb/GxqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAzOCBTYWx0ZWRfXyvqbQYkMmcLx
 sIyceRCOcN3p63sn+PLWJ0Q8X0JPkPBh9Ipzljz0s6cZWlfqpnFQGqYH0x2nuuW/e2SDSR3w0kQ
 GbXmpeAJ87kSRVJpuLPBDVQgt7MNvw4=
X-Proofpoint-ORIG-GUID: jfP8EgSBWGzq9VuxWToOBaV-1aDgbCXO
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6adc7d16 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=rPRfP_fVeLzQRQyiyREA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: jfP8EgSBWGzq9VuxWToOBaV-1aDgbCXO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240038

The SM8250 CSID resources list clock levels for the VFE core clocks and
for the shared VFE Lite core clock. CSID power on runs after the VFE is
powered on and sets these clocks to their lowest level, overriding the
rate selected by the VFE from the pixel rate and lowering the shared
VFE Lite clock under a running VFE Lite.

The VFE core clocks are set by the VFE. Drop their levels from the CSID
resources so that CSID only enables them.

Fixes: b4436a18eedb ("media: camss: add support for SM8250 camss")
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a..7fe12049b78a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2052,7 +2052,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe0_csid", "vfe0_cphy_rx", "vfe0", "vfe0_areg", "vfe0_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 350000000, 475000000, 576000000, 720000000 },
+				{ 0 },
 				{ 100000000, 200000000, 300000000, 400000000 },
 				{ 0 } },
 		.reg = { "csid0" },
@@ -2069,7 +2069,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe1_csid", "vfe1_cphy_rx", "vfe1", "vfe1_areg", "vfe1_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 350000000, 475000000, 576000000, 720000000 },
+				{ 0 },
 				{ 100000000, 200000000, 300000000, 400000000 },
 				{ 0 } },
 		.reg = { "csid1" },
@@ -2086,7 +2086,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",  "vfe_lite_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 400000000, 480000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
@@ -2103,7 +2103,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",  "vfe_lite_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 400000000, 480000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid3" },
 		.interrupt = { "csid3" },
-- 
2.34.1

