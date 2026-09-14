Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CE3336886
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369199; cv=none; b=R+rrRfb4n26ogzdudlWIs7wGSs5LdO/wpPggB26Lan6UEWqWZqGCIf6esiKlGNpSP8fP7dcdxh8H4CjYftUdt/p6JmlCEV8WXw4AGYuYIPBcL3A3Qukou36sUFQ6DtxtgDieNki3KHpZ/wTWN6c1A7LRz3tKqO1Hb4U2cDbYGLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369199; c=relaxed/simple;
	bh=KH7fLQLnaYk9POe7G01GMZGFE+VNkF+R/gf20gYjH/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J1M0G1tcWdAiXfhK5tFNGb4OMaEIOaEm5+1ozI8wwVboRrhZopzw90PoxcN7R5MlOzwIoBO9EEEbGaRvFecJc83eaj85SpGVabwuFZbPcddnfCFz0WNAkNIS1UbYvKFTlkpu2GYVZ0GJVEvFEbTBLM1YNrfhZqGoNzHKM46mWAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QPve2lnr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LtdS0ozS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QPve2lnr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LtdS0ozS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jSiK237672
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZRa4lpAPGCwrNzuLt+g/NMiLExtdLmGO60y2MeBvu5Y=; b=QPve2lnrRVCaHuq1
	khi4lm1DE+2HxzQw2khHGnrnS927p5BCSPFqt+ZUbhA9NDhpw+fS4AgC8AMHZT1X
	0Ji9PYA/SO4BjipfCTCAgZc69g3YfGMSAsavShHlbP7WZRslBVj0IPume7xf0sV0
	FcclOWT/0YwqX7e8bUjduYAy20g0uotDO0gA6e57iHn2VSzNt4N1Ohz0oD+Aeeqp
	E9vWKPqBxSDzmbIZStSKtw1HczH2K6xakghT3BtVh0cJfhzLoz/vOKJliSrBnEls
	KqHa5NsUbCeqOw+ba7UisKj1y7T6NGwTgNCvSuOaiZ3SfgiLitv1k2M7DiPWll/w
	Oxa+Wg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dneh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:59:57 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1b8088203so2906417a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369196; x=1789973996; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZRa4lpAPGCwrNzuLt+g/NMiLExtdLmGO60y2MeBvu5Y=;
        b=LtdS0ozSdnDmgxsFnK6iq/HtNPEQ67KxqwgZkZz6UcdoM9Cuyl6xXqMp4FGmdLFSa4
         szO7ocFTwbjYjwmEtwK7Y2l+sBVujmt7pvg4N8V2D4yHZCM/yd2PbTU6RRjO4IeyryNR
         VAELPNcX1Hq0plm8rZ4PkYVKwhgrZqYZbGRf2CYcu/PqLjmTCid7FG2iGUOlSIaTdPM/
         ErQKVZMdv5ma+x+GkUDl55p+icMvbwQLSoLzAIiqAeJqHMp6bQiaz4XGGnHjsH9qufmB
         XuSkg+MGqQJ3BpBhmwPCWlPidIW8b8AmjkIDlLoYQQIrfyzeN/3y8SKwP87lWVYeGk9z
         Nhzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369196; x=1789973996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZRa4lpAPGCwrNzuLt+g/NMiLExtdLmGO60y2MeBvu5Y=;
        b=n6RSuwmTuK0MIR9F0s5wJfpQmyhFKiPkgwqnKLR0ZLx8rEIx75ygrlBM02gtJxRnyh
         Lmv6lm75OiT4T6tVCkpPndiZhjVrwJGe8yExwqpFTqwPpsT1vQ0WlWzkQJBVAtxKfC1C
         niThiwUthhKvLvzgE+EsDnhORdEXUo6vzS8YtQ1OcYcrMRXnKBrqV9rKXP0fPkfqjxph
         /8q7x1Sz1S8x2ytXtf0RYJgC3vcAupV4H9aEzg4t9CSEPdJRS5KYyhPRwgS1wPoOoge3
         PO66EKyzJZTO8CGKySB8HsfVCt//IA0bAlZFvYjLUwgEC5GPEnB5T4F6tHz1ySXED1dO
         n9xg==
X-Forwarded-Encrypted: i=1; AKwUvByhhi3KhgsJhb6d2ropY7fog3q6MIePqwVZeWcfB6h4EX4OwfgDoXK/RAhRipQVWMr02UYLIzL7MvKkgog=@vger.kernel.org
X-Gm-Message-State: AFuF++k9gSAXc0XBeKkWC6PAY+u6YIbYXkoAViw6LK8BDF1h+ZfpOSqK
	5Z0NdW6xWSA3C+LqpZOwKa89gdRCwbmXogM7TnWwhK1gb0LrRWcKetr3Dm7RnyXtHyybbv1WZ0A
	hYwRE6WuzFd8XQY4S1TvS8wvtfGbikasfuAFKr8mLgsap4pOsHCIBEhxvMirmBbhtYmI=
X-Gm-Gg: AYBFou1k624W+lXmOz/IJG5+us3LMzgZdt0llyUzpHW8Q9WuKWLhRTBviz32P3lg1O2
	1p84iFVZ0noELdYrqCq+jikutwSl186z964Da+tajuUW9LHZn6pBGc1ZPqDWg+yAfwjXAgOeDMY
	R8+ZvgPhRMyXlx7niHKE8zWJC/BqYXlNlYGalnGyekD0CYgWOW7H8qkm/Lzr1IYDioM9vYFr4Xx
	p9ZzqmGSTALy4BQ3K3wJmkJAThJitM1U35+XFHhjGnSP+Ki64MmAbypsK29oXn4LmrlMZ3ECJj4
	z+svL28KYyvOgUnRYDoscpax1wRuwPWGKv/MGBZY6wy1MYhdafYy5goN9qIcHiTsUeQf6a3Xkx7
	+Zq2IK6fUvVUcC+hTM5+pCE7880Ok
X-Received: by 2002:a05:6a20:7355:b0:3bf:9b3d:61bb with SMTP id adf61e73a8af0-3db405a95f9mr2349572637.16.1789369196052;
        Sun, 13 Sep 2026 23:59:56 -0700 (PDT)
X-Received: by 2002:a05:6a20:7355:b0:3bf:9b3d:61bb with SMTP id adf61e73a8af0-3db405a95f9mr2349527637.16.1789369195621;
        Sun, 13 Sep 2026 23:59:55 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.13.23.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 23:59:55 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:34 +0530
Subject: [PATCH 02/31] arm64: dts: qcom: sm8750: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-2-660c31187819@oss.qualcomm.com>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1111;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=KH7fLQLnaYk9POe7G01GMZGFE+VNkF+R/gf20gYjH/Q=;
 b=vHPI8MiUZ/VS2LL0GGMeqyiG+JQejUU8ZoqnbYwfjhU5C2KwUSB5LgkZGaEbVDoFHZBEfSqQa
 VPk7/MQkK4ODda1ELNqBIG9QatCobxHByCOI7OLuLi7vFlklH0Q/iX8
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: vAyO87eJtacNgRsWrq0YDeqFAgYplu2C
X-Proofpoint-ORIG-GUID: vAyO87eJtacNgRsWrq0YDeqFAgYplu2C
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa79b6d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=kLiTxru8Czh8OvV4UKwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXx9fdemgfieGh
 1I8rt1YFC3U0xMyWSPbr7qhqejvzUi1JgYRJOxRyYPUGfCzLc6N4HrOnU+VwhzAD7RXNOmiljgj
 f6Goy0+mupwXPqcCbWEc+r85rwMU/j4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXzu/hXVTBObE8
 6qqhcwnGD+HNfjBcyQnXkTZqiQZvajN6uVDAcIIn/mLYZJOfzq8AKY1UtFYXBisqg8loph5BBaj
 3ypGZykk0nIsx5xGdVT6z6QcmTfAlCvGjSWtJOZ53kXDLXE9FBdbst4BnTB5K8Etqi97c4ZqMp6
 8g1A2WjM2scL5LrWHHVRsRJICdQESyzB0uz2mYvUdi4EvEo5u7dH5r8d/JghA1RuwmmnDFg+4dK
 fhBUzybXQIOVI+OUKh8SaIZAoyvtz36npwYhJaiQsKAjFQMC1sZ4DPIeuKH6Je5jt9CbBMgSlDy
 Po1+gkoa+bk/TOoQuTEc818NNQbxDBcQMB6wvVonTswRgcPZdiBC54A0kC4KRPe2itzewkWFs5E
 RCd2CIdBp/xv0taUWNB1BADvGy6LSavtjRgD7+zkMXBYX4nZ8nKr9ybQTT+G1L1mYKgYz5xflR/
 iFR6CRe3CdFKg5CYR4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 28cf22da854d..897790a3a492 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -200,6 +200,7 @@ cluster1_c4: cpu-sleep-1 {
 		domain-idle-states {
 			cluster_cl5: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "cluster-cl5";
 				arm,psci-suspend-param = <0x01000054>;
 				entry-latency-us = <2150>;
 				exit-latency-us = <1983>;
@@ -208,6 +209,7 @@ cluster_cl5: cluster-sleep-0 {
 
 			domain_ss3: domain-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "cluster-ss3";
 				arm,psci-suspend-param = <0x0200c354>;
 				entry-latency-us = <2800>;
 				exit-latency-us = <4400>;

-- 
2.43.0

