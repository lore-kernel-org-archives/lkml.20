Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013054.outbound.protection.outlook.com [52.101.83.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECD639EF12;
	Wed, 23 Sep 2026 14:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174500; cv=fail; b=XkAaronqXGQnjwxrZb7D2xPMT2rjYF7Tcu4Vx30wpcw0RvJrNoS6AYESoNKRVelEzFjzfFsCgog+LO0hjdCeMZnKtnYOk53Zl0s0aBp+eG9VKqmHVguAgy/DZ6n/Fgd8BeDSlN/X7bDn3pvFa+H5naV13SEP5BpSrpFyCP/A/w0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174500; c=relaxed/simple;
	bh=awTqcA4r+tzuPVVefPjXQSKrxKb3zcIR/l/mg6j885k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CGHbmEpeTKeJNzNSxUauZC9poqEWu1pX8ZizGdZkyxUz6w5aykpR0hhyzq5WdD2dIcfaFbsBays9h7MowG45lTwCSWaa98J1pjTUIAZUnMS5Usq1D2ohtVqhcDnS5nYW8s4R+SkN6dLZqc8xaDTppkefFgeWyLHyxVHm0nnNfkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FtWwibzG; arc=fail smtp.client-ip=52.101.83.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FtWwibzG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vwqDGBPQo97iSeuBtn0bw2iZ1tInzgio3z8r2dwJiOqnWEoVIBM24nkREfsXslGKu0TB+uQZhocJkhIyH0WP+RYU9Cwiyjv3r2cdwUFxUbCA0wIZDD15LV9FnXpQkKqbmz29fzJMg3cYydUhqQw99NZoMQzUSAjy7QQk4bt2IaurkD4PruPCRildIdVZ4Ze9I5RFCWZmpoCdnU/KwWXwPUW8jw5DFQYJi2vxeJ6UEluQnHAvFpWNimGoUvTvFEbqIkoiuRqCUrILKYPd4jyK25zts7qmM9e5uyXNUCY655RGf+lv+gfSYW5igjPlW5FCORC5k2Tq1F8g7++kC0Qdkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4/g/rDlwDnuQIQlqu7uObX/HIoqfM7S1NqKSnqnO9Y=;
 b=cZkrw3m+vohhY5bjNQfLyNkR+77KeoU463imi6cjIdqm84CxbOpI1EWAzNWMxsXWuMm8kLVfU0pZ4ybxCs6QM0g9bfVxYHmoRAqNYGwiIs6AN2GzlSQwuanlFY87nLngUH7rgySb3LWgaS2ihC27+yWZEWD6Ixkqljl6Va31rpMjih17Ul22RUoBeTMbjCAdB7IvvsUlQTQbxRT/n3uD96MgQ4YF8d/X3rjvgIfVDGDG4TWpckgH4i2SAIaPGOSV0+9C5l9/ZT7ZK1VO4lg/lvTh9UZuf0dwEtaB6xCYfHUIHU8IxfSX7m+pIstYS5fbzJBFhv+r0nBDDcALPNRdZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4/g/rDlwDnuQIQlqu7uObX/HIoqfM7S1NqKSnqnO9Y=;
 b=FtWwibzGCzxcFPjgGXF8p1Oqac30o4ORc2r/CUOgflnxRIZ6KVtDqx5f6ENKidiWAkhoC6huPoEUREuT9vB0U+MAER98wHEDRLfyhUSVB/xIsmo2xT8feUJlVBdTv/dhyhzOjp/rcNkcOmEnR1gYLqgbYTsB6UAVbi64VOSjumed3QDyPsmDs2D0xufATISiDZ9Ba8jW/08afHk21X9oOORbBray6oYLOIMm7VafBWQZ6c6fDGaPYOKsHCxeIq3D3Lt8a6CgUYkwP5gcFzH6gdCpUc7vgTGHgZumlaAEjb/0NCc1unga6r9+POKFwL+kFM8UthMFS8IMQwjknA20yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMZPR04MB139570.eurprd04.prod.outlook.com (2603:10a6:20b:7c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 14:41:34 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 14:41:33 +0000
Date: Wed, 23 Sep 2026 09:41:24 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>,
	Shubham Patil <shubhamsanjay.patil@amd.com>,
	alexandre.belloni@bootlin.com, Frank.Li@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH v3 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
Message-ID: <arPlFMhcL7Jxh4wP@SMW015318>
References: <778da629-2f23-412b-885f-e87827ce2b5c@amd.com>
 <20260922-ethics-flap-9760347e869d@spud>
 <20260922-bullpen-reprise-f62e01922d88@spud>
 <20260922-immersion-salvage-00450539f1ce@spud>
 <arKr-oapsl5qzo_E@SMW015318>
 <20260922-purple-overnight-2cdd2ddd5270@spud>
 <arLKWE1tJrKnzGdp@SMW015318>
 <20260922-unadvised-stalling-5cbeff8f982a@spud>
 <arL_Zgi1r1IFpNIO@SMW015318>
 <20260923-overturn-acts-5abc2e4fe6ed@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-overturn-acts-5abc2e4fe6ed@spud>
X-ClientProxiedBy: CYZPR20CA0002.namprd20.prod.outlook.com
 (2603:10b6:930:a2::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMZPR04MB139570:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ebde032-a533-4a3b-47d0-08df1980c36d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|19092799006|366016|1800799024|4143699003|56012099006|11063799006|5023799004|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	PQ9hS9Z/hYqJqqU6sqIYoN+aXcZfJMhdtVL6C8uMkaBqyw4/xov7ENrdwMhck8sFZFaW5HrnrUb3t0rLLbAk/CRWdYoEhWlunjDl9EMnXdbcHoyyjYTcVTNtEw1NQKNN2xgCT/nj0ZolfBdEb+pQShoMsqO/o+bf16UFhSTnBSWjjP1tCVELhKbmWL/8yNKNkHqBVidapfD314exDKGEw5Cperd+PexzxZpCuWTgeueeJkhBiKYsSV06oidO+IKZ/4l9tZedUHseYrp62BSaB2pCR2CLJF+r47KzKpAcbGsfubj64HyvaF1iZ0XeWVPtO5Qglov7LHG2QMbIRpdgVY1/NEtK7VaxMQg96sizwqZcWbSlMqAxqVnT69HKRLsbAWqn1JwCjnTy+XfGlbHVSMt+K1HrZQS/sJAwpk2TBfy/P1K0aZ5knKzZfBTN6nMV6kxoK8wKlieiU6r5uYj/FtZ19hAfKmQ9ZJ5DJLz3N2AkY168UEmcrDTcPPdtPFnGBh6rIwiFSEMCvaWrT/LT21zBKnTNje8Q7Y9AVy1gORLFF5EaY0vO+7xK0ct/8plcJsx4dzfNj1hP18N8t/6biU0gLh4p4BicSCvEi+HiCQo9AJSKX6nYKUP4MNw4owgj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(19092799006)(366016)(1800799024)(4143699003)(56012099006)(11063799006)(5023799004)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jlXeaFDIPQlt+zP0bfx4NGPrvnhXVCwsAl8iGfthlACkPgHZIHiBOnmBQpor?=
 =?us-ascii?Q?MJiZ/Psbu6HX10sTtHWg+Uxa1OBN5j1K9Ti+zFosBnR3AHl1n1hDAPlaRU17?=
 =?us-ascii?Q?vPoXmYeCWwvb4Spg8OYqnoAjVb7h7/KOzOBzgsQ51PR3xTGEPbFFExM+vCgV?=
 =?us-ascii?Q?cwKNjyqqFThuebMWoMb//keqXBzzePQvkfjmMVndutg3LLh4Ttdx7+Rspibn?=
 =?us-ascii?Q?jZstvTK2BcZ74RbCwM794hi7QLuV8IFt8off1hB2aNvCnGd9Mf5KD99ebVda?=
 =?us-ascii?Q?+46QDpreUZ18oVQvUg/oyuYndOSLet4j0W98UFIOEWPWjOaKtxsF+HqX5mHB?=
 =?us-ascii?Q?l02BHqEwFukkZBxIO8poA8xql6K5WmMrlTvteQFCAIse8hE0N5hS7Vyx/sca?=
 =?us-ascii?Q?UiXtqyQBkLlIZ3DteDnYZK/ULQoEpQPlydfIsobji/UVOVCluGTL62eYmu53?=
 =?us-ascii?Q?C3ke89DwwKPY9p6IprDWRAtrbEkG3PtEdY72YPQu3dFfGIxcgNtWZShfy6jT?=
 =?us-ascii?Q?2nLEufPdDqRk7lh2iQ/5M5RL+huOX0JPdU5h6y+hF92xW8o21rESzK1YMycA?=
 =?us-ascii?Q?9XMU1vxXeNIW/hZeL832qZMVXXXHg73dOYl4Lkzx6o9H1ucJIw2mW5Sf/cjO?=
 =?us-ascii?Q?WAP+EukJxXzatB2m5dpIq6TMR3Wk01C7rf5m/kyrL/7V/O6j4xrpNQY8PWeW?=
 =?us-ascii?Q?ejubsicFj3/EOvptxCCB09CaGxj5JpfJ2n6jr4N9v3a+wiYmHN0OJApkjw14?=
 =?us-ascii?Q?ltMckEfQOMaqD3nNNwzkqfCOhysaHf3aVs+SxM4eDRTMLhZn747IBLkq2mz9?=
 =?us-ascii?Q?bHB+5RD0SlI/Y3g0fHliAJvtjGjV+0zVIquHZPhwVQC4IPDtQt+P6cBrK81a?=
 =?us-ascii?Q?QYUK0YfaglMRFIz2dGFH4IJWU7R+H7kl+m7mRXnHEG5x33VMAJm3VU+MS2uR?=
 =?us-ascii?Q?4DvZwdJUSyN3Hm5TLJG638RO28fCtHe2LiuifTxYiM0Ifg+cqjjIFb+exOQk?=
 =?us-ascii?Q?BLSBtqUeCvsUIyUucvw2AgcfLnErj0g+TomGVykn+hFxLj6TnHfegOITjgOe?=
 =?us-ascii?Q?QRH/UGM9mTSPmVY+wbxOZwXuzlcQ5CsJBR7XZtWXHzIuiyQ8rhweaZ/NgyVd?=
 =?us-ascii?Q?7W8RfIKXjmbK7icZ24Sip7s2tx1+C/i1ETXKUepDH6sqOg4+086JVyXHidNA?=
 =?us-ascii?Q?lwlFKtxBXw+JDWi/3sZX17SbKruTJ4TNQITgYfugg27p5lHjq59QBoAkXpVU?=
 =?us-ascii?Q?uZ3yLHlRaawJgG7lYuQhw3FftLW6St3s8B6nak0sy6HxEX9KS0E7lCxPTdnF?=
 =?us-ascii?Q?Myo6FHxmlYvqgWBpormKIbEOP9gZTCoYOxzdh2GVMcTAlpXzfe2LJ74i2pp/?=
 =?us-ascii?Q?P26UDMmycOtL7X2QIIEpw49eLeK5Tbeb3ApceHT/8DM8P5ngdPdQgd2BSrRS?=
 =?us-ascii?Q?hLvJ1DAXvh9Nup4cZ4ne/r1eLJWKMeV+0ZsNPcmk2GOwpsDKQMX+T5LZvywm?=
 =?us-ascii?Q?D7FWcRGojP4AMaxoljZ7sYgZdpNRtSPLQU471Wij9pRUfqqBujIBZSnOIi5Z?=
 =?us-ascii?Q?/HDVjY6UkmFfNyKXPHTjuClbiiHKIgutaMLDKElsEdtVToXhHTUAT3cLeBVq?=
 =?us-ascii?Q?YAniljC7PN2J0ROAdrIdlauEYZN0CFQkS5Q0ij8/x/uvexOtwSPJtU8SW5wL?=
 =?us-ascii?Q?D60f9IXY9K0IVjtLCE/w/u9LM+rrOW2IUwfe1YH1wOwhNIGUTBF+QcGKB9s8?=
 =?us-ascii?Q?AIBNlRb2lcNBd7H8rM8lZmIlebBYgAeBUoWMtaHuayqc3TVEN39d?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ebde032-a533-4a3b-47d0-08df1980c36d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 14:41:33.8047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pfHiCBwubjgIb6kceoTLoW2NvVXrSd8g6dO/v/WACTSAeXoRMDesZ8cIc1ZdgLgCnJJedqOQRFjliWClF7heDf6/iAXvoK/c4MwEbUbcgRPFBB0G3XsbiBCZXLsAvo6o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMZPR04MB139570

On Wed, Sep 23, 2026 at 12:43:22PM +0100, Conor Dooley wrote:
> On Tue, Sep 22, 2026 at 05:21:26PM -0500, Frank Li wrote:
> > On Tue, Sep 22, 2026 at 10:29:31PM +0100, Conor Dooley wrote:
> > > On Tue, Sep 22, 2026 at 01:35:04PM -0500, Frank Li wrote:
> > > > On Tue, Sep 22, 2026 at 06:24:52PM +0100, Conor Dooley wrote:
> > > > > On Tue, Sep 22, 2026 at 11:25:30AM -0500, Frank Li wrote:
> > > > > > On Tue, Sep 22, 2026 at 10:39:23AM +0100, Conor Dooley wrote:
> > > > > > > On Tue, Sep 22, 2026 at 10:38:17AM +0100, Conor Dooley wrote:
> > > > > > > > On Tue, Sep 22, 2026 at 10:33:44AM +0100, Conor Dooley wrote:
> > > > > > > > > On Thu, Sep 17, 2026 at 01:23:19PM +0200, Michal Simek wrote:
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > On 9/10/26 17:44, Frank Li wrote:
> > > > > > > > > > > On Thu, Sep 10, 2026 at 12:36:45PM +0100, Conor Dooley wrote:
> > > > > > > > > > > > On Wed, Sep 09, 2026 at 11:21:41AM -0500, Frank Li wrote:
> > > > > > > > > > > > > On Tue, Sep 08, 2026 at 06:54:31PM +0100, Conor Dooley wrote:
> > > > > > > > > > > > > > On Tue, Sep 08, 2026 at 03:12:55PM +0530, Shubham Patil wrote:
> > > > > > > > > > > > > > > In-Band Interrupt and Hot-Join are synthesis-time options of the AXI I3C
> > > > > > > > > > > > > > > IP. Describe them with two boolean properties.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > A Hot-Join request is acknowledged by the IBI machinery, so a hot-join
> > > > > > > > > > > > > > > capable design is always IBI capable as well. Both events are reported
> > > > > > > > > > > > > > > through the controller interrupt, which is therefore required whenever
> > > > > > > > > > > > > > > the capability is present.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> > > > > > > > > > > > > > > ---
> > > > > > > > > > > > > > > Changes in V3:
> > > > > > > > > > > > > > > - Move in-band-interrupt-capable and hot-join-capable into the common
> > > > > > > > > > > > > > >    i3c.yaml schema and drop the xlnx, prefix.
> > > > > > > > > > > > > > > - Keep dependencies in the AMD binding.
> > > > > > > > > > > > > > > - Update the commit description accordingly.
> > > > > > > > > > > > > > > - Conor Dooley acked v2 with the xlnx,-prefixed properties in the AMD
> > > > > > > > > > > > > > >    binding [1].
> > > > > > > > > > > > > > >    That Acked-by is not carried here: the names lost the vendor prefix
> > > > > > > > > > > > > > >    and the definitions moved to i3c.yaml after Frank Li's comment.
> > > > > > > > > > > > > > >    [1]:https://lore.kernel.org/all/20260824-tightwad-impose-495476599087@spud/
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > I disagree with Frank. These properties make sense for Xilinx because it
> > > > > > > > > > > > > > is an FPGA IP and synthesis options impact this. For other devices, this
> > > > > > > > > > > > > > should be determined from the compatible.
> > > > > > > > > > > > > > Please revert to how things were done in v2, especially as no rationale
> > > > > > > > > > > > > > was provided for why these should be common.
> > > > > > > > > > > > >
> > > > > > > > > > > > > It is common problems, when IP intergrate by SOC, which may defeature some
> > > > > > > > > > > > > part, It is not appeared now just because IBI and HJ have not enabled
> > > > > > > > > > > > > widely.
> > > > > > > > > > > > >
> > > > > > > > > > > > > IBI and HJ is optional features of I3C. Ideally it should be indicated by
> > > > > > > > > > > > > some registers. But not all vendor implement provide this CAP registers.
> > > > > > > > > > > > >
> > > > > > > > > > > > > IBI and HJ depend on some slow clocks, which monitor SDA line change.
> > > > > > > > > > > > > Some instances of IP may not have such slow clocks. Some IP's IBI and HJ
> > > > > > > > > > > > > use seperate IRQ line, but these irq line may not connect of difference
> > > > > > > > > > > > > instances.
> > > > > > > > > > > >
> > > > > > > > > > > > All of this should be able to be dealt with by appropriate use of
> > > > > > > > > > > > specific compatibles.
> > > > > > > > > > >
> > > > > > > > > > > I understand compatible can cover most cases. Need variance for property.
> > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > > like previous SPI vendor customized property, we takes efforts to convert
> > > > > > > > > > > > > to common one and also meet back compatiblity problem at convert. I don't
> > > > > > > > > > > > > want to do it again. This kind property is most likely as below.
> > > > > > > > > > > >
> > > > > > > > > > > > What SPI controller specific properties are you talking about here?
> > > > > > > > > > > > There are relatively few properties in spi-controller.yaml, and none of
> > > > > > > > > > > > them deal with these kinds of capabilities.
> > > > > > > > > > >
> > > > > > > > > > > num-cs vs fsl,espi-num-chipselects. Total number CS of IP is fixed, but
> > > > > > > > > > > some instances have not route all CS to pad.
> > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > default: 	decide by comaptible string or hardware cap
> > > > > > > > > > > > > force-disabled: force disable for some reason, like, miss connect irq line
> > > > > > > > > > > > > or missed some clock, or IP bugs, or board desgin's some level shift chip
> > > > > > > > > > > > > broken IBI/HJ timing requirements.
> > > > > > > > > > > >
> > > > > > > > > > > > Of these, only the last would be a valid reason for having a property
> > > > > > > > > > > > for it. Missing interrupts, clocks or IP bugs should all be dealt with
> > > > > > > > > > > > using device specific compatibles.
> > > > > > > > > > > > If board wiring causes the breakage, the property may be more
> > > > > > > > > > > > appropriate at the i3c device level rather than the controller given
> > > > > > > > > > > > that wiring to some devices on the bus may not have the problems?
> > > > > > > > > > >
> > > > > > > > > > > I3C.yaml is for both master controller and devices now. I3C is bus, which
> > > > > > > > > > > connect many devices, if wiring issue, whole bus can't support IBI. And
> > > > > > > > > > > if any broken devices happen at address arbitation, whole bus can't support
> > > > > > > > > > > IBI.
> > > > > > > > > > >
> > > > > > > > > > > at beging, I suggest 3 state,
> > > > > > > > > > >
> > > > > > > > > > > [default, enable, disable], but now I think IBI_broken, HJ_broken is more
> > > > > > > > > > > reasonable to disable it, default value should be set by compatible
> > > > > > > > > > > string or DCR of I3C regiser.
> > > > > > > > > > >
> > > > > > > > > > > And some I3C device may be failure to work with IBI even DCR of I3C register
> > > > > > > > > > > show it support IBI.
> > > > > > > > > > >
> > > > > > > > > > > I don't want to appear two similar property between vendor and common, like
> > > > > > > > > > > num-cs vs fsl,espi-num-chipselects.
> > > > > > > > > > >
> > > > > > > > > > > such as IBI-broken can be used for controller and devices case.
> > > > > > > > > > >
> > > > > > > > > > > > That said, I think that problem should be dealt with when it arises,
> > > > > > > > > > > > rather than starting a trend of adding capabilities properties at the
> > > > > > > > > > > > controller level when I am not convinced that there's going to be other
> > > > > > > > > > > > users in the same vein.
> > > > > > > > > > >
> > > > > > > > >
> > > > > > > > > > > Understand, I3C is realtive new protocal. 'IBI-broken' is more easy
> > > > > > > > > > > understand,  logically equial to in-band-interrupt-capable.
> > > > > > > > > > Conor: Any update on this one? I think this thread is stuck at this stage.
> > > > > > > > >
> > > > > > > > > I didn't think there was any need to reply. I took the first sentence of
> > > > > > > > > this snippet to be acceptance of what I was saying.
> > > > > > > > >
> > > > > > > > > If yous desperately want to have a generic property, the negative
> > > > > > > > > connotation of the "-broken" is probably better in that it'd be more
> > > > > > > > > likely to make people set stuff by compatible rather than have to use a
> > > > > > > > > property with that word in it.
> > > > > > > >
> > > > > > > > That said, technically this platform could be both
> > > > > > > > "amd,in-band-interrupt-capable" and "ibi-broken" at the same time, since
> > > > > > > > one describes the way the IP has been compiled and the other wiring. I'm
> > > > > > > > not entirely sure whether conflating the two is possible? Depends on if
> > > > > > > > your IP's programming model changes if the option is enabled even if it
> > > > > > > > cannot be used. Not beyond the realms of possibility.
> > > > > > > >
> > > > > > > > Also, ibi-broken doesn't work for your platform, since the default
> > > > > > > > before this patch is no ibi and requiring a property for no ibi would be
> > > > > > > > an ABI break.
> > > > > > >
> > > > > > > The perils of FPGA IP I suppose, and not being quite careful enough to
> > > > > > > document all of the relevant options from the start. Been guilty of that
> > > > > > > myself.
> > > > > > >
> > > > > >
> > > > > > Check impliment code
> > > > > >
> > > > > > +       /*
> > > > > > +        * The interrupt only carries IBI events, so it is only described for
> > > > > > +        * designs synthesized with that feature.
> > > > > > +        */
> > > > > > +       if (master->ibi_capable) {
> > > > > > +               xi3c_master_init_ibi_ops(master);
> > > > > > +
> > > > > > +               master->irq = platform_get_irq(pdev, 0);
> > > > > > +               if (master->irq < 0)
> > > > > > +                       return master->irq;
> > > > > > +
> > > > > > +               ret = devm_request_irq(master->dev, master->irq,
> > > > > > +                                      xi3c_master_irq_handler, IRQF_NO_AUTOEN,
> > > > > > +                                      dev_name(master->dev), master);
> > > > > > +               if (ret)
> > > > > > +                       return dev_err_probe(master->dev, ret,
> > > > > > +                                            "Failed to request IRQ\n");
> > > > > > +       }
> > > > > >
> > > > > > They can use master->irq is determinate if support IBI.
> > > > >
> > > > > That seems viable. Where does that leave them for hot join though?
> > > >
> > > > No reason to keep hj because the difference between HJ and IBI is the
> > > > address when address arbitration. If hardware support IBI, it should support
> > > > HJ. HJ just use special address 0x2.
> > >
> > > For this IP, they appear to be controlled by different configuration time
> > > parameters, so I don't think conflating the two is the right thing to do
> > > here:
> > > https://docs.amd.com/r/en-US/pg439-axi-i3c/Configuration-Tab
> > > Per this doc, and the original commit, hotjoin configuration is not
> > > permitted when ibi is not supported but can be enabled and disabled
> > > separately when it is.
> >
> > I am not sure why provide such flexiblity, only difference is that compare
> > address 2 or other value.
>
> It's not unusual for FPGA IPs to provide extreme flexibility so that the
> consumption of resources can be kept to a minimum, often to the point of
> excessiveness. E.g. for a ethernet MAC IP each individual statistic might
> have a configuration option.
>
> >
> > This feature may be quite common for i3c, if other soft IP provider such
> > flexiblity, still common property is the better than vendor specific one.
>
> I'm not at all in favour of speculatively adding properties for
> configuration properties of FPGA IPs, particularly given the likelihood
> of abuse by others. Without multiple demonstrated users, things shouldn't
> be considered for being made common anyway.

Rob:
	What's your opinion? I predict we will met similar problem when
I3C become popluar.
	Do you perfer use vendor property fistly or direct add common
property?
	There will be back compatible problem if change vendor property to
common property.

Frank
