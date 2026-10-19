Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013014.outbound.protection.outlook.com [52.101.72.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE6F4E77E0;
	Mon, 19 Oct 2026 11:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407969; cv=fail; b=bF+apjAVuy1Kuz73VPtPmThUskBC48p6WnvvasfWBWTio4EAlQVmR87MQyLcdprHIGyXeuhet3llIpSTL7WX7cXjTNaBzXjT9+lHgXEj/qN2sB5sxuuXLfrsqQ53XoNwGiRe8sbeLRpdey2Q6Y4ykCDgomX5uXfQzPMQVtwVOjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407969; c=relaxed/simple;
	bh=4ocYDS/TjGS3/2xaZmc9EcWYCvZoxWJ/6Izi1NFQGvg=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=P3+IdavHSPX/JhWghrlPwIX/SJVWYAZGo7WP1zctqHITyzAY/z3i3iGaHx5ayg8r2VokmzGd6PtHDxv10stJZEbVDMUDT3Rk0ehXlWDFcoPnnrAjnDQN/FLJ1BFWcke++SiRBwOGV2kWbIXgKx7WCi7mn6PvfeVqNTAY6g4TDdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=E28mqxkY; arc=fail smtp.client-ip=52.101.72.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="E28mqxkY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PmqZdiUpO7aKxkK3uuGZt5WNZjqj0Pop38xha38H7aGf8zHB8I6R6uMxTu4PqjR94WlxjTv6dzE2ipOkfaC+024+wAq1ZSCCwv3GtL4+D3ePnC8gCp0cES64FoyLY8X096l1Xe6cKDEefiSgvdqaT8O2rSzciHImpYUy8l63iESI/YXJbLHFmAMPSlQeiY/p3E2Rq8GhqrTd36kGR1z1m0Bw9oq9VpMNim3d+ru8auRrJiSP4++RXBz7/JyLSMz9gBxgzikCw0gJOWM1lOZQakJ0F/vsKS54YnzpnbGzInQibgoy/j5bGmVRGX3VO668lNDC4ePVuXoB/qvNMmU3qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWSoPYdgn4P0hEg1DZI2+gAzSvvfYThIKR27S1YMcmY=;
 b=ruqkf+JqTvOOYFGhJDFdw6R+DZNPH9b/1vRWBg34D4uT112wNPMH9H8fmlHiB5PScdD4QV3xR39g2a1It3MJX/1ui3+6aWH6cfRKi+mJS74XP4J2eQBwqZHIDJiDjEfq64xvYWJv0bP19udjCKJyfrBqAOeEvcdY2VOH1Ky4jh1PTeAT02jXQQ3y7ru7jrjwbfGUsOjK8pVYT8hevQrFKptpzahS8b2iJJPJQvLcAJMrA7davF4Dc1dfLKF2qDDY8WSCr3ekf6/dq6OEeaFs6ec9gU3PG8oqelno1JMWJt4IfJ24s7byBTcwiylJnQYEM+3syegxgI5lgKdDWsLWKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWSoPYdgn4P0hEg1DZI2+gAzSvvfYThIKR27S1YMcmY=;
 b=E28mqxkYoa6UuPN3Bc6jTKTWvkFSOu8sLAfinn0Jik4+35uzawcbeCceHU1uoQ10ZkGUD6nKI9fLjf6Zo4ykq+nUD0EPXga4RQskaBu49Wx0D9+ffAWXXxjF/26eHO3HAPCc++/OpU8f0+vpaOxq8Uh0KabfLF6sqwLu9M+zlQaNXXxzzptc6L0ZGq+l++WAXxzeMVSIUyulx1Um++YBqtowrhL4c403BuJvcgOzo7sql4KvbtLSjQwWytuALlbRPa32n+iuhL+MzE21m7Zr+9Of5+aUIwTTNFAgb9bSBJN9x1IUg1JVYmyGe4k9xhlfIG6nHfJY5A4H39Euzzpk7w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by AS8PR04MB8866.eurprd04.prod.outlook.com (2603:10a6:20b:42d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 11:06:03 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%4]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 11:06:03 +0000
From: Joy Zou <joy.zou@oss.nxp.com>
Subject: [PATCH 0/2] arm64: dts: freescale: add i.MX937 FRDM board support
Date: Mon, 19 Oct 2026 19:10:31 +0800
Message-Id: <20261019-b4-imx937-frdm-v1-0-76d949a61954@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKf61WoC/yXMyw5AMBBA0V+RWZtEq/H6FbHQdjASj7SIRPy7Y
 nkW917gyTF5qKILHB3seZkDRByBGdq5J2QbDDKRmUhEiVohT2eZ5tg5O2GhWkqt0rk0AkK0Our
 4/IZ189vveiSzvRe47wdCsBVlcgAAAA==
X-Change-ID: 20261019-b4-imx937-frdm-84ae3d4b72c1
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Joy Zou <joy.zou@oss.nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI1PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::8) To VI1PR04MB5807.eurprd04.prod.outlook.com
 (2603:10a6:803:ec::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|AS8PR04MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: c1fc1a13-2aee-4404-d552-08df2dd0f724
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|23010399003|366016|18002099003|10067099003|921020|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	SEXscOceD/t0l1hDWRoQbJ9EgIsvSp548GnES44WSGTBG/dssevPF7N75F+V74KPEMyLCxJiwhTDv339L+wjpWodMpzp+PgnHUE1VqiGK1oXxPqOa81AkGyPXXdAlSolGDl/hxZe+7Q/1b4aMD4yPcBXT/ggG7Qs6+onsQ+yI5oY8qg8GHEkplx4jChh2lwKdcZ4kI/UafiInli1RL65kelUcTK4w8dSHGFfSAQipuD/D+hqUKxCaYs5/VSwnsig2Km3dIE+LV74MK5MDIIWg0+9sgOoHUkTqLnmm3XFeRyqLxEchNphB+Enw5cdvLY4qje89Dhq8+/lfRViWtuWTaSJFjbUFdnk2N7AMPxYuoC1Xd9rHgPK7JiVKHWuIGk4NWUmbQSpw9aByje5MgsshRwqpjgzvA8PFk/8mMo/fiuip3+MCBHDFiAZWHBqxvC7eVg8kKQQSs9m5JL34v9kmnaA2dtbdawmIZh0cuv3XaYuvmNOc3UrxyveeXGi2oMC6oTZoh9POe/QeCy/pgYFzCu6/BgJJyCTG3ZFG5NSpn3vPixvAexXWFLu8g/VoprQnmHWRD5n23KibJa0BPEt9QkCh3Em6UCTYxbPqLyRBcqHLS+6Jp/wEewl0FDO4O1s9n+nn+VI7EdMbLJBLZxOhXJ4Gu2mlCqeTfYwRlwqn8wM9rj8aJrnQSAaxRmKCqD/kiWm/3/yRLsH0SKGX3HcKw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(23010399003)(366016)(18002099003)(10067099003)(921020)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEJhVkZoQjIxQzBBYml6VVpFZXFHZkY5NWVxOHdIWnN5SUJyWWxnSUQ3VW9O?=
 =?utf-8?B?OGZDaWVKVkd3aWJkZW8vbEVKRkgwdTVJV08rUlQrK29lVUJRRmtNN0dGRlVH?=
 =?utf-8?B?bjREL2pLRTN1Rkd1UDNick1zcEpodUpHcUpjaWVIRXExUWlteEhncHluWnNO?=
 =?utf-8?B?MFFMbEZzSmI5K3E0NDhaSmJhNGlPNnhldXloNGQ2eGlFSTR5STdwYVRockcr?=
 =?utf-8?B?WXdxbnNrOGV4N3lWb0UwV2VWRGEwejdCVjZYL29HSEdIWkpBTy8rR2taeG82?=
 =?utf-8?B?c1lGeC9JQ1A3Z2JVeHhlUEUrTXpFb2w2M3ZaRWpyRFNxaTVXYkhvUml6Y1Nh?=
 =?utf-8?B?c0ZUUXpwZXdRc3pLRmJCYXRyei9Xa1lCYTd2cSs1UUpRY3FzZjBvMVBNQWdM?=
 =?utf-8?B?dlIyRVpoc2pkbzJYYUFmRDdPd09CRVo3b3lwRncwZmpXeDdpUHViMmx3bmx5?=
 =?utf-8?B?ckNad25nTmZnd0FwSXpzWDlhNHd0TmtQL2RtVzRTZzNob0tBczhiOExsRzk2?=
 =?utf-8?B?RmE3S1hDY1JDRnQzTUx0ajdLdTdiVkFXb3VRQnB4VDQwUzc2a3R2eUZ4YlJD?=
 =?utf-8?B?NndkV0FXendnOUZTZU5pVThxRmtVUy9ZOENGOTFJRDZaSXFDVHF6M0NmZGZU?=
 =?utf-8?B?aDA2LzY4emZkTWxDczhab0xEMDZJUENDTnZLV3hxVW1rNk1OcGRRbHdocHlX?=
 =?utf-8?B?YUdEN1NLbDk3T00zQWM4SHhDVmljUGh1eWQremhEZzFMWFpWcTVMeTJMYnRz?=
 =?utf-8?B?QnlkdkRnRkdDdTZGcmRlSG5XYmlnQUl1RkNwUzdVekREVUlONUJsenZqVXNq?=
 =?utf-8?B?WnBsY05LQ1ljM1B2Uk9kKzl3RnNmT2ZWZGdNQVVoL1FrV0NzWmltL2xoaWd3?=
 =?utf-8?B?MVpEWXVZSGlUMFdoVW4vOHczcmRTVTJwa1JzYk9udGNhRmhrcHIxMU40YTQv?=
 =?utf-8?B?STJpb0p5OGgyUS9oS2k2RmgwLzlmRTdzN0tJSkdhM2VZVStKNmk0YWZZaXFN?=
 =?utf-8?B?ZTZtNlF1ZjN3Qm1MZjZ0VG5VR0RHTGZwSEllUDA4L094ZEp6NENqZWs1d3Za?=
 =?utf-8?B?SWpEQTdiVlg4UXhOclM3UFN0Vy9ENWlxWkMwMTFjcTRCbUNlT0lTTS9FQisx?=
 =?utf-8?B?VWlLYUx4enR3d3BhamZGeEZLaFZZN3RBZWIvZC9nalZZY3dNZ3VJMzNseFRD?=
 =?utf-8?B?RTFTbkV5Z2xQKyttWTZydFhTS3BwMW9aeU9Bb3NLSzQxbzlnZnlBZFBpbG1U?=
 =?utf-8?B?d1B3L2ZoM0ZHdWJaem8vS1gxdDBEclA2S1NlRjMvMGdQQWtETVhEYVdXeUhr?=
 =?utf-8?B?eVlTdmpOWThRYlVCbkF2REZGMnp3VXczcWpJK2ZNRWloa20ybmNleUZPdUsy?=
 =?utf-8?B?U0ltdDdVUWFCY0pMMjFhNzVNSnZHbDNxL2gvNzhhTmVKdTI3TjVkYXEyeG5X?=
 =?utf-8?B?SmphZWxBbVR4QVNSdkZDYWJwMm9QeWtvQWhLU25ibXVYM3Y1VWxPSDFjbTRy?=
 =?utf-8?B?a1N5MFkyOEhlb2ZlallKWXBQSWEvamtkTWxmSFR0ZHJ0SEk0SjlXbjhUMm05?=
 =?utf-8?B?UWpnR0tNU0ExZU8zY0oxcmkxTXNtWTlyWUpPc0loUi8zSVRDQmNLVlo5Vk9C?=
 =?utf-8?B?Z3JrcGxPVGNBcXh6MktMY2Z1aWR0SldPSnhRakkxSU1qNGFQMmRnZzZ1QU1T?=
 =?utf-8?B?SE9LUzFvNFNvZjkyTWRnNFRxWWk3dURQWUkrajF3TXk2Z3AyaG01aTNJSEJx?=
 =?utf-8?B?Zmt0RjJDekFXZ0QxeXZZeHVML0xpVFJxTGoxQUhWK0FyU2lVQUUzRU1nRjVK?=
 =?utf-8?B?TDlIMW5Kbjc4aHBZRnV1VWhkQmJobGJtZ3JMNkNmNTVYWmNjbVZ3cTY5aHV6?=
 =?utf-8?B?S3Rua0FRMFFnL0o1YnJiMG9iNDM4bE1zdkVsZ0JwMmNvUkZQeldMckpxOW43?=
 =?utf-8?B?ZWQ1cjlpMjd0VHo1SGM4MDV0Z0txVGJiSWhCdkEvKzFkUVh3WWlCUnM3Vmtx?=
 =?utf-8?B?UlM3U0lLUXFnRFdJSGxSWjVHTGpBU3ROYldNa1V0R0RrTG9LMEhBMkJvRWdt?=
 =?utf-8?B?R1Z5REVPVU02REV3YTRuYWJ4VXNLL0haY0RXT2RyRmtmQ3dIb1Z3MzVqSlN1?=
 =?utf-8?B?aUcrRmlBTVRSYnRNUjY3M2drRWdyNFRFWmdiaDVydEhESUlyRTYzWldPNXZz?=
 =?utf-8?B?bGVDVTVHcVlVSmN5eVZhcUxjUmxpQWtDS1N2UkE0TXNqbXNqZWpCcEdXUHpJ?=
 =?utf-8?B?YmNycnliVHQvK2Q3ajN6VkFSTHlMNHk4RUFyYmlucTZLb3p1N0lmRWthc3ZE?=
 =?utf-8?B?ZFNvYjVLVlRnMnhYZ3ZJMzNDZ0VnUFhOYWVodDgzL1l0NENRRVlQU0ZjaytJ?=
 =?utf-8?Q?2nIx6tua0fmO/I5AMf9VqGvwZgsTXmelLkg09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1fc1a13-2aee-4404-d552-08df2dd0f724
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 11:06:03.5763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y+nDxbKyq+nINB+izfENqoRG6IrkS0hedoU94Oic7NZ4jTPLFcMn0krju+sKdIxBXqrFwVud8EnH/yyOCOxOclO/9UiecPTgGzKaOEKVmhVA5lAozEdccj0/M7inCt70
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8866

The i.MX937 is a derivative of the i.MX952 SoC, so it reuses the i.MX952
device tree as its base.

This series adds the DT binding compatible string for the NXP i.MX937
FRDM board and the device tree support for the board.

Compared to the i.MX952, the i.MX937 drops the local dimming and ISP
blocks and runs its Cortex-A55 cores at a lower maximum frequency. The
PCAL6416 GPIO expander is at I2C address 0x21 on i.MX937 FRDM, unlike
0x20 on i.MX952 FRDM.

Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
---
Joy Zou (2):
      dt-bindings: arm: fsl: add i.MX937 FRDM board
      arm64: dts: freescale: add i.MX937 FRDM board support

 Documentation/devicetree/bindings/arm/fsl.yaml |   7 ++
 arch/arm64/boot/dts/freescale/Makefile         |   1 +
 arch/arm64/boot/dts/freescale/imx937-frdm.dts  | 111 +++++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx937.dtsi      |  12 +++
 4 files changed, 131 insertions(+)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261019-b4-imx937-frdm-84ae3d4b72c1

Best regards,
--  
Joy Zou <joy.zou@oss.nxp.com>

