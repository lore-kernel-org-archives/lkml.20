Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013045.outbound.protection.outlook.com [40.107.162.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3240A3C0611;
	Mon, 31 Aug 2026 06:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158941; cv=fail; b=gJ6d64lxcWMWB4VBHCyJeYtNd6lxAtGNkTN08EukJUA6F6rNo+GvztHexpIOo5fQpOCSMZsr+F72w9d+QV4ngVGOIul7T8QmLZCx8q3E2AN7o0qm17pnThmMiP/PPqBL490hcFuJopLG/RBIyf1BxU2X+7g8FVgEQbgyIuKhsGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158941; c=relaxed/simple;
	bh=luBpkiF6jrbfu2H/RAjLjQQu8stbN8WYKR7uzSzrF2Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dotO0JL1fqNVbjTJSozEvj88/t9TJ4XACTUcXkFn74ljyolRrzygu23vHwXdLiji6WaF//KCvEFg4I6jU7/dM7QW/FVxn3/V/qVZ/JRvn9QHQgexvUQ9LUE+cr2BkEM43pKJWa++Ef8BWCEz8DRzq3HIvDgYRYB0CsQNojPr/JE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wL0iG+9/; arc=fail smtp.client-ip=40.107.162.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wL0iG+9/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hqMEhO6myh6xiD9HHdbOK9/IpvFSliQCJd5oka2uL3rt8xOpW6KS1452IIM/U+rfWxOIhvQQB7Yke0kAgUJnf23mTtEJhf0LnP2F5a3IdHYwOOzSs/18UN6Gvk+0FgUSuiQZHRJvbCTSnkys38duycU2p+XvNKiJSEHXuMAxo/U9LqCA5TtrCmhRiYSgynX4KtcjagzL824GnyCT2F3I6An9n2tYQl88Ppm1cT6IRy0yTOejAq/zh/NnvtZbMo7X3CmDh9fr4ckZwUjlpuUo7+T/iOuOIxqG7RRZsogprNzwx4K/R+vAeKCO5RkoZkCORd2i5vzFNfRo+EmQLX1xEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9D5P4VLq/RFakqr1i7hLN0AlAJ1Og6mDEsBmjPfDhA=;
 b=OxA6c/jmh1d+2LeXwZk2z+OT2vcilb3qoOZkrFzdFbzu58btnYdLeuZ3HpKf9R1ySN/tUjA9mEga40DnYHLH3FSLD04aSL6ak/w09URASbnjixOmIGSGXrAsJxCYhSdkLiCdlSNlNLozVRBcRoPeD0s1oj3HaEvM76o+byKHbBKB8xEO5XfR9K0CdUqk+wEXjxX1Pv7AnX6WtDn3K+TvNaWAGi8hGN1nGVTe2WjpRf4tx9swN1I06Bl9hoy2j48ElmZVBjHolZ2PqriH6kFvGgXndQyxn5YwhXtu2+mp2SonxdBLsl4q56iBXqDDApFAED29Tew3VPx8maoGF3/D0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9D5P4VLq/RFakqr1i7hLN0AlAJ1Og6mDEsBmjPfDhA=;
 b=wL0iG+9/JfFxRusWijpWi+ZMNWAl73Lc87616yDBTgGnqYiGeMQP+GTnpsA4QqHPt+5u0ZUHZqLmz0pEiUtxLOTAzzcLjLwOBa/6YIB93Hk4F4dR9/1on8T89pHaEx6jGN5oK5+jjlTmRFcoLbBriaaOKu1e9FI0OHqUCNn3sgwJi+dnK9BlSgERqbtc6tkuKeKtjTc5IdOX4JZjaaAV54D3NZzH/T5V+HzxgWW2qD8lkflCoeYe1hd2XBUZ1+AFb1fwwg76LL0Sf9co/pWNJTBLkaxJJOEVYGkf3/NX4a+lZOxIMCJlBGHdkFh3V8rHOV0jRykJ87jhDPPUxz2Inw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by DBBPR04MB7705.eurprd04.prod.outlook.com (2603:10a6:10:209::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 06:48:51 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 06:48:51 +0000
From: pankaj.gupta@oss.nxp.com
Date: Mon, 31 Aug 2026 17:48:27 +0530
Subject: [PATCH v43 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-imx-se-if-v43-6-a3deadbda4ef@nxp.com>
References: <20260831-imx-se-if-v43-0-a3deadbda4ef@nxp.com>
In-Reply-To: <20260831-imx-se-if-v43-0-a3deadbda4ef@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788178704; l=1533;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=QsUadQeiO4ZJutxpy979OhbHSldPNXSAnx420m3jX1Q=;
 b=ExLesHkRLiHLRj2WRjPlyoW0otasDFwOFNIQugypUdiCqFkRWGAH55gYpxmxmYpKEf+BV0FFx
 Av6ffUg4E7gDtgFXg0ESr8YGrjVkqGl+MMdkgwIU1q8tQI+GPfYQBBw
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI2P153CA0015.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::21) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|DBBPR04MB7705:EE_
X-MS-Office365-Filtering-Correlation-Id: 404de587-74f1-416b-7dcf-08df072beab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|366016|1800799024|23010399003|10067099003|3023799007|22082099003|18002099003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	H6W2raoYThZITZAKeU86/h3rQn7hY4DfrCeO5VWpmE+L48qvUhu4kRucy40BVUNXYwqSddiz+VRqyqbJZAPT4hurDiClRVvbkjnEgo4lxVXlYgO0kSeAonyodw/TNx+t5rYHXbRm7Ocwo+IPGAZbOTZQpu8Cg/s6RybF5t6x3vRtmFYvn87R3U1QqH74T661IcCAn0E7zyqGpcj2vlG4Rl+C1MFHcndIvkDP07C4zWs2ugy3/RssGi/IZpqVaG2yoXn4ATLXMFWX/SoeQHBur49H0RRf7cRxzib7l9wRQz0ljQhigkvPWeUX1ymXS0Ff0xe948cYZxZZkt/cNN0X0YoAE7sK3plkIul9wCcf/ZuutSRx1L0MMk+cXni3bjyFTIWPyi4WnAdnzR7bYRfe8zcORH2hlijo+Kw8iaJdy2qZeoL+IkqSZxeygvkXcGNnn0Vih1tzZ/OrrXPMw5r0gyzOSwJfOP+ms1EKtEJFuL7aafZvniX5AcYO1UPTwtZ/JXCCfedM+3Nc7npMnpQTeEx6CY+9/phCcaFHyHKAAHgXKnp3hp2GS5BsMbKoa26EGkAkd8W5w+XjEdv0Yp1waPp0XAcixgGTIKb3l5LBPb8cnNRSFr6rRwfZiQcK4wl3aJCC8B9enI5L52UB41j4X31AnvNYbSV2sdYHnBZA7oW/vUOZ4tKnGhoW2I2YIEEO7Yz62SB6WDmKtszo88wLFw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(1800799024)(23010399003)(10067099003)(3023799007)(22082099003)(18002099003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zmk4SmpUQUxxcG1qU2lEUEtyMjB4bU9aem8ycGN1MlYyamJuMXFqMm1tY1Mr?=
 =?utf-8?B?NlpFY3dXcng1dUV6U0ZlakQrR1gzNVVIOEx6aDJiSGI1eFZEaDQ5dzk2c0hX?=
 =?utf-8?B?MlJyVThNTDhvVGdRUkNkUnRISXZ2UXdpZ0FJWFlSM3c3dXNPNlZua0xFQ3A4?=
 =?utf-8?B?ZnM5QjNhLytTNlhXMGpSU3ZWV21wRllvaENlc3NJd2ZuZmVMaWpXekNWakkx?=
 =?utf-8?B?VGpOMjhleFJMRWZHYVJFZm83NzlhRk45WmhjNzF5UU1RNHhldWZuMFJ0cEt2?=
 =?utf-8?B?cHhQUk5jMDB6cUVLeHF4OGhrNHEydkFXZ2RCdFJTajhLcUd6UUVPMHFzeW9Q?=
 =?utf-8?B?ZzhrRGtzNDV2M2ZrZTIvem1nb09NZGNFeTVaa2dyZXRoSEExWFlZRHVMU1dh?=
 =?utf-8?B?QXFsVERtaThvWWlhM0t5emhNOGJhaUFUMUJlM0R5RHc3dFdBRmJBK0hFZ3Zw?=
 =?utf-8?B?MktpdVJ0SzNzQlYrZTlNajI4OG5maS9tYlJPY0RwaXBpZ1RpTENUaVdWM0Zr?=
 =?utf-8?B?aW94L2w4ZUZ5VncxVlRVVXl3ZElnbEErVS9ORmRsclNmRWEzcDc5dUE4Y0Va?=
 =?utf-8?B?aDFENzZmVVdrUDVjeWFSUnYvMkxNUkFGSFYzWnVrNlhjZm9GcUk1YnJhSVVD?=
 =?utf-8?B?VllxMDljZjhtVnpaUVBZZ0JCb3hrSjQxYmRuVlk1UERwYmRsdXBtb2F6RnZ1?=
 =?utf-8?B?VDRoUlZDcUUwV1h1SVJqVzBXbW45QjJBRVRmWmpQZ1prQXBaU1hFQytjUjlu?=
 =?utf-8?B?VnJ2N1V5cjdYcXhKWDdtZ3hXa09ua3Nac0N1cGpyOWpVdjdBWDkza21laUJk?=
 =?utf-8?B?QWlZNUg3SHBKbXMxRUFzZCs2WTJNK2RiVVNGVTNlMmpoRHFCS29HbStGVDhV?=
 =?utf-8?B?bEdyY2NZa0NpMFBMNmtKWkxwa0dQQ0RQWmlSMktPRy9PeUoxRFpkUlk3bTlr?=
 =?utf-8?B?QkM0OWJJRjdTY0tsWFVWdWpOZGFPcmpRNi9Dd2tnTHJQUmZHbW5mcFA2NmNB?=
 =?utf-8?B?MDFMOXN5a2d2LzVSdWRTbDJ5OHJoK1A1ZzA2WmFOTjkwYWl0anRXMGxBaEdh?=
 =?utf-8?B?MWFIc3o1cm9pMkNoN1RvTGdLMHBpMG4zZ0x5YjhoYUpJVEJSd2g0OXU5M1lk?=
 =?utf-8?B?K25ORXY2dDgzbDlScUszTUhldE5ma0RlK2xkbzA5ZVJqaEROeHgvUUpObVI0?=
 =?utf-8?B?TzBzS09WNGhGR04yY0pBVWtMS3RJL29jSjFFUTQ4Z3d5QU1zai9xdURCUUJL?=
 =?utf-8?B?M3FhdXo2ZDJUdWRrYkxlQXByVWNEc3lEV0dyeGJ2SGtDSDlNc2QrOUt5ZFZR?=
 =?utf-8?B?ODhYL3Z6MU9ObTlwY2Y2amJNTDd0RHg3b1ZIRzNXQXlWek54REplMzNkaWlB?=
 =?utf-8?B?OGJFUkRCczlnekVmTUlzQkNNSVk2QkVYbUtBUTZLL01YWnNPTnVBdGtGRmJD?=
 =?utf-8?B?cVVtKzEvWnhWYjd4T0ZRSzV5L0hDVHFZcjZRakp1M2FiOWpvK0JVM1pXMDA3?=
 =?utf-8?B?OURHZEFlR000T09SdVZJVnllc0VwUTZCV0NBdlFOU3N3WWxhaW5QSS9neVhL?=
 =?utf-8?B?cXNZTS82NXNPOWlMckdVOGF0Nm1kdTZMOFh1aGR0SlQzUVNKczRRWDNGQ2FU?=
 =?utf-8?B?ZXdDQlkxeHVYNW1sVkdhSDh6RGpLZk1ENTdGeDFoQi81S3BMRk9Pcmc5dEl0?=
 =?utf-8?B?RXZxOEk1bXpXZUo1ZGFEa2VQUnZIU21PQkRHcTlLbHBWdktYUUFYTlBPTmNB?=
 =?utf-8?B?aFhkKzBNZm1lZmpXcUhWSzZ4a04weEhUNlpQZ2lLVTJPRnhPYjZIVGhjTTBl?=
 =?utf-8?B?Ky9qZVFzRm9RcVMxTmpaRWp3dWN6a3Y1SWtERXpXK3BqaVpRb3QvQjlTYkJi?=
 =?utf-8?B?M0FtTU5EWUcvcW01NUVHdkVEWnZtb04zQXBzdDdPakx4TnJ2WHhQQ2lZV05r?=
 =?utf-8?B?RVozVDhXQkljVEJPMVpLdmRWQkRjNVpVOXVBSjZaaGVicy9Ya0VjSDFwMlRw?=
 =?utf-8?B?UzFnRm9CZ3lYTmk1dUgwS0NzWFJ2V1hLUkp0UVhuZmZBeitqUklZYVA2K000?=
 =?utf-8?B?V1FEdTR5a0VSZjNPN2IxeTdzemVUZzQ0L3lZMHNXbkZOYUNMMndodVN3SCtj?=
 =?utf-8?B?eEIwTTlxMTlUeVRsZlZqUCszc1lXdkpDbVRYV3JrZytUTncvNjJGYzJENVp2?=
 =?utf-8?B?QmhsMC8xR3czcWZyY3V2THprVVFza1hYQmc3MWcxS2xHN2JtbXdOSEJUaVFp?=
 =?utf-8?B?R0NhVzdHQVEwNTJDM25pUVZ1Z2NrS3gvcVFyWkUwdjdRNHFMYXVvWHRGNklv?=
 =?utf-8?B?K2c1QTErdENIcjRnNi9CUTJWd0VmVjdOeEpZMEU5d1hIVUowU2dhU0JGVm5W?=
 =?utf-8?Q?oKh6NrAldpeSEdQ+Xw/dD6l2Q+cBLqd/4a01r?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 404de587-74f1-416b-7dcf-08df072beab6
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 06:48:51.3988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fy2PXMnPcWyqmiF5oZaXMEz/ISZc71MIhbBcvmnqJWtkNuXQdI5W6EE7QyBhRT6ZwFJwx2FX6icwJSmvyANZB2mLoQpNIDeSS3FAI09POP1/S/2FFzOlYwiHpRWfTlyE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7705

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

