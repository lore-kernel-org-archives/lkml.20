Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793801986;
	b=jVvSAALh5UhSk5zvd7ZQo7b6P61yXW3PcqoqjT265tmDz+lIx+0qu3OjjLpoUpWAsqf0
	 ng5mAFRRCiqPdRcT6uEjZ6gsFqhZtwXEysnCKZW57+GAXmK0ruCN80pV67+dHyuTbXqZt
	 GvRcJePm5t4XdEq0hb8XF2TzNEhFZCRrPeX7uGvDINl+N7uDQWuCv65DWa8dvspG7Y1TE
	 PNiuM2heVgpJr8W7L2C+0wuOl1xtfNTjcXbEge9b5SvvahorchjliVaPH4MurH4pipBUz
	 OcTCjoruGZOUzUwLPOb5r4k2fXUm5JxJXEPQu3x/vH82L9ezxAYMeOfPF1XpcU5q2QQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801986;
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
	bh=tPlELARhYkravRHQ8fmgVpMGn1oces63QFo/etpWx+c=;
	b=PhwH197rhukXxeCo/n//+xIHKH/FsSn/9M3CXzJ/sINUTgTQTujEaUYoAD6i40p4X50A
	 dmUYdfl3w8hsY28kDhVjadQBZpaSCHNklgnmlBtecvFxT848/eGb68wPx4S/jbP0tbXUz
	 hU/d7s/ftNsZWZO4GCbONCu3zRSIcsZZ8aLwPe5L7gEj4lqU0Haf+NdlRJMlLGlCkkxZd
	 3rP8IAiXX6qGWSyJ/kjuc63Kbxydgmr8TQOYgwc2X6GnslAzGWaNiiKNGEzEfqHSQiqVO
	 sRKBcOtZtlV6De2um/VU9p1O/9m7cgYM0t/UqeiDmBBPy3U2KTUnEzEZyk4628bJHfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=U4egE3Iw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.48
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011048.outbound.protection.outlook.com [40.107.130.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B805C606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B805C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=U4egE3Iw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jG+sduHuXefJuKlkWcaPp3mYNWfrY/8fifo7HyfjIgTmYnr8KqNIWeSg4Q8S9owDT8mshdStngI6q6k20aTNS8p0oFGzSlx7M7oaD67BzHzQWt3PdUy0cOJ515lukFy2J+2tUaCa3YhZrog2VfqTQVobhFmZERmJXav3fkpQalwRVSpxmgMBjQs8BVJBhXZj5Hf35g58qm9z/fcGzxEFi8RFCo3tKu9x5n9ceCGprQaOT8uJzeZgg2ORziL2hy15MK+jqenyonlqRfShdsfVsL2OAFvWvR+yh/M2tG4Yn9SMw30sWh1mOc/LOfHZ2CVWdUk9GsfyjKGDGYSmAMltsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPlELARhYkravRHQ8fmgVpMGn1oces63QFo/etpWx+c=;
 b=nFlZ2Kw+K4Y7GKza1F5PxJp4YRo3zNJ3J2XYSfqtCgghPbvmysxAyD2gRjK/kclQri3oUmB+OcAT0qZ8ilQkSV9kQOxuB8Up8quBML7cHIlj9U9rrA0hVdRC4amf+aunsxhK4jgxtymytzx7c9kcZPyIEpnGb6d174rhjRsBjdhFBEu0SDycvWrwewtmJi65QdmyEAJDF9O/tCb7YT/IKP91xtBItc7bDeUyITleXtcKUdgFYY/NtbczbhDK+qJKyP2tEOgq8xsWTV/RlIXata+n5ZmODJ/l+u4K8wAMaV6Lj6m0o1BvCbQ4pYzBIO0FG4ZBtrQKOhKUVrNocUFEUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPlELARhYkravRHQ8fmgVpMGn1oces63QFo/etpWx+c=;
 b=U4egE3IwKhfARA/cRjEQI4nbsnjNnNVAiw1LQnkvp++BItVuDfywT0/Q7fw/GU+vB+pUaeRwJUf3pkdVh3mqxJN71psNNR8CFSN62Ih3WHJr52/TPo2UV4dd8naH8w+NosztDPGqoB8GT+7Q+uCSdj6qrl+e3tmvB3A58C+ShEtkqZMz2Q8G1ZsabuQmhYBto837FF2T85KcGAMgUiiPcwBQverzA4ZV3v/7oam6D9+6PArB6VTsdhZZhw0CH6VF+5F95TyHIkgpblCzZhyLRlAB2TY5F4jAcDWaDxilAQ7LCFC7YNLEObuDjykkM8pDcLdzuBelgTmj13x7jVdoVA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM8PR04MB7283.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 14:19:43 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 14:19:42 +0000
Date: Wed, 4 Nov 2026 22:24:32 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mailbox: Only reset txdone_method to POLL if controller
 supports polling
Message-ID: <autAIFvNbRAFJ9mA@shlinux89>
References: <20261103164235.1.Ica21c7a396cf407fca02b7c0fb3a16150feaab90@changeid>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103164235.1.Ica21c7a396cf407fca02b7c0fb3a16150feaab90@changeid>
X-ClientProxiedBy: SI1PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::9) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM8PR04MB7283:EE_
X-MS-Office365-Filtering-Correlation-Id: 8238df58-6cd7-485d-ac55-08df3a7eab35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|23010399003|366016|1800799024|10067099003|22082099003|18002099003|3023799007|56012099006|11063799006|261022105027099003|261028144727099003|261026121527099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	OuMcHvPWSLvaLLWj80tnO504BXP64GY9KmcO9KWRYswno3kMMzSnDe00sUY0mvge13OzpGr/QECW1QUna278hJmOw4RSjFTGjxqCDooF/RTl30T0vdxhBwplQj2XReg07GR/eZSGMw2IcQ+kOOljrbyQmv/Npu7UEnukBGRe+/dVLhoqBFn11MEI/I/tO2X3uPQeRjodUHoMgC6qR871Loxe8o8dUCB+0QMC+SphArToHDCOQSmjOCGXI2+GPiglvLU/FA8g1S2yrq35AZHdUv8xPU9e1Q6pDihLiqOq3cxBB5X38ZOdjaSGRPEWhW9IgcmQUIwPAbtecgZhRTgGb2d3Mvc+iLlwW/h543c1ynl2Sj632NTUhKFab2Pyi4Rzd0B6c2ATI/rsRmn7CGq+egUdWThT057kidYUPGO1cyYXfWKbrTa2RI6FrR+4xAMqZHR26gbEcZGJ2VAgQABuniaPKaHvCZu2eqw95YIT3gZJ4WKkopVobaDT7UGi8lm6V7ea9PGC6lf3euOACSwu8PsM1ciuTMfUePCRKbgQSwt+GZgWlnRo8kwD97haIOnf1/Pd8E7js0bCZL4adE756CjFo2lUmJ/vSXRRugrz0tsE+k1Tv7No8/ZAP9OupLm8zt5ig4T/6DDmV8gQkpnLtSeMPIViYkRbyWC5RXULPM0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(23010399003)(366016)(1800799024)(10067099003)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CI9aXd90BH0jBLo2qPFbF5XMKjX6Hl735XtSw7Ev3Ypy/ObPZltNKDnCMBe5?=
 =?us-ascii?Q?FW+KDKOfSCmp6ROOgFuR19gRSoRwvYAH5jbH+wNK0ZzXMdHM7QFB5E6lnxUe?=
 =?us-ascii?Q?fr9cAEC8AioWWEHv+QjbIi+39ZSmETFWmQozb+Xxe656YYESLxlYqhdr/v9N?=
 =?us-ascii?Q?JJFC01aKSlNhwoOo0boqu+wnuflvkBSmNbVMkOcwLLkNxvkjDbKnO3cmQbzi?=
 =?us-ascii?Q?MDORY2F8SEdboSSImMupE6jIOiMCELcLqctD18CJbeuV91QQ2Fl+gYbs3z4r?=
 =?us-ascii?Q?lVJk+eoX34hDKRYQdiCuu1AaE+OcYcpuj9TKPwOF92P5IyT9F+2XT+kE24eO?=
 =?us-ascii?Q?wJNmTYFGAG+HIiWznpuHoY2KDSZQEVbsTqapl0AYcKa8lIZlaT1TWCUnADNa?=
 =?us-ascii?Q?AwzYKBQwFs803aohGS1Qj51dnJPtbVdoDfgUq2inNEA4uwWF70Y4qc+VGk6d?=
 =?us-ascii?Q?XkZNlubX/ulArDJKLGXYCvg3JVlZQuMV+h/yXcvO1iy4xCtklfRf2HJFE+KY?=
 =?us-ascii?Q?ol53hq/Jo8mBPBkOv64c/17xTzf/jEYbV/W/DYsqBBLSmdeUStLp1rVLa/5G?=
 =?us-ascii?Q?Zzq+N/Ul8jsv0C++0XlarCHQ4VNAughqfxt0zi2gGr2Y9LcxIAgzH2Jr0xQD?=
 =?us-ascii?Q?d/HtV/0IJPMgJoYb/aXL6tcxoN9QT2AW3p3XupDSrFrHZ2JuLCtc9wr0bKMA?=
 =?us-ascii?Q?zqWP/uHgAU7clNbNZlNKOte4CVT06SuDg4pVufxOFWW8oOiOA7ACdlKNxuSc?=
 =?us-ascii?Q?MHaPNrgET/Wi0X/QG5NYSWrfIsYVo8af5ha0rRdt624u+2PIFg9VNBIBrz2P?=
 =?us-ascii?Q?fidGMShbNvPb2fcmbWEBkFaQW3X7+Cqhv5q3Q3vpxuJAlxtvEX6ZoWtW/eAq?=
 =?us-ascii?Q?cuwWdzSkoM5RM7ID3TlShH9LdHxawbY1q/MwLPSR0PrTcdwBkZKjGplykd/q?=
 =?us-ascii?Q?PAEvkCl9cJ+o6NfFWWnqRVagaJnDggdUNqnuuRtRJmA7pU+DT9dKiBjxVvCi?=
 =?us-ascii?Q?l3D4UnswXZWJ9lAj9yt+pU7nOjxmhj6l7ZIf6jFCMaU5Rz0/BnIVjVjYzs/Y?=
 =?us-ascii?Q?1xLfupS4axEHKmuWckQQoBt3dj1nNHjFhduf+qcdZJ46xbq3zi1IygsBcm52?=
 =?us-ascii?Q?T0g845hK6KszvP4VqeqUZ8i9ZOgLunt5YiE8cxq9k44ktG0pnA+ZNeAEaKoC?=
 =?us-ascii?Q?8wBY0i93OhUxPMdWXj8ct5NuM3fDKgzOi4w1EsODaeeGdCeDEUdhorOv2Cy2?=
 =?us-ascii?Q?DwoaVogD+tceSZOnkihAAJCvEtdR7Dx09AWrl83C6deb1B1OBki9I4Xjr/Hv?=
 =?us-ascii?Q?nbEWO6gaeMAqsXHFLjWmMGF3WrwwOkFgAgWMZVXLSPRGLKdu0ZR0fVBnwQU1?=
 =?us-ascii?Q?a/Tkg8Gs/W2y/xsTbW03tCs24gR0xRO1kO9Rm1G1K4eaJjxSCXyNLpPH+dKI?=
 =?us-ascii?Q?m2GsA+DITfZ0eXXbgPXDfGX8XijbD0lyPy7Nij8JuQXYHJjKpmJsOWnjMigR?=
 =?us-ascii?Q?inkorTf2z7ogp/ni/RUfYfu7yUl0KXu7k/dCYkB3roMHXqTwY2H3o2BSpj3U?=
 =?us-ascii?Q?nWfTYUvZ2tq01DbYRQd08TdpTsQSnWSSlKYVw5RKKqmJKf/TkaCHsBKlJEi4?=
 =?us-ascii?Q?ysmfyEhDwOxfxXsBCfFozxr9PKkT7djTp0TiKc7LlR6VX2dpCa8a1b8FCZKG?=
 =?us-ascii?Q?jwcvoOeG0pY9dOUyuypm6dg8/PMoHinfVkhWKnCa0ZyyxWEWUqobFTIKwhmH?=
 =?us-ascii?Q?aoSSqjLRBL6NenhxyMBRx8syakDkf8aAvPqUgSoR41MYSzM6T2Lv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8238df58-6cd7-485d-ac55-08df3a7eab35
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 14:19:42.8199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tKoDuMJ5rWD5m7aRvzm+b0Xq3QuNpLSUFlnzIXuHbCJq7fPAKG+4tdkuPv2+rE+8qjr2JOojCG3Hsfo7OYPkH8/W6A79LaJX9JCLsLbnT/eOA6EUzZ1YdeqM9PKMdQbo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7283

On Tue, Nov 03, 2026 at 04:42:36PM -0800, Douglas Anderson wrote:
>In mbox_controller_register(), a mailbox controller's default
>txdone_method is initialized to MBOX_TXDONE_BY_IRQ if mbox->txdone_irq
>is set, MBOX_TXDONE_BY_POLL if mbox->txdone_poll is set, or
>MBOX_TXDONE_BY_ACK if neither is set. Only controllers with
>mbox->txdone_poll set initialize mbox->poll_hrt and require
>mbox->ops->last_tx_done to be implemented.
>
>When a client with cl->knows_txdone = true binds to a channel whose
>controller uses MBOX_TXDONE_BY_POLL, __mbox_bind_client() overrides
>chan->txdone_method to MBOX_TXDONE_BY_ACK. Commit 33cd7123ac0b
>("mailbox: reset txdone_method TXDONE_BY_POLL if client knows_txdone")
>attempted to restore chan->txdone_method to MBOX_TXDONE_BY_POLL when
>the channel is released, but did so unconditionally whenever
>chan->txdone_method == MBOX_TXDONE_BY_ACK:
>
>  if (chan->txdone_method == MBOX_TXDONE_BY_ACK)
>          chan->txdone_method = MBOX_TXDONE_BY_POLL;
>
>For controllers whose native txdone_method is MBOX_TXDONE_BY_ACK
>(!txdone_irq && !txdone_poll), releasing a channel (or failing in the
>controller's startup() callback) corrupts chan->txdone_method to
>MBOX_TXDONE_BY_POLL even though the controller does not support
>polling and has not initialized poll_hrt or ops->last_tx_done.
>
>Check chan->mbox->txdone_poll before resetting chan->txdone_method to
>MBOX_TXDONE_BY_POLL in mbox_clean_and_put_channel().
>
>Fixes: 33cd7123ac0b ("mailbox: reset txdone_method TXDONE_BY_POLL if client knows_txdone")
>Signed-off-by: Douglas Anderson <dianders@chromium.org>
>---

LGTM:
Reviewed-by: Peng Fan <peng.fan@nxp.com>
