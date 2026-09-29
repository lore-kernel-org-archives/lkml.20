Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011055.outbound.protection.outlook.com [52.101.65.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9143350A0F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790664551; cv=fail; b=E3K1eXi51PyGbCeL4v6vuc0C94aV3BD5PLb7dZkH3XkPSqlPiM24B6CtCNCVaGTuONZfL4y8WgLNWdMTUtwqDC0n6uFpFMozqWc/Lac/WykCCNIJX2ScgGU8pE5Q7HIBwtejs/DpLXnDXjfkhFR0vKZQzY8cBmK0w2+p4mcXyAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790664551; c=relaxed/simple;
	bh=BHYiabLQ6qi9NJxn8DwqFi59eYN8qYJCckM+jAcaY6M=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=pirNknbvW6nfN2n4BHONMAwhkVh8YrG5TFcTDO3ZI0WoezfBZDlWXd/Aruz5vgBSvlSkHCabyKlFbKyQ/z4qtwPg5sKh5jn1qqk5AbQsnk6mS1mpii0194QWhm0pHvv8k386H+3g+he2BS9LWb9XP8R2rbXb9/MsYp95PIxlvmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jjIHCVn4; arc=fail smtp.client-ip=52.101.65.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jjIHCVn4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZ5TrqYurZ3KmZQUoQKTsLzBem+z31QQLA8M82WryqSTDTAE8p1bTAZSNi1rV1QBvUM0ByswQ79M3YNNfrc1WBwLEClILg6eARp9jBt4hNBGHNcm26oRWc259NZ1Sh7anCD/907AL+ZzGe2Lr3TVTaYwgf8Wrshg1nMc+lFN/+AhbR6Hm33ZgJCYZhrvu6f2y1px8J7eHCpsjhgh+B37oyodsEuQt5sgbmpMnw0Zia5DWbNNimRZA5uSM2i4sLeInt9UifEFka49B/sTlngexO2p3OT0edUWW5iJL5Tak6gLqH5Fc4/WmzirDvOL7J+Zj3cx5srhm74Jwctlf9B8Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JuFQXR8a0YY2hgvk+L2heogf5v7MDs87AZX9KFWD6zU=;
 b=dQRYVxmDw7CfeRbPq03DVE2R0rguLFa1eXVqehPkjwG3dKRwqI0UOepyUPlCW5JdS0aGGy3Qb67O6oF4lMDxHYzMX4Dcu4zkKUWgroKIl23v5+3tWySwsQ1bgahXD0phDRACRFb7kMRLG+9H3PB1Pyc9tsPEC5V7LigBVQzBHzzKLSIjuOh6cdT5nqXKy4xPSJIHez6ugTJAcbe3KcVgspMOYPj07VtHoOpY6iM/V5VwOw8WWb+XMTKLb7z/YK1MNtV4eml03I0nmpxrPQ6h6tqsel9cAPuYTr4tY9kF34MKQrQXVwZSB6ukft+TpG9ovXiuiGkqqx+G/ALpBwT1Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JuFQXR8a0YY2hgvk+L2heogf5v7MDs87AZX9KFWD6zU=;
 b=jjIHCVn4wufHncL3iAd/f5IiNoINUOBram7p229QwA6jAEDF9H/VdRIZRTfKMxgIekLuvzx5e/lvxnAjkO2G6qnimul82QGLRB436awKoHjZtB0ScelvTfzjuBxXvYbqJGwoD5KpSH5laFBBglAZmjKQwfyhiPbrZFiuDG2OdPtsRzA/WSXkBTZPJxd/BMVUO9a8h/ZxLNNjQXbD+x3OPcMd750R6rA1ER/6bX/BBCNwI8axZ1QiJ7DGx3cEKZGKz6oa+N9AmCVnX7qSJrA14QeEAJGo06Mw27fp5FiyfSgiBUH9/Yb7XWk7jMYlRSVf0zH8eceaHXXkWChZMXxTmA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22) by PA1PR04MB11430.eurprd04.prod.outlook.com
 (2603:10a6:102:4f0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 06:49:06 +0000
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2]) by PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2%7]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 06:49:06 +0000
From: haibo.chen@oss.nxp.com
Date: Tue, 29 Sep 2026 14:53:07 +0800
Subject: [PATCH v2] mtd: spi-nor: clear the default RDCR opcode when
 entering Octal DTR
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-spi-nor-fix-v2-1-75440cfe4e76@nxp.com>
X-B4-Tracking: v=1; b=H4sIAFJgu2oC/22MQQ6CMBAAv0L27JqyURBP/MNwaMsie7BtWtNgS
 P9u5exxJpnZIXEUTnBvdoicJYl3FejUgF21ezLKXBlIUacGumEKgs5HXGRDNj0bJtL9RUEtQuS
 qj9tjqrxKevv4Oea5/dn/n9xii5a7q9GDsouZR7eFs/UvmEopXwol03+kAAAA
X-Change-ID: 20260928-spi-nor-fix-eb7ebe22a740
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 michael@walle.cc, Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790664813; l=2783;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=yt9wzN6CH0kwWTN44oiWIwDb7Ww7u5Z5wLSssQtm5CY=;
 b=ecA5g14RQWxvBKxl5lyVm7pOf5t4yuWTXmidGjlglZiILEyPvTS2H38mx1sp9CN6POU3l4NYF
 X5K94MWs81rCG6mBPhyvHHaeVCFv4HTAb0gsaNOJBP2tYFBBWKE97s0
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11909:EE_|PA1PR04MB11430:EE_
X-MS-Office365-Filtering-Correlation-Id: 199dfe09-7fd0-4c06-06f4-08df1df5c1b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|23010399003|10067099003|56012099006|11063799006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	SzbC4o2E4Gf5WHHXxbrPqBVuOuPb03b6WMUIRhZyPP66+iILr7GlwuuQGw0X3GQ48hwr+w0R3xgAqCdFs8Ta06+QNNpYbpFw2tNRvZTXlcfuh+TAGsnvV5UoyrUkVfqMMMCyw9HjnBz+AWzIgMJ8HSwUi8BvTk/qc+aYogH4pKkOPBTCme6a7M+lPeFIKu9OtImzNkkpS7Y4HB4j9dYqbb0ETBRoANNBwJY4PD21sXFssX55v9Nls+bo5MjKlMLbC1hvecyX6cxOP3Ionqzgjlyj5MaV4sHhRa2aQ1PA72KA8EISRd/zamyzvdEy6oPerOQ7pVccjujDAs8ibGzGX+Qu1jrqKcMyfS4DDrRYybynsVDgRURjFp5B3+ObsVWYYKq0rKUlmmb+uSCqWW7r34I5hzwi1CxsSJ/NUMhYODROiRs7/GBesZPYYao+HFEYGoniVgI4tZBCSfJ+nJlEaQCB/9Ndm4XI+GGeGw2wEXfxEV/vqizC/EF2p0LngRkr6SuyAIbeA2EMuZn5c8k/wfb+gzqBbN3EHj9O9nArfaZfbFLeO5whElplFOZHSDkK0nFJ8GJf+jh+G8y6YG3E5CZnXLUJxunNJw1BxPSXQGfQDarYilfr6Bzgdhv5+0m4nkWAzwhuMTZSRk9Xjq8O2sRkg7ywc6AuvgUgApiFyv4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11909.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2NYTmlGNHNXK3JGTzVCMGhVOUdvOS9GMmRkUk9MR0xZcWJiNzhtMDZRbzI5?=
 =?utf-8?B?YXovdGxyM3pOc1pxdHdVYXlScTQvTmdQM0lwQ2ZDMnRDRW9yQkUzTFpCNUt0?=
 =?utf-8?B?MVZ2SEVyR0g2VmdqRHo4eUYzKzZOVFRZYzUwRGU0ZHIrSnU5ZTI2dmRtaGh3?=
 =?utf-8?B?ZGszZDYxbFMxVEZrdnMyQzBmVTFleUZBcy94VHcvOWQ3Um90eGZaNHMzY2Vv?=
 =?utf-8?B?bUlqMkwwM2RTcVJsWktWbmZzSEtnNlYyT0I1Vm1TMHViSGhyeGlyUFpkbWZH?=
 =?utf-8?B?Z1NZT2lqYVVTZm51NS91elN5QzI2UDBiZXJxOFh0eWtxRXBsM1RYa05IWnZl?=
 =?utf-8?B?M3hadkZVL2xIVDQrd3BscnBHYUNOU05aQ0h0WDdKMnJPYmw1dkJPY1pVVlFm?=
 =?utf-8?B?ZVhPSWFoanNVOXo3VGY2dmNOYXZENEpFcWplVUtXL3ZtRmtiODhaalpKWGUz?=
 =?utf-8?B?TWpscndwQkNMczUxcVpQYjM5cmxXRjBpNmRYMFllTzg4Yk5LZ3h4YlBWTGUy?=
 =?utf-8?B?aWF3b3RsR1VmaVFTMDZZQTVQekJETE80bXc5M1Nsa3hQM3IzK0dtVXVDUmF5?=
 =?utf-8?B?MFNzdDZvMkdDckI4K1R5ZWdtS0pJQUN6R25GbXp0R2pON2UwdFJkQlB6VzRl?=
 =?utf-8?B?Z25sSWVPNERhZTUxQUlKQmwvUWEzOHhSZnZQQWRYajAxRHBPWlFXVjU2bnE0?=
 =?utf-8?B?V2o4MjJ3VEx1aU1kWWI2NnhLV2krdldLckFXVUVMUE83VFEzdFFKTll0VU03?=
 =?utf-8?B?eHBEaUdrRUMyZDltNmRkb1FHczVhMXhqU0dmVkNpODVXckp2d2JtNi9HaWVS?=
 =?utf-8?B?QjFnR1ZaVzQ2MjRYK2QrSElPNzZCYTdLS015UU5SRnZxeUl5cmd5RXdJeGJU?=
 =?utf-8?B?Y1hPVFZ3UzNRWS9JOUVnVmhnbVM5R3NYWU9IRElSTXNQSkI5VUxqZkl5Qi8w?=
 =?utf-8?B?bW9KeE5sU3pzMUNQbHZzTjV1QXFsSTM2N21WVVpNMjRlNjFveXNXanNaQzlL?=
 =?utf-8?B?bEhZNzk5ZVNEYXowU0V0MHVHRjNSd3Vad0lyYUJsN3VPbWV3cHQ5MkJ3TTJt?=
 =?utf-8?B?Q2VtZ2RYMGhlSmM0NzBCeUdLS0d0QjNab1k0WXYyeFM5Z1E5TzhOU2RtNVRh?=
 =?utf-8?B?WHdCcWpjcnZrNkNaVmg3TzR5cWJ1enlVMEovVWZSU0VjU3pVRUR5U1RaSW1n?=
 =?utf-8?B?VCtRdThsSE4zRkNXdHBobVlXSCtpMkdnalVuYlJnb1FhT3h2VFJ0c0JhWXFB?=
 =?utf-8?B?V0NEWE1pejJyUkJhTEJ5NktldlhWcmowd0pLU3lQdGdyNllYU1hZQjdUYkRY?=
 =?utf-8?B?aExUMUhkWkFDNXJjSHZTaHJScDd5d2pQcVNrY0c3bk1sbDlkV1pBR3doS1g2?=
 =?utf-8?B?V0VlUXBFL2lDOE0raUdaZ1FlZzJNQks2dkRtd2ptWENoMkpWcDhidmJRWS9T?=
 =?utf-8?B?VHhwbXpUL0JWNUZPRmtwOHhTbGhzcFM0TTFHZ3RmS2ZLWjU5bGdKbFFoV29v?=
 =?utf-8?B?S3c5ZmpYMUtjUVJ1V0JjUDFNRkR4SnI4RUZ0YUVQK2dOVW1ueWVjQ3A5T0JN?=
 =?utf-8?B?b3RqVGhnNXVsQUt1R1pSTy9SaTVHMC8vRE1PajlYbnFicmczbXJUTDdzRm5O?=
 =?utf-8?B?b3FRM01JSERJYUpOUGlCK1JwSktJVzlKUmZIdjh6WjVmVy9VQkVRaHdnZitQ?=
 =?utf-8?B?SVZONVYxaTM5ZVhjOHN2eDlueXFVVXEwa0J1WlljOUF0RmxmTDNHNG5NK3JC?=
 =?utf-8?B?V1FMeFMxTnFmMFl1TGtNM2xSTStSaHd1SmZIWHFNSkExTklYY0dPbTU2dDNs?=
 =?utf-8?B?bElQWERmekpKQ1F6bFZCampqd1JOeVg2R3ZLOCtqeThFamh6V2NLZkhiL3o2?=
 =?utf-8?B?RDRsbXBkbjc2MU50enA2VGIyY2NoWFZwOWU0aGNGRk45RUdSd0lwbWo2WkNv?=
 =?utf-8?B?VVcydlVMK1VRMU5rSlIxWWxhbEJtSWJIR2RZdkwrSGNzMFhPb0ZmYlNRNVAv?=
 =?utf-8?B?YXNYZjBEMy8rNUdXelN2NWtVUXkvbzZFN2kvbmRDa3lCaE9HU2d5UzFITmVD?=
 =?utf-8?B?dEtFTWJUalQ1ZG44TGp5SmR6ZFQ4UlF4SllucDIySkgxUGRSSkZFRU04elRG?=
 =?utf-8?B?dnJtVHRaZURZeWRVN3Z1Y05EenBwRGtYa2VzTUgwS2Njclc4MEg1UDB6d044?=
 =?utf-8?B?eWw1TGliNmJMSTBNVGJEaUllOWRFdkJHSUgxZ0JXSll6TjVRUE9wMDk2UUF2?=
 =?utf-8?B?T2FDNE1oR3hkYUNkWlpLYzFYVnpoUW9Ua1VOeHlTRnRta3JqWDVQbGJYQ2p6?=
 =?utf-8?B?TVRvUTRnSlFZN3A0SFpEeE9rNzNrMkVPSE5vM0p1Mi9GN25tUVE5Z0JKSktQ?=
 =?utf-8?Q?WACbFQHQSS7NOTb4tohLm3zAwbIoOK7V1N23c?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 199dfe09-7fd0-4c06-06f4-08df1df5c1b5
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11909.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 06:49:06.8005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yzHrvPC6Lb9UokdEhlmMmrrVc9uVy7BOW93lxuZKcZXQ2G3ljVPRghoXDDQaC/oYc9ZSR/ymvJ/PgntoIC3tAD4eP9+mmJSI1v6IXCz0UZYGk/cmoP8yfPbuZgO+DI/y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11430

From: Haibo Chen <haibo.chen@nxp.com>

The core defaults opcodes.read_sr2 to the legacy RDCR opcode (0x35). In
8D-8D-8D mode the opcode is extended to two bytes per cmd_ext_type, but
the resulting command is not a valid SR2 read for these flashes, which
access their status/config registers through a vendor-specific indirect
register space. Since spi_nor_cache_sr_lock_bits() now reads SR2 during
init, i.e. after the switch to Octal DTR, the extended RDCR gets no data
back and the read times out (on i.MX FlexSPI: -ETIMEDOUT and a controller
WARN() during probe with Micron MT35xU and Macronix octal parts).

Clear read_sr2 when the switch to Octal DTR actually succeeds, so the SR2
read is skipped (a cleared opcode already means "unsupported"). Doing it
in spi_nor_set_octal_dtr() keys off the real runtime protocol: a flash
that advertises Octal DTR but runs in (x)STR because the host lacks
support keeps its usable RDCR.

Assisted-by: LLM
Fixes: b7b63475903c ("mtd: spi-nor: Create a local SR cache")
Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status support")
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
Changes in v2:
- Rework the fix following review: instead of guarding the read at runtime
  in spi_nor_read_sr2(), clear the default RDCR opcode.read_sr2 once, at the
  point the switch to Octal DTR succeeds (spi_nor_set_octal_dtr()).
- Key the clear off the real runtime protocol so a flash that advertises
  Octal DTR but runs in (x)STR (host without 8D support) keeps its RDCR.
- Drop the swp.c change and the -EOPNOTSUPP handling; a cleared read_sr2
  already means "no SR2 read", handled by the existing debugfs caching path.
- Trim the code comment; move the details to the commit message.
- Link to v1: https://lore.kernel.org/r/20260928-spi-nor-fix-v1-1-ce65ba90cfbd@nxp.com
---
 drivers/mtd/spi-nor/core.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 90524c58602e1c27cd83951ab0cdd3669a2ebfd6..5c0985491ade59cab317b74aab8572d7caedb64a 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3014,10 +3014,16 @@ static int spi_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
 	if (ret)
 		return ret;
 
-	if (enable)
+	if (enable) {
 		nor->reg_proto = SNOR_PROTO_8_8_8_DTR;
-	else
+		/*
+		 * The default RDCR is not a valid SR2 read in Octal DTR mode;
+		 * clear it so SR2 reads are skipped instead of being issued.
+		 */
+		nor->params->opcodes.read_sr2 = 0;
+	} else {
 		nor->reg_proto = SNOR_PROTO_1_1_1;
+	}
 
 	return 0;
 }

---
base-commit: ba52b770f89bd2f3771b98edb92c4fde68ca8cc4
change-id: 20260928-spi-nor-fix-eb7ebe22a740

Best regards,
-- 
Haibo Chen <haibo.chen@nxp.com>

