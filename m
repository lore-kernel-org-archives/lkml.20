Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.130
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794391986;
	b=ZObkqazand4jJY5eOtYUlQReKTMkR7wsj8Vtl3CU/N/G+P8QzGpZh1jPzD/HaU1N1weA
	 upFL4IF02juAld4rz3/JF0utui7P3jiIrNohi+0TlUyNMZCGhV0q0Ny2f4C7U7eBxKfvr
	 bDBoolGNSqcU66mjGhQ7g6eEdNI6L7YUT8a71WVVnTNV9CpNMHos6zDtSJy7iZNRabORy
	 rmlUhHE/AxPMof4ZjADr9vGvuZ6iHZWU6/0KBKmV9+UeHwvkuepIquwaYRORNK7Y/ziT3
	 ECj2pbavKvq2ordm3ZomBzSsfLDQF0LWFSlGaYlPGwWMnQ1lmWa4QvHt1C/ES20eEnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391986;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-Microsoft-Antispam:
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
	bh=F3Wl4ggiA/v1GWi0qXZ3pXFmpZmCK3BVVL8gezk4XD0=;
	b=vi7uyjmYBCBrKlczqKPnOnpdr8cQRKdSaTGXOgE66dg8q2xeyMpUAtpCw0UCHxqvnqP9
	 IzzkYq9DxQqRUnZtKctHFSlof4D3b7TGwLde5utDEyPBPfcnWzS08wxrmjpAk6le/JTS6
	 SJc8ohXtS2l8fHFUMYXnxM82MRqQK+6Orq8G5zXfQLbQVR2Gqe5jH3CQ3y/HOgEgfTJxd
	 2rnF39p21CRAOhCqta3DRjupYpWKjq/1dKbvX9zFxExbtgK+0A9CB908oRsVEhLzC7XP9
	 OOqygruZYfURs2bUzdjPaEnknf8tmnEOMA0aykezpQNy9Qb0SRvstu6QH1K6uDmTo8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.130
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2130.outbound.protection.partner.outlook.cn [139.219.146.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7053B606A33E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7053B606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lazDVRKtoctY7vwUb3CTgGCxo7wxecMnUrULex2dwBnhTIkpngSTu2Lf0nFNPSyuwB2OXM81iTOMx0mrXyIbdRw5Bfylvi4bxnc1pUTPaJF3HTCTo7mpKC8blYg5Bniu2VoEDU79sPcehGLK1JN8L4BF6CvOM/5sVh0UYW+shppGmdvFd4I+MdYtwNDGYQYyy5RksIcLq+2G6UrbCOqbppi4lr4/ZkMakjnrabtP36aOQq5j9O0a8mR9RoIDt/nrbOA3p50s9HwOvxS95dHzRvtgUTxv8CxV+5vWE8Dwl+HBRv5AHQGpGCJy4nd+PPzPYq3Bw4dMktkaKgxI/Fxj4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3Wl4ggiA/v1GWi0qXZ3pXFmpZmCK3BVVL8gezk4XD0=;
 b=SWxITlagwcpxyce1Q1Gn2DTJLmKfpksvhuSziLTsfLr4NIsxAdZRVLfmR4EjjnH9+dkFcTbtZwIQi26VY2gVTfX10/33YflzJYaWq6NOCPluqzMgnFtXWhybzWRlNvSy4f3L5cHP0Su//wLRkOzmZ1wsoGar0V5TUw/fwfB3w04LlptocvWW45CR/LLGY9LqZUP50eMGqPYAUiP6VVTggp5rcSyQxe6+m9d1H0haSjxR9yJeGsJn5eT0psJQCMcaQ5kBqQxabVzseSYJ/x3DplF4Chlk0Ja8k/Smi15Vm9Gx4CVzKgBdxQKrTjKeMQyWdjqIkPyFudqLuZYslnG7AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1218.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 10:12:56 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0615.008; Wed, 11 Nov 2026 10:12:56 +0000
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
Subject: [PATCH v1 3/3] mtd: spi-nor: macronix: Add 1-4-4 DTR read support for MX66L1G45G
Date: Wed, 11 Nov 2026 02:12:40 -0800
Message-Id: <20261111101240.7378-4-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261111101240.7378-1-changhuang.liang@starfivetech.com>
References: <20261111101240.7378-1-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1218:EE_
X-MS-Office365-Filtering-Correlation-Id: f71c1fb4-a40c-4664-7671-08df3fdc5ac2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|23010399003|366016|1800799024|38350700014|10067099003|261026121527099003|261021121427099003|261026140227099003|261022075727099003|261021123027099003|261102123227099003|261028144727099003|56012099006|261022105027099003|261009223027099003|261009220027099003|261009221727099003|261009221227099003|261009223327099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	kCn39l9oxHZCJDri3kpz/IKENwPVzDfmXb1jPirl/J9AvncU8uNV2MUqeRKu5ig1qRyaEgLhZm58zXIrRk/52Re2ByCGFRL7oiAM5GUi4ey58/n+vVm1z+LOQgpqS73VgbGPl6IBZTkBY+kkfpLKxxho3cR4nu9gEa0qIPyFFlZy50+OQRQI79LaWqngfvJl5FeKGfPg5yyb8EEPinrKWjmmaaNtQhXnWNkbX2ApRLQLgnuLb80vpGcnFSOeu/QRaaTHRyVjE6GTKxCkfMYm/57bIqPVFTvvNQ79TQbOyXE+0ygdrnGaLxuKy8Huzuy8ThW1dN1bJvZu6ZGRQKA7pmexlX/DWBWX2C827MWmKSnZrcjK+iYkMJv+pCsbozDpVoFhjEHOXpiW6C0COMnu79li8s0oVyhM99sNg16iAkIhc1hH11WWrOq4eVSSRDPtzTDXiSMVoBliEmftSUuE0oiATt5dIoLVbnQoQwXvF4aJ9X8PfR4ou5qXBA0sgp6WSkT2C+xf2WIiKH0txSfiLZaCxjRIVN3i8YHCd2Hc1ezOPJZ72HEbOLNGgi4JkPMf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(366016)(1800799024)(38350700014)(10067099003)(261026121527099003)(261021121427099003)(261026140227099003)(261022075727099003)(261021123027099003)(261102123227099003)(261028144727099003)(56012099006)(261022105027099003)(261009223027099003)(261009220027099003)(261009221727099003)(261009221227099003)(261009223327099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F7eIG3nEv6SzMSdUDzBGRLzMfuymQnB/0ogNewDfjPuiz0Oo7N/UZDThjD/N?=
 =?us-ascii?Q?0+80nnSV8Ccd3ecgdm1qUuS2Tf8mgOUUX8lpWr+HCrhSDXbsYJC7nscNbWPf?=
 =?us-ascii?Q?GjUQmkFg83YRcb0A+wnkOZ8mB7sHNGhKZeguF/NFu4fHcxXDbGRcNcqpWbZf?=
 =?us-ascii?Q?r6NUW4OuT/NhGRwfs/YoICYmnvg8zO65Y3Oti19ME0iKdd46STLLTI4FYfQR?=
 =?us-ascii?Q?UQBd9SBt1QCSScBpv6etoo+8FHS2awn5NKpiPbnwc/NX5shXHsMIJeJiiQH0?=
 =?us-ascii?Q?ocQovDCOGdpdE9KB8z60jnNZ67TmGllo1Rih3M3sfolnT84vfe25DyVddfq4?=
 =?us-ascii?Q?iOZfi4EgBNLF2IXoqd9df+QQxeU6NgQG0wlLACJT8ICLLg2TBcLuRPKCp+kv?=
 =?us-ascii?Q?KnpF9ZRAC8yuQKZafvXR9Rmg59N9O+BWqak9Us962VI6lYu0AyiG2xoqW1zZ?=
 =?us-ascii?Q?zCJgnEa155WjRIUStgRIjEMzQd2ay9+Dob9IZ0G0Av+Runnay50G8RaXKdbX?=
 =?us-ascii?Q?W2o6us77lpVTXdF5u12vojhBfnW5y3KbJdtD3CK/3GOgaArJVLbDuJgYlSbc?=
 =?us-ascii?Q?yB3sxx2EOdsFpqCpzZdhLWjQuSVjX3HQDQAhhIjGSLbmDmC75K+NtBvNrRJ3?=
 =?us-ascii?Q?/dJf4pDToG7XJWCRUGlTzm9zCIPSV2o4dEZwNJCrhT6n9KInQjVSHkF36/K1?=
 =?us-ascii?Q?ioZfL9BCYo20PKRRDLreQpSHUk379CozyrO98yhgUtEiLHHkfF1qTcYdiy3d?=
 =?us-ascii?Q?Z3tQTcvS3svsG5MtceJZ5Osr793etrJr6xz0VMqtxy9da4/3q1Yb1E/uHWZ4?=
 =?us-ascii?Q?ZDk617gFezl8zHhexkVmiTHdNvqO/9wf0tUEGnJ1h/MxUSreuiqgzivHE5Mz?=
 =?us-ascii?Q?XXbNt5olI+3Auva1sW3J3fGqUH1sftdeU4EzXuwZWKLC5kEg1WPnP/dIAaG0?=
 =?us-ascii?Q?YCfFXQDV0guAEbm+KWpxDScIG3FcfxistXzb/8r59Uf6GoMXd18Unf+JIB2Z?=
 =?us-ascii?Q?kQjScYs3thBajQ3sbLFyFOAbBGJnSCu/tgGVA0Wjjbxm9NEmfkBrxqBdK3/E?=
 =?us-ascii?Q?C4HqthoQgc8zCPvVGWMCxP0KcZUKlaw0v7KA2Nwi2AVS0/hpxpIVfFDANaq+?=
 =?us-ascii?Q?9+kPVR7Wd1o7cn/WCcRH/fhVdpt3VyaoNAlqW2MsPO74BRyz1zpiQNJRjwzP?=
 =?us-ascii?Q?47rvdjXcuC00RCCOvwmdBPmjEWV2Ax930KceYtEW2mdvBCkuq/fWzv2CdHGL?=
 =?us-ascii?Q?xsqj8MJ2EloNxRHx2fOgJYOwHJ7FmiWsJDjbsx2OBHzZEpxl54WEzPt2+bLD?=
 =?us-ascii?Q?7g7fa0Z5r+CNUb704nU1UMuWk8RKD85DVrM/8EkExJ+131RcuEJkVfvkhZTY?=
 =?us-ascii?Q?FaYwvyGB9iMtIOpzoIHtw5eUNITtZ1UNQ6AJ9He9jreFAVq8b0Of1m+VdHCM?=
 =?us-ascii?Q?q0usZbXpaH1X6Pe2gZtGQ8iYQ/bXdIQcdSFM6aiZ6YmwKYQZa9h4V9D/xZME?=
 =?us-ascii?Q?DkLME/KEMh+LXmHNSOXLFD/LPJFBEzUOPM5S3dLObPdNlfQZN6eVc7yjDie1?=
 =?us-ascii?Q?M6y9KBvhwZnIffKGdxd3UQHvK7pRCGY64f0FnLQ4UhKHFS/kEcPtIWuqa+af?=
 =?us-ascii?Q?esYpWgRKDHnMQMdsOS0xUqRPqdJby2IOSB52faD/ekqgv1QKnY4SIQIpNJWH?=
 =?us-ascii?Q?7OfJF1umvikHcYLddMHLMrcAJSw66rQ3XDZ5k9gl/BsbV8vmpXCOUjBf7ane?=
 =?us-ascii?Q?7FuXF6AoxqpqeCP8yAkgPsgty3B4ivfKTHfJAdsEEzg1Q6FvRVqy?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f71c1fb4-a40c-4664-7671-08df3fdc5ac2
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 10:12:55.9538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PZRj40PFe2EDO110M9Wjx84nzkzmg522FE2cg65vLCPmwcYL94mcPqK4KA7QbP3fHC549cN6jeJYzo+pNUnp7cShDQyVkLH5Jg4h380hteNEbP2z6m/0HDYuYtzAfTcR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1218

The MX66L1G45G supports the 1-4-4 DTR read mode. This flash uses 6
dummy cycles by default in 1-4-4 DTR mode.

For 1S-4D-4D, its support bit is located in the 21st DWORD of the
BFPT table, while the dummy cycles are described in the 23rd DWORD.
Unfortunately, the BFPT of this flash model only provides 16 DWORDs,
and the kernel's SFDP parser does not derive any
SNOR_HWCAPS_READ_1_4_4_DTR capability from the BFPT table.

Since this information is expected to be in the BFPT, add a post_bfpt
fixup which declares the 1-4-4 DTR read capability with the default 6
dummy cycles and the 3-byte address opcode (0xED).

The SFDP of this part provides a 4BAIT table, which also advertises
the 4-byte 1-4-4 DTR opcode (0xEE). As the capability is now set
before the 4BAIT table is parsed, the 4BAIT parser keeps it and
converts the opcode to its 4-byte variant, like it does for the other
read commands.

Add a dedicated fixup for the part (SNOR_ID 0xc2, 0x20, 0x1b) that
keeps the existing QPP 4-byte post-SFDP fixup and additionally
advertises the 1-4-4 DTR read capability in post_bfpt.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Logs for MX66L1G45G:
********************

+ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c2201b
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
macronix
+ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450060102ff00060110300000ffc2000104100100ff84000102c000
00ffffffffffffffffffffffffffffffffffe520fbffffffff3f44eb086b
083b04bbfeffffffffff00ffffff44eb0c200f5210d800ffd649c50085df
04e34403673830b030b0f7bdd55c4a9e29fff050f985ffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffff7fefffff215cdcffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffff003600279df9c06485cbffffffffffff
+ sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
bec91ac20c9f7c63a00992fd2f779f8c5378d8f9afc699a2c741be5bdf268e35  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
+ cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x13
  mode cycles   0
  dummy cycles  0
 1S-1S-2S
  opcode        0x3c
  mode cycles   0
  dummy cycles  8
 1S-2S-2S
  opcode        0xbc
  mode cycles   0
  dummy cycles  4
 1S-1S-4S
  opcode        0x6c
  mode cycles   0
  dummy cycles  8
 1S-4S-4S
  opcode        0xec
  mode cycles   2
  dummy cycles  4
 4S-4S-4S
  opcode        0xec
  mode cycles   2
  dummy cycles  4
 1S-4D-4D
  opcode        0xee
  mode cycles   0
  dummy cycles  6

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x12
 1S-1S-4S
  opcode        0x34
 1S-4S-4S
  opcode        0x3e
 1S-1S-8S
  opcode        0x84
 1S-8S-8S
  opcode        0x8e
+ cat /sys/kernel/debug/spi-nor/spi0.0/params
name            (null)
id              c2 20 1b c2 20 1b
size            128 MiB
write size      1
page size       256
address nbytes  4
flags           4B_OPCODES | HAS_4BAIT | SOFT_RESET

opcodes
 read           0xee
  dummy cycles  6
 erase          0x21
 program        0x3e
 SR1 read       0x05
 SR1 write      0x01
 QE             SR1 bit 6
 8D extension   none

protocols
 read           1S-4D-4D
 write          1S-4S-4S
 register       1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 5c (32.0 KiB) [2]
 dc (64.0 KiB) [3]
 c7 (128 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+---------
 00000000-07ffffff |     [ 1  ] | no
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000
+ sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
+ dd 'if=/dev/urandom' 'of=./spi_test' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4e6069fe661b4f2ad8b96620641219cd9b34758e1b5d8585af867ff9ab4c349c  spi_read
4e6069fe661b4f2ad8b96620641219cd9b34758e1b5d8585af867ff9ab4c349c  spi_test
+ mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 134217728 (128M)
mtd.erasesize = 4096 (4K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0
---
 drivers/mtd/spi-nor/macronix.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index b3fdb4b2fa1c..4ddddc7c175b 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -103,6 +103,27 @@ mx25l12805d_4pp3b_post_sfdp_fixups(struct spi_nor *nor)
 	return 0;
 }
 
+static int
+mx66l1g45g_post_bfpt_fixups(struct spi_nor *nor,
+			    const struct sfdp_parameter_header *bfpt_header,
+			    const struct sfdp_bfpt *bfpt)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	/*
+	 * MX66L1G45G supports 1S-4D-4D read, but its BFPT only provides 16
+	 * DWORDs and lacks DWORD 21 and DWORD 23 which describe it. Declare
+	 * it here with the 3-byte opcode, 4BAIT parsing converts it to the
+	 * 4-byte variant.
+	 */
+	params->hwcaps.mask |= SNOR_HWCAPS_READ_1_4_4_DTR;
+	spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_4_4_DTR],
+				  0, 6, SPINOR_OP_READ_1_4_4_DTR,
+				  SNOR_PROTO_1_4_4_DTR);
+
+	return 0;
+}
+
 static const struct spi_nor_fixups mx25l25635_fixups = {
 	.post_bfpt = mx25l25635_post_bfpt_fixups,
 	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
@@ -120,6 +141,11 @@ static const struct spi_nor_fixups mx25l12805d_4pp3b_fixups = {
 	.post_sfdp = mx25l12805d_4pp3b_post_sfdp_fixups,
 };
 
+static const struct spi_nor_fixups mx66l1g45g_fixups = {
+	.post_bfpt = mx66l1g45g_post_bfpt_fixups,
+	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
+};
+
 static const struct flash_info macronix_nor_parts[] = {
 	{
 		.id = SNOR_ID(0xc2, 0x20, 0x10),
@@ -355,7 +381,7 @@ static const struct spi_nor_fixup macronix_fixups[] = {
 	{ .id = SNOR_ID(0xc2, 0x20, 0x19), .fixups = &mx25l25635_fixups },
 	{ .id = SNOR_ID(0xc2, 0x20, 0x1a), .fixups = &macronix_qpp4b_fixups,
 	  .fixup_flags = SPI_NOR_4B_OPCODES },
-	{ .id = SNOR_ID(0xc2, 0x20, 0x1b), .fixups = &macronix_qpp4b_fixups },
+	{ .id = SNOR_ID(0xc2, 0x20, 0x1b), .fixups = &mx66l1g45g_fixups },
 	{ .id = SNOR_ID(0xc2, 0x20, 0x1c), .fixups = &macronix_qpp4b_fixups },
 	{ .id = SNOR_ID(0xc2, 0x25, 0x3a), .fixups = &macronix_qpp4b_fixups },
 	{ .id = SNOR_ID(0xc2, 0x25, 0x3b), .fixups = &macronix_qpp4b_fixups },
-- 
2.25.1

