Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70D041CB4C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109422; cv=none; b=GwJa8r5bDcOZ5IcR2gnnbEFMueyx4rqfj6SJbyA+iJ2E8faffRC1AZB+pLek2wnTofbl6b63dip99YOYQI4Xkd3c2MEZWKhBnRCv3BIPpPwZbZVx/loE9A2ER67wxGpO1Q3fhkFnxFxgFtt/LLUYfLOvX9ljuE50bipTxFukFDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109422; c=relaxed/simple;
	bh=NULX+1XQ77Td2Q136fRdbK92n4Z0ZUyf9pgBdD0Rtt8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z1xnATs5epqF3M3ldn6KIrnou65fB/GoQwvPUVoblSkpE1cHzOW5i4ObiZvynkCgPCyJCtCHqbg1UnPzbgyOX7XupJVuj9fqtJr83yhM+V5Rpwoy30yYrnGgEUoxfL7r2OtipRVM5tjYACVIGUy2xrfHAOQE82B2Y6CWAtZE7QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RyTVJYvg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QYaxGmwV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RyTVJYvg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QYaxGmwV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kE8j3550986
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:50:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Vy8W88a0VFCDOKzf5fdSGU
	EkZyr8c6w9FqVojwlSvyg=; b=RyTVJYvgNaP9TQnU2jx4rRFTahQJ+lJh7KGjCg
	POrFUJS2IofoC5bGLyHEXmTJKQ665HSpv0nkpldKD4uWyfCYpGxjg1GQnGQSLO1P
	h08aUfXSl9grwP8OEIIFQ/XxhMsHzzmiGXHvWgGaIFL2+su+gEYeuLObmBG56637
	J7U8fjlvhqx4EFF/elHGTv5XqKHHf4SVCQvSffmLVskOWC87E9DQIe0vvk0+C4ZA
	IJT2E0waX3YZKCLQNamaq/BmiVR7QKb2hCu3TcpbT8jT20Tp54FuDI8ocJsQ6hl5
	29+aky/MSteXlcJltPwlvgseIQ844vSORAhtECzsE+s9xjjA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg0g9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:50:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so1050467a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789109411; x=1789714211; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Vy8W88a0VFCDOKzf5fdSGUEkZyr8c6w9FqVojwlSvyg=;
        b=QYaxGmwViShU3UqzxJwUgxCADN0scml3Pnh1PH+QKfwv5m7h38QK98+bu0P5tCTl27
         CatxsBdKb2Klk+EeORH0hdrJT+BGh6KTwkLD1TI4zt0INgEhH+JsLIVcgQv8yuXo98Hq
         v1NCZey6cOx7QoRFzvmEQGtBxsqfCpAVPx6tvwU4n9X/2eYIlRe+VCggQ+HIY+bZP1cp
         Xkn3BWb8Mag+fiR/3uADDIorXhu45yddsauTuFwfcad+GAfycnfRm2MbzjT9vopAVgbR
         QCPY0uEwE58MOAasLE2IUmmQQa/NhuvhwzRfRbJc81AOLkQTmdHCb+eB9rWBU1nTRTY3
         SItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789109411; x=1789714211;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vy8W88a0VFCDOKzf5fdSGUEkZyr8c6w9FqVojwlSvyg=;
        b=ij8NGMiQPX+co0jFW4/RAbyIJj6nELSMpXjwc2Zlj+KRS0Lbk7VZpzLrJwjfUJSbNe
         bootlSF46FpTWLOgTtCLbrR7Dt5EfDd7uehgL6tyPp2N4TbLmtBWZg6zfLrUYD5DlBdq
         3nFeG8wh6RtV5P7vjFab5dpWj6OuVpYiRO2ukbXCh2sH9ZKbQSxOTvCHI1TUyPZNLXxZ
         cIp50Km7JHNsQNmkf+u505CyNEh3KBlg6eYYtuB+xYTAEVdtwxFyWPc0Q1ohnxocEY+R
         MaLhTs7BEwkR43lkyflTR94noNtAN1rKbzyXoh64heWCnZ7G0FssF/zRWnQ52mglfPma
         zO5w==
X-Forwarded-Encrypted: i=1; AKwUvBxczzwCDjgPkCmO/WVtYN5qSuKswCQcNAA+YAw83h++3UT+Od7ft+l288+OIzBBbe/MSUV/YObAY8ktBsE=@vger.kernel.org
X-Gm-Message-State: AFuF++l+lUOv13y7bCPyX+ILFq13PIoAR+Di8/whoSgNY5taBqVSbgkU
	kklcqOHBkunxoExYsc+smedXvW7xwktN/3RpE1E91TfgHFRLT1D6fs6S2W8vOy+GRGkP6dmxX9h
	wHOg0ofHBHKjm4Kq2cn06EOY6SGVIGpA5qRT8MVqkCYVAxk/zX7RfyPvTYRGTvuaHxV8=
X-Gm-Gg: AYBFou04G8ADH/NfcJgpzViY1TZQTC3o3Fz4b6IyZGW+WyQfKwcnnw2rSsUjfx0y9nv
	5OfwR8HKEBywgA9VsBz75calaqRogqQXvNDv48+NPEEQe2JauUmWl56uO3pExpMS9IogEyChjfP
	hJPWkLXZ2x3MEXhqiU7imjqMrvCdqUsxBKjFlY34xMj0V8G0ErChkyrubhwIxPSgQQQs5hlJtd7
	mxNALto4OMDEcTtTaF24gEUg4SYdBkOMsOlx4CZ7NEqw8kjEITsAFtqZy5s0DUI1q05FFqc9grj
	YiAgKdQWqX2Nxlfmln/tAeSbQZIo3BK3kjs7z/7cWp2/0ml4MBAflNdvEPvZsdm9NJ4qchzeKK8
	AGhli6kmRJm8+WI2nt+l185477mdbtxEQwx0=
X-Received: by 2002:a17:90b:4a03:b0:39d:84af:a0b3 with SMTP id 98e67ed59e1d1-39d9c3651damr4461894a91.18.1789109411221;
        Thu, 10 Sep 2026 23:50:11 -0700 (PDT)
X-Received: by 2002:a17:90b:4a03:b0:39d:84af:a0b3 with SMTP id 98e67ed59e1d1-39d9c3651damr4461779a91.18.1789109410130;
        Thu, 10 Sep 2026 23:50:10 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a598aasm3934383c88.1.2026.09.10.23.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:50:09 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH 0/8] arm64: dts: qcom: Add t-power-on-us property for PCIe
 root ports
Date: Fri, 11 Sep 2026 12:20:01 +0530
Message-Id: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJqko2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0ND3ZL4gvKi+Pw8XQMzyzQTU5PUpCQjYyWg8oKi1LTMCrBR0bEQfnF
 pUlZqcglIv1JtLQDvSkYIbAAAAA==
X-Change-ID: 20260911-t_pwr_on-069f454ebb23
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789109406; l=2349;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=NULX+1XQ77Td2Q136fRdbK92n4Z0ZUyf9pgBdD0Rtt8=;
 b=vW/t6Rf8jXGiwujgNIFVkbYVxLDdRbkpjW8gE2Ou+mXJwxyD8TaJsIaDcs1edBXzHxgvHbYe9
 LPnO4SE24I1CyahCOVRjVt6dpDfZ89AKTQJu7HA6kXFvnD9OMfWCRin
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: jN2cCj2IGfZViTTaABHad7Ygr1_EujNL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX4b2GDrUzYAj0
 pVi0sfAiiQ1tGUgwvRwXz2R2QWw2yrkKFzvMX49nTVHzSVo/9nwJvzpB3pzqJkUXOch/hP0syV9
 eH4h9iMGkJxK98igvVhdOn9Vqbi2QEY=
X-Proofpoint-GUID: jN2cCj2IGfZViTTaABHad7Ygr1_EujNL
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa3a4a4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Fm6EAR0vVewXWd2bb8wA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfXynlYPEmpbq8S
 xKa44zac0MVbUy20l86UBIdBOX2L+MNzeHHwe6VJb/9qNeqGPntY6hRX46r/Qq8M/3MmNoSiyZi
 Y0Qcjy2F5bvnlAtTKM4aUHtg3mBqSyXoM+12FC8P3HFQlMtSvSt0p/W772FtsjLAbWozYLXcCfm
 O9o6zVdwkK8+c2g6A9l7R565XU28kZ7TGeRNvdB/1sybAkT9tc4x6sHhTsH1MPVZWluGTd6Hn7o
 b5k2pIiPGhnFFDgaADVmF2uQjKdW/OsvgZVoYCWmXeP8MIKk6sVa8MqAKypzCcDFtSJMzK1hIJ+
 t4BrhRghL5JBlJrZlqbmQBxCXt/LLErMGl/qZAtlBdlK0gC6uW7n4GrDdfEb8eqUwcirXkg1piS
 AwIo072EpJaGaGrmyAEmh1a4iEBWMgWqjG2s5NVGADtOh6SjgPicuWolkYsL1sntjn4ixCb0Xpt
 mxvzsoq8WhWySxdlohA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110093

The Qualcomm PCIe host controller driver added support for parsing the
-power-on-us property[1] from each Root Port node and programming it as
art of host initialization (PCI: qcom: Program T_POWER_ON) [2]. Prior to
this, T_POWER_ON was expected to be programmed correctly in hardware or
by the bootloader, but not all targets support this, which can lead to an
incorrectly calculated LTR_L1.2_THRESHOLD in aspm.c and improper L1.2 exit
behavior.

This series adds the t-power-on-us = <80>; property to the PCIe root
port node(s) on the following targets, so the controller programs the
correct T_POWER_ON value instead of relying on the (currently incorrect)
hardware default:

- kodiak
- lemans
- monaco
- hamoa
- glymur
- talos
- sm8750
- kaanapali

[1] https://lore.kernel.org/all/20260205093346.667898-1-krishna.chundru@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260428-t_power_on_fux-v5-0-f1ef926a91ff@oss.qualcomm.com/

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Krishna Chaitanya Chundru (8):
      arm64: dts: qcom: kodiak: Add t-power-on-us property for PCIe root ports
      arm64: dts: qcom: lemans: Add t-power-on-us property for PCIe root ports
      arm64: dts: qcom: monaco: Add t-power-on-us property for PCIe root ports
      arm64: dts: qcom: hamoa: Add t-power-on-us property for PCIe root ports
      arm64: dts: qcom: glymur: Add t-power-on-us property for PCIe root ports
      arm64: dts: qcom: talos: Add t-power-on-us property for PCIe root port
      arm64: dts: qcom: sm8750: Add t-power-on-us property for PCIe root port
      arm64: dts: qcom: kaanapali: Add t-power-on-us property for PCIe root port

 arch/arm64/boot/dts/qcom/glymur.dtsi    | 8 ++++++++
 arch/arm64/boot/dts/qcom/hamoa.dtsi     | 8 ++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/kodiak.dtsi    | 4 ++++
 arch/arm64/boot/dts/qcom/lemans.dtsi    | 4 ++++
 arch/arm64/boot/dts/qcom/monaco.dtsi    | 4 ++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 2 ++
 arch/arm64/boot/dts/qcom/talos.dtsi     | 2 ++
 8 files changed, 34 insertions(+)
---
base-commit: 08df884136f1c1197bab2a27814404fd329d9aac
change-id: 20260911-t_pwr_on-069f454ebb23

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

