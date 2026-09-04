Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011020.outbound.protection.outlook.com [52.101.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E72E513573;
	Fri,  4 Sep 2026 20:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788552775; cv=fail; b=M5iuYnr+THg70oRJQc4Il6hpnrcDPR2AmGX9RkN9x9BEfqZSCBHXJwSU4jBOhU1jNvlkAOUAODGnA8xmZFifokVaZP251mqA/NpCn/ay+MmV0f4eRs2Vog0lIFjLyDPA3+tUP765lq7jbKH1UMbcv2uv1S/Q8vTAAwsflD4/TZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788552775; c=relaxed/simple;
	bh=Vi6z+oITy6MA7Xqz8cm5KL6+5tBJQ54wPtl9YNfkbmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MiHJisHycPDX7ulNuogZt0fEEimQ8psWPi6BLe0gFC0sL+7cQXPizobc0BMlJqtXMdnWDfSUkw69/LCOsV43e9VwhK+MnckMVBJFnPHcGPcqZgVdi6FzC94wMmM6nRAUGRCF7U6N1z9Q1Mbdc5gN4QQVJPOEknBrrJ8UzpkVRTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XKi1HxXm; arc=fail smtp.client-ip=52.101.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XKi1HxXm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YX1GAL5AJhVNVi56plbPmFL6sivQeBJebxiiamLdqzRYTebXvsz/Y9NxWneYEPLQ9GAGCUo4ItILunYiIDbESpWIs7g3Uk4Txln3Y5Rrpo4Nq0Mw/wHu3LLHIhE++UxISNN1Ph/tN7SnOcO8jcZ+5dt/iu/T5xVMZqPY4VaAcgK6xoaE5vQKhHu/7o9GYf9lcpCErqShA528p4M+KhvfoJzNkM/d2aut0u9n7p3Mu77kEDd7V4yoABLPhku4AGzWJmeMiXsO9QS7chh5I4cAshBgSwFKXqgTsop/msq/AVQmVLOMuoK1NKl4JjjiErIZM6Dl7GH82kKof1rRKMQxGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwHROdbFibiabKW/+WkzzYjoQN+MbvITDM2xBlUFVkM=;
 b=bKaOVEtuw7GiPVFgK/YxPKaPzNICDo5IIuZqsqEAcxceeLzhyQQRijC94usxldNynZW4APuCmZbSxk/CWQladEDUqyFUL2015BR//meRJ9teW0wNCGA3l8DC0fSNGV3859uP41OV5uYLSCaUX0KFvouKVwSm1Jf3v9hzvhCmDW2YTVUtH7U97Kei8gK9uNghGdOqSZJj3F54ExXF0b2R1QCJQfBevOkkqC4dQDRwa4QOXQPycWhm+Umnkl+poFpYkn+yfi/c3o0mTv+oS1bRcId3w2iGlPiJpg7T0nQoSlEaoA2m0Q+KNLEYH2dEWj3De/37YBexJX5NCUPtkOGJXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwHROdbFibiabKW/+WkzzYjoQN+MbvITDM2xBlUFVkM=;
 b=XKi1HxXmEZCWZD1kb96j40wE+7VMeDR9xwwuPfzLtXsgIiWz2NRCPLZMFUXE6JLZeFAZHCE1NHltCmTRjqJmuzjLwVsrEyEmDvoOoZ7I5RCZViIgHc6bunXwIXtjNWS0A36V5bLdHKuzwD8FoMtu8oI2c0h3xLHPMvS+y4/J3FAYfbjVqPx+pn3kaQfxnNyYBBKSCBVTMJH1wbiKXRs9oTOvU0cgvlfvRafUkucReiDmZck2oDQsxe1IGhxnfMMuYYLiNAO09ti39RaqblLB3IZuPff7Mu+8yB2NEKUV6gGYfVKAwVuKxAPn3XpSMv9fALF/Aiu1t5tNi6Qn2aT5qA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by AM9PR04MB7602.eurprd04.prod.outlook.com (2603:10a6:20b:2db::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 20:12:42 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 20:12:42 +0000
Date: Fri, 4 Sep 2026 16:12:32 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, Frank.Li@nxp.com, lgirdwood@gmail.com,
	vikash.bansal@nxp.com, priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com
Subject: Re: [PATCH v18 8/8] i3c: hub: p3h2x4x: Add SMBus slave mode support
Message-ID: <apsmMOIkBsBVCmgU@lizhi-Precision-Tower-5810>
References: <20260903062108.2712296-1-lakshay.piplani@nxp.com>
 <20260903062108.2712296-9-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903062108.2712296-9-lakshay.piplani@nxp.com>
X-ClientProxiedBy: CY5PR13CA0043.namprd13.prod.outlook.com
 (2603:10b6:930:11::33) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|AM9PR04MB7602:EE_
X-MS-Office365-Filtering-Correlation-Id: dfd689d4-7ac4-4b8e-f108-08df0ac0dfb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|376014|23010399003|1800799024|4143699003|11063799006|10067099003|56012099006|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mu2rIl2XkABTaS+pGsYw5z74lzVm5w/t4fYg8Ns6TmPws3gSpt6eG5LJ8COEojZ2csZFlo0uPHMppSa38YhVpOS2SGGjuiU8ulZgga5LcezdzclEUKrU/d9yW0f+ExUe40g/mICqcSB1py2gts5J/1LYN8pL3RnCErAM0dI0hB0WQrt+b9KDNmaZDVXSvj0J2NNL+snncai921FoEfEXMrJU9uvl6sVY/7bdr4on8hZJflr8+KijxaGCzO308NWvoXmL/qxwLgAzoZXD7shgE1z11/t4OynyWyAqOLwqKb0KHH3+VTBnkmLNizt9E1lf9ptj5ZTA2eBATRZJuDgRv71U9oTiHr4cX0unLNUGT23aA16hu03+Fd35hs3p7TmZRca+1CSG8JNKh2haSMViWh0qKz/yj1d64A8s/687WjGECIreDMo76PZ9ENkD8KRR/I+3ng9EnJisLiTC+shzp0A/7fmv/nUKPtOLrimtWQu85EoGSvkO0bcBAzno05y0VQH/HiCl9gsHZbPlIuBZYECgdZVtIu8fGnK2GXIDqZH1pbhWjL6ArKFdtVp38I8YPv13C9+pk7bMsZn06RC7fRMt6gVvv6EOeaWjZizl7bOSv12OweBCHt3Mm4JdMux7vD2Zn/SYa32yBb+wn9DN7k9HpEIi283L+8md/B7e/BM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(23010399003)(1800799024)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KY6bNoBbeQBZxeEZWiR00fOdJCc1FCbehIWM1NAxZpJXdyIMOF7iTPIMCVSH?=
 =?us-ascii?Q?WXpDMsB7PBkyLtaBwTQQKgNxRdswz0KwbUCdSEQF8ohGaSElL4+7uDJ8UgT7?=
 =?us-ascii?Q?N738RhNHlAYCdiA+YNfwyrK45gpqU0UhhnggYFQxM2eGcif7dBm4a7Bpxw0Y?=
 =?us-ascii?Q?+iUrFC28irtBCTUFF78KKeXBzHipqlSm0CC5L2Oy8TOQFWJQbKXFjecthx5Z?=
 =?us-ascii?Q?o4YDps66RUQcKR9694nTuPaETPqck+6Lc6+7AJn9DZWf/+koqtUabkoDtT0F?=
 =?us-ascii?Q?0mjei/uXExPCgZjGL2t3qD1SwlEK8PvBu9ixD3Bx5+QGBhm4zswwXElhKqxB?=
 =?us-ascii?Q?smOXxsAP5O6qKqcCdGMIjcj3F47K/mwjPMwr3xeqxl1ybQgEbVtnpQ15+E8W?=
 =?us-ascii?Q?MGJNZqy93geXrp+NRM3a3BDwYf/xe8Qp6aHe4GxO/VpNChb6QiYJnScLX7Sz?=
 =?us-ascii?Q?7KFQ7QLsmnGRFpUCpqZ1vvdBXrU6Gb0RWpbWgzZQBVFEEjFpTd7YIjEap14n?=
 =?us-ascii?Q?cf7B3MaxTRKyeBB1ZZUGF20+1QoqXkvC8K9Hz8tw57G8N74939TTrzP83JF9?=
 =?us-ascii?Q?D/AtxDSlwSzVkNOVyaf/X2aXmFFP/GtNJxsKKpl4MHM2nJw9MNBmh1Sr2/a+?=
 =?us-ascii?Q?v1ZNUZ653BGlf+qhPqGdWnZQuspePIgnFl98HW08mUlc3HZC7+uiMtyQVUiC?=
 =?us-ascii?Q?MBGJNodmAoCM52PFH2ZhGTu5yVNmwSdt40McbhxrjQcutYX0PTbCKDsbj3KM?=
 =?us-ascii?Q?hT/FXFbVcTk2XVRm6Oix5eu5ADKe6MyZ4YEf378lHsshKbOMoVLhDCl1UcGB?=
 =?us-ascii?Q?+ZQCFnbYT5usCaDGgbMmcWGxAYwWzOMMMJPpj1exdcHgelQ++nS/mOFa3vUd?=
 =?us-ascii?Q?lMjZgzA8iaZP/b0hvr1gEwFcHwH6YCgGxWaozIeWL0sJ9xPDJ6Md/Dmavkqy?=
 =?us-ascii?Q?74InGkkguSKLZ2JsGLQNAxrnN3V0m9V9fvGzxePkbQNzDgz17hDWKCz6cCOV?=
 =?us-ascii?Q?0SZ5KixTDanISldYT9x9LmFmlHLKchJ9Qo+Las0DR2dusZ3YUf+GOC83mRzS?=
 =?us-ascii?Q?8rqkYKG6OxKS9SxSe7HPpmyUA0SyuNj2WJ/71y+pa9b9fCi3+t1upJzXrO53?=
 =?us-ascii?Q?zczXzvdtvOfiV6UZTcppzMFS7491jqmcAraZRPBblesFlu/HokYydmTgzRC0?=
 =?us-ascii?Q?zqt9VH0paRP+1ywcnA7iWpOOXWUoTxgFDb+Kh/EYhxJX86hm4SIk2SKe14tw?=
 =?us-ascii?Q?n2NQrwiUWRAW+oSUtINepz94nnzG0hxaXphSo7SKp9g8ReDlIjGTe2gLWcwH?=
 =?us-ascii?Q?oHxGXCYUBcd34Ic4tdmgJFqDekqgzc5XYe1KYHLkU621AfKKhfaSbk4RGipB?=
 =?us-ascii?Q?Oi3/X6lznIHDudhIE1uB8dwFUNKDnYobNMGSZc+ceQP8naJm/z7WqO32/HLV?=
 =?us-ascii?Q?IVK4KJ+0ZFX6rTzAgRZ+XYbVxJZ6je0vyKM51ylXeEg503xo3siHwHhFg7j1?=
 =?us-ascii?Q?aJk1SQXR2zoXlTKYGJNba23o6kobeqzgB8nicT8TJ7foGxQaKVTRv8J1cId9?=
 =?us-ascii?Q?S2puFdkGapGGLTdjOsANfY3P3VTEj0U+SmQ/JdiTWv1dMKhDG8bGWaGdThqA?=
 =?us-ascii?Q?MgIvfLA9jiWpFjuMfqf3BCkfGLcS9/HjMrgyeXmdxUw653aPtUd+rQ8O2RR3?=
 =?us-ascii?Q?HyUCaRpfMDbPLS4RUiSAR/wKhebhWh9b6rlXdafPFVAnBsxebRC2iE2/9wZz?=
 =?us-ascii?Q?eiQXN1Xw5kY2lt3xsjQCph3bBRBiRA/w4h94xWbMUODvDWpe5O8y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd689d4-7ac4-4b8e-f108-08df0ac0dfb9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 20:12:42.7479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AldPvvb+Sl/KVgUB3Hh0mPZpej/eNICwdGEFpma0q4Uo74K3Vx7kEVT2gNmSb9wOfxJ91NDY7cDsoZC3QN04xbD/+vcUthU9k0r8OC4rw9G6DAHgHikNz8wKph21zJas
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7602

On Thu, Sep 03, 2026 at 11:51:08AM +0530, Lakshay Piplani wrote:
> Add SMBus slave mode support for the P3H2x4x hub SMBus target ports.
>
> The hub SMBus slave agent can receive downstream payloads into target
> buffers and report receive events through IBI. Add CONFIG_I2C_SLAVE
> to support the receive path and forward the received payloads to the
> registered I2C slave client through i2c_slave_event().
>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> ---
> Changes in v18:
>  - Rebased onto v7.3-rc1; no intended driver behaviour changes
>
> Changes in v17:
>  - No change
>
> Changes in v16:
>  - Always clear the software slave state on unregister: even if the hardware
>    IBI-disable write fails, log the error but still set bus->tp_smbus_client = NULL
>    and return 0, so a later IBI cannot deref a dangling client and call a freed slave_cb
>  - Use a heap DMA-safe buffer for the SMBus-agent RX path
>    instead of a stack buffer passed to regmap_bulk_read() over I3C
>  - Advertise I2C_FUNC_SLAVE when CONFIG_I2C_SLAVE is enabled, and reject slave
>    registration with -EOPNOTSUPP unless an I3C upstream device and working IBI
>    path are available (hub->i3cdev and hub->ibi_ready)
>  - Validate the IBI payload length and bound the target-port loop by
>    num_target_ports
>
> Changes in v15:
>  - Retrieve the hub context through the shared MFD data instead of replacing
>    the I3C device's parent driver data
>  - Rework SMBus slave registration and unregistration to use the shared
>    protected-register lock
>  - Report protected-register relock failures separately from the original
>    enable or disable operation
>
> Changes in v14:
>  - Clear receive-buffer flags even on SMBus receive error paths to avoid
>    repeated IBI storms
>  - Decode receive-buffer status using FIELD_GET()
>  - Fix overflow status value and explicitly clear overflow after reading both
>    target buffers
>
> Changes in v13:
>  - Make IBI setup optional and robust: avoid probe failure when IBI is unsupported and add proper
>    cleanup using devm actions
>  - Fix SMBus slave receive path: avoid over-clearing buffer status, handle unregistered ports,
>    and ensure correct event delivery
>  - Improve safety by adding proper locking around shared state
>
> Changes in v12:
>  - Add devm cleanup for IBI request/enable path
>  - Fix NULL pointer dereference before tp_smbus_client check
>  - Clear tp_smbus_client before disabling SMBus-agent IBI in unreg_slave()
>
> Changes in v11:
>  - Improve SMBus slave mode payload validation and parsing
>
> Changes in v10:
>  - Split SMBus slave mode support into a separate patch
> ---
> ---
>  drivers/i3c/hub/p3h2840_i3c_hub.h       |  19 ++
>  drivers/i3c/hub/p3h2840_i3c_hub_i3c.c   |  54 ++++-
>  drivers/i3c/hub/p3h2840_i3c_hub_smbus.c | 306 +++++++++++++++++++++++-
>  3 files changed, 377 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub.h b/drivers/i3c/hub/p3h2840_i3c_hub.h
> index 7a1345924e3f..0e59351e7b6d 100644
> --- a/drivers/i3c/hub/p3h2840_i3c_hub.h
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub.h
> @@ -123,6 +123,11 @@
>  #define BUF_RECEIVED_FLAG_MASK					GENMASK(3, 1)
>  #define BUF_RECEIVED_FLAG_TF_MASK				GENMASK(3, 0)
>
> +#define P3H2X4X_TARGET_BUF_0_RECEIVE_VAL			1
> +#define P3H2X4X_TARGET_BUF_1_RECEIVE_VAL			2
> +#define P3H2X4X_TARGET_BUF_0_1_RECEIVE_VAL			3
> +#define P3H2X4X_TARGET_BUF_OVRFL_VAL				7
> +
>  #define P3H2X4X_TARGET_AGENT_LOCAL_DEV				0x11
>  #define P3H2X4X_TARGET_BUFF_0_PAGE				0x12
>  #define P3H2X4X_TARGET_BUFF_1_PAGE				0x13
> @@ -315,6 +320,10 @@ struct p3h2x4x_i3c_hub_dev {
>  	struct i2c_client *i2c_client;
>  	struct hub_configuration hub_config;
>  	struct tp_bus tp_bus[P3H2X4X_TP_MAX_COUNT];
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	bool ibi_ready;
> +	u8 *slave_rx_buffer;
> +#endif
>  	struct i3c_hub *hub;
>  };
>
> @@ -340,4 +349,14 @@ int p3h2x4x_tp_smbus_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub);
>   */
>  int p3h2x4x_tp_i3c_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub);
>
> +/**
> + * p3h2x4x_ibi_handler - IBI handler.
> + * @i3cdev: i3c device.
> + * @payload: two byte IBI payload data.
> + */
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +void p3h2x4x_ibi_handler(struct i3c_device *i3cdev,
> +			 const struct i3c_ibi_payload *payload);
> +#endif
> +
>  #endif /* P3H2840_I3C_HUB_H */
> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c b/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
> index 3c5db7db48aa..b069467afcc6 100644
> --- a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
> @@ -10,6 +10,14 @@
>
>  #include "p3h2840_i3c_hub.h"
>
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static const struct i3c_ibi_setup p3h2x4x_ibireq = {
> +	.handler = p3h2x4x_ibi_handler,
> +	.max_payload_len = P3H2X4X_MAX_PAYLOAD_LEN,
> +	.num_slots = P3H2X4X_NUM_SLOTS,
> +};
> +#endif
> +
>  static inline struct tp_bus *
>  p3h2x4x_bus_from_controller(struct i3c_master_controller *controller)
>  {
> @@ -63,6 +71,16 @@ static void p3h2x4x_unregister_i3c_master(void *data)
>  	i3c_master_unregister(controller);
>  }
>
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static void p3h2x4x_free_ibi(void *data)
> +{
> +	struct i3c_device *i3cdev = data;
> +
> +	i3c_device_disable_ibi(i3cdev);
> +	i3c_device_free_ibi(i3cdev);
> +}
> +#endif
> +
>  /**
>   * p3h2x4x_tp_i3c_algo - Register I3C virtual masters for I3C target ports.
>   * @p3h2x4x_hub: p3h2x4x device structure.
> @@ -122,5 +140,39 @@ int p3h2x4x_tp_i3c_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_hub)
>  		p3h2x4x_hub->tp_bus[tp].is_registered = true;
>  		p3h2x4x_hub->hub_config.tp_config[tp].always_enable = true;
>  	}
> -	return regmap_write(p3h2x4x_hub->regmap, P3H2X4X_TP_NET_CON_CONF, ntwk_mask);
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	p3h2x4x_hub->slave_rx_buffer = devm_kzalloc(p3h2x4x_hub->dev,
> +						    P3H2X4X_SMBUS_TARGET_PAYLOAD_SIZE,
> +						    GFP_KERNEL);
> +	if (!p3h2x4x_hub->slave_rx_buffer)
> +		return -ENOMEM;
> +
> +	ret = i3c_device_request_ibi(p3h2x4x_hub->i3cdev, &p3h2x4x_ibireq);
> +	if (ret) {
> +		dev_warn(p3h2x4x_hub->dev,
> +			 "IBI not available, SMBus slave mode disabled\n");
> +		p3h2x4x_hub->ibi_ready = false;
> +	} else {
> +		ret = i3c_device_enable_ibi(p3h2x4x_hub->i3cdev);
> +		if (ret) {
> +			i3c_device_free_ibi(p3h2x4x_hub->i3cdev);
> +			dev_warn(p3h2x4x_hub->dev,
> +				 "Failed to enable IBI, SMBus slave mode disabled\n");
> +			p3h2x4x_hub->ibi_ready = false;
> +		} else {
> +			p3h2x4x_hub->ibi_ready = true;
> +
> +			ret = devm_add_action_or_reset(p3h2x4x_hub->dev,
> +						       p3h2x4x_free_ibi,
> +						       p3h2x4x_hub->i3cdev);
> +			if (ret) {
> +				p3h2x4x_hub->ibi_ready = false;
> +				return ret;
> +			}
> +		}
> +	}
> +#endif
> +	ret = regmap_write(p3h2x4x_hub->regmap, P3H2X4X_TP_NET_CON_CONF, ntwk_mask);
> +
> +	return ret;
>  }
> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
> index a3324cc36595..7fdfa79dfeb6 100644
> --- a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
> @@ -3,6 +3,8 @@
>   * Copyright 2025-2026 NXP
>   * This P3H2X4X driver file contain functions for SMBus/I2C virtual Bus creation and read/write.
>   */
> +#include <linux/bitfield.h>
> +#include <linux/i3c/device.h>
>  #include <linux/mfd/p3h2840.h>
>  #include <linux/regmap.h>
>
> @@ -15,6 +17,178 @@ enum p3h2x4x_smbus_desc_idx {
>  	P3H2X4X_DESC_READ_LEN,
>  };
>
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static void p3h2x4x_read_smbus_agent_rx_buf(struct i3c_device *i3cdev, enum p3h2x4x_rcv_buf rfbuf,
> +					    enum p3h2x4x_tp tp)
> +{
> +	struct p3h2x4x *p3h2x4x = i3cdev_get_drvdata(i3cdev);
> +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub;
> +	u8 target_buffer_page, flag_clear, temp = 0, i, addr;
> +	u32 packet_len, slave_address;
> +	struct i2c_client *client;
> +	u8 *slave_rx_buffer;
> +	int ret;
> +
> +	if (!p3h2x4x || !p3h2x4x->i3c_hub_priv)
> +		return;
> +
> +	p3h2x4x_i3c_hub = p3h2x4x->i3c_hub_priv;
> +	slave_rx_buffer = p3h2x4x_i3c_hub->slave_rx_buffer;
> +
> +	switch (rfbuf) {
> +	case RCV_BUF_0:
> +		target_buffer_page = P3H2X4X_TARGET_BUFF_0_PAGE;
> +		flag_clear = P3H2X4X_TARGET_BUF_0_RECEIVE;
> +		break;
> +	case RCV_BUF_1:
> +		target_buffer_page = P3H2X4X_TARGET_BUFF_1_PAGE;
> +		flag_clear = P3H2X4X_TARGET_BUF_1_RECEIVE;
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	target_buffer_page += P3H2X4X_NO_PAGE_PER_TP * tp;
> +
> +	ret = regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_PAGE_PTR, target_buffer_page);
> +	if (ret)
> +		goto ibi_err;
> +
> +	/* read buffer length */
> +	ret = regmap_read(p3h2x4x_i3c_hub->regmap, P3H2X4X_TARGET_BUFF_LENGTH, &packet_len);
> +	if (ret)
> +		goto ibi_err;
> +
> +	if (packet_len)
> +		packet_len = packet_len - 1;
> +
> +	if (packet_len > P3H2X4X_SMBUS_TARGET_PAYLOAD_SIZE) {
> +		dev_err(&i3cdev->dev, "Received message too big for p3h2x4x buffer\n");
> +		goto ibi_err;
> +	}
> +
> +	/* read slave  address */
> +	ret = regmap_read(p3h2x4x_i3c_hub->regmap, P3H2X4X_TARGET_BUFF_ADDRESS, &slave_address);
> +	if (ret)
> +		goto ibi_err;
> +
> +	/* read data */
> +	if (packet_len) {
> +		ret = regmap_bulk_read(p3h2x4x_i3c_hub->regmap, P3H2X4X_TARGET_BUFF_DATA,
> +				       slave_rx_buffer, packet_len);
> +		if (ret)
> +			goto ibi_err;
> +	}
> +
> +	client = p3h2x4x_i3c_hub->tp_bus[tp].tp_smbus_client;
> +	if (!client)
> +		goto ibi_err;
> +
> +	/* notify slave driver about received data */
> +	if ((client->addr & 0x7f) == (slave_address >> 1)) {
> +		addr = slave_address >> 1;
> +		i2c_slave_event(client,
> +				I2C_SLAVE_WRITE_REQUESTED, &addr);
> +		for (i = 0; i < packet_len; i++) {
> +			temp = slave_rx_buffer[i];
> +			i2c_slave_event(client,
> +					I2C_SLAVE_WRITE_RECEIVED, &temp);
> +		}
> +		i2c_slave_event(client, I2C_SLAVE_STOP, &temp);
> +	}
> +
> +ibi_err:
> +	regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_PAGE_PTR, 0x00);
> +
> +	regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_TP0_SMBUS_AGNT_STS + tp, flag_clear);
> +}
> +
> +/**
> + * p3h2x4x_ibi_handler - IBI handler.
> + * @i3cdev: i3c device.
> + * @payload: two byte IBI payload data.
> + *
> + */
> +void p3h2x4x_ibi_handler(struct i3c_device *i3cdev,
> +			 const struct i3c_ibi_payload *payload)
> +{
> +	struct p3h2x4x *p3h2x4x = i3cdev_get_drvdata(i3cdev);
> +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub;
> +	u8 payload_byte_one, payload_byte_two;
> +	u32 target_port_status;
> +	const u8 *data;
> +	int ret, i;
> +
> +	if (!payload || payload->len < P3H2X4X_MAX_PAYLOAD_LEN)
> +		return;
> +
> +	data = payload->data;
> +	payload_byte_one = data[0];
> +
> +	if (!(payload_byte_one & P3H2X4X_SMBUS_AGENT_EVENT_FLAG_STATUS))
> +		return;
> +
> +	p3h2x4x_i3c_hub = p3h2x4x ? p3h2x4x->i3c_hub_priv : NULL;
> +
> +	if (!p3h2x4x_i3c_hub || !p3h2x4x_i3c_hub->regmap)
> +		return;
> +
> +	payload_byte_two = data[1];
> +	guard(mutex)(&p3h2x4x_i3c_hub->etx_mutex);
> +
> +	for (i = 0; i < p3h2x4x->num_target_ports; ++i) {
> +		if (!((payload_byte_two >> i) & 0x01))
> +			continue;
> +
> +		if (!p3h2x4x_i3c_hub->tp_bus[i].is_registered) {
> +			dev_dbg(&i3cdev->dev, "IBI for unregistered SMBus port %u\n", i);
> +			regmap_write(p3h2x4x_i3c_hub->regmap,
> +				     P3H2X4X_TP0_SMBUS_AGNT_STS + i,
> +				     BUF_RECEIVED_FLAG_TF_MASK);
> +			continue;
> +		}
> +
> +		ret = regmap_read(p3h2x4x_i3c_hub->regmap, P3H2X4X_TP0_SMBUS_AGNT_STS + i,
> +				  &target_port_status);
> +		if (ret) {
> +			dev_err(&i3cdev->dev, "target port read status failed %d\n", ret);
> +			continue;
> +		}
> +
> +		if (target_port_status & P3H2X4X_TARGET_BUF_CA_TF)
> +			regmap_write(p3h2x4x_i3c_hub->regmap,
> +				     P3H2X4X_TP0_SMBUS_AGNT_STS + i,
> +				     P3H2X4X_TARGET_BUF_CA_TF);
> +
> +		/* process data receive buffer */
> +		switch (FIELD_GET(BUF_RECEIVED_FLAG_MASK, target_port_status)) {
> +		case P3H2X4X_TARGET_BUF_0_RECEIVE_VAL:
> +			p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_0, i);
> +			break;
> +		case P3H2X4X_TARGET_BUF_1_RECEIVE_VAL:
> +			p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_1, i);
> +			break;
> +		case P3H2X4X_TARGET_BUF_0_1_RECEIVE_VAL:
> +			p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_0, i);
> +			p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_1, i);
> +			break;
> +		case P3H2X4X_TARGET_BUF_OVRFL_VAL:
> +			p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_0, i);
> +			p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_1, i);
> +			regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_TP0_SMBUS_AGNT_STS + i,
> +				     P3H2X4X_TARGET_BUF_OVRFL);
> +			dev_err(&i3cdev->dev, "Overflow, reading buffer zero and one\n");
> +			break;
> +		default:
> +			regmap_write(p3h2x4x_i3c_hub->regmap,
> +				     P3H2X4X_TP0_SMBUS_AGNT_STS + i,
> +				     target_port_status & BUF_RECEIVED_FLAG_MASK);
> +			break;
> +		}
> +	}
> +}
> +#endif
> +
>  static int p3h2x4x_read_smbus_transaction_status(struct p3h2x4x_i3c_hub_dev *hub,
>  						 u8 target_port_status,
>  						 u8 data_length)
> @@ -215,8 +389,134 @@ static s32 p3h2x4x_tp_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, i
>
>  static u32 p3h2x4x_tp_smbus_funcs(struct i2c_adapter *adapter)
>  {
> -	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_BLOCK_DATA;
> +	u32 funcs = I2C_FUNC_I2C | I2C_FUNC_SMBUS_BLOCK_DATA;
> +
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	struct tp_bus *bus = i2c_get_adapdata(adapter);
> +	struct p3h2x4x_i3c_hub_dev *hub = bus->p3h2x4x_i3c_hub;
> +
> +	/*
> +	 * Only advertise slave support when the upstream IBI path is usable.
> +	 * Otherwise reg_slave() returns -EOPNOTSUPP while functionality()
> +	 * reports I2C_FUNC_SLAVE, which is inconsistent for callers.
> +	 */
> +	if (hub->ibi_ready)
> +		funcs |= I2C_FUNC_SLAVE;
> +#endif
> +
> +	return funcs;
> +}
> +
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static int p3h2x4x_tp_i2c_reg_slave(struct i2c_client *slave)
> +{
> +	struct tp_bus *bus = i2c_get_adapdata(slave->adapter);
> +	struct p3h2x4x_i3c_hub_dev *hub = bus->p3h2x4x_i3c_hub;
> +	struct p3h2x4x *p3h2x4x = dev_get_drvdata(hub->dev->parent);
> +	int relock_ret = 0;
> +	int ret = 0;
> +
> +	guard(mutex)(&hub->etx_mutex);
> +
> +	if (!hub->i3cdev || !hub->ibi_ready)
> +		return -EOPNOTSUPP;
> +
> +	if (bus->tp_smbus_client)
> +		return -EBUSY;
> +
> +	scoped_guard(mutex, &p3h2x4x->protected_reg_lock) {
> +		/* Unlock access to protected registers */
> +		ret = regmap_write(hub->regmap, P3H2X4X_DEV_REG_PROTECTION_CODE,
> +				   P3H2X4X_REGISTERS_UNLOCK_CODE);
> +		if (ret)
> +			break;
> +
> +		ret = regmap_set_bits(hub->regmap,
> +				      P3H2X4X_TP_SMBUS_AGNT_IBI_CONFIG,
> +				      bus->tp_mask);
> +
> +		/* Lock access to protected registers */
> +		relock_ret = regmap_write(hub->regmap,
> +					  P3H2X4X_DEV_REG_PROTECTION_CODE,
> +					  P3H2X4X_REGISTERS_LOCK_CODE);
> +	}
> +
> +	/*
> +	 * A relock failure does not undo the IBI enable, so report it
> +	 * separately and keep the callback result tied to the IBI operation.
> +	 */
> +	if (relock_ret)
> +		dev_err(hub->dev,
> +			"failed to restore protected register lock: %d\n",
> +			relock_ret);
> +
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Publish the software state only after the hardware IBI has been
> +	 * enabled successfully.
> +	 */
> +	bus->tp_smbus_client = slave;
> +	hub->hub_config.tp_config[bus->tp_port].ibi_en = true;
> +
> +	return 0;
> +}
> +
> +static int p3h2x4x_tp_i2c_unreg_slave(struct i2c_client *slave)
> +{
> +	struct tp_bus *bus = i2c_get_adapdata(slave->adapter);
> +	struct p3h2x4x_i3c_hub_dev *hub = bus->p3h2x4x_i3c_hub;
> +	struct p3h2x4x *p3h2x4x = dev_get_drvdata(hub->dev->parent);
> +	int relock_ret = 0;
> +	int ret = 0;
> +
> +	guard(mutex)(&hub->etx_mutex);
> +
> +	if (bus->tp_smbus_client != slave)
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &p3h2x4x->protected_reg_lock) {
> +		/* Unlock access to protected registers */
> +		ret = regmap_write(hub->regmap, P3H2X4X_DEV_REG_PROTECTION_CODE,
> +				   P3H2X4X_REGISTERS_UNLOCK_CODE);
> +		if (ret)
> +			break;
> +
> +		ret = regmap_clear_bits(hub->regmap,
> +					P3H2X4X_TP_SMBUS_AGNT_IBI_CONFIG,
> +					bus->tp_mask);
> +
> +		/* Lock access to protected registers */
> +		relock_ret = regmap_write(hub->regmap,
> +					  P3H2X4X_DEV_REG_PROTECTION_CODE,
> +					  P3H2X4X_REGISTERS_LOCK_CODE);
> +	}
> +
> +	if (relock_ret)
> +		dev_err(hub->dev,
> +			"failed to restore protected register lock: %d\n",
> +			relock_ret);
> +
> +	if (ret)
> +		dev_err(hub->dev,
> +			"failed to disable SMBus agent IBI on port %u: %d\n",
> +			bus->tp_port, ret);
> +
> +	/*
> +	 * Slave backend removal cannot be rolled back. Detach the
> +	 * callback-visible state even if disabling the hardware IBI failed,
> +	 * and return 0 so the core completes teardown; the failure is still
> +	 * visible in the log above. etx_mutex serializes this with the IBI
> +	 * handler, so later events are acknowledged without invoking the
> +	 * removed client.
> +	 */
> +	bus->tp_smbus_client = NULL;
> +	hub->hub_config.tp_config[bus->tp_port].ibi_en = false;
> +
> +	return 0;
>  }
> +#endif
>
>  static const struct i2c_adapter_quirks p3h2x4x_tp_i2c_quirks = {
>  	.max_read_len  = P3H2X4X_SMBUS_PAYLOAD_SIZE,
> @@ -228,6 +528,10 @@ static const struct i2c_adapter_quirks p3h2x4x_tp_i2c_quirks = {
>   */
>  static struct i2c_algorithm p3h2x4x_tp_i2c_algorithm = {
>  	.master_xfer    = p3h2x4x_tp_i2c_xfer,
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	.reg_slave = p3h2x4x_tp_i2c_reg_slave,
> +	.unreg_slave = p3h2x4x_tp_i2c_unreg_slave,
> +#endif
>  	.functionality  = p3h2x4x_tp_smbus_funcs,
>  };
>
> --
> 2.25.1
>
