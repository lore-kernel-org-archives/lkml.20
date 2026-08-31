Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013050.outbound.protection.outlook.com [52.101.83.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C023FCC;
	Mon, 31 Aug 2026 18:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788202233; cv=fail; b=TTZJrRSyRRJlhSuGAR/c45LUf0Z/jA1RON3hLw4++8gaEqZiGAp7LbJS4pWNAgzk8AiyDq6ZzxRsQVXjyCGnTPfG4j5E7rVSlzCrf/PRUQdTFB7Nll369mZZ8yuhB0x80TXEzbRXGkjFjoKRsbGiWAvoUy7zi33uTmZMu4micuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788202233; c=relaxed/simple;
	bh=UMGyupXZhrJUPYblw972RlKnhmcU9QkC2i9h5JP9wxc=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=dv8KBqzplshDuL97yr5SJqHKh53JF/5ysCwhhAWoGim7ymvyLsBuzdaJCl2hvS99glz2F8rIfKeQ6IMNP9v7M5bJwLIGjx390Lpeecs8GF7M/RLggrr8sQAkwaqpXHUbAGTWc7M7XW7dQCPvuE6o/b0q1wTGtEnInUO22cc00RA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BpUzDct6; arc=fail smtp.client-ip=52.101.83.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BpUzDct6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBpzFHgNVImb73SzgTRoHREhMqClZX50UeMLw/SO0+FIZDpopIbYF/iCfIcghs6Ybt7qJd9XHveMDzHz/KnflKab45/K38q42xhXJunJMkQ1G9fDSmgXs7EmTAh6EHeVF6tkP2WYRkkYptoz54mJDchX8VhSOlMdqkICMcF2N/bmEx6QHGUO77rg6BPbjllft+UdsdiXYX+iCVFcAmKbU8Gvvl8ex2o+JQljnsBqxazLgI4No72I1venIhiRMGKwQV0kf0FV7EM0nmoEilzx4wdvgAck3naHoEpk5ykdeBnWhqfuWCs4Ibpx/1VWiPCpvRpjeH1Dt1Bz0mVMLIlLEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4Ep9i8Ldgf8jpgmk53udc4Ihahy/ounBUtCaWkpl7g=;
 b=JwRnlm8rNK7eTC25r+Dv27h6gAsMJevhmJXI+ALnNDdvHrogOJmQGXRuZM+kgalYFtWkHmTBU2/q+IENgj+NkCQe8IZTlC2M5e0XFPbL9y58D2HKgmRnS6WEdpGZbOh40a+N9eV/USW2wt+I2vZg9npRQ1+O0QyGq/6xXmdSme+KvO2L/oFgI42NZRYyX0ghRiAuYp4BsUYSnRhT/DVEYmoGarVrXnNB/q8RPQHOCMKRLzvUvlaGk5jCCYBhiYgqe7x0Cg0z7d8shMuPOWMrLaZ1KRUzs1hYjmWbehkHhF+rTEx8LBD27pKj3NYTr8zTBanVvagLdZqUroUp/dipdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4Ep9i8Ldgf8jpgmk53udc4Ihahy/ounBUtCaWkpl7g=;
 b=BpUzDct6S7CX/ku8ei1L7Z0CVEg++VP0pP6I/m9UUnl1X/c8ggkjhbsX6S0u0DISuT8C4lwKKthyzo203FtsKM2HhFtsq5qyepD7IvyEpp5PqlV7WDus899nenbrVlysLGboj9np3lFIs58FcZDV12eaiqqhAkcPRMS05g9OxF3m3Eo++GPyde2nquJt24SmmLM9Cf+VtrgZErlsyGV9D00KYmKpfCJ7gc0zzMNVfozIlxI6MmoWZVyaJNJzP52EK62iY6J0A0D0cJeiFqFsGn67dKdyayoKz9Dl2kdmdbUgYIYiF7dXVwzaC3umIcdFbJf6FvavlbwzEMNmgju6ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB10198.eurprd04.prod.outlook.com (2603:10a6:150:1a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 18:50:26 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 18:50:26 +0000
From: Frank.Li@oss.nxp.com
Subject: [PATCH v2 0/3] ARM: dts: imx: cleanup st,stmpe touch screen
 related CHECK_DTB warings
Date: Mon, 31 Aug 2026 14:50:17 -0400
Message-Id: <20260831-dts-stmpe-v2-0-f93d5f080443@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOnMlWoC/22NSw6DIBQAr2LeujRgA2pX3qNxAfKsNPETHjU2h
 rsX7LbLSSYzBxB6hwT34gCPmyO3zAnKSwH9qOcnMmcTQ8lLxSteMxuIUZhWZE0tm0orNWgjIPm
 rx8HtZ+vR/Zje5oV9yIFsjI7C4j/nbBPZ+9fdBONMDFJYIY25ybqd9/XaLxN0McYvOO40MbIAA
 AA=
X-Change-ID: 20260708-dts-stmpe-98597a66fab1
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linusw@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788202221; l=1044;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=UMGyupXZhrJUPYblw972RlKnhmcU9QkC2i9h5JP9wxc=;
 b=0BKH+IjatQYBSHnnVdfBPOw3yWu8eOehZBbzgHpK0w+A/sKgR04qlwkOfPB+1uwmRRGi6IvSS
 +ypM7d5z0mICXfUfsTWQe6hK6z9tgzmiL1YnGNid3iKfNdE+mNGPmXU
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8P220CA0031.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB10198:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f627132-b8f3-412e-7fc3-08df0790b88b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|23010399003|1800799024|366016|11063799006|921020|6133799003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	jGucaW546IsDJWC4yOogHOPxg1gQ4C8EkV/8Z5Ud2oKHD0C3AfzDH4qrsK+334nzKE3JkRo0aE5fr9P/Y1s4ZH42lzWh3EWDw4ZDRvXz0jBDy7X/Dqh99gXzatG++UHhEMbaZxWfpEsKZEpMoHlKUSmoKQFYyBIWq/t+16wczZXABPAcTcUXMjDz6NlM4u3m5rrxXBN0+ex2KucXt15qckzsKIUx4Vl82fFxOzdRhgpnD+MLz846wUXm1E9aql+oNDaCLkvB1jRy8+yhE6aDHtRd/vFMCRiqH5D+r8qBf7/1Ztrt0wels+2yH4S5YnL3XSwqU5daaZGOB2s1IzVwNp4MVNGekzsLd5keOFTTbVeGvflh+O9q2FukruBafBJTlWez7Rn3EVX1lmV+Mym9xVQleYvYCocSYe5IPkYlaF2fAstrBTcaKeBvIcd8XBElMGztdP35uIX6KMNjfb1eMzuf0jmNqqKJVPAhlgLSUKd1HTFqyRlglTrforp800lBa/C/Q3aoomSpUi/cyiY8tDyP9N8leEoIjI0MGZao0qi9ikd4jgIKJffIJNnUuS4mtDso8lGNvNLqV0OyWlrJPOkySid8KvurJP8MUlaq8VWeRQOirf17V8ZZUELkhXlzcEKaIapuoOFYgH5DNJaJqm58Np/EusVpedOs/p39Qys=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(23010399003)(1800799024)(366016)(11063799006)(921020)(6133799003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEUrUGx0R2czZllVLy9ENUEzRGozeThEZVlZSVhPdnltYWgvYTlNZkFGL3o5?=
 =?utf-8?B?azBETmhZM2tkVUt3M2hrYkJQMWQrQWFJNnRYQmVFakxKd3dUTzFzOHhOZWtD?=
 =?utf-8?B?OWZQT0t1UzRvMGFSa1NHMFFrdHNLRWpRZ3JpZkNxQnBoRHRBcnpyUmNsZmMr?=
 =?utf-8?B?NnMzL1BMcFZqOFY1V1Y1aWVSVjl2Y3N1Q2RqQ3p4MkZPdjZ0a09mV240NUJV?=
 =?utf-8?B?ZlpkcFJJbUk5eGVvMWM4UnJTWkt3K1IyZmtMTVljbFd0bHlXeW94Q0FIZnlr?=
 =?utf-8?B?SGFqNzJIS2c0SURlZ3lBbE9YMjNmUEQxek9oQUNGK1VUTzl0RzVGMjBHR1pP?=
 =?utf-8?B?TmtLcW5tNzM2TmU1czJZNlRMM1o5ODBKNVBEOGlKZFF0WENyQ0ZGcXNkeWdQ?=
 =?utf-8?B?RGx6NDUzL092cStBdUlYcUkzSVdQbFVZalJURFdXSUxKR3lOcGhBbkxZa2lv?=
 =?utf-8?B?dFEwcmZKT1o5YXJJVHFzdnphWlZydFI1Q2g2YVFDeCtpK1JwWExKc0RFcnlz?=
 =?utf-8?B?T0pHam1Zbm5zRmxMY0wycDN6di95VE8rc0RhOERKTnRub2dVWTR3MjhJL3lk?=
 =?utf-8?B?dGtHeFR0YVVycEtIUk5DbHNTWWt0b0p0WUltZCtOa1dGVE1LY1lhdGVwb1hy?=
 =?utf-8?B?bU4zelhEVTVnS2gzR01ROEVqNFhKUmxpcENETFNTeTEvWnJWL3ArUUk0YzBT?=
 =?utf-8?B?d0gwcExkcm5pdmVmaUdlQndUK3lvdGh6YWRxeTRsa0lTazZjTy9VcE81dGly?=
 =?utf-8?B?ZlBJQUVHU3kxYUV4ZnJQSFIyRU1JS3VTRSsvQ1I5VEJ6Z1dheTI5UjVoUWZL?=
 =?utf-8?B?a05XMURUbnZnMExpVkw0dG1nWFlGdStJaUJOS2M1c3pIQVJNRXpsVXFHaTlE?=
 =?utf-8?B?NGoxekhCU25ILzE0YzZJSUlwMFczTm9hTjhQNWpseW9oRklad2RNY2ZxUHh4?=
 =?utf-8?B?WnFCb2t6ekd3ZWRHaFRKdFV4UWJDUGpzcWRnL2loY2Ztbm5jRit5c3VPT1dD?=
 =?utf-8?B?dncza3o3OTkyRjFsNjJtSHVhai9xMlU2ZHpGNHl4NGFJZHlKMXI4MlYzTm9C?=
 =?utf-8?B?YzlkUiswYkZ1VGR6aWdpbjhtdHVlSnUwNXBCblJlMEpRR25uWTZ6OGF0U3c2?=
 =?utf-8?B?TGZDajBhZGZ2S3MxZTRZZ2szbzhuSW4zV3VwVXJDejE4cXloTjRpcVo2ZTBM?=
 =?utf-8?B?RzBtNDRub0svQ0VidkFKMkFVcGdibGJ1eWUwL3JqSkpjc1U2OVNpdUxqNWk2?=
 =?utf-8?B?SDZtU2l6cHNVbzdyNDZGQkdZWDZRSmxzTzNrOXZPNENQVlhkWU5HTzlnOE1P?=
 =?utf-8?B?SWpSZ2NpaXNEeXhuT0gvR3N1aWRSbkhRMFQvTXBoVDlPcUJjR3BhWkF5Y0VV?=
 =?utf-8?B?SzJsRUFBQW95c1N1cklzMGZnV3FlWWhadWFDeGNzcVJRQk8yck52ZDZIWjZq?=
 =?utf-8?B?WEFYb254QVZwTkxaa2RRejVOT1pvdlgybUtxS1FnVHJYcmxGNmVwNlhyaG00?=
 =?utf-8?B?bk1EVzFTb1EzaTN2RS93WDJ1ZlMzUGV6YU85WklaWnFOZFdNajFpRHFPT1pL?=
 =?utf-8?B?NElFanZlaG41R0Z6alAxUjNKMkg2aU54UHQ3bkpyb0dEdkQvalY3b0I4Mk0w?=
 =?utf-8?B?akxOV2plLzJ0ZGM3SEw5bHJRY3NVZGxDMG1JS3NpdGpHR1I0SU5OWk9MRGdU?=
 =?utf-8?B?SjBKNlF2dVFGaEZoR0FEL1hZdCtLUXRpa0dpWXBFTUJzcGdYVStBWWpJOEVi?=
 =?utf-8?B?b0lLMXNDZ29xUDgyZEZ1US9sYnY1ZVc4eTRjRUdYZU9XVkZXYlhqd1o2Um9G?=
 =?utf-8?B?dTgreERMNzJGejVvVURuVDV4SWUvbk1KVzduZ0o5blFaS2VYMW44eTRodkpy?=
 =?utf-8?B?ODByL3hDNm5ycFVqQmxKTFZLUTVyMXZPYkpNWFlYWEp4YmRMckpvU3ZOOHN0?=
 =?utf-8?B?dHpKSVFkOGRjNndVVkxXYlE0SWx3SXhjM0ZEZU1FSlVCTU4zL20wUmJYZERC?=
 =?utf-8?B?aTFoZFZjUml3b3BoWk5rTnNmVjJHbzJndUlmOC9GU3Vxa2NEelpRWE9jQktL?=
 =?utf-8?B?Z0tqT3FEbUZ3cGdBeXBndVB5dVhnNTJWNkxUcmxVbnhjbnVjWjd3YWY2eTd4?=
 =?utf-8?B?VTFMaFF6UFdRSU9la1ZoYUMrdVRFWkZBTStPNVFnclBjRUlML050dG5XODgx?=
 =?utf-8?B?T1ZwU29uU0NTcFF5THM3bGI1ei9YSjVwM2I5V3ZwWWlta21Lemo1cjM0bDY3?=
 =?utf-8?B?NzVWb0NpUi9PdlF4MHE2aExzTysyVjZvemQrNmZPc1AxZ2FkWFZZb3FQZzAx?=
 =?utf-8?B?dDNNc2xXTStKMzh0d0M3YWMyUk1mVktSamxuWlJlaXRMSVZUNkVVUmIvUmZJ?=
 =?utf-8?Q?do1uiaQzSubu0LAwAsjl5PU4uD4GFH2+2RCv9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f627132-b8f3-412e-7fc3-08df0790b88b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 18:50:26.4229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zyely7xBOOJ0/A/05KrBLZgq184/W3K/y32i0Q7fNeRgGYo2II/R1TK+lzHDy1DEWQdjGPw16FGMMp/71AxnRD8LQhYI2dIUUuTRFA13y07jM78Tl9bOLHMGgT8YY9yu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10198

cleanup st,stmpe touch screen related CHECK_DTB warings.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- rebase to v7.3-rc1
- collect review-by tags
- move more irq-trigger in dts
- Link to v1: https://patch.msgid.link/20260708-dts-stmpe-v1-0-1f51d15bb358@nxp.com

---
Frank Li (3):
      dt-bindings: mfd: st,stmpe: add deprecated properties
      dt-bindings: mfd: st,stmpe: let interrupt property optional
      ARM: dts: imx: remove undocument properties of st,stmpe*

 .../devicetree/bindings/mfd/st,stmpe.yaml          | 25 +++++++++++++++++++++-
 arch/arm/boot/dts/nxp/imx/imx53-m53.dtsi           |  3 ---
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dts         |  3 ---
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi      |  3 ---
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi     |  3 ---
 5 files changed, 24 insertions(+), 13 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260708-dts-stmpe-98597a66fab1

Best regards,
--  
Frank Li <Frank.Li@nxp.com>

