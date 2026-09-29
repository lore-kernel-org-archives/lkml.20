Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A685409295
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790661670; cv=none; b=rxCMsStazllIPmR2Zd11Ll8jLJ0yvgGyBr/IvRTCov+sUyypFQ0dcRMqEHiyay7SwLG1wV373MkP9vVKFB/UzYAfvB63Cr0mW6ojgN3EdFEwnPU1iJIcq1Hrh+gx6lw7N95EKtXcUdQGXY9JmwSJKRVhGv2tSOVJF0fJfbsBmNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790661670; c=relaxed/simple;
	bh=TQMoOx7LRStcYqRtPZiksVgN+aWBh0cBp7N3YqiOc5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VA6H66G9QhQaXXZhTIiwgtaXJWjVhaM9qZ8xN3YYy1JcGHceX+1aDVWIfqXbIj6Wc7/Vf2UgVbXpbPAAM2qNcJXJJ+njK9vNC4tQWqkpCmTecdA4lx+tzQRPeMHuEACsfOY3a9udu48M0xxpiUKjM3pdeQgaQG1LGXbVVD2nags=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BZyN1g4X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JuDJhbK3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BZyN1g4X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JuDJhbK3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47fuS4052905
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zDVxaWUQExbSZqDtvncCwvGw4iki0k/Nc32cFQcnXL4=; b=BZyN1g4XsICfxyih
	uYTeck0yaRPyEtV0IWWnDvVLuU72IEneoz+wIo1JAVdAFeems1l203RfCXSFfSys
	MDB+Gv3Os1hUf/in4OG0Mv1d3rO+0xAi8eAxtUIILlHpp+E894E6qKGRWefhcKIT
	UBdq2Ufje9/QApEFxAwUMRh/iFGRlsSH+3A1TnYOrHkBvq4iCxc3gAun/E7vJGGv
	0qQgDzIzlc1pQtCMvnEL8B0wYaUAjvcFrL1EtnCtaNKUN03CZaQDB54YS8xP8qGP
	6WtXOaL1Z/rhsgwem61Wmngiyq5P4kdkFL4SYDr2SQUqJxN3Z522P1gTWZqBZr/d
	v6UpWw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h05yxgcea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:01:07 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb48f41343aso388226a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790661666; x=1791266466; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zDVxaWUQExbSZqDtvncCwvGw4iki0k/Nc32cFQcnXL4=;
        b=JuDJhbK3ZBmmsynbnVvAEgca2r1w0JMDltO2+ICk5ShOJTo94sujffLte4A4TtHXta
         lbQ7AY57OpBrcc4jPYSjSMYODRKtSd6LlQ5FuY0wwnT2hZJxmYdVmXUN5JZVrqZjwUXV
         GdIt8mdWbax90U+MKn8JSrSzmHDiKKVhquqkUAdkORtdUwj98B+goO8o41Yr1VEg+AVI
         mKYgQFfl6Qjs+vGPbSWqD2uyINlSUCKte6X0jR+xHr9dxnz5lT4tZsn9UGGYV9eWhIja
         PDKzC+a9vRXNLGvRDXKtoTyEOcoZS8aHhyqgs6TpeVRD0bJNx6jqW14O4D4QCCTbz3UI
         LYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790661666; x=1791266466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zDVxaWUQExbSZqDtvncCwvGw4iki0k/Nc32cFQcnXL4=;
        b=SfnCtSvlpQNJZ66ulTksmmiUYDQmGx9V9ErKqoe/QlfzoeOHfhz3yXC3vLD/wQpg7E
         0rj7mnFSHq0zmqZcB+ah2avOqugcKdnDKSWn1j2kBYLybN3PSu6+DFQ9lKMm20TzDTGe
         KSdQ4hn3xD96cHOwuEe+P3j4ow9Eq+Aiyb4p2YTylZXpF2k+sCwtC0gzaHzCxwdWbt8s
         aYabbHklr1snHWBEgzCn3zFTo2/N9T5sj8sO36h1pLfZCv8UUHxNOQO6S2fzt3lbwQwm
         NydIZ1BKwmie/3+D+uUJxsJ4hZbHk3dpCAuKbjOsldC79zqNsA8TWw7v1DeDTUjOoTH6
         u4wQ==
X-Forwarded-Encrypted: i=1; AKwUvBxG5jCv51iJsXAWwk0kfJm7/2MA7ktS3u0ygf5l0d++UkfRkOTt4f/zkA3Q5vvgh2LQiEUelrRukgVIeXw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI47mDw6BvD8QMYFj9UIkaXnX64AcmcXLKm2Q+SINf6Uj8faGKh
	bOtupUSfdN53jyS1KMKCR6dstmm3M0uCx8cDWyAz6e02jW5qnEEnsmRRpr2bfwjsb9qp4FPPI/d
	0HKxvt46LRUTyFqdjDNjflulsnrg3oYnmcWpEqSNWpdNY3xzd3onZen7WAlhtAjUJVvk=
X-Gm-Gg: AYBFou3lYe6gQtpx6Ad0nuB7eQd6yx78rNpK95Yof9bAsOITEKNAgnaFq/3bdIevlw3
	kWRYrNsDqrZv3KTqEZbGS+IAFaDUFJa2QXaJXAhnJcpgg1iXaLmvCq8d75EdmoOLUxKExMhG8tk
	uvZt15c1cguMbZIZLJFf1suKuM9dFNTKYLj5Eul8irFbMAekg27vNHzesWx+9bk9hRWd0RITrnf
	vrkvBbNFUlJnOVeHreo25wQ4N1k7/eQvCNtRuRaMlKvJk2N/sH/nJ5JYo/UInUtpWXMoQvnEKMs
	Cbvmh3m9CV7phHiftGQZbmQZfBSuvsgzHX3qrfle+yJyf+z6Mm9wkwiTT4iVxPagzEEV7srTw3a
	SbUeqxPnxsydlr5i72yO93efeYBggUcCCaUVrE1rBsGlS9MP28yvfp8l/tWZByNVCpJj84EZaau
	NXHaOLtS6swg==
X-Received: by 2002:a17:90b:4fc8:b0:3a0:c85a:ee12 with SMTP id 98e67ed59e1d1-3a49c1e7becmr794581a91.41.1790661663738;
        Mon, 28 Sep 2026 23:01:03 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc8:b0:3a0:c85a:ee12 with SMTP id 98e67ed59e1d1-3a49c1e7becmr794415a91.41.1790661660279;
        Mon, 28 Sep 2026 23:01:00 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4985ff0f2sm3383588a91.8.2026.09.28.23.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:00:59 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 23:00:37 -0700
Subject: [PATCH v17 11/11] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-kaanapali-camss-v17-11-dcf3fd37f76c@oss.qualcomm.com>
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
In-Reply-To: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyMyBTYWx0ZWRfX95GbCUtjJvzi
 T0z0q0mojNj75PkkzvGo0oxLU5qW5dGz4P9rYQ6Y2A45eoQb6ZFYJ0LfxJhu9iEtsoxN/eNTiNd
 9A5N9m0nZnvZ7BFr8Uubc+9hG48B5Fw=
X-Proofpoint-GUID: KR5-C-AkzujWC0gFxrTez0LE1LVCoBjy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyMyBTYWx0ZWRfX3LEa9+mL2UQ0
 CStRQgzyyBpZOYCT5YCnF8jNF8AGsd68mhVPh5Oz4pOTM9ZysFpYGB/CdbYVyMo/oYC4l5+x8Nt
 eTnAxblpi1lvBI6+UcU2N6RaE/fhsXW8Q5aX3OWEZblOomBAkj24gizZSDWnhfftIgSI08EbJef
 jJw8oVskjgtBjcA1dKUCe0Y6SOXTYYfGxeJbepTuGlSi4gR17aAWhBL0V7ufUqYzPtBHua5CYyc
 DItoBCn4FbD2QYYvirihFbcGqIFJ8FJPFi12ET1miIZUonwWWyzOrLcMARwhwsoumu77ZzMDqZQ
 wlIM2J1SeK4tKtSQpyWcY1nhOqC2Nfo3zRIIRlQI25FR4dgWwoFTHlCj6wDHWQ1YHYr+TqqFkmz
 SjYd+CAX9xfQCEfe7EnkyfuXvDIOymwhjVbdqUBp8ul6EiCBfdjQNe/tEYNpFQTW47Zry6QElnz
 snA5uwZnERccQYYxhOQ==
X-Proofpoint-ORIG-GUID: KR5-C-AkzujWC0gFxrTez0LE1LVCoBjy
X-Authority-Analysis: v=2.4 cv=SaFi5fRu c=1 sm=1 tr=0 ts=6abb5423 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4Dwyees-64n8yO_2jeYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290023

Add TLMM pinctrl states for the camera master clock GPIOs on Kaanapali so
camera sensor nodes can select the proper MCLK pin functions when enabled.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index c19945bc438e..bbcd5a622f0b 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4568,6 +4568,62 @@ tlmm: pinctrl@f100000 {
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
+			cam_mclk3_default: cam_mclk3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam_mclk4-default-state {
+				pins = "gpio93";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk5_default: cam_mclk5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk6_default: cam_mclk6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk7_default: cam_mclk7-default-state {
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

