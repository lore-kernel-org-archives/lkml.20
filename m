Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A2346A61D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047003; cv=none; b=ubCzZ+r0izsxpkfv+I2/GtUpvBV7fy4BsBpTUmSIsB91LrkcygrLEtvPr02E0VfVGbTq/R+lkybLZAIojvaCbN2PMOiQvPe3apQOlnBWdGHXrcF/JoAYC3m6N3WIKD/s+xgcOzu4ovrJJF9EcZxel9fs5yMijWsvB0IvFrscNgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047003; c=relaxed/simple;
	bh=XV9v5D1+9gPZXEtX1onl5e3mfJusxovOJOelXb/jdw4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hr3jj5GEaptBJ3hEzQQErwjpaesslm6fyjp2tNUSKyDfI9J5l+dViUFgkS3lReRKsgkrCP4W/1ojjZQ2X4AykY2FwE1G7S9RdJLXiIi2M55TQV18SlfB/Uomx4fGuSH1KSRtp9a3V93CsZlgmFu6BzO9hYnb8WNvjdHlUpjpkHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvpjyVb+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d/KZq7/8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvpjyVb+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d/KZq7/8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7esH216172
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:30:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	czflz//vzxCEPoX+dRgQmIOa3mdqZAbZV0BPwSj5Qg0=; b=kvpjyVb+yqMg/jM+
	d3AhA0vPBt/ec0L4NRYMcnp32fZZD1yv9ExQzNlxdUpWX5mBq0cBr9fwIt1lhCU6
	waMif3l/oJo8fHPGTaivSbKDM10BlIAQ9YG6MajFO9XasDhBIAbES7x411qhp+WN
	4+a42f0pj75Wr5m2GEuxIuDFy1ZsgoKWKN+EE7oXQXPKJE/ElQ5a3IMg9lnigvpG
	3cuRgA1s1BDPWMkfItzhWcqseYIWxqyDD7E+33Zwkjd66/5IlEiRv18u6gUf2b5U
	3RB7hK0puWUKMGeoXflD74Pal1G6n0a0tkGvXcqxtfnTwDkyNMb1Z+DEr6Jms01y
	Yp57ng==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrdn99qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:30:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398d292eac1so14332030a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047000; x=1789651800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=czflz//vzxCEPoX+dRgQmIOa3mdqZAbZV0BPwSj5Qg0=;
        b=d/KZq7/8RnRxymygA+qfQyfYKc6KoiLjHioSrd9a1O1ZYgtCPlj2apj6HTkKUH4dkF
         5A+I6DanD2XLj3kNQSLgb0n5z+QLqqrd/TFlgYelkQu63J5UAvFg6LK15bC3t74jjWbT
         5Fvma2B0wwCzSqhLGM/VGm7sfLVHjIvMPAtcaKrk47dTI275mEbaemvoK8Imw2/hKivf
         mb3lkJxnCHvBY0pj7zyWlFt2iK10fOYdIuzyNjdV3ZjpJh7EpgWHdXxABRBMS7ubMnmT
         WPWh4VAG5WCsJynl2LIIBQPddoYVoseYvQa5ekpT1D0VynwXVDyPnfX4Z26mIvaYPOoM
         k8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047000; x=1789651800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=czflz//vzxCEPoX+dRgQmIOa3mdqZAbZV0BPwSj5Qg0=;
        b=HKz/mg2yBMK2RbFplTxVu+ZT0L61fcBfPNDfZTAu2iUThjPEW11A+FLtUbtcV5UCB7
         VSFEJ/5m22ZpLTg0pN4d66h2uC0MloayumHB83oKnhcZMQdrAvwa58duTLK8cXHTExOk
         PeMLhGX0m8LI+RRfm0ldok0IDSZVaJahem7Gfog0H7RwjResXy/hdpfEu6u6KJp+HG8T
         iTZDcCb6v709lpaV+KvDf6dUJ4G8nyzRghpOA0YuTEaQkH2lYB2SseFakWYxNY8I1Uvp
         js0OltMwZg1BaDHADk5uJ18/Fp8xnrPGr9lzESOpaMxfiT/P7/sCxN/NNnqD/dLF7Ktc
         dwJA==
X-Forwarded-Encrypted: i=1; AKwUvBxvSvNSAyES13sSCHZasJRCarJX7WTX9NdVVe4D4VbYJUJX2OweExOuJPYh6Yvc+RpcBluuAqsNRLq4Mr4=@vger.kernel.org
X-Gm-Message-State: AFuF++lVV/AAGWUShxTbeeMXRAQo8VeLNNII2SNUhK+CtK87vor2Q44F
	m29YUn2UFqV9ntNKk5JvrZ4WibsvSwl430Nvy9Dn4+/1huNuG9ftLCng79A7tiZQW2a+Kkj9Z2R
	xRdaO/JgzLCjVFzOkAVYKM3ZBIT2D0QACrcboA95QXda1WyjBebhS22eJ00N55IKvr1U=
X-Gm-Gg: AYBFou1W/f5E1uu1Nabh48UY7wmTZlbj65hsL4slPEkCoEmkgeAPJzB+snJydYzKsiG
	QtdgahJimxT+R8X6vyiHyDRb5woJ+BrS6CcWDjPKzlCvWhJ9h/11xEONnXNYSkTh/2SAjlY13Bc
	jUUpSS0xZb+y3W6cvoCNNcGPIV3NjL0jAlZLioFP5rWdU4LywKU5YSHvdstp26ACOWxeLFPBjoy
	axwQrci80tkujVXq6GudDVfqfblg4rpJ4EFFIrM/W4rtZdES1AVE6Xp9x3ab4lEehKIpmPZp1/r
	cXuxk7wK0b5bGhVH0X/6tSYVmCt0Zu7NIF1ubrTb6YH1lNens22MFV3RYUR53yTQvAUq4lp3tOU
	CBi8Z7xyA3Ehi5zGBrDhy0co9WxBGPbGJplc=
X-Received: by 2002:a17:90b:3a0f:b0:398:de23:9af6 with SMTP id 98e67ed59e1d1-39bac34a3c3mr18658634a91.15.1789047000404;
        Thu, 10 Sep 2026 06:30:00 -0700 (PDT)
X-Received: by 2002:a17:90b:3a0f:b0:398:de23:9af6 with SMTP id 98e67ed59e1d1-39bac34a3c3mr18658548a91.15.1789046999851;
        Thu, 10 Sep 2026 06:29:59 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:29:59 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:01 +0530
Subject: [PATCH 12/34] arm64: dts: qcom: sm8750: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-12-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=919;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=XV9v5D1+9gPZXEtX1onl5e3mfJusxovOJOelXb/jdw4=;
 b=eXhKCedKJ3+kNvAG8XJp+DhjHFdafqrmCCxM9JHXteBu354oHjoxJ7jZyBhOQZETE11mWknUK
 ii64/qCbBwTDDH9uUUzfiPB2nvVUWL5tb+lKhNzYvFburDDM6TnRaox
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX+prKzwe1Hc1P
 cDNQfKlZ76a+1cpK3lxsdLcRf/DfqFUlfdxKoRvlX8HHPPdWpwDKe2tJNqPDQOYWsIwZd2BtKw3
 zWI5ToIIIWVyLfweQ0q44m4M8nYaDJULnMmhOciXEJ3E6ux/dqyebrs73F2Giw56YyRMBZ2niLu
 8QlsJ3pDxO/T0ie26Co1md3HMkZrCDh/8LZsev4otdDIfJRN/NXETVNNPFzduYx5QNEhRttzr80
 Hk4N4HFdZUyO3GuaaDMcSJsROMckzCUUrn1ircBzuCoo8SthdFmA/hfanT9HOhPRYGKTABnGV1c
 ckLWqB7sG7xkWIYO8jHYr32SEARgjk4v0IPFYaMsmetT6ApOQbDOQtaTnI9/PKkQ7hGPtn+My2V
 V80fNVwhl0sfp06t9vaY6s5prmBnW2tnc8INSH7Anvv0IxjvVxS6CxsnsshP6TL7Dh9qPEYJgQN
 TFPe9Jp7sNj1GMH8XlA==
X-Proofpoint-GUID: Cm71asVwh-enJ3Gu4vVRA7ez-rvjFlGa
X-Proofpoint-ORIG-GUID: Cm71asVwh-enJ3Gu4vVRA7ez-rvjFlGa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfXyCXRg0PSS78Q
 J9+hOYYABdNISZuZfaEHvhLap5+Aq4rzyEevCxEf5m3m6OYZU+TLTAo4azZ96bxOHWprmJdePQU
 fS4/uMq0zZZpE/ghTQ8XhHKw8DaRtC8=
X-Authority-Analysis: v=2.4 cv=eOmGH3p1 c=1 sm=1 tr=0 ts=6aa2b0d9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 9b5fbc004df4..23476fbd993c 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -1119,7 +1119,7 @@ &pcie0_phy {
 };
 
 &pcieport0 {
-	wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
 	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 
 	wifi@0 {

-- 
2.34.1

