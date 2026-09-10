Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013021.outbound.protection.outlook.com [40.107.162.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F498331EAB;
	Thu, 10 Sep 2026 01:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789002453; cv=fail; b=nz10kWJGp+kE8s1VlcOdIvZUS1jZ4vI3MEReVCv3g1+JMEO2m14liDtvdGQvpwL4W48dMJKxLDJ6IPZurRKuQhaOXU84IbI/RHErEVeYRom+qJhT5f/JMqi0FsMdkcB3OK4K3qF7C7akQynhWERxY6aahbeVVZJaclROLvKPg+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789002453; c=relaxed/simple;
	bh=U91cDqaGi/mc166PLFndng0y3Xibat3Mzp7vfATEpG4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NYQ+PSSSopkwTDGKnOjbzNLyuYmd3VOnMaUcwcB5N1qeIH5vEFsMaSd1Wh/w9Yl55UM+qswzYaPPN+q40VmtjhgStVKV5FDm68bElB6LHKPgpP9g0wvHqZftQNMd3ezf00KST7sO4KQ3ckW/KElH/VIVMtq/i9/GwmXR7qklpVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=q2qrzBaC; arc=fail smtp.client-ip=40.107.162.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="q2qrzBaC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZ80RJpR0S0424gblkSa/oS1AftEo0gpuW/Qe5pl6S5stMe8ssGTZmXh02FX3GiJSLjP9p4WKUqCKLE/C4BWOcackri19QIs1nPMZXUnOxCJslhT1MA+DMNEE8Qqrmxei7utBm2GCITfpRYfmBqBYXA6c9T5uFiE25+RtZNmdU5JfFN3ywPbxxJqq0+zD05evC5rfrMJiYlGaQlBslrBNgAlFi2iZz4ybQ69TxIxlcpQDUmHqHfWPBq5S7XkLXNA2D+ljNzPnCBpx7PpYMlWKdyV7miztXYDh1LstaXdZlruZ3RUyWBf1gY2pCHeA+0cnWuAS9fI/rycwdJht1YpMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWWPEN5vp6HM6RaTFUxAOmV0koREgHjnJ9xXU3/d1y0=;
 b=h0Myl2CR95YtGOj4mhKzDcVABtG/TQ+zvuDr/yTh11VlbRNaN77+L0+sS5Zl/iHNcFxsjhDqqcDmSBMhIrMCU90o5SfInX/HnlgA3WH/fzvx+199CCHrRyw2Y/70+yFSDQ0xze1auCw6F/6pXC6fduvKrR0Y+pGvuT9lDa95QbXrlRJmDUupgOSGLK9GD0Rqg8v9b3U9Lwtf2xwCLyR/dvuodYBOocyMOJ3HTCDWp2lMHZPEBSHYgPTKMgVi1zpQDiPVB2ngHZRIwqZRsyey0bOTHH8lNcADFgvk99cZK4HuzhvkK7Y46BO9tiOMM9zmymFpJWIQofOYoxKeGe5Wcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWWPEN5vp6HM6RaTFUxAOmV0koREgHjnJ9xXU3/d1y0=;
 b=q2qrzBaCP9DKm7YGdqF35Lb5Pt85Yjv91CxCNxBJd6mUnnjqN6S/9TwcJTsJKYLKwJKjZHBPkLiQg6CIYbDN52aZuwcZOM8z1PN6bWpNZwTV8vFyGB0IVKq4OIfNYvHxJd/GBpE3lgHIjkb/nbLrIboKwjeiJXj9cPGg2zTqJ/cXdWVmPH2fu1vt5xbI86YjYDDgMOO5KbBmo3jynEmysSFV4dJ9L3j8ZGpezSh5pA6W2UECRQPEI4Cq9zsC5teohL6iTVR/2gMSRi/zXUXnKBxTFpsGYCTNeTbd+yM+d/4JGHTD1vOK7ixLDuQ2YmHuNfrwv6X9JLGTHDUZrLAeZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by GV2PR04MB11739.eurprd04.prod.outlook.com
 (2603:10a6:150:2fc::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 01:07:24 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 01:07:24 +0000
From: marouene.boubakri@oss.nxp.com
To: Jens Wiklander <jens.wiklander@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Sumit Garg <sumit.garg@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Subject: [RFC PATCH v1 3/6] tee: optee: teach the memory type check about RISC-V page attributes
Date: Thu, 10 Sep 2026 03:20:54 +0200
Message-Id: <20260910012057.106966-4-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910012057.106966-1-marouene.boubakri@oss.nxp.com>
References: <20260910012057.106966-1-marouene.boubakri@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH3PEPF0000409D.namprd05.prod.outlook.com
 (2603:10b6:518:1::50) To PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11203:EE_|GV2PR04MB11739:EE_
X-MS-Office365-Filtering-Correlation-Id: 84570fd2-9b60-48b5-b0e1-08df0ed7df81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014|23010399003|18002099003|22082099003|56012099006|3023799007|10067099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	xd16I8LacH6obra/w7izeYK14jSVWEyQzBiDAVakid38DKw1yyfzmqfB7PSA7capwhNwwWc1ggyYY5ydSxA3wQ9PDf7f8QeNZp9JUCFYjgl1aLJPoOc2qQAHuIqkBc/0Jm8diOFXEm6JAMTWJ5UvMLpizg3FGfDVBxjMFsVnBtUEQFlHza4ks1+3cGFjh+FzgufVMhitDLGuYCeCD3/XB5DzLjnsLJIWwfhXRc6vbLZWT0Oxfjh5gQDJdr25RXuTxG+v2xSJq79iEhq2hdzNnblEZAcXe0pF3ZU0nfT2ZLO6wZTUlE2z09+mmy04QexEAVcwafG3TNgQ0uXVf2Hev42w34eFhXgndCCtkv+EDSP9mRt/uikDznBwNLlTJzQRKLKNF95SH4iuIN8ofOxCE2zwlnJ5exQKe95QtHHuAiwKAKRzrUYXf7vTDdMZ+Y3uYuOTvbQUIONiVKRRxlO5b6cPDDUfFApPJ9jCR6MfiV0UAqU5nTp5XogxGTNLQ6P1ShaFz1VnG1hup5TvoGjoZYGSeDw4sbFzqmdCRQxuA60QaogcTZSEXJYDzKfF2uBlIbBgEEJ/O7dqKsGQ0dhMgvuto0R05PhaKoNgtCxV5pzGOek/wRX4lG/KrTcle2dhx8WDFVor7IRMPT8GIjERlzUIpeo+Mg0t+bs5qBJz0FU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(3023799007)(10067099003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8rEQqBEdn9BrehQoHncOC5AaRhnPUopgTvHpo/JacfiGHYtaWx/5PEUPfN/h?=
 =?us-ascii?Q?3olFfHilA8RvSWStssfjXLV8TUmlDOX4vzdPgo/v0cSquqe+8PnM2ZNbUAU3?=
 =?us-ascii?Q?aU0woPh4dTFRTYnZy4R4MDfGZ6LphLRFBLkxPhXKBMBKrQfDQu/Mdq73kyIp?=
 =?us-ascii?Q?M8f6LAYuWXtr76+bBR7RJ6BGR6m4gJEz3SPISYjs6RPv/heKUZJeTJdsfHH9?=
 =?us-ascii?Q?36UjK5rvzDMfTjFak6HeK3COe/wzSyG04RSAxV1A7jMRi4SqRVa7m14EacBb?=
 =?us-ascii?Q?zIcNOYRIIzbHSGnWUhT/9J+Qi6o6Rr8puGzIYi68lkcEyjK4NmFqP2cB+ZIW?=
 =?us-ascii?Q?4RAOK6r93Xul8C3qSAnT6BtY+p4w++SbEkpPi1hmWG/PmsJmt1oI6V7Njtkj?=
 =?us-ascii?Q?LSvNV/DjPP78/xN6X4Gcyjjv9ilAdtU717IwxwZ1vVWo3W4zMk7N843PKWAY?=
 =?us-ascii?Q?mgmnCywN00wq95pmf5RqQ9WuxujlcyceafZRtw/j8KGxsFHg1FFhN8k76aeu?=
 =?us-ascii?Q?LCmcvIIuVABbphr/gJkBp+fuNmV3u93aUPUZ9adJh08/uiud1Moyk8quLzNb?=
 =?us-ascii?Q?VBTFaAhMuZ6ba6h8Zk10lJJk1051ld8XxyytIFeyK794zVWcmLq1tpcal1lM?=
 =?us-ascii?Q?2VYMaYf5IIV3uEg96xw8J0612J7FYcTIkQ9xm/1s08jGeRfeLBnHNJYn20E1?=
 =?us-ascii?Q?xti8Df5MxdYcdiJzwtXFpy2VVifBkE7qLONzzZOrQL7UDXjPEhrE0gGo/U8e?=
 =?us-ascii?Q?2tohIst7puRvup9Nf0vsF8CC6+T3B9NQOVcfzm6F4aV9C3zA+uS5f19fTWB4?=
 =?us-ascii?Q?uZBv32/mYvmdMgjKa/LaVeYqPZIF9GjCT+ED+KFwLXtsnF/3oPhYRhy9sSdn?=
 =?us-ascii?Q?DbPfcs/mYBPQOYx8SIQcjmqOGa5PYEZeX1fgnr+8ikKd0j35bE8S+mCFqJ3i?=
 =?us-ascii?Q?3a0xrdnHI5B9TQfoAwf8el5UfuffXFx50yfMcBi2do6zLBXYq2O5hBKUISld?=
 =?us-ascii?Q?TFg5foHXJjxNnPsaESc9WFQ5ciDSu442UB5AaISl4Dtz0Q+iRfX0anDe90BE?=
 =?us-ascii?Q?fWfQsHElEh5LeRjTGi20pk+YUNa+rurHPAke19mry/73pG+s8UhbTpSAWJo3?=
 =?us-ascii?Q?UAF0wBoDXnuyxgj/hf/qDeYIDlU4YcH25rErh02GhkBXKzq6dYPL6kq89ymh?=
 =?us-ascii?Q?75ePcir3QB1aC2gaJ35rUOsSzAsvpnv/5okCbQLyLHsTCncvGamuMTZolviF?=
 =?us-ascii?Q?yt9GU/4TH8oJolfkAdCXtWs8hSB5ieucRRFSQlf4NgH4A+wSYembTD9qgRr1?=
 =?us-ascii?Q?eWe1IXM8ZjFQ1rfJXo4/8kvxedN6z5HHXmQOQlyJJQWwKcC2OeXvDwWBIHFI?=
 =?us-ascii?Q?0QXv1pLKiCEkCLp2/mUBzZNXv7hbZvirhqpVKFDJyf8qEkjoXBqYrbfmd9+K?=
 =?us-ascii?Q?UNUTlEXNZj0Shnu6E8sNQ5C7ZoAF/Vmi4CD6LNXuNykhnjiFnJEEgJzbeEK1?=
 =?us-ascii?Q?DAIGn5Rl23CHShx2X0QnA10+gQ3R5IPughMDXPWxbJPXFSOGeQrd5A4fhCCS?=
 =?us-ascii?Q?v2/RM76RhMeyAX4OSwp38M4cG3VbbnkCjyJcjc/kVkTdTNbX2tmzFPAgYUGp?=
 =?us-ascii?Q?PQHvRElFmLuRWvWgkRDiMt+OZwHAVYOTzFlC3HxST2WqLY/AQlHq0S+g0cEx?=
 =?us-ascii?Q?qPFEyigz7jnmg5X66arYM097HG7mrj0QT7dtCQsMtfVbuQ2PsVl9VaJNBLr+?=
 =?us-ascii?Q?kQfWetvB/fZaLX3XxoDfUfRsWtoIlONsq54XHMBT33Y1AvBynMVFjQvbs7tp?=
X-MS-Exchange-AntiSpam-MessageData-1: oWD9o0sHYDiSbA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84570fd2-9b60-48b5-b0e1-08df0ed7df81
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 01:07:24.1609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8bTPBtAnx9QyAZuqyyL0N/m1uJzIEtXzPJlJLyEXuVO4LWaNQ2o02oYO4l7o/H/P7BL32+NWJgfMIpZUL8dZb3ndYHhIbnwEZ9x49IFCzTQobLtG+oDbXVgnvleYNMdJymwzMeL0waA64sdcuHFkig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11739

From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

optee_check_mem_type() only lets normal cacheable memory be registered
with secure world since OP-TEE maps registered pages as such and must
not observe mismatched memory attributes.

On RISC-V the memory type of a mapping is encoded in the Svpbmt bits of
the PTE (or their T-Head equivalent selected at runtime by the
_PAGE_MTMASK alternative): normal cacheable memory (PMA) has them
cleared, pgprot_writecombine() and pgprot_noncached() set them. Without
Svpbmt the memory type is defined by the PMAs alone, _PAGE_MTMASK is
empty and every mapping passes the check, as there is nothing else to
inspect.

Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
---
 drivers/tee/optee/call.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
index e046aff61..c29bff224 100644
--- a/drivers/tee/optee/call.c
+++ b/drivers/tee/optee/call.c
@@ -604,6 +604,14 @@ static bool is_normal_memory(pgprot_t p)
 #elif defined(CONFIG_ARM64)
 	return ((pgprot_val(p) & PTE_ATTRINDX_MASK) == PTE_ATTRINDX(MT_NORMAL)) ||
 	       ((pgprot_val(p) & PTE_ATTRINDX_MASK) == PTE_ATTRINDX(MT_NORMAL_TAGGED));
+#elif defined(CONFIG_RISCV)
+	/*
+	 * Svpbmt, or the T-Head equivalent, encodes non-cacheable and I/O
+	 * memory in the memory type bits of the PTE, normal cacheable memory
+	 * (PMA) has them cleared. Without Svpbmt the memory type only comes
+	 * from the PMAs, the mask is empty and all mappings pass the check.
+	 */
+	return !(pgprot_val(p) & _PAGE_MTMASK);
 #else
 #error "Unsupported architecture"
 #endif
-- 
2.43.0

