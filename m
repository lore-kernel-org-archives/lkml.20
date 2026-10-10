Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00294AF9F6
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648100; cv=none; b=MTnANXhXI4nLCudd6C5dbvPBgiM/G6ORIRFZIVuzLRe+bCO0Y7c5BLaeqUeMSoh6/tHHUCvxkKdqu0VF2FlcYaoXuV2dZM4pF1VF0MLLkGa0foikMeVH7HzWqVTCNxGtv84o9CKDVRP7lxxaLmXqKf+4geM482yUlpTqsLEQdtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648100; c=relaxed/simple;
	bh=pxHyg/jfZ7eJ6o8uVk7w4Q38gLsjYlwkLC67UQT1/wQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V4zXhGdBCBTs5vkmfUAvMclw0725/2/DkhkGCi9yynwsyF7bHQKqND3YzTc4bi1jx0edm57/TPul/VnZD1bxaH4ihI7ICpDoiatNs5qPlqQBQIWGWJ1V/PQJwXLehjhA7wmTognmpOVIQNf3MhljOnLdhCaBDujwrEJK5WBZyW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h8i/hsyI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brWy0h+X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h8i/hsyI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brWy0h+X"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69AFPkdA796234
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hnv0qmK8/nEJAwt/Str/SSMG0YhjSM3cMdd5FG5Ong8=; b=h8i/hsyInNhm3QPh
	nh3+34tnMSsNLNX6z6DzVq28hObujikHmP1pUDbbXSt0C98tb5jdWUqawLo+gtqF
	b/zwoquChDDL9R8PeJLjuuZG0umPyJnAc+wCqQWvVXNmthbG9aWBiSF+02VtxS59
	SLvfkBMvjLjegTOl6ABVTNft+GcdDr/0AJKDT5OfWwm0E5RolXRhxMRzptDeeL9u
	aZeL7e716BKuvpR5B/furPqQh863mPFKENHjM0qmWWvpHexFXaOcb636gQtYFSQl
	35AOMFJw3YTJf9p0LlL5L0REBVg4QuD1UqH3SqlZ8VLjKHmmIVnAK/x9W2nYg7Ub
	F22+Yg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7aqmsr2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:01:36 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34ef0362d95so1802102eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 09:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791648095; x=1792252895; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hnv0qmK8/nEJAwt/Str/SSMG0YhjSM3cMdd5FG5Ong8=;
        b=brWy0h+XT9Nla6JNaRxd14L02c9stJUXkMIk/l7NxJiD69BFK7Q4oXnCx6ftC/sCRH
         gsOXi3hrQsIfyKJL+MD4vhq41CObRv2MHqAXmmj/iVEhHEtALqKHRyVU51LvJw1iauso
         NKjL9bmG3pA/hcSfKuBaSUsWquTiYKQ5h+ldKdlR5rguHqUpOZXrlgZrws+ZIgHvsyJy
         tnqZfeFQgU2YCvMoV1wsLuRtWYFLrIzQVCC1Q3dPfjdVt1C95DOB2P1cgu5+V17Cndu9
         rh54bouK+0E74WGpBMjr17aZ8K5DoAqqYvYnQHQLJzV3PpJmIdvg7lo1SYkdDysS+Fat
         tt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648095; x=1792252895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnv0qmK8/nEJAwt/Str/SSMG0YhjSM3cMdd5FG5Ong8=;
        b=oQB0Xg0wSdLD3nZzYz/0xRB2BYWb/JQyQZK3je8qjtruY7c0lAfA8NaPS2S0qxOjQv
         Z00p2BgxHkPblLOFifZuWNWKoJWDM1MQOnvo9xovwYDGG1kJgN2afdBlzn3XaPiGzYKC
         NyGhRoILlV3QWahmfStKB7bplBIJAeH6iEQVTQO8iupGWr7noFj5JQvcPXGIZapUmeCg
         B3DCR5bnHi7BdZXr7k65wB7GzU0QAPcmMZXIKKi3tIUAHqTJJVXbM2ajtuUrpUBg8efc
         B0bu0KunlLVCq4g1ehgFIs8eDnsfOsxba2QqLO53YWl9ROOzANsVkfDPD6O7xgyCNmPM
         JKOQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6AOcL0uHq5ysusJukGIpACfc0o6m386uwyCyMvJD5mrSdgFgruGdFO/czq7QYy6IPVTjRVKyhhTxzbac=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLDAeBuhpGBoNn0o8jNy60TiWr7syY4GVoTXZYa9vaV/lvFzyM
	+gCm9UCD1STPb73WnMRwpHTccrfvf773/k0uVFpcv317g5UB9w5FIy17kVMCL3248NS+hRI0WVE
	RtTbJ3E2X7L46+w7pgbwjACNzSJm+dIbA9SUB8bs+ooBoNwbHbQU2BgM4VKDd0GMwAY0=
X-Gm-Gg: AYBFou1OWcGsEC40LX2PhsU90TnwfywmR7yXPQyqu+vhvBHqb8ysSHFKwKVWSDqZ5tT
	o9HCXzr1e/hRvF7UeuXXXYdAj/xfO9+E4SbYb0lKvdHCi7owsmLzZoycxfIZj6xZFuQsQnjKPwC
	g+UVRgz5fcZQmd9jbF5+6zE+F+Jx2otmUHiN22CHWun6VbOhBHlllOTkzJb3p09X0qB3LIdpYx7
	qmGSAGUo2REP1HzWrUVUv2MSCNcTa2VI2lMRVcakuFJWeqeCA09VTS/cc5qz3nLEqgITfx/ol7x
	20+2F/HiS0zAICCXhKJoVsJPKbQyjeEX0/dgkwsAmza0XTlG/LvSAqmbrNuHwLEjkQDntAnbY/i
	8OIpzjhSHRIPuADgPNv95GcqCu+25tDD3gt+346vZIN3YMtXdvDGECq1m+bCXP1suyv/oaPS3GZ
	hnqpfmzzv34g==
X-Received: by 2002:a05:7023:a56:10b0:143:46a6:b01f with SMTP id a92af1059eb24-16a6203dcf1mr6420845c88.31.1791648095080;
        Sat, 10 Oct 2026 09:01:35 -0700 (PDT)
X-Received: by 2002:a05:7023:a56:10b0:143:46a6:b01f with SMTP id a92af1059eb24-16a6203dcf1mr6420791c88.31.1791648094402;
        Sat, 10 Oct 2026 09:01:34 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6be0sm30786022c88.13.2026.10.10.09.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:01:34 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 09:01:17 -0700
Subject: [PATCH v20 12/13] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-kaanapali-camss-v20-12-63e98ce9ac0c@oss.qualcomm.com>
References: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
In-Reply-To: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX+fcxnwiyu+RI
 r8DgtMC74X6oNMNl4xjRd8Tvbupi6qx86033oLfK5UBukeTo6Zoyo9mAwYgERvkYiXC7KVDfLCD
 fCW0asahhZQYXIOjRVnrrYMjohmxk68=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX6nQAVnkm5dBW
 /bQMW3gW52v+JnEkp4Dr9Xre4vW5G3LN9QLqRL0feihcEj7BKCaGFgt5VDd94hsxAyRab+luVis
 O7RhFdV1BiiONypp69sY7iYZZArVIVI7BnQ9KINZM0+gShu18ADMerbGlxz6yYOt4m1sdKdUZcX
 CWTc7wkhslYrV4Ax5samp+Snqmb9eTBT96dqpxx+2gTKYDmvgJlo/QlDGwNW5S/TdFq65VJzzJ4
 oce3qYKa1zOTMuKUIwJCc5CJCMlfXYZWX+i10Fy8I1ChgIKbFmvgO5yUKIdrteyem9+oEIv2g94
 8AnGN9Bdn3Ym+mV+RtOTWn4Tec3R5fUB1euHOaM3sVYNA0/lh+alFHhZ29Z4s5ObDvD29EgfNOQ
 NtAIenJxS9SKovFVnImqkRoP50B6CS4OEsJL27c9PK+iLhcR4e7/xE2GKFQGMop6Xa8l/lYW/nh
 BT9gkAMWJs2pecmLcxg==
X-Authority-Analysis: v=2.4 cv=Uq32pOwB c=1 sm=1 tr=0 ts=6aca6160 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4Dwyees-64n8yO_2jeYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Bc2uQFG_6VbyL5ER4SIPUM-t3ygUvftx
X-Proofpoint-GUID: Bc2uQFG_6VbyL5ER4SIPUM-t3ygUvftx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100063

Add TLMM pinctrl states for the camera master clock GPIOs on Kaanapali so
camera sensor nodes can select the proper MCLK pin functions when enabled.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 62f02bff0227..63fae1bbfe66 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4648,6 +4648,62 @@ tlmm: pinctrl@f100000 {
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

