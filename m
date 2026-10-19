Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792434412;
	b=2fopdsVjVEZzMn7fKvaa93sezrWGcYWvMfmutWdUgfhPobPBUmIe8K8MqTY0z88mZ5Zd
	 y7bfhPTRaCJEEQUg/pK8ySAPEUVzL7pBtrp5kMzocvYfF+61+wWzWPG/arH/HdNzd6fw0
	 Q9brjm9IBggjRp5nj9mpu1S+SW+XSiOk/C5nGdFW4pEVg3fIGvJGNmhzb8YuOqmE9xRJk
	 LWR3qF2WzX5A5cPqCophxWLrPw0984+l8fEIcWrtknlWODLe2bLwtTYucQpoLs2sneoPo
	 Wkc6pYjmxEzjNTOoDm8IOC+VB446HOFnoFMAHMCgmY1r+Tl9AvuS7EH1IjZUKV1jFFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434412;
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
	bh=kxRbkyT6PHDujjmSogVF6TYgY5hv2ktCzyf9M2XDxT8=;
	b=3cRdP5S201Yz5CN1x6cDnIAK4rEhay9yO6UKJzGYKRhKm7f7eQexyOayogIoMqNyptIn
	 isB1+REktWj+EWBQ88eBWlS0MupsqaEuJKE1ymMLGSCsRf9k7mNebPPHymFdn5HCQyEYE
	 RDlVt4oeIuYWm3MF13uDRrRJVdDh6lNFkXbBsTS5EhU7Ch7oVKotGwBZ3bT4RH+uO6skb
	 HJGD9xObV2dbr5nE8xOj7qakL/eJkc2x13XyK2CWYy+P5oCulRS/KPRDQzJV8aHMhALQU
	 pz3DFaS5x9aEsIxCGpHU40OPO9JFhGvKKuOW0dMvQXwjoMJnrTV8rIJffktBHS+6+HQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=qeTGdOcx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.60
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011060.outbound.protection.outlook.com [52.101.70.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A43606A31D;
	Mon, 19 Oct 2026 18:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47A43606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=qeTGdOcx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mULOU4rgd0zkr9lPhXGcXuZadQSh5sf51SeI7uhYiCAO8pGGDSl6fmUAoDFmKlqvcz4GR58Psdw851FY5HDHoYCxpecd3H5O4b+2gwmJF6kwDldKoBCakypFjM4UEOCc0IekQ0fFt1z7qPkWTc82LGdg/vy8gLiZSfQG2OHfyEq9arny5NK5uwKiUJlSWUU8M304luoHK920qNgjLxj84E1fquKVfoD7LJUbKU3XShpmUi5jjWTYTEWiBQG9jiFESRnnS6VxK6TkBKSNhJjHIoDuOJ7dLd0VumIQWAe8Q7QaosKrA95GQz2Df670t3edYB5lAW1g7JFcYriu5ek96g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxRbkyT6PHDujjmSogVF6TYgY5hv2ktCzyf9M2XDxT8=;
 b=cm5+clSz5DcJ9a0fd+7WxEukhPdpPUbrcishb/HHrJkCrtDmKTYxuWjUFHdg1rlOZr38nGQHOEDPBGDt++CqQ+xZeChGVE5hCEfUJaXL9kd7k6aLzpKDpEOJLlUgu3OMzy3ye7IUJ4OTiUg3jvtLntui6rfk6s/bRFjIPK8rAdJl4FVjXmiseoAezRLMWrF26rYo4+OgT9wzCM22sNaCzq0DFstA2/1zqc2xvJ2Pyqm12PcvG7ozoagIF7gIKn1xoMGWTtFtrSbjWjGIW+H9NwyihtEIFKHsuIEa2HjlaWHKxOgI3lOb+KVCy74hUHOCtk4YMQKCIcCxWBIeFZrj+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxRbkyT6PHDujjmSogVF6TYgY5hv2ktCzyf9M2XDxT8=;
 b=qeTGdOcxxvdtaQAgabZnGkgw8VtScyXtfJeCJSs7/Bf7TlUbjudlgE7EcIvjWy7oqu9fcrNiuX3Tv6ZDgIgArXWPBL9bCXccrYrzh3AFET5Fm9DjDa4N/rJvfPEjXcf3Q0uEic/63I07sDmT6X+OrERLib1gxn0ts4KGJYaBCoihgOd0wntbrRVO1sqDyhxjGIlFYsQjVUTvkk53FHQK/6lZUbf1XTsp89pYbDDDTMInN9R8T9RYcJz19grumLecH8Pkiwzk2LUaFWbhlwqo/I7jAohMkpfUAqQkHBQL6hFWEkYm90M5QJ+a78tJDkXb+PyfNgKR/ac6OYSDHACoWg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB11557.eurprd04.prod.outlook.com (2603:10a6:10:607::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Mon, 19 Oct
 2026 18:26:50 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 18:26:49 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 19 Oct 2026 14:26:21 -0400
Subject: [PATCH v2 06/13] ARM: dts: imx53-smd: change compatible string to
 dlg,da9053-aa
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-arm_dts_cleanup2-v2-6-dcdcbe6389c1@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792434379; l=1043;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=qd92WqHOI4u94VSaLckCwcWeR3x3cPQJS9G5ccZsukc=;
 b=IuWIaJHgavKxJaydZBInPelQ5gARbh3zcLazenHJQUf6K23xQesfngheJd/ontjvZ/BobZS4r
 i2qXpgIjuM9CPqEFWv8DAvwDA6A/e1UmtaiXO1MJBZjkcqbksHs49re
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS7P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::7)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB11557:EE_
X-MS-Office365-Filtering-Correlation-Id: de192104-b561-416d-9e23-08df2e0e8a89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|7416014|23010399003|18002099003|22082099003|3023799007|11063799006|261009221727099003|261009220027099003|10067099003|261009223327099003|261009223027099003|261009221227099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	/ww+RvAznG8KGToid3qoMjqD8aQ6EiJl1qHr4TnYGbRjHcN54tAIM+c1rKZvgqQyHMl81MFHzQXWv9dPP72x2s5ZW2ZqZCZ6nwK8OiNbz61eWtbTxZDzfHD5rdDSWY5Ljx7g6NFdqewXTrVyXktvKNVC7AH5vfgdF6jdp8DNyQML6AG4m2jxotYHQIvB4XGWt0MFpeLLIMmzochVhPyBwz5dR3cBabbsCG6SggY29TA6KP0SHbwUFOHyynqIQ1Cmgo3JPlArqGQcI40hH74ArjfVfjV6ZWM4PHnKUD4hz540IA51FvIG+JG13W/nWSVnpe2mPcY/lnBA8Fw0dleKtILpNWKEMEZpQrW/nqF0sXVooeslZuGtKuU3AZD7NwZxnjni2r11jJfY8FreU75yAUlujRTK5/y0CQWK9piITU/280yZsyLoyaBIwix2QQ6m4KxN9N3OHlAyKVDARVUk6F0epVHpGLgtekxhmv1VR1vtTpTDTYX1EBXY25Ig4ukP4G4/TYmnLiBjsaCf/oYvTEODXaL1wUx0PkXAG6nGQ8Qvv5gtyq8xzr2Twg612J29/HCMFU3IYE8t1aHkaY0JSvLrVHRw5L3SCNp80OGkEeytO0O/jTfIDUqKJdAEKH8P
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(7416014)(23010399003)(18002099003)(22082099003)(3023799007)(11063799006)(261009221727099003)(261009220027099003)(10067099003)(261009223327099003)(261009223027099003)(261009221227099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXZzeEQzQ2hQb2NtV1VyeTZRM1IzcWx0azRWUTdvRjNaM285WTRIUGRXOVN0?=
 =?utf-8?B?VUV1SWN0TWZSTExDVEluN1FLWERXdVhDZE9mNWpHSzlCVUVUTUNrNGFEemNk?=
 =?utf-8?B?TE1USENuM0lwczBrWHkrWmFZT3RqYlhnTi9JNTJtZHkxUXQrNGxERXBsWDV1?=
 =?utf-8?B?WFYwNE9CSDlRWmN3YVprU01STG9wYWFVSlM3OUdnQnNwTy8wbnVGWTY5SVpD?=
 =?utf-8?B?VmR1N1pOTFFsVFVrUmlTMWJlVkMwdDJxYkF4cWt0dk9wNG1FQUJ3UU5kclVp?=
 =?utf-8?B?K0ZhdDBFSFRONkVONEl1MmtTaFNzQTZCblNFdXc3S1pGVmJaVnNhNWhCNkth?=
 =?utf-8?B?MXFPdndoWU5lUGx4YTNoWGxPRFlpWWJjb3BabGxteVBFZDZqYWovME1yVXVh?=
 =?utf-8?B?RlQzZUV3cUt1T2hKekFiSGFQWHNhQWhnTGxTZmxsb3crTTBUVlZoaytOU2py?=
 =?utf-8?B?VUgyYWhUWEorYzkxNlMrbFFkNkNtWXZXL2JUSmQxcjN1QitEUmcwVG9LYVV4?=
 =?utf-8?B?QnUwUzR5K21vclRjNDM1VEF5bmQrbGZWUGpKa1BVVHBDakdnaDJsbVpOanp6?=
 =?utf-8?B?bUYzZXNKaXNDSm0zWXBYdXRlRVpJWmV0T1owazZkWVZsNkdvQTBxa3dva0VB?=
 =?utf-8?B?ZzlXaEpaalhSM3Qva2MwUG1OMU9ZNGRhd1pNcWVkMXhieXE3YkM4ZXRrWjVR?=
 =?utf-8?B?Ny9XOVFzcEZueFdGcnJOckE0UDgydXhiTmRiMFhyQVQycG1qdEdVM0VvTEVQ?=
 =?utf-8?B?K01xNTUyK1NYelVTUnE2Y21FaHdxWnVUWENMaGQwRHE0b0N1c0dnYUJhMEti?=
 =?utf-8?B?cFQzNTVCYnhTSU41dUNCM3pCQlpkMW9UdGt0M2NTcU1YOENDd0RDNzBFc0NY?=
 =?utf-8?B?NEpSVlJLeFpmSVBmeTdWOFQwblRZRUwrTHE3N0xFdkszSTFhaVpNUnFlbUdV?=
 =?utf-8?B?eUgrTldBZkhMYVhZVUVzNW1DbngrTEV2Y2FPbDIwb1pXY1ZIYU9rUFhvUWNi?=
 =?utf-8?B?MjduZCtjS0lHb3ZpQUQ5MlcrU1JKK2xmbkI5Z2tCQ2xyK0UrSGFkem5HRStv?=
 =?utf-8?B?QWpIOUtORUZPamo2OHNCeFFlSkhWb0RTMDhNVk1ROTdtRmhNQ2VtcEpMRUNB?=
 =?utf-8?B?S0JzeUR6dVdZTklIT1BvcHp1cVFXU1RLN1lJNWY4S3VEdGNtdlFqM05wSHZo?=
 =?utf-8?B?eHFiSnhDbDVkWDZzTTUrZStwRXoxWnBTRVRVcHZ0bTk4VW80U0hkQW5oMmJv?=
 =?utf-8?B?YzBXMG9MdmN6WHNnQWtLdUxOb1h0b09UZ0tKc3FiL3R0TmdwRXRLZFRsU3lR?=
 =?utf-8?B?Sm4yczRsckZlbUVIQ25NSkl3bHkvZzlPMjhFWkFNZFJ1VDA3Tk42d25EdEFW?=
 =?utf-8?B?dmR5Ri9oaXNJSDNDblRac1d3b1dZcUdNTUVub3JTWVFnQU4vMHF3eHB1bkZU?=
 =?utf-8?B?NStGV3ZIV2trV29IbU1Xb2xKcGkxVHNtcmVscm5PSkRYV211VkZJY0doNk9m?=
 =?utf-8?B?aDhMMHhtWGh6U2xKT2g1eVRxR0w3dEdqMUNIUFBkcWxmL25IQW9XOTBzRGJ6?=
 =?utf-8?B?UFFBamVYazNuNW1OZHBsQXc0MEpyWTR1a1ZSV2dVbVlmQ3dSUmZCNnozYnVx?=
 =?utf-8?B?TTNRalRMTjJyT2s2UXVLVTFzdUtIbG1CYndOL1VXZ0thOVZQYjRMdk5EVTRG?=
 =?utf-8?B?dmdUVUdlRnVFODN3dk9MUEtWLzREOUtPS0p1K05vaVlrOUJ3bThKSm9aQ0R5?=
 =?utf-8?B?aEo4eW04NjQ1L0JUYjZUUEpNZXVIV1FhcDExNEc5Ukc2UHhoaE1oZ0tUTDVv?=
 =?utf-8?B?YmQ5ak1nMk1GUlpCM2RORWpxYkdDTFE4cVg3L2JOektBRm0yMlh0OUF5dW9Q?=
 =?utf-8?B?aTlvMzRIT3BpdTFUeG9pVVh4UXE3RWNndnNpcHU3SENUelh0R3dFRDRGaEpt?=
 =?utf-8?B?alp6V3dGeVpCaFhkUFpxQ25SMC9jUDVGSElOKzdITklKMnlRak1yRm1md2wr?=
 =?utf-8?B?WWVUeXNuamc3Z1YrUXFnZTV3MHZONEwyNzhmMnJiYjNmc1pXeE1SWjNxS2F6?=
 =?utf-8?B?cFhOSGJyamdUeDhleUtkOEIyNVp5R25ITkhWWTZMelNNR3RWck5WSWJxcklu?=
 =?utf-8?B?Wm9nQkxxYktMK0ZuR3NGeVpDQ1lZdE9qem1ieFI3SFByTUNQempnL2x5VWw3?=
 =?utf-8?B?SGZzWG1DTUZGZng3ai9Zdm16dlJmQUtXOU5KSldURHdWa3lLdXVxRW9wSml4?=
 =?utf-8?B?bnNKREQ0N3NLdHYzaXpDMHpaNzNsOXp6YUJoTzhZQmxRNW9oRFRodTgxY2lX?=
 =?utf-8?B?T0IrdHFKOXZ0SUxQOFBxQXpuWGdXVmYwclVjWmNEYjYyclZaR21URWVCZ0F2?=
 =?utf-8?Q?miSm4QdciqvORJxj91ZxLsoMZGYTS7pskOMS7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de192104-b561-416d-9e23-08df2e0e8a89
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 18:26:49.9209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ocYFa0/Sf9IHKv1okvv+cIq4957CBbAJ4/x850+KA/Uy+oLHo0mjdUvAHY6DlsFTODxjk+ETFmZFXKZ9AwE/uUKWbIKJAmePR+9NA+xqRN68OIgIt0XOOYQqeHGpuCn/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11557

From: Frank Li <Frank.Li@nxp.com>

All imx53-smd use the same PMIC with imx53-qsb boards. It should be
dlg,da9053-aa. dlg,da9053 is not supported by drivers and wrong fallback
to dlg,da9052.

Fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx53-smd.dtb: dialog@48 (dlg,da9053): compatible: ['dlg,da9053', 'dlg,da9052'] is too long
        from schema $id: http://devicetree.org/schemas/trivial-devices.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx53-smd.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-smd.dts b/arch/arm/boot/dts/nxp/imx/imx53-smd.dts
index 29d38484cd386..aed551566683c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-smd.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-smd.dts
@@ -323,7 +323,7 @@ ov5642_to_ipu_csi0: endpoint {
 	};
 
 	pmic: dialog@48 {
-		compatible = "dlg,da9053", "dlg,da9052";
+		compatible = "dlg,da9053-aa";
 		reg = <0x48>;
 		interrupt-parent = <&gpio7>;
 		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;

-- 
2.43.0

