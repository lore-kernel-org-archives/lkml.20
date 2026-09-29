Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010033.outbound.protection.outlook.com [52.101.84.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A414C10CA;
	Tue, 29 Sep 2026 08:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671699; cv=fail; b=cJSLLAGKmzOAEXRau7qrzoOXHwctREtHyVng25KxujWYu591oo+T4tpeTHU7dr1k8nzs/xxWuT3WaoI2+fKV/ht4XrKoNoMufwbuWyAJbNKpvgzBkUC3VP6+yeoRgQ6wphYgb4G1Ucnse2LKiJFuSJHQjW4OZivxHW41ULy4XQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671699; c=relaxed/simple;
	bh=tsLw4YVbdh+1k0hMVb5aVnU5euYKCzEyPQP76Bku1jU=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=PFGaCums1eTZl2mbQhXSPfcnEmpgnCaTiL36SjZvfFem1KMfMBUriyR8P2zmW4mApmN0Mpb/QPUdTAv4KA0r5R3qA05YNLgKg6PFjlkU+ZYENQK4XC+7D0KTg3EGijywaVJ3trO3bpP5ADDQYvNM85leLvNW/njoiTDk0PqvLj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BtVnejTq; arc=fail smtp.client-ip=52.101.84.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BtVnejTq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZrJPDzRdUzZizppFxzfRas53yQpX8DLL2G0xFTDAuvsNDpwLl0Pn/W1mvG/Rmf1a5V2VUbLTT/kqDFW+6q0GY3O7jSTvZlN2+TcqbmEoZDw0F1zVd3Hs8UjVeACUDf+bE7SdwQagStGT+aktDALBrCLFJ05Ok2Yv1mPkB8/QLqJa27kZzKFIDHbUkka7+kTwSvCih6YgJz/8Bhb1o5aNsDlg9Kf4m3tl87t7OOZxG70cociC1XXQrrVutsaTPbM8H/mzlgTv1Ri3w7oT8hT3opdrxutcVAHBjV6hxaFvpVxi5Tj//EHM+Oj6U8fLHGJ4gCu7K802vwPZES0Qvd1sYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLjtGfOYi8347oEjCAtmMajnlmlNdBrMCPhOeIKBQ9Q=;
 b=q5ncgQKfv1UTc2KB5RM8YibPhGNy16uur8guvPBEcfZui6A0IdHSbOJ9sqfQY+DtcDK8wBn15JmQDe18pZ7dWeD5h7PyIde/PvQjc9dUPI8xa1WmvdOFGvfCOuQdUFufoGdUhj8prZ7fyd7lWSwVU9drYE28sR8qPFAO4RIr6WdQZJzkACuRugAPPGFZ3wN4XA8oI92TEkNYKJB7a+lnQfBvll+2Qb4tt85aVUby6FW2vRVX2mxn5O14S8wDUT0J3L7PbnxtbYOdr469v1SzRkPRnJIidVIa4lsm0jO+D33M8qDTSRZVCxeOzddsqRIfP44TstnQOkM16kG3j8IcpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLjtGfOYi8347oEjCAtmMajnlmlNdBrMCPhOeIKBQ9Q=;
 b=BtVnejTqKktyBG9QN77aouq9nE2w5VOCPAg9+cmx+96T3tguyz3TYSPZoq7gQVGM5JB1lD8pBsnIQOAj3d5i4VQBFOua+rWZk4zNfsadOEDqAfS+hXX7d0XcNPRIrEd+xgZk0BQtkERdoWg3r6uoAbR/JZmlj7QoEvodohw6h3BadNYgKfbsVsQmn+CoXzIW+I2bB9V+yP+krXfGuWELXphWAS2MUJ19szKgzozElEh1nfsucI4S0movmfc3UharPHYqIDIrHxaPtyuUaKYh4AUaQpa+xhHys1Ah3oxlxSNgbcfAu27KJCrXXw9PJ0Gv9WASvLyzaOhL2yOD2GiGOg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com (2603:10a6:10:10e::22)
 by PAXPR04MB8336.eurprd04.prod.outlook.com (2603:10a6:102:1c5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 08:48:05 +0000
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960]) by DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960%4]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 08:48:04 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v4 00/11] media: imx8-isi: Add i.MX952 ISI support
Date: Tue, 29 Sep 2026 16:52:21 +0800
Message-Id: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEV8u2oC/2XMyQqDMBSF4VeRrBvJ5K121fcopWSsWTiQlGAR3
 71RClWa3Qn3+2cUbfA2oksxo2CTj37o8xCnAulW9k+LvckbMcKA1PSM88XDd1NTMQygJVSuUcB
 rlMEYrPPTFrvd8259fA3hvbUTXX+/GQb7TKKYYK2clJI7kt91iLHsp7HUQ4fWUGI7zOkBs4ydd
 EYJJQQY8Y/5Dze0OmCeMTe1c5QDN0Ye8bIsH446/xcgAQAA
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790671948; l=5161;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=tsLw4YVbdh+1k0hMVb5aVnU5euYKCzEyPQP76Bku1jU=;
 b=EvmiGCrgufqqTUNMOXkhQ5TgcAimb1w1jcLhmfL06v0WtvwX5pGABGmRjEJjYEcWAxLyOxoLJ
 lv7oNGCCdaaCOmVUqzBRuOeLafr5FpYtb7hKFxHAb4aOiZwaz50gHyF
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5PR01CA0124.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::16) To DB8PR04MB6667.eurprd04.prod.outlook.com
 (2603:10a6:10:10e::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6667:EE_|PAXPR04MB8336:EE_
X-MS-Office365-Filtering-Correlation-Id: baa6c81c-bf55-4d43-6123-08df1e06602e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|1800799024|366016|23010399003|18002099003|3023799007|921020|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	BgaRg5F1l+1TxSJBu5gEOkbeSEBZs7ymZf1G6IAKr48DyBCTG6D/MNN78WnqRReWw7aiSkhjeeUpLCWCvUk1u9Q0llwewc962wqkrCferoGLJWqApSsMU6Yd+ql5R5ynvCiYbOMD+c0eoIeIx5yGNf+0ODgRqbjEDRHGtH06QPviPj62fgsgdXzatwU3Fw4+tuYcK2qO6xhXYazYvTRTin9NkUEE0bg8GwDAMlX8P6oBXnhB4DDdHynVkpcgXpH+k1DB0pt/M3ygrjEHKARtDX3mESV1zJ30O4WNnifQrJzz/MHLdH1vgK4GJes8FafVAb4pbve7Pa4DeCmJvXi3k0X4Kqh9Ki4f1ZnHfgvNYVErISzGN0NSidkn5YCkQBNidgADfWhWCr3ZOd2bzwqn3BLxbkt9Zx/tNW8sBMwJRLUY6gumSzsDYvVjzWvchBuoT/EyJ49nDpYTuNfOgZz1S+Z7dwJTnbOlrb/vh47YpHqkRbmrtlpCId8PaPHYHc4Nb1OjU0X64TZUx4Em/vIvqHx2+xTR929SDuTa3xmdxkFzH+Erte8XwR1IdeLvQ0Yn6lNZTrNv+ZoNVmh222QJI0dBH3WNhXj2jgoZmyVkV8HCk+G1EuV4Z61tXX03Ih4sUBD4m8ALWDC2jxyJyyPcbTPWvPxP7lg1jN7gHb0S7kqOLDON45JOSpfZE9Yy8neT/95WGr0tvauNezO3AfgXjw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6667.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(1800799024)(366016)(23010399003)(18002099003)(3023799007)(921020)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2FRMSswR01UM1pyY0plT0poMnZCWVFjQ0tUUGd2aUtGWmo2SEdXUTlkT2ZD?=
 =?utf-8?B?L09tRzR6R2lCbXI2SFBadzBkbVA0WEdhMWpMZlA4cERlL3JyVXhjd1FxbXdw?=
 =?utf-8?B?Z0pBMFpTNWZKcGw2SHp6bmxzaS9pdEU0WlpTR1RHZ0lXMEFNL0VaRVJNWndx?=
 =?utf-8?B?UGE5ZGR3alJ4TkVMTy9XUUQ0VTlMSWlMV1Z4UGpXU2gwbUZEQ0owR2F1QVhB?=
 =?utf-8?B?TU1ENk5nVU9iRjd0cjRhQ0plaGlQNzY0UkovZCtPTWxLdkp0ZlR2NUN5RXNp?=
 =?utf-8?B?ZFIzRkw3NktJWUFJSFhoRnNobTRUQzhld0R5bW1HR2kwZE8yNXgyNUhCRE5Q?=
 =?utf-8?B?VCttZjZDM0VIOHZPMlN3MldEbDU1TTFKZjMzWDIwYVJ3UUJCQURiY0FpMitX?=
 =?utf-8?B?TmphZTkwd0pDdVVETVJnSXNpOGdWbFVORkNGNEhDbkVrYVFabzNCcmtNSnZB?=
 =?utf-8?B?bHNMSEtnUzhHY01ObVdwc0tPZS9LaGh0MHJoa0FVRURNcXZ6S0wzSGdzOHZ6?=
 =?utf-8?B?eXhSYllhWlE0VkJNWTNNWE9ISm91Y3NVMnBSTTcvbXpxaDlMUzU1aHlyUHFr?=
 =?utf-8?B?UiswVzB4MW11REdIcTBJZloydTlxN1ViZFJNYUhTSVEyWDRuNDQrbUtuMDFk?=
 =?utf-8?B?dEYyUHAvUWo0K3hEeHQ3YzRRUGJWbUhKOUszK1ovM3NMTWRKdUkxV2dlNmJ3?=
 =?utf-8?B?TU41S1lxR1NNVmZPcTJaYTdNZmYwdXJqSnZXdjVnaDd4bUtBNlc1RDFwNU15?=
 =?utf-8?B?ZnJyYVd4ZHA0aTd4OXl6MFBHejNjSSttdUE1N25QN253TmFNOVg2V3VWYlBE?=
 =?utf-8?B?bVBPSThHZHlCOC9mZ215WHY5RnZuSXp4UFhmelNrMlE2Y3BwME1RQ1RKTVNi?=
 =?utf-8?B?RlBpbXMyaGpHNU5XWkVhTHlNTmZRZzJqMnJDOUw3b2pwekNrd3VKMHk1NTFH?=
 =?utf-8?B?M2ZOWXRSY0NyZ2tMTk1CcTd3Z3U0LzkrdXJpcS8wdEVzRjRDRzhodVk3aTNk?=
 =?utf-8?B?MlhXSllPNStjSFczT05XcWpOWkFiMWF6b3hBUUt5Q1dPM1M4aUREbS9HNUN3?=
 =?utf-8?B?ZEx2VEJQTG1RRzc4QVdyQnlOakpPcmFQT0crVWxKUXZZck5BVWhFZGpLb3JL?=
 =?utf-8?B?VW45Z3RldzEyRXh0UlpyUC92Zjdhc29RK08xY3hLUmtlNG14THRIWWJ4c0Nk?=
 =?utf-8?B?NVFPcDZEQVFNNVRrSk1XN09hSFRYa3UvQ3YzdWJrejhiWmpXWlJ4MkZuOHFu?=
 =?utf-8?B?M3AvaEhyR0lnb3NJT0N0dEY0S0ExUkRMM2M0bmJIMTRxVWRmSVFHbXdpTVlC?=
 =?utf-8?B?YzgwaVdXbXdWSFBTdkVKcnlJSm1UQ0xWdFhkU1ppcGhZamV3UXdXOFdhNmRj?=
 =?utf-8?B?Wm5jNjJxQmh4VWpHcG53c0xLeU4vY25yMStmd1VTU0x1TE9kZ0JwUm1VUTZu?=
 =?utf-8?B?OGRzcDlTb0V3bExaRzN4MHBsQWs5bitPM0plMHB5d2pTdmpHVmpuRUJkSFJ4?=
 =?utf-8?B?alZKemYzL0grUmJzN0ZXMTVSalBWQ01BQzFsalpyM1d2bUhEOHZwODgwL3Bq?=
 =?utf-8?B?SkFuU0V2NElJRE9wOERabDZ1MGlDc3Q5OG9lRVdzSzdoa2tmcEs0TGtkQ0Va?=
 =?utf-8?B?b0xuWnl6YnJGUWRNY056RXI2QmVkVzRVNDN0UjFMa2NIUk15RjNyZmJhQ2pH?=
 =?utf-8?B?ajFRV041M2lXSk9xV1JmczFXWVZwVHZPRDRKcUEyNS9rZzJ3czhJeEdjQnlH?=
 =?utf-8?B?RFRzclZsQ0xFTlc2M1Mza2hIaklLdGszNEU2c2t3d3FwY0VyVUg3Rzdpekxt?=
 =?utf-8?B?SFF4bDZ4bG0rd01HbGcrVGhjK21EUlVzOTBDZ2JXd1hxSEZUSTYvT0pVMU1r?=
 =?utf-8?B?VXZDT2NBcEU3bmtEQTN5WWN5dE9WR3hPd2RwK3hSaEgyRnRYZVlxV0t5aGUr?=
 =?utf-8?B?VGtFaFpxNnJTeE1BaXg4U2xKc0JsZGI5c2VYU3IwYS9DbktaQVpjODRRakQy?=
 =?utf-8?B?Vjc1NVVnMWhURmhZTm9ydmNrNjFDeG5XeW1qT3Ztb1NQUVhQWXRFMjNEYjg2?=
 =?utf-8?B?SnFRMzJwMzI0RVBMeC9sN1FMRW9kYVhkOHdtMGt0UGdvcU5OY0V1T2FpTTZw?=
 =?utf-8?B?WW9EYi9HWFUwcU1ZVTlFQ29lbG9hbmlxTGtxbFY2MVdRenFlQmRhbStuMFhj?=
 =?utf-8?B?RE1DR0dlbk84RzFDYmVkRmZ3WWVUUG4vTndxTkRrUU8wSWJ0emlkSzZDUW5B?=
 =?utf-8?B?RjIrN3NGbTlTOCs1Yk9GVGxGRDZ0enZzS0JON2U1SnJ1dTNuenJKNE5nZ0hP?=
 =?utf-8?B?Vys4ZzNIOHF1dnZJSmhSUlhzY1FDSTlCZmZIdnBwM3FsSGc1RVhNMFE2NllY?=
 =?utf-8?Q?1nJ1wc/WzVxvgCIiFtbKvgL2eMC3r+I7rGlgF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baa6c81c-bf55-4d43-6123-08df1e06602e
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6667.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 08:48:04.3373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJMusNXbrskYD6B/qTsvWG6DSnfEoVrb8bo1w/uAKCz7VP6SA0H8amf7m51iyxPNFAuEnIRrn9qTMcQfl92ssZhlwCu1hFB72RI4xGYUYxg4BiaEtHMmzU/70+znTwTH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8336

The series adds support for the i.MX952 Image Sensing Interface (ISI),
which is a minor silicon revision of the i.MX95 ISI.

The i.MX952 ISI reuses the i.MX95 ISI core with the same 8-channel
pipeline and 4 pixel link inputs. The key hardware improvement is the
addition of RAW10/12/14 output LSB alignment, which allows the ISI to
output right-aligned RAW data directly, matching the V4L2 format
requirement without the RAW16 workaround needed on earlier platforms.

The series is organized as follows:

   1. Reorder mxc_imx95_data definition to follow mxc_imx93_data,
      matching the order in the of_match array.
   2. Extend output format mask to 7 bits unconditionally since
      bit 30 is unused on older platforms.
   3. Support mbus_code filtering in mxc_isi_format_enum().
   4. Reuse mxc_isi_format_enum() in capture format enumeration.
   5. Apply RAW output format workaround at runtime, storing the
      actual hardware format in the format table.
   6. Add RAW14 output format support (available from i.MX8ULP).
   7. Select MSB-aligned RAW input from pixel link on i.MX95.
   8. Exclude RAW10/12/14 output formats on i.MX95.
   9. Add the i.MX952 compatible string to the DT binding.
  10. Add the i.MX952 platform data and of_match entry.
  11. Enable RAW10/12/14 output LSB alignment on i.MX952.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v4:
- Rebase to latest media/next(2dcdfb625c3b)
- Split the original patch 5/5 into multiple focused patches:
  patches 3-8 are new, each addressing a specific aspect
- [3/11] New: Support mbus_code filtering in mxc_isi_format_enum()
- [4/11] New: Reuse mxc_isi_format_enum() in capture format enumeration
- [5/11] New: Apply RAW output format workaround at runtime
- [6/11] New: Add RAW14 output format support
- [7/11] New: Select MSB-aligned RAW input from pixel link on i.MX95
- [8/11] New: Exclude RAW10/12/14 output formats on i.MX95
- [11/11] Split RAW_IN_MSB_ALIGN into a separate preceding patch
- [11/11] Split RAW format table and RAW14 changes into separate preceding patches
- [11/11] Move isi_out_raw_shifted() to regs.h in the preceding workaround patch
- [11/11] Rewrite commit message
- Link to v3: https://lore.kernel.org/r/20260915-isi_imx952-v3-0-3d8ff1363dda@oss.nxp.com

Changes in v3:
- [1/5] Add Reviewed-by tag from Laurent
- [2/5] Use unconditional 7-bit mask instead of per-platform approach (Laurent)
- [2/5] Drop Reviewed-by from Frank Li due to significant change and request to review again
- [3/5] Add Reviewed-by/Acked-by tag from Frank, Laurent and Dooley
- [4/5] Extend mask globally instead of per-platform (Laurent)
- [4/5] Add Reviewed-by tag from Frank
- [5/5] Use CHNL_IMG_CTRL_FORMAT_MASK instead of the removed per-platform format_mask (Laurent)
- [5/5] Derive raw_out_lsb from the model field instead of dedicated platform data (Laurent)
- [5/5] Clarify the CHNL_IMG_CTRL_FORMAT_RAW14 comment: the format is documented
  on i.MX{8ULP,91,93,95,952} but only used on i.MX952
- [5/5] Rewrite commit message to explain why the RAW16 workaround fails on i.MX95+ (Laurent)
- [5/5] Add Reviewed-by tag from Frank
- Drop "Remove unused model field" patch; model field is now used to derive
  raw_out_lsb capability (Laurent)
- Link to v2: https://lore.kernel.org/r/20260831-isi_imx952-v2-0-fafdb4b446d4@oss.nxp.com

Changes in v2:
- Use fallback compatible fsl,imx95-isi for imx952 (Frank)
- Remove unused model field from platform data (Frank)
- Add Reviewed-by tag from Frank Li for patch 1/6 and 2/6
- Link to v1: https://lore.kernel.org/r/20260826-isi_imx952-v1-0-cbfaaa3f0000@oss.nxp.com

---
Guoniu Zhou (11):
      media: imx8-isi: Reorder mxc_imx95_data to follow mxc_imx93_data
      media: imx8-isi: Extend output format mask to 7 bits
      media: imx8-isi: Support mbus_code filtering in format enumeration
      media: imx8-isi: Reuse mxc_isi_format_enum() in capture format enumeration
      media: imx8-isi: Apply RAW output format workaround at runtime
      media: imx8-isi: Add RAW14 output format support
      media: imx8-isi: Select MSB-aligned RAW input from pixel link on i.MX95
      media: imx8-isi: Exclude RAW10/12/14 output formats on i.MX95
      media: dt-bindings: nxp,imx8-isi: Add i.MX952 ISI compatible string
      media: imx8-isi: Add i.MX952 ISI support
      media: imx8-isi: Enable RAW10/12/14 output LSB alignment on i.MX952

 .../devicetree/bindings/media/nxp,imx8-isi.yaml    |  18 ++--
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  37 ++++---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |   7 +-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  |  56 ++++++++++-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |   2 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    |  22 ++++-
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 110 ++++++++++-----------
 7 files changed, 171 insertions(+), 81 deletions(-)
---
base-commit: 2dcdfb625c3b8fe87454e19dfbc54b3e3f0ad70e
change-id: 20260817-isi_imx952-66ca65f9b638

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>

