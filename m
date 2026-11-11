Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.103
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794391984;
	b=wdAWBdUDxqdXHBQ9JeZIxTRDUKfGwn7bm+zZ5nmcEnsqhR9lGgwRVTImxWDB+s/t/E0a
	 XI+NI3zh9PA+17PiaJU85IuR8KJJS7KQ5P00YsmmcUpCNqW7/pM/4n3AtSDD29CgWw/xc
	 QHDuJY01KVnAMlmRVBxVL2jJ8JguxnAwEUcWEpFYFtUnk2eHAKcdZxXdjkIpmWHNSukZQ
	 54Pq6JRAzhDJqNpVEM9XtL3wZEoZSQAFmnrHUm91qHJrg8tGDrSwo3TukXZas1AmV34CT
	 2Iq5ZoWUpDnzufnPWBCZMEKf+clOVuhslh0vrut2+p2cSpcYF2frquYF3GXZOczjPbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391984;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
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
	bh=622Oc0Q13NW4dZ1nbn91Cxs3+lrANNU8+tI7fyppZUQ=;
	b=mswCv6vepQW1LWVnBD3+vUm6Tk72oi7h8XnMzkvULDXoe44MnvOr6vd0PbyIUic4CgoF
	 GjUQabbCAsnwwEzoZ3nfrRw8n5RUlSOAgUpRgiyOopXwF+5bgZjxzC6smA722q3G/XQp3
	 rp8P+THV4oAWgbiceN3zAmcpuFYoxL9mbQcItFuL79JkmyppJnbqP6Hliq/jFAQ5hl6gR
	 nmKRI50Ca9MF5DNa3ORSR/P7ta24e29/sgf2+NDh2qub5cq+9kNq7GFuhcbg1ixmsRZKI
	 nhi+PErjBB/8P8H8QOG47wuTvKXEqquJv2b+fOsJ0y0Ko2umjZPvIEdMQjuPop10HfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.103
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2103.outbound.protection.partner.outlook.cn [139.219.17.103])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FB6606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5FB6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=haCNiydNGADKcsDfdgEbINVzunLpCH0PysR9gYWaR7AYl+lCq5/TX69DMm7oac+lf5n2HAPB/xQQdAsZho66NPzL50siWgXjfjplUH/gWVza4h8qnfGb0rV9SakS5k8Oi1EmvZ8Y0tfKzSxzeKrXsut+aWFxXGUwXhHrxowQ1c9Iqn338/HoMhh60ynLwD377NCUJ6B7RZHZv+M5SVOBqrMm5wkQ/SvjZ2KfDfRMhxfTN/MWRmjX7YXIJGGrNfHVj5z5D15RY56cmcuObRb5S9urlCwLXMFVOnBxv881g2xWTSksFicGiVtKQQoAFpPROifRtuNmShQoYVbvfv6Z3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=622Oc0Q13NW4dZ1nbn91Cxs3+lrANNU8+tI7fyppZUQ=;
 b=JVI/siw0+ikH2sKEwhCfmqUwnirNjOzOUsIJjv5tcm0l22PM99dNtmPGBh505VXV8cNSbQ59MEnL+8nt6o7Qy4FjzfjBaY5L6pQPc3RJZZKt2vxhVK7D6MgK8Wplzk1ZE4fIwivRa0N9AcPSukdu0uf0Pbinlsm7jZpO1u/XGxXruTEP9x8is8JZx5YIetfGRnntWnVpcndDkJIBbXEySboch6Ig+gA034OLFYWu1n4GBYcQ1tljMs/zGya+5m4kf3Sz3VcKaOLpsoqrawiRVazsvxjFDCYhCiTXIiDIuqQyabgWe4Q/ogylcz2eeyLf31NZwfInavZkgTFoYbu/eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1220.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 10:12:52 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0615.008; Wed, 11 Nov 2026 10:12:52 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 0/3] Add 1S-xD-xD DTR support for SPI NOR
Date: Wed, 11 Nov 2026 02:12:37 -0800
Message-Id: <20261111101240.7378-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0017.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::6) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1220:EE_
X-MS-Office365-Filtering-Correlation-Id: 12010aea-5456-4fc9-536e-08df3fdc585c
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|52116014|261028144727099003|261026140227099003|261102123227099003|261021123027099003|261021121427099003|261022105027099003|38350700014|56012099006|10067099003|18002099003|261009223027099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	3BTxPk8c0CSlaiIss7inv/7y+ki9xL5/OEJWjMt8vRzHnxNEVpnyvwYDeDjxFqyToIU3NEwq4LdeNdL467oO+8GWH3Pt7LgOFSnSrXgeGYvrkp3BR1+Fe1SoWYtE1Xx+NGeDOgOTg74oSiQaxA3lQqmHhbft2Ic4clohAsPPh1FaseMZckj1mt91qSVrQLwEeLZ9qN6tjm6S8fL54EPw9OiiB+a4NmBxbFrJEHY4Mh/BfJETFnSStYnN8oUBmrFYomIMoTYXbw1SqChyhorBp2TDBFnCBkpP//4/0zN8gAb9ATLwbSSmHWGru64+KW8EpwVP+MRl7d04wMPl1FL4kl5+SwR5YpTw3Z5XEKWkvpM3yeANvivc60XgRxxo+8aZirrFqh2dtwK74hfaiZN7jGU/vbz9EzE6LGmn71wZa94EOL6C09c/ngP1B3dY5j+Ns69qWf+vTNVEX9/UJxlG35YB7jeApD9DJZjc4Q5awx5gjQ3rQxNGj/kxmZ3JB9dqkHlkGV2DWtkLjLMHcZY5pstgVw/KA9i1BK1p+1LE6HFdvsOQIiyqkpRX2/pkOU5u
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(52116014)(261028144727099003)(261026140227099003)(261102123227099003)(261021123027099003)(261021121427099003)(261022105027099003)(38350700014)(56012099006)(10067099003)(18002099003)(261009223027099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?be6610Cxe9rZobAw6vcLBBoktcQnM9fXB4LVYY+AjOr6B35escZoh43YVutP?=
 =?us-ascii?Q?J+4+gqevoxeAMi+1xfqwfT+/gF1+kuqPzN7BtqPsPu2ZEmTaFfk6LJtXk9ST?=
 =?us-ascii?Q?S5En/fImTeiyfmrfKffu1SARorwRnDBqmtnKwH0Y/rHtGeU0Ka0JvdnvXOs8?=
 =?us-ascii?Q?OdtMhcCDTV8wgjSnMP7ZbdQ/Z1fLU2Graqy+nix9qx/qw6q5dNRqf8YxT9oe?=
 =?us-ascii?Q?Kk5IkTzOd+QszGt+4cRwW2O8frImqwfM1aXk2SH3e5fGr4blieW9jdVIUvKp?=
 =?us-ascii?Q?u4DvmZ0aKpCrlJNdekZiIz7aZOIzeazNKwl8l5f67M41BwQSFwKefPZGvd5/?=
 =?us-ascii?Q?bv8F0h6JzWrXnhHgyroGkUlj4Qk9z+34mij4hQErmMHXKXXe0X9XOJqnd13C?=
 =?us-ascii?Q?qdWKFcysx2CGHLm+jIw6ezGMGKJMghImcXgdCKPJjTX9o9ye28+qSJzAc+/1?=
 =?us-ascii?Q?Pp7y4b8oTcFEwhYUN51ylFtTH6XddmVUITIUoEzdYFK0IO6084CA9tA4WOeK?=
 =?us-ascii?Q?aUY2r7Cp+RQA7Va+YWv3/prZ979B7ZfuYesbb5fhdyFieNNu/D5ypC3y+Hro?=
 =?us-ascii?Q?xndrbbx9363a91mQ5S3kmneOodksGIhL92wGPWkI9EGpKxoFpaxFzuiv33Hp?=
 =?us-ascii?Q?04rt+UHuhneS4hW9+g5bu3q5xAuBCV19mdYdxf/PwAnW7euvdfNUNIqtzSe/?=
 =?us-ascii?Q?MR/4HfTRxU82ILDjwnAAml0g8KqopgVCUIasIfWt2CaghcWaDRIDvV71ay1b?=
 =?us-ascii?Q?ggeXbPxKAQfkDC4x8sURpvdDQthpCBNpnzBLvIGaZSitv/6yZkTdgcqgZQTF?=
 =?us-ascii?Q?w9PcUe/3q1Qfp58VjRdv/aCUrnDivUAmFokcOj2+G1z+WV0CSG17ALK0oTY3?=
 =?us-ascii?Q?O3yRwKc00P7Xr8aBfq5y1dnnn5HZv3Cg6wJWglukvKWO0mxL2zjdi8A9LfUL?=
 =?us-ascii?Q?zj7w9IHPTtGt1jwqJcALVxOX7L0SHknRYG4K9q6LHThtAqFWD7yuV71aeLiV?=
 =?us-ascii?Q?hvxR6CXVKVzkVvN7+tyotP4027ZaTGukJwC/u8LBB4HfZC3l7pN4DWmwfNZP?=
 =?us-ascii?Q?W8PLFuhihMhib8vExQhW46dtIdb9pPhSYsb5fmREndnwjAuFLQGHNTfrigyl?=
 =?us-ascii?Q?0DeU5kGytiRwQmAWHViuE0+yKw/UZiZ9Rb8wDJk8scoz/z1ELlxbpiNCwuHh?=
 =?us-ascii?Q?L1T9cvuxZEwyRzajgWoXZae1P/pXVgjL8xia6vxBhRV6g/Z+cGC1akEvVnjC?=
 =?us-ascii?Q?Uh1zfU4X8I1NI8sj2mS+oEbNEiccMQv5VYyX0XyvBHw2ueF0m0+fP4/uFuZr?=
 =?us-ascii?Q?2hw0TTjIREe/PG7OP9HKk7nQUpPMB+C5iPM3s9shTzIqC7CMXacd/jrHvYLw?=
 =?us-ascii?Q?zeq6nDqSJbA7d0jkoTjcxLT8BddrY+dXsr5FzuJuma7iUpkR9bcxvXOADwBM?=
 =?us-ascii?Q?ayaKP2C5EHJZxPrgfKT0FcyC/rWZxT89sKZbwI0B+l0fPTdV3D0esqbqvSU8?=
 =?us-ascii?Q?SFBgUv2ZqSQX1UjFsEUK7EY3yuarQaGTFGLMvn2Vzfq8eSN4Hx793ysXJIqZ?=
 =?us-ascii?Q?HzBIMyBqaVewCqQP8LpkZKzh8ZkQgxRmQGHrrCw5OgVRlHd1f+GZrEI6xbhv?=
 =?us-ascii?Q?dFqShAhQCTMwvPQCzAlcOnqZTIqL0UaXLaytTN2ql1xwm/4jT8bd3y8A3AUV?=
 =?us-ascii?Q?Aa3rQxyXvyJfiiW8ZU0FiD/8leNAaLFD2hAjB+neqFY6Hb47sGODIdslUtg3?=
 =?us-ascii?Q?/1k+18RcsUaiG18T9l1dlvYU5JAdXVjxDapEtryLE9B6NGQ2jJ/s?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12010aea-5456-4fc9-536e-08df3fdc585c
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 10:12:51.9278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zGfCCGJlAi2MJ41qdWU0j3X0e+/TNRr013YER8yGu0kXiOlrQUjGq40Xg+l48Ww9kCc7pAKszSomRm1ZQSatg/bD09XJnedJepSpZdlwlNkvTcEUkENqVDPIxNmE7FOo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1220

SPI NOR already defines the 1S-xD-xD DTR protocols (1S-1D-1D, 1S-2D-2D,
1S-4D-4D, 1S-8D-8D), but spi_nor_spimem_setup_op() treats every DTR
protocol like 8D-8D-8D: it marks the command phase as DTR and turns
the opcode into a 2-byte opcode + extension. No flash declares these
protocols today, so the path has never been used.

This series makes the 1S-xD-xD protocols usable and enables the first
user(MX66L1G45G).

[1]: https://lore.kernel.org/all/20261028121100.79667-1-changhuang.liang@starfivetech.com/

This is a split version of the previously sent series [1]. The SPI controller
related patches in the original series were applied, so the remaining
MTD-related patches were separated out into a new series.

Changes since previous submission:
- Move the 1_4_4_DTR read command support into the .post_bfpt hook.
- Drop the now-unnecessary SPI_NOR_4B_OPCODES fixup flag.

Changhuang Liang (3):
  mtd: spi-nor: Support mixed 1S-xD-xD DTR protocols in
    spi_nor_spimem_setup_op()
  mtd: spi-nor: debugfs: Correct DTR protocol names for 1S-xD-xD modes
  mtd: spi-nor: macronix: Add 1-4-4 DTR read support for MX66L1G45G

 drivers/mtd/spi-nor/core.c     | 23 ++++++++++-------------
 drivers/mtd/spi-nor/debugfs.c  |  8 ++++----
 drivers/mtd/spi-nor/macronix.c | 28 +++++++++++++++++++++++++++-
 3 files changed, 41 insertions(+), 18 deletions(-)

--
2.25.1
