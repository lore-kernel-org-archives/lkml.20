Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013057.outbound.protection.outlook.com [52.101.72.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BED1490BE9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789405212; cv=fail; b=spWXge6EJSssAX4OtEefQQnqpLvUGWNXFVOeGw2NWSqzL8/gN88DZW6FThBC+6GX1/GvLINlok368mbjTAcKv5tjR3020eVwffNEuHKUw9VdQLyzjlGYhwvE7mCLDV9r1LsVBdkOVzLolj38+MLQuxlp0bsVqIwvGRVUIp2nyKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789405212; c=relaxed/simple;
	bh=MoEy2FB46UNMgviOQito9yVAnNbfKoh1GBz6/PFnuDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t0v459OePaUI2OWzIjf7rBlVfPxRriArgoKcdMhpUBCreycinucmeLEDm6ea0flrwD2L7e2JM1jwnEMqFUTJdo4evzA5DvivHGU68N2DvYaPBzZY8EL2NZLVsc/kcoUCdI9a7/ay5nEy708CbZGxErhAKY6SYbR+DM9RkEXaDq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=afB5LIG+; arc=fail smtp.client-ip=52.101.72.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="afB5LIG+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CPOURwSK5Rx+9cY/m8y3Kkpn+WErRju7mZ/17Ao+M/2Ijcb8gXl6p/YSXRpVMMwW/zQcPYt3VVDRDdMfKRRt+//k64kTeChIlxexN2F98B01Bw10fqN56pfJ3xpIS77t8VcXQScFxWHaf1XRGlGv3ItG4PnTgZLhx16CXIQWv+dBhEIMAOBwI5EBZcXhwgdzMgkmS1zmGhXJQDlWXArs6j9kx6dTToOEjLEYxsQ3X/oGEwxLEFwsCRXXbs3Hk4JJ1RuT5oG7WRMFofciUXcYajAH8d/zTzjBsZnkVQINF9UF1tug6MsPRQU/5WR70VFsJm23+GywdZ6HhBSgP966Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MiZZ84TlWP8aZlyGRLWZMhydMZzk61jpP61yy5VABCo=;
 b=D+1u5dPR+Uf36+6lM5UDbpiNCZd3HYmkDgG+TBxkKvkXom7J4ER1kdMnw1ELQPvkdckYdiMHsMFlMm/Ey/lB/slrA88iCb2P9JMiip3kos63Mxg2pGhIID+YFl2jcgi6Vje9iaO2kIF8a/ozmpv7ZwV8PFWQrAkCQv82lJgEobIUPOuRqNwUrLqyhUaHrBLy2wdM4HElM0dLYMUsdHEEswKoAmAy6CoVCUXQlqwoTC0ODJ/XZJzUTxgLOIO1JK0EhN9DRczWu5u1Pzew0gogsL75682V65SEsHz78EdIygh+SeV7Xf/Fs+d00k/SKQT+B/nG7kd3IzTWFVnHsfPgMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MiZZ84TlWP8aZlyGRLWZMhydMZzk61jpP61yy5VABCo=;
 b=afB5LIG+R7QjIJTYO38a7HS12B7DMTapVNB/0cDRSJ0XXvd7GHN1lJ8KF2WJ4GAkGOasoNb4EFLBrvLjcZQM/qaayZ2Y7+hFt1UpwqvtP68fkWgh7851X0W5wX7XykK3Uqtmai9evxePTkV/UueavACRDBLLkjE4wZDs/tFN+u7t/bNyI7OkZp477NnEnEu/13EW0bchYIgRQkfRLbJI3pOmZhiWXeCFkzbGedI6pSA9z3NT8Y8c1CcFn+eMCl+03SUMpIsukl+8S18SmjeozqRYJ05pmQg11n22yvwT2Hf/h+9VYhYW7rlTxKLljFz+yKOzQCVXbZBqgLEdlTMRtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA6PR04MB11950.eurprd04.prod.outlook.com (2603:10a6:102:516::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 17:00:08 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 17:00:08 +0000
Date: Mon, 14 Sep 2026 13:00:00 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 14/17] i3c: mipi-i3c-hci: Remove invalid HDR-BT and
 Fm/Fm+ definitions
Message-ID: <aqgoEBt365C4gJyv@lizhi-Precision-Tower-5810>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
 <20260914113003.183150-15-adrian.hunter@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914113003.183150-15-adrian.hunter@intel.com>
X-ClientProxiedBy: PH5P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA6PR04MB11950:EE_
X-MS-Office365-Filtering-Correlation-Id: 17e296b2-4562-4e23-ee2c-08df1281a154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|376014|6133799003|22082099003|18002099003|3023799007|4143699003|10067099003|11063799006|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	8cHD0LB+Q9IVFwfNUvxYyxPcZ2f8M4XG8BXvzmWRIZ+6h46sAZ1JL7IMSWUekJFEJLpe5ean58rf5PxpslT6k14q7woput5w1k6TfLK4JUgJAb0kHBaFfJ7B7IKdGi0EBYlfqDPOGJCMTAa6RwHNNDRY6Wz9QmbZsYgOfC2F1LjO4epHZ8GV+WjnRnxG7z0Ttg9LOpVZdJjJ6nPQsoiKMTmgRmHLkYaArpSASsEapZKzcXGFoVizUD70dT1lZ/1XXiCw9qKj7I3yGJEPeYJ8g5KA9fvuLRISpzJ3crvTAV558kT7EErz06Ksn9dnKitSg3e/Y4Tlsmf6flogHJZn576AIZpYLOp1wzXcrYBsY3RppdCmduyxtS0xq+wp/N7IQtyEEz+NYGmkzAcLDJzO7iEG+rS3Z0Gc4L6FcVd9fZ5vzVEiLDoGeI83n2oTmVtvxlYvCLMUwECn4YqRhyIxbem9qSAf7K1bQsXIWwEsEqxz+I5NEwTzDBzZdz3+ocXC9RgkC5i/RV7J2yMpzUYMW7w4jpA5nOUI3g3t4iwKSTEDtF5ZJ2boo1ziVCdwjzPpHS9IengSNSlQyv0uN7t9ciT0v+HcIqesHbHquIRCtUN1jZx19W5k84o7fjzzMPAWuYyQzhG1qf8ot31I/5vLjAUSML6JICmRPZ9SUCkL99w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(376014)(6133799003)(22082099003)(18002099003)(3023799007)(4143699003)(10067099003)(11063799006)(56012099006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yLTOOhidrHBa7cpP3KfP+TZOej4qwhMLD9dU5UmQDKUIzsi2R4StC1OpWWwr?=
 =?us-ascii?Q?HCIobBuKPIyFVPYshMn5n75Xk9a7lg8wSu5l4daEWGm8PueCmVz9mXRJE+EX?=
 =?us-ascii?Q?3dITHQxzZ/7Pw2z+cbFLnupOoqveFVzgbCwfGmCXXaD7ztiXknUHeSr4WWBW?=
 =?us-ascii?Q?OUB9g284EE1qQ5XJ7t9DlosbgO7kQM638h9F1h5SRMbJPe6DJoR5QJ/BtSjR?=
 =?us-ascii?Q?k5Xqu+JwZL4k00GdEX8ofFQC0mC2xk3VZcFLdZHHeR85WaZTgshelYthiwLK?=
 =?us-ascii?Q?nCsMNXJYRQdHX7RPqJPCkB6jtBNkLSYRQyGfKlCOKdO6q1euw6S5BHcARBMJ?=
 =?us-ascii?Q?5/w7a7A8tnXcrQiTGZoJtNisTiA4ddAsSLCwLP6T/yszf+2ainIN+CUZ1fux?=
 =?us-ascii?Q?DFanPSSDcroKUuq45JcFWOMn5cDUQNlrHkseA4QBS09/Hmtu+X5JQM5QktXl?=
 =?us-ascii?Q?CrwqRDOQ/FMltkyCYgeb2u9M66seq67iExNlJXN33Vm2JDgDgVxfNPgVzBb4?=
 =?us-ascii?Q?XTDHYlj89MplE79tFK/Dt0ymYitFwHp3kLx6UigS4SNr2beZ8B4K+dGs95rp?=
 =?us-ascii?Q?4P0Ru+oZBYnnYGpthJfOhbMTF++LZP9BBr2PJvt9v+UmtcUg0Es+smaWSt+v?=
 =?us-ascii?Q?1q/v7whGw4UEX62E0xw/J8TFprdkzj0Lb/gdFxaKmRFXW+y7D+ZgnDcpw5OC?=
 =?us-ascii?Q?BAgYgAkB+QQgSlv1vVSxgpQWjBkTg+18d0Ehv4r8adl5wChMS8awxGVw5usV?=
 =?us-ascii?Q?i66rk9d6Qhk0IFr28iRqB7VaDTEI6gw2KEYMMUqM/6vkxIPnwohFb4Wp6HHp?=
 =?us-ascii?Q?cXoJk26eiJ/UVv7OhLJw546hOTR8cUGjM/vvVEa7s15ShmCPvkX4DN4YFHS2?=
 =?us-ascii?Q?RHE/7+bl3Sbq4tTxz1SAztxAHpb66Gi2mXBlAOmgaRI8FjUeQ/tLJ5CEUCO2?=
 =?us-ascii?Q?mWpKtTeAQFnzutc/nfqux1n0KkpxSv7djBKbcKqRYrzKtR87LnnNtyAwqnTb?=
 =?us-ascii?Q?tWyvTB0WsmM/4IQYc8p5Mn4lBBoBLdg32rwA0cRfoF4eGm+yWXpm8hWTovdh?=
 =?us-ascii?Q?WEdyRgRVWCZLdQg5qHW29sQb5xs1AwopbHkGrie5549z06+yXoPg4kLkPoJ+?=
 =?us-ascii?Q?k7w/uYJ4UcEzFxz/vYJ/65j4PhWP6lQQJuAcHymKoOaaAYP65NZ5AFPAUb13?=
 =?us-ascii?Q?7MGFdbh04fIQF8yApGWyx9n5mP9fv9KEDSIQXErLoDSvzwTTak1YwBTaStix?=
 =?us-ascii?Q?u2sR0tFpxZ0sKGVPiBbKig6Gr6V15q/aMizNOlef2TwqoJ1Ad9UMkO12dUDX?=
 =?us-ascii?Q?hMmxTdZ99O7nP2E0wjW83wEzz7kwH0PCt13psWvkEGJNFS0uThnK1lFx4wPt?=
 =?us-ascii?Q?yFit2ZioEnVDkvRhVTuaDw3Rauldr6LBCvrvTfJG24HezaG30OWIMYrBQdnK?=
 =?us-ascii?Q?rM8jkOT+jjiQMRPvmB+9nuofAGABqLPXDP9atWlejabZUBjAq1eC8n0bKfZh?=
 =?us-ascii?Q?RYoDOmQPUwQJTSu0WE9+dardWYbGeftkXYa+DgpzG2hnlQT2AYnZySkNz1VC?=
 =?us-ascii?Q?iouXOst3HT/iW3oSNjN92KZb/5zJnrsleUJPU91ba1QjgSJQvo7D0QLfb47M?=
 =?us-ascii?Q?AUOn7+JQEB83Ir+gZjGjb21WSDZMlvx3TxKq/i2R7FM7+tifXMxF0K5jnlt0?=
 =?us-ascii?Q?fYX94358NoOpJRiTM2MsYbPPaBPpGpuAaWQ143HsALlQkojEBO+GgLMzNUJy?=
 =?us-ascii?Q?/L9oVqEH5OFLZt8K0qJHaVeFjHC9nUAhCAmHBYLeLkH/h2unlhU/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17e296b2-4562-4e23-ee2c-08df1281a154
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 17:00:07.9553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GUPeKyveEJ9Hx7t7GTm2GHAGUvmYbYGc9yGIPHxY/fuKj6u7KSo5/bnLOn6ZoOQII3zQ++hURUaaw8CJUoOkSZsZgAD1zukk5K8jqQ8Je94uwE7t9bfxved1t+WabjnR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11950

On Mon, Sep 14, 2026 at 02:30:00PM +0300, Adrian Hunter wrote:
> Several HCI definitions describe capabilities or modes that are not
> defined by any released version of the I3C HCI specification.
>
> HC_CAP_HDR_BT_EN uses a reserved HC_CAPABILITIES bit. Similarly,
> MODE_I3C_HDR_BT uses a MODE value reserved for I3C transfers, while
> MODE_I3C_Fm_FmP cannot be encoded in the 3-bit Command Descriptor MODE
> field.
>
> These definitions are currently unused, so there is no functional
> change.  Remove them to avoid implying support for non-existent HCI
> features and to prevent future misuse.
>
> Assisted-by: GitHub-Copilot:claude-opus-5
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/mipi-i3c-hci/cmd_v1.c | 2 --
>  drivers/i3c/master/mipi-i3c-hci/core.c   | 1 -
>  2 files changed, 3 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> index 3b9345718d27..9910df53c013 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> @@ -108,8 +108,6 @@ enum hci_cmd_mode {
>  	MODE_I3C_SDR4		= 0x4,
>  	MODE_I3C_HDR_TSx	= 0x5,
>  	MODE_I3C_HDR_DDR	= 0x6,
> -	MODE_I3C_HDR_BT		= 0x7,
> -	MODE_I3C_Fm_FmP		= 0x8,
>  	MODE_I2C_Fm		= 0x0,
>  	MODE_I2C_FmP		= 0x1,
>  	MODE_I2C_UD1		= 0x2,
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 4629a16debc9..7a39be64c4e1 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -55,7 +55,6 @@
>  #define HC_CAP_DIRECT_COMMANDS_EN	BIT(18)
>  #define HC_CAP_MULTI_LANE_EN		BIT(15)
>  #define HC_CAP_CMD_CCC_DEFBYTE		BIT(10)
> -#define HC_CAP_HDR_BT_EN		BIT(8)
>  #define HC_CAP_HDR_TS_EN		BIT(7)
>  #define HC_CAP_HDR_DDR_EN		BIT(6)
>  #define HC_CAP_NON_CURRENT_MASTER_CAP	BIT(5)	/* master handoff capable */
> --
> 2.53.0
>
