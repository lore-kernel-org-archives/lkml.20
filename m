Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010010.outbound.protection.outlook.com [52.101.69.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96308414A34;
	Fri,  4 Sep 2026 06:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788503203; cv=fail; b=aVXyDteNbyEcTz0EsJ1RRSccsSjkCZBY/ztameDK5AcdYeA7jhL72xQ1CYgu+LqLplkbhx6dCI4kBKfg+yMKmTJM99Q15YsfLf5vMQYE6S8ve2KPqWZooVPMnbMuHvppiUuFhsq7PNYPpft0CCGAc2NrJhf2lEDTgJUR5NAN4k0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788503203; c=relaxed/simple;
	bh=/m8oXPbNvhlQFtkGuaFz3sjPlTmT8rQp3A2k1x0A2Xw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jx8JG0GT3RxDfhWgrqrM+wwqdRDCikteXJLIUFhEu6IfW663bZjOgBe5tOYL3cMoLG3QJ+UnVOeVfV4MCwUsVtg7OouQIVp8CFBYTQfpiSXnLyTGKb+esPOAjYVV8F6CTi91P7Upr5dGxoJyWWdOssjkHNbsTwxZkuTu5sbtuiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XqNR21F+; arc=fail smtp.client-ip=52.101.69.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XqNR21F+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gIqkQj1C/Rk+6WPySzjqmXgstuefrV6Cmw15W89Sm2D2DiX9bqshOMLW4C4ZeIblwGTv6ZAlTvKc4iq0t9Y10sLi+WyOPE3ShwmOOCwl7OARn741I6+BSdriKIPmg08n2PUW4PGTAaKubCUgttuYHraAnc7LFwniJwLsuSibRqR2pV93zTm64lZW/ANBsiusJUpJ7+5SNpPfPQVOAT0DfJwEPP34ivnxdMXNv3LwRAsO9PzYAEygFgo04KnFUkAwjuK0PzJcUYQzyQuTLbFxvNpRaqKonUvBwbXou49amg3EsFnM+wlt9f6bizu3rhpPXrOd3suWgXO6Tv2b/Ik3VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=er8mkpSGysTU2AnOCiPtxLRaraSl7B9NqJnF92yeKFk=;
 b=ojse9gS8+8iZBK4njsEUw9zAB7C1njnGM+Bs7/EaaZbg8QjMO0s/SLRTI2xXZCKI6ddiSttIiOO+9kRq4ZPOs2jIpv/PFhK+fvXqjbklAjKWVlGwCfHzklLaw9Qw+tt5S5Ck1nayP1vzJZdx7Vr9Ee3SRQ3IfDabgInY9RqImWWAMSjE0n1YXZk6luVk752NN4gcUylDv3f5vd4D0hqEmQDGrIIpoeybk3F6fi+TxGp0AGtukTL47jUdal52wS++q9RyNFh6T8Vod0jw+aCTh2reCW9cFiyJ5WfRMPKjOqO6gL5NsDGbYEy7mbhX0QLdpkY+z7+6QFZz/wieb+tERg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=er8mkpSGysTU2AnOCiPtxLRaraSl7B9NqJnF92yeKFk=;
 b=XqNR21F+XpwzKypN+NJu0eWFheRxANkFw/6POVQI2WnlS4F6PAr6gDtiImbyVJYMK5a8lWZvXrp7lb48JQi9bpezIsOyzOPbKfiyxrN7YabO7ud9OaepsjuiP1CoU6U7HP8I6O/2XAkvDX1HupPbT9w2PZk6JLJPTV7CeacNH6DVfHfM+qSx4kZUgim2e7QiyPuLGe9jAQZdeBKtVBYMWRyenI5OcpiwwqW2T9enxbFbJ+UeSwjlT82t0o2ROAfkzpiU5w9N/jv7RKGNszV6HxpylURyZFv+XXrx4AWxEip7P/i8zM5X4OaVppGLT6a++fPSi50BFm09iCkszsyH4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AS5PR04MB11395.eurprd04.prod.outlook.com (2603:10a6:20b:6c1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 06:26:39 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 06:26:39 +0000
From: pankaj.gupta@oss.nxp.com
Date: Fri, 04 Sep 2026 17:25:59 +0530
Subject: [PATCH v47 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-imx-se-if-v47-1-b474ec6fc52a@nxp.com>
References: <20260904-imx-se-if-v47-0-b474ec6fc52a@nxp.com>
In-Reply-To: <20260904-imx-se-if-v47-0-b474ec6fc52a@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788522985; l=14442;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=GR+UpWiKN6vQ/fD+2am73nCHpHQoukDXxfoTE0YlRxg=;
 b=4JHV/PY63O6RK3z13B227yorvUkh8izFG6DuTsesmb19nRWqf9Ucs29hqrQVlu+cBb6dEmay3
 1G166uuD2GFDO3nECeNVU52jzVqk90ywgghZPaFFDTTnT2V4bDuSUqp
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: MA5PR01CA0260.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21c::8) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AS5PR04MB11395:EE_
X-MS-Office365-Filtering-Correlation-Id: 62c6aa21-eb90-4995-7d6f-08df0a4d7a30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|7416014|376014|6133799003|18002099003|22082099003|3023799007|56012099006|10067099003|921020|11063799006;
X-Microsoft-Antispam-Message-Info:
	8qTdv7ZYw2hRdkzOqMAA7ttHfIf6cpzpJufY3W3uR/KPuWpEDBEf1qMW8V5rn0Wj1p56MXHgfmmOjSIM+Xd2xPDh5fpmUoFzekYTxPd/KVK889XdpLwzL6NEEfx8rS5q0bmDcognb2IM+gUo0IBh7YWGRIjY2TwWU4g2JqJEBLmfYEY/RmkfEO3UEd1XUziAArJZxGpDRc0aJFbi0c9GJMlR8wlNMRBMtfhQFfwOC+zzRwp8Ve71ii737y6c2/JzsZeH/FpQ1NhlMJWPNTVmhUfmoP9VA72w4hv9LJUT7Q76wmQn3L62v6ze1b9c/Bn6QQUsCk4FARsoxePkL1I7rfFJcOgvk/h50E6RA7+quaXtuvAnGyk2k9d0eEl3BhAsu3JnUktY3WtT1Z9ZewHlxavuOS1jO8JWfvH6KhNKEKNeNXmvUu2N6Ns+9iIsOeOmkCqJAuLifoyyhSiLd0oYjXWl5Uj6bbDFr1zMDxwLh4LjjrH27pZN2VDc/ZPbp0+OqZwQvahxkH3ErI3r26isXDRtcwmM3QHv3Pe7ncEo08L2TQb0cTwD6vQlXM45dzF0XUeY+ky2rfkner8aRYR8Pv9eWX57vwmJaPix1+EI4l7Hk1M2tdHfgdvw766+Bf3+E8h5VUkdT2OyDrglTw5I85WLELahwet0Q15oO0MqqVznb5ljTd4wq6tiSFMBqlEf/05FbktxcSrvA4Z+Q6huJg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(7416014)(376014)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(10067099003)(921020)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDZiZmlwL0pybkx4cE5vcU1XMU45MHlKcGdTbnZQaGM0WnNWMzZ3QldMdHN1?=
 =?utf-8?B?am81WnBjeUZuMmhkcGlWRWdROGtTcHl2dmFNSlM3ZDZEbjRyOHZYUUlITEdo?=
 =?utf-8?B?QS80eDc0Ry9kbmNva1JIcHpBa0tkS2FrSUNNZnNVVlF6Zm5ZZDlYaFl6WWtS?=
 =?utf-8?B?ZGhxTG9nS3ZuN204K0RlRFEzdGlrUkh2K25CWkxIVjJyWGdFVFhsOFZ2QTVE?=
 =?utf-8?B?YVRSN1VvbmQxY2tsNUFrYnJxWWVoa255enhmZW1ockdGeXFoNzBKSmdNbjVK?=
 =?utf-8?B?Qnhld25zQlhCMkRSV0ZYQlFqK21aRWxzWnAzeXE2ZTJYOU9OTzB0QjJiM1VF?=
 =?utf-8?B?RDB1TVZGaDhRdmNHL0FjV2RxUS9telNpbXp3ZEt4dkNYcDNOaUJXejdjbEtK?=
 =?utf-8?B?TmI0c0ZUbTYvYkRVRnBKOTZ0YTI3WU1DL01vVEMvS01sZ3IvUmg0Z1RhTVov?=
 =?utf-8?B?SURlY3JIUjZUUTZaS1lEenFBUVFOS010VHNndW5UM3Z0ZDlyZFlwMUNCcmsr?=
 =?utf-8?B?OVFoc0dUWm02QTduYlVQZzRMY3pJNjg2VVA5YThnbi9jYjk3YnZCeFUydXBR?=
 =?utf-8?B?dGJrekczeVdQQ3dwMDB1V0ZhM2VNbmo0U2k4djBReGtYY2pCcDlBYTFiUGFK?=
 =?utf-8?B?aTJXMFVQU2N2blhyd3FVVU1lWU94dkNYYlpOSXZCZE1wd0drcExjRU9qQ2V5?=
 =?utf-8?B?Szlnc0FyMlRNazhveG93aHBoeC84SitjcWZHWXQ5Vm45SDUzYTN5aFR4Umhw?=
 =?utf-8?B?RHZHdDBIWnNEbEZ6MU9xN0doZmZmY092SEhHWHRYWTg3TEFicDBVdFdyOUtz?=
 =?utf-8?B?N0s5VHRyUE04YWRNOWwyUFhsMWhta2lteS8zTFZRQWlIRnRrOUlRWC8yNHNT?=
 =?utf-8?B?aWVTWFFGYU5NNmREcHk4TWRsMnZYK1pMYWxjL01qUUNBWFJzaG96RkFiYzFj?=
 =?utf-8?B?ODZiK0lyaDB1d1d3NUZWSENzbmN2a0pVSlRBTkhDd2FDK0U1dlFsNkxNT3VZ?=
 =?utf-8?B?S2ZIMVNGbi80MUZtejA5eHdDZEx2QVl3VjBPYytheXFtTXpQb2V0eDRURDcr?=
 =?utf-8?B?MFlCNzFGR01EQXFVUk9CMmpzWktZUjNSSmg2Mm5WN3luaEJwanVucXRxZXN0?=
 =?utf-8?B?OGh5V3BObGprSDQ2aUtseDVLQVNhYWdzTXVHYm0rb1AxRUp2RWlwVmhDMlBq?=
 =?utf-8?B?S2xFdmw4TFdSUVc4a3l2MHVGamhoZEhDY081Z3Zyb1llb1V1UnhlUGhNekhu?=
 =?utf-8?B?aUlGZUZVUmxaSkhrRXZxSXprSUtaUDBjN2IzeSt6NFJqRDZXbFllNTVLRW5P?=
 =?utf-8?B?WVQzS0VmMk1UeGt0Tjh3Z0hhdDlNWVVlZXYyYjJzM1NCSld3SEs1SGQxMWJL?=
 =?utf-8?B?VTVSdTR0QzlHQWI4WXkwYjVwcFdYR210TnVsUXFTNXpDaUNQVmkxM1FPeW5G?=
 =?utf-8?B?RFFCVmIxQVp0YmJJMDZWME80NG83YVRLdFoxRjAyeG52Z1AvbThQYkVNRllO?=
 =?utf-8?B?ckhrQVJ5b1hjWFB3Uy9SMThBOUtOd29iNWJFN3ZlZkdlRHdIRG4yazBNZGhr?=
 =?utf-8?B?UE9MK0J6NGhEeDFqTFkvTjFqOFZMY2FZdTVGZ3VhVE5nbStVaGt6c2VYeXBh?=
 =?utf-8?B?TkhGTmYrRTZTU3VwcnRDTUx0UjN1OVBsR25LSk5pd0IwZmRVdHJiTG9HQ1Vw?=
 =?utf-8?B?VUwzWURIN1EvUEFZL0RZNjROM1JScXVMbUlCS2lDRlVxeFkxU0VBOVNHMU9a?=
 =?utf-8?B?RS9iWDdzVkdSbDg0TFp3ZlBoU2U0dGdWendwRER5aTFDMTBCWDFjdzdFY1R3?=
 =?utf-8?B?cVBpZm55Vlo2VlNLUG1RM1k1dFg2ZWpVMmFmQ2dRNnp3VzVpRjIrS2FHNEc2?=
 =?utf-8?B?a1hEcXgzSVFtUG5hQnNsUkU1U0VhVUk2NGZuNzNGQWNQTjJGRkZJWTlBbGQr?=
 =?utf-8?B?VWFKMmQ3RFZpTEF3OVV1SDRzN2RXYld4TFlHWkw3cVJUSStxdlpCOEI5TUs0?=
 =?utf-8?B?ckZzT2wxNHUrVWpFTm15WmdxUHYwT0FHYTk1QjlmRjA3WS9aQzc2bkRSTzB5?=
 =?utf-8?B?Rm1pZEVvbUtKc1BQM0k5QTA3c0Q0TSs2R2RzV0tqSnQvcjdaY1BYajh3T0xR?=
 =?utf-8?B?Sm9HbTg3UGp2enk3eEMzamtnMlNOOU05dFdMc0d5Z1phTTZ5K09XaWs3WFR3?=
 =?utf-8?B?aWFGMlRJTWlBOGVaZ0N0UzlTZUFYZzBNV3o4Y2tIRVFYM0ZMYlVCL1hzYThH?=
 =?utf-8?B?aDJHdVE0VmhTNWlFblNKcmd6Yk5WcE5jOThMSElKYnRIRFVQczZzb29UZ1pR?=
 =?utf-8?B?Sncrb3FSQThKVkxjR3FKVE05Nno1ZmMvVXMyNGd1eTFFMUhqNnBacUpaVGpy?=
 =?utf-8?Q?a1mtjYbkAJExeyugwX2ejch0p/tqr1vadkYlT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c6aa21-eb90-4995-7d6f-08df0a4d7a30
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 06:26:39.0156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GGzeXiU8pY5WhtluAVXdQewApPlz/dZR/jkm8HVZBpI5gkDuS80+ozP6yftrpELyE0GK+Z0X1DvqeAmBrjONQZ4++Fko/KHTWqcLtwzzluk1OfcgMVPTQnQWKop5M9DD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11395

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

