Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793934614;
	b=Nlo6eXLSsM0f0DH6ADciVjvtRboRnpQFlYrwXZjTccGWX1F0p7Wqi3guA7jacxp3xwXJ
	 tGaQodHd6hpIH5f1I9v/SMemUQLROSHFvusw4wsopDc0YF3R6GpOVEb08QKDrij/eaxrn
	 ZRLxmPaoouMcophQx518EBiWiqMVX+fCFPrYvOiyLZKErlyTz43clkAflEjcFYZuTrgay
	 WZyQqw9QUZ4WvQVefkQ2YdcTGgs00q27KfFzxw59OJ7k2NowobeqyrpSvZxeiejuIop0a
	 nyhDhvjNZEXljKT+mkeU5ynbKRzYFaitiJwFlnVe72YyDRuB9N/YHKmmsu/LBdIxfFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934614;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=7gfh1Ea+KTYtelW/sUPpuMLHGHcgIg+3lhj9fL2dG4c=;
	b=XBnkyCBZjebO8a02gfpAC4nsDXqffSWLaOqcs3J41JJiLRcK70i3fahSwgLqBENB/qaQ
	 HFODf1pcOyeeduojdMZxmQ+3lKIjZ9o8UIYoVP8vuaYwp348wW+sseMUdVrv201ZR4z5z
	 9/tlEzTcJi2PWzKKTdsh+HZ8IhB4/CqiqvfCZN4Cx/rlmYDftZ0jGWAZkoT2YRnRuB6MO
	 cGQBkLUqBbh/Rs4hl7eZJeHFvzg1XjmP3F2mfjHAdCO3zXrtZVkAss30UkGEf5BMloyHS
	 DjZN9+Zo6Z6v96j05gRKP14kT3op/jO1p5pThOQ5/yWRZu6UsuN63a/0A4l9ENNSIBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=YGNxxOOF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.0
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013000.outbound.protection.outlook.com [52.101.83.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546D9606A326;
	Fri,  6 Nov 2026 03:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 546D9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=YGNxxOOF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F9kPf994FW8hh5qBQm947Zg4tYCJVLK5fzqdPzoqSOpL0s9rKy0goZhyhwDOAO7FsZUNYyw/1F7eSOYQxSQn+bicm8NLmLWySkJk8FOp8Mk29iwEc7eVnoIV3CNUj0KzeLGbBq6MGt2aeuQDcyxG7O4ZhVdUh5PxcmtHpUKpZSS2jrwo44OPrJ1q+gX0Vb6O6uhhH6Yql81aqTcOQkrJRtyrBgSKsyYK5OCYTqrlLBtrQx7tITacRd39j1n+xlY5MuVk8KLSLxqGsHSasmlMD9lCLp7DIZwFlT/Fdu2FR5VCHJ6MGmIEaP3L6RakLrGK9U27Ni1wiAsGzdx1BKGf8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gfh1Ea+KTYtelW/sUPpuMLHGHcgIg+3lhj9fL2dG4c=;
 b=Sh78TEu3pnpfeOFwPe3xGRh8wLO9eWkCyf/gH6blidwYevBSUruf+PgFjPqMvlPM0CEHLkSaYiNk+YvMIj+HsX7sASpt/vSK0JjWbtb80OpNjUaBtXUvsdhPhJt/siRyDVTAddEP1txidvFNPK3ydbGRZI7MrS4VYu43lhm/J1Q+M4N3NeKg4Y6/Ci1opqv4C5geR2Sgk7rGNgeGpHrmBNzctMQ4Ku2Rc4/eeBO3h9btL32MMoclcaVe1eh8YkKQ7RXSskkSJeIEUX8xKanJYV6VO88IeemsQv7wqbsBrHfccPkjBIkYmMaVg0/jTxuDbBd7Tewy7EmxaBZbOnbadg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gfh1Ea+KTYtelW/sUPpuMLHGHcgIg+3lhj9fL2dG4c=;
 b=YGNxxOOFPndpYPEpuvjohAVEaNk0O+i6L3nGM9/cInyOM8pfIeHaZGTS/beanwJhfmJj1eyIfCBLDGqTgBmX8JetsGxSOiNEKHG7+mc6S/EQs4wCx6SweGj75iD/eRrE7105roo218znHPj0J6PszYXUJ/8pcKkj/kgdMhJ69/JcVw26oRZbNoXcGeKwOeBTgYJjCql8RVwNHAzRW4YIRwGEBMOA0a6XDBykgerYNLPzR26Z+vCAVboCsh54j7NByy2dx1+ixwLGhhb+Ot+5v6e98NxQREyuNQmKVfTm+UGgj5zrYbN6690zEy4FnsiJG3JGHl69jA3W4qY4r6peUQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by ZR6PR04MB579899.eurprd04.prod.outlook.com (2603:10a6:910:e1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 03:10:11 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 03:10:10 +0000
Date: Fri, 6 Nov 2026 11:07:12 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, jun.li@nxp.com, badhri@google.com, 
	heikki.krogerus@linux.intel.com
Subject: Re: [PATCH v2] usb: typec: tcpm: advance vdm_discovery_state on
 Discover Identity Not_Supported
Message-ID: <eqdhulaftczpqnhu37rmf3ajdpntjnlz53tx2q7ugabzkrqfe2@amdz7hafys4w>
References: <20260916043957.3362995-1-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916043957.3362995-1-xu.yang_2@oss.nxp.com>
X-ClientProxiedBy: FR4P281CA0352.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::6) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|ZR6PR04MB579899:EE_
X-MS-Office365-Filtering-Correlation-Id: f5273c87-16d1-4939-c21a-08df3bb377cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|19092799006|261021123027099003|11063799006|56012099006|261021121427099003|261009223027099003|261022113327099003|261026121527099003|261102123227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Brn/VmWUAFWTU+MHBzcMTMuxawd3R0reh7RB+dHK+QQQcDSE/ni11neEzGhE9FkH9qHgXMP7sRVY/Dbb8/++jhHEn7YpyOD0JYzqikZ6CwqtE6tyxbNNzR6w8EAyvO18U3NCwnoaqnKEkvigBz3HBQWDJ3yZfjc8N9gzv5ceqtBMicmWJ+KsNs+smdLvXMERKIYb3U9tnLx36ImgSU5wY4r4msIRicqS0LvnymsVzNUcwAjqijHEAm09SdVnYwO/gDEZfBNLJEJFsG+9Q7LJZ1tgJ7P4A0GRxtxj3LebGebPxqp6PhquGnzQsl09djbwSLXxcd73ko2v+pmkqWAMrMEcv2mXDO7RFTfXG4F5vl5bWK0Ar2HsPipVD6igOGSgppquXFJk7Ys8wegR3SDMQBXNVhdppPz3Ftj3Jnn5JMnwnreWME5fZL2QSFoo3Du27tfMJ2XUrKJYZ8epRCsmLm++T6ExtXXxZD5/1a7c0AybXJv9LHS4zpjon+sULqbhceNih6aNMKlxgrrvlCARjZV2E1rglcbpxLVF2fwJt8gLQHUU42oGhHmQOtDXPOO8mhlnAQdPB70wo3Siq8maI3V+FDnvlHcMNDNf6j6rlwvDoIOo7mItUmEZ1V5gOH0X/wG3A8QLIHElQQiwfPAiga36hMzrhf3Hfmt43JeffL0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(19092799006)(261021123027099003)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261022113327099003)(261026121527099003)(261102123227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ABrH2+ctFVvCLjcYarzAZqDduxAr/QCJxjpAFs7hMbJm74nSkl3EGX7t1aDV?=
 =?us-ascii?Q?JbPHy35d/nxRIf1p07v/iehRhgsMu0JdK1WA750zX7+4rtBzyQ2E+s1wuqPF?=
 =?us-ascii?Q?kFA/6JdAU2Rlxu6oXasMR3vYVJs0VJ6uQbydd7WY+qJrabil55yh4fqusWaM?=
 =?us-ascii?Q?6J1kKkD78cTBDdSALvMG/mbKCen0ApnXNI0XXZ0l3vlapuGEpjVSR3p2vH2H?=
 =?us-ascii?Q?HAzomAXMMbwCO0uWVkyLltwkxkpbTsEtltcGsBLR7sb/NrK43uOV0esTa02o?=
 =?us-ascii?Q?xxq1Unrceam9kYy8/GfDCbpTslen4I1iJnCO94PX4Bj13XnPv8oFf8ngwhdw?=
 =?us-ascii?Q?0AXM2xBikf2YQ3j1B5+2NsAkn/ZHOZZaz0qKYMaKS65EIPYmvyMlBdu98PSI?=
 =?us-ascii?Q?WaXiO6/aHVOXjwvr+5en0+UN1LJtgP6DjDOJBiyQBSPo32TCuX4t1QsI3TvU?=
 =?us-ascii?Q?qy/pBC5qUJtzhYSGGPJftgUZTYloQXHEmhkA6KDq9PfD8/Yyk9JadFtiW+/o?=
 =?us-ascii?Q?zZhOUo0D7BEfoU8DCnETTLfz0BlExr71Z8FoTFuE2SD6hQHqTfQMtE/42S0x?=
 =?us-ascii?Q?f4HmT7pcGaElSX4t1qzkWGKncTZFY2KIUxXQIHMH4k3X5F0yD98NUH4jk+Uj?=
 =?us-ascii?Q?r6E+V4m1lqm2vYiV/kBMFO0MVteozSUihHMAHh/7yuFJRg7VKQKNO0QW13sQ?=
 =?us-ascii?Q?7VjRaRaPebq6rn6Hz4rkg37Hn2DccGeaXHvVfLuWkSaP+XQrCse82UmrQIR/?=
 =?us-ascii?Q?7xGKbO0zqBIE92uX6FdfpPIlj0vFUVKMv1LEkwB7g8xYCJDO2p9OJG36iT76?=
 =?us-ascii?Q?2HDyuDxtEWzLSjaQoQcHyY3M84vwGm9OuO6ozMamLWYeDaySyh/b68QfQHHy?=
 =?us-ascii?Q?uR2naUaqF5q8w9O9de+gE+H0+5YhzsS+DPt5Ld2zIR55KHy5uHKpXE1WxklR?=
 =?us-ascii?Q?Nfp9tjIiWUfognheCmY4Fvig4BlRKrIRltHcnnnxDC0Cz4EXJ/FUnu7VTivc?=
 =?us-ascii?Q?CAnGHdqN+HvTSAFRgIG1+xOBC0uiN9CDbnT4m38H3/nRrMPrXgCSZTNM2NXc?=
 =?us-ascii?Q?BBhuvfha3uhAho8lstm1lggP1ycquIFLqk7p31cD9Wq8ifwjgholwMZilg7c?=
 =?us-ascii?Q?g7t9YOsRo9OfTV1tHMY2zd8aYRoMbCQ9ouYyGKoIbZApaEMJv9t54yxquXVL?=
 =?us-ascii?Q?JaG0X2iNWwThvRKYc/U0i6Xltp9hCvxovzaMF9omRHfg06NR7pS5Fk55J62c?=
 =?us-ascii?Q?+cmIS4gYqRrTtIvp46n/mXo7tCCpWeljxxTt0XxOFfTD6Fn9BDHwfYde6/ja?=
 =?us-ascii?Q?oMTxXyFDpzKSfDn1O9DIYPqsG3GneSBkCrOPRp4woneHE8yJLF9NUrtKmqAW?=
 =?us-ascii?Q?Nf9nB7zxRbmeqPMZClOqhOZadrwURYHDH7iy+i4sadPigRgFN1zTo83NdMAA?=
 =?us-ascii?Q?DOPHZIq6KVp/CL2mvDTYIKoP9JXoc7J6uG9ovA8U6Zwqp+UrHuI77ET8VTs0?=
 =?us-ascii?Q?VjkG+K902snNB8Wg9nwAv7kXfCcpQNwP5XHZ+B64vP3X4nTjygVlwVxImle3?=
 =?us-ascii?Q?/w5v26gsRZck/c+DrkP67gVra2JAPJ15PUboyIkkZuVJZL0qn1EYyqhqbmTh?=
 =?us-ascii?Q?s+eHoH0mNCAoFsqriYfanOV7x53rm7A+r5owwnJhbXCTcSqyTj8zXNRA3x34?=
 =?us-ascii?Q?+9R0J8CZUTPuOWZZEQXcTomE7cq5bVg+7CI5yDE4cCwfKqh+zeKmCsGxBXXb?=
 =?us-ascii?Q?b2CwjIXYq8Y2pVdXAPriZY0a9Q2axSMdLpRmrUkkXf93VN6T78Bp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5273c87-16d1-4939-c21a-08df3bb377cf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 03:10:10.6203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4poBbV1j0toMTZKiqQVeMEmQmBHK/BB/pb7Tcq0BVNVQXk0mVjqPieaCOiEQuQfD1ADtQHid7hXj1IVlJ8xsyFl3FO00n/TEAT/VQKvRgl2xb9C5u7wp0fh353UFFDoB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB579899

Hi Greg,

Can you pick this patch?
It's reviewed and pending for a long time.

Thanks,
Xu Yang

On Wed, Sep 16, 2026 at 12:39:57PM +0800, Xu Yang wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
> 
> Commit Fixes: 205dc9cb39f5 ("usb: typec: tcpm: implement retry mechanism
> for Discover Identity VDMs") advances vdm_discovery_state to
> VDM_DISCOVERY_COMPLETE when a CMDT_RSP_NAK is received, but it does not
> advance the state when a non-modal port returns PD_CTRL_NOT_SUPP.
> 
> This can re-arm another vdm_discovery_work if the port is going to
> respond with PD_CTRL_NOT_SUPP to the partner.
> 
>   tcpm_pd_handle_msg(port, PD_MSG_CTRL_NOT_SUPP, NONE_AMS);
>     tcpm_queue_message();
>       mod_tcpm_delayed_work();
>         tcpm_state_machine_work()
>           tcpm_send_queued_message()  -> send PD_MSG_CTRL_NOT_SUPP
>           run_state_machine()
>             case SRC_READY:
>             case SNK_READY:
>               mod_vdm_discovery_delayed_work(port, 0);
> 
> If both the port and its partner do not support modal operation, they
> will send DISCOVER_IDENTITY to each other infinitely.
> 
> Advance vdm_discovery_state to VDM_DISCOVERY_COMPLETE in this path as
> well. In particular, update the state to VDM_DISCOVERY_COMPLETE if it comes
> from the port partner, and to VDM_DISCOVERY_CABLE_IDENT if it comes from a
> cable.
> 
> Fixes: 205dc9cb39f5 ("usb: typec: tcpm: implement retry mechanism for Discover Identity VDMs")
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - cover a cable returns PD_CTRL_NOT_SUPP case reported by sashiko
>  - kick off vdm_discovery work to continue working
>  - correct previous wrong fix commit id
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 2d6b14aa2085..5cea820e00c4 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -3891,6 +3891,16 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
>  		case SRC_READY:
>  		case SNK_READY:
>  			if (port->vdm_state > VDM_STATE_READY) {
> +				if (port->ams == DISCOVER_IDENTITY) {
> +					if (rx_sop_type == TCPC_TX_SOP) {
> +						tcpm_update_vdm_discovery_state(port,
> +								VDM_DISCOVERY_COMPLETE);
> +					} else if (rx_sop_type == TCPC_TX_SOP_PRIME) {
> +						tcpm_update_vdm_discovery_state(port,
> +								VDM_DISCOVERY_CABLE_IDENT);
> +						mod_vdm_discovery_delayed_work(port, 0);
> +					}
> +				}
>  				port->vdm_state = VDM_STATE_DONE;
>  				if (tcpm_vdm_ams(port))
>  					tcpm_ams_finish(port);
> -- 
> 2.34.1
> 
