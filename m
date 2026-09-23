Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5937453A57
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161483; cv=none; b=hhTfUwOb9jiKfaHFAe5+iIYEeUTZDVXw9nzIUXfFVkCMmlX9jreifN5OhHuiKHuiuidtt3v9J5G/i0TsKfNAI7CUJOTxEHxn1UxnJEyQlCHUYwmrmPOtWmEk8wJ1xADAMTk3e8mraTA8njDCmBJOsaaz2Z3tVmYWzz+rV6AhIi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161483; c=relaxed/simple;
	bh=9M1nPTo1CIuFQ1/rdy0C4LqeSuxLcRZilyOPwnHrM6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xfv0WP4b1luKPWjJiHHM80qZikSpPC4xh58wxkzrskhZ2mqKllRyQbTOY8CFEIt704g7gLyI+oNpsphCL8pde9HmLtezVqzV+PYkVFRBJnCCyh8k0VeeAKUR9d6o9wwZLNa6vdXamyT6oMIf14/u1wBUaDJuPibypeKZyI13PjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jhgMZnWf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SahbFupt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jhgMZnWf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SahbFupt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2w6O3409953
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aWIsVlhgYhz5NzYHzdTprwTk+dhscOHAulUPICmnuJE=; b=jhgMZnWfKdBgbuEa
	WiLefe4pJbuEcWeFpeqqbsJ1aKFbcbZCbF4ITbSnbyKI6qyE4HO6maTDe6fO6oMx
	bBaqcgMc8iJHzFFlQww5iVLuPX/fUgP+ismfA1/HjUhmIqZMgirbrTMtWI6+4yAl
	JxKELsduWnwYTGZpou3jrDNP8Rxu9qjU5KGSu48axOmwggvWuDy5/V6HLFjpEXvs
	wojAdgAjJh3XKMGXCZNegvWqNOqiqrjE4IT79+bM+SeXTu8nlGsHS0NivVMMQDy1
	Jr8E9LmG+bszbKJfxMeQ+U+uKchf9gsl/RuJJKfNQhhcAtMIMcazuOQHpi/DFvvu
	2DD5Rg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux86415r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:04:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33310847fcaso1359779eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161473; x=1790766273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWIsVlhgYhz5NzYHzdTprwTk+dhscOHAulUPICmnuJE=;
        b=SahbFuptsImaRJHqGX5S2NT/oV2Sfmw8d83bLtdMSALo6uBLFqZ9KyT2yJ4hxi2aIk
         ANqzr6fOQ6l9JdQiwcfG6olQ7XCZ4d0JZ+JHpuL6LClkrzKIu3yg3HqjyTYFmZw/hwiq
         NB3Y5xeLUxjCXhEACrTP3+XA45GR7eEndbFpum29b4ixYA9SwAFa7qVVjEJcepcrAaaB
         +gzSL1UDQT7VPNdAeiCIAKkBK/zvf3VZVhO8cwqexbK4tc92U4ucR5QYO4UeXjfWa+E1
         0FCCifwcEZNjqMwoqtu2Bc1/NzVxbpqlejjX357UoeBjPM+JXEAdcNIuznlmnDnwzpRC
         OfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161473; x=1790766273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aWIsVlhgYhz5NzYHzdTprwTk+dhscOHAulUPICmnuJE=;
        b=sLD24DrwGV7HgsBWrDbhCFWPz+hK4d4zTN7qCBvhF+EbFKFaYy05TUzVlj9WhKKzBf
         kvAK9wndv7Y7IvgQIgVSfFyjXhWxiaFwCtY+mEtvUITTwvcvkeCtIoW2ku1NkW7JD8Rf
         lYOTOW3dQJ9eX2WV8UuiM0WH1Mc/Blchydfrbsrt0t4hpZK+AGYF475NmPjH9Oit8ndV
         QjjbZTyHpCNhvOVyOIiEiYF5tupyV4uhTZ0oKsHDVKGX3EC6nxLipA9j7o4RvX7miDwC
         vTRgTV4DiP6So6+/OG2KCyzt7ThWqZkypo4MHDB98kgoFt9M1bXeX38gZMxd4/e9QwPE
         MRlw==
X-Forwarded-Encrypted: i=1; AKwUvBwd+t4eR70QHFxSS3aytHnob0vCXbKXsVZAxABgf1XQp+mFdxLMbu8TSVWjwoO8BHy31jbjp4CrJv5Ts3Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lVfoQ1zZ/CvTRQp7wlXl3Wp59wR48spkh41lzKwfiFyvPIPI/1
	eF1Wp403abkehSXqUCHIRN56Fxst/6ARXTGg5/ij43hCEmxAa/mTsOwrga+C/Dz8MHhKysHbfR9
	CEQIGpPlvNAhuc5m3FrXht5ovl0E44V9Pbmob6VGjs6kToRKOxpxyq78FE8iCDhHp9nM=
X-Gm-Gg: AYBFou21tKqFLv49yO+l5xGH6o3Qj5azKDhIxzhx796+yA0BuoKNG0Ya9AjTgOESozL
	Kn+HnAeQG31VMec1LvLkkEJYBoXZgcR3fZFXd/PQSShgRykqCXPepuMDTTi5uv5rBaWwLaC/EmG
	PZd4lhp070jORxynxFwKErYdVHYQDwbpnilyPRKplUAFiRhxBh9BsjElda+pnxbiiAVBWKzKqCk
	2nQsDm3QZlPdSk497tOwp1TGquXYeQT4Y402dGbQaHO9Br4dMXOnnVdQSW2Es+XXu4xolnpXFbW
	Zax0rVrsPZAHFOvTNEEAGtHNiPQ4UWmleoRSjUDTVRbtfqGTTNkdmZQAOX8Ss7QZA4Kamlduyef
	MxiTZV38S7w3xYXZvy25n8OefpDtpXw==
X-Received: by 2002:a05:7301:2501:b0:33b:c29a:713b with SMTP id 5a478bee46e88-33e8c72bfdcmr2190350eec.18.1790161473120;
        Wed, 23 Sep 2026 04:04:33 -0700 (PDT)
X-Received: by 2002:a05:7301:2501:b0:33b:c29a:713b with SMTP id 5a478bee46e88-33e8c72bfdcmr2190276eec.18.1790161471676;
        Wed, 23 Sep 2026 04:04:31 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625825asm5905377eec.13.2026.09.23.04.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:04:31 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:32:40 +0530
Subject: [PATCH RFC 09/15] arm64: dts: qcom: hawi: Add camera MCLK pinctrl
 for Hawi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-maili-camss-v1-9-cbbb42e534ef@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790161355; l=2026;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=xx492fU1yfGENWkKCTE6TQKz2zLJfMohArToVhMtg3M=;
 b=oJibmOSvDBR7RKqtqAsg/gVA06lp7FsF23AJ1+2gpdaj0hazu2yA+nnRCQNxN5e5TABgvFCjx
 SOzagjdVWK+DUkD7omJ+Cmcc6PHJy3b2qgfWdsxBDdPXrxafn3MhN9S
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: lm5XNFlxfd6iTZ2kkwHgdrnKK-i-YnNu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX0/L5ZD4vA4/+
 mEASvHxSGVelgCmsSx73+76ucDn8WmFmPpo3XWgTyGCkYh/JhKqj2+yzvkLer+9RK9tXCz2P3lF
 rI1nxVY1ztN/08OkFftlKTtitnmn1D0=
X-Proofpoint-ORIG-GUID: lm5XNFlxfd6iTZ2kkwHgdrnKK-i-YnNu
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab3b242 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=LoLYTzTP-NOuDkKnZLgA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX3SiJBO5y0K47
 E2tfCj2pg+pZLIbAiIUCpZTtnL4xXmwM6LwSOzF9XIcGNN9K9QEZSccafwolp/aecu0iFQb0Nqg
 ORyo7RqTvZdDtW/rtNB4ur6r9ytNzgaxbjN0tqIGdZL3vaZP6Hg8uTIb6eNl6zBx4MpqK79emrh
 YZ+WwmiHpMxE2tqPpSrpGlujQF+8mbVGz9NmkrTME0eKzOvmWRy0B1nc7AaxZ9gg68iHDif/Wsr
 1hILTIf7/eWbmJ9ZBrXtMfBktgarNNHGVE7H7CHUOeKPCHGMlQVQitsnv5Dvr7Mb7mJROQUmH7/
 pb/nvB+Srju5FqY6lwHYgh40qKcyo3G9eTqzJy8Ha8jjFGvSJdxi28nUrz/z8EblniU9EDtE/GT
 pSuxcRLB3X39irxp99wpU47xPa4/2HhMCYr5VQWDC5MurAkggcjE+Jc8klzOhlmz6NfrA7B78Qx
 D5+q+WGGLMD37oc5Alg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230044

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Define pinctrl definitions to enable camera master clocks on Hawi.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi.dtsi | 56 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index bc7adf10bd4653cf50527a1ebb38518c66dba900..85a9faad59fc0387ebf4d7565fd08dd7acce1f26 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -4712,6 +4712,62 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam1_default: cam1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam2_default: cam2-default-state {
+				pins = "gpio91";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam3_default: cam3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam4_default: cam4-default-state {
+				pins = "gpio93";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam5_default: cam5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam6_default: cam6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam7_default: cam7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_0_default: cci0-0-default-state {
 				pins = "gpio109", "gpio110";
 				function = "cci_i2c0";

-- 
2.34.1

