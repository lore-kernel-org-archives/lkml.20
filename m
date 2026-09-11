Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5934840DB20
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140952; cv=fail; b=BRxuaNUA3HRp2rmJFK880xvFhjwgI8EnmHCCf5wJQa2HQOGb2NshzjBWo5jLXjreacjXH1JSo2enIq7S3jDVOQWmU6sH/KwL9zWYjZw7e7mCOogrAE3a8tu4HbPdYnwmZmNkgG1vWHntJYUYw3avjJs5V3Ia4tJWII7gvL9vW8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140952; c=relaxed/simple;
	bh=WQED/KlUfSaohE9k4MZKoMCAT1bcpKUdzEpjNlwd318=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Qr5kIn5nRPdwTXUA+iWNFCnTNNAT2ZzsbKlOpWRco0iF8OjmxiptDCSPRivzlrtqzVtnmY03EPjpOgbPTXpQeGYS6AMpZmfhnOvNfsjqPADXoqAmNDjUNA4QA3ur4K2yzkmUBuDBxbbwxxIxi+66okDp7kjJHwKys3HZCqHsgCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=jQDIurHR; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="jQDIurHR"
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEitt9685578;
	Fri, 11 Sep 2026 11:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=3QF8XUN9/KfDjYjcMVwoJtmZmcD
	oQUEoF7SS1T7OMOk=; b=jQDIurHRc4xAr4qPDP+a3xnEpBQcBuuOSky09HTkD5P
	Y0vLIi46bObaJVGxxW0ymH98ViYX2GvG1rQAqi1uVsMtsIaKztgJsU2TzLRaRKZ6
	K92bT1Q5ydloOL2r5gBZvP2g1Ks0qrHwOE3VYLQ4HDuzNFHSD8e4ubaTDxp6opZH
	kiKLqu3xoWezF9bnzeTzoFa56r6Yo54VAhxqYbaejfBu7lnPfSe4Pg5n4kAE0wu8
	EfI8EJ2Ejl89Zfi2sWjVVTzRHvIScXmoKiaXzmPxg2qWCAjGUdvMsCZ7dSLqxA4M
	IXNKEawjl6+/fjp3F0tPzlPubQrqCf9IWaM24zvUGMg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012057.outbound.protection.outlook.com [40.107.209.57])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gkcx8r5cv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 11:35:29 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gWd51dthhtekm55QfaAMdA4Coq8EluLfCm0cVhjoz1XRd6PbinflKZrJg7Baq0Hrj+mRKwZx5g2Y24D3i3PhK4MEGX692WnhhNSib0KPnMFfKvzPkke2V9viC8DMtTMRa+IFTgYFj4Yc4GoTsPeCUowVK0BBMEJ3FyKwdaQmCOWzFfBHXQABHOpfB/I8/bN9JysOqFHaBs0U8KlC20F/ZxdI7CHZovEb416pmg5VpyVVQSy67RnfNDdHdPfeedrKD7+Ri8xVAjcRyXKXeyCcCnSCnIcjNPq/J1bW9cbHSkrsSCzBDE9SODhyRKnWsrkAgoBASX2gljcqmhD23LSxmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3QF8XUN9/KfDjYjcMVwoJtmZmcDoQUEoF7SS1T7OMOk=;
 b=rmVcpo9Rb+wc1o1KeGMmrYD8osWajznMCzTJDqL+uFkXQ5FAWAB7+AUoABzXAwNWkQBJ74il4r4/B0IP2to+f1pzOZ4qkCzIYeDSj06b9bodfEkKNo9tETVcoHZeza175rvl8EfWCbMyZUQEcCLzODLojJyLMUKQ9Jnkfuvcrobjo2VpRYxwj5rnL7BLRkqw9D23QhmL+TJ2irJ0MLJYrHaFX6m1kxnpezjHu9LkFTIW+UQcmGFzGpBoEGmzercKrc6I6CcEKDW8mmCZXrgVD6TPY6VtaU4z0Il2id+6EKbtUdLaUhhF+xdbeiEe95fOw5/CF3yxpvjd9KHcZcDiBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by MN6PR03MB7623.namprd03.prod.outlook.com (2603:10b6:208:4fe::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 15:35:27 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 15:35:27 +0000
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Subject: [PATCH 0/2] mtd: spi-nor: issi: add support for the IS25WX01G
 octal flash
Date: Fri, 11 Sep 2026 16:36:41 +0100
Message-Id: <20260911-mtd-spi-nor-new-issi-chip-v1-0-c54615f8c30f@analog.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBG4avIrB1IFMR6FXFh4m+dQmPIaCuId
 2/aLr/FeycpkkCpK05KeInKGjJsWZBfxnAHy5RNlakac7OWn9vEGoXDmjjgzaIq7BeJjLluW+t
 G1xhQ7mPCLMfv3Q9/6+4e8Nt3SNf1AQYKj3h9AAAA
X-Change-ID: 20260911-mtd-spi-nor-new-issi-chip-ef3881bab60e
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
        Takahiro Kuwano <takahiro.kuwano@infineon.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141002; l=1358;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=WQED/KlUfSaohE9k4MZKoMCAT1bcpKUdzEpjNlwd318=;
 b=wyZzGT0xxVrQsvFu1nuNAtnJQlfrT4huQkAHHIPXaEiQcH03m292FZ7mtXk2/n31P3kyKbwDG
 WrEyarIDlPTBw0UoIbkiAWh++YIEe43zm2FwZwIJRYrG0h71dCx0SDB
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ClientProxiedBy: MA2P292CA0022.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::11)
 To SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|MN6PR03MB7623:EE_
X-MS-Office365-Filtering-Correlation-Id: c80b13c2-bb56-4a1b-a6f6-08df101a4ddf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|6133799003|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	mqmqiW7Xc2fngxKMhlpDPis8MuDc8QqY8IwfKrSa8W1tlAQP04beyDBB7M0LWDoD8AJ24EByN6afNzyo6Nt+vqT6j0VmWe0h9SQR/nY80jEV5xmpgZoQWvuwcdZkXByJoRvOaoDxu0NqnPKM8VqP/S+/o4r6F6tuAJDrZa/XXU86OJr38qSxDNgko3nGC2J0/nsR0fyuwf65MJCxontfJ1+yIP2rdzCPx5Ne4L8Xgt1szspdYrxIFQ6aDRkv2rE3Ol2jZG8Nh/uiqP4oUXyG+1gG+ylWHj9tyZdpp/bDHZztRj7qr72GKI5UlKYno3jf7yC7cvd0G/02JWvSJFncD8Zc32wHxQ76howr5gTBHZdfeODsrTRJRpxqCy4c4nXcEeKxOiRyIG6TXXs8VIFgVBuQ4Cq1aXl9P5xTrSRWJIUU6EttlyGW8fq7Y7nW3j+p7m0G6R29fTdwJ57ChYhnwkTTgY27COFS6ynpZV6Oue+c10bMUVRjCXS77E1TF+dQxAb81F/KUpYlIjU3gpYDuIN0LKFR4f3P8OydFl0WZHal/uH7G4DD6uEtyCOqzV6HhRa/0YNirIwxE5v40c0Hp8HshXpzFNQYzayvnck235EEv1PFAzvJudYlP6+zVI/n4Gl4s9ZQ2fhY+9ouCB3x/mDDOfzjgKH2s/fWvzGO9VI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0E4cFlKL0N2dVQvV3NkWmdPdFo0dEFJNi8zd3NlemwydFNZK2ZkTjZwZ3h4?=
 =?utf-8?B?MHdBWWM5N3NoVlJHR01yM0t6YXB4ZWYzLzY0dStlem15MmxDWWRIWWNLd2hk?=
 =?utf-8?B?QVJUYlQyblNsSFFKaXgxdENTWjZwOE1WbEZNUFZHVkQyUlBMQzNaVHZ5S2M2?=
 =?utf-8?B?aTNPZ2oyMG40UU9zWW9jM2kwYUZyN2kvWUJxek1kcWJCcVdKbDg2bkhhcW9o?=
 =?utf-8?B?RGdsVzVJTkpqdWhoUVRXUkQwZTBDMzJvT3dGYlBWcWtYM1I0eDdnNnA1U096?=
 =?utf-8?B?V1JVT3U2Q05kdnFPUWRMMzQ0U3RMd24xb2EwbFQ4UE84VVBOWXhtQjRJMWNk?=
 =?utf-8?B?b0tmdHdZa3Q3cWM4QjVwVE9UV0NzMFc4TWtiVlNWSlZzS1VJT2xqaVdDdVhB?=
 =?utf-8?B?cDhROTdMalE2UVBJcjNSNjV4NDk3dzNiZVhWdkRtRnNwQXdwMEpvWExiS0NB?=
 =?utf-8?B?REVUVFppSGpLdVhHSDRHYUNscDJoQ2EwT2tSVlpjMlc0VnZGbllSbVZvd0ow?=
 =?utf-8?B?QlFoWkVjLzkvUHhFSCt5QTk5c1RNaVNTNktRaTUrMmt2NVZ0a0lkWDEyTi92?=
 =?utf-8?B?NDRQbWtBTnRpb0pqdkJHMkNpYm5CVld1Q0tuQWh5eThhZmZWRGxFT1V0SmxV?=
 =?utf-8?B?ZGJrc0hSOSt4K0loU3pEd1pMejZoTTNNekRWbVQ1V2FwUlBVTHJvKytCeXJs?=
 =?utf-8?B?NFVyUm5DelNIS2hKeUxPYlV1dGM3K2hnRndvTnliaTlUKzcxclFSOWc2UW0z?=
 =?utf-8?B?MzN2eTloY281TkF3bEROUy9ncW13SEJlN1M3bE5YRnNQajhMdFJxa2tzVjhz?=
 =?utf-8?B?MTR5cTYyL0NKdURRMU8vQnhuSkZRYVJPeUlNUlRxTzhjdWROb0REc2orOGtO?=
 =?utf-8?B?RGpVNWQ0M2xWQ2oyWlFVbUR5ZXV1UW5CWjlMNTRRbnBKallLWFNNd0VrM0k5?=
 =?utf-8?B?ZERLaFhWTnJXZEZkSnEyMjJ1bnB1NkZpcUZtcWpMNEowamxYWSs5QkVjV2l3?=
 =?utf-8?B?b3FVY0lPSEN3VzVrcVJPcjRPQXJpZm0vYkFGcC94WmVwTG5PMjJNMWNLMDZh?=
 =?utf-8?B?ZzJ5dnNhOXJFRWVzTE1kQ3RMUVRtRFhFMXhiTVdtV1N6dW5uSkR6QVQyREVU?=
 =?utf-8?B?OWVELzdyWGIzNDNYVFN0bFlrQjRpU1BjNS95SmJQb2l6a0ZsVWFjZmZPcHZJ?=
 =?utf-8?B?ZG44aGZoUG1FN2hlYW1VaUdPR1pBaXBWdVhIb2gvWmFEaHBIbWFiYnUwZWJw?=
 =?utf-8?B?SlgraVltQWRWZlIrRlI4US9YRTI5Z08zUlhyZ2xxM3YwN0pPLzFIazgva09T?=
 =?utf-8?B?Zk5uU1ljSHUwT2FPOE5rR3MyUlgwUnJCaDBJQkgwWHNNZm85NUNmbHk4Wnlo?=
 =?utf-8?B?dHptQmZQcFlCREx5K3V0R0FpSURWRWtGUU45T1NhbVh6Rk5BRWFuNW9BSGFI?=
 =?utf-8?B?MWFYSG1Cd2NtN0VqOTdDR3NxMGliN0Z3M2VEU2hEeVpGcUZsM0lWL0cvTkl6?=
 =?utf-8?B?cTV4V1ptaWg0UFFpTWk5eExmd1M5QXZWWnZiMWZKQzRuYTQ5VUwxaEQwME5p?=
 =?utf-8?B?NlJsSkhyYzBTT2lSMGV5UDlXSllDUDNWS2E3SjZiL3lwQlgxYk5zNFRKaEVp?=
 =?utf-8?B?ZXlVS3RzVzVFeWFERU1sS1hlVHM1bkoxWElQUkFjN0paZGhiODFxOEhZZ1Y3?=
 =?utf-8?B?eTdjZnk2L2RXQWdZQ01Nb1l1bVlxUVhsZUZtLzFPTTVocldYY1BKRzhpblZI?=
 =?utf-8?B?eGtjc1E1SFRQZFNvNVlyM1ZrVjQ1Ry83akdBTzBHd1lkVnpGR0NlVHUyUmI3?=
 =?utf-8?B?cmNNdk0yMGZ2S1BxaEc2WVpzS1ZQSmNyWmQ3c2NCNXF0eENQMmtKUUVyano4?=
 =?utf-8?B?Unh3cmZNeXJ3THVBc2VCbE9DbjNmYk53a0VPVGkxY3UrZ2VHaGUzbEl5UWEw?=
 =?utf-8?B?TEtMNFliZmlNRlA5TTRKcE9KVmNTbHJNZTBMLzdRdzF1OXdhS01BMFBBTnp6?=
 =?utf-8?B?dkhyNXdicVlSYkhPMTg3Rm1BWi8yOUtkQVdDL21PWjdrKzN2NGN4dWJKZ2dk?=
 =?utf-8?B?eEJRTVVJSzU1U2tGWHU0RzRkc2hsWlJxRDFsbVpkSUpUQjBESlI0OFo1U2Vy?=
 =?utf-8?B?aW9WdFhTcEh1RG5WZjVkWmxmaDBVUi9EY1hoenhyRFpBT21DcXdYZ0U1NGlQ?=
 =?utf-8?B?UXdCTkR5TGJ3RnFyL3NLYXRXTGRzeGY5SlUyM24xMGwyWit6YmdPajhhaksy?=
 =?utf-8?B?aWNpWkZic1cyQmdjL1V2R2NsUDhIUUdBYS9HSnlqQXQ2MGNqQUtrVUNtSDFJ?=
 =?utf-8?B?WFpRVnMwbUVMQy9WOWx2bUxoSVFsc1M3S2M3OUJEU1RYUk9WMExVQT09?=
X-Exchange-RoutingPolicyChecked:
	gyu6jSAeMC5OdN2KU1xA5ft4TwYSWLWsStHGSCEK0E1bdlCfFfSrusCSUkDpInd9EJKgFxtwCOteD18zkCuq4YOQbl4D03OLtt4vir5P0jrHk8WafDloCycK3F4uouOKKPUz3Y8csnrmFZRCW8X6H9RFbceRjug3EIyYBcpZ6jU7kq6L/D4/iYHcWFAqbceLot9haNaXz+PO+3ye8XJnTVJD3gizpL2Rzccfu9/LI09muYZKN7WxOPcyKRQI8v2ACoTaD8SQ+KKeDO/8Aksxj6N4FIVODipOz1Bp+98XM9za/88BpEGMkP5heJ4PKBepZ3qAxMkuDnev0Br/tZ5Qmg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c80b13c2-bb56-4a1b-a6f6-08df101a4ddf
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 15:35:27.2991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mNUYi+6PEJZdttiqAZFUeL+jBL6ElCpUPQHnmZqIfy4B9gLVOo3ZgL9G4msDGawdwTEo54VOMvOelvI5bL30RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7623
X-Proofpoint-GUID: zL2eHrhGlxGSdrdD7hhuMpS9XytbHqF2
X-Authority-Analysis: v=2.4 cv=JaApPkKV c=1 sm=1 tr=0 ts=6aa41fc1 cx=c_pps
 a=Ovo9riOs5JmVBBfNyWc1Cw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=_jAD5XSDOtq9-5Nde2OG:22
 a=gAnH3GRIAAAA:8 a=8CgkBcaItM9QUDwAragA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: zL2eHrhGlxGSdrdD7hhuMpS9XytbHqF2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxNyBTYWx0ZWRfX9hIl89OY7Yrf
 +msM+JZF657QZLvbMi0LVckDh5ZONg1LcpC+TlF0lRFvu9KPY8RBTJMs8AKNBmJJUkrkJlMLkDm
 /r1VfAbpk32tQYy6mmUSg6J2r1xOjNM83Xvi60iNH3MJUKyVDsLO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxNyBTYWx0ZWRfXwyu9rHbLcgZx
 KhbSUDIK8qCuFkXZmkMa+uwtwcrlu1Kei/v0Ott19Fi8MdW3mLL7UrxVmt0ZKXdIQdZjV2Di9+d
 SmVkF2+n7bzWlrdNkMLP1lP9X5GOfdT9IXKW31R6rHhzhAQiz0Tdchkggnjz9EYYmLT0Fv3A4lG
 i/KkVNo3C7rfMZCgH+PGQHPa0deFHqnSp2Mq/HrjrUm77FAhQ8SYDt0At4yxJzGCFm9z09zLsE1
 odpUtJ8v+gywDL1gC7bee4DEkn/U7hjg3ppHeosXNf5k9rIBONWnaYSWMqGf95nHZqxBRXwl+YK
 y46j30ApsKwy1tIK7PmaAxIdqfOzjHLfz8CTkCMXEyu6+6WGsUbxdOJ53A+lpyrOQYknWXaQPkS
 LjFwd77WVaJ2vD9okDq6Xw2pnFazZcWquMIoXY1QSz84T0dlPTgfLjU3c6VkuZKk2lNxJW08EMH
 ELHlVVImzTkL5jng2ZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110217

This series adds support for the ISSI IS25WX01G, a 1 Gbit (128 MiB) octal
NOR flash.

The part is fully described by SFDP, so patch 2 only needs the flash ID
plus a small post_bfpt fixup:

 - The flash has no Status Register 2 and does not implement the 35h Read
   Configuration Register command, so the core's default assumption of a
   16-bit Write Status command does not hold and SNOR_F_HAS_16BIT_SR has
   to be cleared.

 - Its BFPT Quad Enable Requirement field carries a reserved value, which
   makes spi_nor_parse_bfpt() keep the manufacturer default quad enable
   method. As this is an octal-only part with no quad mode at all, the
   quad_enable hook is cleared.

Patch 1 is a prerequisite: the 4BAIT parser did not pick up the 1-1-8 and
1-8-8 page program opcodes, which we need since the IS25WX01G is beyond the
3-byte address range.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
Nuno Sá (2):
      mtd: spi-nor: sfdp: get the 1-1-8 and 1-8-8 page programs from 4BAIT
      mtd: spi-nor: issi: Add support for is25wx01g

 drivers/mtd/spi-nor/issi.c | 27 +++++++++++++++++++++++++++
 drivers/mtd/spi-nor/sfdp.c | 10 ++++++++++
 2 files changed, 37 insertions(+)
---
base-commit: 700bf34058ca7cd792236b1ba5caad3770d66208
change-id: 20260911-mtd-spi-nor-new-issi-chip-ef3881bab60e
--

Thanks!
- Nuno Sá

