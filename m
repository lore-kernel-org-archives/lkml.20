Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012057.outbound.protection.outlook.com [40.93.195.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4527913777E;
	Fri, 25 Sep 2026 04:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790309753; cv=fail; b=JWOj17fiWiIb10iR4WiiT8gOsDBk4luYi4vzv3bunbvmQZ4iw+WWGD8G7YWnr9RzfN8VsXl6IvGSZzvtHMlvZpv4xfPxhYW5eemnkp5c+nsxOgd7KymIn83ZmLMqcTerwIp/cIVgd22W4YpG4oUEScy7VxY6l7oEA+QnlWCDUHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790309753; c=relaxed/simple;
	bh=8Or6p02/mwStG/K9CAgwHKJw5w4eygUXAHnO4Uy4AmU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=RpyvS7aYIWd+v9RsLli676xrfyprafyMHcPKaQz2AwiFxN6kN3Nn62SmzqU+jF7RmE5xTzeqxHjhb7qeK3odZsD5gfppWAfLnPSsDPEUy+LWb0iEqyiuDfBGfLVIEaG0iLOF+8TCGW6fHUHwpmK8Ui5AUTLbKnnMr7ChKqeotcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=WkTl9ccL; arc=fail smtp.client-ip=40.93.195.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="WkTl9ccL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xg5raKtyB/hu58fdVERYIJbIiWp9etqI6WlBFjO2V97NDEQQbxZ1EHXVvvu30+B3HI17nkAKWnxi02MtkMr8FjjnsdzBw5XEJ+dlejyxzvK7/+KBui+giPPZChFeIeOqnMbDuHMZWJfvseys0//kurWuwUVbvfsxNRPnJRcS0w3KVGODbrYPaBvwXg0STBc29g9cWtrW1up8jgqdkRLRGmIitq2AIHyh76wHCMkBXlps4n9IqZKFXByLicMwrVDarY9771uy9fsiYNQvgbVp+G0gh6kvCWkMaOKDLucpu/daQHz3z00P9RbN6F+fzHjql5jfj9uANvu4W3JiBPOz7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/zwVJFrLWoOu68m1bY3WQ9FI+c9PXvH6uTNX0CAH4c=;
 b=gPMOYgYoZ3L9KABoBMbMOXW+xrn6Hbhvu+fFm1fG+Gfnah1147YEHbznfQLBuWPhl+ECq3tzFKLE6tLsR8wXHpTakbuvTvW5WzLbcnPbAGW+4iSCCO1A9teOZZcimXHi2Aq+ArnEnenPK2bdjDucoowLp0HgxrnV1g7LaC5c9vZdxZvBvQO8fsoLVGcyBpXisdMbDeN8ofktS/BrHUY9Ft9eMmgrH9+DQfQjOj+DH2q7xnTDHBOvTp4Hih0Oj4TBhsnI/xcIU4Km0gMBLTz2cRnlynXy13AqHOqFu0GKSgp0XufwkJdqJPDDkFJR9s+jfGZbBKdRQT3MIRhipHWOjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/zwVJFrLWoOu68m1bY3WQ9FI+c9PXvH6uTNX0CAH4c=;
 b=WkTl9ccL8LH+s6JfpvYAN91mfU4nE/JK07/vvSHMnjVN6PVSmNBP+gISrc00SyPe9+POLFLym8l6tLyvLVtKqzv1aj69g1qkKx1I65AoHPYdLm46Y64AsSIENPekji/2paqGi2iWjTovrHfYnpcG3x4sfzKfCZPQEHQtP0HX6vkjr0Qpdp1GffMyxtX9W7F9sGxHHz+YtxP0G20K1lQEMqfSMu/HeYcaYuA90Cf0e+1VGbEb7xi0ky7x1YenvxL464gpffsswSb4qUjypRseMfvKY52PQ0sUd29+LCrppz4LOuxwtsUmDyrKWipbIZTCL1bqxh2eEKrgp0UOxEC+ew==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com (2603:10b6:a03:393::12)
 by PH8PR03MB989672.namprd03.prod.outlook.com (2603:10b6:510:409::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 04:15:48 +0000
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80]) by SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80%3]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 04:15:48 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Eggers <ceggers@arri.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v3 0/2] arm64: dts: agilex5: add support for debug daughter card
Date: Fri, 25 Sep 2026 12:15:35 +0800
Message-ID: <cover.1790308304.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0001.apcprd06.prod.outlook.com
 (2603:1096:4:186::21) To SJ0PR03MB6581.namprd03.prod.outlook.com
 (2603:10b6:a03:393::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6581:EE_|PH8PR03MB989672:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ad4c32b-b60c-4e3a-2ad1-08df1abbad91
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|11063799006|56012099006|3023799007|6133799003|55112099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	G582duxjGM2A6FTu4ea2FXMQyxRuiO7fV6sO03g5afxHqAKNZ7vyaP+7mtQEYIPLOKC0DSxURl/7205yce8TZzif9Ihwt28hi0Wycsvr+zNdFTddYiTGXxsf4iSOy4TtwChz0nDTQzQ6mA6fY+iNT3i6bzVRU9UGLysolZTVEDeFsnW5wGYQd/BQf8Uq8WshdJseE5SRcGkziWHNSq3YZHTeGRlkjYZLxhC/kUMSI2bxDamEVquE3aJgyBarwM1/M5Ea7cpeq6IcjKRee+Do13j81EI6RYQ7ina3kymR1IfjdiwDsKC6kPZ4sqg5Np+gWlFyx3iy7VCr5+7UNCRsZJtrxcc0Hfv6K1wML5NEV/jAX1kGv2bWgcZa33Amg5EE6lt0TAYy06A9BMvrpqaiF0P8/y1MOgWJe4i1zG0Ybb/CfvIHSf6NUeDzcWd67/kuRpv2JmRMsWRwS27l0q1TA+i7036uM/guNCc/cGYAI/G1OcVouc5gWulO1dRaX0TFxbmTDVpJyj2ma/iLRHo61H1gO8gVtPkH//amDoE5AxBfE4muHhsx7PHxiIIxKl50MlP1SIION6gVbJwYiCQQuADtZCBL770sqj4RR2R7+lG5BgMD/PabGvGzELoXZUkJVpV12FSCYKGUtvEza3vDBRGz5qa2GKJgFdS+240+k0I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6581.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(3023799007)(6133799003)(55112099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vKGzIptVwZn4/hgZ5jeYDg3uNcfeaAMF+n9PpGvGCPGWlhlwEXRA8khbzeqy?=
 =?us-ascii?Q?dIVr/kyu/EWhWB2PhtsIqpQB830wGft+/m8b8ggRUdPLh7cw0EwqP2Kj/se7?=
 =?us-ascii?Q?alfdbEOyOhWtzepzXM2afusUZgU0/Fm5HZMo/oD6PknwLE4Ov3PEttYOk+ky?=
 =?us-ascii?Q?kCkbN+M/8237l6QsK/YKT3D/DJ1inKvc2iSLtNOT3ZlcsN2AQaoaOkGz/nsL?=
 =?us-ascii?Q?7kKZpczqGHkKXQ8e/Q0Iox6DENMwfIGotaMoWUbnvAbaOVpEEOWO0uz74HP0?=
 =?us-ascii?Q?saYprl/pZ74OvaB+nVXTtQtnuzP4L+29knlBPdcVMeETq1R+DzMwrLSliE6N?=
 =?us-ascii?Q?q3LUMlHR5zjkwqCGNlhE/Ynr8XSaFsDWuHcKgdQCtfTDuQubs9iwNdg0KcSX?=
 =?us-ascii?Q?SHbwboCMcFLZUlI6EkrMnRN9OEKXrs+WbtlZUz8SX7uL+BYdf6K5S8Plgeq0?=
 =?us-ascii?Q?/tV0UQF8zx7WWviH6WzVLoMA4Sl3OSd5T0Vf7O/0Bj7K54kQy6HzXqwfLDf8?=
 =?us-ascii?Q?ZmIREIpXzoDMd2kuqTdbbKBngwDVxE+yzveqR6JBkI8gqTHnM7H9HVbcc6f0?=
 =?us-ascii?Q?djbY+1pPziTGQocC5kKtJ2B7cUC10zCZQK9Kpc3wCKd4BXhqPdm+c7bzvCVZ?=
 =?us-ascii?Q?Lu6mg3qrVju7Oan9v32RjbK32mN5XsjuCIVaQRPuQWSi+w1vLehZb2caMXbZ?=
 =?us-ascii?Q?bko/2uHhIa5C8McOYxpaRdg9ppd/u6+UqXe5JEmjlBMfnMdILnyYILccvKQ+?=
 =?us-ascii?Q?k0HyBbt5vuoSe0JuOZyxdtU94BV5Bn9ZycyCAS248dktewoSGN0QZ3T12Mel?=
 =?us-ascii?Q?L4+Zx3cXxlWpHiLJ0Lh1fkxeMYkjCZKOI9pGTU4LqArgaXBC1NikQg9UDos+?=
 =?us-ascii?Q?FFqi9fTUhRWhmq3r3CNJ7Bp553chWeCtJpvBohkgQQBQXDWpBzyzBF05GA4d?=
 =?us-ascii?Q?LZJH17DlU8mfOiNrKQTYW48pcm9W9zpmvQN+gh54LosCtAuzA4D6voCpszVE?=
 =?us-ascii?Q?rpqzja1f7892xaoYjFxdGN2bjGYk/bHS83k36N0dg+lJBDhKc86vXslr8IYw?=
 =?us-ascii?Q?aj78ST5uW4TI/5pWmjcxmroVPnWdp0Q1VdjJBZRXRIXDnnUPgkNVgj5yiP1I?=
 =?us-ascii?Q?g69OULC0cFgJ63uZLW+KtD0cxfoFuX72psjlCM1dXtZTbaSu3GgOrH03qw9w?=
 =?us-ascii?Q?Y7lMwfWGKSMlSd+hckIJ+1EfH+tCA+7i9lh8KiwIuYMj7mI6Bk1zasXEkf48?=
 =?us-ascii?Q?36wGFk8BVij7yzMLkRG6pPFA7LFw0zj6FxE4HG8QQ5PWfkVgNirQeQZdpV7J?=
 =?us-ascii?Q?A/oHtRP265nZ/csxgvxTWCL/HQ3cWoSkuzqvx9fsztlSWqiOrRNXMZq+FNIB?=
 =?us-ascii?Q?XhAuYeNNQ7SJ7uxYcaI+JuRffsnY+/hMhzh1w9ISIt3DeGg98vjLW10Xhyj2?=
 =?us-ascii?Q?YYtz/gIq8c0uzZntNCaeAscC8TiVNOvfrVaCsC7IDXhBf7UwmdoD05pwF9/a?=
 =?us-ascii?Q?+ogzAnpKCN3cyBPqQh/VgbfB3SnWuAarXEUCANZKfHlkZfpeVWSyZJVwmTyC?=
 =?us-ascii?Q?N/EjBln6xA2NskbpbsK6t1M0+oNR5ustoFVMtFIDN3jTFtLiAQQeF78nm7ax?=
 =?us-ascii?Q?k28SyH8SolFEhlwiBwM7UW7L/eU/RWHPkBkNAGaeywO0MZ81eO7oOoE2IxkE?=
 =?us-ascii?Q?YunxAwV/zcQQHS8an1Ut1MyzFioZnTQ9smExGVfkN5LdrPZMpF04/59yf+Ba?=
 =?us-ascii?Q?Ke5xzNrm9kv1Q+UGZKKD2Qct8SAf1Yk=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad4c32b-b60c-4e3a-2ad1-08df1abbad91
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6581.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 04:15:48.4838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yjODKTh4quA6OQPbjPU8aaCDMwLobmXJmGjAcx45+tq0DOIZAsX7Hr2fNHZP5TxVfAhDaWhR1AO0vFse8TJSiikRNfYqWP2lucNjjObrvHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB989672

The Agilex5 SoCDK supports an optional debug daughter card that requires
a dedicated device tree variant due to differences in peripheral
connectivity compared to the standard SoCDK configuration.

When the debug daughter card is fitted:
  - gpio0 is unrouted and remains disabled; HPS LED is on gpio1 (portb)
  - gmac2 is replaced by gmac0 for Ethernet connectivity
  - spi0 is connected to a Microchip 25AA128 16 KByte SPI EEPROM

The board compatible (intel,socfpga-agilex5-socdk-debug) is already
present in altera.yaml and is not part of this series.

---
changelog:
v2->v3:
- Remap HPS LED to &portb 12 (gpio1): gpio0 is unrouted, so keeping
  &porta would leave leds-gpio in perpetual probe deferral
- Retain spi0 dmas/dma-names from the SoC DTSI; do not delete them to
  work around a software/defconfig issue (DT should describe hardware)
- Add microchip,25aa128 to the at25 binding and use
  "microchip,25aa128", "atmel,at25" for the EEPROM node
- Drop the altera.yaml compatible patch (already accepted/applied)
- Use &usb31 to match the current Agilex5 SoCDK USB topology

v1->v2:
- Use socfpga_agilex5.dtsi as the base include instead of
  socfpga_agilex5_socdk.dts to follow the convention that .dts files
  are final compilation units and should not be included by other files
- Replace spidev node (with fake rohm,dh2228fv compatible) with a
  proper atmel,at25 EEPROM binding describing the actual hardware
- Remove dmas/dma-names from spi0: CONFIG_DW_AXI_DMAC is not enabled
  in the platform defconfig and retaining them stalls the SPI driver
  in probe deferral
- Remove incorrect HPS LED GPIO override; the LED mapping is unchanged
  from the base board
---

Adrian Ng Ho Yin (2):
  dt-bindings: eeprom: at25: add Microchip 25AA128
  arm64: dts: agilex5: add support for debug daughter card

 .../devicetree/bindings/eeprom/at25.yaml      |   1 +
 arch/arm64/boot/dts/intel/Makefile            |   1 +
 .../dts/intel/socfpga_agilex5_socdk_debug.dts | 121 ++++++++++++++++++
 3 files changed, 123 insertions(+)
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dts

-- 
2.49.GIT
