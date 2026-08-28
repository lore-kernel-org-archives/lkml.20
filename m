Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145D3449EB7;
	Fri, 28 Aug 2026 11:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917902; cv=fail; b=lJifjFsx/COFFwINsz0QH2Owutu63/WEeBxWgMYMkh5WJG9QBoGzXsHafYg8dlDKJenWSjmcFtcqze2AXw2utW8kSh88lRWSVy6AYwI8BQoUwzaDjL9AqoRgO1TicNJn5x2XZul3ZXEWtasaD+J0syVhNzm0LMOQqXo7Y/DFKWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917902; c=relaxed/simple;
	bh=ZmN2SNQF0DDYjZa65nyGTRJe9VUrd7OQ4nd/rzahxpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QOyBW3vQjNX9Wpfk85cI2fIBrb8mZ7dKjFXSWdTGWoU9sqwEAUjc/fqqg2Z8CjoiFLXiiJLP0bEyVF0cgOS6s3iAB3XFhy76ojyVIOhbTLU22WD+DTOqH9LxkcDVeD+bPh89ycaAe3mTKrj5mTgtAvrR54Bhj61FrADR078QhzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=ioXaXZTc; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="ioXaXZTc"
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SAB7Mg041448;
	Fri, 28 Aug 2026 07:51:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=JpeDh
	xei7mI2cf6miNLIS3EFFrf5+2XRY3LKyBNU3vE=; b=ioXaXZTcC1n2IyNcrYwtu
	DtTtJzukFJpPhNAvHEECm+5JeAxiyxAeUmVYie3pqRRjqDxllLLaMcGPD873vT/R
	iVOpomf7znHL/vZyQEnKzQB7ICjHZ7hNiwFQHgKVwreQnWEy8Hd3VVMmZQj7fL6x
	C1dZBhJSPD/FcBSRoGIoCE38HWMmatesXqijdWafYdSHeoH/UbkYCKndjrvfDoQ5
	7C01PV48pfaU8gMMAiEAa0oimfOglpvgVZr1e5avjrz1K6X9GbQtwQotWWW8R/2X
	GjZyTqQjRGngiJzPx748DlCkNH3BgPvuyYoRuEvsZKgLzAlsiwttkPNt6+/4B8fT
	Q==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011033.outbound.protection.outlook.com [52.101.62.33])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gb8bwrgcf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 07:51:11 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3yhmgmwKvzvCVVcscLUHHZWaVBu2cNv8FDgsY8syzAXfCGrSDfbenepx81Zi0JNz/3+QUpFXCterLFYrmvMub0L3hyAMwM+wBOjwZT+AR6TObqIrg6qsO+betdGG5MT0Rb9Uhie6OsQBRZoaXp85clIRNLzJjKuYqwekCa6x0OU5hNDrrE2+QvReN+fJcPvJCinlhUz2KaK75nYmE56glM8DG7k9mhfk7v7u/VjZNQCnXzIB/c4zNrVnmRe33Md/T0DZu7O8U8WGCByWMBWAHRMncUW7XLMZjMnnN8iztE5TXdgg6ZGuBsJ/io63gkT4Y1Fx2cbiz5gLcmejFV13g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JpeDhxei7mI2cf6miNLIS3EFFrf5+2XRY3LKyBNU3vE=;
 b=SQDbVuLnUyFqamz4WAGYUyTNIk7+4haddnQQzAVFRC3uK1bc0g6no0kFWuuUyQV1N9Zv/g8bStfQpfoOB7cBIzBqf6n8fExOCIeecj6zXa0Ia0xa74BoWqcwaFIi5jnh1j3uUcXlmfANIfX694bi5Q2YtwOsKfc7s4QDjvo5StutvFBhDxu0eH4NSEa/zFFAee9fIFkqFBvFxpB/18du+sJS/P1LxmsBLKcCrqaU18FcDJnjn7EQJMlPZn8aSNyN9RAdyPImULbkD4Zn19Hfmni+zZ2dUStfqUf8HagEDctYBYA37F1Xs4Evh5hUvzpV5kpYpnvmnxm3g09I2WlFkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by LV3PR03MB7587.namprd03.prod.outlook.com (2603:10b6:408:287::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 11:51:09 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%3]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 11:51:09 +0000
Date: Fri, 28 Aug 2026 13:50:29 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Rahul Sharma <r-sharma3@ti.com>
Cc: peda@lysator.liu.se, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vigneshr@ti.com
Subject: Re: [PATCH 1/2] dt-bindings: mux-controller: ti: add binding for
 event mux router
Message-ID: <apFyu65OOQF1XF2o@analog.com>
References: <20260828100615.1700223-1-r-sharma3@ti.com>
 <20260828100615.1700223-2-r-sharma3@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260828100615.1700223-2-r-sharma3@ti.com>
X-ClientProxiedBy: MM0P280CA0113.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::19) To BN9PR03MB5977.namprd03.prod.outlook.com
 (2603:10b6:408:132::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|LV3PR03MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: bc5cde0d-d76c-447c-0c6e-08df04faa0da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|6133799003|3023799007|18002099003|22082099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	4d5t2XQSHiEolF1i4d0joDfqI/l7bv5ms/NJaOgrl+TTq8urjQvh8dG8NcBEpsLLGpmUJR+nwOCDmCQG9XEPElXhvUGJTpjD4quAARA2Q34JiFIrVkkFHYzl/d66PweUXy3bJs9qX+jGzvbRKBS3DBk44PMdyrvCL+LLzbEVp9M/nHVJyyb67SGIcQZ6ojX0lrbuJvNF/k2Ide/pfQlg7DqzqVI93paZsHWUmGISAiBArign19in0fW3hllnCjFn3+iGGEeC/H5clAl0/8nn8pJ6TekHJzE8br+u/Yow22mL9L1x546lYJL/bymKJQXQALeNwAJz2N1iPqsm/4vI2O3TygeGcrYO7nTpb0qkD7bfSwsR8W0IV7QboNMwSRkUHiTEeqEWC+8NZi+nWcezjOmaV/B/aUJKqmtJvXSg1YVSRAgLLB5NdGUF7ymk+aE/8DMoOoWNc+1/foBv6mWHvPSzTsWjmJPwt5PQScmJ90I35/Rv26mkrVJDe4IX7wufsn3lsyXg0ma7GSShsvwAur4Iw3kVpYRK1apTnUyLTsRss1y9FivfOE+0yhWEe0CcX5PkroTIl/qECDYvkHTodnHx4cIpxkzqiEvCCO6tL1ZsnxkaydxrEMCfwbRPo29qzSkBqgRbhtoKlal/N0fauKbR8V3GoV7fE6yhufZZY60=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkJJZkpQQ1hTTGJyQ3k4QktlSzh3YkY1L3pleURQNVB6ZlVhTjBBU0dWVndY?=
 =?utf-8?B?U1V6TWpiblpUYmhOSmI3VEdLTjkvbXB0N3Q4bUZCNHdyRk5hWUVXRjVFZFpL?=
 =?utf-8?B?aXhWNVJhU3ZPVExYdUlCQ2xibVlFc3oyUzdWWHRsM1FTQjdtWnk2d09hbWY5?=
 =?utf-8?B?eVFETWFpa0VpSkJTbU5DVjg5TGhFZWRnVFpiL2p2U2RCMG1EZ0lUVzZPZWlQ?=
 =?utf-8?B?YVdFQjFHc0tWSzVsemc4aUZVVCswMC92clZRRm9yQjN5dC9KU2JXVG1VV1BV?=
 =?utf-8?B?VGdESlkyN0p6anNOejVkUHk0VjdDbmp2cmIyYVdxODZKN2gwTE85bzJqT0x4?=
 =?utf-8?B?NnhreFZCTFhqdktjVm9ZYmp4cmVZN1Q4dStiR1g5d1A5MmlHbTJoVVQ4bDlt?=
 =?utf-8?B?QTZmYTJHRFJiMStyV1pEUXl2OEkxd0pCOUZ3NGg1QjFGdUNraWNyZ25oc2tM?=
 =?utf-8?B?NUFBbVdUK3VHQkZSVVRxK1ltVDYrcDlxaWNvNXNYbzBKcEppc1cvZHdqRGVl?=
 =?utf-8?B?QnZSanZPcHVZSXF3VmhtZC9qanV5U01RTk9ScEZObGhjYm9ROE9ES0xjbmtH?=
 =?utf-8?B?cGVMdTBFQ1VLeXZ5N05HYmo4d05KbTN6djUrb3dOQmxiNDRjZlNmYW42enNk?=
 =?utf-8?B?NUV2QVVYTlZsQm5EdXBpbU1WM2hvOTgwWWhseGNJbkN5MWVvMzdJWndCLzM3?=
 =?utf-8?B?NDYyRFI3elRYRFpKS1pLb1NVYzY2YXppcjdqZVBSbFpFd3RhS1NKeFg5NmFU?=
 =?utf-8?B?ZXNlRUNMQ0tIUEJveHVXWkZ2WG1TdlBLK3c4ZUZUYldqS003bWUvTXlBcU44?=
 =?utf-8?B?UkhBU0M3aC9mWUtFd010RVJQTHJSZk5OdVRZN0JpYW84blhKcmlsL2RXNmRY?=
 =?utf-8?B?aVdla3grYUhQa0p6WHdXZmh2YmNXeWdGbjBwMUJPN3B1dDZoQThVck5HYjNa?=
 =?utf-8?B?ZStyckl2emZjTkcwbTFjWW5TcVpDUitZczlpVHBDUmVISk5jcmtrWHN1UWxY?=
 =?utf-8?B?L0w3eW5KaUhQM05NSFVBV1Z3ZkY0N2xxRW5WbzFTZ096S3ZveWxWdHQvSXdT?=
 =?utf-8?B?TS9rUTNvaHFuY1ZpNThRNzZGTmdBZGl5QkRwRDY4aWNSWmt0Ymh0b3dzYzlZ?=
 =?utf-8?B?aCtXcUJnM2plNVV0S2dLMUxlalU4eTN4NmdLeVA1UisyYVlvazVBMGp5cGt1?=
 =?utf-8?B?THpXa3UwZVROakVsU2hOWmkydHhLRmUya21mZFordEhZaU5BazdKbE8xU3My?=
 =?utf-8?B?anhzVldnR3dDM2JZSzRicW1XM3R1NDB4dlZIa1BWRnRxMzVOVTVqNUJGL3Rz?=
 =?utf-8?B?bmJsSnB5ZnJmaEZ3OEc3S25GdzRrUUNZS3pxV051c2h6WjFXdjBOKzlDa1hk?=
 =?utf-8?B?cEJNVG5adVkzT3d1b0IxZlFPdHZGSS9SMDNqN0orOXF3UWljcUZjcnphMkx4?=
 =?utf-8?B?NnNVNVUvelh5NEhuLzdOTVZPYU8vcXpjR2tLeHFRSjRSeUxlc3ZPN2xlQlZL?=
 =?utf-8?B?UkpxbFAzUmwwc2cxbWRyZHlJYmFYLyttNVB6UFZDeFg3ZjJ1MllDKzFEZFQ0?=
 =?utf-8?B?SUtEQ3Yyc1FYUUdkWTQ3SG5NMUVXcGN3WlBTQWJKWW9iSEl5RVpuV1RWRDgw?=
 =?utf-8?B?MlVIVWRYY3BEMEs3YWFnTWhrWGZHZ0ZpRVNlODZ5aUh3WnpSZk9xYnZyM1cx?=
 =?utf-8?B?bnMxcnZTdFowMEJKWTBUNHhLbHEybmJ4S3lRdC9VN21yL1UzN1JQeFo2a2h0?=
 =?utf-8?B?RUEwS1phWldSWGcrSnNEU3dkcFhVWkcrbmJXM1paQURtTWNhTytZNFV5dzZO?=
 =?utf-8?B?N2FMZEJHdDJydmp6TjZIRjZXZkVseUhiSWo2aUVXdE55UGlhQ0lTbTdNa0NK?=
 =?utf-8?B?d21weDFtZ0dEQ3hrRWYwZ2gwcTZUNVlnU0pzQTdKbWhocEZIQ1pNY3JpS1d0?=
 =?utf-8?B?SnE2czNtTGl2UHNUeWliYlpwcG84MFlRV2pxRHloRUFSbVJrS3E4UjdaK0Vq?=
 =?utf-8?B?dlViL3RRekR0NXNGaWdaMGFzVkVEeWVmM2hnTWwwaFpmeXdsTGp2R092dGtC?=
 =?utf-8?B?ZmN6QjRqOHJyb0tQUmxQNWk0TE9iSnJ0dm9ReVBGWmdpVllBMW5yNmwzbmpM?=
 =?utf-8?B?aWxsbWZCWVdFZHhrVWdtb1A5cjJWMEJSN3QrRUN3OFV5MWlrL0N2aVhsUUxV?=
 =?utf-8?B?aUxySkhKTURIMXU4WWd5QXVpQmozMHFuSFZ3MnlHNU9PWkJaNWliT2NVbjQy?=
 =?utf-8?B?SFRJMXdpVTMvNzcrcHNDNXI0bVhKekgrNmlFcjNEQmd3QWdrYk9YL1Z4azB5?=
 =?utf-8?B?TFA3a0NqSlB5aEV4VXkrczRwYTM1SFZQVjRBdHFLV1hheTN4SE9jQTNkdjdp?=
 =?utf-8?Q?FVaTS+c4S9LskHcg=3D?=
X-Exchange-RoutingPolicyChecked:
	gXzk1gq//TZ5m6jA4yhl1oyNmswhm5lo297I0hpGbs16xHtQu9YY+FiSWaPGfq8xLqZWGDEdQRdFV/6uJgyZI6/AB0EJ+KVvgOrr557pDmFe7tx5/GqSZtAKKTH0yBKFtYa+E3OMFlmnYdceXIIHrbM1ZyaIpwwqMH9fomzj0mMpBQN5ACOwURhHnrqXfoz2AkWHotgSUVup/xVkZoWFX6P0g7RGDMI65SVSTpC7oODbhCPZh8zq3SvTfx9QBz3+D/rtOli1nu+r28WJ4g9PIUbUYrqQlrut2u35LS7RL2LUWzxo+jHSH9inuzWGB40GjuKzxjR7qe9l5QDlziveyg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5cde0d-d76c-447c-0c6e-08df04faa0da
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 11:51:09.4162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /a+9kCZIKyNF/RZAU4vGAy9T7JhVJaEihlmGv26wbf30H1MJMgHMdW29h16G+EUlFv37JRcZ4J+jNdS97UkBFjYxdqszV0dh8vSoH0Q48N4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7587
X-Proofpoint-GUID: mdZeuY4Zzfg27p77CWs4DqlxEwxPFsp0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwMiBTYWx0ZWRfX4muQxK5LP7gX
 5dJoRDA+PT3VEaz2vUX+LvL7uDXdbzyoK/DA0RcaculnDoNnYCF5U3VFWUwwDvQub2VWcWsxH+B
 CtUtAu5gUhvMZz99x1UvUoCaORK1p4ZFdBf5azHLPdbccPTBiIiRmQdIOw3RtnF8ebTXozqwEos
 OYcr+sh2K9OJ7p5UiO2H0OyAzxKoglflAO5Zi+0pRuojPS5yGAfkF7xbMkmFHGk/++UdItI7GS9
 lKe8011udSiL19SnXFOhxTT8O87uJd/Su5IrzkxSQeETXbReYfNvFhO7+e6OBdS/KTIR4cxKSZl
 Pa/Uro3nMo8pGRIZRiQble/zDI/+ZcEkUOFQKFr3wWjU21mM6ETR6bdg2dwipyAT7WPUr+cTgHw
 MAXx9RrcBRRMz4TDQcrf5sI/ZyrwQnEhKHof1yW7VtO3Zx1GEx9L8Xbvm7sTLzcSdEkZUXIbTtA
 fTR+nDOFUQJuYbf2Trw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwMiBTYWx0ZWRfX+Vqp6IHnuklu
 V/HRrOd+ZSzVMEVraParhuhVjXfI+5GutJkkL6kMq8sCU77d8vltpkGvGWNS7EvhykK8QctEMJa
 pLGwOoK+8Q7w5Qt+NaVxxeEtE1ktKur6hNjiO1731YtTmqKqjz55
X-Proofpoint-ORIG-GUID: mdZeuY4Zzfg27p77CWs4DqlxEwxPFsp0
X-Authority-Analysis: v=2.4 cv=ObioyBTY c=1 sm=1 tr=0 ts=6a91762f cx=c_pps
 a=4QVYENZnsEoURNel/cbnog==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=iZSIUCweCk2Oy3QsdGPA:22
 a=ExGn8wyVtdbVE2oIgKIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 malwarescore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280102

Hi Rahul,

On Fri, Aug 28, 2026 at 03:36:14PM +0530, Rahul Sharma wrote:
> Add binding for the event mux router of TI's K3 based SoC AM62L.

[...]

> +  ti,reg-mask-val:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    items:
> +      items:
> +        - description: Register offset (relative to reg base)
> +        - description: Bit mask for the mux control bits
> +        - description: Value to write when mux is active (state 1)
> +    minItems: 1
> +    description: |
> +      Array of triplets specifying register offset, mask, and value for each
> +      mux control. Each triplet contains:
> +      - register offset (relative to reg base)
> +      - bit mask for the mux control bits
> +      - value to write when mux is active (state 1)

As I understand it, you are creating a binary (0=off / 1=on) mux control
for each reg-mask-val triplet. But couldn't you just use the mmio-mux
binding/driver for this, delegating the value setting to the consumer?

[...]

> +examples:
> +  - |
> +    #include <dt-bindings/mux/mux.h>
> +
> +    // Example 1: TI AM62L GPIO Mux Router
> +    mux-controller@a00000 {
> +        compatible = "ti,am62l-event-mux-router";
> +        reg = <0xa00000 0x400>;
> +        #mux-control-cells = <1>;
> +
> +        /* Mux Register addresses: 0xa00004 + (J × 4) */
> +        /* GPIO0_40 -> BCDMA trigger 15 */
> +        ti,reg-mask-val = <0x40 0x000ff 0x00028>;
> +        idle-states = <0>;
> +    };

Alternatively,

 foo_mux: mux-controller {
   compatible = "mmio-mux";
   reg = <...>;
   #mux-control-cells = <1>;
   mux-reg-masks = <0x40 0x000ff>;
   idle-states = <0>;
 };

 toto-consumer {
   compatible = "toto";
   mux-states = <&foo_mux 0 0x00028>;
   mux-state-names = "gpio-trigger";
 };

What's wrong with that?

Kind regards,
Alvin
