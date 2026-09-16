Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010061.outbound.protection.outlook.com [52.101.69.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF70514751;
	Wed, 16 Sep 2026 14:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569573; cv=fail; b=R5/7lLF39QvVVqbLDM67bsVJ9UkYgY6y/hINe5pb2ZJbDl1kb8Cc8n9nQQPMGtz+cAdmFkTz9NB5227dPX3DtQtGCvvcKYAit3cQ7va2V1QIwKGVyx195+iK1r7Wf5IvJoCbBBfBljOOnqKpnUg0ecrQYg2zzSyfcJndjlHDavY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569573; c=relaxed/simple;
	bh=Wuaa5AkDAta8/Ul3NtjN5xlUQSFCTZV/7/Jg8rf4Qm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=V2jxju7sGVIMgqOjE3j3bMAy2UnixFXFloYiRa0abNxqzR7UJnb+GreRIEsW3eIIAk959SdvVB0DXHkkMJ4CdvqFS31kHMS/ieOKUU+L7o+P2m1qOEj5aOGXXynFBgG5KZXV4in+3W/D7LzsrRAvl1+DzbAZL1OZW4T3+rVBa+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=saDtv7Ce; arc=fail smtp.client-ip=52.101.69.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="saDtv7Ce"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=neBrsLUWJk7SC4zIFapkOA7rAqWECc4Q17J7hE3xsDl9Wt5HTRlTpI6I2wY1FJCtivMODHSHhASjZRZP7JkXXpvGNEldKv00ENskqSZnsS/u9D1rrA76aE+0FfqI+G+kkC9A0TMAEUqxSP1Lx4WNCVBEiyisQpMNTyRw9rID/ovHf5F4jQg/yDgGEjWLJ5XhkfoOxGbQ2l9yac4gIH1GEF9IsG1p+SCRJqCrTH0oHVZmz37pDxBIgbrok1tRUaLY7AJIfI5Z136gFxhk31b3T4GEzJ07iWVA/obhpGyQGXhzRh9MekRs6y+ZLkgY1zeJX6sA8ENYs4+iM7YazG5QIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KlgGVtA8L34wEftTlpYt844a7X84eA7HeSvovPfV4CQ=;
 b=Noy0FKK7OwVvyUX51IQJQ3E80Rn8pBDKjG0aASJksD8fE9zBi9UJwkd4XUCXP7iLcLw9VmRQTwQh1CfMvHORe+25rB4fc0FIdwHB5quGvmVN+kjftHQpdEQ1CdfMXNbVkvppw02bKURi3MokoNHm1xjMD1RsCelpuJvrdz5Om1QikvlO9Esa2FIVEM7uQDXt639zg3nTwPOIM/lu/FhbSNHxAWCxwPyd1yxsJlHRd3s6UD3h31ivey9gLha9fx+WnohEGDaVlaCJsFTUErLnpGgn7EEqridQeGcykKOp3NJTVbwIx19d8kw0COhe7C2p4X3CYLa04cj7N7AuJculHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KlgGVtA8L34wEftTlpYt844a7X84eA7HeSvovPfV4CQ=;
 b=saDtv7CeVhSMe6M1ytxZ2viYLeqgVJ6EXX1r2RWSFmQgd4wNW3GCEdpoZqnovpY3vo6dk3OjpUr0EKHjGXbvyuALq6wnME15IaJbZEfFM8tGNNrm/u9f9ICDf3qFPmLikwP5C3j2MpIfcY/YgV8WSNKalacKR/Kn5m/2KN6qkb2YUpqflaCAj9YLAgdqZUdTOSmGl33yLKD17YRJgta4i6WAKoL7sXvq7mBBu+XpxIeIyQ8BSJCYdSNU1NFTmyWrdQBq2jA9Q3LNC4nSdocZ1XYEnQk83FTpJzi4Rdf30ba4tBIWE2v9on77lMQsiogfjpjE7XcRSSW8IT/BXfaeaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM7PR04MB7077.eurprd04.prod.outlook.com (2603:10a6:20b:11c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 14:39:24 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Wed, 16 Sep 2026
 14:39:24 +0000
Date: Wed, 16 Sep 2026 09:39:10 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: pankaj.gupta@oss.nxp.com, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v51 5/7] firmware: imx: adds miscdev
Message-ID: <aqqqDnOMmlfqit6u@SMW015318>
References: <20260915-imx-se-if-v51-0-4a7dac612cb5@nxp.com>
 <20260915-imx-se-if-v51-5-4a7dac612cb5@nxp.com>
 <2034fb2f-f169-46a5-85e8-fa723ddb0360@app.fastmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2034fb2f-f169-46a5-85e8-fa723ddb0360@app.fastmail.com>
X-ClientProxiedBy: PH7PR17CA0013.namprd17.prod.outlook.com
 (2603:10b6:510:324::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM7PR04MB7077:EE_
X-MS-Office365-Filtering-Correlation-Id: fa934929-69fa-4e21-d779-08df14004d1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|23010399003|1800799024|366016|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	aaLMXoeN7qGmuOoQRcvA+4J6s4n2vNqtYU8F4XxwTY+HFGISC2snHd5SBJRe9y4o1xJZTgepcP9/UUPiMDYYjpwN3paT2b4wjoGk8oDyIVajx1DtCysvqwLN8hy3mSNsAxul2V4e5riK4/3gZASHdSBhJ2fALr/XguJwtUxK25YVTWLYL0Wir4egAxv7M24/dO9d5d2gFDdyZ9IzgJfbKB/XTwVTuH+3ZTS+N4xUIEzUaJd/gRrJaHOg+jIennfqWqr4w/ibI48xvnES5o0p2dNQ7Jq0SmmQCQ+krvzdzob0f6qLWQFtgpftWBp6h2f5cIhiDwSb83mmembTuYi9dwIBX3o/qevmp96QUFuG5rwrJ8ACAJj1IsccD+QqKtbTpoWp/Ata9gv5Lh4x6x7XBBnTur0lRd98BaTHmN7vvKQG8+2P+zbKxN8983XcvVFvdPjCKx9o3kUB7GC/4KtsbG465a94q9juc6BtnnMZgDnuEWvShLaitbZawU1KoisoHG1oiqh5m4USJvH28fRmkrGEXC9ZB1u4ylMf0o10YkHrCIkIh/yotJLKlNE9VWZ3xm3+klnOJdXziM8kTLxj8IFP06bDmcNZ9/ynDLoZyPo3SJ6YNU2r4IW14av+ZqD7EXXzoxrWkUB3ZZ/MOk+lJvSJeBbEYXoECjILQbB2Qfo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(23010399003)(1800799024)(366016)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2Ynp58bmFrojSRei40WJ02sndR7unWBx1IXRVmf9wqwT3Pf+mrcnfrkUwSLx?=
 =?us-ascii?Q?CoxY3CbzZrAEqIXF7wWBtSjBHgU4MhTPseRx86/JV0D5clSwUbZeGSvgcpTY?=
 =?us-ascii?Q?VyWirxhZR8Bc+MsS+/hb/lA4isGmYrvI+ijRiuycI3JNB3DF8POt/tBaxBII?=
 =?us-ascii?Q?JTyoP5SicR2iZ8IiQXbcSVoCvso8lZ5rF2AU2ujt4BM6bMbu4OIdwZj5YGid?=
 =?us-ascii?Q?Z4jJHHiUFg40MElULDze3Z2PNJvBNr16W+WD2Ux9+XlEsh8RhMlHN5pAVPkG?=
 =?us-ascii?Q?2Ozib3TsnNTQC2hH3N0kOzGhR+RTKLBtr8co6VcJw0uEa8N0hmxbxevvoT19?=
 =?us-ascii?Q?sBKDgv+NO3rqogBMyMb+2tJtGkRR5QnA3acUfWzM8v4JPZGNhE4Q40dyKe7W?=
 =?us-ascii?Q?0XdLBMZTqXWTMe3FAgm14+hKGuvznua8nDghbnzSBW9lAJVfDnkfp8n+TsLY?=
 =?us-ascii?Q?DvCwRPV0s5lN9MJUFHuLal48jAmPvn7Ubak+QEAuYsT2DpE9r5wOaWTblX6/?=
 =?us-ascii?Q?kdGOonJMxcL+S0HSewHci0vwX/nVJVfcoje68X6xCABxdDkGGS3IGrSmI0uJ?=
 =?us-ascii?Q?angCsAOBEFVyq44IW+TAzDdlGB027aj1gFPYl05nEOdjAXcVdUowLOAnDvNC?=
 =?us-ascii?Q?FGpCkurGtnFJuKoxUQh2rfp9UzLZDaB/AelBRl5Bospg5zCSsXhFk2Ca23/P?=
 =?us-ascii?Q?ODDRclXxmBWrBusH0sSIIUO4bghkD1KUkiBFrhXiMm+XPujwM0SBoUfJg40M?=
 =?us-ascii?Q?Fe2abSMSZ1xA9CdehTmpFLl4WbAu1DxHNCk37T10w26HBRNsy13s64+Hh4de?=
 =?us-ascii?Q?kBbfVSx4oJb1K4QsoWZGwWeXbiuFEpxHDqiR/1p2dY/OkogPBKJsF4al/07p?=
 =?us-ascii?Q?S6vXgYW/wDWGS2tr9RVM1ghMuv4KZCM0y/ygM0KIC6fg8l5AehTBZuFmZN+W?=
 =?us-ascii?Q?iHdtHkYfiGVE0SLdjjk/r10YdejLAIRgfkeNRL7xt8Bud3h4UnDdJhUgYQWv?=
 =?us-ascii?Q?deLN02M+3zYOBtKWVGTaQqH1aEgz1SPmOT0vwzCz7LJ0wBwkm+Hjpp8bwZ+6?=
 =?us-ascii?Q?eERlid2FFCUN+2e3H+2PtOr+kLV2aFePqYxNPiR5HWVOaPYFQjXZOCGFAqyX?=
 =?us-ascii?Q?tYNbAMhgWvZJamGrYWEPUzlOWL0AG+5RBVZqQyoKLltCXVIDAccHkie0/nb4?=
 =?us-ascii?Q?I/QyLW1BDH1vdSJ90hFFA2ea3ir1QjHjXy86J9zBp19J4HfJoSOKUCcLBRYK?=
 =?us-ascii?Q?t8mJHlMg8w8JPbsEtRQRHFeXF+lXTcvbeSptCyj5vQTXyj3/UlxA6S6I+CUQ?=
 =?us-ascii?Q?1fgNkiWrCNYprxJ/S1ds59joOXGxtqpQEBsfnhAh7hY+vrfd1zIuiqfDpoyk?=
 =?us-ascii?Q?/7kb7GyHaUQu+w8NHjgHYqHGl7LFs3ITZkoMg5E8Ep2EjwN+Ascj5pkbA7AK?=
 =?us-ascii?Q?2UdUTNz7CXndOm6iwWigSEeW9iWF8Ve/Rnwjc9XSA9seR6YZiJEfQovUp8cF?=
 =?us-ascii?Q?FRl3uy834lTHo+qQ7MKr1ai8QeaipP/riCrGyzXN4MeD/4TfdUJHo4pdWaWo?=
 =?us-ascii?Q?wyPeFYbP5IvmaG/YrykvmlrNpHZ2qeBpwlxVrNuQnYW7KCnaRtAXCkO9eUJD?=
 =?us-ascii?Q?Wkf/JoXtt05+7NKquumlDcm8Px4RyZsKN80735woioRdD+W4AK+gTJyd/En/?=
 =?us-ascii?Q?J1//SoxXq0KxAOc7pHOZnmdF1XDQFK3tbXADQGD2DXQpkwli1ysG1f9mK+uq?=
 =?us-ascii?Q?QE5IxBeKw2a8TEA5R9Vt9Km8PZE9g2ObWESdQFi3iPEAH0Np+DlR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa934929-69fa-4e21-d779-08df14004d1c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 14:39:23.9613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TmjHVTPIsynBAg/x5qOyEOeaKbk3Xm45q+BNYSK7NUMDOCVH1i3qh89V1VLSWJxmeHG4BdZIGVUySlEoCEyFtCHObgx6QNx7nq7dbkDf0g1D48pJd/xCUH1H3MiFeemk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7077

On Wed, Sep 16, 2026 at 03:16:13PM +0200, Arnd Bergmann wrote:
> On Mon, Sep 14, 2026, at 21:40, pankaj.gupta@oss.nxp.com wrote:
> > From: Pankaj Gupta <pankaj.gupta@nxp.com>
> >
> > Adds the driver for communication interface to secure-enclave, that
> > enables exchanging messages with NXP secure enclave HW IP(s)
> > like EdgeLock Enclave, from:
> > - User-Space Applications via character driver.
> >
> > ABI documentation for the NXP secure-enclave driver.
>
> I just saw this in linux-next, where it has caused a build failure
> for a missing include of linux/slab.h. I hadn't see the series
> before (even though it is a v51, which seems crazy), but I am

It is in linux-next about v37, but build bot find many problems, I dropped
it and request to fix it. And sashiko is online recently and also find many
risk. I request to clean up it, and local AI environment have difference
with sashiko, so bump to v51.

I put to linux-next again to make sure that pass all build test.

Other two problems, need more time to check whole review history. reply
you later.

Frank

> curious about it now.
>
> > User-space library using this driver:
> > - i.MX Secure Enclave library:
> >   -- URL: https://github.com/nxp-imx/imx-secure-enclave.git,
> > - i.MX Secure Middle-Ware:
> >   -- URL: https://github.com/nxp-imx/imx-smw.git
>
> I assume this will hit the soc tree eventually, so I want to
> make sure the reviews have covered all the important aspects here,
> and I don't see the answers in the cover letter:
>
> - Who has reviewed the user interface from outside of NXP?
>   Since this is not a vendor-independent API, I think we have
>   to be extra careful and make sure this does not duplicate
>   anything that is already in the standard firmware interfaces.
>
> - Why is there a low-level passthrough to the firmware from
>   userspace? This looks rather irregular, since it is the kernel's
>   job to abstract the platform and provide vendor-independent
>   interfaces. In particular the bit about shared memory and
>   the generic send/receiv ioctl look like they should not
>   be there, as those would allow side-channels from userspace.
>
>       Arnd
>
