Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012003.outbound.protection.outlook.com [52.101.66.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBC7385D61
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789410113; cv=fail; b=R47tKZ97JNSSVx428wesrKfhG00BvUvGOVeSKB0DF9a+zUPaU63yIPNsof15pXmP69+ZrfLyd0hm07dqvjURsjF2NdxYFcN72AG6K6/CecFGkx/Y7UdhXZ13sLoOadkzJb0dajPDDJ+hSdWzG+udk0ma+BdcAu0+N8WMlaotn5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789410113; c=relaxed/simple;
	bh=0BG2GfxZ9+cMoJ3rBJDfcbxYMaKhOqLQApNKzb3lezA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uSz6YuhzPjHBxhowV5iLsZEJKsWlC2SF2R8KKaHqeqHOe9fgMuSp2ZtyZchwU7/5xsMv++w+f0OIC3zsI3K2H7KlSG9LpSCTF0RvlLDb/oqajS6fzFFAr5FnX16N/rQkJBtInBWhisGnWd4UjL1xSlrR/GpxiHenUQCuh1Q4g6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PuMmrMVK; arc=fail smtp.client-ip=52.101.66.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PuMmrMVK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=puAZM4PnQiVB0IJW8zTzA6ov/YBaN7sTpaHEeJaxP6/f6dJcFY9rJYtvdSERwAHX9FWpIKoa94AYtSGjW+BXy1gW/4DmC/4VKZRhHEWNbzRokw0FNXLUGaiZGcxvn6PeNjI+4KGJEeeaM/FAVisHVDnBGRWTU662i1HHwFXFU95uhesrwEyWju7uL+wX9YGnysHzPkZpF7NV/MF7Tm91qgqIjZSdeO5oY8OFaMY4B09sLtEACKq1Q4DNPIAxlNNH7KrvHlm9Fpm9/5AEVj5fdR9Af6Wh/5jbKDLje/bta9ZfZtiAC2TItIrHoyiB+2+wRPDuje8gKcoAbmusx+RgDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mtr92iM+aOjdjYVJ1mselK1Vo3oRvnAO37qXZOgQ4sc=;
 b=ArMWUIPrBych0Kxla0attxnfD7GXthERuJqF3WdGrlIcLoooL70hajZcpzxFzDixlyVrwD4w01ZJrdBirol9OtdP27eVMzRNoldRYEK8sNTTlPeAGT+9kN8eKObdBKI4g7RHtck9b6Ts6FX0/bXxqj15Bcb15VFX+dZMdJ9SvT3oAdEv04AQKFg3UoYrQxcg8xQ84CCZE5v8BNsIYz8gROUU+snAnKSI+OaBiSwjLctKt88m+ftO7zLSIQhXbeeLcIYid60u8WbK5kBJjA1CZrwx605e8i2mlqEbZnxrBCpzFFngnM4EXrMqDaTXiImJ5d670ksYKXYXFOkV08FbaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mtr92iM+aOjdjYVJ1mselK1Vo3oRvnAO37qXZOgQ4sc=;
 b=PuMmrMVKK5whySO5o1Wv0Tv/1K00mbbib+LGHfxHZsTvaprL9zTsDfB0Pm/7zW4uqIXBSuw0wLfE4YX7ZMJ7dbYIxOF0lHGwkOTaYTgfmKZo9rOD38ZHFsbWD/nLXZz4r2U8OCM/puTkwkGMV8YbnTIYVKFL3E8S9pI3fIlKplVzq0rVjWzbrmrSuI2s0MBJ+E+81joV47ByfioM114P0b1sodYVD1FQV/OFbWvJuda1je6X5w2zpu93Gsybj3tLQUU52gt6daj82CBOv1XjtLm4vSocWNfXlQXa4Y+6SG8p0leihmM0lx7x4a7eO6YyhXOwhbNRnZ+9+mx5WcBfPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB6877.eurprd04.prod.outlook.com (2603:10a6:803:131::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 14 Sep
 2026 18:21:46 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 18:21:46 +0000
Date: Mon, 14 Sep 2026 14:21:38 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 15/17] i3c: mipi-i3c-hci: Support configurable device
 NACK retries
Message-ID: <aqg7Mhw8EpAoO5Fx@lizhi-Precision-Tower-5810>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
 <20260914113003.183150-16-adrian.hunter@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914113003.183150-16-adrian.hunter@intel.com>
X-ClientProxiedBy: CYZPR17CA0005.namprd17.prod.outlook.com
 (2603:10b6:930:8c::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB6877:EE_
X-MS-Office365-Filtering-Correlation-Id: 101ff28e-c625-4ad0-be90-08df128d08b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|19092799006|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	f+yJpqHSELAAkj+EqvxFEiF9oXryeQfU7i01A7lVWGGZQzbI/g886q1jF8PMnUBR/TG5KQReoDmPJcM75sSSQg8heMb5ypUEZevPI2uY3y5r6AAGXkEdCmQ6ZDhEqEuLFJF1pMNIcGhLwCf1yn79FWZQiORxUqiFmmwIzH7m1kV88KCzXTRib3kpd01/dSMxPTvWtxYhigxpLiH061wlwlx+QM/tiVWCJXYqpi9EdsWVItP9MefvSIuJap01Ba06DrJFtXVwLEZFUUC/gPGI0VgL1I9tYxCZKeGYEoArkRjDwx6gpqcxYYDCmd3c+NHld/Ff7KjnpZtRoFtDmI1i2qFaX1naqyfODl6Wij/Rl2BpO6waU/KBwgYhjiGX5nP7PL+pwT4lItgJZnKgWp/7o/ZTAkBu5b314yAPfMuDHOGfZ+IXJbsB45BLD6TqWBJbX1f+P8C+lUUDLTY1TM87tvDrRmOCguONswJ919itDl8433TBQBAUXnLTJBoNl1R3ARwE2TsjBzUicQNW7Umc3gqNwO+YoGUvFTJ4DiLCW7pWltvRq2uz/xdLZ1KjyTBBiC6BAp9VRFEZNu17GU2zaeC9luuvdeiqOPYPidmnlts42IoKvL4fTxRDLvKBjXWlrrkiTlRSTINM0MlyaN98S/ph3YM49/71cT131RCIQc4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(19092799006)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8UsPgr9VoGkPfIwnJGrCJvk7C5saquEk3+LrMmBPWsfHX4WRq/2kaYuCY2D0?=
 =?us-ascii?Q?TqzodYGUG8Y6HivbRMRojubLxZs11YVooa9qfT3sqiexfOEkFNZcIT1ywzMz?=
 =?us-ascii?Q?V19QvoCtQpw1h++wfrYuIrc6Si9jHQrK8YG71/Z+0Q5oZ3rCgLXNWTj2uUkk?=
 =?us-ascii?Q?LFcmtsPTANp7yccyDvTW20MRKoZn5r5ZFLlJReK7KrAhmLA00cy3fxXYu/l/?=
 =?us-ascii?Q?60tdHEnM5JpPVOYZLsWpKgEoW8ni5Eqlft8aQ3jRQULqKjyvLOpdikm/2OFD?=
 =?us-ascii?Q?qYnfjPO38DLubVfojydoa9RHe3emZP8pyO0/6erq/84mo/M51sIfkctHuf1g?=
 =?us-ascii?Q?lQhm+37R6U65f0kk3Npsbftlov/o9QdxC7V50RKvXJeCI9xb1nNCns7vEv5n?=
 =?us-ascii?Q?dDdUeZdvVav2yF3qgxIWUCf3bo0JrYkxm9dL45jMKIBmd3OdsEc95GubHj0D?=
 =?us-ascii?Q?idWvmN443GrUnuSjlkks1c33UTweH2JgFgP4qSEcytd5OJS9ZMo4Qb76vmE4?=
 =?us-ascii?Q?kdtyXyvpTWR9SDxuUo5rcQtaxnsduR7weFz4NwM8qV0CszqMAraHAhath72n?=
 =?us-ascii?Q?/ZPqXM7G0lMQgXF6vOKSVHVN0DFIHdHdW+T6rFcUm1qBdBP2CQ6lPItBWGw3?=
 =?us-ascii?Q?tqW0n7aJBwAkU4lx8tJXJWdhFoimxq4nbnZF8km78ZyzMhdPk9AnHZidBqVu?=
 =?us-ascii?Q?3u2yeI5MBFThBjy4xxjVxD9QDCdSrjHXZinK8CP9VpVe7vyn/j1WmrR2L0Mf?=
 =?us-ascii?Q?D8Sn8TldKcsuGgLlAb2b5fHBHZQKf4AlBDyzTyHYw99qoPGpbWIj0mMX0top?=
 =?us-ascii?Q?/iJ8Y2g4FDXD7Md9PrKGQZC5cn4uBi6Z9neqaQA5eBvOj9SpBtHtojOtAXIL?=
 =?us-ascii?Q?BYR2dSTmHiP34+/VZT+nLRGi6V4r1wY25AthimMAjt37NVLeUjrfeX2iMkQ9?=
 =?us-ascii?Q?/F2UKeH3j8c35I8ACQZBBJ3AOqNeRKRUMbtxPvp1H6MsVvEGgn6hNVymvNgR?=
 =?us-ascii?Q?L7O8/WmyVcZwX2ObtdQV6vwqZKzelCokopVlbOHa2Hi7GG+CWK6gr+SjIb/4?=
 =?us-ascii?Q?F7RhVoBwMA+oC5Cw/w8DM3TQ7hc4nadJBUFTd8TmL2trHFqiQ7DJBhhGk0Ql?=
 =?us-ascii?Q?4ksNlEyVq1OxFQVR2lPCo9QMYIAFj5EmcIYCTLTLDFX3SIQw13faX0Y2Q02M?=
 =?us-ascii?Q?XFy+amtQn1rLzP4aVF0s0x3zvjWBI4NRbmLxjmjliS5VCp1ackzXUAE65mEq?=
 =?us-ascii?Q?cg8B8+HEbLOViZTZLq36QZ4L6SwyDcYdIhlW9ukYhJpn035cfy3U0VR1PviM?=
 =?us-ascii?Q?YtlYT6Ux7HGxq44n0y5kCffyhUpykxg2vP8ops9QD5Hn36ta4XV0INtZuv5a?=
 =?us-ascii?Q?lY4+bXlWAILsevXMNxjEVCQpUFiVD8ccQ/9Z6EWiK50A4++UClvNzyuBAq6E?=
 =?us-ascii?Q?vKoXq4UfVXdMBTCJsJP2kHHC2osUIFpHfvFI+5JHFIEoX3C9BkUycJuVwVZJ?=
 =?us-ascii?Q?6i95G6SyN1dc4DmiR5XsRR2QehfrT817/oYhHJHfh+rFhoi6A5awxjHhD0rG?=
 =?us-ascii?Q?nUxHiM9iePIfqdWY9B0/bkKVMb48tDKMqBo4YnLxUtThArwqCGFMAw0jZZqE?=
 =?us-ascii?Q?9q1k36u7teBdgP9bGzCEYG50l4Hczi77OEeqZ7z+1fbp1x5sXl06JdulGjJx?=
 =?us-ascii?Q?1cKCZSFDz2HuJa/xhq5NcxTTzlCr0ah6ZABLAPsi3jKBSlTapiQPTAdogYe6?=
 =?us-ascii?Q?sB6swp+6Yi40XFYIBfreEknX2sKp3e5wWEkcJHIf9FzoemVHPK+F?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 101ff28e-c625-4ad0-be90-08df128d08b3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 18:21:45.9949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WyvYj6MnBxXYDTw3UFvOC3qR7LoZgFNqvQiFXZMzgFvPZBWjUtjF6+6u7oVgeMRj1+zYwXpdrOxsUGYphoekj6/BzRb6dQwl5hCJ2tKArKH1KT2vWl9U7PHHtqKUDydn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6877

On Mon, Sep 14, 2026 at 02:30:01PM +0300, Adrian Hunter wrote:
> Implement the .set_dev_nack_retry() master operation using the
> DAT_0_DEV_NACK_RETRY_CNT field in Device Address Table entries.
>
> Since the retry count is programmed per DAT entry, update all allocated
> entries when the setting changes and initialize newly allocated entries
> with the current value so that a consistent retry policy is applied
> across all devices.
>
> Add DAT helper operations to update individual entries and all allocated
> entries.  Return -ERANGE if the requested retry count exceeds the
> hardware field width and -EOPNOTSUPP when the active command descriptor
> model does not use DAT entries.
>
> In addition, default the retry count to 1.  The I3C specification
> mandates a retry when a Target NACKs its Dynamic Address.  HCI v1.1
> explicitly preserves that behaviour for Direct CCCs even when
> DEV_NACK_RETRY_CNT is programmed to 0, but HCI v1.0 defines the field
> only as a device-specific retry count and does not provide the same
> exception.  As a result, a v1.0 controller left at the reset value of 0
> may perform no retry whereas a v1.1 controller will retry once.
> Promoting 0 to 1 at probe time makes the behaviour consistent across
> controller versions.  Userspace can still select 0 retries explicitly
> via dev_nack_retry_count.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c   | 25 ++++++++++++++++++++++++
>  drivers/i3c/master/mipi-i3c-hci/dat.h    |  2 ++
>  drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 25 ++++++++++++++++++++++++
>  3 files changed, 52 insertions(+)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 7a39be64c4e1..57d84d7682d7 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -555,6 +555,11 @@ static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
>  	return ret;
>  }
>
> +static void i3c_hci_dat_v1_set_curr_nack_retry(struct i3c_hci *hci, unsigned int dat_idx)
> +{
> +	mipi_i3c_hci_dat_v1.set_nack_retry(hci, dat_idx, hci->master.dev_nack_retry_count);
> +}
> +
>  static int i3c_hci_attach_i3c_dev(struct i3c_dev_desc *dev)
>  {
>  	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> @@ -573,6 +578,7 @@ static int i3c_hci_attach_i3c_dev(struct i3c_dev_desc *dev)
>  		}
>  		mipi_i3c_hci_dat_v1.set_dynamic_addr(hci, ret,
>  						     dev->info.dyn_addr ?: dev->info.static_addr);
> +		i3c_hci_dat_v1_set_curr_nack_retry(hci, ret);
>  		dev_data->dat_idx = ret;
>  	}
>  	i3c_dev_set_master_data(dev, dev_data);
> @@ -622,6 +628,7 @@ static int i3c_hci_attach_i2c_dev(struct i2c_dev_desc *dev)
>  	}
>  	mipi_i3c_hci_dat_v1.set_static_addr(hci, ret, dev->addr);
>  	mipi_i3c_hci_dat_v1.set_flags(hci, ret, DAT_0_I2C_DEVICE, 0);
> +	i3c_hci_dat_v1_set_curr_nack_retry(hci, ret);
>  	dev_data->dat_idx = ret;
>  	i2c_dev_set_master_data(dev, dev_data);
>  	return 0;
> @@ -733,6 +740,16 @@ static void i3c_hci_recycle_ibi_slot(struct i3c_dev_desc *dev,
>  	hci->io->recycle_ibi_slot(hci, dev, slot);
>  }
>
> +static int i3c_hci_set_dev_nack_retry(struct i3c_master_controller *m, unsigned int cnt)
> +{
> +	struct i3c_hci *hci = to_i3c_hci(m);
> +
> +	if (hci->cmd != &mipi_i3c_hci_cmd_v1)
> +		return -EOPNOTSUPP;
> +
> +	return mipi_i3c_hci_dat_v1.set_all_nack_retry(hci, cnt);
> +}
> +
>  static const struct i3c_master_controller_ops i3c_hci_ops = {
>  	.bus_init		= i3c_hci_bus_init,
>  	.bus_cleanup		= i3c_hci_bus_cleanup,
> @@ -752,6 +769,7 @@ static const struct i3c_master_controller_ops i3c_hci_ops = {
>  	.recycle_ibi_slot	= i3c_hci_recycle_ibi_slot,
>  	.enable_hotjoin		= i3c_hci_enable_hotjoin,
>  	.disable_hotjoin	= i3c_hci_disable_hotjoin,
> +	.set_dev_nack_retry	= i3c_hci_set_dev_nack_retry,
>  };
>
>  static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
> @@ -1186,6 +1204,13 @@ static int i3c_hci_probe(struct platform_device *pdev)
>  	if (device_can_wakeup(i3c_hci_sysdev(&pdev->dev)))
>  		hci->master.ibi_wakeup = true;
>
> +	/*
> +	 * HCI v1.1 onward does 1 retry for Direct CCCs anyway, so for v1.0 to
> +	 * be consistent, promote 0 to 1.
> +	 */
> +	if (!hci->master.dev_nack_retry_count)
> +		hci->master.dev_nack_retry_count = 1;
> +
>  	return i3c_master_register(&hci->master, &pdev->dev, &i3c_hci_ops, false);
>  }
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dat.h b/drivers/i3c/master/mipi-i3c-hci/dat.h
> index 6881f19da77f..a07086bf717a 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dat.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/dat.h
> @@ -25,6 +25,8 @@ struct hci_dat_ops {
>  	void (*clear_flags)(struct i3c_hci *hci, unsigned int dat_idx, u32 w0, u32 w1);
>  	int (*get_index)(struct i3c_hci *hci, u8 address);
>  	void (*restore)(struct i3c_hci *hci);
> +	void (*set_nack_retry)(struct i3c_hci *hci, unsigned int dat_idx, unsigned int cnt);
> +	int (*set_all_nack_retry)(struct i3c_hci *hci, unsigned int cnt);
>  };
>
>  extern const struct hci_dat_ops mipi_i3c_hci_dat_v1;
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> index 852966aa20d9..cb9aa43e69fb 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> @@ -189,6 +189,29 @@ static void hci_dat_v1_restore(struct i3c_hci *hci)
>  	}
>  }
>
> +static void hci_dat_v1_set_nack_retry(struct i3c_hci *hci, unsigned int dat_idx, unsigned int cnt)
> +{
> +	u32 dat_w0;
> +
> +	dat_w0 = dat_w0_read(dat_idx);
> +	dat_w0 &= ~DAT_0_DEV_NACK_RETRY_CNT;
> +	dat_w0 |= FIELD_PREP(DAT_0_DEV_NACK_RETRY_CNT, cnt);
> +	dat_w0_write(dat_idx, dat_w0);
> +}
> +
> +static int hci_dat_v1_set_all_nack_retry(struct i3c_hci *hci, unsigned int cnt)
> +{

do you have other implement for set_all_nack_retry()?

Frank
> +	unsigned int dat_idx;
> +
> +	if (cnt > FIELD_MAX(DAT_0_DEV_NACK_RETRY_CNT))
> +		return -ERANGE;
> +
> +	for_each_set_bit(dat_idx, hci->DAT_data, hci->DAT_entries)
> +		hci_dat_v1_set_nack_retry(hci, dat_idx, cnt);
> +
> +	return 0;
> +}
> +
>  const struct hci_dat_ops mipi_i3c_hci_dat_v1 = {
>  	.init			= hci_dat_v1_init,
>  	.alloc_entry		= hci_dat_v1_alloc_entry,
> @@ -199,4 +222,6 @@ const struct hci_dat_ops mipi_i3c_hci_dat_v1 = {
>  	.clear_flags		= hci_dat_v1_clear_flags,
>  	.get_index		= hci_dat_v1_get_index,
>  	.restore		= hci_dat_v1_restore,
> +	.set_nack_retry		= hci_dat_v1_set_nack_retry,
> +	.set_all_nack_retry	= hci_dat_v1_set_all_nack_retry,
>  };
> --
> 2.53.0
>
