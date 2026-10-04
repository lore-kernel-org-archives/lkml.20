Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021094.outbound.protection.outlook.com [52.101.70.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35C4399CFC;
	Sun,  4 Oct 2026 12:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791117032; cv=fail; b=aW+2a6VluFBIjUm+h0NZRD1MN5BWnL1AyfB2GQtP5RZf82rEEllRRFofOmvm4vyHv6mYFcgtk56J2LnRD1t/YgsO3rNMiEzlqZGTGk7U55ATvGDeNd0DLUbQS2dPIE8+TlT8N6ANf9OTOOkK10BMn96yWjENVZKSs7pfpa1ox7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791117032; c=relaxed/simple;
	bh=57i+Nkb1C2/1Of+ihFK4z/QbSENnhBd1QSg3Rp8N9CE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=QrXZ74Oe/pBmr+pWOc7olPAgHXwql6evvoQu2LGVJB469vepeWfnG6Tutbo/+xZ587cOmQYuwPKWjm1+cZsw9yjPp29aCpBHhW2XPi+B9Yni7dUrjQwb0FrrM6Fp104gXlG3nFnoK6VnDVSUZOOgrmufWoYk0gsKzohW8lA+hSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=xwsYCgMZ; arc=fail smtp.client-ip=52.101.70.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="xwsYCgMZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XT44vEWaDWUCsKMJZFjMO2r95LnwHnA+fwRYG9Iqija/sqRZYobjlpQ2qQafsPWLRv8BzVXGbk56ebxnTVmeW1CCGnqqDDnUana+FRi0lHI/5BZiOMw5I8UF9CfKSz0Y0FE89r2CguTL4GGzqYW+WuSCcmex9OcwIgwSDXUhZklz6d2ZN5p3k3+yY1YvA/cipMqqNTDTrdOQKfqf6EfQHeAoEFatBG0ZW/EmobRTzCRtm0mnpRes89X2+p4pUSrpKyyolf1tCsJsrvyvgpRKBhtPiqgsJyG1n1J050SK7zKc8M27aXOEVtZw8MeKGc9k/ZXp1Uo4Ktx4ovv7BX0QWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJNnz/5CNe4xO6XSAkypL/VPqreyOOyt4/kVPAcn0DA=;
 b=D9YGqffTC9NMoINle2i10pFt6RPR1IbYyG577kUhUKShDhhOzIToV8ao9ezYjWPNePH3uX7P4SnFTgpGUjgZSRTvk9GTTAc5WRXNMIkUExEm3uTs336SL+sTgSL600kDodgCmXcj/Pvl2dX+FhmL3Q9zbQ87zd+b65csRWhHeEKZor5UfDD2yo9UTylq9kCEv0qycLq6uTMevDdVLapxTiAjByzQD7n5o6bOHrNo77WswLtxBsOv9R8OQ3Tozbl3tV49rLZsRwXQUzPtZyaGdHTiE4NCRPROF9zBewcfvU3ZjX2rtlkzdB+l764WXz/rt2HVi9k0Qu7lbZoW2jgRVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJNnz/5CNe4xO6XSAkypL/VPqreyOOyt4/kVPAcn0DA=;
 b=xwsYCgMZPF2pY4xPVIgsxoN85ZjxHvXicQ7X/eOyiIIa9OXoGdTfClTMHygPG8Q7cLHmffQ5fgu5XwWTVFURbyfK9a3ihw29VA7O+kt7c/gi5CYQNpim2zG4VdXPCYXMzGnh0/jrToLhS0UoR3ZnMwtDIubJ/NHihYZdQmurTe9wGU9SFlENQqVXNPQpPEae7WRN4f0pWOBycGeCuc8TtjoqkC9ddztsszhLAanUKVJ31+Q4F/yooola+40jnkw/GIfjISlsij9IRdPn/5O0gzzGk4Vmq+MVLMJLeG6rso+iyZuwiBhXIwrjsUUbkPjStshUd9dG2VkiCQutBZe3JA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com (2603:10a6:20b:3a6::23)
 by VI0PR06MB10637.eurprd06.prod.outlook.com (2603:10a6:800:2f5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sun, 4 Oct
 2026 12:30:21 +0000
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17]) by AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17%4]) with mapi id 15.21.0472.016; Sun, 4 Oct 2026
 12:30:21 +0000
From: Tapio Reijonen <tapio.reijonen@vaisala.com>
Subject: [PATCH RESEND v4 0/2] mux: gpio: Add optional enable gpio
Date: Sun, 04 Oct 2026 12:30:13 +0000
Message-Id: <20261004-add-external-mux-enable-gpio-v4-0-e9393660feed@vaisala.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Peter Rosin <peda@lysator.liu.se>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tapio Reijonen <tapio.reijonen@vaisala.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791117021; l=4768;
 i=tapio.reijonen@vaisala.com; s=20250903; h=from:subject:message-id;
 bh=57i+Nkb1C2/1Of+ihFK4z/QbSENnhBd1QSg3Rp8N9CE=;
 b=Kg47DzItipoHzqGYHDoTD4guWKJ1BabbGTHFZmD+S1Gy0JxXdU4wrmfJ2bueJzm3w8Z+DnyO5
 ygEX2Vn6RSYAas0ZwRXd2doxu8fhYPm54Rv86c7hSsBrFXHWk8Z025D
X-Developer-Key: i=tapio.reijonen@vaisala.com; a=ed25519;
 pk=jWBz3VD84WbWgfEgIqB5iFFiyVIHZr52zVBPOm7qiGo=
X-ClientProxiedBy: GV2PEPF0002394B.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::34a) To AM9PR06MB7907.eurprd06.prod.outlook.com
 (2603:10a6:20b:3a6::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR06MB7907:EE_|VI0PR06MB10637:EE_
X-MS-Office365-Filtering-Correlation-Id: eb6a2395-2912-471b-98ae-08df22134204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|52116014|18002099003|10067099003|3023799007|260925022911599003|260925021911599003|260925021311599003|56012099006|38350700014|11063799006;
X-Microsoft-Antispam-Message-Info:
	4zNDVyEi9BYO+b7HGKU1HqQOYg20Sb3y3FO4KOs7SxWVOLG/AAX7A6ezCd6l7YxOWTQEXS8R5U5YbrQzxY69eh0c36MfMujEvq7QEhtNJNiRReCQTIIno4ZcuzDKc0I+UNRC8Jbt7hgg4LcvbFoyNMbeP76zjKox90abrBN+WBAmk6ApwzDyGFX65gCudtYSxsi2uZRYry8Yy4ZgdLccQGaV7ly2VoeHEBzXMwzwR/zwviK+NvBvvrqaEPFNYMtNC2NmG+NwdFp09J0SekMrQ0wuBQ+dbTvpKaN/PnnpqbgEDb8IKs7/RQbSkRvKxQnMakDIfLb0o80v7di6Tnb0abkfaJZs1i+35e82wekMid1s8xjqdK887ikFffPhlmK0QHK2Is9p4uDITJ8YXwXfpnDXAU8T/KqRzQrD+UYgWfVR5fgdaRZXyULGeGfTI6P/JNzDDC/p8sN2fYSNJfTHm5p3InvUsKQAwgkGPHLGz3uL9Is9wzo6x8ZQ7HC51CZaHlH2MvIbKi2GRZZ/lVgaZfa1xlVAffqdlYcd2tLR3HLXM7XqQYiB+/OU590oFBEIAXOhepyadgw7xEeBCbKYeKXRJvhh75hjofcLyNmfohemKRuJGuVYryOn3kdNAhfHxFivdcsrbmGfFeU0i8Wq6CUcBbBDG6YnZ8f2mtY6qyfIHzGHqBULz4ss8IA+t/8yIvs0egNYBE2ssUhkxuTiL2QA/bccnBj6AimFyLmCdIc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR06MB7907.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(52116014)(18002099003)(10067099003)(3023799007)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006)(38350700014)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEdXOUhUMFlzWXNWWVFRZVExVjZjZ041SWZSZ1Z5eXE4ZDZSSmNTU0VXdS90?=
 =?utf-8?B?MWFlKzZpMXpQY0RWdlhhZHBqZEdJNERXOGVEc1dMcXVHakg3Nm01TUtRK3BQ?=
 =?utf-8?B?UWRaYmZEWWFaVEljQTQ3UXFhU1BmSG1YQit1ZXYyU0hKd1lsOWpheFNBWFFB?=
 =?utf-8?B?NHZVcHA0SDkrSExiM2ZwRFVEUDlmUmtTa2d0Vk5EYU9PN3c1eTRnL1N0YUZt?=
 =?utf-8?B?eEdMVDdFYXFlY0htWGtNeXQrc1JLMnY2UzF0YlkwNHNPUllWZHN6L0U5TXBt?=
 =?utf-8?B?WjFWbFUxd3IyYVhWNVpmZDJaNHkrWWRxSUpZOFdieTNKanZrVGd6YWp0MDIx?=
 =?utf-8?B?bVFMTUlxVnFwK1lRdTNxSmFRS0o5QS94c0hGbnVZVmZyZGIvSEtXTGhvZ200?=
 =?utf-8?B?VnBpQjZWTVB6cHpHNEVQbS8wcG5MemVkcFAxVFp4WXdkQ0g1ajUwVkJYM056?=
 =?utf-8?B?R3FCcG5SNjcxbHNUdHhMZGxrNldqbjhNWkpoTkUvcGphZ0NDTEZuOVFucXAx?=
 =?utf-8?B?SG1BKzVmZTBpM1JjUHlzR3A1TzZoaStUWE5sRVhCME9WMjlhR0t1ZWszcGhJ?=
 =?utf-8?B?ZkpEUjZtQWx6R0t1ZWRBbjFtZ2hBVVdBZzBjU2l4VFhhZG1lQ21DeWhwV2kv?=
 =?utf-8?B?eG42dyt4YVY5NTNEbEpFKzdoVE9MZXFjMGtNT281UFBtTW9GRkpoa2RYUEZv?=
 =?utf-8?B?VlduUWxwQzZGS0ZnZnlkci9USjk2TWtrZS9vQmR4aWFOUWFuM3lOeXZ2MCt5?=
 =?utf-8?B?OEF5a3R2NkxGUHJuUlFBRzJ1UGZTeDVwUGMrdTlKeDYzZ0xxNHpwK2ZWKzl5?=
 =?utf-8?B?THZJd3V6V2pnS1JIdVpuUVdUMWdtSmpWd3dIWHIzMVlucCtKYkMxUGNIQTF0?=
 =?utf-8?B?WGQvT092Tnpyc0U3MnpycmhuUjlOa0FlZ2dLRkF1N2Nmd1lmSUNKU05mZ3Vv?=
 =?utf-8?B?Ylg2UEF5azEzNHZoWEJra2QyVHR4cll2aHlpMzVub0JKYjhKa3pjWFVHNmlU?=
 =?utf-8?B?a1pZdEJBRmoxYmR3LzNyYmtTQ0lLdTZLU2pBZC9nTUorcXlrL3dsYi9lNWJ3?=
 =?utf-8?B?MVRZeUpBbjZqdjZHbkswa3h3RS9veFhmY1hLaWt5akFNTFRScW8ycGR5Ulph?=
 =?utf-8?B?bExJM1QyV2hxcDJLOGY2T0w0WTJXUVhPNUNrTXZhVHFWVkVURzhHeGVnQmFT?=
 =?utf-8?B?cXVTbjhuMU5XV2lPNm9iZUlFN2FGOE85MmJkMEtsZmdWMFNEUTJOWGswVmhW?=
 =?utf-8?B?NG4yQlVIaVpKY3o0dW5GUGcxQ1VvZ29ka0lCa2s1U0dhQUVFb2ZVdlcrYUVQ?=
 =?utf-8?B?VmFITWRGVzdoRVpDV0xYbitmaUFta1JkSmF3QkdoUVFBTUlFcUFtdXRSLzM3?=
 =?utf-8?B?VWUvSkpPQ0Z2enNKOUIvaTdadjMzdHA5d3FKSmhQaVZwc1VmQVJGRzJkQ3hz?=
 =?utf-8?B?YTBXc1VJSkR4c1daUU5QQjJNYkN4TUw4SGo3d0hOcUdLQ0hlQ0gzWFI0YXNE?=
 =?utf-8?B?LzRhR0UyUlgvVFNpenJYTlRiRFU1cDBER3g2Q1BhdHZMQkVOMWpmeTVqRGMw?=
 =?utf-8?B?MkRzRnlEUUI2czVjSmlzMTFiRTlzZ2g2UEJxQ0F2S2QzOVZlbEpFdnhBa2JY?=
 =?utf-8?B?cHZmTy9VTmtUY3lUZjRuME1rVE9TREJJUDlzZ1NPZUFBU3IrQnU5a0NpaW5q?=
 =?utf-8?B?ZHdNb3ZiZ3EwMEd1dm95and5RXZiL0RVUEp6UWxLMk9KL1BtOGpsYzNkNzhr?=
 =?utf-8?B?OE81d0VqQkp2Z0dwbkdieWhwZFhZOWxrOW9UOG5JSFJHUis4bm9uSyt0Q0ZP?=
 =?utf-8?B?STd0OGppVHJSTXhuc0RFSjVuWENSeUxvM3RQSXZreVZhdHNqVlZsWDJWdTlQ?=
 =?utf-8?B?bHNKOHdCU3Y4M3RReWZ0VVF2OWZvTVJ5cFk4THdHd1JoYTRPbVpHdW54U2th?=
 =?utf-8?B?bFRLOHN1Q1JnR1hMQjJXUVBITU1OdS9zSTBtWG1YVGp4UGpjYW1GcVlVRHUy?=
 =?utf-8?B?Z3hDTDRzTUN1c05hbmtUZHZ3c2JFZ04xNFcrWkNJcTFoQXkwSWRPdU90Vm9Z?=
 =?utf-8?B?QmNXV0wzaFJlblVKWWtJNTYxNnI5eUdPNWxSbWVoY04rUm5CSUZmczVvYlg5?=
 =?utf-8?B?NGx0MGdhdVZ3QmJiOHhtRkQ1eFZNRWhabDd1MitqemdnQXhBUXJjVDcrQnRo?=
 =?utf-8?B?V1VPR2V4c1FYRlBBWkE5WlhRazdsOHZPWUVxSjlkSzRIb0dWTXVJMUpRKzRD?=
 =?utf-8?B?QUdCQldjYU9mQU1jSUx5c1lZWTBSek03S1JheEROTnE1cjh4QkRFcFJPU29V?=
 =?utf-8?B?WEdKUXhTbWVYQi9lQy9jaUFVM3hJcDRSV0hnR0pFTDdHYkIxQXdQRUlkTEZ4?=
 =?utf-8?Q?4ewKzzM5I62SIUao=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb6a2395-2912-471b-98ae-08df22134204
X-MS-Exchange-CrossTenant-AuthSource: AM9PR06MB7907.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 12:30:21.7985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lzhcn46/QxrmiL41HE4oVQjK/I2tEml2YwpRVi4YHKQYV9uHgqEm4harND1xy08uztPELerlYf6LeRRVhFv9vuTWnPbeL8n2GOt116pSnVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB10637

Analog multiplexers have an enable input that puts all channels in the
high-impedance off state independent of the address inputs - the E input
of a 74HC4051, for example. gpio-mux has no way to describe it, so it can
neither reach the idle state of disconnect that the mux-controller
binding defines, nor keep the mux disabled while the address gpios are
updated one gpio controller at a time.

Add enable-gpios for that input, and use it in the driver.

Without it the driver rejects MUX_IDLE_DISCONNECT outright.
mux-controller.yaml allows it - idle-state is an int32 with a minimum of
-2 - but mux_gpio_probe() treats every negative value other than
MUX_IDLE_AS_IS as invalid, so a device tree asking for the disconnect
idle state does not probe at all. On the board below that takes out the
i2c-mux behind the mux controller, both SFP i2c buses and both sfp
devices with it:

  gpio-mux muxes:mux-controller-slot@0: invalid idle-state 4294967294
  gpio-mux muxes:mux-controller-slot@0: probe with driver gpio-mux failed with error -22

4294967294 is MUX_IDLE_DISCONNECT, -2, printed through %u.

Tested on an i.MX6SX board where two SFP cages share one SMBus behind
DG9411 analog switches: the address input selects the cage and the
enable input gates the bus, both driven by a PCA9501 I2C gpio expander.
With enable-gpios and an idle state of disconnect, the parent bus scans
empty between transfers while each cage stays reachable through its own
child bus. A logic analyser on the enable, address and bus lines over a
full boot shows 97 enable windows and 82 address changes, with no bus
activity outside a window and no address change inside one. Dropping
enable-gpios while keeping the disconnect idle state makes the driver
refuse to probe, as intended.

Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>
---
Changes in v4:
- Pick up Conor Dooley's Acked-by on 1/2. It arrived on the v2 thread
  after v3 had been sent, as Rob Herring noted.
- No other changes.
- Link to v3: https://lore.kernel.org/r/20260904-add-external-mux-enable-gpio-v3-0-1b868e669e43@vaisala.com

Changes in v3:
- Address Peter Rosin's review of 2/2. Cosmetic, except for the last
  item below.
- Say "Some analog multiplexers", not all of them, and note that the mux
  gpios are not guaranteed to be updated atomically and that only
  controllers implementing set_multiple() can possibly update theirs in
  a single write.
- Drop the _gpio suffix from the struct member: enable_gpio -> enable.
- Reflow the comment in mux_gpio_set() and soften it to "might not be
  updated atomically".
- Flatten the idle-state handling in probe, read the property into the
  existing default when it is absent, and assign mux->idle_state once at
  the end. Use dev_err() and return -EINVAL rather than dev_err_probe(),
  as suggested. Written without the empty if branches of the suggested
  snippet, but with the same behaviour.
- Beyond the review: return the status of the gpio writes from
  mux_gpio_set() instead of zero. The other mux drivers pass the write
  status back, and mux_control_set() only invalidates the cached state
  when set() reports an error, so a failed write reported as success is
  not retried. Happy to drop this hunk if it should be a separate patch.
- Link to v2: https://lore.kernel.org/r/20260831-add-external-mux-enable-gpio-v2-0-f6027a4afe61@vaisala.com

Changes in v2:
- Describe the enable input in terms of real multiplexers (the E input of
  a 74HC4051) instead of repeating the binding text, and say what needs
  it, as requested by Krzysztof.
- Add the missing gpio-mux: prefix to the binding patch subject.
- Limit enable-gpios to one entry, and require it for an idle state of
  disconnect in both the schema and the driver: without an enable gpio
  mux_gpio_set() drove the address gpios to the bit pattern of
  MUX_IDLE_DISCONNECT instead of disconnecting.
- Deassert the enable gpio while the mux gpios are updated, not only for
  the disconnect idle state, since they are not updated atomically.
- Show enable-gpios in the binding example.
- Link to v1: https://lore.kernel.org/r/20251105-add-external-mux-enable-gpio-v1-0-e59cba6f9e47@vaisala.com

---
Tapio Reijonen (2):
      dt-bindings: mux: gpio-mux: Add enable-gpios
      mux: gpio: Add optional enable gpio

 .../devicetree/bindings/mux/gpio-mux.yaml          | 22 +++++++++++
 drivers/mux/gpio.c                                 | 43 ++++++++++++++++++----
 2 files changed, 57 insertions(+), 8 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20250925-add-external-mux-enable-gpio-c9ba5beddd49

Best regards,
-- 
Tapio Reijonen <tapio.reijonen@vaisala.com>

