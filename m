Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011051.outbound.protection.outlook.com [52.101.125.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A033408623;
	Thu, 27 Aug 2026 12:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787835543; cv=fail; b=rD8p/JLiJsw+lypxltLqJuTUfMfpDxQA3lOjc4hRvh6RcZRrM0BcnqoxhQxFceIdZNf8knT1pQ6+4qJuxjiIgV6C2sSw+NzoAU+vJDO5h5pFkAOYfE5RfGSA5HlfDDwSgwO39OGL4f2MHIlKGsqPhkX3SEX52XIu7zpRMs2jbSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787835543; c=relaxed/simple;
	bh=n2K6HJXuQeLRY1Y/ArwGllvOtMAFk1inSf13Y/e0a00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Y+ctRc2G+HE1wFOB/YxNOKsWbc+1tNHjcjyHrhw4Yn2jQsKC8kBnzvOGetHPWMSZeCq0/2Zyqujb41yGVswdGud/OJdlhfN98sy9NRjxn0j8XqS58f9xwCa506pUgSsGjGmWIQ4LnMcF1wnFME1sTJrxVrCnpYGQze2aGDXoUpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vmTQUdU7; arc=fail smtp.client-ip=52.101.125.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vmTQUdU7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VG4PpiTBw5UG9dJJxd1nruCPzOrKIuy1CVFIeARx7jlpKNEZ2lDKvjMmtItBhkwkWOJvBvZ+WiGPVdSkl317AuqOFOZPxmoofDpiWa50GsPT5FpdlxL4RGr+8rUuMaGK/7fEaLDxdmol+vezdXQghfoN8Z81M2siJjk+JtZYdxx+n/8mvg78y0Cyy8Nt8i5gE984tg3stLZDPiS5PXXesQijOXkxdETeszGgbBLx0HO/pJiNqFzM3yl8LO9uXJbjdsQhRDFBopTiGdtZTp1MFVTaLS0ZsZlDbopUcTXfvPKhLTwkvjF4StGcH+3DGn2+1DY3kUeBCdAvIOYXYDz2ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cy5ckd5r+8zFr8DceaHT3jYD6KbuM2PvoAKMcnYxR0Y=;
 b=ytsYjZh7MqqeV3HksZxUQmmlVjILKw73cBQmWA6qFR1uPut5b7LQ8+H9b/AdIBlkH03JuIh+Igdh30orLcKp/740KPHLYHSQZEVezO4mefSOG9sHeOM19WI/VZe6w4u5kvsSrHz86W3HzfYhFRSnk8dGMSqAhw4YcjvvyTrdD65cYwU9hwfhYM6TWgGqexjwwTlqOjOyNAbz3Hc1U5LzSVn48BfOgvPis8wYkdur26H+PbTBhnG6z1DyoeNPFllsLhSOY9mC/qg+awPokjK+QaV1i3lUg5V1BnreSeVlpCrlvlO2aTXVgBFE/3CbMeGsnd34tWJaJLJGt95DX54Djw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cy5ckd5r+8zFr8DceaHT3jYD6KbuM2PvoAKMcnYxR0Y=;
 b=vmTQUdU7VAcFC26Jn0DQBk/uEitA5i/0mTE68rLRE0jwoUHyxwAKieC6FNJX+NzyZd3NPEeTpehm2Pr7TBPq0q0NeJblXxfGNx7/11AiMwbnvRUeM+xPPaPCOAOo6I6T7EPTwDwRTvR45E6wBtIMrbn+NlZ40ruvS5tB6MAx10k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OS9PR01MB17203.jpnprd01.prod.outlook.com (2603:1096:604:40b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 12:58:49 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 12:58:49 +0000
Date: Thu, 27 Aug 2026 14:58:31 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju <biju.das.au@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 10/13] arm64: dts: renesas: r9a08g046: Add DU and DSI
 nodes
Message-ID: <apA0d2tBBJJ9FMnJ@tom-desktop>
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
 <20260826174854.199139-11-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826174854.199139-11-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::18) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|OS9PR01MB17203:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b18d768-7209-4efe-9bc2-08df043aefcf
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|376014|366016|1800799024|18002099003|22082099003|56012099006|11063799006|4143699003|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	aHBw0XvxsZOOsYPqIO/DxFzB5M37KlEEGpXbdNvxG03V2hYmGZoKbmhQRLK6+kwRFyV+AoM4t/8Abh3YUl3fOI2HLtIDHvZLKqoz+yts/7AWp9ls+IVMUi60SpTYcT4ZJB/t0CPSwuK0fFIX/n7YZTTzjnULL99m+hDA+m8qJaPY9MOC0hfHo0d3dZ9Y9ue7xV6FLMJE8n/FaVkSMc6wqHGO6jtU1SOtMg/VxlvCPmhjAbOsh5M6uzf5W2ST9LRfruPRSEHbjAOc3f6VZ0DqPWiRQGMOCCH402t+6ElNWXKtg2AxzNZzh1PbOxffWSQgMSFXIoxYIh/JR1+4uqGxaiGWDv2c0stXXbEkULDgSTV7R95C/WvPT9+Z7YBLCb7biquUlxin/q3l93o8NrM0ZjUT91Fm0JWfuucOULh4biS3B31oVQVkMJEdXcpaXGVP/1Y1SaQo+X4N869itKRxlJK6lr+cA3a36OCTVxxw2WF9sLvV1bZNDtCFPesLnT9zcz/gg5Aky/0TYtVnY2YpuKeF9x7Fw1n0E4sQQ2YDK5IupC0fs+pxvuvx91nBUqIKqkSkKK735AIhAywyiwAuW6+cqJfvxOpDG55vdwTUgvA2lrbnNgwXJ/qPw88jyPW7wULoWHQaemBNMqsln7yoZcqQevy7/qlrcZiRWc2lOhsb8rNIKypJNT7fgafqkfTjIp4aNZBTFBFNwkntw0fnkaRufQq6mMTZBlpH/ZiHzBM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xjk9YJSeK+uPH0FYl3WGm2GztNSgL9W069DeMj/dOSDZszJZFZzdIuYMlFx3?=
 =?us-ascii?Q?B/O9Sc2MmkacBSsElJWfEeN2bcdnjL+lNtamgegnh6e72No3kHefMvYvEn0f?=
 =?us-ascii?Q?wNFApaeoNiv4gKxuOAC4tW616jUMgk/cZUG5ZE2PvkZuobj2QcMSArGw3Mjd?=
 =?us-ascii?Q?GiWmyLFfCiGhZkpfhrPSgBGE0J14Ql4do0O+bXED62X023mRYk3IsEeQoh7j?=
 =?us-ascii?Q?Md4XLRg5FNx7GuyMax9t17os3w1gjnwhHoHniQavcswtp7nfDpUemnwDrxEr?=
 =?us-ascii?Q?kKMLgGmHzmEgAr3b3ClusE7Y30/OzUVBF1CFjbs6UxcnmTyTfu5ZXuAr/1pl?=
 =?us-ascii?Q?8oghJDWZKwmHqiHWA5uRLr86onPosiWO6jYsYGDwhqfCiyF5dCOtFnrJH7JS?=
 =?us-ascii?Q?8xaurN4ZI4Jozph5hZtxBBHvQLsBZjNEAeGQ17PjkDXppYcc6WZI67mpyTDy?=
 =?us-ascii?Q?mbq6cm+XOtHZhnkukYoeYeMfcaqq8MKEUWLmPRsyfbFKEjKbgQ8BSEZ2Ry/+?=
 =?us-ascii?Q?Jld+ptVaYEUCDq93EhmJch0r/BRiOoWOcKMpJpJaeuOOYqAtHm1daT6ZJZq2?=
 =?us-ascii?Q?f03lA7UFmWjbYE+p6hznHvOi0nJZ/o/TMk9bbe6WpmB7q5a5sUyJE7p+memC?=
 =?us-ascii?Q?PUZufjKLaro/zMcC/h8agULKk58yQMp9U4wkrRRy4GTDuS3HsJ5HO1t/PuP3?=
 =?us-ascii?Q?M0Mjt34Ut6OKvdUww9LhIzVkEzHltl3Vd15wKe5j0TfCBoOeXKsCrPe4VwYc?=
 =?us-ascii?Q?+tRNXbl29Q344V07oC23ydMRv7KypSWgg6s4T/lg9eNjeyNDlcbVKziFje9G?=
 =?us-ascii?Q?E15d08NuFr2SBTsjcKHxu4zDzHee2kbv9i6J7WgEpAIiJECXLEJ7dN88Di88?=
 =?us-ascii?Q?i8hIAHZGb6F1cHZDmHQfPHBawdziLVXEuZtmYEEUsHU/imJnM7v0C+dXXaPW?=
 =?us-ascii?Q?LXZrum847bl8t1h5SstKNcyEQeKKcPpbTwkneTiyxjzjw4jW2tAxxD48dIJZ?=
 =?us-ascii?Q?5DbgtA5lw7mMlymixSqrh/ZD35Lkcg72da9w1+B5RZhisOu9HBZtT+BQJ1FT?=
 =?us-ascii?Q?qClWJ55MCuH+wVQDNbQTEnieLR3UGl3RRCseKoKENNf1XnQbNXt0PNFv3jfp?=
 =?us-ascii?Q?+CamyF/DCdpa7YGKUGOUX114QzwJ5RUqIbg+Qt0SU810FwgWr1obbO10x6Nv?=
 =?us-ascii?Q?eswIAgTRtYHuPIeGp4o16MiqpCdfXJn2HDesmLF1IJ0YsX6oxVsQNJvTnhNa?=
 =?us-ascii?Q?O8iI0jsxzjzdWlYm0KJhYGsQPCQ6B0ZV3UizCofXR9Ey03TkqzfKY62uEgB3?=
 =?us-ascii?Q?E6rpImmSYH6adg09HbQmO2EoOgv8rJz+tZOBCUyzC8q0x/Yf/QwrkflRegE+?=
 =?us-ascii?Q?r5t3SPHN2GvPSuLS8efz3QXBrQ/uugtEFAGtxyT/vKT/UGvmiKD/a61z7pe6?=
 =?us-ascii?Q?tjUcVPS2bDmc/ZVxVZLa56CMY5J5K/tKRK/au+Iu5pliiQ89mQEXHmAKE7CW?=
 =?us-ascii?Q?WpcFVqVZ0FQJnIIuWvguhp7aQPIbDFixn3Qnb5XfiTnd3twKetyzeEM1jycH?=
 =?us-ascii?Q?RhFkUMBeZ5lTGUTtB/cUch/UTClOCw7TewtWA1XZlRX7Nky6D9dMyDhcclLn?=
 =?us-ascii?Q?JnxyFJ6+WZA5AsZakW9ESaF2UVKhMwhACAG0YaIm/wIqGyfhzS2vswfh1cnw?=
 =?us-ascii?Q?K4FWYugI6MtqCpEqbXyOz4danYiFpg3YFx+mjgaSZsMNQiFFX/1KCunjySgY?=
 =?us-ascii?Q?PnAlbrHjPqjDwm1rqV6W1DX4LoQ/NEeozmhCjsGirmB2S6Qw2w1s?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b18d768-7209-4efe-9bc2-08df043aefcf
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 12:58:49.2560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZymK43WHMjF/HFxMCv+qH9pfSLoIahJkK65wrZOffrRz0dBpU3rJA2BPZs+6whJO49KKTvLxBDaoT/6vHCm8MbGF+OLzhAVdvIxbocON8ze0KWwQLc8h4G4pUezikGLB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17203

Hi Biju,
Thanks for your patch.

On Wed, Aug 26, 2026 at 06:48:44PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Add DU and DSI nodes to RZ/G3L SoC DTSI.
> 

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Kind regards,
Tommaso

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * No change.
> v1->v2:
>  * Dropped renesas,sysc-pwrrdy from dsi node.
> ---
>  arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 77 ++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> index 6ff145dc81fa..cc8bfb24da87 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> @@ -696,6 +696,49 @@ ssi3: ssi@100e4c00 {
>  			status = "disabled";
>  		};
>  
> +		dsi: dsi@10850000 {
> +			compatible = "renesas,r9a08g046-mipi-dsi";
> +			reg = <0 0x10850000 0 0x20000>;
> +			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "seq0", "seq1", "vin1", "rcv",
> +					  "ferr", "ppi", "debug";
> +			clocks = <&cpg CPG_CORE R9A08G046_MIPI_DSI_PLLCLK>,
> +				 <&cpg CPG_MOD R9A08G046_MIPI_DSI_SYSCLK>,
> +				 <&cpg CPG_MOD R9A08G046_MIPI_DSI_ACLK>,
> +				 <&cpg CPG_MOD R9A08G046_MIPI_DSI_PCLK>,
> +				 <&cpg CPG_MOD R9A08G046_MIPI_DSI_VCLK>,
> +				 <&cpg CPG_MOD R9A08G046_MIPI_DSI_LPCLK>;
> +			clock-names = "pllclk", "sysclk", "aclk", "pclk", "vclk", "lpclk";
> +			resets = <&cpg R9A08G046_MIPI_DSI_CMN_RSTB>,
> +				 <&cpg R9A08G046_MIPI_DSI_ARESET_N>,
> +				 <&cpg R9A08G046_MIPI_DSI_PRESET_N>;
> +			reset-names = "rst", "arst", "prst";
> +			power-domains = <&cpg>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					dsi_in: endpoint {
> +						remote-endpoint = <&du_out_dsi>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +				};
> +			};
> +		};
> +
>  		vspd: vsp@10870000 {
>  			compatible = "renesas,r9a08g046-vsp2",
>  				     "renesas,r9a07g044-vsp2";
> @@ -721,6 +764,40 @@ fcpvd: fcp@10880000 {
>  			power-domains = <&cpg>;
>  		};
>  
> +		du: display@10890000 {
> +			compatible = "renesas,r9a08g046-du";
> +			reg = <0 0x10890000 0 0x10000>;
> +			interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD R9A08G046_LCDC_CLK_A>,
> +				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_P>,
> +				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_D>;
> +			clock-names = "aclk", "pclk", "vclk";
> +			power-domains = <&cpg>;
> +			resets = <&cpg R9A08G046_LCDC_RESET_N>;
> +			renesas,vsps = <&vspd 0>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					du_out_dsi: endpoint {
> +						remote-endpoint = <&dsi_in>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +				};
> +			};
> +		};
> +
>  		gpu: gpu@108b0000 {
>  			compatible = "renesas,r9a08g046-mali",
>  				     "arm,mali-bifrost";
> -- 
> 2.43.0
> 
