Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84C93546FF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 18:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788461647; cv=none; b=aJqdCEuzqu2vGtUBNqiyU9s7foXJ3VIY2ZD2CnoggqLVgtZKdNH3vo8cAbQhjH/ApxjQGTf/66wQBIn8821JOndq5iF+54EbmnWJgFC1kaGko1FxJ/kgDA2yExR//4Yyc4P3NdumWw42ClsKh5l0jBBpJsd1bK2gECsXq5TW5+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788461647; c=relaxed/simple;
	bh=jkQki04nla6n2qSli7OU4B/MaOggI1fMv/5WEisQM20=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B4qt8XCQiXmaJs9QMd0ORlEKAfHhGWpJYSyXhyvU9aCziJBZXSwWUyclWQJ8NKoN6S3kgaSkYWSxyL+JuaWKLPwrJw41Nibo5rSsomNrC1VUFbGG/ikH8F+ZUhGu77+uhf2IHqc4neVhWA8vxNrGEmI643FaOaqzzZ6YCtGRGck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OOUVLY6j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b7KrFWP4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OOUVLY6j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b7KrFWP4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G2pI11698712
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 18:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YfIfvoK+FI2vd7dzKE6Ouv
	+LdM6/QML+2NPw7na16ZM=; b=OOUVLY6juR0atG1ZKT98zwH8K7kbnOLYTthPRH
	hUeR8qtXF7HMDhYGa7fK8YN0fgPJtGOfl0ncNqcopeU4RrTS1ebWt5h/S1fuBf2Q
	NY7tgqkOOdE7n9BJxkFSRFPn8izdUt1H2LsynnQmFa4oMBYoO2ClW6cDV45x4TTw
	qd2MNFcjJ4pnnoYsZ1SrPDXjuVkVeop062q4woV4/kzYFIDhwRLU1WHujKZfxVBW
	mHZEOCypZ8x5k6hkQNgi/6baQKTiwsmNb+G8+IbkRIv2LCoJ5prLG+0JpDY8/GWs
	3jWjkEX1q+kv8Z6snC2k02tK9Y9/0dTl5EzCe6Q2jMVAD2WA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfbyvgxcy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 18:53:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so226532a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461636; x=1789066436; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YfIfvoK+FI2vd7dzKE6Ouv+LdM6/QML+2NPw7na16ZM=;
        b=b7KrFWP4K7uPhzeTzxFjdICNFV2huIqk/4piqPfWEnJ1SBMcQ/OY5mw/onP6Fq1082
         3ToGuamh2AxXmH1cwqHzo/pAoajtDRGUUI/uyVGuDDcr3kLnsa2bwYOQQBXSYBtNceE3
         vRk9YOkziQHLQQHkw3h0Y5qQiCz4AZyqOVi3LJWk+RigeH8QFWNHGQNzkPE+QQPQFcO6
         j7JV3Gy/58vD/DdOmyYjN36e5l0SaxspQjUaXfdn8/iNQlEGPZaQSSSF+Xrsv96PtmBu
         B5aBCIs5IXafsLfEc4cKJav7hWFqnTWoz6iTmGvYpW+DJOmx9rIDct1Ld+O/b9WyULuV
         Clnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461636; x=1789066436;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YfIfvoK+FI2vd7dzKE6Ouv+LdM6/QML+2NPw7na16ZM=;
        b=ED3UX2V5/T3tDQqPY29jert/dQ7l9r/vT41ZZiA2aIosXvfoxV46VDwkPROV9r2Jxz
         OwQ46YPJbtZXEjRJOD2ldjqEQVV0Cqfgxzp+BtW1Q+6592EG4XE8+fIJl499Zt5kQnTe
         p+zaLz204KzeTT33YmU9VApwCzTNgPS5kEqw9gHRSx8Am88t0llPkOrp32R8EAGJ3N3U
         4GmFY/VUH9XZ6dCjD9DrHGm3x4DIp4/rNMl16GcBo1BOg6GjTobQfK6dzKrHi6ZXDaKy
         mt6oylx8fZMFQgzgrpvm3NGGRN/5+mWEMls0Vv1D+sgY5Rs/byjo9zwk1D/bi8wpCHpP
         OV5A==
X-Forwarded-Encrypted: i=1; AKwUvBwN3mVXdI5uNTKjM2UiSXp2SwKNuqI4fErvLI0MUsOHH/ZK7oBA3YduIr7+h5L+E2fEHGfXrTRZtXbzbw4=@vger.kernel.org
X-Gm-Message-State: AFuF++mCpVapZ/I4SNY/a4AL4Qp7isVMaSqbAHuxRpmtXcct5xtyUwxG
	6JatZXuCMAakb4TXTWMP5tH/jJnix9O2SV49PC40Ot2F984dfPu/yY9tt7V9IFaIJpmLl2N/zGJ
	0OZV1AxNuw/PuF6jw/IIqjpN/8MRRszus4eVBSuWj+dy9NNhWAQ35BU7kpUJM36MU2p4=
X-Gm-Gg: AYBFou3ejakRZI8ckl1LoMwqAkqaxUki8AKPt0ktzFrcH4smJd6HpdBUCk0Zvuuk4H3
	plZX97fkvbaQZT8jqLDHR25SdQkHwRTxV+P5dVJieT4hR+uMytXVL5WnTDg+UhTZlHLjyY0iRKH
	Q1T8qfOXYho10jzX+6XPHaRu6gjtcHw08Elr0N8ftyQOoX1AjVecEFCkURnwD+CGokk0kiEgIcB
	4EmTzGyolkHD1pr7Rcw1y14LoCFWX50rP12oB0YB4YUys65mUj+lIpqIf23JcyeQjJFBLh4cWxu
	MdOWIdYdOMyUZ1KZzvleHX9o9yrCwD1K9IHyon9Qt6gE4vWkCWmAUV53QCi4JvmjCr+5U9dPLg2
	L09BPqdoxrtpHPGz3QJtZvs3/0gdbGA==
X-Received: by 2002:a17:90a:ec8d:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-39b261002f5mr871662a91.6.1788461636417;
        Thu, 03 Sep 2026 11:53:56 -0700 (PDT)
X-Received: by 2002:a17:90a:ec8d:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-39b261002f5mr871599a91.6.1788461635851;
        Thu, 03 Sep 2026 11:53:55 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ce1csm778829eec.4.2026.09.03.11.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:53:55 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Subject: [PATCH net-next 0/9] net: stmmac: qcom-ethqos: add Shikra EMAC
 support
Date: Fri, 04 Sep 2026 00:13:42 +0530
Message-Id: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN6/mWoC/x2MSwqEMBAFryK9NpDxO85VRCTq0zRClE4QQby7G
 ZcFVXWRhzA8/ZKLBAd73lyET5rQaI1boHiKTJnOKt3oXHnLq5gewUIcgjKoB6DEVxegWO2Cmc/
 32NJfcDgDdff9ACahDhNrAAAA
X-Change-ID: 20260903-shikra_ethernet-ae7bee5e804e
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788461628; l=3811;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=jkQki04nla6n2qSli7OU4B/MaOggI1fMv/5WEisQM20=;
 b=+v6PObHonz99GSWe5CJUTp4vTnsVNRrUqDxzeSCcBd55iqpEKpmYtvJpryC0nK95B/4Ukb36O
 2eXo90saUhfA0WMBEkqoiEMtjiI0FLhNEETdWF8B+Jd0c0jgxd4MZis
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-ORIG-GUID: HMpBQL91zvwJgDGQ8plMOYrH8iNjroFb
X-Proofpoint-GUID: HMpBQL91zvwJgDGQ8plMOYrH8iNjroFb
X-Authority-Analysis: v=2.4 cv=C8vZDwP+ c=1 sm=1 tr=0 ts=6a99c245 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=ee_2aqc6AAAA:8 a=EUspDBNiAAAA:8 a=aofnmw3WZ5OT6iA2A7UA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX/n0kMnraoO81
 4wVss/xfDy/R30+KNc2EjEliH1h5XnNxOXh53yT9f0AVP40Ezgf+QS+A4OfpSrNzd9vcOWGbJYB
 cZ6YGH+soNcVMEkEafU0rpowkok4XJsjm+R4cHJnBeStGTw/WZfjnffEQM+wHW2C9xElvsnj8wg
 LI6sEyAT4yxLKdp2XLeLRZB5biPbw61IQspT0QEk0gxAW6AzyjHxBtiN/N9h4zG4fC/Sc4IQVGb
 MjbUYLgHet5J2nu0YpbMnFJLZuKWurKStdWtFOXTC1VLMb2K3x5lg6lE16TuGdbCAoiLzTQZkeH
 OCTzTub9l64F5D6+fasCJAivDV2OwWgF7379OZktrS0/PpqPrHZ7CPNTLExFVINDYCUvMi/D02a
 6DxWFxzBPDZMXug5Iz+onOrUidUR+12tEzgb0l/PM0Odajh6tyQTA3WXBWRQ7qgQIR3loJxOlc5
 z9pyW/H0gWGd3YvcQHw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX0ymVrU/jTG8C
 C6ms5ZrMvYVHjQEB7dLFOKICRyFSItNcdqDBj7Jy6CPtEf1digg/Xxjr3C4nPCWVn3F1dO8GHGT
 VZ2nVN/zRRsXZky4s+P8MP4HB46rMFM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030165

This series incorporates feedback from the RFC and adds the dt-bindings
and driver changes required to enable Gigabit Ethernet support on the
Qualcomm Shikra SoC. DTS changes will be sent out separately.

The series has grown from the RFC and can be broadly divided into three
areas: PHY power supply management, proper support for RGMII ID mode in
the Qualcomm ETHQOS driver, and Shikra specific clock dependencies
required for NOC access.

1. Shikra EVK boards use a GPIO-gated regulator for the DP83867 PHY
power supply. Patches 1 and 2 add supply management to the DP83867
driver so the PHY driver holds the regulator vote at probe. These
changes are largely inspired by similar work done for the QCA8081 PHY:
https://lore.kernel.org/netdev/20260605010022.968612-3-elder@riscstar.com/

2. The generic RGMII fixes from the RFC remain. As suggested, an
additional patch now emits a warning (patch 6) when the legacy "rgmii"
or "rgmii-txid" modes are detected. A new change (patch 7) now
initialises the RGMII link clock at SPEED_10 on probe instead of
SPEED_1000, dropping the unnecessary 250 MHz source before link up.

3. NOC clock voting (patch 8) now uses dev_pm_opp_set_rate() so the
required VDD_CX performance state can be propagated through the clock
controller. The Shikra binding (patch 3) is updated accordingly: an
if/else block constrains Shikra to exactly six clocks and requires
operating-points-v2.

Testing:
The following boards have been tested with this new (proper) handling
for RGMII ID:
  - Shikra CQ/IQ variants (with the TI DP83867 PHY)
  - QCS615 Ride (with the Micrel KSZ9031 PHY)
  - Talos EVK (again with the Micrel KSZ9031 PHY)
  - Talos Lyra EVK (TI DP83867 PHY, this board also has a GPIO-gated
    regulator for the PHY power supply)

Changes since RFC:
  - Two new patches add supply management for the DP83867, replacing
    the gpio-hog approach for PHY power -- Konrad, Andrew.
  - Use dev_pm_opp_set_rate() for the NOC AXI clock and require
    operating-points-v2 for Shikra -- Konrad.
  - Warn on legacy "rgmii"/"rgmii-txid" to encourage DTB migration --
    Andrew, Maxime.
  - Updated binding document for qcom,ethqos and snps,dwmac.
  - Drop the duplicate "axi" clock from Shikra's DT; use "axi-noc" and
    "pcie-tile-axi-noc" as the only additional clock-names.
  - Initialise RGMII link clock at SPEED_10 rather than SPEED_1000 on
    probe.
  - Link to RFC: https://lore.kernel.org/netdev/20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com/

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
Mohd Ayaan Anwar (9):
      dt-bindings: net: ti,dp83867: add supply properties
      net: phy: dp83867: add regulator supply management
      dt-bindings: net: qcom,ethqos: add qcom,shikra-ethqos compatible
      net: stmmac: qcom-ethqos: convert ethqos_rgmii_macro_init() to void
      net: stmmac: qcom-ethqos: fix RGMII_ID mode to use DLL bypass
      net: stmmac: qcom-ethqos: warn about legacy RGMII PHY modes
      net: stmmac: qcom-ethqos: set initial RGMII link clock to lowest speed
      net: stmmac: qcom-ethqos: add per-platform NOC clock voting
      net: stmmac: qcom-ethqos: add Shikra EMAC support

 .../devicetree/bindings/net/qcom,ethqos.yaml       |  50 ++++-
 .../devicetree/bindings/net/snps,dwmac.yaml        |   2 +
 .../devicetree/bindings/net/ti,dp83867.yaml        |  14 ++
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 211 +++++++++++++++++++--
 drivers/net/phy/dp83867.c                          |  32 ++++
 5 files changed, 293 insertions(+), 16 deletions(-)
---
base-commit: 7042c8c193e5d634198b7c766bb3a01c8e3ee0e2
change-id: 20260903-shikra_ethernet-ae7bee5e804e

Best regards,
-- 
Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

