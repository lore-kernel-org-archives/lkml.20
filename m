Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905160;
	b=ruS/hPaFLeF7F/GJ+pjvcRW3zruFvvr03M4eebXe5DAnRYqixb8qbhc36TRYzQBscZs1
	 RGWxvI5HaaR6VoAoGb70yyxcuB01XZ29EV17/vwJM4vSbmeafeGXFzJSUlgLf5O3bgVVP
	 cN/HHW0mR7/HT12nQ5hp6WzedxQtezT/ja6zSJV55lfssjo1b7IJFhsoRWhWAglOac4v4
	 IdOm+UkHDhtjkUaQy479jWqlfHhaPWIgHThb7Vkr9+Z6WCftzEc9P0vNPxZqBYx0E1JCg
	 3r1PeVtLRHYtkJBb3rWvoAR/F/aJi4s0NhWkwzHv2xhBbKxPna1aYlYGh/7+z6K1APA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905160;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=A6pdC35Th33dCRVfmfQIEPxZrmhsEjdcOjU50FNkALA=;
	b=kpK97/Y4XdObGEGk/y1pq1LTzpRbWdXPXm5kc7sVyv8/yJ4fiyzE+VzELgLOUE+UL27H
	 Wn93NoePIITLt0AsMB5/jh9Ug2VQ3XGHZyah5BcbXWxitKYf1TZx2a5Pk2jEW6lUKY1qb
	 +eyWu5WPeqYUDGkYwIEfpD6WqI3m23gb2NWgN09e5cthAdBHFR5lgYxYXreulXHXFWr//
	 UT3zQ9AqttJia3vgM/IXZ7wqGIGsFHFNfRvWDXlIKORZJy96iIYdS2ajPaWEfyeOcQN+B
	 8tvnCy0gTnsHGUqlsTkmwPR5Flm6b7ScPqWY6jD8HAMmpLSuuHLqv8CMTM1Roce0KqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eD67Bjpp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="OhG/gJGg";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E898606A8BB
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E898606A8BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eD67Bjpp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OhG/gJGg
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6ex012998594
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=A6pdC35Th33dCRVfmfQIEP
	xZrmhsEjdcOjU50FNkALA=; b=eD67BjppWIgyG1YJe5RiUzc7gZht597ihqsjb3
	FlveHaXzG9kBtZS8LUjjb4kOSbw9nn4E0aQCOO16UfnwTAopmJl6oI+w6cF9jcPe
	W1c1BeiNLtRApO3TlDyrFM5wWmnjsdblZUNacJI1QrL9HJqkWbuR5eCJLgJfyE0U
	n0R9QFuZeZGPwKKDTCyfoETUzZmX+XpbWN4zRi10CBZRVi9yQXUXq2SR0lKdnIu7
	0CR6m6AquQEavnpMmm0ZQSLKbFWmkG+CjlH5vTkCQiwDh0FkzJAZ42G43aWXWQeu
	t+f8WMEkof2QOn9dzObkdinvHXZ+iKVdR9cKf6Z8oQ4Vh0xw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve0fwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:45:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb869327e7so3847598a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905154; x=1795509954; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A6pdC35Th33dCRVfmfQIEPxZrmhsEjdcOjU50FNkALA=;
        b=OhG/gJGgAtDPOL9OWKhfURY65H3xojezNiZLKP51QMSjgRmQgcmhL2z5hCZxKAWRGt
         NsiiW0WbPHD3ctdJZdjIu/46MGTSxD0bEUePR3L2rZxRh8JAFMu+fU0A+g3tJYd1M5A+
         1dTwJR2Yh/vYnaY35cOkRCZKdVuWZFOL7K2veB9wBHGqEJoMpBRJGLPF36SiRXxj+Bfb
         /ipjbRRt2r9mdbmSQIppTp6xrNbJ/pr87tpuhC2VR9Fe5X8LdKHW6nAlj/4d8inLI/ih
         tyJHX5Xpw4IVqIe38Fbpjj//UJIjdjrHpom1ZCyn1mEeCwiRQs2xbOkJs+kM7E2Y5T0K
         eZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905154; x=1795509954;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A6pdC35Th33dCRVfmfQIEPxZrmhsEjdcOjU50FNkALA=;
        b=kZdi1X+rVLKywR2w8ANV0ZcKX1U+12kl6V4OB9c6ioc+vcECEHzf2Hqt+jLChK8cve
         Q3wFU3uOIJIpv1zrZVHDjafeg9B6VQqDBKcQEQHjV7eMiJHbN/7oV0zi6Lk7IWEoSaP9
         GgvDbWQFoFzmtfbmm6V2Al38wfYqfC0mDEeNA1EsCoM4nnNXAESKR5tMvEm7U3owC/gw
         AiDVICyAzBAzT2r3394ZrW4JQFigXiZ0+J1nNptxHQ6xtBGjOlhCJxP/iJNsilYiWgvI
         xgrFokMbd+5y/h899zBMIVAHSRXb93krAsQqZ2UmrRQTIZU53tWGtomZn54ZQ23v3NAS
         f12w==
X-Forwarded-Encrypted: i=1; AL+hErENZKYm2i9YpmAozFO9lQGEi6aYyfIZwAez4T/O/PRdsWSJMIaaUC6bLHePqxizHpujpCfA4Bl4sCcgaEc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ej1ptzPeZZ64c9Ppib/NHDY1ZXBJvAiRUfKSfkVlRc0fJm26N
	6Sl9Wpkw7pP4zXsZ3PJsAvm/FXyDR7DBvdX967/Dp4/iT1wBN6fYlyJ4rfXlwvGdxkGwn7kewer
	brRHcX1c48z+QX1bMH5ksPo+gMefR5bXIafH58/5uiTr5ah63+gnaxMZ6kT7tb+pqnhw=
X-Gm-Gg: AYBFou1F+IqZdFqy8jctG3rY3K9LYWZOXGFsRXNc1uDZ2Up4abif+jR1DdORxba57sj
	68ZDUoatc75m1h3vf42yElBAe2yNwQijWWZmQv8KwBIfS0s5JVLRKAZttXOU0kwR9LaxHtRme7t
	2xnaQkevlazmqFDEqQf2hNtcpkoLUGp5ks8yFemluvbS1cD3Ujj9Xi7776J/hEzzLoBlhccwWIx
	f2AftjaVFze04f1J2N0ta902DPp7NT7AotA0wlryontx7xO7OldYq96PR5MhX9mtUB9/XLFL+6X
	5yjGfehd9SO/bXfPbwpBVTwSDsNG0ItO3nfkdTlCaR0mGkrwYZUlLe728IYCO8WaJmd/3oRwwGo
	pofY7qN/GxiTtQJ1SFw7QWw7FP8WhImd4aNMFGAfAjRwOlfOla6WT8zR58QRrnMxDbqxv/AfTnp
	dRPA==
X-Received: by 2002:a05:6a21:798f:b0:3e2:2b76:bf40 with SMTP id adf61e73a8af0-3f7a6e9f331mr10335159637.26.1794905153871;
        Tue, 17 Nov 2026 00:45:53 -0800 (PST)
X-Received: by 2002:a05:6a21:798f:b0:3e2:2b76:bf40 with SMTP id adf61e73a8af0-3f7a6e9f331mr10335143637.26.1794905153312;
        Tue, 17 Nov 2026 00:45:53 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:45:52 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Subject: [PATCH net-next v4 00/10] net: stmmac: qcom-ethqos: add Shikra
 EMAC support
Date: Tue, 17 Nov 2026 14:15:20 +0530
Message-Id: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIACAU/GoC/23NQQ7CIBAF0KsY1tJQKLR15T2MMbQdhWhBAUlN0
 7uLxIVJ3Uzy82fezMiD0+DRbjMjB1F7bU0K1XaDeiXNBbAeUkaUUEFawrBX+urkCYICZyBgCXU
 HwKEhFaB0dXdw1lMWD+izYGAK6JgapX2w7pVfxTL3X7VaqbHEBEtOasHbVhDG99b74vGUt96OY
 5FGJiP9ZZo1QxPTdcBY0w5EcPqHWZblDSbxwQIGAQAA
X-Change-ID: 20260903-shikra_ethernet-ae7bee5e804e
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
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
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=6868;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=7TpJOavRGewnNemNBQ57hic/9O2QRq+vTMnnYYXy8eM=;
 b=RfA2sASEs8xpYrFLwoQcuuPJhqXZDFQkC/PbaIje71xl1STw+4Axt40DjssPJxfugzILBwQ1M
 S6rkIJ+BWKkBoNOcCSqsy4A8k88UtbqPGK7LE5SFiDva9PWoH5o0lXC
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfXxk24Ywyj1j9p
 F45QmWw7PYQXAq2mPRepfCtcHVwsksPgfH326P7j4muotsOl8gpnO1UX1iwjf1ng6gw+NoBKtAD
 pdPbTNmtr9mijxmWZYbVNhcfvkGBfr8=
X-Proofpoint-GUID: MpxRQspSXrsw0SEoUGRv82nM58CmTifq
X-Proofpoint-ORIG-GUID: MpxRQspSXrsw0SEoUGRv82nM58CmTifq
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afc1442 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=ee_2aqc6AAAA:8 a=EUspDBNiAAAA:8 a=3FMM8ssWo7dxxMFcYGwA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX9gynhJ+iXIvI
 WfZ5FSHKf/aRlt6MZmGthSwpLKSLRlbNb7rZMWQphlOYBXYdztuozLbQTJAXmftxV+nAWaIKH3F
 4iokjeRaIOpzUcOk6ixTXyEMw5dc6j+/P+IKgK5xXLmFqOR+S20sAz1MHKm6SJwTg2daE/+W4wV
 LyZy2hYOnH7EDGmTRg2SBeeHvZ3Md54MvCssdxsDrfr4bnGcy9nIVsvLrRdVNjKjNKZtRrzWSjY
 tozor7WDvZl0fxg/dyi2/3nZdvL5nGrBI68nKTSLzGY0EID4SfS6MrAioMn0zwIKR4xvGcj62XA
 XH6yEfbWLoG+gwXp8jaxojMkAA01FX+I2es5gzrksflKxvdQvC5ueFXzoCHvVqTMPrSEKbY2Ifh
 v4TdTZE+Urjz/OClQSngL3WEKZL56tI+yJyEagSfvNAdKM44Zwx8AaPvdTRaBKjyND3D4GOhqHs
 HL+xg4FVd3i3ID3IRyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170034

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
https://lore.kernel.org/netdev/20261015143849.483339-1-elder@riscstar.com/

2. The generic RGMII fixes from the RFC remain. As suggested, the new
flow to use phy managed delays is protected by a platform specific
boolean to ensure that it affects only tested hardware. Legacy boards
will remain unaffected. Some other optimizations are carried forward
(initial link clock to SPEED_10, common structure for custom
dwmac4_addrs).

3. NOC clock voting (patch 8) now uses dev_pm_opp_set_opp() so the
required VDD_CX performance state can be propagated through the clock
controller. The Shikra binding (patch 3) is updated accordingly: an
if/else block constrains Shikra to exactly six clocks and requires
operating-points-v2 and power-domains.

Testing:
The following boards have been tested with this new (proper) handling
for RGMII ID:
  - Shikra CQ/IQ variants (with the TI DP83867 PHY)
  - QCS615 Ride (with the Micrel KSZ9031 PHY)
  - Talos EVK (again with the Micrel KSZ9031 PHY)
  - Talos Lyra EVK (TI DP83867 PHY, this board also has a GPIO-gated
    regulator for the PHY power supply)

Changes in v4:
 - Re-added the bindings patch for DP83867 PHY regulators which was
   accidentally dropped in v3.
 - Skip dp83867_power_on() if CONFIG_REGULATOR is disabled to avoid
   unintentional delay due to its code stub: Sashiko.
 - Moved operating-points description to the top-level of ethqos
   bindings: Krzysztof.
 - Added power-domains as a required property for Shikra due to its OPP
   dependency: Sashiko.
 - Protect the phy-managed delay sequence with a platform specific
   boolean to avoid impact on legacy hardware: Andrew.
 - Dropped "net: stmmac: qcom-ethqos: warn about legacy RGMII PHY modes"
   since only Shikra and QCS615 are going to use the RGMII-ID mode.
 - Added additional details to some commit messages to clarify Sashiko
   queries.
 - Since QCS615/Talos was also tested, a new patch adds its platform
   descriptor with phy_managed_delays set to true.
 - Link to v3: https://lore.kernel.org/netdev/20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com/

Changes in v3:
 - Remove #ifdef CONFIG_OF from the dp83867_power_on() function. This is
   a result of the recent discussion regarding similar handling in the
   qca808x driver:
   https://lore.kernel.org/netdev/atCSWZQAyqvz62_K@aspen.lan/
 - Clean up the -ENODEV handling in dp83867_power_on() and use a boolean
   to identify if supplies are provided -- Lorenzo.
 - Patch 7's commit message now says set_clk_tx_rate instead of
   fix_mac_speed -- Sashiko.
 - Add a new patch to abstract away the common dwma4_addrs for different
   versions of ethqos rather than duplicating them -- Lorenzo.
 - Use OPP table to set both the required clock rates and power state,
   update ethqos bindings accordingly to specify how the clock rates are
   described in DTS -- Konrad, Lorenzo.
 - Link to v2: https://lore.kernel.org/r/20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com

Changes in v2:
  - Collected Maxime's Reviewed-by tags.
  - Updated Patch 9's commit message to explain the double enable vote
    on the "stmmaceth" clock. Open to discussion on how best to handle
    this.
  - Wrapped regulator vote for dp83867 inside an #ifdef CONFIG_OF check
    to avoid adding an unnecessary 200 ms delay on systems where
    devm_regulator_get_enable_optional() would return 0. The change now
    mirrors the QCA8081 patch -- Sashiko.
  - Fixed ethqos_set_clk_tx_rate() to double the rate for all PHY modes
    other than RGMII-ID -- Sashiko.
  - Moved warning about the use of non RGMII-ID mode to probe instead
    of fix_mac_speed to avoid spamming during each link up event --
    Sashiko.
  - Fixed error unwind drops OPP before stopping link_clk -- Sashiko.
  - Fixed OPP vote set in probe not cleaned up on error -- Sashiko.
  - Link to v1: https://lore.kernel.org/netdev/20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com/#t

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
Mohd Ayaan Anwar (10):
      dt-bindings: net: ti,dp83867: add supply properties
      net: phy: dp83867: add regulator supply management
      dt-bindings: net: qcom,ethqos: add qcom,shikra-ethqos compatible
      net: stmmac: qcom-ethqos: convert ethqos_rgmii_macro_init() to void
      net: stmmac: qcom-ethqos: add DLL-bypass for PHY-managed RGMII delays
      net: stmmac: qcom-ethqos: set initial RGMII link clock to lowest speed
      net: stmmac: qcom-ethqos: share common GMAC4 address table
      net: stmmac: qcom-ethqos: add per-platform NOC clock voting
      net: stmmac: qcom-ethqos: add Shikra EMAC support
      net: stmmac: qcom-ethqos: add QCS615 EMAC support

 .../devicetree/bindings/net/qcom,ethqos.yaml       |  54 +++-
 .../devicetree/bindings/net/snps,dwmac.yaml        |   2 +
 .../devicetree/bindings/net/ti,dp83867.yaml        |  14 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   1 +
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 286 ++++++++++++++++-----
 drivers/net/phy/dp83867.c                          |  35 +++
 6 files changed, 327 insertions(+), 65 deletions(-)
---
base-commit: 6964ff21c5d8b75649211a52dbfd92753e605649
change-id: 20260903-shikra_ethernet-ae7bee5e804e

Best regards,
--  
Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

