Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF205208D2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687408; cv=none; b=Jv5GE+OtVEeJZqSLyMKIAKsjAhZ127zR1SfuqusIKVZIHKbUNTw3bKtNT2Secx2EqNEQDvaH7hjOyH33u+QFEwfWG/RFX+9n6rWpwTUxckOvgEc/B40TECrtQHEwu5f7cVQW8lBnILEZZ9gfo0pzkpf3kDo8uZlHAVu2Fh1+Smo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687408; c=relaxed/simple;
	bh=9HxEUtXiFoTX4SHdOnc/9dLz9j48pEMhLZUBvtdAKbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TgBXIekNwvEoGQ/su7uqY55yjxPA6bLhb23qDME99Myoa1mCK7MdOFaITip1AM7V3WznPUG+w9+OvpwTgHDxSpV6xTrC593+hvHtaBwboYVd2SVEX0+nCDi68518nrqMAa1C0P3McRRK1WLzD0FODSXV3xt/w5yNOMbwox66kPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZWIUxrM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R4WDoHia; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZWIUxrM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R4WDoHia"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqipS611654
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QN6s1/Bps0mw1e5rLu6Bfb3VEeJotKzT6mLwiXsGK4o=; b=IZWIUxrM4xnsa87O
	QrFMCZONDSsjLZCzOUiyFY+vcgcvBoWOHtYZJwynmVXJdFQV0LssWfz9OLcP/Vys
	8ewrm4a1tQy6rnWUYij2VovS0tEISAoApWmkCoNoKeeSXsZK5p921bHmdmvLNxFj
	Q3tmvueZJmAXBCUDla/nc6VkX8zuY63RsbDf+/+ne+zGJ22NFu641TXF8f9z6n8/
	wleZZeFZo/levRVu5VDHL8/KRwu+k3oAgn8y+SN8knO/A7r66pafymopgxsP032N
	tf2h50TPkESvQ2Xm/dszbf1hNus8W+82h5DzVU8F5eItZb6epvr7VPa7SfwuGRc3
	nK0XZQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4u6nd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:10:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91235881828so85792686d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687406; x=1791292206; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QN6s1/Bps0mw1e5rLu6Bfb3VEeJotKzT6mLwiXsGK4o=;
        b=R4WDoHiaQx6oGPmjpjlRo1fUKTOc6LPg5plwVdkX/uuZYaJj71SFAOmjGZuTkaA/ZD
         R766nMjugip3VmnF5cqJs2qfPTdUZaEh9/LMdoUejfaL051UekF+apszgUQgszct3toy
         jSMlm6wH4ZbF5HdfTzlzrLxoTxbBLo8Ll17QozLazzXN61WcRYb7l4kE78+of19rH6X5
         OeBKYe8Ss9bvzi2I6WcpaPFNJLpJe3ID5+cMuoIDN1L044j1J2SrYkyS5+Fi0dSccazE
         hfBgVc7Z/IhRp902TVoMoScbSLMeUTFwhxmBQpjNVNQnwOsD6o2mAcy89HI0YsBIFNnQ
         MoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687406; x=1791292206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QN6s1/Bps0mw1e5rLu6Bfb3VEeJotKzT6mLwiXsGK4o=;
        b=f/CKhbgqfbJIWFL3NLhfStH444XkBDqzsK4yFFoOkbH3yt2GiJhftGdIEGyLwMLFwC
         IP2lX+pB1PavfyEvtdnkFKd8P4FLucqguQwTuHeVD9/ro1wLG9kjv+BfsU7NjvZjg9BK
         8/P+aD1fhrcLMiAykyuD472JPm7QK7bj2/7uMpSo6f4whMF9WEsdpaEgzPDANhyQb54u
         aDq9TpNyGj+GsxG2CwOeeq0lTF4ngts9vFuk/Y6/p7Db6rGg8ROc6iVWDQlITPuCkoVz
         i1wg+4cy2aylxes0+21KGbhTIwTxtnmBU3cmfisZOzQ56emDuGP/Pgh0sh2mFRrmD3aw
         v8gw==
X-Forwarded-Encrypted: i=1; AKwUvBzip7t+GpeREfbOQFvWlOAL1glklMYdGVZrL671YqAIu1JmDdJK/j57Yjh3J++P6Ik27304qii+bM2Y7tM=@vger.kernel.org
X-Gm-Message-State: AFuF++ncB6Hzue2hDhNMVpvTWHcSGThiF8Pvi7IG8W7yY0p1NEofHbji
	vAc/YsyR3JH0r0NwAWwLdTUmtDof1Wju0bnuQVAcHL9DGq/oA3Y1ITrE0l28inJZlxM6oJfQ45P
	ubjhRvHgATKO21kUpgccdy896jFiix3eJctayouRHPmfROO5sY6T0sZ/d8PRXxiodaN0=
X-Gm-Gg: AYBFou0DT2ypYbRlanF+LSZNoAQVNUA+DZC1Krl/eMNjbzl7V9/8HQTZwKaNdVzKoee
	auM3xY9WHC7E6soFDITxkuuw/w2k6masOccTfh3obs6uYqbSLOe+ldbkC7oHkwrbsEHmYNCLwe5
	LtQSlLanMCF3j3ECB5DFr2sVpXOlZusdn+4zgKvPoSxXu+W9NbzB1hv9BePXjoQ4MG/4hV4D649
	Q1y75aLivEr+xyzhRrFuBEEL8bmab0YE0TQS7ouHfTUYXtcz7iTFpc/C628ggkuZySh5oBv/s/F
	R3adnHOTVvIfg49gMXS3HoiwqoYcBNBsoM8FSwxO344zqiY8/sVrmQp9q0aONdA+CfBauve8oGE
	XKDvpBJBCi7STLqyn87Zlvcsyu5ch8hNBAC0=
X-Received: by 2002:a05:6214:ccf:b0:913:fa79:99c3 with SMTP id 6a1803df08f44-9142f94d216mr261680816d6.43.1790687405359;
        Tue, 29 Sep 2026 06:10:05 -0700 (PDT)
X-Received: by 2002:a05:6214:ccf:b0:913:fa79:99c3 with SMTP id 6a1803df08f44-9142f94d216mr261679986d6.43.1790687404649;
        Tue, 29 Sep 2026 06:10:04 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:04 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:35 +0530
Subject: [PATCH v3 03/12] arm64: dts: qcom: hamoa-pmic: Enable BCL sensor
 node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-3-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
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
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1673;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=9HxEUtXiFoTX4SHdOnc/9dLz9j48pEMhLZUBvtdAKbw=;
 b=/vuXxbLlqSAzDejgYnMcuPPH1hXmQ8UXDiYuQ2CgBfgDbCNwjv/dPe+PwPtxF6/U4BN9UwvpI
 WZq/rzboEA1D4vTxchbBlzEkQESYRNsqN/UWKIjeLl29hbOAGNnBncN
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX602IJaFIbh99
 NW7HTOSzCTE5UioNFr4jOQ0xFuqwdNQTrY72RAapkO3QzXA9T/qHnPEDd42QbKx564PspCTTn+q
 L+XJld98v58WPQyuAwkLAWjVTXhIhhc=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abbb8ae cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pei3ZxCQ2QdDqwo0ZtEA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX6dgmBeY5NTsj
 3h/gBZ4s3PmqAugekpLxaKUrNzVh+tmDow9WrfvOlK1FnlbFHn8F0weGtDGL2HpLfA8Yjf65icW
 zsVigORsDv6WpisVs3YHanwku3PeaMbYYtXnAIudNAbBEMoGx4/sqaBpiSe40lEHg6gYkZIf1u7
 YeJJ8XwjgYMvx1/Q++3aWtqVnfLJ6wNuzhAu2ypvfBIFeXw0lpBMHyOC1U424Rh1l+NZEznzdMy
 pfmP4dEJIzLDt44RI7J+tb2a0E0JghCm/AIhcEQQ9/lxv3fW3xhCVLlGDRcxu7+NVTgM5lDwiI9
 X4hn+yizbBxoV16+KL/+n+bT1/5a/k3kAsOQEQPp7jm6+iRX5EKIOZMB1CCwtTE/YzDsnPzHZGl
 uhGumZSTOoxB6rga6RlPhOTLnsCeg3jQE9OqwgyVWhM8ONFJtyPqSlGeTj/f3zdgVTmkJDk2sFt
 Bzjhl/EMgtz75R8x/5A==
X-Proofpoint-GUID: jXF2G8wXsN6_GLQ_F6ucsX7DuRkmWWj3
X-Proofpoint-ORIG-GUID: jXF2G8wXsN6_GLQ_F6ucsX7DuRkmWWj3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for
hamoa-pmic. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
index 7fad4a9b92fa..6b17d568188e 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
@@ -426,6 +426,17 @@ pm8550_temp_alarm: temp-alarm@a00 {
 			io-channel-names = "thermal";
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8550-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm8550_gpios: gpio@8800 {
 			compatible = "qcom,pm8550-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
@@ -674,6 +685,17 @@ smb2360_0: pmic@7 {
 
 		status = "disabled";
 
+		sensor@4700 {
+			compatible = "qcom,smb2360-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		smb2360_0_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2360-eusb2-repeater";
 			reg = <0xfd00>;

-- 
2.43.0

