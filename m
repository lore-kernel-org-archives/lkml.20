Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794822727;
	b=NaVx7XVLacEAMl0qX7fhORxdjfxmwJo6hNJQTfZ14mp0cWxND8yPcuKzGldUhILiaO9B
	 9HOm5sqpN7zx2lRvEAB9SpHBsCKYfNvq4QdLVYnb1L+Y/IawdbfrNvWDSDMzvYgtCNK3p
	 qace2Y7JnDC4lbuHYObeWCm8CdKnmlittNefckJLQzvYFH3XLlpYmsYtoJZtO8jK7meMj
	 qmxVYcjWmC/bHRZVDIpQsYWpUNL5vFPi5a8sOkvYW2vDzAxtzCJV097WoBvqudvq9WXAW
	 J24zqMfAgIuLqBcVxV3voKlRJvpGOGxiRv0gVdiadSOV5S2ym0WR3vuXutEGxLfP7jg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822727;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
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
	bh=2sNBSoOvcT9GHDHu22Gaeps7bO0Vb/mHwYLPppW6Q1k=;
	b=KsXIn7FOvodzBt8xOoWZO+DUEIEf86QGnCf90Ao2EWGgauNCj6p7YhoGo03+OaW4eeFU
	 dlCOUzyLodzRw4MNj8ymKy2QtX444rpaS3rQUHXbBLe8J88/ygZaq7yE/XWXAuyOOigAf
	 +VhFzeowt4F3VqogHvl/+dP15ExthsdJXNszrJwzH3m711c17Qwq69r7tLZ3E7lRcQJNm
	 MLn1eoTTvvlv+9CjpzMkBpD4shnEh2Hl7B5TLxoljbrRKGqzSg89HQorRhaly3WjMOpwL
	 6O51GmYuXdMGCJhZj6V+vvatafTLhZEkEke1vGouSDmBnCG0lmDUmnOAU59tJmVrBCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b="sAXt4g9/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.64
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010064.outbound.protection.outlook.com [52.101.228.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4269606A884;
	Mon, 16 Nov 2026 09:52:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4269606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=sAXt4g9/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vmZwu6FjhCkkJ/cgt1u8fvodzBzelWB02wLKlbacPkqjUyyPCrlAwWL0AWgU4IKhNbR4JsrbB1LoXAorXmOpll9mGboNEo1i1TA5l4L+ESIczEOuuYZB0NxwzVrr0vP34FdnQ5243SBHzsZmuJQloWlTqc2ohX+Pgd7pe5g6LjxoByPk+dF89LSX3L0uq/nmMTntrbv0kvtRTTJfGgOiQp6mZjGOwdVtamOn6Oo97vDCGFIItwY7DnfUWg154fdvc+6a0UHq+bgBuoJlKVh9eDVVm0Od/ZVluReYP6lQLzniAx9npI/M3U4o8R9UW5QPADyXyhIjyT+bQ17ao8wXsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sNBSoOvcT9GHDHu22Gaeps7bO0Vb/mHwYLPppW6Q1k=;
 b=JWLCgTnZrXUKyhz9TZLXnJJLAeofJiLy0PD4FD2Kkyf8Fkx3M/tgRUoWl+cSvy9EyuYK9ecY9NCUPJRtcWDWcRy/UdMjD2fDtEpCdqXqObKL6nJXaoGjMqR/p2uz+DTbKqv17ygv4ayNLuvTUAMEb7TggfXSIQzmuyFteKl9ZYJ8ZrB2L/UZcX7G9XWEC3UgdDb1l2Whknqhs0E5CMfV0OkmHjJClMxzZ+K4YTaYwpD5bcg5SD5HJpSb0GBBU7RsVO4yPg1xCI0G6HCU2Z0wAxE/F3cIIxaI1tp5E0DP8TrK85LBoNiDM42H/KE+ryw6hsmPSB+b/rba2pz5nnVpOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sNBSoOvcT9GHDHu22Gaeps7bO0Vb/mHwYLPppW6Q1k=;
 b=sAXt4g9/ISA+A5bUfcJt1n7Fl6wn9gpuIjMS5HQGwvl2tT/LV4rSqwA3x4DeTmGnBX4VhzoEU2J4d1x//FSGE/Y2VbPRFqljddwTU7vFhJPu2iuW5pL+7wAh786YYBuaONy1/rne4NofUA8wpwJKywH32kN3DdSMZ4tF0sykzeU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 (2603:1096:604:521::15) by TYYPR01MB6841.jpnprd01.prod.outlook.com
 (2603:1096:400:d0::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:52:03 +0000
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180]) by OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180%7]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 09:52:03 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Date: Mon, 16 Nov 2026 10:51:35 +0100
Subject: [PATCH net] net: stmmac: stop Tx NAPI before disabling the queues
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-tm-stmmac-eth-s2idle-v1-1-bbe165b743b5@bp.renesas.com>
X-B4-Tracking: v=1; b=H4sIACbS+moC/y2Oy27DIBBFf8ViXSwG46eqqv9RZTGGwZ4q2C3gK
 FKUfy9Jszyje8+dm0gUmZKYqpuIdOHE+1YA3iphV9wWkuwKC610BwCdzEGmHAJaSXmVSbM7k1S
 983ocrFfgRan+RPJ8fWq/xEZZnP6P6Zi/yeaH8BWL9HuU0fzKBkoJn6NT9W73C8Ua+tF0ptNjU
 y+ca8fbsh78eeYrl/9qu4ePh2vGRLJA4DxViEahx6EBmj2ZlgrqptfQA6h29BptOxhnxOl+/wO
 n4h+aAwEAAA==
X-Change-ID: 20261116-tm-stmmac-eth-s2idle-07df298cf01f
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
 tomm.merciai@gmail.com, dinghui@lixiang.com, dinghui1111@163.com, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794822716; l=2090;
 i=tommaso.merciai.xr@bp.renesas.com; s=20251006; h=from:subject:message-id;
 bh=7CQ/l4Pnb7JkZPqhDC8yzJkH6TgNP61+G2LwuOtLsAk=;
 b=mtmTHsYGV9zNZMYWFshDgebksZS2SKVYKiFwV/1i34xFumtTEfUznquvxy3KpPVUpkFOa6iok
 SqJC0wLzeMVC8e/xdE3VNGePRj7TfR1pEiZ7PASY8Tt3tSqtQg6C82L
X-Developer-Key: i=tommaso.merciai.xr@bp.renesas.com; a=ed25519;
 pk=J15CiW2gJfhl906eXCszPfqo+ddBW7v9wVMkAFyVDys=
X-ClientProxiedBy: VI1P191CA0008.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::6) To OSOPR01MB295138.jpnprd01.prod.outlook.com
 (2603:1096:604:521::15)
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
X-MS-TrafficTypeDiagnostic: OSOPR01MB295138:EE_|TYYPR01MB6841:EE_
X-MS-Office365-Filtering-Correlation-Id: 100f5b4a-e988-420a-9cbc-08df43c7440b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|1800799024|376014|23010399003|366016|38350700014|10067099003|11063799006|260925021911599003|260925021311599003|260925022911599003|56012099006|261026121527099003|261026140227099003|261028144727099003|261021135927099003|261022105027099003|261021121427099003|261102123227099003|261009221227099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GJPXUFzxW7jXn/6cib/Nk+7GFZRNVfFg9QtdvKhMQ15w0Nrhb9jFEvx8MdSLbZ/zfkpoEagNTNQqsaqN9JXvqt6wwPKVrgQOXkBYNDpVhE3VIvBRuzliK9TSvwHgxSv1b7QDcE/cjLNXVquLOihpIPD6YpWai8Li3yraJuAQQ5+qI8cQjv27iwYiwaxaMkxdw4NPC3PFmtddssmY5RrAWqcDSftNnjazfTiUmV9fPBUi/NoiHUYzzl94r+4wIJ37KCstqbzNvMErj70eScVT3SM7HjgEc7umQPlCH4aqj2zFKgIOlgMErBErc/h65f5saHgo2WdFqbSYUQ6FqR+ladPGVTbaRtze79ZVXAYFTVDrK6endAYkVbmYiKNxHuf3EeslTJZD1SO3N1XicrYHtKvbOz6KYQCnIUdadaVPer5lCeLCI/hQsu9l977Z4lKhz3oMrElcNhlvP/i/7vmuq/zDoEGk8nvhLN0ZAsWxdGGY+tvGrD2O3bbYEyuzwSfoazvIWuqA8/O0KDr+mfuqfh+2hx9aAvaXTig+0+RRsCMLZMXawKPmMpD9ww26XrFfL3Wo3aULpKw/Fg9ZSSqzzs4Ft4B4COh4ENsYSYAjEBNI4MQWiKlDUrbl/AWnV1pKiJ7hzLIKhYLhS5kBIG3w4Sl3sYWpDXF2hNK+leS4vby1n0IbHT2+pD956aDewr7t0rxYICIx/4ZDsdI/MYhitDfAWPK7PjA+wJSnCtNqJYA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB295138.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(376014)(23010399003)(366016)(38350700014)(10067099003)(11063799006)(260925021911599003)(260925021311599003)(260925022911599003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261021135927099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009221227099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVk1N0o2VDkrbE91U1l5MnliSVNqRXJDWko5bjVFV3FrY1hsam1PVDVlcVlP?=
 =?utf-8?B?VHZHY0pUY2svek1ZSjJYZW5lcVNJLzJxRUJYUC9VaUU0TXQyQytWVjlaMUtG?=
 =?utf-8?B?bERzcG5ldnhkUnVic1JEVEZmTmhLZElWNDJkZDJrN3ZZRDA0dk16U3ZZZHNa?=
 =?utf-8?B?NDRmaFpMZHdONXJuaURMNW5OUCttUDRhT0dpNWhOcU9pbVl0b3krUFBaVGlX?=
 =?utf-8?B?K05LYklQOCtNc0M5MW53RnNNek1EdXZTSXJXT3c3eHkyRDlNZkZOeURxa3py?=
 =?utf-8?B?eS9hRE1McWFFZ0JZSFlKS1lnVU95SkdkaEN3aXFIblFpNUJ2b2h3cm1YcHJi?=
 =?utf-8?B?M1loTWk3ZUxoQzhDVjJWUWc3ZXhSM0xvMmV4c0V0bWFZSjQrL3JncFpvb3R5?=
 =?utf-8?B?MUVqb2V0ZlBKYTNPS1hTa2hjV2ZaVWNHc2d0eHMweEpOVGg0ejRGcGgxWTRa?=
 =?utf-8?B?K0VCRGJvdXNtRHkrTUJicjlWTGNBQlJxeUNZNnNOSGJ4RUNXYTBmRFRxczI1?=
 =?utf-8?B?aHhRTGlTanNNSDF5b1h4WWxyQlFMa3dvSU54NVhEK1FhNi9yZk9CdUtJZHZ6?=
 =?utf-8?B?VUhlc1VsWUY0aFVsbSt2M0Q3K2Y5eEhCZWhnS3c1eXViTys3TXZJSFJjR0FS?=
 =?utf-8?B?cndoekEzQkIxUEZicktwUFBlYm9wSHIxVHdWK2xGdE0wU0JMWklHbFZKTzlj?=
 =?utf-8?B?RzBCaFlLK2dPbTJQd0tmTFVqM0NPSG1yWWJNbHdmS3E0YTBvVmlZUDZvNGtX?=
 =?utf-8?B?SHU5ZVA5QVJydEVIalVheTJ4Q20vUXdyUXBQQjEwRzRBL1Z5SnJ3eGxDVU5S?=
 =?utf-8?B?WENOUzcwZUJ4WmN2aUhuNGlVazFQRkFic3FrY0h6SHRncDZoZFM5Z3l1VFFV?=
 =?utf-8?B?cmIxcXhzNFV1ckZyMW5mNlZlRkdrdUE2a3FkNzczUldZYlovTERPbW4rWldN?=
 =?utf-8?B?blV0bVU1WkNJc0JVV3NHeHJPZHFkbE5YYVU0elpFQWErVTJOQmdtcUpuUFJ2?=
 =?utf-8?B?ckZ0UEprV0xMKzVpblRLczA2SGRudm90T05YYXdFSllQa3Q0Q1NyNTljbEk1?=
 =?utf-8?B?YmlrLzNkRkhTMUF2MUgrMnV4eTJPYmRFbUFYRDY2bXpLdHBmS2Z2UU1NdTBJ?=
 =?utf-8?B?NWxRNXN2bTRvNE1Pa0VKTUw2Qk1MNCtzMXoxYXhGakdYdThPdkdkR0IxcmI5?=
 =?utf-8?B?L1ZIQ3NXdUZmYzh2NnhUMlkzakNHTGk2WW9VNWpZbDFCU1AwU2J3bGRKb3RN?=
 =?utf-8?B?T3k2ZXNOK0ZpVzBPdTZDUHhoOWx6Qk5IUmduK2dqWW95VGM5ZCtWOXB2Y3RE?=
 =?utf-8?B?M1Q5aUtKQnRpbXdoS25maXVPNUE4VHJyaEg4T21DaEVVc2NzMkx5dDE4WVlY?=
 =?utf-8?B?SG85UE9XY3daUU56Tk01czBiSXBEZ1lKdmhPRExuV3BlTTRKWk1oU1ZEVEFm?=
 =?utf-8?B?RWZEcHpRNW5zd0JQQU1ocURyZ3N2SWV4elE0bkNGcEpkamk4L1U1MVhETDNF?=
 =?utf-8?B?WVdPL0I2cnpGYUk2WHVsOUlacGJoYTlmSWtGVS9adVUxN1pBck9wTC8vZWgr?=
 =?utf-8?B?S1UvR1RTVEFodnJ3eHNmdHlmUnBYOHg2SWcreGYwUmxvZWFFZFNkZUlHN2lv?=
 =?utf-8?B?cnZLbGlEeHpnS2lzQXQ3Qmg4QzlQTWJyZ3dpelMvM1ZhbmNqN3J1OVk3bUZ2?=
 =?utf-8?B?eVg5UmRnZUVVNVQ5VUZ2RzNEZWFjYWZpU3o2czlPRzRhNkNtWXNRYlFaRm4r?=
 =?utf-8?B?MDQ3V0R3cGw1ZTRNWS9TL2N3Tnk0eVNicEVQS1VpNk9uMS8rSlkxWnpoZTNC?=
 =?utf-8?B?eDRISE40M3NuS3NNSjZpdE1PUlNHR2U3SzZKclc0ejVhOWdHTnNHa3BSdXB5?=
 =?utf-8?B?QWRUcWtMbCtCSGptUkRnUFNLZ005Q1g3NFhnTjRzR0RxWHBiR0xjRXFzMXg1?=
 =?utf-8?B?SnJ1QWtYN2s3L1Izb0JxL2ptSWcvenR1NUdCZHBCRlk4SDI5cXk0b0pUNmJl?=
 =?utf-8?B?dnNqMENvbWREc2U1Rk5NdUNBZ3EremRwNkhDVFBZMmZVV0xlT2VhUWNmcDNm?=
 =?utf-8?B?T3BYaTdTbzh6dGxVTXhWWDlmNWZDRnpqMksyK1hlZ1kycHc3VEo4djZVcjd1?=
 =?utf-8?B?N1J5cmI2bWJDTjhJUVpHdzBKWUJlK1JXdEZBVmI1VmxmZm5MWEJmQ1pYWklJ?=
 =?utf-8?B?cFRNZC8yU25JYTBFSDVLVmtoeFNoTzc4UTJpL1E2Wm9qZVI1YWQyMisxVW00?=
 =?utf-8?B?RDBERjBxTysyRTIyTDVYVklYbGVZRTJ3eEd2aEhEWXR3b3JXczFtRHkwWmd4?=
 =?utf-8?B?cU8yUWFlVjcwUEljQ3lEbFFuTC9KNWp2Q0ZnbTJid2ZBS0NoTkV1VTRBOFpo?=
 =?utf-8?Q?H0OvgfR+GpffTubDDNB3WVD+fFdoL8AcYmCf9?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 100f5b4a-e988-420a-9cbc-08df43c7440b
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB295138.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 09:52:02.9767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g2UHnnAxERj5LYRBOOtRmSwmLwgW0nVvI2b2WxRU3PSh2BGf1HPx1o8qlt+z+lC0C5kH7GY+WGZ1p50ezJR7/VrAb4cqWaZ2RL8rtwaLEOHq25b1FzqpUNvfDPnjBXGT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6841

stmmac_suspend() stops the Tx queues in netif_device_detach() and
disables the Tx NAPI afterwards in stmmac_disable_all_queues(). A Tx
completion in flight can wake a queue from stmmac_tx_clean() in between,
so a later stmmac_xmit() writes the Tx tail pointer after the platform
suspend callback has gated the clocks.

Call netif_tx_disable() once NAPI is disabled, as done for bcmgenet in
commit 7e87508b5c4d ("net: bcmgenet: stop Tx NAPI before disabling the
queues").

  SError Interrupt on CPU2, code 0x00000000be000011 -- SError
   stmmac_tx_timer_arm+0x20/0xa4 (P)
   stmmac_xmit+0xd4c/0x1650
   dev_hard_start_xmit+0x8c/0x104
   sch_direct_xmit+0x8c/0x35c
   __dev_queue_xmit+0x808/0xf2c

Fixes: 47dd7a540b8a ("net: add support for STMicroelectronics Ethernet controllers.")
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 550a0bd647e1..7dac41b05cfa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -8525,6 +8525,9 @@ int stmmac_suspend(struct device *dev)
 
 	stmmac_disable_all_queues(priv);
 
+	/* NAPI may have woken a TX queue after netif_device_detach() */
+	netif_tx_disable(ndev);
+
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
 

---
base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
change-id: 20261116-tm-stmmac-eth-s2idle-07df298cf01f
prerequisite-message-id: <cover.1794646293.git.dinghui@lixiang.com>
prerequisite-patch-id: ab0e628f44dfcf5418f268d42521ee9cbb65f167
prerequisite-patch-id: 2eba4552886f22cc596278c6dae42bc85b5771c4
prerequisite-patch-id: 523947458d15820f92f68f7c33766ed5142502c9
prerequisite-patch-id: 0aac69a82a0325455096278b2cf4a9bae70862d6

Best regards,
--  
Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

