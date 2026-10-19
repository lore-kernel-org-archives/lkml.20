Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792434395;
	b=4dNOXZmmtelDFZrqJfJwUM+Yi/v0dIn2RRXGja+QyEOXMzqQ7KUFmYM6wi5RAYQd2Tr4
	 YK01SmdxixbtVKT/kn5ZiNI+Hnq1CFmE6pd+pWZ0mZkdW1CcTl3/2HXR1uucKig0gJKQ6
	 kWlfD1btBkEBZjRlnfaDiZ1+OSL7IhfzKfwsOB8PVmEiZrC3DHRahCXk42I0Oc6Fpvmym
	 FKZzB+9uHnr8OcFzlamxlFdneCZKNby2DPHkCCJe1RABQhAXYshLkCAS+KkSYAVRG8bMq
	 vCBP3bIBZ0fo+zWWNJokpRo7yLAadzhcjNi79HLzI1a6NG7wg8XHWtk8HUteysWKraw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434395;
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
	bh=dZHRycthpCuEBv0Q4Jbyr2GkW+a96GEvpqPXcVrEfRs=;
	b=0pAmMblMFosmrqTn7hYJ49zUzxX5i18xO9SGMdF5YmcR2U1pu9DvwwKF4XmplnBG5IMS
	 qkEhFFy1xKsjdMu+bQDTBcowXVClA2EUJ3sEG8lLyQo8zzs/ec/9SW2u5uzZ4ryvFMNbN
	 z7mMf29kW8UQ+ynxHR/xZwlFBGa3LKBWNILR1XFwmYYcnZUI63bpodugHB965G9QHbjmQ
	 Zw1lBnLCARDYokwFPXQ+vU5465hs70uutVuSgOCeYajgrbCRwkE5GuSOjUSV5aNMDDbSb
	 IaqPPih8m4VYtrXbSJLYXaZyMX0BkQkBNQnQwd2bzgbxNpTq1mBeSql4yY5W4x+JpXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Uvp+a6O3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.36
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011036.outbound.protection.outlook.com [52.101.65.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F17606A335;
	Mon, 19 Oct 2026 18:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0F17606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Uvp+a6O3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BsXu9c55tvcB4f/FQDTBQ5dwY5XsbFSi3dXv106ZvfYx6R5AKwpS5v6lEhPtDV/3xhcafl2jMa9kKN14iqalKR+JkCg3ISjGCqZI+mhWXWQ6G0K6wkhzPaDI/O/PfpnxbakOr574k2VF8SPy8LgIuF9+HZTNPKyhbPVuiAWUANbZDMiGPnoeS7nKIzWTl/s10Z0LZ1tLskVrlWL3fFZuMPO+SZccUIU0VGTJP9J17tO0TlVBnOdgMJGZaPZcWByWFxfwGxedQ7W94aOIwsCxNNkY3VCMNjplJ6L8rphMQ6zEERt+Nx8KFw99y5xSlOepj5GcZ9ScnGL0xNLpuMo/QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZHRycthpCuEBv0Q4Jbyr2GkW+a96GEvpqPXcVrEfRs=;
 b=xxzX1QlRo4NAeoI6H3vDVfxcAYZ6/+CcC5XfvGaFkZLvVWJbNWQprVpsK/A9szggGyPEhU6J6A107CXKas4Z8JlZwPhTmIc/GZENhId2Iyu+gnXIpdXK9Kco/wOc8OSUm738WNy3llhkxY3skCd7Mykyh3P/ROOJ7gIALOj/IOrT1a3ZFhitNXjF1WmXcQ5Fq9H29T+AMM+0mc0gc/tgNPXqCiysW4fUxpy4N/VkXt91JNh1VUVW3InDUMd7Gk3/VfYEPfExI68+8shwHtuEam4ePNofHwUA/q3PObsID8Zuc/uCX5xqDsPesVx+6w0qV8Ce9fhj9A1cxtL7BzZthA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZHRycthpCuEBv0Q4Jbyr2GkW+a96GEvpqPXcVrEfRs=;
 b=Uvp+a6O33taIGIQCW/xN5xQx63WepRP3LAWdoGVnYYrbMkpT6AgSVOgv10DZ2gih/QIwTLv9dHT51GmL91tERjwnCys2fz4jSr+W8z52+kDDEBqC/zB9CWsR1P0W43U9Bbm6Bttc1nOY7qc6OqQRS+Aie2ndFYSmAWPTbXe6qZwteIfpKEsu033sN27ZtZ8+tSPbOGZqVf8H8Ezhe34en65xkgbBiEedWTDRXUeBjKwVTgfXSo3L99WWWERPiHSQY1e2H7ImTWBu8Utnlvp9gzrpu7J0gc+5OrC0kgeCDMOnn2kdJVzjbMcjilqixrgHhF9BEUzwDoZVVZyplMOn9w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB11557.eurprd04.prod.outlook.com (2603:10a6:10:607::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Mon, 19 Oct
 2026 18:26:32 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 18:26:32 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 19 Oct 2026 14:26:17 -0400
Subject: [PATCH v2 02/13] ARM: dts: imx50-amazon-yoshi: remove undocument
 property min-frequency
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-arm_dts_cleanup2-v2-2-dcdcbe6389c1@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792434379; l=1002;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=hJFdYvlX7yurHz62NsUgayGclSwE0M0gQjysmZkUXE0=;
 b=mGNii7ZPJzodmg1mrYeM+bsUaLt625VQxxeZwNdvJlm7ytRYkCE9AJlgs3agVQ6H+oe3QVuQI
 aaVD+xmZWAIBhXKFXRTumySiBg3CK54wHpBw5k71w+ILNAYsjYypxwy
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DM6PR03CA0094.namprd03.prod.outlook.com
 (2603:10b6:5:333::27) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB11557:EE_
X-MS-Office365-Filtering-Correlation-Id: 65119423-f00e-43ce-48d0-08df2e0e8047
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|7416014|23010399003|18002099003|22082099003|3023799007|11063799006|10067099003|261009223027099003|261009221227099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	0L3nUW2kLISEsHkyDxYlZ+k9Dj9NFoUcR74HrhOdQFw9kYaxy8BYiOGWQecnrbfAt1U0YXem8Yw7Hnpnvp/vlJNy0XjRp/U09AEknO9apkZSSg9khT5KNazuoPQ2KkJBhGmbjn70wxGDrEpvdx0zotUt+Q/lJDYsOJXjyR/VZNGJxXF4b64THNstq4CZIsFQ3eYeyHFMSA9L5mUTgAns2cWU4OYhGLVFqLDpHpxk8VUtbKOlzOFS65ncTD3w/r3PZ2g80HES1setxp/vmtEsg6x8XdjNm/42XnhL8LZ9sYmcEIZ9PN8pNwcwdmt5rBOPXNpo40r9HfJCIw67bAjYCsBMaVFqwprxrIJ9mN1SKObjmbIGYBHYZCg27UR4Z2HyvTCiSwKkwqNLo7ibhqdkQZnuVEj0MaRIKNw19J0Czd9b1ViLGTSmiigxgRsEjNUYg5S/0244BwkBrQOkUpBNwpsl/RfGnushBjmgFMwYKaBi1ftGl7IuWAHnQGH7oj96x2qh6Nh5y3j2soUTRgoVyLLHiY4B6HU9Sg43la1iQxcTGcbJGmxLvW+lw0iflGns+NhRvH8Fmt02DkV+r572/JPYL6luRu8qrlog+bp60VI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(7416014)(23010399003)(18002099003)(22082099003)(3023799007)(11063799006)(10067099003)(261009223027099003)(261009221227099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0hhZVF2V3V3WVJMa0VPTVZVTGxyN3hRTzFubis5amR3R3Ywd2QxVExRcGcv?=
 =?utf-8?B?ZmkzNnRreVN6bElhd1d0UmdNQmlyNUk1UjZDNlB3bFVGMi9sV1NNck5pZFNG?=
 =?utf-8?B?NUZQaEtrVXZTbEpFU2ZtbnJPTk1CdTQ5RnJKTGkzOWM0TEJQN0g4eXpXSTgr?=
 =?utf-8?B?OHpzTmNBWklkU1FWZ2xUeUVhbHgyNXMzT29rSVNPcDliaTBQYnVtZHFRUG5k?=
 =?utf-8?B?QmZoWVo0TDl5L1k5OXd2eW9KUXhUTkUzeERWcFczUjVFc25OWHRqZ3M1UmxS?=
 =?utf-8?B?YTBXZXJKTEJzdXpaa2JJeG9NSUU1Y0piWlYvWFJuT1ZWNnVHdWpmQ0FaQmlG?=
 =?utf-8?B?VkQ3SlBIZFNGK0JYWnh5Q3ZRNlFTMDNnZ1hjdEwvZGhZLzFWeVlUVmluSmJV?=
 =?utf-8?B?RnVqcHBwSERndUlodXk2VVV2VWZuOVV5M3ZOSnF5N1UzcndrTnF6NEdlSVY2?=
 =?utf-8?B?a21zVkR6K0d4NGtFeU5RTXRuZFhPY1lRaDZpYi9OdVFuWmZvMHNRS0dKSFIy?=
 =?utf-8?B?TWVJUmVDU1o2VStEYWJNQnpsdUR0aFdhdThDdFVCZzlXUi8vRXo1SjdjQW03?=
 =?utf-8?B?Q1graEZXT2N2bnVUbjNNWE15R2ltR0QyM09nYk5jU2luMUQ1Uzd3dWZFS2pw?=
 =?utf-8?B?Wi8xRUJLbE9Zb29BRzYvSXV0Zi9oQWNkUDdRV3RiSXB5N0s4NkJSNWRkSWFI?=
 =?utf-8?B?WGRTNnNoZnNLV2JBZ1FQVjFLcjJRTVBpNmE0VVkwdVZmSURidGFGMCtUQlFa?=
 =?utf-8?B?SXFFNzhodWY5TTErTjhzbHFxMlZLSWpuSnFPZktkV1BBN2lrWVVGZnBqTGxh?=
 =?utf-8?B?WXJhblFTK2UzNE1qQkhTa3BnclhFNWg1aG0zNGFCcGtPZ2dzVDFHV1dmekYw?=
 =?utf-8?B?UVhNbndlR1pNRFdBWjBDZEhEVUNyTVFtd2hyNlRGYUs3QWVVaE9Lc1RLeXFW?=
 =?utf-8?B?YVpDM1ZHZ1dqaTUwUTNNdlVQbkV2NzRxU3RZdXBlYVdsUHdoNnFERU5wYXRI?=
 =?utf-8?B?d3k0Y3lqT0JoeEszK3JOTGI4c2R3c3J6N1pOYmpqV3VidVJmaWNNaVVzNjQw?=
 =?utf-8?B?N0J3OEc2UjVQTFdhRDBJbFN6ZngzUitaazI4R1R0dkRkaWdOZ2hlRFRtVEJw?=
 =?utf-8?B?Q2lMeUtKckt0VFNUOFV4ekJnWVZ4L242Zit5Q0grZDFFSU8rbkF6N1BZbHg1?=
 =?utf-8?B?bHhXTTV3azZnMytVYkgxQnVGSEp4TEhVYkEvcmgrbHc4eGZ0emhkbGdWVkVK?=
 =?utf-8?B?bWQ4eEs5cDZGNjVIU3NwRHg5ekg1TnJ3N3VTNEZrNjFyU2FDdllqY1N0WWlW?=
 =?utf-8?B?bHVudFkyTW8zeGhJNGNHU2F2d1c3Z3AxaUc0RllnRGRQajdUaVlOd0lnRWJL?=
 =?utf-8?B?SFo1TE9mb3RyYnFzL3QyYnJJUkJBN2Fadk9nc1pNT0dZU204ZCtwZjM2L1RZ?=
 =?utf-8?B?dE5YY05QSmJxMHVXcTNyNXZ0SDhMcm9MTUowL2ZiaXNOcGdlbzhTTnJyTzda?=
 =?utf-8?B?THJURWQ2Tk9WenZDT2FTSmU3bHM2SndKTy9aWGtSaWF2VUNCNzBKaW8xQVFZ?=
 =?utf-8?B?a1dscmdVMjBoVng2L214MVFmYUNVSlpMeWZmRWFhVGZuSDVJRFduQTJWOEhQ?=
 =?utf-8?B?dTVhTnpWdFVBMEJkSVFqV2RkOU1iUkFZeEJINXd3M0RoUFVodUZVc21DVUxB?=
 =?utf-8?B?clJCUnNhTDFKckJ5NGtjVHFXV0F5R0pvTm15MzVIY3JqZlpZWFFiQVVBZkNi?=
 =?utf-8?B?MDdkRzZIcmN1TjJCNkdGNm5aYWI3MEQ1RkwwUHZOWTV6OExUOWxQQU5DNDBY?=
 =?utf-8?B?QjVoa012TzdEdHpFNWZnRTVOMXFrTmJhKzJzTHBRSlQxb3BqRklEOW1QU1BX?=
 =?utf-8?B?Z1Brd3R6WWVsZWxTeDdudEhQc3ZMWFJqUVROUjVsK2RmZFNyaGtzUmZXOEVB?=
 =?utf-8?B?RkRiaVZCWkVEam5rVnAvV2VWMEpOai90K0cwbjhxdjhYV2FoeFg2Nk5KM1dk?=
 =?utf-8?B?dVg2YllxSVh3ZmdEb0N2OU11ak1VZnU0dGN6UGFpb3RZcGJSdnhFOFVSRVE4?=
 =?utf-8?B?ZWpsWnRyVGk0eGJtVDFjNmkwWk9qL1VvUnJmbllSVVhHRjFaOExMRWk4LzBv?=
 =?utf-8?B?cDZKQzBMWWJJcGd6eUNOS3h1KzV2cDgwc1RuN3Yva0lrUnRhQTZUY0RsRTQ3?=
 =?utf-8?B?L3pGRTlDZnRLVzFKbDMzMURWcmU4RTkzbnVuZFJ0Z1E5d1F6RkVyUnVZeXJD?=
 =?utf-8?B?ZUQ1cExxWjB4d1lMSUo1RkNXUWZtQ05pMmZ0eEpvL2gvRGZlc1U5OElOckRh?=
 =?utf-8?B?REEzYVh6QXZKdHozUWRIRndndTh5N0FyVXVBZWJ2TG1vWDZmbi85b0RUN1lM?=
 =?utf-8?Q?14jfcqj2B4sP2ezK8fj5hR/qh8Cq2+EbP+qnc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65119423-f00e-43ce-48d0-08df2e0e8047
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 18:26:32.7085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AJG4HizMkuU+3vpgr/q8ON0kkimmN4CHfjxNdgzDSGSh5rarR7GKSCJ1tP8xdZKcEskbLsGv2qsOaRvcbookCbzykzV7V3MRs+kDK7Sw3BUX+hUzm85wYNGZFHXJAqdx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11557

From: Frank Li <Frank.Li@nxp.com>

Remove undocumented and unused property min-frequency, which also not used
by known other user, such as uboot.

Fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dtb: mmc@50020000 (fsl,imx50-esdhc): Unevaluated properties are not allowed ('min-frequency' was unexpected)
        from schema $id: http://devicetree.org/schemas/mmc/fsl-imx-esdhc.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dts b/arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dts
index 417972ad6bb3e..0b6d0ba65f957 100644
--- a/arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dts
@@ -21,7 +21,6 @@ &esdhc3 {
 	pinctrl-0 = <&pinctrl_sd3>;
 	bus-width = <8>;
 	non-removable;
-	min-frequency = <400000>;
 	max-frequency = <40000000>;
 	disable-wp;
 	status = "okay";

-- 
2.43.0

