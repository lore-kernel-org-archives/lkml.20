Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011023.outbound.protection.outlook.com [52.101.125.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DA4435502;
	Fri,  9 Oct 2026 14:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791557984; cv=fail; b=DTHFqNI3syvl7tw9eSicT6LZ1X5ufV5JYUWUEhRF91T/NotYOelDx8keaPf9BeU65/gpij9yDIP1bSsyzny9Uw7Jg5Yb7iMIvpDDagTq+yS+ogbk0rC+co5k1zOeRZSUl5eJLd9sKKKGCDvNsw/bKK8XoGOE+zC+5FccKvdy/fA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791557984; c=relaxed/simple;
	bh=Jku+yUPzy5ZQc8JaAJiziaQV4zivWDuRkAxuKoRr6Rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QeT/UJ694AehzJ/U7PYu8StwZ9Kig8+EgvFWLLA2Y6pPloXV0zZCY2aj71uEYyQHKbFqajdPwM3QhNN2NK7oq2aSWnheRdvhjRkby0jKwpXijjFwu26nV0sRak9FOybrPpxt6RE0WI0rdZRaNPsETtxL5BmJQ3jZXv1/ZzKxb/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hexDpARP; arc=fail smtp.client-ip=52.101.125.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hexDpARP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kntDntTUdyCTagg92OwT58RebASuIPqMTSV9wqpDNr3AyJH3Shaxgxn1huy3sZS8k8Uh63h/uuWE8P9f8z7S7/wgOPgV3SFn7XmExJQDbNXgrsItMi/L0coNQ9UbjLArv9tZJ8fkgCg1gX1ENGQyI7xklrhRsuZifxwEYADHNtYL16+rcb+LDBnZ1JSUWBNqjXFgk/vKEaK+yTKFS08Rqa0acX6jCUbmkCxq7eY+H9+li65l//itWCs+Siur27v5QeTvm/HNmeqyO1d8+YcKserMUqvO+pV9Qnzr/enaWlQdBWp0df7un7nDF07AnKIYyrDUtXnad5JfMqt19G9mYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=icEMLBHysAbcAW7nlu4dufUZug+GwG2TFD5B4bM+jNc=;
 b=BEsvKEY6tzfIGz56YwaL1Pye3HBTSZRMux0l8j6HmuhusN6bm3dUeCRpcsnXfx8kM+q7M8daAWSD72eAiniw31tur+SqUJBvpwW8PQOEHJWJMnwCctqP7Az4z5hZQ4jYy/7t+jKQAG6Gxb9J3TjDg0ocCTN9yUqtvsqTzekGM6hJKj2QOUruF+y2KzhaONwx8zs7Jg2aS3iHy7Uv6HfpIx7Qm9XbJHzp0LSREvrcjaM2roskQjIC1yALCLw8wGlCLMi4cNvNm6AkcAnZd7Q+6+AfxlHNBTAIWbcL/8WSA9VnUu80hqIGlj19IZIUE8QjPdUKvKWQGSTNCgZMbHwN0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icEMLBHysAbcAW7nlu4dufUZug+GwG2TFD5B4bM+jNc=;
 b=hexDpARPLXFQbnvkEOvwJMfWCFBnaXZ1zA7/kBkihK4+E7o0PfyXfOet5LVfTlXXm4x6PZMNX5DEknu4qkz5RKIFb2NWTR88imfBENHRuaClB58Swf+oZQuuzqzCFx1GsEvxivTNCG8sT1iPdCYDgBLOmERJUBS/v5R2LFVWmDI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYRPR01MB12608.jpnprd01.prod.outlook.com (2603:1096:405:1b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 14:59:38 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 14:59:38 +0000
Date: Fri, 9 Oct 2026 16:59:15 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2] phy: renesas: rcar-gen3-usb2: Keep OTG VBUS disabled
 until role is known
Message-ID: <askBQzpjiQX0CY0e@tom-desktop>
References: <20261007190654.452376-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007190654.452376-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-ClientProxiedBy: FR3P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::11) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYRPR01MB12608:EE_
X-MS-Office365-Filtering-Correlation-Id: 9448e9aa-e5e2-40a5-d562-08df2615f03b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|52116014|366016|3023799007|6133799003|22082099003|18002099003|10067099003|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	q/ef5NJi4eu3xuqtsiUzvrvlpsscNZAB3MEJtEEgAm7WnF2+1TetcaSFC1mzT5DNCdcQ1ZQS0u8PaanCX/vYe5Dnl0fFbsTDlr8HnCqkhOWeb+XVfVT6XDOt9MrJ4zXgWaK7XKXNaLD2MOHn5NWXPUF96+Dk/DkHpwyvqiZMgPeUwyMoQ6jgI9bNENynaWBcKoedFjfIQ9CjDvfw1aGX8sJ50F5Sf3bzeOyfMBZ4M7DuMdBwSn8mNHqY0gEEC8XjIM+n0a05fGhIiV2viILsVi98bdz0EGbu6gIHHQAs26mtvbjgKOV7YQ+fbwu1v0yVrXsQTSxwZZOAr8Ojpnp6qGeIetStTPnCAXpWM2eoLimYQsFrWvwXAChXHohsT1OWIePQ6rDv0Wy16Fi40ThQSrAB85EZvnQpck7/UfXf7o+9Z2eUtlWM0uflT5JkeCzOSeVVAov82aFnzaL2myjca+ti2cq5WteqKgvQUgbm2s59Vq6j1TS1uXNg4EZ17eg9TeSIdK/K69YpfoiaBX0sbIHaHGKJn7ZN8b+wPg2raWShzmsrACyK0X+LxSlfPvRMtna+Q0oCNBt7hy+1+rcovi7xXVhSjhEg0iT9rYOTgfeGqtJZ8yTXB15w6RHp5mRBmIRxjpcWRRkacV9MdfPqnxzeBGOJPu2RfaYhLMNUXCAUTfYOMXAiDHlBIb7/EwWnhB/msRlONV3OM96VoBTZfJdZP+HaA05T7BlGNYWkv28=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(52116014)(366016)(3023799007)(6133799003)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r/IXCLDOwIZ9574471S6hcLkJHH0F9O/C4l9jtbR1aJWf4KSws5FN0ReoFhZ?=
 =?us-ascii?Q?eKrz+FTujq7XacqZq3oFV5ksKxF8CyZ3rDebzCzkIQLXyE9q16HlaQtVCPTU?=
 =?us-ascii?Q?NVrs9jiDMp0K5XK6h9Iw3QwAMlllo0jiodlfOcRd05jwy/mNNjPF9qrPwSOY?=
 =?us-ascii?Q?5ynZkKAYMxjNIQX50Hkc33At87Fzf4yR/G9LWq8ZntUHLGWPtBhTH9oOxe1u?=
 =?us-ascii?Q?87d8itJ5sfzyaRVKfiqYzuaxPQzFygsOV9vW2lDxJhlCE1j0Zk83DSdChaL9?=
 =?us-ascii?Q?qiCltv9+8NCe7U9Iwwpf9EWcan0roWrLYo0vu/vygUhtFE7/Nd8p08eBckhv?=
 =?us-ascii?Q?FKPwxyrs4GeT+Zj4NfXR+ZYd7Vy3doMTNNnpxFl6xS07ZwBAy6LIhOt3wGqq?=
 =?us-ascii?Q?p1Sb/SkN32Jr+RUqS5cabZAfckdWRGiggT56rhNZCxMUCouA5I4oVajJHmTY?=
 =?us-ascii?Q?wkpIqPGUybeZwrQUJgiewmNt5fzN5A0D05oEvmKzBqUu6XAtyetXQ7A5uLBV?=
 =?us-ascii?Q?HHNAdEDNmab3f1cwuKZ4/RPSZbniuBgdUz9KExrLZ5i5mg/h5KEQU5lIcnEI?=
 =?us-ascii?Q?hXx0BgG7+eTQJ1HKuWe3ggvKCJrCKXBawT6eib0ZIFa2QtOlr1+Z5a4L+wnh?=
 =?us-ascii?Q?m2tkiuUjO9ZiNXYbb8EPYOFD1E2w6FaDxwq1fWtjvP6nc8s75+K+iWfKK6C2?=
 =?us-ascii?Q?+54F6r2ZhMYpLuIy38eUd6bUlr3H1tpmlAfYDovuOxDYvoHV0HyG29LsNndL?=
 =?us-ascii?Q?zx2z6sp5O3DnowLmNVehkYNSMbrct5udZvf0cUWtPDDNy7G3egIbFMvu9592?=
 =?us-ascii?Q?NAPlJcYOJmEZyqulmhXjexR1sCTH2JE9seq/AM0NNWTbVeLcVDA9U871iHRL?=
 =?us-ascii?Q?6BPgrE2XqWTfoCUdDtj7uKfW9nenhibUnLKEq81XlU0lPuFFglFVTV+pALZB?=
 =?us-ascii?Q?/MMDQ3JZOE4qdrLQy7IFv+xHTUelpzDn0uUtPFgC21Q/Pf7H34jnDHtTNbN/?=
 =?us-ascii?Q?tgxe+fWNWozJRBvMsHBtAePgeQi4pNT/z0oJBUfTPCT6clZsFib6eEXd39Vv?=
 =?us-ascii?Q?A/ciKzhSdiTrOES8ICzwy9v9Wh6MY3LoCBVS4MdZC3PZN0V9+7S2CafDEenH?=
 =?us-ascii?Q?0lCgbi3OUisLZXUlRH23ruhyNcrj13TS1AMxwwHzbeRKS6FfVLD97wfdY5YD?=
 =?us-ascii?Q?Ti/FP4w6cY1jH+3vFCRmEGXU/lsuftVDTewBdqmwzbymYOVofiYrtRNYhkzc?=
 =?us-ascii?Q?+YttpYYr4axi2WK5YPIkpUOMTv22Emq8ia3z+r9yXrTRnIVtGTiJnZ8i5wrJ?=
 =?us-ascii?Q?zP9QTimpz+ajZhS71gMA7yY88iWNM6mo2DPLMJOLsXZv+i4V9Hq6DFKhMhKR?=
 =?us-ascii?Q?I2GsSqOpORsiwyUh4tl5zJUGjxyYCENHNWPUo+Hn7ZhG0PN8ffNukjXR4To6?=
 =?us-ascii?Q?p1cEhpY10KDyzToI84DRnWw0L+owoeo9I4Cwm1Yxk0IZR2CIOd7mFc4HhlWS?=
 =?us-ascii?Q?V5WT5sYKyribeX1dvfd0ay8wHGfTHVSoTbXCysOXjqP+hLH5xlS/q84skOoE?=
 =?us-ascii?Q?sRrYP9li2pdJg/JeI5cLZ1laOwoe53tpOiaYZBaBOIZHEIG4UHtZEgQd9pBW?=
 =?us-ascii?Q?0kLk/OxXaJHEOzhHAezjJcdyt/VIl8vat2JGiu7WWvG9/7m2fUTWde9h5HeF?=
 =?us-ascii?Q?JgNHzPYSsvbneFYGp61dCBSXrBRw8tpUIeehrwqJdfxjwjD1W1uas+OWqSTJ?=
 =?us-ascii?Q?7zYtH7IiiIH/bJmzfb9ga5UDBx9PuVFp5U0OrVd5c7xhMHlEXjtj?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9448e9aa-e5e2-40a5-d562-08df2615f03b
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 14:59:38.2505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TezWnUlzxmPNgF/PPzaM52sC+FhnNtSJARgF5txd3/nhi2HF5vwJ2N6fwPi3oWKXr2O9WTYydlO2xKi+CIyg6qmLfWgROQ5eA3w1F0PduYk0ZhsjATMQU193YhbmYWrm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12608

Hi Prabhakar,
Thanks for your patch.

On Wed, Oct 07, 2026 at 08:06:54PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> On OTG channels of SoCs without ADP control, the VBUS regulator is
> acquired with devm_regulator_get_exclusive() and its output is switched
> by rcar_gen3_enable_vbus_ctrl() using regulator_hardware_enable() once
> the port role is known.
> 
> The helper acquiring the regulator has the following problems:
> 
> - The internal regulator is unconditionally enabled at probe, so VBUS
>   is driven before the port role is known. If the port is connected to
>   an external host this can back-power it.
> 
> - regulator_get_exclusive() hands the consumer an enable reference if
>   the regulator is already enabled, for example by the bootloader. The
>   unconditional regulator_enable() then takes a second reference while
>   only one is released on unbind, leaving the regulator enabled and
>   triggering the WARN_ON() in _regulator_put().
> 
> Fix this by making sure the driver always holds exactly one reference
> to the regulator: reuse the reference handed over by the exclusive get
> if the regulator is already enabled, and call regulator_enable()
> otherwise. Register the disable action in both cases, then turn off the
> physical VBUS output with regulator_hardware_enable() until the port
> role is established. Enabling a disabled regulator to take the
> reference may briefly drive VBUS during probe; this cannot be avoided
> with the regulator API.
> 
> Rename the regulator helper to reflect that it acquires the regulator
> without directly enabling its physical VBUS output.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Tested on RZ/G3E.
Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Kind regards,
Tommaso

> ---
> v1->v2:
> - regulator_enable() is only called if the regulator is not already enabled,
>   ensuring exactly one reference is held.
> - Dropped enable parameter from the function
> - Renamed function rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable()
>   to rcar_gen3_phy_usb2_vbus_regulator_get_exclusive()
> - Updated commit message
> ---
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 35 +++++++++++++++++-------
>  1 file changed, 25 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> index b5ba751805aa..3481505dea2e 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -1114,8 +1114,7 @@ static void rcar_gen3_phy_usb2_vbus_disable_action(void *data)
>  	regulator_disable(vbus);
>  }
>  
> -static int rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(struct rcar_gen3_chan *channel,
> -								  bool enable)
> +static int rcar_gen3_phy_usb2_vbus_regulator_get_exclusive(struct rcar_gen3_chan *channel)
>  {
>  	struct device *dev = channel->dev;
>  	int ret;
> @@ -1133,17 +1132,35 @@ static int rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(struct rcar_ge
>  		return 0;
>  	}
>  
> -	if (enable) {
> +	ret = regulator_is_enabled(channel->vbus);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (!ret) {
>  		ret = regulator_enable(channel->vbus);
>  		if (ret)
>  			return ret;
>  	}
>  
> -	if (regulator_is_enabled(channel->vbus))
> -		return devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_vbus_disable_action,
> -						channel->vbus);
> +	/*
> +	 * An exclusive get of an enabled regulator already holds a reference, so
> +	 * add a cleanup action to disable it when the device is released.
> +	 */
> +	ret = devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_vbus_disable_action,
> +				       channel->vbus);
> +	if (ret)
> +		return ret;
>  
> -	return 0;
> +	/*
> +	 * The regulator is enabled only so that the regulator core holds a
> +	 * reference to it. Do not drive VBUS until the port's role is known;
> +	 * rcar_gen3_enable_vbus_ctrl() switches it from then on.
> +	 *
> +	 * The VBUS regulator used on these SoCs implement the .enable/.disable
> +	 * ops, so regulator_hardware_enable() cannot fail with -EOPNOTSUPP here
> +	 * and no special handling for it is needed.
> +	 */
> +	return regulator_hardware_enable(channel->vbus, false);
>  }
>  
>  static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *channel)
> @@ -1151,7 +1168,6 @@ static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *cha
>  	struct device *dev = channel->dev;
>  	struct regulator_config rcfg = { .dev = dev, };
>  	struct regulator_dev *rdev;
> -	bool enable = false;
>  
>  	rcfg.of_node = of_get_available_child_by_name(dev->of_node,
>  						      "vbus-regulator");
> @@ -1165,10 +1181,9 @@ static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *cha
>  					     "Failed to create vbus-regulator\n");
>  
>  		channel->otg_internal_reg = true;
> -		enable = true;
>  	}
>  
> -	return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(channel, enable);
> +	return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive(channel);
>  }
>  
>  static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
> -- 
> 2.55.0
> 
