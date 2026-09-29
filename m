Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EF43176EF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 22:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790720321; cv=none; b=OlLTgm1liZTd87n/9zCCqKEyd/Xja4hkl0VanTnLkF1+CucwCEiMFuvj1StNLhFSu6ONJaLKCrmusclWS9vD5/fELGe/f7FUsonQxoemi4eDdKD9YQmZxSNMfuEKSxxEh5GEpTbnq205JKmur25AcLDoLiL6BsoagxR3KAOK1L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790720321; c=relaxed/simple;
	bh=J4b+GKjO/Lbw4R22A0b7OR3pelE7+QQgjwtjKhaWb4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rlcWKLx4qVDwVF3r8CT9QYWOEWWwACCu8mkYUMPAX9S3UWmIAjBvh7DGmAgX+u8RgzGI3iTVUB87LQI13y7BZ/dvYuAK1NqEWPwIRuTSeE6oG459waeW1kqgZ7rVDqxySILs4uxka4hORLoZ3JO97HBhuqbkBz4qhfXZYw9QBYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PVUSA1fL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fbfYYU3C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PVUSA1fL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fbfYYU3C"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68THgxXQ3936711
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 22:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WTHmeXQxf6a6kunqjH4I4wkiYejtrLAs9GV
	LWcjlRaI=; b=PVUSA1fLaztdZoR835bo+pXXe4/+P5tCbL/Psk+mpA/Wjr1GZOD
	4EyxnieRP+2XC2GUUTPTgD6A17tTx8m3CTdaq6jSP8o/HEzMps6pkgdDZjCy3vrc
	cx4VpiuAOzLhD94D/22D9QfkmWQIAKWV2sDqBjQkYiTqMxJNTlTioNCQfpF1EYlw
	min1bNsg6BmNCO4KmpbQ70MMYQGGTDpf2gdwSBo7wgzvyJ4UaoIypuRalKFjtdbv
	uklMYCa4G2t6X5jjIhTF1zKXVkZsS8CpuLPCySbqox/iojSRX6w6FZvjAVR5E7FL
	I1BvLcd+sLeB236zNEksI+o10Lldow6facg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0bn1k000-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 22:18:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c673116e3so663571085a.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790720318; x=1791325118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WTHmeXQxf6a6kunqjH4I4wkiYejtrLAs9GVLWcjlRaI=;
        b=fbfYYU3CG7/pHecFqUHJKzs2iZ2BDWYxjtoFPu4r0Vf9dp/iMcGLfG7IOpfh0hsL6C
         b2SsEdffsWqBWo3N1jDzEh80Coxy6GenH+rHq7PGkWJyjwwmzDSUGvGg71DHl0gk0KJN
         ziaWNAUR4VnPJP69lRdhVD5jd44mVyxR7yGb+VPntHSK/fd0PfWSZjI1jkBqAaIXltnx
         PL1YaRkMRbLIcSceir5vlWKuUnKkpJcfjlCRXjSe12DCxQwKILlkzQgkT8W54ZPwQ1TR
         3DvF/u/p2u41F1hhDf885SsEhrcmKkbNXo2fC/LIvGQ/aQE7XbGVterUskKF/3edY8FE
         u23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790720318; x=1791325118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WTHmeXQxf6a6kunqjH4I4wkiYejtrLAs9GVLWcjlRaI=;
        b=VuaEj/UBIr4TpPU6r0DGYroMGTp921C9eVInquvEYuDraT+hglbob5eU+tLM7E53Xr
         RNg1zTpFckZAjKNHvUkhmXpItleptnRjDS5DnHbuMFxsbvWF0NgHbsJ/hdObIbYT/lDP
         MZ3yNXZsQTdUba0bkSd0xT+tb8qBn1t93UcKmlpifkZqBhp8q4TPESgNlPJvIOKSc0Rn
         E92/jqWQvMyL4+vxnNMLm2lYoZ0cK1mSiyw7d2vvQ1qArozvP/c+bCJ8khIgYZwonI3h
         sbdb5Q3UZbl2nnoNRxJDPOXnGKrGqlgD0xte3QcnECQ6JFZkNulrtxIy5iApLxhLkMX/
         RlYA==
X-Forwarded-Encrypted: i=1; AKwUvBxcA2ijpmsJSQTjKVyMPJh5wj9hR5AKhpHHd8aj96uFdpxPO+LMMV/jk2+x87h8qgmRO5UKc4BXTKghkSw=@vger.kernel.org
X-Gm-Message-State: AFuF++l1c3O/4/OJEqaY1fMJbWh+awAbiNiaduQw/zgyze0vjcDMmb27
	97DbrgZyLdbmgE41t0jgsOhxjygIILw5bgE6iVPWfwSpOSlfhClWLi6/3Dj0/lPg+QtZCUoN2PU
	iaaiNB0Abb8BXoiZbMdGr8LRYs5lrakgbdXp0N5phSxtM2VB4b4zcIEc2+lGJa9YxJhM=
X-Gm-Gg: AYBFou20UrsCc1A8SDQmSkdp6TXJBGH9ocNGsIuZ0mSzh7JoqT5glgzIUxqZCJwZVth
	8gpaBrCEsViPO4jCIsF04tTClTFZL5E7pfAoB/hZEpFLpwoEPMTDph/mkRrdhHMvLAPtF8FPGvp
	P5LU+ZA8HxOm/lD7c1WJaBIU128s6YqsdTGxGNevzURag1fxmWuQVkUJ+CB73On9zpVbzGr9Wnw
	bkLGTjHWsarpGjvNRuWV2zmmlyNqxjoBhsTkT6V2I8yjYawzGq1dfRKaNgr/tWg8NI7QHXkUlr5
	N0im+iP7CjIPh7Yz3+QnfvKkuByTXAg9USihKCQYQxWrTvXiNlO0RXtSfvV+0E0TsZ2W/ama9Dh
	JIz5fSnlcP03m
X-Received: by 2002:a05:620a:2793:b0:93c:8f50:8c65 with SMTP id af79cd13be357-93c9f99159cmr185636585a.64.1790720318061;
        Tue, 29 Sep 2026 15:18:38 -0700 (PDT)
X-Received: by 2002:a05:620a:2793:b0:93c:8f50:8c65 with SMTP id af79cd13be357-93c9f99159cmr185630985a.64.1790720317400;
        Tue, 29 Sep 2026 15:18:37 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a014f77b7csm16981525e9.8.2026.09.29.15.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:18:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 0/3] arm64: dts: qcom: Lenovo ThinkPad T14s Gen 7 (Mahua) support
Date: Tue, 29 Sep 2026 23:18:18 +0100
Message-ID: <20260929221821.505551-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4OCBTYWx0ZWRfX8jNPF4cCwDWU
 nOuKIeexs4UwaOe9NGbwL8iyc1ChZV63E3UfJGjcInl+439Emjea7SrYhUNnktfKTBWuMbCtXJQ
 LzeAshIo8c4rkf+X1HohVQmudD1biFE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4OCBTYWx0ZWRfX74XIN+Jt4h0a
 7E89/7s0k91SB/f5HyyZG/agODQkz4GB9btY/Ie0Xv4/kAwAIX7wXcWC4lDVSqu4wxGRY1rJV8K
 zarQ5dNUY5hoQOYqfhdlIeQQVr9gnuWwaO+QiZ5hSSV8smKCFI4mF6Z19xhibmoDed+zHnzaK0Y
 KHvR1rGPhdmLBjGqaPBJuBueNlS0XFG2yjMJARClBz20yZhve7s23xACP1gRwvauYK2UrxFjEK7
 V/teQ3Tr6Se5DvznwzGuYtLlofsdUOGUwuvc9Y+63YCZ5qiC+A/9pb/lp+QunEMT/t4nw6A30vN
 J/w9TWIla5x7eegGNXWovnM0cRxw8kzOn9UOjAQVSuvWH0upzZToFt7oja/ia67n6oGPpa/e7Cu
 EEpCGZYxszCW9UG48bVlalcsr+MxY2BqAWLfII4VHPdznQAMLt3VK/1lFeY/J7StOpGCMxeLA9x
 SM4TbKFwKcgL6htW+QQ==
X-Authority-Analysis: v=2.4 cv=JMiuIMKb c=1 sm=1 tr=0 ts=6abc393f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=c92rfblmAAAA:8 a=Dn1Vr0pbAya_qSnb4TEA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: VRN38uAAzdKHneUgM8CeYRwSsYfN3I3b
X-Proofpoint-GUID: VRN38uAAzdKHneUgM8CeYRwSsYfN3I3b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290088

Add support for the Lenovo ThinkPad T14s Gen 7 (Mahua), a Snapdragon X2
Elite laptop.  Patch 1 adds the board compatible under qcom,mahua.
Patch 2 is the T14s Gen 7 (LCD) device tree; it follows the Qualcomm
Glymur reference design used by mahua-crd.  Patch 3 allowlists QSEECOM
on this platform.

Currently working on the board: internal eDP display (with backlight
on/off), WSA8845 speaker playback and DMIC capture, DisplayPort audio
on the two USB-C DP outputs, USB-C (host + charging on both ports),
WCN7850 Wi-Fi and Bluetooth, NVMe, HID-over-I2C touchpad / keyboard /
TrackPoint, lid switch.  WWAN wiring is included but untested (no such
SKU on hand).

Real backlight brightness control needs the PMK8850 LPG/PWM (the
EDP_BL/PWMR_BV_PS signal on the schematic).  That will follow as a
separate series adding qcom,pmk8850-pwm to leds-qcom-lpg, a PWM subnode
to pmk8850.dtsi, and switching the T14s backlight to pwm-backlight.

Changes since v3 [1]:
 - Address Sashiko AI review [2]:
   * fixed conflciting gpios
   * add panel backlight switch.
 - Sort PMIC includes alphabetically.
 - Pick up Acked-by: Rob Herring on the dt-bindings patch.

[1] https://lore.kernel.org/all/20260928145122.1337186-1-srinivas.kandagatla@oss.qualcomm.com/
[2] https://sashiko.dev/#/patchset/20260928145122.1337186-1-srinivas.kandagatla@oss.qualcomm.com

Srinivas Kandagatla (3):
  dt-bindings: arm: qcom: add Lenovo ThinkPad T14s Gen 7 (Mahua)
  arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7
  firmware: qcom: scm: Allow QSEECOM on ThinkPad T14s Gen 7

 .../devicetree/bindings/arm/qcom.yaml         |    7 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 1277 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 4 files changed, 1286 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts

--
2.53.0

