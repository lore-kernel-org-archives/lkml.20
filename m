Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259BF48EC98
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046969; cv=none; b=tPByaGyJaEmGOKzZnSaEPh1jhh79WloDATKKi9YmyiDh95ckyYknwINFY+4PKWLCvFabDr8tTFXGmJYIPM2GFEghRLLcdeehuhGlNLyZPHRLRanD/nN+YtnQM7XTcLW0t1ETH2HYIcy+GSNekQSi8xy7R1bh+0s70kHvwd+vUSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046969; c=relaxed/simple;
	bh=gQZNieaeVgO3r96DHqxzosd4XX0UGWuir/0zzaJ4Df4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FrG4GuP7NolI36pxqXSeFFB6PhazGYGhVa166asKQHkfM+EC3lxGx5Kt1PZUETUQIws6LOVGvrM6DMHeh18V/J/3P67PZRiul4ngqbDqT+S/H8c6B7DxBKrg9HiI6kUq0wab7Kcqc4FZTeKJ7yNZ8J0824/BKjABcN+DZr6TPnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hTrXKFJ+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CFl9bfW6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hTrXKFJ+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CFl9bfW6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7kY7918799
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vYwhVPkhN/gCB5I2y6PX8eEYBtJFnucmnh+9TbuBmG8=; b=hTrXKFJ+UqnQ+F07
	BscKjQTqrSIDbkEF++cMJ57reszx5WYgKzTfbsPEqNfemBqvCEakF9IYURgzLIau
	7/Uv4odKI/w02cdObwUeZXC93wruCD+JYFmfTaULwhQSiJLhL5fNcN7wpNNd72Zx
	AQdQUQRctTaYN/aDeuJxOp3QGRsZgcdrvQDkyNVHrCTtdMDPA3HFx33FXDMmkwYC
	Pfn4l9zY8kQK2DjpHDr/cRQd/oorFo1/Hr41wmk6zDvxpyaJrf7u1i03YN85IjT4
	4aRIK4Tt8MFkDguE7xK74nboS75UtIoAXGPG/odCson/vvrhCvYZdrPPsMWcDzKQ
	Iq/sKQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygv1k3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:29:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so8834415a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789046966; x=1789651766; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vYwhVPkhN/gCB5I2y6PX8eEYBtJFnucmnh+9TbuBmG8=;
        b=CFl9bfW61EqqdYngx0828KJ809C06jSeNxoLEcJ0S7/HifLGKHaUSOc2SkkExU/yAi
         BJEdRC2y49e9jIJJFnJ4QrZu6MqMwtl3PZ8ZYxnRxCGwYwdbLGVOCIUNQx0VBjryU67j
         AYpatkAsXrRIF1dUhpFKgj+WnmBoRhNI68sJ4qvolLjQN/CPHKB/q1vwIwf+sr9csZXb
         tThowAeMKM9hM9jYdEj+ieYwIWRcpRPdW3cpQRn72uf4mrnIZJ6cNhRnWYNIXHUAjN3b
         R1/pejro2zGfNIL0sEH+4Nc8TeVEt109W+6v/wfXQtymYn5axBV4D5LqM2Mm3Qvz67qt
         UO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046966; x=1789651766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vYwhVPkhN/gCB5I2y6PX8eEYBtJFnucmnh+9TbuBmG8=;
        b=srxiPU9l+/7aIls7yH8G4yBOBIBYbCYIEk69gzYoMrzMLvosvH7fTPOj/ouyPRRvpJ
         v2XKwsiKBMFlMFiIcdcdTJrGsi9GWUsP91eRJn7dYsV7HSOMHEE3Ztw268MI6E+C6LbC
         Mn+V7UUYd5ETbm7ysiBu2qAbV0hgFW4mFQ76TUM9C1xwJWNGjvTVRBh+9dKHclaROCDK
         E8nkouD3HB2UC+wZKr/TazRJoLglWKxNzXvq972o8jYR5lRMoF1Y2Egc05xZ/dwvqUhh
         fKsQlIoKI0Sg/DaCj5oawx0mrnidyI+dCwJpCzhp41IoW+xte0PoEtdCO/RsHMQqAxt6
         SowA==
X-Forwarded-Encrypted: i=1; AKwUvByhFx0ZhwUdO715zRrnpcVU89WvPU693VaR/iCmDq8yBW9lTL76t8kbn16Z1KixFO6iURNR/yfFt3n1YKg=@vger.kernel.org
X-Gm-Message-State: AFuF++lDPS6RnTaSZIQU2K2yd1ck8AxAgOcHuNYzigsTDF8JkjctSt8z
	UGsEZq8ehFzv1DyOyiahdQnGeNAX+CroCOWTDOpRhSOPcou85/HlkGYRPjts2dOLxJCDTLatq7V
	TNHAqc1GbnQNeLRlYbxYrYbNNmKiKTfKJBtMUv7KmG8hnpXjLgWxZRYpHm0YdBYq9kXg=
X-Gm-Gg: AYBFou2XO2d52cllNQJs+D3bdA4z2k2A016+9UwSQO4yGtglfBOOrqtsakC5voi6TR8
	0KmHOJpc/rHLeHk7jW18Cq0mZ0ehRJsKyqHC5E8ctSRik1efSYoBGo3g8CYOfdtHMYDlUsqz+Sb
	pThFAz/V/w/QpPd+efaq7ZKo0RlsxngoC4ZY8xqW5UPhlVfZxwDxgZ2DSRT+FjB0q4u2/49xLXm
	epp6iM1Msa8Q18766tZD1bIyDTrALYvf38lw/Wg1YbWpDhauhScbj5GdsB+a5BQFE++i+3rOf92
	+HvDxTuI+3Onjvslzy9YU8U+LE69fJW5V+3tfo/QhV+T9Sp+mSdBIp6IR//Aw6dTs79IsXMOX0M
	iTwVW64rxqMzK8CBVfq/NMtuDx6i+Vg6r4mo=
X-Received: by 2002:a17:90b:39a7:b0:398:9bd1:3211 with SMTP id 98e67ed59e1d1-39b262ab182mr59649131a91.18.1789046966536;
        Thu, 10 Sep 2026 06:29:26 -0700 (PDT)
X-Received: by 2002:a17:90b:39a7:b0:398:9bd1:3211 with SMTP id 98e67ed59e1d1-39b262ab182mr59649058a91.18.1789046965999;
        Thu, 10 Sep 2026 06:29:25 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:29:25 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:58:53 +0530
Subject: [PATCH 04/34] arm64: dts: qcom: sc8180x: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-4-90a252ddbbfa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=1599;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=gQZNieaeVgO3r96DHqxzosd4XX0UGWuir/0zzaJ4Df4=;
 b=AmsbPYu+6kJVO3uHmK4dYGfOXYNWc9LtdIMyQTfDXH+S0zYXtWGwLmZS7Mze5ZW3qi5/rzqd5
 j3MGYTCYIpQDtTKuMb4h44cCq1Q/rQl+VIenTE1ZvN/v/GKQcYKXMd3
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfXxkIBXgKT7LZ6
 HvXidru9CRSGWQgRI5euwfkFkBe94gF7XcEl8vQCW4pOHZZegHJ6ps58YAqhupBaqjQPIEW8xGm
 5fQWtcA7XgpJbyS7kB6+dpuO1fQ6k3Trer5VQ6t5W14rU3IB1capqFjSILRtXJRARsQy0ziAVCk
 kp+7pi/bhQjWa4W5D9fHtI4xqK0YBzsrX1QPkU1nF/y6doWfhIIBCZRnc0DJBTZyu+6F6FOOmQB
 cVxUrEjS2sDtdQoxQNKbzniuOD8Cu+Y58SyZ8V280DAczQRrYrJMjkODlEgBuY4YzOHa1ici98J
 Dz+hWH8ZT9haK4HFcta6sCrCpMpptFouXhSyNFLHXk3o2VrB+9SY+lu72iV2GfxzqfK4l593m8a
 XmD8tPkgnXeHtAiyef7gexc8WbeeMiP+ZVYYDyDFl2KDUHnwvhR2uQ5JPHxUwnuJVvF30nUJ7gg
 yqStz1d4BL7c/1MZFEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfXz7fw/zpW5g9D
 K217U1EC3aHhHmYSlow21r7mmEypVrI2FgM/4fBFinwTvyYB5kKhbOlG8R8nKF4D81Xc2IQKM4i
 deJYdgdXsDkGlYNyhH7v0CPAao/SO0Q=
X-Proofpoint-ORIG-GUID: 2aascxUu5wDpIXKsVl8m2EZZcSd5usMY
X-Authority-Analysis: v=2.4 cv=VONIDNPX c=1 sm=1 tr=0 ts=6aa2b0b7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 2aascxUu5wDpIXKsVl8m2EZZcSd5usMY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 2 +-
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index 565e5a9979b1..e6ab523d249e 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -492,7 +492,7 @@ &mdss_edp_out {
 
 &pcie3 {
 	perst-gpios = <&tlmm 178 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 180 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 180 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&pcie3_default_state>;
 	pinctrl-names = "default";
 
diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
index c10a936b320a..327dba55a5ec 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
@@ -593,7 +593,7 @@ &mdss_edp_out {
 
 &pcie1 {
 	perst-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 177 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 177 GPIO_ACTIVE_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_default_state>;
 

-- 
2.34.1

