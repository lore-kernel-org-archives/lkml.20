Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792764373;
	b=0Q3UqKpljpZk1FBxXG9GreOhHOFVKNIO3HwIfBQDtY0ork+gle2O/++/+tJX5sHUabKH
	 7IXUjQCwyxax2NBpXOgYXF8DMmJdvy8HJ3+APLav65cKK8fv+8kvRTNjr19VJVEGOoZd7
	 HXfBYVbXsDbTMxYslRBwQPZ4/SBXMHLvvBhJfs1gZqbPmrVgxzRVIFR0RBc0vwoEGpD30
	 6v0AAi+qKphp5VbMsm/lduqAtnMZv/yR4Upu52hzeGunNAG573i64OXberWQbuXOJws+d
	 lpscaiHzhI1TjOqV3iej3COkjODDEoWUCZfhJM+UtYK1+TQ+DcteuDKaQtpfK0Lq/cg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764373;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=j87Wrx291QISLc/nEmobwNIWhxB6IG5f9z5/EUmc1ME=;
	b=MbGe3wMdRphXEchUWpKH96q/mOMdkq/h46owGlf7FsxRnr6v5aRJ9DEFJUGHbm2PQE25
	 yIyG7EKvj2V1wIJDddY17Dj30F+Avp9eE3yzoE+nU30hQmZ5kkHnpXvgqv0wIWhDHWv6K
	 y28AWlkcm6nR7CsfPspzLaf+wchdZvKw+IWRLZbhED/TnyrI5IVy11pY3TAH9FvfcfG4m
	 ZrK7i8HezZrTjX/pRRodK+Np9Iaf86rCUT8x4ju2mKHspnkUCUP0j0vOU2SClg5AbnbwU
	 /0a1IYyd5Sk49iVwxg7aqdmrRSbiuvJir6G4rkubhupEqVLvj1iZkYPx5hz08yKuApg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=UJyZRBTE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.65
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010065.outbound.protection.outlook.com [52.101.84.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F54606A31E;
	Fri, 23 Oct 2026 14:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32F54606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=UJyZRBTE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFjoBYx8WccvlLbVZWAp4hOkhGzi5VI1DYS65Dr0Nn2sbzs8ac6z/D0Vo638jI/l2nV3hGCGpmr2opkUTI2G5HpbW3FnqIqfHKGf86wgu+1MKdW14Qm1QWNDeCCM8Shp+Y+Ak1dQczizk/PxsmG+3YgM91T0Jwh9ewoCjqqzNqt6MCYCspDGOTcC8iGUuXZ2cG5EQiwzab2tssNckIA7rHEXLkVKX+syde61af8X+PHUJQkxDWnWcg5dX2HzYWejnGr2aagFR7QjPcj29PV8JGYcTCechz25q9l6I/Csw74ro7dTJOBpN9Ay96jfsDGUi7zily/pxHaJJk5kEL8TQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j87Wrx291QISLc/nEmobwNIWhxB6IG5f9z5/EUmc1ME=;
 b=efE6rPWj2wja7R0SjBIJGcoS4RdMV8+JLAY2pEp/X06OKnQAzp9UlJ2a/5klGtvBanxkgaqY829t4adWW0b4tjIsp2D/S6Sy/jOVg9K3zFCSFxbr02gI+DbiPKQz2U6o+nUk323/dfYsbXU14YhLRojY2PqOP/jzcn3pIZsJWbOuXDuNJ8+sMVF4TvDRVlis2zzeCCkNIkq/l+qQ6kyK1mRhi74pVgApQh/Pl+gkmV0qJvw2a5wwjhJUnwpODQuNy+A2despkt9/5QNh71k0kiq2Ox70zh+qDMEDzVIgzutgfqG5O2Dov1FkmI5ubr3zxwr4IF5XK+CTexlyK4VELw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j87Wrx291QISLc/nEmobwNIWhxB6IG5f9z5/EUmc1ME=;
 b=UJyZRBTE8qzcGF+mH+LU9bQR/tf2EaeoMAwrY7V6zLe02ekm4vhwGMwPFuCwKMS2/9owJuwimmxcK96hvo89alS1zng7jp8rVDsLnpF9Xbd7Ro00Z0ffjonnjgGeVTgRUV0kbI1gT0hjzthGTzeY3nAGQqmxxCxcXVcZcLQXOV/AZcNsk0tkrqGpna8AYz7pHt1vtprueTjz6wz+3vGDWgGDnGiezwlOs+Pzk5vuHtza6nJTnQSdVfhZX/neISmHUfzxwY8pIn2WB6Px231iIHmPzuz1+oHU8nkCuuEPd5kiZ6fBDLhIaogUW+dpcz80f1eS1bs/Y8pqNJLzljyTqg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by AS8PR04MB8561.eurprd04.prod.outlook.com (2603:10a6:20b:420::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Fri, 23 Oct
 2026 14:06:10 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 14:06:10 +0000
Message-ID: <09d70600-10cb-4626-88ab-f9e10f4dcdf7@nxp.com>
Date: Fri, 23 Oct 2026 17:09:55 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media: atomisp: Fix double blank line
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Lorena Tanase <tanaselorena3@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org,
 gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20261023123158.6176-1-tanaselorena3@gmail.com>
 <attnVU9A2GvgYuy9@ashevche-desk.local>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <attnVU9A2GvgYuy9@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::8) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
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
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|AS8PR04MB8561:EE_
X-MS-Office365-Filtering-Correlation-Id: fbe198c3-f021-4132-3620-08df310eca53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|19092799006|56012099006|4143699003|11063799006|261022105027099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Dqgyw0q/hdL6RD1TZfIU7OL04ovtSU768iNuyd3l2ylS5X8UnMcF/Astwo3AbjLmWpjuyJXjc/rCmRyHR23ELL4i77JE8cPoD5Js8alqd73OW+gJcp/Sml/Knut8C2RSIjhw9trZP9yQk29avmUFbZPRjqLoet+rTG5ADfIkXqMYCEuYMOAxJ5QkVspEHenESXbnTBShUu0ysBcCNRBlgOmzEaSXikOgGJ6K7VplOmQgtaQbprzzzmzdtlJwF1htDeIuDQsY0ko4QgKhgKMK5ev+64u+Ww22q5XP4/eBdR2XUTdWupGnB130kcvY5S5nTEJxwdjXWwiLs+zu/LvtdyzeLB2tItrH2lUo/5m4ezwdZteAAXB66IpkPOvZCp8ar2+TeujRAn4bodW/vgEYelKlr0zYg1TU2ABvz4R5UxgxRZHkTbIr6/wig/iNndSa3D16RY6voWmuWMU2GbEJNERkwiOLQywTl2vMelWnaZhT+56AAC5QU7FVuRNOaD/FmiAjEis44zHeGmkl4F9jCX7ISiDjwcVnDrK2IweYfJLiEaJwtoVmo5vH6fhY5oEKsD1Aq7DtZHOdPCT4ocdRa+8vao9HxD50Sf/ii9SuXvqFS7j3ykEXZmrqZG6GXI/aWKGuTm6zgdDYuMUS6helNQ6T7ppUQAp6Jszbpus/P+M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(19092799006)(56012099006)(4143699003)(11063799006)(261022105027099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yk0xMGpaK1h0VW9FWGs0dTRwb1JwQXBObk1EUjlSaHFON1lwYmpmeFJjK3ZQ?=
 =?utf-8?B?VUVWYmF1dEx6dWdrNDN6TEJXdElvTVJIVjJFU3krTXRRakN4VithZW1EaTF1?=
 =?utf-8?B?aFA2UWlPY25vd1RFbzNlUzNkaTN6VGhKVFFzNm1UNTREUFZsTUV2Lzh6d0pa?=
 =?utf-8?B?WFZjcldoM0hGd3d0U1B1WFNCYy8rbzdwVVIwWFFCQkM2V281ZzN0NWpFeTF0?=
 =?utf-8?B?NGg1OHo5MmR5RTlwMVBVdDVlZVN6Z0VxTTY1QVhzYXRzN1FWaHl5WVlITDBD?=
 =?utf-8?B?RHozZXRSdFZLaFJla3Zud2RHaGdpcEI2NEhBNlhjM3JkQ0tMTWZOek85ekhB?=
 =?utf-8?B?ZHYzbm9zdGZOcTREVU0rcUlRaTdFbU5vVmx3ZXM5N2p4NnZWMkRHZ3JzbzVK?=
 =?utf-8?B?RUR3bFpTbitDUmlRa0VvRkJESFExTHkzcFFCcHphUnFDZTRxMjYxSHQvUDF5?=
 =?utf-8?B?SGJ2SzF5YmdEenRESjdSTGkvQzJCaGhUTEh0Y1dWVDd4Rm4yMDN6WW5HdzM3?=
 =?utf-8?B?aS83SEFoeVVCQjdiOThjM3B4RXp6OGtTb1NobkZiMGU2V2dnNldveENLYWFL?=
 =?utf-8?B?STZ5QnV5aDdSOHEzUkpiS3AxUm9GNWtzRWJ2YUhkc0x0WmYxS0pEWGdSdVNi?=
 =?utf-8?B?WElBUERzKy9Yc3hYY05QaWZ0eXROV1luVHlKczF2b1dyaWVtRi9mU0VXZjZS?=
 =?utf-8?B?S2VkczYvTkNsTkpoSFhyZklqc0sxWFVMWjh0bUtYWjVoOExwbUEyNU1Kb1BY?=
 =?utf-8?B?VkNEVmg1SERnaEhHYjVWaU0yWXN0ZUFuNUF0RnF4YTQ4N2wyWWlMV0pPM3di?=
 =?utf-8?B?ZGpRcDVOcEtmc0xvemt5OTRJZUdCVGNsWXA1OFhPMllLNjZPMVFERVNubjI5?=
 =?utf-8?B?L2pIbW5zZ0ZBdCtmaVZwb2pDaVBXbjduS2I3R2R2VkRBK2E5ejNHVFF2RjBV?=
 =?utf-8?B?U3BYOGFCeFdEWGc5enFTajRDd1VFblRTNTFGRUFnU0d0bUFRUi9rRytxdzZy?=
 =?utf-8?B?N3FSSDdaQ1RUYUN3KzhBdks0bFhmNjVxa0hFTmowT1VFOVcyVzBySjlWOUdI?=
 =?utf-8?B?cEx5THdGQlNUa1JadVNsbGdDZmNLVWhweHdTdFRmam95Z09id3QvMkhkS04y?=
 =?utf-8?B?NmZpenRDalBpUHFjOEp2NkMzRTVhaDlkaFczMGdySGFhUG95UkMrQWtmZENY?=
 =?utf-8?B?Wk9QTzk5Q1VicTl1eHNYbHhOYUdwUmlPTW9RR3hDK05xdlpnKzdHc2NxSXFF?=
 =?utf-8?B?dTBiTHZiaVpEZlBjdDBKU0I2TFQ4akdnL3RHZEZGVjAra3VuTitwZFZGZkNT?=
 =?utf-8?B?QlVGaFdVQVUyQ0VYbXFSK0JPelV4ZEpXNE9lTlVVOHJvWmxxdkJMU2loR3J6?=
 =?utf-8?B?S0w1RzlBM1FVeGNtcldIUzhQYjVLYjdYVmJmVkNHMnMyWTRYZGxKM1Y0RHB0?=
 =?utf-8?B?aGsvaFhCNGxJVGFqZHFRU3l6THZBeHE3QUFEOXo0UHAwbCtuaitEMXBSVktm?=
 =?utf-8?B?TnNJMU4rSEcxWFR1MWxnbjhIUWo0ZkR2SmZoUDJlQzVXU3FRNDlZVTRHVHg4?=
 =?utf-8?B?MkZMRVNjY1YxTFpQdmNqaTY1cjk5RUdUcWRwckJuV2VyMFpXcUVUWXcyZ2JQ?=
 =?utf-8?B?cDFXcGs5NXB5bHJ1ejBjbDN6di9ReVFnbXBTSzlzVXRna0dhWmRWS0Vsb2c1?=
 =?utf-8?B?eGlNREs3Q2N5Z1hScU90WFdzdDlmMUs4YUdNTWF5WmZEUWZ0NmFSSThZY29U?=
 =?utf-8?B?TFhsTzA0MFRGVmlCT3U1aVZ3dDRvU3lUZjVEQmVPa3MzM29vOUM3OFMzUUtN?=
 =?utf-8?B?a1VUeGZQcDRaNGVBVTNScGxiR3NxRnJlSUMzbExpcWxUdW12bG9qNEo2aFBK?=
 =?utf-8?B?cHl5cFNia0hDa2FHMDY1WFQ5elphVE9DUU8rZ2xyZEZwNlVCdGZzSEQ0TnYy?=
 =?utf-8?B?Y0ZUcE9Xd0FFUzI3VGxYZGVTVFhIRWpreWRwYnVGNVV6bjFwUllwZVNveUhG?=
 =?utf-8?B?R0JPQTJYeWhsMWpiVyt6NWN3bW9TSnJUZmZrSWthOWVFNFhjWG41bTh1bllW?=
 =?utf-8?B?WUd0KzNML0gxc1l4S2ZhRXJKNHlnOWl0TFBMVlAxKzdScHAvSENoR1dBeEVv?=
 =?utf-8?B?M0s0UGlUVlJ0elhDYjExcjR2Qk5QS2FxbHBKNFlXWDlBVk85dmhYTEtTOERE?=
 =?utf-8?B?UzJmZUlZQ3VtNnBndy95SWozR0FTNmh5UlQzdGtEM3pZL3FVaDU3REZQcHQx?=
 =?utf-8?B?OS9yTjZmVVJDbGFidGdEcVdrVEZzV3R3WHdZWWlucjVTcFdhdG0xUTlCUnEv?=
 =?utf-8?B?WDdvQ2tTZm13OVBob2s0Syt2WFYvV2tnMDhhSS8vTnVFRVkyUXkzdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe198c3-f021-4132-3620-08df310eca53
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 14:06:10.4817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ZYPDcOlnNXJEBOxig4x1vwwY9GFgpP9kHxZf2fYmY1c+hrCXjA/N3nNj0CrM1eQ++2xgHOYNomA7YJ/YVNe0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8561

On 10/23/26 16:55, Andy Shevchenko wrote:
> On Fri, Oct 23, 2026 at 03:31:58PM +0300, Lorena Tanase wrote:
>> Removed blank line to ensure linux kernel coding style. Found using
>> checkpatch.pl script.
> 
> Cool, but is this the only problem in the driver?

Not the only problem but as a first patch for a newcomer we want
to learn the process of submitting a simple patch so we keep it simple.

Then will expand to send patchseries. 

> 
>> Cc: Daniel Baluta <daniel.baluta@nxp.com>
> 
> Please, put the Cc list after the '---' line, so it won't pollute commit
> message.

Didn't know about this rule, there are thousands of patches in the Linux kernel log
with the Cc field added there. 

> 
>> Signed-off-by: Lorena Tanase <tanaselorena3@gmail.com>
>> ---
> 

