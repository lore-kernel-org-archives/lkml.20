Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011010.outbound.protection.outlook.com [52.101.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904EF47A88F;
	Wed,  2 Sep 2026 11:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788347164; cv=fail; b=k/IWaMdtlqIpRzNETmxymskuvhQ6DxW8jc9b8v59IGab6kxri6dZdpV3StnCXLJIOsgYO7OBR+VwapHnzlcj/x9apYjZ2KcRzLzBk1ki99gkPQGj321HmnRXBCV0TROFoSa5wDWYdXrQjHvfRabwPUEiV9Pdv65+Ect7RJ432F0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788347164; c=relaxed/simple;
	bh=luBpkiF6jrbfu2H/RAjLjQQu8stbN8WYKR7uzSzrF2Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=up5nk82L7cdZdzVVOI/iqx8IBMstVagurfj31H40rpiWUxwENy5Vr07GmCdNqszZmZkttUn4S1WkAasyvWWy04oTPg2RtXtDVxe7id1n6g8LOGBSUrT/vZdj0htu4RhGeDo3lgT6k1dOxhPIHhZXl42mbq5KzpbE6xbNaqWNHZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DXv+9vWL; arc=fail smtp.client-ip=52.101.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DXv+9vWL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZOSC50WqGmtXbY2KQrpBpLrvg733Ov4RkTCytRmPtRJIlQA/HUgZUVSeIhG0NSFqMUmkT6RlBkCmYtd6hjF89UUo7+S8u2xuqt7q1AYwblXTuf1TtlIIg+4WGHT0YufqSkh1NYdYiQ8CzrV6JIL3vOXtvY4yB+YKgnUj/yBw3xtL5BTaQAiPQ8x29zhIW/yKnVQkrIP3q7bcJ2Kl9AFE+NPzbEXIQJ7biFqSo/LiHRi69Vfm8/PJJwkat5rYxdrO5c/QJeqP6YXj1IpfrpWyDB1BVqvCZFdSCbjYmDTaqf9UhQXHc74uDOtMxsoPHz00xeSNPKAz1UABSToGDJGuog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9D5P4VLq/RFakqr1i7hLN0AlAJ1Og6mDEsBmjPfDhA=;
 b=KxkTMoBhwhaCWZfTuZj4aYDNdox3OXsNoxdbOvAfnE1KsMAzpPz5UM1Aww2pPGakXtoHCnOg91Qo9PuLPSOL9LXdFikLqO7Ik8Hh8F0XerBbSSICgEQN0uA3STyg6GDSg0FP/xZcZPlPTDuEVxP6tLBS7jp/DRA7lO4h+ntDlgRJHd5dx5eNb4Xiun8RAq8SIqjKFR50ufC2SOZ7HypBcRg6AS6suSI+tViW4fN5/mZuNKFWH+nEBwQo+cftcbenmAs5cT8W4qsObQvhMWYjgmorm2G9wW44cs1g8Iuet5K6PMJfmAGF+9eK8/79pzsSkCgcFyZIAwJeFP0nDyNEbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9D5P4VLq/RFakqr1i7hLN0AlAJ1Og6mDEsBmjPfDhA=;
 b=DXv+9vWL0MGiUZTyQaHXs2z3GlierOgOeTmm7dENeDrMEjW1xF5Rdw70hQEGgiqiJ/wK4ccDnu8XJWwkzkk/cxBqYJGW39UDJ2CDkxN2QWJUtyaIpaJe48ojZ7losyywvAtQnobvp66UUHBg0dhuAdmszQ+3fzBeE6FJ4Ly5i5RBT2PimnzDzusuf+kMHkrC9vJOwKpN6JFIhp/+zWaCveNr6se5qCTv2SVb9+MW1bPp/GOosWhCtkdgBSBD/G0KB/R0IjMZl8OQOr7nJVXuMvI7RPWxVSprPbesav0MmWVu48wufrZR3q+XFFmQ/epuqGGvnQfGh2kP7h801O654Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AM9PR04MB8131.eurprd04.prod.outlook.com (2603:10a6:20b:3ed::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 11:05:47 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 11:05:47 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 02 Sep 2026 22:05:19 +0530
Subject: [PATCH v45 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-imx-se-if-v45-6-6e400879d8ec@nxp.com>
References: <20260902-imx-se-if-v45-0-6e400879d8ec@nxp.com>
In-Reply-To: <20260902-imx-se-if-v45-0-6e400879d8ec@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788366919; l=1533;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=QsUadQeiO4ZJutxpy979OhbHSldPNXSAnx420m3jX1Q=;
 b=GuymTWNda85JijrC36EUfM1AS2J2u3Q88r6g2rafju4C244INsBJOMt0XLZoyGhfnDq+GVn/5
 fks0XKUkcHyAWHSKRo6UEY6i3lar4yYuvK0ps4xQuOucmLxhHTnl/Vg
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI2PR01CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::8) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AM9PR04MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: 58ea5f71-6105-4ad2-1957-08df08e22437
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|366016|19092799006|376014|22082099003|18002099003|56012099006|3023799007|11063799006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	ZmxmihHs3e/dSbEmH5bZilr4/oEHyj61A4bLjdK1BiIJVO4HjiZBZsS72fu4lWOAm/BuWgrfeUBBAeHGU5wRPHAWsUQhhRbwV8DIFwNEJ8/pFxC0lilR4cw+tJtrmk6a7YWJ/imBeVxf3rs4+q+lylO9ycCGGnO9S7ZWwByYwixkfedcmqDA6nVQ77mcpGsZYJtaTCUoJuWV5fds6Y5lY2pr3lsSf7HvfFToWfdlWT+EwRKC4fuZKubTA3ca7QtqXnNqs9ifdVUksOaIytCHtyqMiOP8iS2LXGJy/+LkpaXxBWs0Q6647NdeR+HKRJwnlU7bVe1cOGKegvtomSaUcVxLr7Of9gUIpvS11CKRkVk1MtmoezP5r1urmis6wFywdON/6Oa1VcM0q5GORDRn+yPRGqvFdUeHi9al1V3thbIbIBNoR9y7qOBivu1CpOfaw2XWwqf5TYq1ar0Ayjx8KRtxlujnLuQBrg5AiWY20MeHpAYlGNen4XLw9qC5GEePRp/9U8KpA4nvrjbDIHLyv9qeGnvH7osgirQLUbu6GFpUiYskHglF2f2Nl0AWUi1n1rbwQglBa+wbQO61s0Zut0SnRF5oh2HDJSNq+e4+s6iCNIVbijFqcaSXSZPsyQABUshE3JHx0akMKaKsQ6QiSG1h3yX397wIESqXtaOxNqsByUwTkSd9iSI3JaNafyje8IDAzcXbrKqgcRky5SU4zA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(366016)(19092799006)(376014)(22082099003)(18002099003)(56012099006)(3023799007)(11063799006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2thN3JJaVRiS0duSVQyRmFPMUNkamxwZzMvWlZMYWhET2FtU0doSStUZXBU?=
 =?utf-8?B?N0JrcUtFODNRQmJyL1RPNEptelZGQ2RQU29iaEhQRi9qQkNsOTcyZDBGOGJO?=
 =?utf-8?B?ZU9sSE1TejJ4aXQ3eC9xV1JHVkNYeW42TE9WdWh0djJQQVdQVkhBSHovcTQ4?=
 =?utf-8?B?SkwvWVV5SGN6Vkp3Qit2S1VhVXJQeUlzQ3lmc0pDNnl2Wi80QzNpQTFqMGZY?=
 =?utf-8?B?cGRCcTNJbmtvWFMyK05SQXVqM0VTb2d3d0dzUkMvMUwyMW1vcWZFQTQ0dWp6?=
 =?utf-8?B?MTJkWEwxdXBzL0Z1RWYrY20vekkxYnp4OFFCNTZpTzBWajJwVkFHeGZJc3BF?=
 =?utf-8?B?eEd5ZEwzMTBjbS9uN2hyVFBjZ0hRbzM3WXZDWXhsVDVkMWVVWDJzT2pVSGZN?=
 =?utf-8?B?cFVmWXF2a1Rqc0ErU3lrR0kzM3hRRkVxS0djV2lGNUQrQTNUNklSTVY3UktS?=
 =?utf-8?B?VXRZWkdEQWx0VkNwclBiZURmZU5uOXpKSm9hUFd5bjdLSmNPdkFuZWVYWGFm?=
 =?utf-8?B?V2pWdEhJL0Y4djBXWG1yMjNNWWp2bXNWcGhlWDFpWlZheURXVm02RmNaYms1?=
 =?utf-8?B?ZHhYRUliRXlOWGhZdC9zZFQ4UEZFbXhaZFZnQTRjZVJRTlVJSFFTMnFhL2hK?=
 =?utf-8?B?eHIybHNUQ3BwYUltUFg2MTRMZENUbGJRRDNpMVhVekpxQmVyUEZETWpCNFBX?=
 =?utf-8?B?Mmg4R2VsK3NuVEI1dVhyRzJpUkQzbzVnSUQ5YzBmeWVQVVJ6VFppY2p6cENB?=
 =?utf-8?B?VDZkV2lNQStBYnRKaXZlRGhjbzZkZlFkUVFTcldjSTE1RUJGdnlEWGpoNHA0?=
 =?utf-8?B?Y0xlTjAxTDdXU2FWVFRicjJtZDc5cGxXSmtFRTd6QW43UUp5SEJOTkJ6M0F2?=
 =?utf-8?B?NFlSUnk0L1d0NnVVNFdweVZHNEtkNGtYZHMvUFZlL0lBWnBXUGpFd3VXb2hh?=
 =?utf-8?B?bXJtdUxHWnljV1Z3UFd3SG9tOEprblkxUEx6RXRpc2x1Z2U5QUpWK2Foa1RX?=
 =?utf-8?B?cTJiTXlhd2hqSlRvNER4dHRUczVXMGlxdW8raFdISEJoZmpTZ0h0VGxHNC90?=
 =?utf-8?B?QkZRZ2swcHdkd0p0ajQrVzBXNmVIYlhZdmczdW9YcnYxY1lVTFpjN3hvOFJC?=
 =?utf-8?B?cW53T0JTRXlWVkVxTVB6OVB0MFh1cEp6K3RlL2hkdEwxQnk4clNhU2hQa0xy?=
 =?utf-8?B?L1o1QitlZUN4VzJpU2lFNlNuYVlmbWVPUVlHLzQ4QXd4dTlyZ0c4WUZRQlBI?=
 =?utf-8?B?MDhoRHlRRSs4VzNJdE5XL010TUZ1OSsySHgybVJiZ2JMWDVLeFpFT2FjSlY2?=
 =?utf-8?B?R0dPUUdQc0kzTURSQmFtOGtJNDFQMGhnd2xTUmYzWU9wVjJFMGRHbjhHNzNR?=
 =?utf-8?B?b0l6ZU1kMW1QM1VnS29OcFA1R2pHRlVZeXlxQWlweEFRMW1kdUdIY3NwMnc4?=
 =?utf-8?B?bzFSRVhYdndpMWVxV1dTRTBWUEhBZTVkSTBGYkQ2U2diWFFGNnZlVEVudm1a?=
 =?utf-8?B?T01leWw4YmhWcTBwTmhST1VoRlYvcWU4VjZhdUhQa0VreGlCeVhqSDhJQTlV?=
 =?utf-8?B?a1FTK2tueTZnVUdLczhrd1pjMmMwNVNZSkFvcDVlSEttZkVPd2ZGcythekhC?=
 =?utf-8?B?bUtuemdlbGRnaWN4SWpCTTJCRGVzNTZoblBRc1RlQis1Q3orYkoxcFl3V3pi?=
 =?utf-8?B?MHY3SFQwK3RIQmlGRStPUjN6aUF3MjNtajV5TlFuKzRnSjZvK3dZcmp6TS9B?=
 =?utf-8?B?SVg4NVNEanpTYWlwTzRGR21hL0cwai9jNUgxVHdpNEVSREYrL2g3a2lWZHN0?=
 =?utf-8?B?N0Zxc0JlZUg1T1Y1WkNuZEJLcStkME5TNmdXeHJJem9zYTBkdHo5VzdRZGhI?=
 =?utf-8?B?bm9zZ2hFUWJGMFNEQnZhekxLY2VPWjNXZDVWUjh6dXFpQjBpSTRYYnNhYncy?=
 =?utf-8?B?LzNBQzZnOUJwRmJJSHhPTGY3NFdmMitSSHF4Y3BxTzRJT0pIbHQyTXhZSko2?=
 =?utf-8?B?cTV1WkIycjNVY05NK2dZMWVmZC9TQXlSTmoyMVRKdmRMUXUxa2I1QkVSNTQw?=
 =?utf-8?B?NjZWdkdsZC92UWlUMEpuYlowY0NJMWdGYmZLRi9kaW12U28weUVDWFE5VkJj?=
 =?utf-8?B?S1FXTUtYY29kOXJybFYxTGFWaHBQL1pCODdidGlIeHQvV3NsWE5zb1psN3pz?=
 =?utf-8?B?c3hOZzlHTzhwSlIrWmYzTkdSa0xJNzFLS3EyM2xmK2lyOFRFaWMxQ3dUbmJX?=
 =?utf-8?B?d0pFUDZlcGx4Z0hQTk9ZWkY1anp5K0ozZWdacENIZmNzcVFwaDFtemptZjc0?=
 =?utf-8?B?MEt1dW9zaURDbUhDSGt4RXFaL1h4dnJIMUdwUkNUOTB3VWYxYmJDcnEzQWRT?=
 =?utf-8?Q?PYfie9jgRbRmOAbSfuwXcLFJnoHiq0gXK8o+D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ea5f71-6105-4ad2-1957-08df08e22437
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 11:05:47.5617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ECKgkaYDnTVJ70tFxdkkKPO8u4oMR4IOcJBfNm72zMufgaU/8xYxozPTZ2PDVGZdrgwB/nTI/b9QAUPh1mMYV6WJfuxuKOZe5H1nEzios8TsaIha+IFfE7Rvan6/D5n1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8131

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add the EdgeLock Enclave (ELE) secure-enclave node to the i.MX8ULP SoC
dtsi, together with a label for sram@2201f000 that the node references.

Keep the node disabled in the SoC dtsi so it does not impose a
reserved-memory requirement on every board. Boards enable the enclave and
provide its memory-region by including imx8ulp-firmware.dtsi.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 777b89ed6849..ac8293f81c6b 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 #include <dt-bindings/clock/imx8ulp-clock.h>
@@ -154,7 +154,7 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@22010000 {
+	sram0: sram@22010000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x22010000 0x0 0x10000>;
 
@@ -186,6 +186,14 @@ scmi_sensor: protocol@15 {
 				#thermal-sensor-cells = <1>;
 			};
 		};
+
+		hsm0: secure-enclave {
+			compatible = "fsl,imx8ulp-se-ele-hsm";
+			mbox-names = "tx", "rx";
+			mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			sram = <&sram0>;
+			status = "disabled";
+		};
 	};
 
 	cm33: remoteproc-cm33 {

-- 
2.43.0

