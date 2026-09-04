Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011018.outbound.protection.outlook.com [52.101.70.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B161438FE6;
	Fri,  4 Sep 2026 09:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513703; cv=fail; b=XKCMs47Ywp1soL5L/SbToHru3glQH/gezLDHHp9aby8ucNamLwgBmLIJKe0SEiYpfk3oJrLXfvyeuYPIePpzhzIqElIjAygGzXkYi1kjwR8sJNkGoRdYO9MfLXSJEEsHguxHBailwFidO+fo4o8zrrOR/gEyqPvdE1w45zq6bzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513703; c=relaxed/simple;
	bh=/m8oXPbNvhlQFtkGuaFz3sjPlTmT8rQp3A2k1x0A2Xw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=nuSngZm4BcgUpM4Hg0YmBfPX+HC39VG6c1Q19JLgHuUVuoaWysK04Np7uDyt0MMucHrY1QQGiF7XqeOQhTW4y42BPZYyHefI1tb1Ki/bZ7c5TLP1pskHzVM+rDbVy2RWjFERohzLWUDrF+v7/QaZnY/7AiW259N8dD8XAn50J/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=j/tMPuAs; arc=fail smtp.client-ip=52.101.70.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="j/tMPuAs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ix4AYFICARuTSn/yLINFkFyrISXJy/PwujlbGXQgQYTAKzaOFfKimVc0mWwzVb1300hqPYozfaJ+vDFXlVk/HPzpJUjR9l5cUy8ynh4jsNQbPmQ9Y40GHcQMYLoo/ehqV56IvpKSVx6KrX9WezlYZQuk1JFxRAU81zYkO/L8G15vLmoz4VVhT+e5HjbRu7jUJAcYu7SpnEBk3S2wsCz2zMvr3WT1Y5g6DQJcv2cL3XqkEdlWmkQzLe7jZjH+lf1OlX4cZwOm3D2fGI+uTLimJxMjtvuYVGEaJ0PBQ/tK4tNBxq2gJJWP3EZ2Kki0IJ5yrCXwbMrUJZ+4FoRUwhDtDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=er8mkpSGysTU2AnOCiPtxLRaraSl7B9NqJnF92yeKFk=;
 b=jElB4WbC8gnLiNGrRD8YEMv8JSU+bhpKq1EkOuc04e8A+Apm2HLq5N7XsHs8of9ahZa8k4G25945X7IjjqEW5YYt2E+imtD9qw7aOvupnYm4pemijfba+QAsrUrSXq8rR13FkCry84V4VZgplq8yBBYpyIx5PdEy+IAmRRM/nnu8g4z5cVz+We7uY5UqgTRo38KjX08b5STHb+2RQmIEAssl0Lc/xDMYgfJXHTp6gEssGx6fMMyVFYbONbKUTZn6GVy97gX9K5xH09WLQkXd6ZeRl65zgDO3B9Y6sDbwjMJEZda/6wH4sZW5jZcv5QHiur3Epy87UKEJAZs0xMvjTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=er8mkpSGysTU2AnOCiPtxLRaraSl7B9NqJnF92yeKFk=;
 b=j/tMPuAsnKbQPJhLDjiM9niTxM3ing7ROqeZbghCYCjtAoKvEflzxKprn0JQ+pfnYvEODVWekCgqWCgA001AlWpkqagh1wKCsEuZB13K3HDwQVGhyPhoToh7BP6h27ltTaLw58pnMD8uG/tO0h01yUxdGJuwx2OHAjnv78NQbqwsbNoXkZRcEVZ0T9KSJGE73A/s9riv+c4Z/L/xuVaHGqIVY78/pchiKRXGLUvkCkbVOA9n+38HkRufeg+tPjmcUbSRAGK2c08d19/nHJ1DZxz4NmXMInPQ5ek74LmFX3HYoRPM5ZsIq88JR5eqQ+XyTjshEn4ApM60Zncgur/MHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AS8PR04MB8197.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 09:21:33 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 09:21:32 +0000
From: pankaj.gupta@oss.nxp.com
Date: Fri, 04 Sep 2026 20:21:19 +0530
Subject: [PATCH v48 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-imx-se-if-v48-1-dad90eec7eaf@nxp.com>
References: <20260904-imx-se-if-v48-0-dad90eec7eaf@nxp.com>
In-Reply-To: <20260904-imx-se-if-v48-0-dad90eec7eaf@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788533484; l=14442;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=GR+UpWiKN6vQ/fD+2am73nCHpHQoukDXxfoTE0YlRxg=;
 b=KxkFZtXAkgEWO8l7E7RXY+PpBA00gSfYawDgP5fFuXqVJ6INFSmhCkqx4iWWFVYlHPKPrIUim
 FyuRn56WUWTD0UfMU9BO83/ApJ14ziYZVu4kPKNf+qdgBLMRdjKCc4S
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: MA5PR01CA0176.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::16) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AS8PR04MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: 37ad1ec3-8d10-47f8-2200-08df0a65e901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|19092799006|6133799003|18002099003|22082099003|3023799007|56012099006|10067099003|921020|11063799006;
X-Microsoft-Antispam-Message-Info:
	TNxULYWKob6XkmUAWmtuO9FgL2zcaLaBHK4S3iv4V1FDadKca/YIlasy5h9pthGFyVzaqRfMbo2J17BQAE9SCjEoGjG0wxZihgnThqkLzlm/yUrjC2PYM5L6uhDwAIAe53OQ1aq3SCVzy9BSNMAfZ9C7VA9paZpgxOg+v2iKDMBo+PNC1MjJ0WYyVrgeSf+akEeUwj97W2+O0xlTlHOdNYl8rWBdkU2qaEKHLN00WF6W/M0oq1NWtmmYsjVCoO0pqEKmIfFUqMga7CTlhWnYUaFFolCW3lACUhFMbfXmLTZVR8eWF4jq8Q1QOO3bzmoHgszjRBXKkWGoIhuK7tlFNY9mtW4B2nDH+hLw3ZPWbhD9qf3tO0YXPSmxjTuFzetR3Ll2GlP8EkRqaGWfasu+kwkhYtZyP0v3xNBorP8sdTMHttdcyJ4d1AABK9+sbDbMestTkt22bTxQVL5oAv4Zg+qIujuJcAWBPfblnvDGMCe7Jv2/1yZ1mRcZQIix8pgFdZp33Mr0MwgDMWLqg4+VIZAypAYVJkJ5I2g/cl4tBAI12T0K6IstjWCDDvQQo1cV8cf5gg9+MVUKkOh30BXwlaoNw/2Z0abcHxo52uNFUKG7oW2BDToCWjM0E6U914nYnyOf+P28cxhaKuKsyjJUM6k8XVMkvMB7ndqd1VjyGtTKJ6HWrugvVX05db0pH2x1UP2g3Zz2nbgCcr0cts8CxA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(19092799006)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(10067099003)(921020)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWNoeWhaYW1nTlRUVkh3cG1JTW5CYk5GazR3bnl5RVVramk5QkZGc1Q3UFBa?=
 =?utf-8?B?NkNwbGwxYTZtNVlsWFd2aGQxWUIwcTdtdnRIY0JJK245ZExha3NCTjB6VVhW?=
 =?utf-8?B?ZGVjNGl0SjkvVEtYM2RMRW53YmF1Qjk2NXRRKzFSdmIyY2haNVBoZGNtVnhU?=
 =?utf-8?B?a0NRWEkxc2tGMk5ZSXlMR3U1UW9JOWtnbjJ0YStDeUFvWk1rTTVQbzVoL05X?=
 =?utf-8?B?Rk1HZzhSK2s2ekNJbEMwa1RkRy9Vb0dJZUNqd0FaYmZzTnB1QXIrcDgrRmpB?=
 =?utf-8?B?bk9ZbVNxNHZLUDQzcE9kd3VxYnc4enhXNUdFQmFsWWRlelVRMERWVnFrdVNi?=
 =?utf-8?B?L2hmVXhoeDdyWTJERWM2MlRuT1dqQ1ZpVVMvcVEvTkJGU3NnTzNGalRQNXJG?=
 =?utf-8?B?ZEJjYWhBdDcrWS83Z2ZGTXlaZjVFdzgwOXJ6dkpObFBYY25KVFRSUHpXS3RG?=
 =?utf-8?B?cFZkK2ZYSGVxS0xVODRtL3RiaEFzaVphNTlwZFZpVCtHdVRKN0dwbFRCclhm?=
 =?utf-8?B?YXVpYWlRVDFpY29NRU8yNHNTcDBDY3grS3VoMWdDTlltYk5GR21uWXVISE5y?=
 =?utf-8?B?RCtNaGpBeDgwSEtBa0hPeThjZTgxc25WZXNEZUR0S0pGK3J0N3hQRnBjSlAy?=
 =?utf-8?B?RndCRnVHZlQyc3pkMnBud1VlVGFZcFBHWVJoZEV4MFp6V3VkWXdDS1JXYmlK?=
 =?utf-8?B?aVNXdkFXdVE4bjEzbEF0MU1OVGNTc1NYVExsTnhiaFl3WEpEZDRycGtnWGxx?=
 =?utf-8?B?WWlHdTdSejNoZVppcWJ1ZSs2Z3FWN255bHp5dVY2dlRWZVYrMThOeWpmYTdE?=
 =?utf-8?B?UzRUWGswUUxUUFBTVWYzMGVOUWF6RkJ5YlpzK1laRFRMbU1PK1NmSm5IcTlv?=
 =?utf-8?B?Y01jenZwYkRkSFR0eUFFanpabkJDZEFJM2R6L1NpbjJXN2czUU5CSERtamZi?=
 =?utf-8?B?ZFVNK0ZNTDJwd1p6ajgzSXZSK2QrK0tzZlJBLy9UenBRbmltZmIzS1BOQ0xN?=
 =?utf-8?B?ZW9nWS85TGRhRGgzR0VQanZwRGlYeGhIcHE1SFJ2ZjRKaU00YmFmRGxrRTJw?=
 =?utf-8?B?U050dWNPRGJDa1Y3cHBVOGFFN1YwdUJaakVwSlVPSVBxZE1Ec0xNYlY3b0RG?=
 =?utf-8?B?UlAxNGtrbTAzRFNYbnIvcEwxTDVVLzRGbC9Edm5RVTJGZW1VanAzc2s0Q01i?=
 =?utf-8?B?WEtRUWNKaGM1UEI5U1JJTzkrVW1nMiswSTRsemtXL2F5aDdnZjJjcDRCZHNK?=
 =?utf-8?B?ZFBwSnk0bktlQzR6QzVBSnJ5eFEzYWxJRFNiN0lhclNlY01URjRZVlhLK2Zu?=
 =?utf-8?B?TmVNWC9Fa0lCYTllL0pGWEkvWWlqSDc4QVVkajMxL2MvWHVOK3EyZFRJSXB0?=
 =?utf-8?B?QzgwbzlWclFhZTNjU3RFRzlCK0tGdkJwemVmWDl0bUZQZzJ0dUFRRE5lcmV5?=
 =?utf-8?B?SUVqRnBpQy80R0hWdTlGTkxXVUZDSHAxSUQveWtkQVJpZGIyQ3RUZDFiMlBH?=
 =?utf-8?B?WEpzY25KUHpKenhLREM4RU5tNkZYY1J6Zk5COWtad0xPYmtVbVVVWEhqVUNO?=
 =?utf-8?B?YitNVytieTdFWUh1YVNaZFdJN0laOHRzc2cwcGEvR1dQUXBIakNzcHRla3Bm?=
 =?utf-8?B?bmgxRjIwQlgvbWt1b3hqWS9aMTRheW9tS1kySjdVeTJ4empRWWJDaW9tdmVY?=
 =?utf-8?B?emNpeDhWSnpGMmd4U3VRVWNlWHl1UFZONHA3dFFYdWNYRXRaRXJaWk1wZGFx?=
 =?utf-8?B?RHNYZUIxWnRmQ0p4MkkvbDFMZGdDV0dBY0Evd2p3SFR4ZG80eENIaENqcWlm?=
 =?utf-8?B?MEhHRDBiS29KS1NkcWpDVUdmYXp0YzR2YU5ZWi9lWVo5WWFWcFhtRk5EUEV4?=
 =?utf-8?B?ZG9lVU1lWmJKM05rWnNacjhtNWk0cE56dlB3SEJoUyt5eUZtQUY0ODJFeHls?=
 =?utf-8?B?WmRIR1p5b29pV3NzZzFNTjRiK09SWVhOQWtIK1QzWGZqNjZ6SFNxZndLL2ZI?=
 =?utf-8?B?WkxWay9vOGpycmt2Wnlvc0VwZ1NKQXU5bERvMVdLbXZtR0NrVXpPUnFJNzBD?=
 =?utf-8?B?TmE2RUw5STJ4NzhnbW1TdktMdzAreW5rTlp5YUhJUm1kYVBnaVo5Ym5KcXY1?=
 =?utf-8?B?R2lFZ2hLNVNra1RFS3A1c20wd2lWRGpicVpDNTE2bVVkRk5YMkdhQXY1L0d3?=
 =?utf-8?B?YnNBMnN5RkZRa1pHWEIyMDE3aXNocTY1MVJHQlFEUGFVSk1md3lCais2UHRE?=
 =?utf-8?B?d1VrVFF1ZUFONlJvYUFSU1dLUGhhUVR3aTk0Si9vNy92Qk1yWEFwcjUrUDV5?=
 =?utf-8?B?bW5xcGNvamtTU0NneUtBYTcxN01DaDZFaDl3cU1VQmVyb1hVRHpyaUJKb25G?=
 =?utf-8?Q?J5GIdvR+WmDXVpyDXNhz2FRGDikTGskGkvjq4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ad1ec3-8d10-47f8-2200-08df0a65e901
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 09:21:32.9423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NbSHRQPzx5LYQYyg0UX/Jvep+eaOYkY9hgZDmCtDGDw0m/anVcRAQhZEX2OkqpISz1bE6OXu7fybe+gLP0mL+AeDxYgo3/9ecQo/8fa5Lcx/gRIMnonbVdiYMhTmX5Aw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8197

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
- NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
----
Changes from v46 to v47:

- ELE_STORAGE_OPEN_REQ concurrency and command-receiver exclusivity:
  Explains the three-layer protection used to serialise concurrent
  ELE_STORAGE_OPEN_REQ ioctls: (1) an advisory early check under
  modify_lock capturing both receiver_exists and is_cmd_receiver in a
  single critical section; (2) se_if_cmd_lock serialising the full
  send+receive cycle; (3) set_dev_ctx_as_command_receiver() re-checking
  under modify_lock after the response arrives. An ASCII sequence diagram
  shows how a racing second caller is rejected by firmware before any
  storage handle is allocated.

- Signal handling after a completed hardware operation:
  Explains what happens when a signal arrives after firmware has already
  executed a command and written its response into the MU receive buffer.
  The driver validates the response, calls fw_api_specific_ops() with
  is_cmd_interrupted=true (which closes the firmware-allocated handle via
  se_close_session()/se_close_storage() and clears the kernel-side
  handle), then returns -EINTR instead of -ERESTARTSYS. Returning -EINTR
  prevents the VFS from transparently restarting the ioctl with
  already-zeroed input buffers and lets userspace enter its signal handler
  to decide whether to reissue the command. An ASCII sequence diagram
  illustrates the timing.
---
 .../driver-api/firmware/other_interfaces.rst       | 238 +++++++++++++++++++++
 1 file changed, 238 insertions(+)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index 06ac89adaafb..984ee3ecc8dc 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -49,3 +49,241 @@ of the requests on to a secure monitor (EL3).
 
 .. kernel-doc:: drivers/firmware/stratix10-svc.c
    :export:
+
+NXP Secure Enclave Firmware Interface
+--------------------------------------
+
+Introduction
+~~~~~~~~~~~~
+NXP i.MX hardware IPs such as EdgeLock Enclave (ELE) and V2X create an
+embedded secure enclave within the SoC boundary to enable features like:
+
+- Hardware Security Module (HSM)
+- Security Hardware Extension (SHE)
+- Vehicular to Anything (V2X)
+
+Each of the above features is enabled through a dedicated NXP hardware IP
+on the SoC. A single SoC may contain more than one such hardware IP, that
+is, more than one secure enclave can coexist.
+
+NXP SoCs with such secure enclave (SE) IPs are:
+i.MX93, i.MX8ULP
+
+To communicate with one or more coexisting SEs on the SoC, there are
+dedicated messaging units (MU) per SE. Each coexisting SE can have one or
+more exclusive MUs dedicated to itself. No MU is shared between two SEs.
+MU communication is realized using the mailbox driver. Each secure enclave
+can serve multiple clients by virtue of these exclusive MUs, and can
+distinguish transactions from different clients based on the MU used and
+the core security state. The communication between clients and secure
+enclaves uses a command/response mechanism. Each client can expose a
+specific set of secure enclave features to higher layers, based on the
+commands it supports. For example, a secure enclave can simultaneously
+serve an OP-TEE TA and a Linux middleware client. Each client exposes a
+specific set of secure enclave features based on its supported command set.
+
+NXP Secure Enclave (SE) Interface
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+MUs are not shared between SEs. For an SoC like i.MX95, which has multiple
+SEs such as HSM, V2X-HSM, and V2X-SHE, all SEs and their ``se-if``
+interfaces dedicated to a particular SE are enumerated and provisioned
+using the single compatible node ``fsl,imx95-se``.
+
+Each ``se-if`` comprises two layers:
+
+- (C_DEV Layer) User-space software-access interface.
+- (Service Layer) OS-level software-access interface.
+
+::
+
+   +--------------------------------------------+
+   |            Character Device(C_DEV)         |
+   |                                            |
+   |   +---------+ +---------+     +---------+  |
+   |   | misc #1 | | misc #2 | ... | misc #n |  |
+   |   |  dev    | |  dev    |     | dev     |  |
+   |   +---------+ +---------+     +---------+  |
+   |        +-------------------------+         |
+   |        |   Misc. Dev Sync Logic  |         |
+   |        +-------------------------+         |
+   |                                            |
+   +--------------------------------------------+
+
+::
+
+   +--------------------------------------------+
+   |               Service Layer                |
+   |                                            |
+   |      +-----------------------------+       |
+   |      | Message Serialization Logic |       |
+   |      +-----------------------------+       |
+   |          +---------------+                 |
+   |          |  imx-mailbox  |                 |
+   |          |   mailbox.c   |                 |
+   |          +---------------+                 |
+   |                                            |
+   +--------------------------------------------+
+
+- service layer:
+  This layer ensures the communication protocol defined for interaction
+  with firmware.
+
+  The firmware communication protocol provides two guarantees:
+
+  - Serializing the messages to be sent over an MU.
+  - Firmware can handle one command message at a time.
+
+- c_dev:
+  This layer offers character device contexts, created as
+  ``/dev/<se>_mux_chx``. Using multiple device contexts multiplexed over
+  a single MU, userspace applications can use file operations (fops) such
+  as ``write`` and ``read`` to send a command message and read back the
+  response to/from firmware. These fops use the service layer API to
+  communicate with firmware.
+
+  Misc-device (``/dev/<se>_mux_chn``) synchronization protocol::
+
+                                Non-Secure               +   Secure
+                                                         |
+                                                         |
+                +-----------+      +-------------+       |
+                | se_ctrl.c +<---->+imx-mailbox.c|       |
+                |           |      |  mailbox.c  +<-->+------+    +------+
+                +-----+-----+      +-------------+    | MU X +<-->+ ELE |
+                      |                               +------+    +------+
+                      +----------------+                 |
+                      |                |                 |
+                      v                v                 |
+                  logical           logical              |
+                  receiver          waiter               |
+                     +                 +                 |
+                     |                 |                 |
+                     |                 |                 |
+                     |            +----+------+          |
+                     |            |           |          |
+                     |            |           |          |
+              device_ctx     device_ctx     device_ctx   |
+                                                         |
+                User 0        User 1       User Y        |
+                +------+      +------+     +------+      |
+                |misc.c|      |misc.c|     |misc.c|      |
+   kernel space +------+      +------+     +------+      |
+                                                         |
+   +---------------------------------------------------- |
+                    |             |           |          |
+   userspace   /dev/ele_muXch0    |           |          |
+                          /dev/ele_muXch1     |          |
+                                        /dev/ele_muXchY  |
+                                                         |
+
+When a user sends a command to the firmware, it registers its
+``device_ctx`` as a waiter of a response from firmware.
+
+The secure enclave firmware manages storage over a Linux filesystem.
+For this, ``c_dev`` provisions a dedicated device context called the
+command-receiver.
+
+
+ELE_STORAGE_OPEN_REQ concurrency and command-receiver exclusivity
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+A userspace-created ``dev_ctx`` becomes the storage subordinate to FW by
+being registered as the command-receiver via
+``set_dev_ctx_as_command_receiver()``. FW sends NVM callback commands to
+this ``dev_ctx`` via that priv's MU, on which the ``dev_ctx`` was created.
+Once a userspace ``dev_ctx`` on one priv is registered as the
+command-receiver, after opening the storage handle with FW, FW enforces a
+global one-storage-instance limit: a concurrent ELE_STORAGE_OPEN_REQ
+arriving over this or any other priv's MU is rejected by FW itself, before
+any storage handle is allocated. The driver uses three layers of
+protection; the sequence below shows how a concurrent race is handled
+safely::
+
+  Userspace A        Kernel (se_ctrl)          FW (ELE)        Userspace B
+      |                    |                      |                  |
+      |--ioctl(SEND_RCV)-->|                      |                  |
+      |            [advisory check under          |                  |
+      |             modify_lock: no receiver]     |                  |
+      |            [acquire se_if_cmd_lock]       |--ioctl(SEND_RCV)->
+      |                    |                      |  [advisory check  |
+      |                    |                      |   passes: TOCTOU] |
+      |                    |                      |  [blocks on       |
+      |                    |                      |   se_if_cmd_lock] |
+      |            ele_msg_send_rcv()             |                  |
+      |                    |--STORAGE_OPEN_REQ--->|                  |
+      |                    |<--STORAGE_OPEN_RSP---|                  |
+      |            fw_api_specific_ops():         |                  |
+      |            set_dev_ctx_as_command_receiver|                  |
+      |            [re-check under modify_lock]   |                  |
+      |            [release se_if_cmd_lock]       |                  |
+      |<--ioctl 0----------|                      |                  |
+      |                    |                      |  [B gets lock]   |
+      |                    |                      |--STORAGE_OPEN_REQ->
+      |                    |                      |  [FW rejects:    |
+      |                    |                      |   one storage    |
+      |                    |                      |   at a time]     |
+      |                    |                      |<--ERROR_RSP------|
+      |                    |  se_val_rsp_hdr_n_status: -EPERM        |
+      |                    |  fw_api_specific_ops not called         |
+      |                    |<--ioctl -EPERM-to B------------------->|
+
+The three protection layers are:
+
+1. Advisory early check (under modify_lock, before send): fast-path
+   rejection if a receiver is already registered. Not the final gate
+   because modify_lock is released before the MU send (TOCTOU window).
+
+2. ``se_if_cmd_lock``: held for the entire send+receive cycle, so only
+   one ioctl command is in flight on a given MU at a time.
+
+3. ``set_dev_ctx_as_command_receiver()`` re-checks under modify_lock
+   after the response arrives. If two callers race past layer 1, FW
+   itself rejects the second ELE_STORAGE_OPEN_REQ before any handle is
+   allocated.
+
+Signal handling after a completed hardware operation
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+A signal may arrive after the firmware has already executed the command
+and delivered its response into the MU receive buffer. The driver detects
+this case and preserves state before returning ``-EINTR``::
+
+  Userspace            Kernel (se_ctrl)          FW (ELE)
+      |                    |                      |
+      |--ioctl(SEND_RCV)-->|                      |
+      |            ele_msg_send_rcv()             |
+      |                    |--CMD_REQ------------>|
+      |  [signal arrives]  |                      | (FW executes,
+      |                    |                      |  allocates handle,
+      |                    |                      |  writes response)
+      |                    |<--CMD_RSP------------|
+      |  wait_for_completion_interruptible()      |
+      |  wakes: signal seen -> -ERESTARTSYS       |
+      |                    |                      |
+      |            [response is in rx_msg:        |
+      |             validate with                 |
+      |             se_val_rsp_hdr_n_status()]    |
+      |            [fw_api_specific_ops()         |
+      |             (is_cmd_interrupted=true):    |
+      |             for SESSION_OPEN: record      |
+      |             handle, close session via     |
+      |             se_close_session(), clear;    |
+      |             for STORAGE_OPEN: record      |
+      |             handle, close storage via     |
+      |             se_close_storage(), return 0] |
+      |            err = -EINTR                   |
+      |            (not -ERESTARTSYS:             |
+      |             prevents VFS auto-restart)    |
+      |<--ioctl -EINTR-----|                      |
+      |                    |                      |
+      | [signal handler runs; userspace decides   |
+      |  whether to re-issue; FW handle tracked   |
+      |  or cleaned up; no firmware resource leak]|
+
+Returning ``-EINTR`` instead of ``-ERESTARTSYS`` is intentional: the VFS
+would transparently restart an ioctl on ``-ERESTARTSYS``, re-running the
+command with already-zeroed shared input buffers. ``-EINTR`` lets userspace
+enter its signal handler and decide whether to reissue the command.
+
+.. kernel-doc:: drivers/firmware/imx/se_ctrl.c
+   :export:

-- 
2.43.0

