Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022080.outbound.protection.outlook.com [52.101.66.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5751488205;
	Wed,  9 Sep 2026 10:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788948850; cv=fail; b=ndmoYx+G4ozTJcyIIgP4CTnIJ6cIz0kPrlHHEHUoSFvn1sDo/ws2zZqHuyS7L+1eNe1DKRb+ZvlKrTyvjn72033b1s1tQ6zS6V36vs8rOx35HNeV9LkZYKrWx9KWyxAc96oqPPky9E6kApf4CYry4KQRJcBvj+q/Op3aBDdiHOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788948850; c=relaxed/simple;
	bh=57i+Nkb1C2/1Of+ihFK4z/QbSENnhBd1QSg3Rp8N9CE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=GtpTym+8wFKdLzpiGnUUPmEVOgIbJzFre2aP99LbcHSnx1PMQxTfA1HqjP0pXIevuRToPnc5p6esyxScBtt7u0xkjCY2T1bCZpjnZngansFJP9dmVoAI1deh5Zp0JYp40fdG0zNTegkFDba4/AnRmPw/GKmy5ot48NtXwOTP0n8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=WZYu3a21; arc=fail smtp.client-ip=52.101.66.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="WZYu3a21"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOUl6SboXDy68ShRgl4idN+r4haij5qoekVC0YbQGKVIVlvkdIRIy9axz5z+JVMWHQZwpC9bJZP68ynUfjXOW4puPOkLDC4UOUytx/3RftH+7gEfIB5WRegycmneEVm15iCWPP91jE8ShSWnHY+JTjxJHzZ+Xq7a7PsV8o0pHQSd7T5FPqrTpS0HPKs5TbDZZpsYTsG/1IFPka86IBEvfSfkNhPWx6+pSGKsy2qY/vRzxSz5b8NXGqOeNBv4IlsVZa1udWsBd0F5v2Dy0a7OfjyM+i4Rt2iVN8SIlSv1AzKlnOX1KDDLlPEryCzrEtQ7XEhf13HYMoxZpxAEXwHUgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJNnz/5CNe4xO6XSAkypL/VPqreyOOyt4/kVPAcn0DA=;
 b=YcaFZcsGG9iSmeEBb6FYjnDQDus9efLNlHfGRop1JOg3E9uFbLrQTaGVz+khbc5wQE9zNDN0UXKEIspF7U4gOh+KptU/MdlbaxO7hcRHCpz7yWmqnK3lrYoVjiB9zriikbJ5kd9xhQ3ZhJ7v+WgiWe+FxyqpuE4ePf7v6nDOruH0DKDpuGghMlXxWUcBwLalQMhkR0BuiX5HIe646fsiU1kp8xs2Z3xrpMwyi91e2y949typ3x1VG4Le+prj69wo0yp6IKmKNFm6gEaut1muwGbzwQVZraikz1ZuvXKOo/N/zXgFwEI3KxW/NGwEkroLHox4B6H1mn/LOHnKSE5RNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJNnz/5CNe4xO6XSAkypL/VPqreyOOyt4/kVPAcn0DA=;
 b=WZYu3a21u9kP8j80tNuehD4vpPWrpgYwNw7XdBa0asjF6gJTXQTGMQPRdk0ppPu78Zooz0PYOifGaoNNX1hC949Deg+8SMcZsCrPGw5bZwfpOTDJYgoNcXhhai+gEEFW3/ZkrURAt9B8Kajg+9ndMSEKNwCcLA79q/MOFfwr9dZ6Pi08BIs7bploteJGAJKS+rwafnabrdgLeRpznQvEiRLnNmVQUKY2yBPMOVeaR9dDTM81MrUVtDJUzsOfrY7hjOOHmZkDwlLUHQyV8ll3ULuk/VTvTn9yZTfYYjduOcRe4QR6M5zs6vnKkl6F6bxnDhH5HN4AeMWNyIf6KjJing==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com (2603:10a6:20b:3a6::23)
 by PA1PR06MB9209.eurprd06.prod.outlook.com (2603:10a6:102:465::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 10:13:46 +0000
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17]) by AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17%3]) with mapi id 15.21.0406.007; Wed, 9 Sep 2026
 10:13:45 +0000
From: Tapio Reijonen <tapio.reijonen@vaisala.com>
Subject: [PATCH v4 0/2] mux: gpio: Add optional enable gpio
Date: Wed, 09 Sep 2026 10:13:30 +0000
Message-Id: <20260909-add-external-mux-enable-gpio-v4-0-3b12a767bb94@vaisala.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEoxoWoC/4XOQQ7CIBCF4asY1o4BSrG48h7GxVCmSlJbA0pqm
 t5d2sQY46LLfxbfm5FFCp4iO2xGFij56Psuh9puWH3F7kLgXW4muSy5kSWgc0DDg0KHLdyeA1C
 HtiW43H0PtbFYWnLOKcMycQ/U+GHhT+fcVx8ffXgta0nM1wUWgq/ASQAHKk1tUTeG1P6Y0Edsc
 Vf3NzbTSX44zatCrHAyc43mco8KG9Linyu+nOFqhSsyJ2ylK9I6f1f8ctM0vQHc9o7HaAEAAA=
 =
X-Change-ID: 20250925-add-external-mux-enable-gpio-c9ba5beddd49
To: Peter Rosin <peda@lysator.liu.se>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tapio Reijonen <tapio.reijonen@vaisala.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788948825; l=4768;
 i=tapio.reijonen@vaisala.com; s=20250903; h=from:subject:message-id;
 bh=57i+Nkb1C2/1Of+ihFK4z/QbSENnhBd1QSg3Rp8N9CE=;
 b=0LBeH1zpyA4XShs8RBAT0fIoowpBDvBXLy1COiKkzSToYkoTw9nbQ7WlcMM8I72E0B215JrjY
 QuL2olTLkREArwZsahOXv2R7iO2nhhGf2Ci+r0YegiABcL+zjsFVzSP
X-Developer-Key: i=tapio.reijonen@vaisala.com; a=ed25519;
 pk=jWBz3VD84WbWgfEgIqB5iFFiyVIHZr52zVBPOm7qiGo=
X-ClientProxiedBy: GVZP280CA0009.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:273::7) To AM9PR06MB7907.eurprd06.prod.outlook.com
 (2603:10a6:20b:3a6::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR06MB7907:EE_|PA1PR06MB9209:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a37c734-73a3-4a27-604d-08df0e5b088c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|38350700014|18002099003|56012099006|11063799006|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info:
	2AP5d2Uym8/gud3sawMmS5JActrSnlCgMPKwK4eCuMhMfeoj2ySMdr0mUV6Y0Lc9I6vJNdsSY/EGhJan1ij2z8FC0WIkX9WQcuXKs5uG3wYsfPauiDPx+lyPPF9a5mlUWPDETRtIjb7K2Cn++FNDQF8NennT/lBupnt8a4ZJcAqKaLccW/dujmXdy0ogXriQ/csdouOp2B34ad2/PfLPC0nY57XeLX6gxJJYyUzIoO/Fn/H/seMd2dj1o9GGcBP9Tng2eVOYbqnLDK5/AvzvCktHdqedo1ryqW1Y3XpptOkK7BnMdw1m04QGOcxiBicPmOqTOumY2KXIkJ21R9hLQhALsomzzVmWiKB6pVl5ap6yIogR6bTR6Zc2Q3x+lCmoUHKDGo5TSEs/SYU03X5lS60NZ0Mj5SN5gSqEi9mYBBKeO37WrnEmb1v0L1fCNgW/S+HyXXkbrUgZnAxeMigIll8WSa4Qhwn3ttdeL9NhSUxrvwXZpZwo/zSoOhja1pod8/2PIhWv6xbjOyjtHLwXBxVkkFT5wnEcoEnXCIJj4gyXMovSOheo9Hy4qZL5wREUUHV8MdMktnNLMfME3RZsiJdZaAVVpSEEkGwcpw3yjF61YsXh+JnvDglYrlbJ/ZLNOGnjtKETajI9i20VEelMhmL8d3ZqToqyCfpbjYwggVvTUSrg9JBV68ARxdXyODSj6mWxlSL9grQiJfcbic6msRF4XeICIKnXeI0sWsIUc+w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR06MB7907.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(38350700014)(18002099003)(56012099006)(11063799006)(3023799007)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHRMKzdHcEhQYXE4SS9JdXBZZ1l1dDNISFlvNHZWY2tlN09qSWp6L25EUGxZ?=
 =?utf-8?B?a3JicktCSVNmV3diYmVONmFlaFdRdU9HQlZxalo3THV6V3FqT204Q3BiVnZ5?=
 =?utf-8?B?UkgvMFlKWnRQNjFSMXRlVEpBamhwcmY4WGxTK1YvbFNnZWlwS2gzWVpVYTA2?=
 =?utf-8?B?WEFlUnpjYjlQSkt3a0Zya0RtSHRsU1piTllVUFNON3phZFFveUprS0IybE9Q?=
 =?utf-8?B?ZFNhU29LNElNS0I0d1NEcGlYRTdWdlJ0RkRUVER2bExVRnZmQmtGckZodG55?=
 =?utf-8?B?VE5QMmFnQ3huUDllTS92UWpMQWYzL1dvZVZrL3JGMWVucE1uMExtdjY5MXVL?=
 =?utf-8?B?Mkk2K0JYNUlkcTFkR1VNODYxcVR5KzZ2L2VVWXpCdjVCZzFhS1pHd0RWRloz?=
 =?utf-8?B?QjlJbUQ3UXduT1JURGpKaEQ0UTlCeGVIQlRBWXc1VmFaREZ4TjMwYUxjelNJ?=
 =?utf-8?B?Vk1OVHYzalJYQ0JFWmczSWt4T0pBcW9pVzY4czhudmJYN3pnZWQrcXVSWi9U?=
 =?utf-8?B?Qk5GenpZWFlheE9Bd2lHaEZvbS9RWTVVbGllUVNNQWF5b1lPNkRaWlByYUh3?=
 =?utf-8?B?WWVWalNaeWt2bVM0UWh6Z0xQVVFKbDd3NWg0akxaVTd0b3ZUZnRoc2dQTkQ0?=
 =?utf-8?B?QThLUVBudlJORnZoeHVWTitJdUhCZXU5NjdhOEYxWDIrS1BYaldxZ0NqTWw4?=
 =?utf-8?B?SHhuSFBrMTR1ZnlIZ0hkb2VteTBZNGVzYVFjaDZrKzB6SVdEbFhVQ3NZLzJM?=
 =?utf-8?B?R0FNeFFBWTZZQWRERUV3NGI5Z0drQmpZUjFlUWJPSGQwR2c3cU9XRHVuMmdT?=
 =?utf-8?B?NFkwZXN0U0FoWEl1TS9sMGRQT2JqS2lUVzJMa2NtYVNGUFQvcysxU2pCYWVj?=
 =?utf-8?B?RnJ6bi9qUXorOVZVZEd5YjY0SmRSWUovVE0xTkR3bE5Ma0U2dFNkcHROVXFM?=
 =?utf-8?B?YlVHN0FaTmsxQkdxUFNQY3ZMR1VTYzNPNWtFTElpMUxZaE4vblBuaFpkNTdp?=
 =?utf-8?B?Vm1LVXA2RDdVTnB6THZJZUdLSExpa01YRXVnU294QWt5MEZoRit2RGZjQlFP?=
 =?utf-8?B?YTljRTEwVVNFc1lnSDVpM1d6L2RaMTB3cE1tN2MzRGhJWGFQa3ZRY0ZLNkRv?=
 =?utf-8?B?dWszUmh1RFNSekgrK0hxTGE3V3pMUlVqMTZWVHdsV1lDSkh6WlZybThJUy96?=
 =?utf-8?B?RTk3VXc0aUpxWGNUbEpYUG0xWU4wTHFSUmh4cDhsS0d2bHRnc1EzNVVXTGZh?=
 =?utf-8?B?aU9LbGdKTTVaOGU1ajBNOVdpaGszVHpPRDFLZ25XaDBZQ3dqczEveUI3ajcw?=
 =?utf-8?B?QXNnK3d3bUNVQk5JcnhwalRmcmJmT3ZNYVFIdmZ1RkQwdXZWNWlBakRGZ1ZL?=
 =?utf-8?B?K2g0TVc5NTJiSEtZcGhqa3JxdHJaeDRPdmlqMHYxOGRpQlZGMGowVzBObTFo?=
 =?utf-8?B?SzBmdy9ENDZOQXVhQm9ETjdCa0hoVkJtemlDeDJzUDZKUkZodEpXdUV6dy9J?=
 =?utf-8?B?UE9OM09KUnNXMGNTa0hnUXFUSHp1bGlRSnNqek5tTmc3Q253b1VxWUhOWHN5?=
 =?utf-8?B?b0NuaEYxR2tHL2RIZXZHSWVHYWduTnJJVXBrbHJiRnhiZkRtOTFWd1pMRkRU?=
 =?utf-8?B?TXNHMVA3THB1REF1RFh2c2FvSm91cmoyelFQeDdHanZOT1Q3SzM3SzRveE1S?=
 =?utf-8?B?NXhPS1RPTEhxRGNBWFpzVm1JeUs4SFJLdUVJVHpZMjdycUp1amxpSEFKOENr?=
 =?utf-8?B?VzhvdjMxaWtTUVVHOFlVTjRqS2RIQ0pPbXpLdXJWMlV3enpFaW14Yk1RbDRS?=
 =?utf-8?B?K2w2czRCMllZVXN3b3FlT0xLYUFBeGd2YTJiRHhuMzh5SFYweGk4clRzbnVi?=
 =?utf-8?B?YUlQczZKMDdNNEtycnpVK1dwcC9xMFJpWmhFdkt1Slg4SUVBYTlGOUk4TVVj?=
 =?utf-8?B?UmFpN00vVEw3ZFhybENyQThkSWMrejFLc2NyMXplWFhZOEZYdWc0NFlRUFRr?=
 =?utf-8?B?VU9qOVRHdVN5Sm5lWFpIMHRrMFg5eGNUZHEvNlZaLzdSNEFQbWdhUFQ5WnBw?=
 =?utf-8?B?dmlNVUVPczgrUC8wSkNHZFk5RERYKzdFN0k2MStST2l4L1c1dVkvL25XTWRS?=
 =?utf-8?B?aGhQVzRRUGpjcGZSRys4aE82Y1ZVQWt2cmNBVm9SNmlnVTloTnp6U3pDUFd4?=
 =?utf-8?B?TDcrTDhwRlNIQ1Rqc1M4VHRSRFJkSC93ejNYVTZUSUVKbWpxR3RsbGZzRExy?=
 =?utf-8?B?TFpRYlJFT0NLdllvWVFRaDJiVWtUdTlBdnJSWWtydER2R0gya1ErUE5LMGls?=
 =?utf-8?B?dEZxN2ZuSm12cGVmay82Mk1RdzNlUjkrZWl3TGY3dGZNdTNqODY5U3A5ajRa?=
 =?utf-8?Q?6gNRasdwGZ9ZgLDE=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a37c734-73a3-4a27-604d-08df0e5b088c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR06MB7907.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 10:13:45.8830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9WLhrgrIaf0p/SRCQpmPF9fEXfZNTSZRMXPDjZsvD0DB9mDHi9va1Uzd9T0s0OQcxkQuiwGasBLUX6eaJSVAMZ9LSee4dCHlyC47ZN8kZyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9209

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

