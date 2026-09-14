Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012043.outbound.protection.outlook.com [52.101.66.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0699368D5A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789402785; cv=fail; b=i8DRxsrcDLiwlbRqRHKfKJrK1wqNmwBMpC16+jNTYLVhWVR+1ai39h/IhWZZr6lFpBWLlagPRgJh2V/DAiJUR+yWpsY6JnGD9N0vIlhWCPN80FieksWtb3hRrp4WHnwer/zjvKgKROKoWmvYWoe9knpHlMf4owhYqy2L1lk2ZGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789402785; c=relaxed/simple;
	bh=wxfTXAFIpcsO9w3et/9qSFsAChQshRiyLhAdb7O9mQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UwIXqyReKe/f9u27LowNF95AAz5La9oNL3HkQz7DcTKIxX5ODsjWHPM3nmqgw0gpuaxRXrQYQMlslBB9GHUwOEcxpT+9hhO/CcETBbz/9hVsCmOZ0rUUBX8vf5RH1rJxqK5qEixU/Gj6Gc50JO03rW31vBNjfyIMdYWuUZLM/RA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=k6Tqq7ej; arc=fail smtp.client-ip=52.101.66.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="k6Tqq7ej"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ByS+M6ArbgivNdUjygW3Ljai7ZzVSeGRya3EiRibnNL14X1GMMESALDS2hzYcmps0C93tdoe28qrgRusJLKTq0YIFjM0g9GgqHYMnIBTyacbWmP5VIiADmDfySEtlj7+ZuOQe41KjEFjBjvtqpiXJ3DbJyjvzTJJJjlVK+JzNIHtSwm0wAY3SZ/+plIrX5fBJGvpbx05LM4vf1x19+CbskRzosILIe6jb4yx/B0Qk5yx8Gxu6icM5HvxqvaVgKUnCK6hnExNZMMJkkm6O01xucV/cKGQL3m3Tv8VlU+ncbNAFZ2SFwPg0lkP5tu9DpjrmOilyve3LEIwQ9yI+m2moA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OU/wL1uKIQKsObinMfc8uMqCE4dsHrVRRpyMLusBawY=;
 b=CsLQ38mbJLwXGTtj3cL/dHsee37AuDO+cCOvmBuShhNA0dA+EeQSlWKqKIj0w7LvsMeCq5OfMAErL9NWAS+2CmSvCKUxG9pEv0nYECVrQQYpOmsTF7erLSCV2c5TFqtHWdHze645FVHhyMYgCI8+5dM09f6sGWfrMGMCj6yReS27vYs5+HQKCVyH1YMJsfPdB6NB5jcGAi8/a4FUNYTF3DI/HPFAe16hjDlhj9KBkA3XGaqcQbTRS9zWmmL5epQRRhnNgLrWx3jSw8KEJqV410rPADywuPIS663eB94X+DWaGs7YXQfrP5icKD27i8kCQahsJLWyZRJ+qGXy5Pta9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OU/wL1uKIQKsObinMfc8uMqCE4dsHrVRRpyMLusBawY=;
 b=k6Tqq7ejlRo7So4RXy5/j6aysA7UHCHI6tx+ctnTTRlSEH/2cp7h9ZaLVmbjzN3M/B02M+WUDiHmk3vf573gsnfENJf7/rKZFTEGHtElg+/DJPAIgAVosw7yu/fgxbm3p7vMeCaC4yjKxxxnb7vfXrWuMGcG5C2AKnl+jvLVxXByNTwtGCMwtuH/uaeGaGaGvoeD02rwsWDsT3HCG/Rd7M4NrIRY85tjybHykzlcYBgAXwoptzqxwyLd/SFR53wzi6fFma7QTgsbkixGAiCvBIxymPQnVllDb/2nypy9k34pkYHNztfQvO63JEPBcDPei7YKn05s6BVS0Pf5pdM8Vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by ZR6PR04MB967500.eurprd04.prod.outlook.com (2603:10a6:910:dc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:19:41 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:19:41 +0000
Date: Mon, 14 Sep 2026 12:19:34 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/17] i3c: master: Match ACPI targets to the correct bus
 controller instance
Message-ID: <aqgeltYvapPwOyso@lizhi-Precision-Tower-5810>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
 <20260914113003.183150-5-adrian.hunter@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914113003.183150-5-adrian.hunter@intel.com>
X-ClientProxiedBy: PH1PEPF000132E7.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|ZR6PR04MB967500:EE_
X-MS-Office365-Filtering-Correlation-Id: eb1a285a-bfe5-4b9b-83cd-08df127bfac8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|6133799003|3023799007|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YZE4xVtS0d57uzoYMc9dNdZeYQM8C7i8av13nBuA6/dZQLDrzt3+u8GTwrcghuVofm2WmHoPbulgFAfQkSNmdF63rZQ41xXvtvwHHUL4pxhZWdzvqiGlaVJpvVQg0zgh/J0zz0m2cAo+IRcJ+pa64rqYikXJowjQtQxlh8YWIN+lTOMyK0WoZ/YAW01A5P0TrBGIfCDwcygdDQBMMdeni+vzgeI+xOJbAHFoSWX1NpG8HS16vuRtI00AzamHZcfWphAh6Ort+1+V0gbQHy0oQEpyoxaHwtJxt70zuiQNxkDUP5PkNzR0Qog8zLLRc4ZffVzdkX/N87KBCETTFGcAau2HjxVOedbiaOcthdlUVNIAbKrGVjhDgoamAMg7tbysVbICHo/VY1rcWOAKVQA6bc52F22uO7YSITpOpHeaI8614OHNGx0q5t0zSIjKbp1Y0VyQInQONpgLxK50Ok+Zy7wRiVhv6yjxGGOCjQLCTpjRrGEKrG/+xtD0YE54BNuFYOCdy5Mr14rRfW9e6v0IFNuHoE1of+Cai84IlJpFmS0OS6qjIpiyALt6G1WGV/6x+ikcCr9ZdO5QOsjoTYSMbBPPw1t6Mbh19ufG/fGTtGNfhKSd0jpcKsKsH8hojUrO6IHDM1VWEhb/d6OsOKgNHYuv1QFZaWLrCRuXcDbaaZY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(6133799003)(3023799007)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mi3pEmBBuTqlYEBWT9CWbtaSGNuQQ5t5n4XXzcT3NyxAGXIdNs3GacyfLAeB?=
 =?us-ascii?Q?Uo+ZlYk7F0pVC6qv6EM87sK00QzTWpYhL/WLknVFRiCG5ldk63EDK8LdxJSo?=
 =?us-ascii?Q?34WbQbqtwYUsQc26gUl6b0iMEC0aYKimREjLlF2Qx2/H/zEB/0y/aPgy4rP/?=
 =?us-ascii?Q?cDeVS/oUCBHZKLjmAFQ+txvmkSMWBT1DGGb03LooHg4gXpB19PVsFnm0Ouy5?=
 =?us-ascii?Q?pTfCAXktTLXA3zQVBvGm34ujLNLv+ZkY3/mSF/9ovlQ5XKUGEAxnO/PnMrE4?=
 =?us-ascii?Q?9LhgSqMD04FEsestsby13ollgrhreptHsRpj3bJ2qnVATs4zyBYkfAOLnuiK?=
 =?us-ascii?Q?mG+mkpfRgCETXEWpwhcPgF2t10/Utl4dU14XQqeJ6qfcLF8kb1MDBxybVLiV?=
 =?us-ascii?Q?ZLmgwkvNT/yLoO52tJjwKzq3aj7sDolnenF0VY3GuR2E5I5EqepJFuq6yr2x?=
 =?us-ascii?Q?VJtl2RrQW3U7DSAvWHQfVln+vchp/wSV9D0MG79O9X9bW13PWSb4YG9mHHxQ?=
 =?us-ascii?Q?grwDn9ySoBEAd2iQhb9UMV+MKt2vqOkbA8nqzwMh4T23S57kjHQu3Z0W04Hb?=
 =?us-ascii?Q?za8L6az2hIBidb6LudaCiLikfObouDMxBz5q7N/JQq7J7Q8QnfHwKqKicfts?=
 =?us-ascii?Q?LLFNOl0TePqpSYoBkpjiZ+f2lKxj6KtIe0a5cFnZrnCHkQu8GIgECKA6dOQA?=
 =?us-ascii?Q?J5H1D3qc6npowMSnjfZNVFwqYZFTo/e29Uvkv08QQGlHG646OiQnhYZSTPu7?=
 =?us-ascii?Q?d3CWjLqwXb2hwvW6bWibE/q1AVJqPYGzcYjNyaA/aCAgN9NR1s/jsDDVyYh4?=
 =?us-ascii?Q?/lvdpIz7YDYXxIzxc+a0y+5BPei5JdnPuKAaoW7+zM3mUhLER4bU/GHYts7f?=
 =?us-ascii?Q?F/uoZ/Aiy4KZBR6+azqwJ3pPoJE6NHS+xnzz4P1BRm59wtamW9mkKzIgYCqo?=
 =?us-ascii?Q?/N4wn0rFOcA+hmTRLDoLbbDyQPzVUTk4patCmSliJZQHw2yzotrearIkK477?=
 =?us-ascii?Q?0V/jFPKdiy63MRjS7lTBZlXHNPR9kCjO2nHutBbjP+BPSD67ilGGllVSUyJP?=
 =?us-ascii?Q?ZN1iufTomVt9hmJiKcCN3hQ99hYxRaJVKRq9YVmuiwpV3x2wMluCBcXNM0yN?=
 =?us-ascii?Q?SJqwWiyrEGA1THrpbXPAmfCERUhal2kR1sw/uoMmVNbPgCQzt62pLlFlC30D?=
 =?us-ascii?Q?6BUNR+XfwdelZzOmLYkRc153UGdmTPqwAymp0cRl+9Eo5QHwgOvh0wPtblKC?=
 =?us-ascii?Q?+JZP2Axe9gHRuV34YdLK/zwgJcEemFXem6Oweh/s87bFpVaam0xlR092+jCe?=
 =?us-ascii?Q?iTHXb40uABWaD/WkSgIccs4UToj8wpCmUKJ4pi7DTT4jWlHZrxUptZSvSnCx?=
 =?us-ascii?Q?aMSnbF0t1ik4ys1YToIfWlS1hhx5IdwDytgQf7xl66pKMsW8nDIHkNwB/HD1?=
 =?us-ascii?Q?3a2Y+3nOhU6BDLPd+z8TSiJQBJwnrJGuvcOvLqGetri8eIWa5/oKziEhCTGV?=
 =?us-ascii?Q?cXw4lnOHscGKlkYCEXO0hTQ6ZzWm/wzUdjbKYxqSaQUTGcQYitR33y6wGwpP?=
 =?us-ascii?Q?uACRy3s7auCJIC78/cgq7zKFC8klHMhuLcSGRhCX9uESWLC45t4F3QTOm9sX?=
 =?us-ascii?Q?FTaE01YV2MLDFp2TctnD7rplZakZPL19fVkjsWftXxknSBuNGZA04P9rBydX?=
 =?us-ascii?Q?rYd0r7lhEbK9I2Db1NEgTEyoJQmSofgb/rXjAKtgl3ccVUmExVf1VfR/IBlH?=
 =?us-ascii?Q?7/7oz8owxYpA/p4rTWPBlkA3jLY17/AWRcH9Sg8QvRRG3Ltyxr0y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb1a285a-bfe5-4b9b-83cd-08df127bfac8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:19:40.9081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xFSU0D8SR3s97Jwy5V0wg/OF9xNgtlTpP8gqRZNjjCJZrwo6AktP0tvnS5iQs8Bfg+aX8r9cGpolO0UMm9GDYNM8J1gTVV5QkreH6Q2ytufNC80BIcFXbttuHsCAYrK1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB967500

On Mon, Sep 14, 2026 at 02:29:50PM +0300, Adrian Hunter wrote:
> For ACPI-enumerated I3C targets, _ADR encodes both the zero-based bus
> controller instance number in bits 51:48 and the Provisioned ID (PID)
> in bits 47:0, as defined by ACPI 6.6 Table 6.2 and MIPI DisCo for I3C
> v1.1 section 5.2.
>
> However, i3c_master_add_acpi_dev() treats the entire _ADR value as the
> PID. On multi-instance controllers this folds the instance number into
> the PID, causing i3c_master_add_i3c_boardinfo() to reject devices on
> instance 1 and above with -EINVAL.
>
> The problem is exposed by the MIPI I3C HCI PCI driver, which creates one
> MFD child device per bus controller instance. Since the child devices do
> not have their own ACPI companions, they all inherit the parent's ACPI
> node and therefore enumerate the same set of child devices. As a result,
> a target belonging to any instance other than 0 prevents registration of
> all controller instances.
>
> Add an instance number to struct i3c_master_controller, propagate it
> from the HCI PCI driver, extract the PID from bits 47:0 of _ADR, and
> ignore ACPI child nodes that belong to a different controller instance.
>
> ACPI-enumerated I2C devices are unaffected. Their controller instance is
> encoded in the Resource Source Index of the I2cSerialBusV2 descriptor
> rather than in _ADR and will require separate handling.
>
> Fixes: b46a4b3c5d1e ("i3c: master: Support ACPI enumeration of child devices")
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master.c                          | 19 +++++++++++++++++--
>  drivers/i3c/master/mipi-i3c-hci/core.c        |  4 +++-
>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    |  1 +
>  include/linux/i3c/master.h                    |  3 +++
>  include/linux/platform_data/mipi-i3c-hci.h    |  4 ++++
>  5 files changed, 28 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index f9a6c8560fab..215a22f2c7b6 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/i3c/i3c.h>
>  #include <linux/acpi.h>
>  #include <linux/atomic.h>
> +#include <linux/bitfield.h>
>  #include <linux/bitmap.h>
>  #include <linux/bug.h>
>  #include <linux/delay.h>
> @@ -3076,6 +3077,13 @@ static int i3c_master_add_of_dev(struct i3c_master_controller *master,
>  	return ret;
>  }
>
> +#define I3C_ACPI_ADR_PID GENMASK_U64(47, 0)
> +/*
> + * Zero-based instance number of the Bus Controller to which the Target is
> + * connected.
> + */
> +#define I3C_ACPI_ADR_INSTANCE GENMASK_U64(51, 48)
> +
>  #ifdef CONFIG_ACPI
>  static int i3c_master_add_acpi_dev(struct i3c_master_controller *master,
>  				   struct fwnode_handle *fwnode)
> @@ -3083,6 +3091,7 @@ static int i3c_master_add_acpi_dev(struct i3c_master_controller *master,
>  	struct acpi_device *adev = to_acpi_device_node(fwnode);
>  	acpi_bus_address adr;
>  	u32 reg[3] = { 0 };
> +	u64 pid;
>  	int ret;
>
>  	/*
> @@ -3100,9 +3109,15 @@ static int i3c_master_add_acpi_dev(struct i3c_master_controller *master,
>
>  	adr = acpi_device_adr(adev);
>
> +	/* Match the multi-bus instance number */
> +	if (FIELD_GET(I3C_ACPI_ADR_INSTANCE, adr) != master->instance)
> +		return 0;
> +
>  	/* For I3C devices, _ADR will have the 48 bit PID of the device  */
> -	reg[1] = upper_32_bits(adr);
> -	reg[2] = lower_32_bits(adr);
> +	pid = FIELD_GET(I3C_ACPI_ADR_PID, adr);
> +
> +	reg[1] = upper_32_bits(pid);
> +	reg[2] = lower_32_bits(pid);
>
>  	fwnode_property_read_u32(fwnode, "mipi-i3c-static-address", &reg[0]);
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index dadf049bd4b5..8b3a87d8a8bb 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -1142,8 +1142,10 @@ static int i3c_hci_probe(struct platform_device *pdev)
>  	 * necessarily in separate contiguous sub-ranges. To avoid overlapping
>  	 * mappings, provide base_regs from the parent mapping.
>  	 */
> -	if (pdata)
> +	if (pdata) {
>  		hci->base_regs = pdata->base_regs;
> +		hci->master.instance = pdata->instance;
> +	}
>
>  	if (!hci->base_regs) {
>  		hci->base_regs = devm_platform_ioremap_resource(pdev, 0);
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index af9595009b03..5b8e10d05cee 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -390,6 +390,7 @@ static void mipi_i3c_hci_pci_setup_cell(struct mipi_i3c_hci_pci *hci, int idx,
>  					struct mfd_cell *cell)
>  {
>  	data->pdata.base_regs = hci->base + hci->info->instance_offset[idx];
> +	data->pdata.instance = idx;
>
>  	data->res = DEFINE_RES_IRQ(0);
>
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index f7ceec2b4477..72065715feee 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -536,6 +536,8 @@ struct i3c_master_controller_ops {
>   *		 Bit 0: SETDASA
>   *		 Bit 1: SETAASA
>   *		 All other bits are reserved.
> + * @instance: Zero-based instance number of the Bus Controller as defined by the
> + *            DisCo specification I3C Target Address (_ADR) Encoding
>   * @wq: freezable workqueue which can be used by master
>   *	drivers if they need to postpone operations that need to take place
>   *	in a thread context. Typical examples are Hot Join processing which
> @@ -573,6 +575,7 @@ struct i3c_master_controller {
>  	} boardinfo;
>  	struct i3c_bus bus;
>  	u8 addr_method;
> +	u8 instance;
>  	struct workqueue_struct *wq;
>  	struct work_struct hj_work;
>  	struct work_struct reg_work;
> diff --git a/include/linux/platform_data/mipi-i3c-hci.h b/include/linux/platform_data/mipi-i3c-hci.h
> index ab7395f455f9..6f61d8a02378 100644
> --- a/include/linux/platform_data/mipi-i3c-hci.h
> +++ b/include/linux/platform_data/mipi-i3c-hci.h
> @@ -3,13 +3,17 @@
>  #define INCLUDE_PLATFORM_DATA_MIPI_I3C_HCI_H
>
>  #include <linux/compiler_types.h>
> +#include <linux/types.h>
>
>  /**
>   * struct mipi_i3c_hci_platform_data - Platform-dependent data for mipi_i3c_hci
>   * @base_regs: Register set base address (to support multi-bus instances)
> + * @instance: Zero-based instance number of the Bus Controller as defined by the
> + *            DisCo specification I3C Target Address (_ADR) Encoding
>   */
>  struct mipi_i3c_hci_platform_data {
>  	void __iomem *base_regs;
> +	u8 instance;
>  };
>
>  #endif
> --
> 2.53.0
>
