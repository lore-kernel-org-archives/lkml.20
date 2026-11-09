Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794241553;
	b=b6eLf4rBQvo3gi4yZOm+EmkQmE0g1ndINDLGkbluXpUAylzJ2W8DUlnIpE9s019Zw3u9
	 opo17ac0WrG78l+aH760PWQf5QQ4pwMCp4TnxiLnfpcwY0y9FYBmHZg4ampnGkPT2nc/U
	 50Wn7iLgnGb8T287Uq4SvM3qrT2Lpji28qVu/OKZHAHP41qystiqujaU6bYF6Jsfzkt2E
	 JO6YfZyeZFvtMZkUgcWlWbM6dGyOIZi/5eaaPx2fjiQHOLXi+yL8358rMt5/dH2TjCCwv
	 j3g445/3cqMUDy0QGOs2g6NGuVi3N8Nen3Bn7WyFaCZp4C+CrEtHofcLb0hqvNyjXdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241553;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Qg1V463gUReG+4gM1Dk/R/e1+HVru/NEqD6F8D/JXXc=;
	b=dznsE8tcRJGm3eE9gTihnPazLSI0VPaxckc6jKW6OvbLoEFJxTYuoNEpDwjjEXEGDCFq
	 fbkSSdMdAyvycoJhU0s/JLgpN0SwSkiTpnGFxfxx0hzY1oUVyzRh/lvRDs3JCJk4R+8IH
	 7smOAc1pWLbxnHe4PlW49rmqpGAT00FFLOsu9WroiohjeDDZqacFH574wF6fM6WbSSscs
	 C9RHSQBPF04SfisSpgZVTOZkHpKs9pAxqHtIz0g1BXzHAb0fPRRD2EuZ7av+gWepGWoT+
	 An9AxO5zx31rg1nJ+OMGgFmFLfHuoHuCuu6RAVBbWSE2gKGx7AvxUVR+Z5Siz5YKpVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=ZAFt7HR0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.51
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013051.outbound.protection.outlook.com [52.101.83.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B700A606EE8D;
	Mon,  9 Nov 2026 16:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B700A606EE8D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=ZAFt7HR0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kARqbNcZara0RBcU0r0l1Yii9NG8CpnaRzrFKvPZa+AGk5ctACnJAGHQYEwPBuRfXbVAZ53Qf9doEDAb7nbTzEZ9KtBioGw091tqtAUsAUW4tReYq23bldbWd1maxRcqzltPPoBJkJS/5adlGFtYKGl6LojL17MTy48QEIzboLt3LOAdNH3TsfWB2K/B3q4a1jq58hUEYP9uh4mkwSrzmq4i/cmsQoTIa73O1+0XZUDwDDR97kcpR9AncWH3Z7w5Q90HjXSg8HWtOGBL1CqFvjDbrR0/78BjSWxAkkvtWZNjje218aw67YXhFx1QFX5mVwBORaRNpN7tcxdTi68Bfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qg1V463gUReG+4gM1Dk/R/e1+HVru/NEqD6F8D/JXXc=;
 b=Qy+0w3ksYWKaC2lhg3eGR2l0KFnfghxB5r5j8WC1utIp6X+NUIvC6x9+DaejBsY5qBzkv3xrX+Xsxfi6Vu70EXMGqw30uZo405+aGi6hoVSjnILeGnyCAnR96ZxvHTQm5FqueMGw8F8Dk69IGRl+P3/aOJtTJJN24NmaXYyIzxIdGHK+dVB900wvScfXSwYVyblFOtAU96LzSeMvGM68hd7HH0uPJAAXLuxdeYlmXoHNx4y0ypntrnBpbnp/NKCYs1TXuOusj4UbJRt8kQtn6hC8nTVRVw86N6vvc/1GSqnEubajWNH40NUfiSfdR7smhhbfLJKkVJcsVJY+eOWWxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qg1V463gUReG+4gM1Dk/R/e1+HVru/NEqD6F8D/JXXc=;
 b=ZAFt7HR0dWKs7wdN/kuN8ZuxQfZn1bJgUKSISQDVAb5IIypvR0zoyHkHY2zCry01ik5Ydi3qfhGmtgnZ73CsZBD32e8mQgtaSMnjtu1W+GILUab1hUs/sQyVJUL/UG1UgDQySt3v0RBVcq6xUKoSX8NqeX5YwF7im4BXoXq3CEYb9eDtsFuAlY+MkupQU63x966khcrgOAMwRzW/wuzfyVP6+/ivPdcCT4s8amRiRa+M8kWmr/vSM8w/JprfvvjjYx9AWjO6ervAX7PF1M1BIdbQTlwMRlLEv0N1dJEx6WMGyD+/jV6Dob4gFjwZhKR91D88CDcsyWRpXte4wZyBjg==
Received: from FR4P281CA0031.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:c7::15)
 by MI9PR10MB569860.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:290:bf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.7; Mon, 9 Nov 2026
 16:25:47 +0000
Received: from MI3PEPF00008554.eurprd05.prod.outlook.com
 (2603:10a6:d10:c7:cafe::9a) by FR4P281CA0031.outlook.office365.com
 (2603:10a6:d10:c7::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.7 via Frontend Transport; Mon, 9
 Nov 2026 16:25:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF00008554.mail.protection.outlook.com (10.167.240.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 16:25:47 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 9 Nov
 2026 17:26:43 +0100
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 9 Nov
 2026 17:25:46 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: [PATCH 0/4] ARM: dts: stm32: adopt hex format for timers
Date: Mon, 9 Nov 2026 17:25:02 +0100
Message-ID: <20261109-timer-use-hex-unit-addr-v1-0-b4abfa457adb@foss.st.com>
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
X-B4-Tracking: v=1; b=H4sIAN7z8WoC/yXMQQqDQAxA0atI1g04jgr2KqULNVEjdFqSGRHEu
 zttl2/x/wHGKmxwLw5Q3sTkHTLcrYBx6cPMKJQNVVm1zpUdRnmxYjLGhXdMQSL2RIpN3VBHA3n
 vHeT6ozzJ/js/nn9bGlYe43cH53kBG00YZ3sAAAA=
X-Change-ID: 20261109-timer-use-hex-unit-addr-545d9dbd3331
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>, Marek Vasut
	<marex@nabladev.com>, =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?=
	<goran.radni@gmail.com>, =?utf-8?q?B=C3=B6rge_Str=C3=BCmpfel?=
	<boerge.struempfel@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@dh-electronics.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008554:EE_|MI9PR10MB569860:EE_
X-MS-Office365-Filtering-Correlation-Id: 62cbe68d-9a2b-4fed-94f1-08df3e7e1c69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|7416014|23010399003|376014|18002099003|10067099003|3023799007|56012099006|11063799006|261026121527099003|261102123227099003|261021121427099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	XMLNjKLFYWH15yDn18iH+HVGKugYsOXbGk8C7kjj59DvslpQrfpm6Av3gkbvVsmXmGNpKkajjXsRpDVvVKPwvweJ3iMytVX7cdro8636iZHXaBsz3VxKQ2+Ng35yIPzVMZs36LA2jD3tQDLgt6CqgkEOLX56Cz56aUMWsqq87UQfBkU+B4pFSo3/+liXVTcbMgrmvVNhspbcG3jmH3fAzlsX7RPOz9V3mMhWlvynhgAfX/X47vZFdLk+M7XCY66q0MalNwRT5TyUE/aig0FWHz4pQZKkWy7oxPCyxvxKB0DkujA49B8LguQu9ZfKwDqgKcxcB0RNlicmzPRwrRZ1q3Wz1VmnuKOl8Gv07iHMD6dYUd736JG7iHwLCP9OKPf9onpkWLYkmMVcGU+Jp6d/es7mJntVMAVgPOqHSedCQDk+2t8g+Vbu4vGIOxHMVzSGioDvDB0aSDsbuqbZwHxMz4yo8QT5vS/UpINSG0bcu0ThkrpTVIatUnO016tVzw3FUz/+9bfJBXmuL34QO9xhxqERnGBau8ALZWukCwRcmbHSXp2mdsuVVooI7mI9lXhyhBBQVO3WrkOCfLLB8zsrv6Vyl1DYBEerRwm2HUik1y0VvyVnJITM2bB55sBqWaDhcn9Fd+nMMEIQxVGOkJ2JAO8bzU0YqB0V1wjnghadSgQ=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(7416014)(23010399003)(376014)(18002099003)(10067099003)(3023799007)(56012099006)(11063799006)(261026121527099003)(261102123227099003)(261021121427099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	e0zQHyXGgMKjTpPBrnd7JpPl93SlnLy/Yf0dfI09kwOwP+mIkLsUhlKKAotMpVL+CsdePDk3eBuLzCFk+dmyufaZaENjnohp3kUXya0KenwMmsq0ukMVhgVPqZDKMx086ewRf9f6gs7NLb0wtsfbea/duP81y6lSJCfJVhSOb8iy+CJJ1eHtEixYBqi2Y/rODICmfroMw2FOaUAQioOqK23Z+1yWSm3MpuSZq/bpvQZ7utwDmw4N3zeAUTU3XPe0249MWiY7fi/Gqw6XAhie9Cpnr9oqbdbwOX8k5RJ5bkhPvU2M0DsxHrd4WyvNv9btybmXsocBCCwDTmcJRqGxV37KvgULz7hmnDNc3gempTTE2x4uTny9/nrIN+CBJdqDk08OtmpEE2ow3fmgw4Id0aHTVKVmKcK5LHcShEVTLTa/g854cVz9SNrnqQ1Rsevr
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 16:25:47.2964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62cbe68d-9a2b-4fed-94f1-08df3e7e1c69
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008554.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR10MB569860

This series intends to comply with hexadecimal unit addresses for timer
subnodes as described in  ("dt-bindings: Use hex unit address patterns").

Also update hexadecimal format for 'reg' property in these nodes. Take
care to update the boards accordingly. Note there aren't in-tree overlays
impacted.

Purpose is to avoid upcoming new dtbs_check logs like:
make CHECK_DTBS=y st/stm32mp135f-dk.dtb
...
stm32mp135f-dk.dtb: timer@4c00a000 (st,stm32-timers): 'timer@14' does not
match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
...

Link: https://patch.msgid.link/linux-devicetree/20261102135330.2493332-1-robh@kernel.org/
---
Fabrice Gasnier (4):
      ARM: dts: stm32: Use hex timer addresses on stm32mp13
      ARM: dts: stm32: Use hex timer addresses on stm32mp15
      ARM: dts: stm32: use hex reg for timer2 on stm32mp15xx-dhcom-overlay
      arm64: dts: stm32: Use hex timer addresses on stm32mp251

 arch/arm/boot/dts/st/stm32mp131.dtsi               | 46 ++++++++---------
 arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts   |  2 +-
 arch/arm/boot/dts/st/stm32mp135f-dk.dts            |  2 +-
 arch/arm/boot/dts/st/stm32mp151.dtsi               | 46 ++++++++---------
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts           |  2 +-
 arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts |  2 +-
 .../st/stm32mp15xx-dhcom-overlay-panel-dpi.dtsi    |  2 +-
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi          |  2 +-
 arch/arm64/boot/dts/st/stm32mp251.dtsi             | 60 +++++++++++-----------
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |  2 +-
 10 files changed, 83 insertions(+), 83 deletions(-)
---
base-commit: f39a4c5c819bcf18c7543cccdfd2215ceb4daa53
change-id: 20261109-timer-use-hex-unit-addr-545d9dbd3331

Best regards,
--  
Fabrice Gasnier <fabrice.gasnier@foss.st.com>

