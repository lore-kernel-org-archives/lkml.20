Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011062.outbound.protection.outlook.com [40.107.130.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DB536212F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788187580; cv=fail; b=TEdXxr0on08L5wRfIIuY/jA4CkdHMy4etzKst7B+YNP8JXKLfXrrPJvuoX4oGlcYMqro2h4AoN9Ys4tFyVJwLzErwWqQASnL+K7xIv7DGa/aenh5QPaMrsjBCURW2z3oGwDZIvLQUVoxPRJk3eHESmcalobPk6Zzm5uRqB2lP68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788187580; c=relaxed/simple;
	bh=n8BQILl4gmEv7OKth79mheiKZBYYuukU2dbmUZShvXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oQZ3IYKP3Hx2h5OTzRCQRQgeL1mRK8XmfrVHSklhufA86eOAHKMX+3XYjNfT9lfKp752Uh2Mt/wt48Q4j0H6lJl5FmDf47PQ3C3+nenp9VVtX1YZLvHj7qSoGBsxWc3SPs7BBDdNxNbh4Kg0Z0IRtvD8Cn6NDVAT26CVr/hX5uQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JJR0hyoI; arc=fail smtp.client-ip=40.107.130.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JJR0hyoI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MmwkX01w2E5eCsGsaGLiWxMnLo5CHDs77DkZtxnoQqYxcIeI0YSypZO9evBuvCFtx5AdqMF19nzng/J4oN8N+5C6Z/TwE/AziUDAWC0xTKW0eYb6Dmzp6Om4Tbp0hVZcC1tKHoO+znT98tLcFj48UwWDMedEsIPYuAYzK7K078EmRTOHqiLR3WIT6nQhUQc283/TVexzUV2J/HNk4sFZESXG1M11y8UPFVg9Rikh314b9AyfPynjBeopzrVRolhKqsbi6WJDqxVcjO099KX3+dgjdLxX+0zoBYYE9T2w6OTMuXI0OeR4UEAz+T12eIZd6ea3BxSC/6iYBxfYyO29MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWOWzpgdxGdYk1/NK4J2sBGgq9jBCzF9YKqr8x3nWMY=;
 b=UsMIxWwCSDsUR6Qpka3LvJRLEMBgSz8DLn+RSHBvdjEoQ+gupWZPlsM8M0AseZd93faELj7O0IoUi3r5oXgUtmWJdDmfMQGtoAModYp7oMd+O+HIEjjuED58QDxsGOrMPlIDvWHNW3iuHl7/AlBRjwweCd+e23vAf5rfXlXmdqK2AfotOKrW7SL+kTIlwjhIuriT0f3k2P38ArJitqSXaiEjMqZiZ+es9BEmqOSzTENB1DppRPWfUo/DnDc+ljFDaep3uUiLY94ngEKSd8QDETm7jekATsZ5hY8tGF71bRgwX7GVmXDzP98USvNUM1OOPu+xJkB1Rbcywfe8cRf5Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWOWzpgdxGdYk1/NK4J2sBGgq9jBCzF9YKqr8x3nWMY=;
 b=JJR0hyoIogKf6mkYwODVjhj0WMF/y+Myb6ooQPX1jLjF44pXhgiWmYhn4ZoU7MpEvOubk+fg8b+Jv26XmeJJI+NNPLyxxRgQRtemawbOewlU7jTZQq2Ys9cvh75/Yn5lVd2lp8yg4jqiYFTLq5fna1DVsBtHxbJLkflvS9dlV7VzOQnnYxjN/eeqZ0MnElS8IW5LFhZC3FvGHTILy348C7o5bUli27Gw1saNA53JyN1Dg50AnSlB1di1I0NCr86/A+aAVhKaGPDbKG3GPbfI/PhAJ2O78ze+d09uuULIaylTNAMFQHUJ+7iYSPz1XPtDQyAFlxf2vtbKpYfMAzgzVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB792713.eurprd04.prod.outlook.com (2603:10a6:800:365::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 14:46:15 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 14:46:15 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Thomas Huth <thuth@redhat.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: imx: Replace __ASSEMBLY__ with __ASSEMBLER__ in header file
Date: Mon, 31 Aug 2026 10:46:07 -0400
Message-ID: <178818740151.3984314.5873793309786228451.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619122448.188046-1-thuth@redhat.com>
References: <20260619122448.188046-1-thuth@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY8PR11CA0023.namprd11.prod.outlook.com
 (2603:10b6:930:48::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB792713:EE_
X-MS-Office365-Filtering-Correlation-Id: b511f0fc-47e6-4681-e0b7-08df076e9b9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|23010399003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	I605v3qCac3AI6RBR8g+VkMVzTdmyLNYLNRpjRvBhu/VfWeFUcBo1+hjFIuysm1Ki3RjmGMkk1rhKWzpMMAPppR1Lxtgjjb+mS9LkBIFPaB62nWTPtIZJBHxsiWa/41qD8PppMhUv2F02MW2Gv0GWwvvEuvWqb++UCG2k1XEUGvK9qwwEHWQ6T9REBB3XT1Ja5hAtjS71SURefFuckS+rSxWwmpNJKJNQXvUIfVZWmmYjWd2YcW//OACvHPz+rvPsUDJxFNnspE23q4uJD7kEJRUjz9Rib1trYyuicU3c6wdlfca7drtHuWTypGYl7uTlmuly4Ae27SxVqsDc0qj/dKGJwUtfe7JBKEfYirfh1e4tN4Jym+D/Kvp3XBWPdXnxJY9quS3p5NwusqAIJ8MILo0ZHoukCB8YpXL0jEUd/8vRP+fBMzHFNxf8hn3ODsfpntEys2ILKoG4frohYydbSMbYCVoAqnTGuNOo0aLH92eennDohGtrgoEI2wuzpOFA+TwbWwUomTPHo8Qysp4pU4a5FYej/QCN24JV1CSwIAo++juHvbC1ESSzcuiCnglEL2U2+8B2uABzH6V1Jgu40gCrTm0VuX+1zQYe1+Jn0O/zqCgYhFB/eRaFDP7eD/GDj5LF5gpLzgwI6gn+rpl/f2NxFlu/44SkCQTqhaQ3KE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(23010399003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDQ5Z1hUTVZjVmVQTWdDcVBXMEVBL05UR3BpUGltaEh2cEZSSDcxdXh1dmhS?=
 =?utf-8?B?NUJzZm9vWEY0aTFZV3JpL3ZYVkVEOU54RkxzazlveVF6ejdKWE9XSDkrdFJS?=
 =?utf-8?B?OGsreVFKd29XMU4zeHRCL1VuS3hkazNkRjlFcXVHekJxNnlDWWt5aG8vOE5p?=
 =?utf-8?B?SEphMjJqQzhMZXBDYXVGVkMxczBqZ2tBMUdJYWFQYms2eER2Y0VWUG9HMklT?=
 =?utf-8?B?eUFwWUhkUmljWXpBb0trNk5OS2dWd2ovQmxrL2RTOTZzVHFUblFxbGR1WnZx?=
 =?utf-8?B?amF6WHFocHd5eEY4c3g2YUpCcTdJaTk0VE9IRlh0bHFkdWtsNExhNllHU2Jy?=
 =?utf-8?B?T3kzSExaZGZBUHlxbmc0Z05VUzNkendrU2sreHdOQWxSelhBNytOMDJSL1Jz?=
 =?utf-8?B?c2Z4RnVxdFFJSVdNSmR1OWdKQ0NsZUcwK0pGSUs5OEhSckNuUDdXbUJrUkph?=
 =?utf-8?B?REFDRlRCVE9kcHRZR1lodTNVcXN1OUlOZkV6S0RPdTNTRUVCYXBYSEdVMTZP?=
 =?utf-8?B?ZlUvdXJ4eThkd3p6cjlqcVNGTVpvS2crRzIvOUs4cktPL0wzcFJ3aHFQZnY3?=
 =?utf-8?B?RjlZNGpBZitiUXpYVjZNN09jMUFadGxDaW9rall3Si9tUnRmMXV5YURXNExR?=
 =?utf-8?B?Mm5sT3I0OVdBdjFORWEzTlJocUwwN0dBeC8xTFhneWF2UlkrVVVmOFpEWXZF?=
 =?utf-8?B?YnhTdXRqVUZlbGRib0hwR2xEb2NvTlFNWUV4bGJocDZzQjNpVmtMWFZ6Zjh1?=
 =?utf-8?B?Y2ZFV1IwM3NTSVFYVmlvZWhwY1VmNkZRMVVDZ1RzRnJLcTdsR0dHUjc1cGN0?=
 =?utf-8?B?dEpVT1luRmUwQzRnMXRWTlBqNnhBTGcwMXpVZjRNZHZrYi9IN0c4Znl0N2pY?=
 =?utf-8?B?UUhvN1ZiTkt3WVhXMnBua1p0Y0FQdGl0OGx1MmtYMlhTRFE3VGFHaVRrS2U2?=
 =?utf-8?B?SUxMazZXclIwS3ZGdHBJbnlJa2crV0NBRTlWRElBam8yaG1DM2kwQnlLbyt0?=
 =?utf-8?B?a0xwNHBCSlpGVnRDa0dLRldNQ2xBaHdSV01NUzRwU0dsVFhaYWFySmpxR3dr?=
 =?utf-8?B?ZXYwcXpsdnlIMW4yVGM2WWJ5SE5KYWlVMzc3V3kwZ1lmSk5jTTdmUHFOVGtL?=
 =?utf-8?B?SGY0SXNHRlNlL1ZLc0JOeHE1OFBSMS9XZk1iS1A3SDZ2L3l1Y1JtWkEydERH?=
 =?utf-8?B?cXV4eWhKUXFidlkybGQ4RW1odXptT2cwL3VZNnZWZU41QXdJYWJONzFPUnJj?=
 =?utf-8?B?ZnZBVnRHblgrV1A4dFROeHhqaDlWZGhRUklUcTdrMHpJZGRkMlcxWnE3NHha?=
 =?utf-8?B?aGFQWkRONUtOcS9wZWEvSnkyT2o3S1JhV2RJdm13SXBwTVhLelNiTW1PTXl5?=
 =?utf-8?B?QVZKR21ua2tGd3F6MmlUYm9nMmRQVHZkenJJOTVLRnFhTHpOMGpjZ3l6UHlm?=
 =?utf-8?B?SjRwdHJEUGYwWFdFUkxTUjdHQXYwbm1ERmErMzZrRlVSVWtZS0Q3WlJ3Q05P?=
 =?utf-8?B?dlZrQmExWVJZSEJLK2FhT0NDR0paWFQxdzhKa0FBeGpGVmhneG9LM2ZtK3JW?=
 =?utf-8?B?NGl1SFhMVUhOQ25hWDVPYmh2emRYM0lucjk1b2VSSGZvTkJ1MGZWdW1sY0dm?=
 =?utf-8?B?S1lGdlZBeVVnNGtWRk4vVHZiVnN5KzUzNy90WUgwWGhVcFRpZkJjVWl4eUJO?=
 =?utf-8?B?dHZxektTUjV1QWtXaUJWSEYzZmtvSjN1U1RzQWxSRUd0Vm1SUUFSRUZ6eHlB?=
 =?utf-8?B?aUVjWTVwRis3dDhRVDZtb1NJTkppTjV1YkdZOXRxay91U0NtMWxYUG8zcUdK?=
 =?utf-8?B?TmZZVEt5cDlKeFJteHFhYk1mMWcra0pEczI5Y2dNWEZqZE5OM2d2L2lBVGt4?=
 =?utf-8?B?SWJKS0lLdTZ5YXRNcnpwSm5wWnRkdUtvS1RXSDVLNkFQYjBvOVpZaHljK2hX?=
 =?utf-8?B?SDJYTmo0a0pFUGNQNVdldGM2WE1ESHNsR0kzWjY1R0NqNGV2UHJkMVV6RktJ?=
 =?utf-8?B?U3NZQnE1NE5CSm9CZVM3c2pHYTdsTFNvMFlQYzlNSC9heU42YklNWUltRm41?=
 =?utf-8?B?MjZKMkhHWXNqWUV1WXRQejRSODVqYldTTDFRY3NvTzA5Y0g2bWE3Z3huSUND?=
 =?utf-8?B?RHQ0YUh1czJLclZWY2NycjY1aW5pU0dMZmtYWHhabUVvOXQrcTdCalFEaTFk?=
 =?utf-8?B?SVRSN1NoajAxdU5ieWZWaDJKMHdWSVNOS3VKNXNGZlVaR2FYbUl3LzNSUlNi?=
 =?utf-8?B?YzQ5TkU2REs4ZnJpZkJPSmh1YnI3VVRNOHR4V3VIY2pzQlZFTm8yRDFReG82?=
 =?utf-8?B?TWxiWDFPOGtOMUFxTmFxWVptQkVLT3cwMTRHd3ROQUxXeWZ4REhqVHlvUksr?=
 =?utf-8?Q?txz+ruT8BSLclyPE=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b511f0fc-47e6-4681-e0b7-08df076e9b9b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 14:46:15.0532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXRPYfSwG/991f1D0EdIQh9rwVyomVkw20iCrW6V4QFHfs3SdddwOm3Sp6Rn9s+itypFmVhZHHojYxFS2ctmqP97hv8Haml1h9d1VZyemxePubTl+kzV1YXbZoNyXKNR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB792713

From: Frank Li <Frank.Li@nxp.com>


On Fri, 19 Jun 2026 14:24:48 +0200, Thomas Huth wrote:
> While the GCC and Clang compilers already define __ASSEMBLER__
> automatically when compiling assembly code, __ASSEMBLY__ is a
> macro that only gets defined by the Makefiles in the kernel.
> This can be very confusing when switching between userspace
> and kernelspace coding, or when dealing with uapi headers that
> rather should use __ASSEMBLER__ instead. So let's standardize now
> on the __ASSEMBLER__ macro that is provided by the compilers.
> 
> [...]

Applied, thanks!

[1/1] soc: imx: Replace __ASSEMBLY__ with __ASSEMBLER__ in header file
      commit: 9d183de1df061377bf5d29f33dc4814382187649

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
