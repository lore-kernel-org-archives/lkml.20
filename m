Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010036.outbound.protection.outlook.com [52.101.84.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68646455632;
	Mon,  7 Sep 2026 10:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775319; cv=fail; b=PGg+Kw6Og+yXyFnuRePvWSXA2BYBhuhMYyazlc8MRfm0C8tADoow7bxoFD3xD0P6zRAg8k8xPN1Fs4U8lz5Cbd09keLhL+CMn3lTFydL7QJleJJ+5bDo4QiCR5jXIistVdeTT+vmNNYDA+SZmM2N8zRbmpYdinr2UPQgbWRxDP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775319; c=relaxed/simple;
	bh=hHkYG3qG9n1NT547Weof9YGSEnBjY7h4+RDhCDYv+40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UM4xvrYgbCV0ZoFM1nWTBipyzcZGevpTrP1F4u/JLHEHo1Wr3Ri2N2gOUUiuWkWD/IsH5JqMj9B+BLTRpgG0EKAYW/RweQsq3YyFNAz8vdwLBbRaFdL8QBEHHFGetHGcYe9LO89AJzhtoOrFMd7v+3XdSi2q6PRg69EOiXcyUx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=inWu4NuV; arc=fail smtp.client-ip=52.101.84.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="inWu4NuV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RgTmFvm0TdwZdIl1Z2SiTp3FkEW/Kr1drXnYtCG3LNNwGobLxbpJpaASVIlrSV9pw3AKOaZ5VAWk3Gleujxb/cAHyPoO0wfYdpqUOuHaZqZroWjqIL2VirhI9y/qt1reMUO0zaIMAZGqiIsSxUvqwMUugyNu+qZvG181exh+BANptL73deFdeXLLOmw//tDoHxjAQ+x/ynXHwjF3+poCM5D+IfxfbjtrmhXN4CbU8MYZ+ggJv17F0s6NEnG1YgGWCpjlo/gn6+PBtfYVwaQjFk0TBhRxBM/Jqqt1D8UmxszAIKssJCwvzVsVSNHk8fliJExdpnNxA+hUc/3G7m1ldQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUbWOUAy6bD0lNRovlxtkgTdrCGbpNu/vK6NAe2IZto=;
 b=Q71N5+fEsexhjq3Wo8iyJ3OwFXXAefXM3fvL+GrspYeRK+rg/FbFiModPjVSB8JY19hZeAg9p/4Vv5piySFql3FvaTe5mKF3BGEo8hAOd/sBEw8gzxwet+IZ3J6akNbQtjJx0njuu/jf8kzbe+hHv2RJkMcBRy1thSIYfr1gDFjBr78l2bz33t1zKuod/ahx64RLMkzdbtB3waz5s9aZltKu8VhxYKV6d4R1yL6XYlaTh3xYyfACUPiHJ9oRvBAwVIxcvKus57UaNYR60OrsjdWhp4n12LtcUay084yHoBOhMH2N078SizMhgFs4ushlFaf0KqblEfCk9F76uvIwnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUbWOUAy6bD0lNRovlxtkgTdrCGbpNu/vK6NAe2IZto=;
 b=inWu4NuV/iaSz4ZEYrEK4avmFEQzZLd3LJWRhgae49ATC5nmTY///Vdm+0cIpHI4OOBgsAIKKyeGa+4dVRDpiMtKb3jIMeHB81xfJtgAt1HLP1XQ/B3pKNou27MFJRfXWFD0MGLptbRuEL1CleFb8mWMqcukY80Ew6ez8KqohrlY6MF3dsWMx8SoAPn0bElT61XLiipHmStIkZGpo2LX0RV90OZE3sZEp4SXeiiLDGawci958EqFNTztVtsTfvkm6w56TBI7GlwOtYra3VWwWCgKQy6cJvWwnWnP1c+Lv0Q2FzAN9VuRXm/5PayPmFm7c5SP9fK81beeQ2eMvPuHNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by BR2PR04MB220822.eurprd04.prod.outlook.com (2603:10a6:2c8:6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 10:01:55 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 10:01:55 +0000
Date: Mon, 7 Sep 2026 17:59:34 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org, 
	alexander.shishkin@linux.intel.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: chipidea: otg: fix invalid role name print when no
 current role
Message-ID: <nslurpl6ish3fekdvy2s2cepqw2l5ylg4q7sg335r6fnxjfl5q@imnxij7aqeob>
References: <20260901060150.1667914-1-xu.yang_2@oss.nxp.com>
 <apcn76jpNlMfaSe_@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apcn76jpNlMfaSe_@SMW015318>
X-ClientProxiedBy: MA5P287CA0101.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::15) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|BR2PR04MB220822:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e659086-e27a-4c6f-9858-08df0cc70bfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|23010399003|1800799024|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sqYhWexV46v/tilu5yEJzEVt1arcPI7I68t/Z+mAdMrQPJavQKR9n6WiHHhY2d+h2plJ8fg6vMCV5jbfscbLdpQkGo2ENm9wryij2ffmGCURHAVaGRhuo0e2YTNaAw8WJszHb3YRzmrA7lHjRtBRmnnQIZCoHhJb8A6eoL2hXn94ZJpKy/TF2Usn4jRfHGdCchOrffkZWZVGCmqO+95aT/fxKJazBam3Fhrd0pK3KNpPoo2yENVGiHrOodVjleLlK98nCHyzxjIxa18sssN5+/bDPsYfdxa9jZLW4tWkHkcOu0jkQRsp5b3UZ8GdmUi7UszPTYU+rfZZKLVxILitGRnzJPY3j6c3fGslqKhW3Qb1MhQxiY625ntrCZHOFwNv/30lEpNC89H6I7ahwWys2x7kIlaTAwB0sxJpkMOJDkuDDuccMX4qE09OFM/28vlvnXPEXh+B4WXAcJSa+E5Vziij1U0IxIvoOq3Q9XDtWSN2BakPaeiPLpB1U6pz7SJDLhgddYw8JyVnIuPlhGdtGJYrXWCeCEjxxWN+R3nzpvu9ZYDmOy4yVHOKM9Qe+W80aNN/p6/UBHXk9+es+FbXGg0KAjwThT+bVSM411ANdkTupbMAYFGdghQnIxhd+6U2U3WZeCuIDDCKNLlQWOU2AUjXaVGvcdYNX1me6Tphfzo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(23010399003)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2/sy4w2xdQfKpNz52cY+hOzzQDtObJlS6YHDZJXs4xwqXNbgPgxJlLgivcWu?=
 =?us-ascii?Q?78uZ7NNTZLeqrIHENH0+q1YDqQOSMrs4bmo//MwyW5oPaEcY51v16iuFyA1j?=
 =?us-ascii?Q?wkrHItZVpl2m1zPkaNadMjCbR8pmO6KPN+cXlOfzBpHjIHBL2KzLwKM/Wmlm?=
 =?us-ascii?Q?Q53Xy0v8QndzbqBeExI5eRZkm9HwCdZQGvrmPRA78bOq34wfgzkMGbSDozM5?=
 =?us-ascii?Q?oS9DEqGJFGTCbwCY9wNfTdRO9YnhgQeNdcFMv77xmcRImE35sJJTGZQPLuAC?=
 =?us-ascii?Q?CwUqJJ5cRSMdgQwW+56s7oiblwJypqkjOMB1tSjZkaQ4Al/CVp0nsGNZ31pu?=
 =?us-ascii?Q?vALYn3oNuq2ApjwhH8MOjR9x/BN4N5m2Dd/Bb0KKvRRnmotNkhW9p05KBZ0X?=
 =?us-ascii?Q?YoGlP3H2ziKEnfRCtpOvDYDiYrbVNNWJbC4Y61eFJxBqs4QY4RCN1daYmnt9?=
 =?us-ascii?Q?+LOloDvxQo4ZeK+zKWZbAlnuyahcO3LWM0M4cJHHG+p4vV4rSWS92S/RRSkd?=
 =?us-ascii?Q?W5W+PjqtQ1ooqbTQwhzat5Qc483oE3VxEv3GlmW11bpkBrsBOv426mMVLM+H?=
 =?us-ascii?Q?g0QWpuTmrbMieglZib6BchKDnjxtII4EL6npaD2mS5kFbQuvjIWs5HxChntz?=
 =?us-ascii?Q?mWA6c7hSNwg8r3OT+wXXdAZhGhdN+7dpMltoeXEprmhKJd3T/gxD+8QWm7tl?=
 =?us-ascii?Q?P7BM8fXch7oT4j/zkg3RSnm9eF/bi6vJXfPx9PYOLPkx0oDmCUuqqhbz1sLd?=
 =?us-ascii?Q?VfTEWL4O0/S8JmMOOrrmjNXSj8S1qFzryd7BW4iUVrH8/f6dpYgS2z9RvYHN?=
 =?us-ascii?Q?wHzEK64I5srPjlgoLQUHDsfRXF+srdMbvK+jBpRoZgHTdXKsMSrqBBDBaPEO?=
 =?us-ascii?Q?svl62k+gS4oaskkdDGPckMIbH9KuoRpnNNTGS83VfsiiI7UPBD8vCAdCI7GT?=
 =?us-ascii?Q?e02lj6ejwsuo7+kkShPkbkxKEXRVf0b5kZzEWuDnS4CKdTlAPFBko6rbNa2L?=
 =?us-ascii?Q?O+wgMu4N7AdaolEETjx8OKDCTLpU7pcynPuSQB3VTppoJ6OS0idBcrYDBUXX?=
 =?us-ascii?Q?YXDO1BZiQpSGPke6GhgBB18oj0qThEmCYN9nSCllFK1RJi20KFcB0HkxigUr?=
 =?us-ascii?Q?Df4mR3zQX4v0rnL/p/keKf5FkZ4hpQsloY9t9Cx864FeYENURzYfxJDeOQJd?=
 =?us-ascii?Q?vVO4vRhOEFEYrPBLqQNCEJDHQ2pMyvT12hFGYZkqVtsJ2h/5+hlkjm05DFZg?=
 =?us-ascii?Q?I0oBhH48LgJUX7Y+yABfmQw6lN9T/ebLaOAhG/Bg3VOV9yBo9yc5ahJJkYEe?=
 =?us-ascii?Q?MBm+ytx6Za77GtogC+p+J9JzsEIRQb/bhcKV3UBQ9TJAGScqD3VDJGVjmPqx?=
 =?us-ascii?Q?c+mJZk2MzQyPM6f8Oarat+LwujdXcv4kJ5kSs/9W5hj/TGN9dOnRhzlsVm4h?=
 =?us-ascii?Q?ZgTxlQ2ixOtWBGKemYVtCnZzi2KkX7XnHT84m/4MGb0xtJ8whvp1P+q+AJxj?=
 =?us-ascii?Q?DiTKHRbE+CmBRhSXAwGUJG9arRnfvuefpfClyJwBRe+aoUULoIatlRqA6Tna?=
 =?us-ascii?Q?T4+NR2Ylub+4vEKxzjOEJdYIvBAcVgLZe9BrdT/b7teB1fS/405EqD7Efw7B?=
 =?us-ascii?Q?+hwopAokDpxLp6bh5/tqB3cym7Jq/Nrz8T0AYdcbF945n87Ky/n0Q/6tGf+u?=
 =?us-ascii?Q?pLw8FUjGiwupEzwGQVOZ/0s8Uogo5DfSli5QtN2snblarHuOzHGNptnMwVfB?=
 =?us-ascii?Q?Q4dgegIX9Hxf0G01GgCkGPo5mqPRbDLG/P3wsCKVXpGWM0umcDvh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e659086-e27a-4c6f-9858-08df0cc70bfb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 10:01:55.2763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWL2FKiq31a1f0m9pWwLZjsNtrnMW7dL8yXWgqA8cGY4p5OzXXLgp8PNG3ax/HPzk2eDFTMgZ68FU1p0UI3mj8ob+pXDx4QqS1MKAlUmdWNgZKTAK/DA4iamXe8EH7LH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR2PR04MB220822

On Tue, Sep 01, 2026 at 02:30:55PM -0500, Frank Li wrote:
> On Tue, Sep 01, 2026 at 02:01:50PM +0800, Xu Yang wrote:
> > From: Xu Yang <xu.yang_2@nxp.com>
> >
> > ci_handle_id_switch() prints the role transition via ci_role(ci)->name
> > for the current role, but when ci->role is CI_ROLE_END (no role
> > assigned yet), ci_role(ci) call BUG_ON() and return ci->roles[CI_ROLE_END]
> > which is NULL, causing a NULL pointer dereference in the debug print.
> 
> This should be out of boundery access,
> 
> struct ci_role_driver           *roles[CI_ROLE_END];
> 
> ci->roles[CI_ROLE_END] to access next field,
>         enum ci_role                    role;
>         bool                            is_otg;
> 
> NULL should be "luck" value.

Yes, it's true.

> 
> >
> > This can happen if ci_role_start() fails during a role switch, since
> > ci_role_stop() has already set ci->role to CI_ROLE_END.
> >
> > Fix it by printing "none" instead of dereferencing ci_role(ci)->name
> > when ci->role is CI_ROLE_END.
> >
> > Fixes: cbec6bd55a45 ("usb: chipidea: move otg related things to otg file")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/chipidea/otg.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
> > index fecc7d7e2f0d..457417e81b78 100644
> > --- a/drivers/usb/chipidea/otg.c
> > +++ b/drivers/usb/chipidea/otg.c
> > @@ -179,7 +179,8 @@ void ci_handle_id_switch(struct ci_hdrc *ci)
> >  	role = ci_otg_role(ci);
> >  	if (role != ci->role) {
> >  		dev_dbg(ci->dev, "switching from %s to %s\n",
> > -			ci_role(ci)->name, ci->roles[role]->name);
> > +			ci->role == CI_ROLE_END ? "none" : ci_role(ci)->name,
> > +			ci->roles[role]->name);
> 
> This is out of boundery check
> 
> 	ci->role >= CI_ROLE_END  or ci-role < CI_ROLE_END, and revert :

OK.

Thanks,
Xu Yang
