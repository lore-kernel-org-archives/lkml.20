Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4787554DACC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089294; cv=none; b=XX+Gy2dTQNakLXl8XPSK0p2mGKrkS7cY0F+BfdtRIbjMPkJuID0VFNo5gkaxR3PTjFbgx1qEYo+4AIfFpZN4ntVQYrgsRqDKtof6966bSIgCUIJ6xMIfLRK9QI8+FeIam3N8Yu3PT6YPI7KQGQLoQ1JN0ul4XdfPHwC2810q2WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089294; c=relaxed/simple;
	bh=FAjeZRneUS07YGI25/3Eh1Qgzc36kfOxzN6RMttVlqs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tv/27KvA8aIz3Yy5n95KCFvXLjn8NRFpJFV3T7X/WvJHu7hNCHcOVsD2IfQfsmM8ZlBab5CCOHlPwKbStA6+yAuVFQ2ItP5AeaJK8cJZnEkT8kkHISUgCnEdZmC+ozaCpcUQfZdqM29g7LDkIIi69hEfaiPfZYuTVR48JGPi2NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H6vJ/OBK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZxtdCaz/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H6vJ/OBK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZxtdCaz/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjVeg1058308
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FoeWl1cPaBMy+RKb+Xq99Z
	3tlRXXvkelRP1fSd0n6ug=; b=H6vJ/OBKjfI4zxe+j7zdZaHg9hDfIttC8OMpi1
	7nHoHok/oVY6OqK5xyr8UTSCisOq7weY7b2kaZb5xk5KCpIjXApsVW7KOjsfPx7C
	/IX9pNPI4VQCjv8ibw/U9lIeksRwrN+lKo9eTliZJa4BZMe43jV+bt+nbecUJ/R8
	WXtppEwPGKjFfs9P1nfb5pqfbbg6uf9kYBEmo8fB+TgiluljFDTLwIGr4Dp0HSRR
	2cEreeJ/wwHlHyY7yvAgTbFkGzjCrgyFUKnrvTrVmber6JChh/eiiof6mBo/6e7r
	WNgCPW/nou7Esab1uNtxLiEkDeJQk6nJuo15mt1gnz76+3WQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guha5u03p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:01:30 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c7d5444845so6036606e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790089285; x=1790694085; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FoeWl1cPaBMy+RKb+Xq99Z3tlRXXvkelRP1fSd0n6ug=;
        b=ZxtdCaz/ewXN9WBp+FBS++pxFLHkt6GvBGvMovJg3TtBhf32RimT2TOyG2RvBM1KkU
         xJ8PPJxf64oYQCv8Fwf/uD+V+bYM7TdgVzsDJGYXRBQbkhj0LY7h6kXC+K6aB+GXxEmF
         +xee4iqtZRZJvh5mfE/2qqy3x/ptM/1joQUbog45K+s5rr/4FpH34ti9ybtQdMb0TpaF
         5NO/A7eFiR/9b8njyjdIJ+l563YFh0v7hYoVnfBEfXUEmzUBfPpfkn6MbBbrmereEgWn
         BCZ5i8pWFn/4Vq4N26XRSlj5Zu6P0un2Gcr4NuIJVt9Sww77F86zaYOteien+1wCX1m1
         3PKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790089285; x=1790694085;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FoeWl1cPaBMy+RKb+Xq99Z3tlRXXvkelRP1fSd0n6ug=;
        b=hjVm6rCeTHO3redl3S+HATiynXbJXvSjRr6bgSHi6lzLafz5wheHSxoE5CTCKhcD1X
         qfXuBsJtUc3Djcky+DH3pOjS9yN5c75xfoF60yGT5gUEAMFQKHxgwzoNAyUTOAVkzhSZ
         MnhmYJQjjepL4dTqDwbYGQozCM3fR1TiSIru0aqM4ajfhawjBkFrhbaNII/uh8662elY
         4Zdvy96RzBas1/5UUGBcy2zdIUs2KW1duQj17zXgJWxRgdFe89dwUWe7sFrLlvHG3OwC
         GpOe3KCrDUmV+CEvzF1aetz5BGlcnYX0RxUD56l1Z41Y6m4T35WPCqLXcdx9rd4ieH2Q
         7KwA==
X-Forwarded-Encrypted: i=1; AKwUvByDhW96lgmjr6XZaPwfxWz3HcGrshQsvExeUnSNIpmv4J8lAdLurtl7/eKswNQWr55AGmF2YhpPAZrHHlM=@vger.kernel.org
X-Gm-Message-State: AFuF++ks0kT5ucSl4K2IYOEdScjfnzGBSWqaUf2vD+wCEG25gYT9bVJe
	pMoNAcZbP7D6RlEHs1KfWVIyZv8ILPWlrBlVKiizrCriYOh9T+yPP3LRsIkl5Ph90seq0ebVjVR
	LrV/bnWwwJdZxsPE3YBNfD4CNYvvkva/Oe4Lv/a5g2ujb15+ZnWXyrGDV+osaREa2+VM=
X-Gm-Gg: AYBFou0/Uedodfp9Phq6ZZ3HXOdB+vUOrxzvYSKvWfAKnkb2lvakVc0ExblEuUEeuTI
	sk1WWuTATVqKIUrtA787rhGb3KT7Xp3LD18g30CtQh8tjhlBv0TMVQBf1q9ojg8xLGhMJ7dUF5s
	HQ1Sme1YCz/DT8jJnKr3rrtLrI4PJ0gcws+u/aOHG5VxbVidbUTAegU8Ggo66TS/tmKBxw83bpM
	Q68NBwBPaxrIQOEfAYrkafU++d/8BKTh+F0akx1pOJ6E3enCyHlSwaa1nNbR9pdSDs9WT7l4yKs
	fGk4RVGX4dZi97yNzeCwG6aW2TuIhGzl64kQhISDSwAfoUOn+60EwYYlhgh5tudRVr36mTrjwSI
	Oh/qHZJfTqjsW3ymsOxi68bOq0WY=
X-Received: by 2002:a05:6122:e189:b0:5c9:a60b:e5a8 with SMTP id 71dfb90a1353d-5c9b5977bb1mr9753318e0c.10.1790089284626;
        Tue, 22 Sep 2026 08:01:24 -0700 (PDT)
X-Received: by 2002:a05:6122:e189:b0:5c9:a60b:e5a8 with SMTP id 71dfb90a1353d-5c9b5977bb1mr9753238e0c.10.1790089283835;
        Tue, 22 Sep 2026 08:01:23 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488627929a4sm4504298f8f.35.2026.09.22.08.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:01:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/4] arm64: dts: qcom: nord: Add USB support
Date: Tue, 22 Sep 2026 17:01:06 +0200
Message-Id: <20260922-nord-usb-dwc-dts-v2-0-ba2b39f1a843@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADKYsmoC/x3MPQqAMAxA4atIZgMaUNSriIM2qWap0vgH4t0tj
 t/w3gMmUcWgyx6IcqrpGhIoz8AtY5gFlZOBCqqLlkoMa2Q8bEK+HPJu6Mj7uqm4obKFlG1RvN7
 /sh/e9wNYsoczYgAAAA==
X-Change-ID: 20260921-nord-usb-dwc-dts-c2ff685d8219
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3150;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=FAjeZRneUS07YGI25/3Eh1Qgzc36kfOxzN6RMttVlqs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqspg4eZZ0G5vN7Wkdu1FJdOiY3SNlRsFADGJ4n
 VVvkFGxzuOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarKYOAAKCRAFnS7L/zaE
 wzY9D/9Jh5nK/C63c9ifJg8HwpmgzBuaWMkluwvFg73a/jl02wiEZ6wIOoaryeBX9N3M7dCdLie
 hFuKv12V1/fa5L8k4OPlisl2+1K2NNT8x6YNZS7acPzlF9l+bOtqKEMk0uo/fWNTbg3RC/xTOVY
 mogSLuj9DZWkmPa5zk10maUqO7U+JuLHbUf2QYbX/X2t8nr1GaSpcJNApBsCx2Heu/ZtyF5K+ko
 qZJHgjiuP2mvNelmsDJYoP0uRHyVZGrZwuEhS2pA6pKrP9ot6UEzJDExyi2nJsCRZc3bvCua6aw
 nMf0JSuM489NgnEoTf1vC/qdrMuE8EIuy7iylzefFrTU6i4VBCx9YtHynsriSbdidGR5+v1utmD
 erYRHggBWwgf0yk6RIiVyS2qOV5PbOs0YijLF0zXEXXUu9oXm4XG9Z7ziDlLxyb7WdP99d2qGoH
 dwiXf9M1+LhzRpzUbDQmf1jBi5jVjSBUtOr4upYCnEdTY0riKmCQfKb7DAOKxtJIAgmwkF0Sj3W
 AC+ZYsVSexzW0A9ZeqEqd7o/iy7yx/iaAup9U9PBc6poDJDMd2oGXM5uBwYhXSQyI3Z17Ujl9RN
 sFRUCv0fycwt+IBp4kV60CRgmhGX1hIKQloI+TcKTnoDUptUuqvXzJShcYIdi8MsozXbn4spDSF
 pNNv2wsijQbheAg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: Y2ddLCmxboxfJ6jxR7xobnmOUIXQS2mC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIxOSBTYWx0ZWRfX7/MwvA0Twgqt
 nyRs9cBydWSdVZ/f7fvtgSkQuoQb7K0alPUttMFvLp35GmvQCbvJrceBJ3PaD/QaamSSf9GO4lm
 1quI7R55amEIu1945bc+i8LWniyHFss=
X-Authority-Analysis: v=2.4 cv=U+4Hnuru c=1 sm=1 tr=0 ts=6ab2984a cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7rNyl4BNHWs_c8C4O1EA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: Y2ddLCmxboxfJ6jxR7xobnmOUIXQS2mC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIxOSBTYWx0ZWRfX3CBvNH9b3eSs
 NI75qZfnwPwY2M24w7dyocRCqt2hf/7DenMjWONiObrsdoWcy1isgGd5/zReWuycSVSEdb2m87R
 nq3DlvnOrtOcKqGyRh3vx6AXUoacXm7nj5snxde3JtOkGERDQxm5gJoRxPNHHAsPOL137TP5qhA
 ahgCp6HphHzVKq5/XmAoFk2eUHN/h9a4xgoQk4lpha5X1Sn7JxuRIRODOXGr8ZS/l55+xENGLW8
 UKiBTrxKEY51ZIS2cECHbVPN8rJFKIezzp95Nz66UbIBNoln7ghhACkaVEIXWdwuuVwJD1jKAtU
 OQPpyVMpwyAiDerCix3l68k68E0LowpyDuU+I+l0BkuS9j9pMFFPx6UAJxNDwt+yXQMibLv2hGx
 +RWMfaKuQuUL9u2Tv7W5SyAfHjwiNMeAMqbQKF4QwXAYxgI0OlMzUN5nnrz0Jxejv3yUUVq+qjJ
 YNEEmNbS2BEVzfYP+9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220219

This series enables USB on the Qualcomm Nord platform which has three
USB controllers:

  usb_0 (0xa600000)  eUSB2 + USB3/DP combo PHY
  usb_1 (0xa400000)  eUSB2 + USB3/DP combo PHY
  usb_2 (0xa200000)  eUSB2 only, high-speed

The first patch is a fix for the i2c9/i2c10 pin functions, which is a
prerequisite because the eUSB2 repeaters and the Type-C controller all
sit on i2c9.

Patch 2 adds the three DWC3 controller nodes to nord.dtsi.  They are
kept as far as possible free of anything variant specific, so the
clocks, resets, power domains, interconnects and PHY references are
added separately in patch 3 for the "embedded" variant, alongside the
five PHY nodes (three eUSB2, two QMP combo).  Adding the QMP PHYs also
lets the two pipe clock placeholders in negcc be filled in.

Patches 4 and 5 wire the ports up per board.

Nord RRD:

  usb_0  OTG, USB-C, FUSB15201 Type-C/PD controller
  usb_1  host, Genesys GL3590 HS/SS onboard hub pair
  usb_2  left disabled, not routed on this board

Nord Ride Embedded:

  usb_0  OTG, USB-C port 0 of a dual-port FUSB15201
  usb_1  OTG, USB-C port 1 of the same FUSB15201
  usb_2  host, USB Type-A, VBUS from a PMIC GPIO controlled
         fixed regulator

Both boards use NXP PTN3222 eUSB2 repeaters, one per enabled port.

Dependencies:
- PMIC DTS: https://lore.kernel.org/all/20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com/
- QUSB2 PHY reset: https://lore.kernel.org/all/20260901035322.654-1-shengchao.guo@oss.qualcomm.com/
- USB PHY: https://lore.kernel.org/all/20260921-nord-usb-phy-v3-0-68aa02b12b96@oss.qualcomm.com/
- DWC3: https://lore.kernel.org/all/20260917-nord-usb-dwc3-dt-v2-1-8f88aa30c434@oss.qualcomm.com/
- FUSB15201: https://lore.kernel.org/all/20260916135918.1017527-1-shengchao.guo@oss.qualcomm.com/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Drop pin control fix that was applied upstream
- "otg" mode is the default dr_mode so drop it from nodes
- move the usb-mode-switch to the SoC level .dtsi
- Add hs_phy_irq to DWC3 nodes
- Wire-up the USB2 type A connector
- Extend the list of quirks in DWC3 nodes
- Remove stray comments
- Link to v1: https://lore.kernel.org/all/20260911142040.100263-1-shengchao.guo@oss.qualcomm.com/

---
Bartosz Golaszewski (2):
      arm64: dts: qcom: nord: Add the USB controller nodes
      arm64: dts: qcom: nord-embedded: Add USB resources and PHYs

Shawn Guo (2):
      arm64: dts: qcom: nord-rrd: Enable USB ports
      arm64: dts: qcom: nord-ride-embedded: Enable USB ports

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi     | 311 +++++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 309 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts           | 166 +++++++++++++
 arch/arm64/boot/dts/qcom/nord.dtsi              | 100 ++++++++
 4 files changed, 884 insertions(+), 2 deletions(-)
---
base-commit: 491d08c98db7ce0a90f229c7ad23638a3e071411
change-id: 20260921-nord-usb-dwc-dts-c2ff685d8219

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

