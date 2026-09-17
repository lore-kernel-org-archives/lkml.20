Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8692A3BBFB1
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789621341; cv=none; b=Pw5GjrZcizYLdCpHlvffQXZnJe938LWainPrF/fwh8vGF5Tw0gNJyH8K2FC/5TbX6Y+J9B+HILRLAshWEO6r40tk5E2WVDjsa2h1ELEtSqDYIXBrrggDT52yD7e1Ima+hWiw/0M5yZYiusdwHVt6WbKQFeBttQrUafJQNFwNEzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789621341; c=relaxed/simple;
	bh=Y9NxHc+xglkqVwfzuTXqVBNNH9QwhOHaAntxIH8RZsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qFfnzUJst47syzPqkXtTwzos9dcqcExJ/sZF3KlRA/mJiBvVsDT0ARnBBf2Gx+KEBZS1QMWNJBauxSZdNAOFZy3CV5Qmc+m4uMeyYSfw7t2Wfx3QpKXIS+RDogIxccaM5ZvkaU3iNuj3Iajr1forbAb7Z/U56csFSUYqmTAKT2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a0gNgBDe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BjxpyLz8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a0gNgBDe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BjxpyLz8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H44AOP4038572
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M3JIU2Ao7wEoQjtG7vqxKzMv1IDq7N5iVzUKdH14XEg=; b=a0gNgBDet3oawHgx
	i/i9v8FvhTE3LvDlxg6ieqWgsQE3ec+shngtIuwdHjo4hh20QrD3Gr8fjjOSzB5r
	DOlxzGqXu/Mf87CHx1P1rH/H2nQylf45U1Fv5VIK1E9Ndd/WMQGlDDTO5UdW31na
	CfTVQsZAYNW7PKkKjqn4QdoG5E15OWnRnTcy99OKmUdGdCJ09QvOaF4CTISZgE1P
	eZGcYvfto1ttQyRyo4DZnA0x3cRzostYxQv1/3PiW6Um6A+R0UoF6aDUiOAbHEmp
	fLTV+XrvT0qhlxBs/yINF1qArfuCFFmZD7DSlqlkvj1V1+BAPMWVdFHdHkIF2epd
	wdPK6A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr8uw065p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:02:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-396901263b6so849692a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789621338; x=1790226138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M3JIU2Ao7wEoQjtG7vqxKzMv1IDq7N5iVzUKdH14XEg=;
        b=BjxpyLz8cOD8+7eDwvEblc79CvSTnAxsLCyRcPrzZ6G+xjnvh9kdro3e32vm1b74z/
         +0ybbkes3XNfvbTv9HRxtRXQGpkL3yWWtnKHqNg8yb8ILfJgp+6ckxnx3C/khBUfTuKB
         ykNktzG3K/XGcExBUoUyGSMb/9Apg4O1t3lhvgJXG2BqwTIyQtOPxjctOZGjMULQ64Pb
         sZs1+n2dcgzWnPEebRal1hLyhgfZSWeXoV4A4n1xOm1wUuMDr+cFLIOi3kKgLlFfFrgh
         iv2A+9vPE56BMkRdDYO1goX2u28LKtSOR4NdhDJEAlWoEFGbxLUffhzxhKQJgSsVPyql
         FMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789621338; x=1790226138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M3JIU2Ao7wEoQjtG7vqxKzMv1IDq7N5iVzUKdH14XEg=;
        b=jDaJXkQhupesdymY8lMNTDX7W1JMGNIOOkg0TrFBqrIPZy61ubPl4qLGrWUIHdKKxR
         ah2gd5kNpsuFb98T5WCnd59OvzcE/TyekhOzJ7oyTATCD8SnPJRd5ZzBkOSzUecvW+Tj
         zkbraApEJ0QZaDVzPLYBWiL2awDkMqSafaojwAYQeDIEIUOlkac4tfCOvl8aeB/dojOP
         8LXItDgaEqcOyDjbRilWv9g8oLVtbEIAA1NftFf/CGPD6bOS2OgzqS6r5MlX+kGbrvYn
         mzY5S6yzTeQv7wSOXIxJstHfe4h4i3Oh9NHWUHAKrRgXTM14N5+oBC8GKsoU6HWdNO0E
         4vaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwccCnin14vP0MvNcB224/z6RbdNew/Pnr1E/ZXGJarIMCB3FWyHPiOLVivBIa50A0VuVif6Y2vgsW+ENM=@vger.kernel.org
X-Gm-Message-State: AFuF++mJBsT0z7UL+NQW5b9p51/YhV0HN+85jzCjkV4+cBklyIYaqN3v
	zTuNp8N7Rgb7POCD0Hvikq/1nm1zGmgDwEInWaQGZ6w4wfT3ZMojcn0HvJudEnBPz44BlraDO1H
	r14pF4h73uzzS9Fs/2Trbs8D0X9/xoo3CfrLx4tQ1rpn5GPiPf3zN0yAA1/dCOztp0K4=
X-Gm-Gg: AYBFou0/RMqsly7B5dc5cQWsKjaiLzHiGneAoBpHLQtrKPyGWa5XK+jxNRTbMvgi+SY
	/qV6ba6wNqjVGwNbUVDnKyouCUJidTQmkKAk4oQ7RnO2xupjQEZzkdEoZdEuTSobwUSKkjTQwyP
	vnV8jRDmKoD4jlcyklwP1CtdIXwNjVGyenxnewczJvXjApylc5+pwzTmJ+m/mGzc5hurOLfYnbA
	enjqWyMJpE1g7RMF1vKof8ZhLyEMSzH/ExJ4dzx41GNqeH/gxZvEUsluEBv09DTIieyPFCGW+Yk
	w48cAfBpRUGaMiNfSYHml6Vs1SMR05ho5QbyRIc75vFqgzq2ki/5ygesleH9S/fH4yK+lOWd9tZ
	jLQE8atzd62jNdRaSuYTgUtIWeRay8ThsgA==
X-Received: by 2002:a17:90b:5785:b0:39d:ee20:1e2c with SMTP id 98e67ed59e1d1-39e1e5042famr17381544a91.18.1789621337915;
        Wed, 16 Sep 2026 22:02:17 -0700 (PDT)
X-Received: by 2002:a17:90b:5785:b0:39d:ee20:1e2c with SMTP id 98e67ed59e1d1-39e1e5042famr17381376a91.18.1789621337310;
        Wed, 16 Sep 2026 22:02:17 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b2753csm23544223eec.31.2026.09.16.22.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:02:16 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:30:28 +0530
Subject: [PATCH v11 9/9] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-glymur-v11-9-e0c8bc914742@oss.qualcomm.com>
References: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
In-Reply-To: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789621265; l=1017;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=Y9NxHc+xglkqVwfzuTXqVBNNH9QwhOHaAntxIH8RZsI=;
 b=3U56MsFfuNyaH5fXTSF+gKX7NCUWQjZAG/aLF6qAe2JljJI4XoZVUwImGi0n+tjqEChuaW1XA
 KhWEvhcURLYDHfPTsVvgXfSCm5/9I1hcbsPjq5bFT0MSjCAL/G62b24
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: Ec1ly76bzQuBtn_h2H2DCJY4bYyAkcTF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA2MyBTYWx0ZWRfXzRFRfPSTXbaT
 lufGuKELynCB5aY72Q7nJNqvtwjGtqr28/4RoqBOd8I25obHNVYssdsgjzbeOR+xXyhXrxizur2
 RYcMD343x3Qy0tOGLPa9Oj4qbrDBfYrFcC1/gmYY4TbaQHpiOHx4VMj4XCCL90k4fmTDuE2AFUZ
 cBuc+wFj02lPlfvW95v/lCQru6ZKsPW0AWvyTPmIaDVOek6+yKiYxXp6C2xE4v0hl5s4Vs4xm80
 Pdr1QUD0+iseKfKi8HEFzX4gec+v/RL5cKIBDvRtl09zCeLGu5CtQQEq4YmSlJmZ8zI2qQRr1xV
 JbKITNtlH4AUmUK9bbUfAFQ0FPDYE8NhcgHOkvoMQ5YIefOljohFhlkZH8OLm1/ZXruF+AzdNvv
 PQYeY8DU7S9bRffwMjtpGMaKbVX8BF5QsS0IrHr9ws32Payc5uRLxLfjyiLh1o6b6K56Lps2D8j
 UEpT+IF8n73/HU7yoRw==
X-Proofpoint-GUID: Ec1ly76bzQuBtn_h2H2DCJY4bYyAkcTF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA2MyBTYWx0ZWRfX2DyyVq4ppUL+
 2OP/sXPbQ4T4ejDrYzRarnBOdEaGI8D9dC5nCHVEeDL05+9KepBxSK4cwGdcSZQUr+Tp0XnHySb
 RCIq9MRFDfbNauC74X3sIRZtk7yFwY0=
X-Authority-Analysis: v=2.4 cv=dMUzC+Zb c=1 sm=1 tr=0 ts=6aab745a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=jls_Txh2LmBa37OkJYYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170063

The iris hardware block is described in the glymur SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 4df3ccfee106..df36e3ba9816 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -694,6 +694,16 @@ touchscreen@38 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
+
+	status = "okay";
+
+	video-firmware {
+		iommus = <&apps_smmu 0x19e2 0x0>;
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";

-- 
2.34.1

