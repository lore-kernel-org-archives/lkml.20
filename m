Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013013.outbound.protection.outlook.com [40.107.162.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B42393DF3;
	Wed,  2 Sep 2026 19:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377175; cv=fail; b=nGqP+4xFw1oDGIyZxrLFUEgUC8W5ASxHDOVQiyiwmU2KdSfikn/rtYC0op+tk3TxKN2abHhWFvZN4FKjaKEJvtXBBm1V6HL52zHzwfqKVqEDZIz0lsgPM9DaVwfTJWVwMORwxIWYeHMe2eXSPXX1sYpjO1nLwedqGjiaCC9uve4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377175; c=relaxed/simple;
	bh=lYg4nG7Q+ovcJQ9xDOyKxym/wf7KLTUTaKWw5mtUYSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mq40vnyjvihL4F0aCImrl71rFJJ9cVky3dts7v7BYetWyNth1srFLSZNt9LiBMBTzkoPwg8wnCnbTzPcItwPgwwtuViBNqnASrTyOKyXqLxqHzBHFoWFDSNtAOnFhoxRSNTcPxwpnVI4h+lMfbQFJcah8Yjm6IP/nZNHvFn+dbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=r/PtcO9K; arc=fail smtp.client-ip=40.107.162.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="r/PtcO9K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xf1mPOUkc1VX3L80oQOrJatVbc62U67q8Tw/20fJ0xY0Vv+qvi69tVIFT2ivuhjEjCAuwX9nVu2hY3vRjqzFYCdpD6bmakkVKVftzrzzqV9DpJO4AXgVWOenAtxkAS+ENYZ777YsPa8TKKP/vDJtkmvpShv8qviTeO6aWqF1kl1a37ngG5t6E8h/c9inuQIR5Hw/PW3HjBr9tuh7CR1SYYlVMMc2fOSePJeuW7ekSV9P5VWXuIwm2qWR6pH0EfKcHUc2Mqj0eMpGj81tqqP8kWsFfums66lSgn706oxhjM+sZM+PqTnXxzVg4gP8CeclbJ3Dk9X1r9AqPyRh1Df4FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xbJzYhkEO/MuYddVnDL0XXf9dDSjrZqbvlkJJnkSMM=;
 b=PpKJI4XRjbaWC9C+oEHHtw3vMPxiedJbQl+yrKwK9O68tzTe4NfnBRRokUGRmq5sDKYvlfOwPQMBYIFow6/vL5kdhjROr8Gkh+FQ1fBea6WmhFltdfVXD4gUBLJGDEYgLg1UzVOCUjOGGG4Zbb8b763kPXTKJzxhPp+cpt7qD4wEVn91gf8PmusclM74E4WX94XoshjzLAl2+he48LN7zBIXpHlPbcg2yMYY89r2xYWrBpluhezTf6NRzrpBvpMkjvciXfKv2nEJqjU68ApTjwgFnJgROthP7zI/Vux8RzZumkPTDCY4bb2lf9hjmRk4u59v+PPRfx1bA8fQ8IXu8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xbJzYhkEO/MuYddVnDL0XXf9dDSjrZqbvlkJJnkSMM=;
 b=r/PtcO9KMWR2NGWh1rELRtuTRX70YZ9/8RMdaqrom+432mKykDku2y4Q2PzvbL2V6kQkMupwjTyogIrqgJB0WGa0/BGtAx9jsuVhsD/9epX+DW768R5RZDZPWbOnVXtDcm/28TyFsrdU83QoWzR/ouDO2v0t6dRzy3tIW8CiKB1idFwpAEMCYdku8tqcxr3jZwZZSzo+Qp25DmJcBaha36i8ULt1BY/X0RwKhUZ/yB8bEh4NCjLEaoM/RIyEsG58bpN/2ZVJF4g9j1lZM7KpWkCQqnnAn5DZQ4EyOZWpMG6+K4cL5HkRlQjzcNNQ7DGPnQGWShSC7qjKJnjE+w49ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB10338.eurprd04.prod.outlook.com (2603:10a6:10:565::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 19:26:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 19:26:01 +0000
From: Frank.Li@oss.nxp.com
To: Carlos Song <carlos.song@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Josua Mayer <josua@solid-run.com>,
	Vincent Jardin <vjardin@free.fr>
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thibaut Collet <thbt.cllt@gmail.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: lx2160a: fix the malformed pinmux entries
Date: Wed,  2 Sep 2026 15:25:54 -0400
Message-ID: <178837711789.2093260.2516319478296690803.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824-for-upstream-lx2160a-pinmux-fix-v3-0-5556ff1e6be2@free.fr>
References: <20260824-for-upstream-lx2160a-pinmux-fix-v3-0-5556ff1e6be2@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:510:174::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB10338:EE_
X-MS-Office365-Filtering-Correlation-Id: 340d67e4-1127-4659-b7d4-08df092805b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|1800799024|7416014|23010399003|366016|11063799006|10067099003|22082099003|18002099003|56012099006|41080700001;
X-Microsoft-Antispam-Message-Info:
	fsyT4TLMLPrzqjVhFmlp8rgFtdCgqgbCO1Z/kdQ2O1+YzXssCGY2+ubbrnGZm6SJZuInH8Ur8jT3l+dUBp6dc2S+SPC/rEZTuf3RpkSvRkDSexLmWm2BY61F2Ybxvt83IRsmwycmrOrivzpBXWkf/KaAdUqkdylgAtmbWEVircvUUhbGjOMOlhg2YT6/ia7xHJQQLMN1s9Uknwj2Uuwy1SFNeP7YES3M9Q6dLzivWnon034hp7dx5Cs/04eKKNJDU+BVVm1pAbqg+PouBwA+S5c7Ehr6ouk+ygUxpyBKZ5Ch7I3AMarI6u5fP6P8L6bdBjh/xUU8GtWIGGPfnDrgjqURWBBID/Z+7vZu+xWjMA8nPHyoSAfImU+ndhexGAnaSF5boypoYKCl1+YRmg763/Yv76y4Wv2XGyl+ECI/TkMNOCqvVkSamecWn1qt/ULZEILuECp+Wosym/3mmWwIwhyd2cTjUWFoVx6ysycp8rHKfskB00HgM+Q1RjcAH7Uc0tY+iIbKWE6hC/cXs4acSpj552HMKrKBzp39wquxteo3sl2qCIC1QUnyhJTVfVtO1URk0OfqTgM+xF6vb4wGmsBgGNXn98Q/26vM/vEO4wcLOluagDAIsAfnbzUH3RNizRhooTMlHfre46AEd8aBlQycrY28X7pfLGQi+Kv1goHHKGB7XFCohr0oRXwT3hnjhcTqssLbfFMZt5wt54mheQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(7416014)(23010399003)(366016)(11063799006)(10067099003)(22082099003)(18002099003)(56012099006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkwrVUpjZGRGbUYxZ1JJckcrTU5MZ0FBYmp0bXdLOENxVDN3T0NLVzdxS2xB?=
 =?utf-8?B?c1NYYWE2RlNJTVlUZFVKSHZyR0RDaENjcy9CSW5IUGpYY0RnWXp0SXJaMmVH?=
 =?utf-8?B?cFZ2b0FiOW5sV1ErN3NMelVhUE8rZ0ovYXJqNWdyUHQyUitEUEk0UkFDVnB4?=
 =?utf-8?B?ZUU3Q3oydWNLZGcva2twTk55bXhaWW1wbnNrYzIrNTBYMEZQUTQ0MnFhc2NG?=
 =?utf-8?B?dS9BcC9Nam9IS2dPQURBbUxOUldSUzY3MmlNckJ2NytmMUNCUnVRSlBVbi9r?=
 =?utf-8?B?MlNJSG4yOUNRNGkrblJ1Z1NSRkx5K2R4amFwdnluN0xrYURzN2RXRzJ3Uitl?=
 =?utf-8?B?U3gvUEswVkM0OWpWMlFnVGIzM2lKa0QvVCtwWE5DWVBJSG0wa3hwb1ltOW9m?=
 =?utf-8?B?SFdwU2I3WlVBeDFwZ0FtSmFld0R1NGZkczFiSFA2UmVoNU5SVGpnUlZRc1Fy?=
 =?utf-8?B?a1VoQ2YvVUlKdjZjN2NmdnBubXhSM0NqVzVRNElRMEhwY3phcUVGdkdPa2VO?=
 =?utf-8?B?d3Z3VlV5OTJFYW9laFM0SGREalA0VHdxckdRVjVYQ0VCUXNmU2dwTnFPc29v?=
 =?utf-8?B?eFdxWW9lOFM4R1FNaHpQeitXcUFzTVBhRTNiYXl0bWlpZlR6L01ZV2VMZmF3?=
 =?utf-8?B?R0dlOTkzTkpJN1FkUzNXWVg4cUthL2hpamphaURzUmVGNjlHQUo3M3JpSFJ3?=
 =?utf-8?B?cUdpVk5uamNFZkdYN1RrczlRbFVWN0I0ejM0cm9MMFVVRVlheUZVMkFEK1NE?=
 =?utf-8?B?bHE4VFZ5WWhUMVU0aS9jc05OVWdMU1VGZ2JEYWFqQzRXNllJRCtaUUY2akM4?=
 =?utf-8?B?RTg3amlldFZRY2tnNENoZmREQ1lkZCt4c1dyT2Jya3hwd3BoUldkbW5BamlZ?=
 =?utf-8?B?aHVkbTJNck1xZFpOTGdzaEE5VmlvOEhzNms0cEYrQ0hqNXJ4UlMzNU8rSHkz?=
 =?utf-8?B?ZEhqNmg4OFhiVVhPV2xQdlVvRThEQnB4ZXBnUVVqVW81YTNOVGcwcFRPY2wy?=
 =?utf-8?B?K0piWUJWVDB4NTQ2WWRVM0ZlS0NEcml2VFRwZFNhR3ViV3EzWm4zcDc5NXl5?=
 =?utf-8?B?Zng3SHpVUGZ3UkIyTUZYb0JUSzNDa0l3dlBXam45dDc5UXhtaTM3SktMMjlH?=
 =?utf-8?B?NE96a0JZOVJZM3JpazlnQ1FrOG5kcGFHR29MWEljd3NDK0kyeTg4aXo4S3Bx?=
 =?utf-8?B?VFlXRWZQTUMzN0g4Vk5HL3BhckFrdFhJdFBIb1cvOXoraHFQajJlanNSb2hT?=
 =?utf-8?B?NmhIeE9XTEtyMTkrbzdNTFA4TnV0emF6Y1BFYTFXMU9SdjFBQUpteGZ1VDg5?=
 =?utf-8?B?ZlRvWUNuTG1aa3h3WlVmMXZPMkRyYzlCaEhEN2hFZWRlSmNGVGhhRHViamNK?=
 =?utf-8?B?eDl0NlBmN25FbnBHdWJBbktMRXZlNnBWc2FVbTUydkRScjIxZ2Yzb1pHWTRB?=
 =?utf-8?B?bTBINXp5VllrQVFFblQrWUN4dUdSdEhCMkFIK0t1SlAxVkhPcXFBK2RwRDFm?=
 =?utf-8?B?TGhndVhNd0lrNHBKOTVna0N1MVgvT011b2V2RXVpRFgvdHZmWE9GYW9Xck8x?=
 =?utf-8?B?ZXFGZDExbTZNNmJFaG1OdVNzUEgycDFuU1VzRS9Jck1hN1ppNis0L1lPVGVm?=
 =?utf-8?B?cXVTc2ZPSkUwNzBma1NRN3E5bTlTcjVQR2U1dU53QUR4S1F6allQemV1N1h2?=
 =?utf-8?B?UHlReE9IeDRXTXI0L3hCSkQvbEFVRXNEdzZmQ0V3cmpYbmhYc1pRdlVBcXA4?=
 =?utf-8?B?ZFdENEpCdzBPUnhrdFJJbThuYWZIaUlxRXNwNDVQb1lrN0dWYW5IS3VSTDRq?=
 =?utf-8?B?VG1kelo2Um40SUFLdyt3dzJRa0JzTHZwZE5NS2hlZlppREJOZ1NTc2ltL0tE?=
 =?utf-8?B?WFdWM21FWHZ6WUZXaGF5WmxWOWN4RjMxQjFqcFNsMjlTM3pRU3g1UzYvcW1N?=
 =?utf-8?B?MFlrN1R5Vmc1UW9tRU9CSHBqVUZJV2FwODVMVi9MbE85NXFRZzN6cS9jZWNo?=
 =?utf-8?B?aDBZaCtBQlVEdDJTOWs1YWVXbHZPRmxpS0haTnJ2S29yMXVtcFMrOGZMZGx0?=
 =?utf-8?B?S0xHeVAvNm01TWRDUXl2czJnVm1idm5qbGRvU3JsK1BTMUlIazFmbHE5UlQ0?=
 =?utf-8?B?Sk9RV2RTWUV5V0N2bnhFNjRYam1aVmFaUGdKaVNyV25MT0ViWnlQb1V3cWJr?=
 =?utf-8?B?b3Foc05tMUUrbmthTWVRNUhRTXhMNnFiUmdkMmMyaHFYSWNwM1ozL1dQSk9o?=
 =?utf-8?B?YUNJR1cwNFBTbTIvZzVIT0FpcGdUTzg2T09IekFNdTVJdFhzZ1BsRkJBZEV6?=
 =?utf-8?B?eGJUcDBSUExaZnVWdWR4RkxQeENsKzRFc3ZNRnZpeU9RUHRUZXFweno0M2dG?=
 =?utf-8?Q?Sp0HvYOWn00ICkg9mmUvpgIezAXBezTBJFPqU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 340d67e4-1127-4659-b7d4-08df092805b5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 19:26:01.0846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j373DLpO++1ZCt047myJuu0rKwF+MQXUMmIR6Uo/437SK7TH4exSXLkjArLCUmbW5DMBp2fFe3Q1mnRv572jkAVu82c6e/uimbdW4A94PGxOOFrIFmzVT1o1cDJSWlbH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10338

From: Frank Li <Frank.Li@nxp.com>


On Mon, 24 Aug 2026 23:25:28 +0200, Vincent Jardin wrote:
> Every pinctrl-single,bits entry in the lx2160a pinmux@70010012c node was
> reviewed against what pinctrl-single actually accepts in bit-per-mux mode:
>  the offset has to name one of the three registers the node maps,
>  the mask has to equal pinctrl-single,function-mask shifted to the field,
>  the value has to fit inside that mask.
>
> Three entries fail one of those rules, and each fails differently:
>
> [...]

Applied to imx/fixes, thanks!

[1/3] arm64: dts: lx2160a: fix incorrect pinmux
      commit: 8188a59dd6782786556b18f515090b79cb701c45
[2/3] arm64: dts: lx2160a: fix IIC1 pinmux submask rejected by pinctrl-single
      commit: 6affdda171ca8f2e082e8c4fba56233a2f8c9910
[3/3] arm64: dts: lx2160a: fix the iic5 spi3 pinmux offset and value
      commit: f14f4dc8ea3810f8ed4f0f3ea13f8bba3e2b0f04

Best regards,
--
Frank Li <Frank.Li@nxp.com>
