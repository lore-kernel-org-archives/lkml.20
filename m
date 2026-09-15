Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1103CB569
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437416; cv=none; b=DjXgKOlfESR9XKXu4xvc9PHRveDlbEY6TGaMRFvy1vIrN+ryYtUqyAUmlkwZivhfeeR4it6rPFkKCMEk3IePMoJw6CmgxS2C9X4URhnZ6UJb2FBDJEwGgdmKfpWdSMmGgVBWSY6N0Wz+tz0Yi8lXOeFPYNdMbyVaxRege/ffO6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437416; c=relaxed/simple;
	bh=LY+heOSrzYgkNtAo3TL8L07wyA3u8iJn4hbRUUiBQTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SPvsSGij8hKtpwq88rYWfwG1UoBAqGKjf2g0EgbpXxVooSZUHcVcystVei41pq9fEkeUxZLrNACjXNBjRxjRCE2rgNEO7a8Jhw03yk0MH125xDditN1Fdg7XL9CuHW/KdHFbdgk4tyY2m3txiQp5hqyo9UkrYhAckk27w6GSqJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fsOsEL6h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L1g4/L4A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fsOsEL6h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L1g4/L4A"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EN0NmE1985910
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XsKGzaSEmTviNB6QZAhWmjsjxha6zfVDQce
	LidBhjMw=; b=fsOsEL6hyt0htehjVUCIWQxeZ3s6pv4HC9lFoNZrEe0bEK494iB
	iW7KfGS6jOaDDg2fHQ9PEHtL5B5h1dN/Plj+eD3Bz72wbWnuE6vTiMdBWLjo5x8u
	SsS279OlAbISQtdOTopc6BPH/VCQYlE7KCjSWUnOx78Pboj8duLSROhht8luiohf
	9MPxyi0SgduF+WUEqsJQlsfA5FpgK1+lV3cX8WiX//4erQc54zLede+Cqjxq0vSL
	bWZ9uKgm3SaB3B8DFtrB3qOXSSxwhxW8wPRMthRp2BGFhPXXD+06xPTFdzfSEZWT
	XToAP/rCL5F3vIj5klozb7a8qj1BAfi9TFw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpnet1k7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:56:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d9336581a2so75261515ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789437413; x=1790042213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XsKGzaSEmTviNB6QZAhWmjsjxha6zfVDQceLidBhjMw=;
        b=L1g4/L4AldLgsHUR6YTe4ABS53iCKyEvVivocDTT5SDwmM/riBbwcaZBYd+ZcIgOjq
         OCG3us5f2xtmJjXoiUDh8pqZQQuggsj+XVLQZEdkRuehA0jTRFPWhZo7fkHUz2a+UZwi
         NM75pNJBFWIJ3V2haTVqJ4M+Kvge7ScYREpeK38vNye+h4yQGdRAZ58QZCNJ3/YI7N5Y
         PgnG917av2A4Bi0uqyRA/ExFf1PkV/mGLqhTiZsVCTmOJ0szYvtmmpZLS4+GAhJLtwZ4
         043URYVwpLBYq06iJt2K5/cudsYAzLPJfEsdSvC7zsB8KsmcWFJDZBt7c88jqLWN/aTE
         BztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437413; x=1790042213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XsKGzaSEmTviNB6QZAhWmjsjxha6zfVDQceLidBhjMw=;
        b=mRn5UXq4YD4uGs/UqtOAiRgvzIofElBjjtfVhDQNkYwtQzLgwkcVU1lfPCGXU7Ddye
         /8weuNAI8P43QspufaJqCZxjOQwOkQxRpNBQJtu51+n00I+8lEZE0aNRTVWR68bpuRkM
         bkawUS85v0pd7Pgpf0ULt58J1giyl2LRNBnx1b05S18iSRrX0fnnBj84GgDoN8+sGIm+
         A9kK4TCnpBNn6t4i2ZWgOTCPRaU58xtyPl3Sfwcn+vsFWNq1E6TNfoti/Lbbv9GxuT6Q
         YZhVfN6R5OsfZC3ADQh/eEqlZ/lUm37gaBHk34VsNNIZwvcNkUk836kk65BeZ4ees3hg
         JWTA==
X-Forwarded-Encrypted: i=1; AKwUvBzwCYNZvgfCGVA4ToS/cQdeTH+LmSIJhG/QdQD5B6RHqrDNFwgkKFv3yJzjml7MHRB6rkW3RlfzJboRmrs=@vger.kernel.org
X-Gm-Message-State: AFuF++mt9kWgpf+5touJlgl2ySMJUWaMnDnGEv6A3mw/qFVzyT2dhvRv
	2XkPQIfawxn5CyhTm6FpHNcN7tAlDmtOxA8cDKNWF3rk3kvfrduOA/9IDzH96lHfrMILJETUbVy
	KuWC3tA4UjVuVk6EpJ8jT1m3+YW7LlDDa5MLPnQcU/OgqHwXPfm+nGNPEH9vVhC2YJ0E=
X-Gm-Gg: AYBFou0X9USzfBdQYltvk9qML8kVU8VYMxZ+tRShmZU8Ax3KiZIrokKjFO0/OUS4yvx
	PC0v/dBYzvJoKF8oARIdpkGExJ20MRR20rfvhRay1usV4tOADVtHKsWcA9xUqEJzwNE4dBO4foa
	a4BKDFObwD9acEZ8kuIbrPwTgo0WMQUly7rhfInUQFQ4OaMYzeXM+QsJwQ8GZcijJmRXLkymGWx
	WJWGrIuzoP6IlOKtkvvExZKzDHvnOLcuFDgCO3oKgT3nAj23mCgimReNyYAmeSSmDYu0ov5Tp87
	qAf5HiwGNLvqzH1cfb+sN+GDQ0pm8rJZTWUZYUJAeLCfgCHEO1DnEYZsqIZfzj5DTzeoHDE8aJK
	SKOrnQbjdGBYUO43clx58kUKlJuixKzBJgXCwNh/UFhidewmwvMGi8+lxNJej
X-Received: by 2002:a17:903:f86:b0:2d1:134:b86e with SMTP id d9443c01a7336-2dd6c5cc385mr102248245ad.2.1789437412817;
        Mon, 14 Sep 2026 18:56:52 -0700 (PDT)
X-Received: by 2002:a17:903:f86:b0:2d1:134:b86e with SMTP id d9443c01a7336-2dd6c5cc385mr102247465ad.2.1789437412193;
        Mon, 14 Sep 2026 18:56:52 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50e3sm31115791eec.29.2026.09.14.18.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:56:51 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/5] arm64: dts: qcom: nord: Add PCIe and WLAN support
Date: Tue, 15 Sep 2026 09:56:27 +0800
Message-ID: <20260915015632.283642-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAyNCBTYWx0ZWRfXxr8sjOurmCn+
 LijzRvsuiIUReGc7ykF26V5BpPbITLfiqQByU8Df28KHMLoHnf7mu8VdlpZj7HQwKbs9FRuQ/aV
 JM1R0QkFqF0ZJkDsy8nKdQ7Y7dfi8Oo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAyNCBTYWx0ZWRfX6zURwWIzW1eR
 +WQb7I0iWNW9EZ74ylfjBzGpohzo+hfP0ir3tik0hDNZ2fT1IsdcFQkc6PlJ2Tc6F4nNF/cqG6U
 G4Q35JrhEd2TsfEfktJn3aV7qaF9rU4VbWgDeFGyI9MpG7cu/6Rw5JznLuyztHwFbUPJL3j7+Qq
 bLq2JuuJcPVvvyBW7KdYJtcvMAp6XVP2xWndFtJBm+wlWlxvbBa2Q/iDvHadVsTelipOHDmfurO
 Kws13RZHnooovXogy48Yp4s02FSo3hktonQ4CBIj/etvvAV4Csxk17SXu9FLGR0smJaHxa9uV9A
 WrrydmoBlL2Zy8uLogjCWY9b2+aBVnqtVsxTDNP1AgygM+Ypujgkey2WrFYwIT4/KxuKqT6AmW/
 UJlvR2+93kqQcuyJtxTm87O0sCCTCiqza80uje8HA2g4mR1VLVO9AcAPWC9+rOdZNoQH7XadHLK
 UoTeqLyCPf5e6/08KhA==
X-Authority-Analysis: v=2.4 cv=PKKaavqC c=1 sm=1 tr=0 ts=6aa8a5e5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-CvtibuEYNIfTV4diQsA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: iVpwpYxKytymO2F2EHXCuxol3j4J0mRT
X-Proofpoint-ORIG-GUID: iVpwpYxKytymO2F2EHXCuxol3j4J0mRT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150024

This series enables PCIe on the Qualcomm Nord SoC and brings up the WLAN
modules on the two reference boards.

Nord has four PCIe controllers fed by a single quadfurcated Gen5 QMP
multi-PHY.  The link topology (x16, x8+x8, x8+x4+x4 or x8+x4+x2+x2) is
selected by firmware through a TCSR register that the PHY driver reads at
probe time, so the DT only describes the PHY ports and hands the driver
the TCSR handle.  Patch 1 adds the PHY, the four controllers and the PCIe
SMMU; patches 2 and 3 enable them on the IQ10 Robotics Reference Design
and the Ride Embedded board respectively, along with the per-port PERST#
and WAKE# lines.

Patches 4 and 5 add the WCN7850 WLAN module sitting on PCIe2 on both
boards.  The two boards power the module differently: the Ride Embedded
connectivity adapter card derives the core rails from the module DBUs
gated by PWR_CORE and PWR_CTRL1, whereas the RRD generates them with
discrete on-board bucks behind a single core power enable.  Both are
described as they are wired.

This depends on the Nord Gen5x16 multi-PHY driver support [1], without
which the PHY does not probe.

Dependencies:
- PCIe and PHY: https://lore.kernel.org/all/20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com/
- DTS prerequisite: https://lore.kernel.org/all/20260904081619.593602-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Add missing leading zero for pcie_smmu reg property
- Link to v1: https://lore.kernel.org/all/20260914071944.164217-1-shengchao.guo@oss.qualcomm.com/

Krishna Chaitanya Chundru (3):
  arm64: dts: qcom: nord: Add PCIe PHY and controller nodes
  arm64: dts: qcom: nord-rrd: Enable PCIe controllers and PHY
  arm64: dts: qcom: nord-ride-embedded: Enable PCIe controllers and PHY

Shawn Guo (1):
  arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN support

Yu Zhang(Yuriy) (1):
  arm64: dts: qcom: nord-ride-embedded: Add WCN7850 WLAN support

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 926 +++++++++++++++++-
 .../boot/dts/qcom/nord-ride-embedded.dts      | 151 +++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         | 158 +++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 297 ++++++
 4 files changed, 1528 insertions(+), 4 deletions(-)

-- 
2.43.0

