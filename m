Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011012.outbound.protection.outlook.com [52.101.70.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65870491581;
	Tue, 22 Sep 2026 18:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102121; cv=fail; b=LMU11s/w/EC90uVO//rDx9ypZ8zrOjCzl/foCg/TPD/Gh5PWTLWR/S8YDvHDCeQpqQrHsbOoI8l4EYCh/CWXKDm5mgBU4ywC2GPNrXGzuMhEuy1PxUKweekLD8YI19qcc0DwnCsVZXw6FxMz0f0otNtXNkTl7AJLBEqUxFYQHio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102121; c=relaxed/simple;
	bh=7edxS5yjABmV3AvftHW8142FX97HaX6/KbagBm8FJKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kxxJnLRP832wFWth9sZvu0myCKMBD5q70js3J4Qmau5MCK7oGG8Mt2xt0WHd/DI4U4Hvhb70DagHF3DcQ4WR05XnPKXbXhGQL3gzhTAjwml9rnIjRswX8VyH+a5b8hTIj0gFE1EhP6xIBMZAi0om0GZUOpi1uxaRJ19JsI8zdno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HNR0z+U1; arc=fail smtp.client-ip=52.101.70.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HNR0z+U1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sxOEniNFrHsTswCz8fA58f/E+hd3PRkfeZxGNsdiBWvO4cMg8xtbXgkGVyIHEMeNtx5ezEI04gBI82ja52aR5fXDSiwDMC8J2cxSDr0V+9RizSsnUYk9DX0c9aK6zW21yWhEFHBN+nzGOEPP7RWLELY3IOE1COdvdKzH3lK1ZyGU+hhfRNc9qLMlPuJlWfSt0NSwQK7xb1U3ohslDDp0U/h+E4omoEuDoZFEbth2/J0uOrFX9IjmyN5vW0kM9yLBiYcm6gcjHUm2/DOcBh/5aFiaM8c8Z9wGj6ceek2p2bgqrfbU7afk+N7r8xM9bQX8OM0oM2HxMG9j4twjpn73Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0sqVt5c5U17Sp3a8RCzRqiWKU0hSiE02ljgZrrJeBEw=;
 b=Oy1DX930Bi2DCazjqVko0IAdv00wxPMcGuKy2ut3J6koPIWyA62mPYW5XoBOPQUR9m+opRAMEjhHSf5OZIsQ0Vid3j3MvMtwzGYmk+ILmv+vNhwfnJ2wMX44X2MLwQRRoGytf+ZIqbbpVBFxjf7cn+fZQjl8eCY7kCCb0Su17EPBp3nTWc4sqa5/8bWLu5V7RfUnI4k2AQt0yZqQz+EFc/mtMfsdtqV1GC1M7NrVa0sWipYgdp4HChuYq6xdUfqVFSAUuFuONKHQM8Gb/gf4Em3ed0A5cr+ey7TdXF6X0mAAvJFaLIsCUege6WCzce9cvQB6+7j3y0HATyvA8PtRBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0sqVt5c5U17Sp3a8RCzRqiWKU0hSiE02ljgZrrJeBEw=;
 b=HNR0z+U1I3CgnoUG0bEL4F/446aVnJzwnYTGliCKh6Ovv43NvHW74dstP0k6WLS6iouiFT9SrJRTbB/0m+X8ykWXpya9y7GK+X3yLjyvZbcx76LXDtxayUr6dLMYzFJ7kK5CJz+1GYGi6Oo91hEVOTwdPybE0huQVUOVAtkgiDz3SX1NUdOtOvnej+VPDaLWTdFp6UL+bKa9LJw/19Wz+0gGyKcwNOmceoUMYMosop5ILKwmFIrxVZ6J5LCal6gm8AWSPQX5hIygGx1cYkXAkpe60kQ0liDPfqdnjy29jF1uO5U2+o3wlhkrio/Hl359NrKff70O1nftbjvWd6VA0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8532.eurprd04.prod.outlook.com (2603:10a6:20b:423::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 18:35:14 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 18:35:14 +0000
Date: Tue, 22 Sep 2026 13:35:04 -0500
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
Message-ID: <arLKWE1tJrKnzGdp@SMW015318>
References: <20260908-groin-undivided-0af701135404@spud>
 <aqGHlWpQjpHEft3j@SMW015318>
 <aqKWTT47S_zPzvbN@squawk>
 <aqLQaHndX4t1kKLG@SMW015318>
 <778da629-2f23-412b-885f-e87827ce2b5c@amd.com>
 <20260922-ethics-flap-9760347e869d@spud>
 <20260922-bullpen-reprise-f62e01922d88@spud>
 <20260922-immersion-salvage-00450539f1ce@spud>
 <arKr-oapsl5qzo_E@SMW015318>
 <20260922-purple-overnight-2cdd2ddd5270@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-purple-overnight-2cdd2ddd5270@spud>
X-ClientProxiedBy: CY5PR17CA0005.namprd17.prod.outlook.com
 (2603:10b6:930:17::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8532:EE_
X-MS-Office365-Filtering-Correlation-Id: db4b75c1-26e3-4506-9129-08df18d83dbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|19092799006|23010399003|366016|3023799007|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003|4143699003|5023799004;
X-Microsoft-Antispam-Message-Info:
	3+RqLAPgkPOVedv2U6HMzGSxmFI0WTkRGOxdms3QqMHAu8yIXYnimP9rogJbaXdxiB8zVMhHvbiDCeaplq9inIh+5AjGsPLsvRJeGFwK0Hj0egafsqhQjBPV45F+PECTL1XXh7X+MWLMBa+a3xPSAPDO/crD/LYv2GXWUpTl60pBpWGZ8DoUPrDYWCZQksa/rXltwYTVLOv2sYf3B0hdOBsPWBD3WK4NtSDr2alTXMlHV0Ds4aYj1IcShCSZnq0Ib/3YtMqq8h4g0d1gEtpxPRhvBVg0l+hrTOYGMUTLHd9PUqYRKf86hPQYidFzyp0GlkiQTa+KrHpwJthTs7pY2svpmyUHgc3/KLKsCtJMaPThlMd7s2dlTLAKkoltOdlR0WPNxZCe4JVvSAJBdfH9f92n+YDPLkglNMH8KfLEq5934BIEKLv1TP1/ud644+LkKBMfGPOeYrcxHBbO08G2vWWtjOxwE4N6LsXeH2w0AGvRrWzflTZYqSJLICfA72EcFCniFo5775828szVPKv99hRAThy7+0y0gv6w8r8Ke2zXpgNIRoMEhVdu5cppRNLBm/zuIgaqtYya/SwPjrkm83yTfeGyt5TI48hROoz5hZH6XJAZzezYc1VhVdOPm6ez
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(19092799006)(23010399003)(366016)(3023799007)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(4143699003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jQVw7ka5pJFuL6GhwFSTO53yQJlBLSLf3onp+P9CJocb8USTgo0WxhOE3aAE?=
 =?us-ascii?Q?x0ZP6XTRyLrmDPHG63N4DzLLkYFJoVWAFJUSWtgiu2Rktgb295Mk8C+ZnN6U?=
 =?us-ascii?Q?0Cc0Q5OpsvGZwgnrokyMkRDT3oTl1+5uX68VXAIcIIiDfg1B9gtUF6WOCFIg?=
 =?us-ascii?Q?Q3p+A+4ERRwJ9sgbDeESEXUr3aMweFN1742P3bJIAz0gz4wmWdZxScPAo2Yr?=
 =?us-ascii?Q?NMkOs0lOkIn1P+uXvsvuoy3xq9EHSz8pa1BA9pXM43RywLJ8eUOyWSgubWQt?=
 =?us-ascii?Q?OMUrWFLDVMU/W5YpB1Z6MEq9hAcFrEt/kZOl6oxZJ/ioIskjI+CtlA7qdfWQ?=
 =?us-ascii?Q?f5i97v4lzFiYmSGQRpiXc+v9rVc/Ze2/GlMCG8ptyBtF7h9LeXKv915Zq1GH?=
 =?us-ascii?Q?xVHJ3IcAXJEjEXX6TF6Dg6DUU/j4N066RJ2qHxfdbVqijNJYvO9qZNmsbwLS?=
 =?us-ascii?Q?wbeOx+9QaDXkpt7TJpXgDmfEJc6L2X7XBf4ALusg1lcTCoqaFYW/mFoxWJ7O?=
 =?us-ascii?Q?OAzwfJqi5PjbvYtGL7vmg2X9Nqsg/wKhnr5d162DLO2X0+Dh5HFnqIt+rFkK?=
 =?us-ascii?Q?2IR1bgL85RXjOrjmHAz6IjmkIPp1STEbRqsdlflhWz3PE1LmjE2fxFokj/m1?=
 =?us-ascii?Q?J8Iaojwr8Ui30pZZ+QBi0bMzsOBGB84sfY9td8e+zlK5InTr0QRatd51fEtt?=
 =?us-ascii?Q?12/V7p+twZlbUnZxUxDUVaVTYIVfgFd2S2IpeQ34qx5yc4ZvmJD6tjU+2sXK?=
 =?us-ascii?Q?RYWrelpO/xlYVADOqaqox2efxIf/CYDwa6JCg77bS8qgQNV/Ox1dN9UtmdvG?=
 =?us-ascii?Q?Q8ELKI04pRb7mdOLZQXC9Oo5l6QA04hN5eE1hlC3llWU6kSNulml9dN638WS?=
 =?us-ascii?Q?ZO28JEC3qH6gpfY+CCWCUEFX9GWJynI73ZC9rJINns20D6rWP6C8mdaX8w64?=
 =?us-ascii?Q?7wyWKBevtm5ZZRr0AYYFIXzSdwvo7B99P5r/5Ose6dNIsP8vmPINnKcSYQGB?=
 =?us-ascii?Q?Y04S9sUjzrwb5BvsdoxZs153D6qW6IqT/qUTmcAT7p8/HbWRYmNTKtYiGnVY?=
 =?us-ascii?Q?K06K7TLHRweppX7wY8Wr9yF6ckAC+BeXjNuhHhjfrUr0/9BZddmuwSVflTLQ?=
 =?us-ascii?Q?3CytWvzVddWLEmsgT/4xIgSfOk/BzRS7cyMNvZxMwpr3QMWFw8X+0+qmXu15?=
 =?us-ascii?Q?8Npts4PFDHE5mgYvsOsV8/dqFdQqiLQO8OaVVuzm/MiveS5iSvNFzgrz1Uc8?=
 =?us-ascii?Q?6LxVQYYwPBeZxmMZHAnu4vqujEH1QazBU/+HbS4Z/I4H2ZGofxw9fgwHhpOq?=
 =?us-ascii?Q?vV9ESw74A+tCC1pVmv8rMaBwfF5ilgIPvw8ANMNdlBzwc5Y7Js+9WYvczFqw?=
 =?us-ascii?Q?Vxem+wIHNJlmc2aknm3Igs0RFuhoqkNqeuWmvbTphBDz5Ly1tGePs8gcOglj?=
 =?us-ascii?Q?YFbySdYE3AqpJ9dcN5ue8L4GzwpApqd5xZt5QT2ONzxftkcG5b4Vy6tCyU4r?=
 =?us-ascii?Q?FgIvZ67KxrMIC6p05Px45tIC5D4PbKpQFWuG4tjVj5yJQTHTyMxC4e3R4nO+?=
 =?us-ascii?Q?2g+y5vEEPZ3mRslIZznI2Lx1V/t+/56+b6HWN8x4pUHSj938rjoAUs5yuuP4?=
 =?us-ascii?Q?gyNdCjaa7dE7HDfxAk2ExtBVnvO/GkY6xCDvhbbjQPz8oHOftKp+ENC895XK?=
 =?us-ascii?Q?XxJeVK8MjSp46xkVt+pYUoUqyTAG9IM4MB6l38GJpaZl0Rqn3yUJNSdWiFZl?=
 =?us-ascii?Q?us7YhMqot0CIAKQ8n/A9Ag5Fiss8ta0Bqxbi0loKhnnA26tzJMJB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db4b75c1-26e3-4506-9129-08df18d83dbf
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 18:35:14.1022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p9xY+yRznsZNUKjwWwVKW9blndgsIDLsCG6i2xJPk76lOLJpgF0oVDjSrZVan9eM0B/WALiM/j55X9Y/EVLUESeO38MbPqT1X7MDzDMSgGNVRyNQpH93JV99fB8ZhKI7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8532

On Tue, Sep 22, 2026 at 06:24:52PM +0100, Conor Dooley wrote:
> On Tue, Sep 22, 2026 at 11:25:30AM -0500, Frank Li wrote:
> > On Tue, Sep 22, 2026 at 10:39:23AM +0100, Conor Dooley wrote:
> > > On Tue, Sep 22, 2026 at 10:38:17AM +0100, Conor Dooley wrote:
> > > > On Tue, Sep 22, 2026 at 10:33:44AM +0100, Conor Dooley wrote:
> > > > > On Thu, Sep 17, 2026 at 01:23:19PM +0200, Michal Simek wrote:
> > > > > >
> > > > > >
> > > > > > On 9/10/26 17:44, Frank Li wrote:
> > > > > > > On Thu, Sep 10, 2026 at 12:36:45PM +0100, Conor Dooley wrote:
> > > > > > > > On Wed, Sep 09, 2026 at 11:21:41AM -0500, Frank Li wrote:
> > > > > > > > > On Tue, Sep 08, 2026 at 06:54:31PM +0100, Conor Dooley wrote:
> > > > > > > > > > On Tue, Sep 08, 2026 at 03:12:55PM +0530, Shubham Patil wrote:
> > > > > > > > > > > In-Band Interrupt and Hot-Join are synthesis-time options of the AXI I3C
> > > > > > > > > > > IP. Describe them with two boolean properties.
> > > > > > > > > > >
> > > > > > > > > > > A Hot-Join request is acknowledged by the IBI machinery, so a hot-join
> > > > > > > > > > > capable design is always IBI capable as well. Both events are reported
> > > > > > > > > > > through the controller interrupt, which is therefore required whenever
> > > > > > > > > > > the capability is present.
> > > > > > > > > > >
> > > > > > > > > > > Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> > > > > > > > > > > ---
> > > > > > > > > > > Changes in V3:
> > > > > > > > > > > - Move in-band-interrupt-capable and hot-join-capable into the common
> > > > > > > > > > >    i3c.yaml schema and drop the xlnx, prefix.
> > > > > > > > > > > - Keep dependencies in the AMD binding.
> > > > > > > > > > > - Update the commit description accordingly.
> > > > > > > > > > > - Conor Dooley acked v2 with the xlnx,-prefixed properties in the AMD
> > > > > > > > > > >    binding [1].
> > > > > > > > > > >    That Acked-by is not carried here: the names lost the vendor prefix
> > > > > > > > > > >    and the definitions moved to i3c.yaml after Frank Li's comment.
> > > > > > > > > > >    [1]:https://lore.kernel.org/all/20260824-tightwad-impose-495476599087@spud/
> > > > > > > > > >
> > > > > > > > > > I disagree with Frank. These properties make sense for Xilinx because it
> > > > > > > > > > is an FPGA IP and synthesis options impact this. For other devices, this
> > > > > > > > > > should be determined from the compatible.
> > > > > > > > > > Please revert to how things were done in v2, especially as no rationale
> > > > > > > > > > was provided for why these should be common.
> > > > > > > > >
> > > > > > > > > It is common problems, when IP intergrate by SOC, which may defeature some
> > > > > > > > > part, It is not appeared now just because IBI and HJ have not enabled
> > > > > > > > > widely.
> > > > > > > > >
> > > > > > > > > IBI and HJ is optional features of I3C. Ideally it should be indicated by
> > > > > > > > > some registers. But not all vendor implement provide this CAP registers.
> > > > > > > > >
> > > > > > > > > IBI and HJ depend on some slow clocks, which monitor SDA line change.
> > > > > > > > > Some instances of IP may not have such slow clocks. Some IP's IBI and HJ
> > > > > > > > > use seperate IRQ line, but these irq line may not connect of difference
> > > > > > > > > instances.
> > > > > > > >
> > > > > > > > All of this should be able to be dealt with by appropriate use of
> > > > > > > > specific compatibles.
> > > > > > >
> > > > > > > I understand compatible can cover most cases. Need variance for property.
> > > > > > >
> > > > > > > >
> > > > > > > > > like previous SPI vendor customized property, we takes efforts to convert
> > > > > > > > > to common one and also meet back compatiblity problem at convert. I don't
> > > > > > > > > want to do it again. This kind property is most likely as below.
> > > > > > > >
> > > > > > > > What SPI controller specific properties are you talking about here?
> > > > > > > > There are relatively few properties in spi-controller.yaml, and none of
> > > > > > > > them deal with these kinds of capabilities.
> > > > > > >
> > > > > > > num-cs vs fsl,espi-num-chipselects. Total number CS of IP is fixed, but
> > > > > > > some instances have not route all CS to pad.
> > > > > > >
> > > > > > > >
> > > > > > > > >
> > > > > > > > > default: 	decide by comaptible string or hardware cap
> > > > > > > > > force-disabled: force disable for some reason, like, miss connect irq line
> > > > > > > > > or missed some clock, or IP bugs, or board desgin's some level shift chip
> > > > > > > > > broken IBI/HJ timing requirements.
> > > > > > > >
> > > > > > > > Of these, only the last would be a valid reason for having a property
> > > > > > > > for it. Missing interrupts, clocks or IP bugs should all be dealt with
> > > > > > > > using device specific compatibles.
> > > > > > > > If board wiring causes the breakage, the property may be more
> > > > > > > > appropriate at the i3c device level rather than the controller given
> > > > > > > > that wiring to some devices on the bus may not have the problems?
> > > > > > >
> > > > > > > I3C.yaml is for both master controller and devices now. I3C is bus, which
> > > > > > > connect many devices, if wiring issue, whole bus can't support IBI. And
> > > > > > > if any broken devices happen at address arbitation, whole bus can't support
> > > > > > > IBI.
> > > > > > >
> > > > > > > at beging, I suggest 3 state,
> > > > > > >
> > > > > > > [default, enable, disable], but now I think IBI_broken, HJ_broken is more
> > > > > > > reasonable to disable it, default value should be set by compatible
> > > > > > > string or DCR of I3C regiser.
> > > > > > >
> > > > > > > And some I3C device may be failure to work with IBI even DCR of I3C register
> > > > > > > show it support IBI.
> > > > > > >
> > > > > > > I don't want to appear two similar property between vendor and common, like
> > > > > > > num-cs vs fsl,espi-num-chipselects.
> > > > > > >
> > > > > > > such as IBI-broken can be used for controller and devices case.
> > > > > > >
> > > > > > > > That said, I think that problem should be dealt with when it arises,
> > > > > > > > rather than starting a trend of adding capabilities properties at the
> > > > > > > > controller level when I am not convinced that there's going to be other
> > > > > > > > users in the same vein.
> > > > > > >
> > > > >
> > > > > > > Understand, I3C is realtive new protocal. 'IBI-broken' is more easy
> > > > > > > understand,  logically equial to in-band-interrupt-capable.
> > > > > > Conor: Any update on this one? I think this thread is stuck at this stage.
> > > > >
> > > > > I didn't think there was any need to reply. I took the first sentence of
> > > > > this snippet to be acceptance of what I was saying.
> > > > >
> > > > > If yous desperately want to have a generic property, the negative
> > > > > connotation of the "-broken" is probably better in that it'd be more
> > > > > likely to make people set stuff by compatible rather than have to use a
> > > > > property with that word in it.
> > > >
> > > > That said, technically this platform could be both
> > > > "amd,in-band-interrupt-capable" and "ibi-broken" at the same time, since
> > > > one describes the way the IP has been compiled and the other wiring. I'm
> > > > not entirely sure whether conflating the two is possible? Depends on if
> > > > your IP's programming model changes if the option is enabled even if it
> > > > cannot be used. Not beyond the realms of possibility.
> > > >
> > > > Also, ibi-broken doesn't work for your platform, since the default
> > > > before this patch is no ibi and requiring a property for no ibi would be
> > > > an ABI break.
> > >
> > > The perils of FPGA IP I suppose, and not being quite careful enough to
> > > document all of the relevant options from the start. Been guilty of that
> > > myself.
> > >
> >
> > Check impliment code
> >
> > +       /*
> > +        * The interrupt only carries IBI events, so it is only described for
> > +        * designs synthesized with that feature.
> > +        */
> > +       if (master->ibi_capable) {
> > +               xi3c_master_init_ibi_ops(master);
> > +
> > +               master->irq = platform_get_irq(pdev, 0);
> > +               if (master->irq < 0)
> > +                       return master->irq;
> > +
> > +               ret = devm_request_irq(master->dev, master->irq,
> > +                                      xi3c_master_irq_handler, IRQF_NO_AUTOEN,
> > +                                      dev_name(master->dev), master);
> > +               if (ret)
> > +                       return dev_err_probe(master->dev, ret,
> > +                                            "Failed to request IRQ\n");
> > +       }
> >
> > They can use master->irq is determinate if support IBI.
>
> That seems viable. Where does that leave them for hot join though?

No reason to keep hj because the difference between HJ and IBI is the
address when address arbitration. If hardware support IBI, it should support
HJ. HJ just use special address 0x2.

Frank

>


