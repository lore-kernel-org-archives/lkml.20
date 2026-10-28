Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200899;
	b=4+miBOS58SC5MkDQHSMzh1FwFbbRlksgJIkUbYQiizWxOmIex1bldo1rNblzC/3f+OTZ
	 ikYsg3KVpIa4ctUK3LEhYqSauoo7p4vGSwgqlWHGfhqFfW801NCUBQUoMukouqGyC6apy
	 zU7HlUaJ4QqCfA5mgygKUZNosScl7eaYdtHs7cO3M0n7ldMzuFmC8n955zQZr/fNLMVI/
	 4C4Dz4FymVqvCAzuMHGg7eBeas6+oT3hvbcovk5YONv5ka2XBLgquFgkPpS25amwt3g8K
	 HavMdiiLEcCKiVWoPZUKZdqiFLsmHTL7/vPjPnFhrGgM9C93Rh74JnXu/DsYEh3V6ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200899;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EljixnZBl5xalbXxR4onDZVZN67B5eA46yADJtCkT6A=;
	b=qHrGEh7swGZk1nbVL/+KTmFghEhjyV6YwooCN0EAJNUbTlssrX8w/X0jOrBUxDlJ9clM
	 kbrfWdVFYHMvRFXuXSrQNSlPuSBU+Aoo4F1SS7n1g9f46Q80dnAwtorBgz48DsHyNoWwg
	 lqKHKOLx8s9fGzM4FQRqEQ+QCYG1r4Zecp1WOtnwL44wzJQNw4ocjXnxTQ2LQhjDl3rc3
	 gCvDu9sBKaY8XN4K88vJSxLM1tPEGbiZBbyWgFrawhFL+Lh/8AVFJ3FxD8/SvfMIGMGfQ
	 4MqEk6uMpc9IL99ymmi6HaDo7ONb0QoxcfyvxrDVMhLq8noETy+Njoub+xUv72UYkVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KYyPY4uI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DsXZZ+oY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7A360A260E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB7A360A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KYyPY4uI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DsXZZ+oY
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFACsW2001630
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EljixnZBl5xalbXxR4onDZVZN67B5eA46yADJtCkT6A=; b=KYyPY4uIeIylLUO6
	z4yl5UozBPzx75kR5b4cgzHeRjWUzq06WCeh/XZ1uQPyTDRpawcbiNdmaM0Irv4O
	ktiealJqOSjYchvjImimcMVMrae2FCG+3frWh8VWOUXetMsWrnTURN49mqxu31uY
	EjTa3drCuebJaazLeiGtFR1utGzzEBcLix7HcvBQyAP3RWZFixGaRfKRQzhIGA8S
	/YA4ctkItgAjlzuh1tq9hB0PB9m1o67eoKdVH2ERkERNRS2TbrwDtQVNX6ocImlo
	sG+gveqs/Nbi2THtYvaxjxqTOGoaoWqBC53Lzdnhtw63LgCYNhiwkPvo1rcfhDZ0
	miUwaA==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7sm6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:21:37 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-679a2297c50so1059826d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200897; x=1793805697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EljixnZBl5xalbXxR4onDZVZN67B5eA46yADJtCkT6A=;
        b=DsXZZ+oYIA5EC13rOhqJIwVdaGbpuk2eItxHnqeQuKSvIsYXTf3FJhDjcac8ytVNyO
         tDzHTV2JjIIu1xxDvVuMkzAKWhOrZulHLlg8eG35ShCF1YCLPqmXS6fw6Sstmhnt9apm
         rMUd6dr7JV/wQ8IO35bKG/ix53gPSGOKL/2IXj+jAcojebbtfE8nXSIfhGBf+c3wLoDe
         JngPkiDyODbDoQRBP2KxvvPIiFRm1Kg8BJNQHIlmOlFwf7Jy2HZO99AKMAQwluN8cRVJ
         G6zBESe9sBpi9ETl4P7OkgMpGSZJdYFYxmjn/d0qQcJ4NKD3VevpvoXHzBmKA3htiekF
         r/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200897; x=1793805697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EljixnZBl5xalbXxR4onDZVZN67B5eA46yADJtCkT6A=;
        b=YJyuQOy3S8fvuta195DmInO33wWKxDHmcE+SdQ4IElo9nap74zy7XB98JjrGCWoAmu
         wc07SbZReFLa6igKuvZsZIUo9VmcbL6wb6NGUfmvde1thn93JWRUOkqqOTLjsp1fMpk1
         BvxYC9hMef3gD0xmD9G0mwTcJAzrrtoMgQ5PzP0eCKwG1YTX8MK11MmkMgk6B3GJpGlB
         nTFMYEhD29qVIkqA5Y7VUXhEbgZKl/NmumJz8mX/0/RMVkGGefVSZDlve4/ozFgBJUhQ
         X99qktzfYMwNeIj69jMGFGwWKAmMkRxqGSstagLi13kLwUKw33WpUyyLjR/tkMVmv3UO
         Z7Tg==
X-Forwarded-Encrypted: i=1; AKwUvBzqbXfpIl2ArIuGMTGfiXrd9N9wrcCQBQBDDUzxdPH7Il66z18yJ2iUF+PZwq3v38z8TQM5CpoYkdt8gTs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiEDNsD0NsAPA0aKvB3swv/FiBCiS/QtlO4HoLfqOVy7txltna
	hi9zdpoS0/nmsClBKqevcWiRHsGIibsRb0UkkMIkjCLraOdxDqC+eKY6JaSc9V75N9rguAI112t
	pNdetXF3GWzMBhI83LPG84CfaWQ0L9IsUGJaz/0144UJDVfW4n1Y747PPJSz6BgJhApQ=
X-Gm-Gg: AYBFou3S+raapP5an/zasxbZTz1dCzqHky8OTKYNycJcOxPwensrfAWrmpbt1wH0gTP
	BLbbwuJ7/IaOvLOmXpxBhWvqGF7PZnCyrvonVkBuGzihDxYzfN/EQMPb6p4U1Tc5CMXzp0HHHAt
	D+X5irICQUgghfjNz7JbMt2iQdO5hbgKcjRknck6E9m+0umW05RZYxxKgiGx66Q6hj8GKkciLih
	NKh+HXpQXiz2XKU9xAxIu3oPYyXc5RufVKY2SPtbg0HqX756jriQ7p8iYwRR96/hK5H6Y23jpdj
	KX9oUSu+mR5fxWvjUIbUISBQX8qeCYamhD6XmehL7kYr2oYWowKvOufSI7G5HaPRrlF2/7+scdq
	0GKgp61Wd9BB/7QOzeEKdLVOene9x+tPpLtv4uBOogrG3vVRPPFjahjQuQFIYpT/dp1H++IgIB9
	rujT6qNKeUlOFN+0/5m6ID1+6GYxZyrRwuL2m6o+0lMTVYOs772jR+aIvXbMpY
X-Received: by 2002:a05:690e:4844:b0:679:a3bc:c23f with SMTP id 956f58d0204a3-67a7bc69839mr1147897d50.39.1793200897156;
        Wed, 28 Oct 2026 08:21:37 -0700 (PDT)
X-Received: by 2002:a05:690e:4844:b0:679:a3bc:c23f with SMTP id 956f58d0204a3-67a7bc69839mr1147801d50.39.1793200895124;
        Wed, 28 Oct 2026 08:21:35 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:21:34 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:48 -0700
Subject: [PATCH v23 14/15] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
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
Message-Id: <20261028-kaanapali-camss-v23-14-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae21301 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4Dwyees-64n8yO_2jeYA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: FJ8HCSQangM_S15APGsKCGPl9YWxSbrB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX+2ki+VNeEiXc
 Kv+OfBS/mSR4DEPtxW8qJXtN8sytRHuLHZ8E5DUG9ysyhAF8NArvhnrViuNx+N/1ae3/NF6DKqK
 fvMExxrY8hCfVejvWhZ0lgNoStnL3Sc=
X-Proofpoint-ORIG-GUID: FJ8HCSQangM_S15APGsKCGPl9YWxSbrB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXw+sU+T2avJCq
 lBhJqO6dk67PMVdUiWHfvMFm7Adzr9OnFa3aHEkLda5a95JerCgln5aHdVffoQfwd0lD0Poo+o/
 mCGS4+sgjlUk8Y7rYWUQtZc8CB9RNlBeYd/YgQzj0oaVgsSGsiP2BRv+2ZhefzkRH38vOeq9LYE
 FcVIeVSsRtgzekL3i9J4Vc5Hx4Fufo0ftvzNjTYMhkqvgznU1dM2qaiz95ko5N55QKi1kzoVQgd
 Rr6DtrWusiesGi4m7+NAMVWn+Wcm+5jA+gJxUToRW1na1U5sLmuAVsz+JSoNvnHQzvzUQxkPjmr
 Wc/Xt1anj8xS0LtNm/kvV1y6D2/iW74hyGD9r+E/I2pMfDYV/4ctAf/UoS4YofzX3r5/LoFLF/c
 gq/On3g+0lQfjlZmBDFsy+7oOc3XPQFtu1MiGMszr8+G56Lij2CWI2bC/OTUSe4NYoB4nZBZXTv
 RKvorZU9RGBNeU3IlGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

Add TLMM pinctrl states for the camera master clock GPIOs on Kaanapali so
camera sensor nodes can select the proper MCLK pin functions when enabled.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index bf3922f0ffb3..3f28f279e4e0 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4647,6 +4647,62 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio91";
+				function = "cam_asc_mclk2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio93";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk5_default: cam-mclk5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk6_default: cam-mclk6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk7_default: cam-mclk7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_i2c0_default: cci0-i2c0-default-state {
 				scl-pins {
 					pins = "gpio110";

-- 
2.34.1

