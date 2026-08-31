Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013005.outbound.protection.outlook.com [40.107.162.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C04C453A57
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788187318; cv=fail; b=soBNfLa6z4hS5Kx3q5nW9x5BpBSHduvfLNcoR6qt0IyC1H1iN8Y0+yV2OouyQ44Z1RAN1LtoZ2F7c4pIZ3vwi8trfIA5aF7jZ/mqvZehDwilV+XyaMRsrgj7ubfhfJTxq3m7sJ3M2aZVsN/p8GOnCGKu43zuLNtLPl7Xp56J6Vs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788187318; c=relaxed/simple;
	bh=lxXIv+baONGw9kHeCAwUv/mx3Eso6nU93G2uibG5zFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iKEkhqH6P3Jvi89kribjYNU3JX8i6uTneH2PagWHO56dRJc3YqEvTrnKjdBaL98dzTd49WfhZo1zECyk9Bd1aiPh+tnOamwrbNMds+jPoGRye70RGnncZ19JeqFG1MlO1bFNBTBAU5J4xj2Ks4gcqMlPSpNGGjx+Sj/Ra/rPLdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=q4H0ESru; arc=fail smtp.client-ip=40.107.162.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="q4H0ESru"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RFSg8kYDP/DuMkm+Imn/49qzBh+yP7mfxJ+YeymcSeQ9pORpBgc7a3K00liy2LvjhE7gk7fR3+ClG60/dcYJ3+wWQA0spBR7psuG6jqWdJJD22+3aUIQjI7aenqXlhMFcRXKcuzp40wAC3Zx3fgMwK1hBOdWRVvURohcC/3I4drf23XMpKyxF46cFRrblD+AvksVnRhw+cifvHOh2LPtxJxVz0LzkOSQSZBV5eRbR/OrRp+ZKFYD0XebPN8XxzDuPLRC2NqkeGAnV4dYr+sX6WMxGI7CN7/hHANvCrdJLKIlwobg+o2CN5uJKFJJvRgQ6ZzhkR3rgmyEWvXltxcqoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5vJYxu0IGWGEeXEBXvGXYAeflETM7pYKGoCl7KsqN8=;
 b=fL06ejMl0ALU9BIFhHfkDWyi7ufLX+XAKT4V083nEfwOwZ9jgRM5gFoLcapIAR5tho08Ugu7ozmOx0Ly4vlhUSbhIgef1GB+ok/ya31TzOgsUDKTHpqlckHjtHx+tWkvJrZlUUNwsWwy0PezYFe04P3/rw+qCH/zf6Upis5rHG6niWueGV1TnmunZetAbc/xKXr5TOss5mT8lG8878w7XHuurUgRGFZ23S/DrRtwau0Upkh9u39qZPN0gVhf4oqhDKIcI/JtPhjYAfhjBsOsLIAbbi9NV7xyjA8laTOJ/Gc8eAJsg251V1OAUMjXfCRRhiwcBto31+y1TINez3pL6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5vJYxu0IGWGEeXEBXvGXYAeflETM7pYKGoCl7KsqN8=;
 b=q4H0ESruLM95BXoBGFsSN6rK6JtP/cKvSnzWUlaEPnQqxfs6IdJXjZFqkcNihJQ98LG2TcBHfHPVfKGCDgzaTrw6uNxyRoYr5wl2i9Y5NRQ5AN7XovZpyboTKqZ+GNSSOqAi0sH2aSxYbaruvFHbTxNdXnsDqnC7ZNOj/y8ZuLApfASkP9XPDMy7Y6qUBqL0yb6oOs6muwGNIazgAOBwmJFo9SriyXhHp7hMuI1oSBsfNM9bD0YLXU6hv0GElmgdbILEFXR9xP0FhhykFKpk6TJW4NFslLQsWJUvYcvwltm4CuornWWKXHywrW9lua1+Woheo8HPbla/+nY+xssX3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MIWPR04MB343215.eurprd04.prod.outlook.com (2603:10a6:290:d8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 14:41:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 14:41:53 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Thomas Huth <thuth@redhat.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: imx: Replace __ASSEMBLY__ with __ASSEMBLER__
Date: Mon, 31 Aug 2026 10:41:45 -0400
Message-ID: <178818729836.3982998.9736739328494712393.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821082809.185110-1-thuth@redhat.com>
References: <20260821082809.185110-1-thuth@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0PR07CA0015.namprd07.prod.outlook.com
 (2603:10b6:510:5::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MIWPR04MB343215:EE_
X-MS-Office365-Filtering-Correlation-Id: f68233fa-0f90-473f-e57d-08df076dffde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|19092799006|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FbwCxCed6LsvbLUuGq0261eDAhUzwD2J9ptcmb7rFyxGh92WpBZcCAz2PlVQflc1hoAVnawdIqnDb6vtRuEda6RoXCjauNyfR6jJPJA42NeV/C27N57Pizr5pEmBYJ7H1tpuY5MewJR76riiY8PJklQWhm419mnhbo0eNvE40IhiBJzcnh6K0MFQUB6L+T1lS0zEmU5PLeebvippZQN2mk6eZQ0CZNKAMbHILjThuNBr6cl4qOPK+Udv0EQnOoMx74/Yg6aDOLZZFyBubkP+FHHyVjKxJiVzAMVxk0dmirgOp1x3si7sY9Dpztj9kekm5Avj5QLK55eGV5Fv6IDxBLnlDFCpe+jdqyUrQVF2XzNe9JX1etJ0+QeUDrWBGuLHSAf7MiZocWy06VWtlsuFv0YJZxGmKZJ4d6KWgbYjyQyk9x84ehQ5xG9XSItgpJNAMySWyoxOtwitDZxZl+EW+379NzRtq+U+2l7fUCYqPJ6gedS4adUvdGFXz48d06ogz29NfiASZi+uql/rYP40bIuJjnA2Ue3XTvNuv8EFNLozM+q37BKvjzY8v7L7XoI/Qtl86POFg0P7GbpXYOKOmNbHhk4bDFBu/W5BMuPcx0t4PTNxvGpKdjFgdKH7Co7bPFYsB4hFwr1BvYHN2FpLCgYDQRw1HC5VXnBHP1OcX6U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(19092799006)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVE4K1VyRkl0RmExNnFYbjQyN0tlSVd2RkxMeHFQMWFyZktBVm1pbjFhazcv?=
 =?utf-8?B?Z0h2dytXNDBzdFBueEltb2NieDBHckRUSFVkZ0dpbHkzdmk4MUIrUE5idGF0?=
 =?utf-8?B?VWdhWmcyTjlOZ1h1WnJPS3MvcFFVK2xoSys4WlI4VkNjQ1g3OUlsbTZldlFJ?=
 =?utf-8?B?TGtRRVRMVjBYOUpBVytueWZyQysrR0F1cHJEQW51QmlMUzZINnZ3YWJXc0Q5?=
 =?utf-8?B?OW01a2NFSGd6ZkVIV3dVdmd3NGVQY1A5WGo2MUVoVU9Fa1ZuMFBsOGdidExk?=
 =?utf-8?B?WDBwTHNwVHJnVUJNdWJuYWxkeWZVRkJweGVwbDlYbi9xT3MwRjFSaWJpUytC?=
 =?utf-8?B?azVIY1NOMHpTWWFLay9CTUd0TUEwb3ZzUDJXYlB4blNCeUJZaDdUbDg5WEta?=
 =?utf-8?B?RXhoa0s5L1BYTmtpaXAzckJhOVN2ZmtUakpCKzFPZnZvVUF4cXUvUHRMeDhB?=
 =?utf-8?B?VGQreEVvV01GbUNESVZqUzY4NnNyTnVtZ3JhT0VzSlkwK2t3Qi9iZjFVM2x3?=
 =?utf-8?B?bmc3dkVFcUNBSmxmNWU1MEpyNTh2OVIvZWI1Z08yOVlQTUZ2b3B6dTJmcDlk?=
 =?utf-8?B?SmtpSXBjbmt2RzlqSjJwVnlmRC9tcHlVYUJhOVNTZ0Y3dlhCcGFFRWw3RnNC?=
 =?utf-8?B?bTZwMm04K05LS1JMZlowWi9UWEIycUVUaTdEcDBiT0s0RkJjb1ZReldCVllK?=
 =?utf-8?B?cklRWmRJMDR1WHl4YmFXVzNnS1U0d1JhYkpUNGhJYlN0RWhjb3JGckhNb2Zw?=
 =?utf-8?B?TXdjSUVMa2diOFlQYjhDRVpjaGdpYlorc2x1Y3BPSi9oME12UTdkVlBaV2sy?=
 =?utf-8?B?RzdVZ2NEcWZXQVlnanQxa3RkYnMwMXVpVUJCZ2wrd3RUVEQ5Vk0zMHdyM2p5?=
 =?utf-8?B?ZW1JNi9WVCtqYkdKRXdKelQyQzkrT0dtMWQ0d3VTejVqaVNHaTl1QUx6S3pJ?=
 =?utf-8?B?YVV5V1pPOTJReHRNbTg1MXA4dUVoa1ZwVkNnd043MTBDTGhrczdlRGFYVWl6?=
 =?utf-8?B?WXdOaXVpOXp0V1dCZzZ3RnhoKzUxY1FvZllCSFpYeUNkNTZzUkU1cWp3NHhx?=
 =?utf-8?B?ekVYWWU0UU8zMGRESlpxZVA1Tm1NamFJTU5YcWhmRWY4YmRONFJTek50QmJu?=
 =?utf-8?B?akVpOGU2L2hIRElsQiszSXZvcVBTSGJaa0dHQ2EyQ29IWEp4TU55RnFpTk1z?=
 =?utf-8?B?cENtUjRiTG5nY1hFZ202R09ob3pZSlk0SzFqakZMQ3VNNWYrNndzR2JZbkJ4?=
 =?utf-8?B?bGVldkRHNVYrVlRRaUIvK1pDY2VXRUUvMXY2R25ueEowMUFBckJtaVhVTzB5?=
 =?utf-8?B?T2RidjlqWlJhVzQyUGppeEFSNUUxRk9Vb3V0ODhNcnhtc0J6RUNoRi8xK3ps?=
 =?utf-8?B?TXdRYzFzdi94L2ZTZStWYjUvTkhPVWhaRGhzZ215dWNHRlFXV0Z4N0pYS3hp?=
 =?utf-8?B?WHFqZGJ4aHJORXNaY3BOelFwN3BQbFhYUDJWTU1NQkVuSURmd0d5bmllay9U?=
 =?utf-8?B?cDVxTWdWYlM3cE9sRDRyYVJ1TlgyMit3RHdyYnpzSUpXUSsrd0xQYkxoaGdl?=
 =?utf-8?B?VzN5YnRhUmRsLzFGWFdEdGswRHdZc2xITi8xdUJwU2NKblRyTVp6aitQeFFU?=
 =?utf-8?B?TGx3QzFWQ0kwS1FQR0JaYUFzOE9yQjdRM2JHTjFDQUF5TnhaYWJKMXA5S292?=
 =?utf-8?B?UVdPU1U5VFZuVHpXVjAybThqWTlGMVZQcFhzNGNrd0dKNXU1ZXdQaFJ3b3Y1?=
 =?utf-8?B?c2J2aGtzWFN0eXV0RWJVaHE2bzNtcFQxdzdId2x4czdwYVVpSW5FVFF3MTE3?=
 =?utf-8?B?QytKT0ZBZUd2WTl0cGxEOThoZ0xqalhITGU4OXZxMTdJZmFKUW0yUUxHUlZC?=
 =?utf-8?B?dHBDWG5oOEIzM2Ftb2syVXBZbXd4K3dwSlFhYmhPZjdTUGJvSkZXenlid3V3?=
 =?utf-8?B?KzNRQlByT3JGWFZJZU9VNW9Pa1BUVDUvS2lRSjV0b2dibCswQ3JueEYzZ0li?=
 =?utf-8?B?cHk0dGMzUUFwQjhsWTFQWFVkRVRUdzZUbzduNkY1UURJdEc3OEFSYkJ2SytS?=
 =?utf-8?B?TTVvdDAzaGFkTW13SGtJMHkyUVp6NXdmZ0x5bklzakc1OFRPcXQ2YlI0NUdJ?=
 =?utf-8?B?VEVlakVnY1J3STN5d0V3bWVPRFpydkhBcEFaWE54aE1uTE5OanpTU1U2Y0JV?=
 =?utf-8?B?aG5sR3FsUENNRW1lZU0vUXBIZUlHU0paUlhNWG93MllQQXFQeVo5WFZLUmx4?=
 =?utf-8?B?R09uVEdoL202dFZrZnkyZ0N4bTFDcHlEN0JJYTZvZWhSbElwZDZIMkFYSDFs?=
 =?utf-8?B?aGh6a2Z0QjNEeTA2N0lLVDlYeEpxcXFwQmM2S0R0RHNReVRwWEtmZlFoN0ZQ?=
 =?utf-8?Q?VQIHw51i7umkH6zEfLiqQGlgAJP2PBedArEHB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f68233fa-0f90-473f-e57d-08df076dffde
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 14:41:53.8532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 69OA0ER6tWCXDyytUSP/8Sdss6aF0bSYmb4EyRynTYaYcbfoKZAEinJtd0EjQMEKKu414x6T0s0fyLndVE4h4UpLx7A2NWtcoB0YwHESAoMpl+Y9aCsVD615VuiBEouI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIWPR04MB343215

From: Frank Li <Frank.Li@nxp.com>


On Fri, 21 Aug 2026 10:28:09 +0200, Thomas Huth wrote:
> While the GCC and Clang compilers already define __ASSEMBLER__ auto-
> matically when compiling assembly code, __ASSEMBLY__ is a macro that
> only gets defined by the Makefiles in the kernel. This can be very
> confusing when switching between userspace and kernelspace coding, or
> when dealing with uapi headers that rather should use __ASSEMBLER__
> instead. Let's standardize now on the __ASSEMBLER__ macro to avoid
> this confusion.
> 
> [...]

Applied, thanks!

[1/1] ARM: imx: Replace __ASSEMBLY__ with __ASSEMBLER__
      commit: dc5bfc682b4df23b105ceacd387865a42099aba9

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
