Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013006.outbound.protection.outlook.com [40.107.159.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEE6380FD7;
	Thu, 10 Sep 2026 16:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057934; cv=fail; b=pM6ViuEpl4koqDF2etrbVp9YrBEwMkchzBEA71cRC4dbOlqYiBjJMKfc/cqzOfnvav0itZGaQFVuO3PzSolIRPhLQeJ70ES96aOyLtB3Tyt8tQUjuPjW9fpCsMneinvjh8kuZLpX9ISJkCiAeeb6Y87HAlrQRxkkcNtwoer5Uvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057934; c=relaxed/simple;
	bh=JKEj/NWD97o40/M3TEYXFcDEhWQ0Qd+nbKfrpDSgQGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KoKzZNeXNDxyNjOtPGfYWv1v99GVilAeiaUz5NMcEG04Cb7z92pDekIksZwueD51I+UBlX1I83Cs9wjfT1mfXlfurGnnysirxPkmqwDqcqR+qrpmlMwIq/dpd1lodvEXPi8WLLwVRvq3bHpYDMEjQtBMXekxuZ24wkDth3L/xiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ayq1E4Bu; arc=fail smtp.client-ip=40.107.159.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ayq1E4Bu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LRuHCOusOEa0Jm7Et8sczvJvvQCPipGza+eo/NemZt/mJIev0A0vyInDpNqWzvj7s3lmlUWe1QoQXQl7NaD2qk33kKtWYZXSLsFd1m8kRoRUsruk+Gkn3lNC54D48B6nwBNosjNxXwBS47aLU0hICTpZpNIPMhRukeSCP+QYIt+fzEo3/qWLWma6zu9CF3RsKt/17qWfU3q+Rl6veOtwGmbVmuaFC9mU8NwbCwrX+3HEadhgiIMIfNIo9gzzMQ0YYl8Gso62vCfQGd60eLFM3pbWcUZ5IrzOVizyIqHryfjHWgQp9FgjofG3ShmPe3hfJvxiCrCZecrm6fZUAb0MMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L22OvJJnj1XpQrbcfsfynWt7q6naD2+cl4v0hsGvcnk=;
 b=dJNsA1VDeHUdEzgtMG+Wj+q6P0cPwDSNbBaqTwwisZ029inOBUYF2xlleiBZwduIjI8PAyIYaeSnbcIZUmbRAmeVVIt+lUwwaHOpayxaG7AD8KPPbNK5pup7Vyk9/pwSn8jGAH8Qpl+mUF2r3LrTB3pKFs+kS3J+myYvAmxtWcE1Mi1HGNbvKUaxlRUGUubZYGdyfj7J7LBADyaKsabU28VAfD63MR7vX/bBb312IZuJh/uOuRuFpS75Y7gZh6bqmr/fPRIOOczSPAlvizOqTOOnVzbLPgJIbCMaLr49n/iG21gxQzrMKVBmm4ODzisqvIW50WiBaWcofJBdJRKqpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L22OvJJnj1XpQrbcfsfynWt7q6naD2+cl4v0hsGvcnk=;
 b=Ayq1E4BuBf03mdM1/m6EuhBJmPg33cXQD+Bls+UwM+9Z6HSK+q8Ix5uS0qw9vDSEC7imdKDRL67jbW4JoPlkaOw82fB5Q7vYnmnjHNWFQPBI6kCXo27IwSq7/7nsFw0U3SYMg2cQG2ce79i0APPZ9u0tn62dt4HGhdAW774U5spKO4J4Ih3otNIqifdpSVJozgHN+EtN8/iyXTIxhbc4BS3S9Clfl5TK1ehiVsAMQXNou0bGPjdz92LN9dXADRll5kpP9CBv1z4TdvHUGwkBqC8E/e3yByZ+0kLEnvG69A7My8yRykmPGmE/X7TgVULxJeJoHMSaNgU5ezHJYobxLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMZPR04MB828691.eurprd04.prod.outlook.com (2603:10a6:20b:7cb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 16:32:06 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 16:32:05 +0000
Date: Thu, 10 Sep 2026 11:31:54 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 4/6] arm64: dts: freescale: imx8m{m,p}-verdin: Add camera
 connector nexus
Message-ID: <aqLbeo5L83QH9OQK@SMW015318>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
 <20260910-verdin-imx8mp-hmp-camera-ready-v1-4-3c9349ecdb9f@toradex.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-verdin-imx8mp-hmp-camera-ready-v1-4-3c9349ecdb9f@toradex.com>
X-ClientProxiedBy: CYZPR20CA0022.namprd20.prod.outlook.com
 (2603:10b6:930:a2::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMZPR04MB828691:EE_
X-MS-Office365-Filtering-Correlation-Id: c26cab8e-76a3-44c1-3d1c-08df0f590c95
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|23010399003|7416014|1800799024|6133799003|22082099003|18002099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	fYAxLOi/6fqxBdo9Dx318XsK+8uKWUyabcX4xS12bqzxMHBijsq8VA6WwaR8UOkTj4OpKlEYtztphvOdiNcZMSR9eBuQQNh3gH0uBL53aDqSXCtfI1qwFRugHA3Yd4xB85QEXXYjFJqbqzr6LZCiJTZJBEnOBEjX6QzweFykVqW+TrSRLgsb9byWpwGQkM8ueU6PfdgWUTiMz1EL7zLKizicvfAEPucFIuhry79nycLEPIVPaUUuG1T4jWwUKvOYrU8Dt+zpkcyFWBb/ljllCxh65+BTrCFAVofxSqdpsTo9fQMe5BpL0t42T7d5bnd63lukD4Bnr+WC17KQ2CiU7EgEtphd98BRQQOYimPni5dgAOleJtQe11UvFpdV0Gqt07d290Tm9lB4fn1bL8loC9RMWn+HbttgsM+Wbvks+4nxH4METUFsG7YTQWip8xzc7DwCoy+lYYtNN+Fp3h8L7y3/kbbe1/CiTa5Qeoh+3r2xHYyyhl+nkXMJelVTxfq06q02X6nyYeZghuaCY9MLiCMlTPnx+EOdpe4Y7NxvGOBeXYWWiPaY1pSg5QppytWjhAzsVDMl7iXE5DPfVhbUBL/isO2eW84x1/PMA8fWA8oN2/noK03oHryJu2qHcMu1EmJqsmh1/ogSgaZlVMamCFSmtGdNi3ZWHl7zFu4Leh0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(23010399003)(7416014)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jPR9poLtXow33ftlfV/vg3EhGG4q/LwQi062kzdlkFVgDqELarJMx3HRPCif?=
 =?us-ascii?Q?rIvdOuKfgC0TKSS5N9cn3yyxR60sFeyVPNEsMkzr/llUHuwQOcU5G9/A+ITf?=
 =?us-ascii?Q?BjBTwhdQTuo1CsTJQabd3k/ADQ6v5OUayv4F8lI+I5WtOTKDL83Lc6fbkLnl?=
 =?us-ascii?Q?/18aYB7f1u8MQQ9/KcKb9kJwjSXJKziEnr/7d4vsqHGs6iPxZa2m+clqtFb4?=
 =?us-ascii?Q?SPrqg17nETScxJq9TOa0pbWDL+evQRz4phLLkLc6jb2JCk3wwoQfMRAv4kVF?=
 =?us-ascii?Q?MbOOYgfRqOYEnnKVUunlSTGSrvsHKlKH1slcZ1OlZOgc/uGglW3Agil5UcTf?=
 =?us-ascii?Q?KRMEZn8dSmZXQIWL3CF+kI6/G+ubdRtc8D3bXa8tqRZD2hv+ZwGB87OoiyhE?=
 =?us-ascii?Q?5pbMoxCseUyVkC1qUOWSD5FxvslvYT3+THjpykMmJu8xMQK4fhbjSpX4C40l?=
 =?us-ascii?Q?nCGEgSwVeazYt9HWDftKS5/XW52hZGwbxKcFurCq0D23SUfr1+rgMAhqC/2o?=
 =?us-ascii?Q?h3dI156lstuNhGtWbpgjaR2ZJbWExzfKgjem0Mrz6Q/9zYnZBaD/qlDHjigo?=
 =?us-ascii?Q?atbZQjNAzVb5+2gCbRz8aaLy3FiyOnYZn1+sB7FEVBkwmeIN+KJJAa7ge0ME?=
 =?us-ascii?Q?VvG6Ie5qZ3xIbLbCC/2+mU/BGj6inJjeMxq+tPD7wQrQlRtLOb0eVA5C/yjU?=
 =?us-ascii?Q?WFOk/DGBR9+7xgolyeXPId6bjR4EVWBgsdPHQbdeZbgolnspO3lfxBnC/RAQ?=
 =?us-ascii?Q?aAPqRI4QfSeNQYLR1KAeWonQvq3WHx0hDiOeksAqRK/m8zKtG05JUhBR3Kcc?=
 =?us-ascii?Q?8uFt8HAXh4a38C9fk/mx0nb/0LxoS2TZtrLZvKMRVJs9da9VbStlZBU/JBDZ?=
 =?us-ascii?Q?Wl/1DcsMw3f/c4/2D6SOvks33hIE9RzmodS/HbO1h8r/3qPITvQiKOF/C0aN?=
 =?us-ascii?Q?lHbs55ntuiWb4rgvtcrKAbmtlj2wr7FCCzDyYKyp0wd5cbuV6mmY3viwpLeG?=
 =?us-ascii?Q?iLblzy/SyoXZ6b3gegNPmbv4sm85CVJEJwqR7bEl2z1LAGOkj4hTPG1WjMjI?=
 =?us-ascii?Q?QiZ/yXHuzdFvEfO0xb+Ox9vouoH26uvsZjkM07XdEfA38BjGib/sqrXjejuw?=
 =?us-ascii?Q?fSR1nK2lw40eaN8pxzRAV/tsCoJ4G8TSxLgyNCjF6YiSf3+PQAM2p91N/N09?=
 =?us-ascii?Q?qgqM84pBaXBok32XRz6kCHrysZ2qVpVRn9Cw6/Ff0Ur1e1QduPUjjo09ucG4?=
 =?us-ascii?Q?XunEeP4lKqQl13CEvOmjoGPv6Oi4ONLv6JYGlU90OwSTd1JMSR78x2W2fGMh?=
 =?us-ascii?Q?qM2NgGmaDjJrsP0PI0J8s4X1zdZr5ovdHBDsyYGG1R0YCjOelb2nOhUY0HgQ?=
 =?us-ascii?Q?se+T4ILOStYOpcntqTNzdyciqANzpDP5vNRfBLOaatXfa7W1sfCua3HQrE0U?=
 =?us-ascii?Q?xP1AxSlZssjge8gvzAukZ2n8VesL9dwLNdkoo4RrkRtv9kWYMnrvdWNa2yAd?=
 =?us-ascii?Q?V+nqam+duUXVcJ2ueb5MyQG7ggBSMyaIOxJSsPQe4YVA5bDOts69tmx1yZIF?=
 =?us-ascii?Q?xrDb6gNHEQLOVTuhhkIe6swg8qN6HJaE6jPTr+YCVUZI3uQDmXMWpKQ+D1rD?=
 =?us-ascii?Q?6engSdGihMEAPtSjMHQFKPAAobOmDUvSyQSN9TMr3qrugEgqi2l6a6LdBrgt?=
 =?us-ascii?Q?OLCgmQzRdVI9dLiCOQcnERRA/uO/GRw8ciZw1Uwt1oGvAWIiXEPg0qEazyfa?=
 =?us-ascii?Q?+OHqZsZPDE508JGwi7unWIgmcyS3p5oZbIvRrjZBNrNMqX1ox8ne?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c26cab8e-76a3-44c1-3d1c-08df0f590c95
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 16:32:05.1140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kfDPTeJsgEBAdIzvTL5QgmOPfnhhzTXvDQaJeuDo7V/wQblB2uZe+LViiywFYEfgL3bj+DnAsJIMNX4RhGN8CwFzx8JYj2mQgCDFjopDY8QXCPDRljoaTq8BBAlVBPH+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMZPR04MB828691

On Thu, Sep 10, 2026 at 05:38:00PM +0200, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>
> The Verdin Development Board, Dahlia and Mallow expose the same 24-pin CSI
> camera connector, while Verdin iMX8M Mini and Verdin iMX8M Plus route its
> sideband signals and media pipeline through different SoC resources.
>
> Add a GPIO nexus to each carrier description and stable Verdin-level labels
> for each module's CSI_1 I2C bus, receiver and capture engine. Keeping the
> nexus in the carrier files avoids describing the physical connector on
> carriers which do not provide it.
>
> This gives accessory overlays a stable connector and media interface
> without embedding either module's wiring in the accessory description.
>
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---

Nice, thank for your efforts.

Frank

>  arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi | 17 +++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi    | 17 +++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi | 17 +++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi        |  8 +++++++-
>  arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi | 17 +++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi    | 17 +++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi | 17 +++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi        |  7 ++++++-
>  8 files changed, 115 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
> index 3d0b14968131..4cf77559e69b 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
> @@ -4,6 +4,23 @@
>   */
>
>  / {
> +	verdin_camera_connector: camera-connector-0 {
> +		compatible = "toradex,camera-connector";
> +		#gpio-cells = <2>;
> +		/*
> +		 * CAM_1_CON_RST       (pin 11) - Verdin GPIO_5 (SODIMM 216)
> +		 * CAM_1_CON_PWRDWN    (pin 22) - Verdin GPIO_6 (SODIMM 218)
> +		 * CAM_1_CON_IC_DETECT (pin 23) - Verdin GPIO_7 (SODIMM 220)
> +		 * CAM_1_CON_PWRCTRL   (pin 24) - Verdin GPIO_8 (SODIMM 222)
> +		 */
> +		gpio-map = <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>,
> +			   <1 0 &gpio1 11 GPIO_ACTIVE_HIGH>,
> +			   <2 0 &gpio1 8 GPIO_ACTIVE_HIGH>,
> +			   <3 0 &gpio1 9 GPIO_ACTIVE_HIGH>;
> +		gpio-map-mask = <0xffffffff 0x0>;
> +		gpio-map-pass-thru = <0x0 0xffffffff>;
> +	};
> +
>  	sound_card: sound-card {
>  		compatible = "simple-audio-card";
>  		simple-audio-card,bitclock-master = <&dailink_master>;
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi
> index 1d8d146d9eeb..51a836324c16 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi
> @@ -4,6 +4,23 @@
>   */
>
>  / {
> +	verdin_camera_connector: camera-connector-0 {
> +		compatible = "toradex,camera-connector";
> +		#gpio-cells = <2>;
> +		/*
> +		 * CAM_1_CON_RST       (pin 11) - Verdin GPIO_5 (SODIMM 216)
> +		 * CAM_1_CON_PWRDWN    (pin 22) - Verdin GPIO_6 (SODIMM 218)
> +		 * CAM_1_CON_IC_DETECT (pin 23) - Verdin GPIO_7 (SODIMM 220)
> +		 * CAM_1_CON_PWRCTRL   (pin 24) - Verdin GPIO_8 (SODIMM 222)
> +		 */
> +		gpio-map = <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>,
> +			   <1 0 &gpio1 11 GPIO_ACTIVE_HIGH>,
> +			   <2 0 &gpio1 8 GPIO_ACTIVE_HIGH>,
> +			   <3 0 &gpio1 9 GPIO_ACTIVE_HIGH>;
> +		gpio-map-mask = <0xffffffff 0x0>;
> +		gpio-map-pass-thru = <0x0 0xffffffff>;
> +	};
> +
>  	sound_card: sound-card {
>  		compatible = "simple-audio-card";
>  		simple-audio-card,bitclock-master = <&dailink_master>;
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi
> index 4a0799d63446..5951cd19a84c 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi
> @@ -11,6 +11,23 @@
>  #include <dt-bindings/leds/common.h>
>
>  / {
> +	verdin_camera_connector: camera-connector-0 {
> +		compatible = "toradex,camera-connector";
> +		#gpio-cells = <2>;
> +		/*
> +		 * CAM_1_CON_RST       (pin 11) - Verdin GPIO_5 (SODIMM 216)
> +		 * CAM_1_CON_PWRDWN    (pin 22) - Verdin GPIO_6 (SODIMM 218)
> +		 * CAM_1_CON_IC_DETECT (pin 23) - Verdin GPIO_7 (SODIMM 220)
> +		 * CAM_1_CON_PWRCTRL   (pin 24) - Verdin GPIO_8 (SODIMM 222)
> +		 */
> +		gpio-map = <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>,
> +			   <1 0 &gpio1 11 GPIO_ACTIVE_HIGH>,
> +			   <2 0 &gpio1 8 GPIO_ACTIVE_HIGH>,
> +			   <3 0 &gpio1 9 GPIO_ACTIVE_HIGH>;
> +		gpio-map-mask = <0xffffffff 0x0>;
> +		gpio-map-pass-thru = <0x0 0xffffffff>;
> +	};
> +
>  	leds {
>  		compatible = "gpio-leds";
>  		pinctrl-names = "default";
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> index ac450fc6cbfb..5c72b279d506 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> @@ -224,6 +224,9 @@ &cpu_crit0 {
>  	temperature = <105000>;
>  };
>
> +/* Verdin CSI_1 */
> +verdin_csi_capture: &csi {};
> +
>  &ddrc {
>  	operating-points-v2 = <&ddrc_opp_table>;
>
> @@ -596,7 +599,7 @@ &i2c2 {
>  /* Verdin I2C_3_HDMI N/A */
>
>  /* Verdin I2C_4_CSI */
> -&i2c3 {
> +verdin_csi_i2c: &i2c3 {
>  	clock-frequency = <400000>;
>  	pinctrl-names = "default", "gpio";
>  	pinctrl-0 = <&pinctrl_i2c3>;
> @@ -695,6 +698,9 @@ eeprom_carrier_board: eeprom@57 {
>  	};
>  };
>
> +/* Verdin CSI_1 */
> +verdin_csi_rx: &mipi_csi {};
> +
>  /* Verdin PCIE_1 */
>  &pcie0 {
>  	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
> index 0e218e6b8e29..164031d5dd86 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
> @@ -4,6 +4,23 @@
>   */
>
>  / {
> +	verdin_camera_connector: camera-connector-0 {
> +		compatible = "toradex,camera-connector";
> +		#gpio-cells = <2>;
> +		/*
> +		 * CAM_1_CON_RST       (pin 11) - Verdin GPIO_5 (SODIMM 216)
> +		 * CAM_1_CON_PWRDWN    (pin 22) - Verdin GPIO_6 (SODIMM 218)
> +		 * CAM_1_CON_IC_DETECT (pin 23) - Verdin GPIO_7 (SODIMM 220)
> +		 * CAM_1_CON_PWRCTRL   (pin 24) - Verdin GPIO_8 (SODIMM 222)
> +		 */
> +		gpio-map = <0 0 &gpio1 7 GPIO_ACTIVE_HIGH>,
> +			   <1 0 &gpio1 8 GPIO_ACTIVE_HIGH>,
> +			   <2 0 &gpio4 3 GPIO_ACTIVE_HIGH>,
> +			   <3 0 &gpio4 1 GPIO_ACTIVE_HIGH>;
> +		gpio-map-mask = <0xffffffff 0x0>;
> +		gpio-map-pass-thru = <0x0 0xffffffff>;
> +	};
> +
>  	native-hdmi-connector {
>  		compatible = "hdmi-connector";
>  		label = "X21";
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
> index 72a4f846d694..c52e46738110 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
> @@ -4,6 +4,23 @@
>   */
>
>  / {
> +	verdin_camera_connector: camera-connector-0 {
> +		compatible = "toradex,camera-connector";
> +		#gpio-cells = <2>;
> +		/*
> +		 * CAM_1_CON_RST       (pin 11) - Verdin GPIO_5 (SODIMM 216)
> +		 * CAM_1_CON_PWRDWN    (pin 22) - Verdin GPIO_6 (SODIMM 218)
> +		 * CAM_1_CON_IC_DETECT (pin 23) - Verdin GPIO_7 (SODIMM 220)
> +		 * CAM_1_CON_PWRCTRL   (pin 24) - Verdin GPIO_8 (SODIMM 222)
> +		 */
> +		gpio-map = <0 0 &gpio1 7 GPIO_ACTIVE_HIGH>,
> +			   <1 0 &gpio1 8 GPIO_ACTIVE_HIGH>,
> +			   <2 0 &gpio4 3 GPIO_ACTIVE_HIGH>,
> +			   <3 0 &gpio4 1 GPIO_ACTIVE_HIGH>;
> +		gpio-map-mask = <0xffffffff 0x0>;
> +		gpio-map-pass-thru = <0x0 0xffffffff>;
> +	};
> +
>  	native-hdmi-connector {
>  		compatible = "hdmi-connector";
>  		label = "X37";
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
> index 846b36706821..b915fbbd04b6 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
> @@ -11,6 +11,23 @@
>  #include <dt-bindings/leds/common.h>
>
>  / {
> +	verdin_camera_connector: camera-connector-0 {
> +		compatible = "toradex,camera-connector";
> +		#gpio-cells = <2>;
> +		/*
> +		 * CAM_1_CON_RST       (pin 11) - Verdin GPIO_5 (SODIMM 216)
> +		 * CAM_1_CON_PWRDWN    (pin 22) - Verdin GPIO_6 (SODIMM 218)
> +		 * CAM_1_CON_IC_DETECT (pin 23) - Verdin GPIO_7 (SODIMM 220)
> +		 * CAM_1_CON_PWRCTRL   (pin 24) - Verdin GPIO_8 (SODIMM 222)
> +		 */
> +		gpio-map = <0 0 &gpio1 7 GPIO_ACTIVE_HIGH>,
> +			   <1 0 &gpio1 8 GPIO_ACTIVE_HIGH>,
> +			   <2 0 &gpio4 3 GPIO_ACTIVE_HIGH>,
> +			   <3 0 &gpio4 1 GPIO_ACTIVE_HIGH>;
> +		gpio-map-mask = <0xffffffff 0x0>;
> +		gpio-map-pass-thru = <0x0 0xffffffff>;
> +	};
> +
>  	native-hdmi-connector {
>  		compatible = "hdmi-connector";
>  		label = "X14";
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
> index 45a4713c260f..53499289cf61 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
> @@ -719,7 +719,7 @@ atmel_mxt_ts_mezzanine: touch-mezzanine@4a {
>  };
>
>  /* Verdin I2C_4_CSI */
> -&i2c3 {
> +verdin_csi_i2c: &i2c3 {
>  	clock-frequency = <400000>;
>  	pinctrl-names = "default", "gpio";
>  	pinctrl-0 = <&pinctrl_i2c3>;
> @@ -829,6 +829,11 @@ &i2c5 {
>  	single-master;
>  };
>
> +/* Verdin CSI_1 */
> +verdin_csi_capture: &isi_0 {};
> +
> +verdin_csi_rx: &mipi_csi_0 {};
> +
>  /* Verdin PCIE_1 */
>  &pcie {
>  	pinctrl-names = "default";
>
> --
> 2.43.0
>
>
