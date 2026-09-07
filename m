Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013068.outbound.protection.outlook.com [52.101.83.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF004519A4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.68
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788800070; cv=fail; b=rxb5LHvoSVsBgkLWJM2GpEtR9nEZVV6Svr7IrWZ9MZk68cmFm4V1lr3o5hq4OSB7uPSkHTArzmkcZ5CdxyE9VYs7xZctwvKbqjMb5FCR4jttwYbsrWjjsjhPe5BLdBirwCJHkV5df5OTZwrOcBv9SBVQZdR3IK4MkygHMEOu3vI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788800070; c=relaxed/simple;
	bh=79cj+O13SlG4MW2uTWvEiL3TBgbtKcjer5BWWZELJ7Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=arziTIjbnMFUOHh7z5zYJXC+LqZ0XNQt/G1ZEZCvveGJDotDRcmIxX7ZZFKBhv9HQ1Ug9IwhUPkWTcgcMmifXkBkksDbudxAGZ2iYQnUyqdBhypPlsgSIbqT60DeFHGyAlKXYQOl9pKxhXmJWX745Qpd6jbsqkRsuvedESoIRSU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NSZOOnAW; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NSZOOnAW; arc=fail smtp.client-ip=52.101.83.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NSZOOnAW";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NSZOOnAW"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tTUu8TlCCNqza6gcbn4E9shgA7pn0kf1ln0rKyOVcpIVBnTBg84DeTzVDL/7QQnCTxIQcYDTJGOC5z4wBI9dYwg2JtZExT1KM216mvrInPByjC6hvgIC+r424eUNViySEjTgGhPIfnYdTgyRVbBQ+5brzs45kN8zAxHb3WvLAywQwlZaQxEdn3p9cZejmyZ7dtf0SCQiybSZbuKJtU5HDCPmyir6H4nXqSa6OqV/bG3BZoBG9u+eTirrnzzbeiiOiZPlqxltWc2Afl48h9mXOhXEFbJprj0lkrTcFlzBwrDcGDDHpyKp5W2i2On2Y9WBdCh0kDSbczzcX+QRXO2/Rw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79cj+O13SlG4MW2uTWvEiL3TBgbtKcjer5BWWZELJ7Q=;
 b=S0ERqnr3HVkcPbjEpYYa8lB0Lq1onEMb7r/EjaG1nw6Oqs8K3nRbXAu0RfZqavd3tLFQcP6qtwTcCWZRL0NPT2o99HJo737HzFMhKme4dAvNW7eP9f4eaHi/1MHFs78ni0VJswRs/xZE9dD7HWPHqmxZM6FzDC39s9hyqun3nMTPG3MXlnqF8+KyYQvO+eJ5TpKVwY7sV330WbHD8SLJgvfuVjM0Hh3ZziqI9iIFcDd8CM5WN/7wxgEDo1Xc2p6Grg7fM4CxIEu2UOZn6l5KV+8GdWWIXqU/gzK6WRlZ5tBdImVtmiRkMFVZfyhZYpEPZbzM2ENL3hlOsARRZBZ44Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79cj+O13SlG4MW2uTWvEiL3TBgbtKcjer5BWWZELJ7Q=;
 b=NSZOOnAWX4Igz7SEGyguQH7Jydub5wVmemCUpsxQ28EB/S39YOrjgiIvXg3RAM5xc177YownOxpp4H93PbDFp22v+J8a4oH5Ykmdk54HNt/CQhv8my1PcPVuADbrbVgs/ahF7NdtMZrkPiS9zRcEH0BMdFwDvq8Gi5SfPACWIQI=
Received: from DUZPR01CA0293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::7) by DU0PR08MB9630.eurprd08.prod.outlook.com
 (2603:10a6:10:449::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Mon, 7 Sep 2026
 16:54:13 +0000
Received: from DU2PEPF00028CFE.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::30) by DUZPR01CA0293.outlook.office365.com
 (2603:10a6:10:4b7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 16:54:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028CFE.mail.protection.outlook.com (10.167.242.182) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Mon, 7 Sep 2026 16:54:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+wEbleP2p17NL/mtS+py2vFeuthP79xbbBs/ZZh2XXS+wcxg87IhUdDoh4b152fKxlB8CNXQqVCqX1rlbxbDKCz5O82/45YwVX9G34iFzF+gcQsVv0ULd3rLYxpTr1gC4koFpQ9LefoUKIXCya5+3cAma2qWphDGPYAC0Y8ttR/j/VUuLJO4xoxFkOsg4xaVNCjSlBfAMV0TulC7rB/rjP9MFmVTTdCZPBSQg3vTruwntVfRunPSB85NeOErkUhWDT2hN3bE8wF9Vq9miTKQc2eA/Bxgpm4VBi4tLYuC6tkMJthXE0vWW83kfS3qyWmcFR5YvazLZpgqarsSmTiWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79cj+O13SlG4MW2uTWvEiL3TBgbtKcjer5BWWZELJ7Q=;
 b=C6uBaSWzlphShN5LQ5iDQ2xyN6P81uP2DzgXM4l6rXpBoLqNKbrF3M3xA8Y6azhrArvE7fdMC65VowRWUcSSvgS49VNjoa0HoquaC6KKcYU8sbkh6SzmXvikrcmsSOrD5jPYPcol0eIG9z0qXNoJxx0b89v0v98n/UORIq4deBh/jjB4onBQgaf7eKfrDSjYUeyrKWGSMCZOX9CYQPmCwUzhgP4+USctgdtoy7wy7Ieq9D3KAhj+PBeVW8vsS6wIwMsqrqCVLYHwlHegoyVtpcQDI/TcVP+LJtKoTQe1EtHVdC69M1dFMkScobiWA2veDgeoWV97Y5GY0bUg9WhxXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79cj+O13SlG4MW2uTWvEiL3TBgbtKcjer5BWWZELJ7Q=;
 b=NSZOOnAWX4Igz7SEGyguQH7Jydub5wVmemCUpsxQ28EB/S39YOrjgiIvXg3RAM5xc177YownOxpp4H93PbDFp22v+J8a4oH5Ykmdk54HNt/CQhv8my1PcPVuADbrbVgs/ahF7NdtMZrkPiS9zRcEH0BMdFwDvq8Gi5SfPACWIQI=
Received: from PR2PR08MB4889.eurprd08.prod.outlook.com (2603:10a6:101:1d::23)
 by GV2PR08MB11395.eurprd08.prod.outlook.com (2603:10a6:150:2a5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Mon, 7 Sep 2026
 16:53:35 +0000
Received: from PR2PR08MB4889.eurprd08.prod.outlook.com
 ([fe80::8bda:5986:a1f1:cb7e]) by PR2PR08MB4889.eurprd08.prod.outlook.com
 ([fe80::8bda:5986:a1f1:cb7e%4]) with mapi id 15.21.0382.007; Mon, 7 Sep 2026
 16:53:34 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "sashiko-bot@kernel.org" <sashiko-bot@kernel.org>, Mark Rutland
	<Mark.Rutland@arm.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, nd
	<nd@arm.com>, Catalin Marinas <Catalin.Marinas@arm.com>, "maz@kernel.org"
	<maz@kernel.org>, "will@kernel.org" <will@kernel.org>, "tglx@kernel.org"
	<tglx@kernel.org>
Subject: Re: [PATCH] irqchip/gic-v5: Bring up and preserve the IRI link
Thread-Topic: [PATCH] irqchip/gic-v5: Bring up and preserve the IRI link
Thread-Index: AQHdPJStBUU57AfeV0KphLKfP/lie7bDWayA
Date: Mon, 7 Sep 2026 16:53:34 +0000
Message-ID: <8ec4cec0055f9cb81c4f904b7f1f1bc21f6082ba.camel@arm.com>
References: <20260904174150.75945-1-sascha.bischoff@arm.com>
In-Reply-To: <20260904174150.75945-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR2PR08MB4889:EE_|GV2PR08MB11395:EE_|DU2PEPF00028CFE:EE_|DU0PR08MB9630:EE_
X-MS-Office365-Filtering-Correlation-Id: 08425d86-2727-4ce3-104a-08df0d00a306
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|56012099006|11063799006|6133799003|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 bcicIdN+EHjjYh2kxVzqz3brEPvmhU9C34s5irlXyXfo71kVyY2vi/jCBtyWH1yAsO6LM4Eor2FwfF83NyjBHqqdQXbtab+RdPslK+Usq0/mXr7ufpz35PEaibt1i7b8/WBqv5Bi/qEmxZaV7PkQmorStKjmdKF1qhP5M5+5i8sOPmgwdzaqp2Y7vgmeer+/hj3RWO68JNyZ5oM8TK3eCwi9JMDzg0JkzblkljzDhwPjepHsWnSmUTedSySBJr9l2swzFNIFkcgvvYFWzMpwmIumv0cQPF227fsL4KEkv5qQ1xCUHcsptgwWvKkoiDOcm573khb97dKKB0brDYALCpzL5GRn0LV5jp3jqvRv/oaM0aJb5EjxG5JDlTjNrK7lgRMt81ZT1htuxZcb4nrkpZHvDz7Ek7h+n9VlqY42GpNF8nfBPUSf7uOvdV1u5lnJGvHd/yA3SxGlim+wqt1uRzhLuTSzIlEBvw3plrEg4/qR3UVC9Zm06eY1VBJ8/1zTUgxcDoRc4+R0bAxdfPcXCI91eclR6q4p4UguKZzQ9J2wA5ocGBfifkaOBv5S/uMENAtNQR+NIlKRA88FzNjtgcvLhk181N6zA+8jWHQI5hRq3kXrxhFb+8mFjFP+/hSapvzlntTA/vljSZg8fAiTmSzhEc6f9ooItHxoBky8q0+Rkphl20ZiLhWEF05QomWaGRfvs9A3nF9LuR9fi+Kcr8iPi3CCbRMR1XEZK7P4A4Y=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR2PR08MB4889.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE279895C5D4F4478784219B99BA63EF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 ksdwZ//R+qmd5JzJ7Y6oIYmfV/JEAU/iVWP4+zTu+XjNAr8HgFF/bZYbuOXNVQDNx2TyDxPCtB5uV7eVcxO/BvgFqGQ7N6U/WxjzOaXaxkl2fgMG+dZX3j+9BihoJXp2nV0qb5apeH0AOpvOD2fDIcgqXXcMX/O6Kl+KYdo82y0PAqAmsrwe7d8A+/hGy+zuq4J9KJ62rB0r/HJs0I6ucCnZhJzAA9TJQFAkxa7Ycbsf+xBp7EZvLyNKHh78X4ajTIrgaU8prSbeHNGiZOO81gFT5yWA8MgNSOf7qw2iwat9GjEBPsVaN8sxo0CU1Kqb7/24caHNcFuB4BZ33Ngjzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11395
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	446d15bc-1ed7-4c77-555a-08df0d008e21
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|14060799003|1800799024|23010399003|376014|36860700016|10067099003|6133799003|22082099003|18002099003|11063799006|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	3v+yW/010cf8u5ebCML77TlgJv94jc3UJJ832l2OB2q+imf8mF5bIs2qvb8cVmuDMVh1GpNGtZTuVYNHrtO2qFXhEKnXHhzUHPvx4E6yYZFC1GC2SlVcnPYxCh/P/VhGz8+FKhSrlzqtvbVOxMNcgnfCJ2U2isouyFo8Wp+NNmOeTauYJKR2+7H2GodFBkhVJqqloILz+ZrEklO15w+Y0RaVs+QNVEbZKSekvRpCRS+fg5MJbAQiBtquOK5mrR0bF8gmTbZbQh1WSHj7Vx9QQwYcNAlFdEoITknWdxMgKVBqtG+iBIlx+AdXBEYFrieObZDibj680ZhfX9rSwteuAmcKdCkGUMyiWB73/HdsnVL3dOp3ucuC3pZl8jpdQz8L9BuxcXohPyNKX3F8b91t8oF+sJZWE8O3kEaSxCMDb7wLviuAfuLQvNc6sxx0dQbWMVxWd/ZL4X8mSKiZwmvwKHyzvW8QPmLyJjDfBixiPO2vngGU4cJQSNkGhYWT7Fkvw3TY5JfKZasXVj3tgAL+sQnO7g+6EqJCNyAP7KU32E2v05lEDfPFNJOuDa8k1jkp6+/a+S6yf10bb5FEkhgwEmfxDAkr1iivjQAxti408m4RFjAHqybwNih263x9e5uSZcuCchPboTisI3vGd75YV0EyxKxn3SX8Yko7iF31nHcvDH8IF5zVp8q0KurvTvpIWKDvCn5kNvwP6u2tPw0j2w==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(14060799003)(1800799024)(23010399003)(376014)(36860700016)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yyOpdfXzNfRTPLxtZDEH+n4oC8C2VD1DoJswywmdUyt/yOzEh/avvaQzfjZE2LMbUFem196ir7sgov6px+gTO0PDxZRRkwsgEW7wHfEyy73aC1oJMXNO8Xu4dZIarsrD/G3MQYc6Ze7Y+mohJB4i0XL8yjUpwJSvXrpPYDt09m+4rBJU4YKDg0MfFKD48mXFs3/ud5zuqBo142TCmG31RDjsqqjKmMHUUQQfBeEOt95/MMm7VpR3BvZitzvD7BK6tkgcQJfF9pYJ49k/o7RSy4LRyTZYTyNb6MW16tjlAsbrPExyXYNAaxPZuhN/O+wmpjpiYZ02B3L0PeLSndwo+6F+IG1oUjDhMg/XLW1DCHgSdzvQ/Wcq7fHqHjR6oflWmJuf8MnY4NB7U3GstEhctk24hlXIxQdczMkcNnxFf9+JL1vq9YTPd/Y4YD6wEO6B
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 16:54:09.5060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08425d86-2727-4ce3-104a-08df0d00a306
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9630

T24gRnJpLCAyMDI2LTA5LTA0IGF0IDE4OjQxICswMTAwLCBTYXNjaGEgQmlzY2hvZmYgd3JvdGU6
DQo+IElDQ19DUjBfRUwxIGNvbnRyb2xzIHRoZSBsaW5rIGJldHdlZW4gdGhlIENQVSBpbnRlcmZh
Y2UgYW5kIHRoZSBJUkkuDQo+IFRoZSBkcml2ZXIgY3VycmVudGx5IHdyaXRlcyBhYnNvbHV0ZSB2
YWx1ZXMgd2hlbiBlbmFibGluZyBhbmQNCj4gZGlzYWJsaW5nIHRoZSBpbnRlcmZhY2UuIFdoZW4g
RUwzIGlzIG5vdCBwcmVzZW50LCB0aGlzIGNsZWFycyBMSU5LDQo+IGFuZA0KPiBjYW4gZGlzY29u
bmVjdCB0aGUgbGluay4gTW9yZW92ZXIsIGluIHRoaXMgc2l0dWF0aW9uIHRoZSBrZXJuZWwNCj4g
aXRzZWxmDQo+IG1pZ2h0IG5lZWQgdG8gYnJpbmcgdGhlIGxpbmsgb25saW5lLg0KPiANCj4gRGVm
aW5lIHRoZSBtaXNzaW5nIExJTksgYW5kIExJTktfSURMRSBmaWVsZHMuIFVzZSByZWFkLW1vZGlm
eS13cml0ZQ0KPiBvcGVyYXRpb25zIHdoZW4gY2hhbmdpbmcgRU4gc28gdGhhdCB0aGUgZXhpc3Rp
bmcgcmVnaXN0ZXIgc3RhdGUgaXMNCj4gcHJlc2VydmVkLg0KPiANCj4gRHVyaW5nIENQVSBpbnRl
cmZhY2UgaW5pdGlhbGlzYXRpb24sIHNldCBMSU5LIGlmIGl0IGlzIGNsZWFyIGFuZCBwb2xsDQo+
IExJTktfSURMRSBiZWZvcmUgcHJvY2VlZGluZyB0byBlbmFibGUgaW50ZXJydXB0DQo+IGRlbGl2
ZXJ5LiBQcm9wYWdhdGUgYSBsaW5rIHRpbWVvdXQgdGhyb3VnaCB0aGUgQ1BVIGhvdHBsdWcgc3Rh
cnR1cA0KPiBjYWxsYmFjay4NCj4gDQo+IEZpeGVzOiA3ZWM4MGZiM2YwMjUgKCJpcnFjaGlwL2dp
Yy12NTogQWRkIEdJQ3Y1IFBQSSBzdXBwb3J0IikNCj4gUmVwb3J0ZWQtYnk6IFNhc2hpa28gPHNh
c2hpa28tYm90QGtlcm5lbC5vcmc+DQo+IExpbms6DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMjAyNjA4MDcxMjE3MDMuRDRCN0ExRjAwQTNBQHNtdHAua2VybmVsLm9yZw0KPiBTaWduZWQt
b2ZmLWJ5OiBTYXNjaGEgQmlzY2hvZmYgPHNhc2NoYS5iaXNjaG9mZkBhcm0uY29tPg0KPiAtLS0N
Cj4gwqBhcmNoL2FybTY0L3Rvb2xzL3N5c3JlZ8KgwqDCoMKgwqAgfMKgIDQgKysrLQ0KPiDCoGRy
aXZlcnMvaXJxY2hpcC9pcnEtZ2ljLXY1LmMgfCAzMyArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0NCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDUgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC90b29scy9zeXNyZWcgYi9hcmNo
L2FybTY0L3Rvb2xzL3N5c3JlZw0KPiBpbmRleCA5NGJmMDY1YzhhYzcxLi5lMmQzN2VlMjIxYjg0
IDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybTY0L3Rvb2xzL3N5c3JlZw0KPiArKysgYi9hcmNoL2Fy
bTY0L3Rvb2xzL3N5c3JlZw0KPiBAQCAtMzc2MSw3ICszNzYxLDkgQEANCj4gU3lzcmVnCUlDQ19D
UjBfRUwxCTMJMQkxMgkwCTENCj4gwqBSZXMwCTYzOjM5DQo+IMKgRmllbGQJMzgJUElEDQo+IMKg
RmllbGQJMzc6MzIJSVBQVA0KPiAtUmVzMAkzMToxDQo+ICtSZXMwCTMxOjMNCj4gK0ZpZWxkCTIJ
TElOS19JRExFDQo+ICtGaWVsZAkxCUxJTksNCj4gwqBGaWVsZAkwCUVODQo+IMKgRW5kU3lzcmVn
DQo+IMKgDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLWdpYy12NS5jIGIvZHJp
dmVycy9pcnFjaGlwL2lycS1naWMtDQo+IHY1LmMNCj4gaW5kZXggYWMyZDQyM2IxNzIzOS4uNDY2
OWU0MDM1NmVhZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1naWMtdjUuYw0K
PiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLWdpYy12NS5jDQo+IEBAIC04LDYgKzgsNyBAQA0K
PiDCoCNpbmNsdWRlIDxsaW51eC9hY3BpX2lvcnQuaD4NCj4gwqAjaW5jbHVkZSA8bGludXgvY3B1
aG90cGx1Zy5oPg0KPiDCoCNpbmNsdWRlIDxsaW51eC9pZHIuaD4NCj4gKyNpbmNsdWRlIDxsaW51
eC9pb3BvbGwuaD4NCj4gwqAjaW5jbHVkZSA8bGludXgvaXJxZG9tYWluLmg+DQo+IMKgI2luY2x1
ZGUgPGxpbnV4L3NsYWIuaD4NCj4gwqAjaW5jbHVkZSA8bGludXgvd29yZHBhcnQuaD4NCj4gQEAg
LTk3NCwxNCArOTc1LDE2IEBAIHN0YXRpYyB2b2lkIGdpY3Y1X2NwdV9kaXNhYmxlX2ludGVycnVw
dHModm9pZCkNCj4gwqB7DQo+IMKgCXU2NCBjcjA7DQo+IMKgDQo+IC0JY3IwID0gRklFTERfUFJF
UChJQ0NfQ1IwX0VMMV9FTiwgMCk7DQo+ICsJY3IwID0gcmVhZF9zeXNyZWdfcyhTWVNfSUNDX0NS
MF9FTDEpOw0KPiArCWNyMCAmPSB+SUNDX0NSMF9FTDFfRU5fTUFTSzsNCj4gwqAJd3JpdGVfc3lz
cmVnX3MoY3IwLCBTWVNfSUNDX0NSMF9FTDEpOw0KPiDCoAlpc2IoKTsNCj4gwqB9DQo+IMKgDQo+
IC1zdGF0aWMgdm9pZCBnaWN2NV9jcHVfZW5hYmxlX2ludGVycnVwdHModm9pZCkNCj4gK3N0YXRp
YyBpbnQgZ2ljdjVfY3B1X2VuYWJsZV9pbnRlcnJ1cHRzKHZvaWQpDQo+IMKgew0KPiDCoAl1NjQg
Y3IwLCBwY3I7DQo+ICsJaW50IHJldDsNCj4gwqANCj4gwqAJd3JpdGVfc3lzcmVnX3MoMCwgU1lT
X0lDQ19QUElfRU5BQkxFUjBfRUwxKTsNCj4gwqAJd3JpdGVfc3lzcmVnX3MoMCwgU1lTX0lDQ19Q
UElfRU5BQkxFUjFfRUwxKTsNCj4gQEAgLTk5MSwxOSArOTk0LDQxIEBAIHN0YXRpYyB2b2lkIGdp
Y3Y1X2NwdV9lbmFibGVfaW50ZXJydXB0cyh2b2lkKQ0KPiDCoAlwY3IgPSBGSUVMRF9QUkVQKElD
Q19QQ1JfRUwxX1BSSU9SSVRZLCBHSUNWNV9JUlFfUFJJX01JKTsNCj4gwqAJd3JpdGVfc3lzcmVn
X3MocGNyLCBTWVNfSUNDX1BDUl9FTDEpOw0KPiDCoA0KPiAtCWNyMCA9IEZJRUxEX1BSRVAoSUND
X0NSMF9FTDFfRU4sIDEpOw0KPiArCWNyMCA9IHJlYWRfc3lzcmVnX3MoU1lTX0lDQ19DUjBfRUwx
KTsNCj4gKwlpZiAoIShjcjAgJiBJQ0NfQ1IwX0VMMV9MSU5LX01BU0spKSB7DQo+ICsJCWNyMCB8
PSBJQ0NfQ1IwX0VMMV9MSU5LX01BU0s7DQo+ICsJCXdyaXRlX3N5c3JlZ19zKGNyMCwgU1lTX0lD
Q19DUjBfRUwxKTsNCj4gKwl9DQo+ICsNCj4gKwlyZXQgPSByZWFkX3BvbGxfdGltZW91dF9hdG9t
aWMocmVhZF9zeXNyZWdfcywgY3IwLA0KPiArCQkJCcKgwqDCoMKgwqDCoCBjcjAgJg0KPiBJQ0Nf
Q1IwX0VMMV9MSU5LX0lETEVfTUFTSywNCj4gKwkJCQnCoMKgwqDCoMKgwqAgMSwgMTAgKiBVU0VD
X1BFUl9NU0VDLCBmYWxzZSwNCj4gKwkJCQnCoMKgwqDCoMKgwqAgU1lTX0lDQ19DUjBfRUwxKTsN
Cj4gKwlpZiAocmV0KSB7DQo+ICsJCXByX2Vycl9yYXRlbGltaXRlZCgiQ1BVIGludGVyZmFjZSBs
aW5rIHRpbWVvdXRcbiIpOw0KPiArCQlyZXR1cm4gcmV0Ow0KPiArCX0NCj4gKw0KPiArCWNyMCA9
IHJlYWRfc3lzcmVnX3MoU1lTX0lDQ19DUjBfRUwxKTsNCj4gKwljcjAgfD0gSUNDX0NSMF9FTDFf
RU5fTUFTSzsNCj4gwqAJd3JpdGVfc3lzcmVnX3MoY3IwLCBTWVNfSUNDX0NSMF9FTDEpOw0KPiAr
DQo+ICsJcmV0dXJuIDA7DQo+IMKgfQ0KPiDCoA0KPiDCoHN0YXRpYyBpbnQgYmFzZV9pcGlfdmly
cTsNCj4gwqANCj4gwqBzdGF0aWMgaW50IGdpY3Y1X3N0YXJ0aW5nX2NwdSh1bnNpZ25lZCBpbnQg
Y3B1KQ0KPiDCoHsNCj4gKwlpbnQgcmV0Ow0KPiArDQo+IMKgCWlmIChXQVJOKCFnaWN2NV9jcHVp
Zl9oYXNfZ2NpZSgpLA0KPiDCoAkJICJHSUN2NSBzeXN0ZW0gY29tcG9uZW50cyBwcmVzZW50IGJ1
dCBDUFUgZG9lcyBub3QNCj4gaGF2ZSBGRUFUX0dDSUUiKSkNCj4gwqAJCXJldHVybiAtRU5PREVW
Ow0KPiDCoA0KPiAtCWdpY3Y1X2NwdV9lbmFibGVfaW50ZXJydXB0cygpOw0KPiArCXJldCA9IGdp
Y3Y1X2NwdV9lbmFibGVfaW50ZXJydXB0cygpOw0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVybiBy
ZXQ7DQo+IMKgDQo+IMKgCXJldHVybiBnaWN2NV9pcnNfcmVnaXN0ZXJfY3B1KGNwdSk7DQo+IMKg
fQ0KDQpBZnRlciBkaXNjdXNzaW5nIHRoaXMgb2ZmbGluZSB3aXRoIExvcmVuem8gYW5kIE1hcmMs
IEkndmUgZGVjaWRlZCB0bw0KZHJvcCB0aGUgc2V0dGluZyBvZiB0aGUgTElOSyBpZiBpdCBpcyBp
bmFjdGl2ZS4gVGhpcyBpcyBub3QgYSBjYXNlIHdlDQpleHBlY3QgdG8gc2VlLCBzbyBpdCBtYWtl
cyBsaXR0bGUgc2Vuc2UgdG8gYWRkIGRlYWQgY29kZSB0byBoYW5kbGUgdGhlDQpjYXNlLg0KDQpJ
bnN0ZWFkLCBJJ3ZlIHJlLXNwdW4gdGhpcyB0byBqdXN0IHByZXNlcnZlIHRoZSBvdGhlciBiaXRz
IGluIHRoZQ0KcmVnaXN0ZXIgd2hlbiB3cml0aW5nIHRoZSBFTiBiaXQgKHNvLCBkb2luZyBhIHJl
YWQtbW9kaWZ5LXdyaXRlKS4NCg0KdjIgaXMgaGVyZToNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xrbWwvMjAyNjA5MDcxNjQ5NDUuNzE0NTQ1LTEtc2FzY2hhLmJpc2Nob2ZmQGFybS5jb20NCg0K
VGhhbmtzLA0KU2FzY2hhDQo=
