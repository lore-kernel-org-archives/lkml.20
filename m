Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8329825B0A5
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109440; cv=none; b=CXjDMH1qh7t9HkwynjMWHDRcMA61lGPrTufAQKusA9YYVCuAkDEO98fOJiKTZP5yT97Y7a4OGuz8ZYnEHnnJ+eWLx51uLZ8IHaEBpDHt65kqGHjFN9jYBkA0L6QgMQ0Fe078tHKfivIqCifKLiyYGBgQb5PCIXF+D6TM6MAX0+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109440; c=relaxed/simple;
	bh=ZwoMA8Ox6Voxca4W7TxJCuuQ62Fybafvlxh9RQQvVc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NHwgetAh1gUPxMpCi2XkHL4CTXkzSY3MxYGZZSM+JmMnHePlscNm7MEJaH0N9mIMTglYldoB1yj5Yrx+2A29Yk9w1eaoA3FTh5Q+JmO0pc0LcTdSXtGMJhLnFJMSDNveh1uFnvdrUNMrOHlLs7OsghaAqb00pdZTrJR/7hRWkXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iVjP7Eri; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IatUjvOX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iVjP7Eri";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IatUjvOX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kNk13328970
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SEfHSxWSBoTQlF/WKmI1REOFxvDDF31aFDbnkZZrKtE=; b=iVjP7Eri5rcITkXk
	QxxSYxhar/tyMUBg3H9jl3lhWoUq0sqtuR3SwgnxdJgVW1+cvKJ6nyceKxB/I/W+
	ak8e5MimNn+GF9dDCMfFavlPq8Ma7/e/BhqOll3KdY+Gbd/57EuJWz+gkMfnzB5O
	0vjvEslzFqq0BmLPim6ccy3cSeHRvLGPesAJEJViBj5Xzo+IoXo59sUJsP1qEErQ
	bE5LrY/zpIx3YhSASKVNw0Ez8AGlSgWHcv6aUA/cEcG6QsarMh2SzizVIRH2W7z9
	/HJlEzE1IxjbMib/hRQBY2DpRTKwvZ4uGZKK4/8Z57b2WvKXkTC7h7yooUUCyskr
	acR0Dg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdr8art-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:50:26 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4b524ce78so522384a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789109426; x=1789714226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SEfHSxWSBoTQlF/WKmI1REOFxvDDF31aFDbnkZZrKtE=;
        b=IatUjvOXAGtTgJB74K3//3AX/QdZysEXAygvQ7vu8pKaCaW50/QCY/vWoOuwYiWgnw
         BNB6nOy/fL3U7cMy6SyYh1nmd19iJYMzpLt/Z2wuRw0ZsWCs/pe0vpM5lSGdcLezESGE
         zAlEqbNGc/pi7tuhELBals6qDyhnqNuLbtETMCCHvpYMNO3cm3D/m/P+XkTFSbgVIyh1
         NIJsR0+XKdbvOHPAJ+co1AScyqjeCcsT6tcZR+OwcsXCFhCRz5cQN2CDViqd5u6Ite7p
         zSznupc1vfkQrFe3RQZiHjzqp3RbEeIR43uwLc2qt3y276JW4Y1ro4FX6jRL682VWy5c
         wKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789109426; x=1789714226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SEfHSxWSBoTQlF/WKmI1REOFxvDDF31aFDbnkZZrKtE=;
        b=Z8K+KMZW/mgyId0n/EoHINXhv1UUYfUAB1ogbehA+hLYj/1QZogqhcoVfV88DTflUL
         29F6RwwPxf8wIyWIeTXcGAOQcWldvGcTPlw6tgStrI49OGcTAzZnQj1VIdpoISRWNaCA
         +arhCPJdXqtERNgDvQDCr20A0h0G62ji7/t9K/E56xR7ys+I9awwWVAGGA/wlu/pYndS
         HZADyahWPIt4DB3R9FnOV63iiIWFodr2MxNEtmi80asoMjxwnl61KfCmeSGrMjIHXqR2
         8jf4Hz3qvDha154i81plC5l79ruK1DNTrk5Q3F89jRGSdLSjKAvuK++NhwLvqrZtmqHU
         AMUQ==
X-Forwarded-Encrypted: i=1; AKwUvBx68Ab1JT0wEkrYiQ+XqXJ0hq4ZLRHp9KK5bp4d/7qcBcpCV9wZtgYAD/BIknJJFemsSY0K7v6IWBql5HY=@vger.kernel.org
X-Gm-Message-State: AFuF++kr+F1Wp2R8xhd3IiL3vVI8stwFRZnFLEcuKBIH2SUQbQ2RMgrv
	10Je7dKUmtIgZtN9YoPzTM/aUZnehYl2zhQmLo5DCOngYG5b6RvamW2OzymmC1oH0qbqdLayl1N
	mMLX4saLs9A/V3fHRxGpRN4EXP//4Ea5Sp8e25CiN2DP++rVQzcFs/cdCknC/UepEnKY=
X-Gm-Gg: AYBFou3w1tvfbVK9+8n75st228aUs79IYxioFp3BnEpYtrQc2HeVgVpfdfl8Ok5Q6ku
	VVpxJpuq65DPpylag0FGTKKtKiA2bxqrGRg5Gf4dahC3Gm0hjTutInC6mxiit4PB1OTpz9m5iUi
	WfkaF5mSlxFquVH4bz/DDU0bNCPpgHm7kKc2UIM1SKDHKm1OedqdWSTAPW0MkWvyMAKy2YHk5OZ
	fg60ZdGxIi+r7GZTAfC84wXZdOszFrb1wMMka6hRPp0K5mkQ4AWfg+uzU4liiafYRMPI59sVNFJ
	Dn9OyFl4mYBHvl8+j0pTpFPpNRFDunsVpeKzONkUKER270AtvQeZInKxjY45gC/cZQX8ljyNyZG
	TM6X8XqV+3Gydt6JWdN9Ww7NCGb24F4i7JLU=
X-Received: by 2002:a05:6a20:b598:b0:3d9:3626:1326 with SMTP id adf61e73a8af0-3daed14f694mr4510227637.2.1789109425852;
        Thu, 10 Sep 2026 23:50:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:b598:b0:3d9:3626:1326 with SMTP id adf61e73a8af0-3daed14f694mr4510155637.2.1789109425258;
        Thu, 10 Sep 2026 23:50:25 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a598aasm3934383c88.1.2026.09.10.23.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:50:24 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:20:05 +0530
Subject: [PATCH 4/8] arm64: dts: qcom: hamoa: Add t-power-on-us property
 for PCIe root ports
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-t_pwr_on-v1-4-c9eee197d082@oss.qualcomm.com>
References: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
In-Reply-To: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789109406; l=1295;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=ZwoMA8Ox6Voxca4W7TxJCuuQ62Fybafvlxh9RQQvVc4=;
 b=VeSKiwNYRtY2YbACkPlI4ykxtAOab10+9Np46hXK/j3rcKpDNEwaJfxvNDBAWBXs30lhjb9vt
 BeY9ih9GK+oB7s6k0I/MlFPgOQROZqJv3Zh2NaO/QFos/IkaLcqKqLQ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: KnYdbpQSe4sFYzTIRlocmnaQB-soZGcM
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa3a4b2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: KnYdbpQSe4sFYzTIRlocmnaQB-soZGcM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX53uzqs/8WAbF
 ZidMhmlZOoVg6nVJFfSyDkJ+nK5WfcYRSQ2NyZn+i7/ysWED7He5sLtSP0vwAPaTmoMQPJ+h9Ly
 DoNbRnLxt1sUss/swWLLJ5Zhrh39ME8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX/+t4ioz7DvfE
 /4Gq+fC6evPso7+VHpMoTaERDGDriTgIUwDt+DS/ky0BOT8L94PXt+6jtOfydNKpMP92E9cDUif
 +oU33DKn5T+1um3Kd/DKam0vnzhL8AamVllIP9ymWQWC/4/0UzEWMVIhpI27dUCf/FFpEIkQPYJ
 iyKJfivY22DUCz4Fc33jqGqnOoMXxpEyraJTmYztXuuv2HcZngDUhSWdAgLoSA4kExqKErxU/yb
 zcfYMPbYz11U8/hYVwkcDdrVMGLlnBUyl3NN0+730XD2kg4tKTUCminmmM9l5eNcDOWXxV9ci+0
 hYtfZ/MSU6m+INv3x++4sbOi3dE5z4pSpM4OYhN8soJrKxjGA5/NJ3kEz4pbm7MKxGgUL/QojMQ
 2LhVoS3ziH0XASbOj/PmJfUtVZl62C9ogSRFDAW8Z/p43v8FVpF/+YqwJE4FPYJGcISSVlkdmbM
 kXKYjjTTrYYxf6p4CVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110093

Currently the PCIe controller is not programming the T_POWER_ON value,
which can result in improper L1.2 exit behavior. Add the
t-power-on-us property to the PCIe root ports so that this value is
correctly programmed during host initialization.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 8a96ea1bdb9c..2fbcdd4e9088 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -3374,6 +3374,8 @@ pcie3_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				t-power-on-us = <80>;
 			};
 		};
 
@@ -3514,6 +3516,8 @@ pcie6a_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				t-power-on-us = <80>;
 			};
 		};
 
@@ -3654,6 +3658,8 @@ pcie5_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				t-power-on-us = <80>;
 			};
 		};
 
@@ -3793,6 +3799,8 @@ pcie4_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				t-power-on-us = <80>;
 			};
 		};
 

-- 
2.34.1

