Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341301;
	b=X1BjbPN91jFzIsT3eUEbfjCGZ1rkqgLjw8MqNoupUk/l4u7oomRGkty77p4rUuGQBd7k
	 p8miUf4FL3l/1J1OnHufC5lHChbbmgbEJN8oGit1pEEMFJFJTNKSK06/mPtDNrzDJd/jH
	 sSzFq6UoVBH+xtoHtpGj4rNfhre0/+a82qCpweByWK89/Kz2pOEiN6e4ow/i03fUyUAip
	 spMpRjEAUvDGgkWbmSlBWdhHa//IaTdwSlp4J4Ni0+8BcXlDOh/NjjQBZJbQvRVbayyL9
	 pkzMZcjNvsnh/Zy0TkRLoQf3QUHp7PWIdFiUu9NmtGAahUOEprKCBzYn8eDEIsl8i7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341301;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
	b=riqsk+wEKs07dbkxXZISRAMyi6RzlePOEWJpPXh4yMXG4lEOi7b6Eo2upb6dDlACyGiw
	 ZySnEQXJ/UlV7OQtsA7ljLlaqEqy8+tSnKO+ObVHuXmU61a81Pp1AUo5/i/62x0C9bVus
	 OREE9e8o6H+XPebHWPZJBK19IoUbpd7pAxrP7LBDS+ZypZFCByKoNtTo4HBhgI6G4l9xV
	 EGG0PHIoO2J7nb8AUo5KfKjhjvqpzONZk/HdiZ54yYg7VorWWG/ox72WC9XfE+XoaHfl8
	 splPPT+n9wX3wpVDiz0v+/4S7oMFa54uIiDWFIJMjJRLGsQFL1B1B278VSgbiog9NVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kJx0+RIW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=huTKyoB8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E7F606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74E7F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kJx0+RIW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=huTKyoB8
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F7tI725306
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=; b=kJx0+RIWGjQOEL03
	Toy7PVs0f6x1xYEJwZ0EOGsCH6CNwd/JJcloH5e4EymGLPNKGU74VQ66qQaBVOEA
	Kh7i51CHb5lHJJ2qJmnu452UFF4nWRcS97Yx0KaLus/PQJKuvd23lfU+B0NeDnhM
	U9mqUEFpPoVd3vFtHdaGMFM36EqFH+PGfRzFNRRVDO3hjf67HVz7vk31HEpxkg8U
	ajWEw9+rwevQvbbAOVeoAdR0/4HhRhFB55jGHFQVBkoV37vrMXDJm+CNdRk9Xx6H
	YKIgLbDwhpdigevG/ve9r5GKXj9XO0zfsgF1uwBzQ3T/3H61sfEW38PqAKFfX5TB
	CUsMdw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6phg7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:21:40 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a0865e4282so122540b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341300; x=1793946100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
        b=huTKyoB8SVjD2mVruikgIcnUiWxLX1ANhwSsWsJHzxZxei/AnLTSlrGNHn2PrY439M
         taOzCFJVltVipile48n+44oWCnFAEJJEAF8jfMKpqr6jSh5W4lpN4cDe7klYpH/4IP9o
         snPK8aXAing/zQeTj197DQagKJksMACjfkg81kK0ViD9+3m7x0pCxZw4IJl8nL7lQCmM
         BoqfB2d0qVzjAKyUcg2bVu9xDWwb8ZlESPpzLWjIyvP1MAQYK8mzn1S3enzlksddV/lk
         AaK0v5xZnhwG58lwGrPcIbkptRtx2yyge4TvkbZKJTTkOdbHXzUzIPZ3b8N5GIRSDc8e
         /lcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341300; x=1793946100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
        b=pYM3u9RycfEXeei/ezWCChmCmoaSWrENwKTZZyrIo8bBhRr5ilOnBbC58z4tt0neqP
         ndIthnuBZAMX1QrzutsRhI9Uz8CJ1+VxsJ1S1uZb6hf9TPVpVcJQg578W1PYrg9Pg1ZZ
         S8VWDbVWoGKCjH2R7SjtXxM6qwRVjPJGn9w9KZcSewfobrW59OkdI6Hp7x9w5clgQOuO
         EiIZBqJejVOEd8ylFuaiHM+wuwc85AiPi1cghDCfXKxigYLhjEjipsGm5kxUeWZGozy1
         6a0bz7eYq3dQ4q4Mic+xdxkj3Z4ciC+0bvCBJUpy/Tib5ZyRiJw3yEO2sXnlmR5EzvSB
         Xv9g==
X-Forwarded-Encrypted: i=1; AKwUvBwnmL007dmM2wOfe1eNUrg10oi8WRo+g913e5VXSfDJnwSDFNNE5bACtJ4Gg5rweVF7SOwCQEWcdFrxtAI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkhExN6fUU6I6o+3pRAWl/sMdLhaUAPQNZYuoFnDo8zBO3+BZQ
	2c5X8z84cjLlhO6N96jHCq0qv9AS6f/PAOGzpPhq9JNGoX9AZhuo/oGPSirx6dSnV32ROzay0PA
	+FRdeiD/mjqjgS7te76TWbaJrPYj+de5zOP82kHHE3izVdAI3tzlqWm0+0qYHcePf34Q=
X-Gm-Gg: AYBFou1GZDv7ZcRaRy4YQPTy+6QE8lPLdkYuV89VXwFlBNMYJ2jG2Vo2HNfP4hZ/KbN
	LeL77IYB7ZYLjHau+XtZ++2WVpmUENqG5Z9nXINInowS9mIPINDlvwqh6PdSyUL+mKDaikYmANM
	KTVgr6sd5cMSohAvSGWZ8yWXvJU0MY2urOtBEQ0wR8lJL37LTHjo7PuZgKkY/3wDq7TFLbFT8Pv
	H1a63B8UwX7IUwXMLgBnO+SOTcpqstzyoPoqeVdN/lpCV3t9LcPZyvzaBGzn1rb8wcU7nHMHhDk
	BFF8hQFCBxKYgYILhMmwEGj9R0K9HFTSAbrP152CqTCKSjvWl9JAXwX3suiKNFyjNHpkH0Jr57f
	yRDN1CxglwgQscdAaKoJ9bDX7ayC/jd+YzaQZVtCo2vMgaNg/oFIXAfRq9iVnOkJRS+k=
X-Received: by 2002:a05:6a00:3e25:b0:892:a4c0:4eb1 with SMTP id d2e1a72fcca58-8a9bcff6a77mr1209648b3a.18.1793341300158;
        Thu, 29 Oct 2026 23:21:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e25:b0:892:a4c0:4eb1 with SMTP id d2e1a72fcca58-8a9bcff6a77mr1209631b3a.18.1793341299712;
        Thu, 29 Oct 2026 23:21:39 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9ef08b936sm351163b3a.13.2026.10.29.23.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:21:39 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:50:54 +0530
Subject: [PATCH v3 6/7] dt-bindings: mfd: pm8008: Make interrupts optional
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
Message-Id: <20261030-pm8010_i2c_support-v3-6-995ed1ec7a72@oss.qualcomm.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
In-Reply-To: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793341260; l=1342;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=G5Qx+ovkui52zHAz78X3034pPz4pJoesn9ej2vCUqhA=;
 b=PZBL5PDBWrGF8v9vICz/rjOoHgZ6Sr5icUeqXHTWjYxJzByPsFzF6/rbxm9JMZk3v1bAT2wHn
 04OGor/UivlA3u5yQsBIIFIFv0xG6jW6KR8tYwNSq46Kl3TXiRZrUze
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX2B/JTw1mi9ji
 xDqQavPd0cW0V5XBpuD9s8HE0dM0Z2hDRaZmioG3a9XGJA8B+tU4QX5mizfBM+SNnwfDsr0F1Tj
 Pj/KsjaLTY6nEv66E47PKOk3Ax3JNw4G7YsZ+iXtlDXqt85fGvh1OSgas1fNeYljCKBpCn/Mi5q
 DXRMWX6rVdWrmI4knhyqxy/QMj1mImpqitXU1igzXh1XiHzjAA6tSI6ftv0lAIDp009RSAJfsk/
 9ZEKj8JSz3BJwNK1eCNIVYyR3z5YoSRtfpQBTmWieyCTpOLdpeHT7Ghc7pgJJZZLqrA5DwBHlRg
 kQF79bQjTp2AZe2Ck70Bsc5uKHOhYW97KnD/h4tWUIRd+Bp4O/O/YivYRnGT4yn6bB9rm5c+Q7j
 efsrNJYamiLufuFzvZCpGghkoVMUTsnmcPfhGKOcWAIzgJUeXriZM6h+vX3fyFZxhsopX9XwSY1
 p5B0iLAfG5UvwZvDbUQ==
X-Proofpoint-ORIG-GUID: vgb1jkmt_N14rXOWwuAO07z16nKalfqo
X-Proofpoint-GUID: vgb1jkmt_N14rXOWwuAO07z16nKalfqo
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae43774 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Su-V-MYFMjrvs2extU4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX7Xhgt8gcGeBC
 kDb/xQhJK/9h/WWk99whDTalvETAA+b7/+o+oO5L8r7aVjdj4TV9+bFVCg6pL05WrKCJQe7ExiL
 nde7iIBrF0PRaryU8PKUWS4PQSIkwP0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300025

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Some designs integrate the PMIC with the interrupt pin left
unconnected, deliberately. That of course compromises some
functionality, but the core function of programming the voltage
regulators remains there.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 2701aa755f31..3c0febc8152b 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -90,7 +90,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
   - vdd-l1-l2-supply
   - vdd-l3-l4-supply
   - vdd-l5-supply
@@ -99,10 +98,11 @@ required:
   - gpio-controller
   - "#gpio-cells"
   - gpio-ranges
-  - interrupt-controller
-  - "#interrupt-cells"
   - "#thermal-sensor-cells"
 
+dependencies:
+  interrupt-controller: [ interrupts, "#interrupt-cells" ]
+
 additionalProperties: false
 
 examples:

-- 
2.43.0

