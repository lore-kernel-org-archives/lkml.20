Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5073447FB1E
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203122; cv=none; b=rB16fKDKSgdo7/Qc/PpoEJbmdZmLBMR6TrZHHulFJxe2NquW/b6nGjElXom+isTqNWvzp8tjDiWD45ohA6lHdS7zWD9QwmS2xqxYk6xgCXBd+vR9TDmNPwEUN7KWNwDWdv1Sj4OaqmYawuf9T02xEXND7VNgmH1W30qE3sq7qRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203122; c=relaxed/simple;
	bh=dwDSmlc61jnT+AWru7uQHSWcbB/PF2x4JEqn6VemRVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dxNbZkkdPLq+m95dgFFkFrjXZLq8dwN/r2HUm8sCYXBEIZirZt8Za+BXbClYDdk4RJiaweI3EJG+v6KRiIf2nQ67hibMpFMv8Jrqu+iFmc8UHbwg2hM8gFCBykDJTbGu1hQZY9tZcVkbFD8l5WWfz+2DOd2oyeSIr/KK4LQwJsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LvxnH/Bw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J5sj92pJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LvxnH/Bw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J5sj92pJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFJWj1068051
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 12:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iP/rmLAH2uQHpy0g0pb++AJnYnatGH4acjwykoyxZ5w=; b=LvxnH/Bwik2EhgZo
	cMucxqtju9k1R4FGbmT2LP43/ZeOyuhgFuyxEvJCC3oDxfRjB4MaDXYo5V//0oaE
	LrWX+UA48Y4dHZbovHduc1LXQIbEFcaBZSQya8nGsA9FiJrja/j5SAcIDfg754GU
	Pek/AUwdkMVbNdKldQTBFPjWdlq+Dcu2Q6FTuqcvfpKsn7BZBEz3PUw3hzKyssx1
	CMNqzh+TR5mHQppdzPPBNrvX+oLbMpl5/xMMcViNk3T3qtUGPjW8ToFeSHqlS4NF
	H/926sMqXmJ9HzPXerks9M6zuNG0rdTyXCl1VfhL4PlmMtGB6vT8XBiSbiYT3CGt
	hFog4w==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08np6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 12:25:20 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-806004ec379so2484970a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203120; x=1791807920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iP/rmLAH2uQHpy0g0pb++AJnYnatGH4acjwykoyxZ5w=;
        b=J5sj92pJagmr58kJvoZE+kaMzyIzk/beUV5wzQuxu2grOjtx2QtTOXyKxX4idBV3AF
         8+nVwONsodwVu4pBKh9uwJMDPjJeqxxSAxcoSoNDVZz9Lts4qT6H3bT5xlVv+67E/SOV
         ecuv2gJMcvlE/9hCFiGgil0mtBCzghjan2vqUwYVzRFlMcsqBlkPAine5lE+Ept0GXYH
         KO8kQ/k32S/SiY+YqeyKoq8o2OUaxwG8CmbvWlvplqFY0e4/7pEd3PA0kxMOZGv8W2qr
         +XxWxk5VixzPQPGGrUQn4bCCVzfvDE66FnquTvYcu6uvt9mgDo439zLaU5LbJLeMeyO/
         NnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203120; x=1791807920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iP/rmLAH2uQHpy0g0pb++AJnYnatGH4acjwykoyxZ5w=;
        b=lOJagxHfOF1fGlno+/u87rPvAUnBbTopiBw/5Xpu3Z5AcC5uykRs2BBH+JUCVk5BVV
         0XFxsIY7709jywptcmxzPlRX95YpwEBymdeFrf6WcEQGtpe4CyvHGqXEv3i7V4Jb+cmq
         d+4OmaEdXKer1EKABp3DDueH+X9vffOQRP21wGIoDcOjYQDpy8GoMruU64Tkm5sZIk9h
         utoO6HpCmDTwuHifczDW4E1lmLHUEvXAmBf77A7Y4IkLnw1N13SyYv3h4myEZXPsLE+4
         Ke90qMKEMI6kaMrvnNs2N1a+MJJxm5CmnSEB1evUIwAGVQRjjgT0eyIhkRbAwhjVW0Oy
         +pOQ==
X-Forwarded-Encrypted: i=1; AKwUvBysk47xfcCRMtPc+1+4iBVj6BiBZPMAnRGCgmbGda0ZkmIFoU7CW1Ae9fRFZ4xnl4sbekK4/0pQYriuyTE=@vger.kernel.org
X-Gm-Message-State: AFuF++ngiwTinXzVbH7ATyC/5qwUGXnwK6PwVT/qhMD59GxwIz9yOPOc
	R9XtGhYK53/jIvIFOVjW5INyBvRvuYG63t/rAAgqu1Lybx0FDXByK9mKJV7kYz90aAlCk51vVdW
	/jQ0IHiJ3q9y7OWUIXFj7IGpdawBS8T/LhLmpMiZLMn+Os1E/NWuJSawq7PR3bYPCd80=
X-Gm-Gg: AYBFou1/dBTNHDsnTHz4R+1vMc29/SA0SWWIqj/H2/tf49qkYGI7HR2Dbr4hg6f+Z0f
	stT4vh3/xvDF92FAbFCcHEtLdZUGqHSllVbTSNaNM0QDYKvML+k/AiHWWdDz78hfmLVePVNDQUP
	AwMRn0Y8E04UEJ9xAzSTDSzH6UZ/nxYNBafTB566heukCQhozUv+EOzh/E6C6wknZCKGG6YcwTW
	9I2PG2e43vT5hajtcIQ4AjT+40rmEi5XE34JNAnkhLh4IJiZPNnYm6dolhpWi/EngaUxM3sN6u/
	baO7KY7O9jfFTsjBVymAXN8wII3/J6kvZ5xO+yiWqrSdo4UNXqI0uOXzThBgz4K0flE56tKUU2A
	j8rhjy4698mLT8rFSaB0a+2jhNZNKjOuLQA==
X-Received: by 2002:a05:6830:82aa:b0:7dc:c7aa:22c7 with SMTP id 46e09a7af769-8227eac1882mr11374451a34.0.1791203119942;
        Mon, 05 Oct 2026 05:25:19 -0700 (PDT)
X-Received: by 2002:a05:6830:82aa:b0:7dc:c7aa:22c7 with SMTP id 46e09a7af769-8227eac1882mr11374425a34.0.1791203119382;
        Mon, 05 Oct 2026 05:25:19 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:25:19 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:06 +0530
Subject: [PATCH v4 05/12] arm64: dts: qcom: pm7550-eliza: Enable BCL sensor
 node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-5-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=1220;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=dwDSmlc61jnT+AWru7uQHSWcbB/PF2x4JEqn6VemRVs=;
 b=USfjZgve7IwAll0Fc3jaXO1yeYZXW0dw4CRX+9heQYvw82iWdkDm7r6PnwgSJ0Zb6xvXTv9Xn
 fiMb7YIyXn1B37ngJCt1AT9ZnLbbGQdMOjK0wTOh7Q9BnZzT8VgC5Rn
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: qXSbenTZZZLKNOWdLre3wjol6_MborQF
X-Proofpoint-GUID: qXSbenTZZZLKNOWdLre3wjol6_MborQF
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac39730 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FmpG-t0u5PG92cBmzUAA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfXwwct0ZZiBjil
 4Msldjzkh+0YMrbRMYASQ1oR+YFmLIGJXdqd/xKzRxPgL3xeV8n6ZvkyfB1bHNDU/TpE3J1Cm8x
 Vvc7VAE+zMCBAVy4v4o8auAT2JDAy54=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX4MVXpceoZoD1
 kniE7dF25lXLk58klLDmbEWoL2J2pD7abnYO0nOA0slGA/R0lGNA3230BbsW312LUoFc/z44aXx
 2vR0CHre8jHMNbLLxMiYFT6Wp/xTredTIVtKLKxO/u8OB8j0Z1lPBV0wLI6vaf3PPA++y1YwoKJ
 UrtIwm5P3kKDdY1ZORDMM9JhZVltwInTpjqMcTANpD+vc64QaJN+vYFJ4GQ0SVCotXGsa6q7Fhg
 JjJyD4WPNQTf9otMJb1I7JxqiN2SaS3fgrEvG4rie+T1/J0U/6O/SI5JA3T1XzzhhB5Okx83VQS
 4SmF9Q0MZWyyrKxA+CEHSK2eBYvigZENTjG3/Ynt5hPGdIQozHoR0UHabzHu/c+VmGieKDPYWoN
 EV4UBLurUdZnbBFQunwfJUTJT8l1oQteLOIC3N8luSZvLagHpKqPnRt5DmUM7WMjFJzSyhKahXc
 9b2Agn8HW0POCU/iYpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

Add Battery Current Limiting (BCL) hardware monitor node for
pm7550-eliza. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
index 9b907f69264b..9cc734001a68 100644
--- a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
@@ -48,6 +48,17 @@ pm7550_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm7550-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm7550_gpios: gpio@8800 {
 			compatible = "qcom,pm7550-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

