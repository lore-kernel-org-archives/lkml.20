Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012028.outbound.protection.outlook.com [52.101.66.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666A84A4F01
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.28
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790062220; cv=fail; b=lihyQzhiJfdjuyzLeuZup54T5grTPptxpgJSPJkJAT4zm47g3SrZltKr03yPP1IBrYSdWFuqmSFp6ofJhzwUo27U+cIx4S0OimNPkflWwpvzwO2EmAGs9ae+hs3f69f5MkUT985ZoDHTuJJydisfL7b9f56RuupFQMYrloJR69s=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790062220; c=relaxed/simple;
	bh=eeMzjBvQ1L8EnZPZ+rDWSUX55HpVlz0aSOtyqYLYQsk=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=twlEBG4X8g6fQBeRyQ+kXxO6tt1OmzRHF+CsSpTFY6hZug4BhlMPKcgun3MEUgASUC4GaxHdRZdBHHnbVizF1ithx7HHPsUsIAb90ic19inVPObVJquQLU3BQvfVkc/q7UlNbgfJRnWr8m0jAZRnk/noGztYJdFjwVM2c8LF0jY=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=BL1Qqci/; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=BL1Qqci/; arc=fail smtp.client-ip=52.101.66.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="BL1Qqci/";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="BL1Qqci/"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=a9ao6W+fZUY6U0dWFZ46vq3mTXAWJYk/qxtFijwQ3iCzFXnf5Qa4P5F+j/M8vKV9IUpLvPz4TNn2/Sp8geQFs47aSD3YNYOlmiasdH7+9EuWYf6X8JxCEr+HY1DcppKyDWrZ75YwCNRPw/h/pWLKBHJn9MZj2e2ueOuKmzU9mL6XfzysWwTvI7ZY25l5jBvmY+52DmBtz0dzJBHRNPigOjWVOQhgTHUZ6Hr0C0NWmF7GnpjrhX5AyNSdhodwoOSmU4JxsiGPua4ESuc5st9I0Dw4wJm+bjTwZcZGXalDabzygAq+xF75LefvsXAFAZEQa54yiycGJQupkD3JCgC/QA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05epOUPp+mauAOK55IqWk6TC56rhUj3joZynhHM90es=;
 b=HqNQBwAfZ+1aR3S10riDNgxs4Sdzj1KsWEOSu/0OIs4MnZQCrsLTVE2KUZOiphwEMOvcU0VS+nKuE7eHXsSjfJKzi/g+1zJGKWaZV/sUWazfAiAZOicumd4ly+U6lUJkhfKB48ZPpcjhVK/qm5eT5rR5xhL7j6IyDA+7lz2vA3XMVvOut5by1whiPjiiuY8wV6wVjfg6rF4PXvSHNoFRCIqN2V6DzKuEyLWHx1tCVLW/kdxkOqh7eFXEkAtzhITTkn3EC3EmOrjnPopjmvQ/JPKrlb2HFzOKJfsIW8+HZPPPBKsIekezky5yWAHK2pvrIVwb+l0CsbVg5mJXYuNEHw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=hisilicon.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05epOUPp+mauAOK55IqWk6TC56rhUj3joZynhHM90es=;
 b=BL1Qqci/wW3JiSxs6/qHGWN5t01fbyEnNKhOIZom1h5jgEWkvNrHv5r8dqEPVHbmjs19splA3a8yvOpbP8RRcgnvsq7vDwC6CwTQjUtzBDNIc4TrlzUQ2BI6u7K6Vl6dszY+CNIn8PPSf7sfPdMrutClD2uHRZnEau9L+wOqhHA=
Received: from DUZP191CA0015.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::14)
 by AM9PR08MB6659.eurprd08.prod.outlook.com (2603:10a6:20b:30a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.9; Tue, 22 Sep
 2026 07:30:09 +0000
Received: from DB1PEPF000509F0.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::3) by DUZP191CA0015.outlook.office365.com
 (2603:10a6:10:4f9::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Tue,
 22 Sep 2026 07:30:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F0.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Tue, 22 Sep 2026 07:30:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tvCBA7mqWw09DTIXb+DirmjvElKcSsqheddT0saC6gAhijNtfGJPLojYQbgbeVbbyA++IOnDGv0KaWNrL6CLgPsCqP/aC+O/HFkTwuXyy6egOWv5QiItHoSp36btmebt6aMwVt9ynNw/cP0fgu9rByNprEq4Z4Y001KhMalAcok3z1RWSAPLTwrx5MjMJdAgb/0CnTRDVAqYjXhlf7/Efz17F/ZJcUcHbzkKmMtIfn0BvryOd35J4UVUDIZNOW/Z88BwP8cxjgJsDzlR40dCeGsV5K57MHNRxx3Qh9Do38eqpQDBJRNVhunQmvEh3fDUCHBpUzN4GucAcKBRauS/Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05epOUPp+mauAOK55IqWk6TC56rhUj3joZynhHM90es=;
 b=W6ZH8Cj5L+IxR2nwFuwe37xd8njfo4Oppeo8NWMLXJL5wAtytV2WdZpg1baYRjwGtockmHC+5f8fp0y/orwRjyirsjKVS9WMfK9W4gCDsyVLSg4PHIhvAmHM1g3iw8e06kDgBfpJJI91zkHRWwUztFEX63X3IfmtK4k59uCaPxhjfatg78JHHTp6DC7i544nkHJMvxY2QSI1IH+AvGsCYVoi1nXnKKJeEGHffHWYrwMwqloco3NFBD1WjBNh6dugP5GXyvAONCTfoVRtxQrIqc87z4CLoBORXXA1dYgJGUwrTBfIe08PcYgcLObv6qt0t4jy5J0WEroiLC5LpSlpmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05epOUPp+mauAOK55IqWk6TC56rhUj3joZynhHM90es=;
 b=BL1Qqci/wW3JiSxs6/qHGWN5t01fbyEnNKhOIZom1h5jgEWkvNrHv5r8dqEPVHbmjs19splA3a8yvOpbP8RRcgnvsq7vDwC6CwTQjUtzBDNIc4TrlzUQ2BI6u7K6Vl6dszY+CNIn8PPSf7sfPdMrutClD2uHRZnEau9L+wOqhHA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10455.eurprd08.prod.outlook.com
 (2603:10a6:150:16f::10) by DB9PR08MB8676.eurprd08.prod.outlook.com
 (2603:10a6:10:3d0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 07:29:34 +0000
Received: from GV1PR08MB10455.eurprd08.prod.outlook.com
 ([fe80::af66:6019:a08:d04]) by GV1PR08MB10455.eurprd08.prod.outlook.com
 ([fe80::af66:6019:a08:d04%5]) with mapi id 15.21.0451.012; Tue, 22 Sep 2026
 07:29:33 +0000
From: Bence Csokas <bence.csokas@arm.com>
Subject: [PATCH RFC] Why does cpu_cache_invalidate_memregion() return 0 if
 there are no handlers?
Date: Tue, 22 Sep 2026 09:29:30 +0200
Message-Id: <20260922-cci_enxio-v1-0-00bade212729@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFousmoC/yWMQQrCMBAAv1L2bKBJoVKvgg/wKlI2m61dwbRkq
 xRK/26ixxmG2UA5CSucqg0Sf0RlihnsoQIaMT7YSMgMrnZt3TlriKTnuMpkhiY0NnRITEfI/Zx
 4kPX3usH1cob7X+rbP5mWcimZR2XjE0Yai3qhLpxg379llFLciwAAAA==
X-Change-ID: 20260921-cci_enxio-f3d31d9acec7
To: Andrew Morton <akpm@linux-foundation.org>, 
 Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
 Yicong Yang <yangyicong@hisilicon.com>
Cc: linux-kernel@vger.kernel.org, Bence Csokas <bence.csokas@arm.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: LO4P123CA0024.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::11) To GV1PR08MB10455.eurprd08.prod.outlook.com
 (2603:10a6:150:16f::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10455:EE_|DB9PR08MB8676:EE_|DB1PEPF000509F0:EE_|AM9PR08MB6659:EE_
X-MS-Office365-Filtering-Correlation-Id: c89d229a-2894-4630-46c5-08df187b53e4
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info-Original:
 rFrY9Mb7EPCpsJHYEOj1ZI0K6gcm10F563H0cfnJKLx3oQ8nCnb1Pi6nSbynt9y1HiFz/6j1rnqNpt8t8eIq75OZH1I1DKObUPaxPu3zWgZUjzj0cgArwa0bIweBQ0D6wfIbqyhapxpR2cTVy5FJYEwscyl7kZV6BzxqmlOAMZ7n86e4wtbn4pW8Nbh/rSw08Yv1xyFy6z7T/QznJJGYZFR/3Ma1Rx7DhYfiiWFaAY+DOCKrtJEAxiUw4WOjtHto6Qh6CToyyFh7Xna1KShA3t95bkuEURbzjEpeILz9Fy1bq5n3k9Y4NsfaHhssBED/hty08c3rfYFCadEsGj2ZrTk8CpbSiaNLiLmX+nd2JvdAdWvswpbmqjaQ/84CBaHsQHapbYQV+WsSecAMy0YvpvrMUKrljl8Ru6506AtBjTTEjw/BhstoV91kTRzz2trNFDILbp09rXs2bW0G5/5H4yH1oatX/jU2HFlf1gvKqjYjgnXDA6U3Fm9+LVk3AmRCQ5K2bhVzWgaO9Ew/WZS9XtYqbg8lWGBCwf1u6EkFtigPsG8zERAfrBv5oHotcpmmrrstoQdNd0XelJUADexyDKiMhQX7DUBza2KipUJFcJN3X9QkSLm5QZxTAvs3L7sfZgkmZKe9wq2Po8++huUwftfhOPnDM4MEzgULTUXvspQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10455.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 tkgWdVzPkd20V7bsBIJ7r3Q64l9iM+SQkmbuMIFfTbKetYwJ8HqqycyqGCO/9N0Z/3oOZJ6og0uIHMRdNyUJUgMDCfWOg4FQfIkGjIXqD2+Lc+WPlNpg4o8jlZt2vMUV5zApCQwARqgBnCYCZNtatE0iKflwCBCdQaAt4nLpcj/PEpNWOW2VmdFsmEkoV6quiVFj/jmpHDq7gurPzEjlTfY3jeriq3IpHtHO0qMdBUTW05rarZaJRVXKhMDHEcbr8t/bKi92Su/+1OySmdGr2MaD3h9fmOvbJnz05dtV2DylXvXOAm/Z8xzUxFq5Ndj9quMDOhpPuMHiw6rcIyrXjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8676
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8cd3079d-44ef-4a92-b7f9-08df187b3f0f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|35042699022|82310400026|14060799003|36860700016|23010399003|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	7EvcOqKW6UoQkpXSMBU4Gw1Gn0h7KZOFVcXlgJsw4YrO/EbF3tJrpAgMqd5SaKM7zHV4ogxV4NZvq4VBzOi2vQR5x6hf4qUAdoPB7wm2TR0BNgwZdpjd1hMpivHUVdL4PLuECWFFyzsqK+CQtqvAq83P0qK/U+pCBTTW2kACzVTPxa0uJQk3GlhfpUODWoyPDsFwp9QL+kkg2ikNSyrAl5ES/IEfKfJBD3qLRn6QTwaYE54Vy3Lmx0lquj/jJPg7Kapeuj4XzZdtMmiVfRmIfPuPpIWoy743ocLGT1B+Fi59pT3BadZrOt2daNZByaSx/xL+oKrGiwW0hKMaXz2ZeWsSz7PvNIa7LeqGOQWontyKPQDfUjMOJTgAnSpcCqXF3TJnUsV1yeLfCwA24vSWXWFZo9tjCD3eueCFxWhKtojEmwWWHdK/04uHoBD9Bo7OEZZQPx9tMPxNMIVlnVWo3JI95uF84Ne5luf8VxCOyclpZfVa46FTbtz7T/Gy4+beoIukcJkSlCNA9QipiTURzsf60EosEiMeUWw1DzLuxn/mdIFAQ9TMPYPhMX2gHeelCYgXITUfhZy/D0GnjMJWER0yTo6mcR9fKbGMe5XzpSKI90A7ZajZvKubW94N1KwEAuVC+fvzj3r3Fxmo56r8gqUBZRRqlvJLV2nmSdlEOtGBY5fpD81StF0mK4ycUNp+JSvUfB6/RkW0PIVyHQAmzQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(35042699022)(82310400026)(14060799003)(36860700016)(23010399003)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HB/kOmtTLZcZyWlyVvvWLm/jNraxGPpuah+FHrN7peBreVdayEDNya2gZ+dL1zxTLUcD8m507qYNco1jMHv/Vj9Sx2V/AcoPOPk6t/TBFxQxbCZJqpv/438/9k/Hc8Ru6lH8aSidoB9nnWOC3vpzimhOrdauwD8xym0dWEnacDmkLtkiA8qE1qRhp1IuYzvJ3r7rHtk2kQM45sqGP4qLNu28J5WnYrii0pRbLovaUYhSuq+32x20JiG4Wdnbb9ab+1/UbzvueRhWvE6x7FcvcbVyUCAWcxzqFOgaPGrv50Uxv3p+ahUHxRWyDYDMC01Ye/4JOXowIo8DQ4CBZeLmrPxDbGw8gCc6+pLR+DQjzv1wZLgmEjSVpiZCGLpJT7OY3ERlz7lLPfHIS2nkZbvceg58uEsFzM4/BfesRNzSt73YIPeupImdSMiy+rpG37SL
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 07:30:07.6459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c89d229a-2894-4630-46c5-08df187b53e4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6659

I noticed cpu_cache_invalidate_memregion() returns 0 if there are no
registered `cache_coherency_ops_inst`s, which I find counter-intuitive.

Is this intended?

From what I've seen, there are no in-tree users who do not check
cpu_cache_has_invalidate_memregion(). However, IMO the better solution
would be if the function would perform this check, and not the callee.

Furthermore, arch/x86/mm/pat/set_memory.c also implements this function,
but actually does the feature check, and WARNs and returns -ENXIO if it
fails that check.

As part of this RFC, I'll attach a patch that provides a low-overhead fix.

Signed-off-by: Bence Csokas <bence.csokas@arm.com>
---
Bence Csokas (1):
      cache: Make cpu_cache_invalidate_memregion() error out if there are no handlers

 lib/cache_maint.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260921-cci_enxio-f3d31d9acec7

Best regards,
--  
Bence Csokas <bence.csokas@arm.com>

