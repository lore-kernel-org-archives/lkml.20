Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013021.outbound.protection.outlook.com [40.107.159.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B037E371056
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404410; cv=fail; b=kFEmK73M3MLVMvrioxb6zX2+4+FCnVuJqvxp8FDVgqshUqKNtQajc5+OmzTr9w6um4ZpTUT0hZSrnlxYYpwpvVOTMfTkBPdu8BNqzj2fdcf2Hn8RA0FpqMxhh/fHjE9SpNaAhANnuakneVNveW6g+k14Yh8/I4CN1bCm0WWqMZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404410; c=relaxed/simple;
	bh=d/AMaP3RZDRZgNRPcQrT+iMMQZdduBixN0JiIe231nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lsBuvTG6G4WQVJhnmtSTywFZlidyLlo/vq49y7RLaHMHefFJcJszSGd3DYkkWEhtgBr4PFS85a2EnqcE4+69rBddnY3NOr7c2FVLOVN4zo/4pkPIHJ8qpImQQCqpOM61AXUkwHY84Pk2DxywpDyDf0c63csJUVmUHD//0xFp1Cc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nVy3pBSu; arc=fail smtp.client-ip=40.107.159.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nVy3pBSu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QrnaEhi2MvFfb3hQKhREjD04rGyytIszVXzDWj+jsh4pePd00qE36MFOaGZlQxPqF0xRSlrta9b1FSTGe0wTNyV83WfcATuB2tqhynjq9MbFH3uAwDUCSUjSrbhjTBWRWveMt4Q64GZ66Lu5ugne+aSKLbNSqSQL2WqCDkQWAR9lkyYRw8NG4UfaaLghOJYFG2KyPLnKI4oGIYxgUXtENjXW8QB9yuxeSHeqQ1ehsq0wo3eftufvB00ZgHt66CWGCoIFrwXYBC0C1afU5Sv3INLlxDMNNei7jzAFNcJumeGSeTrVeGYWDgBsADlumqC7yzUQ/JrAweJWeQK5lRS4fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzZh1rnNEqGDvji1GqaL4dJl5bPu0XBGz2keXUdmRfo=;
 b=CgQqXdabPerSLNcIcC8sJVEL3XcZAb0t7iEeGJ8tnap9dYZOP0dnjJbl34Er6dBEEdzXAvGtaMUAnj0iSCE1OQ31JkGReyy6rAsY6qFmP56IydMKOs/NrVeK75Rb2RX4SS0lVVKh0Cq6ZAFh4+24EGf8pYACBQoOZkRaAQGiqISPUtPYxl9a6qb0OVT6HLrHnnnUhBhU+s0ZrvOcsrk8oyBxCSPqWp2uu+Va1uo9Aw2nEzdJ77/T72LyThIbrPTsUWxg6Jhpiwj589G5L0zYxXIassg7GNFe/2CFA35/z/YZaLoq9Ry/h7pUGoxkzMx3YYIR3KwmqcfAuvOGqoNVKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzZh1rnNEqGDvji1GqaL4dJl5bPu0XBGz2keXUdmRfo=;
 b=nVy3pBSuQL8zSz74ZpeYPou3poju4r+gX/XzPje/aUI01WXsv2Xg170UA3NDUY36c0gW+0Jp+f5AQDuwxrKGLGv3jlCPbVKxoKW5WGmw63z5sq97KvIgjuVNSu7qM19hU87S4msZpwF7Ki/Ey5p0HI8YJ5w/f0lY8sO9FBzMuGrSQMMQl799Y94Ic6OZGK+LP2UinH7t5LlwmVnYk8SCnO8whi282ZIKQck38RxsI2TgJ0ym+4hHY4MGywSmQO8wgfvvFs9xRExGIravx9u1lbHalD8tF/RUAOd7fPNmy6Ywxk4JfWCvDtsm5UiPJgrZnhBBDw3OUohwje+lp39P3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MI7PR04MB154706.eurprd04.prod.outlook.com (2603:10a6:290:102::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:46:46 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:46:46 +0000
Date: Mon, 14 Sep 2026 12:46:39 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/17] i3c: mipi-i3c-hci: Move DMA suspend/resume
 callbacks
Message-ID: <aqgk7yEFfkAtvCek@lizhi-Precision-Tower-5810>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
 <20260914113003.183150-11-adrian.hunter@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914113003.183150-11-adrian.hunter@intel.com>
X-ClientProxiedBy: CY5PR15CA0085.namprd15.prod.outlook.com
 (2603:10b6:930:18::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MI7PR04MB154706:EE_
X-MS-Office365-Filtering-Correlation-Id: 607f4257-5706-4c48-94f7-08df127fc356
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|19092799006|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fo1kSrVNUDnvvTvLqYMzJmGG+0mUntnc7mRcHtJEza4f7YAZIfGIBP0moz8jXn0r6bfQXdtXhbN34gobV80jcQNQnIFKr8R+O/1zWAho5dcDmC9KqnWRgvQZ+wGnNBR/CdROBXCI0GbYHyzujLExLmcZsJSj97sIVbgAapGaGyR034Xm7W3/gwIvs2nM3iMIG9cO4p4KueJu5OGEpzBm8oEtISWJfYNCrnYDm3XOkdKDueeUMia53orANQ6wd3lwBepktmKJuZzWsKXim4BhAtQmViTddUSW6l1Xv+BZ6GzXUSB1T8R6398Vk4ZpZCxBvIjMPG3LMqbNSDbOTzNV+Ri7tb32FdveaTs/tSOy86nkWTPPG/xpQonej1H6+EDRzmAzjVdVdJjOsxNY+SvzzBRlGecSUoS2bUb+FnUgmI9jsZhDgMrn8NnHmcfpvfUREjPTfr5pUstQEmfXqJo3gW7G8Cj1IAF613glMjoA5l7WbEcnrGeTZupfQD3USf3FZ3j2lttDgxY2KeJ/9J/uAXQ0YxFTgK9oiDk5X9R2OEVkwxqVaWaga7KynHBuV0CUe2/CiamKaZ977gXLCu/I7ioKIIu1NU+czwofbgbzrfgIFaYgatannPmB+r/Ht1rtM1l8fQ7R5wtRYf7QZFBjim62G5Nlnqx1zSnZ6sUQO9g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(19092799006)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?co6zp96XhfxhX6UtvPxCs7YbYDJ2hgu1oUnemEws4DfH9dJ9IRy81sAqZOmg?=
 =?us-ascii?Q?vkKkcNr6Ds86MC8p3K9MKach/W+JZj3fHPqpnJ7gooYKlSdGduElcfblcTki?=
 =?us-ascii?Q?/bBMkZglIxah9MhZ8OOUk8fglflYfOp8KKJD4TlKy6gBABedM2Fv+6xlzRkJ?=
 =?us-ascii?Q?1VEiIU8Pnoph01hjEJ1ACrsPsZNBAjHur3+7vI3HFMoU1sx+48usLVqQ6Sjd?=
 =?us-ascii?Q?MKRHUa4xI7letcx8Dhl3KAu5iQt/+xLQzxpE8pdI3buS40EFm5V0wUXmkAYG?=
 =?us-ascii?Q?j1Gt+8loFlfXJyx9qvdIVXlFPys8WJuikepNf307BnfhrNZj30JGTHBe6UsX?=
 =?us-ascii?Q?IJTYQBjx2GXb/GaSksBeGyYsmSy8uZOutKDgrHQC23HcP2KIhpkOzTjmLkZ5?=
 =?us-ascii?Q?Zq8+WsnpgKDn9vmv+opwPJfGfddw4DGgE+Od/ZtlQW/BEUmg7fyWltrlYRci?=
 =?us-ascii?Q?73fpynmhiRoEMvCDLXBorMcpnT+OImYtnAIedzOd251WSAp2VYmpyKccZ1UE?=
 =?us-ascii?Q?TJrBAs0D7Isg201Mm06WHw77NNXNRVGVO2NitOfWT5xk4btfJytXpIz7Gb2V?=
 =?us-ascii?Q?lK8eX1TCRRbLkMF34xOoo3VlSI0CL6ULjPkwnHYnj0FpTev4gev5Eb/Xv5d6?=
 =?us-ascii?Q?t2obDn5EXLqUZVMIHTXlPhYCbxTrTtG7u9I2y/Fr5ebR2hCL0OMsy6UR/C+U?=
 =?us-ascii?Q?zMplKk/0t0d5d8oecp4LRv9bj1iyBfsETiKqZQ8v9UptkuWBJ6eiEXqbc+2M?=
 =?us-ascii?Q?rN5eOa0DBcDHP0OYrF5A/4B2VrrcLC0Hn/FYmxW+o8NOTD0lQ6al+QUcI5tm?=
 =?us-ascii?Q?9c+cBtbgAuA2xGvUnRMsN44WKTyQGZFF4sUAqQnlnmBTSDauDzasGOfWvsS9?=
 =?us-ascii?Q?QD5qx9ECSaDfG/zrREBIkMltedbU2Y75TTOECzMOPhxb/X6GaTKbotOeZeDJ?=
 =?us-ascii?Q?29s2p8vE6X4owy2wY8XwRod+1AVHBtXw8R+wdTnn6rhkApW0QuzpIho4zS6b?=
 =?us-ascii?Q?vzT9gFbCdmzlY16AmUJuCwsT3pStH5+Qvpclwa1DkR+GaeijJXojsFo63N68?=
 =?us-ascii?Q?vQmQip63nWyZzcIQGQ3GU/aVZwD0/FmvQ1EFneZcJxz37exa0FCYSpwqRqzM?=
 =?us-ascii?Q?bLj+Sa3Yw+U98jX9ded1SmLGFRKn9sIdlQzQVNym8iLoLXZNfC74ZW1qBmMJ?=
 =?us-ascii?Q?MvwJuDNAlPzxbYGOQmqr/iBkSHPyCLmg6cYYhk50Sjw9YNnpW+vEzEGBu40C?=
 =?us-ascii?Q?gmtPps5YNlLumeCnU4uOtRIYgnrp6rvkxWcnbeUzUXSvQCV1ikxjJaP8h7G7?=
 =?us-ascii?Q?M9/+i3rLEXDNOBAxwRuoAS7RdXZR+QnJTT/JL+GNcTgLXHXTZJypa6GbqMH7?=
 =?us-ascii?Q?1Ie7yIl+BLvqc+geqJAZZX1OAchNm0s0d7+XnRjbnuqFyy9f5qHVOevigYa0?=
 =?us-ascii?Q?ggdSWtKRxSrg3/d0K+9qaGrUUQRlVZ3srsVF7CrHF8OVrBqDKmz2ym28AfP1?=
 =?us-ascii?Q?xdGkKEdSptXGPbK8dtd6LVbNIP03+N8IDFuq7pBqSyOfJgmL6PmBMVDxY3DS?=
 =?us-ascii?Q?Znkhmh2ma8jXx084ebKLCHV0LBRMoOjos7Eh7mvOAZ5D13K9gqTBRQH6fR0a?=
 =?us-ascii?Q?Bn1EFDbVzrdQT1zEaV6t8B+Ko8SstebrrjEgY8MDC4Rw5kDiA+gVdUfaJHyP?=
 =?us-ascii?Q?vE0kGrfqNWvngoMdFm6rjN/zCkf3lmLnBt3mDqH1MlBtpexR+sRsFzSWVPy2?=
 =?us-ascii?Q?KKsjN6P5P7MVcge9OVJG28AXfzy6Fs10JEoZ7p0gFbjs3hqKLguY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 607f4257-5706-4c48-94f7-08df127fc356
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:46:45.9478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8BMCAgKXbQHimyaLjS0q/9vmn49avMH60q+iSvvbm2KkfqW/vpP2xQQjFIQ3mcFSAxl/7lAHZJwNHZkMu1wZ7Gfiqjf70iRcCdvj1+qjlprqDa2IjOanbCRcYpijXcZM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI7PR04MB154706

On Mon, Sep 14, 2026 at 02:29:56PM +0300, Adrian Hunter wrote:
> Relocate hci_dma_suspend() and hci_dma_resume() closer to the DMA IO
> operations table in preparation for upcoming changes.
>
> No functional change.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/mipi-i3c-hci/dma.c | 46 +++++++++++++--------------
>  1 file changed, 23 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index a798b0648922..ec4b469abd33 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -273,29 +273,6 @@ static void hci_dma_init_rings(struct i3c_hci *hci)
>  		hci_dma_init_rh(hci, &rings->headers[i], i);
>  }
>
> -static void hci_dma_suspend(struct i3c_hci *hci)
> -{
> -	struct hci_rings_data *rings = hci->io_data;
> -	int n = rings ? rings->total : 0;
> -
> -	for (int i = 0; i < n; i++) {
> -		struct hci_rh_data *rh = &rings->headers[i];
> -
> -		rh_reg_write(INTR_SIGNAL_ENABLE, 0);
> -		rh_reg_write(RING_CONTROL, 0);
> -	}
> -
> -	i3c_hci_sync_irq_inactive(hci);
> -}
> -
> -static void hci_dma_resume(struct i3c_hci *hci)
> -{
> -	struct hci_rings_data *rings = hci->io_data;
> -
> -	if (rings)
> -		hci_dma_init_rings(hci);
> -}
> -
>  static int hci_dma_init(struct i3c_hci *hci)
>  {
>  	struct hci_rings_data *rings;
> @@ -1075,6 +1052,29 @@ static bool hci_dma_irq_handler(struct i3c_hci *hci)
>  	return handled;
>  }
>
> +static void hci_dma_suspend(struct i3c_hci *hci)
> +{
> +	struct hci_rings_data *rings = hci->io_data;
> +	int n = rings ? rings->total : 0;
> +
> +	for (int i = 0; i < n; i++) {
> +		struct hci_rh_data *rh = &rings->headers[i];
> +
> +		rh_reg_write(INTR_SIGNAL_ENABLE, 0);
> +		rh_reg_write(RING_CONTROL, 0);
> +	}
> +
> +	i3c_hci_sync_irq_inactive(hci);
> +}
> +
> +static void hci_dma_resume(struct i3c_hci *hci)
> +{
> +	struct hci_rings_data *rings = hci->io_data;
> +
> +	if (rings)
> +		hci_dma_init_rings(hci);
> +}
> +
>  const struct hci_io_ops mipi_i3c_hci_dma = {
>  	.init			= hci_dma_init,
>  	.cleanup		= hci_dma_cleanup,
> --
> 2.53.0
>
