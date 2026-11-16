Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794835909;
	b=LM7tv+CL86dw4+v/9V0HyRieCVMn/ZS+52UC41v68SagginO12kXUAcKufyv9IdNQ7F4
	 Kdk6GiYOvGKtSq0DThMIlc8Tohl0uHKB8bhAwITQ/oVUjDnuFAyls9YPZP/3XboSdBqcr
	 G6lJdcBOlj1v9Fr6Rty/dc0BAFF6oq/Cyt9ZIaHdoX0/ziBIhtXEFw1gDwj9uWYg8/2xb
	 upBR5agGXUpf30u7AzbK2sNSI4p1IIBeY32UiYdbVrruET2F4z7eHPcpH1Y6a7iVn24Y+
	 sX10T+JaeosOYv/f1jK5K3ltgwbwpxShut+cOGM8f6jwsMewiPdgekYLvq4lhuZjtAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835909;
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
	bh=y+2jhMYuvy+BROj2RbhrjVPQ40g7NX5VeU5ciUA97DA=;
	b=dlqq0AxGO+PcFOT8DyNCiYrLOUXyss3W4M51QZal7WGOBLkFWVKYc9+sM3ncd7zIVG1Q
	 pJmDeUDIostjVa+mKnQmPXTuUcv7D5PIHtFlrKeD3VY+KTo2h3ACdSEkwk4Zr19n4KUYl
	 FxSWi69YVkyl5Gn+r9Kf9rL2JR1e8jiGOXs0dUJ2W9FpNtZtATZ4q+rrexLn56ZjSbilY
	 YsrdbAGBVEfQf47AKOs8ID0fxG7ht/kBVZZijy0B4CpmTdScy3UcOGn4kuySIceeuJ1Xh
	 cgGz4sVE3Wv3hD+amA3EGyOoSsHyme0ExhWiV8uTt6XnptWmQnSAcoYwbkNd0V4mwKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WJmpiL1d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.57
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010057.outbound.protection.outlook.com [52.101.85.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABCF606A31C;
	Mon, 16 Nov 2026 13:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ABCF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WJmpiL1d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fKWLW1q/vC/VRXaqfNU3SNC3f96n8ztnHgNA54Us88qrzGBZ4NG/UhssGnYSCtqfEB/3aJ7934ajPa+gDwLYI0kxtVaw2OVe/cuJXZMlCv5duIVUxUkUmGmJyOKX1N+7KYisJXVSpllk2mCH1QFOEGC8Nh0QIhj8c//KxKGMXR9oqKiDD0u/85ecAJ7Be162Sqg9Se4oXBRX5CM+KU2lVUGOe89kOqFJpQgq3pRY4nojLQG7aMDlin9JnopavsibHAuN9GFBY9rlyxuJYF6+4YdSI82cl0TWRzF15LAt91MZsuIJ7xSl4Mf39O5jejRaO3hJp8N2yOOvbtCU0nvzIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+2jhMYuvy+BROj2RbhrjVPQ40g7NX5VeU5ciUA97DA=;
 b=ccPp29wHvLMqbijkL9XLtmp7s1Iaf74hPropLADX+jF/6Kgc3JfzAU8zHbDRKroGXNfjtmgd3k+BWpiWHScCCOzA9bEawRQZsgVB0JSNh7K+SXswide3fhjE6Ioo91zzKEtYqHjUzM00yWpfwX+4KdqJWrAV3tqPBAEefYZIgwrVZxUYWTzQJTvg0Q9lMs6eQBQaCXMxiQ0xqSSvl4ZznSIAeTJjgT1CS7GVXsbIRhayKD6BDksAjm8jAFd+dK6i3y8q1XOTjyfZAg34F0eySChcucw4QovZlMA2Nu1Q/fU9UwJPiLLSGsHaKaJU68CPaYbxMZxuyLp9/+tacQAi5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+2jhMYuvy+BROj2RbhrjVPQ40g7NX5VeU5ciUA97DA=;
 b=WJmpiL1dMDw7Q4gyutWd0DVSwsC4HhGgMe/zwOxX2y/DNR/pZrSH4uNY+LauaUM5W0b1rsH9ZVmkh6lUsZ2cAWxm/CabI/MyRqwQJQ+1pChiwC26t1ci/t2KIZm9b46u/M/v6CUKV0m8dDzl/0ox32w/N+5+iN3zxQiH230Zia/L1sjMmkDo20TVvI0Fl0Cx/4dRlEIsZ+M2I3E5oOSprxotSxCja/sO8JWUFf/HEGZaz7BmL6QP9WMuzTHkiZn1VzYYUevU7lpIX2KQ4BcgJwaRFd++CKgwN4G6Hn6B0+73f0aP7iogSoTlw2DTBoAXNbN3j+6gigQu6gGUJORQxQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by IA1PR12MB6578.namprd12.prod.outlook.com (2603:10b6:208:3a2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 13:31:44 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0615.009; Mon, 16 Nov 2026
 13:31:44 +0000
Date: Mon, 16 Nov 2026 15:31:34 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
Cc: David Ahern <dsahern@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	Yuyang Huang <yuyanghuang@google.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, 1342116488@qq.com
Subject: Re: [PATCH net-next v2] ipv4: igmp: report IFA_TARGET_NETNSID in
 multicast address dumps
Message-ID: <20261116133134.GA305643@shredder>
References: <20261112082352.152338-1-sunwenbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112082352.152338-1-sunwenbo@cmss.chinamobile.com>
X-ClientProxiedBy: TL2P290CA0020.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:3::9)
 To LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|IA1PR12MB6578:EE_
X-MS-Office365-Filtering-Correlation-Id: ec61e9d9-cfb1-4281-82b9-08df43e5f47b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|18002099003|22082099003|6133799003|261009223027099003|11063799006|56012099006|10067099003|261102123227099003|261026121527099003|261021121427099003|261022075727099003|261021135927099003;
X-Microsoft-Antispam-Message-Info:
	jjQa6XDbUQYHeSauuipy9kIpzWhbf+8slOMOsuwU61qlkRiG0DXD6DgsW7LEnAiGLst3hRyLcBaJat0sLehJhPVLtt0DLSe4QVL4yrvw1PnC1Fn5BxVeyFrCu0BgWRURz66hm4a4KPAOAvyUKkbCFU9CiuTUHuAmwYz5+/8TwPp41zgKHlhkhDuxawFr/9l3By2daHa2mH9Z6dqSqnY7isB9GDTA0gWYrp/YMcpBZPHDPAJTldnOTRGNMeuEa8dW9F9jwbkqbNJ6iQqq4cl5kaBMjsg2SLVkJeEVql/ZIO64Z0B+/aWJS0VQLe/xRyVTtx5H/apQ150tIE9pzUP8+HWTWg9E6OuAlZfIEvYiqpzkaAMluIMpYKCC3yMLVqkv284hITfo5rChmDIxpk0wMhwm66PzvM7j7us3d3xpTqyq5lObmoftSrhECg2fvt1M4hug6q+lGuFaLkeiDkUcXevJGgdXk8z/6J5wsU16GD8Vl9mUqMr2dNCPviRXGH0WF7CFADpUQwEAm5lFHqkPuqO8cArKybAfbGxqU9Yy0kYtCFPyt1732mq6NBHIkMqXjv9IOWz6shVaj07Jqx7qsv9iuZo2aFi9OA2QBi+CKvNzqZg4vu+a8nkbRs+nWTfyqat3EVbEkGsZCvaASlGjVshEyhhyBd3gBqyVhYghUoM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(18002099003)(22082099003)(6133799003)(261009223027099003)(11063799006)(56012099006)(10067099003)(261102123227099003)(261026121527099003)(261021121427099003)(261022075727099003)(261021135927099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z3kuJI4wKp2xiKWh+x1tLSr+DPjDLfXkZyxcME+UbBm4+6f+HCXCRccbm90p?=
 =?us-ascii?Q?iGXtc7/cNTZ1qEvpCh7cRv6Iw5lKOnQ7u1N+sGnt7rc1i2P/fVuCB4P+Wjxy?=
 =?us-ascii?Q?KPpjU6oWmuSKKDOwSFulx4B56Bv+QIsLpSWdmPxAAB0mivSUL+QC5uCocuX5?=
 =?us-ascii?Q?xVZdMUq55MqVURKTFreKjYU1Yhc41cBh23wherUGMZcaRwQ7asW3j1a+LTRf?=
 =?us-ascii?Q?eo7TjXhOXMkNq5s1jvuZhBse8olREaKwgthwJCDWWCHtshRINRbeN53dvB9U?=
 =?us-ascii?Q?IBPtwV9U5Lk4p2cOHKqKtOjm5Ai91cWdl9P/QyqEajVeSW3O1OycYfvAqzm6?=
 =?us-ascii?Q?/cRw7iXokXcb0jHxn19vhNKAyMXCTLF92iZnVyXVbcYDQAw9XvdmjDjD51/a?=
 =?us-ascii?Q?hvPJuLdnbhXKMflQSCP3lRF32HQj90rqGYmyUboRG8G7F7v6s85bpAghXOOq?=
 =?us-ascii?Q?CWXf+ywTqo4xysFhCHuaHNWdsHR4lX5aGxW7QHpd87NRiQ5PlqkMkQ6Q+00v?=
 =?us-ascii?Q?tywY4b7UJePlx5ItDytclmAcpmrLp62RErKWiRxWbsnexz54dxNrKSbVyByY?=
 =?us-ascii?Q?NUK/1BfDvkca2yGdcc23umcGr3g7nWa19yYOqpLrYjultRffhaVinwpr7dUW?=
 =?us-ascii?Q?X7elkv8xoYSgTA8xpcOijwVEUXjRFwvqTAWvmXsDy+ydpgcwPObMpkP1933u?=
 =?us-ascii?Q?SnL7V6cJ7TP4s7z6+ByPZ9nznewXleeYfcrhtcd3BiEV/5zMHo1yNK+k8cnW?=
 =?us-ascii?Q?NRcwGeRWvOgKVZ7/iP69CsxkIpsHeWW/pPYItmo2IQ+5zfaAxGupFVtN41FW?=
 =?us-ascii?Q?oASrnCHmlSJiGcITYpmqvst7QA84TDIa8Jw6Y7mTDRWJuPs0K5u4+LBnYcqq?=
 =?us-ascii?Q?qdcXVqud5dsq2C2Jr2BmRe3e8dLZPSu5U1LkQJ966K/GwP93FNFjTfpZ+a+8?=
 =?us-ascii?Q?eKY5zVhDBqbA2KpkJFSnOmWiflqM6qepRX7TX8XawE1is4gUvFtOJhNXVezA?=
 =?us-ascii?Q?urWxNapguinKOFkf202zy6dNl5zlh3P9JuPZdDos7qFeIUGtgVuel13pwfe4?=
 =?us-ascii?Q?PNyjPywFkzvYZS8cug7w7xJqNdbGuEZDNAkdMeKXG1TRkN1il1aKzA6PFsGv?=
 =?us-ascii?Q?S7Btbowun/t/OBzFDKODcZyivXOXkFoO7WVLWZO/ng85ozl1SY/Hs2aCYZE6?=
 =?us-ascii?Q?iRwnKif27j2cCNq7AVJ4oyC4uA0aJprsM/mcs0y/yXf3G9Mckpn3nL9nxAqk?=
 =?us-ascii?Q?uxXOODcbrYnixmacs40QvDDHRWKypuOJ/abnJSPuDo7zSDgPGrg/8QT5klAJ?=
 =?us-ascii?Q?axFcIo7n6LdO18tPZCN5TvX6nnLYKb8rDjK9xd3VwWH/CGqQl4eJ/ECNlq9C?=
 =?us-ascii?Q?RJLk4t3iCsqr0xo1qTk31MHPtGvfs+YmaEmAt/axN3ja8SVdU2r7GxcF6Dao?=
 =?us-ascii?Q?YtdaS3jIs+LkvoU9VyXS7zf3aN9u3fcOqOm/9tUUpbaPex5yLoPn7jkHdUNL?=
 =?us-ascii?Q?nf2aVoDgqSkZFLhWntPTA4NrLw/1BIJBGGplzgkRus6EXm6/OBP9b9cNas29?=
 =?us-ascii?Q?boFmJYdtQHHLuHjcxzM25gqrYlBVXTFn31DhXBFsQpSbnznonrDZosiwQ5ID?=
 =?us-ascii?Q?AMr4POAVbqn3u5VecJCndm3MDH+Cd6Vr+fAZMFYNun7sreZglmks31HdPr0G?=
 =?us-ascii?Q?w7Q/yYKcm/Fu/eoVp8BPQqXOVSXIYeFgsoODMHkv847QkuBA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec61e9d9-cfb1-4281-82b9-08df43e5f47b
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 13:31:44.0159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PHy7ggPGaFPqsVx4TEl8mRwPhxA4qBF5pKxUFxBKt+KOpwP/D7L2s/jt+Ahkq8wys9knLkd7mRl9PN/yoHIMNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6578

On Thu, Nov 12, 2026 at 04:23:52PM +0800, Wenbo Sun wrote:
> Commit eb4e17a1d915 ("netlink: support dumping IPv4 multicast addresses")
> extended RTM_GETMULTICAST to dump IPv4 multicast addresses by reusing
> inet_valid_dump_ifaddr_req(), which already accepts IFA_TARGET_NETNSID
> and switches to the target network namespace. However,
> inet_fill_ifmcaddr() does not include IFA_TARGET_NETNSID in the dump
> replies yet.
> 
> In contrast, IPv4 unicast dumps (inet_fill_ifaddr()), IPv6 multicast
> dumps (inet6_fill_ifmcaddr()), and AF_PACKET multicast dumps
> (dev_mc_fill_addr()) all report IFA_TARGET_NETNSID when a netns id is
> specified. Adding the same behavior to IPv4 multicast dumps aligns
> reporting across address families and helps userspace consistently
> identify target-netns replies.
> 
> Emit IFA_TARGET_NETNSID in inet_fill_ifmcaddr() when args->netnsid >= 0,
> and initialize fillargs.netnsid = -1 in inet_ifmcaddr_notify() so that
> multicast join/leave notifications do not include IFA_TARGET_NETNSID or
> exceed their preallocated skb size.
> 
> This alignment was identified with the assistance of an LLM-based code
> review tool, confirmed in a User-Mode Linux (UML) environment where AF_INET
> RTM_GETMULTICAST dumps with IFA_TARGET_NETNSID omitted the attribute while
> AF_INET6 included it, and verified in UML that AF_INET multicast dumps
> now report IFA_TARGET_NETNSID, regular dumps without netnsid continue to
> work, and multicast join/leave notifications succeed without warning.
> 
> Signed-off-by: Wenbo Sun <sunwenbo@cmss.chinamobile.com>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
