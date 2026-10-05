Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11022142.outbound.protection.outlook.com [40.107.168.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1A93AEB26
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.168.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791195415; cv=fail; b=gAchRvFLUE2P3bwmUDC+g7XnT/WH62Urzsek/Nub3muh95+G9aglwfZtKGIewMCBfgdyhFdqA1AQimo99LcESz17QCZGwNg6EyWWW3l4WmyLjtGXGzWkNRibP3jMSXT9THK8zUYuzO5yvtF9mGCVBE58fJ3OnJwmSWp3gopW9dg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791195415; c=relaxed/simple;
	bh=0OLpYa67cvmbJo5XTjCX+j9yFIFkkPsLXpEV6PQ3P4w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=leAQq20wzlHwxrLzCl/5JMumNu97+be3OPRcGu/w4C0z8YPBHPGsRsGe7dORpP5hKBnj79QmIh4Oout/Ja+rTEZjPkGU40JZqmFIUI4ycImvKFfgt74l3/GvyR2kCirOVFxPQNhJhHondBbqOQyQkEPwJKgga+4YF+uEzXhqDRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=RQPHnwkg; arc=fail smtp.client-ip=40.107.168.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="RQPHnwkg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tvp0MqKx8+1xX7b+Uws17u/MYSKiFlbqV2X3CH4m5HgO8O2sefuQ+ccV2FS3v7qbpyFMs04fvrbD6OX1PMHUEXZqCbklG0eouTlxnyUhyiqcLIb8RADTDls0CDuA2QLeMYfs7mAGgnwqunWubFCPJ8SXsGXZmCyrc8dYaX+LgH0m5gtvtzXrMtn2vvpWE5u09q2uTuWhNDzVXPNdeg7afSN9DrT165A5KA9q/xwa8Pj2U38O0hHcf2ezZ8A+wNf4yzr6EqexgSCmzCMt5XDZ8eyH5HH6+qXxzAHdXm9NT70aVUbcWkkz9clNxKuu902AXywSaOI0vfJpz5/e18ULlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlvckPE8e2U3qFSCf7NMk4LshB3dn9yxJC5Zba9mxac=;
 b=UcqryOHdnlkw2hD6N+N7XpjMczFOGtIYehri6PKm9uwOr3PUeYDbfAxPlKMn8tW3PaaeOIayLmlnPfWWVXD9NjZSBLbGch525/66bjJRbci2dw4c8i2eZlYulA8g6b0a4jyqdlPruqYLgdaZe9RGO5JcDHhnlbew6qHi1D9uYAkJ7bqZM3i2i7klateba+SyNOMSzbK3LlIw1aEH8DncMWUiOJ5XNxm2j88/Y9ID+aIxxZ3TWoMcWAv2CUtG+wuxiMJy6pTpAnsTcDgMD1rL69axRHEqADUHFzQRXHpLa/xpZ+emJhDHWexsb87abCQBl27TXbemNpkYXGwOHkXn4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.85.25) smtp.rcpttodomain=gmail.com smtp.mailfrom=duagon.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=duagon.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AlvckPE8e2U3qFSCf7NMk4LshB3dn9yxJC5Zba9mxac=;
 b=RQPHnwkgXruFwwXuF1zNXLiLSbo3/xXXLbXXMGwzGH4fBis9Te1MTVxtko2zy1h+pw2SPYRvfZMzhnF6LsTS9PFnAM1/iS+MLtfPDXWw9X8Se2JbKrRaQi3prbzRtzAdghWaasQ320N7OrY0DiD2VkIDG8xp2Cnj40AdzZqSAvc=
Received: from DUZPR01CA0192.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::15) by ZR0P278MB1155.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:55::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 10:16:48 +0000
Received: from DU2PEPF00028D11.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::12) by DUZPR01CA0192.outlook.office365.com
 (2603:10a6:10:4b6::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 10:16:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 40.93.85.25) smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.85.25 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.85.25; helo=ZRZP278CU001.outbound.protection.outlook.com;
 pr=C
Received: from sy-deliver01.de.seppmail.cloud
 (2a04:d480:4400:11:f816:3eff:fe57:da56) by
 DU2PEPF00028D11.mail.protection.outlook.com (2603:10a6:18:3::6c9) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 5 Oct 2026 10:16:47 +0000
Received: from sy-glue03.de.seppmail.cloud (unknown [10.80.0.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by sy-deliver01.de.seppmail.cloud (Postfix) with ESMTPS id 4hywKV59Jgz2yFR;
	Mon,  5 Oct 2026 12:16:46 +0200 (CEST)
Received: from sy-glue03.de.seppmail.cloud (unknown [172.18.0.4])
	by sy-glue03.de.seppmail.cloud (Postfix) with ESMTP id 4hywKV54Jkz3x9p;
	Mon,  5 Oct 2026 12:16:46 +0200 (CEST)
X-SEPP-Suspect: 7c7e68867dc44adfba80fee523986a25
Received: from sy-scan03.de.seppmail.cloud (unknown [10.80.0.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by sy-glue05.de.seppmail.cloud (Postfix) with ESMTPS id 4hywKV4q8Rz3wQq;
	Mon,  5 Oct 2026 12:16:46 +0200 (CEST)
Received: from sy-scan03 (localhost [127.0.0.1])
	by sy-scan03.de.seppmail.cloud (Postfix) with SMTP id 4hywKV4MQkzMxX;
	Mon, 05 Oct 2026 12:16:46 +0200 (CEST)
Received: from sy-m365gate03.de.seppmail.cloud (unknown [10.80.0.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by sy-scan03.de.seppmail.cloud (Postfix) with ESMTPS;
	Mon, 05 Oct 2026 12:16:45 +0200 (CEST)
Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17011025.outbound.protection.outlook.com [40.93.85.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by sy-m365gate03.de.seppmail.cloud (Postfix) with ESMTPS id 4hywKS72JFz3wWw;
	Mon,  5 Oct 2026 12:16:44 +0200 (CEST)
Received: from GV0P278MB0621.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:40::10)
 by ZR2PPFA8003D1B2.CHEP278.PROD.OUTLOOK.COM (2603:10a6:918::2e7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 10:16:42 +0000
Received: from GV0P278MB0621.CHEP278.PROD.OUTLOOK.COM
 ([fe80::de7b:48d4:13f2:1732]) by GV0P278MB0621.CHEP278.PROD.OUTLOOK.COM
 ([fe80::de7b:48d4:13f2:1732%3]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 10:16:42 +0000
From: Filip Jensen <dev-Felipe.Jensen@duagon.com>
To: morbidrsa@gmail.com
Cc: linux-kernel@vger.kernel.org,
	Filip Jensen <dev-Felipe.Jensen@duagon.com>,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Subject: [PATCH RESEND] mcb: fix kasan read slab out of bounds
Date: Mon,  5 Oct 2026 12:16:28 +0200
Message-Id: <20261005101628.31728-1-dev-Felipe.Jensen@duagon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <220466e4-c768-47ac-a0f6-1876e80f4256@gmail.com>
References: <220466e4-c768-47ac-a0f6-1876e80f4256@gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0072.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::23) To GV0P278MB0621.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:40::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV0P278MB0621:EE_|ZR2PPFA8003D1B2:EE_|DU2PEPF00028D11:EE_|ZR0P278MB1155:EE_
X-MS-Office365-Filtering-Correlation-Id: 60eeae8f-debc-4bcd-2397-08df22c9c371
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|18002099003|22082099003|38350700014|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info-Original:
 Ro7j+XkMdZx76lWK6ZQTbLZ51L9Xn9EpZDl8Mr1TiVNQRgCccrEaXjsif8sZLGZaW2X2IkR6BYTtwH+6Rr7bXyl6ZH2SZFhf/nJ54GvcZiAHt+Y5YtGnkvhR8GaRwF1433bSvCkGQO9NS1Cd8RTOa3I9PGU+hLMEqxrNKQ4UlRZyd6uEAZ1Ln/vg1Nkpo4Wp0Ab3NOxF9lEKTjdTO2wf+Dy2JMmcUvVD731ZIBq7Oij7JBKEbZcNBeFpg0UsCMWStm2j9dquHcB5oxecOVoQv4Y9E+ksrdHK6wEeQDi5oaKzIujkKKFMWkGUmZa2Pj1fzuum6pFxuVI1QZAkx6+axh6IDmpNoatFULCVnxRYEhuS8+bsJ/UYuBU7RobQNgVzFFbsZ337fQD9FYFtRA7ayaaBkI00pfVEWXUNEL7eDvJ6LnHZLWPpKN7Oy+7lsG0HvmsxbM7rUVYhd09nGwQt6Dxmpm+Bj0727juKytNN4fJd2276V/tcAvcHvuShUbJ5Gmjga3SGsp2aW+G632dsLYg8tZDz3nkUBOV1fVPLEc/T2Ik078l8tu+rb8Fq8IZcUX0cMoVZiU8kHDqS+jrChLYsQ453tEfnpVg1CkesqXWyysmVSgLuXKPZBd959wT3d9wYcSik/UUNH0be2hAK1VuC80X/tK75Bqt4LF8zoQ58fTcc0PYValUyeb0c3WbKTlOdvxfdk8Kg4RU8CAwS5bSyIl+6oRcG3smGuw6HExA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV0P278MB0621.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(18002099003)(22082099003)(38350700014)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 rSqcesYVdN8RxF4Cn/D7g866aKJeaFKvyads9AwqiJmHEiXyEnsGqyEwHkIwr8xR9bWerv3hnLZcXbXm9mSgvg8abXmVggfYQ+/5YVHu8e2ZEwU2STG/qbJO5Dulor78EQW885EMOxhvH/Y2e4AcqYWgA9Bbm6MScXPXkFezkpG7NReius1aNUe6NxXRY0bJI2yFmTBZmOMl/7xCwdkG3bJ2x+nfZ/2LqAnKpjdT5FjaM/2fz8e2zEWsVxVzwA4muoWGjnGVtah7or4FBfnAP9O9HA7kdztRpsBfoPUKQZp+pjfgRBFwblzWEu+7tnO9xL3mJ0Y5CnWFsgbImlFr9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR2PPFA8003D1B2
X-SEPP-CCCVersion: 2026-07-16T14:50:29+02:00 96be5760
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.85.25];domain=ZRZP278CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.85.25];domain=ZRZP278CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D11.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e3d4a3f2-f523-404d-1ceb-08df22c9bff9
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704160511799003|10070799003|23010399003|1800799024|376014|82310400026|36860700016|35042699022|14060799003|10067099003|56012099006|5063699009|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tX14spnVNC7daUphYMtIam9OZUe7XCbFctBkNqyhjABYCNAHw2Cg7lKVteNLLpV7kmPYwTZ3FI5jaN962i4oMeA0CZ2NV0JQ4Z2eQdFOVGNl5SYQWQ4jMe0XZWE6xzP1yC0GC+6NCaSI1H4eJwJlhYvZv1Dw3+Vlw5NCbS7RgFh8vOW/fxfEloHsPeQhFnXI/V5Fc4A1dP05H2rp5yGI8zSjCd+Dtmv7AyWihX6O1DLeWISGMjXOhqNns9Cl6VwlzRXvTsQjwXbWlqMLwO4iyjuqS4M1dqbmwAqiNGIRDuQbulNcvEde9wOesA1vD8tCNJXBEEBRPMTrOML/rmqPI258rFUX1e3bqnTb+LiZRiRwA8sZYsOLe/82TjY3oS+jo2Dyk7K6tjpBr65YCNgw1/VuzUU5BXMmPEPVsc4kDohg6Uc6AhIYXeTnxdneimA8xIxUNES1Q6rhszs4YDXHaj5vFTUcagYg4m+9I6bQ8nftvbc5FGl5lCwVBkasuffH0uGaQ4nra93PXbt/qe4/WMhUdYs9wndCCT4bVqdpiJxLNIgdJ54Fw0aq6qprBdLx+O/3bGesmZEMe7u/pP0SbVtupSoP9xsIk4lwJXYO/1fDzaKOkAawsJEp1J8hS+3WYEgZJXlpyDSphzInxu21vELU+Wy5ddYrCbCMHmIEthRPMsXmujp8G9sKiX/zBoYPOcHExw6m99tFMgnkNIiEGNuNiZV9BpQzg4R5N8UGUO2T/XfhCZmx+rsg6esQSn7gGF2W8shSRxqxtc5Jq30FM+L58dXXvumrCLi7oEVpYrinj4MRhLps3BqSvm0NX09XqneMnDXMb4+Egt2wW7Oe3Iaib+o2MzfEZIU+7qLkCHI=
X-Forefront-Antispam-Report:
	CIP:2a04:d480:4400:11:f816:3eff:fe57:da56;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRZP278CU001.outbound.protection.outlook.com;PTR:mail-switzerlandnorthazlp17011025.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704160511799003)(10070799003)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(35042699022)(14060799003)(10067099003)(56012099006)(5063699009)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8ESQraavzbpRmmrHZRynQwTydkf39dA0mPJPsjf5QJEahcW+kmXd0aohWDACBPJfR1wm+PR4aP0y2QmDtv/LRjbI0RmqLLamXfpknT/X7JtZ8X1Aw/VZktIwn53nHvEt8kItkjeKQmczG8aB9JCxaRelrzBFCrlDfcMmUzHZlsMZIwc2dZqb1Qhx38TNHl3TQQ6ka/d0jhLU017uxm+ZyJdX5L7vC40F4jAYld8LtwODH54/Zl6eJG2Uo/YyG6L+CQt4/6sunpsQgHXlTL0BZeAED3Sjc4AQU7KtJEMer3pCnu61mVpZtcaW7j0n7QzAJEugUrD+MLTpyrkGjSbWco7O2UPu0JAKYmEnsPTuIZMfubP20aX4uGh7wksOqP21uuWzGufSHhAeBvzOYs6OMkvGkuVmx+mubOfOijX3H0KFaboRFgUUjmqFnFi/fLdb
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 10:16:47.1535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60eeae8f-debc-4bcd-2397-08df22c9c371
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[2a04:d480:4400:11:f816:3eff:fe57:da56];Helo=[sy-deliver01.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D11.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB1155

Fixes the following kasan bug report reproducible when probing the
driver:

slab-out-of-bounds in string_nocheck lib/vsprintf.c:655
slab-out-of-bounds in string+0x396/0x440 lib/vsprintf.c:737
Read of size 1 at addr ffff88810dd32f94 by task modprobe/661

It is caused for passing snprintf a not null terminated string as a
parameter but in the format string expecting one ("%s"), thus making
it read pass the valid data.

Another solution could be giving a length to the snprintf parameter:
        snprintf(bus->name,CHAMELEON_FILENAME_LEN +
1,"%.*s",CHAMELEON_FILENAME_LEN,header->filename);
However, this solution seems less readable and since there is no need
to format the input, apart from converting it into a right C string, a
simple memcpy is here proposed.

Reviewed-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Signed-off-by: Filip Jensen <dev-Felipe.Jensen@duagon.com>
---
This patch was previously accepted but never made it to the sources:
https://lore.kernel.org/lkml/20260217075124.10052-1-dev-Felipe.Jensen@duagon.com/

 drivers/mcb/mcb-parse.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mcb/mcb-parse.c b/drivers/mcb/mcb-parse.c
index bf0d7d58c8b0..85dba7ec1409 100644
--- a/drivers/mcb/mcb-parse.c
+++ b/drivers/mcb/mcb-parse.c
@@ -201,8 +201,8 @@ int chameleon_parse_cells(struct mcb_bus *bus, phys_addr_t mapbase,
 	bus->revision = header->revision;
 	bus->model = header->model;
 	bus->minor = header->minor;
-	snprintf(bus->name, CHAMELEON_FILENAME_LEN + 1, "%s",
-		 header->filename);
+	memcpy(bus->name, header->filename, CHAMELEON_FILENAME_LEN);
+	bus->name[CHAMELEON_FILENAME_LEN] = '\0';
 
 	bar_count = chameleon_get_bar(&p, mapbase, &cb);
 	if (bar_count < 0) {
-- 
2.34.1
