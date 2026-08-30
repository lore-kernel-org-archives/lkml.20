Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2111.outbound.protection.partner.outlook.cn [139.219.146.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B03D245005;
	Sun, 30 Aug 2026 06:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788072704; cv=fail; b=OWBaqzddw/BnEC+SbO5IONnsBH6b2/htf4IViMumqqRuANpKm3cNW6OhQ8uJsDeLmq/jLRBa8vHorS1fFGMXuO58On4SBm0mZ9m4viQAxl6+TFd0G9GPWPFPD9KP0ef7KgZ4G3cs1wa86m+9poEhwho7GO0+Fns9hBE2PCX2Ba8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788072704; c=relaxed/simple;
	bh=rL5qrM0Hl4Hc3SqIMK4P5wFKOuTtI1/70l0Q/BHEDoI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Z5R1JcpPO+ZsDD4+lAN1OjJUVYqk4d0Mhsr2By1lH/M5nxsfbcYcsO6SY8UJ7NdBDEBvcfpKfQz86eXgR6qrQPgRXNfPRoplhDNu+uafu1La+g6PnPWO2WtfTH5SrBYp1GaeAzAKLmuLSV/X+7Ty/th5BvSnbRh6HfHmonAwAy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6X73tbflJmUC/NyNLk8zShcBtzBYx6x1f3hUYpRE7CUb7SofiW0BHBjG71j2H68uFwgqFGJBJKd4O/LDykh1RQiVyqLl8lTUWSYony/7p6r157HksYGykNEkUt8Z0cmEGi2JTy7J+qzUSx51e5VsJD6ejvEVezc71thw0JS+xc+roKwGMyV3QhJE5JLNcrQbh8bO6+Gr7xlmY3glXM+FXk5r/04hCuBBc1jHDO3uDZAAdyysNFisI/atLyiwO7i3mUFBRBw08QdNIOkGF9XFvM8Lhlqm9EP1ss1bxgqYh5Hyr9kfe2H+UL9J1Z8xmqu9ELC6rUj0spw9qURXTv8mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvNbJNaTNQHamSvuLtrdZ7oD7XaWlW0uNYaWC4kS4kw=;
 b=GW9q3vR2+saa4X5GHJKGlCdgMqeRxu0jBSgHl+rK7rAHiiZKWvoJIakYxHwEehw86g2mkSW5F0CGLyNamgJ77W3jhRVn+0C4O0cZ7n8+P6W2hLa8ZCpzWrFBc2Uv7vt02DcXY3pMG0caNnfojclXt5CgJWSUW1W52Au4ldamqj7jSkNfZCvWeXxXRVKVUIUIBF7R2nJC5wpRiaTEQSIHGXY+ZATKpcbKi2fJ9Tbi1P96fh6j/sIudqQNVhMZeTOgy0bdxrwPNSg5yQBH4eKr6rbfGPfBUUrWqwD2hlc7TERABma8w9DupPawbTwvV4+2YChrn4oTYuFvcLLrI3Xbug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1169.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Sun, 30 Aug
 2026 06:51:30 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sun, 30 Aug 2026 06:51:30 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 0/2] Add support for StarFive JHB100 UART Routing
Date: Sat, 29 Aug 2026 23:51:16 -0700
Message-Id: <20260830065118.51551-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJXPR01CA0069.CHNPR01.prod.partner.outlook.cn (10.43.33.36)
 To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn (10.2.3.102)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1169:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dbd0351-9126-494d-5cd2-08df06631f44
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|366016|376014|10067099003|56012099006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	xpWqRqpGNyggI+ECkO49g4X+vfV+sGHoAB6B+u/4HjOt+U9WSmHmNV4rQ34TwScubMx/sEGcSnpvb7PjeaHKvPsM7sKZgEzmAT9nWjRJd8CLzAP/gqO+UH+8k4/7BI+kn8YQS78idvMgezE/d7e+3u4meVNZOZckesQ0Nuh3aEKtEYdHtQpYin5bdQAaaZP16bdshfM5wBvhp4fL2XDpI9tVs0n+65GJ9GHJ3Zc+o1BXY4ezvKBzEKQGjUu/SFiO5orYQuwfnp8uKek3eViFhapv37G8QOcn89Rqu6VtvDMdLMc0bO1r9PSI8EOcDtPn8rIwTmDLrYbFN4kLm6+zNrUKytBJAhOeZTwka+qZ32hfLCGFiUZrWLEusCsGVYTLBTA8ZASgOlVdtEaU7qdizED32UO2sfMEW0xr5kru2h3d9kD1l8Q23qXQu+ctwkK/gJshLHnILnnRf3wOEbXcWw3KlVN79zV65BlseIeil/0YhGKUiZwa2kevgVMrX44AdZHwtYOHN4dWYpVUar9TsqAFql77sb1sNfCnpGwJhLlZjTb0smKTKRiIaKNS+Uq4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(366016)(376014)(10067099003)(56012099006)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cnt44oOIl8wjYnovOU0Nkg0HtiM0KwRnRfoUzg83/S/NW7+Fh0CPjjt2zKwR?=
 =?us-ascii?Q?Y/xE5+3AEiYHZvtRcQOk0QyQ1/sjG/68T7KV11MNsVlLIaWI13kvl3xcZkQJ?=
 =?us-ascii?Q?10MYYBfykb8teAdWzGBFLZTrMeKpiCjKFqD/fFFeEQUbiYqNUzHpfNbnNdrp?=
 =?us-ascii?Q?3Z70vx+q+FLcW6NR34Gd4OXEm7/njkyb0ud8ic4GHDhBpb1TcuBRgIBwnMMC?=
 =?us-ascii?Q?s6mol5JQA34ryUoB0PjXTSCvvtdxeeG1dgqqSDJVY51f5UGHTu9pB6Pj6zE9?=
 =?us-ascii?Q?ASkMRGCLucHog0K+EGGwTkgAGmxiZo3AtHuHhccicKRHOrxBOkrZeZQXqxCF?=
 =?us-ascii?Q?2L7hbbs7KLVEClLOb/DOg59bJHehQtzo3laKy8cSO9ubzjCZNqeRLoME0PrM?=
 =?us-ascii?Q?ZsX5njymnNpXeSEw/P7h4gvYeI36XdC6p2AUe0Zr3+7k6IShG/LN1Idkg7W6?=
 =?us-ascii?Q?exUgd6r8zOKQLvgEYuBWIT2L1+U060LgN/btsphyxJC1kzhWK9HY2rIbJmDY?=
 =?us-ascii?Q?tCpxnA2Pv0Spk1eekqEbyCVt1vlggeA3/JELR0umZQKKV4ohRGcwzGT2eTHD?=
 =?us-ascii?Q?Ur2iSg90PhXrodU0a623nSShxBjs4SxXy18npbxxvlphJl3wqCvjSEshE4Ch?=
 =?us-ascii?Q?P3zNIgXWarmKjDUCkzXLQaK4EK4/QhtxNPWJQQP9iEwJ0/0FHT2arV1ZpbDE?=
 =?us-ascii?Q?VpExhbu/QxkJ+e1NLMZPyNsba1zO2fMI248H4QFhJdBebse65XuhHXQHdHVM?=
 =?us-ascii?Q?g4FZriVfXWhu6BHueJNztVB4nfVhUm3jIY28PCPEEdTGxwIz/BAODYE92eWm?=
 =?us-ascii?Q?2AZX0NXuDXpIiYRkxZYcJqxPH4r3nmYVTRAjt7JpoJezEYm6zJ4ZM/knjdGF?=
 =?us-ascii?Q?Y3XYLGokTyIdzO3tIem3zp2QD1z6AsgrQYy8f+83+9kAjz71AKNglhm1ndgV?=
 =?us-ascii?Q?QSegJQv7N53ARqhfjFj9srV5aNZNmcDmbKMEu4lyWWLHyBryeUANp6V3/8Pe?=
 =?us-ascii?Q?Y7BMFMbIOUQgnjr+Ps61G1XT3i0EGOVAku/vCgOVIv/JrFxdspPTrnVXdwNU?=
 =?us-ascii?Q?6SErLEn8Z2a8cOXE4b+ACVvakxBDP48zUhYzJClHE5BjOaCCrDY/ToPilsRX?=
 =?us-ascii?Q?5JpgrbS4dx7JJMeqXbrK0HOIht7WV7Zz5huSf6izqWMJp1GQRnMRWlaCj1jt?=
 =?us-ascii?Q?ZkpknPVcOt8xZJpxWnXCE1t0W1TdweAmuQPwocc9kbc7xuU4UxnWH2NSTcMV?=
 =?us-ascii?Q?3/c5tvkr+W8lf/SFVx7ItYxkcGoLZS2rCaJdw+7VhHH5H1ROkYUG3TP6S4jE?=
 =?us-ascii?Q?/YnFr2aFZ2oM2EKI1yWSCyDh8t4XpiJV4vhUTzzzIuRHnIE8HuFv0XyvkRB9?=
 =?us-ascii?Q?SifeHCUbK4YCEMFgHcUef2uGBgw5EZskyp6VNHqMGulrY22wKbuQ0NltLJt/?=
 =?us-ascii?Q?DE4O8qsbdyT17hmffH+54l8WD4jhJYTEUzp+ypFJIDJyqbBGxpK8IoSqDx71?=
 =?us-ascii?Q?03MQ0C0wBREc8/88p2ZPEaCO5wD/cnGuZ6RxHnC83SwDYIxf/aeABBqdZECD?=
 =?us-ascii?Q?l9QSff0w7dcNEMdIz1WLQqOHDKfbmTExyuOHEbhBh+YOGBc8rzmT/hktohA/?=
 =?us-ascii?Q?WhTQN9vU2jMxzzt8MmQ1N0I8TPpxsQf8N+f8UPIR0ZKD4gm+V5LcXzeCZKmz?=
 =?us-ascii?Q?ZOh+0DAnhdHBJ1DGBSD79NwxMMLtyEuNPlFR4NRBbelbqXosx6CRw99mMIxa?=
 =?us-ascii?Q?9afDyLAmFK3gRePWYwtCWgkaHBySSfrB3vRa2DxqYExDA4P9+iiT?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dbd0351-9126-494d-5cd2-08df06631f44
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 06:51:30.8013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Ur/tsBlAfxM2ICntEtt4LuNG1NoWYcXwpY+rrEQvQgzXKWenfuGtg8VEesZ5hSi1NdmXYqsWAKH+QGIaGdhg4rVz57QcAvpaplvAj05G8mttDAivI20oMM6IgU9Slzm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1169

StarFive JHB100 UART Routing allows dynamic routing of inputs between
built-in UARTs and physical serial I/O ports, enabling use cases such
as Host <-> BMC communication via UARTs.

This series has been tested on the EVB1 board.

This series depends on the series:
https://lore.kernel.org/all/20260828095608.19955-1-changhuang.liang@starfivetech.com/

Changhuang Liang (2):
  dt-bindings: soc: starfive: Add JHB100 UART routing controller
  soc: starfive: Add JHB100 UART Routing driver

 .../sysfs-driver-starfive-jhb100-uart-routing |  45 +++
 .../starfive,jhb100-uart-routing.yaml         |  46 +++
 MAINTAINERS                                   |   7 +
 drivers/soc/starfive/Kconfig                  |   1 +
 drivers/soc/starfive/Makefile                 |   1 +
 drivers/soc/starfive/uart-routing/Kconfig     |  14 +
 drivers/soc/starfive/uart-routing/Makefile    |   2 +
 .../uart-routing/jhb100-uart-routing.c        | 262 ++++++++++++++++++
 8 files changed, 378 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-starfive-jhb100-uart-routing
 create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-uart-routing.yaml
 create mode 100644 drivers/soc/starfive/uart-routing/Kconfig
 create mode 100644 drivers/soc/starfive/uart-routing/Makefile
 create mode 100644 drivers/soc/starfive/uart-routing/jhb100-uart-routing.c

--
2.25.1
