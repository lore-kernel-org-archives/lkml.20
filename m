Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011008.outbound.protection.outlook.com [52.101.70.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5CA37B41E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791833154; cv=fail; b=U2+VkavayksOV8+04E/6c2MSCstY4PBNkXv5bjIfkE08rQ1vMXKs7rcXa1ZroE3SXDM64Rjb/HvijGkNEz2C0enR4xbauot8up7HuJwLOCvC5vjxCWlQCdwk9vPNu48KYWYBUxRbFiveVz5NSTlihK60yNwdAM5ZaU0AchjpRtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791833154; c=relaxed/simple;
	bh=L3BtNiAk/RGe+mMELP7QB6GsjJXJ7jDbmr3mC40s6E0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=juwGviSuvM0aRVqwzKY1C1j1vBLYVAR98RegaSdOUcvVmwa/G+4kr5b6oIRAMGqhel4v6A2OoJV0jjBw1WqCv7v6KKM85xc9pnqy4GdZCM3ndjwZwZMSTYv6x2bl/bGWxM1IF3YHe6l0EcwaNFbtqVh2IlWA8u+/5WpO8OfUMXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aGvu8hPA; arc=fail smtp.client-ip=52.101.70.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aGvu8hPA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R2+ld3FF7AQUpeyJw9TEGWgu2iFU5ysA4HJOM4C+ydjS85ms7p1c4moh8+o1nX1I14P0WBvF6A062X9RN0lii+iQFBTrMSiahjHkVCs3spIIJ9RCvJ889k5vpcpk1Kz265KUwx/ZRvFU4QAF/ej//x+UY8In8uiX74dKzPY6vF28imLuU2433z97Fw2tbpin7xwOe2l3yXF5k8cyQi1cjKy+dvOBlS3YvzYrZAvT3l5KT1SHoqkhnEnnmvXJYJpxOhXH0HGoqBtQBTjQmJg2mDzVgNuzipF4lGcMV8qiTjsS+FV5T6A8GKOxEopkGnkqzLSEKxzVQhMD2NndRMJCww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pzv9eFNmPtJkvdMd78DKZgtphAhbPINCrQmyzcmuA1g=;
 b=ZPhP7Zn+1UOfwmQkGJsLmOfLme4jmRLzdA5zLpjCqGGyjNxq0Vv2Tm7qdDV0jJdrLbePS+vgZa6pyPmo+VO7qRDkocAl1NST3xJelykaa+vXI81MrpMJ9m/Y1cMOxPk0Vb5suqldHRwaTSZJflVYEUIrfhyUi2641eo/zye+9qcEWfnEDVEfnwYSuqb1rtgLqK8+xDgQ8namRgFi285zra7OgiQj70lsnNIAfAMEVBzbYgLZVUOqiE9PsXYinURyj+nusqQusr39sZHmpeItIFNXuK2185Beg5KsKxeagS818tGhI7NlIZnKp94K5CqZ850VbQn8IkqpBWUONW3GWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pzv9eFNmPtJkvdMd78DKZgtphAhbPINCrQmyzcmuA1g=;
 b=aGvu8hPAwh0+/fJppwVstCLq743MT1lCdy89H6DzHOrb+Hy596ITZFEfk1Cu+cuqWQZX0Nqf9X59vFp5hGlAOBcfzpdQeu5YuLCtPsz4aAlZaq8Whsc39CA3cSbowMWDVqloTH9yZLibVh3raDJ4KRaS2pPX2JuaQgw49dqKp1HGaqWRjXu4O4ujMIv04OSkgUXeTtKHVGRwsvj2JtgoKPWFMT/psdMqvBlDU34GPMlow3oAhe9rxQ6kus1y5T2yJerrcSJnSI+E8CSofYUMAKWbXx3RLzGX2iXI/abRdKEPfLRB2INQ+/l+Hf7kbc5STZjgGP68fl17Y3SgQ/LyIA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 19:25:49 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 19:25:49 +0000
Date: Mon, 12 Oct 2026 14:25:40 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Zhipeng Wang (OSS)" <zhipeng.wang_1@oss.nxp.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Frank Li <frank.li@nxp.com>, Radu Rendec <radu@rendec.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>,
	Xuegang Liu <xuegang.liu@nxp.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 4/9] irqchip/imx-irqsteer: Convert to
 devm_pm_runtime_set_active_enabled()
Message-ID: <as00NCc7ISmSlpIp@SMW015318>
References: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
 <20261008090231.796511-5-Zhipeng.wang_1@oss.nxp.com>
 <asf_9lgB-ULFooH9@SMW015318>
 <VI0PR04MB12350BD5EF98B9EC922D797F0EB912@VI0PR04MB12350.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI0PR04MB12350BD5EF98B9EC922D797F0EB912@VI0PR04MB12350.eurprd04.prod.outlook.com>
X-ClientProxiedBy: PH7P223CA0027.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB8PR04MB7162:EE_
X-MS-Office365-Filtering-Correlation-Id: b15d9279-6b83-40a1-86a9-08df28969f42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|23010399003|56012099006|5023799004|11063799006|4143699003|261009220027099003|261009221227099003|261009223027099003|261009221727099003|261009223327099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Opn9gWwN/wdfSuUIrmwa+ASc3SddZjMixZ3QjJ7oHXBAyhx6/n+cITrthpIDgiiOEtXhknhe777tGYcNxKd6B18AfWvAAlORBF8XmZ5Kd38ynvtjUZhD67+tH7Lth1hqrHkh8pXqgv1rCg6v6qfmHmixUbIlxqPZvxD2Ty9pK9GEW/FRM3qws3Qnq4DWoPiBjE5sEGaoTb6sBnmcKQNsQCr6k9fwKvTzKMsLHj5dO1eof+T80m7g2VEp/Yz6LCjC+zR2w8hJe6R1JwQ4J+HP66xS0DHVaeIqmtVMa3fkDw9hGsmKeNtfDluRKYESKRqbnCWhljuSZWXnc4FIVbQQZuNOnUIg+QG4KaTEa1m+Kud9CWtoQN4i4PZJS2fdEEaB3UyXH/vXLt1PqWpMVCRMJmfYUl3Cr26sJ6vkFmzHRoujUepvrhCzcVY2GuPk+jnZKmj9wECn5DBCVjQXiK0HUHAAceOJXSbDg1U62LJW+6uwBgzWOYx7rKC52Ll+N37aoLrzowbq6vW4yRuWtKV63cLvN86fY17sY+c4/QLhn+d5o81A6jmJE43tfirhoXi92748tUio8avptabtb9rMZK/fiZmRTGMxsmH/JFqfAboC+umjCqmem6homI27I3E/rxA2L4Vx1dm2JZbnMiVYuexc4dkxwDaO/eE+DjxqjKs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(23010399003)(56012099006)(5023799004)(11063799006)(4143699003)(261009220027099003)(261009221227099003)(261009223027099003)(261009221727099003)(261009223327099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tZYP/qz5u9+lUsHmv17E8QyHYJHt7aIefAEdg3et3JfbvUgoLsQAGXKzxk+R?=
 =?us-ascii?Q?g1ESsJ/mEdp262S3CymygpZoSrOryUCOReCo3bVAZcD7dAEWBqWirP+I/Ial?=
 =?us-ascii?Q?7zPTf/tNfJ7g6hP3k3g9wWJvl2dOfwNVQprNCzFi6VGHBPhNBwNs8Ij7Q5jT?=
 =?us-ascii?Q?lj2nVBovK99m/a9C/GxSQBc5rz2OsMSlepr71UsfzzhzUWz1DYwVtv+KX9ek?=
 =?us-ascii?Q?6a2UXZPwO1hcwR6yMdC0JImuCyxXSvfhKDfDqsKxvFy+mhHU1mzjFrndh043?=
 =?us-ascii?Q?yR1XAoX6ra3nZKkTtkwZFkdKCLjfwBUb9zZrUB5+DbeCGasciiw2eJ8e/aQ1?=
 =?us-ascii?Q?ZuqH//27aZNLazWQs7pb8B0cA/n49ze/y/V5Cj6yzsEfG7knri3AYbOk1ceI?=
 =?us-ascii?Q?xMHYpNVOFqu7Vo/Z5p565jVrpTOO89QKh/Uvb/8P8u2dxc93NYWWFRkFnlEP?=
 =?us-ascii?Q?LYoL3SRkT2i1ngMJNSk6XxSCKRN0+wOE+4w1z8KPOcdOIlfo6vrHEZY7HvQI?=
 =?us-ascii?Q?6d+1BIHfht0R91B/lrNaw8MvxrjCag79ayTuWFDVxtFPFYLYv0ax2zQHOaM4?=
 =?us-ascii?Q?Ans8y0awZfgGgVM5M7cbvhRy6lf1JlU2j1GGBQrIszEBK+2AqsjlD265EbjE?=
 =?us-ascii?Q?+DR2LeFJo506dB1sjH/qBPTpAMSKNzIk2oqbfr7Ej5uS1KbAEO4ba8g9Fo0a?=
 =?us-ascii?Q?c8zMsBrvwa41TG+4FGM2eIri6zIVXj4Pp6VESjmD0fphjszY+20cg1IUMfrt?=
 =?us-ascii?Q?QmGyegCSzEdWdDcFitUswb3fVspBhoN9r4Dmhlv2xIA+0+e3UcD2/XKQ8Zlz?=
 =?us-ascii?Q?IS+pBGx5HmGwn7FGzNINH7L0Naj8FLSuKl/8+4hRO6iucZ8dtimHK8Hyej/j?=
 =?us-ascii?Q?J/1EbpwNu6HzxQvdewJdHclB33Im5NFbg2DGR9LPBd/0fVDKiJUeoldEPB9/?=
 =?us-ascii?Q?+m8ddmK6Ub56vIyKOJRv6F/ZK+YqKJSLR8fuHhMisLSVksnUra50A1Y+bSSa?=
 =?us-ascii?Q?b7KyacF9RYxrgSDMknYOloafTOsEOyeydLnlYiCSMLgxK0a7k+3fphGvnRXV?=
 =?us-ascii?Q?Ch8iYXKgmHIUO27LaSIOK1yYpF4Ppf/ekSElKXZZDo50XVjzztNtzQgieDPI?=
 =?us-ascii?Q?z0aGKIJcSf1qp/tkKSXAAJz9XOFd/1DcqgF4qJ9ODj/kp+T+QCHmLvr68kE2?=
 =?us-ascii?Q?WTTGSJpYbhmlFmFaEAhUjUbIJVekGlIU21jVPm/OWPPr/wrL0mfvA2nTBP15?=
 =?us-ascii?Q?X6DZ64Dyz/GS+w5j7rjA41janO5pHeNOBzXFz3ZkdycaOhYIPRIoyNvllJa9?=
 =?us-ascii?Q?9483J306SX57QKM89f2+efAxLknQ/cB9x/mjXkcuV0yw8vaGzSMlqFnzxStE?=
 =?us-ascii?Q?rbwvz9PIss9GFlkVQNI4ewD/5/F1ABZPsmsiiXkMhSW49C8OTBDr3PNFEUTH?=
 =?us-ascii?Q?yWkgVq+vs6WiSM5q8gUxaNNEg6831EXAWlRJ4udieaIAMwG4E5rzD/A3eT+s?=
 =?us-ascii?Q?7Z9gyqYzT9KIJ+JYMoLj/+mlyAVNjTNh9IAfP9LVq21OyC3ZnHSmCRpExyUv?=
 =?us-ascii?Q?/sbgEeLlumyrS4Rd/7LKgBxqk6LrEI8vqgy70WoL7SkAU1J6jSf4vhFm88+/?=
 =?us-ascii?Q?VgB1J5qvSfikZlSKPPk6o6hORTX1crseM7Dt5sW7j7HUqSYNB6Yy+UKlcuUr?=
 =?us-ascii?Q?9GjkVLmOWKFhtr83Gx3V7TGngkf2zWIIxnT/2oxDLtYZrmdB94LIamGjBZj7?=
 =?us-ascii?Q?aScwD5cw7kzJBfXztha3D556nn40imehrulMdLiP6RBYOItPP+RZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b15d9279-6b83-40a1-86a9-08df28969f42
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 19:25:49.5793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJjPu10eH0GCyJo2KzQir2R/dd6X/E3FDxjLMWM16jtmQk/IE8A5YGOwQKkME2IUnD9NQvQ1NXiMFhvqGsgqvThmm5IOWFGY71Eoh+kZi+u9gRIDr6x6LVpkWLJOTM4N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7162

On Sat, Oct 10, 2026 at 08:26:44AM +0000, Zhipeng Wang (OSS) wrote:
> > Subject: Re: [PATCH v6 4/9] irqchip/imx-irqsteer: Convert to
> > devm_pm_runtime_set_active_enabled()
> >
>
> NXP Confidential
> > On Thu, Oct 08, 2026 at 06:02:26PM +0900, Zhipeng.wang_1@oss.nxp.com
> > wrote:
> > > From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> > >
> > > imx_irqsteer_probe() enables runtime PM with pm_runtime_enable(), but
> > > imx_irqsteer_remove() never disables it. Runtime PM therefore stays
> > > enabled after the device is unbound, and rebinding it triggers:
> > >
> > >   Unbalanced pm_runtime_enable!
> > >
> > > Use devm_pm_runtime_set_active_enabled() so the driver core marks the
> > > device active (matching the enabled clock) and disables runtime PM
> > > again on unbind, keeping the enable balanced across unbind/rebind.
> > >
> > > This becomes reachable once the driver can be unbound and reloaded,
> > > but the imbalance already exists today on unbind, so fix it separately
> > > with a Fixes tag for stable.
> > >
> > > Fixes: 4730d2233311 ("irqchip/imx-irqsteer: Add runtime PM support")
> > > Suggested-by: Fabio Estevam <festevam@nabladev.com>
> > > Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> > > ---
> > >  drivers/irqchip/irq-imx-irqsteer.c | 10 ++++++----
> > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/irqchip/irq-imx-irqsteer.c
> > > b/drivers/irqchip/irq-imx-irqsteer.c
> > > index d05de3d26fb2..5acc04504e52 100644
> > > --- a/drivers/irqchip/irq-imx-irqsteer.c
> > > +++ b/drivers/irqchip/irq-imx-irqsteer.c
> > > @@ -239,6 +239,10 @@ static int imx_irqsteer_probe(struct
> > platform_device *pdev)
> > >     if (irqsteer_has_chanctrl(data->devtype_data))
> > >             writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
> > >
> > > +   ret = devm_pm_runtime_set_active_enabled(&pdev->dev);
> > > +   if (ret)
> > > +           goto out;
> > > +
> > >     data->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev),
> > data->reg_num * 32,
> > >                                             &imx_irqsteer_domain_ops, data);
> > >     if (!data->domain) {
> > > @@ -260,9 +264,6 @@ static int imx_irqsteer_probe(struct
> > > platform_device *pdev)
> > >
> > >     platform_set_drvdata(pdev, data);
> > >
> > > -   pm_runtime_set_active(&pdev->dev);
> > > -   pm_runtime_enable(&pdev->dev);
> > > -
> > >     return 0;
> > >  out:
> > >     clk_disable_unprepare(data->ipg_clk);
> > > @@ -285,7 +286,8 @@ static void imx_irqsteer_remove(struct
> > > platform_device *pdev)
> > >
> > >     irq_domain_remove(irqsteer_data->domain);
> > >
> > > -   clk_disable_unprepare(irqsteer_data->ipg_clk);
> > > +   if (!pm_runtime_status_suspended(&pdev->dev))
> > > +           clk_disable_unprepare(irqsteer_data->ipg_clk);
> >
> > Are you sure need do this? suppose runtime_pm tear down call runtime pm
> > susped to disable clock.
> >
> > Frank
> >
> Hi Frank,
>
> I don't think the devres teardown disables the clock here.
>
> devm_pm_runtime_set_active_enabled() registers two devres actions that
> run on unbind: pm_runtime_disable() and pm_runtime_set_suspended().
> pm_runtime_set_suspended() only sets the status to RPM_SUSPENDED via
> __pm_runtime_set_status(); it does not invoke the ->runtime_suspend
> callback. So imx_irqsteer_suspend() is not called at teardown and the
> clock is not disabled by runtime PM.
>
> At this patch the clock is still managed by hand (devm_clk_get() plus
> clk_prepare_enable() in probe()), so remove() has to clk_disable_unprepare()
> to balance it. The pm_runtime_status_suspended() guard is there for the
> case where the device is already runtime-suspended at unbind: the runtime
> suspend callback has then already dropped the clock, so remove() must not
> disable it a second time, otherwise the enable count underflows.
>
> The later patch "Let devres own the clock" switches to
> devm_clk_get_enabled(), and at that point this manual clk_disable_unprepare()
> (and the guard) is removed, replaced by a pm_runtime_resume_and_get() /
> pm_runtime_put_noidle() pair.

Okay

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Thanks,
> Zhipeng
>
> > >  }
> > >
> > >  #ifdef CONFIG_PM
> > > --
> > > 2.34.1
> > >
> > >
