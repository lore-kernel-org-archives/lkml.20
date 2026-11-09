Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794183328;
	b=YiviQ2A6vjBifWOHvFsVMivxZkp+AeQxCOMC8JthtbHE2c7wzbxvuxJrUmOS80xzoLYM
	 LD0faerWAJuxRf7T4HAbmP1/k0fwcKm4WK3CsQ0NP/xqa+rAp3uuQgGOrXMqtCGdU2PRF
	 ZeKZKdK4Fbci89pZiJKpwcoQVJV2j1Otvcda5ybWNG9mb1VIZKUER8I2agnYTiCtkq9q2
	 fK2X+xugKagrZiviutGVrgj84fEpQtj+vbWiXVfMAOJMYo2tzc5ovxR6NiO2MYJrDjBaR
	 4cxrFiSL3bAMModvgKVdAO1phYpNj2aAN58AxukV2qsRbT2pH7Yv+y1KP87XiD7ybOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794183328;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AMRtfRF8O7Ygkgb1lDj8QnegAF0OCQBJ0ibubsM5/r8=;
	b=MVuKXx0xA12XDOPm6fm///FBc2uG4pxdfreA0p92/Pjc4nHjUpmt/g2IbHpq9PkwIsvn
	 Qw5nAqvcNrqqgr0buwE6H5XOSAVhc6A4VgKvIgrgIpYVKk42KYVwsuq1bPQ5lDDFn1JXR
	 mPaieMYs0PBTvOs4lfG9+I1n8MTTdwA9A0vnMhizpcW6KfdhF1xA/goclT6UYsIkcvM6N
	 dmm5G+g66gSMMmN8aXW1VzZjdl7xS600Yj63ku2ZKaw8W5dnTfDN7cSWy7oW33/wDAaul
	 9XpNB3udb6v1VMn6p8cM2qQhxeXtcM0FDdW1ZsmiSyL+6EzhDOnclfq6qBBV5iNnpKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="G/cpiHbL";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U27JTjtD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73045606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73045606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G/cpiHbL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U27JTjtD
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8KdwmU2452971
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 00:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AMRtfRF8O7Ygkgb1lDj8Qn
	egAF0OCQBJ0ibubsM5/r8=; b=G/cpiHbLnZn1edSJkYWdyNV/pQqCb5lrOonGTF
	WEsEt7oqvq5U4X+Hqichy7thG2UIckh97EeDrKnazcNPFLXh8UWoAWFi3s6g5le7
	x4g7SF6ItuJ9KZR1rc4veIB3D/0bgCmXdRpmxQuk8KXdijM4YTp/uVlELVbdLOXr
	7XpcOXYeRh2Pa73TQSSJqpEohSkdaEOumijvT/1v2ont+GQ/HzIUwuYhjTKocwQR
	CrrQ6u/2CY7rNXg7N+gLhnuEZxoB9/1Y0P8BwzYBKOpd12KW1hMT8rlQG5g6ZB9r
	IwyvH+eGgOhsBBd7MkgknrIDfColApjoksOIDK7V5dRxCOnA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv2ubyjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:15:27 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a5005fd0f8so720813c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 16:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794183326; x=1794788126; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AMRtfRF8O7Ygkgb1lDj8QnegAF0OCQBJ0ibubsM5/r8=;
        b=U27JTjtDUBxJpWD0BK77xruSJWvh2zpDMzZClacRiLUn5eU0VXXW3VsYWK6iI/7abi
         twq2WoLBHKtdPSF6FbVKEBKe8c5OdFYr4KICYr4azo1U+8UX62FpE4Rpt6GpP3adqlZq
         gvFw45XjDShHXR4yyKdrOqJg+GpmJKouWDMQ7GVM65wQuRH4yTTM+kEkh471g+VYkV7r
         Bpd2M8Rqn8dmsWY69wy+CtWTOZ+aPfukFnV2VjL6/aWReqAN9ZnmGc0NpTRxOLh8rnXn
         WvYpqffPJd9dozdDZoSjYTOvvLiVPxPG4CFEhr9pJxD75wVk1GJm8PA0xpjvLp3bTbbG
         2bvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794183326; x=1794788126;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AMRtfRF8O7Ygkgb1lDj8QnegAF0OCQBJ0ibubsM5/r8=;
        b=19jKq1Cqi1jiYjCRwKAVggaJje1uRkozwaM0ewMG8ed2PxXy5yyWqi0+F7seTuW0Iu
         7MnqSKoU8Gj2OmNY4oCvt+4OJXac0gc768ILygmrmdyibX4cdsLPN2fuIjBQCaAm32hQ
         b7cs4eOIFT060B0n2eAEBY4TVVvAbJYK9CvLf3j0RLqtIRhvUsrKId7Y5jZrZnk6e2Yi
         2LvzJVXR4JoWpLQqIEtVuVlnaPnGtiK4ruK/GnKVpiihZw42ZEscdjn+c1ZqthSzbJ9I
         0Hf7GdIiDM+BwCfYN8ySYSYXOl2+fTaez4gTNZ8054630LkRsTbHhzjBpm32USgGlvmV
         atxQ==
X-Forwarded-Encrypted: i=1; AL+hErH77jbru2rrRRg0hZVLX8FUZf/YYVlTbzoTl51O2f2UvygutbJD6d34IJosY2GrUcp/7Agfp/PIbG51dfo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hkmAUiTgKSl9GrkEnRMdj6VLnZTVRJmdsw2HbMDB8xvKvw4PI
	XbIvfDzwG0kAv2TFEneXj7/8Pwn5Oakpc9GTyYqQAoahASkBB20TZuBK76WnFIGgKMpwprgS76B
	BlDILd4hG60jnyx/TmuBxc/nQbIxc2cWqT2Dfum81Z1W2HZlM+j0Zu+UgPCoISyFlABo=
X-Gm-Gg: AYBFou157kIlI7obKz88m4+DJfNbQc21QxGokoDM3s8AH7qF9afeR784KtHgHmH91aw
	dc5jdVsKzgpW0sMlDyhyQwn0l7lAr20oSnxLn5geuqRb35GtV5TbGCzs8tWi0aO/ZmO3Q+20kSP
	MV3ueRAfMmjFwum0jpGvHMvanwQiB7r+f+2xTXlZ7W957PerhfbOU/BIxnWQb+D4G2hpkg+LTjn
	7buPKJFEDljc3F3NY9ZVAaW+xWA7jGiPIHhKMaydajo4Jm4pT2w1yLiirhfOr28ra5CE/ZsAy+k
	Um4xsVlVf0n9+GrbkgZwt1NbYEauVRizSfgtSWyrtBxtvg4Ouew7++aXXMAWkhMz1q0DgNsjuM1
	R/yQ9OQkhKOhalP8xfgEpnHlsYteN/YtTbVFphqH/aFIf6jdoLBAOq6IPwDaWwBw1uQ==
X-Received: by 2002:a05:701b:2802:b0:1b2:6d5b:36bc with SMTP id a92af1059eb24-1b39feadb75mr3802736c88.23.1794183326261;
        Sun, 08 Nov 2026 16:15:26 -0800 (PST)
X-Received: by 2002:a05:701b:2802:b0:1b2:6d5b:36bc with SMTP id a92af1059eb24-1b39feadb75mr3802676c88.23.1794183325325;
        Sun, 08 Nov 2026 16:15:25 -0800 (PST)
Received: from [127.0.1.1] ([2600:1700:b450:a0df:c754:9665:1e1e:bbad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771ea85bsm9105109c88.18.2026.11.08.16.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:15:24 -0800 (PST)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom: Add HP OmniBook Ultra 14-kg0xxx
Date: Sun, 08 Nov 2026 16:15:23 -0800
Message-Id: <20261108-hp-omnibook-v2-v3-0-f489fd0bdf33@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJsQ8WoC/12NywqDMBBFf0Vm3cgk9UG68j+KC43TOm01NlFpE
 f+9UXeF4cKBe88s4MkxebhECzia2bPtA5xPEZi26u8kuAkMClUmUaWiHYTteq6tfYpZCZ0jJUq
 jSZIUwmhwdOPPLryWB/upfpAZN8vWaNmP1n33j7PaeodcovyXh0Mha63zLG+oqbCw3sfvqXoZ2
 3VxCCjXdf0BN8ukf8UAAAA=
X-Change-ID: 20261025-hp-omnibook-v2-970e4290c445
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-ORIG-GUID: wyShrLMixb2lQ9rUlu4S_J2NbinCRvaz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwMCBTYWx0ZWRfX4detJVRR1UUi
 7mzJMNjLZGALTo2gBh0en01EaqOfgDnBZOdjLV95LkRJ21U/vX0IucrESj1lEO2udz8LthZTX46
 F77Ukx8lDHWW2Ux9I/3QzzUxV7N/Dfg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwMCBTYWx0ZWRfX2E7oB+/ff+P/
 kXw+qTKkVeEKSLxTMZrKI/vNV22ZkFIYYnN1MjvVNBq3TRigB+wYxlUnZ96aQXqNu4NtN+5scKO
 K6JezCYF3NWajvbYcdKVyuJpzr29Q+5Jndvz6hxtibjUKApxPmdUsmAjoVYz/FztV4R2+okfG0L
 0gAt8rN8BEi+3tNlsV4OnJ6TPKw6xx56LK1nmTPaDms60nz7NWh1o7xNuPZP/EUTXbJEU2snbSb
 WmkUQGx5/dH3a28FfDzv6stASe2nKeh5ACN0++BVutrRqk1qHzEnIqWVlm+hNyxuS4L+xL2a1jS
 QkmSGnuydQq2hkS+YF91BQTN7kj2tDWqJglx9+ksvdn1x5HxF6VSapCksGEzxIXPXW32O52DH9H
 5Dc1k1bljzFvWws6cOb7dfuLx6RAIm+kNNSpabJz155828jVOxtY4OH5VW6I8i1797mtqewED+K
 c5BHVcKRjLKsmB/ZuOA==
X-Proofpoint-GUID: wyShrLMixb2lQ9rUlu4S_J2NbinCRvaz
X-Authority-Analysis: v=2.4 cv=f+rdl+yM c=1 sm=1 tr=0 ts=6af1109f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IlVBBCHpe6Su3lOAXoAA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090000

This series adds device tree support for the HP OmniBook Ultra 14"
Next Gen AI PC (product SKU D29KLAS#ABA, board 8F03), a Snapdragon X2
Elite (Glymur) laptop.

Working on this laptop with this series applied:
  - Internal eDP panel (2880 x 1800)
  - 3x USB Type-C with DisplayPort alt-mode, USB, Power Delivery
  - NVMe SSD on PCIe (pcie3b)
  - Wi-Fi and Bluetooth
  - HID-over-I2C keyboard, touchpad, touchscreen, lid switch
  - Adreno GPU and GMU (Freedreno GL on Mesa)
  - Audio playback and capture
  - Real-time clock
  - ADSP and CDSP
  - 5MP USB RGB Camera + IR Camera

The device tree builds and boots on its own. USB-C DisplayPort output,
including over retimer/HDMI dongles, additionally needs the qmp-combo
DisplayPort PHY update series for glymur (not part of this series):

  https://lore.kernel.org/all/20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com/

This device tree was prepared with the help of an LLM (Claude).

Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
Changes in v3:
  - Rebased onto next-20261105.
  - Dropped the firmware/scm patch (3/3); Bjorn committed from v2.
  - Removed the reserved-memory/linux,cma node. (Konrad)
  - Dropped the "Assisted-by" trailer; LLM use is noted in this cover
    letter instead. (Abel)
  - Included the pmh0101, pmh0110 and pmh0104 PMIC dtsi.
  - Added "serial0 = &uart21".
  - Marked vreg_l18b_e0_1p2 regulator-always-on; it is the reference
    voltage for the pcie3b wake and reset signals.
  - Added the NVMe endpoint supply.
  - Carried the Reviewed-by tags from Konrad and Abel across the above DTS
    changes; please re-check if any no longer apply.
  - Link to v2: https://lore.kernel.org/all/20261101-hp-omnibook-v2-v2-0-1b99767deda0@oss.qualcomm.com/

Changes in v2:
  - Rebased onto next-20261030.
  - Addressed comments from reviewers on v1
  - gave sound card its own model name
  - dropped redundant items already enabled in glymur.dtsi
  - annotated gpio-reserved-ranges
  - Link to v1: https://lore.kernel.org/all/20260830-x2-hp-omnibook-ship-v1-0-9feada71dc79@oss.qualcomm.com/

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Jason Pettit (2):
      dt-bindings: arm: qcom: add HP OmniBook Ultra 14-kg0xxx
      arm64: dts: qcom: add HP OmniBook Ultra 14-kg0xxx

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../dts/qcom/glymur-hp-omnibook-ultra-kg0xxx.dts   | 1013 ++++++++++++++++++++
 3 files changed, 1015 insertions(+)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261025-hp-omnibook-v2-970e4290c445

Best regards,
--  
Jason Pettit <jason.pettit@oss.qualcomm.com>

