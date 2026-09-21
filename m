Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013045.outbound.protection.outlook.com [52.101.83.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652E24D487A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015828; cv=fail; b=JsSzyFuWgYTCBFMc1PBrFEx7Q0ChIAr61a8Pr1JZn1uY8nyZmAzQhdK24ptB9N6alThtoqbwWiTrkLz7psW+nJiJKSF/SZbZtZLYpKJx5MFksh3/70AtXupK0pPtcpp5JsriAuNx4DZATm+YfRmXS/sG3O4Qcdmizcfq7JSd4sU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015828; c=relaxed/simple;
	bh=j7UYoEs6984Dv5kwVd2it/fRlHQvpOAo8dMjanu7m+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ra5dh4dOJlT8dETMRps5AHiXsOozCzHU/WmnFlXj8ZAQ3OI7dxylTQQtJyPlPtQuNi4CQ8WPD6Pi0zqRruWqW01iuaH4XUiDyDiBxm3cUrhUvCDt2v89azjIqstzhyBQy/RxuH8/RxCgrehei+CjmIDsu0WrN0C9hTX3wPJsfi0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=K7KuX2sE; arc=fail smtp.client-ip=52.101.83.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="K7KuX2sE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEmvyKGRvbKSPPvQ68g1GBFWh9VmWsPi3t8D5q79/vdS/JjtscE8c7bMgGSeVCVuPYaGCMfRK1wk4HiitcFWMA0QSYkBBTmg+I+k+TCbhiDGXwYv2FcveKWBULMx9T3NyUPrae1TpNiD/3wlbmVdQjopq11w88eeWhT8du1KWVD1ajgXrxvdR4svN/jUKPZS2pUbjyVIvSUYepLUHviAsfq+m8Zqr9Aumx3PtI4PWcQqX0kHY/GeeQPf8ylvt/R6Er2tcf7ppynvuIPMqAaJQAJhzSh3FjM2Iko+qAzsekfwjRfLh4d07NWTn5UTZ0bDtfZPIJI4SlpCU2h6m8tFlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ogoH5JaGRQpXX4hZYDWg4kUSMj7b1o0eQdpcJxVGYRQ=;
 b=SS0DhaKFw5G+khtgJ2I4K11eOhrWS3J+Qil03pahpk7J7XbTJjMZS1xypgceBBPMzOU5Ds1kSqmixp93CecQCw6m6fYxogS9yEcqI3iDCcQe/wsAgk2XwNIYYYL5UrCI1KOPxiA2MVH6LGtVOhISKCi0pXPAjnGG1amACS/Ln4JjO8wcrOhIaI4sTCzNQin9nQOKCCPaxiVkIBpTWOWXhMJ3Gb46nhBE0Pr5rFpi25NJGSQ+DVtX4t8jYf6uMl27GBhL/O/FgFSuryBdsauQxwySNwZ51bMrFXMptzkxfxqPqgxcA/LCZ5Vx2YrnwvvBnOJoNGbfv7KB8xMuHL3xDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogoH5JaGRQpXX4hZYDWg4kUSMj7b1o0eQdpcJxVGYRQ=;
 b=K7KuX2sEyK5Kvdgzkq7e5jzCqX8rFfuyeFbZVWu6Nb/sEU3d6ccTqAFM0rvGWbGgxMheTvF124nTKMuDHnX/mzejY+Q1ZSaAW6r6LL0OiQL1UMWlxPFZXRHOHPhN3BfUw1sGt+THa7qDYXHJ8gxKC76ZZj5hPIcwj+Lu8U5IkYGtQ4O0N0wq+Fu/sVkB+F4PrZV+29dtL9CsYL8g5/0zYex3iRnPIYi1Y2cb7upqX18QWVnGF/fgRtSx0/VQKClVnFi6xY6Oye3Iur7Shkj/gO9T9C/XuoWHvg9BPlkqGMwmYpvLm9iX+SvqhiqpluSNmk1ECYI52WMUU1PWHAwlOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10490.eurprd04.prod.outlook.com (2603:10a6:150:1e2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 18:37:00 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 18:37:00 +0000
Date: Mon, 21 Sep 2026 14:36:53 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 15/17] i3c: mipi-i3c-hci: Support configurable device
 NACK retries
Message-ID: <arF5RThLv0HXePYN@lizhi-Precision-Tower-5810>
References: <20260920151248.46936-1-adrian.hunter@intel.com>
 <20260920151248.46936-16-adrian.hunter@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920151248.46936-16-adrian.hunter@intel.com>
X-ClientProxiedBy: CY5PR17CA0051.namprd17.prod.outlook.com
 (2603:10b6:930:12::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10490:EE_
X-MS-Office365-Filtering-Correlation-Id: e0807da5-447e-40db-76ad-08df180f52cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|23010399003|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dITBOwT0I2jeBM1SP65N0f2O5qCtO6/cG5K2f+9J/+HFbrUwhQDOz4n6Tqh2HTS48LVpF4Ndny9OD5c7dpq5e0dEZRNFcYKq+7hZwuatYmOMPiIOyi/oVQlVOLNG9q3F2r/wKBECLTyAJpC6rZdysxzR3x60rptN+DGj/s+UBE7Lx32HxwvfHAwJVBJwycX0ZhDC/Tla+3/LmNbtx4XVuu6fbp5hm3tM46qaCHv+9HISmoJIEKdT4aT48xDAEvDgiktGl8eZymEgLK4QQm/Xv8JP7m10KiorIMkk7gamJES5LuquzQD1R6bdL3GEb+6kB/ZLzrNOovhkIYmF4d/i3azhyRH10jRxUh6kKocX8rQjEnfmRzPk0Mswz2HpwZchpIy1XmXWGDw5HI7JWNyeLuqcPy73gv7zEMK462+/0D1nsNr0WiXu9mwEpvv3bGKFJOM32YBuH3rBeL59dfPaCBYqRQ+G4Is8a4ktFZsyRo61nY8yY+3ixk1zJW4R9dB6AkskakwpZxaDXYZWlb4QZagvuimyaXFNCzGf6PoZX28Okx9LrwS1GCLQcCGeoVhbxTZ+Ts4UdzmnGjCp1p7uVcQVJNlTh3b8Rh9rbFXHuiXGbL/bLcHk8LVcahftFcTIeOABGLkNJu6LDjQzMq+/Lu6DRNlqD5FmIvHGD/LsM38=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(23010399003)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WE+scHXqoO5bvRxAbFE2HoeEvrz1TBfp2YxyYsO8xbsv253AA8zqgzi3IE4P?=
 =?us-ascii?Q?hg7co8TckUYaBUSqCpcCPiXleoEpj/t9cD6IwJ6xp9jnOW6Z5VsCqKPBSWt1?=
 =?us-ascii?Q?bHoABy4z42UUZsXehX40K4EA6WSdoDp5EQQ3Gb0OOWDJx3PY4KyVfCZv6VnC?=
 =?us-ascii?Q?UtOkmvTtiXwgw9AIwdm1KgJEYvZO7JGvaEganJHGkqbKHhQjCjK+NzeZeME8?=
 =?us-ascii?Q?q8UI3MrPMSFZd/IHb9HpnlFWxnPXLs+k/zRPI6D17GaUdppwkcrWqrLRXfno?=
 =?us-ascii?Q?b7HjWo08Hv23IITAT51wNp72K6wOHxVuzxeYziSUCfCuAB1vNT/KzlotJ7WF?=
 =?us-ascii?Q?OsY6L/NzGtkhy+1QYYnPkRFHSwUJt+Gmeyvxjpv10uGLWSMxkR5mG9j/Ym1d?=
 =?us-ascii?Q?WpUQKe7Z1GDoHRsKgyG+5nZq17TrnNFipq8nBlpVdVEJ6q3jr4sGUlSgO0tx?=
 =?us-ascii?Q?imuFUhByVhYPZXzIctTSTbt5UwhgViM4UDrkMEHUYVZRvNUVN2MNCHEDN6/l?=
 =?us-ascii?Q?TQWq9RTjfvi6+M9/NDjhOt9Rc7BTAs2VaDhmz7rE+YNNxKzkylNbxmDox5xO?=
 =?us-ascii?Q?adTmdddR5VkPu4apSZ36uBHQ2yV1sD7mo6l0W8zX4DAgc3eKtRk90cKK9osz?=
 =?us-ascii?Q?D5sGJNikoXxjheOWff+MT76i9aWU+ctOHbulcNRQqgOmL54ijPYs/USwHZjY?=
 =?us-ascii?Q?Rs64vV1LR8+TlDMqXOkGM6+/L4O2yRR176IbI51RMF05VLjQmja1MHSsrLY/?=
 =?us-ascii?Q?rKULSlcLmabpGrMW2DBjRp7E78XotBQ9R57dTa8xato75H44gsW5LyHyqwA4?=
 =?us-ascii?Q?UBZpXTQFMCF8XuLBV0jgoL8h7xYUoC1AdgrHHaDw1BD2lBsCJcheZsq/9cjN?=
 =?us-ascii?Q?YRMhNDvwz/FS68KxME2gCw1yZzMkQgyxgLMYOSSIrUgxTJv0Ek6z1jEQsM19?=
 =?us-ascii?Q?1a6ZR/X05td9WRiF3LAlYkRe3mxFBvT46RjdNigmOF39kt8EWIzLC7pGrc7W?=
 =?us-ascii?Q?OBU8wd5KqMvhjtw3UgU3Zkl25DFPa7RBb2o1/y3hQJUb3YabXGszPbjkUYpv?=
 =?us-ascii?Q?QBr7GEm5lpIpvML+QJVbNzogeVu6EKLk8QCABW6dvPtMUyG/WsvoRe5QE1hG?=
 =?us-ascii?Q?3n5FGgGurccS1yMT1bGTkY8C9oyeomjP0RpKfJcPRY99kVt6UtY3n+/Eynui?=
 =?us-ascii?Q?zBqaasH53Oa1rF+M7em8emzEP6M7Cs8kQdS+pWJFW+2XclI1Kz6I/I6D02Eu?=
 =?us-ascii?Q?kSm+twAJxJtLl7dfaRZTsVsJ9x7KKZPByRKLDCeJuGebBbrYASk2tRcZtNZS?=
 =?us-ascii?Q?9ExpuxzzK0v3HpHfS3PNlRfj+2zsVCZC5ZvlqGMJCJayPZmTij3m7l+za2op?=
 =?us-ascii?Q?f6CSvOfD/ql0ys/1bi3vZIlDjJFRbg2/xKEfR6s8f43Ai+g7kIwA5zEI5G6V?=
 =?us-ascii?Q?TdG41/+LKT3OxEdu/IZefTl8Y61J38VYsHsNAToM0DNk/x4jmQRtmj9ee6pM?=
 =?us-ascii?Q?G9NR8uzABtWVnSrsceF2X+tpyTljVzxEHzpDBqSWagDIHuIY3tlCPdnU1DSW?=
 =?us-ascii?Q?h1aRH0nxN1VTL6WCSYoLfAkdwTPzOatoPNNUxqhwo12sD4EOkg2hguK5Xjfk?=
 =?us-ascii?Q?Xbt2Eo+uDB3Kom+IE7p8OH2QJOW3n3zzim3qTmA5NZc1F1ZU5yQGPxHTBB1I?=
 =?us-ascii?Q?M5w13u18CVdxUX6KLN5Ej0ztGXQKblqpEFQdr2heA43rBvh0XayyAjrDLWKp?=
 =?us-ascii?Q?XPPj4p1EWa85KGPHbiToHZBAFdMpvf78N48uXB1LIdhAsG+WxjCt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0807da5-447e-40db-76ad-08df180f52cf
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 18:37:00.6126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Ah1TS5DKoLNmP5MhIzouJjWU272gHMk1OUoV0aUzCRjDBXE+heug4+vwxkyc+IuupUlT76lVABBiTXf7oTErqtYTQMaMMePufEnNgSvAs5TRfWkf2UOz90UMIQ4dio7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10490

On Sun, Sep 20, 2026 at 06:12:45PM +0300, Adrian Hunter wrote:
> Implement the .set_dev_nack_retry() master operation using the
> DAT_0_DEV_NACK_RETRY_CNT field in Device Address Table entries.
>
> Since the retry count is programmed per DAT entry, update all allocated
> entries when the setting changes. Also initialize newly allocated
> entries with the current retry count so that a consistent retry policy
> is applied across all devices.
>
> Add a DAT helper to update the retry count of an individual entry.
> Return -ERANGE if the requested retry count exceeds the hardware field
> width and -EOPNOTSUPP when the active command descriptor model does not
> use DAT entries.
>
> In addition, default the retry count to 1. The I3C specification
> mandates a retry when a Target NACKs its Dynamic Address. HCI v1.1
> explicitly preserves that behaviour for Direct CCCs even when
> DEV_NACK_RETRY_CNT is programmed to 0, but HCI v1.0 defines the field
> only as a device-specific retry count and does not provide the same
> exception. As a result, a v1.0 controller left at the reset value of 0
> may perform no retry whereas a v1.1 controller will retry once.
> Promoting 0 to 1 at probe time makes the behaviour consistent across
> controller versions. Userspace can still select 0 retries explicitly
> via dev_nack_retry_count.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V3:
>
> 	Moved the retry count range check and the loop over allocated
> 	DAT entries from the DAT layer into i3c_hci_set_dev_nack_retry(),
> 	and removed the set_all_nack_retry() DAT operation.
> 	Moved the DAT_0_DEV_NACK_RETRY_CNT definition to dat.h so that it
> 	is visible to the caller.
> 	Amended the commit message accordingly.
>
> Changes in V2:
>
> 	None
>
>
>  drivers/i3c/master/mipi-i3c-hci/core.c   | 32 ++++++++++++++++++++++++
>  drivers/i3c/master/mipi-i3c-hci/dat.h    |  2 ++
>  drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 13 +++++++++-
>  3 files changed, 46 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 7a39be64c4e1..d6a8a7612d46 100644
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
> @@ -733,6 +740,23 @@ static void i3c_hci_recycle_ibi_slot(struct i3c_dev_desc *dev,
>  	hci->io->recycle_ibi_slot(hci, dev, slot);
>  }
>
> +static int i3c_hci_set_dev_nack_retry(struct i3c_master_controller *m, unsigned int cnt)
> +{
> +	struct i3c_hci *hci = to_i3c_hci(m);
> +	unsigned int dat_idx;
> +
> +	if (hci->cmd != &mipi_i3c_hci_cmd_v1)
> +		return -EOPNOTSUPP;
> +
> +	if (cnt > FIELD_MAX(DAT_0_DEV_NACK_RETRY_CNT))
> +		return -ERANGE;
> +
> +	for_each_set_bit(dat_idx, hci->DAT_data, hci->DAT_entries)
> +		mipi_i3c_hci_dat_v1.set_nack_retry(hci, dat_idx, cnt);
> +
> +	return 0;
> +}
> +
>  static const struct i3c_master_controller_ops i3c_hci_ops = {
>  	.bus_init		= i3c_hci_bus_init,
>  	.bus_cleanup		= i3c_hci_bus_cleanup,
> @@ -752,6 +776,7 @@ static const struct i3c_master_controller_ops i3c_hci_ops = {
>  	.recycle_ibi_slot	= i3c_hci_recycle_ibi_slot,
>  	.enable_hotjoin		= i3c_hci_enable_hotjoin,
>  	.disable_hotjoin	= i3c_hci_disable_hotjoin,
> +	.set_dev_nack_retry	= i3c_hci_set_dev_nack_retry,
>  };
>
>  static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
> @@ -1186,6 +1211,13 @@ static int i3c_hci_probe(struct platform_device *pdev)
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
> index 6881f19da77f..31becc6f9aec 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dat.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/dat.h
> @@ -12,6 +12,7 @@
>
>  /* Global DAT flags */
>  #define DAT_0_I2C_DEVICE		W0_BIT_(31)
> +#define DAT_0_DEV_NACK_RETRY_CNT	W0_MASK(30, 29)
>  #define DAT_0_SIR_REJECT		W0_BIT_(13)
>  #define DAT_0_IBI_PAYLOAD		W0_BIT_(12)
>
> @@ -25,6 +26,7 @@ struct hci_dat_ops {
>  	void (*clear_flags)(struct i3c_hci *hci, unsigned int dat_idx, u32 w0, u32 w1);
>  	int (*get_index)(struct i3c_hci *hci, u8 address);
>  	void (*restore)(struct i3c_hci *hci);
> +	void (*set_nack_retry)(struct i3c_hci *hci, unsigned int dat_idx, unsigned int cnt);
>  };
>
>  extern const struct hci_dat_ops mipi_i3c_hci_dat_v1;
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> index 852966aa20d9..ec0764a27c62 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> @@ -24,7 +24,7 @@
>  #define DAT_1_AUTOCMD_VALUE		W1_MASK(47, 40)
>  #define DAT_1_AUTOCMD_MASK		W1_MASK(39, 32)
>  /*	DAT_0_I2C_DEVICE		W0_BIT_(31) */
> -#define DAT_0_DEV_NACK_RETRY_CNT	W0_MASK(30, 29)
> +/*	DAT_0_DEV_NACK_RETRY_CNT	W0_MASK(30, 29) */
>  #define DAT_0_RING_ID			W0_MASK(28, 26)
>  #define DAT_0_DYNADDR_PARITY		W0_BIT_(23)
>  #define DAT_0_DYNAMIC_ADDRESS		W0_MASK(22, 16)
> @@ -189,6 +189,16 @@ static void hci_dat_v1_restore(struct i3c_hci *hci)
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
>  const struct hci_dat_ops mipi_i3c_hci_dat_v1 = {
>  	.init			= hci_dat_v1_init,
>  	.alloc_entry		= hci_dat_v1_alloc_entry,
> @@ -199,4 +209,5 @@ const struct hci_dat_ops mipi_i3c_hci_dat_v1 = {
>  	.clear_flags		= hci_dat_v1_clear_flags,
>  	.get_index		= hci_dat_v1_get_index,
>  	.restore		= hci_dat_v1_restore,
> +	.set_nack_retry		= hci_dat_v1_set_nack_retry,
>  };
> --
> 2.53.0
>
