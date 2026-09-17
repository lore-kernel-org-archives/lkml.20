Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8253C4E433E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646145; cv=none; b=Q/tRg8Cajvr02eP5oj30KMT1mO/E08CAkyf5Ok7bn1N+620XIzImDzlee0Kl7PxCizgmuf7x2vRIVQ2uT6ZzxwcqidEv2kupXfB8coKzVcyHGNtsNQ++o2tTusQUowSQw53C9Z/PruPdq+RaVfVPS5rmX6SbbV/ei/rm5pT1UTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646145; c=relaxed/simple;
	bh=uoqGI1WptHrepXVSIIuRLOq7OS6th1g8ClbShWQlQfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M3Ypqp+XMTRFbh4/nyG361AfL0wxYWb/sFjRmF9zQdIe5al2tSsGS6aUYsFz1ROpH0Xxo2rJoYdk2I1Ghz+nC+NPMYk1atsZ+TQeuGw7iCQFsuIGq571HI+QuWTwD5K/b4zIrFaGN5ngBeMrWID5gJxJzxyR5zyEYqy3w0I/TOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/rTJuDM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hYaBgLrz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/rTJuDM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hYaBgLrz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZhOw1257991
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zl06XGlHWXbOrepBWGyrLvVbH3TA2HnalsrFelwDy2s=; b=b/rTJuDMM+UiJqwI
	CFyY+8A553OuwdKFfX3FoXkw8Uc8sQj2UhNzdakHMlMVeF8QR4A0JMYG3IDQ6F72
	gn38nMm/U6CtSLrObYVt/YnakdZ2b6gpIutF5957vUJQR798IC6iFiyrr9nxLsHc
	zQdc4dm5HwyzULubWVELEwPmbv75argAqZoQ2yvsMPnn6JDgLaafhWJou0aSHq9h
	gJqXx0rdSKlcocenFMbCd1rmVa3E5974P7RBORlkxc/YRSsgjgjnNzUQrwKB47u2
	HFscYIJGVZczb5X6kEUIRAJVa8tPh61qGQH7bwAZFk1YRzrYlRc3mw+SAXQTCWOM
	DYmb2Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdftgkq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:55:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d959904658so15426575ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646128; x=1790250928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zl06XGlHWXbOrepBWGyrLvVbH3TA2HnalsrFelwDy2s=;
        b=hYaBgLrzAh9trrKyu4zux+Ugwl2bfgpcGjpFKra2ph3VsryYX+qcO327LvQVz7irNU
         vDGwMEKCicQVl7LGPgpFl/4yNXCLziusMFnkerwZZHAufGB47SMpJ7358FdI0gFBQpLJ
         1sRLOgUcKL7o8flbB6njXFAvkZaUJNTbVqcbGjoB81Jt2zuLSZVivi1Nytlzdy7soTRr
         d3EX2z/BQrYuGw49GdNiBdxqb99oujRxriGC6td+Cme5PhcY9vvkfM+MTYnnB7RxVgZo
         j+eqvSCGpkZzMSFk1bz4R8ajUQPoL7aC2jYZwhTYBjhPdvcCEGEvh6pUVA4zLvlYJKRK
         py5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646128; x=1790250928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zl06XGlHWXbOrepBWGyrLvVbH3TA2HnalsrFelwDy2s=;
        b=MjqgYZkdu5ycP/9WyuRGyiMLxx0mv9fe5zGd58tIBUUGV6sOQVMky51pKqMf4kPgYs
         ZlbDni+7Hf+sv8UpXg4HQBQfjhMNiCcjrc/lq4FGzWGLncEo+A7nBTtt26YimAYgFypy
         AmifHmQ0Nq/B9be1uLm48d3OHAFvLLvRa2dUc54bcg2mx3d+qQ02d08hKnw2+U7qBX8z
         is/zlQcC+tDSXUDf7mT4Eecid8ohfluQnqYT2KiWrceqcDl0RwjSZm4I4VbKaQrNvC/Y
         53QuQXaeEoQqL7ZBh2/ST2XJo+NZ7tbQdY9iOlq/JyFEQ37ChVxw7rkx7w7CjLbcUAxj
         0x3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzd0PdINfMHZtv60Amg8O/fgYbPUE7K7ET737RCt6ZDy1UfgQpQRB7GL/JQJ0K0qIkVR5uogu/aigMRgvY=@vger.kernel.org
X-Gm-Message-State: AFuF++k0xr8w5Odfn8oB9h579RBcP3nDeMdlO8rSkw7ogfNW2UYHaTje
	j2NVTxEjfEVh4djBaTDwewUpgLb/JnXUQSz6USed7ZxIotQ913N1gWW9fDZLTPEiJ+skyKQT0NZ
	FVmRCOPM9DxaHmzUZeFYZbOPkxOmpnToWLgbEgvZq7goYMEow9gq7h4T5i8EDmmQSoes=
X-Gm-Gg: AYBFou23kyR1+In6FwQY005GLE42nEkZeRqmCvyyrmuQrcePxierepEepYNzGY8OIZD
	GvMJ68smS3o38pG65W56rrlnV4f6WdtyR/fblKTwnUkRtLS5bEqUYYVipOjf7Yb8nU21kdhhHEj
	fls/wXxdIQxrk/FoMpP1Zh4H2FN9BhiXcS1utJRc5UF2Xm6GlqZ+QkE9FRuq4OefHEwH8xHZ6Nv
	gZFQxtelEXkWtOutqqbq3aD/mr4adr4hJEjkUaMS6HYVJFp3ZLkk6BfwObLFRTIwStFE9BUm50H
	XHjI2FOIuNFHplcjIugeY/RbKVPpPj6oYYYhIwksQMgVcPsG5HNH4tUWYj8QPhlH3OQlcRhIPQ2
	WGeIKBs4WPqJHGEBUOJNbYZykfjZjO3Qi9w==
X-Received: by 2002:a17:90b:4fcf:b0:39d:ecc8:73b1 with SMTP id 98e67ed59e1d1-39e1e2bd30emr23221732a91.7.1789646128058;
        Thu, 17 Sep 2026 04:55:28 -0700 (PDT)
X-Received: by 2002:a17:90b:4fcf:b0:39d:ecc8:73b1 with SMTP id 98e67ed59e1d1-39e1e2bd30emr23221645a91.7.1789646127637;
        Thu, 17 Sep 2026 04:55:27 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:55:27 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:21 +0530
Subject: [PATCH v2 13/18] arm64: dts: qcom: sar2130p: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-13-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=993;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=uoqGI1WptHrepXVSIIuRLOq7OS6th1g8ClbShWQlQfE=;
 b=WKw7Q2R92p4UHGpmpsOQc6jvIMB8BgRUEukUCyHZk+H6xTR/MI/tBu3Epgye7aDjO91Bbo7F6
 799B3LWspbqAgvtIvV3r1KqWtTgPxmuYBZy5dzp7uNsADhu6ov8F5OB
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfXye7yQuYDPSFI
 rMzviU88SF617quVh2MrBmgEBtCjiIaaVbImL9GczxkqxOG196zYZfO+rb06ziLnlm8DTxR7Xgz
 X4q+LMuKFnWZjxjpzN+Lh4Sd4wXRe6ZK2JKlXR3W6yq4qPmMDtqIrTx0QhhIaiFNyZvh8wLvPO9
 w1RK+Vni++isEBfLJRmAWZ5Y4rTTFCBOnSTDIHWoUsRihOfnpiPohMKtfi4gOByZ463Kc+6s/6e
 ke8E9USKJbTLsr/GELZh2Pyj3/L+JX6an1IoxXt6kzL5LpAj4lVFj04rXHaHPpozCdIRCJqPJl1
 3+pnvfIv6HobCe1fYbXi8SQqF7eGIgbUuiN/d9HxnwtxQsUH4pN+dQbcuDnKF+zkIqfepYqSXXD
 MPfc1DRt5o8gXpdxv/5lAKOax29Crh8XoPpfDFfRvGAfJOaR4lXflDg6XnQA7q9DWCHxSm1NP8b
 LxPqVFiGdLDa6XhrlbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX2kGIO2CcxQlV
 UJczNG3ec28Z/S6SfAb3u27AEaUMeKyO//tQ7U2XN58QuPyOU/+upMrwNkIyorAqtQT+yLD6+9h
 qKdbqI63RaoG4FRn2C5KqjmAjIqZ91g=
X-Proofpoint-GUID: zKFVGQumvA2thwgnZ6sbYVxXIBlZtd1O
X-Proofpoint-ORIG-GUID: zKFVGQumvA2thwgnZ6sbYVxXIBlZtd1O
X-Authority-Analysis: v=2.4 cv=K+W3jCWI c=1 sm=1 tr=0 ts=6aabd531 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
index 80428c0b3b4e..7469134f42b7 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
+++ b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
@@ -358,7 +358,7 @@ &i2c10 {
 
 &pcie0 {
 	perst-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 57 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";

-- 
2.34.1

