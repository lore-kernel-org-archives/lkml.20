Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011030.outbound.protection.outlook.com [52.101.70.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261964A8A27;
	Wed,  2 Sep 2026 15:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788362888; cv=fail; b=RvmblpajD3RoNLEhSKFn4Kdc0WMniXJvW46OWShOK/2zLXLBtOmR4wcP+0faWFdqfLqniUAk8iyjDHEFrmNKDvzOVLEoN40XRS3pxhAMHuvg2gCazyJCa7HcmRqFzasK7fgaqY4Z6RL8ronYFPtL2hYyiTpwb2nLJHJkfqTzD8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788362888; c=relaxed/simple;
	bh=XgXJgT7wvV6gQkUELnHMcQWPooX5GkPnvNRtetdlFqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Rp4BMIuQp2Pe3RFzODOKhgUcQjKLgJ5aSUR1IaM+DGO1qNabzuG8MvtgL1qslJ4iBXsmLxSkRs7Sk1goi8LndRjqFXNrlcK77Khx4CKnzzYtAZbggclKLIAZf5bcckRfiRKv0/3GTxr167lH2qvf/DzhLEjSvl669/AiTshUk74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=koFmDTxh; arc=fail smtp.client-ip=52.101.70.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="koFmDTxh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a3xtq4n3dWaOloxhj74EEzp329yYTLaGq8tuVLUcpVLzWwhMWvKzSEFFRR36KFFuyzihGe79pERr75d20ywtUYgEngXXjksmGFaFBN9kbn1Whb3n6zG3s9S0o9/3J8NUdNrNhj2ZT/Wk5Fd3XofKLYpJUCNmF7fAEEKT072Vl72YHdhJTavGDihqpd0FBqT4imO9vbltqkmMX8HxT2+Sobm4YCbKuHRCK+3WWigHKO8/fyJ8z6gCuE1/jl/svHzBCfJQQ1YoxyuGXkdsiFK9Xrl328X+YqoFDix/DL5p9ttRdhPRbsKoQLnA3Ve5+uzh3K4XgW9HYxX9mQq7oKeFMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lE+B+XoGhZiS0sA7mIrw8nMWcTYdYVXe5s6oOLv/Jk0=;
 b=zBbGxGWTvgb4EGVYVQMJvt5vHkwRcENeYb3T+ZRFSqF/Xilr2mGxwF5ABMZiX15AsK0Nx26qUT9j2vVQgw/RwdBEmixO5rCq+d+ddcdpRtx/T3l6lnW84GggJQ+LNvzKAzZBqyIKrelU2DtZXj9w7969TLWAkPASRN3+0AYVWKuLnVO2wT3vj2/zp+VnvppNwTFGxm6YOVfvGIfDsqlpKK6osToFWcRaKJVFiIPYzuEKhXgyNVvUIDfmdW8Y5EhygnljZduevUQGGQxzPfLSoDucCBtKUIKERZf/EvhIbWyC4yOoCj6Vt4KNJ3dSWBockEaV7XlXK4lyY8VBuCnrTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lE+B+XoGhZiS0sA7mIrw8nMWcTYdYVXe5s6oOLv/Jk0=;
 b=koFmDTxhYy/OJuG0R5d34oKcA76bIMyxPrqHH0/rRCxTgm33yxRHRQIOJOBoPoTynEHdLZwrlJWnY6mNFoDhtq375iPwl4EnCCq+AEqxUk8ADRbXWL7E262b3aX/FBdREyQz7uc3E3iH9r8FPRWjFqjxTDOQCe9UbsuUkH0ctPFiaHfRQ+oA25f/BmEoH9v0Lt14nxQJKJw1qyigHITsdYjoIqoR0JIo1wfndVhq4SE0ANUk817YeLhKYSK8CVE6a0eenF6AhhO0jnP7YtFZuwwxDcZJHxXTxdQKVKTFvyNb9Gq5tlvOZb7XNRjHM9XIT78bgppsmkp9F/qsGSf6zQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by ZR6PR04MB910871.eurprd04.prod.outlook.com (2603:10a6:910:dc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 15:28:02 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 15:28:02 +0000
Date: Wed, 2 Sep 2026 10:27:51 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 6/8] arm64: dts: freescale: imx8mm-verdin: Add Toradex
 OV5640 CSI Cameras
Message-ID: <aphAd56XQQ4dnsdQ@SMW015318>
References: <al5mDqeFE8QVbUd9@lizhi-Precision-Tower-5810>
 <3ak4ffamwvdrtgw3bivzvrbtkmyh7g3lvuk4xwvdiuzizi3iu3@uxqvyif7rvpx>
 <178471622928.2174993.5439033710284861967@ping.linuxembedded.co.uk>
 <20260722105914.GA72270@francesco-nb>
 <amDXGRT80HfyJwCt@SMW015318>
 <vrw2wmtywuokachenclid4dnrosaq2xqlzqtyqe75tsdt27yzx@ntztzwyxoadw>
 <amJrv2FDbdkbvMKQ@SMW015318>
 <sr26lfvwasgcosfzcf4ydtwxwjjutlio2yqpgxldatpzjo7e4y@77k7gefnjzvl>
 <amN9zxNjXM0bSp1w@SMW015318>
 <qkcwnshcm4o3q5vbdgb6i33wtm3wrri7ifsi5pnj342mqgfiaw@76vnlt3yro5v>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qkcwnshcm4o3q5vbdgb6i33wtm3wrri7ifsi5pnj342mqgfiaw@76vnlt3yro5v>
X-ClientProxiedBy: PH7PR17CA0031.namprd17.prod.outlook.com
 (2603:10b6:510:323::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|ZR6PR04MB910871:EE_
X-MS-Office365-Filtering-Correlation-Id: fa45a40b-fe88-4ab1-427a-08df0906c68f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|23010399003|1800799024|366016|10067099003|4143699003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	6C9htjxxyuBgEFp97MgiEvOwKKUnkgkqg8qxf/YD+OKyP0M3IyZBApAAOL28du7YM8ALqUGxBcc2ZBJwMAnXzwVTaAhX+chdiM5ogc4dQsKvAg0iBtixoxg790Wn+2RMgyiwhJ/Ca3VTaEWNAxo3zP3Zm0HxvX9s7RkgMg7wwQhTvkKNsjXS4XgL85yI3laW5wMsAHXo12PMrbjBtvWqvNp+tPWZviCFWIvGqtBjz0GN9QYTpFhCQtnf7k1+fv/smEmr+gfM+iYv5BRIdHi9uqXxli41F13JTyj0F90SVyOBYOISo1TK2WF1FqIcCW9mO2NfHakcvw6KLbaAMsRArwEqg5oJillXBloq1zadZo3w9/Vo0RVKFUPZcwgJuQXgesgFEsjOFhAT6kxO3SAaqSkniWasv2jpZ8u8nICN4ZHXVKAok3rNF9dj8a9+s9BLBRsT5/KwTDsTHbG82HKZngGjQ5UHjym+iRhSSeNTeeErnRhiPq+npq3tHwXnf3W1s8AsIDdGVOxFBrr6GKdJOVJN2Jm3tW6fXCFaW99a/4BXogBHjWoPOzyYu4mMZ92e7UwshIXbGqeiulZv3cV5dFgigBBT39K8H5R2aDBagxW/EA/mTFF586D99q/dwXIA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(23010399003)(1800799024)(366016)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?McG4P2ZqybueL3diTBGi5QjGgVRR39ct3JpxOchGG1SiMbqbfrr7w2MyCdhA?=
 =?us-ascii?Q?yTAm6MCb5KRqV/z1BVs7clkxVeMRCCkOqN+jwkJj2mTA0eMac3L5Llf0VnWF?=
 =?us-ascii?Q?J18ycslkk0uHVGUsFtgKETyaON9IO7D9Tigu8SzQuwsYg/9SsHGcaDmkTlW/?=
 =?us-ascii?Q?RY3e5DtVshnAI3q2PbuXfPKQSDAMY97gymobW4tNViFeilWl/kwFqfobiCXF?=
 =?us-ascii?Q?F+DPwVldZuIfXf6+FYl4VIk8FOjCEUFxPf5jVlAY+iJjEwx+p0xaulMksoXg?=
 =?us-ascii?Q?w3kNenqT83y5nMtKwsoXMcIn7Bqv98Rz4g1Zf/vWQzh6mtofgLKIoXoV+CZZ?=
 =?us-ascii?Q?If+pCP2RGcT/WPXSobMHy+/KCTMQtavAb7A/WGdkB2BiHNzrXNAJ0FIBTcKk?=
 =?us-ascii?Q?qzxk8w3QBasl9kIghGiOXVVnNzTOt5tBUIm4yIMgnYd62IsqOICqzkOGCg4R?=
 =?us-ascii?Q?X6HF5nuDIR3wO5AUG/+LpwxAofTnm7eWq9nKETAwlI8ASugt9E2zABdCvLjC?=
 =?us-ascii?Q?7fbdQ19gCVSjhjR2bLZaUE/2XhFutQszZ85SkSFcyq9bdNu4ZFBbX3sIDNGO?=
 =?us-ascii?Q?NukFqlZzw0WpXWVNbYAL5pndLZbfdrmxMo3ivbdTnq9zPTgSk4c3oERBqyb6?=
 =?us-ascii?Q?sX+SniNNMeNRrOLhIZj/ezW/fEO3wcw7RXXkGxUeEgEkJeH1IgqZpySsK1H3?=
 =?us-ascii?Q?LNo6bEmekqnCisld88OdxAXxTJTA4PaP+1iEHFUuZhLhDyPqIhV9sAxo6g7t?=
 =?us-ascii?Q?Pwj1ibMv/lI1L4XbubzTSbth0Zd2YqYL0v0PLDynw4eNx0JtqvcNUnrkbtpm?=
 =?us-ascii?Q?fom9Wu7SnF1x84j/Yy3jkFtF+ZUDAKGNgKYv2JYZk0vwe0WUKCFQSIGJoQsE?=
 =?us-ascii?Q?p8F/1X9r512Lq5SrbDazjZ52BEhyBO3ZI0VuWiup2mh1atlF7i6BfnGpN6l2?=
 =?us-ascii?Q?RHW/HzQgEqjJCNcVoOYI6FsazicXHUb2ZcYQpcNRVAUY79kvaHtF1ZRyHPvd?=
 =?us-ascii?Q?+cdNGE2knCiIVXIOOCWWePzvYIpunjXhRju4KY7EbTC4SRwyWJKS+8FT9hk1?=
 =?us-ascii?Q?PUZnCuBl0iAtRI7rDjOd3Bs5epqXWvcD8dQzAZUrSb+hY/k24cFZg/DVeuQU?=
 =?us-ascii?Q?56DfLdvZhyZkjLVoegIL27tA5YiVYGcRaq4KeM7vG4tHw+1OLZ7Ngz+fNufU?=
 =?us-ascii?Q?8AItJYqIfUqgYdWjPXqI3v8qtXckQel2NSl5pZEF9BqWKn2B2WC3u0WututO?=
 =?us-ascii?Q?n0OypU8iZtHC9FD3GmJTntC8J8QYjnDUWa95NplIoVQ4DJepyiYaAcJINX2Z?=
 =?us-ascii?Q?YTzVwDpQVH9uoZwk92aKR5t5iaDj6yzEEIBqNtVz33bPmG4c/RSyhpxXDO0P?=
 =?us-ascii?Q?fYfMtgFO0MjyeuJGHVLhlHtepZAYiCesR4QHlmnhzpYdpENXDPg60s/B5Sya?=
 =?us-ascii?Q?c+D2h+Pr2nIQtG+6+5UDz7WNceLhU8c+vrnwoNA4ys99uAEBCGxmFXc46gle?=
 =?us-ascii?Q?+WE8/ABV++6uWhqub88osERkoJW4a/FGRs8rIHA4qXZZV11Np9PYtgnEnIDj?=
 =?us-ascii?Q?1NxwMGKf5Xldcpg+JQYKNXv5yX+OWhdJhlyJDC0jsWDe36bhQ1gX7PETWuGD?=
 =?us-ascii?Q?rufWagaHdvSuuonN+WMoCFIkLG/QLxIVjwcM2lUI5uz1YTP5XHJiWXRWhioH?=
 =?us-ascii?Q?lNJbWLGGU3Id0CkVv7Ul7dg1fiHLLb4BvsVw0Pi6aF38kQE+UrlDCB95/f3W?=
 =?us-ascii?Q?gk51Vwo+Yc71qNvzr9WVJDa3szIveI2+ffH6pUx+xMh1JTbDfe1k?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa45a40b-fe88-4ab1-427a-08df0906c68f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 15:28:01.9376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zR54ujnue8h0BmRZ5RWhULLxdPagzQOTgflbEmenqhpqYCITrQvFxXe+uPOAvAYeLGUXW0hgmaZMKoSUjdDvbr0H+fK+Iyn4xynkiN/ogZ8SdaRDMBs5ZgMyxyGv9t40
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB910871

On Wed, Sep 02, 2026 at 04:23:53PM +0200, Ernest Van Hoecke wrote:
> On Fri, Jul 24, 2026 at 09:59:27AM -0500, Frank Li wrote:
> > On Fri, Jul 24, 2026 at 03:41:59PM +0200, Ernest Van Hoecke wrote:
> > > On Thu, Jul 23, 2026 at 02:30:07PM -0500, Frank Li wrote:
> > > > On Wed, Jul 22, 2026 at 06:15:50PM +0200, Ernest Van Hoecke wrote:
> > > > > On Wed, Jul 22, 2026 at 09:43:37AM -0500, Frank Li wrote:
> > > > > > On Wed, Jul 22, 2026 at 12:59:14PM +0200, Francesco Dolcini wrote:
> > > > > > > Hello Kieran,
> > > > > > >
> > > > > > > On Wed, Jul 22, 2026 at 11:30:29AM +0100, Kieran Bingham wrote:
> > > > > > > > Quoting Ernest Van Hoecke (2026-07-22 10:27:32)
> > > > > > > > > On Mon, Jul 20, 2026 at 02:16:46PM -0400, Frank Li wrote:
> > > > > > > > > > On Mon, Jul 13, 2026 at 05:06:27PM +0200, Ernest Van Hoecke wrote:
> > > > > > > > > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > > > > > >
> > > > > > > > > > > Add device tree overlays for the Toradex OV5640 CSI Camera on Verdin CSI_1.
> > > > > > > > > > >
> > > > > > > > > > > The default overlay describes the current CSI Camera Set 5MP OV5640 with a
> > > > > > > > > > > 27 MHz on-board oscillator. Add a separate 24 MHz overlay for the legacy
> > > > > > > > > > > camera module.
> > > > > > > > > > >
> > > > > > > > > > > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> > > > > > > > > > > Link: https://www.toradex.com/accessories/csi-camera-ov5640
> > > > > > > > > > > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > > > > > > > > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > > > > > > ---
> > > > > > > > > > >  arch/arm64/boot/dts/freescale/Makefile             |  6 ++
> > > > > > > > > > >  .../dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso  | 17 +++++
> > > > > > > > > > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtsi   | 78 ++++++++++++++++++++++
> > > > > > > > > > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtso   | 18 +++++
> > > > > > > > > > >  4 files changed, 119 insertions(+)
> > > > > > > ...
> > > > > > > > I think with the Toradex ecosystem there would be some value in
> > > > > > > > supporting or helping with the ongoing dt-connectors or dt-addons topics
> > > > > > > > so that we can abstract the hardware which is being 'added'.
> > > > > > > >
> > > > > > > > I think it's important that we tackle the problem of combinatorial
> > > > > > > > explosions of overlays when we can add a component to multiple
> > > > > > > > platforms.
> > > > > > > >
> > > > > > > > For example, your OV5640 camera could be added to many different boards
> > > > > > > > - and each board could have many different cameras - in different ports.
> > > > > > > >
> > > > > > > > We should not be copy/pasting overlays for each combination, or we'll
> > > > > > > > have 'thousands' of identical overlays.
> > > > > > >
> > > > > > > I see your point, and I agree that it would be valuable to move this
> > > > > > > topic forward. I will raise it internally at Toradex and see how we can
> > > > > > > contribute.
> > > > > > >
> > > > > > > At the same time, quoting Marex (https://lore.kernel.org/all/dec2a7f6-80fd-4692-8936-969f8837a555@nabladev.com/):
> > > > > > >
> > > > > > >  | DT connectors have been discussed for the last 10 or so years and three
> > > > > > >  | is still no real progress.
> > > > > > >  |
> > > > > > >  | I would be happy to send a follow up patchset which would convert the
> > > > > > >  | DTOs to whatever connector implementation format lands in the future,
> > > > > > >  | but I am concerned that waiting for DT connectors will block this
> > > > > > >  | patchset from landing for a long time.
> > > > > > >
> > > > > >
> > > > > > I do quick check for ov5640, we can use partial connectors, which already
> > > > > > in kernel tree.
> > > > > >
> > > > > > use duplicate label like
> > > > > >
> > > > > > in mainboard
> > > > > > csi_io_i2c: &i2c3 {
> > > > > > 	...
> > > > > > }
> > > > > >
> > > > > > csi_io_regualotor_3v3: ....
> > > > > >
> > > > > >
> > > > > > csi_io: connector_csi {
> > > > > > 	compatible = "...";
> > > > > > 	gpio-map = <0 0 &gpio1 3 3>;
> > > > > > 	...
> > > > > > 	irq-map =<0 &gpio1 4 1>;
> > > > > > 	...
> > > > > > }
> > > > > >
> > > > > > in 5640 overlay
> > > > > >
> > > > > > &csi_io_i2c {
> > > > > > 	camera@xx {
> > > > > >
> > > > > > 		reset-gpios = <&csi_io 0 ACTIVE_HIGHT>;
> > > > > > 	}
> > > > > > }
> > > > > >
> > > > > > https://lore.kernel.org/imx/AM9PR04MB8353AC7DF91C5F73C34019E0E3F72@AM9PR04MB8353.eurprd04.prod.outlook.com/
> > > > > >
> > > > > > Only clock part have dependence. other parts. I am working mipi dsi for
> > > > > > display, almost work except panel show have some problem, which is not
> > > > > > related with connector.
> > > > > >
> > > > > > Frank
> > > > >
> > > > > This is very interesting and I agree with both you and Kieran that it
> > > > > would be great to abstract these connections away and kill the need for
> > > > > so many variations.
> > > > >
> > > > > Certainly I will read up on this and spread it internally as well.
> > > > >
> > > > > That said, since there are still unresolved dependencies, I am not
> > > > > convinced that we should already head this way with this series. It
> > > > > supports hardware that exists today in the currently standard and clean
> > > > > way.
> > > >
> > > > Your ov5640 have not such dependence. You can try connector firstly.
> > > >
> > > > display most like can go through connector, (I remember pwm already
> > > > supported, but not sure).
> > > >
> > > > others continue go through old method until dependence clear.
> > > >
> > > > Frank
> > > >
> > >
> > > The ov5640 still requires a clock nexus which is not merged yet.
> > >
> > > I have been playing around with it locally now and find the work here
> > > very interesting. Certainly this is also useful for Toradex and I would
> > > like to use it to reduce duplication.
> > >
> > > We will repeat this work for the Verdin iMX8MP. So I see real value in
> > > using these new mechanisms to map the GPIOs such that the Verdin ov5640
> > > overlay can be reused. However, this would also require a new binding
> > > for a "verdin_csi" device.
> > >
> > > Therefore, I could consider dropping the ov5640 overlays from this
> > > series and sending them as a follow up with the partial connectors
> > > support. But I don't want to block the series from getting merged for
> > > this non-trivial effort.
> > >
> > > If we go that way, I wonder where the verdin-ov5640 overlay should go?
> > > We also have Verdin modules with a TI SoC, with the OV5640 overlays
> > > already merged, that could be refactored. Those live in ti/, not
> > > freescale/. Do you have any input on how we should deal with that?
> >
> > 1: need make both work by duplicate overlay source file, which under TI
> > and freescale.
> > 2: try to create common dir, and merge two file to one, which may need
> > involve both TI, freescale and Soc maintainer to discuss where to put.
> > the discussion start utill real case happen. This one may first real
> > user case.
> >
> > >
> > > Personally I am still more in favour of merging now and refactoring with
> > > our next series for other SoMs, but I understand the desire to start on
> > > this now so there are more consumers of this new behaviour.
> >
> > I suggest use this 8mm ov5640 as start, you can refact other later step by
> > step.
> >
> > I can increase this part review priority.
> >
> > Frank
> >
>
> I've prototyped the GPIO nexus approach and confirmed that it works. It
> abstracts the sideband GPIO wiring, but the camera pipelines and port
> election remain SoC- and port-specific.
>
> So I could implement all of this, probably with a binding too (unclear
> to me as of now if a compatible + binding is needed or if we can just
> leave the compatible property out). But it would only enable sharing one
> overlay between the Verdin iMX8MM and Verdin iMX8MP. As you noted, we
> could do something like:
>
> imx8mm-verdin.dtsi:
> 	/* Verdin CSI_1 */
> 	verdin_csi_capture: &csi {};
> 	verdin_csi_rx: &mipi_csi {};
> 	verdin_csi_i2c: &i2c3 {...};
> imx8mp-verdin.dtsi:
> 	/* Verdin CSI_1 */
> 	verdin_csi_capture: &isi_0 {};
> 	verdin_csi_rx: &mipi_csi_0 {};
> 	verdin_csi_i2c: &i2c3 {...};
>
> Along with a nexus node to abstract the GPIOs used in both, and then
> have one shared camera overlay enable everything and define the camera.
>
> But on the Verdin iMX95 for example, the pipeline is more complicated so
> unless we find a way to set up more of the pipeline in the base DTSI, we
> would still need a separate overlay for it.
>
> On SMARC iMX95, for example, we would still require separate CSI0 and
> CSI1 overlays because they use different receivers, pixel formatters and
> ISI ports. And there is no mechanism to select CSI0 or CSI1 from an
> overlay, that would need the proposed generic connector concept, not
> just these nexus nodes.

yes, now we have to use two overylay, one for CSI0, one for CSI1. In
future, nexus node support apply overlay into specific connectors. it will
be child node under connectors. csi<n> can be choosen by connector.

But now it is okay by use two, (one may shared with others). at lease,
we can reuse some.

>
> My current thinking is that this is not worth implementing as we don't
> really gain much. However, it is clear that connectors would be hugely
> beneficial. I propose that we drop the idea for this camera overlay,

we can handle case by case.

Frank

> unless you see a real maintenance benefit, but we work on the connector
> topic to hopefully get rid of this combinations explosion in the future.
>
> We are continuing to work on connector infrastructure where it provides
> a concrete abstraction, including the LVDS nexus work and the related
> GPIO/PWM fw_devlink fixes. [1]
>
> [1] https://lore.kernel.org/all/juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4jbauradujrre@gc5nbdhhixaf/
>
> Kind regards,
> Ernest
