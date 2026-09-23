Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2126.outbound.protection.partner.outlook.cn [139.219.17.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7403943DED9;
	Wed, 23 Sep 2026 07:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790147759; cv=fail; b=YajziBlquah/LXypLeFMI2L0vom69LFcKEATA/gLaQBBc/qGla7Dtn8eAKvQRV3PbTLs4p34oE7eMDf6S1PwZZKw0vi9xjSGF7NFggjQBbhXETJtyTg+LZp4Wv6ATc3TtmLRO7J6US1m8hFnYnAk4uhevJpIv/xVcb4s/nfIFBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790147759; c=relaxed/simple;
	bh=iDBr1ig+eSGaxNJj1HY7Ttt/n2s3v/QIDlcnD626hBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=suGCSSNVWhVjEY9VPTQSyMefD23BwVO45BeKIqDLsXtAMOLuY5NEQRfQelj/80l9ZwxqnWY7bTOYfmp0eDIqbsgvGgbNlNo7mLMO0SUnynb1FtHYLZ6kyTw0dLkdKzkuy3CqZsIwlG1JH+pUNHstUCscYgOr8JPT76JLhRZK950=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmEYd1oHZytivYiaz83jVhnn4Dh0S/QUhk/4fgATa1qLI5A0ve8X8sgLxBpRQi6LvHzDZZK0cvP6UnCJ01SthnHldmcG43VHmdXdBgUBKYUHCMMDAYXiLBdoDucbCxSfVk/8wY2LRfeiPSh4nrRgIggGbNOJgDDy36RU3gjcOunM7JzA2Ib+UQXBTp8yln68YbKwdI1k9PHxPO1zu38HSiRHxGaWTVJBgHWJrfyjE+ixBEzQP8QBXAmrsPAY4NVc5vE5e5cxeI8SRqwQ835QRisdvJl4Q7uUwLwnyAbuL99GlCwFh1Vi7N4lg9hxLNJB9QeeV+onnXisG5FVy3Le8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u42D1MYm9uib6R4RGuK19vJPl9D+e0d5388SjZh0pW8=;
 b=BDMI88bPs4M1Z6WjndrAEsPi3hsJHCKs1iqtQMfSdMAOnpv+STwFYbGYsxOrHXXTnYSdKAFWBXapRj8GzolmgpoVJ5cwspECACqjLpECmFCY557MjubHpJLk87imIPGikQJDtadppyOKqq75J4kJ4G145CmpTj5XmMDJzmIVaa9YcSABglryDXuG15epjtOqXMjAwCulR9okxKalnsX3pow58MfhQTYelPZ6MZPvKOQvWl0QDuKod9PYIc6SAbSLBHzt/LNsNsunx2gT5l40TVOoHB47qjPbb4Jn6C9u0XJj6XgO8I+bwXNMY5LhWkm6KajUewxb2ob7qGM/xQgwNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1b::23) by BJXPR01MB0517.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:14::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 07:01:28 +0000
Received: from BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
 ([fe80::e644:7bf5:5a3c:e548]) by
 BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn ([fe80::e644:7bf5:5a3c:e548%3])
 with mapi id 15.21.0451.014; Wed, 23 Sep 2026 07:01:28 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	rahul@summations.net,
	anup@brainfault.org,
	lftan.linux@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	joshua.yeong@starfivetech.com,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] MAINTAINERS: Add RISC-V RPMI voltage driver
Date: Wed, 23 Sep 2026 15:00:14 +0800
Message-ID: <20260923070014.1340761-4-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923070014.1340761-1-joshua.yeong@starfivetech.com>
References: <20260923070014.1340761-1-joshua.yeong@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSPR01CA0020.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::32) To BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1b::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJXPR01MB0838:EE_|BJXPR01MB0517:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d6c31a5-9796-4602-2fde-08df19407d4c
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|7416014|1800799024|52116014|38350700014|921020|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HYoDxqRKsJB0fdzh8SiIKszrGuX2CigHgJ1Y7BcOVXKXIHoAgppsR0zqXo0GNDV3rLZQLwPICG75OaRVsowXrvJCoqSg+1F26lf7ED3mk2qlOIp0w0xcxJL8UAhMVHPZFiv+iJKwTSztmborg8/knMc2xTeLNxqabaLPfdDDNBuL5MaxXn69O1UPa8rPK1iJ1ZwFxIS2Ea+CxtB8eOgH6q8J3lzW9Pehxj76O7Q0tSA0yCrB10jMu6XvEEcVPYTWRtZ90pOfr57jNaDK0P0oL6vsq2A0eEQoBuZ4XRlPjNon8+46wU/9bScIG5j7IBN31yF123RLY6z+9H9RY3sGrxV9hWcMGjTLpYUITa2ZCb2nkDLX6S0RKhH2qLhbPjLtaR469UajsOi8v2vua8sOUtiuAvSchG+eR2l7utfdjCYqCoKB89kNJeTIyIS0WI763VsT1RMqEhxTBBkFHxPMg1yiZBRhyKxPnhiayeixmdKSpF1+EMSuGqKC43Vp9eMpN7DsxifzC6V0YCm7+qavu+j8NJzP0VboUY0ZWxwBW5AcC/LAkKA4OcmzcOWUqzs2RBhm/yYxLhT+fvGL4rmu+Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(7416014)(1800799024)(52116014)(38350700014)(921020)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6yzmGgLkxOV9qpLKb4ZK5C/MtGfvijPljXIutsi7KDlFa0M+3rN8Ib8IjLKI?=
 =?us-ascii?Q?kyPW7K4zEJajVHHUKxFiZG9+qu9sofiH75TZnEoGPe93q+2Aj5PURrq+KrCb?=
 =?us-ascii?Q?pdoxeR1CwAHuqH6T47hkn5IX5Cu95O54dOq47ztl3cxkDWTQ541KmsLL0acr?=
 =?us-ascii?Q?e/Gi7RYAQD37/AmwHYIMwT+5l790OjUvK6Ws9GM9eFCsMrZjIF72g99ywpCh?=
 =?us-ascii?Q?PLfXg1voZ10zdYgWy3d9iyeB4YP7EOUkCAznyHyF7tgKbST+ltcg/myHRbT9?=
 =?us-ascii?Q?tBiQ7gbwAxtkXQlk4J6xnqaVnDkxLyldFFs6+4cXejrRy8D1CNEJ2aU9+3BI?=
 =?us-ascii?Q?PFZK99+lC2rFYfK3Fl7pnHpFWfAqmMw5/anwgLKLyp2sfMqJ3OlqTb0v634q?=
 =?us-ascii?Q?TaQg/WPRD8kHkE/vFIQAGbCAn3HajtlTvfydIAQtoVNA9LUljxMZY9m2RD51?=
 =?us-ascii?Q?V+nRLFe349PyjzqA/Sq8K1xsmc3n5oQX/YsRDgrr8jFT2i3fwE2B2GYOn16n?=
 =?us-ascii?Q?PKN6vejOZEsMQpCPKAYDlRYP/tPoXPRBpwj3GdsonJwXRgomSFaGR2i6q62s?=
 =?us-ascii?Q?+R3LzvWH/iic4RD2K5sne5Y691DYF8pKZLcuIHcK0lf3qHAW71/liRuf08F5?=
 =?us-ascii?Q?KfWI7wjgRn4BpepDWplszMYL/8VjnMgIilVuHKJc9hIo5VsJDxRLdIgo3+k0?=
 =?us-ascii?Q?dVKhd0u2ZTEYyoeiFreDHnJa6f+QCwMFrkDHegxvH7IttivsA8GcPCoOeo9/?=
 =?us-ascii?Q?6mqYW9uY4nv4sWv6QiI+nrzEwQzjWzafPgad9OeJHoJDAV5OGaS3OfjporEy?=
 =?us-ascii?Q?z0cidz00tPOUD5a1rgUu6FnL50N57tLKwOdBs/rJG8Dpb9Uw5NGrx86EccSz?=
 =?us-ascii?Q?MgK+S7N9VQFjDlA++1PRKwbw9TtiQffb2qRUorqiRvYRfmsN4vpNGelZFjx7?=
 =?us-ascii?Q?SSjs7lCxvTsplL0N6QnhyPDHnMK739ai0f7fzvsn5WpwxZdJ337Imr+nfbuv?=
 =?us-ascii?Q?eEa/9HRtIPpW4uUmZjYaQOji2+qdMYDu4QnEfaVA7x2GNUA9FgZFk1yG68yI?=
 =?us-ascii?Q?YPBCrCGOtFExx2g1X1Ln0x03luSFp+08RW+Dsk6EREegKnFXIYa9csYlvB1k?=
 =?us-ascii?Q?JBDbYz8O7QPKYs7RPOYDEbgsrnW4AuI4RZ6paBuCH4ekMuTDNYzi6Z/syaCP?=
 =?us-ascii?Q?5olBGKF+KkfEturG3cCapeiw6pJdngHNbB3wJNhxxlAW+xNsOroZo2LTIzdT?=
 =?us-ascii?Q?9K/EjGmdbLhRMicFvYBW3mIPYhkBNWQ6pRdFCfH0G/3rRubQ7sOa+ioOKhQS?=
 =?us-ascii?Q?ljc77naJfoPGWk1IzN2/dg8keGTjgQfsRJuZRc62vIOLbfyz3v/orSSHjQ7P?=
 =?us-ascii?Q?IrrGBTMJB60S6/UOhWeL8yQ30WDbTvItnAuC+WIqpae9giPmtUkVECm7fiNM?=
 =?us-ascii?Q?iOATQZbI9NmgurWjYuaUchNG2vPCTebfj5wg2K8vHephryWpTUSMYFqypv5O?=
 =?us-ascii?Q?X7yA7hsG4JqHLeql3Ng0fOlNfU8dLZ8OysaG3hGs/L3MA+nQVXBWBZcMJ8i9?=
 =?us-ascii?Q?uKEKpmnkkjoBKCRcj0sTfjk/tp+Andp/gVG+D6iDVq0XEq0gJNRrfqOcmbCI?=
 =?us-ascii?Q?Miq4q+0k+hco6J0WokqbmFyOnRnMsLJ2ePJ/MeHrfyOO0gvtDvD5LHx+y/31?=
 =?us-ascii?Q?HRCmuDIGcpmpsCVnjXrNeD5mEa3ot0UPE3M52NWuWqAEFgEYw3UIru225qSu?=
 =?us-ascii?Q?cEXlxhrDnMv/g+R3/hmoN3Oo2ULCOhU=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d6c31a5-9796-4602-2fde-08df19407d4c
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 07:01:28.3675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wvAipCpPOKoECKJsndpVrtiqhJ7FH+f5tihtOHvF4HeP+p1fG68MzHY7bGbpmxACst2hXoVNvy+mr/bC+cECss9P4Slf3bZPjVw4Axzrr5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0517

Add the RPMI voltage driver and its bindings to the RPMI device power
entry, renamed to cover both, rather than extending the existing RISC-V
RPMI and MPXY drivers entry, which covers drivers maintained by others.

Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
---
Based on the RPMI device power series ("Add RISC-V RPMI device power
service support"), which has been applied for next. The cover letter
links the mail saying so.

 MAINTAINERS | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4716da916aa1..cd13d6172655 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23308,13 +23308,17 @@ F:	drivers/irqchip/irq-riscv-rpmi-sysmsi.c
 F:	drivers/mailbox/riscv-sbi-mpxy-mbox.c
 F:	include/linux/mailbox/riscv-rpmi-message.h
 
-RISC-V RPMI DEVICE POWER DRIVER
+RISC-V RPMI DEVICE POWER AND VOLTAGE DRIVERS
 M:	Joshua Yeong <joshua.yeong@starfivetech.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/power/riscv,rpmi-device-power.yaml
 F:	Documentation/devicetree/bindings/power/riscv,rpmi-mpxy-device-power.yaml
+F:	Documentation/devicetree/bindings/regulator/riscv,rpmi-mpxy-voltage.yaml
+F:	Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.yaml
 F:	drivers/pmdomain/riscv/
+F:	drivers/regulator/riscv-rpmi-regulator.c
+F:	include/linux/regulator/riscv-rpmi-regulator.h
 
 RISC-V SPACEMIT SoC Support
 M:	Yixun Lan <dlan@kernel.org>
-- 
2.43.0

