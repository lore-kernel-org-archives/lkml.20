Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792665639;
	b=22+z8Qq0s05gs1ZWAed/aZfRfsDQ9lguaIxWx81aB/LxQshgMkrXHoZkwis3dwDIr6Gm
	 MsJZFvxyZec8Rde0L0dRYCliu+Q8/UTncOJFi16pSTyNRD11FVQ5CK0MzGaCefAjn2ja1
	 xfr14MYfhgaydWo44cDeqQJncPS7zQ0k3/vBs8q0C/5kyOFRlBiDNe7DxYWiyuQuBcG4I
	 uhPv+XDJs65UEavXtgHneN/K0fDVdoc2Kbzx9JbnefkxDVQg0UNqYvgM1veFOHrJybgaZ
	 oOzFQ4a4/dWfjA9+UnCje3eWFpby+qwH6qmn4dx/ZF8ckVBRtpLKR1DH8lCy5COV5Gw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665639;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=kM5Iz6iSbrgwtqeY3LsEOsYK1DVhh8NqFmIjlrOkz+Y=;
	b=FtOwvU7Cw2Iedcx7twBE2+jQzgMfjmUEOVXED5niy1Rvs3+emBW+NT/6R0PbFy3kgRyY
	 4erSFPmkWAfsP1UD1dketJrukPaOSpovIjA+F2B+iVF3hfgax0UmXvTms6NRHA8+Q6f1c
	 3IbBsGShr5y7YdWj7HLV95QvEZ99Eai6sf5bYfnup8u41yBvjxhKDxhqxp2VwsKAUeMdM
	 jPK7bPjNPPA+0Syhv7Ufeetq2nej5HQj4+OuP6/XBDxJA2OTcJ8S4G1LEBxv03hdOQ02x
	 BBymj2bLDYNzqF4MCgIHBwAUlTWXeGsnlPnHqRsVmisEcEtdsJnlnrERnyKMroFpOJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=G35DHwzS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.56
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010056.outbound.protection.outlook.com [52.101.193.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F8A606A31D;
	Thu, 22 Oct 2026 10:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7F8A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=G35DHwzS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G7vQ+OQdBP8Fdx5m/Ur55UwI3bX97V58C3zAE2kgcTN3T9oADtUauLGECTHTCLk7SIjFOUrW6Fcvs81LLnu4p66BeIFlW/O5Nuvlp240bvXIbdjm3xRpEPg6wpLFfYqQHgfOrxtrgW7ZSJ2q8jB6n9Jl4x8wEsVuhp+6OFk+LrAJkSLoECM6O8iLWfFkgldQj0DldS1H8VYVI8HFcSh/0y+yioV4vFGA2LEUKEqEspiPeLSNWxqJ7A/LBAbKqwPRSHb7uVTs+viY6dodYE70utTHG38mLxJCBkVxA8nBZNlvZjG9t7fcGMO2omVPhh9j+dOniUqdM4Ounooanh26sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kM5Iz6iSbrgwtqeY3LsEOsYK1DVhh8NqFmIjlrOkz+Y=;
 b=lQjAmWYMXwEzpUMCJUG1VXaJhq4Fk6a12mikyYyeXrOQGpLilRM3o1QKlJuVUh5MDUjTWXmfp8EXljqapNSuVz56ylhxY+fOwRSMX96gboUH2Bwv30huKcL8K694JMRA2MT8J/QIuIf/JQsTzxfNkcvvVWLxBDcyAfaY6GRWWDFKaMILSG/kUDxd4S3OuC+cz8dEjfSQmqXbuAFiD8rl/7IygnJ567EejZok1ersu2Vkl/5hbx3p5AVz2XHNMbzKqQafm7IVv/BpIe5Z0gYbSMuUPqT2D4kAs91pF33+ADcvJSf3vab/iIEDsa6IlQaaeyuP5yGGXdGyxpZsb8faHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kM5Iz6iSbrgwtqeY3LsEOsYK1DVhh8NqFmIjlrOkz+Y=;
 b=G35DHwzSz7sNT/Z+4Ye5bcpTx3MdjmvCUzNGl9CmRKQ203rSynLzROw+MGfbC8JxkVJjqX0BKA1Lk+Rg0iJziJcHe70/6vZlOCQzj1FboAjQPVXRTFQFCsUu/Zs7Ebplv6rmvBL92lEbNDOsPXMGVfyNG5pnZCsBdRUmL4Sbz5RdlhnJa/MwgeIo3lhAUA4+W9EL0rlqNpyrSS49tPn7CR5PJ20or88sKFxntZVSPzMvniPU++DtGYFIDeWvwajUiNlvo4CtPJYnken5sL3UtxYC8THQuRsdI1ohO9yCTAcF0rMV/KERk6ipPLv55Rx3BTwWETaGJrNt26rtLtHKwA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by MW4PR12MB6756.namprd12.prod.outlook.com (2603:10b6:303:1e9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 10:40:35 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0546.016; Thu, 22 Oct 2026
 10:40:35 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Donald Shannon <donalds@nvidia.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/11] dt-bindings: usb: Add NVIDIA LSTP USB adapter
Date: Thu, 22 Oct 2026 13:40:27 +0300
Message-ID: <20261022104025.3956402-4-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <9b0436bf-3430-460c-b03b-f943eaca9685@kernel.org>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com> <20261012-lstp-usb-adapter-v1-4-aambrozewicz@nvidia.com> <9b0436bf-3430-460c-b03b-f943eaca9685@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0388.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::17) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|MW4PR12MB6756:EE_
X-MS-Office365-Filtering-Correlation-Id: e720143e-098b-4fc5-cc37-08df3028e73e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|18002099003|22082099003|261009223027099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	2Xi3xB9V7/xBYjmZDy/npbD+2UFyu2dBhGzgiGAZijpMZ0D8uY+/qdiiHwzIbuw/lb2oNJyMaqrTQGoLbQYJLS1Pb9ulr7okn5romvrKlvRBzOUhyI7jm2paISFR8JQnmRCNtbneGJuZGsdFSxHy8vAICznE9opCP1VUhREkH94SXaSXC3TiFnZydaQO8WQXwH4pxR49B1cCf9BG1S/3vHtR0GqzRowA+zT1aOPSrWIe3Nr/zwXNfy9biK60xSk6wEwQntvvlgkwZtUMMLoxhcbSNi6p4N9btHLjMpGdx84YlnrrFcrWHDKdaj53832ph/jYPeEMQrrS3AeJuAZVL6VUICpF+ljoP7E0zPIk/evBDvd6J3BrcCZfyOZ6aAgcyTutWuQlP2nFOXZOo9lgCcy+9Ix4l6br7BH29xTNgPQeip0/g95j1KiZ9I939Hi4BRWi3A7mShV0zZa4pS+Hgah90vUtCEay4bPGq4I2iZD2edIAnmxMUcj2UWkNv2oLE2jxbmyeQFwrNTLmwCHfGIU5Ydfh/8gJZvwKtA3zzNai6sko4H0pitkgmiVclsoXJYfOdRIPSk02t4aoXW2g2Xp2zh1DciF+pA+zYZEUaMLC+3codve7nGvxeX/u8MSE9AiP+lVsrSIyEJaAcfiJrErwCtipR0R1c/aX7cM2v7c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(18002099003)(22082099003)(261009223027099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iNQAGpPEiUx/in5hZtHiTWNN/HDUUn8Wc/kBR52r2wuUw3ZhMLxw9beOl2wk?=
 =?us-ascii?Q?F7Toldi+JsgVbgCsGqXOx9lz2ipwszuAVXDrKfgVTMQXei7ZI9A2L9934BX9?=
 =?us-ascii?Q?lZsRZEQ178RhIBAfpPoQEexJ1nhUdYKrYO1HP4gAWgjjDIbOEWyVLs4PkID5?=
 =?us-ascii?Q?S8mQePoMBB/hAK7wOuiYKSmn1Por+K2cEa9q8Sh+iaWT8vDJsXClQeoKV4SI?=
 =?us-ascii?Q?40aRD2aa2VEJynmmERxxAJ+qWBwzwYEUUpdAAnWOoMglUrA8GFXb4NP1Wj5I?=
 =?us-ascii?Q?1x9BG93p/pjbrK8+lMJj4x1fqh3p4jJAmDY9FsVVq5KpmLxluXHZwcsNrYTB?=
 =?us-ascii?Q?VBu28VH5BibLjvsPYd54srFVcixXUMccuy1u4VrI8l/WRm9MN7pkRT7OrnMZ?=
 =?us-ascii?Q?TvY0oKjaYCvHKAxUCCuPMh7LSSwLv+ZvMx817RRnw/dxt5E3+bbUbCuF7+kn?=
 =?us-ascii?Q?5BNG6Q4WzzkwPiNE9OtXPp62sFyi4Yc5Pi9X4HH9wrIlgRcyGOGW+iwwgJ7+?=
 =?us-ascii?Q?sijQNrecMcfwtIvk7+QyxCglr8RNcmz2oHsJ7hXBQMfmCptymDjRAM+MFNmV?=
 =?us-ascii?Q?p8MklxUFnVYq1EtKuvMd1AhJfuqH8nDi3CgSYLg19cSeMLYcClHYJM+g5+Ab?=
 =?us-ascii?Q?GxAGU8UgpJfWbEaGxyhD2bL9phzOan7SpRLqWMWvL/utKVWi8KUIWVtNO1NH?=
 =?us-ascii?Q?S6FdJpsYJqEsbcYIgDdZa5NsiT95T4B/Cxe1UMdlUDVS7OQyDA/J1VXP/xXF?=
 =?us-ascii?Q?RRrt4gJ/MDYQc82TLOpMBPh79JS7nxe0sAeiIap/vCf4K0Qt30vwQWbCZCQ9?=
 =?us-ascii?Q?GtN5kdZ8/rf3ShOqA0p7mV01IEewQ3LH5LFYHp15nRFEBF/tW8NJu9CVivcE?=
 =?us-ascii?Q?fa11SyHaPvLt3VdYI5p6b1Y/RNDqLMQ+mcB7oXLE3+x94FSs+wm4friSN4Sq?=
 =?us-ascii?Q?7gW37pJKKcXIRAXhrVvZj/koBisRABqDYb6QYWmHG84Ww1gjjwZgfK0X0rHM?=
 =?us-ascii?Q?LgoMVZIYxNZ9QKm0gpyJSSN7si0WJZJdxbnrGu1HaU3hc5s6zYlnbhoimMo+?=
 =?us-ascii?Q?eYOk6R60HmuAvCOAqxLzDsnNxxoWAwpLVcLduJVv9C3xTCdjBRDXH7GQoFoQ?=
 =?us-ascii?Q?XYV0V2LwLa5R92djrwv5SdNwvnakcqyUA9fWGzWvS/cDNAuJLOwIBuiqxmub?=
 =?us-ascii?Q?UHiabZelubBWEi40k5c/VMXOkNDKAbTzbzdHGkOJHwkRiHQJxKTTzU7heuF4?=
 =?us-ascii?Q?m3yNRcLf8sjHOF/FmCNH6eUohIzcOfyL1dhnwPVSkBpYGj7rxhICdI3DkmGJ?=
 =?us-ascii?Q?YqVT5g3rM3YmbfhderXcfeXuO0MW/ZQ1yviyO349jnzIkFM387CCX7KUILXi?=
 =?us-ascii?Q?sECF+3X2jI5gv9+mRLzY9H69qX3zQQ0XFknpciDEPr1qYdzcAqyIdXO93ms5?=
 =?us-ascii?Q?EBZjai4jiDsJmOUd9fxctYq3V1X9mQTkBDJRmeGt9WVfU2Q/3IZsCKahGlpZ?=
 =?us-ascii?Q?HMYPVECAmZ0P63o2sdIFQjVUILVi47wlX4FtOoPpQR8V3c+cSs9JzNOuwncn?=
 =?us-ascii?Q?Hx9nkhKZE18IVtntunuZe7RVtpjT0wisxYW9iMNZwgln+Ncow0TwfsZpq9xg?=
 =?us-ascii?Q?fpYxDs4mzZxAu9ADzRAhjaFR/8c1QSS5pHrXw9PhmmLOVaLP8HYlJNrJiT2X?=
 =?us-ascii?Q?5Um+JK7xtdn0YxWgIiKTAG4SzdGwewVALcHDIIp5oFZk+YOSYDTsTgW3BXpg?=
 =?us-ascii?Q?Vwgx0P9tsQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e720143e-098b-4fc5-cc37-08df3028e73e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 10:40:34.8627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zM3PFWnoe0/IRr8iEA5Sya7vUnPEKRoXhyXIl1cKSMF8PrJl+L6T3oBzK80/RwJvCYSFt6TnNV88IGiw+X2vQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6756

On Tue, Oct 13, 2026 at 08:17:18AM +0200, Krzysztof Kozlowski wrote:
> No, compatible, not presence of properties defines whether device has
> SPI or not.
[...]
> What's more, your top level compatible EXACTLY defines all
> this, thus none of your properties are needed as they are implied by the
> top-level compatible.

It cannot here: firmware decides the channel set, so one VID:PID
carries different channels per board, several of one type.

On folding into the parent [1]: one device can have several I2C buses
as well as SPI and GPIO channels, each with its own devices, line names
and hogs, and other nodes reference the GPIO channels by phandle. Each
needs a node.

Is a node per I2C, SPI and GPIO channel acceptable? If not, how would
you describe them? The interface node I'll answer separately. Why DT
at all is in my reply to Greg [2], the other open questions in the
RFC [3].

[1] https://lore.kernel.org/r/58cbdffa-7574-4daa-851b-dbb50012f158@kernel.org
[2] https://lore.kernel.org/r/20261016084443.1972351-1-aambrozewicz@nvidia.com
[3] https://lore.kernel.org/r/20261012-lstp-dt-rfc-v1-aambrozewicz@nvidia.com

Thanks,
Adrian
