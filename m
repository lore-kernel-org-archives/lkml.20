Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8B5474258
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250095; cv=none; b=mROrOxBfA5rLEKIttiDYBVhBJrAu4CgmkaB+CFcbiP6epV89ceiGYsLatAp2IfJvrQ39Kb2tnFSidTqPGr1l4qoG0oRQW1PtOLxLIJHV8BfHXpdAty+SN/9hoXu03Ct5k5VI3g8UDEVXSJFLnVqQLgJ0oNlIZ9kOwvSu8UEckZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250095; c=relaxed/simple;
	bh=4SWTpgyjUiHaL+RbPt3tQXyxf+WultQnhEb9/hxXaYk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q7y4kn4Dgsq/0RcbnxOFYXKm+Gyw75R6jKOjWrjyVA0kpqnWOZ/gGRQnopDnVtz6XpLMRJAU00rbdR+y/nAWunaAxhRc2ejQvfJTqx1dFYQHKEwYIeWB8gB2k3yGujcRTtoVCiM9NOezgUuqXoBbV+xHo/N1PfaXhKqei7mIPKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7dTiL4z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I1VEBmDy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7dTiL4z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I1VEBmDy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179N0s1282750
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 08:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p/OJP7iD7lovDK/OYZmxbRShO19pjRQJK22i3lLe+Es=; b=T7dTiL4zTKYx5mwx
	OGqlW14DUCz0tO1PZMR6nwv6En3ddf4F/Y+uCI7mxDO92C5/MGTPoTXGyFXU4jyU
	Jj2A9FVu20XjKzySpGN+UZzPz2hbZZbVt5zWG55XVCYIAIdQ3zR2xWTxKpNZ6cPo
	4iU9g84Z2MNozb4Sm0HCUE/ViU7cWU36LzEJdmL6oHfrBhXqPBZ9zUnNoiCFpOiU
	E3ruQjYZIGZ+gO6ASe/HbMgIMyrfEqoSb5Si1Vau1Vo7T+644ABnPAMQlFoo3G5S
	R5jqzwIskMYHvVqdN7HOeYCglv36hEXl+n0KkMIdGjb6hnxheZYKf2BdOpmij55D
	xHqP9Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndx9cmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:08:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ef13b61bcso920219285a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250092; x=1788854892; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/OJP7iD7lovDK/OYZmxbRShO19pjRQJK22i3lLe+Es=;
        b=I1VEBmDy3+1SF9iRwoFjnUmcC9Je1on5o/7be2ixmkBilr5Qq3iRR5pdsqkuxF4fTD
         N4fyhWbonWNKLst7eysU8ThoX0F+cUP0SLkC6PCQEnzUn/Cz9mCIGmck5ZH6CC1DAUEx
         U+ZrEUAWspPKh5q4XRcHDtUMMlqTMwTjmeTaM/0KiitwkDlBuznMHVZlDIqgFyRnizK8
         Con+OFe9yASwiJ4oYqfrn49wmXqJMU12z37/adtVyHZfpCas1eoDDvv5uHcOpW3BWtk1
         7sx4iKXRxKsGWGp6mNkTCrFXhuMwIv8FVEyb6FeNXj8IYorDW4yBR7z3rbzbQusYtCD6
         tvhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250092; x=1788854892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/OJP7iD7lovDK/OYZmxbRShO19pjRQJK22i3lLe+Es=;
        b=W65d+iARuHf8RCkSrehI6LJlwows2dkldkpmrYUklys0kgnEiLSblWdVQGPLY1riyb
         UAGoB0Y6RSkZkOOLczsfysFbqyQsrRmLhgRJqtyXrNFMqayCOequq0RUFnIKH2jRqhnc
         OgaYsdUesHx0drE4julRGItSxAl3QTey2fBmxOH5Xf4J+xoQWVZEM+Gp5oYAH7GGA7Z1
         vgwMXQjWh8BXvOmqo0XDcTsFXa6ZcuFxi3Wsf4LVEeZ5OgzalJD/zK9t6ZtQYTDVrm3U
         /AJ2FSqWS38qMVdQs8LAsSqiV/qkdZm4dBcyn6cUahP7KExuHCMM1DyudgIaDHMvYb5q
         nqdA==
X-Forwarded-Encrypted: i=1; AHgh+RpHlWS+/w0fpQJPZ0wVTnpIMfkhQ2YUKkwWJz5rPvSNWreh4Zc7OLOk9pE+mnKY59HNE14mG7A/nk5LPdg=@vger.kernel.org
X-Gm-Message-State: AFuF++lR19i4i9/hUIrm+vynnQyrma+BBW0TPgX5jJhrMuWKjXcmVi6t
	e5kit9zDFriPMvmq2z3inktsAvC+ureFFTa0cwoKwkfVDv5ujtnm/gonhvdDXgbsQzOXXAANYlv
	ytJqu+FMzsSov5jaC8h9C84xfbfB2CLlRy1rQOo3oI+sgOC8jDBNW7Ntfx/kt6FwyMT4=
X-Gm-Gg: AR+sD11KeGjh7e/PtHLkRF8hOR6Rr4FlYaytS0+I1CbzwK4YEGl/hLnA7cOW0NVO4pv
	+UHUrSunwSDjBxMETRXRFSlMVgguxWmVBztlRwxycfkqfB7Z3vpt7QlTQB0ZLLSZjahFHwAUIQs
	f0mu3Vo4e9Mnz0vNrELSrsjJCoUZnMWSfcEs+ncJ9uZwR/Dpggqmk964rDl8SDj5W93sMnUUea2
	1yftsimnpFTydDw0HQDhqYDZtAiUAVAFjINUSYuwTzgaySUcDx9eKtPqwegkgBrEpuKylYkzcbF
	bnApuMN1qlNhH7+bvEpIelgIy3SDXSsfg3E64EzryJUDTtmCVku8rfrSJ52Kl1VwTkxHNLwT7Ku
	Pcl0bj5xI
X-Received: by 2002:a05:620a:6289:b0:937:65d:d89e with SMTP id af79cd13be357-9391378427emr4316705585a.3.1788250090657;
        Tue, 01 Sep 2026 01:08:10 -0700 (PDT)
X-Received: by 2002:a05:620a:6289:b0:937:65d:d89e with SMTP id af79cd13be357-9391378427emr4316696585a.3.1788250089967;
        Tue, 01 Sep 2026 01:08:09 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:08:09 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:07:11 +0300
Subject: [PATCH v2 14/16] arm64: dts: qcom: x1-microsoft-denali: Mark the
 EC reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-14-f4ab7e4bb75d@oss.qualcomm.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1043;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=4SWTpgyjUiHaL+RbPt3tQXyxf+WultQnhEb9/hxXaYk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloe4j2NMElSLSKG8HNZ2lJmG0SghLoUprtGMW
 Xcyl5Uqw7+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHuAAKCRAbX0TJAJUV
 VrDbEAC/ruMzELke/b9YL0JOLEDL5T9u7r9FIlHHNq/11MELV39cWqVfJbKYaGCZyH7r9fe0KN4
 brN+0S6evcw5b5Ema6TH4IMlt1ReoWAyAwdMoio9mXpyTb2gIIU/H5GBxBUrgO7XKlaigkghaWG
 bPao06vM6jyki9+JYHDN3OLzlnmsM/HpfuEyP4pURBAl4B04rNQZBwooX5HbARxctqZFwzs++KI
 +MgjOHqABx0u9D7DUOU3WWCqoxABRgKNrjYUcR92dydmOBln6f9J6mFGkA/ZI1r/9fBjn38rHdh
 pJrsJmpKl8fbP9t1GfdiIce3l6BscDsdmkwRwcu7CbpOtfBhz5+1UIpUiI/BOAKD8jQ2unSLRsY
 x9ZCtdEA5lWSjoyYIwXZ0D5s8H3py5K6ocqXQeCuLU8qX+aQS2W4MZstblKMZEpmO/KGk5wKZHd
 Si0KFUvD3CRd8wIx7dQjmSpJqKli6DPr798irOh+soBfitmHm06yRLfbEAAUfo1FiKI0UUpr7kH
 m/YDqycVYBlQ3U+E9HbF+BdRptqZhuo4w0PC1WoW6KOvUFzg44e5CBC09vUSsj7VYIodsb11D0b
 Fbt70r3L7CbfFyxnO+1hJQz8VblwiCp+28uHNjV3OOetguPb6FgxtqwN/F4XH9MI9nenwGwUjVb
 rSKKyIDAQ/l35Iw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: fJsIkX5ydKKlYK2TLiNXf5TED3lI8czy
X-Proofpoint-ORIG-GUID: fJsIkX5ydKKlYK2TLiNXf5TED3lI8czy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX8sbvCzy2DXsN
 0ou1GHc+xcouH55lwv48+TrCoy5vBNT8iSqv0Tc9aWYqOv3mwabmtAc4Q808/1RgU4mfJTrfAU6
 B0SBcaQ1bLZh7Xk9Z7ktDI2Mke7NFH4=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a9687ec cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX9CYPtNeK7lVT
 s6v5rnkH/ootRaSyxzqaUUHqVWIJ+JAXM8zfLzFaAvDjMdHJn32TEwu5NsWjJOHLSgle3Sl+f1C
 y/2IyjYJUbXqkw6+29OcSBZCyekrgkAu4TtLMtRRZsQHJ3yoktdX/UbkHapJEASeB2PYEkziVoB
 ukBqRmTnrJGvxaPGHjXodM0hqAJioN+OikYp8wh8TMcJ7lB5krWwqVZl7caJMOrfctsg8fl+uIE
 Qf5FPIlyx2OyDBJN6nxBpnDzGNliiUPLwpEM0nHfh/THQ050S+uDNWDGTok0TFXN8OcnsHfQiMH
 1jGooasdujDgDIyzGazTJxAejh8U2iZslY0kA21lIfCKjNtQ2p6cBrmEifIMePZLhwjlqLpdzqI
 QIe7dXABALaAcvjC2AG35LeziPE76UKJ/YSRkMcgq+SylV+5EGBH7VfXSrZ4fSqBTBWPCcAGcgC
 IYbfbyGYvq3KbalfSyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010071

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: 0d72ccaa1e84 ("arm64: dts: qcom: Add support for X1-based Surface Pro 11")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
index ce7d958ca687..ef2684e23a09 100644
--- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
@@ -1109,6 +1109,7 @@ right_spkr: speaker@0,1 {
 
 &tlmm {
 	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	hall_int_n_default: hall-int-n-state {

-- 
2.54.0

