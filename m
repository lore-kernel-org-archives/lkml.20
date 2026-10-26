Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.167.118
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793001595;
	b=msmLrcrm8RuZCgQkBkEjReU+4H+xgrGZJXk2EPRZPXvBGXlL+7YcGYYWEhQl7JdfDdqF
	 6Q09cgw6Ri4kWhVQY4Ljzxs5QUVHf/huk4Jkn78BEfb0ZH6HrimuM4ozOWiNbcekpJg/F
	 D9RDQs+RNaQunND+ecuN+ymJXWGX+TnEvGZapGdGl4abcgZAmK9OIRN5vPCf/YV3Uroq5
	 thLusafXDpXo94oa6tNtob4mYvWPqYx8PhYX0nDZjiaYmfUaggXSpfkb/9xDfDFISc7ar
	 ROsb4dX/CQ4p2Ky3+ZXqm+MHF9q0Wqkm1+I+Isdd0yAGe7JiMf7n+X4LN4VfTm1wWqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001595;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:X-SEPP-Suspect:Received:Received:Received:Received:Received:
	 Received:X-MS-Exchange-Authentication-Results:Received-SPF:Received:
	 Received:Authentication-Results-Original:Received:Received:Date:From:
	 To:CC:Subject:In-Reply-To:Message-ID:References:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam-Untrusted:
	 X-Microsoft-Antispam-Message-Info-Original:
	 X-Forefront-Antispam-Report-Untrusted:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-CodeTwo-MessageID:
	 X-CodeTwoProcessed:X-EOPAttributedMessage:
	 X-MS-Exchange-Transport-CrossTenantHeadersStripped:
	 X-MS-Office365-Filtering-Correlation-Id-Prvs:
	 X-Microsoft-Antispam-Untrusted:
	 X-Microsoft-Antispam-Message-Info-Original:
	 X-Forefront-Antispam-Report-Untrusted:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-SEPP-CCCVersion:
	 X-MS-Exchange-SkipListedInternetSender:
	 X-MS-Exchange-ExternalOriginalInternetSender:
	 X-MS-Exchange-Transport-CrossTenantHeadersStripped:
	 X-MS-PublicTrafficType:X-MS-Office365-Filtering-Correlation-Id-Prvs:
	 X-SM-ruleversion:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=PqmLFrklaGj1tgBoifTpziYB0HSTYf5rZmYQ2BBHovo=;
	b=WkbfuRIU28wRCqXxxh7XWTTftMKMpFlWJKXGUQJhcN4KehxQOb23OyBMnh6kZN4cSLsx
	 gkjEMydBIeh5jUK1L0V7pGomkKxy0R+k3bitLoQpr29tNxUvft+yxcAjI8ddrjVJka73c
	 WrdbpbFuhEPvNlGEUwddPpVhhZ1ccfwCtcQr4rMMX+r5Z1SIoDkxBHzFDGvWNEYO1FF7L
	 /63w2DogAMb43EVbM1x/kSnUohRjbnrvUHyqT+GBzhGmxxK60AKfqC5ghnqTHNgvFoQFV
	 QrzdQlYZi76of6seL0w5F92iowyvYKEHgLyCc5Ey+ls8/b6uXrsx2w3/oKAYjo8uqYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=duagon.com;
	spf=pass smtp.mailfrom=duagon.com;
	dkim=pass header.d=duagon.com header.i=@duagon.com header.a=rsa-sha256 header.s=selector1 header.b=EANItDgz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.167.118
Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11021118.outbound.protection.outlook.com [40.107.167.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E98606A322
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7E98606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=duagon.com header.i=@duagon.com header.a=rsa-sha256 header.s=selector1 header.b=EANItDgz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N6OQLGvDNgM97HtCiyPenDMrRcVJ2rMtfwL8Cpo/sNDbx3tp3VZp8DhuvaEIicsLoJqDaSlAs9n4S1iUhYmxsgrf4mYERKQXwxfTJkBjRFH7+V5Mrh2+qaiaXvw8k2J3NV8G8d0iOop2g4iTTvPtUzP/PFCGwV8hTnRmLlL72/VT82uNL+VtebY4VnuARsfdiWlHnzE+vNsUGD4ZVYWKOTF6acDTf1nGZR7qaKhq59ah35FASewzixcY/eq17vub4mi+t2F62yVP8dnrXsr7VXXDA3l/rSAMNmiqvy0zX/MN3ZdbyLUtiYkq/pdphdK3EHd/StrGuEx4cRDStqK2uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PqmLFrklaGj1tgBoifTpziYB0HSTYf5rZmYQ2BBHovo=;
 b=uWyr3ibVyKkLFUDml6InNBMthN1TLPPUlkCzbvqg1X/NZwP3T2tz6pJszlGQ757+yQJKZCET6xnyys9LKG0WVWBPpqu0GWNA8JdZltC7DXiCW0P2icJ9UJyhDj5meZ20iZ0SLQ1xSzgSvUhseC4+HS2VI3mrkaYkY3jyj52C5ixDGE+jCnTAhUFTv/DQYsj1BpoX1Xzz412y68VpwQ/r12stcM9GHTZYADp3e76410YZfMwJMqAdjUL+y4W71k2n2XLCMeh33T4+0qBNvMDdUatx1WKgw7mtP3P5D8TQq+jUCRcqoa1w0FoocSBQ/rlpK3A6CKozDwy+0aLFS10B7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.85.28) smtp.rcpttodomain=gmail.com smtp.mailfrom=duagon.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=duagon.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqmLFrklaGj1tgBoifTpziYB0HSTYf5rZmYQ2BBHovo=;
 b=EANItDgz8PKtks9U7ZMfYHXL2Zl+BTEI/q6Vmgg69HsrQKRihhJV2aSGcrOkHv3I9F/evSikh+ea3btWXXJYHV1Uj/LyV2OBsVYdVEnC1F9BL0OFnNygsQ8UwHGRi8PP95sLqUEOaX7W36Khw04cycD1JTpuaq3jVsxcEYunwvs=
Received: from FR0P281CA0251.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:af::17)
 by ZR1P278MB1037.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 07:59:48 +0000
Received: from ZRH2EPF00000151.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:d10:af:cafe::ab) by FR0P281CA0251.outlook.office365.com
 (2603:10a6:d10:af::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.7 via Frontend Transport; Mon, 26
 Oct 2026 07:59:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 40.93.85.28) smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.85.28 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.85.28; helo=ZRZP278CU001.outbound.protection.outlook.com;
 pr=C
Received: from hz-deliver01.de.seppmail.cloud (162.55.72.219) by
 ZRH2EPF00000151.mail.protection.outlook.com (10.167.241.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Mon, 26 Oct 2026 07:59:48 +0000
Received: from hz-glue03.de.seppmail.cloud (unknown [10.11.0.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-deliver01.de.seppmail.cloud (Postfix) with ESMTPS id 4jCmHm4WDWz4vVZ;
	Mon, 26 Oct 2026 08:59:48 +0100 (CET)
Received: from hz-glue03.de.seppmail.cloud (unknown [172.18.0.8])
	by hz-glue03.de.seppmail.cloud (Postfix) with SMTP id 4jCmHm43mFz1wVW;
	Mon, 26 Oct 2026 08:59:48 +0100 (CET)
X-SEPP-Suspect: 1906b672c95a4dbaabf7ad3f77789e02
Received: from hz-scan07.de.seppmail.cloud (unknown [10.11.0.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hz-glue01.de.seppmail.cloud (Postfix) with ESMTPS id 4jCmHm3PqZz22x1;
	Mon, 26 Oct 2026 08:59:48 +0100 (CET)
Received: from hz-scan07 (localhost [127.0.0.1])
	by hz-scan07.de.seppmail.cloud (Postfix) with SMTP id 4jCmHm2s5Yzmt8;
	Mon, 26 Oct 2026 08:59:48 +0100 (CET)
Received: from hz-m365gate03.de.seppmail.cloud (unknown [10.11.0.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-scan07.de.seppmail.cloud (Postfix) with ESMTPS;
	Mon, 26 Oct 2026 08:59:47 +0100 (CET)
Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17011028.outbound.protection.outlook.com [40.93.85.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by hz-m365gate03.de.seppmail.cloud (Postfix) with ESMTPS id 4jCmHk3nyQz21qL;
	Mon, 26 Oct 2026 08:59:46 +0100 (CET)
Received: from GV0P278CA0031.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:28::18)
 by ZR0P278MB1296.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:83::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 07:59:43 +0000
Received: from GV1PEPF000006F9.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:28:cafe::32) by GV0P278CA0031.outlook.office365.com
 (2603:10a6:710:28::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Mon,
 26 Oct 2026 07:59:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 20.79.220.33) smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 20.79.220.33 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.79.220.33; helo=de1-emailsignatures-cloud.codetwo.com; pr=C
Received: from de1-emailsignatures-cloud.codetwo.com (20.79.220.33) by
 GV1PEPF000006F9.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Mon, 26 Oct 2026 07:59:42 +0000
Received: from ZRZP278CU001.outbound.protection.outlook.com (40.93.85.27) by de1-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Mon, 26 Oct 2026 07:59:42 +0000
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=duagon.com;
Received: from GV0P278MB0621.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:40::10)
 by ZR0P278MB0743.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:4f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 07:59:39 +0000
Received: from GV0P278MB0621.CHEP278.PROD.OUTLOOK.COM
 ([fe80::de7b:48d4:13f2:1732]) by GV0P278MB0621.CHEP278.PROD.OUTLOOK.COM
 ([fe80::de7b:48d4:13f2:1732%3]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 07:59:39 +0000
Date: Mon, 26 Oct 2026 08:59:19 +0100
From: Filip Jensen <dev-Felipe.Jensen@duagon.com>
To: Johannes Thumshirn <morbidrsa@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    linux-kernel@vger.kernel.org, Filip Jensen <dev-Felipe.Jensen@duagon.com>
Subject: Re: [PATCH 0/1] mcb patch for next round
In-Reply-To: <cover.1791206167.git.jth@kernel.org>
Message-ID: <19804b63-1c41-e6f1-bf53-3ec8a7a4b4e9@duagon.com>
References: <cover.1791206167.git.jth@kernel.org>
Content-Type: text/plain; charset="US-ASCII"; format=flowed
X-ClientProxiedBy: ZR2P278CA0034.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::15) To GV0P278MB0621.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:40::10)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV0P278MB0621:EE_|ZR0P278MB0743:EE_|GV1PEPF000006F9:EE_|ZR0P278MB1296:EE_|ZRH2EPF00000151:EE_|ZR1P278MB1037:EE_
X-MS-Office365-Filtering-Correlation-Id: dce36e5f-7bd4-4b92-d0e7-08df33371b9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|38350700014|11063799006|56012099006|261021123027099003|261021121427099003|261022075727099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 gtjA1qqpFYyYqTgLSfDq4qEzM5YHSlx7YOfYXnZGFhs/H2u41mtizQBG8k2H+KwrVlRVV6IxyGpawn8dQDLKxXCZ9fR/56v1SKljA6rqY7JqEN2R2Jd1upz/3er76eLNPvQu1e71Sd+6D+qfKu4YkDjuK7Tde58KS2Cl18osQXHloG+pvcJ+nJ9F9nx5e4/FlSj17n+ySDjmL5bdmrMhTCBgir+N+E04PaFs8YMEh1oLPha2gnAVYTdGQpLyXBzJvUwaQgkEHUwz/vlgbfAuMmElTyurbdKHX8AFJOzMIRTP39GvTULLuBRbXwpWJ3xz6z2z16fL/pn4y9+SnxkhcZ58+eWyozMC78GwgaOW32kyuiiXuaHjHEejPLVbs1Kfn/mn6wViB0n9Sq0OMFeQyigCvFdjapDn7wCQSGgUFyzz0xhm8FQg0cqYf5anuyg/NwdMD4L5/uEov6NnTLXN6FgPZ9n08MVXi5WPa1S3zUogLzVcEw9J7VEKepy/eKMMk2c/D9aWQfJ0HVbu00vZyu8TXLLqDYyADphuk58rlAdhix/zdu3rfFnkv1emVtfEr6duP12l2y8HhSh+BdKF3gF5BRTe01CS7/YSW2q2hcl77JSZ3Axu65HxgwGtiGZvJpj28FdkElzLARGOKHnbSwAyZr8xZ2ek426QYAnod5FNDOo4AxWueeyqJ0+zqoYXMDhXKUXEesJO9uobK92UvwRlJ5cMOPPhkQhtlq7smfc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV0P278MB0621.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022075727099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: z0CPT22pnD+pi5zQ11S1uYRQBk0i0lw5IIwCqE9k4DU9cPX6HKdENZeHmevz27XljgGHfHsM1T7ZidL/wsJieN9fkkCEr+qnlv3xUMoHkD5F1C0xRBhZq53YJ2ZtdKlP3Qql7sYzQzKkr39q8C/SmXcw0LzLEavFVgvuYA1TUHzLc8/Fn7mfx1w8QvyhWN977YRSLxlXLf43zOei0eHcSZePeu7ZP+j6+swxZqamxj+DMczgADQbRP0fVcywseZ042ZCbmtCvbtQto7ZUy5ERMHIyPgZRyOlR2ybEjgtVjOuPM7NODlGohuWJvXhncAHG6lWbTQo3gvYNPAHXfKYNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0743
X-CodeTwo-MessageID: 8f23c9b1-4f2f-440c-a1bd-ee1e03c77af9.20261026075942@de1-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 1
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 GV1PEPF000006F9.CHEP278.PROD.OUTLOOK.COM
X-MS-Office365-Filtering-Correlation-Id-Prvs:
 0aebf27c-73e5-4074-93db-08df333715ce
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|35042699022|82310400026|36860700016|23010399003|14060799003|1800799024|11063799006|56012099006|261021123027099003|261021121427099003|261022075727099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 SWKWdZP1CFswYVye1Hod1Dyd4olMjdiesSXzBJILvyNGlwl2wPqEXsnCvyQaa6WzK2gpqNHj9/K1h350/L3jbwEa3nUw7sH4RDyG5hVWA00Q++aEJvk3ESrfODNfrAUaXilvwbosM4IDE+i7UhiAuhy7F6b72eki9bn9/ZJ3HdwYWxjPMfQ1yGoW/4vQNrPdmEJ6HEnm5lhjuEqIVe7g9l//wGqZRVILjDxkcEjbO4H3k07jlmhKP/FMG7K5b1p3AMXZvtDO0o8BljJcYhyKg4s/HkuDQMNCDzQNqHfat6urJxzB80oKpq+lFw+kzUdpnhArbzUIrIoMbCGIJrtnHyK3aIncFvpnRBRRndVYEpQWUo6ByDwY+wIdMpOWCvrkucOkjrLDLJ9ARUAS7IzdnWhyS711xeNrGPxHhrJ7x73PcqLJUJK8CcBBjqBZ5w0VYw7jIwB/PxXqvSwiPQicYQi6ug7uEGco/hjKDcMobKF1EHzl6JMUpnBEhoHU29/+ac1IAbha285VbndT9zsANwzcS2aFonNwaqhNceALF9GQm6oQ8sq4m3kku2BDA+rauFHXfVgppV2+XoUOntjPvY/mp5qTdpgQPEXLhe5SK6PZPP2+JrfFDryn2Rw3NPJjJkWzOWH6jV34sZutYmuizgZ490hXIxQJn9smuh94IgmOcZO34/Hfd6Y7GrKFurOTH6s4jursI98OAu4rDWF+MA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:20.79.220.33;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:de1-emailsignatures-cloud.codetwo.com;PTR:de1-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(376014)(35042699022)(82310400026)(36860700016)(23010399003)(14060799003)(1800799024)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022075727099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB1296
X-SEPP-CCCVersion: 2026-07-16T14:50:29+02:00 96be5760
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.85.28];domain=ZRZP278CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.85.28];domain=ZRZP278CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 ZRH2EPF00000151.CHEP278.PROD.OUTLOOK.COM
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7e221cb1-9151-4558-bc56-08df3337181a
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|156008|376014|35042699022|1800799024|18002099003|22082099003|56012099006|5063699009|11063799006|261021121427099003|10067099003|261022075727099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g/vFRL3KJAd8/UWDh748RId/UFkll9NY+/XH3KJKMebl0sB2nsjmIjWTHb6k?=
 =?us-ascii?Q?OBn59cfEieDK0HnsCPUP0wDgwWrCkerK8ne3exWwPBvZ+x++M4Bo3RSDgsOz?=
 =?us-ascii?Q?5t/LoHp78y7JiqJdZJk7Wnrircc24Sax5HD0wp+DnyCdEISz54TtjC66DtyW?=
 =?us-ascii?Q?dhOpGhkzdZZVO82GpGmyVmRiaWOltGWSRFZhptnu8drbIGPOiK5ErVkM6uJO?=
 =?us-ascii?Q?vCYwEts4QwgXbrIseyq+QJscat8xl9qRKeusJsv40MFqiXmPFE96No8VuyOr?=
 =?us-ascii?Q?XVDHlweSd0VmsFKAHprZ3GREJesaL+QYrYCEXTPWf+DnVXZIEUpaMROVJk1u?=
 =?us-ascii?Q?z11d9THuNwDGdWd8NACWYSzvw9cCWYSA+Gu/eoOQPYoX8MyQNkdB4YhciNdV?=
 =?us-ascii?Q?hBCH0ATzzFQQ8Ho5TuWqvEexzSe+/vDBNjANmJusW5o1NbL0kGZIEExw3SU4?=
 =?us-ascii?Q?iyDwUH/d4LgMAAS28q7u9rpqlE4uo8kH4pMMwolAy3dE7OoS9T/U1KNnecF2?=
 =?us-ascii?Q?78GTgGIIDvDlWwS7IJswTQyXUoHBZ1LWDhUgbn5h9aEK9tFPh968ilZ0buT7?=
 =?us-ascii?Q?kjiWKq1tOzwDOiqNN5FFHhbFi/N2PKRf5vFb//nyjVn2CGGmOSGKdJKwk2B3?=
 =?us-ascii?Q?bp3tKfoFScZSEmJhm2WR0Lv+LXMWNEHjJCRTgYbsf7K9sBCucQ/AvM8O6JSW?=
 =?us-ascii?Q?WwwpG2crIopQ9Vbxr9ad32AvTIR9N0ES6sCJ76S/O0uIrNYfaeLkwMMtBYT/?=
 =?us-ascii?Q?Wp344+ARfkv8R1WaznMLG352Jl/OGyadvJh/7p62ewjPxWXhD3OqyJQ5hjmN?=
 =?us-ascii?Q?G19jBTE90RhJBJ9rHOgajF1X11Jm3Wzbd+K37plTRHpU4ESxIsuZvB/UQMDh?=
 =?us-ascii?Q?zBl+ZGAAO10bydhPR4gEEZy0ESV9TeGfkXK2RnqCOE+BAgjmVSnqGr0eAF/L?=
 =?us-ascii?Q?/H8+zEN8Vtn6Hk0w0QE0Yw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:162.55.72.219;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRZP278CU001.outbound.protection.outlook.com;PTR:mail-switzerlandnorthazlp17011028.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(156008)(376014)(35042699022)(1800799024)(18002099003)(22082099003)(56012099006)(5063699009)(11063799006)(261021121427099003)(10067099003)(261022075727099003)(261021123027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kPSCixeBtsh11KVoyr2D0BY3bGEuW6rgMCpDoYOwxrcvY7AyBolVub4vxtpXsXM05ZzGJuZ17CStwW42lF3fIz41tw4loK7lj8G/WUd+VHC5qJxo9D9FhSv1+a7bHQKFjCoVLYB2O7c9gDFeQgB0DeHpsST2I4a5e0XxBOHY2gudVbPP3vKchTsWi1q/DX1sb2Z7KHtLx4/EcjyYq7IgmgWAimBNROK+Twlw7MxMqSrwLKlzPipqypZ5lWvtyBJMA0xDOF+zeRj+kwFI7a3cAtN4dStq65+KTkE/VyUPIo3S+7qqaIK/0hL4kEavh0GoOXb55sNarbsxTDxOMIGJC/v4mT/dZce1DbTNLY+rDHNeKTNQ92Wm/TnsrigrDYpbPp5qt4aJ7p2bdQbo6PrS2wy6sxZfJMKDjll0uuIOH1PV9XPBk3qFDaJfshpfUiF7
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 07:59:48.8558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dce36e5f-7bd4-4b92-d0e7-08df33371b9b
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[162.55.72.219];Helo=[hz-deliver01.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource: ZRH2EPF00000151.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB1037

Mr. Kroah-Hartman:

This is a friendly ping for this patch that was accepted some weeks ago.

Thank you very much in advance.

On Mon, 5 Oct 2026, Johannes Thumshirn wrote:

> Hey Greg,
>
> here's a mcb patch I forgot to forward you. Thanks Filip for catching my
> mistake.
>
> Filip Jensen (1):
>  mcb: fix kasan read slab out of bounds
>
> drivers/mcb/mcb-parse.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
> -- 
> 2.51.0
>
