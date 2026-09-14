Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010052.outbound.protection.outlook.com [52.101.84.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F40B493D33
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789405133; cv=fail; b=GkAwqCV1nWtrOk7lckQcJyzWiEaES4juRSwgku7Wqq0USLo8xLKIxldWe4rAP8iUvKxwqk5pg2vKZj6fQ+t5Q7lpH8kmSwxPrhl/FmCYDJRVbH2Enx3+1Zn/q1cyJzOBWno1eJbc3i5RzYcchw6e4rOC2zmRObrXR4qzCZQ3hwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789405133; c=relaxed/simple;
	bh=OVpft5B0i65e9CoCuXv7NVzis1H4pgZa2pZWFZtrcJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZgmXV+wnFmYUCKQeLLugPw5nw7ysG1o877t+wMSE1wcNplKfy8krGZixeQSWbgzTBJ/50IkTpHXWDlZey0ioJoTEEJb45l/s6oW10oHW44An2Svj3LFo1hMuBdLYkhbKHwhi70eMeUY7fwxX+4DImCagWpK72V8ZnV5S3NB6xtw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wdlEXLjB; arc=fail smtp.client-ip=52.101.84.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wdlEXLjB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FkHQWFF0zx5MTM5Mozds9PDQLGMvtRF32nOTqi54NLtWl7FjA+ZH7VAxx0W7R/Akfohy9Wtm7vTHz/mts6Dj0d5FSf8sxrxqds8yny5MbLG3SplYVD9y8DbSp9FKCFOLfzi+AE9q+2lr81EHlu2cskIeqb0Gz96GRFf0IffzFwr1XYXE5P5L2jAyoNYRXfTSCqw/UKN2J0qX6m6zDZHNM7aqFG7Cf8FuaSQYHhHvsa52/8K6K5iyn6ZBNxoJbQzc72cJZ9ZOUvoVNy0HAn82rfHiELfAIMeQTmkLwjYrE1BKaQNRYltBqpXvvP6ZYkkx5Juin06mpnVB4YevfI+IQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYp60AjC1vFqxoqukrJvyGYcKpVbfYz/FTHRkXj11A4=;
 b=A9T6A/r/b8QQaihF+Jg6xOYgKCS+a6x/+ULHOgdhmMc2VxftuUX0Wkq3fW8fvtcR0j1abmSBBzLgixONuXGRyqAHN701UxUYX1/WbZDXptMDB3JqKI6XNfcUeJCkW+juys6jxH0xU6dogHQTiv8kmaUcDKk4qOoWZzegck46c+MEwjr0g/ALHkRLsXHG2UhDmzvvEBUJMy3Dfgb8rpECCeoB5S3a1BlV4Hzv4huf0fF7Havcc6I4aA4Jd8K+54rKyLnkW2l+S1WS7c4R7w8Oam87FUmWI9zd5rw2PJ7ZkjiKPjhStHr5zJ6npMZvl+uTIBw3/FvhoWuBWUQwNRo0Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYp60AjC1vFqxoqukrJvyGYcKpVbfYz/FTHRkXj11A4=;
 b=wdlEXLjB0QW3+XFHAtpB38qTuydh5CB8aOti0HOqujWdXkMq1syHAyjzHAwXNn4H++luGXBBxiF+80SVKj8DH9pYv+XyR3J5n1cud/DywW7I9vOF2du19JXCBL+YZjNjIhQPS+seGckgPgiseVNEs0wkdGhAF3TEDFvbo8aZP5rzv30IvuhUDbaY8Bh4FuElFObcxDN3C3PrMYMHYVz2B6awQdNQ1c42F4JeSyoSUZHESNuCPr5XmE7Ju67GlnYKk6O0JsX1T7TxpEmfRq11mwqXuaxOCPsIzUtfITi9AXbVSDjXSu9hIbBLLoCXPQwmwDERcuOW0Ro888/0Ni0Owg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV4PR04MB11876.eurprd04.prod.outlook.com (2603:10a6:150:2ee::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:58:48 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:58:48 +0000
Date: Mon, 14 Sep 2026 12:58:41 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/17] i3c: mipi-i3c-hci: Remove invalid transfer size
 limit
Message-ID: <aqgnwdqZ56mUdwr9@lizhi-Precision-Tower-5810>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
 <20260914113003.183150-14-adrian.hunter@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914113003.183150-14-adrian.hunter@intel.com>
X-ClientProxiedBy: CYZPR17CA0021.namprd17.prod.outlook.com
 (2603:10b6:930:8c::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV4PR04MB11876:EE_
X-MS-Office365-Filtering-Correlation-Id: 5903df75-703f-4c90-a755-08df128171ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|19092799006|6133799003|3023799007|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	z5CG0s6uc2FzDLVUz5lFkeXJ2/PPm4pNtpSZOpdeT5EAO8N+vy1TeUGLluYDSBqtYyyGNhDOh1R7CVMbNTuR6J64VFNqasXNCcy65kDwEBevBNhWdbYhk1UDQ5KiE9di40iXcPcZswSbNpyeu2aKFrxc29kW4sBOOU5cxFR4Q+cx/Etw7PkIK9FTjsMafCiP2xLX2Nt3yKSE9Zsk1jo45XH+wRHmNdaePefM4x/QBPOJvuv77Pd4XMMuTKVgWoLOtvmXOOeuCoMXjTdkLNdjU3a+A6f/+l8Km/sSEDgOLdDeD6LZGh1Livz/zy9BrdTfV7VegsZpFVhSjpxgEp/RfCtfoD5nFDdX2W05x3q0xbIQBiQjLg7IlNBy6SY9sAfkdXukkUA++MRQvuEplr61lDD6iKq19au2fAPDiDS/NOHDRqcwDn989rVIwhl2PdUzVWM6sNUmrIItAGdszdDTzU4JwbNqATYs1y+Hop1AKj011Qh2eWKjk8NyL0YynmIkBSP1BU/GM0sVV0tApsfawXv8Cwh2MjxeIvyNPldrOn0plHFoDm7Pv+QLPGj8CYATnOxu3Y/d7Tvt1M0Kx7kD3rYNKDGeLvvoS12P4UXaY3HZt6JX31VT/I9S/Ai55F0VeZaSxTO7R9IF2ciPv41uMlBprH/s4kEPoALweP2RtyM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(19092799006)(6133799003)(3023799007)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vCT/uHb6mEJX6i2TqMcgyG/qPqJ5MkEIBItFlyUC6dDFNQxndbr23KYIi9JN?=
 =?us-ascii?Q?ZeuG4X65WCPuEJ8fhqwHq6Q+L1/2M3bpBx+2bsniuhq5qsZa0ddWQKQtHh0U?=
 =?us-ascii?Q?cTSHxcWAsqkQMv2hWZCx7cq8/OiZp3gr0S7q+Ru0LzqJDm8CuLILaOGfrXJz?=
 =?us-ascii?Q?SYpKasKwi7otG5R4DgodaDPmXZgy1VWvIAjXgSGTptS00Y9KflG7b3YBIYFN?=
 =?us-ascii?Q?NRLIEamaycJwRVkLyUopHRmzDeAHknvVgujIfxYLMYQjrY6N4ScFof/+YuK/?=
 =?us-ascii?Q?fUYxiMCZvBp9dycmN7pLsymjuTB+EVvKdqm62Ti0dyaWdcJFz9naxnHAz6eG?=
 =?us-ascii?Q?qYdiYmT4k9WWlVh1n42L3471q9NjWIx0aqRw/YKGt/ZPPUYCH/MHi7xDvQTi?=
 =?us-ascii?Q?edvLpRR64gS1u42eD1fQVGqNSIBAMlwZM/i64DvJw8YQGoqrHDVUS8n/vLGQ?=
 =?us-ascii?Q?UQrG7hrsBrVXlv/+rzDIMOsxw0EpxzsdakEysFJ1xqK00YNyNFWOABhHLCcX?=
 =?us-ascii?Q?lB/VKY57Q2R7nHQg39Z1/JUwOe1vjbhV1NSvPMPvM8LCinsqoG51IXsLtVfv?=
 =?us-ascii?Q?AA67dxzCCy9FB4LQv8xqZU7uJzDhZAY1mooj+h6DnryMNgPQ+15opIM6rLzm?=
 =?us-ascii?Q?cGWYVUhq7fIGcpe4jh5xbtDqgusX3EfkoW2iXSbpVsbA1ovmY05A42oIfCCO?=
 =?us-ascii?Q?aNJQ1pkoCbRpELqUT6eDie8d9tm/ULmq1cJpwjXJfTwV2ASeD95Zla8rXOwH?=
 =?us-ascii?Q?4gjUgZ9oxlWc6MovbqA8AkMpP6ddKb49L+OIwf4m+BTXg/yYuLx+YSODo13f?=
 =?us-ascii?Q?Qk7HnlEzwA4R5gzY1o13KcakTqIpLlI1ZTS0eUVTLe0PSuPMqOh5pf3JoMoY?=
 =?us-ascii?Q?TYzSobCEYoi5ptO0s5WrpqT2DJP+O7yCBua+RYwpBkrLFYezg8YNu+4V39rp?=
 =?us-ascii?Q?FXdgCZZHfuWxi0DxwiXQMx1qEGeZ6mB0EBcmdNfrV05zW5P4UAY93bpFnyQy?=
 =?us-ascii?Q?D7ncYYIaJL+wgxlOfIQXeTG9AuMqfyN8A8G5pazkE7HAjrW1CsaalF1j7nic?=
 =?us-ascii?Q?VRwPVAix6nwYFVbso/5p2J5PZKpzSHN02jTxwLrX7wwJk+n95byLJ3dmxLIg?=
 =?us-ascii?Q?h0R3RnkaMLcbD/aqMLwU947J+6ciHGn5y4Db7E9nxcq9zHYKa4Uw9FFMDKxm?=
 =?us-ascii?Q?eWjfXUvQoFysJre0f9hpMAGC2rO8uKjaloiqTtHpddAR2DBxv849U+TaOzTd?=
 =?us-ascii?Q?Dn1ZYUqzWYi+H2x+TrjuyNbZEljWQML0HHDGez11kbqGBxzptsQH7znB9mXh?=
 =?us-ascii?Q?+ZC0THWqq5HI8WaoAXi+iXKcIxHDQOHaBUtdy28Z4cRR8s/TABtqQ598+yhj?=
 =?us-ascii?Q?Edsqt6MzWnOpEGrVm3DH8g8BsEkUE4NP+/9cPbQLfmt+yGKj9A7JU4AoTyZ7?=
 =?us-ascii?Q?dN1xTp3UuJY2vP2h0vquwATUE7XaEqrmaqrpIPrxzSslBMPue4XMiLXAvKkZ?=
 =?us-ascii?Q?4wd7fjkmlFMODDt4UwbnrlesWr7W8H1PxI/9uzW9mnzJf5ySD8ukWDdrgV4Y?=
 =?us-ascii?Q?LJT/JRFfkzTJFvVHtXOR335ckMLUevKl2useMPzM4v1kWRLA1clqBI76UhQW?=
 =?us-ascii?Q?LhyeTCNRXABB0QJPmSZSSUizFr7wYWpZWSZ69trZ1UNqx0A72Lnmia5428Fj?=
 =?us-ascii?Q?o68dWa9HiURoYZ2fwwsh1q3fkinKcNV4wV0zZIL63v5hNvTm4YzARERdYkGs?=
 =?us-ascii?Q?smz5VKtk03Kvc60lxKf2PyPN3qlhlpgdx1o2dOOtDR9fGZuSzlbY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5903df75-703f-4c90-a755-08df128171ca
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:58:48.1417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: miRz2iIFFB45FT6Ki3H51oRK2XBT+rR3HKlu9nrkW43Go0xLYvelTO4sE3hWRn3UtUdhnKKCHt/cPtClXb84GJlPZ39MUgBPG0Jp/9PBczB/IGqLzwhWAjwczxoBWXDQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11876

On Mon, Sep 14, 2026 at 02:29:59PM +0300, Adrian Hunter wrote:
> The driver derives a maximum transfer size from
> HC_CAP_MAX_DATA_LENGTH in HC_CAPABILITIES, but no published version of
> the I3C HCI specification defines such a field.
>
> HC_CAPABILITIES reserves Bits[31:8] in HCI v1.0 and Bits[27:22] in HCI
> v1.1 and v1.2, so the bits used by HC_CAP_MAX_DATA_LENGTH are reserved
> in all released HCI versions.  Neither the HCI nor the I3C TCRI
> specifications define a maximum data length capability.
>
> On compliant controllers reserved bits read as zero, making the
> computed limit 65536 bytes.  Since struct i3c_xfer.len is u16,
> transfers can never reach that size and the resulting -EFBIG check can
> never trigger.
>
> Remove the unused capability definition and the dead size check.
>
> The driver's effective limit remains unchanged. HCI specifications
> define DATA_LENGTH as a 16-bit field and require larger transfers to be
> split across multiple Transfer Descriptors.  The driver already relies
> on the core's 16-bit length types elsewhere when constructing
> descriptors.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/mipi-i3c-hci/core.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index b9b20797d045..4629a16debc9 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -51,7 +51,6 @@
>  #define HC_CAP_SG_DC_EN			BIT(30)
>  #define HC_CAP_SG_IBI_EN		BIT(29)
>  #define HC_CAP_SG_CR_EN			BIT(28)
> -#define HC_CAP_MAX_DATA_LENGTH		GENMASK(24, 22)
>  #define HC_CAP_CMD_SIZE			GENMASK(21, 20)
>  #define HC_CAP_DIRECT_COMMANDS_EN	BIT(18)
>  #define HC_CAP_MULTI_LANE_EN		BIT(15)
> @@ -473,7 +472,6 @@ static int i3c_hci_i3c_xfers(struct i3c_dev_desc *dev,
>  	struct i3c_hci *hci = to_i3c_hci(m);
>  	struct hci_xfer *xfer;
>  	DECLARE_COMPLETION_ONSTACK(done);
> -	unsigned int size_limit;
>  	int i, last, ret = 0;
>
>  	dev_dbg(&hci->master.dev, "nxfers = %d", nxfers);
> @@ -482,13 +480,8 @@ static int i3c_hci_i3c_xfers(struct i3c_dev_desc *dev,
>  	if (!xfer)
>  		return -ENOMEM;
>
> -	size_limit = 1U << (16 + FIELD_GET(HC_CAP_MAX_DATA_LENGTH, hci->caps));
> -
>  	for (i = 0; i < nxfers; i++) {
>  		xfer[i].data_len = i3c_xfers[i].len;
> -		ret = -EFBIG;
> -		if (xfer[i].data_len >= size_limit)
> -			goto out;
>  		xfer[i].rnw = i3c_xfers[i].rnw;
>  		if (i3c_xfers[i].rnw) {
>  			xfer[i].data = i3c_xfers[i].data.in;
> --
> 2.53.0
>
