Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794799479;
	b=yfvHp9x1GQSAoTgIxpiBHeunLJn4+lRLcOvCA8pd8b7hrTW+KsSk1LMTyj4O8++pa778
	 6Q40DYVnrQkpjD5TfvJ+3GOlCaRHoJ21DX7oFwQSjGrHpPlMkB83XSY8voW5Icthvn6OH
	 ZvPeb+HuYaLB0VCz7R4nQxFo6fOiiS2GBHsJ+Yxu1GSGLpChsl/ZgsJ+O2lntet5GTIdt
	 Pvjm1z9y9sndfPzSrvpQWZkcPpVnwFg/tOfFurKwuss2TRhUMaYsvUGFAQpr4iDOzJte7
	 QeTEv6Un9NSR5/1PForAiM0EwGYPO0K9ySGyqjLIpgHgBBTFS7yo0vmbpukaPwbkC9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794799479;
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
	bh=uTM2ml87GANpH1InxOPaKgm8p6p7ffmZA4E57DYrb3M=;
	b=JXzNYg9c5sAJZJh8X3I/K24ZY0rYuMQLmuyAv9taGiRB/K2d20jM7vRN6Eafz6G3O0xT
	 fo2nZYdIEGy2n90tGGKma/XVlzhl3UNDoqBlrumJ+cA0YbBvdozNVzbUWXJJ8qiuet7fA
	 /v8Y8VNsOH9c1dvVzv5LUdHjYzOgA2nCsC0rHDLVAdDYlj1gith2w+hHjNrBu8m5KVnES
	 zgamkT2L3VOB0Ok4TCXlwk3Y9v6jeowLF5P9rNGtnVDAO5MZ+Et4tKfXgKZPzDa5NBAq4
	 o7LyOkt86CSIE+oE9y2WDZ0wQvO2vrb+jwarsNWeQu8HB3fTQ5suyz+qpHKH176p4VQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=OUQKEaMq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.10
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013010.outbound.protection.outlook.com [52.101.72.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107F4606A8A4;
	Mon, 16 Nov 2026 03:24:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 107F4606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=OUQKEaMq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3EjAfFyiptyuLxn+8JfSHYbOvTkwOqFFMtAWGcDIqo8ZO7rmbSvYiJ9QvbXo6I4kCriBrMU3X26JD0LyucKcn4K5Xdru72LZih3xaKsoBDkvt3RSyI2wSB0PmUjG35KUHwSHm3iHTmkJoYw+ZORHlhItOiiy+wkbeG6P9kHS+E8NKI/Wkkp/AIxzxYJvV44dgWh1743h6XzYK8lfmOmfx2QUolkBqYlhVFSTkNztogM5bfOkD3vprCCuccwhvhhqaNKx6HUWjuC7NItTfwog9AjuumUfKvU4tFzo6TxhXu0VJP+2cwO8EoF0VHDGomcPVtE8mOLhY6uj5p806dAxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTM2ml87GANpH1InxOPaKgm8p6p7ffmZA4E57DYrb3M=;
 b=s072FenRi960+/p/Km74ZFnBihL4U1dc6ehnZ3uaY6WyV7ZndZ7BDec3HNWjReotUtDwbBk0l43xyaRQKEoC7H3ZbmZJo4FiYM/viGFmAPSqqUltk5sZUyTEayeheebuMNBzmtaWLSmhuI0LRXhs7wmnYsrcSNuPVZQ8znvh9ftufInyhWiTjHUQRPq9B7sfXvhJ7UYlUgsvlZuO4f9cyIOgDeYBY6VQMKrXSTA5ywaR4JPXa0UnnVNfEnzHNMmaN89z9hukRQ4b8xx8i6z0VdxQ0xkVhNKuGG7J5+hSEubI/frnHCPuDgQhrx0clKycjpvDyPCvTHfsyFq0yssdrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTM2ml87GANpH1InxOPaKgm8p6p7ffmZA4E57DYrb3M=;
 b=OUQKEaMqvG+TGTPNWDeL80whwG7to6j/Ro2++nKGDbxHITtHunluA17IaDl5WFHv+PBc9EVox+KgTYyz7PSr2Oj0qqBDtjY4hOkAFbLKAp1vGxoRwWetc6+nIu1WsjZmkrEt9y5LznAX3mqMYocSph5uHwSCZ3QqdaTLGJh7Uiv10K7smz5dD1WbANLKrU5trdD+IpcfH34JgYnCm0Mw92ZJ6vUS9WJ2q/UIQ0lpPMAKsc8a7ojWgLUU+fZ1LNJyteNM3PwXfoo1S9myo1j2c0mk7zmbMCfB2pPv5El/+61w1PGmlyymYU0Kr6oz++btVC0H6XW5ePUolrP/j7c0Wg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com (2603:10a6:10:10e::22)
 by BR0PR04MB591767.eurprd04.prod.outlook.com (2603:10a6:2c8:33::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 03:24:30 +0000
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960]) by DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 03:24:30 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 16 Nov 2026 11:28:28 +0800
Subject: [PATCH v5 10/11] media: imx8-isi: Add i.MX952 ISI support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-isi_imx952-v5-10-46de1d24efd4@oss.nxp.com>
References: <20261116-isi_imx952-v5-0-46de1d24efd4@oss.nxp.com>
In-Reply-To: <20261116-isi_imx952-v5-0-46de1d24efd4@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794799700; l=2995;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=1MRqb1YiaHge5H0wv8+yp1JocKEDGEtajiMoYv2c8QA=;
 b=LBeZctlZzZof+b+0dqtcIAw3hP/rx4HzVYzDvF8qz00H7Gj9oGzpg5T14MAyNB5he4jmQMOTt
 eLCX8VmyQTACW/dvxfgyxQB/TbftiEWYo8+EsBqt5DDNJKLHZxuBqz6
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI3PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:295::8) To DB8PR04MB6667.eurprd04.prod.outlook.com
 (2603:10a6:10:10e::22)
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
X-MS-TrafficTypeDiagnostic: DB8PR04MB6667:EE_|BR0PR04MB591767:EE_
X-MS-Office365-Filtering-Correlation-Id: 163cc967-fea4-45f3-9ef5-08df43912074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|376014|7416014|921020|10067099003|56012099006|11063799006|261026140227099003|261028144727099003|261022115727099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	w3gXz/sDC7rznu+KuZ/XYxCB6TulUBPO7ardHL8SM5vOoIq0UrdsfiyAxMRlRXytRW3S8VcCUSSd7CLBmy2Rub2LLdpxTba7kLYrK/0QGoo8Ee6jdxfArGtnJdWj4k7BeP3EcVroChc8krY1DPnwibdCpEUuGN1qg6DNfGhH6siIiGVoU8WCFjR+egbltzalzo8D99TlWyTtjbI5lF/r71IYHY+B166/EklBOcxnY/+XyGMydo/3xp5ktWqGzUBXHhLyZlJvSN/uQsNghVXsd6CPXUI8olFpBWfCufYvE3qpQMNtUFotm2uX+eEYiOAA3mcNWW9mUg94zAsKJMqAijgGN5qbwRhViBGuZDMoMuL5cF71JHZLLqwC4igeVI0fQsZNGwOO7l9W18xwK09RuI4OpxZTJ23R1DWOuPP5Iv1SABYXRu0K38SalXCpjG/Q/56UUMk1ehehqxJfyKaRPnMp2B1aybyX8bbTRmknSQybTIwbUv9aRV/4cNNbHC7B3p1cAdOhNFPZPZV9ucvPz9MafLgSjUQ5lkQ8YauLbYWiBDDLaU/eYO/bNfJBWvs02Ui+OpNCx7SVWbJViYzOGI6GCp0sgiJPVXtOSPbqy7cdDhcRueEg9QlJSKQ+GHwQFubKw8ajMAX9ExGlWKYkOSnQxpm1OjR9HUNgwvlH1N1vk29qHUvTdQ6T0IKQZAUT9KVK5T3iWFM4jgFSCTO/jg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6667.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(376014)(7416014)(921020)(10067099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261022115727099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YU5MM1JqOFB6OFpUUlJxaVE2aGt3TnBiRjRueUZpZzF2UnVxcEtrUGJDZkRN?=
 =?utf-8?B?MXozdnhXZVdvS2lrV3FFMVlBNUNCa1c3aHUwMkdCdkxnRXMxV3JvaVhYLzJa?=
 =?utf-8?B?ak5uUnRpd3h3K2JZejVTcGFheVNEdHM1RUEvUFFSTERTL0lINkQ0d0Vvb1JY?=
 =?utf-8?B?TTNOZHNTR205cCtsVEswTys4V1l0cktDZVdJOEhSeC9WZFByb0ZEMWFISEhC?=
 =?utf-8?B?bmNCa2VTeWhSSDJYTWZYSkpzaUlFcFpNY01LQjF0THRybG9zdXNjbTVqTG92?=
 =?utf-8?B?dVdkVlRJVmlEN1VuNXovalNKM29ZSC9ndWxnSkhzMnp6eXI5WHRPeGNNSCth?=
 =?utf-8?B?QnJ3QUhETC9hVTBNY0Z0SFJFUENyeWJBRThKZEVOT2cvN0FvSkFLemR2WkFN?=
 =?utf-8?B?dFBnc0pYMnVpeDBxNTNPb09oQUhkM05XbG9LZ014eEFJdVVPQmpXMi9ydDl6?=
 =?utf-8?B?emttZmw0RS8yK1h2dHI0VEF6OUNBMHh4Yk5sb05MSmRYdWI1a1JVeTJEQzM3?=
 =?utf-8?B?NjROOVlmbjdyOHN1WVhPQjhGdEN4N0hYMU5oYmw5and4cjZEQ0VOcHVxc1p6?=
 =?utf-8?B?bSttUHg4bkZOdkgwaTBCcmlNYmEyWFpyaTI3NmhhdStsZTArTTQ0VkJLdTBu?=
 =?utf-8?B?NEY5RE5hWjk4cUxSVHp1UWhrRUNBYmZiajdOZWxJb3ZvRldrVXlkbGtGaWl1?=
 =?utf-8?B?TnZoSWVIemdRQys3RTJWRUQ4dnVHcktvem0vKzB4ZnpDNkJlVnJMUGZsdVdo?=
 =?utf-8?B?cythWDROUUFpaFR3YVhXUWlVUUhmOEp1M05kaGtzWTJES3o0UkJvbkRpUEdM?=
 =?utf-8?B?S2RpbXh3U291dUFNVTJ3b21BNldSUmdETGZQSWpseDJqaUNObGFuZ0RVWXFW?=
 =?utf-8?B?QzI2dmYvTW9XVHlDSllLQ0ZRT3V3b3NNdUNPd0Z6dXBUNWt1WENpRWVGanJi?=
 =?utf-8?B?SzhPUXd3a0gzcUpnVUx6bU9HL2p5aTBkVENUVktrOEI1QTVTajJnY0VVYnZp?=
 =?utf-8?B?UEJPY0FGUmtJa2tKT3pJSjQxUFJNbFpEWGJWdjgrVUR1RDRJMXUyZ3JKWE1Y?=
 =?utf-8?B?VDI3azJmWlpOSlduYkxrQnEzSE4wNngrV3hsak5xQkhnSEJ4d25GK0RIajhs?=
 =?utf-8?B?em9mZEtEYjlMVGE0K2RCbmcyM2cyTmFSWnFXZW5vcndVOEduSTRXNC9wbkI5?=
 =?utf-8?B?OGUzejBTRUR4QVNPeTJGcHh0YTZrcFZMNSswV1BaelE0MVd3c3RiSS94Tmlr?=
 =?utf-8?B?Tlc4SG5qQnFIc0xmQVAvYTZSbEp4SGM3R1dDTUxkMGZsRmNqcWh5cFlxaUEv?=
 =?utf-8?B?Z1MwTEUxclp2bVBMRzRhTTBrN0I5dzdQNHE5cnQ0Qk5UdGl4MkxuT0lVL1Fs?=
 =?utf-8?B?dGpQMVJZQkRVTGEzRGhLU3NsMDRsU0YwdWlRMmlQcWNpWStjc0o0cGpCWVFB?=
 =?utf-8?B?M3RoK1FpNjdqRG94dnRqZzlNWXJ1enpGV21DamVJZGJxY1JvcUxoRWxQcm9N?=
 =?utf-8?B?TnNrYUZmaVc1b3FTVmNMSVZ4SVMyeDl2SVJPaEpYbTJSalJNalM3MTJVNUJn?=
 =?utf-8?B?SytaNFl0VUJ2Qlp2UUdxSkRiRU1zRlFzUDZia3paN2lkZ0RpUTZBYkl2eTI1?=
 =?utf-8?B?WTB6K0dMZTRPMHEwNko0emIzSE9HNndnWjh1dVhvdXNYcVF5enJKNWdGb0Ey?=
 =?utf-8?B?bmRnZmNPRW9GaWkwRHpYU1kyQjN5N1JzZWtHWkd1a0JlaG5leSs2bkIrVVUv?=
 =?utf-8?B?U1JmMTFZVENaaUJSWGg1WnZiWlJFQlpwb1FkOUNBeXRxZVNUY2JCUXpmOEgy?=
 =?utf-8?B?NDVYUllla3JFeWxFaGVUM0R5TTE1c1cxYTRodllJQjdMVm1yMFd1dGJHOHZH?=
 =?utf-8?B?SVNkaTJ3RUtnWGxLR3ZITnF5MS9lcjI3YjNXM3JEZ3ZjVU9xWm9CWjB3ZjFS?=
 =?utf-8?B?TGFEaHVUOG5RTldtTTNQM2k4NStiR215akYvS052WGJybW9ZMlgwakxiOEVO?=
 =?utf-8?B?NWxlR3Z0TFRHU1c1NnNZQzJtbkg2Q0t1NEd3MnUxZTBzdTVZOUZpUnhIYkVG?=
 =?utf-8?B?ekN1b3lCQXdnRHhkRlRlQ0VWVUw0ZWxoNzU3VnpjY0RFQWw0SEMvS2tRSVRn?=
 =?utf-8?B?THVxb25JcForYjJGWUZwS1I1MjVML3N0Y1lrQmxUeDRBeDAxM2hlcTExUjM2?=
 =?utf-8?B?Wm5QUllWeDk5Nkd6R2xhcWl1S3M1VG5ITjM2Umpha3FYZmhGaVE5dHZ5YTV4?=
 =?utf-8?B?cmo0c3JqeEtrZUpQVDRDeE5BMjlzVUV0MFB4aGUvQXYrZnBDck1BNmg3RmE5?=
 =?utf-8?B?TjRwUWZrbkFMUGJSQVFwVWFGbWV4MVRud2p4bTVVallrRytsc01hOEo1a3Jj?=
 =?utf-8?Q?D1QqpFfhckslBTI/cKR4DhwLxrkf0IhDmfuQa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 163cc967-fea4-45f3-9ef5-08df43912074
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6667.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 03:24:30.6369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/kpxcwmvOa+nVDhiv+ga5EnH+VLKw5ob6ocMVpMY9U3d11MAxmxbP2y4vuG0JQ6u/gCcJd8dStMqzbG7EKfpCyBFe+8kUqw6W00NkZTprsz6OGLTVMmMc/Nht6FwH+Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB591767

The i.MX952 ISI is reused from the i.MX95 ISI with a minor silicon
revision. It can process up to 8 image sources simultaneously and
obtain image data from up to 4 pixel link sources.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v3:
- Extend mask globally instead of per-platform (Laurent)
- Add Reviewed-by tag from Frank
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 13 +++++++++++++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  1 +
 drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h |  2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index f2a8eb82fbfd..bedf8515b1e7 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -384,6 +384,18 @@ static const struct mxc_isi_plat_data mxc_imx95_data = {
 	.has_36bit_dma		= true,
 };
 
+static const struct mxc_isi_plat_data mxc_imx952_data = {
+	.model			= MXC_ISI_IMX952,
+	.num_ports		= 4,
+	.num_channels		= 8,
+	.num_vc			= 8,
+	.reg_offset		= 0x10000,
+	.ier_reg		= &mxc_imx8_isi_ier_v2,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.buf_active_reverse	= true,
+	.has_36bit_dma		= true,
+};
+
 /* -----------------------------------------------------------------------------
  * Power management
  */
@@ -574,6 +586,7 @@ static const struct of_device_id mxc_isi_of_match[] = {
 	{ .compatible = "fsl,imx91-isi", .data = &mxc_imx91_data },
 	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
 	{ .compatible = "fsl,imx95-isi", .data = &mxc_imx95_data },
+	{ .compatible = "fsl,imx952-isi", .data = &mxc_imx952_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mxc_isi_of_match);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index ba0d6df98fd4..64e6961a4ea4 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -164,6 +164,7 @@ enum model {
 	MXC_ISI_IMX91,
 	MXC_ISI_IMX93,
 	MXC_ISI_IMX95,
+	MXC_ISI_IMX952,
 };
 
 struct mxc_isi_plat_data {
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
index b83a25a58ebe..d2b8a26b7c21 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
@@ -23,7 +23,7 @@
 #define CHNL_CTRL_RAW_IN_MSB_ALIGN				BIT(22)	/* i.MX{91,93,95} */
 /*
  * CHNL_CTRL_BLANK_PXL: i.MX8{QM,QXP} only
- * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX95 only
+ * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX{95,952} only
  */
 #define CHNL_CTRL_BLANK_PXL(n)					FIELD_PREP(GENMASK(23, 16), (n))
 #define CHNL_CTRL_VC_ID_1(n)					FIELD_PREP(BIT(16), (n))

-- 
2.34.1

