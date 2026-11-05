Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793908009;
	b=jbuMI18ckptiv3j2jZUXRNJoN2dhH+oLD6BJ67kL/CVCk11rxUw2IKG+8pLgAs0oeXv6
	 UIN7iHHDjiutgzGQoaCZrYQIGTQEmCN+Jb3zYWasKPvu2Ru1eKEJY+jZ7sPvAG9G9u0r3
	 5AuO2Yu1zusL4Ho6TwN05HyOm1f9DuCEFZz+f8OKpg3EkxBYo5l5bT1/LuCZFqTuNlPc6
	 J2shtwAKWWYjmbosdkiPDE+av5L7nRWzgiWCVvp0AQQlnDJKLgkmW3AWNHxM+Ehyndx98
	 vaf0i64reofDuA7NaBdxP8ss8G0rrq9KhB51J7ECfcJ1IpngzYXXRdXjLotwC24wJCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908009;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=7qV+qG2P/2xQUq4MFTcMN5GMPRS+8RNIWid36GKJIwg=;
	b=pFlluVnZcHOax4VXHm5nKAKWpTQjImwWgogXEBN43DnXujIW81mT+WbDdxtZTAVmvDR8
	 efRraBEbcM8frB9TYiW4PGP0khmES9asyg4ksN3tPxHIzXxPi7dJjgbBgPDkbdDwjac2J
	 JQz7IaFlB1uvzXzuNxuiaKO3+9yCsKFvctZyn3X5hnP6WKfvgeNpQ9ll3DFCujoiaWqIT
	 eTMjhveLr2dWQWXYYQ1JBgL+0r47KeSuS7Dbv0803xn8lORi//7lwYrhpkFZxwCpSrkyp
	 h7CIKuOcTuVGBVFxe795JjxQ19648oh6qcHABgdMp/4W6FBwTwlSufDAlrYa7rfVvPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=AwE2mz8D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.66
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012066.outbound.protection.outlook.com [52.101.66.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FD5606A329;
	Thu,  5 Nov 2026 19:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73FD5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=AwE2mz8D
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ILfWj/iGHD90Z1fvcQ8WBriqQnEL22sEJ1T/IQCoBG/OIzi2pWShMLJg7i50eUDQeNYvTnGc50EMWQ3zHOceN0fROFXgN8FzDr+a62pAW/hZPXU1OzP8MLPwpgPzF27GQa/9hem737oMPVXyufdeYj9C6dszOgeN/6/GO0RHqYFiZXsMOv9BZHB4VehLqDneIyLDQ6atngMBjpsFsQm6x3n79ca7un6+gsFSETNMINSOfb+6SSV+bUKvF3DABABztTHUKp+NzLMvsg1hW2cglpSLVt+r/rWAdP6uCUmK8mGnLq3/OGZbdzzdhIyd7Zf0tL1gbvxutgkDnTxl7eqGxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qV+qG2P/2xQUq4MFTcMN5GMPRS+8RNIWid36GKJIwg=;
 b=tIs+SIi9wSreFriLgqsN0r4JUSWyaZiWumYuE5jwYTRkXsI8akTIFQmsNtAohdaf9XaU8f/dFQNDCpXnIYsMK4HX9hUiiQcdY5iShGtn8A/tWbYBeVFHxfxYKTBH9YNbupYdRZej/wJgH8CFOlvdEe29U+ivakbMVKn0rlEwzv6bl/sbDc0KSaj0JTXY3mhYZpOIbuMDYkgaWJZzZx7HRtL8iGM5Sig0mYa95ebECHpFobUykQ5f+kEyrZ8Fqn4TKpFlPYOfiOAewEa/IFbRX5HqBpreX5+Agh7TLh2zvW33g1SW3jiAbcfcAmiBL5wltrk7U/E1DODSwhfhPlPCkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qV+qG2P/2xQUq4MFTcMN5GMPRS+8RNIWid36GKJIwg=;
 b=AwE2mz8DaL53ebJzLnEnW0zQtXn6YmnsA2QQCoKPhCiihxdAJsNEUgD5jk15GFT1iEOmjygFAqqC/zvCkKr/+8oyoxfwA3rV8dJ6YjZjdiFoe4bMerY5axT2invivrHmYR2dvgetXrLduU9NHdtk3D08dCE6e3GOxHhItEMDhJ38T2WbeysQsxolnUAztv8/mNex8MyoNV7qg/7T5QSjjzORoml3SbPafaDiTabyuXvaJtqwehX+SoHaPbrO5uA+neT3zwp0LmF4TfcGivTkN78h/GN0axODRY30tkUvVDjXCC0eMOV++l6NqaE9L4SFOaqjpLzrJDD7mLfRnGEruQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by MMZPR04MB483805.eurprd04.prod.outlook.com
 (2603:10a6:190:45::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 19:46:45 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 19:46:45 +0000
Date: Thu, 5 Nov 2026 14:46:36 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v2] media: synopsys: dw-mipi-csi2rx: Fix DPHY testclr
 reset sequence
Message-ID: <auzdHJFvi0Nmf0-E@lizhi-Precision-Tower-5810>
References: <20261023-dw-csi2rx-v2-1-fae30f4c5359@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023-dw-csi2rx-v2-1-fae30f4c5359@oss.nxp.com>
X-ClientProxiedBy: PH7P223CA0026.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::31) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|MMZPR04MB483805:EE_
X-MS-Office365-Filtering-Correlation-Id: 180eebe6-9df2-4af1-b7fd-08df3b75856e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|19092799006|11063799006|56012099006|261021123027099003|261022105027099003|261022075727099003|261009223027099003|261021121427099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	MBQ6O7vRck5uzcC0BYmTQ2Jvz0hhs6UEqsK2IuwF4EE49ASxhIwciFWCfxzX7bDR5lHOGNRMGkXCMNKZChmHp/CGyZKrHpvuRygixRmXpGnIeAtRdP0lqTpAss5cjlzdesDYy6T/LePjBM4+l6LI8sEoFTY/9NwCdr9stSaYz3+FUYOeh+c+t0M5aBJIMX2HX0zwHoxhTUrMIM9+C27Fr+WAwfj4RbGmR8eSsQhk75ZxYsdDyxOodq/xLNIMld/JY/C2Oan+RiBIbDOaxjbxHwASyPXyIEIHvybUAHKbadr5pz4sqbvao8WIjKPmTVa888YKaRfNqDqyl2HenyJ1CBCz3pq1rmN5Z04tHw30eCqXc3iDx9jZiFbgMgqjMuaxQ4uT2BL+DBYFQjlyC2ClV0YTXeuq6zuNmwa7dI6HobhKSuEXpYfMzhjxzm1drNyMWgYb7eICaL8U7/2P6eg0FPpO1quD60rRGzMlTa23+l4KS7NWVlTqK2cUkxeXqcZ5uTX9XwAx+j/zKlXtPQgZYGOhD3aLBffotEaKKifrVkpr9/TMLu+cd/ep97RTjbB0sAFUrFBtMF640qL9y0v1oVSuvzH9c2HW2D4Ghp0oucovhMNwSHMBg9U9W4pledCH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(19092799006)(11063799006)(56012099006)(261021123027099003)(261022105027099003)(261022075727099003)(261009223027099003)(261021121427099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?itRb8Dn4ziNn9cYjZEGyqkvujhva6+PEfk+1CahtzitmcxLIsFvjs97IhrF9?=
 =?us-ascii?Q?4tPjIg8OtDmSmGpaRLw7DiVUdLtDO1rAQZcGloMwRiZzjT++g9afpd/S5qPn?=
 =?us-ascii?Q?ryTdfGUaFqkz9+cGDFu0aAIJrY1NAbVUzO3jympJJPbG5E2hOmSXy97pMklx?=
 =?us-ascii?Q?a+Fgz+LYHZIEaz77zAh0ISNKHBE99UABS1wcJLNlRQeBpclmpDuEEL/slRLc?=
 =?us-ascii?Q?MRXiVX1ybdum9ezOZTKan1sH6XQi3RSNJpinIpPaivbS22Q6kDtYjrAAB/et?=
 =?us-ascii?Q?U4LnmA8k6T2YQKQztVVe+mfoLpCjmjH/lXuARWi7k7Z1hc/yZatLBS0ABAwk?=
 =?us-ascii?Q?Ly/e+60dlklpQWtHQoG3FHknrTAKx/Toy+fmlfJHJCNZK5+ajfr4quh1frOX?=
 =?us-ascii?Q?Rs4JD3Zrxz6HZESZdbWryDKZlgZq0/kSdxvMO7G9MNVegu4QbW7hdIr66K1M?=
 =?us-ascii?Q?VgqJ24sYdCJyMzMGRYajkWF1IvNBsJkH4+976diJ24KdiVLVzcYVXE99cMBr?=
 =?us-ascii?Q?wAkSXl2///cY73Ff+STiM9kwbfNCif9JnvxeNiJEGaq2E8aBK5N+yB7uYz8l?=
 =?us-ascii?Q?QcUbSpQ9nIZ5MLI4LoCACLT87WlxArDg7GRg7/GdslNhrHaZvnhYjUUnlcim?=
 =?us-ascii?Q?Mp5nSsGNvU8OBdA3Vf0YwxA8cS+W5TD/MEUhI3+8YLKqLaBsTV8TqGly0UDj?=
 =?us-ascii?Q?I+1noAnwr8K8tWVfdaIpol4FJ3IuJ/sd32yxy8S6JyeL19MDqH3k5hKpdxth?=
 =?us-ascii?Q?hAsTP9cqANc/wE6fDKPehP4UjgZAZTECztD/7VDPUBvDWuYNJ5kZNxeNWfRO?=
 =?us-ascii?Q?e/E7OSJVTSu4IVMPpfJ17x1AGaifjFVO6v+lnhdEjWYkJeaewBozlRw0vSlZ?=
 =?us-ascii?Q?YVvOpPqU2a8ZoNUlXzbG45WKQVtkQtFTG78U5wy2UH9O4sjollVoXRe23xzE?=
 =?us-ascii?Q?bqhMAtSus4Ixo76zSGb0Y6u4ITdlbsWN4EHR1wUKYijcnxWPW/OvrYmkLyJY?=
 =?us-ascii?Q?/Pt4bzgGrg15O6jS9UrNI+V+hZM6cVEspmMAkg17RSSpMInj1jqb01zGfP3u?=
 =?us-ascii?Q?AW4d4zIEzvGHOudgVHAebQ/rMeY8VvO51iDgEDQD2s7/eDajEUf1tbfjEbM4?=
 =?us-ascii?Q?jqS3zvjaOt87fa5siSwEUKkVPGFQc9b4schFPDN8TZLUxMbz9kosqZvukJIU?=
 =?us-ascii?Q?pY4bjpXE+zAtnqodxwREulfPSWJ9PBAqGWVBS29eK2n7ajBTk3pbZHL2KdNK?=
 =?us-ascii?Q?Fb6WJIPQbs5GxbAFjaNqQdqZPBfoLbRUhtwXJauyc63qEn8AJSgg5Ft2TgNW?=
 =?us-ascii?Q?yKRjLiTPREjys+d9Do2znMCRQZZSXdxeFoX3LWLmG7xMcJO9ITgr7ObPNYTI?=
 =?us-ascii?Q?RwyJQBcvH8CXDGVktVxfdIoDHyBkdZ+wu5OKLLPuMfyem6jZDtkP+M9wHjOb?=
 =?us-ascii?Q?FDsbBjMAAESKxK7eqEnjyuP5+jxBPGo1Rlke1Yqe4/JkCM9y7vSiWBuM93S4?=
 =?us-ascii?Q?2yE7chQpYCsBNV3oYFtR7eKza+6bU3mN+Muby/SyVhJD8KBbQXdjqTEv+s/z?=
 =?us-ascii?Q?B9gw/nh+nU2wksGHWoMBCUYCS9JRZMe2BumYFUZaGLTAduutD9/nWWZk2/ta?=
 =?us-ascii?Q?RXiGI7v/VuiWf3ZglAv7nRM3y3uTFVrLVD01HBV/S1sV7la2Eqaai9C5rrTS?=
 =?us-ascii?Q?au4GTNO5lLq3p8M5E2CneniNxCpldV+cn+CKOkBeRj8y80hzTX9j38bxrbqS?=
 =?us-ascii?Q?5PEMIA53R2ArxAOcrT3ub3N44pDXGUL6ecBgrfCXsHfVYvOHM2n7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 180eebe6-9df2-4af1-b7fd-08df3b75856e
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 19:46:44.9924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6/bTPOPD8mGD7vSa98MOFG34ykctTuXo1xT1WrOkUyOxu7VUrJOrsfS7RioJ4SjuQSZKJM8cVcDfq5N681N/EXX39CFtdPZn+AltSnyMHWpR05fCrOGKBxk4cJx90llD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB483805

On Fri, Oct 23, 2026 at 02:49:41PM +0800, Guoniu Zhou wrote:
> The Synopsys DPHY datasheet recommends applying a testclr pulse at
> first power-up to reset the PHY configuration to its default values
> before any test control register is programmed.
>
> The existing code deasserts testclr first and then asserts it, which
> is the reverse of the sequence recommended by the DPHY documentation.
>
> Generate the required TESTCLR pulse by asserting TESTCLR, waiting
> for the required pulse width, and then deasserting it.
>
> Fixes: ec40b431f0ab ("media: synopsys: csi2rx: add i.MX93 support")
> Acked-by: Michael Riesch <michael.riesch@collabora.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v2:
> - Keep the readback before ndelay(15) to flush the posted write.
> - Collect Acked-by tag.
> - Link to v1: https://lore.kernel.org/r/20261020-dw-csi2rx-v1-1-c58a2e5cd43d@oss.nxp.com
> ---
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index b7247d597c9c..23fb4188e755 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -830,18 +830,22 @@ static void imx93_csi2rx_dphy_assert_reset(struct dw_mipi_csi2rx_device *csi2)
>  {
>  	u32 val;
>
> -	/* Release Synopsys DPHY test codes from reset */
> +	/* Put PHY in shutdown mode for configuration */
>  	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_DPHY_RSTZ, 0);
>  	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_SHUTDOWNZ, 0);
>
> +	/*
> +	 * Apply testclr pulse to load analog programmability defaults
> +	 * and release the test interface for configuration.
> +	 */
>  	val = dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0);
> -	val &= ~DPHY_TEST_CTRL0_TEST_CLR;
> +	val |= DPHY_TEST_CTRL0_TEST_CLR;
>  	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0, val);
>
>  	val = dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0);
>  	/* Wait for at least 15ns */
>  	ndelay(15);
> -	val |= DPHY_TEST_CTRL0_TEST_CLR;
> +	val &= ~DPHY_TEST_CTRL0_TEST_CLR;
>  	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0, val);
>  }
>
>
> ---
> base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
> change-id: 20261020-dw-csi2rx-6225697f45bb
>
> Best regards,
> --
> Guoniu Zhou <guoniu.zhou@oss.nxp.com>
>
