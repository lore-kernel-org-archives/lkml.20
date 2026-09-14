Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013026.outbound.protection.outlook.com [40.107.162.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D1C399011
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789403281; cv=fail; b=RoXAvmKzTBe3g/4zM0KvbXdX3ueQDBYtU3ZmHEpR2GAqsWGcwqb8l7q8Seg4oRL23zdzghv/oxcx8Af6Hj5x36PvCFSzILEum7DGuJ0E8YhLkOQbQluOTJUc04hAR2ojEvut43nMKnJl92Hw5f1+HEJHYq/VocrprOsMrdtNGYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789403281; c=relaxed/simple;
	bh=VCZAWTDe3B5h2x8Mi6VDb9BVN1l23RiNVZws3p2WJHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HnXCGGmy52jU1jpgCpz5Byp8QAUsmrBjQcU8cW4urNegTlhxEr+I4XN47ta/bfADA1XYhyRxkZs7PazsaaUsj6gdbfv09BqEz+t9s06W1MeFibn69HQ9o+v6K18Lf2IAAd8m808bTBANgJvB/jjFLIKAgXvLnT50i1h6DmOsDIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=laRWJcbR; arc=fail smtp.client-ip=40.107.162.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="laRWJcbR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtLBPLszmvXUzH0g0qbhMvcXM9vfVp71X5xRNUzaIAa8k6kRDxUArtoi29LPuxNM8OkaxMEcG+yTXvKuBvl1uuNHw3/c3zBbRAYogSkUfJfsopMFxgZo6uGFQVEY4Y6w73r0zORooovho7U1FuAlwTV0AcsdLknKQl6/fgbQ7RwWsJbfrNUKh3ef1tPzQJgNJx2qYeYtC9H/97+vFdO+aTWiwOI3IvKRVxb1ihVEMX+Kl7VuHatYgL6i6b9tRnyeUZhbV+iApjO/6sA6O85L6XDpgbs4OaYlNrA713EgtDlN+WpFfxYFpzMUsqYfkbiR5Jvdxu9lYs99zbX36+VU0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LeTOtDnud1UEj4mSxhXq/CfkA79QuJfNO2T6A8WEXc=;
 b=gEp8EZMW8olPmA5+LjyhzDwU5mV0gWILmd3I2xpYyFl4G4hy6S5FFwYaW/5w+RyiTNOSpp9TWH2ho1vC+ragTLGhW5NVUyPpdeNnal5CISVAsQDW0orlCUuPWsOrTvyAYKGgBxqDD2F+vqoC6zeBPWBm+CyeekutlubMILSmxN6P1e16uDH2FwzUElqXY8pMTIIC3Q/TT49tHN2Q0n29tBW/XH7qXShf+rt912gx6LmS73RAoWcOV3QhPg5BZINPF5x0kRR9pjRruVhe2sELuTZuhISvnWU+ixej4DHOPmGz/vf3L7q7j4Uddkg6dNzYm6vY7wfc5bP6L1VWMJLhZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LeTOtDnud1UEj4mSxhXq/CfkA79QuJfNO2T6A8WEXc=;
 b=laRWJcbRaSPbGQ7Z/pSTRllcvNIB0Z6lHdm7npFirAj3Z0fE+0txnmW0jEJdSzbeLaXVjfpL14LjbVHCdXkHOrRP/V4uHQrStyhEDf1rIYUURM/6YvIuO8DqaPK22R/btYqJPWxdROGvtEVcBbajuMJZ4yell0dAqUVZac3djRI+uESE57V7qkEV8y8BG78bLMwoZ6/RVHR7m2/kocMuXpQJG30ufkL7s2tyaC6R3PJER+Y+PjUzmo0mXcpBNsrx2hZPLLCvKWCjA9Xfh0ILnh1kprFWCvCNUARL1qQ7hRFba3F3o/L6FdFFe9mv3VM7Wip5TrLVSC9S/Sy1QGHtVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VE1PR04MB7376.eurprd04.prod.outlook.com (2603:10a6:800:1a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:27:56 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:27:56 +0000
Date: Mon, 14 Sep 2026 12:27:49 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/17] i3c: mipi-i3c-hci: Fix i3c_hci_enable_ibi() error
 path
Message-ID: <aqgghfkSwABLnm74@lizhi-Precision-Tower-5810>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
 <20260914113003.183150-7-adrian.hunter@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914113003.183150-7-adrian.hunter@intel.com>
X-ClientProxiedBy: PH7PR17CA0056.namprd17.prod.outlook.com
 (2603:10b6:510:325::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VE1PR04MB7376:EE_
X-MS-Office365-Filtering-Correlation-Id: 38d44a2a-5251-47b7-0a58-08df127d21fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|23010399003|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RU4ow0N34CNOQ4PDvCifPTNjbsHm56cgRNMoEUUqmFD7Jb5wJbVsDMS6lrHLSG3vZj+BPKRMJHWWrT1Z0JxxkFE9wQ6/ldn3eS0fNFSIeJZyVF4qBu6jVN0ciluubFplv/8gDMomGf8NxIbfAcFPjLMlB2E8zT4WKGUjl3fLgTFrTyevpqb1KwOZertCUbzN+KYq6qwo35U3kcd4UrTQWPqDhPixZtdoWETsk+myd5P1UyQTeSG8nDUGPbu/r5E1soESBQTt826ignq7pv0zuXLc3z5RwwjRiUPipQ9KTN+t9Wz6esosFkzFxJrKDO+YSRf69zNKdpda3gE4br5cpi6kdFA+4LYz2yy3/CLUVtAdY6E2aZRI4vIUSLX8A/NLAMVGmUxgELTvHnuqnpMXBSAlc1sKl8O1B+L9qb9uX2851lmvdRSIC9tCaWzIxAofqKQoDCIqftTjGccnmte2NzZTnIyP3Sif9m2j+D9xMZzYYXh/9RjcParNaAxqkxVIABC+vsxUtpDYD6dKlW4WvDrqdVGuHlzl/8yRN1IDJ+z/QRIF4gBqG0L8xbqxGfrG+9M6ieTIa4loIPFhz+OScAq9PQrUxU1ioVgZWCPVT26iG6yBqUSimIwzwky1JsRgYNBDe9DCsQqW1idSua6xQnCj06jYru4NhS/xP6dzsjM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nwhZ0sGGEQJc8DKyV1mt8OJzyPl9XNoslZc5xgqZ1k8+4DKD2S3TA0zgq9NC?=
 =?us-ascii?Q?TdnTq9pXGDcqmCi8kRM93Yd6UI6jQHGGhA2N7UGzc+9SF2JVRqdBph06vkOM?=
 =?us-ascii?Q?qZBcYfi2obmAbknGO6slIf8kBd4hzZOtinF6h+sraQToDg89uu3VM0RWHT9L?=
 =?us-ascii?Q?NJJhlaebj9cMY0jNHhvOtKJ/s2Gl6TeVgT//R26GXYXmCyzMk0klZwDxUgc5?=
 =?us-ascii?Q?aRx0uQWeUDjz9J3L2yOnhLV+NANusIKmqDULnuyOufQ7oo7d6WTt7EVowl0t?=
 =?us-ascii?Q?zy4O06pf6zrVvOl4OK+dSo7o68d1ArX+1aLIY54GqAGlvZs1IBortPYDaROS?=
 =?us-ascii?Q?Wl0jHS9kx5x/E11GzqTvwIaupKO9GKjxayldLj0nwe/Net1tZhvltimRoxcA?=
 =?us-ascii?Q?YPC77KAkg545ZqRw4wkLVeTWVJdBu3kQ6rBOVKsYzc26THfmyNcIVlthiEl8?=
 =?us-ascii?Q?MyyLgVL5aaecv6JPzf7bT6xRw8wymPsPELCFk32cNjlujTMh0U6uxAe+rWO9?=
 =?us-ascii?Q?+qpj002mvYnUfJxB5h/l4eo1R5O1CM2vfKq/AeP9Rhfping5S1lU0yL2lpzT?=
 =?us-ascii?Q?2sCqmsbwL6iu7KjP9EgKtgJR9FIATt1p+Z8Xu1KQpfI+Jlt6kQdtT1iz6A0L?=
 =?us-ascii?Q?1VyJrAV/dW/0LwTZzXrTzxcRIw9FWhwyfHJ2yWlKbnzHP36jqr4GsR+NDeWT?=
 =?us-ascii?Q?nuS5jM2l3A6Aupb94K5pdkVypLNWGA0QLnYTiifs6hEY8S8vylCgerGAoV6F?=
 =?us-ascii?Q?Rol0A26lAiO9uQkEMAvUXH70qGKTAxNIv/LcqUdmsLZUYYxxAkdjSPzpAn3Z?=
 =?us-ascii?Q?b33b+eiUUKq0M/Yr4V6B7AZAmvdym2/T/jY8/qKPJJqq9w7NqN8m68yxpacv?=
 =?us-ascii?Q?SojxQEgoPnKwTOjTs5ZTC0FMs4vkGbANUpAysgs9kYdYbz+Ih8RO7T9rcVvD?=
 =?us-ascii?Q?mS3wx/rGhnUvIxqpjfhIbmRLf20NGxcsItAZjB8dRfmcQaNvXGiYzoFjhj2P?=
 =?us-ascii?Q?+86YLP4sLQnEDdxqWQGv9u3NwGDBFkrOfoxVpt88cNZ346iwbTHSJuNKjtUf?=
 =?us-ascii?Q?uXt886bwCjQPS2jEUG0RivQtY6mwBHqEmcs7BrKdMN3HSlOYAZhwKAMBNAYa?=
 =?us-ascii?Q?bBcBwS6c8mr4VisJRJDiwnpwsMNZrQ0GPTQUqRHAZC9HQW5KydNCvrVHPiP8?=
 =?us-ascii?Q?l4VMfZ9ZsQGCZMcnwJBWhUN/tLpW9PTVwjw6wCE+F+r/rpijqmMw4P9bo2+s?=
 =?us-ascii?Q?WgI3a8lep7pa14NvxNS3NnzfpwV6p/3/HdP/w0hngf1+4SleR+UoroJI2z0q?=
 =?us-ascii?Q?Qtc3rxRF3rKXtOlOVpF628zZjsE+1U8Cp3HLHPG5p//IMM5sk9ilSdMYPNnV?=
 =?us-ascii?Q?+Roy5wuatcvaXLowOwTesbUSaLTihFo65MyRL9Qv5WB8MDVy5RwfOKFgE8aJ?=
 =?us-ascii?Q?ST+MWXu/7qB2kcf/BURtDa/1jlYA9qzQCZy/Xwbwrlb+65IcgVJStZS4R7Nn?=
 =?us-ascii?Q?9zl5EJJp+7zH5cbn9XHwiII4TbU91nrUXKODaFDayHJJXb5Cs3yOBzPgpl8I?=
 =?us-ascii?Q?Qt+1fxjtioLi/cCxzk3ziq6A6Zg+dUqe2eJfP57JS4OgoKCMBfW5J/vxlU/F?=
 =?us-ascii?Q?w82+LFd7M78jGw4LGfio5YxwOaozR+00rMeVdwjTcjbb/RRpmMYrLH0ELdn5?=
 =?us-ascii?Q?Y7xAPcNRvnyb0RzqHH5pFBuXVkt9Yugjs7so7tfWS2CuOPyaCw/RmXHy1zmW?=
 =?us-ascii?Q?AfQ52xCYh8ZszcFtYi0YBYCohA/UbAYAYcJxRc42PpDXgR8tjjoh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d44a2a-5251-47b7-0a58-08df127d21fc
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:27:56.2077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQ4V3Z8dpVyni780Ai7dc8ovKxOxt56n8G0JbgvQUkH9nf+CxV8rxR0uh/WJdHOH7rMUMfvagt8CNguWVc6yofaWQqRP93TlR8V2sHvgNQfsthZQ7gP8EmfQIE84XP5E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7376

On Mon, Sep 14, 2026 at 02:29:52PM +0300, Adrian Hunter wrote:

suggested subject:
  i3c: mipi-i3c-hci: restore controller state if i3c_hci_enable_ibi() return error

Frank

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
