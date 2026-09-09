Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CA33AFD06
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788936070; cv=none; b=Yaicyv1vMM5yWBKqt+rAQvNfktrYsosWKK1D5+EElAJJ6jIab8tqhdnU4rxrnd99LVv/Bv2kNZ1lY6s6M6kQEJVc8mTRiRIhq4EjYcQNoeijZd33wdOUbR8dSDm0nHFCPtmaFidgdr1P5NyjQi2J/PqO8Df8EskOk5+6WtUzokY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788936070; c=relaxed/simple;
	bh=+Jp6VRLD4MUVawAQTMdryv1q6Q9g8UqRjjHIGO201dE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pkWJAGmVHvCnL0DL/Dyi/2i5X/CZflJiL/NnRR2EYmck+wjTrHj1T51r5uZ6jl0iKQJWmd/LcNVYPHkpNnVA74qGzgBkkC5NddyOUv4ex8KMDDAfSrCElXCnn+jQyMBl1NcxHE8L2UJR6wYRY1tS5yAVfbkk2bnZpWMJJ8PdByg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=asQTOyWs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NYQF6OTZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="asQTOyWs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NYQF6OTZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896Q1jQ129688
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 06:41:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bGBNSK/7wsv92hEK0ELVfH9p+Nwqv2/ZRXgKBSn2pSE=; b=asQTOyWsEo0de7yO
	EpftvU84b+WMqAjebwS/JZ6HOmlSwPXDilOM5vxK/Yx0HCqOGQEip00uQ9Ea/bJc
	RK6g9BzA6E1GH6rjcXpIV6veJr2D9vk2qNvvL4HQrD3y1uWJKnhRAphn68QbxB3R
	DxE0Jt8aWAtOGemcH1SPiAkA1mreDjdmc/POSl6d8vyr3nTjZwSDun7OF/ykgcbx
	6nGK/IBT3N99Pi0WoHBgwBtolKpdzY9nelXCl7NndRjy+xtQIRIrkuGwKN1JnWC4
	DrfQiXIbEb5ndpKHonnQwcblD11ayAjV6E+mnWqqffHPNT1fr3W3x0W5DKhh7pgZ
	5pgCFQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjntpk456-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:41:07 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db050d469fso42575155ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788936066; x=1789540866; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGBNSK/7wsv92hEK0ELVfH9p+Nwqv2/ZRXgKBSn2pSE=;
        b=NYQF6OTZpfQnSe9EvBajbXZzEtsBs0wL0DodvxE33j2RkJBnP46MnUQGAyIQscRjUX
         TjqdHmsYwLCwkGqd+AmZAf6VvjKnwOcuasSy3FLOtDIz8P1Z8x9ek7mWaKgZCmuNHtDT
         MHok/qShfC21sN9GZEAWagJhKVph66nwZtufPy24VLx/G3aM+/xdGUNJ1xKIIcawLOCJ
         sW95GGCRKcsBqO0Tt7QUfDgosGZu+2RSp3z5YY5tp4bSN0r9T8QEYBggFVCPokZb9i9S
         sdVUqOyG1Om3URCG5bLL3pWSWNuT4LrDpbzoBXTlQgiGQkXjJUdbprGnLkVpS6LnozMF
         vSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788936066; x=1789540866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bGBNSK/7wsv92hEK0ELVfH9p+Nwqv2/ZRXgKBSn2pSE=;
        b=fTTWhzGtjsWAiV5poNUsMQRUo6jReWOCFpfdcKc6ghaZupu8CqCIpNBPKgQAlSQJzI
         WpQSVFpKRxvZGqGWGqKIa0rTCXGTFONaFA7FeZEJQXnILHjNle2N5lvx3elltWBXxDSE
         ZU3/K2J7iQD9V0Y7X4QBEiGfI14Xn7DYZlpvbUz5UhOPzFsEQ0J52clArjhaJK3jMDa7
         XnTpdJnOSOnQJ8XeU/wH0Jll/gG2AhmEpPfbiz/9JeOGSfB0laiwo2hdlWJV+1785VF4
         bIS9WPYQtc2cz5wwx39EW6v/JPjNZxb2MqK/xRiDjSqNK8QDXgltu5GWJUhnP/Df9MIc
         Ea1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzOp3wvBpb+8tEkbrrle4/ef4erCigogrivTeREqLH/+bONdzwNd/83MIdAmJOYRJMsnXemV3gb+xIczSQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lY0sAAuppcvoGfQa/Ypw75zYcTRIiiF68fxBidPlUU2OE+d1/1
	n+oH7TQAmsz4ylSKyDaots9hPpj6tMNkct/dsnC1IrOorkjwbNPGNsQCIU2necQzNrrWunT8CcV
	e7w3RG+qc5jHghxV/0tiCvEq1xIQ0masqObVF+E2WfsDtjTci7gWBGzyev/233ATGnFk=
X-Gm-Gg: AYBFou0STUv0hS6o/P/HB0XzgwIq85j12ucV6kBFfeFb3PhETfKLDBoat9gFdU2Mn/d
	0Bh4aLW8UuD4uXoaV9NXOLbp6G0N0lte04Kr2cMfA+Q+HjWkt5CKXqJ2E38i5q/VhLA27HqzH2O
	ZSdhpD9VJpAsiD4ymoX3DUTazSEl1gQv6f6NLxUu6fGkRuSGLZDK6c0JUB8r3ZJEaN2HWWzOzUi
	g3EYtXWIyBV2MeRFuUcslPvjeUqdPZskkPezvx0JMfo32G6h02lNCNA7aYF9SlyEyxS+1Qet2Cn
	Ur6CfYFMSVHaENU8ZLNrsBH6GAxCdXSzYoxvjwcA5FDEHd60nTHe3Hq03pCU2edKfsj+Yqaip8y
	LfrubEszE6VyrBSf2VyLq607HMaLXbB3xY0Xoair0U70ks+6Dh1XiRmqAU/B4zEmJ
X-Received: by 2002:a17:90b:2249:b0:396:d28e:b53 with SMTP id 98e67ed59e1d1-39b0865350amr41698923a91.20.1788936066543;
        Tue, 08 Sep 2026 23:41:06 -0700 (PDT)
X-Received: by 2002:a17:90b:2249:b0:396:d28e:b53 with SMTP id 98e67ed59e1d1-39b0865350amr41698873a91.20.1788936066069;
        Tue, 08 Sep 2026 23:41:06 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm35553014eec.4.2026.09.08.23.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 23:41:04 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 23:40:54 -0700
Subject: [PATCH v3 3/4] firmware: qcom: scm: Allow QSEECOM on the Glymur
 QCB
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-glymur-qcb-v3-3-c194c0219218@oss.qualcomm.com>
References: <20260908-glymur-qcb-v3-0-c194c0219218@oss.qualcomm.com>
In-Reply-To: <20260908-glymur-qcb-v3-0-c194c0219218@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788936058; l=999;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=+Jp6VRLD4MUVawAQTMdryv1q6Q9g8UqRjjHIGO201dE=;
 b=/UlNSsShpnHZTrx7HwszHe4HQ47zF71S0Gz47ikS+aF0wk1d9RKjeo4ct9CJHAkqzea3bMi9b
 ZsCQIipVyxfBnCs80Z7KbpEI9ry1nz+ZYMkYVFKn9YWEAVxi7XeaqVr
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA3MiBTYWx0ZWRfX/6pOSFky6dmH
 HSBTxXE7cjIETnuQyzfHetBsl6VggxBlw5xqqS0CFaed0KSSSO+/nirWWsjVUY1o0PW8Ge9DHul
 lxHrJdm6jypcz7DuULR15qrr7vCJZsxGs/sEreLovFgbtNbl4V1N+KhBq1FUMx9KBapoVKPHq21
 4F6YgNdWKtcLsBDUWOGqyPv26gFPXboAj79BrksKCTop6zlsJ9HINNw7kRaHDzYLbGp02E9jepU
 cE+oJ4hUH2H2UxUHKqL/crxzNaRwP4dcBp0frqflbkV1SBTbtMILuXrfDHrDHyCj9PUOZF5KAJv
 JHrlOC/UbmCs4RCMyvOZghRArksQ95TDY8lBiLYEPHdcpr2MvqZUBkK1aFO1T+nsVjEZWh5sEVl
 FNfV1GaUg2sWEru/ImkduPMKKbA8AuG/nygDo2Wykae8M5qwiAK8UpX+n99GBJ6iUDq8CSYKnaJ
 4vtEXH48xsvFZWrDrmw==
X-Authority-Analysis: v=2.4 cv=N+AZ0W9B c=1 sm=1 tr=0 ts=6aa0ff83 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Gf6kasYTCoD6TKqZ3V4A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: m2q4FkpKbcCXK1WTXwhX73nqpQOgrYC-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA3MiBTYWx0ZWRfX0CW7oTKD7fqh
 07MiIAvFX4781Ek+hzqr0xYEO6ECx9k7HWulyyksG8BJ0warnnmDTITsos8Byic6FVNA9PGjD64
 bt/+C2v8Ejw9livzkLecHXIe71ugVsY=
X-Proofpoint-GUID: m2q4FkpKbcCXK1WTXwhX73nqpQOgrYC-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090072

Add Glymur QCB board to the QSEECOM allowlist for enabling access to
efivars and uefi bootloader.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 882d1865f3a4..9bb3b072d8b6 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2243,6 +2243,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,glymur-crd" },
+	{ .compatible = "qcom,glymur-qcb" },
 	{ .compatible = "qcom,hamoa-iot-evk" },
 	{ .compatible = "qcom,mahua-crd" },
 	{ .compatible = "qcom,purwa-iot-evk" },

-- 
2.34.1

