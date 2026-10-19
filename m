Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792434437;
	b=yiaddTAkz8MV9P9qORGbIctLfHnio205GCA3aS+4QSHWhy3RMwjl+6mEJp6LJMpAl8DO
	 G6WEdibXRtgmZ7l1JWzr1DN0Lfs5vUV+fL+L91g50H8XAzXvg3qspBozidN89FuI+pkDL
	 qu3wuPYA51KLSYFf+yQxSBhcdnu1ZLyER3jaDiKJoFmYy7ZgZ5nQquoKsdkfPpz87LQnB
	 yQENT/vB0g1xtj+NFfmlJQsl5YIrhPbMUFlw7idUY397AxPFm+k7gkiz9ux6Xlyx+H4M/
	 QXK4AneacecUfIVvqfDY4rmihP2jzvbIH5vvawbNWPibZ8MBZcNJAVAetkAeJXJ2gug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434437;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=30La66OPuxW7xMU758Da+IaBqgwBXspTJk3mXSg0Y7Y=;
	b=3LjjWo5OcWwxQIZDHcwFjBTO/mqPEMmADFkXcfjsCuhJ65bA4l2aC97oN2BWYu2wKoX7
	 xjgG6rqponZs7p9vCKjj3jg0rgAXyrX29VSnvJK+L8J3xDiR2aqWDs6pATnwB2Tg/zleY
	 PtU77VQ6hX46i9bf6KQ00RGvOsYRpBpQl8PFjEghkaJeHG210ZD5F2Yn6UlXzzW4XYw4I
	 p67tBXSttAMfMVIqpCsK+7wV8ISL5K8B0SCBHp9BKi5Mv+17sxXXAggxo+Lm/FTvm7j+9
	 ODeLWU4Us2qC5DuRL54sA0WU8ALkKvsn9A80BY3KXuEFa142y6ZcjnS0RwVRmzB6evg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=gDppgfyW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.24
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010024.outbound.protection.outlook.com [52.101.84.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D464606A33D;
	Mon, 19 Oct 2026 18:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D464606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=gDppgfyW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6WUv6lYT7nE4PUiNSdJH4p3lT4VSw16iJOycRXQ9fq5P2TRaz9ZcAfpIFPCCoKSKvuU55siKEhAX6Fm4rtO94cQs7Co+sVi5UgHjpRR0OIuaiaR1bHLwIZRedUIK7rdripqyVNXkYewzA/qyPwulU+rHjEzh/wJhhJfBXohgNWzYHCiN/ccxrl+ByxzxKiFcqEH39faS5rCli7FKYoOVhtbr9j8J7bWq1hIk6Ge05rK706GUNazEW5enYpdwoBYMRhZTdJmEwksYiM85sxpMVA7Kxmv4bJwiYihrthBdp/taK40F7Gx9GMaE8+pT9WGAvP33mZq3r//AAqwwcsgEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30La66OPuxW7xMU758Da+IaBqgwBXspTJk3mXSg0Y7Y=;
 b=oSwQ2R0AzMI8Ypzx1Cwo7of/1dgWADnUzNhRiWkxO2cPZTADn4oPQBWVbjbzVF9dcbmO6IE1uGyzEKJNPvvrLNcqzHbQO6xXsgqXEFZDMn13T2vai3nzFiDoZkeObHpDEILs4EUlKpZuhegY18ylwGILfb4WL9dD25+lSfoaA0qQqGz0S+Q+xTCFG3Ii4CehOZVDLRx4QnoWh1f0JeJxk3hKtoAZkLx/BJ/h2QVjbWDz4WiDs4COB1KZed6X2WPRxJJVXvxuOXTr371yMrsph1m0+3Lfpsgjg9MGR6NarIP4D1y0f+Pi1Tid93KVPvgHDRbNiMNgKfNIq8EvlS7LNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30La66OPuxW7xMU758Da+IaBqgwBXspTJk3mXSg0Y7Y=;
 b=gDppgfyWwa7BUdC4bXnyfuGDr5W1GZDmok6cwByHgLK1/CPHRdag3jv31G7oC1pxJREmu6a0cfEUXS9Nv9R0bOBn9ts+S7qiTgphiYVvOMsHwxYv/Pa/O7yMFEbFf7miR7wljx5IgbbUSzAf9dRRUM1R9r6mKH4nAcR0uiZKGpCBNa/zTH4dy0l78lRtWtmwMy65sIEZQinuv27gXLBpkQAXLQZo7yYnl44CFKxrTjU4dBU8C1/L79ZDTGukYCC715DQ8CyfX2Y4r0rsgfaRTYFlVbGRvejLgFP6v7r9n3th8MQV0gFoD6BTa4Gq+qUddxSOfaumoIYgFW91qZju+w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM0PR04MB6817.eurprd04.prod.outlook.com (2603:10a6:208:17e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 18:27:14 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 18:27:14 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 19 Oct 2026 14:26:26 -0400
Subject: [PATCH v2 11/13] ARM: dts: imx6qdl-sabrelite: fix typo vync-active
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-arm_dts_cleanup2-v2-11-dcdcbe6389c1@nxp.com>
References: <20261019-arm_dts_cleanup2-v2-0-dcdcbe6389c1@nxp.com>
In-Reply-To: <20261019-arm_dts_cleanup2-v2-0-dcdcbe6389c1@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792434379; l=988;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=3o+aWHoKchVaLIFXLUwIB3LgNaqi1gGMr3IcKCtCqF4=;
 b=fdilshvaNQlx3pInc8uIs38fNWi/i8vdeDWfkqorm74Qx2I/Gs7YZalRnSkyLDa9QW7phffMQ
 LtARCHP9IyABX2q1pd+kBeg8vH01vOmzafA49+ne22IIcbPA5vA2jm1
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS2PEPF00004565.namprd21.prod.outlook.com
 (2603:10b6:f:fc00::506) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM0PR04MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: 94877891-2113-437c-ac36-08df2e0e98f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|19092799006|366016|23010399003|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	lFhPMHZHnO13LBXkaheWEEnOcr6Y3UclUJkKk4+OYXLZeqR9j2P790bNZaOWItxo6N4Bol/ghF6kvRLILC78eugbpOsxGCPy2SFFxjdsuOtXaZtbMgGHrc40pMkhkckd7KgeHvFiqT4Rq2SwCgvmd792OCMRlThw64rTwvVYscPBJODZ8PuhHZsIf/CeIcKp4GJZLAq8pNcGPmiVqembeM3Kl+lB27TaM/nWu+DHHg9UZJIqOlGIiPVYLr5cX07D32FLdeqFvKVXPVS1Z2vK+R7KCBOEDku/cxyP0xEijEt7b5vk3nIyRZvzUxi31Hs4ChK0CPeLxFZ51+sThWPId5nyIbLqPysenLHWvO0HHh+x4fid6zs2ztvLQVy+eHa4jsECI76Daj8XwR6INAozArj6lKz4U47Lm5JCXfH5HDqu1MLtK4UHteWJ1ysWfssvK38KAiabOoS8KYM/o6d9ojejY10muvkwhh0IpIv/+6FWB/7hSCWBqnv3F4A9gr+AEBPhV6+djqJD/WFihvALETMylc3CN/QET8lOaVkKx5OhdUlVzhB/H2K9lAnb4FMkFUoY9WiUAQuQZCXSs+hDoXA4Ngc0lOQYNwDXuYphjLDfyS/3OqJtODm2eHzzqEDO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(19092799006)(366016)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QngyWjRnTEE1MGhGTTJ0QldCVy9wTm9pYTlBcDBMS0Q5QWFFMzk5eDV0Y3VP?=
 =?utf-8?B?cXc0U1lsUU1JbnFIV1hJSTFHV0NiOWhHNlM5akNrL2xBQ3FHaC93SmRBNmto?=
 =?utf-8?B?VW50c0lRZmxTNEwvbkJyMWdjRjdBYXRQWWFUMzhoSDJsd3dtN0tSRy9meXdk?=
 =?utf-8?B?RFNZc1F2K25ZcVE5emkzcytqWnk1K05oOGJ5VEhPTU9tSG1Tc3ZnREd1MzR1?=
 =?utf-8?B?RHR3QWcyTGIwdWxjM1AvQWxya3pLUTBTTUVYUnU0dXJNWnc3cHVIVmFHZWJD?=
 =?utf-8?B?SjNMVko0WEJQaWhuTFBQbkxPUCtYRHFlVnhZQ0VuRG00b3FtY2JGUXpiOHBV?=
 =?utf-8?B?VWIrdXI5NXJxRXpsYk9DWitBM25RQVJpNXprYnlZMFprWUdKdGFyYWIvRUNu?=
 =?utf-8?B?SEtwNDI4bU5XRG9XU0hvR2kyUFR0VWZxV2lrQXptUloxc3FyUktjTjlGMkZC?=
 =?utf-8?B?R25UMVpMWGhVMWlZV0lxQy9TeTZmTVZxQzU4NW1YK3BJQVlxUEo0eUViaEVn?=
 =?utf-8?B?TjRJSk5MZVJVRmVtaVlsZFR1bG1jWUlTUWVldGxNSXhrbThzVi8yeGtGQ25J?=
 =?utf-8?B?TVBYRXlxc2hORG40aG9rL25wcUVkR1V5TzZTUTZCOUlhdWNnM1J0MWlTcVky?=
 =?utf-8?B?a2VhQ2Fhb1dzK0piaHdrTnVjNXRpUzZ2c1V1QmZmc0hocmY0azMySno3ckln?=
 =?utf-8?B?Mk42TnlIWk1WVFJSOFNzZ2VwT0xQanRBOXNlVDJkYkQvdENKSi9SNHo5dGdp?=
 =?utf-8?B?eE5SVzkyUzRzV3hpdDFqd2lQMUFpd3p3Z3paYnBKbkl6SS9Fdm92aEk4b2s5?=
 =?utf-8?B?N2tKWExPQ1laNXZ6bGgvbitvT05aeFhZb1RFaWhaTnhnQ2xnSFE0OSt1R0Nu?=
 =?utf-8?B?Nm1mNWNGa1liNk5reGpVK3A4eUFjdy91aVJ4RGljU2VEZi9CVEVhazF6OWJl?=
 =?utf-8?B?U1R2YWZFVFp0R0VadVRNc1J6OXBNc3pPVG1NbEZJQnAzd2hFUktsWkxtQ2Rx?=
 =?utf-8?B?NTUvUDdpaVY0Ui9lUlk5NEtqbjdXYm9KeW5hbGk0ZjNzMnhOaXJiVzA0RFdw?=
 =?utf-8?B?bW1Ob0Y1YzZEM3JRRHVVbFJyR3ZOWlVtd285TDJ2dHR5RjVJeElNV0pidlc3?=
 =?utf-8?B?bTkxMnFweGFXcXBJalY1NnVuT3JVNXJsYm9sWFJ5djluM0xUZHdlUVJOaFJ4?=
 =?utf-8?B?a2w0WUxyZTJNSkxNay9Cd1Y0TXZqa2IvWkt3eGl4WDlNUW5GemVsZHlOSEFY?=
 =?utf-8?B?UG1tL2h3UU1jWkZIZW5ML2FYZlNkVVBZZGNBbVZva2pUTUFNREVsSXNzenpL?=
 =?utf-8?B?ZVowTTR5WHFhZGlqbENlRjl0YUFWd3dNNWVEaXVTWCtXcWJZY2Zad1hpZ3NU?=
 =?utf-8?B?SFMxN3Qwb08xVExoVXVyNzBoTWZNOFA3RFBIVnhQcDJnMlFML2NtaDBQWmNH?=
 =?utf-8?B?c2hubGRPM3N0dmV0cFZkTzAvd1Y4TlVERjdCVytqOGlHd3lwR3BFSGgyYUNy?=
 =?utf-8?B?L1Z6OXdyOEl5c2VHOElUZDNmdXJIQ3BTMTZvcjhMRTJ4RVhLNUh6aHdSY0du?=
 =?utf-8?B?NURvb2VrUzNzUmcycjRwVjFqUXd5SUphcHM0THFIczFMcDUxZmRZNHo1T1h0?=
 =?utf-8?B?MFVvYjdzYkR5dC9pbzZta3B3UjBrcHRIMGI1VGppNXUrem12VU82OFJzNkF1?=
 =?utf-8?B?am1YQUtUQkx5NnFTcHBaRGN6cit1TU9XeUhhQXRyN3I5NzB3aGk5bE9VMnA0?=
 =?utf-8?B?MkRwWXA0NndOSnhKZjhvNFJaemg0YkdEdlVoWUZkQ2RJSUhJTTlkQ0QrSmYy?=
 =?utf-8?B?aE5oZ2hHbU5pWnlqK0hhVG9hSW1wM0w3MkNKVUEwUHJIOGg5enRpY0dwaDZq?=
 =?utf-8?B?VW9JL2xhL1JvVHZrdDZ4U1dhVDJMV203cElMeGNXdldiWXFLZjlUdTN0QjA0?=
 =?utf-8?B?ajFFQVFDTUFXLytpRGtlQm9pQjBWMFdsYVVmZmxXL1lUZ0tieHNaSkVHL2JD?=
 =?utf-8?B?Smc0bEJvdE00N21OdHJhSzVaa3NEKzk0REs0WDdyckV2Ti9MWnd5dWFwMVZX?=
 =?utf-8?B?Y3pJKzZvUmdLdGludzNiNVBlejF1QmMxbXdpanJheFYwOXFLcXUxcHFKQW85?=
 =?utf-8?B?M3VBTVRNSURUNWFocVdNdnBxTGdsRFkwenUrY2ozaWtyY3lEY2FRTkhpMjdt?=
 =?utf-8?B?TFRaZnphVk95c3hFOHM0NGhIUW9paU1iZHVtNGQ3ajlMWThjZkEyYWpTVjA5?=
 =?utf-8?B?WjNBUm5sTmkyemx6MzhrYTQwTEdpdE9ONmhYUWdkWFlPdW93MFZlTi8ySzkx?=
 =?utf-8?B?T3d5QTlIbzFYMDBPQTd6THFUOEVrRDVUdThZZXQ0NnYxc2N3WUNveVFoajZw?=
 =?utf-8?Q?Is8VE3yVdaNUJWp7Wr+H9BwuTdQrZHICasYeD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94877891-2113-437c-ac36-08df2e0e98f7
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 18:27:14.2339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 49PmPIJd63/ly3rybzzXWTe5AHuCI+9hHfl6abCVM9WjkBTZxxXKnmEMYOAGNohetOdTbn0b4tE762wcL4nZo7vdsen366AdADKpFRShsdmN4sfmpdClgxtUMJMvTjwK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6817

From: Frank Li <Frank.Li@nxp.com>

Fix typo vync-active, which should be vsync-active. Fix below CHECK_DTBS
warnings:
  arch/arm/boot/dts/nxp/imx/imx6dl-sabrelite.dtb: endpoint: vync-active: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
        from schema $id: http://devicetree.org/schemas/dt-core.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi
index 3b7d01065e87b..308db8af73719 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi
@@ -234,7 +234,7 @@ &ipu1_csi0_from_ipu1_csi0_mux {
 	bus-width = <8>;
 	data-shift = <12>; /* Lines 19:12 used */
 	hsync-active = <1>;
-	vync-active = <1>;
+	vsync-active = <1>;
 };
 
 &ipu1_csi0_mux_from_parallel_sensor {

-- 
2.43.0

