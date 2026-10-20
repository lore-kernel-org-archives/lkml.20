Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792527218;
	b=GI07FFKXqeGAAm7/JfLuBVNcIqirqXzBJsrQA7vvUeazt8HZaBVHtBS3GDaU1+/sOmeq
	 P/mDQSAL3pk0MAwtapqI+SDL4WjBGEQSIFfzxPPj1FQxD6mjHdszsY3fsoxfahF9wsycX
	 sI1Ddb0moK7AiGPx08gMAnnAOBs7jVA/ZRA+VT6ZriF9QdHnp7+6YxiY7xHEAKbe+Nt7x
	 +mtFxS2cSD87xeIxd1wlKE7L/LB87CSQPx9kXUmqCc6Qwd59SIDN7Ba4HJLH2BTkbQyq1
	 /YS/IVGo1FrTns5kWlUN/Htk3+oZWhLG0bENjs4h95eiS7uFUnNj3DH1fi2apOnPV1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792527218;
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
	bh=E0BVOrAg9ZUO/zhaZ4xokjtql7m5/l7q8eMvXVqJ7nM=;
	b=3BSCGNQvwsMF9sUurbe3b9pkGVg2gKF//66AedZjxeTNQ5VLpQ9qqxdSXFOT47HrCGM6
	 T97d87+uWw8TVE4UtV+tzTqxpLkDxqhO5rN/YYS3xe38ib0BP1yIlnwfDSImxeQdYPVai
	 mpMktki4p6HLzfeNL56XIJR44Xg2TegvwwSG4g6KJQcaKrgYTXkR5GOYvb6wb0uft+lkh
	 P/A17qGW1VRXNHBPdEw+FqPlJQbW0E1TRzVcGHG3m+pk4o67+2BpuOqlNmAmT7EglyktT
	 JMJdLV5Ia3luwm6drTV5lDjjfqEG7K1Qurnh6lzEQjuRqRnG48874RaZ6QjjEsmGquA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=iqUUl7Ff;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.6
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013006.outbound.protection.outlook.com [40.107.159.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA50606A33A;
	Tue, 20 Oct 2026 20:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AA50606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=iqUUl7Ff
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QEQ0JaM5TycR3hOWhdX2XsTLEZOcHaaGhtkWNGXjsnFgKG39Dvha7NkFJW55HMqQRFxjkWpdw430fitV6AaizsF2+LGiFC3mICI+ntHL1cSs1f3FlySL9mbR//93IKuEiimwphZW+vnxt/KGM8+EvxtF9sUxCcB7eZmBSRksmfBpYU5/jP4ugCI2lHISBlWdLjrBdsYwmsawZwS6GygSh5JyfZuajQSLWPLMogpdmVPbz+OJaVa+opcPdwo1QhCKkDCb5/tHuu3kNdyWOdppzf1Z8UcGiR/TlrR0SYoIYPVA528QXcQD0B0cl8Wn3tFaZgTJDOj6lMWYqwXb3j+wvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0BVOrAg9ZUO/zhaZ4xokjtql7m5/l7q8eMvXVqJ7nM=;
 b=EMvFhvFqwab6W3llFfYp0JND5w4NlY2I4Ptmm+YCqscMPuQS/fRlU90UMO7vIHsku/IRCD7lfOMPzy77ZEsOY3maLXbGkLHLFBIhITC29lKopmieBBGw9KIueuLq17InSHeH1rQCIPoHU8bfOeA20d/uQAkJlbgb1og7FZ78geyl4/Wu9HpHykNYJ2r9l/9x2T6CqQ25fOt3uie33vHQj/mzg0qdYLH+hVfswsmyib56uhNSUd3ig17tVUEVR7JJPugEQHHNfMh9ZNHc+I46ouo2MaQYDG/aZdR2ogATobC7cBG2Hn37dDXMVo/WYjgo8h4083PV1uYzPk7sd3b/Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0BVOrAg9ZUO/zhaZ4xokjtql7m5/l7q8eMvXVqJ7nM=;
 b=iqUUl7FfljWphD8RlILbzoNzm3KLLmxGdtBuMGqd6O3VOBvbph3qksZ2uN2MLeEEGXfD4q5IhFBAuGT+cPaemnAYi+Rb6YXzsrLsQ7InzMmqB1qwonN157oIOcgfdUNd6DnnRdHKFFBmEczxpIqN9Nhh1pn+ye+qyQp6l4lqm7AoANV8r4n20Cau3ib4PYonCShNPVD7AoaZRuBjAptupzrFofHkAgwy5ZIQdlKRf8FfE337jfHqhJBsAD21PDaN+y23GszW5H4eBORGJGeA01Dr16HuGf+R6P2L+XxQMJkMCpECjTs1rpqPZnpHmCetGoe0xm4iHCc4Be37/RKAIw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by PR3PR04MB7323.eurprd04.prod.outlook.com
 (2603:10a6:102:88::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 20:13:34 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 20:13:34 +0000
From: Frank.Li@oss.nxp.com
Date: Tue, 20 Oct 2026 16:12:55 -0400
Subject: [PATCH v3 5/7] arm64: dts: imx8dxl-evk: Add onboard GPIO mux
 controller
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-dxl_lcdif-v3-5-adc944659e14@nxp.com>
References: <20261020-dxl_lcdif-v3-0-adc944659e14@nxp.com>
In-Reply-To: <20261020-dxl_lcdif-v3-0-adc944659e14@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792527183; l=3501;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=jYzD2RVfOVBR+qWz2n2ExLd5k7W/4ZfwLHZae4xUDic=;
 b=oqAILzPHsT6TizULaMJhakJeYrYIhpQBgzCIAZOIMLeEc8C0XTH1+tyocfPEww6R/brt2UaOi
 t7xdP3hZt3RCmwAFTLpkRcuw9nMm/JEFx6bzWbvghJzk5K4k/2NWvX5
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8P221CA0039.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::14) To AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21)
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
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|PR3PR04MB7323:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d90c267-70a6-4d2b-9111-08df2ee69e67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|23010399003|7416014|1800799024|261009223027099003|10067099003|56012099006|6133799003|18002099003|22082099003|921020|11063799006;
X-Microsoft-Antispam-Message-Info:
	vOvJ6/6vv0PKuI4ZsFYBAC8qrYek/aJMy2rOZAKekZ9pQhg7QetlshQ70BfHfTgoaNpXcDop1IvlAsRWzRvHnAT/s7cdAlt9PCPh94CkJodBJYC6Yrft567NHPpVj7mqo1Uo6Wo9sXmO/88kueXiDMfcP9YcywGW6M+q3EBTwBmPA4p/PcCrTfd9CP6sVmUDYfrlLkze7Pmv97xr1CFZFYowiczXjZPIdn2TzLxBjAaAq9a5PIboUYP6NhhlJWQO+43IFvOeuUOExV4q+Tjyj1Z6e6CS5CehZ+pNvrBfV1RZ4rmuOeEilah/qvlyFxEhWOPRPLIVITLjb7OeGbWkPTYbpHnX3z9sp3jdnxX2tJr0iGaIbvITzkJ6Ni/vHEUB5pDsH+5nTtFkCzkwJuPe3eYmrA5WuGoAbazfjKrcEH0gpdDSzWPdPFQyVphttByVQA8ILCLcj09v0/UpG7lXSryFhq5RGrK4qZGC96XMxcd+sAg8+RQgXZ2bN6I3vPHpWChaGJK2V2f6Xh2q5r3IaiZ7X8R2GbRh1qLMCOlKcyvGEtPQZOOKi43L5Fw4pXJJF0U01WK3NStC5IWhCy9f00/e4gP7WXZ77J5s0I1sUC15n6bqHUXjtW0ByfuWPoe2Zxy9b1xyceWZea7yL6sPtMvIdCO1WtubXng68LAdOX2hDkLge8udPikvy9u7Tmu1iW2EkUwMwCi8K80m8s/ZgA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(23010399003)(7416014)(1800799024)(261009223027099003)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(921020)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkFKUFhpN2ROckFqUTBYVXE0Y2dkRVNnbzJMb2JhaXB5U3plQ1E2dFBoRm5k?=
 =?utf-8?B?ZTNFazZKaEIyWklZcUJxazBXejRLbTc1cUJ0d2pqTmxYdjBzV2JMQk1TZnky?=
 =?utf-8?B?eFNOYWRCVklyajZRRnZQSWdqVjJGdnFNQm5MenVOUUEzVmtoeHJ5TC9CbWpi?=
 =?utf-8?B?OGVEN3BHMGdYVGRHWTh0d2xMU1JUMUdsSld1bC9Qb1ZneTVPajlocmZxVnVq?=
 =?utf-8?B?clppcXVKK0hmZ1YwTGlZclV5VDNDSytpWVBmV0J3cE5GRW1TY2UwWW4zSVJL?=
 =?utf-8?B?Ni9TNWh5ZTNHbnRaenYva2tjd3ZzZG51NHpiWmxHSGRxOW94bG90c3RPTDhu?=
 =?utf-8?B?TmJtaDVIdWx3UGEzRGFRbjIyeTRzM05mZzZmZlp3NDMybFRONmtEZDF2bzNh?=
 =?utf-8?B?TFhNSWgwcndnZXJiZHJDVmRRb3BxU0VzVWVRWmFVOWV3NVdtZk9xaG5qbWpk?=
 =?utf-8?B?dDlhVWgrTmZpQlQzNVIxdExDTUpLeno5c0FnczU5azFRZFUrVFpYd0piNGJF?=
 =?utf-8?B?a25OVlhYR09DdEkxN21naklYSVp2T0VHTWtFejhLQlJZVXBpNTNucEs1eEFY?=
 =?utf-8?B?aFhGbmdMVWt2U2d3cDc2THBaWUwybkkxUXdpbE1Ha3hZRHhVaXB0ZnFwcHpi?=
 =?utf-8?B?YWRHZjU3UGdXcTNBMkIxTG5iTmxqYnZhV2VSVGlrbVBYME5wU2lWQXBqeVpm?=
 =?utf-8?B?VnNicTgzL1IrV2JFQ2p6YXpHd1RBUHozQnZTYStxb0NocVRWVWM2UjJnZ3h0?=
 =?utf-8?B?WXd3TGhtalpTSjZZSnQydk1UbXFQK1BQc0JEQUhPNk4vQTdmb052R2lpOGpC?=
 =?utf-8?B?KytZbVVjYUFteWlEajU5R3pNaWhHdG9pZTVwZWdRYWowdStRdmM4VDJQVEJM?=
 =?utf-8?B?NmQ5QlY4eXY4YmhwTHdIRzlkNkVjb1BhY1RRcWY1N0Q0aGlnNmdSNllDZ3JH?=
 =?utf-8?B?ZlVqdzN1WEpvSnZ6RUhDQzFzNWoreDlCdTVGOG84U2tvYW9YK2ZzMjdjaVRD?=
 =?utf-8?B?bnpKNE5yY1I2Rm54cFJKZU1uaGhLd0ZuQm84T3BUOUEyTXhLVTM3U3lTVjZX?=
 =?utf-8?B?TzBDMmltMTRQNm9uaG9oSGZQdnVjZnlXUWszSlRkanJucXNnU01mWlJIbUFJ?=
 =?utf-8?B?aHFpVXo3U3FJYVhFbjFFYzVKNjRsQWt5eTlSLzdibENBWnhMT3FYbFRPbGZa?=
 =?utf-8?B?elZMbU9KTENpdEwxSmJMZ2RhVUJlT2VqRytHYk9Mc3B5b2RHTk1xTnVINFlM?=
 =?utf-8?B?VkorWGt6eVFOU0FCc2NuaXVXOVBNczhrbnRrNVlGZ1oraWtuUno3enMyMXFG?=
 =?utf-8?B?ZVdBb280YVNHUU9IT3BvTVpJVzNuMFk2Z1pRMnoyek5PcVVEU2ZJNTVMWFpm?=
 =?utf-8?B?enppVm5NZ0xqa2JSbHV2VnZCOTB0TEhsbk5YVXFaWTkyMzBWMmdTbzVwRU5p?=
 =?utf-8?B?OE5Pci8yVDJkNktSdXRnNXJrSHUxZmIvazRQR1lxRWQwQzFkQlZzdWtHVUha?=
 =?utf-8?B?d1NoVXNTRWFPNTJVbVVVR1YvaHM4eUR2YjJNNXZQQzUxWUM1Wm9IS2FVa2sx?=
 =?utf-8?B?Q1QxMW9lQlJPdFJTLy9WdjRuYlpHMnhPekRpV25KbHNQWkZJbnpSbVF4VjVn?=
 =?utf-8?B?b1FpMWdqSlJVQkdRNGRwbzd3Mnl6VFlibm5IUTRjV3N4ZlBnKzA0azNPMlJY?=
 =?utf-8?B?QlBJYU82M1VaaTYvTmJDTG9XamdrY0N5clNIWnowN3ZBTkNLb2NnNHNuakhW?=
 =?utf-8?B?bmZZNW1kd2pZekxlejFMN09tVFZZeGlkek5nUzFBdHRKRDhQdjNhUlM1WkUz?=
 =?utf-8?B?czJZUGw1SWN5dmNmekdScEdjaENKdE1MRWEyWHJBUHRKVmxrSzVJMHgwYnZV?=
 =?utf-8?B?WERDOHptVmxWSStPckpOdGl6eW1OZ092MnJpRUhTMS9QNVJJdFFNVXBscmRW?=
 =?utf-8?B?aXVCVjdKWFluUHpkQ3dQRmFXc1VHTzhKdS8vbDNEQmVCVG5OUDVkWHdwcVB6?=
 =?utf-8?B?OUdVbWlCYm5WNnorcEVtZDdiMm1BMlVuQTFENlRGVDBhUnMrd0JQUHg3Tyt6?=
 =?utf-8?B?WEt1Qm1iMTVkanJnRXMzZjRmR2FQSExOWkoxUDB2UmhXVVh0cm9JbGliWXRV?=
 =?utf-8?B?cmRKdEVucGdOSlhHT01wQkVrK3dDOUJlTk14ODl5VDVQK3plMHpQZ2x1Wmpv?=
 =?utf-8?B?MjRvWHRpZnhOd0IvbU5CVVZ5Zm5YcTFEZkRZNzNhU2pkWnpuRncyb3RkOVEw?=
 =?utf-8?B?UDdTaC9YTGN3ck5Qb0lVb1NrRHBObEs3eWxtRmhjU3ZGeWNSRi9VbjdiaXhT?=
 =?utf-8?B?ZG94Zm9lbmhjc0s4bm1BR0RNbFBZZHVIZlNqVnMzbGF0NUEvK2xML0l4K0NC?=
 =?utf-8?Q?R0DjJxm6jGWtROmXuFUb0xNHsc8pvIJZU02Bu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d90c267-70a6-4d2b-9111-08df2ee69e67
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB12445.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 20:13:34.6004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HP/kT+W5ybmnFml87GgpO7kqDo16L5KK+ka93GYGExf7Yz4zgxb0fC5LMrNuNycgOk3rEU6a/NEndrI0gc0e+mfBRn5R66gvW149TJpAZ6XLnylrtwNEHzMFFMuEpIMn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7323

From: Frank Li <Frank.Li@nxp.com>

Add a GPIO mux controller to describe the onboard signal multiplexer.
Previously, the device tree relied on the hardware reset defaults to
select the mux state. Now that the kernel supports the pinctrl-multiplexer
framework, describe the onboard mux explicitly and let the kernel configure
the required routing.

Prepare for additional device tree overlays that require different mux
configurations.

Remove the regulator-m2uart1sel node, which incorrectly modeled the board
mux as a regulator.

There are no backward compatibility concerns, as the affected functions
(lpuart1 for Bluetooth, spi3, and m4_lpuart) are not used by existing other
users such as U-Boot.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts | 76 +++++++++++++++++++++++----
 1 file changed, 65 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
index 71eff3efa6d32..312e4ef3a6760 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
@@ -97,14 +97,68 @@ vdev0buffer: vdev0buffer@90400000 {
 		};
 	};
 
-	m2_uart1_sel: regulator-m2uart1sel {
-		compatible = "regulator-fixed";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-name = "m2_uart1_sel";
-		gpio = <&pca6416_1 6 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		regulator-always-on;
+	m4_debug_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pca6416_1 3 GPIO_ACTIVE_HIGH>;
+	};
+
+	spi3_mux: mux-controller-1 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pca6416_1 4 GPIO_ACTIVE_HIGH>;
+	};
+
+	uart1_mux: mux-controller-2 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pca6416_1 6 GPIO_ACTIVE_HIGH>;
+	};
+
+	spi0_mux: mux-controller-3 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pca6416_1 7 GPIO_ACTIVE_HIGH>;
+	};
+
+	pinctrl-gpiomux {
+		compatible = "pinctrl-multiplexer";
+
+		m4_debug_fun: cm4-uart-grp {
+			mux-states = <&m4_debug_mux 1>;
+		};
+
+		spi0_fun: spi0-grp {
+			mux-states = <&spi0_mux 1>;
+		};
+
+		spi3_fun: spi3-grp {
+			mux-states = <&spi3_mux 1>;
+		};
+
+		uart1_fun: uart1-grp {
+			mux-states = <&uart1_mux 1>;
+		};
+
+		lcd_0_fun: lcd0-grp {
+			mux-states = <&spi0_mux 0>;
+		};
+
+		lcd_1_fun: lcd1-grp {
+			mux-states = <&spi3_mux 0>;
+		};
+
+		lcd_2_fun: lcd2-grp {
+			mux-states = <&uart1_mux 0>;
+		};
+
+		lcd_3_fun: lcd3-grp {
+			mux-states = <&m4_debug_mux 0>;
+		};
 	};
 
 	mux3_en: regulator-0 {
@@ -620,7 +674,7 @@ &lpuart0 {
 
 &lpuart1 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_lpuart1>;
+	pinctrl-0 = <&pinctrl_lpuart1>, <&uart1_fun>;
 	status = "okay";
 
 	bluetooth {
@@ -658,7 +712,7 @@ &cm40_intmux {
 
 &cm40_lpuart {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_cm40_lpuart>;
+	pinctrl-0 = <&pinctrl_cm40_lpuart>, <&m4_debug_fun>;
 	status = "disabled";
 };
 
@@ -879,7 +933,7 @@ &usdhc2 {
 &lpspi3 {
 	fsl,spi-only-use-cs1-sel;
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_lpspi3>;
+	pinctrl-0 = <&pinctrl_lpspi3>, <&spi3_fun>;
 	status = "okay";
 };
 

-- 
2.43.0

