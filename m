Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011063.outbound.protection.outlook.com [52.101.65.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC68E2741B6;
	Mon, 21 Sep 2026 02:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789956840; cv=fail; b=NFUo1Eh/EEjfanmfx+mqB/lGhxD1YN10hUoTXSamTHwrAE9lWBzOVkDOjEEhPOq8fhCEtlilVRArdiUzkOYMrAmx5SEl5E9Q34YtG9otfoTkki6wTlIpqRjFwbqq3DA91tXzmjLTCqmryyuQcWevtoan3VYfj78XSWUEH+YYs/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789956840; c=relaxed/simple;
	bh=pxUEXonCnCSGEwLLUK4Y4YHwv82dfWJVpY2wOMZjTvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=D5zs3vix/Iyv8u8F1kkOTPl16/fGfL7iUR31d2OGnlkHgs7MGQkzVG2nGmUswdwjoXjS63xbnpwRECitFwRr5HrvGDiVMJdlSA4hQ7X697z6ctyk3vTebeucoTGKl+zSXq0J3a2LLDB4So8wK6vyXKP4YqNyvw0wzQxeRTZhBxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vJpkixZl; arc=fail smtp.client-ip=52.101.65.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vJpkixZl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=opw5cn+7WdvHbp6SDTwEcczQGc3QrgMKqKqdSYDpgXg6e2rg1GFtbCotFI8CmVB8tSx4AtR5AX505Gw9CVo6rstQREKIGm81BaabF9e8rXGAnMipAgCs7tFrzRiLfUhL2epEss0b/zSf4ks+BIVkqhuZbhn5Wp/j1/uTaBOM2me4x7tBdycdp3On/zVO5z51zdo2jyd4Cu4iYLMqsZnvtXe3hgjezNVS62NWOScqaaQyXE+nX94TONXHRwiA8a7uuq9ZwoBciQjI/Z8R5kzDM0vijNpvzsv4G+UB2KeRaEeGZUNX0/KSkdgGy5J4WWPVx7cZM5YKtUX9W6ZVaZw8Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rdt11uVtN0OqbnItQibhHw2ubBzl4zv9f/9eziWfab8=;
 b=HlMuyxUSAkNRKTfC19zQRTi0vm4u1d1yPtsPwyc8BxlXwNvr8wcO9wPG5q6v8j9d2Yuxm7lI7uyGbrqOeckSzY5aJNIMcKRIkT4sOW6HFsg6kWWmc77l2KQREqqco1HPWUmAGICm9IGIDap8VN1i1vm4e+0DNJGCTCQ9Sf9LdkdwdUQUG81znLyprmzPsoutSCClp9YZuVowWJcMC628GuE18qhUd3W/n5ZEg8UX+Nk2JeBy1DYv7GTVMPCwy3SQ1ESceEZLi5aCoWmNMm/ry9HK4K4h709pNWxDjbLYMFpodhFN23eJO9DWaftS53Yh+JCrqu12E7Efsupt6ioxmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rdt11uVtN0OqbnItQibhHw2ubBzl4zv9f/9eziWfab8=;
 b=vJpkixZlHlwS+bhwBuPv+oNO72BQSrEHU08HP0lMyR63GIURyFmhvV+QY2p1nfu2cM/1kCgGwMKyvCONWharXwlEIy4lRrQhvFMxwJKRgA/BpVCMEP+2Gjv4ZpG39MX6Zg2IofN6GuoPEQtXR5AuWY42i6P2ukTkU/wfvuquDl/HWjVX6B6icdEdgbT5H6Iv4gFOj7f8rucHVsZkey6q+wYMB4aDAqIpHin42LoOLI8YVhSXxk+6+1dFzurQhZuSPDFpF8yKrMOFO38dP8KWsMmps0f9euJleIe6H6dZ2hD7vUfZcvsiVqeYgrbGzbvSsLQEiWLnHZJImrmf3Hby4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by PAXPR04MB9491.eurprd04.prod.outlook.com (2603:10a6:102:2c3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 02:13:54 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0428.011; Mon, 21 Sep 2026
 02:13:54 +0000
Date: Mon, 21 Sep 2026 10:11:24 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: badhri@google.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	jun.li@nxp.com
Subject: Re: [PATCH] usb: typec: tcpm: advance vdm_discovery_state on
 Discover Identity Not_Supported
Message-ID: <4nih3ww5gsbrculihsyvs5p2g3b3mhbdqm5f2zjurtqri2wk6d@rvyaofe45x2q>
References: <20260914093828.1910201-1-xu.yang_2@oss.nxp.com>
 <aqzt7dDNdHd22rY3@black.igk.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqzt7dDNdHd22rY3@black.igk.intel.com>
X-ClientProxiedBy: FR3P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::17) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|PAXPR04MB9491:EE_
X-MS-Office365-Filtering-Correlation-Id: 068b17b9-6f88-4e50-c082-08df1785fc6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|366016|1800799024|23010399003|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rR8Qj8xNisbgM4/YOTIOL/865S8lqvPlb8q2Kpf7//ZXHDroS/Ch/XVm79CZHRU+z8PgGFJu8OT7woUv7cGhCAOFy6JsiXvBtqhI3C1xDg+3Rz/FGT7b+9l4cEdLUciFodM3t2A714/gFyjuVcOcZQmYIX+aSRqTcZ9airWERxgexNRCKZcl78jvXSeq3DFjoeaNlLF3763Xw95QE2rGKqm4GcWWT3BuiLjeiKIKq0yPDDm0zbiImbhWjx6ozWZgLperMxou0A6Oe6p9B6m9wPqh1nX+nXt3aeNMykG+xfb6cc4duINx0zUhM/Y4E4nBzp34eXAZsPFRQyVXplGJYCZJiAlbX2D1VFirToZZIfUkzF55kRFZDrhx5Nd+uFh6vsRWXKhrRyN6o1qQR46DgHzP8zFehon9WZsleaL4An+/NJ0xZMun4KvmDr5j1ZOghnTFrkmaXvK1vbKOAv7XA6dcUjEiux2QWHxPmZgKZr3on+242vh+jmhz/eE+4D8DFZp2s5MAyqoem5S1BE23+aIYo1NOjP4mjrrkUZeWfVIuILLlq775ykeJjixUi/Rg6JAL/9gIWa9sd4N7wszot+vZnf+nYha+SeJwxSj9EOmn2PTUgAkczNIyi3HQaeai
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(1800799024)(23010399003)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JwDofSnjQCEls9mImK0sgjymE0X9obdunz2lxooJuMqARivksQlODYt0swwb?=
 =?us-ascii?Q?cFuA30VB+10lDeTHkGzgtcqFQ8L2s7uf0Wz4va/RMsd0s0SiCY5r+9/QY8/1?=
 =?us-ascii?Q?6AlVGifGSiOsLBiAltfz8ES3p7LrP5smJMrmv+NTN2K5hlrIBKHBTD/3fWAW?=
 =?us-ascii?Q?y0iG+AT771k4fv/2nf/fYG1H/Hlr/svOs1auY7f3NjgnEPjzLnIgDNZNdPtA?=
 =?us-ascii?Q?kiYn1RETcsrBc2TBRxcvBbmjWayQKoM8fCgdUxc98Sk7AzUeMuf7wj8oJ84G?=
 =?us-ascii?Q?7ej8wfY+5RIKUqMwtigfpXA1s+y1X/VRkKKsS5H2iX4kaXX7GRjdlPuh3ohW?=
 =?us-ascii?Q?BDt62fpsy+OsrjJE5poHm6bVtGCsyH6kYb/sTgG+EDcVTrSFzh6r1C3n/bRh?=
 =?us-ascii?Q?4EbDVkeI2ojEw1OH8G9czhwjr4uyh37TvPM76QqMpYmv9KVy2NBjnetpfsML?=
 =?us-ascii?Q?c79vrNE8biDKmHPoM7NGKrjUtXtkSCfmbavNpUMhGUkR6KORO/OCKEetHaet?=
 =?us-ascii?Q?Q0S7nK0tJFgrtU80jQaiY3eyM6ibYg5/TfRw9x48QpRrO+7WQyzabjca1ILK?=
 =?us-ascii?Q?V8ppEAIHyr8XY5NxiMFYLxyxhagPuzAlO9ws3vbE+Es/ez8YfQlH1eYdgfsm?=
 =?us-ascii?Q?q6cJroNPz5EX59J0hjvG91uqkE3pVDFqvb2pv9jgt7wt4Y/sLb31MQ9b5Y+P?=
 =?us-ascii?Q?6PccUD5k4qtdMNs403J8DbjY/SsB8jo0RBuSLcKZKmBIOMAT2gg3a1Ld1Kag?=
 =?us-ascii?Q?Qz6dUpHYMEdgRigJRCLWqYOkrqwtTP2jiXCrO7ELyFG/2O2sDgWC3MPzrWNh?=
 =?us-ascii?Q?jeD1q81JfbcjwtLnPemwQRLW+RfPx1fPUBvERUZpXYfEGBQL1NtKHRk27xPL?=
 =?us-ascii?Q?89R5nM7+wk9SCRKOHS2J/AOqmO/Jh9zTgYxMyS8zkQ3JRKJ6StPGSrLUpq11?=
 =?us-ascii?Q?/8yy+CRwdKKZd2e1i1/tNiTzU+6izzI//2sDm4W4FiEXrJA6nKRSaw9m9xtL?=
 =?us-ascii?Q?pC75DxO+b4RyfIFcAbv/XXwicQm0b+kP76S0M6gvYX1WOjeE1WBuQ+CLh7W+?=
 =?us-ascii?Q?0kIkFS9+TYOQJUF0Ym/AS3GSIQY7Fp/vgk+QwqmsEoynyeWKDOwwAUeXCK7m?=
 =?us-ascii?Q?rgKIDPZwK3S6mWJ17vvU/uswHJ3xLqFmSB3LFjFHVH/y5XILOrFyORsdig98?=
 =?us-ascii?Q?rSIg5AdHjW8kLGlwye4UZyByYhGm1woirj3jcnuixiElb1negyEMUQB8lLy8?=
 =?us-ascii?Q?ZMv0kXm7aQ7oq2OiOSqP9hdxrXbYbcDFV5QztN0/dGMgDE8wPhgXYJrCyJ7s?=
 =?us-ascii?Q?3LFpnKxmfbiHpACwR3nij5qFgbsifLe+ZPaiEmObikFWxhDda5WL1M8EGm1f?=
 =?us-ascii?Q?yE5fXCEgC2n4X+3h0Jka80A8SXw8pw1htT7bFuSZ22n9jJsgq9lSq730cTHN?=
 =?us-ascii?Q?sa6Qjb2vnnDmgyWh4/N6i+BCj6R9YC1zHMPgD9astXDQu7uefLo0jKDVkXPE?=
 =?us-ascii?Q?NK0t/7Dsa/gxQRGqLS/7/XncAEbcBr4JCv4Z9aJzqKVIrk/J0p9ZCxYQdxXy?=
 =?us-ascii?Q?DlUwmKdgI7lqP+sN6yWhN1jetDqblOH3DX/KQMxwixanOjef2W1BjwRJK/o9?=
 =?us-ascii?Q?O9abh3529zo3Ho8+S5p5uAX7xkeryeN72jymF9g2xD+BxD6yxL2R2O3IT19J?=
 =?us-ascii?Q?2RFmA0XOnIWk8Hae9m8Qft3oyHGIatfg8os4FDiGeEmBSxlqD6qQ7NCInZTN?=
 =?us-ascii?Q?cuU3bsYSwlUZw/e8xb72a+GW/bVJUWfplNGGVByvRfSDcx5AWh7r?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 068b17b9-6f88-4e50-c082-08df1785fc6d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 02:13:54.6847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rrXuUJ+HoMoEQLKQqUyI6HfOvRAifgKpD5RwR9Wf+2uC8TpzdqSuc98mbU2CVnmV6rqiA8f0CIFsJPaCkhc2xUqvYikndDqIcZPujQQmbRgslz8XFw/ytSJ2WXQb23o9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9491

Hi Heikki,

On Fri, Sep 18, 2026 at 09:53:17AM +0200, Heikki Krogerus wrote:
> On Mon, Sep 14, 2026 at 05:38:28PM +0800, Xu Yang wrote:
> > From: Xu Yang <xu.yang_2@nxp.com>
> > 
> > Commit fa4d0a7cd036 ("usb: typec: tcpm: fix Discover Identity retry loop
> > on Control Message reject") advances vdm_discovery_state to
> > VDM_DISCOVERY_COMPLETE when a CMDT_RSP_NAK is received, but it does not
> > advance the state when a non-modal port returns PD_CTRL_NOT_SUPP.
> > 
> > This can re-arm another vdm_discovery_work if the port is going to
> > respond with PD_CTRL_NOT_SUPP to the partner.
> > 
> >   tcpm_pd_handle_msg(port, PD_MSG_CTRL_NOT_SUPP, NONE_AMS);
> >     tcpm_queue_message();
> >       mod_tcpm_delayed_work();
> >         tcpm_state_machine_work()
> >           tcpm_send_queued_message()  -> send PD_MSG_CTRL_NOT_SUPP
> >           run_state_machine()
> >             case SRC_READY:
> >             case SNK_READY:
> >               mod_vdm_discovery_delayed_work(port, 0);
> > 
> > If both the port and its partner do not support modal operation, they
> > will send DISCOVER_IDENTITY to each other infinitely.
> > 
> > Advance vdm_discovery_state to VDM_DISCOVERY_COMPLETE in this path as
> > well, mirroring the existing handling for the SVDM CMDT_RSP_NAK case.
> > 
> > Fixes: fa4d0a7cd036 ("usb: typec: tcpm: fix Discover Identity retry loop on Control Message reject")
> 
> I can't find that commit from anywhere?

It's a mistake, and I sent v2 to correct it:
https://lore.kernel.org/linux-usb/20260916043957.3362995-1-xu.yang_2@oss.nxp.com/

Thanks,
Xu Yang
