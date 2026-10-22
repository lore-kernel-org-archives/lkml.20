Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792698646;
	b=zwQjTFjChECbPIuIhxyYySNbBKO61wCLCjo/e8AJ9+43n/armCqDVRvo8yUYwcVY1KC6
	 Vdf+9lUCrWwU80ZvawRe06Tk08dL1ihbfDhA63nwH7QBRgOcBNnhjaqrVjLMLOyre/Mb5
	 nhzsETp8fA5DA/Ip/189ZDfifITnuGSdPYD8wRX/vchilzc1WEN9jWY5+Sg3PnmdRbGxh
	 2u/47uQLz3BkeNaLsPV119cJdu3OyR6W6g5hgua/sQBvGo3Hiepiir9sMFrWyp+zBgimP
	 PUR75aBGMfY6XgObjrHqpWiWfqae60RaeUIJXjO/jFtNbg4XJewQNF8rYF58IxvbP4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792698646;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
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
	bh=D0PTUNXXCE28j6tdwnXKopR9qRI2aO59ntVwxtBdqq8=;
	b=UynwxcHTOHmUMiki9Gq5yL0Lo0dc5IfI9rUG0T5RlwCYhxZUQ/bfJ9sFgTcXaVm8zlmj
	 DCtWF4Gk2df0kIOrU1lAVkoC6dDgk/vCUWgOw2xXBPGrwJK+eRbCIV93Px2liAw5hjFS5
	 4KSM/WS5ixLzzglEWLhEXdi9a4p4GiQIqq8A77P/x8Q2+q84lvGdWUPchl/08oB/iWKoA
	 aY2/XmLexTnPIdF5d/rXh1CF87eAWC/Qqjv22zGp5rKSwKtJHR/qDq5Dz6Ps3r2VvgFwU
	 AG1hGPfpaeXQDNB60ARWXTZ5d44CmL0qdYJXnYM5illF5UW3Q7U/5NQNYEJwQhPCvcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Fs3BTxkd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.30
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010030.outbound.protection.outlook.com [52.101.69.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70442606A31A;
	Thu, 22 Oct 2026 19:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70442606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Fs3BTxkd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e7ABZGlyeDfBdj2IslxYKzJE33sZSxqWPBFrDVZEVovCbRvnmBSl8i9eEROvGYZReHyVsV6f4NWD0lzy+tUhqc+DZnDIqfcu+zRinL+iPFk3U+Khi1pV1oqOdR/xtq5Ba5bSDoTIttkr4mciK0nlltRNh6JZIvjXUxHdGDOXetf2lxc/9WlE1iZ0Jc6duvs6olEbxf9MAa4S0WV5ds9/CYifQFL20/tWrtKzdn5zB/xAXLzPUkV53dz1mt/AVqlr9xmWKWrmSHENA65A37TSvGuGXHTNXVWohA1m++xdHI5C4wJQJOfpYkHQBwNJ51ishOq6yEKszDr4pe3Z4wxsOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0PTUNXXCE28j6tdwnXKopR9qRI2aO59ntVwxtBdqq8=;
 b=c4DZHbp2ScK/eVRR8dXg0b78Tj4zevIBjddR2euQMmiqmqVr+Y6W0byj8jTJSSbR4Vv10GOxFauR/jKnRxTFWZlE2q4BRjQQ+PlssmyvvWAckbgXdbDpzS3/bIoLbyMNM/Ruqd+GqaFXNJEcQefeqjax1prKV+qO6/fjDZyJ8vAo+XclomQyeSC60ypgkt6jmovmykRvogKfk752+z9tr6nEs3KN4mWaKM84bMCY8l9+JhH9XxI0sIDpzS+7DMyOv5dKFOuHcjIaOj1fw88YP2AH+Qk/6IeXZ2Nvb7GO2D3UynZVEq4IUucrO3AEu5xojyD2QHhqLVDOKEj+9AtsRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0PTUNXXCE28j6tdwnXKopR9qRI2aO59ntVwxtBdqq8=;
 b=Fs3BTxkdKudD072xO+iIrWVs5Mj67vrwld5OJO9PewYdb/0NLLIKXKhruvBKjjSuRVT5j+yZ0ORi1Mf8ttJ7V5rT18Vb+QYdnaZEfPmzc+v70E/xX6CkT39TccF/RvKmw5KWivbffCmmHDVXsg1vmYMeKdvjwm8isL3HaMW3iFbNgQT0m03jBnaiGzpXI2pKpzoRtv1uL4emYyNqZl6ykImovA7oxCZXg65hrWYIzS0HTSnoTifxisRpPdqvJtpInfeRjd6IpoGpGBgzc74ioHl8gaqaJCHTpA88A8oWciO6n8D10YvjtGviYJw4Xr8GYHTx2WL62C5KgDIP2D6OdQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB8074.eurprd04.prod.outlook.com (2603:10a6:10:24a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Thu, 22 Oct
 2026 19:50:42 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 19:50:42 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Frank Li <Frank.Li@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] arm64: dts: freescale: imx95-verdin: fix i3c2 pinctrl group node name
Date: Thu, 22 Oct 2026 15:50:35 -0400
Message-ID: <179269861299.1269298.17884626125062070112.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002090228.41445-1-francesco@dolcini.it>
References: <20261002090228.41445-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH5P222CA0010.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::11) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: e8d54929-cdf8-4dd3-b0db-08df3075c16d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|23010399003|1800799024|366016|10067099003|22082099003|18002099003|11063799006|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	eWjX4kwdgerryE3V6gLZXwbnKlxehUMtgaL1LdzB2Tc4HDN92Nh4eGGe8PduhZjMrS3A90eQ1yct+BFJaK68khDMwgL5hkCdWSfrhdOWKW1uuUgzsT2O/XgOhOwG5Iu83MJSTWUTtsbv17itAIdWVJv3sqW210jVO5HMAJ3bjXWcJ205vRW+wUcBqe/XlaYRzDIZnL79nE9JoMSLvipq9H/0xP0iZLbVCFEcL5NzOTVfN+lQxk4OlutEcUi3ex+PkVQjKjOlrxRa1QTsfbHH33S/xWnT4G68Nnom2O7YZGMRblUQ3CenerudrOR+n4UnQOSATSfMPa0RUrx+Cb9OGiDJkvGzbG3LmAJQ1MfwZMXw3QwH/eTzYSOeWynptZzOm8D/CW9dWOh/DqDwdj8M8KlcM7BPk6AKvk3J/6XEadKeczr3AXs0s5De+Bq7Dw1sI+y1r1AZ+1YAPA+xHImJRYK2yM9GjvuuBcg2Gxn88L5iNLn9oeWiSRXTBAlmOzj6PuVZyJizk40cVpmoqCIDI5GZeo4Tn2SFBsSs8Pxiy4hPm/39Dh4xBuTQatOCEPmZ7Ej65LxGYeE7PvCaAdxP76mIEQZrm4Y8bl2KmSrKBlb5Mt5Snq91gSHoFqgI26ZeItlH5lzHmAw4BI/sadmeRZLvYbcqFf1eT5TTixj2aiQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(23010399003)(1800799024)(366016)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0FYQ01mNmRORVRORmdvMGdMbTdJQitrRzZBdTdEd21RVS90OUM2aXBXWUVR?=
 =?utf-8?B?L25UMkJhekZjVHhESFgxSUJiL3Npank3WjhMTlgvSHFpQUJHK01qUU1waHNz?=
 =?utf-8?B?emN3ZzdSdGdNQ3dWdWtCdE9DdUNpZjdmQTArdWFaV1ZyUU9zdFJlYUt0UVhx?=
 =?utf-8?B?ODlVOS8rN0prbVpiL2h6NHRBMGtZd0tNVFNuemNQN1daSUJiVDVqRWxHRlIz?=
 =?utf-8?B?ZjBYVTlFcUNtSmthT2lWcUhJNWRoNkdFU055NUJwUGFwQnJSU3J2Wmc0SVpY?=
 =?utf-8?B?N1M1WXZrR2hWblhBMW12S2dQTVNqU3p1WFpvT0FuSThMWElJV2dRWnhTdmsw?=
 =?utf-8?B?KzZYRk1OMEJ6YTJaVUszVCtLU2FEbEhEK3NyOGM0dHB0Qko1WjMzdkVaQzhJ?=
 =?utf-8?B?NmVQcjg0VE4xSW5MYVdzNWROY3hldVhnY0tyWm04cjI3Z1daUFNneDdjSjZI?=
 =?utf-8?B?SGtRZWhYVWVpaDZNcFBRR2Y0M1pIYTVLanhqV1BGUFZrZ21BQXRFV2RTb0tt?=
 =?utf-8?B?RFYrbnlEQmZTRkphdzlNK21VUzE3NHlJQS9qZWlLS2IwQlRKc1gvSnE4Mk91?=
 =?utf-8?B?RnFIUmFFOGxKVFpIalJYZHlCVU0waUdjeU5HV25ReHZnMVNRQm9GUE5iWFBD?=
 =?utf-8?B?cnlabUs1V1hEcjdSbWp1UlptQXpYSkhqQzdLa1hOYm1vUXJ3blJvZm1kODBv?=
 =?utf-8?B?WDQzU2k1ZktDL0ljTitwRk5KS1NjOEl4Uk9JUmxmTlVUOEl1Y3Bua29aSkxE?=
 =?utf-8?B?VndVdUtoRUc5OGlmY1NFY0hjR0l0dE5LK0twb2lscEpaT2t2cytHeGIvNE5l?=
 =?utf-8?B?S2ZLbGhpTmkrWVVDbGViVENiYVlVRWZYUWV1dWU5M09wWkQ0TzdWZ0RYazNR?=
 =?utf-8?B?MEViT0RxMGZ3VWo3dTZaWVZwTU9KeVViYk5kcGlyU0thcE12emJaL2MyRXVP?=
 =?utf-8?B?cjJINHBYa2xwSXl5dEJzNDZhN1ZFVXhLbis2d3pBYlQzRFM0emhDYWE1ZGR6?=
 =?utf-8?B?L2lIaWRQSWI5RXkxTTBaWFZDS3RtYWFyU00yL1oxeTNWTldJcGlUTXg2YlRl?=
 =?utf-8?B?bFZ2WUVLaWM4cjUvS0xxYmJrVFNSSllFZC94MzFLeGxraGMvU0xDMWhXM2lR?=
 =?utf-8?B?YndkYVQxN0VreXltVGVOUk1JK3poREU5emt2M0VjclhrOEZ6aXk5V3E2UVlC?=
 =?utf-8?B?d24vZHNEMDhMcU5zZlIreW9MT09OeXZCT0FzRy9HVjFxbklST2ovNzNrVGx1?=
 =?utf-8?B?MzV6dFI1c3JGZis0RGtDcE5zZFJPeStlMkp4N2ZDUk9pRE5NVDFjeFZnUVVW?=
 =?utf-8?B?bDlsSkZTc0R3M3dzY1l2bG9XYU0xcG1JazFBVGlHK295UHdIU2hlWlI4YXUz?=
 =?utf-8?B?RU9ZTnpuK0kwZHJxQzRkVi9ZUENrbjR5MU4wVm5TazdvZEFUdW56YWMrVm1n?=
 =?utf-8?B?WFBqSlA5ODlMUzVCT0IxazdGWnJpWGo2TGdiQkU2djBIdURKcXhmZmVmYXl0?=
 =?utf-8?B?RTcvYXROVXZyb1diUGFqRm1mMDAvMkdvWWprVDFMTE4rWUlMT0g4MzFmQzBl?=
 =?utf-8?B?ZWlSKytyK1pRQXQzOTgvbXA3bThlTGU2Zlh4dkdOaDFlZHJ1dTg4SGVLVWZG?=
 =?utf-8?B?enVRTDI3cEhaVVBDeERMN1RhNzRXbXo5NFNGbXFIcU9JMkErMEpmbTJiQzIw?=
 =?utf-8?B?bUU2VFp4cm1QRFRuci9JUTVrRFZzRDN3eSt2VUhBLzFmZTBaS2EyVjJNbU8y?=
 =?utf-8?B?L1Y1eHhua29aUWZ5ZjFxaDlEbWdTRUtESUd2d3VFVXFvTWVVbm5YdnJoUnhl?=
 =?utf-8?B?Uk42UlhzOUhHN0xPQ0xCQURXYWprTFowYUVQcS9JdEMyMUFDZTNiR3dXZGh3?=
 =?utf-8?B?Q055S1puSUZJWCtlTnVxS0IvZnF5bzY4WklpTW1NRE9xOWxFcEVZanBUUytO?=
 =?utf-8?B?U3EyT1dmcnNkUGdCTEt0dk9VakJ5cS9VUmNBQmVnK1RDNElPcEJSQ2ZXMEgy?=
 =?utf-8?B?d0FjNlpPTkVFKzlxMTNzcnBtcjlSS2Y2OFF2QmdrUGF5MUxKSmQxS3ZuRVlu?=
 =?utf-8?B?c3hJczc3Y0NXWmdVN2MwbkpTTWV0dytMdFNYNXJRbUhYQXhUNmppclZrL0Yv?=
 =?utf-8?B?TXlzSTJMdHVZTjlBYzVnbC9NMlpMRjVBb1VWdVhCOGErQ0duMkJHcGFmZ0V6?=
 =?utf-8?B?bDlvbHFYYisvMHpPNWM2a0VSeXpWY1FsRHh2bDNEWjBwZnZSenRVdW55UjIw?=
 =?utf-8?B?VlRwQi8yVmdPMGFvSm5Sc3U5S05ESTMzeHcyS00ySTBXWmtEQklIaHk2cHp5?=
 =?utf-8?B?b1pzWmhDZzJXQ0xETXJhTWNxYUh5NmpFYmpWYXhyRS93ckJMbjBwbUQ4a3VS?=
 =?utf-8?Q?fTxtMHaxDeVzutdEqXFdcijKNLNUt9Ip+99Jg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d54929-cdf8-4dd3-b0db-08df3075c16d
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 19:50:42.5509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ujpErkLd6NfRnEeF15ZL5CWBn7XTagQiAeayHmsLgJFKM1jzikKRFzrnshebaDwvoG2dsluxOoaunZu83/4KFCQ+rwxlsE0jkemWYktm3wEjqKlHie8JFPMn4EhqXjbr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8074

From: Frank Li <Frank.Li@nxp.com>


On Fri, 02 Oct 2026 11:02:26 +0200, Francesco Dolcini wrote:
> The pinctrl group node for I3C2 is named "i3c2cgrp", with a stray "c".
> Rename it to "i3c2grp" to match the label and the usual naming convention.

Applied to imx/dt64-intend (will appear to linux-next after v7.4-rc1),
thanks!

[1/2] arm64: dts: freescale: imx95-verdin: fix i3c2 pinctrl group node name
      commit: cbaf847e988f68b46be722a67b9f7484a8e28238
[2/2] arm64: dts: freescale: imx95-aquila: fix i3c2 pinctrl group node name
      commit: 54d9772b07144904ac674378df51e808b317940d

Best regards,
--
Frank Li <Frank.Li@nxp.com>
