Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793113284;
	b=ifGdcN08P2om3PY5nuXIT33yDJ4ay58V0iMUQx5ctoCJ7+ujtcds6zKWUH6w6/cgCaEZ
	 LSgvPpRGJZbzWSzn+CNbe7L31sKdyfOzaPuCnTseYIUCzjQ9q0LEFNGF0mgPRAIcWCHiJ
	 /27FTQ0CrdEI7LKbf3q2Tkb2L7MEyLqiswKAOhhfsyAoeeU1ZoHFmKm3l1W5PVoq0TYVl
	 mlJaYX8htpZ4SrMIjL4Sq32htk+SAHwiL2IxKWToQ+xz7/0J3laSozsGKdhjJk/UosxP5
	 r39aIvA6qzCF1noPXTXYjE6gAmwqmnnYL53MfH2SANZSC33HMk1iwEOUYeF/S28E6iA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113284;
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
	bh=dkuWfRC5B63qs4o1ZzuHa9fBLYWjbRj9n1aebzOvlQ4=;
	b=NJOZXxpLX3jbnrbBMHz2qci1fjTac4BpTVhvJW2rgGy6Rbp/6ku+UYDIPKVmlK4TqfFA
	 9VTY5CGzYzrpQwz/UsdpaVsc2qi11IvJbqTP1O/Cjde9RlsaTqTXxPMwxu6RLacsrIoZz
	 AZPhIhFRaZwj50JztyGLuYwbb62BLTWeaSymOYCI3MtFV2KwmItm7ecAXqYGjsN3FxbxC
	 tZxvpAbCaEviPie5+72o/HyLd9dU5V8FfKAN14Pb4JKJLspRlSDoMRzr7FEfomkSEHCgF
	 C7UiKeAvd4V+5d1GgNKg/UA6tjNZZ0yOHKg3ShmQ3vYA/+OdrYoEt4l7vt0GnVVWFPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=lluBcgiL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.52
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013052.outbound.protection.outlook.com [52.101.83.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71B560A2603;
	Tue, 27 Oct 2026 15:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C71B560A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=lluBcgiL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D1WEEiTzjkWUgDyyxhjLbUZnvXm0k3Vigm7U/5WNrV6wh/SSVCw+EcQGyaISN/WowQYbBSD6AQYInf8PNlKayKuP9w1HuM0UxxO46CaCnyZDweEuDVkcLQVUf+aRknyDdvlWsAaNn+UbZtHDNU8EHPzP5y7jrfYWvP2BQg9/4fmOPGQCsia44Rdm5DFlN9sIn36i3bsK/P2qFQb3B8fWhwWxJq4WRZ8+ECu+wbZygaArh0V8jU9GJrpYl3cg7W6DgW846G7kUw2uNGiEAa35tXsvcobzr/GPGwkfQFyMSgHrI8HwvU90Al/QxLDwxdICgi7NE9xeei+/PJR+z3X+OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkuWfRC5B63qs4o1ZzuHa9fBLYWjbRj9n1aebzOvlQ4=;
 b=a8Pti9HgtFWKohn95O8pZ17JHUZPSeVP0XtSVFj7mp6BQggYL7zXvxWM8NxqgdOfvPlm9Wa9NDbLZzkZVL0i/izvsgPSDGL4IlX4fnicp+bWlfpIn8B/b1hNFuaMUN7r04RHApEZy0rBQ3yVNUy058awpHUjxzGDv/R/CKgM9wouQpUyj2ilAh2gfLJIF1Z2sh9jG7wHt3ctUK4ODN1RbRQTPjbSX11Gkn8d78TLlVno8gPfDmZJMIqqXELF/2ZKh2Hwm8I2nc+KkuNRXdcPagAX7eRK6tVJkwvoMVqbYWisEgbfTKJJNtB4jFTtPUI77VvHvjDn4oTw4S64ZedHpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dkuWfRC5B63qs4o1ZzuHa9fBLYWjbRj9n1aebzOvlQ4=;
 b=lluBcgiLnLY6y/THrIFGcB1i+pcxIKvqWB2j5lqF656JKp2W3TxvY5GfGqeTGrC2TYSMf0B2T5LObiSeltCbXlqTCziH3VPz64ZkYe8WwKlKZix8NYKliToRtGQHyJSubR9F1RzD0rBi+9Jrdnhdb1Sz2bCMqLnJIPL9KEG3XDLcdkbzjq9mm15NU2sx3TKdOUXfPedNaSKMJQYhWzkA5/RoO2+qNJPFpIX3QNC4zbdKJqifF5jB/v/mhp3iVam12cNj+QETcpkho/4oYBwcXCYKWXq5PRiR4TGLv4tGzhxNiurKkiWtLUU2nAx+vP2G6BdpRDv+M4OoJ0p1lb9dcw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU7PR04MB11162.eurprd04.prod.outlook.com (2603:10a6:10:5b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 15:01:20 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 15:01:20 +0000
From: Frank.Li@oss.nxp.com
Date: Tue, 27 Oct 2026 11:00:56 -0400
Subject: [PATCH v5 4/7] arm64: dts: imx8-ss-dma: Add lcdif support for
 i.MX8QXP and i.MX8DXL
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-dxl_lcdif-v5-4-3a974e4b94b2@nxp.com>
References: <20261027-dxl_lcdif-v5-0-3a974e4b94b2@nxp.com>
In-Reply-To: <20261027-dxl_lcdif-v5-0-3a974e4b94b2@nxp.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Robert Chiras <robert.chiras@nxp.com>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793113256; l=3594;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=dYCFdYWt0mJ/Z95BbTgLPz0Doe60DEGSIG6bS6sLXkk=;
 b=v9/Ot/JZ6P5oLQTcTV7A4ffHAbXhB5WtKHnSrsUnnU5GZN6SvmJ7+VHCoONvhFKerd2r5HCbV
 It/DlnJjLLSBla+f2F6G0GLLins39JDGbQcHJ4ox2aYClv44hZ5K7Ne
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS7P220CA0112.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:25d::9)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU7PR04MB11162:EE_
X-MS-Office365-Filtering-Correlation-Id: b7f7516a-0285-4e3b-a775-08df343b28e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|23010399003|7416014|261026140227099003|11063799006|921020|56012099006|261009223027099003|261022105027099003|261021121427099003|10067099003|261021123027099003|22082099003|18002099003|261026121527099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	WAYYS+4iGYgpe3FdJoZnPl4YQElijQML4BPjtLnW/kcWFNR6XV5eTTGK8VIz3COcAdikxjggISZTQUOo50sraDQvUOi2HyW/dIZCqOBi/VFH12e90s+OU5RwQOYVFQVqpKiQDjadDcwhMZfoNudiJTHBLP3yUICLtXfJtKyDrfRhOiWecx5enRcUQYQ/PlPjfdAbb709ChGLtOhmFCUCnrfpZtenKEz6XJaVbe00j/oZzbRY/PhuHUZNI+FPAbKH5xywBczR7NwSYC2MZcjUQR/wdULBpEas5CHsuY5LN+bKJ/VRM2NZREFPJoVN0aiOf+XePFkgzGBrRRR/AU7XZLTcqzW9QnrJE+CUrUzzt5ZZYLwVThlFrv+mAwpxvIleJEaFQelGYz6VA4MljP8XjA/Zlii4AvmMiLPQrGAXD/EcT5Ain4T9TfasnZTIm5RUtcjoaWNsuqBWXTjDmrEOeVQ9x8ckqgUTVk7vbGASIGStjVMdf+hd/sqe61NYonSdKJ1lTWA2+PALBVNS/T9WFKOTp5m+i3H0n9kpesDWC5/ht4M/VRVBKaLxhALSyqOnub6az4+wRt5Hwg9eNDL8cMloiuG83lWouXPB8uTcUbcIiKSnMaR7EcHo8s3BepuuVfQOq7HvzZLsURTJqYqE3e3MaIl7eDk+PmXUBWji+XXE2OjDB9ESa33cxpYzI7X2Uo8n2idVlGmFQOVAzRTGYg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(23010399003)(7416014)(261026140227099003)(11063799006)(921020)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(10067099003)(261021123027099003)(22082099003)(18002099003)(261026121527099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2hIeC9HcFIraDZneDk1Y3Nja3E2OWVvVmpGaDJ2TXVGWjFmdkl3VVppSWho?=
 =?utf-8?B?Yjg2d29VQVg5dFNJZnlXYzRueTdGemlYYUxiZ1Y4allvZ3VMNVo4MTBTSzBx?=
 =?utf-8?B?aCt0OGJEMlgwdmRwSzNlcGJZMG1ObXlHR0FyckZjbXlFQVZBVmVOUndVVFUv?=
 =?utf-8?B?VlBzbGthZDVxSDE4N0VyQndNK1U4TDZPNHB5amlCUHJFNHVrTExQR24rSGJl?=
 =?utf-8?B?MC9ZdnVlejBwb0ZJV0FlZXhFN1VJR0hxdmFUcGRxVGRKOFN6d1d6dkhIdkhn?=
 =?utf-8?B?Z0hvWXRsOXVuWk5QN0R5NTR4V1Q3YktMY2o1UXlLLzNCdFVtSnBPNWZhN1Zx?=
 =?utf-8?B?R2MxY0dvd3JrRWlYVGRvc3JrNWpCcEFXcUluekhYL1hqNXoxYjJvWStMRGpa?=
 =?utf-8?B?Qk5JbHk0UlBqQVlCOWxRb3NXL3NycTQ0SzBZamkwa2lYMWpMU3VnZzR2SlNk?=
 =?utf-8?B?Yzhyc25nNzV3dUFBcWRaVGxERENSYnpvM2NDRUQ4WnMwTndVSGVUdmdaek91?=
 =?utf-8?B?UHl2NVR5eitvRmx0VDRtVHZ5eHo4RndwMDMxanlreVJqZ1kwK3dvS1BoS2N4?=
 =?utf-8?B?d3JRVWdCRFdHQXc1SmZmVEwxT2d0bHhob1RZODNVQk8wS0l3NFpLZC8zdFV2?=
 =?utf-8?B?ZHZMWlRkck9jdGI0bUdDL3lNUkRsOFpOUWlieWN5Nit2T0N3alJ2SVd5Ym04?=
 =?utf-8?B?MFk4T0xwMU55MGpVZU1Td3lmSUJEaUdxK2ZUYTVkb3NzamZGUWp2ZVcwcDJw?=
 =?utf-8?B?YUsyMXJEQnJzNWNpY1M3T1N6ajdLbGJVaTdXakU2UjQ1ek04WVhkYUg2eC9k?=
 =?utf-8?B?Q2FXdTZEdmhZZUdUQ0NMUzdDVFJDZzFSQlJuWnhWYm1MdVJuVFF2UFBSUDV0?=
 =?utf-8?B?YUJFQU1KS1BqWjJhTkRzWDBOS3FuSTl3ZDBUNUszMWE5SjVpR1dwZUs3YmVp?=
 =?utf-8?B?L1lGS0FURzlTZnRPTzJTcVQ5cVlxWHRiVFEzd0VvY0JUbDdvcVpKemdMWkpX?=
 =?utf-8?B?d0FVbTMrY1lYRE12NVhFNHpGK0dvbXlPK1ZXaGZuVFUzdU9WUHlKaWNHL1Jj?=
 =?utf-8?B?eGpoTlcrQ2k0dmZDU1VFemNMajd1Y1BWaThnNXpzRTk1OW5oZ0UxRkhPQWhY?=
 =?utf-8?B?YnVOTEtiWG9RMzdnMitXUm0xcTE0dTlHR0g5dytjZjhzaWpEUzUvRGNrWTVP?=
 =?utf-8?B?MFRBdlFaM1JwMG1GVGp4aEZsbE1VdnZad2JlNUNnaFBHRlA4OS8wMWVOK0R6?=
 =?utf-8?B?bWFhUjB1bHdlckU3a1VEaWFWeHZmc2lPRjV5MEZoZ012M1krZWhhUmZUbDVT?=
 =?utf-8?B?dHpYb2YxbG5UdUtjbTJxRENiLzlTd2t1WS9KOFp2cnZ4NVlDeDhMbXVHMFJk?=
 =?utf-8?B?NkpUeWpxNTBPNlUzcE5PdXNxRGN6ckxDV3dSdWl5ZkV1OEtLcE94WXlCa3ho?=
 =?utf-8?B?d2JzQU9NNTg4ZlFLRU5zTXlMMWxoQ2ZkMVUwTTRiUUJlQUdpcjM3blVoeUtS?=
 =?utf-8?B?RXp4d1hrd3hDREI2Yk4vbGdEZ0pNSU1YNlFva0hzcElLb3hVR25iRXVyMVEr?=
 =?utf-8?B?cUZYcWNtbStGN3lDV28zTXFFVFN1YUdEOUZoMERBRmcwZ1JLaER4NlZkUmYw?=
 =?utf-8?B?ekNvV3hkNGpEZmszRFpvN0J0UWM3T1VRL3UreVN2ZWM1YUtCZU9walQ0aDBJ?=
 =?utf-8?B?a1RRSkdIMituVm1WbngxQnhYUnNGZnQ1ek9laVBndTUvV1Njc3Q2Q3ZLa2NI?=
 =?utf-8?B?ek96eEhwN05zUUo5aEJIbW5oMEMvYkJSZnQ0ampadU1mVkF3eXVOQTNGT09Q?=
 =?utf-8?B?SkowcHZobjB6cERGeFdMckd2UXRIS0czcmEzcXprTnkwVjhoVTdob0lyYVNo?=
 =?utf-8?B?NzhGdkt1OU1STi9GRVJCNWh4MENRb2VWS0VQazFJTXFhaXFXMXlGYkdqVTlD?=
 =?utf-8?B?bGZ4RDI2UFZrL21ISllyRDlMNW1HUUFXeENyN3R3R0ZDYWJ6bys5TUpFTmZo?=
 =?utf-8?B?Q2VPazJZSEppa1I1L255SWJBTjNYaGgvTWhQZ0JGRlVFb08yR1dGRmZKb2pH?=
 =?utf-8?B?TXhEK0F5clVIZ2NUQW9oT1hVNWk5bFhuclo0UzZNZGhSanFYSXVnWWgxZDR0?=
 =?utf-8?B?Ri81NDB4RE16NzVKaTJpM2JHUklROE8zNlhTdGU2ZTgwNTdhdEtBM3owQ04y?=
 =?utf-8?B?TXJJQWlNTTBKQlFKdzlYTlZwUVBCNkdXSzJjcEF3L3MwOFJURmppVUQwSmV4?=
 =?utf-8?B?c2NiR0ZuSFN1MzkycjFpWTlwcG50UVBqYU1lZEZKajFOWmZ5YmRrYlRCSHJX?=
 =?utf-8?B?alJsOXdTTnhvOHU4Z3JlblBQME5wcm80ZXZaSnUwL1Q5Y3lwaGQzeUkwbElr?=
 =?utf-8?Q?eyb8x5tmIMAkHrYMgURoKYkQJY1R/F5muLPfn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7f7516a-0285-4e3b-a775-08df343b28e9
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 15:01:20.4911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1kgDKjpyv812sGqas6O1aIeG+HAyr4IbV8UBY2oPpfa7MPVPOmJJKzj0aZyBVZyxNHice6PUsPXkjR4lj3jlhy6pOPYOJxJaNEFHA/Jcx5MXQxYsgI9y51iniYaNQm7X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11162

From: Frank Li <Frank.Li@nxp.com>

Add lcdif support for i.MX8QXP and i.MX8DXL.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v4
- delete adma_lcdif and lcd_clk_lpcg (sashiko AI)
---
 arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi     | 29 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8dxl-ss-adma.dtsi | 11 ++++++++
 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi   |  2 ++
 3 files changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
index 4de78f870c05c..87082c3fa9338 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
@@ -149,6 +149,24 @@ lpuart3: serial@5a090000 {
 		status = "disabled";
 	};
 
+	adma_lcdif: lcdif@5a180000 {
+		compatible = "fsl,imx8qxp-lcdif", "fsl,imx6sx-lcdif";
+		reg = <0x5a180000 0x10000>;
+		clocks = <&lcd_clk_lpcg IMX_LPCG_CLK_0>,
+			 <&lcd_clk_lpcg IMX_LPCG_CLK_4>,
+			 <&clk IMX_SC_R_LCD_0 IMX_SC_PM_CLK_MISC0>;
+		clock-names = "pix", "axi", "disp_axi";
+		assigned-clocks = <&clk IMX_SC_R_LCD_0 IMX_SC_PM_CLK_PER>,
+				  <&clk IMX_SC_R_LCD_0 IMX_SC_PM_CLK_MISC0>,
+				  <&clk IMX_SC_R_ELCDIF_PLL IMX_SC_PM_CLK_PLL>;
+		assigned-clock-parents = <&clk IMX_SC_R_ELCDIF_PLL IMX_SC_PM_CLK_PLL>,
+					 <&clk IMX_SC_R_LCD_0 IMX_SC_PM_CLK_BYPASS>;
+		assigned-clock-rates = <0>, <24000000>, <804000000>;
+		interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&pd IMX_SC_R_LCD_0>;
+		status = "disabled";
+	};
+
 	adma_pwm: pwm@5a190000 {
 		compatible = "fsl,imx8qxp-pwm", "fsl,imx27-pwm";
 		reg = <0x5a190000 0x1000>;
@@ -298,6 +316,17 @@ uart3_lpcg: clock-controller@5a490000 {
 		power-domains = <&pd IMX_SC_R_UART_3>;
 	};
 
+	lcd_clk_lpcg: clock-controller@5a580000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5a580000 0x4>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_SC_R_LCD_0 IMX_SC_PM_CLK_PER>,
+			 <&dma_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_0>, <IMX_LPCG_CLK_4>;
+		clock-output-names = "lcd_clk_lpcg", "lcd_ipg_clk";
+		power-domains = <&pd IMX_SC_R_LCD_0>;
+	};
+
 	adma_pwm_lpcg: clock-controller@5a590000 {
 		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x5a590000 0x10000>;
diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-ss-adma.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl-ss-adma.dtsi
index 7a191195dbd97..febf5f8b54ac4 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-ss-adma.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-ss-adma.dtsi
@@ -60,6 +60,17 @@ &acm {
 		      "sai3_rx_bclk";
 };
 
+&adma_lcdif {
+	compatible = "fsl,imx8dxl-lcdif", "fsl,imx6sx-lcdif";
+	assigned-clocks = <&clk IMX_SC_R_LCD_0 IMX_SC_PM_CLK_PER>,
+			  <&clk IMX_SC_R_LCD_0 IMX_SC_PM_CLK_MISC0>,
+			  <&clk IMX_SC_R_ELCDIF_PLL IMX_SC_PM_CLK_PLL>;
+	assigned-clock-parents = <&clk IMX_SC_R_ELCDIF_PLL IMX_SC_PM_CLK_PLL>,
+				 <&clk IMX_SC_R_LCD_0 IMX_SC_PM_CLK_BYPASS>;
+	assigned-clock-rates = <0>, <24000000>, <711000000>;
+	interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+};
+
 &audio_ipg_clk {
 	clock-frequency = <160000000>;
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
index 738c6f05c4ea6..7ecb3be730b2f 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
@@ -6,6 +6,8 @@
 
 /delete-node/ &adma_pwm;
 /delete-node/ &adma_pwm_lpcg;
+/delete-node/ &adma_lcdif;
+/delete-node/ &lcd_clk_lpcg;
 
 &dma_subsys {
 	lpuart4: serial@5a0a0000 {

-- 
2.43.0

