Received: from iad-out-009.esa.us-east-1.outbound.mail-perimeter.amazon.com (iad-out-009.esa.us-east-1.outbound.mail-perimeter.amazon.com [34.198.94.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DD8416841;
	Mon,  5 Oct 2026 11:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=34.198.94.229
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199099; cv=fail; b=tK7pHkIf+/di2PEd7Mx8MnA72hCRMXs9pE+vnUR3nGTpY/FrrQSjKMzdBtYgt834ngDSaFQCNMqaMN55KfeVrS3Ok3QNeJE+2CYGhu+CuGvamDe1Bu1Sx068XT9PzjuNM/uZZduNCI57lXyehFNZQb95CR8Z8mVUoYBTedDBoMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199099; c=relaxed/simple;
	bh=4fM0BL3NsKyf5csI1XtpgKOYvhr18o0CT8V5VuU4VeE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=G6J9Al5ZPMyCirzQVwMM7CZiNxmuvB00mbSes7v6VTXKVWz7Y0B0MUNo24AYTMZGa2V4gVSlPk/P4BQCAN+UzaJJ4WyqDgkOkLjbV3csfwhGS2H/heDGc9kmlWCSDJZgJglzmvmtyRbhIGBTzKaOdzK7UGWu55E/zii10rj9fFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=VI1BtpRs; arc=fail smtp.client-ip=34.198.94.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="VI1BtpRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791199098; x=1822735098;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4fM0BL3NsKyf5csI1XtpgKOYvhr18o0CT8V5VuU4VeE=;
  b=VI1BtpRsqnXlCblVPE8JdYcKGN0+pPU4CrdggGTgCfI1ffjc0OdNpwjG
   8njNRVXPh9BiTE4NdiPkX2D0TgqdWcCath8rGf1GcZfkbYivSmZ1KKGQu
   LVA9XY2G8Jk2us2g2Lv0bavGhaMQFw8saEs3JSikkApwcfqQnwE4xTiqy
   lZwGmBgWll9THYlWk2fupJThrUnqbp/3CLoXo8CI9T/qlKEo0O2S8If59
   9Dk6SVFzj6nQCKDYfqXAU2Ogn7NROu+XKkd5GLWcxHixcpFnLW6QvpEg1
   KtQmtv63Iq0C5xessYy/0ch+rUlS02Q4LQW/gTXluL0LWUd9QqercZ9Dz
   g==;
X-CSE-ConnectionGUID: eErD/wwRR9WQKaHOwT8s+A==
X-CSE-MsgGUID: RQ+5Z/yuSlqeBmlb91EpcA==
X-IronPort-AV: E=Sophos;i="6.27,141,1787011200"; 
   d="scan'208";a="28793041"
Received: from ip-10-4-10-75.ec2.internal (HELO smtpout.naws.us-east-1.prod.farcaster.email.amazon.dev) ([10.4.10.75])
  by internal-iad-out-009.esa.us-east-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:18:14 +0000
Received: from EX19MTAUEC002.ant.amazon.com [52.94.133.130:23458]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.42.236:2525] with esmtp (Farcaster)
 id f1df049f-e7c1-401c-84d6-5e4572235ef9; Mon, 5 Oct 2026 11:18:14 +0000 (UTC)
X-Farcaster-Flow-ID: f1df049f-e7c1-401c-84d6-5e4572235ef9
Received: from EX19EXOUEA002.ant.amazon.com (10.252.134.207) by
 EX19MTAUEC002.ant.amazon.com (10.252.135.253) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Mon, 5 Oct 2026 11:18:14 +0000
Received: from EX19EXOUEB002.ant.amazon.com (10.252.135.74) by
 EX19EXOUEA002.ant.amazon.com (10.252.134.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Mon, 5 Oct 2026 11:18:13 +0000
Received: from SN1PR07CU001.outbound.protection.outlook.com (10.252.135.199)
 by EX19EXOUEB002.ant.amazon.com (10.252.135.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49
 via Frontend Transport; Mon, 5 Oct 2026 11:18:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O3rOjZNqZgPSKur+7TpcbAFYUmaZ4r9zk7hs8s0JI0uFwBweE61JocKjC0uBsLY4jt3H91mc8QLWzOM1WvpdgWdsce+7FkyjL7DabDRFNk7MJru1pl4qqbeL/57QTY2ATZNBr1omyf7QNwYREL2YNsrr1B+fDHA3IDNVKu51Jsg2Ddf6YJJPeqwaueAavow2mtL9/eSlBDySOdqKI1VIPFFlohP7mSkRVPePPtN0DhGlAW3BOdX9uevARCZ8adJAR3zHPkkuE3SAnR8LBYlDdIl8RdFurEv1NlH6qlcmVejPOYIVh1MUp1KCAv/dVwvXG98IhAqYaAiZku26CVDJqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fM0BL3NsKyf5csI1XtpgKOYvhr18o0CT8V5VuU4VeE=;
 b=FBWCnH0Ch7avAoUM9GCMO7wvqdSaxo6uHIPzKOdsco5HqURkvVi5VhW3ybx4BD0Q/pCWAoEcoS6X1/Zd3X3di9ISFPisFPcmF3uXBeCSlFADZPpt9YDcUiBarbX61169wTM4d9dmA6KX/piEM/SccUwM78VN69OozrmUHJZQOnE+8aNQ2Xh/b1VWvGKz/xsYlTXUHgTWvqc9K/YeEZX8313ojIs3zyPG8oIdqw3BFsdxmLsJF68sCIxu765BwQ8AunS1nMIfGYYaeuxtIsJCHKkZMGc706TxJu8CAutPm7w5Xo6YBPrHDwJjREi2ZwTNuFg57VjRpBM60awOAZVrdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from BY3PR18MB4722.namprd18.prod.outlook.com (2603:10b6:a03:3c9::19)
 by SA1PR18MB539011.namprd18.prod.outlook.com (2603:10b6:806:51d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Mon, 5 Oct
 2026 11:18:12 +0000
Received: from BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219]) by BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219%4]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 11:18:12 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Radu Rendec <radu@rendec.net>, Thomas Gleixner <tglx@kernel.org>,
	"Shenhar, Talel" <talel@amazon.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 4/8] irqchip/al-fic: switch to shared parent interrupt
Thread-Topic: [PATCH v2 4/8] irqchip/al-fic: switch to shared parent interrupt
Thread-Index: AQHdVLs1BMtyYUjJrES6FM5Zedn7gg==
Date: Mon, 5 Oct 2026 11:18:11 +0000
Message-ID: <BY3PR18MB472235F52E96E63311382FA1C6962@BY3PR18MB4722.namprd18.prod.outlook.com>
References: <20260927080637.27285-1-farbere@amazon.com>
	 <20260927080637.27285-5-farbere@amazon.com>
 <325cca1679899cf7dd84d6e313c183f1c7eaf6f0.camel@rendec.net>
In-Reply-To: <325cca1679899cf7dd84d6e313c183f1c7eaf6f0.camel@rendec.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4722:EE_|SA1PR18MB539011:EE_
x-ms-office365-filtering-correlation-id: 2e81ab6e-32b5-4ea3-9932-08df22d257bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|4143699003|11063799006|22082099003|18002099003|38070700021|10067099003|56012099006;
x-microsoft-antispam-message-info: QI5meeXjposltFaToBVcW5TDj4rSm7RaVA0+k5r4f5d0IMDeC061Ldl0CUUZJdy71Xso7vau+gHBvOB60a/oh1cN3bBkCQpNzCjywPj91uurZG2GzzRWoX3ifFbxsZiWtaVIq6N0+v27eoA2QkVW3OsImvfPpdp2fGrzHWeRAkH7ESUSp/LrEYid2uRG2sJc9vEvYeBcZ1sLOr8GsXu2mq4ss3yj1AcCWjQ4tU35KhFFTd+UrvAcXgXR8B94E/GHcbKPUwQ3o/QzXy16kSLjp8wReFquGFZ/YByuboPVPqvaIpXzaYrlRv2a3mP6o3hZFeC0MC6TDGcvKMIy3Z9To9eXGqc1DZGQY3Luxam3GeUW+x7ccEiNddLXZ1XNAsX1SbQ5RaYO6NNooAjaJnxJ+Hp0jXL/RQwQVxsMZuoj+HVeYOX/Bprps/EdMhSJ8SvLcrSuSBQfl1vJVmmk2IDnvFisdT0hWTgh7uczSuwDIMvpIVzQLpxqudH0ND16shn/ejvvaPmIwI34zhM2R6vPVsamUX3yanpXZ6b1qurGlC6ZOjLZ4LwYKFw+vb+1+N7IsRNI2DcwUoP3k3bNfpg5IoyzawlriUNHTllpk9zLcvTiK46wp8QVrJuwMEF7fi6Dat65k9ea8eYv23v8UJiJXZkcJfW7OtJv3173fh0KjAUJfVU/J+WyIEYJn8ye7DsBZOgXlwHOHZv0UAPADvgo4CFXSLTd8AFwOVGikKnabrk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR18MB4722.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(4143699003)(11063799006)(22082099003)(18002099003)(38070700021)(10067099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WVlqSmhLOTdacnlKZHFKQ0dLbThiR3dLUmh1Z3JFTzRNTDlraDU3UjRYZG5w?=
 =?utf-8?B?aGw0eXkrUjVhWEI2cFc0MGJMczBxTm9jUUpSbW5hNGIzVm8yOVBJMjh3R3ZL?=
 =?utf-8?B?UVY5TjlubVNKbVI2MlZ5eXlrck80MlMxYUFRQXJlaUl2cXk2TVNJQnpJaE1W?=
 =?utf-8?B?SU9HSVd5L1FEdlk2T1RKcVBmQkdIOTJsZWxYZ2lFUTFIeFR1dUdiZ1hzMUVw?=
 =?utf-8?B?R29BQ2FvMzgyc0dhTnpWdTZUODVoRUR1NG8xVjNSMDNkbzJEb0F1azB0SHgx?=
 =?utf-8?B?TmpHRzdjSFRINk9hdzJIdTE5ayt2Um9mVmovaVdnVGFxRTNFb3hTcU1wZldu?=
 =?utf-8?B?bFpkUXZRN3huc3luTVRRODdrMlppZ1RSbjJqblRVVEo1YjdSS3k2VCtSM3NH?=
 =?utf-8?B?L095TUJaaFMwYkdEcXBTNFRLdFRUNlFudjlJTHAxQ3ZEVHpwNUtIZmd6Rncv?=
 =?utf-8?B?VXhueDB4T2Qvd3pCMkhsMkhQMWgrMjRXTFY3UEVTdkIva1B0WUpjdTFHcmF0?=
 =?utf-8?B?cHRSQVRuK01DRWFRTGVDU2NZQ252T3VCamV5dFdIQkJYWHRkbWtJQml6UU5t?=
 =?utf-8?B?LzN1am1DSTNyRHBFejNEOHRweGhGcUp1d0tuT3JWVDJxZnJ4a3lORUhWbmhZ?=
 =?utf-8?B?Y054VkcyVHRQTUdZditUTCtKc0YyREx1OTl0bk92dGNZbkpsVGhPdU9XUmIv?=
 =?utf-8?B?Slgxdy9odkxsQ3YyT3p4Slk0aXFuQ1pURHhpUGxqSWptKysxa3p2RThBV3Z0?=
 =?utf-8?B?dTFhVmdOa0hGalcwaldBNnJDUk1VQVN2aWNNbXZJUTZ4djBnNXlVUnM5QUpR?=
 =?utf-8?B?b1VRd0E4QzF3aDVlQllLcGFSN2Z1MnNzQ0dxM2ZpZmtOMytxdy9vYmF2QkhJ?=
 =?utf-8?B?Mms0SkhDQmFmQU1LbGZ6YlBLUFVjaHByMnA3LzhxQzYzVEZDRTdIZ2FZeExT?=
 =?utf-8?B?T3ROaE1OcU5mSjZHQkJSVWhiNWtVRUFJSTkxQnVaQUlXZ2dwRWo5TXdUUitS?=
 =?utf-8?B?Q1dndmNHcUtOMWR4M2NPUy9MMnlqalFWa1dFM0VITjllb0JId1pHcE1zdmtX?=
 =?utf-8?B?Y2tpRUMrbzlYRnBKTCtQTnFBRXp4SDVNWitnYnk3YnJCTkZYVGFPT0lqWWxP?=
 =?utf-8?B?NkRLaE8rMjlrWkpJczhrZ0JJSnduT1FJZGpoZDY3SUdiMUgwcTR0M2tOSk8r?=
 =?utf-8?B?Znh3dFUrRUhpSFNjUnUyRWxJVXB4d0dwTFJPMmVBTGFWcGpUZFkzZGhQZW1i?=
 =?utf-8?B?R2NybWpvYnFuRXpDNFZGYnlRTzkyanNaQlJMYVhUTkU2WEpVWXpqdTVLUkhC?=
 =?utf-8?B?dTE1RFA4MzVmRnVHeGZVRGd5Z3VZbG9CM3JlRE01a2ZMWXlNZVlRRk1YY0sr?=
 =?utf-8?B?bkxzZHFWWGx2KzdkSTFmL2xLVHMreWtzRnVBUjU0VUpSbC9JRjJ0eW55ZWww?=
 =?utf-8?B?VldwVEJHSVRYNTVzQWFoQ2JDVElXVVppRHNxY3dJc1FOcDlDVWVkeHBlRVgv?=
 =?utf-8?B?RWtiTUlIemdydWx1eitLVW5TZVNwOWhJYXErU1NsNkd2NitWZDFidmhEbWxE?=
 =?utf-8?B?WHV1eWp6V2dtQ3lRUnUrRDM1elR6eXR4YlJxdkEwWXAwemtYbytmcG1lRWFG?=
 =?utf-8?B?QlhnTlBDSTJzcVU5WnhLdHdweStFczdTTitVeUd1SEFIbTN5MTZuejFXR2Fm?=
 =?utf-8?B?Q21vb2RwVHhybXJyY1JWc3h3T1dSSWZLNEtXbW9UU052OVRvbTJ1VVVmbmJz?=
 =?utf-8?B?RWhtYzF5MThKM1dzVUZqZWZPcUFmc0RJMDNmbi80UURJWUwwV1NYOCtKbURW?=
 =?utf-8?B?SW5GemN2SU1XeG9hMTljajljZURLNG1jUk0zOStwaXNaOTB6UU0yYVNEdGZM?=
 =?utf-8?B?VDJWbFZ6eFkxdFFKRVAzMnZTaHh2eEMxYVFjS2NXc2RISTlhcTF2aFAyNTEv?=
 =?utf-8?B?QVJrUnU1QW9Fc052Zlc5RnhXNDlpdE1objNNaTdCbVVwNzRRTDNEVEdoVnY5?=
 =?utf-8?B?SXVpalBHV3RJdngzODFTY1RobXhmUFkwekU1MTJnVlAvVmhEaEkrNmVPYkxX?=
 =?utf-8?B?cjdrMWhKZHN2Skp0ajdvK281WGx5NnRxdlVlSGpLeWFuWlg1NFhDSHlBeWFo?=
 =?utf-8?B?dEN5T0JTM1JXNmlqc2FTaFZjbkpVWTRYeEhFZXlyclZXZVRTNGc0WmJNL3ZB?=
 =?utf-8?B?NlNhazE0WThhSkFlcmxMclZFZ2lxUngyQkdqVUNjNWlwbjI5S0Y3bVJxWVEz?=
 =?utf-8?B?a3B5V3VFMUxvL2tjNyszbS9xckNnVy9KY0FpUklkc0xwVEJibjdzdDlZUzY5?=
 =?utf-8?Q?KNzNDO3qvJdZXcAmuS?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: UIZdcmXTEV/1luOe4XSR43CNVfllhx3Qh7HHUeIb57jnmp1Zsl89VSxTG5hls66f3/aIHgUxDGP1F5po74CoEDv7kpJBA6cLZXMATSXP9qwrMA/EyhzODE6VGdK0tChLi+V5bVP3c6pO9EwDBKLBYPV2vjDDIoxOJAgTXJ/iRlfbgXqouq7JAEgqjCw5MSn4cFXB2OSnf+nFecypv0wn09utflcfLhvsy9HrjO1IaVOElGNaLxm6yQE27be28ndaxioKl7JSFSdqCzIckUTxkrcfhWimsWzvZiWxYJi1m6z1kCuUlXIOXBEH+UlcQfwfCoh0OzPZMWBpmG1Zi4zhSw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4722.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e81ab6e-32b5-4ea3-9932-08df22d257bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 11:18:11.9985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DcW0oLLDlEV+ItActaF5rYbNLbklWpbPzUO3yfgDZ/S+gBsCIuYLqrtA3x4RqpL1ocH1sdvk9oDHf/flhkqgIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR18MB539011
X-OriginatorOrg: amazon.com

T24gU3VuLCAyMDI2LTEwLTA0IGF0IDE5OjMwICswMDAwLCBSYWR1IFJlbmRlYyB3cm90ZToNCj4g
T24gU3VuLCAyMDI2LTA5LTI3IGF0IDA4OjA2ICswMDAwLCBFbGlhdiBGYXJiZXIgd3JvdGU6DQo+
ID4gLSAgICAgZm9yX2VhY2hfc2V0X2JpdChod2lycSwgJnBlbmRpbmcsIE5SX0ZJQ19JUlFTKQ0K
PiA+IC0gICAgICAgICAgICAgZ2VuZXJpY19oYW5kbGVfZG9tYWluX2lycShkb21haW4sIGh3aXJx
KTsNCj4gPiArICAgICBmb3JfZWFjaF9zZXRfYml0KGh3aXJxLCAmcGVuZGluZywgTlJfRklDX0lS
UVMpIHsNCj4gPiArICAgICAgICAgICAgIGlmICghZ2VuZXJpY19oYW5kbGVfZG9tYWluX2lycShk
b21haW4sIGh3aXJxKSkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0ID0gSVJRX0hBTkRM
RUQ7DQo+DQo+IEknbSBub3Qgc3VyZSBhYm91dCB0aGlzLiBUaGUgb25seSB3YXkgZ2VuZXJpY19o
YW5kbGVfZG9tYWluX2lycSgpIGNhbg0KPiBmYWlsIGlzIGlmIGh3aXJxIGlzIGludmFsaWQgYW5k
IGRvZXNuJ3QgbWFwIGJhY2sgdG8gYSB2aXJxIGFzc2lnbmVkIHRvDQo+IHRoZSBkb21haW4uIFRo
ZSBoYW5kbGVyIGl0c2VsZiBoYXMgYSB2b2lkIHJldHVybiB0eXBlLCBzbyB0aGlzIGRvZXNuJ3QN
Cj4gdGVsbCB5b3Ugd2hldGhlciB0aGUgaW50ZXJydXB0IHdhcyBoYW5kbGVkIGRvd25zdHJlYW0s
IGl0IGp1c3QgdGVsbHMNCj4geW91IHdoZXRoZXIgdGhlIGRvd25zdHJlYW0gaGFuZGxlciB3YXMg
Y2FsbGVkIG9yIG5vdC4NCj4NCj4gU2luY2UgeW91J3JlIGxvb2tpbmcgYXQgZXhhY3RseSBOUl9G
SUNfSVJRUyBiaXRzLCB3aGljaCBpcyBhbHNvIHRoZQ0KPiBkb21haW4gc2l6ZSwgSSBleHBlY3Qg
dGhlIGNvbnZlcnNpb24gKGZyb20gaHdpcnEgdG8gdmlycSkgdG8gYWx3YXlzIGJlDQo+IHN1Y2Nl
c3NmdWwuDQo+DQo+IElmIHlvdSBzZWFyY2ggZm9yICJnZW5lcmljX2hhbmRsZV9kb21haW5faXJx
IiBpbiBkcml2ZXJzL2lycWNoaXAvLA0KPiB5b3UnbGwgbm90aWNlIHRoYXQgbW9zdCBkcml2ZXJz
IGRvbid0IGNoZWNrIHRoZSByZXR1cm4gdHlwZS4gVGhlIGZldw0KPiB3aG8gZG8sIGp1c3QgbG9n
IGEgcmF0ZWxpbWl0ZWQgInNwdXJpb3VzIGlycSIgbWVzc2FnZS4NCj4NCj4gV2hlbiB0aGUgaW50
ZXJydXB0IGlzIHNoYXJlZCwgdGhlIHB1cnBvc2Ugb2YgdGhlIGhhbmRsZXIgcmV0dXJuIHZhbHVl
DQo+IGlzIHRvIGlkZW50aWZ5IHdoaWNoIG9mIHRoZSBkZXZpY2VzIGdlbmVyYXRlZCB0aGUgaW50
ZXJydXB0LCBvciBpbg0KPiBvdGhlciB3b3JkcyB0byB0ZWxsIHRoZSBpcnEgY29yZSB3aGV0aGVy
IGl0IHNob3VsZCBrZWVwIGxvb2tpbmcgYXQgdGhlDQo+IHJlbWFpbmluZyBkZXZpY2VzLiBJZiBh
IGJpdCBpbiBBTF9GSUNfQ0FVU0UgaXMgc2V0LCBJIHdvdWxkIGV4cGVjdCB0aGlzDQo+IGluc3Rh
bmNlIHRvIGJlIHRoZSBvbmUgdGhhdCBnZW5lcmF0ZWQgdGhlIHBhcmVudCBpbnRlcnJ1cHQuDQoN
CkFncmVlZCwgYW5kIGZpeGVkIC0gdGhlIGhhbmRsZXIgbm93IHJldHVybnMgSVJRX0hBTkRMRUQv
SVJRX05PTkUgYmFzZWQgb24NCndoZXRoZXIgYHBlbmRpbmdgICh0aGUgbWFza2VkIGNhdXNlIHNu
YXBzaG90KSB3YXMgbm9uLXplcm8sIG5vdCBvbg0KZ2VuZXJpY19oYW5kbGVfZG9tYWluX2lycSgp
J3MgcmV0dXJuLiBUaGF0IGlzIHRoZSByaWdodCBzaWduYWwgZm9yIGENCnNoYXJlZCBpbnRlcnJ1
cHQsIGFzIHlvdSBzYXksIGFuZCBtYXRjaGVzIHRoZSBtYWpvcml0eSBjb252ZW50aW9uIHlvdQ0K
cG9pbnRlZCBvdXQuDQoNCj4gQnkgdGhlIHdheSwgaG93IGlzIEFMX0ZJQ19DQVVTRSBjbGVhcmVk
PyBJcyBpdCByZWFkLXRvLWNsZWFyPyBJJ20ganVzdA0KPiBjdXJpb3VzOyBJIGFzc3VtZSBpdCdz
IGltcGxlbWVudGVkIGNvcnJlY3RseSBiZWNhdXNlIHRoaXMgaGFzbid0DQo+IGNoYW5nZWQgd2l0
aCB0aGUgY29udmVyc2lvbiBmcm9tIGNoYWluZWQgaW50ZXJydXB0cyB0byBzaGFyZWQsIGFuZCBp
dA0KPiB3YXMgcHJvYmFibHkgd29ya2luZyBiZWZvcmUuDQoNCk5vdCByZWFkLXRvLWNsZWFyLiBQ
ZXIgdGhlIHJlZ2lzdGVyIHNwZWMsIHdyaXRpbmcgYSBDQVVTRSBiaXQgdG8gMCBjbGVhcnMNCml0
IGFuZCB3cml0aW5nIDEgaGFzIG5vIGVmZmVjdCAoc28gaXQgaXMgYSB3cml0ZS0wLXRvLWNsZWFy
IHNjaGVtZSwgbm90IGENCnNlcGFyYXRlIGFjayByZWdpc3RlcikuIGlycV9nY19hY2tfY2xyX2Jp
dCgpLCB3aXJlZCBhcyB0aGlzIGNoaXAncyBhY2sNCmNhbGxiYWNrLCB3cml0ZXMgfmQtPm1hc2sg
dG8gQUxfRklDX0NBVVNFIC0gdGhpcyBod2lycSdzIGJpdCAwLCBldmVyeQ0Kb3RoZXIgYml0IDEg
LSB3aGljaCBjbGVhcnMgZXhhY3RseSB0aGUgc2VydmljZWQgYml0IGFuZCBsZWF2ZXMgdGhlIHJl
c3QNCmFsb25lLiBoYW5kbGVfbGV2ZWxfaXJxKCkgY2FsbHMgdGhhdCBhcyBwYXJ0IG9mIHRoZSBu
b3JtYWwgYWNrIGZsb3csIHNvDQplYWNoIHNlcnZpY2VkIGh3aXJxIGNsZWFycyBpdHMgb3duIGJp
dC4gY2xlYXJfb25fcmVhZCBleGlzdHMgYXMgYQ0Kc2VwYXJhdGUgY29udHJvbC1yZWdpc3RlciBi
aXQgYnV0IGRlZmF1bHRzIHRvIDAgKGRpc2FibGVkKSBhbmQgdGhpcyBkcml2ZXINCm5ldmVyIHNl
dHMgaXQsIHNvIHRoZSByZWFkbF9yZWxheGVkKCkgc25hcHNob3QgaW4gdGhlIGhhbmRsZXIgaGFz
IG5vIHNpZGUNCmVmZmVjdCwgYW5kIHJlLXJlYWRpbmcgaXQgb24gZXZlcnkgc2hhcmVkIGludm9j
YXRpb24gaXMgc2FmZS4NCg0KPiA+ICsgICAgIHJldCA9IHJlcXVlc3RfaXJxKGZpYy0+cGFyZW50
X2lycSwgYWxfZmljX2lycV9oYW5kbGVyLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIElS
UUZfTk9fVEhSRUFEIHwgSVJRRl9TSEFSRUQsIGZpYy0+bm9kZS0+ZnVsbF9uYW1lLA0KPg0KPiBJ
IGhhdmUgdGhlIHNhbWUgY29tbWVudCBoZXJlIGFib3V0IGZpYy0+bm9kZS0+ZnVsbF9uYW1lIGFz
IEkgZGlkIG9uIHRoZQ0KPiBwcmV2aW91cyBwYXRjaC4gVGhlcmUgaXMgYW4gYWNjZXNzb3IsIHNv
IEkgd291bGQgdXNlIGl0Lg0KDQpEb25lLg0KDQo+ID4gK2Vycl9yZW1vdmVfZ2VuZXJpY19jaGlw
czoNCj4gPiArICAgICBpcnFfZG9tYWluX3JlbW92ZV9nZW5lcmljX2NoaXBzKGZpYy0+ZG9tYWlu
KTsNCj4NCj4gQXMgeW91IG5vdGVkIGluIHRoZSBjb21taXQgbWVzc2FnZSwgSVJRX0RPTUFJTl9G
TEFHX0RFU1RST1lfR0MgZG9lcw0KPiBleGFjdGx5IHRoYXQsIHNvIHdoeSBub3QgdXNlIGl0PyBJ
dCdzIHNhZmUgdG8gc2V0IHRoZSBmbGFnIGV2ZW4gYmVmb3JlDQo+IGNhbGxpbmcgaXJxX2FsbG9j
X2RvbWFpbl9nZW5lcmljX2NoaXBzKCkgYW5kIGtub3dpbmcgaXQgaGFzIGJlZW4NCj4gc3VjY2Vz
c2Z1bDsgaXJxX2RvbWFpbl9yZW1vdmVfZ2VuZXJpY19jaGlwcygpIGNoZWNrcyBmaXJzdCBpZiB0
aGUgR0MNCj4gaGFzIGJlZW4gYWxsb2NhdGVkIGFuZCByZXR1cm5zIGVhcmx5IGlmIG5vdC4gVGhl
cmUgaXMgYW4gZXhhbXBsZSBvZg0KPiB1c2luZyB0aGUgZmxhZyBpbiBkcml2ZXJzL2lycWNoaXAv
aXJxLXJlbmVzYXMtaXJxYy5jLg0KDQpEb25lIC0gc2V0IHRoZSBmbGFnIHJpZ2h0IGFmdGVyIGly
cV9kb21haW5fY3JlYXRlX2xpbmVhcigpIHN1Y2NlZWRzLCBzYW1lDQpwbGFjZSBpcnEtcmVuZXNh
cy1pcnFjLmMgZG9lcyBpdCwgYW5kIGJvdGggZXJyb3IgcGF0aHMgbm93IGdvIHRocm91Z2ggYQ0K
c2luZ2xlIGlycV9kb21haW5fcmVtb3ZlKCkuIENvbW1pdCBtZXNzYWdlIHVwZGF0ZWQgdG8gbWF0
Y2guDQoNCkFsbCB0aHJlZSBjaGFuZ2VzIGFyZSBpbiB2Mywgd2hpY2ggSSB3aWxsIHBvc3Qgc2hv
cnRseS4NCg0KVGhhbmtzLA0KRWxpYXYNCg==
