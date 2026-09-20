Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8C33E7BBD
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789894195; cv=none; b=eFf3a9UergEf1HKASvHtY5OVNubEgHpqHAC0aMoDlG+qbH4und4qpBFjhk+lfPCXp9CRUhFZr5rN/PS25X8I4CsxDJmkQ3BUSS4Mql+8884UZ/KjbC+6QDf5jiF+VCFgKfy6rvFLviUXJ+ncrNzhakAUIpDObnsOX+lG1S84A8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789894195; c=relaxed/simple;
	bh=UNWrCYUmKF8a9BTxU+3YVNEjxJrki4rae5vIBK1PtQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I9oHlUpboGj/OCY+zqmej1DdZSvLZB5djXWzHduBAkfWphNs6AJqEKH3vSogU67Pco6tB0xFs+OoK0easRd+5q3Jg0uMML9upfSRre+8ryajqhWVOxeXdGYXQmpVpqaUKHr0X797Kju8qGXQWZXWoHAOqo+7SAliZqtt9xnYh7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hOnP5VkN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jESgOlwf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hOnP5VkN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jESgOlwf"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8VlSv1792079
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=15/F0omI6ey
	VaWtg+k9gQhvDCbpTtZA0dSnC/zlpdTg=; b=hOnP5VkNIrwnuyyvAfniYEBUdA9
	uplzykEBuk0dTdBh10imS8VQKjEKtg0+2KwkE8Xtvn+In8EXqV4WSZpFs45YAGyd
	j/BCTlEjJI/PrgO9B6yWaJTBxAYyii8SbzUq6ow/4wEJG9YYzsP37XzKfq+OPxu2
	PCXtYFXVwdherDMnxh7T7BmSB2Cm0N387k5aBEa0Nf0DHMgDuIXMXAKfwKnp4iie
	f8ZjAQ2uQlWr3usJYhphltqwUav9vcZ2qzT0HuOqJLjIk+on+sIDBUlkbOiEOLO4
	ieU4X5f2VmUtkGwGZnFGuVAWiauI2Al5fJ0WPKA4wHNEA4ka+kgK7/dSzog==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshqftqd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:49:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc51591102fso3039661a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 01:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789894192; x=1790498992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=15/F0omI6eyVaWtg+k9gQhvDCbpTtZA0dSnC/zlpdTg=;
        b=jESgOlwfbzb+E/8faZOtMqCpbBbvN3OkZA4Af7vB0HbbGCnbaBNQTnKwzHNXyonsRh
         cdVRxI3Wct+dAVL26oW1250cob/i8Ew6kIutCJhcw7brJljYViks9Tjn272GLtgP/4NQ
         154G/NSB7jCN0cnVh9f+yRSWliqiXcdytJiqVccdptgIMWjfHdk6mjKoh2HgKZJqQGV1
         uCRdELvXlmi6BbAD1tsk4XwKXdEf/1SAJD+QzQiVX4N/lP6sKrF+TvHHXxmIq70d0D3t
         ZMgGrZDBpyjDVzZ/cCech/npkqbO5mn8Z+MpQK3ZPdRzT1LLaw7eyHfL2LRW663+j8Y+
         vIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789894192; x=1790498992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=15/F0omI6eyVaWtg+k9gQhvDCbpTtZA0dSnC/zlpdTg=;
        b=obB5EeEaT6uJVMdQ+sQvtKTNpxfj++wH6gmtXPQHq3C4HbGI56/VzVha+klNAYfODK
         iPz7fNRLgCv1QDxRQkRHUj4y3+zOue5PRuEkmUCB79TA6amtEk1UUXUGpJ3EqOivDsER
         JMhr4MZcoi9XaYHwwuZ5Q8EcmCI3Rr48ooSzcpoZqayHosrsEMPcxG51ejRaQESmSxSb
         YgP0RynuKYvJIJe6cj6nm6wayiKd7QEx1X0+G6uEGgKXf59Lz+EcB2TlCIMTviU2zX/n
         gIBG5JJ6m5dnnLoxZ4dKLubVv3r9T25zRlDdcg1O53fB4agyqvHyHKCdNeby8/hfm7oI
         9tzA==
X-Forwarded-Encrypted: i=1; AKwUvBz77ENFhNpCmqm1FStowDqJPLUJM/t7Of9jJeXYhji82LiBnQB0BjOIlGUEDoXMgp1+TFXTh9YSsqSaues=@vger.kernel.org
X-Gm-Message-State: AFuF++m8sPFm5wOTkPA/O1g8sXpSxcoMNUP2lIrNhU3cpGhzW5YcG6QI
	0lM6Tocm5eQ8AdZlxUqUHKPE4IaEPdMsHgJzvFLeGmDygYdbfF8/a7M5rJ0wv1mNXuUcZY1B3ua
	SC/72FGiA2oIjKnU1hK6lDBLuxChDbuPYuPG750bui3/fR9yrGM019+EzAKcxqQN4WVQ=
X-Gm-Gg: AYBFou1h+9JmAesosvB9aEbbH7WfVZGmg7Mey3jGkLwU+viFhiIfyVxCNFo9ST0tef9
	2Wv9mkgIxI3/QMpVbmpzBvvzXHiN6fre2S+nEw78oF0axd3EOvAEBew7mGTr38yd+2vslma1tkC
	MsO/dM2gKihfE7x1SmR/ZnES7mcykfyj++uN3wqn7Z7CvDFKJGQjVXcuHIb6/ElxwJ61WUjev5/
	dvaanbOQWrPBWGretNboAT1REkd2OrgwqpV4s0y15NQDYDSkjl46xgBUWYO2EJWMuortjlw5hdi
	o/145M0ofBdZ2fQYOSClQhP1GqexyhIdjuE6e9yTCChaTcA8tAxGuoT75lhMr/gO3gXEh91Dnf4
	IhV2wmhMlPzucg/fEqKOpSN4ny6qI1TRouKrs09ogIog/jOe+N04+sBCrRMZk
X-Received: by 2002:a17:90b:1845:b0:3a0:42a9:9c7c with SMTP id 98e67ed59e1d1-3a042a9a00fmr363001a91.39.1789894191842;
        Sun, 20 Sep 2026 01:49:51 -0700 (PDT)
X-Received: by 2002:a17:90b:1845:b0:3a0:42a9:9c7c with SMTP id 98e67ed59e1d1-3a042a9a00fmr362980a91.39.1789894191451;
        Sun, 20 Sep 2026 01:49:51 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3314313esm11180808eec.14.2026.09.20.01.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 01:49:51 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 3/6] arm64: dts: qcom: nord: Add the SPMI PMIC arbiter
Date: Sun, 20 Sep 2026 16:49:17 +0800
Message-ID: <20260920084920.2201418-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
References: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEyNiBTYWx0ZWRfX9yvAgglFH86i
 db5AnhHI486LuNQQzxM6a+tXJMQjiNsF/hiM5s9VhUq53O0TE0YXRUBmmziYYeIiomqVq1z8JNf
 dm35WZvT+nGXy8D9QRSKplOcfzI2qTD7vfmwpQSC4N57Mfzzam6SANc8zvYMqJjI6N0GasBAJ/6
 2cD10NQcUPptaR0eR07XJOhO7LlT9+EPOtXSmW+hTzEbGV7UZtKGT5dqQWdohcDsLc5Qx0dBpOb
 Nj6nd+831BMVLq0QwqDAE++ORMJLGAkXydt5jA7LWjJeo/01T7UHTy/6E6DrjABqgH8yoCoGlnz
 YOHgrvK3H8xN0yOokE9cvdIvOI0M+0e6xx6VTXtFmVYj5ZRJe6HHfzr7P0RFypGUW2V1azc83aY
 tha7yC/wUffdD4LZTCDYSjlJzwMh2XJMsWqbO7KrR4xxa+1TNQWtJgDeF5XHB9P8OJd3l6yAUdg
 A/4FBH1qWM6cOdwOi4Q==
X-Proofpoint-GUID: Mn3J3g-aXkjLTYuZB6pM1Prt-8pKZThS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEyNiBTYWx0ZWRfXy0oEpGCHpLCC
 ZiXaTaxQeb9Z3UY76N0BZD12CYQpdBu9TujYCTwwgcD16KC53t+Iy6Nyo4auh0VEPWeWQoZK3mh
 uurU2FUeRHYbFNWhFU6jQhvW+xX/yKM=
X-Proofpoint-ORIG-GUID: Mn3J3g-aXkjLTYuZB6pM1Prt-8pKZThS
X-Authority-Analysis: v=2.4 cv=XegcX455 c=1 sm=1 tr=0 ts=6aaf9e30 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=pTKKwl7rlpcWqDfdxRsA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200126

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add the SPMI PMIC Arbiter node for the Nord platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index d413341eac41..926ccf3bbe4e 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1866,6 +1866,28 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			#clock-cells = <0>;
 		};
 
+		spmi_bus: spmi@c400000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0 0x0c400000 0x0 0x3000>,
+			      <0x0 0x0c500000 0x0 0x400000>,
+			      <0x0 0x0c440000 0x0 0x80000>,
+			      <0x0 0x0c4c0000 0x0 0x10000>,
+			      <0x0 0x0c42d000 0x0 0x4000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr",
+				    "intr",
+				    "cnfg";
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "periph_irq";
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			qcom,channel = <0>;
+			qcom,ee = <0>;
+		};
+
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,nord-tlmm";
 			reg = <0x0 0x0f100000 0x0 0xc0000>;
-- 
2.43.0

