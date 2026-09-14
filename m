Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011065.outbound.protection.outlook.com [40.107.130.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965D7381E9D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789410757; cv=fail; b=qbeY51iDFM26T1nltUFp00zOUZ2Oi+r1ABYSMTMZ1Bhq1V80+9mz2cfah3REmzZwrp2zXw24H2mewfD4kGKQesPQrSmeZJcitXNaY6igWvJzJ9SiTi6FKH/AdAR2O5QhXuKXp5yZCcN5/kwSTr/3Jj4wXRHpsFTMHo/r4ulPMPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789410757; c=relaxed/simple;
	bh=RnhQO1/I3Pc4Tq9KuZu9/wMRoBzcdc7A/El5dRJpodk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Xm7PksIYkZf9zrH9vAiG/3ctm8CCv+yRu7imXE9zL4BokMegkjiYCl4j5gOZhVMgHb//2SxBoH+gfAig1NsS5N3NQhyMIdbGXkO5KdUHw55eF5rXJghh86/RWViTsgEvawN0CevkKAB9fh5L0nxRLGVzVQ7RpOTw2OZkOZe1hGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=G43ygnWq; arc=fail smtp.client-ip=40.107.130.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="G43ygnWq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=osc+uC+MNbWgsx84kTiTYYixAfq1t9q0NtE9VOKhkwTkLRS5+faB4fpgJwdoOkE6cf/hESwVXVs9o4qNMv50i2nG9h6+Nu+171gCNx8bs+r23hDB9oPo8k6E44ulELj9+dlx+Pae7KYTYvmqgDhKuZIJsaeRcS7FbNs4dCFkCZuSJe0EE6T9U9n+4ohn+OCDvzzqKRGrvD0TbuopWGV0emTHBieU+1IdNMQckSOmJUHmogQ5SIHxSRWRAjPXUGp2tu+/iuLp/YExsQCOJMV4czZL2tVFySUsLA7CWlmIJiNkzB4G75La6aYIm9yHq2whFW0P2Hm8Z6yMWfdkc10Fjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wHywiAy0dQQKmOAosc27htFz4rxlqe2iI7rKps+ZQk=;
 b=UorGBh8VPzAqNCwpNbu1vUXL2SokN6kt6vevvQwcobyoWogz1/JWuOHmSqrX3tZFaktk5jbTNevAPaf7OKEzXk2hkKR18QZ9dd9adINvFtErJdT9+czWSIGmYBI1jXJGAYe1oVmIkOuccxNbwOID0N4ndaiZ8czp9nRwSrHTx81O3IhNthkracG905rZQh74G1p7DA0ZPIDRJAyLMmBOpxHFnvGDXt3VKJMU6UytxFjUkDiJ9aAy8gpAOcbcF7B3OXvQ63u8jZU5eTqvqGvDOUyaWqDwTt7aDcyuOB0M3Zo/WXwUjF3hFaP9If76aU5GNxKbvSD+4YoOSg/LmpkDHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wHywiAy0dQQKmOAosc27htFz4rxlqe2iI7rKps+ZQk=;
 b=G43ygnWqc6BEPD4nQ/ls6U4ClIqHvKvCYDKIdbOgSdJsc2eF9+5f14fIRLGY1bCPMofsvYBhww9pz6go2cToROtxIO+gBzi1rvzDlu49Th4zIuVBK0y88bqdzlskkc3FumXEye1o8oURcEjPdoCvsR7rLYfxJuYq5JqWX8ntqF9mZ8lGP3gas7SKTNszQidzdvyP3J9mnBoQVhskzGRV6dC23RZ7clhQfIRyOiv6MbSQ4Q7lkvg4zdj/ZuVUghAnNvCb56iJvYshXeWeCPJLPy/0xXfazJppbfDv3tJeozkt1nKA8s49CQmxkfyeuZm99qHpBnPfhDEMyMLYktT/iQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8258.eurprd04.prod.outlook.com (2603:10a6:20b:3e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 18:32:27 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 18:32:27 +0000
Date: Mon, 14 Sep 2026 14:32:20 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 17/17] i3c: mipi-i3c-hci: Add HDR-DDR support
Message-ID: <aqg9tGJO7zzJ2ot3@lizhi-Precision-Tower-5810>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
 <20260914113003.183150-18-adrian.hunter@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914113003.183150-18-adrian.hunter@intel.com>
X-ClientProxiedBy: PH8P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: 28bef0c4-ef28-474f-147d-08df128e86c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|19092799006|10067099003|4143699003|18002099003|22082099003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	RdGvDqHoVwX13zunmFa5OR2LkykqQndpjOa3n3tOgRCF2hz2DJBbTefQqAHGhv6PJZfSycEVU12ehpxJtwL32xgSukx9cjwD8uVNtPKwVGoWtwM/lDxt7tVjg5GOdRlmg3UYOQ0+SYMgZ1H3CES7XGSOhakTJLuGD53yhvBYcgmv6xFk+pKLwVXbUUux7bzgGjRR9RKI9dQVQxRrh2eptcDVJIfhBx7dA1dxcgZpnEfxczUktfZSYPI1ospX0wqfBtzuiDH3gORE6aLYEb78vziTV8UlT+sh1xkw6czm51LzNIQdo4JF2UC4BzeGddkKUX0KGLMVePmt0ITvSfd/A5zY8xnv5ftL3p6lU2/mcVAWUAav8VS3tBomhwlNm6v75RNWIepbIeDzShsD0zpdHuf/basoeWaOgR5FRZY+RC19LWMZjfE6l4m+ZPUbfc+yd/V86jnpiVNmP/G7fj02mljtA6y5r2OMpdw/SnCGEP2dCQCS4LDad7+psTK+i4gUehoKYGEAMLyYE/T1yNxk68JwskeMvA/X9qMkQ4M7K7S9UcghP8uYYYNOx8/DguXd+KwhEp6rSx8HnIrkokAVNJyvuwes2jqTA5vCvGiGiY9MRQeoVpRFqhdlKgjPM7bLSDNmDTiIbCxSzjliGLX8JtmSzLLYjjwC1Kpg04uWFpY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(19092799006)(10067099003)(4143699003)(18002099003)(22082099003)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RYJ0v4wPs41gD1ZfPuJ4mj9FcpryG5KuBi4mAYLoY0lKl5Y9sFXUqFUElFOS?=
 =?us-ascii?Q?5IqcQ2svZqiO/VVqVaQeqU69dGuFh/YT1UaEr+zpKem33rOxV+obpyNeRSwe?=
 =?us-ascii?Q?+v7MXmyhBrWQ2MAtxLq6NpuTjZOkDyLPW4Ukl3eQrb1aEvP0PWlarFMTZmmE?=
 =?us-ascii?Q?UMoJNzAQ2g7WqrYBXJaTc6zH7ndhuT3cNJ4yyG6yXLMjTkFsSBrL3JDbgngU?=
 =?us-ascii?Q?Z/EmzCkEMzGc3Sy2JAK/36yxaW2fW7HhAFNWnLZUEiTvYKs20zVhtkOINKE6?=
 =?us-ascii?Q?UAMfk31Xg8hK29tGVVGFVnq+f406ypbeWWMd+yntCtWByWh9qhFIQU56290r?=
 =?us-ascii?Q?+Q7G3cFN+K8lPGg4P1NRySi5X1tM3xHCzs9XuLBMzCM/f72LQ1yRXhTzNFy7?=
 =?us-ascii?Q?P654DrmJByH73GCpAbvhNyo4XCK12PJfnASGPywkIgN/kg5nWizyHPI1FzAv?=
 =?us-ascii?Q?4EvRaXOAdM+1gPFdLjQESRWNubnF5s8amSPD4+ZcB/zWTTF1UFxfcGW1XgtI?=
 =?us-ascii?Q?cxAwvvB6NrjWEjJ/6V9MvHbW3wFTX1LFImwnPxGIs442Fqg1U7tz3ug5U8em?=
 =?us-ascii?Q?YtzypYAVIeibB3EDI6bQ0TTCNXv4D0bSFMnteeDcgspvsrNg4kH7TYpluy4W?=
 =?us-ascii?Q?4yc6e/AVvzaKeG4Zn1qhl/w+In5sdh8K5dSpgC9/f3X2QgWFj88Rmyjju5Rj?=
 =?us-ascii?Q?JpdyVzfx9Fy/EnipzIJ6wo3SO/b6reS6oBB/XR0CnaYkOBFH/gTUfD8JAWgb?=
 =?us-ascii?Q?ZQZxb4kqwJldwhopLgsnVuxVrrSIMGSLj05iRvomxzta+nVL9HyI3G2t4lz5?=
 =?us-ascii?Q?OktxjgWoZO4Yl4cTK/Uos5XwknGfw6yx9FM/2Aio3Barg+jAj/wOrLk9jQ2D?=
 =?us-ascii?Q?ir8LBON7lBusGdPADCv4ulgPwfPmKJgNYGhmKdDa+5ZeFeqHqRieyT/oddrJ?=
 =?us-ascii?Q?DwXjwY/m5QffMy+Ff+smNY8NQ2hFyo3PtoNwgXbxVbQgS8X+55eDOuKdKoXi?=
 =?us-ascii?Q?FmoH+vR+iHCLhWrOhhYC4/5mOfqZBUNQIY+YlHxhoJkUUdAzM7P9T5sMHDqZ?=
 =?us-ascii?Q?M8jx6fp1Bb7klSwaS1GtIKVsACUHXDsfu3EE5MKbPapljzl1uMG9aZek8GYf?=
 =?us-ascii?Q?UeprsSNopuwTnw919fZPblKv2DGq929cW0x69zhvOiroN+8G3+LTaxvqLPHZ?=
 =?us-ascii?Q?LrnhQ7Pt8BLzflLwC8AYKOwPlAaJxnYjgK/CeT47175pt4Up7y7cif2jQVrg?=
 =?us-ascii?Q?ZZ0AW3Mb+gsJon7wHl08M0LdU0VQZJNqrwfcjtd7R/PeUtJJQF5n7QwcYPhU?=
 =?us-ascii?Q?CNASjJOkSNADiXYaLxXMWg5dzbMI4zKK9nobKzsqDl14z40CgzQkh/sb6TB6?=
 =?us-ascii?Q?jEAT2tU7ooOjsku9TZXlGPT/gat7e3+8DxrmUSCpjTvbejlTcnRu+qQM3Dc7?=
 =?us-ascii?Q?Pg6YHgd/8GTtsLq7pRT2m3j+VxmKXa//wu/d0i1Bp7Q8iSxEOueaXcAa9Niq?=
 =?us-ascii?Q?kNvgADOr0ayDFZoJwgAvE/0/z0htDZweyhmIpQL9u5+mph+a1gVHptCqoZeH?=
 =?us-ascii?Q?L5WMZD1lMeRXUc/0xtTr2eML1/bLzEgJ6Oy1xtwL7iMBrifcIUOZbt0Db/l4?=
 =?us-ascii?Q?Nd/3WS9zfz7kl06sd0CNZzD32FEB2dbpxbqgKNOVnd5m57hFLAVrsH0j6rio?=
 =?us-ascii?Q?6dEuTZ68TZuq0EDfyzptR6EmVt4DEPnQTCwWihJvluPDYv5l6YZ3tOkkveFw?=
 =?us-ascii?Q?HvVLGHXJVvOflO+VtNzESPhf0h9CxlRJNnPGk0HNm/TSjxNQHLpk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28bef0c4-ef28-474f-147d-08df128e86c2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 18:32:27.0020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zvw7qHwVOYe+rBEjtNqAPHOgoUA16CkSw7Tp7XzQiUb4Tr45mmhez6GTuouYDjCs5qFcNw1VYu6MkD6Sq+d/RQUoZro7aZA3W2cW6nVIU+3ghOg2ukIxCy5DiwRnQQfM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8258

On Mon, Sep 14, 2026 at 02:30:03PM +0300, Adrian Hunter wrote:
> Add support for HDR-DDR private transfers.  Encode HDR-DDR Command
> Descriptors and advertise HDR-DDR capability when supported by the
> controller.
>
> Carry the HDR Command Code in the descriptor CP, CMD and RNW fields.
> Use the Immediate Data Transfer Command for writes of up to four bytes,
> as is already done for SDR, and the Regular Data Transfer Command
> otherwise.  The Immediate Data Transfer Command is write-only, which
> suits HDR because the eighth bit of the HDR Command Code is field RNW,
> so a write Command Code leaves that field zero as required.
>
> Reject transfers shorter than one Data Word or with an odd byte count,
> as HDR-DDR transfers are defined in whole Data Words and the I3C
> specification requires at least one Data Word to follow the Command
> Word.
>
> Only advertise HDR-DDR capability when the driver can generate the
> required descriptor format.
>
> Assisted-by: GitHub-Copilot:claude-opus-5
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/mipi-i3c-hci/cmd.h    |  2 +-
>  drivers/i3c/master/mipi-i3c-hci/cmd_v1.c | 26 +++++++++++---
>  drivers/i3c/master/mipi-i3c-hci/cmd_v2.c |  4 ++-
>  drivers/i3c/master/mipi-i3c-hci/core.c   | 45 +++++++++++++++++++++---
>  drivers/i3c/master/mipi-i3c-hci/hci.h    |  9 ++---
>  include/linux/i3c/device.h               |  4 +++
>  6 files changed, 76 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd.h b/drivers/i3c/master/mipi-i3c-hci/cmd.h
> index e0d4a6e0e319..fa3107df7c51 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/cmd.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/cmd.h
> @@ -55,7 +55,7 @@ struct hci_cmd_ops {
>  	int (*prep_ccc)(struct i3c_hci *hci, struct hci_xfer *xfer,
>  			u8 ccc_addr, u8 ccc_cmd, bool raw);
>  	void (*prep_i3c_xfer)(struct i3c_hci *hci, struct i3c_dev_desc *dev,
> -			      struct hci_xfer *xfer);
> +			      struct hci_xfer *xfer, enum i3c_xfer_mode mode);
>  	void (*prep_i2c_xfer)(struct i3c_hci *hci, struct i2c_dev_desc *dev,
>  			      struct hci_xfer *xfer);
>  	int (*perform_daa)(struct i3c_hci *hci);
> diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> index 9910df53c013..78ad2ec2bd93 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> @@ -215,14 +215,30 @@ static int hci_cmd_v1_prep_ccc(struct i3c_hci *hci,
>
>  static void hci_cmd_v1_prep_i3c_xfer(struct i3c_hci *hci,
>  				     struct i3c_dev_desc *dev,
> -				     struct hci_xfer *xfer)
> +				     struct hci_xfer *xfer,
> +				     enum i3c_xfer_mode xfer_mode)
>  {
>  	struct i3c_hci_dev_data *dev_data = i3c_dev_get_master_data(dev);
>  	unsigned int dat_idx = dev_data->dat_idx;
> -	enum hci_cmd_mode mode = get_i3c_mode(hci);
> +	enum hci_cmd_mode mode;
>  	u8 *data = xfer->data;
>  	unsigned int data_len = xfer->data_len;
>  	bool rnw = xfer->rnw;
> +	u32 cp_cmd = 0;
> +
> +	if (xfer_mode == I3C_SDR) {
> +		mode = get_i3c_mode(hci);
> +	} else {
> +		/*
> +		 * HDR-DDR is the only advertised HDR Mode, so a non-SDR
> +		 * transfer uses the HDR-DDR Command Code encoding: CP marks CMD
> +		 * as valid, CMD carries bits[6:0], and RNW carries bit[7]. CP
> +		 * and CMD occupy the same descriptor bits in both command
> +		 * formats.
> +		 */
> +		mode = MODE_I3C_HDR_DDR;
> +		cp_cmd = CMD_R0_CP | CMD_R0_CMD(xfer->hdr_cmd & I3C_HDR_CMD_CODE);
> +	}
>
>  	xfer->cmd_tid = hci_get_tid();
>
> @@ -233,7 +249,8 @@ static void hci_cmd_v1_prep_i3c_xfer(struct i3c_hci *hci,
>  			CMD_I0_TID(xfer->cmd_tid) |
>  			CMD_I0_DEV_INDEX(dat_idx) |
>  			CMD_I0_DTT(data_len) |
> -			CMD_I0_MODE(mode);
> +			CMD_I0_MODE(mode) |
> +			cp_cmd;
>  		fill_data_bytes(xfer, data, data_len);
>  	} else {
>  		/* we use a Regular Data Transfer Command */
> @@ -242,7 +259,8 @@ static void hci_cmd_v1_prep_i3c_xfer(struct i3c_hci *hci,
>  			CMD_R0_TID(xfer->cmd_tid) |
>  			CMD_R0_DEV_INDEX(dat_idx) |
>  			CMD_R0_MODE(mode) |
> -			(rnw ? CMD_R0_RNW : 0);
> +			(rnw ? CMD_R0_RNW : 0) |
> +			cp_cmd;
>  		xfer->cmd_desc[1] =
>  			CMD_R1_DATA_LENGTH(data_len);
>  	}
> diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
> index 8d93748e858d..b5e25f05f03e 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
> @@ -212,9 +212,11 @@ static int hci_cmd_v2_prep_ccc(struct i3c_hci *hci, struct hci_xfer *xfer,
>  	return 0;
>  }
>
> +/* For cmd_v2, only SDR capability is advertised */
>  static void hci_cmd_v2_prep_i3c_xfer(struct i3c_hci *hci,
>  				     struct i3c_dev_desc *dev,
> -				     struct hci_xfer *xfer)
> +				     struct hci_xfer *xfer,
> +				     enum i3c_xfer_mode xfer_mode)
>  {
>  	unsigned int mode = XFERMODE_IDX_I3C_SDR;
>  	unsigned int rate = get_i3c_rate_idx(hci);
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 57d84d7682d7..c72522f702bb 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -116,6 +116,13 @@ static inline struct i3c_hci *to_i3c_hci(struct i3c_master_controller *m)
>  	return container_of(m, struct i3c_hci, master);
>  }
>
> +/* HDR support has been added for cmd_v1 only */
> +static bool i3c_hci_hdr_ddr_capable(struct i3c_hci *hci)
> +{
> +	return hci->cmd == &mipi_i3c_hci_cmd_v1 &&
> +	       hci->caps & HC_CAP_HDR_DDR_EN;
> +}
> +
>  /**
>   * i3c_hci_sysdev() - Get the device to use for DMA and system PM
>   * @dev: Device the HCI controller is bound to
> @@ -158,6 +165,8 @@ static int i3c_hci_bus_init(struct i3c_master_controller *m)
>  	i3c_hci_set_master_dyn_addr(hci);
>  	memset(&info, 0, sizeof(info));
>  	info.dyn_addr = hci->dyn_addr;
> +	if (i3c_hci_hdr_ddr_capable(hci))
> +		info.hdr_cap = BIT(I3C_HDR_DDR);
>  	ret = i3c_master_set_info(m, &info);
>  	if (ret)
>  		return ret;
> @@ -463,6 +472,27 @@ static int i3c_hci_daa(struct i3c_master_controller *m)
>  	return ret;
>  }
>
> +static bool i3c_hci_rnw(struct i3c_xfer *i3c_xfer, enum i3c_xfer_mode mode)
> +{
> +	if (mode == I3C_SDR)
> +		return i3c_xfer->rnw;
> +
> +	return i3c_xfer->cmd & I3C_HDR_CMD_RNW;
> +}
> +
> +static int i3c_hci_check_hdr_ddr_xfers(struct i3c_xfer *i3c_xfers, int nxfers)
> +{
> +	/*
> +	 * HDR-DDR frames 16-bit Data Words, and at least one Data Word must
> +	 * follow the Command Word.
> +	 */
> +	for (int i = 0; i < nxfers; i++)
> +		if (i3c_xfers[i].len < 2 || i3c_xfers[i].len % 2)
> +			return -EINVAL;
> +
> +	return 0;
> +}
> +
>  static int i3c_hci_i3c_xfers(struct i3c_dev_desc *dev,
>  			     struct i3c_xfer *i3c_xfers, int nxfers,
>  			     enum i3c_xfer_mode mode)
> @@ -475,20 +505,27 @@ static int i3c_hci_i3c_xfers(struct i3c_dev_desc *dev,
>
>  	dev_dbg(&hci->master.dev, "nxfers = %d", nxfers);
>
> +	if (mode == I3C_HDR_DDR) {
> +		ret = i3c_hci_check_hdr_ddr_xfers(i3c_xfers, nxfers);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	xfer = hci_alloc_xfer(nxfers);
>  	if (!xfer)
>  		return -ENOMEM;
>
>  	for (i = 0; i < nxfers; i++) {
>  		xfer[i].data_len = i3c_xfers[i].len;
> -		xfer[i].rnw = i3c_xfers[i].rnw;
> -		if (i3c_xfers[i].rnw) {
> +		xfer[i].rnw = i3c_hci_rnw(i3c_xfers + i, mode);
> +		xfer[i].hdr_cmd = i3c_xfers[i].cmd;
> +		if (xfer[i].rnw) {
>  			xfer[i].data = i3c_xfers[i].data.in;
>  		} else {
>  			/* silence the const qualifier warning with a cast */
>  			xfer[i].data = (void *) i3c_xfers[i].data.out;
>  		}
> -		hci->cmd->prep_i3c_xfer(hci, dev, &xfer[i]);
> +		hci->cmd->prep_i3c_xfer(hci, dev, &xfer[i], mode);
>  		xfer[i].cmd_desc[0] |= CMD_0_ROC;
>  	}
>  	last = i - 1;
> @@ -500,7 +537,7 @@ static int i3c_hci_i3c_xfers(struct i3c_dev_desc *dev,
>  	if (ret)
>  		goto out;
>  	for (i = 0; i < nxfers; i++) {
> -		if (i3c_xfers[i].rnw)
> +		if (xfer[i].rnw)
>  			i3c_xfers[i].len = RESP_DATA_LENGTH(xfer[i].response);
>  		if (RESP_STATUS(xfer[i].response) != RESP_SUCCESS) {
>  			ret = -EIO;
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index ee73f6e6756a..4288a1b5b491 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -85,10 +85,10 @@ struct i3c_hci {
>
>  /*
>   * Structure to represent a master initiated transfer.
> - * The rnw, data and data_len fields must be initialized before calling any
> - * hci->cmd->*() method. The cmd method will initialize cmd_desc[] and
> - * possibly modify (clear) the data field. Then xfer->cmd_desc[0] can
> - * be augmented with CMD_0_ROC and/or CMD_0_TOC.
> + * The rnw, data and data_len (and hdr_cmd for HDR) fields must be initialized
> + * before calling any hci->cmd->*() method. The cmd method will initialize
> + * cmd_desc[] and possibly modify (clear) the data field. Then xfer->cmd_desc[0]
> + * can be augmented with CMD_0_ROC and/or CMD_0_TOC.
>   * The completion field needs to be initialized before queueing with
>   * hci->io->queue_xfer(), and requires CMD_0_ROC to be set.
>   */
> @@ -97,6 +97,7 @@ struct hci_xfer {
>  	u32 response;
>  	bool rnw;
>  	bool started;
> +	u8 hdr_cmd;
>  	void *data;
>  	unsigned int data_len;
>  	unsigned int cmd_tid;
> diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
> index 0f065b883ee0..e30ea2cb13cb 100644
> --- a/include/linux/i3c/device.h
> +++ b/include/linux/i3c/device.h
> @@ -79,6 +79,10 @@ struct i3c_xfer {
>  	enum i3c_error_code err;
>  };
>
> +/* For splitting 'cmd' from struct i3c_xfer */
> +#define I3C_HDR_CMD_RNW			BIT(7)
> +#define I3C_HDR_CMD_CODE		GENMASK(6, 0)
> +
>  /**
>   * enum i3c_dcr - I3C DCR values
>   * @I3C_DCR_GENERIC_DEVICE: generic I3C device
> --
> 2.53.0
>
