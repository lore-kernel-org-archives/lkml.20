Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012064.outbound.protection.outlook.com [52.101.66.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E624CA796
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789680216; cv=fail; b=qESJfBNm7OG+BnpWzo0KdksQQbaKhr7bGSG53OU0y0vSjWMaFpoqT1LJql7jlY/rFeUhrtuf1EVEQRD5W3tE21DldKTTBp/RiWYWMxrDFEinhGbRzV1VJHKSRPfrsc/PdfRI+R4aTqnQoT21Pa0SnDeAix8Z26JjNj8HrDNrDWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789680216; c=relaxed/simple;
	bh=abBKEBV2OBM/tkWpveoL1NXPX6azicdzJDes6WF3i2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JoNESrw3LREIYiI1SSUUmvfT7jt/LH8Wt4X8oNViJPkOuo5gkKnw3FR5NEiFSULLPTVT84AHwCBHMRgcf5GNbHyZYzBdJJhKd+TVDlzfE40mWHZ9Gcc6Pq6ovk10hypkwH0diA7V4ubXB0Y0q+NkJhhgmL+/5yGzM1TevvbqieM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=t4Jqr9bM; arc=fail smtp.client-ip=52.101.66.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="t4Jqr9bM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SfQNO/d3JagFhZnReRveeGWKlzoVbH1Y1xXtehIQmT+EmWbYJVX83ul013V/CYUcyX9nl1iTlS75eD0OBFz2/y6yCoCuHHRnmBClqLMc46bSlTZQ1B+2r6BAYdbsjCr84OOftzdvDgOeZpxem7cuyJlIza3w60qutWEybd78U/1irUungDOyLZmtDZM3vMV1pRH/IeTsoEbxmV3Y6ZeBiKj7Njo5jYwNrDvoJ780ME/3TKfvCDgHpatMXrHHY4wiijc7jbX627v56GGyKe1qVWMa5vvKUzLsgkj4YYEmRgMvcwO+sXVWE/Lpx9L1pnxWuuybKnw8DKztMxPvNzfB7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kf7tbpyScYVWG0T5k9kVlaxnsG9BSng7HEX4cwwg21w=;
 b=bBj99Xoln5dfNkQ4TDl4rw3DdqgcLhDlk2lFl+kBBBMaAtVErRKSDKS2T7m2IE+/neNlV4KADs3r/6cVXILV/KQrJOhcQnBLXWuGphHlACIQ9/owZ6zP4fqwpvABSEp0JuAQoFLQh0N9775R3erf5rXtEWgJyFHkAPLdNUv/HXLY8r6gTy072XIG0QzKG3GrRVTmtRPzcC48kJYQhRSZ+e7tse7/IyjIdAvogL2aXQH/7wESc33p+k+lB8hiSCsXFc+r0KelP/IFmDeg50klgID0etiYbNP7CwCTPG+C2tC1RaySUZ5bpjvFu2kgI7v4LiOeJCj9rlblMFIsrT84CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kf7tbpyScYVWG0T5k9kVlaxnsG9BSng7HEX4cwwg21w=;
 b=t4Jqr9bM5vAXEo8qxp/ARvFSBRoFMGwK0QGmLB5Iess79zCouKPv2Bf/A1Ef1HvNooZ6PzDVONEVl4wtUyohxykeuxIGIUHfJP2sTjtI0QqnwuF1bw3M8XXEww9QROnnLBGGB1Br/oRbfqQ/G4IztNdKAzCcFf3JydPUUkeFUXeb+wabPKyZFTIfgLmJvfHeX/WLyDbhXHQP/MoYgtiYVgLPv0sTJdjP/Pg5NAxPx6zUu3YkEZG3Suhs1zOuvNkqBSLvm9ao/361yWMQjy3CujbhVzL7bB9DiWd+ufd2zXqVdi/3MmzStLzEm934v8hp/LhtBZJcpLw/NVYUDFZNmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB7927.eurprd04.prod.outlook.com (2603:10a6:20b:2ad::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Thu, 17 Sep
 2026 21:23:31 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 21:23:31 +0000
Date: Thu, 17 Sep 2026 17:23:24 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 06/17] i3c: mipi-i3c-hci: Restore controller state if
 i3c_hci_enable_ibi() returns an error
Message-ID: <aqxaTH1XyxAtP8Cd@lizhi-Precision-Tower-5810>
References: <20260917191356.133242-1-adrian.hunter@intel.com>
 <20260917191356.133242-7-adrian.hunter@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917191356.133242-7-adrian.hunter@intel.com>
X-ClientProxiedBy: PH8P222CA0019.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::21) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: de03e275-8cfb-4d4e-92b3-08df1501ec01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|366016|376014|1800799024|4143699003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	08dbYV46i2MplpXfvnsJkGdkj6Exza3jWXWTwBLa8S8wtLZx2MMAwidsjbivrFQeYT1qyhTnEG09eZxWe56Cs2Kc++6y/nQMyTBKXgR7MCTO307EjLyCcoVVQQ2Bx9Ax1Dxy17kbsQy6dkJvOkd3Y0OabG1in1c6ph7YNceRMsIQ1moB7pzuZtvo0Tzt67mIebXVDSpUuKVLcVv/94pwDm1IChUqUCbaKcUGqE2VaSgcahvmXEQZPm5G0/0OgZdaS2UEkr2mRbUi40fiwEElwJCB2p0jqBkdjWzz4bT6z2ceOTKmGrttQVz/Ev/dkh/FNbdKcYa76zItFeENdOXt+/9rTmRQkmZzoFXY0cKRlcYnqfXCEZ4qGO0XAoEHZ2SqIxkyh3Nul2amutmbuBa0PyGGVtJLo35ky7ugZEAcmFBfPG6Vnr8W7JEkMD5j2KBqguq+eZ5N10O+cCI9BwUY8uucKDp4DMrc3mX4ByygWDoV3zEYI0qYTw2wJlFBCls2w3N/OCur4ObrMUCZq1MzVSbPvTfM4W9Egy6yH9T16tNdI+I/CV18AK6lv3umpIsJILh3tsHB41Ob79x2XSTMFkeLYPhscpXcpVN5Yrr3OKir04LlKc8DP/OOmsiPZj4EDhi8G4gS7rKdEycyLjYlfgs6HdCHspzGY71vcNAQjOw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(376014)(1800799024)(4143699003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E7vs4zrmaYuf74QXIP7QZf+xdnGPu8tx9k0YBg8hBgRyI9xNzKfK+8Bwof5I?=
 =?us-ascii?Q?ZJMD8T1YKrSws9Ng2NajEC4uRghwp7WsBHiWlXP1sSH8quONsK6XjLsFla+F?=
 =?us-ascii?Q?U9Hmn5OVJcT1yEuc7GiDlHGXei4BrRUQU8WStWfLufZ0X9Z8X1MOOjRN+GK4?=
 =?us-ascii?Q?i3Iy1JnzrI3Y5p7uPHxEI9YWvYIG9RDQXTlQiFXOSyN5Ck1bd2WQHvKc0CMJ?=
 =?us-ascii?Q?xJPVHX5fe3Gn15aHVh07O784qpdXjjA1M6Tur9gWpW0gGnm8fcAt0Zi7ghHq?=
 =?us-ascii?Q?pIL1qEaYCVqeqN/AnUFKqlXQQRO/FKqjzFKK2UcFdym3fpEU2p4xBGv5ianC?=
 =?us-ascii?Q?la5qD3nX3g1QrEM9hRmfAINlxA81zf0LivMnUNaQB32gyPiYmCMLenx2w2wg?=
 =?us-ascii?Q?RaTPBiVYFTOa1aZb18bjdyQfCmR/unMSC8d0LGP/laYWO60HcaH7DRgtRY0A?=
 =?us-ascii?Q?gY/HooEbLQVZhytTXh1B6ElOGCfRHl1O7e6Wo2hAZ44v67X51UC9P/MHF7jo?=
 =?us-ascii?Q?hngoAY2tlAC9YtElOUDxF0YZWuOuNB+fJ3WyeIufP7sHfHgd//5hOmMjW5iz?=
 =?us-ascii?Q?LLEnl+tZkQiBNgzo9oA6y09FIXZbFGceKklw3ixW1g5pOdhoGENUvzPMDzRZ?=
 =?us-ascii?Q?WMi2zYo5jqLrNHvNFwcoXEzOJJQ6/SUQnSat8fMgU7vgyJ5PmpMuUVa7C5gC?=
 =?us-ascii?Q?r1BiihcGUbJNbTINMQMFd0zskvs70D8mnTsV/YIBewOX8n2LLkKyEpSy5rg1?=
 =?us-ascii?Q?smyEO9G02zdrFyPs+FCdsrofvRUKMHaV8V7XBXfqv5FYgIyDW5qlgsd5MuKY?=
 =?us-ascii?Q?RVSfiILpMf+f/99XWwV/lob01OqGVtC9ojcso3YAnzon8eDarKNaAnd1tr2M?=
 =?us-ascii?Q?ZAlK25V5lSHUl9SyQqqZmeBUzEtDt57FedW+t3oH94O2A8jo8Ij7IgvfTLr3?=
 =?us-ascii?Q?3l3aZjalVHMdxKoKcIIHSBfD8mFbMQR0I9Uc1n4MD86WWR7dXks/1oxo6ReM?=
 =?us-ascii?Q?7p2gDgKoZ5jREQJhBcBfDcrcDDIX3YitwqkEjIgdV1DZWAWU5JIFqsgI++7X?=
 =?us-ascii?Q?X4DNJYI9C9K7CNpm2byg9aMeL/0EOd7/p1hdWqsL2p4PR66REuuLr83SgoRb?=
 =?us-ascii?Q?blYi1LmN/JfXc9sF2F0ADztFIlLjmTk4yVPdVLaJAw194c6FWjGKKMAdeoS5?=
 =?us-ascii?Q?LhjcbvWEkHaThbof37wW23EFGOdLGXF8chGD5SC4zGHXcbZhCqc5fhqy2xol?=
 =?us-ascii?Q?Zx8JXt0NM+1ADuPDeimvpMle65iJNvfWxjwn0c89AHyrCWcV5P/StrgOGNbe?=
 =?us-ascii?Q?ShH6SQ0gdx1AGlZ75u/IK7J2NLOUm2Bn3iJ8gn/VBq04K3I8lVGzMe6ZzFCi?=
 =?us-ascii?Q?cIBpt5iXgfK7VbKyg4teYguxVwbYWxV3vRH2Ne5m29JueAkOaPRGPFdOKVgV?=
 =?us-ascii?Q?hw9j9tFRZaB06njp4kdk95ZPufJmcuf/133hZNNEKWpDnbzqnhcmLOZE/0/8?=
 =?us-ascii?Q?Dm+tedPVGA1ncF9gRL+WWd9b8Cr6tiDMMPA1BNhLBEZh3j/rvnH+thPadFSd?=
 =?us-ascii?Q?g85/ChaFamTlQUSagLWmmlNMBwbBNaFH4aLnLPDF6iGfUgZFcCrzZhRkFHCH?=
 =?us-ascii?Q?Jvn06zaKQxzWmRjtU4r9fbRt6fjQtnMQokPHjewrOi9v3dBWZwRjaQvF9k9J?=
 =?us-ascii?Q?rmV1Qs7FFnSNgVojE0HzYMUvniLWSS1mshxUG7T3hLWjteQ2kW7yXnjOtCUH?=
 =?us-ascii?Q?CE6pbPuoZuV4AOsWcC3ipHAaGoZqQkzPMlbS0rmYj3lCrQYUoHuh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de03e275-8cfb-4d4e-92b3-08df1501ec01
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 21:23:31.7347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MBHkz4ui8YYMHq3sDsRJET/IWp4/eWadXSs7NMIXcXBTBtf1vOMWos6pP1zSVDfQLNqn66Z9TGbzoxs3Cll0USL3lBPtGHLKCkZPXYIaOR+MZpjcxZxmQj5c1YkKbUMu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7927

On Thu, Sep 17, 2026 at 10:13:45PM +0300, Adrian Hunter wrote:
> i3c_hci_enable_ibi() performs controller-side setup before sending the
> ENEC CCC to enable IBIs on the target.  If the ENEC CCC fails, the
> function returns an error but leaves the controller configured as if IBI
> enabling had succeeded.
>
> Fix the error path by undoing the earlier setup when the ENEC CCC fails,
> ensuring the controller state remains consistent with the failed enable
> operation.
>
> Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V2:
>
> 	Reworded the subject, which was previously "i3c: mipi-i3c-hci:
> 	Fix i3c_hci_enable_ibi() error path", to say what the patch does
> 	rather than that it fixes something.
>
>
>  drivers/i3c/master/mipi-i3c-hci/core.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 8b3a87d8a8bb..166d9f70f435 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -703,11 +703,15 @@ static int i3c_hci_enable_ibi(struct i3c_dev_desc *dev)
>  	struct i3c_master_controller *m = i3c_dev_get_master(dev);
>  	struct i3c_hci *hci = to_i3c_hci(m);
>  	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
> +	int ret;
>
>  	mipi_i3c_hci_dat_v1.clear_flags(hci, dev_data->dat_idx, DAT_0_SIR_REJECT, 0);
>  	scoped_guard(spinlock_irqsave, &hci->lock)
>  		hci->ibi_devs[dev_data->dat_idx] = dev;
> -	return i3c_master_enec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
> +	ret = i3c_master_enec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
> +	if (ret)
> +		__i3c_hci_disable_ibi(hci, dev);
> +	return ret;
>  }
>
>  static int i3c_hci_disable_ibi(struct i3c_dev_desc *dev)
> --
> 2.53.0
>
