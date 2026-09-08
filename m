Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011019.outbound.protection.outlook.com [52.101.70.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06225328CB;
	Tue,  8 Sep 2026 11:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788868184; cv=fail; b=ple3yg/q0AJygnkBfAWbXtWESssqJEiMQTbeqqkvA9HoRUdyb4v5mVVRH9slZ4L876Uqb+CuEz1X9VckvPARP5U/ATbKXjYMiROfi9KqBO43kh5tZBMCWn3XIhrr8JiDgHlmq+TIFK1VFYVIUZbRTA0S3ybuRcnPH/N+2mKkb3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788868184; c=relaxed/simple;
	bh=/m8oXPbNvhlQFtkGuaFz3sjPlTmT8rQp3A2k1x0A2Xw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=cM9jR4C1awKlYomU6T9hKI7wa+B37OKcF7KMJvDU2tyykuefesvhxLr4jGyZvps9tmX3L+r7mGdAeD1Mm/8Trg9CEUM18HquO8d/O4u849TrkPF8X8Y9uGzs8kO3WMeod19tU2Ifv3M90/GVKcm0u51aQaoKBPvRQFUkzOZJrk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Tdg0Aum/; arc=fail smtp.client-ip=52.101.70.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Tdg0Aum/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdnR5br28MEsR19ycZROHK5/6cSeTBAMAeZBjV8ph8Wb9KQQymhFIgcMJc2kdKmPiq4vwGt/RgJrC+ZKBkGVY4ZHWZHJ4pv3FyVUjU555GgkUB4bQLWHqkCgv2Lyik+86vrJ1zRSXu0Fc6Sh3ASi1yOBB4+Qm0Z1wo5HiMxeF5Yk8yjqFwT8F7aMnUTSPfB1HaxjNOGCxvp5x2OI0HOECdiijeTZ8MLgJzlpujqYifw271XChBD5t0DCjbvq7b/ujhdRUbNdVYOKlNpWXeYDDRn86dXU5wx/LsRA5rHr8rwgerK6v6Z1mnHR0Raw01mpeNAPG77d9sdkge3gVGdfXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=er8mkpSGysTU2AnOCiPtxLRaraSl7B9NqJnF92yeKFk=;
 b=KNYHrWpGoAK9Cs9FYRmPYlX8QBEoPksUkP7Yf9D/cPig59dHq7UmJHDw7IIMe3RabqGeNemwlwB56X1OxfPskRd9BAfPXwfVF0J/sjv88BCGwc0gWSNH0LBh/DlOPM4nG6X/yQPbUPgLoxW5NlXqCruir5Vrfp1ZjT2KKsUY/2MIkadmT3ay+a1I0sMk7LspiXvhNJTbxfEtg2NAWA0NxYXqJc1spL4syAzyv+Nhgrz9gur5jirr5FD/EZB8HFQiZbdHloFUqd06XXuBjrbTv/4MnkJiqjOrngb7ptULNQGGE7wgAdFXjGEKO3YboG+miygpFVf+TKbz1ZX6ZANXFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=er8mkpSGysTU2AnOCiPtxLRaraSl7B9NqJnF92yeKFk=;
 b=Tdg0Aum/k4lMO4lPqLtye+idN1hJcG7xvP1Jm6N+hTULT8LxOhMriK9unOJEvdXC6VJT5c1g+ZLctJu4fKQ3jD7IwzmkOefN7g9lUBbZaK4SDm4gXO0JJkuC/vx0O//5r+nc2BxDUR0Me+NJ6ovcUEe1ok5nxuMkirJkYC6sEEFMLDbzIGLMNTML9BIe8VXnpeAOHTjsPKIR09xTD61vI+LCBG+mqyL4bEXwFrbDxmh1XTXfWOdiChyyORYvPMNrlOYddvsC4M+2gLeWTm73LuIATXejXVJ1jmtzNX68ba6MzmvHNdhiWMR6+nSdkqg4vFfxjjKmbjGuSNMjiZ8doA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by GVXPR04MB9780.eurprd04.prod.outlook.com (2603:10a6:150:114::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 11:48:57 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 11:48:57 +0000
From: pankaj.gupta@oss.nxp.com
Date: Tue, 08 Sep 2026 22:48:11 +0530
Subject: [PATCH v49 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-imx-se-if-v49-1-a59529118839@nxp.com>
References: <20260908-imx-se-if-v49-0-a59529118839@nxp.com>
In-Reply-To: <20260908-imx-se-if-v49-0-a59529118839@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788887921; l=14442;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=GR+UpWiKN6vQ/fD+2am73nCHpHQoukDXxfoTE0YlRxg=;
 b=RZ+5Y1/bNqsJQCCduJFUNbsNLJbiSx2y0vD+aEv6EaC961WhtSdzlz1gDJ9BtXz3LuhpP7aCb
 2PA8hMm0wPfCjSmhIRp0Cx4vdkh7yaLi+N7RCWO6D0bZ0zHDAtxczI9
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI3PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:295::18) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|GVXPR04MB9780:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dbc139c-2ddf-4549-e636-08df0d9f2a86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|7416014|366016|1800799024|376014|10067099003|6133799003|3023799007|18002099003|22082099003|56012099006|11063799006|921020;
X-Microsoft-Antispam-Message-Info:
	iuw750MALcaWsHo0//RWTlISSIFIyGsJHfcPTROcdo9wabCjd1Mnq2+EYcqFYVMi0mD2vOvu39XFlSeeoEItPx/34cXUqsyiFWQTclepFtjiD8NluZUXKuGC2K7OQbi240pyoajdgTEKFA9LGAb+8i3hI8S2Gy7gFpB7IhSvPhhUnWg/Kg834huUIyj3VyYf/AVQKVfNH8DvY2Let3YtfKZroZZQQlBGYIWS1K5bqcIiqG753FtlIR62hYxfN8WUZrXLAv7slf2NyqyFrIkgwW+AP8BxaguBrKZvmBhnrXCuUUv91l+whU+kWdOHIKO0Oy68CpszNeWqJ7Nh3m8uS9IGhiqSBI7y0Wld/bPTyeMJT0hFkam0L3AGHmjhDmVmpfUmXQ6ymGqceAsLpsEZF/wkVIPvyCAS4TcXLMRjbDFWbmci/4sVb6iA06ga7pyHv4zQwWaJb9j39xHs/LA4EoALlZQEAUeOzc+qaCb+aAv/2AfIiLUzyBKOubQaKe1pMCUZGHuB/4MNy8+7C63c05pGbO5l4gB0HPQ+kXVouI5byDEh6Q+47OvUHtIXlk4/9z1ssfv1vmZRyv4ZQaY/P5QD7zQe+qBiVii34b06LKiLMPKpngFJTw2IiNCERlOf77QMyuAXAClpnJOGKtHACYj1PZpgK/HpEz+t0UeewbkdgFM+tGsdWFOsuheUoXPbXIwvMVBJQPRF2dMgNdqyjg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(366016)(1800799024)(376014)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3hqamgrMlovTTJQdk9sUzhTTDJLeEJQejVES3Z2WTFOSWtJekNGZmRRaU1Q?=
 =?utf-8?B?Uy9rY3Y3eWtGcDVwSlBmTjRyWUxKT05OTjA3V2tUSHFZamZ2TW1TWlNvcHZD?=
 =?utf-8?B?SWJ2eDJGU1lRSTB3Uyt4aW1ZWEhhbmFqRGYxR2p5T0ZqZitFd1hpaHRiWlRi?=
 =?utf-8?B?dTZiRDJXUUUrUVhDZUhCWlZ3eGMyUjlyZXdrTWJHYzJRSkkvT0FveDgvZnVh?=
 =?utf-8?B?WlNGVlZocjgxbUJxcFBnOGFKdVNPLytzc1FlR3QyUWhJTWszc0JpdnlSK01K?=
 =?utf-8?B?Uk1ybEVwZ3dMU1JxNVJDdHUrbjFOanY0bEw4V0tqbDN6TzVPRW1EYjZFM0lC?=
 =?utf-8?B?UGpUL3k1cFVDOTcreEp2TTBNdkhmT20zMWU1cnM0OHlpZ3QzLzA1NlBOa0xX?=
 =?utf-8?B?d1M4TG1GdjEzWXc4dGRYcUZEakpmTUR3SjNhanRETzZEamZ2eVlLVUw4eE9j?=
 =?utf-8?B?NHd4b0xZSzk3QmVnWnpyZWFaaEJmbkNCQ08vQ1pXV0NtTGppMW5Ra1pDRVNS?=
 =?utf-8?B?YzZZUmRCeEY3L2xaaTluRFpjd3VBNVVtOUpsQmZwTWw4SWIxTy92SktIYnFo?=
 =?utf-8?B?UWVUc04zd3hvcUF5TGNQY2dUV2dOMUJIdFpEUy90Nkkrak1NR215MnF0NVhz?=
 =?utf-8?B?OHdVOUl2cGRWUzByZVVKb21FOC9LYXQrcXFnN3hMYlVtMmlVVGJLd05GRENo?=
 =?utf-8?B?MlArZ3RHMWIyV0U3OXlLam1xMno1V3dwTFUvRnpKNEpNYW9GZlB1MXdneTBv?=
 =?utf-8?B?MUsyY1NyRk9rcnRyZEpNVUU5bmU0Qm9zREZXSHpURHNYV2NPZCtKbkwzdEZ3?=
 =?utf-8?B?TXp1SlNWbzZkazgvUTVGL0JvSDVNdEhyeXF0eFRoS2hxdGJWQXFuaDMwcm1y?=
 =?utf-8?B?TDVxNHdheWwvdWpCUVVMcktPaXlhTHMwMXhtOW1xYlNsb2JXM2dGZFAxd3Av?=
 =?utf-8?B?SjdXSWV5ZUkyT1FSMEtqVWdCbW02dngyUHRIWkVyZ1VDNkd4Z2s2S2tHNENX?=
 =?utf-8?B?NjhYZUVmbEFFdEU2Y3kzY3p3Z0VKVmNsbTFlTWF0VWNtazR1UlZLOHliMXNU?=
 =?utf-8?B?S0pORHY2eC9TbVJwMTRzR05NcGtYRmdKMjFPakhwRHhZTkh2cHZLdTVrNFRt?=
 =?utf-8?B?aXJjRTRWK2VGSXV6aUpGcFExNmt5Y0RVTzF4ZC9Ba2sxVGFmM3ZHZDN1T3lZ?=
 =?utf-8?B?KzRqS0lYRG5DeUNlcWdOR1JCZ2RQeGU2b09vQTc5TWFwakFtb0Z3L0htbmhL?=
 =?utf-8?B?UENBaTlCcmpzb091MFdMcWlRdGEzWlJ5SjlEdUNuQUR6V28zdnBpM1VhMG5w?=
 =?utf-8?B?dUNheERLV29MSHFwa3NPbnd0azdzY0NydGdVOWVKU0Ivb1VyVjM0ZEFmYytr?=
 =?utf-8?B?RVlvYm93dkg0cVBhamlvNHVvZXY3VmFBSFE0d21JdWRVQy9pU0JWSUxkT3p1?=
 =?utf-8?B?K1lFTTBNby93RFJhb1VQSXZ1WlA4cjZKN1d1Q3RFZ1JxQk1tVC9ybnYrVlhp?=
 =?utf-8?B?b1Z2YXZ5Sm4xYzZMZHZRemI2dGNSWEJhS1BhZ1RMeUlLM3dHTWl4RXpKcXB0?=
 =?utf-8?B?aGU3UVE2eDBIQVRia0ZlNERkeXdUNE02U0FQUnEvSXAvLzFPNzlEcTRCeVF5?=
 =?utf-8?B?Y0ZLK2NWNmI2MWtqU2locEhMYy8wVU0zOWNQYmhSSlJsRE03VXhhWHFKeW1o?=
 =?utf-8?B?WFVVVngrMWR0MVNOMzdjcVJ1aDRSSEt3YjlZV3NOaWVydC9DR2NYVjNRUm40?=
 =?utf-8?B?cytRY29wRTkzK1Vnemorb0Z6QWZJUVlsemovTlVlNk5yYVAwajQ5aDVYenhD?=
 =?utf-8?B?T2R5bXNtU0VYZEtjYW8zU1poRFllbGhQY1pkMkFodU8wUEZvODkwL3Q3eVB3?=
 =?utf-8?B?SkQzWmI0bC8vck9DSDhPbWJ5NENrUU1aemN1MzlGaWtvY0Z1aWRNVy9HS3g0?=
 =?utf-8?B?VXJHZXNpU2JRNllqc1BNUlNlMmdNaWJFbDUwbklyYkVsR01xY3AzS085Z0ds?=
 =?utf-8?B?dEk4aHEzWHNGbFU2bGdkN3pBdUFnYmVwSnRjOUNYZG5nM2oycGZzN0kwV0ta?=
 =?utf-8?B?ZWFaNTNCQXhJUTk2MlpQVTF3Sm12ZG1Zak1rSm5FZlVaV28rYS9yYjJQVExH?=
 =?utf-8?B?ZGZSeXZJdldjQU1aaVlsMDYzU2tmaktRWlN3ZC9BVXVLSFprdjBhdCtIdXZT?=
 =?utf-8?B?RUlNeDhwNUl6VzNxQkJLWXkwT3lmNkZzTFVCNnd6L21QUHM4MVFaRTBjekYx?=
 =?utf-8?B?NWdRSFdSOTA0c1lrTmMvQ0M1UWdrSjFTR0RRUkR1bWEyR3RNYXNPVU9TZWtD?=
 =?utf-8?B?SkNqSUF3YnZEdysrZkxsaW9uVEZ5VVFzc1FsUS9xdGZ5c1dkOEZiTzJhSHRY?=
 =?utf-8?Q?D8LPffxJsoW2ut9cZdTZEYJm8Mt6pDQNnR4r1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dbc139c-2ddf-4549-e636-08df0d9f2a86
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 11:48:57.8309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fc9VrThmugyJRohx6+pzMfbslF2e1lzqfCpk9yFGNTTUU7GYhAndoNUddMt6rmQd9pE97O6CKYoheC5/fbD07NXh/dp9qmE695XKPSEwZiQm4VtzTQ9y21LopVnncjY+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9780

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

