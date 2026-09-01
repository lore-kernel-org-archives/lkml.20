Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011017.outbound.protection.outlook.com [40.107.130.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8530A3D47A7;
	Tue,  1 Sep 2026 20:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788296307; cv=fail; b=n3akhHmwmUe2sbQ7fXOmllWeB61srlUjMyUdqzUxqWxBVXcuT4xou0AoIuu64wpaw5aVfZWH3CsQ3fzOBKhbWFXTRhcNDACg8SHVrgln+jQ5SXsvFTf50S5cP8DD7qUt3u4YlHFaPCttuVAiPwjcYsqmwxdyw3TxIbEdk+RhN9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788296307; c=relaxed/simple;
	bh=q60uKolo7edrfmwyrkZNTFUtv3rAKsR3+jJ1IrLiE3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tha7a6RfzQ3f6YKoDaE+5wgPLaA+z/O3/+6QxAyxTQ6o4tlJ6YPbSg9R3zyasd+Dbty01o8djLYFeRy29LD4SU1MZpTVb4Oaznp4RAbuOyArkVU4SdgzmY4LVf0+IaI1QAAK0kBWNFmDf26AD3NmQoNl2Z3mYHTB1Q6EMouWXr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gmXuHzik; arc=fail smtp.client-ip=40.107.130.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gmXuHzik"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T8wfo0FJ+vQhFORZkPstV7Bus2EH2zxzITWT0HpNJFg32m0AxZ2O4DKt2gWccGEKGAvGxX+mN3CdIlXibkvq/q+tPYpG2WVDo4xVGK3y/8Gx8fJ4sGjw/cyz1yb6mWlerw4JhZTEmoofrEfCkbLM/6byg+Zvj6qTL8kfY/tmEyBCFeU+nfmYthtQx3IdJbUrmg6AW6q8v83KOCo0HUXEViZrfd4MJjAuc3KzPP8VloD69QGoi8TgWiYKDAQstT2Tr4OofvZlPRZ6/sI87p8MwQdYsNXOq68Z7pNSd4iQ8ZzXvCQMqq84Zx91DAyh28y/cAVH/yAZibFZcrKXUOyOGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kDcrvQqolwvwCNIFD5/rKOSNlE7cLfEPCUNt4xcoBA=;
 b=fQLwyclw9KhxEXHjF/9kBKO1dqLVl6c/+pOnam/llUETNIGr1wm3hgGXlx3tg80hoA6vsmlN0d541t5pGbA8xujPpAzQCpHSgkaqTSHMumkb+QTSqq8HV+DpdsLByGf4hkGsBa2Kds3jVWIy8oREk1PffnCY0AaY/E7zRziY4O6YPC3x73FIdJgZYUFhkFFvQxZ9Sqjz5Q2b+SpcIeya2vAFgTWYdAiE9qy0of8f8P7Xj/c1uYbQcUt9q7/HTZ3Ieqr4SKmI+ON0w9fcwahhLAMGfcR8B99zkdhV9r7DJGkF63xt4S5B22ARpnc4KdAvqLsU2zXGo5xqVjP4Xck+lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kDcrvQqolwvwCNIFD5/rKOSNlE7cLfEPCUNt4xcoBA=;
 b=gmXuHzikv9KNPLuKxnnQkjY+4r9TBR3kuQpC3bOCGk1gc6i1OnOdZzg9SpxgH61HweSVtTbYFxurVOdS+0J9lcf1KRD7qvwFzSJVY87HIMfIm5eviT13R5BacA4vc276etllws3sGFqjrTol6AoQmk1+gVevgPWH0lY1LnRgH+mgxRpa9zxZ8vDO3/1k3gUWwn8D5bci/GpnptQ7db7ua5YP6J0rbv70kAItqiHX50/7Be2hz6tdZEQkyq+vpU/3VX/EJUj9zIU6fItzcFA957PihcDD11glzbod9R3p5SURH8PPdh/rc8NuORHGJLfWeKrDJilg6OnQsST+ICMGFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MRWPR04MB11494.eurprd04.prod.outlook.com (2603:10a6:501:74::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 20:58:18 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 20:58:18 +0000
Date: Tue, 1 Sep 2026 16:58:10 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] i3c: mipi-i3c-hci: Add a quirk to clear the TX start
 threshold
Message-ID: <apc8YiMT_8aBukeE@lizhi-Precision-Tower-5810>
References: <20260901-b4-i3c-hci-ast2700-v1-0-19909e7cbd7e@aspeedtech.com>
 <20260901-b4-i3c-hci-ast2700-v1-4-19909e7cbd7e@aspeedtech.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-b4-i3c-hci-ast2700-v1-4-19909e7cbd7e@aspeedtech.com>
X-ClientProxiedBy: CY5PR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:930:1e::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MRWPR04MB11494:EE_
X-MS-Office365-Filtering-Correlation-Id: bc504428-7357-45f2-53ee-08df086bbfc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|7416014|376014|6133799003|56012099006|10067099003|4143699003|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	C7Tx/Kngz1gU19ZRzmZmiN9if5er5RwKb115IFh6oqHcxq0z5L1X+EzBEkJMUCkUeqOYNxNvTnt9tKIsVX2EWCEGXwV8bAj8QKNWGAxf1VXSpFD9q2LqWFsT1YJ/b4PulX73huz88//GPGhARVaBQJ9wZyVtrx+z3pCqTDpD7dqYrDk8ojgVB7azvnzZ5Oe8L1xrvsppUCWbvVYYydxRJU3+Cmp0XhujdzLO/aLRywR0A4cA79romzgs4o56bDGZR5fCB5kkuJwYM5yj8rbk4cLx2kULHUIA5hhU6Z67sABgDYdjOpU/4gkyPbENNLiku5nlUoeno73Qxiy8eS1yPnI5HeSwKkyxtiEfmdYZZVTdpi6O9XQBsxaRyxYRy6+04fIXvfxaeGgQkwDenjbXI7woVkP2kvbxqyez37Ppa6uNYV+b1hyhqAdV8r7YyMm7QxPlxFhYWdJ5GFMHqFQsu/CLkhWZrDBqWtub3zNWSAadMG2rC1LqMvgK4fLWcz/aIrjjRYwmsTyQQ2ThTH97SRi+5xUnt5xc7mfxSDkxpgtuucVfZEfWdmNm1pl1HE0SlwV0Y1cB8MpmfkSrNpKEOwNg1Bw7yYLKxtE0+2ycvWndBNxv8pi4SVGD+WqokB2hxv7MFEHzW9nWVIy+zwyCmJCTPxkmbEJ4cTS5wFALymM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(7416014)(376014)(6133799003)(56012099006)(10067099003)(4143699003)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C+HLbaxeyBb0JWUGGoDGedA1G4ooLK5hRFuu/nzzl/PfWxCLp7Y3qS1GJ/KM?=
 =?us-ascii?Q?x8jxoWaijmnoMAnjV7xhBeRKGxSbugH3qLlzpLaEg0+S7FmTQVh1N57x85V1?=
 =?us-ascii?Q?MYfsI+KZ8ax4IuUvQ4+IHu1pgmjyOT0Gf0oWI3uYbqjaSFkS/wx5iX/yc7Ys?=
 =?us-ascii?Q?BEN9Hsbr6kii6dY7grjUloKNfppi02xxZsIKN2DjAUcsMptwDFBAp9MNVuLH?=
 =?us-ascii?Q?4thTWPvALOXn+6S/1I8RJGRhMqnMWxKR+jC/v4dfrrOBrNV4TpDApmJx5VtX?=
 =?us-ascii?Q?ItJbqqNOi+cSS/DnuxOojWomyqso0SWP3lfkjcxZA0gnlUM9xf7pPQYJh1TN?=
 =?us-ascii?Q?czauXY3iPmMoFS3Va6Z4RI3zkdvE7UI2F4pQShlOKnPvzD9ZzH/9wCwdZS4s?=
 =?us-ascii?Q?omm6y78t8isP7sgKTarupQlcneqPZTdNf9eWyB/Vvy5lHkHS8hi0/wpjr4Ek?=
 =?us-ascii?Q?GTFqzrRsKMqktBOGokrtlMWV1Wmd0qiReIq25FrJq/TW3ouzQ7kEo9Tr4uvJ?=
 =?us-ascii?Q?e4FFl1qk9A37YqBmRAwXxHjRMxB6PHdLhI/GgFsEGk0QEZwH0R/wacJHKpsT?=
 =?us-ascii?Q?62dlLeCP6tEmHcJhZDdVJO1mkC9EKW9yqsVU/CHgmHD7hQk67flx3BwMdN1R?=
 =?us-ascii?Q?QcLKRD7b2oaAol7xArbAxyCzmcu404/XFZIAiFRWdfE5UyW55kocoV5IouCI?=
 =?us-ascii?Q?/Txzy4qmN/yEas0dCeFOgnPfpgVloMm2XnyLebuymN/7Osq9SW+pAn8z/bli?=
 =?us-ascii?Q?cuapNzQJoIbAdX7r9wwBlm39Cbqg20RbghSghd48ggVXdwkxurGUH38Z5t/D?=
 =?us-ascii?Q?vJxAjDCM8cw5JUvcTUb5QG87wJuroQFbX8Iz/yrnxdMVXYa0NRoIJRbuslqw?=
 =?us-ascii?Q?E3kmCAZTxNPu6s9SXeoGy2vUUQ3LpzcneiNSLVqdKjlvEPY+dQGKkLTTnbEN?=
 =?us-ascii?Q?Y8HZg3ardFoRMA4Ug79CHjNOdlHqaYDXUBKAwDZ9jwbft8OcTsylgzMUl3Pj?=
 =?us-ascii?Q?f4tjAJaye/yvuSpYHwIy8j1YLhWZdCek9Y83KfY7MdH3n5qQwl9GA480BG6U?=
 =?us-ascii?Q?mU2hKBpAn/jZQSuNSEAJ44lBZIRGfA1BsXRtl2zLhR0Nl5/P3RLz7dcQu0go?=
 =?us-ascii?Q?pXn9yfvFR+GVLyJ11actYVQjjq1kiUo+ku47g5EpZS99iwSsfAf4vd8iJkox?=
 =?us-ascii?Q?ZtB55Orx1jfNadr5sflK1QK6BenNiJBxpfPmril3Mg9WJtUQclUT/dep72ix?=
 =?us-ascii?Q?gKnk25xaRnrFYkGWd2eRLyti2mcUxUz9Yl+QUiJwMB/LbSQTlQGBiNVDUHcy?=
 =?us-ascii?Q?pVTxP/S2In+MBbmJtq/hmDTS2ptSdjGaCXc15pgo08qlUCB51r0ECpaGWhoi?=
 =?us-ascii?Q?i4xbgb/g90ht6kqYHlBkVySX4wLk+NwDKRUtovCLME0PFS+UbM3d6NAfNUwP?=
 =?us-ascii?Q?Y55lI2FpM9XVh3o6SpkkQDY90es/gueLyNfsTHmnjmn3VO3P7olMVdffmSPo?=
 =?us-ascii?Q?9tnmZvfRjKojA7UAVttL3+rIaSZ8E8avF4uvJO9ZsUDVZvZfkg5i4kqrWlA5?=
 =?us-ascii?Q?ZJAnisC6emku8XDF3ES3gXBArALnGLipkCF6fQPVFJjWxgyLiCmaYrJ6SWd/?=
 =?us-ascii?Q?VRhLEv3GxdHyz4TP+wdQOPUrZwW12EY5+zHfbSE+Hw4viUDTrZF72uU6zq7L?=
 =?us-ascii?Q?atU56yz9qY5wpFxvlmS80904fnDnnH5qP4rp1RH3os9WV5vvNqOxCi/zvAnl?=
 =?us-ascii?Q?1cA9E0w/m8zfPRVVEjDKfPTWoAhZm7oRr4sqSkTABc5O84ywHX7C?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc504428-7357-45f2-53ee-08df086bbfc0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 20:58:18.3253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4wnIiVWcg1S0pZ1fBwymd+GG++5LdaD8UW//1KKR7zG9i0BZuw+3PJsEsP8PaFCp92K3HqjwzDhR/DUy5jJPnMQyLZMWyA9D+NaTbNa2J1OnGTkU6DN5pFaYOGZ6UBe0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11494

On Tue, Sep 01, 2026 at 07:35:31PM +0800, Billy Tsai wrote:
> The DATA_TX_START_THLD field of the PIO data buffer threshold register
> holds off the start of a TX transfer until the FIFO holds a set amount
> of data, which in PIO mode cuts down on the number of software writes.
> The field resets to 0x1, requiring at least (2 ^ 2) DWORDs (16 bytes)
> in the FIFO before transmission starts.
>
> HCI controllers that support both PIO and DMA can expose the two as
> separate register blocks; nothing in the specification says selecting
> DMA mode disables the PIO block's own gating logic. On ASPEED
> platforms it doesn't: DATA_TX_START_THLD still holds up transfer
> start regardless of which mode feeds the FIFO, and in DMA mode that
> threshold is never satisfied for some transfer sizes:
>
>  - 1-4 bytes: uses the Immediate Data Transfer Command.
>  - 13+ bytes: since the hardware fetches data in 4-byte chunks, a
>    13-byte transfer fetches 16 bytes into the FIFO and reaches the
>    threshold.
>  - 5-12 bytes: the threshold is never reached and the transfer stalls.
>
> Add HCI_QUIRK_TX_START_THLD to clear the field whenever DMA mode is
> selected. The clear lives in i3c_hci_set_io_mode() rather than in
> probe so the reset-and-restore recovery path also reapplies it after
> a controller soft reset. Move the PIO Access Area register and
> bitfield definitions from pio.c to a new pio.h so this quirk can reuse
> PIO_DATA_BUFFER_THLD_CTRL and DATA_TX_START_THLD instead of
> redefining them.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> Assisted-by: Claude:claude-fable-5
> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c |  14 +++++
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |   1 +
>  drivers/i3c/master/mipi-i3c-hci/pio.c  |  97 +----------------------------
>  drivers/i3c/master/mipi-i3c-hci/pio.h  | 109 +++++++++++++++++++++++++++++++++
>  4 files changed, 125 insertions(+), 96 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index c03c3a9cbe4f..2290a889701c 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -26,6 +26,7 @@
>  #include "cmd.h"
>  #include "dat.h"
>  #include "ibi.h"
> +#include "pio.h"
>
>  /*
>   * Host Controller Capabilities and Operation Registers
> @@ -823,6 +824,19 @@ static int i3c_hci_set_io_mode(struct i3c_hci *hci, bool dma)
>  	else
>  		reg_set(HC_CONTROL, HC_CONTROL_PIO_MODE);
>
> +	/*
> +	 * On the ASPEED AST2700 the TX start threshold gates transfer start
> +	 * even in DMA mode. Clear it so DMA transfers are not held back
> +	 * waiting for a PIO FIFO level that will never be reached.
> +	 */
> +	if (dma && (hci->quirks & HCI_QUIRK_TX_START_THLD) && hci->PIO_regs) {
> +		void __iomem *thld_reg = hci->PIO_regs + PIO_DATA_BUFFER_THLD_CTRL;
> +		u32 thld_val = readl(thld_reg);
> +
> +		thld_val &= ~DATA_TX_START_THLD;
> +		writel(thld_val, thld_reg);

don't move these defination, original isolate is quite good. Add API or
callback to implement clean DATA_TX_START_THLD.

Frank
