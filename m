Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794746194;
	b=YbU82DFrX+I5akTJrHXTbGpH6fEcuoI2edJdHkNc+HRQOGw32bngDsUIkPQyVlzf/u2a
	 h0ES1Y+ieaUYETOxId9jmxlh43X6cPdW4HohusUifsfEzdhoOzyLKbkbIUYrv43jA1/vO
	 HSCwNxeSBTBWfXFJGNQfksuTQRRRGnIo+R6/KJCSAwP/HnGxEo0v79X4z5jBZISreYut9
	 +OWDQ60Yg7Tik59ZtH7qRTdME4MQ4ZeEtuMupUpg8VkMmmCir2gSPZSXCevvqOCqlFLKJ
	 YR+siNmJFxC2+LzENHU5qkpzsILCZZBrYMCpX2uJfTVNcjs6O34KG3nCXkUlacEpC4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794746194;
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
	bh=QlFKZ7n4+/VjaKiNl7r8ERcAevO5/abHTFtC7LQXkCQ=;
	b=UKphms2NUoqZD0VQ2BWGVieQqQkddq2sx5VmZxar1ow32Q84tntNgvNR1jyr1XVwHYyZ
	 rVlMOGppF1DOSGp0FVpJNm7sQN3xlftiL+nNolzRxEfQrX/hRfLUFwEkR5n7REu6gdUpT
	 8RmSCmH7gH32IHD5QpxAxAbx3XsSELkFwY/STx0s7WsgF4nuxgcshi1Lg36M1/QwJ84KC
	 lq3vM4K8ga/tF2r5P3Ru7ixrzkouu4VkxWOuRJ8iqmFimRC43DctuTgFHVkpQ1kJqMOOI
	 DiV3Jf8h8kBhtDr5Yj0Ua6rtGyC0w2+k6LAuNilsAdrHbdyHwFss6LARzMb1oEwh0Vg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=garGFV1i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.51
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013051.outbound.protection.outlook.com [40.107.201.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF24606A323;
	Sun, 15 Nov 2026 12:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABF24606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=garGFV1i
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2v6Old2vn3fLcK9MTXVMrnloW7n87faoQ3uhfFP8mmHufyL38s9v5YgZF/5j/1JsV/OVkEyts48Zh0mzzNLeYMdIJxdOgQf17R/IuzVGjY1KksDBO//EMJaTgEDaIKndSgFms6gVTHSwsMrQyKuvVSX2ToWMZXma6FKamOCB3+P8X5bVL1tJELttcoDDkx1F2htdVSSfsy2fm5QypMMtMoap10s0woX4DkkKpZJQgp+7/sIwLxSFGHhv/LHLX2i+r+wxf2lCrPVeo9I0YP0OTYacNB3triXILBq6Vwq2W+ALvSuqOsBclphPcyc/DbI7NlpFnmsBpDzbPS+Q7QT6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlFKZ7n4+/VjaKiNl7r8ERcAevO5/abHTFtC7LQXkCQ=;
 b=OBUk9cdSyyU0oNIw51+0ut41nEQqv/uf8AIe8fu+wf0jVwg75ecycNdlZqKeX0dixxKZuCwlu/K3OnFlG2CIQ0rrIr1Gi2BOxdyLK/0V/HDTfWautViZvKLfV6hDOAlOU3x2oAfZQzJBBV4dhkDSPu32LAwHy8QTyx3OY/MY7tFSeHevKdpcr0PTNSqWOTRnSr4oFNnUcZQ46a4TiAUUKrAi/K8BaKrXHBVVr1LVj0mgNqvHKA20YmTYYymh0Owgc+/RAeCbFqTd9P8+KJNEl5yOJxYHxKN7GcdwiV68C0iSWDbTZFve0Y7SDIFklRJNDDbfm58Fz+0BgZoFLrYX1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlFKZ7n4+/VjaKiNl7r8ERcAevO5/abHTFtC7LQXkCQ=;
 b=garGFV1iuxYkXK9oSh3c54Ksw4WS5156fCeqj3e19XwcfJ1n/Fp+srIk6cEXb5NR7VKL8V2ooOUrpCoZuqL/WSkgb/vdc8c6U3LgHpiLsf6SWt8RqIsz3k25HfRDAMJdlmx6esb+h2vWAGVeqpHS/n+uon9bWwyBnaSPa139ZEJVkxSvcWYW5AsDVxbgiW/WnJy85gvLJq4C72ZyUIEh4JfC3HW8hpRG522LMOmItGPziWe3PrdW8Y2ywJcSyK/R5I7RrIPW+0Jt3NmGRbnkIoCDivb4TfygB5PTLG4q+LtkbXtnUITXI2rxITlxh72SWwIwbz1rncp2TkOVKeCxvQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by SA5PPF634736581.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8cd) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Sun, 15 Nov
 2026 12:36:29 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0615.009; Sun, 15 Nov 2026
 12:36:29 +0000
Date: Sun, 15 Nov 2026 14:36:18 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, William Tu <witu@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4] erspan: drop packets with an unknown ERSPAN
 version
Message-ID: <20261115123618.GA3993415@shredder>
References: <20261110152848.23136-1-yanhaishuang@cmss.chinamobile.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110152848.23136-1-yanhaishuang@cmss.chinamobile.com>
X-ClientProxiedBy: TL0P290CA0007.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::11) To LV8PR12MB9407.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|SA5PPF634736581:EE_
X-MS-Office365-Filtering-Correlation-Id: 5989c032-30a4-4ba6-aa51-08df431511bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|5023799004|11063799006|56012099006|261021121427099003|261022105027099003|261102123227099003|261026121527099003|261026140227099003|261028144727099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	sf8RQ5Eoo/tjdqRuTsavBj8JP48XHRvH0VIq6PurwtWu9BYZIayY7cft1cX/iKNIO2wE7cmjuPB+KTPK8IAaTuYt+KYmFUizOD8PLs4L6Kp38/pFA5WjSjcCZcSvx5v+v0hb1UeQE+/6Q8L8FTRHsx6YkFvbFjExfaKWUHjb8vd4jtrZT++4Coztp5XDpaUUzBFRdrZkrmu90auAnfuzHeu7lptFlkBjKdYWKdpYSImKaRFWbIouuJMMAJe6bl/xoEWO9cH/3/iUGOqiPOdm0hoWFloOLtJkOAL8QrAv14YBwF7hGbQFGCpwOxziolmxK5G/y0ZqL4AVoNUFCs7pKlHMTWOmVh3UMmiukyQ4Oo0AnkW82JTGdrjDOAoFymMSy+XEvNfwaJwtfH2solTHGAaeRzWkERcdhiVo2NDzQC586Qn/Afdr6qPW5Bn88217M+dJ4txn8Oy/9aB/00sGQvltIpc0YHUFv76alfBKMiK3sVmKY+KHW70vN+ADGFndw69ZXKEaVKKuH+PZxkNmDWmt4GPVzmTACeOnsor7o+Q+ff5wVQTwYgLv/oBMWjZ9LIroczc5AoH+nBhD36L1NyzUQ3xkP8TrMeycLeWfEreyAeGZU3bDb+XUM/l+GI4wcGKVUjSuNj6yg78mgR4nk9pFy6zGYZCoZBr3wnHT/dY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(5023799004)(11063799006)(56012099006)(261021121427099003)(261022105027099003)(261102123227099003)(261026121527099003)(261026140227099003)(261028144727099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2ozPLBKVQf+lHR2YIIUXEtxw/B7Rzi33h4dkMqWiJfGmc6EJ6KgqGPxwQekl?=
 =?us-ascii?Q?r/7cJ4eKwI4hi/fR4UDrHbqwL+FDbqBDjgSF8/IxwLFh1qHFMVResUSaH5eX?=
 =?us-ascii?Q?LqfwrwDL/MaQKx7sZod0RquxZmjXvR8omN2iYZB7inttN7g+fn4WRXJWO795?=
 =?us-ascii?Q?xnw36lDm+z4Xmrs/EO+R2XxbHwq4wQuuuUdRkiFJ86VPcuotaE6OOh/fNFga?=
 =?us-ascii?Q?Qy2M3FypQaKUlw4qv9hZFlr16dY2qsQEc5RKlGkFKlvJToluIeO3tcJIzoI5?=
 =?us-ascii?Q?ossD9missCO08v2Up8tN4mCDzdG8MSJ0mHGSqIY0DyuGLqNb3HGy6Rjkxwa7?=
 =?us-ascii?Q?4u9IDC256gR8IMNebu1XJesYAmXXt+dLTagGNa4VuAKeN1yGhM8caN6VTFe6?=
 =?us-ascii?Q?bOZz9E/Iw+XB/nyxzsJ3n82Ck9MZXL4XlxcwSfwCitYTe5Mtj89GCSoRK7De?=
 =?us-ascii?Q?Dml3Xr+lAfK97j8j88S6fOQpoVhIW6EjwmaAj/AxCxlWsg7Y61u7GwJLK3dC?=
 =?us-ascii?Q?5t7rFOMGLaCcOFyLp4v2W7Oe7F4bFmSFv5Jt8ImvhffRTMsJiQ/JYKEnTZQf?=
 =?us-ascii?Q?nDYxmAVwyd2K/xSBytVcrzQVRzpkOkiSb1+3RgmQMw5MEjucsvGLPkxYJtw3?=
 =?us-ascii?Q?S0LzxAmVn4n8HLKASVz2SYL0V6O9Fc90OMGkVabdQ1ubQrl/mvzYQhQCphNY?=
 =?us-ascii?Q?MdlmtGT9/A8QLbSqfgFKdcibbCA9Z9gURePndmKzxVakayj5BXe/nki2DmxI?=
 =?us-ascii?Q?x/QmBWwTMJ3yc/fOlXCYBLA4aa5yDk92wdnckL/Fw3xbQBR38qEhmE71VPnZ?=
 =?us-ascii?Q?p717kxQ2CZaKLoIAOUkUoCcxxFKcLvmXsGCLwvtwhrKn1dW5qU07H9+2MYA2?=
 =?us-ascii?Q?xRTIaR1VoUJvVFv5Y3VTAdeXajWAVpSDQ3rUmHV5iuzuQODt3UuN6nyTMwL7?=
 =?us-ascii?Q?MpZWj8M18AYBffNEinbDlUDu0VF+BBO0FeYNhNIccki1fjQj0MDs0N7LVlGE?=
 =?us-ascii?Q?5dzJDg0pN+ZXDoK+6oOAD21Vpm2rnOFA2jfYlrNQM1q/5Dj2OopenyYCuzGq?=
 =?us-ascii?Q?i68z6lPl5vkd0eq24Id+eJXbfJg0dPHEFRavAuSx9ujijIG072MFUM3EGHD3?=
 =?us-ascii?Q?hH19lxLza8CgnFsunar2LyEhgqLgvj3EWXpLHFVWgQHnUfbXc7UoTfdrdR0Z?=
 =?us-ascii?Q?xLKE5vX1vpXtS07+Cp/rqHqy5Q5+AWU/A+OSI3JYs0e/EjfnHXaoFUQoqx5d?=
 =?us-ascii?Q?8pcj7wZPLAVG518kCEH2Qtz7Doo0UG6hlRAFlWacUlb6+2EWG+q0lNsUeKWF?=
 =?us-ascii?Q?E0Z+Z/SjIJuJIi+tBKLCWPNOoUX6Ne7O06GNx1sGOwBrUSBUPAHQsZt2PGfZ?=
 =?us-ascii?Q?J87992T4+kv6IvpJQu6WCgj089dVmoyAGAgzbKyEBm8vHvvwUAL6XqH4iXb4?=
 =?us-ascii?Q?CT6khl2Jb7AFVtjIflbCPCOm5yq3Gp3Y0/FZNAPFwKm/Y4y8KslbsjDY+xG4?=
 =?us-ascii?Q?WX1kBrSTuotcXeZ5Nrg4sW+lJBU6M7GIcHe79jfNhFUwb9oYdhL44FzR5/Hz?=
 =?us-ascii?Q?dbMdjJq1/O2JDk0OshhTn6XYcxXqr85xk+RKWPSPLkYCPzBuCcGBPs1qeo8i?=
 =?us-ascii?Q?phGpkqHQmFoioPMyCcpL8+BrvEquNlXj0udr5Hqdjs4MzgJeNGgIDs9SSA9i?=
 =?us-ascii?Q?Y8aLX0zxFqnOXC1PqtFsgoyCtNRMOWXgLC0gT+xVa0SZOcAL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5989c032-30a4-4ba6-aa51-08df431511bb
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2026 12:36:29.4307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ayQJA+TMAo2ngzbzduKTdAO+oZGE9ZNaTEFnrhG+L/15rqwKkoOgqebnwj1Dqd+aO/NtjzzEGyOxFrobcQrjPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF634736581

On Wed, Nov 11, 2026 at 12:28:48AM +0900, Haishuang Yan wrote:
> The ERSPAN type II and III receive paths take the length of the ERSPAN
> header from the version field of the packet, with erspan_hdr_len(), but
> never check that the version is one they know: 1 for type II or 2 for
> type III.
> 
> For any other version, erspan_hdr_len() returns 0 or the type III
> length. With version 0, the ERSPAN header is not pulled, so it is
> passed up as the start of the inner Ethernet frame, and in collect_md
> mode the metadata is filled from the wrong part of the header. The
> ETH_HLEN pull in __iptunnel_pull_header() still covers the bytes that
> are copied, so nothing is read past the pulled data.
> 
> Reject such packets, as a packet with a truncated ERSPAN header already
> is.
> 
> On IPv4, a packet with a 4-byte GRE header is taken as type I without
> looking at the protocol. gre_parse_header() treats an ETH_P_ERSPAN2
> packet as carrying an ERSPAN header whatever the GRE header length,
> but erspan_rcv() then skips that header's version and passes it up as
> the inner frame. Type I only uses ETH_P_ERSPAN, so check the protocol
> too. Such a packet now goes through the type III path and its version
> check.
> 
> IPv6 has no type I, but ip6erspan_rcv() does not reject a type I
> packet, an ETH_P_ERSPAN packet with a 4-byte GRE header. Such a packet
> has no ERSPAN header, so the version is read from the inner destination
> MAC address, and if that happens to be 1 or 2, the start of the inner
> frame is stripped as an ERSPAN header. Reject these packets too.
> 
> Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
