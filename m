Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FA64AF68E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788190700; cv=fail; b=nyr8G1yFKPreXsY3UeEl6LO3nuj7xR6378K4IQWKkcB5aJn9hM8IOMGYik5kvv8RkxcTr9E+jNijYHlS25eQLkYAhpNfqdOZ4gEuO8JaqqNKYOZLYAF7h6jYYfpEJMfLEQgvtQKQ4rJetI0sw74wcXCkMF0rYpHKMNeye7uSn6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788190700; c=relaxed/simple;
	bh=pi9UtUhk8EQ2zveaQnzXFf1atnwdopjIBLA/MzzofPs=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=kiLRr/OEdCBABmC/sgD3GTGyJhut27Lsc53nRCvADsoqDoU3ZBdhLifnd5frrbh8+ZurdGxzRZVhJIBz4q1yMhJSUBlNfH1Y9yzKYuDVcNVHhopmm5EPhbTwZ+bSEyQE2UsPMXd/NvcQGjp6UwbYt/yi5o51f0QZxpHh3B7kpOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=YH4WNSVA; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="YH4WNSVA"
Received: from pps.filterd (m0516786.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VEUkZr1171148;
	Mon, 31 Aug 2026 11:37:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=M//jmkfvpJmV0kjxy6VWQnEJxqV
	peHSEwzB6m9SVSY8=; b=YH4WNSVAnGBT3ZwKW9Yfk2ttD2RVLPrDe/w7ZNmo4li
	kp/4ebct1PnczazI+7ge+cVNwyB7hDYgqqAFHKbE5brhq3+xX2RfDIjAF9ZX/ao8
	nUnyTpekz8gBvnvIhhFB9HrwukzDRovmyHkwMfSzX1F1f4DXXAdzHa5JVd6cTSFZ
	ClfViTKkGimUtNMYPDazR22/PnSkoq3RiAfzVtSEfsZxf4VsH3CFhTQO6auVvRMa
	gOJoJxuFKzFN/bD4kUfM4Mq6rSs/OTLjAJhM5eW9olrj8feFYhTyOvd3/Vk4B+my
	4JIRHNCp2fILTayUtnJGeGJDPfeQg3GrDvusiqS7MAQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010050.outbound.protection.outlook.com [52.101.193.50])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gcg1hv04x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 11:37:12 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=upFlm76YRHaJj5bLc/bZAPZeT9856E62mWdYrzOKkJdap7+hukzFC9sRo0wJN428z6pS8YxjuaOrj+X8t7StNqpW3/Z7+60FFnNbBvDsIRlbZNWmo7M/vJ5XQn4xP5o30w9631yXhzOpcRwDjgFJKXTAzTgDiVT3SZSKPSV7QkLDayMrFbJzkZD1toz3+FKA9Vpo3d8Hf0tyjLB8KZzmZ0eXYBUDIuKFZptjvEhS1Qs2XN6AR9NT9xGOlbDQhF4YcepXdDqCKSruhsVpFZ3l23AjiireDla2gRlJ6yPfhrsybqdHOwbVGg46wQxKbT3gZvIeVUZ+gv0RdIHr3z0dpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M//jmkfvpJmV0kjxy6VWQnEJxqVpeHSEwzB6m9SVSY8=;
 b=QC019/G/L0qORHOQNh/xQVfLNHAnFOtZTd0f5xsbE2YPR8e5gGX25zr9/cI6JI03tOA4d8oEiZbl9bBbg+5A1Rxw0WWuqxdvLFxeTjuLP5TrwIk6l/rn1d7QTcCNu85/MLKNWH/p+zL+rjwoik6UP9Ret4KgCUWtUYef0+CamtjTTFxa/lKFnXUmmho/qyDwezb2BCsRBW4BjHcVzTebeb125QAc0Ahjb5KHbaZVdXYuNQiPepwvYowZUh6i7OhZT6hvXXtHoH0aRg1oLtzSIcy8WDYsXeU2LYLWvAQmX7CSUf4rrchOeJL1qP4WZHDo8GtUh95FRqygF13UR6K83g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by LV3PR03MB7478.namprd03.prod.outlook.com (2603:10b6:408:197::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 15:37:08 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 15:37:05 +0000
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Date: Mon, 31 Aug 2026 16:38:10 +0100
Subject: [PATCH] mtd: spinand: winbond: Add support for W25N08LW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260831-mtd-nand-new-chip-support-v1-1-dca9f63ac0f9@analog.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrDuQxKilVykuNI46QmPIxLYg3
 r2pbh58i/fvIBSZBB7FDpHeLLz6DH0rwM2dnwh5yAajTK3upcZXGtB3Pg990M0cULYQ1pjQ2l6
 rumqMLUfI/xBp5O/ZfraXZesXcukfhOP4AWXu99R9AAAA
X-Change-ID: 20260831-mtd-nand-new-chip-support-44b10657243f
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788190697; l=2911;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=pi9UtUhk8EQ2zveaQnzXFf1atnwdopjIBLA/MzzofPs=;
 b=RIqPpbwyG67Ku0x9RcXDxcgCvrl4rmsr5VouVHj2LSeFRpy2WqC42bWjN0KRLAlVbz7/dgIhz
 /J2VZsoO/TxD1+gzHOvjp5bh+S/lTEvkr9vkj5XFvCzVRIzEoslefK0
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ClientProxiedBy: MR1P264CA0186.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:58::15) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|LV3PR03MB7478:EE_
X-MS-Office365-Filtering-Correlation-Id: 7732d856-3bda-4c2d-9786-08df0775b55b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|11063799006|10067099003|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	SkCBqP6g+FGT3qqAtFFAkNzo1OnmkdcgAqbXDJhF9uNarrTwnZlVbfXeTmRM7p3UInvC04R7eqFWjp64P2n/GzXs5gmKoB2me6p5q9AvcuPCEdsO8rSEIy2H3MIKn/kM9TRg7csNspYbJGSnOlTCC4ekZ5zLi8P+jwbiZ/Zj3Ho89YGXZmbeSkrkGiRBpthGGpsgxYg52FZyYhAEivf+fxidqvHTg/hefLPzVYBgOLzQp2XTab7cOb5v2fjZVm71f+d6FxR2wdxO+bYDFUNis1JE2RzlqhzgvhNgjn9rls+Iwr7RlyJDpTfl2E4IQVqn9fZiaGheiXimqf8eoo0FPKHC6uIcrHtnpVeSux+OKjBFGmgqS1G26mBc+ma0TEyi9wVMgeLvh8FkPu2q7tvVJ3r9Mb41NfkjRwWmnplBNcUZ7hIXaXG3tiER5TSEz68yifmzTCXzriyCXAW39QOM6Hsk8GMiX/qj1xAVNDzY7fyPyOnTZaJ04ZRkQ6RmOK+YQIvbDEYsXCA/dGFi/o5+k0SMCw/37LpOoiAGJtYcmAm+WEXl7f/QmWn/lCw5zxdyWHm4RkIPUCIjaDnOqoBrO58ykgN5xTPAjO2qJTtzGM38+vu+/8T/fXOPoc+TH7rQ1XxmChBOO8ENdu1F3pWUbjDS80fKNZRJoxytW3j3MXg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(10067099003)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUpNdFo2S1hVTko0NWRpbHE4ZjdPbTNUOUFUSktRNUtRMHpjZnl2UlZhZDE1?=
 =?utf-8?B?dzhQVklvMzFaUGFQamo3YzVnVjdPQ2pxcXEwbUt3U2x3ME1XbVdKZ2puMFd2?=
 =?utf-8?B?UUlZWU56MXNjZDZMT1pnRHR4RGNPdkZ0cnVNL1RhUlZJYnJSRVc2NUdyc1VS?=
 =?utf-8?B?OGltZmtFOVp6S1ZRSnFOMTdmdTl6akQ4V2RLcWYyb29ENDIxbXVCR3E5ZHhY?=
 =?utf-8?B?V0ZLcEpJREk1Uis0N0VsVk9SUnZLQ0FIdDNORFpNUFduOWQrR0U2eU5vd1ll?=
 =?utf-8?B?ZVhRMVQvSXhOOHBCT2FtUHpDTU5xeWdsWXc2SjZpTS9QZS9ZTkIweHZVeSs5?=
 =?utf-8?B?RnIwd1gvbXJKbEZjcUpQWGU4cjdiTnVvbEs5a2t3WUU4NWk4VE9qTXV5TkJB?=
 =?utf-8?B?SUhvcU9IcjNqUmJ0L0llamw0dHZtU0w1SFZTaUkvZVo2Wkg0WTltSVFrNGFz?=
 =?utf-8?B?YjZwZGk5Ky9FWGNVd2c2UjBJdnpsQmUyaGJ0ME01SzAwVzEwYm14R09EeXRI?=
 =?utf-8?B?YUNoN0lCZ0ZMaFF2dVRHKzd2c0hSNG56NXhzcFVhd0hkdURRcUZ3T1l4NWdu?=
 =?utf-8?B?cFdIZi9xcmhWRHFRUnNMM2VSWEh1anRmR2JpeTJ3VXlTWHdTQzE1SmdFdHQv?=
 =?utf-8?B?Uy9iRjNWdm02b0xDSmF5c3h6elI5NTAwY1RMam5INEdTWGJJSlR6TllhRlJP?=
 =?utf-8?B?SmU0bThwR092VW1EOVFzUzkraFRheEtvbUlQQU1RMEk1ZjMvWTdwRzdQc3Yw?=
 =?utf-8?B?d1RqczBaTVBmeWpGd3Q3MG5WcmZJUnNCeGdXanI0aWpLaFE0TGNzZ0dRMXBU?=
 =?utf-8?B?bmNiSDlnMjVpRXZsVjY5aC9ZT1BoWnFHaVltVytoUW0rdjZFclNXMUJhS1ZT?=
 =?utf-8?B?YjBsRDBkdERhYkRSYnJZdFhtR1JhZzhDTHBBQ2M0SHk5OVF1TFJJM2piRWs0?=
 =?utf-8?B?a2phU05NUkh6NUlET1I2d2h0bUVKNVFaR2ZzVEZhL2tZVDlnazBPamVZNXIx?=
 =?utf-8?B?eW9pZTc0blNNUE02MTdGTnNQa205NThIcWEraDgrdE03dGx6ZWtTOWxGUUJX?=
 =?utf-8?B?Y1ovYXlmTmpWREMraEIxS2hNNi9LMlBlTTRUZG96UEtZeXhsS0VabHJDcUZG?=
 =?utf-8?B?SEZNbE5RSHdTcjYyWG9RenVnRHpLTGhMNTJOU2NrUzd6STh4Z1EyMEFzcVBF?=
 =?utf-8?B?d2NQdmhiZ0kreDdVaVU4S05IbG1sOXBKMTBkby9nVDVzenFnYTZ1dEpaSXNn?=
 =?utf-8?B?Ukd3NGVVSzl2VVFRUzk0RTFMZE95bFl4MkVyckR2REVIdHBta3k3U0R5bXBL?=
 =?utf-8?B?R2NtRkxBWFdTMlY4MHhpSTU5RGljT0JOUzR1OFdMTUY0RXZlZ09jbkZ3NDc5?=
 =?utf-8?B?b3BHUHNvZUVTc1l2WFc1VW1FQnBSK0VrZURlWnJjYjVneUQ3N1dIZWxPOVo0?=
 =?utf-8?B?YWk2cTdwenRrNFhNYzU1aXM1NkxCR0Z6a2NmZWl2Sm5vdVNzR3p6OGpwVjVm?=
 =?utf-8?B?dDF2aEtGYk13UVQ4N2NiUHJuN3NzaHV5eDFHdFZEZWp3LzI0VDl6OENOaVEr?=
 =?utf-8?B?eENUS2lvV2VzRkxCVFd6MkFFSjBJQ3JYNTlvaTFZaGY4UUZGWnE4RWQ4Y0tn?=
 =?utf-8?B?NkF4dnpaWXgzYjI0N21KRlFZT0RENG1XU0M1OGRYQVgzS1VsQXBMV1pIejZC?=
 =?utf-8?B?c1lyUUp4d3haNjJhMWk0UTczOW1FYzVhWTQ4dUNTWDNLY3JhVG5iaC8yVFNm?=
 =?utf-8?B?ZmNsNlZpZFNiSzh4bi9EWlBodktpbFhzUTJFOXZYL2JCZnJ2b0Nudm5jSzM5?=
 =?utf-8?B?c0FpZGZJczZaWGhrM1BFUjJuN3JiZCs3b3Z0c0F3bnVtUlBWcFJPdFFKVUdh?=
 =?utf-8?B?TE0xTjJvRk9FZy9wZ1ltb0FFajc4NlVjdjVaUVN3dll4SExoR1A5R2FxZnhQ?=
 =?utf-8?B?QUVmbmg4SExSSzNoRC94RHZHdkM4bFhQMmNVcHdiSGRqcVh5ZWJmU21oYVJX?=
 =?utf-8?B?MFc5LzI3N3hidEVKZUZyZU1xS2FUTk9RWXNYNm1hUmN6WEFLNlhnNDFwU2tY?=
 =?utf-8?B?YjFzSm5oSzBPeHJsdVcrNXRoa3l0T2ZjN1lOQTMvcStYMnJ5QUV1WW4rZWRp?=
 =?utf-8?B?Z1JBdW1CQk4wOVdUZDBlUW05OTBZQTJMdHUwVTQ5ZW93bjliVVZoSEx1ek5o?=
 =?utf-8?B?dE82QUlnTVZBaUdvODk3aEE3KzVMMU8vb09vcUt3TmwwVjdKT2dWN09nL1Fo?=
 =?utf-8?B?aEI2WitZM1dWQU5QZ2pGcnNzZUZKYkFOcSt1RnZjNWJZTmZVekRkRHdPVDBD?=
 =?utf-8?B?bVpNMUE2V2pQUkgwZ0R3c1JXSnluaGI4QkdmTk95a0VDUnFaZEY3Zz09?=
X-Exchange-RoutingPolicyChecked:
	wOCUQIBv72+mexLWKCotUnHsyfc6kKadJN2g58mHBVJ1XyEdwtBEeWcWUhBT0RZxBXRzCTwjhYPZQgftUG+7HOl79njheXbAVJd3Ox+/K0JEub0P7A9abA4imtOgJY11TRLo7aeNuGzhiMwewZLFJDMohcRJoZvnIPzECe/fa9C+uZ/LH/2pdImumncsqDKs/wD6fhx0wPQaR/VmrV1ghOq1zWHf2AQTC2EIwT4PlsIEVkJk3Kcop8JdXlllIdvmzaUYoEL17gEjArhQOiUHV29wzwzKRuh/LtBA24USnIphHUVvoK9GDczj4XnKRvv8uYZ/br6j5KQOjjd6DwjcvQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7732d856-3bda-4c2d-9786-08df0775b55b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 15:37:05.5559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L04bLzg2mpg01bK1EW59xAaLfycD5uHzcK8xlHfR5SoFF6quYi0PiDJprmFmYLaa+jQsfGOPTGDvm3SJ7FY/Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7478
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEzNCBTYWx0ZWRfXw6dg52QniEdj
 IblkO3GM9NNnJ871aJa+n5OpzUO+A1rN04lwcPDuKC8mbcKiE4Kvgeyv176cNfeAgZlsJMxnx1c
 OMsCUrJ7KwycpI6GkyAeMPrwYEfHeBjYZRMaOVd6/pLjwx+R85Vx4YjUpoAbjXoipNDkyQnGNAy
 UY4QFi2ESNDZXQkAAphoFXPJsywN9NHzFtK5DX+ZZ3Pug08TPUbvhPug7LPwVOJtkofnMEk2Ieu
 qQH80JxHgSzfabBRjI8bjjxR90qRqxhVtoBBd3jR0NvAI1QhVV777MADsN2gZLavAQHofD9wepg
 Xijy4iJrKMAZafMQp+kUxRbnX+IlZ4xo7pVpPVin7TSyBfvkNrKORKxVQ2DjH6MAiyckAbohOx0
 JSnL8hiLqgwLl0kUqV5R6B3dxpagH9c6IU+xUS3HGH5xzYD7/sNcdJ5Zt4mY8AG65G9ZzLF8fAw
 X7/GV95bFor3uhZNnEg==
X-Proofpoint-ORIG-GUID: ttyH8liuH-qiH-28T5AgsnhFxM6PD07P
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEzNCBTYWx0ZWRfXydmkVUUZfJi6
 Lxzgu8/hGRK27MAAijdKCkRsglpWT5LMJQ3xgeGfpMZ33NEkrUARMNsu2W8CGDdWnDHceugX4l3
 S/nIaW+h+vmxCXeWKiM2lUyup6Z6sR+OpyB/IuU9ujxlpMyAY90I
X-Proofpoint-GUID: ttyH8liuH-qiH-28T5AgsnhFxM6PD07P
X-Authority-Analysis: v=2.4 cv=fLkJG5ae c=1 sm=1 tr=0 ts=6a959fa8 cx=c_pps
 a=sZdM9mINdKJOQAUOT6RFRA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ZQxX5BWu6Z8IJBb2zLX7:22
 a=gAnH3GRIAAAA:8 a=wHVnpBTryfs8O6wbBPcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310134

Add support for the W25N08LW, a 1.8V 8Gbit SPI-NAND made of two
4Gbit LUNs, with 4096-byte pages and 256 bytes of spare area.

The chip reuses the KV ECC status helper, but needs its own OOB
layout because the geometry of its spare area differs from the
existing Winbond parts. Only half of it is visible while the
internal ECC is enabled, so the ECC region is reported as
inaccessible and just the free bytes are exposed.

Assisted-by: Claude:Opus-5
Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/mtd/nand/spi/winbond.c | 45 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 9b78c1e6cbc9..c2c4cc306f05 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -345,6 +345,41 @@ static const struct mtd_ooblayout_ops w25n02kv_ooblayout = {
 	.free = w25n02kv_ooblayout_free,
 };
 
+static int w25n08lw_ooblayout_ecc(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *region)
+{
+	/*
+	 * With ecc enabled the parity bits are not accessible. So we can
+	 * only see page + 128. Without ecc the full page + 256 is accessible.
+	 * To make it simple just return the area as not accessible.
+	 */
+	return -ERANGE;
+}
+
+static int w25n08lw_ooblayout_free(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *region)
+{
+	if (section > 7)
+		return -ERANGE;
+
+	region->offset = (16 * section);
+	/* Note that we include User Data 2 which is not protected by ECC */
+	region->length = 16;
+
+	/* Extract BBM */
+	if (!section) {
+		region->offset += 2;
+		region->length -= 2;
+	}
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops w25n08lw_ooblayout = {
+	.ecc = w25n08lw_ooblayout_ecc,
+	.free = w25n08lw_ooblayout_free,
+};
+
 static int w25n01jw_ooblayout_ecc(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *region)
 {
@@ -781,6 +816,16 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, w25w35nxxjw_ecc_get_status),
 		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg),
 		     SPINAND_CONT_READ(w35n0xjw_set_cont_read)),
+	/* 8G-bit densities */
+	SPINAND_INFO("W25N08LW", /* 2x4G-bit 1.8V */
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb3, 0x24),
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 2, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&w25n08lw_ooblayout, w25n02kv_ecc_get_status)),
 };
 
 static int winbond_spinand_init(struct spinand_device *spinand)

---
base-commit: 15a3cbce32994141252bb4ecfe3ff3a5d22d0b4f
change-id: 20260831-mtd-nand-new-chip-support-44b10657243f
--

Thanks!
- Nuno Sá

