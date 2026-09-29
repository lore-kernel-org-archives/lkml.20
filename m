Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011060.outbound.protection.outlook.com [52.101.70.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0304C9DF4;
	Tue, 29 Sep 2026 08:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671754; cv=fail; b=b2MpWvhmdbLwUUBEU3R7NNS2by8cQdxKCgToaU335CGwnRGE876hjznWrIAuC800dHjkBIaJIfLgJraigTfeBLalu0iE3eHOE+6gskbuM1iBf4+9v/F9FL7OrdJBOo8fHI3lLdKckf/XI3dcp0jXJb7hrrTCqDsWIcncHE5bCGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671754; c=relaxed/simple;
	bh=A+/mNmR+KEPl0e/6olTRj6FtwthB10uQQnu5wqJtwuQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=K9Lg/hr4Bg4sn6NJmmDygLrTg0j+jrUpIIJA9kWXf0YzIFb1Ye01FGkYYHlk6vXMBdjhiMeQ2vNaRrfA94B8j/iItCTD4tMaAwPl01LiBitvvdCEZd37gk1298Xq43L05tRpfvb9yK3Fq/RRcmWpi0LoyGqbj4jAzPiVWQTV+Zs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gluAWqSE; arc=fail smtp.client-ip=52.101.70.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gluAWqSE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okepuQKG65bM+EJrttymAPyMYKiolLTinuaX4gfViiD9N62nw5ORoCgbN7b+B0J2LXHrgzUt7+nQDAsPZBZFHTRtHRB//9YDFauwwYrq0ZhgIuCVsrm7hGueF8rPsi1+/UQPhaSpn21Olo51XT0M0xFSgN7WdK9aXi0Cf3kisv6e0uKgqUFjzsiHZikq4eKexNscwEX/Hn0ZxI0QBHo8Cf+Ci8vZZzQi1kvguEd2ky94gpOnVx0leh3AN7BtQeDRMD6w55MnPpG1In9gfB7fKNjgkrnQ/pbU1ld7mE5EHYzjK3oye7F1iNVvkqcAOsAeVoYMmgRYmvA6a5dyZPe1cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDeXLcz3S3QBjKcqNdJOj3FEUtfFiKxte77eZfbzn48=;
 b=PmEcu6g90bI5YAUzTnmwf47vCHplHGBQviGg1MaEnXmHGjalHGJ0E3D1uHH1s1p62bLrgyUFBGzR1xMAXTsrry2tYUfd1/wNnU6OmSj78clCQ3WR6BzVvH6aFVssK3QWf5VZR8hmfgflJZtvkW9TUAZ14T1zh+rnjTOSLA8e3YqF4ig30+QtB3+5oKorAVJXoddbdlBtkytuTvOUzCIUewTAbCaVN/pgmiq3sBPQuL3sF6vx5meDLNul9Y//COQNGlA/QcTQ5UNwVYkILasdFi1s/hXX9ZUMZnTxnm+7J6RPmNvmN5BhsPdJ8GQfVQCdDW8r9Ixi3pS2gfPo0GgiSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDeXLcz3S3QBjKcqNdJOj3FEUtfFiKxte77eZfbzn48=;
 b=gluAWqSE4tbNnVHB/Osq7xi2V5wGsmpL3oWX5dMJvqHf3MF+zFuQXwnWpMe54quuBQyxUhlmpH2SMTuWXbwRD1Z/ioZD5lkVi6nTV2U11XsnR+cgNU+QhtTEb4Y05HYnqXYsdGzkab/VYGXWuAHs3gT3WbojJw8QT4jvZQPo3FvHq+jtZauGcCs0eZ8wfrXL6RHPEwnYNo0zTwQpAN2VxTbsqdC6lactUxA7yVxle8/g9tvXqnV1hJtHJtOUEhJaQCHzgZm5+1EdcmjZHwS5GdT90meihXCOB7CdUMp8LTt8aWua0f50pq8GDqPJHA60nm7xeKOglwT/JemIKoAv1w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com (2603:10a6:10:10e::22)
 by AS8PR04MB7815.eurprd04.prod.outlook.com (2603:10a6:20b:28a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 08:48:57 +0000
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960]) by DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960%4]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 08:48:57 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 29 Sep 2026 16:52:29 +0800
Subject: [PATCH v4 08/11] media: imx8-isi: Exclude RAW10/12/14 output
 formats on i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-isi_imx952-v4-8-e69f89c7c651@oss.nxp.com>
References: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com>
In-Reply-To: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790671948; l=7446;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=A+/mNmR+KEPl0e/6olTRj6FtwthB10uQQnu5wqJtwuQ=;
 b=VVuIzNf9zjlx8o+B/12ss6P9JQgiTCbdqf20szaIDN+Gs75hHabgrub2fCKl7htkDhrSyVKF9
 Hc5GvdvDNRRCpl7CjOQjSNh93HTA4fh2A6J4fpq8OE+RMbgu88xkZY/
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR04CA0205.apcprd04.prod.outlook.com
 (2603:1096:4:187::6) To DB8PR04MB6667.eurprd04.prod.outlook.com
 (2603:10a6:10:10e::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6667:EE_|AS8PR04MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: 25c4dd04-f17e-4dc5-4a10-08df1e067fc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|19092799006|1800799024|10067099003|11063799006|56012099006|921020|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8XOozoqI3LPUKywdMB59xeeD1cUNvCDnyN4Ya9z1+9sz3v/W4ECqyLRLTSEEA41mot0z1fXseZjLif2x5KCBXmZKhjYYV1wkDLvanykt/1LPrYH9mjgKXaX6GvlgmDz2hPM62wO8AOdFk66wT7rVVlUp7LNmcpwHRXXQ8p4VSesi/gUd8zjIifTS+9Sw/pEicVvQmFtI01ZTWDAhXMIefn07EG4pQ+HvZ62jmDg5Vp+myzBnhrpPiFnT+5klIbhNrxfxUuR4ukb9aRKacer0M1CR51SJ4y+DPpftcmoI79Ds48SSj3u7jFbydEFJcpDPdmGlKA2Qi83in2wwktFit+JDUnZG3H1YyU/I+U9MRZKrPgZ57Q//dMKCyyxe6VFzKWpiR+rlEIkPQdYo+X0wxouvJzM6zocPxLYIAnyHikkEH8PqDKjf6IczX67Vn3Kj7lcedx5ZhdCL1xlRJ9BrHhm5svpFKPCOp7yRmi25NmaDYdUHGPXo1aUjcQN7lfPfF0XvP0h3o/escXyBzAI3KQ0A/ySfqj1bwQUMt6jHHHCPChl0hmO3Q7Ipy42xXfgg7Air9TMBQJpXhQLRY3upCKluPd+3YIt/3lbBU+bA9GvFPNF3xnuogZs/VUt5qoakBtZirW8jVG0MCvILTgn84lXOIeJBGmonxf589YQZXkErzPN/OHq+Wlm2vtWbyxjcinIfi067R5BuvExVfQdCyA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6667.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(19092799006)(1800799024)(10067099003)(11063799006)(56012099006)(921020)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VExiU1RpeXRBWU5lbGZoei9XTEhOZlhmR3RDQVUwQmNxM0F5dXBYRXBzaVBj?=
 =?utf-8?B?ZmdZSXlWZWJJZFBObUZveWlsSnJPWU5OWGNCYVh2WTh3U1djWHdKeS9uK1ZO?=
 =?utf-8?B?aGw4L1hWbENraThQenY3SHYwYTh2Si95eXlpSlpMSWhQcHVDbUhiblpmZmhL?=
 =?utf-8?B?WUsxRFZ5TllTL3BhUzlMSGJ0eGdFbXNBK0Y2ekVxeFdvYUZONGpWdGpiR0tB?=
 =?utf-8?B?VDBBN1FCUnFmcFEwb2M5YzZValljZ2pPcmtBTXNtSW5FZVZDZG9qOW1MNnhK?=
 =?utf-8?B?bTB0dmNCMXBxb1F4anFaNDBIbFU3TzFjTjdPbUpmanBNcElCTUM1S2ltd2JO?=
 =?utf-8?B?UWZCbmhtMzMzdXRSZEswTEVENVQvM0UyTXdFNXgrQUN6b1gzcXIyb1FxYW9o?=
 =?utf-8?B?cUwwOU5lckl5aHozWWhnSnNTYTFTSjYrYndFREgvRWp3MUlxVG5QV1FQN01z?=
 =?utf-8?B?bGxlMFVsZENKdEhZL2JrdldXTWsrYTUyYmVKVFQzTUwxSE5kRWFuOE5JdWFW?=
 =?utf-8?B?d0NYbVgzV3lUTng4OUpRZ3UrWXE1bG80WmVpWUJsSFJGVzJmajk2QnlYQUtw?=
 =?utf-8?B?MGxmUmJIMjBpNWtmWGZJQVh0VjNGTlB6WkJyVUlTTVJUSnEyYVhlVmtuT09W?=
 =?utf-8?B?MEV4a0FUajloeDN6dWZBN3JjWUF1dVBlR1lMRU5UVi9Qczc2MjN1dzRWbWxi?=
 =?utf-8?B?M2E3SG5NbFg5eWxtTjJEZVFub0Erc01TS0p2dkRKRVd4VHhFbkd4V1RkVk5E?=
 =?utf-8?B?dEVJbWpjYnJFNzJrei9WeEtjamJleUxHTGlpSkhXT2UrdXhMcUpaUVJxK0hq?=
 =?utf-8?B?UVMyMFJra1RRb3VwemNyWm9UY3MvTW8rVXhhV0RoNnlBblBUZ0dBcTdQSDc1?=
 =?utf-8?B?VCs1QSt6cnRjVmlDZUxMSFNMbmo3UHExV2E0UG8rSlBSVGwxa2FMNG55elFw?=
 =?utf-8?B?MitTRldkSHNXeEEraFJPZ2U5ZXRCbkRtQmcwOFBZYUNhcmFBNk5PSmg5SXBw?=
 =?utf-8?B?akxxc1JGR3FNdzN4Q2xwMUJiTW5BTjhNRzN6OEVPa3l4YmlMRnFnbnlaMlJN?=
 =?utf-8?B?WnRsUmVUWkVpZTlta1lvYzZDQ01pN1pGRnQ5REtpTFdBN0lFNVFlSUxYOXdj?=
 =?utf-8?B?LzluTWw0RnMvVVAzNmZjc3d3NDBLaGVUcHZjN3pPYlFMNmpsTm9tRDUyKzFl?=
 =?utf-8?B?UlJMQzR0ZERrTkI0U0FOeTBjcnRBR2F1clJwZmpEWEFRYUloUFpKNFBkT0NT?=
 =?utf-8?B?S0l2QmtBazBUMStLdWs0YlNYQncwVU5jL0daUmljTnNjSGdCbjlMS3BLNkl3?=
 =?utf-8?B?L2lzdjI2Z1VHV0pQN0Z3RmxVRzdJVDRhams1M1A2NGoyY20wb2U3MXpSa0dT?=
 =?utf-8?B?Zi8rb29zbkFGTkhqVnErZU1rVVJlZVlZR3BvcFhuMlQ3QVJESnE2ZDB6bWhN?=
 =?utf-8?B?cWRNVk4xb3AxZGNmUHcwTmFZL1lvSHQyck5Hcmxzait1clNoYlQ1MkRmNmFK?=
 =?utf-8?B?K1B4RmtPcGVsUjlPc1ZHTlJRWWVWK213dDBZanQ0N1ZyQStIdEZPbXVmZGQ5?=
 =?utf-8?B?cktxZnFOYnY2blVKeWtQUG44dldHcFU3Qy9LcVJwM3Z2TUVlUVA0WS9ma004?=
 =?utf-8?B?VDlwVXdPQ3JMdVUvejYxTzJ6L0Z0WDdTMkJtMmNOeUk2cmpKMDBxcDl0SWdO?=
 =?utf-8?B?YS9lQzU0THc1T253OGljRkN6WEZUdVNaWUdXSmJCMkhjM1BFMkZ5T1BPMEkw?=
 =?utf-8?B?QVlwRlN4SUZzcXpLRzVaL0pCNVp3bHpnaXdzYW0vOEozL3JPd1hrRDk5a2Rm?=
 =?utf-8?B?akNzbmJmUjhOem0xOC9QVWV1WXRjNTU0V1RSanEzZFlKM1l3WEd5YWdsaGU0?=
 =?utf-8?B?cExIRXVyK0x3dFEzMUhnaVYwMThtY1Mxck5TTGptYTJvM3FOVXJxeFIyd3lr?=
 =?utf-8?B?UTlqRXFBYk1IZGZCTDl3OEx6cW8vUjNlajlISjZ1NVNoV3FBUVI5THRYQzd2?=
 =?utf-8?B?czBtRGZoSVdhREo0QzRtYTdjV1hEMUx0ZFEwLzdkRDdrQytIRWQxdHJpZ216?=
 =?utf-8?B?ZE1hTDhiMUMvUVNzcFUzQjRsZDZvL0ZRUmpZcjE0MkRyZTVmUHcrUVRqelhG?=
 =?utf-8?B?OGJyakVzSTJjRTQ1L1BXK1Nqc0ZqZ08xVE9lUjFWOTRuUURNRjU1TUVwVWxw?=
 =?utf-8?B?cUwwbExHUjk2ZFJ3YW4rYzFxVjVic28xSGREWXVZZWIxY3FFSWFTbnpiQVhL?=
 =?utf-8?B?ak5GNURxTDEvYjk0VUpVYncza2U0ZzV0NVphWXpBRnRBL0ZEaVJiZjhOYlE5?=
 =?utf-8?B?Mmx0ejJ5YUVCZkRabE9WR1J4eCtyR0ZXcDFtSUY4aWtqOXZaQjNDdTFPL0ZT?=
 =?utf-8?Q?vCo/tQ4pO4nzOge3jnAXr5m0DoLUDzS+pMe0T?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25c4dd04-f17e-4dc5-4a10-08df1e067fc8
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6667.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 08:48:57.4024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6uciG5FNYVVXjaipftN/BAhvJmooqoJF4Y3VVGW99K83IBdH2PXvyw12dibrWxve8ZrKA0giuN7Z/omgTzGhb99wzUF8w2Fv4J2lMB5rns1PFGm/eDJLlUz4wJn1wtNV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7815

On i.MX95, the CSI formatter provides MSB-aligned RAW data to the ISI
via the Pixel Link. The RAW16 passthrough that older platforms use to
produce LSB-aligned output now passes through MSB-aligned data instead,
so it no longer produces correct V4L2-compatible output. Exclude
RAW10/12/14 from format enumeration on i.MX95.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v4:
- New patch
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  6 ++--
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |  2 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    | 10 +++---
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 38 ++++++++++++++++++----
 4 files changed, 42 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index a30633a7e2e9..ba0d6df98fd4 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -320,9 +320,11 @@ mxc_isi_bus_format_by_code(u32 code, unsigned int pad);
 const struct mxc_isi_bus_format_info *
 mxc_isi_bus_format_by_index(unsigned int index, unsigned int pad);
 const struct mxc_isi_format_info *
-mxc_isi_format_by_fourcc(u32 fourcc, enum mxc_isi_video_type type);
+mxc_isi_format_by_fourcc(const struct mxc_isi_plat_data *pdata, u32 fourcc,
+			 enum mxc_isi_video_type type);
 const struct mxc_isi_format_info *
-mxc_isi_format_enum(const struct v4l2_fmtdesc *f, enum mxc_isi_video_type type);
+mxc_isi_format_enum(const struct mxc_isi_plat_data *pdata,
+		    const struct v4l2_fmtdesc *f, enum mxc_isi_video_type type);
 const struct mxc_isi_format_info *
 mxc_isi_format_try(struct mxc_isi_pipe *pipe, struct v4l2_pix_format_mplane *pix,
 		   enum mxc_isi_video_type type);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index 1178947bb548..1ad0fd1af3b1 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -492,7 +492,7 @@ static int mxc_isi_m2m_enum_fmt_vid(struct file *file, void *fh,
 		MXC_ISI_VIDEO_M2M_OUT : MXC_ISI_VIDEO_M2M_CAP;
 	const struct mxc_isi_format_info *info;
 
-	info = mxc_isi_format_enum(f, type);
+	info = mxc_isi_format_enum(NULL, f, type);
 	if (!info)
 		return -EINVAL;
 
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
index 35438abf3172..b83a25a58ebe 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
@@ -425,11 +425,11 @@
 #define CHNL_IN_BUF_XTND_ADDR					0x00b8
 
 /*
- * The ISI shifts the 10-bit and 12-bit RAW formats left by 6 and 4 bits when
- * using CHNL_IMG_CTRL_FORMAT_RAW10 or CHNL_IMG_CTRL_FORMAT_RAW12 respectively,
- * to align the bits to the left and pad with zeros in the LSBs. The
- * corresponding V4L2 formats are however right-aligned, so
- * CHNL_IMG_CTRL_FORMAT_RAW16 must be used to avoid the left shift.
+ * The ISI shifts the 10/12/14-bit RAW formats left to MSB-align the output.
+ * On platforms where the Pixel Link provides LSB-aligned data, the RAW16
+ * passthrough must be used instead to preserve LSB alignment. On platforms
+ * where the Pixel Link provides MSB-aligned data (i.MX95), these formats
+ * cannot produce correct V4L2-compatible output and must be excluded.
  */
 static inline bool isi_out_raw_shifted(u32 format)
 {
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index feef79b1b718..fac24ee3887b 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -458,14 +458,32 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 	}
 };
 
+/*
+ * On i.MX95, the Pixel Link provides MSB-aligned RAW data, so neither the
+ * RAW16 passthrough nor the native RAW10/12/14 output formats can produce
+ * correct V4L2-compatible LSB-aligned output. Exclude these formats.
+ */
+static bool
+mxc_isi_format_is_raw_unsupported(const struct mxc_isi_plat_data *pdata,
+				  const struct mxc_isi_format_info *fmt)
+{
+	return pdata && pdata->model == MXC_ISI_IMX95 &&
+	       isi_out_raw_shifted(fmt->isi_out_format);
+}
+
 const struct mxc_isi_format_info *
-mxc_isi_format_by_fourcc(u32 fourcc, enum mxc_isi_video_type type)
+mxc_isi_format_by_fourcc(const struct mxc_isi_plat_data *pdata, u32 fourcc,
+			 enum mxc_isi_video_type type)
 {
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(mxc_isi_formats); i++) {
 		const struct mxc_isi_format_info *fmt = &mxc_isi_formats[i];
 
+		/* Skip formats unsupported by the platform. */
+		if (mxc_isi_format_is_raw_unsupported(pdata, fmt))
+			continue;
+
 		if (fmt->fourcc == fourcc && fmt->type & type)
 			return fmt;
 	}
@@ -474,7 +492,8 @@ mxc_isi_format_by_fourcc(u32 fourcc, enum mxc_isi_video_type type)
 }
 
 const struct mxc_isi_format_info *
-mxc_isi_format_enum(const struct v4l2_fmtdesc *f, enum mxc_isi_video_type type)
+mxc_isi_format_enum(const struct mxc_isi_plat_data *pdata,
+		    const struct v4l2_fmtdesc *f, enum mxc_isi_video_type type)
 {
 	unsigned int index = f->index;
 	unsigned int i;
@@ -482,6 +501,10 @@ mxc_isi_format_enum(const struct v4l2_fmtdesc *f, enum mxc_isi_video_type type)
 	for (i = 0; i < ARRAY_SIZE(mxc_isi_formats); i++) {
 		const struct mxc_isi_format_info *fmt = &mxc_isi_formats[i];
 
+		/* Skip formats unsupported by the platform. */
+		if (mxc_isi_format_is_raw_unsupported(pdata, fmt))
+			continue;
+
 		if (f->mbus_code && fmt->mbus_code != f->mbus_code)
 			continue;
 
@@ -509,7 +532,7 @@ mxc_isi_format_try(struct mxc_isi_pipe *pipe, struct v4l2_pix_format_mplane *pix
 		  ? MXC_ISI_MAX_WIDTH_UNCHAINED
 		  : MXC_ISI_MAX_WIDTH_CHAINED;
 
-	fmt = mxc_isi_format_by_fourcc(pix->pixelformat, type);
+	fmt = mxc_isi_format_by_fourcc(pipe->isi->pdata, pix->pixelformat, type);
 	if (!fmt)
 		fmt = &mxc_isi_formats[0];
 
@@ -803,7 +826,8 @@ static int mxc_isi_video_validate_format(struct mxc_isi_video *video)
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
 
-	info = mxc_isi_format_by_fourcc(video->pix.pixelformat,
+	info = mxc_isi_format_by_fourcc(video->pipe->isi->pdata,
+					video->pix.pixelformat,
 					MXC_ISI_VIDEO_CAP);
 	format = v4l2_subdev_state_get_format(state, MXC_ISI_PIPE_PAD_SOURCE);
 
@@ -1222,9 +1246,10 @@ static int mxc_isi_video_querycap(struct file *file, void *priv,
 static int mxc_isi_video_enum_fmt(struct file *file, void *priv,
 				  struct v4l2_fmtdesc *f)
 {
+	struct mxc_isi_video *video = video_drvdata(file);
 	const struct mxc_isi_format_info *fmt;
 
-	fmt = mxc_isi_format_enum(f, MXC_ISI_VIDEO_CAP);
+	fmt = mxc_isi_format_enum(video->pipe->isi->pdata, f, MXC_ISI_VIDEO_CAP);
 	if (!fmt)
 		return -EINVAL;
 
@@ -1281,7 +1306,8 @@ static int mxc_isi_video_enum_framesizes(struct file *file, void *priv,
 	if (fsize->index)
 		return -EINVAL;
 
-	info = mxc_isi_format_by_fourcc(fsize->pixel_format, MXC_ISI_VIDEO_CAP);
+	info = mxc_isi_format_by_fourcc(video->pipe->isi->pdata,
+					fsize->pixel_format, MXC_ISI_VIDEO_CAP);
 	if (!info)
 		return -EINVAL;
 

-- 
2.34.1

