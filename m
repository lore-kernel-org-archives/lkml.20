Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.144.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794372818;
	b=KJUB6IYUirHBQsSHugfu1UylZBKPlj/3aEspVmnq0a2bsGUxQ6XQlG2UTQDCwbv1Ql6W
	 YqM0eM1ThuTYcSFlOw3VqhkPL1C+b01apEhhe5cP9/GftO8px0211+Qg5kmbC1PJdLv9+
	 /Hpql2c0ugPj9nn70NcRsoxEZOQCvSPYx5N8YssBS70u28vZp9rRiKgK0/kXcqxI8pcnp
	 GZ8eDgmvdXlU4D+rRbXWbOpH4Dzmcjr9Llz80pMrF0luFxebTcUGm77AY/6MMY+/DO3Zk
	 Ld3N0z+3mrV+9kRmdf8XQ+rWF/wBXjaZ++npUvSHbO1yLEgUbtXI8pMprsjgEzX6How==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794372818;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:msip_labels:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ssaXF57LcMnMdiPYuNGkxgIzXcaIAOwdLGtHyVrGn3o=;
	b=KGhcOgm88Vw1Q9R/8AmRhCOTTZZVE4P6JJwOUmRlkHXA1JxHC9C1Ut15TOsrLM4vSwXz
	 4wXF2d4VWAoFjcVm96OYYmgHfzG2CoVJgmwntxUQCa23zeLjqo6CTWnB/vUg0e3EOU6tC
	 vcB1MMv56f7bpciEwtbaK+P99zaf7zJGITbF04yqoy45Fz2pG1xiQuf0MSopQ7LOoMeHx
	 +Tlnv1V4SnfpwXBOdmljS1miLU74jDR8b14UD/rOdMzeTbW05gE4bA/xHwOBFDlowtQqj
	 zI4vIfKTx8jFHuWNggtfbw5abkYD24jFqE3XAaTxSyN1SPvZcQtuGwrwYdBOAOOsLhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wsu.edu;
	spf=pass smtp.mailfrom=wsu.edu;
	dkim=pass header.d=wsu.edu header.i=@wsu.edu header.a=rsa-sha256 header.s=pp1 header.b=lt7p54JV;
	dkim=pass header.d=wsu.edu header.i=@wsu.edu header.a=rsa-sha256 header.s=selector2 header.b=WK7fof4i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.144.34
Received: from mx0a-0007b301.pphosted.com (mx0a-0007b301.pphosted.com [67.231.144.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFDC606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EFDC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wsu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wsu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wsu.edu header.i=@wsu.edu header.a=rsa-sha256 header.s=pp1 header.b=lt7p54JV;
	dkim=pass (2048-bit key, unprotected) header.d=wsu.edu header.i=@wsu.edu header.a=rsa-sha256 header.s=selector2 header.b=WK7fof4i
Received: from pps.filterd (m0269475.ppops.net [127.0.0.1])
	by mx0a-.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB1spj41061114;
	Tue, 10 Nov 2026 20:53:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wsu.edu; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=ssaXF57LcMnMdiPYuNGkxgIzXcaI
	AOwdLGtHyVrGn3o=; b=lt7p54JVBsJBlkAa/JtdoDjJCOXwYADvKuBa5cJrBxnA
	U8xj7gC9YE7LNVNMHAwXKWDo1dI7Ul0WWR0+h8hMyGwyFDo8+ilxdHCkgVcSKbBF
	WvKxrJqqaBMo0tfA1oVESaKIVjrrU5KTa/RvT+tG/AigaCtIr85+vCtFfSHzkmMm
	md+mYi61mxHlZw1benqmX8CLwcQnv5kDyx1olJPYSm6+jAT73tgSRsqvxZ1UUzB1
	ozqYnlRr5FelS1SXk6cO0EyCLqxP/eALs5PLRxjN+OlQPj3jT1ubUrhHv76w44fL
	BgTsOFPdTg8wzDjyAdO1zERVXrx4RvCY5lVJZkgz7A==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021080.outbound.protection.outlook.com [52.101.57.80])
	by mx0a-.pphosted.com (PPS) with ESMTPS id 4humngvpy4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 20:53:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tjVa4X63JHZk+GUxSwexXDFk/4pFtAWPkPKOFXNCPANj1tjrti4ocdZfFd7J16kWfdmQDHEydIGJ0Vw2uNHixVqImPGs0u5YQYLWrSbzxL56E74uRdhK1I4nLW2BXN6b+QbZ0u9eTBnYN6h9xSXqjtvpT5tkmrYFbVMnOqyGKnhhFSMbW6CA8aV0ALHMJGXt0YJZyRjtaFjGtp06VskGmJ592a/+YyIoTJ1lrL4iwUTApAb7NY+THSSAM+LebKeKyNfWgjNWxiiuhuUgClse7vmO6asfeHhE6twsBn9vs+B3CUVBSu+6oXe3jeSP2+dTEa+/OpL1mvU2UuHaa+BEpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssaXF57LcMnMdiPYuNGkxgIzXcaIAOwdLGtHyVrGn3o=;
 b=uitKbWR8/sQHoWTjwYckHFcjmUb/tuYm6XfUpFjw1rcVMVXr79Ipg4svWicG7P6wkoLdTRZFkcGP+G0aEuV3oJmKjtRrinKXwW019mrU+QklYiD8H/ho6/4c5hn2OtBBZKhrLUqt0r6fMAyTTasebHOBj/9bd3az2P480j/igWSx+1M4dY05pZKtPu8MSwFiqwnhyzbUxLFhPAANlrJTjaBCK+PYb+NEBWrB8qPESi8YKWjTlwtZP3gz9xdcKgDScVKLzoTiYoPAvmKgfZ2dYhF3v5oa1wNm5/0m8MdVb+4xzk+aakIgEpXReWMLFDKWb+bbV+UqbjefAqCzNG/4Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wsu.edu; dmarc=pass action=none header.from=wsu.edu; dkim=pass
 header.d=wsu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wsu.edu; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssaXF57LcMnMdiPYuNGkxgIzXcaIAOwdLGtHyVrGn3o=;
 b=WK7fof4ikT/DG8zdfAjmQwcrkRrVbG9NqYfdU2cClR3WErfsjmUQM3DO1inxzr5WF0YmHcT9qygbd63/Dtr5RqSaERkU9h9tOv9vPl02ilS3zHdq5FikFafY0KVLZtusO9QSupQbNGgCXTyBcYaScWKp/pyWhdGN3Uq1W5sSAX/+J+EG3R/udPjAQCcDMFGHRCVljVTH+hGRDaRBDZ4njLrgN78X9gYbhF+EYsh7LI9H9VeH4IP//dFDinbI7Tmow4/S2WQjktrnLVQcp+itzcpPJeZxBshreoJymnlMiTzedMXOMACyxbO8PGneNfsbYoxJRQriCe6aKrVcHsh0gg==
Received: from DS4PR01MB994453.prod.exchangelabs.com (2603:10b6:8:35c::18) by
 DM8PR01MB6997.prod.exchangelabs.com (2603:10b6:8:16::5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.8; Wed, 11 Nov 2026 04:53:20 +0000
Received: from DS4PR01MB994453.prod.exchangelabs.com
 ([fe80::e4b8:f0ff:396a:103]) by DS4PR01MB994453.prod.exchangelabs.com
 ([fe80::e4b8:f0ff:396a:103%3]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 04:53:20 +0000
From: "Puranam, Ananta Srikar" <srikar.puranam@wsu.edu>
To: "akpm@linux-foundation.org" <akpm@linux-foundation.org>
CC: "mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>,
        "elver@google.com" <elver@google.com>,
        "dvyukov@google.com"
	<dvyukov@google.com>,
        "kasan-dev@googlegroups.com"
	<kasan-dev@googlegroups.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "Priya, Swarn" <swarn.priya@wsu.edu>,
        "Ammanaghatta Shivakumar, Basavesh" <basavesh.shivakumar@wsu.edu>
Subject: [BUG] tsacct: KCSAN data race on task flags between
 acct_account_cputime() and capable()
Thread-Topic: [BUG] tsacct: KCSAN data race on task flags between
 acct_account_cputime() and capable()
Thread-Index: AQHdcZgV+PhTeGxnbU+0fEf+k/ztsw==
Date: Wed, 11 Nov 2026 04:53:20 +0000
Message-ID:
 <DS4PR01MB994453688E23AA8CD27C995952EA712@DS4PR01MB994453.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wsu.edu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PR01MB994453:EE_|DM8PR01MB6997:EE_
x-ms-office365-filtering-correlation-id: 033d6cbe-7b61-440e-426f-08df3fafb56b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|786006|23010399003|18002099003|38070700021|11063799006|5023799004|56012099006|261009220027099003|261009221227099003|261009223027099003|261028144727099003|261009223327099003|261102123227099003|261022105027099003|261022113327099003|261021121427099003|261021123027099003|261009221727099003|261022075727099003|261026140227099003|261026121527099003|10067099003|6133799003;
x-microsoft-antispam-message-info:
 li28oUcATrX03+sxB/GY2xkean9OzMvbLqviA9MLux5W/Mfc8k+rU8HJsq7FbpzrnkraAkN3phDfIMDm2/SwG2/nsi7cX6DGqhTCwpfCu0BQ6xl5RgZ/SZ/8Ii7IzUXwpGwK1hzsa5xSFYtEiDd8K5RChDKCxZTWiH3QztbiLsrbLUf773ELq1Fp35fi8Z/WP60nYBa1O8CRrai2PddB6W3rqERRyocl4bwerPGfqqArWCskrIM8kid9tNJaz9sy/zpPVDB87J/SSgJpxQW15zKCXACvit++3P/X5giNawmvnyTKek+sq0Cj7/S0SzUJZjnUWv7FvnIp8KOD767lg5IMJ6dCgKODOtvCFddEABwsK1T+1cfuarabhEAqYor1HUAEj7tH7fagyyuhIYO3L3ScvQxgr1DbQGwl9Hpyvhc/GLIuVjzY2sXqQuCU9AMSrPOimImTolphvgquudjig2W9HxpSoaLd9D4GwcaI1sOSmoj9P4gDKpmzIwqhf/gF+qHaPCDcq7Ube4yTUgOtc7YiR826FBq4kap1+Rp4OWLd9d4wsUl9DS6HrKvUwKilztKAipapOVmSVOE6eKHoaxIj0Lsg43UUKIMHc+L4GIoNhLiV3UhP5xEQc/GovTTn2fkagJfgu/Ne2DmYslh2NNEp+PqubgnrWF9Eq0SdIUQ+wxDjyrXaQfjin5azC1kVOHJSln4bOd7LZXMAq6/pqxX9ZGarAx658AlaLwocyxA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PR01MB994453.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(786006)(23010399003)(18002099003)(38070700021)(11063799006)(5023799004)(56012099006)(261009220027099003)(261009221227099003)(261009223027099003)(261028144727099003)(261009223327099003)(261102123227099003)(261022105027099003)(261022113327099003)(261021121427099003)(261021123027099003)(261009221727099003)(261022075727099003)(261026140227099003)(261026121527099003)(10067099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ZzRJufmBVdgeV8WH+ISUhxOFaMbqrzZxDk2pDbGJERa/vGrvGGKavsW4D2?=
 =?iso-8859-1?Q?bOORpZC+fD1uZgX0S1uWHzW28htb4Sxe6GRRZX2KO1KkV35FfBSqfD1Bl9?=
 =?iso-8859-1?Q?KM3/yBUuYjwLdZ7mvF9ShI8na0N7R6rd+YAr4U5kUq50hMgTLpbSdNM6iH?=
 =?iso-8859-1?Q?1KG5YWS51TBgR+7aAAIUEXlm3QMeFGOep2xqFHF2reHidGSq+YiXUCip6g?=
 =?iso-8859-1?Q?LVPhM887G/6jhMSRfytzfnZcM+zsy+YbSobH5LzZA0KN7qsZbhyCQrUEZg?=
 =?iso-8859-1?Q?ERSIG6TnPlGBT6ZyESqrmT/1h7r8Yz08r5+1eyKh62yC3Cqu6LxNvT5uFD?=
 =?iso-8859-1?Q?vvs84jdDorN2QHvXkPxzNJpbGHrkusTbo7nGL43helGGolpP23JOneNDAW?=
 =?iso-8859-1?Q?GG0IY/rte+V/h/FqvHpMvhpTWy60k1z7k+LV+jBtCJpcV5KDmDP6UVyI4R?=
 =?iso-8859-1?Q?tU/Lu1gMUj39u5CMy+ZC30sQDW+Pskn9JrHUJTFEZwkst+p5InwKwipuK6?=
 =?iso-8859-1?Q?axICIMdhK5hhgX1pNb+lKmzO926GbdEJSmptxg/9D78LAqvbBi6Ezxs6FV?=
 =?iso-8859-1?Q?demGQKR5fiwjvxKEM4yZ0CKOuNVxwiODZhoMaJeBnLqnhcSv0xCX0AAIHX?=
 =?iso-8859-1?Q?6APC4NLFvvXVSwbj6ThQhhfAhzZ9JRmCLGXcbRRdk/stz+ZXH4CztiwofK?=
 =?iso-8859-1?Q?TQYuNDGzsbtdZAkEW63h2NX02kfQUhRgFomxC5OsdbzBaY5p40fro6fawM?=
 =?iso-8859-1?Q?SPCpXAW8JS7VlXANiJDtvQcqbNr3B5ddCRpTWXLcCzTQaXMNChnMr0kx3V?=
 =?iso-8859-1?Q?ICCnSsySWO7kTnA0fTT2gAzOIu73jUoUJdCdUjsMwqPNR5LNLyZOoqHUjs?=
 =?iso-8859-1?Q?n+7NGR39/Lruyn0zHG/pn3doELFV55lsPIUmZHWyLnQrlMHZhlmr0cmNeP?=
 =?iso-8859-1?Q?PGbsqdHZXMbQiWfuuyuEfDJwPvWyMe7E6jzxjtsBOCknjJJqm0wnPqIEOU?=
 =?iso-8859-1?Q?0pDJGd22CfdiVwgWoqRWK7O5E1ogga7ApQgciXW9l0GgUDZNm5/mD9W6Ca?=
 =?iso-8859-1?Q?ECTbQaKGkV78JL5KRS4lv+cVQFExIzxx6HCr2+FQ5eD1Q6ODP0e3bYZip9?=
 =?iso-8859-1?Q?Jon13rfm1v17Ns5wsV2rHGNkNznVPKAQmPOvHGmQ3tIQDWkwdXts6t6CT1?=
 =?iso-8859-1?Q?oRSXemFRZ7wtQ07eTDOEwSxCFRCXgScTYXrV9jy6mad0qp5srWn7YnypOC?=
 =?iso-8859-1?Q?JrXqBMbhjjngxlPK3pviIeQgTdNQZy8Injd/EGU32g4BV9R3aU487yIt72?=
 =?iso-8859-1?Q?cOjJcOyddUSye0BaC+NzKJB/23/q86FaezTX9gRofQc3nERDrlOo38wgPF?=
 =?iso-8859-1?Q?JVXd4xVDXRVj1UD251lYhixip6ihH6/fwDKhOj59MH8sQVp2jCHeVt4fWw?=
 =?iso-8859-1?Q?65DBN/SJbRC+nf6oRQ3+00o3592qcVnjqbCqgqJg+83OWj+yLfcIc6au1X?=
 =?iso-8859-1?Q?RZECqZ1nvlmfTHirY5LAkrpySCJ331DtxWAJB3YF9j5yDg0hC/9YWtMi70?=
 =?iso-8859-1?Q?KtaP8iE8/9nKSoWCK76KjjPSkREr9k1La6fpsrRiKOWNJ5SJ+kfmM2ylMh?=
 =?iso-8859-1?Q?pXRXsyVsG17Bm2hkjoDiO5JhtpBDSohMNhd8LIjvs2/Un5PfItHF/OIMJi?=
 =?iso-8859-1?Q?F8YQdLNd4uCQ1GTiTyo48NEZ6ypzMozDuL3P52z3iFXTdIvSql3sSQemwW?=
 =?iso-8859-1?Q?c5ZUKFNtxhbbfkzP8YQ9dcPqPjb5YZHUUOhXrfNP1+S2zp574M74We9TtI?=
 =?iso-8859-1?Q?GI8P5hfDcw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
	v2hyRRWce2cVVk/+Hhh/Y/t0O6S3uUm4RGVvbBEvCP/kyjkrJlGo0cMPKUhwxs1lO6dAduQrgGSFiNWZ1VaButf1cRICGXQBMt+tz4JeAw/YOHvQcGH3zVRQ1vJr+GEt5FGBPOs7M23DBiaNlLs6mduXVDTQXo7GygTzPRu+tQoE5DBwyEEczqoshrYMeO4oKXoJHKd5jZAj4mK/RbbjmTxw5PbIESUrN1ubOkvzXnTILqhhQcYMdqyl1iQK4F1x5Nv4ZC7eTzxc6tQE8G4ikd8ovUoKIrDDQYoSVb6ppCDiIe2+Eaf8ZxZWyPY4gYFuP/qZP1FcidarnPy1MV5z4g==
X-OriginatorOrg: wsu.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PR01MB994453.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 033d6cbe-7b61-440e-426f-08df3fafb56b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 04:53:20.5179
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b52be471-f7f1-47b4-a879-0c799bb53db5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: is6d7Qvj9QYmjYG+K1b8hTCSDjVmc2hLGStl6m99eojHbIpIxqiESU3AdBwU5dhqdKK7rgLJwgw6TJEZT99JVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR01MB6997
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxOSBTYWx0ZWRfXypmyU1RDEhoy
 LPzgxeqo6JHn+kqbot9jpJ8GFVG3NWrGStzUHFHc/luZPCfHtnvp99EQUY3G2KK7VgVu4F6IlK/
 dqtDYawln1Ns4dAipWnx1omNG6SYCWxLfZ3Z4WnlKKr8TjOlQ2QLp/EYN1BOpIsQ/onqQ8UesFG
 cGiTxCPragY82VvYzwhjmcb7nMe1w2pAVo/SXcAgJMGNacoRJUEW3dhuzh4sH1Noeh39wE3JEfV
 bAXe/J84Z5wQVmj6Abw9D0sD2ehFIGMbTBWe3rtz+NG6ooL61KvKi5cLJhh8NxBS0joR0FhtbwR
 9vz51x8gLgIKxqqao3gyKhHHrb65i39aClDj+wfz6tQkK2bQRuXPFhAe6J2ZJGkaftd2Z9BWvs6
 jENQOQY3zHORppFeXEL4YeeTVE25sqteRsjebAlRc148ETQm2J5fNMaLFzcAU96uNTk5PI9Es4D
 4oeaB5lexjeeFDKa5XQ==
X-Authority-Analysis: v=2.4 cv=dLwzC+Zb c=1 sm=1 tr=0 ts=6af3f4c3 cx=c_pps
 a=ODHLhvGZZr/oS+ofcGj7zA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=WNJZbBgGTWIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QNy-vP4XruPnrUY3G42T:22 a=FH6lt2noPR-fR3qg0_jt:22
 a=_R-Oz7PKYG7pnvuqvmoA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxOSBTYWx0ZWRfX1Emx2FpW/C/R
 OFCQQtvvAy+d8CXY9k4yyQqBUu/Wp3cgMrLxrs6LaXIiZfzOBNG8WgrsvDE1wPZKHaNZZ2KxWWH
 somM3apRO6Noj0UpT9fsxD6ikC+doTVHZp2EZAaTomdLimwTWUtC
X-Proofpoint-GUID: tEOC6uFON4h-MbObt2ZmsBHdHQRMcc1_
X-Proofpoint-ORIG-GUID: tEOC6uFON4h-MbObt2ZmsBHdHQRMcc1_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1011
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110019

Hi,=0A=
=0A=
I'm Ananta Srikar Puranam, a PhD student at Washington State University.=0A=
I'm reporting this bug on behalf of my team: Dr. Swarn Priya and=0A=
Dr. Basavesh Ammanaghatta Shivakumar (both Cc'd).=0A=
=0A=
KCSAN reports a data race on task_struct::flags between the timer=0A=
interrupt's task accounting and capable().  acct_account_cputime()=0A=
reads tsk->flags to test PF_KTHREAD, while capable() sets PF_SUPERPRIV=0A=
in the same word with a plain read-modify-write.  The read only tests=0A=
PF_KTHREAD, which is stable for a userspace task, so the accounting=0A=
decision is unaffected; the race is intentional but not annotated.=0A=
=0A=
Trigger=0A=
=3D=3D=3D=3D=3D=3D=3D=0A=
=0A=
A minimal initramfs whose static init, running as root:=0A=
=0A=
  - mounts debugfs and limits KCSAN reports to acct_account_cputime and=0A=
    capable (whitelist), then turns KCSAN on;=0A=
  - calls finit_module(-1, "", 0) in a loop for three seconds.=0A=
=0A=
Each call reaches capable(CAP_SYS_MODULE) through may_init_module(),=0A=
which sets PF_SUPERPRIV, before failing with EBADF.  No module is=0A=
loaded.  The timer interrupt on the same CPU then reads the same flags=0A=
word in acct_account_cputime().=0A=
=0A=
Observed (current mainline, x86_64)=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
=0A=
  BUG: KCSAN: data-race in acct_account_cputime / capable=0A=
=0A=
  read to 0xffff8b0001e32f2c of 4 bytes by interrupt on cpu 0:=0A=
   acct_account_cputime+0x42/0x1a0=0A=
   update_process_times+0x30/0xe0=0A=
   tick_nohz_handler+0x116/0x300=0A=
   __hrtimer_run_queues+0x1ee/0x3d0=0A=
   hrtimer_interrupt+0x1f1/0x3a0=0A=
   __sysvec_apic_timer_interrupt+0x74/0x1a0=0A=
   sysvec_apic_timer_interrupt+0x6b/0x80=0A=
   asm_sysvec_apic_timer_interrupt+0x1a/0x20=0A=
   delay_tsc+0x34/0xa0=0A=
   kcsan_setup_watchpoint+0x1ff/0x580=0A=
   capable+0x69/0x90=0A=
   __x64_sys_finit_module+0x4a/0xd0=0A=
   x64_sys_call+0x100d/0x2560=0A=
   do_syscall_64+0xe0/0x3f0=0A=
   entry_SYSCALL_64_after_hwframe+0x77/0x7f=0A=
=0A=
  write to 0xffff8b0001e32f2c of 4 bytes by task 83 on cpu 0:=0A=
   capable+0x69/0x90=0A=
   __x64_sys_finit_module+0x4a/0xd0=0A=
   x64_sys_call+0x100d/0x2560=0A=
   do_syscall_64+0xe0/0x3f0=0A=
   entry_SYSCALL_64_after_hwframe+0x77/0x7f=0A=
=0A=
  Reported by Kernel Concurrency Sanitizer on:=0A=
  CPU: 0 UID: 0 PID: 83 Comm: init Not tainted 7.4.0-rc2-g067c5c24cef2 #1 P=
REEMPT(lazy)=0A=
=0A=
The timer interrupt arrives while KCSAN is holding a watchpoint on the=0A=
write in capable(), so both accesses are on the same CPU.  KCSAN was=0A=
limited to these two functions; there was no warning or oops.=0A=
=0A=
Tested=0A=
=3D=3D=3D=3D=3D=3D=0A=
=0A=
  - Mainline 067c5c24cef2 ("Merge tag 'page_alloc-for-7.4-rc2' ..."),=0A=
    7.4.0-rc2-g067c5c24cef2, x86_64 under KVM:=0A=
      reproduced in 3/3 boots: 116 reports in 5,614,538 capable()=0A=
      calls (37, 35 and 44 per boot)=0A=
  - The same tree with the proposed patch, same .config:=0A=
      no KCSAN report in 3/3 boots, 5,764,984 capable() calls=0A=
=0A=
Cause=0A=
=3D=3D=3D=3D=3D=0A=
=0A=
__acct_update_integrals(), inlined into acct_account_cputime(), does:=0A=
=0A=
        if (unlikely(!tsk->mm || (tsk->flags & PF_KTHREAD)))=0A=
                return;=0A=
=0A=
and capable() -> ns_capable() -> ns_capable_common() does:=0A=
=0A=
        capable =3D security_capable(current_cred(), ns, cap, opts);=0A=
        if (capable =3D=3D 0) {=0A=
                current->flags |=3D PF_SUPERPRIV;=0A=
                return true;=0A=
        }=0A=
=0A=
When the timer interrupt lands on current, both accesses touch the same=0A=
4-byte flags word with no marking.  The PF_KTHREAD test was introduced=0A=
by:=0A=
=0A=
  5e65b5ca7d4e ("tsacct: skip all kernel threads")=0A=
=0A=
which is in v7.0-rc1 and later.=0A=
=0A=
Impact=0A=
=3D=3D=3D=3D=3D=3D=0A=
=0A=
The race is on unrelated bits: the concurrent write only sets=0A=
PF_SUPERPRIV, and the read only uses PF_KTHREAD, which does not change=0A=
for a userspace task.  I observed a KCSAN report, not a wrong=0A=
accounting decision, crash, or memory corruption.  Per=0A=
Documentation/process/threat-model.rst this is a regular bug, not a=0A=
vulnerability.  I have only tested with CONFIG_KCSAN_STRICT=3Dy and=0A=
CONFIG_KCSAN_INTERRUPT_WATCHER=3Dy.=0A=
=0A=
Setup=0A=
=3D=3D=3D=3D=3D=0A=
=0A=
  Host:       Ubuntu 26.04.1 LTS, x86_64=0A=
  Toolchain:  Ubuntu GCC 15.2.0 / GNU ld 2.46 (built with O=3D)=0A=
  Config:     x86_64_defconfig plus kernel/configs/kvm_guest.config=0A=
              plus=0A=
                CONFIG_DEBUG_FS=3Dy=0A=
                CONFIG_KCSAN=3Dy=0A=
                CONFIG_KCSAN_STRICT=3Dy=0A=
                CONFIG_KCSAN_INTERRUPT_WATCHER=3Dy=0A=
                CONFIG_KCSAN_REPORT_ONCE_IN_MS=3D0=0A=
                CONFIG_KCSAN_SKIP_WATCH=3D4000=0A=
              (resolved with olddefconfig; full .config available)=0A=
  QEMU:       qemu-system-x86_64 10.2.1 with KVM, -smp 2 -m 1024M,=0A=
              no network=0A=
  Guest:      initramfs only, with the static init described above;=0A=
              kernel log captured from the serial console on the host=0A=
=0A=
The source reproducer (init program and QEMU wrapper) is available=0A=
privately on request.  Per Documentation/process/security-bugs.rst I=0A=
have not posted it to the list.=0A=
=0A=
Fix=0A=
=3D=3D=3D=0A=
=0A=
A proposed patch marks the load with data_race(tsk->flags), as=0A=
task_css_set_check() already does for its task->flags test.  On=0A=
067c5c24cef2 with the patch applied, the reproducer produced no KCSAN=0A=
report (see Tested).=0A=
=0A=
Tool transparency=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
=0A=
The root-cause analysis, original reproducer and proposed fix were=0A=
prepared with the help of an AI coding assistant (OpenAI Codex).  The=0A=
QEMU/KVM reproduction environment and the reproducer used for the=0A=
results above were set up with Anthropic's Claude Code.  I re-ran the=0A=
reproduction myself and have checked the statements in this report.=0A=
=0A=
Thanks,=0A=
Srikar=
