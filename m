Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=2 smtp.remote-ip=52.101.70.37
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794324015;
	b=uthjkRlJ6D7AmXmKMR5/msHEL6/I1hBw9Q+/gxHelpC0Ew5Gt/+8MjCDkL4oWJf5iIPl
	 COIVhCf4ls4M0cnlc7Eca36aH8KrVsFoUqJENtyj8oUr2TGxXbz9GloMmvIbLAgoxH9lg
	 1+EF+XZko91TUB6547jk35fK5v9wTPFxRCHWHLpvpbImAiaSxeEdGnxToY0dhd+he9cwI
	 DfiXUSuEm/W46sw2pE7PDyxTIgIU2bsfELfR8KCiygkOUcHVQa7wF2b7KRrfftfsUw0d/
	 aAsY+4Q85dXGA2k4/S0dZ0DPavQC6mVHfz+8tNUYvLULxj98y5MfbnHorFYRQntJZMg==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324015;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 Authentication-Results-Original:x-ms-traffictypediagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 x-checkrecipientrouted:nodisclaimer:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam-Untrusted:
	 X-Microsoft-Antispam-Message-Info-Original:
	 X-Forefront-Antispam-Report-Untrusted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-EOPAttributedMessage:
	 X-MS-Exchange-Transport-CrossTenantHeadersStripped:
	 X-MS-PublicTrafficType:X-MS-Office365-Filtering-Correlation-Id-Prvs:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=EBA3O3WuBXrmCFhk3xR5JpBf6bi0bHoIglH05xiA7BI=;
	b=2rwdO+qGPe/S7O3IOYuqrp5d6Bi41p928PZSKhnfxNJQiviw6nhtXmRjadC5Qs6qRA6P
	 +2CYBMX7pXPKKRh7yzAVc1ZhWEZSzNhSy5ojv5EfGhPq8UtYojVl/yv4bIpZaX618akTI
	 hMP4HbPks70XmfJzfF2XRc0qHM7YYgKrt+KtwxzYhpDUpgyuL1yrAlVG3jRRKjG9FiUk0
	 z9J4T0VglBFQuEhezmdlj+5ZEE4uwkN91cvEO7RHdsBBQWAK78nZaYbwxRRnuTr9VwsXp
	 SY5HbP+n/XTCf3QR/CRIOVhfAoAFbwBiRIthuBCZ75DFug6/RHmX/tPxGZda9gcyLiA==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=ZgTT9Nh+;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=ZgTT9Nh+;
	arc=pass header.oldest-pass=2 smtp.remote-ip=52.101.70.37
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011037.outbound.protection.outlook.com [52.101.70.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DD160A2603;
	Tue, 10 Nov 2026 15:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67DD160A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=ZgTT9Nh+;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=ZgTT9Nh+
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=d2cv46GWwm8NXOMF6XZu2bPg6x3p0im09prlla+hLEuheelRLSzPpOK4hgZFr82hiBPe8JBssE8z2VNkm/ZUu+YJ9d0i0QxLKKdyW8fMv8yye77VN94jZYPGpmunL66LVNVxE4/gzUrRJejp3Sj2oHx37Pa7/FEsw4wW1WeZo8wIZtBQEyhz0jLaIsTbMJYj5w1gh05sH9gDgDtXKxcBaEtMUOMn5D01lmYXF0VIbwDxIQ1y8qYScrxPPHRgn+Bpl1xqseKngjJsyfShLSUORbdDBaJgDr1Yght0W4iyWTHnIhWbu1etdaLsCb6ohjGsuJ2hNQ40+BYhGq1diFpDNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBA3O3WuBXrmCFhk3xR5JpBf6bi0bHoIglH05xiA7BI=;
 b=q6lvHTCZTbS4D28iLaV98cr2dDLIdor9UUigAJkSZwG/Hgj/3Rv1BrfwgVSjl4eIA4kSFm5BH5Oalu/WFz3Q+zcPFqHRpflF10vJFq8e9COLbNhlnyWvMByTRsBEZ/AMa0zd1C0ADj1rUS+GWpiCytlyv7sspl9Icera6DEQw59p2JWNAyE8nxKgO99arKshXeqtsTRv95OxW2XSQ2yP8hZf2iHto2TRDYmvzrM2qP3seS/REfLnL2mluWuwwAWpRKvaOKXwBb7Yw1vBV+laz4R3GqYuCiXCto19k7rRO6Wegpm16fRrUvEBZdoVVijHpVoVIKeNGAuQRzAPcAPFuQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=fb.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBA3O3WuBXrmCFhk3xR5JpBf6bi0bHoIglH05xiA7BI=;
 b=ZgTT9Nh+11+9/X33hYHj2rysPzr0blUwt1Pzz44zwWzplAPCitEkKH6kpXuoYnrD8tnkTIz11ru7xhkJ4cHS6nhdI2Qqskz/uLdFym5VualMOma1MlDsKvKN3XnOpD1TMGxrFjxjIs7hKWQw0TRlGd675AM85Wu4QfzqfuS280M=
Received: from MA2P292CA0026.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::12) by
 GV2PR08MB8193.eurprd08.prod.outlook.com (2603:10a6:150:78::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.9; Tue, 10 Nov 2026 15:20:03 +0000
Received: from MAD0EPF000008BC.eurprd04.prod.outlook.com
 (2603:10a6:250:0:cafe::b) by MA2P292CA0026.outlook.office365.com
 (2603:10a6:250::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Tue,
 10 Nov 2026 15:20:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MAD0EPF000008BC.mail.protection.outlook.com (10.167.241.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Tue, 10 Nov 2026 15:20:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tD58GmAQIpNY9zcmdlGEUBnzcfk8i6h4QH7i+o4TLoZGasxhk6V4gnVqIp7wrR11laPsgsHyyhLCVNLrEikug/E9NdF3566KtbQokZBTaJRbniPzSwUsMuAqcG+PVs1NAmWyjNVepUyXFGA5rvPr99Cjvv8AVGQJhsTGW7ppAm7X/7LycRie8dNCyoUyDuQktWRQztlk8YXsiFC0WUSUvFIkl1TQqPQmM0tcWRIKDbH1vWnGKkcrpWH0iABogNYq/zSRzf2/lpCgsQ4D2CSEtuA/TTTB0o8izBigHM9cnbMRvPTt6J9aJVulDb4z6/0IpPaTpV62j71aq2S+mdXfkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBA3O3WuBXrmCFhk3xR5JpBf6bi0bHoIglH05xiA7BI=;
 b=HISgmfnzF1uAHMO2UwTDFWG+p69Vy7FdQRLyd10wAtOdgambGaZc7S1SUXWLqtC/zjsrkZwAkcjS540KLeqma4Y7h3jpZrJabbv01xJ7m+uI/LcuN72SLJyzUVuibbo7lRJLbSSdukZx8CrlaV9Uoj4wZvrmmhW1+Fr9aWQFdJQMFYHEQzSMsMzC+T72XoLoZTeAXnbuR0Uz+rKplpWh/b6M4xjh7lT2SRemXHpnjOVCM0bYoXmG9olrty5cY0agy4fLe/ka+MXRtwpyiBlhSY0iCdltl0tDS0boOD7DGqGoCI+KQkGZVEpszTPIZZlBbRq8/v2aCfNG3NpvBzAUgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBA3O3WuBXrmCFhk3xR5JpBf6bi0bHoIglH05xiA7BI=;
 b=ZgTT9Nh+11+9/X33hYHj2rysPzr0blUwt1Pzz44zwWzplAPCitEkKH6kpXuoYnrD8tnkTIz11ru7xhkJ4cHS6nhdI2Qqskz/uLdFym5VualMOma1MlDsKvKN3XnOpD1TMGxrFjxjIs7hKWQw0TRlGd675AM85Wu4QfzqfuS280M=
Received: from DB9PR08MB6475.eurprd08.prod.outlook.com (2603:10a6:10:253::21)
 by AS4PR08MB7831.eurprd08.prod.outlook.com (2603:10a6:20b:51b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Tue, 10 Nov
 2026 15:19:26 +0000
Received: from DB9PR08MB6475.eurprd08.prod.outlook.com
 ([fe80::3f72:27f3:535c:6663]) by DB9PR08MB6475.eurprd08.prod.outlook.com
 ([fe80::3f72:27f3:535c:6663%7]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 15:19:26 +0000
From: Mike Leach <Mike.Leach@arm.com>
To: Amir Ayupov <aaupov@fb.com>, James Clark <james.clark@linaro.org>, Leo Yan
	<Leo.Yan@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>, Alexander
 Shishkin <alexander.shishkin@linux.intel.com>
CC: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>, "coresight@lists.linaro.org"
	<coresight@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 3/4] coresight: etm4x: Report the external outputs the
 PMU counts
Thread-Topic: [PATCH v2 3/4] coresight: etm4x: Report the external outputs the
 PMU counts
Thread-Index: AQHdWp41P9DSUhwhsU+DIl5Z3p7Gzbcney0A
Date: Tue, 10 Nov 2026 15:19:26 +0000
Message-ID:
 <DB9PR08MB64752311F395D91F4FCBD0CB8C722@DB9PR08MB6475.eurprd08.prod.outlook.com>
References: <20261012230527.750567-1-aaupov@fb.com>
 <20261012230527.750567-4-aaupov@fb.com>
In-Reply-To: <20261012230527.750567-4-aaupov@fb.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6475:EE_|AS4PR08MB7831:EE_|MAD0EPF000008BC:EE_|GV2PR08MB8193:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f876634-9955-4b95-f593-08df3f3e17b4
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|366016|376014|10070799003|23010399003|1800799024|261028144727099003|261022075727099003|261022105027099003|261021121427099003|261026140227099003|261102123227099003|261021123027099003|10067099003|261026121527099003|11063799006|5023799004|261009223027099003|3023799007|6133799003|18002099003|22082099003|4143699003|56012099006|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 x8ydMDmMEWDu7Qn8jXPzESCrNjnJjaMwGb/J78zpESN9wZoulucoFljd9WAayh7vLHUqmmqbE1tK+T7W0Or0x2HzJHaOV42MSpBjRDyQvAFnwTsvGx1j64Q60oxgiFB7ByCfaymlNHYtmu0ct/nrjxt7luECJnOlIoRxa7nkTjUM/OPhM3NKyC1Ygqak14C5KxpXIfD0CQiuzmn93+BXPMR2tzgYsjxlxkg1BF9cx3j9EJVUCiYfqCfBtqaG6QkYhrfGfR/oSKM1VfOvWOxrp0132Ks7PDq+bDSgXG68CEQc5hXHbVGXtWETQ6WRyL14VvXAIIJ9LRORxKiFIH5O/jRYGm6texC5Y3uY8g2F7531Q0K3KId1Zj4sKlWaUPrPcbXvzTg/cdFVSon7ogHbMwi3PwYOk2SNu3kmzbVWEZC1uf0zrnBe0WQwPaYtzYDexRUSJtVLI/LgO85PcnL0VHYvdh8GGIxcYzt2NhwHCnm6zXGPFXdmmMvhR1ZPLljTDDghUCTwXvFxsvhN0E53ig37qXHx3NdOcc6YssebiDglvADa89wZCu9mc0n3IGgTBSNDKAHxYGxNDcvfm5RRg/ZovSDyBsWf9m79E7RtbWx2e7zg8v7vDftE/GGlHZERADbrOqBn/vIQ/Y8AIdPkgJ7pG7tutabV0VTTLByK+7Z7q+MTtS746swPOS3s9qIwUSrDJmmMtrG2++/XZFskK8E/ARQEnATTcb6EnfL/t2s=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6475.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(10070799003)(23010399003)(1800799024)(261028144727099003)(261022075727099003)(261022105027099003)(261021121427099003)(261026140227099003)(261102123227099003)(261021123027099003)(10067099003)(261026121527099003)(11063799006)(5023799004)(261009223027099003)(3023799007)(6133799003)(18002099003)(22082099003)(4143699003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 uj1MliFbiXViRdKFsVLgthv33rvjk4TsEWCFn3kc+w29TYPhRIqAzV35DjGdPV00b7GWFvyjFNGy4rk1GQ5Ff0guqlphlTbo9FWSGSec1oxdEslzIP+pf5E3Xs3oBjXxwpMTM/2MqqvJvW0svjDoLQLIi1yfGsHXtWxk/VphP219v4v7zXZndI8XB9ENgjwnhM1n/hkETfzgYHSZdW2A3HYlGB6HPXsGBZQYsdtN44HfOlxPcqB/TOCdzhpj+SlPZJQsA+otr8whrXhvojKN3ACooGkkM/MZm2a7GMLBrsOLv9Yzu0eC3bogpx2eESEfbQ2zqxsP2u6rSEw5RvrJ+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7831
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MAD0EPF000008BC.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	32672807-fe1d-47d4-c237-08df3f3e01fa
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|14060799003|1800799024|7416014|35042699022|376014|82310400026|36860700016|4143699003|261022075727099003|261102123227099003|261021121427099003|261026140227099003|56012099006|5023799004|261009223027099003|261021123027099003|261026121527099003|261028144727099003|11063799006|261022105027099003|22082099003|10067099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Aq1VC3+myBjl/qDIO5B7kNhMqvkP5i3OMM1HL/Jq9zw1XcdhAZgHoVZW2DrSjn5PoxODLts0XX0+lF6TTLB128oSBPhqTFfNfFqmIamJylf56Bmv6d738HoeqeNplUG904o6koSmUQg700e8SbMLzxZ8bkcebZh1W9LZtrC6FXhsiCqvdjzAQz0fTM6N81D0//ntjx5d9FUhdY9FJKTlzPwQpQYyHudzCsV0vd43voQ6Az2NmTkxTbeA1Xq6d6PzgvgM/is04UZQE3so6aeFpjsgcAU7XuHvLqlB/CJjfsTLE3w9uhEkDb+bf49leN2VnZDB0FCSqP5rk7MooHuWn7aVvObxbA69ykz5nCTbSPkuGRlDaNnXoeovKzL6pDguSuKBrvbcrJ2rjd/4rFSE5kpSCecF5f4OeDyrwAcOgi9lmWem+RRvqP9llwsNrI5KyibwHRlyLSbuIgpuEyUbpJlCCaZzwdPvf+4U69k3kLuVChHQBXltWlZr4EmurS7YJ7Tl0yy5bYj3tiMk1gzndh9KF1VtV0ZiqFryiSRCWF7FCjbZkZQiZTgbWqfPTVdSr78tuBRKuanDbuVtGUCZML18pvMAdStI0OgKIx9Su3h5xz0XRd1RVSP+eXKXEb1z4uMSIokP9WVRw8k9LiZNOeHxUY4F3bMj3E8v/FHmyRjamurIBYELPboD+ot5JiBCp83fdbnp0ufT2ZvWMexhxQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(14060799003)(1800799024)(7416014)(35042699022)(376014)(82310400026)(36860700016)(4143699003)(261022075727099003)(261102123227099003)(261021121427099003)(261026140227099003)(56012099006)(5023799004)(261009223027099003)(261021123027099003)(261026121527099003)(261028144727099003)(11063799006)(261022105027099003)(22082099003)(10067099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pdF2xRUSbarlccz3H5liN1bZ/cYq4ZdCuBoxaYGhcMTeOZNPvlKT6+Kbgr5DruJMYnoujJ/R3Kq11dPp6Jn7PJGzcHySqJ9l5ksuf2RPZcNgsPHqjG6zNvaHII2Ol93ud2y0p1S7JBEK1/HQlQAgPfKHEKrks2DJSDK2LDNbZbyO9BuF7DOVmjCZX5r/+nK9DBgN1TCGi1hS4QhQ9MkWySX8DX3yiZ3pZrr9d+XrNNepMeB/srSfH7xTBdBX9z7i2FmMVXP5EiZgs36R+5xOrqNrbqB8QV57KHRnARJR9PbQ07ONS1r68WwZ3RYFkwl3MdGoIj0YJ1K2JxBI9Pzli0RrrX6Xz8XeslR09rbNMUm5d+dMIwHRKzsMKOnGW16vbifaAvUYPNUE45aXP00mpasvzyCVYfWds07GCZMIbIDKf5SrGSTemMo1ovtlSUqU
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 15:20:02.6326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f876634-9955-4b95-f593-08df3f3e17b4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008BC.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8193

Hi,

> -----Original Message-----
> From: Amir Ayupov <aaupov@fb.com>
> Sent: Tuesday, October 13, 2026 12:05 AM
> To: James Clark <james.clark@linaro.org>; Leo Yan <Leo.Yan@arm.com>;
> Suzuki Poulose <Suzuki.Poulose@arm.com>; Mike Leach
> <Mike.Leach@arm.com>; Alexander Shishkin
> <alexander.shishkin@linux.intel.com>
> Cc: Jonathan Corbet <corbet@lwn.net>; Randy Dunlap
> <rdunlap@infradead.org>; Shuah Khan <skhan@linuxfoundation.org>;
> coresight@lists.linaro.org; linux-arm-kernel@lists.infradead.org; linux-
> doc@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH v2 3/4] coresight: etm4x: Report the external outputs the
> PMU counts
>=20
> Some CPUs count the trace unit's external outputs as the PMU common
> events TRCEXTOUT0-3 (0x4010-0x4013), which lets a configuration drive a
> PMU event from trace unit events. Other CPUs, Neoverse N1 for example,
> have no such events, and a feature relying on them would silently do
> nothing there.
>=20
> Detect at probe, on the trace unit's CPU, which outputs the PMU counts:
> the trace unit has an external output for each of its events
> (TRCIDR0.NUMEVENT), and from PMUv3p1, PMCEID0_EL0[63:32] reports
> which of
> the common events 0x4000-0x401f are implemented. Per the ETE
> specification, an implemented TRCEXTOUTn event counts external output n;
> only whether that output is also an external input is IMPLEMENTATION
> DEFINED.
>=20
> Add a capability match flag for each output,
> CS_CFG_MATCH_CAP_PMU_EXTOUT(n), set it on ETMs whose PMU counts
> that
> output, and show it in the feature's configfs 'matches' attribute. With
> capabilities matched separately from the device class, a feature that
> requires one only loads on those ETMs.
>=20

The ability of the PMU to count extout events is a feature of the PMU, not =
a feature of the ETM/ETE.

The capability to use extout in a configuration should be predicated solely=
 on the correctly interpreted values of TRCIDR0 and TRCIDR4 - the number of=
 available extout events.

There does not have to be a valid pmu counter for a configuration using ext=
out to work correctly - indeed the extout connections are often implementat=
ion defined and sometimes connected via coresight CTI.

If we have a use case that requires extout to trigger PMUs, then clearly we=
 have both trace software and PMU software that must be initialised and run=
.  It seems more relevant to me that the PMU software should check that it =
can count the extout when it is run, especially given the PMU command line =
detailed in the next patch is in part " -e armv8_pmuv3_0/trcextout1,aux-act=
ion=3Dpause,period=3D1000," - specifically identifying extout1 as a paramet=
er=20


> Assisted-by: Devmate:Opus-5.5
> Signed-off-by: Amir Ayupov <aaupov@fb.com>
> ---
>  .../hwtracing/coresight/coresight-config.h    |  4 +++
>  .../hwtracing/coresight/coresight-etm4x-cfg.c |  5 ++-
>  .../coresight/coresight-etm4x-core.c          | 32 +++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-etm4x.h |  3 ++
>  .../coresight/coresight-syscfg-configfs.c     |  7 ++++
>  5 files changed, 50 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/hwtracing/coresight/coresight-config.h
> b/drivers/hwtracing/coresight/coresight-config.h
> index af6ef96b9ae01..10e95f5ecc8d9 100644
> --- a/drivers/hwtracing/coresight/coresight-config.h
> +++ b/drivers/hwtracing/coresight/coresight-config.h
> @@ -35,6 +35,10 @@
>   * a device that matches one of its classes and has all of its capabilit=
ies.
>   */
>  #define CS_CFG_MATCH_CAP_MASK		0x0000ff00
> +/* trace unit external output n is countable by the PMU as TRCEXTOUTn */
> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT	8
> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT_NR	4	/*
> TRCEXTOUT0-3 */
> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT(n)
> 	BIT(CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT + (n))
>=20
>  /* flags defining device instance matching - used in config match desc d=
ata. */
>  #define CS_CFG_MATCH_INST_ANY		0x80000000 /* any instance
> of a class */
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> index e1a59b4345052..09a7a6b86968c 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
> @@ -174,9 +174,12 @@ static int etm4_cfg_load_feature(struct
> coresight_device *csdev,
>=20
>  int etm4_cscfg_register(struct coresight_device *csdev)
>  {
> +	struct etmv4_drvdata *drvdata =3D dev_get_drvdata(csdev-
> >dev.parent);
>  	struct cscfg_csdev_feat_ops ops;
> +	u32 match_flags =3D CS_CFG_ETM4_MATCH_FLAGS;
>=20
>  	ops.load_feat =3D &etm4_cfg_load_feature;
> +	match_flags |=3D (u32)drvdata->pmu_extout <<
> CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT;
>=20
> -	return cscfg_register_csdev(csdev, CS_CFG_ETM4_MATCH_FLAGS,
> &ops);
> +	return cscfg_register_csdev(csdev, match_flags, &ops);
>  }
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 2247ad55d4442..1e78774025d13 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -30,6 +30,7 @@
>  #include <linux/uaccess.h>
>  #include <linux/perf_event.h>
>  #include <linux/perf/arm_pmu.h>
> +#include <linux/perf/arm_pmuv3.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/property.h>
> @@ -1368,6 +1369,35 @@ static void etm4_fixup_wrong_ccitmin(struct
> etmv4_drvdata *drvdata)
>  	}
>  }
>=20
> +/*
> + * Find the external outputs of this trace unit that the PMU counts as t=
he
> + * common events TRCEXTOUT0-3. The trace unit has an external output for
> each
> + * of its events, and PMCEID0_EL0[63:32] reports the common events
> + * 0x4000-0x401f from PMUv3p1.
> + *
> + * Must run on the CPU that owns the trace unit.
> + */
> +static u8 etm4_pmu_extout(struct etmv4_drvdata *drvdata)
> +{
> +	int pmuver =3D read_pmuver();
> +	u64 pmceid;
> +	u8 extout =3D 0;
> +	int n;
> +
> +	if (!pmuv3_implemented(pmuver) || pmuver <
> ID_AA64DFR0_EL1_PMUVer_V3P1)
> +		return 0;
> +
> +	pmceid =3D read_pmceid0() >> 32;
> +	/* nr_event is TRCIDR0.NUMEVENT, the number of events minus one
> */

Not necessarily - this value depends on the ETM version.

> +	for (n =3D 0; n <=3D drvdata->nr_event; n++) {
> +		if (pmceid &
> BIT_ULL(ARMV8_PMUV3_PERFCTR_TRCEXTOUT0 + n -
> +
> ARMV8_PMUV3_EXT_COMMON_EVENT_BASE))
> +			extout |=3D BIT(n);
> +	}
> +
> +	return extout;
> +}
> +
>  static void etm4_init_arch_data(void *info)
>  {
>  	u32 etmidr0;
> @@ -1522,6 +1552,8 @@ static void etm4_init_arch_data(void *info)
>  	/* NUMCNTR, bits[30:28] number of counters available for tracing */
>  	drvdata->nr_cntr =3D FIELD_GET(TRCIDR5_NUMCNTR_MASK, etmidr5);
>=20
> +	drvdata->pmu_extout =3D etm4_pmu_extout(drvdata);
> +
>  	coresight_clear_self_claim_tag_unlocked(csa);
>  	etm4_cs_lock(drvdata, csa);
>  	cpu_detect_trace_filtering(drvdata);
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h
> b/drivers/hwtracing/coresight/coresight-etm4x.h
> index df9e0748d71ec..11d95a4518b88 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -979,6 +979,8 @@ struct etmv4_save_state {
>   * @nrseqstate: The number of sequencer states that are implemented.
>   * @nr_seq_ctrls: The number of sequence state transition control regist=
ers.
>   * @nr_event:	Indicates how many events the trace unit support.
> + * @pmu_extout:	Bitmap of the external outputs n that the PMU counts
> as
> + *		TRCEXTOUTn.
>   * @nr_resource:The number of resource selection pairs available for tra=
cing.
>   * @nr_ss_cmp:	Number of single-shot comparator controls that are
> available.
>   * @trcid:	value of the current ID for this component.
> @@ -1045,6 +1047,7 @@ struct etmv4_drvdata {
>  	u8				nrseqstate;
>  	u8				nr_seq_ctrls;
>  	u8				nr_event;
> +	u8				pmu_extout;

PMU connection to extout a feature of PMU not the etm. We don't want to add=
 every single extout connection use-case into the ETM driver. Wouldn't scal=
e well.

Regards

Mike.

>  	u8				nr_resource;
>  	u8				nr_ss_cmp;
>  	u8				trcid;
> diff --git a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
> b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
> index 2b40e556be872..7893d40f2e9ea 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
> +++ b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
> @@ -243,6 +243,7 @@ static ssize_t cscfg_feat_matches_show(struct
> config_item *item, char *page)
>  							struct
> cscfg_fs_feature, group);
>  	u32 match_flags =3D fs_feat->feat_desc->match_flags;
>  	int used =3D 0;
> +	int n;
>=20
>  	if (match_flags & CS_CFG_MATCH_CLASS_SRC_ALL)
>  		used =3D scnprintf(page, PAGE_SIZE, "SRC_ALL ");
> @@ -250,6 +251,12 @@ static ssize_t cscfg_feat_matches_show(struct
> config_item *item, char *page)
>  	if (match_flags & CS_CFG_MATCH_CLASS_SRC_ETM4)
>  		used +=3D scnprintf(page + used, PAGE_SIZE - used,
> "SRC_ETMV4 ");
>=20
> +	for (n =3D 0; n < CS_CFG_MATCH_CAP_PMU_EXTOUT_NR; n++) {
> +		if (match_flags & CS_CFG_MATCH_CAP_PMU_EXTOUT(n))
> +			used +=3D scnprintf(page + used, PAGE_SIZE - used,
> +					  "PMU_EXTOUT%d ", n);
> +	}
> +
>  	used +=3D scnprintf(page + used, PAGE_SIZE - used, "\n");
>  	return used;
>  }
> --
> 2.52.0
