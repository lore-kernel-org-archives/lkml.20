Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793933766;
	b=40AaXapeurBSD0rrJ9PiRB/D9HJaCunqA1LZRAUJOwXdI5pDPmsrP3OOW5oQM6JXlnUS
	 qIhcaBk/qr0pJPmhK+lf6Vi9YODCoMm9jjN1yYM8E51dRJnAaORL1VwP8NCQiaV93h5/C
	 Phf1SCu1wNy8e+HkVnTzVBVxK4S+DeTZ2BrAilYDcuinvjhgHHrh6l9TqUjyBeObXtXYk
	 AuHNkfJnX4XiWZMb7L89McpWo4AvKNNYotQC+j9DPeqIxZJhC3FLf7kQDtkwruPBEZkm2
	 NoFYaYqlYOcukFd+nEI7n+SwJEnNEcbjdAjho20vk2U9uAXD9rxlMoGSLYUIzxN7Gyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793933766;
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
	bh=Chr07P4vExlZzWhA5b0/9Eby0s4ZiJ9u/gyBzPiNtng=;
	b=Mo015F6Gndk6ZKMvqlZ2MwRFH75hPi0YaK1vJH050kXS63AMXGVf3uTvOPVlow5e+ctV
	 j0WknlYeiMKoprJtklutQbZ8YD3DUB4S1tIzQDEfhc7NcB3dIR9btMJYIJDeHCPg/hJHI
	 pErlfYGZb5aiKtl3SN3lPMA5tPbpAgM92oq2i75PzFLWe2VX/U2rEgKcc7tfUjX93mY4l
	 64huP39cO04V3Vdi4We4+jg4GvtlA531vB/LlV+16GNV3bIYMzDsCqZckQJS81M3ybD3Z
	 7MpvWkXgJh6cmZx+09V+cOv++P/nelsA8pQlru4iWXp2XhYiyI0NUtzky2O+dsj/TFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=pdQFCy1I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.28
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010028.outbound.protection.outlook.com [52.101.84.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F4C606A326;
	Fri,  6 Nov 2026 02:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96F4C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=pdQFCy1I
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UnJggvhZQGxdT9G+6aKKqNr2vhiKKOcJMm8Yl01GpIvrVXYxkq3H53ZJHLJq387KZH+oAgjxZbEoHTh3xcKS2YHDnWnIfeuLsrhvA/ctFyJrm3RIFK77FeEmjPrEZ2O7wNg50df1joQg//urI0y9z250bLl1rIGPSlVF72bFIZTXlMWVl8ZC1qa5+GlF/Q0/FTRg2tYEIAtQmdFMe91G4n0o8rWBLijjl0ZwoPtNqAOXlcICPyqb6YT3WT/MPqMZK5HCpPmW5wa7wKWD3UJnGQB5WUWa9l9qbo1feudyoZzc8sTRfXqn+KH902EhQLfCKK4kM9w05YRlF5231LgYaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Chr07P4vExlZzWhA5b0/9Eby0s4ZiJ9u/gyBzPiNtng=;
 b=Wm3Zd8xaj5pYPwHIgGxcS5/a8edUh2f7CTPcWRMky5YIe1JojAi0zuOpsDE54dLx5rK8LTd4zlfJE71Ph2od2jC273GGvrwV4CG/P63CJzuWpqqjMJLzINzHu5wXtv9EXrv6Col90NAYP1wuIo6jGvgcbTtMZ+m3Gqvj+79qqw9oY67G4p3W8aK7hvF8bMnehvG3AeyQfOBcydrs2dPXEw7wyISv1P3x2Am/kbonHGbYlfRuRZkX3gmLL7WpkxDFOCAbo2TWYwjgwHDGcefiaNabG6kFHRtxqFUiThKeV1Kjj8I7IROM/NxbG+CA7Ccp5BRRrUX87TyYsTMN3XPbOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Chr07P4vExlZzWhA5b0/9Eby0s4ZiJ9u/gyBzPiNtng=;
 b=pdQFCy1I3K0csBTaqDB2NVuHY1fLn81dfiF4qogD28JAFmIP5ubA3e9CgLzmgD0hze6MjgpFsO7AI2NEYprKWqigBwp4l0wCh7hhG/AO6CLxOHGy5B/J5pufQhxwtZaj3UVb+SNSgC/qBgVreyUqMF9HPO0hXM3ilXKSub/pmMDQRqCZGaEJQS3yHt5ePI7WoJzIdV/4KMunUnMNZmtxT3OJ9IHJlLcyi2tpLglpQNRd1++CLFeJfVvWGor8hK/NFSBL5Q4ljPdVfcDF+OBpaQ5zlUarJW2DgnQP4pqeXMtrrcv5UXPJI2I2zw37ruci8QCW9m+P5QeBtSv7zfZqog==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by GV2PR04MB11836.eurprd04.prod.outlook.com (2603:10a6:150:2fe::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 02:56:02 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 02:56:01 +0000
Date: Fri, 6 Nov 2026 10:53:02 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Alexey Charkov <alchark@flipper.net>
Cc: Badhri Jagan Sridharan <badhri@google.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: Complete discovery when the partner
 lacks SVDM support
Message-ID: <jz5ydqlvyebv77yrzp4dwufavhxbadj6j5mq4ca6wvkaa4kdy4@g2l7syil2dvn>
References: <20261102-tcpm-discovery-no-svdm-v1-1-54bb9b613065@flipper.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-tcpm-discovery-no-svdm-v1-1-54bb9b613065@flipper.net>
X-ClientProxiedBy: FR2P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::16) To PAXPR04MB9422.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|GV2PR04MB11836:EE_
X-MS-Office365-Filtering-Correlation-Id: 156b6d63-aa42-4ed3-94eb-08df3bb17db0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|366016|1800799024|22082099003|18002099003|10067099003|56012099006|11063799006|5023799004|261021121427099003|261021123027099003|261026121527099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	/Y7wiWI9SmJU2qJr27oKhSWOYrWlxh3pnyB+AKFH1mYHwg8h/UdVqP/fokVjxcjihQ18UcTk9mOe+aFRhn4EYWC7CLFPX8O6vVj/DHbE4WXwieYm/76UwjJM6SSEaHfcAHx0NYHnNO4TWEHZsuhNBpF2ibYPsvk7HScZJ2gk1Fw8hdy+GQgi94sCxf6dSPES1dbhL2ruZMSVHEpeF649bnGJHt4HiU2b7GZcmxhqBRS+4ij13J3JYUcmLpSQeXxYUGyjgsuNS4WuS49G4x/w6BPz0TZ1HxdDAVtou96iZQY9MWd8mcN/HqZjaaIOa7cip7jOLbttDuoAxrdsA1b8Hp0BeOGWq0ieWJBsga8iyKaU85RfFVIY8fsF0u5ZeOVjDfTLJowvwiwCUxVgmhWms9NXDDJ98yBtTZ+k3KbJF2fe3nMLsGWxvC7vpjJWF6OUdKHqLzNG38Bq2IbbgNfW4x17bDuZsHa2Xbe8szvELjzQiPaNj2hg2FLOFV8fWy/qr21OgiOCK38QcFZ7QsAnZtsv1TWwiTZ4f2UzsT3Mys+xAQHBi0+cXpIRVeVD+vqlqWZJAV2DlrQWlbnnYnqP6tmqk9fMY90AaUVS3emxGHOfBVEr3c1ii3UwqsrUIv8a
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(5023799004)(261021121427099003)(261021123027099003)(261026121527099003)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AoZzd3XACv99ETr3Z21LY7xRL+zw4RkOnCf+L9l7w/YpbWRnG3xFBXLRQl/k?=
 =?us-ascii?Q?ezppn5xH7L25nwkX78fv5/uaKxQHTKuf8QnopDWLfayLyzZgOeyRrUX/JAkW?=
 =?us-ascii?Q?+bAVTWgl76UcI/6EALfWot5uzdh+0toVKl2FKo1NPiVO1wjpOBEUcEZlAqSF?=
 =?us-ascii?Q?OgHDoIEzJPUmzlfh8vdw03XHEdHwrC0wAKq9FXNHVEVFDUaSp6oIa9uSWfG/?=
 =?us-ascii?Q?9byU2ZXK3kz47QZwBk16SWbKolDvA65Z012/YJmBCUW5qwrFNuKM+2yc0Pm4?=
 =?us-ascii?Q?KMqczydfFiXSHSmWgJkr9xsQenkxAPsBHi+klNYNbGTcPGqC3tsH90ULEqUW?=
 =?us-ascii?Q?9aOvunTk1433EOvr3PWFnxkdEmvjo15j0A6X+aq+56jVPuVwqhEZEjRauIzI?=
 =?us-ascii?Q?1wF/EzjDBXDguKIUarKwSwQyh0z1eGHpnD6sDjm2iAlJBF7kUXslqJMDZExA?=
 =?us-ascii?Q?3MpcuAmMbWay9zx4ULTZlbvJUEjv1SIbTiGJOIWq7yYCffibq5Lu22ulPXRJ?=
 =?us-ascii?Q?mylbbNzq6SBelqEiP0hDGDDaB0xOKBGmblcDV4IYDEEl+4sCFtCIBhBXsOmM?=
 =?us-ascii?Q?T9vk4T6iOruATVxbqpdz+FyI3TKp/imb8yGyRlJ0Xz6OalrNelwJ5IJuKv26?=
 =?us-ascii?Q?plOs8DsRJT2GR7CtikgW4QZFM39rvOU+gSr+Vkpt/u5NLcUy43mJv5guOfkM?=
 =?us-ascii?Q?JMd3sbNJndCF91TJ9hDW1ZeBwTGo4BwL+Yb651dckPQCuM3of56LawiCD4dT?=
 =?us-ascii?Q?ANhUdFFUGztff5uY4HS6BpyDj4USqdOpiKZRpK5oh1vgHsoYC4eZuvCPWWis?=
 =?us-ascii?Q?AbAUfiy9uZOES32W+kxZhsMJiA34i4VxhbygzmESlJ6w+Syt6zdXe31czaHn?=
 =?us-ascii?Q?MKSuilORj56MRXTU4TFtMcBlMNqL06MU2LhVnHHql+NX+j80M6a4Dks7CXXu?=
 =?us-ascii?Q?58ZPAbJx+R96DmA3mGFcoDtbav75hr8IuMkKgXUqWAY0cGC59u3v7HWzHf+s?=
 =?us-ascii?Q?DrGYWy7lSwH1joLlWf1LWgsnjBa54iTSSAsiRPmY9bW+Nyfhxic6W5+6s2OE?=
 =?us-ascii?Q?kTPcmCvpZwNlOFhqYtqPKjF4CIrrDtxqnZNL1J48Z0fv0M6psfAgYJb07rZV?=
 =?us-ascii?Q?lj1vxAHn1CdezurhG2VepOK6Ws9zNFyUpUYh9hk7GwVdJkrvQAsviUMp+SKp?=
 =?us-ascii?Q?r/lAlpANG3Iy3IpkfBfIesZHKU2NAUAgY51Uyso3okDLSERcEfyJO8xJe3KP?=
 =?us-ascii?Q?xzsyJWZrxukVrbPJUj8xDomCqHOjF444CD5nJYrQpfIbvPCPf/FsBFfWRLuv?=
 =?us-ascii?Q?Bo2PavelfkaMcTJ77titn7iYlwSMBvKaDY/H2drZMIG91jh6FKin7AXUfD2n?=
 =?us-ascii?Q?A0jJukGradi3SfHCXNHxzD1uqnoxmH99oD42zZC/Vkomisu5K3cHOzO8gfnX?=
 =?us-ascii?Q?JsI2+g/ZJxmIXKWOHINfmxJD+8nGJvhI4OlcCHuzUg5HCRr/XlMIUMZQ3PJY?=
 =?us-ascii?Q?1GfNoD55SfsdwKWUhD1fG/shk706qzsMEhTHE0uxnbBdkKSbaGYnfTHkvJL6?=
 =?us-ascii?Q?E1wIk3zg8j3BnY0gksfBd2EmRlT+ibSuh9Ef7tgdn7kFA1+RMgRE/lS6X35A?=
 =?us-ascii?Q?8rHKcWQftuJDrhYtKbKvHPvLIZn1OnBJHafCvYXWs6SCzca37mUMyj4fT6RR?=
 =?us-ascii?Q?JHu/lhPh2pRw1PJTMTTjWmDwjmASllP4RD8Z/W5LiFz80Io89VwZLsi5gadr?=
 =?us-ascii?Q?kaYsJC/q4O77PQCI4r4SN2zta1K6K5LJCyce2MpXH0ixs5+7Cij6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 156b6d63-aa42-4ed3-94eb-08df3bb17db0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 02:56:01.8067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lRziz3hq3975WOMK2LJH+mzoiJe0051ETwB42l1RcB+QZkeuaVTWu+SOZxQ0p8bS/ALwvtliekzoL6VH+anNf75V7iSQzZRwX5gtEHyehLDdE7T1v4zOiR8DabJk8oNG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11836

Hi,

On Mon, Nov 02, 2026 at 06:04:46PM +0400, Alexey Charkov wrote:
> A PD 3.0 port that does not support Structured VDMs answers Discover
> Identity with Not_Supported, as TCPM itself does when no sink-vdos are
> configured. TCPM treats a NAK to Discover Identity or Discover SVIDs as
> the end of discovery, but on Not_Supported it only ends the VDM exchange
> and leaves discovery pending. Every pass through the ready state then
> restarts it, and the state machine passes through it after each reply
> it sends.
> 
> Two such ports therefore keep each other busy: each answers the other's
> Discover Identity with Not_Supported, which restarts its own discovery,
> which draws a Not_Supported in turn. Two RK3576 boards connected to each
> other exchange about 25 Discover Identity requests per second each way,
> indefinitely, crowding out other PD traffic.
> 
> Mark discovery complete when the partner answers Discover Identity or
> Discover SVIDs with Not_Supported, as on a NAK. Leave a Not_Supported
> from the cable plug alone, so that it cannot cut short discovery of the
> partner.

I had sent a fix for this issue:
https://patchwork.kernel.org/project/linux-usb/patch/20260916043957.3362995-1-xu.yang_2@oss.nxp.com/

Thanks,
Xu Yang

> 
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index d721baef5210..e21fe544b2d4 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -3908,6 +3908,17 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
>  		case SNK_READY:
>  			if (port->vdm_state > VDM_STATE_READY) {
>  				port->vdm_state = VDM_STATE_DONE;
> +				/*
> +				 * A partner without Structured VDM support answers
> +				 * discovery with Not_Supported: there is nothing left
> +				 * to discover, just as after a NAK.
> +				 */
> +				if (type == PD_CTRL_NOT_SUPP &&
> +				    rx_sop_type == TCPC_TX_SOP &&
> +				    (port->ams == DISCOVER_IDENTITY ||
> +				     port->ams == DISCOVER_SVIDS))
> +					tcpm_update_vdm_discovery_state(port,
> +									VDM_DISCOVERY_COMPLETE);
>  				if (tcpm_vdm_ams(port))
>  					tcpm_ams_finish(port);
>  				mod_vdm_delayed_work(port, 0);
> 
> ---
> base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
> change-id: 20261102-tcpm-discovery-no-svdm-b8aa1f5768dd
> 
> Best regards,
> --  
> Alexey Charkov <alchark@flipper.net>
> 
