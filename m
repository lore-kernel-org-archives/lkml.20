Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792694851;
	b=ycSqwx+Xm/pXxK1y/J+EnWwLJSNVZ7x+Bts91oJaaN8BRaeCdeHoqlFZxEFUjq/1A/Pi
	 9MVmC7wrpjRmEWruUK1m4aCet+0aO8nLELO0c9STZMHrYH2jbCeg6ZcWuyLKyYohXGbQQ
	 TxhOTWJfcMbAgzE2Sm0vT/qHMmgErXqE360Uvgn906m3Bt4s6gMGcln2l8y8OCxx2KHcJ
	 8DRLt6sbIZWoILd4SVlYeHCNgapNPwYgBRrgWPW2nPzm8lCsLE3NOLH+aWyU85QAuagTk
	 9JJ+uAixV4Q04QBuPc71v0VuxAMdqNXQ4GIZU1PcnUWtxHlMNDFiK0nAjYxzCd4d+Kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792694851;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=5CJblgsBDX6LqD3JHLQ5fZK7mIqs6vGFCZ6V73wpaIE=;
	b=U/yT2TzC+O0O3DarEHrE6/cmh14Zsub1aBYfaHpQ3LunGQc8jnTrteGd/kd1BJ/l5p6c
	 XYfJOnV6ZvG0D67DPw/ozmcmgnw5fIrIHJ/QtKcbqGLfQC+FJtgtOr1xWcO3HFqdPAvy9
	 3eEe3yI+SONSeVr9DXcW4SOibn0ljPkouUHFow2OZnw7g8QknqvA/FFS+v5r+/2tjXmrV
	 G9PQkkEXKO9ltmNBf9ywqqRrHhOfq6IrdyPQTqMONVwSA/3LM5vDTAQgfO9AnN7L4T3PF
	 BG9TFyylFIbkm3Y8BfZ2UzXdul+zywu0u0SBprGc+/IODFAiXNoQL65ZhDnT9o5RuIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Hg81PEyH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.70
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013070.outbound.protection.outlook.com [40.107.162.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34B4606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A34B4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Hg81PEyH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sivv8QGHRrkFJm3esc4uXLcA882tQHDEDRqWOpyD+cpxO3xTKTxVUACgs4xEbTCCgjir26bzrKhRAJca1/KtF1PnPZ7Otvz6StbQZH74Og9/mgcbjqnZqjU9fh/CofS2goCAzhcnqijgBkbYrjjTsnA0DNmMDF8DdAqSkT+IE2vEPjeB1DjrIaLPhW64mmIKgInIyHm1VVVV5SMwvJFri2A9IqigMr9q6a5LqRQDGJuXntJAj//ZEt437KepkcNmfZKUFu1lJP7DefOcRRobLpZEoH4UfNWclLi6V28oV/zdtBLSd5sKFPqoNGKe1rfsVK1vDbPcfDFcpIP4J7/CyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CJblgsBDX6LqD3JHLQ5fZK7mIqs6vGFCZ6V73wpaIE=;
 b=cx+yRL6elwzuqJavkQVKqY9S1QH7kl5M4IanEWdVmkNAf+zUOCMxtpOEF7Mhj2Yk0MOOEZBj/NiGQM980A7grvbysKeCS7ENj4y4rFcs3HcyuUcHT2/ZoR/wjngttuq7sl4zmr8X/UVV3hZ9ajCL/QNq+/D/COQWb0i582OOuZd9qjJTLvXkHQJBzRvqY2AL1M6fIH+JDl6TGqJqGu8XwY0vJiEoSj13nRRio293kMNbsV+8z22FeN4QsAXeRTy8J2lECQAlaJtDhtNfb0CQ5Vrtvz2lopJv+CdgmjhDcxXQfeHtbnIexgn7O7GvAETvMvV7HAMXBT+r8YJV51VXEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5CJblgsBDX6LqD3JHLQ5fZK7mIqs6vGFCZ6V73wpaIE=;
 b=Hg81PEyH45ZNhzTrvGa2itYsEIHgflXrfl6+41VbC5fu+3hB/zjNuY4jw3VtXVHFq01eM8vsBt4V4Pu4gGOsGt2EXjc6azHyh4RT0dclaQ6f4R6sG1LNZHNcacunqR5M6mnHciNoP1X5IvTTAEXGFOb32/GjNlapW5vmKPIsg0HvSgm2Cjc6Vox/hNSnNnEfh8mW3nJ/8mxLaSczXDiiUMQk+uhiYnhc+NGL7UwoVZk8bC1Xh5GhuVLMRNQUAdaqVGx9xSu/+O4ALyVXiflhdKsBjM3IszwnkNVamAcrQ4LyepnpI25QYr/TuAE5ZWB3nK9lq9g6r9Dq83pFSyy02w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AMBPR04MB12208.eurprd04.prod.outlook.com (2603:10a6:20b:75a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 18:47:27 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 18:47:26 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jaidev Shastri <jaidevshastri@vt.edu>
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: imx: scu: publish the SCU IPC handles with release semantics
Date: Thu, 22 Oct 2026 14:47:19 -0400
Message-ID: <179269466316.1193341.15031967671001602290.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921-mb-imx-scu-v1-1-2e2eae4246dd@vt.edu>
References: <20260921-mb-imx-scu-v1-1-2e2eae4246dd@vt.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:510:33d::10) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AMBPR04MB12208:EE_
X-MS-Office365-Filtering-Correlation-Id: b66160df-1a40-4554-10ac-08df306cead3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|19092799006|366016|261022105027099003|261009223027099003|261022075727099003|56012099006|11063799006|10067099003|18002099003|22082099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	knUmWb+igDtlqj302q9gMGrwUgF18aaTg0B9iyqDRPc+STNWTE+qaaQBWbYcLLIul60SsiTY9hkaV8E0oOtSsfIld0TiRboU8z543ff/Bqc6yhSlb7FWhfiG/s3dFyWUYBQkbIbbtMZ48BJIUNAv0MjeqX+pA2HEyU6Zd7118RwLCujEFvCfKDN/eqfsfwlmbfP9bvl/cZ7XqKXJtYHna8XyoHJsNMNf36G5Etk1pvEgva6XHc0RxBNWz1FJPVpFp0lM9Pvaf1WG9q38aX5pTvFHn0QzKi83em5lc6RaNtqyzIFh//apZ1QCcbiw5F+1khHfR5lTc0THmP3yiYi53s0Wjkk5pH+px8+VOkXBzs0xg68QXSHYG0410oLo1YpFpFv61/nj2cNDPDuiv+m+IvaltCcBt+St1dG+6FICQhaSsfdSKG+Wc0W2OslVt+IhDY5GVl1gD3MZoF7KJi1oeaw+ejnHnSApZfiWQJFfdniBqn9f9soXkGZDv9AXBuyMIo3JtrUXHhLr3KXUVHd9OLMRgDXW0yFpF5kwKMivYwzNAdMIxRDVfvawZna5A+Kjx11OMk+c4ooiGsoOqAU945+zLcqz55PAYnJ9BmYhGj7aMqGKcKvDwTpXQJuUzFGD8Jjm3tAM+3YO2IaRykWch14IRJlyVqtHbtN3GElWF1w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(19092799006)(366016)(261022105027099003)(261009223027099003)(261022075727099003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?am1CbU5haWZxcFlLdWw1WnkxbXNOcjBmWjdCb3JIdXIwLzAxREFvRG9RcWpV?=
 =?utf-8?B?MVcvWHF4Z3pQNHVlaFJpdG5WOFpDT09qZkN3TWtFcW9ncXRWQUJnUnl4ODZE?=
 =?utf-8?B?UWxQQzZYNkJRcHplWjZqSlVxUzRzVWhMY0hHWXZwRjFPWnJPeUFudk9Gb3FP?=
 =?utf-8?B?V1F2L1VXNkYzbjFrWk9yeHNReE5hNTZ2WVpQd3BkUUl0eVRjVWFWNG0wSGF2?=
 =?utf-8?B?bW5nZjVDQUNnZkxMV3BrUjJEUEdaZUVlN2VGK0o4RURMbFI4OFc3bThoZ1Z0?=
 =?utf-8?B?WTRNblhOSFhMN01JeGxsMC9CL2F0SDVoK3FqQlhTNnJEZlNKY2M5QTZBVzlW?=
 =?utf-8?B?OHR5NFhwQWxNdWFNNmNDUlBFbGhLM0hVZFV0ZU5oRGJJMGgzb2N1clZLYXJQ?=
 =?utf-8?B?dW5ERDR0bXFYNVJKc1FsdTR5ckdBVGE0blV1ZE5PNEVicDBQQXlQVHI2Rllq?=
 =?utf-8?B?KzU1cmwwMGhPN1ZVQ2ZoY2Jabmh4Qm94R1BGY1hmSzVFRi9DSUkyWVNmL29C?=
 =?utf-8?B?QW9rdk91OVBDVXRSbXVqRHNUeFBuZ3FlRjZpRVh3SDNxU3ZjRHlUZDJTWjRR?=
 =?utf-8?B?c0RTMjczVnhvSFU5ZjlNTS9QY2lmWU1hdnJobjBXVEhWSEdvam9XV0N5cGJy?=
 =?utf-8?B?UC9CeFNBeXFETWNBbEEwZkhLRVB2YndZRzZ6bGxRVFNHbXI1Ykh3QzRxdHFo?=
 =?utf-8?B?UHJLMHBRQmluK2pMR3VIU0F0bUY5bXp5T3UxT1F4WksrckVjbWlxajRCeW5o?=
 =?utf-8?B?WUtBaHlpd1VRVGNUemxVdnc5NlpZa3pNZ3prdlNnUHJXM3hucjFZNGZPL3Ex?=
 =?utf-8?B?aHEwQkRoRTZVYlgwWHBKd29yR0IwYWo0THgrS21OTUhCZDFwdFltR2ErQ0tW?=
 =?utf-8?B?QUJlWUpLM2VOTGFmQ2JXbXBqSTdWZ2tlMXhFY1J0U2FibTRRWTVSWGhBaVFt?=
 =?utf-8?B?Rk45Nnl0dGFQdGZSSHdPMm1PUG03aEhkZnl3N01RMEN0R2N2NEk0YStyRS9M?=
 =?utf-8?B?OU0wL2htay9IalJ6YUJvWlpxOWpVQ0VOYzVBYzJwNzU4THEvcnJzd1Q2Z05N?=
 =?utf-8?B?bXh2ei9EODFFeHR1bEYxdDNWWXQyTGVCWXJDYjFadWxyN2t2NkpRbldLVndY?=
 =?utf-8?B?VzQ3UG1LQVM1L2JYcGYrc1FJMVowdVdMS2JOQmczMjl3QTRvbWM1NHFwSkNn?=
 =?utf-8?B?SkQ0SFhiSDd2QWxBOGttOUlNMjAxSGVCTXc4VlB3SXhUd0hmb29KZW1ISlBH?=
 =?utf-8?B?SGhWbGdGd1R0TlQvQThUTHpNYjF3dVZyS1BRVFE3RmZkbm1YN2VETzQ3Y1pS?=
 =?utf-8?B?RnZCR2xacC90cGlmSnZwaFB6QS9ZeUltc2U1dmJvaUdmVTBiZVFYOFJqbjJU?=
 =?utf-8?B?VnBuN3ZQUkhSbEM2WWdXd1VlUlJrZ2hvaW4xM1JOL1dUanp5WFB2b3VHem1D?=
 =?utf-8?B?MFRYdGhiM0hOZ3R0UmoxWG0zVDc4a1BtSzhISWFXN3g3YXllYVFTdkc0eVZw?=
 =?utf-8?B?aGRNem0rdVRQdGs1eVdmWkd3ZzAwc0poa2N0QzRxVG5mU1JJZWVITTM1NGVR?=
 =?utf-8?B?aGdGdXZ4RnJteFpJcVI0YlNla1k4MEJ5UXltcTFta1FqZVorRHRwald1UFBj?=
 =?utf-8?B?YmhYeVVZRVNUNnlVeHN4WEZST0xWYlVlNjU0OUNPSEE4RGZ2dUFhTHBZWktC?=
 =?utf-8?B?RW81WjNkaGIyd1kremhxTTBOR0tVQ1FDMGVmMHYzaGgwK3BkU1lCQThzN0xQ?=
 =?utf-8?B?MVp6SEJtRU95clYvOGpZTytSRFlteFZTbmsraHNuVFdSL3JWeTY0TGhGdU4v?=
 =?utf-8?B?alFvQnJjeTF0c1hCR3IzVmNuV3A2RHRaamwvZTFUcXlGaTFsTUp6dzNrcVQz?=
 =?utf-8?B?bVl5QWg3NHpycExzNnY5QVRYZWhuTGpObUUwcVlvQktTV1VnYUpkcWdFbUZO?=
 =?utf-8?B?ZkZWYzJPUWU5NVV3NjZCcU05cVI3a2wwem1YVUNzR0dmbTlTT3FwUXh1QWJy?=
 =?utf-8?B?clUzV25kVVZHdjFGeUNmNFBPaTE0S3JNbmVGOFlCTm55RDdyR05GZENrNFo1?=
 =?utf-8?B?RGh5azZNbWZuQlU1T2FVM091VDRvUHBPYkNoSW8yUGUxeEllVWdQdnFpR2do?=
 =?utf-8?B?dHZnTVJzTkhxajlhZ0ZFdlRZV004TnhMMFkrRWFGVmd5NGVUNHY2ckZKU1JG?=
 =?utf-8?B?N0Zla2FpTEYyZHN4eWlJQml6cG83SUNxakFFdDlkZkRpOGpzL2EvZTN3TzZU?=
 =?utf-8?B?N3k2aUtPTlZlNGlEak9wR0hwMzZUQ2puc0d4QmxBSE5wT2pOb1prOStWZk9M?=
 =?utf-8?B?enlVTkVzcnB5R2RidXUvNjhna3pqS216U3QwcnAxVERtLytVOTRkYmNVcGll?=
 =?utf-8?Q?R1D5d2rHycD0l7FzucmJLzEo6791xSg1V1i0h?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b66160df-1a40-4554-10ac-08df306cead3
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 18:47:26.5259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /+Do6gLFZ16Esg0B+Za7cBQO12YprEfV9+1+DhkhG8ZB2y01nO9Xq0OKeZPd8lHAKoZKsYpizfgxhanDxnJeUO2Z2pQaiIZNyIRyaHpt3vVZoGPSRbcs52ijBY35SifE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12208

From: Frank Li <Frank.Li@nxp.com>


On Mon, 21 Sep 2026 20:51:35 -0400, Jaidev Shastri wrote:
> imx_scu_probe() fills struct imx_sc_ipc with the mailbox channels, the
> fast_ipc flag, the mutex and the completion, then stores its address to
> imx_sc_ipc_handle with a plain store. The clk, pinctrl, nvmem, rtc,
> thermal, gpio, reset, pmdomain, remoteproc, fec, flexcan and SOF drivers
> fetch it through imx_scu_get_handle() from their own probe and pass it
> to imx_scu_call_rpc(). Most are not children of the SCU node, so they
> probe from the deferred probe worker or a module load on another CPU
> while imx_scu_probe() is still running.
>
> [...]

Applied to imx/drivers-intend (will apear in linux-next after v7.4-rc1),
thanks!

[1/1] firmware: imx: scu: publish the SCU IPC handles with release semantics
      commit: bdf1e343170c28e4ffbc2efedf795be77ceb5f19

Best regards,
--
Frank Li <Frank.Li@nxp.com>
