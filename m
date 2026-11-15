Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794734495;
	b=Niy9cRj3O1CWF5a0BCucPdZBkh5LbcOUrD0UKVckuXSYP1tnZrvunxf2iTf/b543qDLG
	 byuHR/+wZGBVYGatsrR9Bc1oE/jbclWaXinQaoOXRyr3mo68PYqSN2jYzGY4p7vfaLsPf
	 V5QGDvTcNWlhNmMYyymtS0yu41s2XhOLF9G/hEfGyadLl8lvS7umQzoMnZKNT2lHH+Lx9
	 ve3TgG99zcFgwmf+JPmnEUnPz9F2vH3hzbeShRYLYFORuKkN86Lvz43qc3dXbQ3DB09MM
	 tcD/3ai1DiMCLcopG6ZgO4oPaUKgZSobEFdvI3af5S6aQoYFVY3FuMtkb7kSBg4esuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794734495;
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
	bh=AEHymhlJt4g8+672hDNI4HrZHxF2SCkOrQDApt2Yzos=;
	b=lzAZ6eaQ6lT4gcpJHUXxshs3pEjuoenaDCU0jYdISEnbb95Byhia9EqB2wvDADAi7hQa
	 ntIJ7PG/7fOtOd6Su78wgAe/HuPmnqXYWX7/nv79wAm+P3OYBMdKSKJiAbq7GdAtE7Dya
	 dn9GnAa0Crj+cbH83KhSN8JCE4SIY0JrC8BOkGWqVnzy9HqthuabNQuHMr4il8jF/Kllg
	 cAdY+Bs/HOJJnY/qxkkYboEhCsySBD1paU/zeNu+OAzqbe6JXT8c50Rtu0QHi434qCV5F
	 oiIQ/OoFiM8auYbTTzmscLW+jT0BWAWiiq+nYsSl6M+4YFTCtmFs6KYtA7acQI1onBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UyhXiPbF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.63
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013063.outbound.protection.outlook.com [40.107.201.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8F2606A31E;
	Sun, 15 Nov 2026 09:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC8F2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UyhXiPbF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h1SfMMOgthaILDXzShLfT7zKQJgDPpuMAVWieWm+Fj7Pqsl4952395wGnjDrKrRF70NmT56tmb9PRsvooCHhRs48yHjLvIOMbv5UpVgAm4npi3CytFonsPyt447q6G2fH2GLKRxUSqrQ3cwo9C+mgHm7r87xsUztHYgw64ubGIi4DbXYFP1rReeQqStfwmIh4kQa4TdtN13Z5v5DbvXeonpWGOTFbxqv/SSO2GUuzrJtAI01jq4zrr1gyXpsPKLKgLkb9ifl5bo/WlnZtDwqesmOXX22aNyShwqDtpSj2HLq9jc31UKnvIqATUFCYrpWF9Ag0wQBeHuufdgd/SaPNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEHymhlJt4g8+672hDNI4HrZHxF2SCkOrQDApt2Yzos=;
 b=f3jMkykxS3KwIGUjdM/reV1FnosZXuX02bv7JP+ToMGxloW7XcouRpAH5RbgMqCl3nawwRjOFWJLoYi9YgzzFDzyZNLNdCa3UWnlFSEQx3lUGk9GqpGKyZlyBT+YO9Rcrk2lopoUJKtwmDF+kn4sE+SCCUWEybb/TwTl1Zotc9G48vsU3ExYcpGMBSL1c0snyXg1nmqXFjGgM3pLaAu7Y0O3nxim9WWpHH5OHOIxNyktD2milr5oTBhaHbvO1XmmXlo+GRBxo6JKP/zjKvmcte7e7xT1M9XkVWAKlTaKgG/E6J/iqWLtQdF6wIrB71PAdvdyapN6no8sb3sPLekCqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEHymhlJt4g8+672hDNI4HrZHxF2SCkOrQDApt2Yzos=;
 b=UyhXiPbFLalnpXJ9LOupvmwURTKGpEsBmyuRpTLkyuOt8dwJQ50mhaW68MnD8qBe6pV4XzCADyRwqngwboA6Nj27V7TxbdHaKGaEt9Sfnfxndgy30c2CGDx5IMKxPkcD3JSpYlKRVdfEb7Bm2a1uQV278EBGODEKGKXBoq57yVY+ABezOgyZ/LqV+2fyXfnuePLEx88x0R6uwlhexrMDQMpkMUayq+A428xYPo2lf2u/0Cy83eRpbIj3EoycE1zB8T/eksmtYOJrxT7zICRJW92BXz2VBkPqufUQF4oHM6hY5rkisXikjpIDOLBsXvtcSU/N0wgRVaBrr23uzC5hkQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by SJ5PPF816B88375.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::99b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Sun, 15 Nov
 2026 09:12:29 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0615.009; Sun, 15 Nov 2026
 09:12:28 +0000
Date: Sun, 15 Nov 2026 11:12:18 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Anton Danilov <littlesmilingcloud@gmail.com>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v6 0/8] tunnels: add core and gre drop reasons
Message-ID: <20261115091218.GA3828669@shredder>
References: <20261110202021.821224-1-littlesmilingcloud@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110202021.821224-1-littlesmilingcloud@gmail.com>
X-ClientProxiedBy: TL2P290CA0023.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::12) To LV8PR12MB9407.namprd12.prod.outlook.com
 (2603:10b6:408:1f9::13)
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|SJ5PPF816B88375:EE_
X-MS-Office365-Filtering-Correlation-Id: e5ccfb7a-ffb2-4473-b988-08df42f89226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|11063799006|18002099003|22082099003|10067099003|261022105027099003|261028144727099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	//uRs8iMLW+11loQUFa6BtKokaAEu9xwyXWK8h2n6VXF0rWhUUMOq8oTQwBa+9WzX9nWDxhDrmp195TqeL4IJ1L7y4VTSOP3jtvxEDnY4G5R+B48swDRyRhgtPGxssUQE1g4FQAX8z4bCxuQPfeX8oarcMzR2BCKCcpSjfwP7ommteiDErg0wGB7rQDl3MgyHbWyAE/SEbGJv2/RHPrTJ7NocwHxoKk3rFJkOCw15bS0DrTA3ivpGwb34vvJ+SDf7eIfUJjHlkDZrYyuIkB0hVRwL0ghA9tErJUHWs+H7/K9Z9UoeJfpF9uk/CVax40iuKGoA9I1fqYTkxEXHkY+06uLbs8wt7tsaUs02DcPIvi7qtUM8lHJq4JLQhrRVmy283wlxaaslZ2/O5wOHsLlmfamwrICE11rfG+DwfASWNgN5UAfh7/QU2tayq9dDKRFiO8CfHnxIcdJM7VaNP9Ut7mNMi6llquBGigS/CM/GGuw/l5agn7D6wyKRYIRkro165a7h9zCvlOftuKgnRsJCYU2plCEcaClb6YymrDoyj6M2pn7cDr+9q2VukVit3DnrNii5EHd+6A7lMoTW1rkB4RL0cvCgwWsCzExCPp3tFCqQOgrZGlyUWN9f3uG7c6ODrcOAG17gkitw+QTCXhiVx3ae1fMPdvhNrUX/JzCzz8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(18002099003)(22082099003)(10067099003)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ozpl+jZaeI7WHu/QYPrdEUBob/9yfd2VLboD5BtIr9cdhxzqq3HjD/GU7UZZ?=
 =?us-ascii?Q?rA+FUGA68jtTQHljW3R5mv0n/TbLwhUiBYUCeGjGqYM3oSRSo98umi9KyQbV?=
 =?us-ascii?Q?zpqui2uovjwazZgQDcoTvG9pcclsJVDCXoXnBDtxjm8q3b+grIK0+SlmK2Xx?=
 =?us-ascii?Q?EVdJq+qbFVX9sp+N/3fmckvn6BGkmT7QgGevZYMr+haK0x2iC+QeWHS4kBUM?=
 =?us-ascii?Q?Du1SsW6V43LfQfTWVO7IcXb9jcGKjB71yffNtkrjOTsFg7Smv2zREQLp3EWn?=
 =?us-ascii?Q?dLBhdZWJ9XzCsYBk14GmnuR0dgKuq1KB3cgskeAtzrF3FOu2pH5z8GBF8J36?=
 =?us-ascii?Q?B9uzNV/PzFzFRQ8DLRwzvJQ6aCDW4GEHypTL5dTzoajsyOJ7WqjGkktJMJ7o?=
 =?us-ascii?Q?2o0z5BAVvTn5iUlbwfNe+xisL+4YsCqMKFkC/2XHEXoQSND/Yey/lHrXh7uB?=
 =?us-ascii?Q?Y8e8VI/hCTpvx5AMRgCkH2gzqxb6x96mrzYiFsCzyu1tGQmGQynb3Z3UXXr6?=
 =?us-ascii?Q?nZ7q/J59aR4j4cXumpQc3rOqG2EwUzs3HPFjwS1gXf9e4GOUfAHP5INOMM0b?=
 =?us-ascii?Q?U9XvVn3eZDZFO6owd6vjN746FMjSAE0+AkIFEKkD+/C5uzBA+RMBcdqdf3lb?=
 =?us-ascii?Q?X0hz4hnOiE4lnxdGxhFlt8s/vtyFhoFqSH0T/n6K35idvn87zeHPL+W/35AY?=
 =?us-ascii?Q?W8OPjEPCTZZ1Oi0xksf3L7+Y/Yrdb2EoW2q8V61jXlBGW/B+GVczGEDSeQJO?=
 =?us-ascii?Q?GJDNzBajhfAxFO4ZGYhdxJDQfveIKHsamB5PbW1SnkVBT1MQ3TVnueG33etZ?=
 =?us-ascii?Q?EsxkwzfJgdtS3LmFg91CqeF0XkwcGI+i496G1NecJjyRbbUORiwgkNfa4zsH?=
 =?us-ascii?Q?Z0bQmdhscZ/4fQGeQfyBHqY32LBbN0DlEazDSIqoKDFMu3XtEhwcEjrAfUnk?=
 =?us-ascii?Q?Lr+raJgrwwGpODUl4n4302yb5r0j+zlAyNDYhn7U7N/bxUlf8QRJTTMPzFzG?=
 =?us-ascii?Q?IzfBk03iLC2s3/asxhm7C0WCeV/qO0uZmXo/B5KFCu+6TNomMXdrTNXav7k4?=
 =?us-ascii?Q?+GnbOsFp9qnsPum9aQWOUadDzgfvL3m8v/LOZI9YpSqkLOte5jUTpY1RtYdd?=
 =?us-ascii?Q?Z9kuRw57LmgJSHDgIb9oSAki/nDMKoXNLXu+hi+xL2avINcQnlTSdmh1WEv1?=
 =?us-ascii?Q?SRckwtb2QikEV1IsDFM8hE0Paw8PtdiLVPytrWOF0ad2v2i7TSjleG+sehJM?=
 =?us-ascii?Q?CQySBdPKq+OKvfQJpk5RleVbzarhKD5sFaXpyJAZwveVHHQZOy6fxFMxbE+A?=
 =?us-ascii?Q?PJGfMlXkS0X1s3vMVmSlh+KiWX4KsNAzPfvuU1hte7OQ2Mw6bCQnyKonc9Vs?=
 =?us-ascii?Q?i4F8n/OMRa5a4UpdmnadWVW6G9ikKqoX8vugwxTpSmmV4nb0AOCRAU/XzXfW?=
 =?us-ascii?Q?vMI/bDTHyrXko+tenI+7hESk4S+ZosuNeWgP3mvDd0ShhGzJmGShtbfNtjCh?=
 =?us-ascii?Q?59tEMPUIC1ohXCAmP2W9bNkCV+XQH4Z9B1jQl2Xjy9i7CJjRDqoI7W3eEyeb?=
 =?us-ascii?Q?0YKjLvWb+ZyeZE7EmriK7SxMuhqEPHFB7yDB0z+Sob81iUZbmmOrFJmeO2Fn?=
 =?us-ascii?Q?XM9kQszSu4CNpbC6jLrtSE0HI58dgfLk+tN9L6VM4fRE7J1rvORWe94yfaYy?=
 =?us-ascii?Q?W3WVFN+RR+BfxI3n9wc9Eoi6mMfza95JUBt72yMPvqRo55zP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ccfb7a-ffb2-4473-b988-08df42f89226
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2026 09:12:28.3399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /XZGN8t6KoZ77gGYry8iaPrDhyffAE58wiVSxxQoeZgchwUiGmGjLFTW/aNBieHeKtWJcueqxKWtPnV1uuu4PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF816B88375

On Tue, Nov 10, 2026 at 11:20:13PM +0300, Anton Danilov wrote:
> This series covers the receive paths shared by ipip, sit, gre and their
> IPv6 counterparts, plus the GRE and ip6tnl specific receive code, and
> the IPv4 transmit side of ip_tunnel and ip_gre; the code specific to
> ipip and sit keeps kfree_skb(). So does the tunnel4 and tunnel6 demux,
> shared with the xfrm tunnels, which frees the packets that no ipip, sit
> or ip6tnl device takes. The IPv6 transmit side, ip6_tnl_xmit() and the
> ip6_gre handlers, is left for a later series. GRE reports the reasons
> vxlan reports for the same conditions, which commit 7629d6db839f
> ("vxlan: rename the drop reasons for use by other tunnels") made
> generic.

Looks OK to me. AFAICT, only four new drop reasons are added and the
series mostly reuses existing ones.

Going forward, please write more succinct commit messages without
omitting the important parts.

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
