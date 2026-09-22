Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012005.outbound.protection.outlook.com [52.101.66.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858D15275BC;
	Tue, 22 Sep 2026 22:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115706; cv=fail; b=rpDHFfcKV8IPkk+KkfxBUf05fLIJbG9QbmQzMx62L1sZIaLkrC9dRnzbn20fOJxi76oIEKpFTORT9BJRS8pAD3BNVUcBkDr9sdRgWuI1mTW12p9/0g8RQavlXBXBQBg5k9ubU8yI1G1vSN7ke1gTpelfj2pHKvYMzRUusYiN7w4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115706; c=relaxed/simple;
	bh=lwqyuRDZrKAEpxhfMtmhWgLjkzECpLIuArD2Rf1yEfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=D0pQE0fzhg/IwrOT6vhtWgCREYS581aNLfXGC+YUYn/WlXzj+S0RzQlZVpShNgGwKqYtUUW5JLiS9ATiUt7zIkuZBQgGL71eHeVTxfjrFBJHmNkJzqMduzy+OxhzxPpx+XbKK8uh1i9aFKHuJYSx/P+mvWywf6cm3bc12xUtq6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BorYWOJy; arc=fail smtp.client-ip=52.101.66.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BorYWOJy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E1cgMiShGRFhCcTdhRSSh/PxzcD2IVnNLQcbntu3AGqSss+UBoC+LMPEEIarFX49W5hhGHnEMaocA69xRdMo7UasmFj0FFW7S7ZxAbLFXZ5dBgF8cmWZZQ6hjmEk3QQ3Ikxg4lYDHxjLPm8W7Se+LXs1yW07KcgMVC+EZD/6Q7W+9tRJcwsdq2gkeLmZyjv5n9agHqnyyc+JuJjLBvZCimnACckaIuR20TGzUeB5sHdKaW86wZLHx4m4XWEKVDlJF5cvpQAk/TMUExVsf30tb86QXvX8OVn//vCp0vtqsXca0dR5p2QPB8fUU+GYlrdNwyNeni3QZJepP1sufm6HOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ccNznQ/zbAlqLm2L4ieg8kxlF7ShfOhEvB3rSVttcuU=;
 b=c8Vl2n/tU8698SC0QZL5gAdavpqgkxoQxoSqczDpqr7gbOcV7mb+dTAGTm5hCtxJ4/fuHB38H/N/rNrUTHDWMbeufLAGYW85he7aMQkk2ErZy4iZbBnfvnWnHz7DOqWfxQAA43d16gdOhAX/3QF/pfpQFSKteU1MSrTw/QNcjK1GKzHUptWNLdHnQ3s+zxg/yfvbI1omwEXop5znV2p5K6fKseZET6j/YvAtMd4JvUJ3lyhGTaqc/Tq069TEzOfoA0xDMJl0ccvBp597leDHBhfiD+0kYkV8IIzdcEOXq79uZEFbVZmnY2uFxVHc2pizD6Zp9bjSfCJmoO2uiBfMdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ccNznQ/zbAlqLm2L4ieg8kxlF7ShfOhEvB3rSVttcuU=;
 b=BorYWOJyveb+H/B14g2WDGagXkcNX27fzAbP0lsFCp/PK/eg4rOlIn/X2FctONgKGJtiF9MVI+1dwPH6MypZRvytsw69TuAZiXvJiFEx2KAkVAq0CrNelzBMSSLhDD2PvgG5TLNPcAwWUBb/ZdTZ2q2NmUPmtz3QGJwNZCN0jb9MqhhjoJyNcXhe/tJqd6/1HT9jXvGN3SHdivioXvpjWnkM/SeTTPSno4eihUIAka/22J2Eb47flZixK45K8wDWKMCHnjc4FlhzpIg2Q1bfcQz09blTVPHqoCizFv+VAxyQqNB2EJ4KfnZ1jh4ebnFjZ0CRL0DWKy+YVKriAJDrQA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB7850.eurprd04.prod.outlook.com (2603:10a6:10:1e8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 22:21:35 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 22:21:35 +0000
Date: Tue, 22 Sep 2026 17:21:26 -0500
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
Message-ID: <arL_Zgi1r1IFpNIO@SMW015318>
References: <aqKWTT47S_zPzvbN@squawk>
 <aqLQaHndX4t1kKLG@SMW015318>
 <778da629-2f23-412b-885f-e87827ce2b5c@amd.com>
 <20260922-ethics-flap-9760347e869d@spud>
 <20260922-bullpen-reprise-f62e01922d88@spud>
 <20260922-immersion-salvage-00450539f1ce@spud>
 <arKr-oapsl5qzo_E@SMW015318>
 <20260922-purple-overnight-2cdd2ddd5270@spud>
 <arLKWE1tJrKnzGdp@SMW015318>
 <20260922-unadvised-stalling-5cbeff8f982a@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-unadvised-stalling-5cbeff8f982a@spud>
X-ClientProxiedBy: PH8P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB7850:EE_
X-MS-Office365-Filtering-Correlation-Id: 981625d9-1fb0-4bf3-6440-08df18f7dcb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|23010399003|376014|11063799006|10067099003|6133799003|3023799007|22082099003|18002099003|56012099006|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info:
	GaSHVaIzqRjNdRZ94D/47eaM7mI/8Gf6EHbYyxJLD+bjLwg65mqfc5iVMJ2MYpgUgINl0TjtjmNZcFnVEDH1KBBHLCUBu/t5UFJg9dpqXkVKnwx4YCJT8EUU4lXVDh4eZuO/X+UvNyF0zjbA3sDG2kjfukVS2LrAgYOHs4poWTD3jHW8S2qzF7avs/BXvr5g8jt/7bSgjPzgw0em/IsqleysGSoeMiijtEPMyae4n6twW+AVsvBVe2VhT7Mjb8m3KtDQY0wywbdyYPks4EESrHNcYRpQjZlgkcZopURA+9aWiu2PwXpxbFx2m/voOtparWquoEBLG+i3ew4ticTzwOxe7phFLtOwUfzwf2PZz2XcncxeoSC/xIjrvzDuylUwRWhyKRKjVwJDFwtLYvcd8yQAzmOkoH9ZynNi1U0s6G09+aG0pCB8EmhWF25H7dxekrf1SqY16nP1ghVbrsF5JTDSr8zlsmdwmliSFc7N0ikuRWnPLdjiuuvBrT9NtX4R9ex6oaKvtbZZMQzkHK2QXYDesR7uR7JwVZROT+lRVwXHQ0KHElkSwtuvl7v+6IE5bz/yBodHgyEbd60g7dSGV51gZD8TCem5zPaUHMXqeOORJNybYrxZh2QelUj5d0s7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(23010399003)(376014)(11063799006)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(56012099006)(5023799004)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9N0EYFuVzXKh6cG05Cb4EjIDCJvA3e1dVUb4kaNFzWIYMfpdhSXgZTcfbRPf?=
 =?us-ascii?Q?0nfMymLaKcHaISe76hbdq+izDmbeuA+s++rtiHkbio1uoGmxult7hsr1+s5p?=
 =?us-ascii?Q?RkEzIKNVSbKBscJlzqACoXmRNiJsF+cBPgps6v1zXAFfJbH3j0MpwqD2tcMq?=
 =?us-ascii?Q?oONbd0LwXfKn3mkdT8dFzLQBw7FpTmwB0LRE3S3Amu08650mux1lp1D/agoM?=
 =?us-ascii?Q?its2lDWS/vIcysrWJHtRzqTBjXp51F2cgSLhNEQHOSlEdB78vbhjyknnF0t1?=
 =?us-ascii?Q?eHn9JnhUUgGfRGforX4u5Z11cJkjnojqveKulmqlsEFwJbExUnD2D/gFeuLH?=
 =?us-ascii?Q?wTYDZKG/vUV9uOL4PLeRsQFy780/oxC9LvCwTU5egaS170+kljyXZ9KgMwD2?=
 =?us-ascii?Q?GAhAF31xIt7lB5dpgbQkA9PDElOk0wwDCqIe/+JevvIpe+ymplxtwL/MzMr6?=
 =?us-ascii?Q?okg2vPD+vUyHryPuQALusXL4PxY3KDwtxJyUCajp0tqT6SOK/R00XVtCv4xd?=
 =?us-ascii?Q?rDzH9WqXuRH95HnLyn94re1J+wvtd2SfCljDT7MJfk+26H1P8+h66bHr0q6M?=
 =?us-ascii?Q?kRyn9BygkFYPQqYap8Eeq8jXsjOe9OPkUG+ispWocWWnyIaeZ2+bhgi5FpkR?=
 =?us-ascii?Q?+3Y/r+K+3YRK+3EUeP3b6LMa+/RpwlSS0KzXbfk4DXwx23q7X1uqxbcTgdgZ?=
 =?us-ascii?Q?xiBdPV2xqRMcxA7iMPSJJ/lSPOGq6FXLU5ndTRWfdbOdLnrd3fMZpZhEbXtk?=
 =?us-ascii?Q?81wduwTVY0WJBqSqiNfNDn4Qouv5I+LNvG1F9ZNM1jYtrMGeLG06QkCH45aZ?=
 =?us-ascii?Q?AXkSaljR11JaLpraWWqwWISYJOtxX1EmeUkFbYlQxHfoxGjw0W+GaYwjbczn?=
 =?us-ascii?Q?w1Rk57z1OhsOr3Z1fHCh3J9rStjY04u3AUf6uour+tyl65NYQqnIeHaQoEiv?=
 =?us-ascii?Q?Db5zFtFU0AfmmrGucKDiW4HrtvnVAeihJkQocpYYhUXgb5m4uu4f7eBgF7/T?=
 =?us-ascii?Q?HEabQc7jR+Oh1tbQgUtN7jhGtOosq5xBxnnoruNcdHCUAD9iBy5rUuXT5KaP?=
 =?us-ascii?Q?g22SoFFpZs70ebRft1OrF1tMGLddd7PvmNwzCYiGJ2uWs752SjqlSdwunAWl?=
 =?us-ascii?Q?W5wwxq/F5BBgrkBwA58GfJQfcZsurXSff2kgB0ZAH9/IK1M+PE6fEIC+fZFV?=
 =?us-ascii?Q?O0ZFhepVWi1JBkGoFoj40HXlCKhg5qd0WwYq4XZG28y7KAIRB8BsgMprp3Ti?=
 =?us-ascii?Q?npNDxhy7pf7WTpTWfHkMB2HD0Bz3GGD0mC5RKA/zSIEpA0MFS3mb41tYB7A8?=
 =?us-ascii?Q?tFvVIfMWTncD1+cHy0rvjZfCF5z6HiTiibEqg/6IpNk3ZhP92dFuohXjkH6T?=
 =?us-ascii?Q?u5SRLu+XFWXKDPFCFOkcnPXzKGhWb7C7u6k+ENzE22nr5Zls5igzUGWCmC/8?=
 =?us-ascii?Q?RC1PYdjC4WWGaJ6V8b8C3AP1U8cYwOg5VWrB2u80RI3MlfObXGadg4fp4/WB?=
 =?us-ascii?Q?9Om1h68olPCik8WZ66GG9W8CXHmkRyWpSV0hlhW3NykbR2cDqyKL97cITXo1?=
 =?us-ascii?Q?xKi7dyY7mYPzyKbPXXMmqJQWgHRVeAu2K4qkhthED0Q3GsBLJ2cwQZqPZB59?=
 =?us-ascii?Q?ysRXKAuiiJv92/frT1HcxMVEGVjboI38JAFHxha9Xt1HInAycjLsBb0/8l67?=
 =?us-ascii?Q?u7dkq/OqV6jUm52AwzYDfPxQiplBLT32EOkrZxrZMXoJdx5/n4VPhFZUYAWE?=
 =?us-ascii?Q?l0vTCoOSgqRwv5IpZblKKQX7J1v4ovQr76Wj4biauGPHySop6wst?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 981625d9-1fb0-4bf3-6440-08df18f7dcb7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 22:21:35.1728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lb+4OLfU24tdeTq+fDEQ53XuD2fwZGWe1cY8MlQEA/ZXLLIp22cgSw8W+Qiqw1Qs4mX0xGg4VHNzyGQBkUrFbkkaQI2PbhhcSJicdCDzfWbC0KXKchmBBTGTGZEfs0w9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7850

On Tue, Sep 22, 2026 at 10:29:31PM +0100, Conor Dooley wrote:
> On Tue, Sep 22, 2026 at 01:35:04PM -0500, Frank Li wrote:
> > On Tue, Sep 22, 2026 at 06:24:52PM +0100, Conor Dooley wrote:
> > > On Tue, Sep 22, 2026 at 11:25:30AM -0500, Frank Li wrote:
> > > > On Tue, Sep 22, 2026 at 10:39:23AM +0100, Conor Dooley wrote:
> > > > > On Tue, Sep 22, 2026 at 10:38:17AM +0100, Conor Dooley wrote:
> > > > > > On Tue, Sep 22, 2026 at 10:33:44AM +0100, Conor Dooley wrote:
> > > > > > > On Thu, Sep 17, 2026 at 01:23:19PM +0200, Michal Simek wrote:
> > > > > > > >
> > > > > > > >
> > > > > > > > On 9/10/26 17:44, Frank Li wrote:
> > > > > > > > > On Thu, Sep 10, 2026 at 12:36:45PM +0100, Conor Dooley wrote:
> > > > > > > > > > On Wed, Sep 09, 2026 at 11:21:41AM -0500, Frank Li wrote:
> > > > > > > > > > > On Tue, Sep 08, 2026 at 06:54:31PM +0100, Conor Dooley wrote:
> > > > > > > > > > > > On Tue, Sep 08, 2026 at 03:12:55PM +0530, Shubham Patil wrote:
> > > > > > > > > > > > > In-Band Interrupt and Hot-Join are synthesis-time options of the AXI I3C
> > > > > > > > > > > > > IP. Describe them with two boolean properties.
> > > > > > > > > > > > >
> > > > > > > > > > > > > A Hot-Join request is acknowledged by the IBI machinery, so a hot-join
> > > > > > > > > > > > > capable design is always IBI capable as well. Both events are reported
> > > > > > > > > > > > > through the controller interrupt, which is therefore required whenever
> > > > > > > > > > > > > the capability is present.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> > > > > > > > > > > > > ---
> > > > > > > > > > > > > Changes in V3:
> > > > > > > > > > > > > - Move in-band-interrupt-capable and hot-join-capable into the common
> > > > > > > > > > > > >    i3c.yaml schema and drop the xlnx, prefix.
> > > > > > > > > > > > > - Keep dependencies in the AMD binding.
> > > > > > > > > > > > > - Update the commit description accordingly.
> > > > > > > > > > > > > - Conor Dooley acked v2 with the xlnx,-prefixed properties in the AMD
> > > > > > > > > > > > >    binding [1].
> > > > > > > > > > > > >    That Acked-by is not carried here: the names lost the vendor prefix
> > > > > > > > > > > > >    and the definitions moved to i3c.yaml after Frank Li's comment.
> > > > > > > > > > > > >    [1]:https://lore.kernel.org/all/20260824-tightwad-impose-495476599087@spud/
> > > > > > > > > > > >
> > > > > > > > > > > > I disagree with Frank. These properties make sense for Xilinx because it
> > > > > > > > > > > > is an FPGA IP and synthesis options impact this. For other devices, this
> > > > > > > > > > > > should be determined from the compatible.
> > > > > > > > > > > > Please revert to how things were done in v2, especially as no rationale
> > > > > > > > > > > > was provided for why these should be common.
> > > > > > > > > > >
> > > > > > > > > > > It is common problems, when IP intergrate by SOC, which may defeature some
> > > > > > > > > > > part, It is not appeared now just because IBI and HJ have not enabled
> > > > > > > > > > > widely.
> > > > > > > > > > >
> > > > > > > > > > > IBI and HJ is optional features of I3C. Ideally it should be indicated by
> > > > > > > > > > > some registers. But not all vendor implement provide this CAP registers.
> > > > > > > > > > >
> > > > > > > > > > > IBI and HJ depend on some slow clocks, which monitor SDA line change.
> > > > > > > > > > > Some instances of IP may not have such slow clocks. Some IP's IBI and HJ
> > > > > > > > > > > use seperate IRQ line, but these irq line may not connect of difference
> > > > > > > > > > > instances.
> > > > > > > > > >
> > > > > > > > > > All of this should be able to be dealt with by appropriate use of
> > > > > > > > > > specific compatibles.
> > > > > > > > >
> > > > > > > > > I understand compatible can cover most cases. Need variance for property.
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > like previous SPI vendor customized property, we takes efforts to convert
> > > > > > > > > > > to common one and also meet back compatiblity problem at convert. I don't
> > > > > > > > > > > want to do it again. This kind property is most likely as below.
> > > > > > > > > >
> > > > > > > > > > What SPI controller specific properties are you talking about here?
> > > > > > > > > > There are relatively few properties in spi-controller.yaml, and none of
> > > > > > > > > > them deal with these kinds of capabilities.
> > > > > > > > >
> > > > > > > > > num-cs vs fsl,espi-num-chipselects. Total number CS of IP is fixed, but
> > > > > > > > > some instances have not route all CS to pad.
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > default: 	decide by comaptible string or hardware cap
> > > > > > > > > > > force-disabled: force disable for some reason, like, miss connect irq line
> > > > > > > > > > > or missed some clock, or IP bugs, or board desgin's some level shift chip
> > > > > > > > > > > broken IBI/HJ timing requirements.
> > > > > > > > > >
> > > > > > > > > > Of these, only the last would be a valid reason for having a property
> > > > > > > > > > for it. Missing interrupts, clocks or IP bugs should all be dealt with
> > > > > > > > > > using device specific compatibles.
> > > > > > > > > > If board wiring causes the breakage, the property may be more
> > > > > > > > > > appropriate at the i3c device level rather than the controller given
> > > > > > > > > > that wiring to some devices on the bus may not have the problems?
> > > > > > > > >
> > > > > > > > > I3C.yaml is for both master controller and devices now. I3C is bus, which
> > > > > > > > > connect many devices, if wiring issue, whole bus can't support IBI. And
> > > > > > > > > if any broken devices happen at address arbitation, whole bus can't support
> > > > > > > > > IBI.
> > > > > > > > >
> > > > > > > > > at beging, I suggest 3 state,
> > > > > > > > >
> > > > > > > > > [default, enable, disable], but now I think IBI_broken, HJ_broken is more
> > > > > > > > > reasonable to disable it, default value should be set by compatible
> > > > > > > > > string or DCR of I3C regiser.
> > > > > > > > >
> > > > > > > > > And some I3C device may be failure to work with IBI even DCR of I3C register
> > > > > > > > > show it support IBI.
> > > > > > > > >
> > > > > > > > > I don't want to appear two similar property between vendor and common, like
> > > > > > > > > num-cs vs fsl,espi-num-chipselects.
> > > > > > > > >
> > > > > > > > > such as IBI-broken can be used for controller and devices case.
> > > > > > > > >
> > > > > > > > > > That said, I think that problem should be dealt with when it arises,
> > > > > > > > > > rather than starting a trend of adding capabilities properties at the
> > > > > > > > > > controller level when I am not convinced that there's going to be other
> > > > > > > > > > users in the same vein.
> > > > > > > > >
> > > > > > >
> > > > > > > > > Understand, I3C is realtive new protocal. 'IBI-broken' is more easy
> > > > > > > > > understand,  logically equial to in-band-interrupt-capable.
> > > > > > > > Conor: Any update on this one? I think this thread is stuck at this stage.
> > > > > > >
> > > > > > > I didn't think there was any need to reply. I took the first sentence of
> > > > > > > this snippet to be acceptance of what I was saying.
> > > > > > >
> > > > > > > If yous desperately want to have a generic property, the negative
> > > > > > > connotation of the "-broken" is probably better in that it'd be more
> > > > > > > likely to make people set stuff by compatible rather than have to use a
> > > > > > > property with that word in it.
> > > > > >
> > > > > > That said, technically this platform could be both
> > > > > > "amd,in-band-interrupt-capable" and "ibi-broken" at the same time, since
> > > > > > one describes the way the IP has been compiled and the other wiring. I'm
> > > > > > not entirely sure whether conflating the two is possible? Depends on if
> > > > > > your IP's programming model changes if the option is enabled even if it
> > > > > > cannot be used. Not beyond the realms of possibility.
> > > > > >
> > > > > > Also, ibi-broken doesn't work for your platform, since the default
> > > > > > before this patch is no ibi and requiring a property for no ibi would be
> > > > > > an ABI break.
> > > > >
> > > > > The perils of FPGA IP I suppose, and not being quite careful enough to
> > > > > document all of the relevant options from the start. Been guilty of that
> > > > > myself.
> > > > >
> > > >
> > > > Check impliment code
> > > >
> > > > +       /*
> > > > +        * The interrupt only carries IBI events, so it is only described for
> > > > +        * designs synthesized with that feature.
> > > > +        */
> > > > +       if (master->ibi_capable) {
> > > > +               xi3c_master_init_ibi_ops(master);
> > > > +
> > > > +               master->irq = platform_get_irq(pdev, 0);
> > > > +               if (master->irq < 0)
> > > > +                       return master->irq;
> > > > +
> > > > +               ret = devm_request_irq(master->dev, master->irq,
> > > > +                                      xi3c_master_irq_handler, IRQF_NO_AUTOEN,
> > > > +                                      dev_name(master->dev), master);
> > > > +               if (ret)
> > > > +                       return dev_err_probe(master->dev, ret,
> > > > +                                            "Failed to request IRQ\n");
> > > > +       }
> > > >
> > > > They can use master->irq is determinate if support IBI.
> > >
> > > That seems viable. Where does that leave them for hot join though?
> >
> > No reason to keep hj because the difference between HJ and IBI is the
> > address when address arbitration. If hardware support IBI, it should support
> > HJ. HJ just use special address 0x2.
>
> For this IP, they appear to be controlled by different configuration time
> parameters, so I don't think conflating the two is the right thing to do
> here:
> https://docs.amd.com/r/en-US/pg439-axi-i3c/Configuration-Tab
> Per this doc, and the original commit, hotjoin configuration is not
> permitted when ibi is not supported but can be enabled and disabled
> separately when it is.

I am not sure why provide such flexiblity, only difference is that compare
address 2 or other value.

This feature may be quite common for i3c, if other soft IP provider such
flexiblity, still common property is the better than vendor specific one.

Frank

