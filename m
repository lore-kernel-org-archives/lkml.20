Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010046.outbound.protection.outlook.com [52.101.69.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0742253D0DC;
	Wed,  9 Sep 2026 15:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968089; cv=fail; b=iZehpjtODqM2UaBdaMRu3daXp9gzreH1sMmgWkaND4K7tGki1Kkxpv7JQXqgvQg2UPhupkNPRQjEprqQCsbtKhH8+gFom++UzI8/rSnG4ipr1dTb/0U//vzjxhbLfk1ZJ2Zyg/dQYv1/Wp/1resVantmTyZHbq0moTBmJvzeVcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968089; c=relaxed/simple;
	bh=z8w1guXja4hUOLFerMQxgqn8E37w8/sG8aWd4wIUHUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R50c2UCjlAUQyrhL58oQCs25FC/kDyg9Q1TVjvWqm/fQy+69l778bges7cqZGhadCQJcrfhpPkpB+IIRarEht/bHzuzRnLt+dUU8cBzk//EytpvJRsGXpA/p1XB0r2QEcw6qfRCl0V1Y5pWVbBBfZ2ScuRlJzdVqfRwgTVizZp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dGw7/bIt; arc=fail smtp.client-ip=52.101.69.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dGw7/bIt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bFmdLwYJwiCRw9ksdlflo9eUq0YiO3Eo3livK+VcNAorLC25jwb5TxZqdnVGL9Da3xEDGu7pReHBW7wmAG6DvPCuZ3wXZK22hq05GgPM7fjlKlx8WLNmB6FTqsoQfJoH7No4AhEwJJJDjhpo2BvHsmEj+eetueB+AQv43+CBCoZDtDnvnoyChSSPf1toCjL0svCkCH9ZQI8Y6jDF4b9Fsm2ON2E1Qw/gwXEErNOfSjS3A1fbviPOLcd4R2WTe1UZMrZQnJkt1/Gzz2/vs2JRu2crAM2fXR6st65EZKjED/54eEQ4jTrJ4TYlp/X6QDo9yi5vkDBuEKiycIsvAfcazA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hf8tr8Cv90u/u+PSKB7Nr9WVY4KN/S3WsCoLS6EQCfA=;
 b=d903maCDqjTbNsWwwCpjk8dFdSIDAmxGlKHqJ8Ua2td5xL77vwI4Gq5XNcg4BC13HWR/61EANTbyZocHnqYCcDYhTZzoy5rKUX2FzGx+geYqac2USjw78J/QCaqG91ymLgaupEs/65AsbJzs6FLVxLGeDNpM0Dodjte7PIt3rj1ASNd3uHld3aLLxzLwMUiJ7NbW6+eUa9QnnUXUZRBaVU3Fe9ZjqYAtY+p/NcU29TVsDIvIJZUa6eD/TJ+0KHaUIEqPb9mfaGNTeIFlBQSKzoyGkWf4RUSQMR9FIWa7LaZ9tG0tUUVnwxZhOrM6YyS/rwYoBdM6rdeJ+5pJ01Gr3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hf8tr8Cv90u/u+PSKB7Nr9WVY4KN/S3WsCoLS6EQCfA=;
 b=dGw7/bItZJdM+E893GvZ229GPuQj7Cpbp9uU2UntBGLj0LyjVIVEaYmPJSPyGQcYxt5H2344HaCdm4lcG6YK/ZwBgGOFrmdbQ2UfzMeyykcOlXZXyG863iwh//mCk+3kN5PXGtJiY1cNc+OWofXVcNxf74VvmkFM8cshmpm9eurZE4GMH39X5cRBPZWDO86ReB2CKyhd/FEqgKAhJLRTddMHRIXJqACQNHQbyOW/jBr07qlbiABAcj0zzHU4q+gCOtB+nMaVb2F97aJLvaI6BW/7Pl6xU20Ae2VWi1NUy74v951ZGlnjEOXDv8aWmg0nvlMClXv7bpwBVWmlGuFxww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7345.eurprd04.prod.outlook.com (2603:10a6:20b:1c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Wed, 9 Sep
 2026 15:34:44 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 15:34:43 +0000
Date: Wed, 9 Sep 2026 10:34:34 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
Message-ID: <aqF8igX1uynpo0xE@SMW015318>
References: <20260909071340.3649271-1-shubhamsanjay.patil@amd.com>
 <20260909071340.3649271-2-shubhamsanjay.patil@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909071340.3649271-2-shubhamsanjay.patil@amd.com>
X-ClientProxiedBy: CY5PR22CA0039.namprd22.prod.outlook.com
 (2603:10b6:930:1d::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7345:EE_
X-MS-Office365-Filtering-Correlation-Id: e6c5c65b-6144-4c86-e8cd-08df0e87df0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|23010399003|19092799006|366016|3023799007|10067099003|4143699003|56012099006|11063799006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NePGt746ewop0+lAKW5ugAZRRjj+H+14kENPYTVCkWgg/kttNDAkMI3qPHlO4R3ZO7MkPJAm6qwC8HYSTzk2tOxrTF5DKbZvhZjD5ij8rYp//PJvFSvzgtxfMKrsAruPs4X9mUafPMpixAZBep4Af4XDA0Xp3HpUtAx2XyiWk0IYjlvHUqHhDd83czcB0qREg+RYkj0q4+wWzhF+Wut+tDvtIbm0MZE/6v2UM3smnws/q1j5mNRx4O7vZK0NurYS4+bUJohHIDyH3HtasjWrtqj/CoYilXgA31D18eOgaG4szcInDpl5ro+DFgUQjLTjsdvlYuhQQRaQaOiuRAEAvwlek7ttdJqEYijCU3U7cj4Zzi/eRAZMkNFrgh4ACv2eWYY3GiodKX41y5BoullzlKtPt1/bgLwefHFSoqaq4FnNlrGWp4a1Do0ZHyejLH4ialMuNXr0g91tTKdMhB0YTul3GRfC+zM/YWDjg4kKdtqufISAz4dtNeL3a7fcEvimJp6PBZmAVsegvDca8bPz2Myc5LcQddqrccuiJUvZtXyinI5/xEBtOqXguxmMkqaGmx85knJeGMJUztTyB8J1KxBCrmLX7u7Ju7gXCRWoKUfzJsiiBurnDmmjv4OudoLfmCsQxqQYq6UmR1zg2f3O8mVzbtrfmzvcYDAL8oIv5aA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(23010399003)(19092799006)(366016)(3023799007)(10067099003)(4143699003)(56012099006)(11063799006)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3V0IdR7M/UNXI9lP9mFsx0IuTTZKj1LyUtBIPWYCWl9Jy1T8uD34iRN+ClZU?=
 =?us-ascii?Q?8HTHqNrxfni52OB/Qgu3QlehzO+TL1wiJREKwHnBa1S5wxJyswWZez3Wzl0/?=
 =?us-ascii?Q?wohWfcUPZ9/3dsAKLkULDsu2I2it39VEv0yQpPUKeZrBMy2pTKOYgiaQl49t?=
 =?us-ascii?Q?rv6mjTePx02CfjcKqXhoMUYQ8DL1/f+YHpYGGAXtMoos7ff16qRm9M+zFLgy?=
 =?us-ascii?Q?PvFYuzcUNA2Vq4agEDmvs+Xa6683/hH5GnnXJmoWUv7nDbkwl2bompY8Oucf?=
 =?us-ascii?Q?706IHysfbWgI67/cvF7XaPYOc/QPYdpPzek2iIkE8hYFpP5bhhBgRq8V/tBE?=
 =?us-ascii?Q?waF0Ww+d15Y/HGUMAf5BkyDseHXuTDRfShCX3MnyMVbdkl0ageDsT2uXkjD8?=
 =?us-ascii?Q?xGaKK70DblyerBYe3Y4nxhrg5X739rAP06iBHTyd9FIhyOR/waFUTx4LSj8J?=
 =?us-ascii?Q?fCaMlu47QtFKYChs1nCqcz1+TF9NLvj8y3E2nvDTEkRFq6Z+ZYMtkwl5Nl1f?=
 =?us-ascii?Q?7Z5kxfDKCrmYW9klKZ0c22kEQ2AZtW4iaJdCwU5h9xNq2NHzNDNcQUhgSUtW?=
 =?us-ascii?Q?F02YmgNsk95tJptz76Vyih3RSe6nfapK6hdx8Gd5bFKakMNduxi1naXWN3Xa?=
 =?us-ascii?Q?DVDUz46dN2JQ4FzjUmSX6LIP6Mg0YISSIL02uLfYG7amAmm/2B7rk1YfNDZh?=
 =?us-ascii?Q?CpuHA+ixcHcQIXyeMkJdsJx0Ol1Bbx8G7EyepeWP+0ocaW2tQpD94FnrM+YA?=
 =?us-ascii?Q?42fXB6YIWHpTomveg4Rm9tPE80uLZJDzRynI4ftAzfYf8BJPggjtyy3OhR6+?=
 =?us-ascii?Q?lJ8pqsoa3eAQFdyNZaI1Sn0u6I/rmUD6b0LeoQhSLnELoFxdg8ienn7ngopZ?=
 =?us-ascii?Q?TlszwFO8B5cdEhG3JDbRI9W8nSZ6XfprHxfg3vOf1A/lUtcyx+shXpi7joTk?=
 =?us-ascii?Q?MbsLbmpAQPTWx918pJ1JTESXrPY2scGdBPh9H7CiodVHee6t/vvXZ/HxFKts?=
 =?us-ascii?Q?wkD8ASVogyK2hEr1wFrGxvqq1ybS7r3MxZhd5RP1HyLcpvKGduR9zBzOL9Vj?=
 =?us-ascii?Q?OJ7TYQnIEdHYQ6hub03x5h7Cug0mYiyjFdvXcq1CBCshnVu0U59pGc439670?=
 =?us-ascii?Q?sXfDK7QEoYkpFYJmdJlY+XObo3A22Iumc9Zk7QGAvJdEKADZ5PCqQC6QRjxu?=
 =?us-ascii?Q?WKd6d/y2Sg3OHl9WvOUo0yeCAgvglpIUko8WWgJG5M7AEd3r1rLq/pfbijbM?=
 =?us-ascii?Q?FNu1v4XYqIxZUgslrLYleeTHrbLKIwJjxn0bafO/YhIYU44Jpeg5JjPh1LLy?=
 =?us-ascii?Q?OVwwqtA4rXpxpiey8e4PVqCOAEwHchLL3aJ3kLQgO9cQt3EuWcI9liadhZx5?=
 =?us-ascii?Q?smjFdWINKkL9FZ83AstCPzLYc5z4Ib1SK8fX3dEkzmR59RruIsGpx9dorvgp?=
 =?us-ascii?Q?g4Np3fLzdN0zY/z7HtTOnVMzdwBVerWAe2KVv86rLatmS6h1LExUogfqHQS0?=
 =?us-ascii?Q?YJR/boCPWit86jvmb3zXcOFZySN8fEq91TbKLbCdRJgyz0VqqgiNfelAEmQN?=
 =?us-ascii?Q?j4J10uuzhxdNlLQQAGdoM/gbr2uuEjPCY/SaMtF26IEnvRZo5zx8wVXJdOcx?=
 =?us-ascii?Q?bL20IMKNFx3sCvF41i2KOlsKtTasIIIe8+ju8LJNjR3g1sJswU6aOVQ1qnSB?=
 =?us-ascii?Q?vyFR7ROn6IbLkMt3h21Gu871BNEo++NXjIO2WOoI8END62k82LDLS5vZyhDA?=
 =?us-ascii?Q?tJaylyZkwjxxVKqmqc9qO92tSnae4iUjjsHuNan0qnZtB9ni6/9e?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c5c65b-6144-4c86-e8cd-08df0e87df0b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 15:34:43.8714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zGhf0VDtXTMvrhrbKngw/PUACXhAExSbs3Bp2GQB+irVCb+XS92+7eT9Hdwu7H1zY9Ony+wEfN/RbDkBCJGOY0lS4WTVBb0TPrrHnh9QwRncwMM1uwqtAQkzf6Y5XM7/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7345

On Wed, Sep 09, 2026 at 12:43:38PM +0530, Shubham Patil wrote:
> In-Band Interrupt and Hot-Join are synthesis-time options of the AXI I3C
> IP. Describe them with two boolean properties.
>
> A Hot-Join request is acknowledged by the IBI machinery, so a hot-join
> capable design is always IBI capable as well. Both events are reported
> through the controller interrupt, which is therefore required whenever
> the capability is present.
>
> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes in V4:
> - Restore v2: keep xlnx,in-band-interrupt-capable and
>   xlnx,hot-join-capable in the AMD binding. Do not move them into
>   i3c.yaml.

Any reason roll back? I supposed not only xlnk need overwrite IBI and
HJ.

Frank

> - Added Acked-by: Conor Dooley tag.
>
> Changes in V3:
> - Move in-band-interrupt-capable and hot-join-capable into the common
>   i3c.yaml schema and drop the xlnx, prefix.
> - Keep dependencies in the AMD binding.
> - Update the commit description accordingly.
> - Conor Dooley acked v2 with the xlnx,-prefixed properties in the AMD
>   binding [1].
>   That Acked-by is not carried here: the names lost the vendor prefix
>   and the definitions moved to i3c.yaml after Frank Li's comment.
>   [1]:https://lore.kernel.org/all/20260824-tightwad-impose-495476599087@spud/
>
> Changes in V2:
> - Rename the properties to "xlnx,in-band-interrupt-capable" and
>   "xlnx,hot-join-capable", and expand their descriptions.
> - Express the interrupt requirement with dependencies: instead of an
>   allOf/if-then clause.
> ---
>  .../bindings/i3c/xlnx,axi-i3c-1.0.yaml        | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> index 2caa245a8656..a04becc07374 100644
> --- a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> +++ b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> @@ -32,11 +32,33 @@ properties:
>    interrupts:
>      maxItems: 1
>
> +  xlnx,in-band-interrupt-capable:
> +    type: boolean
> +    description:
> +      The IP is synthesized with In-Band Interrupt support. An In-Band
> +      Interrupt lets a target signal the controller over the SDA and SCL
> +      pair instead of a dedicated side-band interrupt line, by driving its
> +      own dynamic address during bus arbitration. Such requests are
> +      reported through the controller interrupt.
> +
> +  xlnx,hot-join-capable:
> +    type: boolean
> +    description:
> +      The IP is synthesized with Hot-Join support. Hot-Join lets a target
> +      attached or powered up after the bus is already running announce
> +      itself using the reserved Hot-Join address, so that the controller
> +      can assign it a dynamic address. The request is acknowledged by the
> +      same machinery as an In-Band Interrupt.
> +
>  required:
>    - compatible
>    - reg
>    - clocks
>
> +dependencies:
> +  xlnx,hot-join-capable: ["xlnx,in-band-interrupt-capable"]
> +  xlnx,in-band-interrupt-capable: [interrupts]
> +
>  allOf:
>    - $ref: i3c.yaml#
>
> @@ -54,5 +76,7 @@ examples:
>          interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
>          #address-cells = <3>;
>          #size-cells = <0>;
> +        xlnx,in-band-interrupt-capable;
> +        xlnx,hot-join-capable;
>      };
>  ...
> --
> 2.34.1
>
