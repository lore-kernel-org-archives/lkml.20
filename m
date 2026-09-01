Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965CA46DFF4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250942; cv=none; b=GhXkqh6IzG5T811YSYxfgQSXXaFLa9ZJwbrL4kHnHbB6iyqj9HqxaBMZWXANJiAQH5oWrUgKfDnX6beKYop/gTz2Qa0TtzfQgUD/0BI/uP8gqIVzDmkqHc98No+zQriQMruMmnftSchopAZ7tT0V2TamgT92TA05HYpBRBZVrpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250942; c=relaxed/simple;
	bh=7W8dlflfJi7kPJgIimIv76RQuie08B7ma5y2MHYzck4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aMtoJJYKZOzb7ZdOj3b80wAPGqbFepYzio7SFeM5GShCms7I3sjhiS2bGXSoXu6R9jTXNAboGscTQUaV68t+dBcogXupD+6ho1fOdjgGKMhRm5mwzaUQU6VXKl1AUNiue5C8B2ZVh2QrOVNC0GpkiTKO6BI6ocOSoMQibfXUXG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QDG52/su; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QGe8EJs4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QDG52/su";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QGe8EJs4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68178o1g2973890
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 08:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XfjaGFuOKCHKjsex9Rw6ZY
	sXxZt9KMZNWFnFOl9Q/U4=; b=QDG52/suVAej9blk5y+w4kfUmv/hjGUWxsLkEG
	eeOXa4TWBuqDBoilSSNPo0s0oGO/XRVpbEcNIst03yntvHQDDs8GRCT9S3Y0iPEu
	s6KU+oFIaXz+JQdkAY+1Dh4kDzYZSfr/jeRkLGKv4HeNtyUdXq//dd+hF935uaAV
	vEGwsAT57rNXymaqp62T5ClapGi1MIJnTezOhf51cOl3odjnO8A9aNwbCVTtKV+W
	XDK4d1gwFvPWFUDRgs4NQRmz0gaH+UbAmhwBeYC9gnUuvnCj9TJEmf9iZN0fmpbR
	khIiZpDOhkechrYcOLNspcIY5q4w7cjZfFQY7OGEvigr4GGg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdsnu0dr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:22:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e62e3459fso610896685a.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250939; x=1788855739; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XfjaGFuOKCHKjsex9Rw6ZYsXxZt9KMZNWFnFOl9Q/U4=;
        b=QGe8EJs4iNNc8FK2JLAwWuNPPXaJBnXHhEQ22ZWayfge0i3/D8d/BLU1Ws0yAjkZb7
         CMIUPf2sa0lfB0zTBBUemFlKjnPW+8rz1nJoLjfZq2Sib4xTkzaNSqfGqomvn5n8BF17
         mDf8J1kJoGQcDui3dCSwU2e0MjLsFozmKqZMmXXFEvJB3ifVYHbm6Or5i5UN+/XaZyN2
         Gtbq3AcShYvtfGRIoiuUJgELVSMRotW5xNhT+sjPV+kg1qyenVQysWg0+JTeyK2NSeda
         wfVvVVC3xRwE7n/cQcNpvtZpJ6dQPIPvpHGmShzZuLbyYLZmyQyIa24oK0dWBy7brkVW
         qhEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250939; x=1788855739;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XfjaGFuOKCHKjsex9Rw6ZYsXxZt9KMZNWFnFOl9Q/U4=;
        b=PiURWWfV5XGd92hXgd3wUsv9/aTv8VPjuIDThpEwpK5/YHckvJn5jNBretfjnzmf2E
         SacalVOPP2xsGoaa35V4ZHyQAAjRP8xLxjin/8ltdctAxsm25Kx3gFp7ekOgjXTd2Zvx
         YPhJGaLSBSzIEBotYyfo1D1A4l3GvlvPcSHLPVdw3uLRiq+aEQlnf04yxeaLCp6ZJS/8
         3qgSQNyq9F/7l8mF9X79vTTcVjczAhNlnpCFGPNi1JzrjJwKSRdci0eMJrkGKXDqeaCb
         ZfLNJ1Avz8Jfpx3/TovVQpsryygeRBhymv+8+HcuDGfrh993VVuqGCHzGHuto7WS/uSk
         aYqg==
X-Forwarded-Encrypted: i=1; AHgh+RrbSQGcZ5rEkvFEAmC4gvPaVkhY38bNfgqvb8qAjCPj474LKKlJPF4X2yYrTPP3TszNoe7yb/BE165bqw4=@vger.kernel.org
X-Gm-Message-State: AFuF++lSJFjLZtKOzVERpZIoGwVC/hgZUzswGFVbpbjja9CWjSBcmd3u
	qIvOmjT2/nxxrbpGQtJljRVdzWBcHZgRhZkjvTyIknEsvUIc/lD7sLT9p1CFWfaEMmEosMozN9m
	WJO9k+piOTFvJ+hFDihk+UPSLA2TfXAHq6PUEhrJM4+0qQ3+cTFbzlyX26Kf/++Fwug+xNJom+5
	c=
X-Gm-Gg: AR+sD13l5smHnhefUAAv37soHQ2uHuA6PVHHCLtHO7z6t8Rt9UPK3IiG2attPGl2Zmu
	EyeP/4Gtyqgt78pWIsmLSmSlWe1HKzIg3bkzK/m8XJ9uqxYoQ65TfnaX20PVqVPgnQfDvrLwrE6
	ukVp0MJiBFe9RAU6yT+GeDczRe3Ou3PR0ir7sHZhoT7yjKVFVBEGVw8UD+ZT5H+p9B9U55QRI3I
	8XalA+FwNJ25N84vRNPQLXXFkHL8gn/AOawQjEcahi/QYA/ZjEu+Gbb9gMyqF1CNem6I3QHcyZ1
	B7hV5s/9IZyRdF7lYuDPSDOeM3a3mXURfH7YLiDYMuLq9mnBWKo6VVM9bBGSKnZRCJoXv4tMP7n
	3ZrfmEU2w
X-Received: by 2002:a05:620a:1293:b0:936:a5c3:512f with SMTP id af79cd13be357-939138df43fmr2927324285a.34.1788250938226;
        Tue, 01 Sep 2026 01:22:18 -0700 (PDT)
X-Received: by 2002:a05:620a:1293:b0:936:a5c3:512f with SMTP id af79cd13be357-939138df43fmr2927304685a.34.1788250933137;
        Tue, 01 Sep 2026 01:22:13 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3b86dsm3273791f8f.11.2026.09.01.01.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:22:11 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:22:08 +0300
Subject: [PATCH] arm64: dts: qcom: eliza-cqs-som: Enable Adreno A722 GPU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-eliza-evk-enable-gpu-v1-1-a7c3fb27b4e9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAC+LlmoC/yXMQQ6CMBAF0KuQWTtJWyKJXsW4KOULo1iwA8RIu
 LtVlm/zVlIkgdK5WClhEZUhZthDQaHzsQVLk03OuMqcjOVmUn6F4cno5eMZy4MRfd2D23Hm6li
 6YEsb4C3lY0y4yfv/X667da7vCNMvpW37AorSEtuBAAAA
X-Change-ID: 20260901-dts-qcom-eliza-evk-enable-gpu-6532c131cea1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=989;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=7W8dlflfJi7kPJgIimIv76RQuie08B7ma5y2MHYzck4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqlosxYTLk4ej0pM1JeEv58+Oh6DoIUvt0gfQuM
 +bDrV6sfpSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaLMQAKCRAbX0TJAJUV
 VsjiEACGJf1Vvf7AKSuVXVZChgo58N97+FU1VkOOzO6dp756tauzrxzHEwRTv8+E1E+g2FCXfqW
 Ai0V8KzF2rjsG7YVxSSHRS2nhP1dpDlYUVN5UrLfkYgW1rv8SB+QOibQ9oxpnZsLKIyBO12+ByD
 x1nQBmCqajOdHXSgpCL9m1jhzwNDJGUNOJqvq+P9qVi7XSXKCTBuvy1LBDH1/PqXlNkEJs/aCjE
 TV/nq02ZpaKD+gwcrw3Hv9O4a1XlKUpjn2vw9sJlc6pkyKOqWoEa1H9uSC54JuEtX5pL8YHIk50
 QHcJLGeSzTwqacdKsmoy6/+k2W1gVVhS72h5awk7H4Iql5IY9yQ/o1SzMUZCq934cLCSm1TIefA
 ggXmRXwa+DRS7CNYRSfk+OL3xQrf+6KiOJOy/+l8KJMnJwAAb4W996vwd5cjpA02Q3j33pLoUi6
 vt049BuQ9OiwOI8FfVUIIJWIlvzJKHzOpyQIcNix/zJwKgXuDF+aZHs4dquMkIhjDiaO0JMe8zO
 aw/xACbrIkxnltr5EE8FwWXu1qJDLSGtsCSCC9qrhqod/ZX0/m68/zf1tyuFbzeblE4NvA056UO
 LhFgwP9mU7isa0qpGE/Kom7z4+TmEKDo2wHv3Mx6baPnTI5Bi8WoSkUduzgLVdAs3caLHuFYVz3
 cYCrroA93imGTjA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MyBTYWx0ZWRfX7Px19wj7gOg0
 dW+fA4JHI1V+PkSOg8oEw/XGgXD6UrxFhINzrOWndPnxWLextR2o27w9etL2hS7sgJYIFFVkWre
 Ax/EmStjHH4EltN9NSAgM2YmpGgHtKXUz3NQm/6+5NKG180ED8Yp/V1hgaanmc6E0ykPI7o00wt
 bId1hPPFGBLquUStzPm7cifBKNkSAtXmVHbeEuxTLZNh7cnwLsrp3LeeY1SdZConyLHAW++TJty
 2APdPJDEnc666vNVjBjT+xDfY0lKWJVCJdA/5sbkl/3A520+1byAe0bmGtmgc3ERF98jic6YAn+
 mQ5tDVsJbt3G6i0a9IF2t1tvCiMhVXiH9aZ61cNNRxJ+LXfuhqk6ZG2Vp91FMoqjcjaO+roCcDC
 8La4BVEkDqKAuhVmF0GNDFDNsJ7yLPcEyofsM1EMNQUfrJubEEdGfsT8Ryw2nO4UFJAF5qAcazo
 6H9Ni9k0gDClv+VrgBQ==
X-Authority-Analysis: v=2.4 cv=L6ItheT8 c=1 sm=1 tr=0 ts=6a968b3b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=MAnxEFDIZuXvlbMpwQgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MyBTYWx0ZWRfX0WCIZqRBwOaR
 e5mMvi6+MHOticcp1T7av7LtVnsLJ73hdAMZYGyarI4zZCyUMTfitxQeWbTvmF2ERqMSvH1u1dE
 QQd7evtBQb2hkT0Z3luv+qVdPfcxDN8=
X-Proofpoint-ORIG-GUID: shP4iY2Dl8wg-QaS6-suNDpYlOTBxi3p
X-Proofpoint-GUID: shP4iY2Dl8wg-QaS6-suNDpYlOTBxi3p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010073

Enable the Adreno A722 GPU on the Eliza CQS SoM board and provide the zap
shader firmware path.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
index 5ef6c51618bf..27831ea56d08 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -374,6 +374,14 @@ &pm7550ba_eusb2_repeater {
 	vdd3-supply = <&vreg_l17b>;
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/eliza/gen70e00_zap.mbn";
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/eliza/adsp.mbn",
 			"qcom/eliza/adsp_dtb.mbn";

---
base-commit: 1c8fe8863780705aba77893fade65f728e82b67a
change-id: 20260901-dts-qcom-eliza-evk-enable-gpu-6532c131cea1

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

