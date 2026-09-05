Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AA92C325C;
	Sat,  5 Sep 2026 01:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788571369; cv=fail; b=WoBrKCxYkElXXncPNRbpXBrNx68F/CTIFz2Qd7CjUr4mAvj0p7LNSLhG76dDcgiJn1Q9o653gs2YEHc0mUgDYue8/uFcUwbJGL9CSR84ihSFvvVYcPAOU0fTFQdnDBuW+9NRD1tGyJ8pYhCzSia4IUBuVi2mTFjeMisYiNx+Op4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788571369; c=relaxed/simple;
	bh=UXArPSm6OdrZQ6fGigruDE2r37Hv1M4tH4IZ+SsSbxo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=STNirZDqsKqLfnZa0YCOrJBDyhCgMp0dVO8ukGu1i9P1BOl70TgzLB0T0bU4cnDJH/Q4+YaW7jzuYU2g7TP2IxYzztZyAqgYBEtjpF4LNvCDWKvTJZqol9pHGWsfU07fj6MEuD0vkaIx/M0fAXRCFG/SFSBUcNQ28FiEDc5EqjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=p1E12MeP; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=URMmpDfK; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=B61eF1I3 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="p1E12MeP";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="URMmpDfK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="B61eF1I3"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6850xN8C1630183;
	Fri, 4 Sep 2026 18:22:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=UXArPSm6OdrZQ6fGigruDE2r37Hv1M4tH4IZ+SsSbxo=; b=
	p1E12MePB/DEneQzyCnL8KO8brKC0nyrndvnn7lVb/YfnQVR/EekVSNmdnNqypap
	K3fEEs6UJhAs2usPwClRRIiVfh13cWyZXtCjqD2xWKdk36hdphedLzeq+3L/YgZq
	FyY4QOiTyQKRo6OBE0hmXt4Kz72Eu9gxtXExHia0MOfoNwbDC6MDOx99MeQmrBcB
	6wakShrdYX6q6TrBtlcv15tLaF+t4Wd1UyicBh2jF01pJ3cqvDcvTdtQTp/LTZRN
	IEoExDblfsxu7XN4dfS8iejJYJAZYIMEWmKX+iEQVf5CO8/izvU5DynaC9Ox65vv
	EhPNgEics4vbun49U5mkdg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4gfrm1bec6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 18:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1788571354; bh=UXArPSm6OdrZQ6fGigruDE2r37Hv1M4tH4IZ+SsSbxo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=URMmpDfKEXu+0zlxxVT/qnzPdKgFhnT7UAMOO/zWRAAAmrx7guV5ss731CiUN2zDR
	 4euzVLB2r8XHiJN1MeaBy38lACph3X14zxaIXZ3OEIJUkBTzu2ane1Amfhnf1H0hUq
	 E4P/725z0jwAWRD3Ae5c9RbJdkHYjSeo+vorn/X/3vp6+U5rbFyMPTehc3Jmkv3j1J
	 6FHe9ght6XassRqjCon/+Vn/RUE7r+Kul+sg7QzCN4HyOU6JVFj1VoEJr6PILCL8AD
	 LEj/g+UMs9UnUpJpKcjz3mVSled1llhMTffKX9ocQp5hM/hZ7vdBxR423GcO0lJtRI
	 JaDpdgg7Ke3mw==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0D11540136;
	Sat,  5 Sep 2026 01:22:33 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id AF5EDA0C3D;
	Sat,  5 Sep 2026 01:22:33 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=B61eF1I3;
	dkim-atps=neutral
Received: from CO1PR08CU001.outbound.protection.outlook.com (mail-co1pr08cu00106.outbound.protection.outlook.com [40.93.10.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id F15A12200B9;
	Sat,  5 Sep 2026 01:22:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wLcIGDmdGB+nouk32iTws68d2R9/0BWeBF4nXIahl1rEz9HUntpVoEab7IV59FoJoaYPwllMvHa+gkY5Kvr3Myf1CZWVe3hCAdc48Q1Nl4VEXJtto4BvgyFJ1EjOIlmwDKWqiY1BskOkxrGqLd2HOXU2JbML1hucg6udEYJqTjqBKdlIC8O08J/vDFL1nwUZfJ3RrKdUafQL3MMneYPIyfShwLUREsw1JtrfQsS1zzwB/Ql8uCbVxTt0c4SPuX3JvzHRPOe47iSmO5gZHvb2WgyCEvtnrqO/yr/psFefhb/gX1luHoutUZFCCHUVl91ag62mlxmwSECU1NmMicYENw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXArPSm6OdrZQ6fGigruDE2r37Hv1M4tH4IZ+SsSbxo=;
 b=fOJolaXum3LF42O1m8cQniTSY/Mei8diEcQaR5fO+ZIzZDsxViiEIqMHc1+ZWriNqEcZkQpz1i2Cc7Co80EXiE97ephEOcsUKYCQoM55rd9rTIpKjFYBe6TUIcdCdOt+t6+m9mB5XN7XuXEEnmB8EyeIfMHBVAwqNiJbm8Qxec51KlWFfe/uZcNFwTMglNsubAr2GLS1ZW+TkSw7Bho0OcXgpngP8jE1mnD9cP9zmNLz9UAXBefyZY2d2n8LeONLOh/+m2PNA6MSvgVb2k5ockaakKaqwroqv9sAclzqZQ87LjbnbK4mT3d55HCco7jQwh9q3m8ySP6TwmNA7KWVsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXArPSm6OdrZQ6fGigruDE2r37Hv1M4tH4IZ+SsSbxo=;
 b=B61eF1I3NXN89cLjNFOQt/lKi5QKGtKrWGHFfemSz4XZHskl2PCZTqhhSHO59iH6vybEbWDH0KApADm+FE3yRRQ20JFA2mm9rkFzmnq0EgayFsusC5I/jpJlLm4ggkP6eg6tbiMBY+fMQoEOFyxatJBo+ymC/T7NiJ3vVNcW0Ik=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by SN7PR12MB6863.namprd12.prod.outlook.com (2603:10b6:806:264::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sat, 5 Sep
 2026 01:22:29 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0360.008; Sat, 5 Sep 2026
 01:22:29 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Cole Munz <Munzzyy1@proton.me>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] usb: dwc3: gadget: don't error on dequeue of a
 completed request
Thread-Topic: [PATCH v3] usb: dwc3: gadget: don't error on dequeue of a
 completed request
Thread-Index: AQHdPKgQ+cX+KZ58+0ydJDDAkiBvpLa/EX0AgAAI/ACAABY+AA==
Date: Sat, 5 Sep 2026 01:22:29 +0000
Message-ID: <aptrIbp-p6RNGd9X@vbox>
References: <20260904161344.2191362-1-Munzzyy1@proton.me>
 <2026090406-unrevised-stays-4832@gregkh>
 <7bef11b63feb88f89b37bbc86323ed3dba794f43.1788541086.git.Munzzyy1@proton.me>
 <2026090413-hurdle-puzzling-aadd@gregkh>
 <a0cdcd76b7a6a3c841b7957a2b761ae71ceb46fc.1788549031.git.Munzzyy1@proton.me>
 <aptTU3JD0xPMPmfL@vbox> <20260905000240.2267367-1-Munzzyy1@proton.me>
In-Reply-To: <20260905000240.2267367-1-Munzzyy1@proton.me>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|SN7PR12MB6863:EE_
x-ms-office365-filtering-correlation-id: 1796f4d5-0ced-4115-e82d-08df0aec2702
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|56012099006|38070700021|11063799006|10067099003|4143699003;
x-microsoft-antispam-message-info:
 D3MFy7IuRra6AP7ZWrAT58UZlGIypsaRVY85QoRaLfnsVyZBwxtHMkAv0Rx8yPGhdNq6YQVkdqFCdIfPgXNwKjmLEv1RUzvL4uB52CDAW+5Y4RDwrgNXFjMI9poayvOsR+VSyGtwS0QxqQ4LzBlX+bjo+bw5TgqLlfBfysyTI/F+HI5Jvl8Wc7VlPNagl+bCitlff47N0SqV5ffL1256SToA4wat7zBCGFLT1bzGFicItJ58qNLvF43RCmPABWwerLIlD2a7XDxheCeIFp48QBWyHaNqMBUORjeqJVbag+2txDh9qNIUciQXW3VOQ/x0KbBjsSVduTtucZ0BlsjKqMlYjTOwsL0RQ2Pi0seRbnYOddglO0z94eKn8kGprkemSPJDMLu1u3GsDvaFQ7rMgacayoRl97L+7tulPd8RbMtdxk+HewGw0SZhgVBF3lbUVTJlWszMTDiuGc7yfVx8zLBMWEnA9/tcjQNaZicsgmyPm7nZKVDl2Xri5vUD6Qk1sI7Li2mJtjFEYVBJliZs7iiB78yunVrzfzTFNqq8H2AEr3WeGFIgqcGb2DzsDocdrR1P54yakSfkUwNATvvrP7XY9rIoDu6ZkSexKl1BecBm9W0lx8N/XuhXP6cEZLA5qYjMyY3i8QQiy8kEQEu3B/0olCWtD+9RQY5IR2S4jPeWk/4mk85xJaRoWpJXom1MoyfnNtW3FcgrEbE4/P7pwg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(56012099006)(38070700021)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZXZpcnZXRmF3SHJVV1gzZTcyOVJ2OXJ5VWJEd29WSDd2cnhkNlBWcEczaFlH?=
 =?utf-8?B?Qm8ydVRqRkpoVlR5TURoQUNHaUZBY0krQjFqcDFoTzVNL2hJKythMjlka09F?=
 =?utf-8?B?ZnJCRWRpL3Y1aDc3a0dUWjl0aFo0SUNkeGJxNHlERDhuaGFwTzVhOHc3UFpT?=
 =?utf-8?B?SWFIcEF3eUs2K2JCR2R0TGlxRnZhRmhQNkZ4bzVwaDF1dXZqSnlrMUpyMkl6?=
 =?utf-8?B?N2NYaCt6SXhZTC9iaUFUdjlYUzNGTk8vNXlndUNoUjBJSS9hc0VRYzZRTkc4?=
 =?utf-8?B?V1EwK3RPZk5Jczc2TjRGamNUWU1EQmluV2J0WXc1cnBVaDVGWTNqNWpNRnF5?=
 =?utf-8?B?MkhqMFMvWTEybWJSWm5HdlFtb2hPUEdnSWxLNU00RDh4MTlUSlJiU0hPcDBH?=
 =?utf-8?B?WGo1akJ0NnJvdC9aNDN4Sm5XcUkrUUlRWW5YT3lweWhBcEZ1SlkyZ1hnT04r?=
 =?utf-8?B?bjN6V3ZBSzNicE9pYlZBbDJwRU95TU1SQXdVSzV6bEdGRUl5Ri9LYWFDK0dz?=
 =?utf-8?B?blVQTnJ2Rk5LMUUzQUhzakZJOGEzeXB1K3RpZEpURUlSbjUvbkRjOURpUWRj?=
 =?utf-8?B?dWZZcWFXanNFTk9HYVhuYitPN1ZBQWZTMjAzQWJWTExRWklVcnVGd240UUNs?=
 =?utf-8?B?cXcxTEY2Y3lxVytRYnNOR3oyaGUyYkltSEw4R1I0bTJHRXFqTkxyL2kwUGVQ?=
 =?utf-8?B?M3MwRVlHaUxMME0vZnQyY3Q1bWZYTlFhVVc4TjJrK3JIMy9sTWxYOEtzWWRV?=
 =?utf-8?B?QmRlSGMyT1ZHN3MyUW1wTStQUStkdk96T2Q3emlnOWtuY3Z2Mmh3WHpPSTBJ?=
 =?utf-8?B?bmJlbEJqS3E4NFZ3Q2VqVnF2WUsrRFg1ckttY1Fjc3pXN2t5L092eGRmZUxk?=
 =?utf-8?B?V1o0eFc0TEdvSFlBclMrWDBQNUs5WXdwR1lVT1FFd1ZBclZuZDRmRStOU1Uw?=
 =?utf-8?B?ZGZOWnpqN2lQK0NZRjFKcXdhMTRTaWdyTm0vUU5vMjNYcjNVbjQwN2xPOWk5?=
 =?utf-8?B?eFBXQitBQlFGdEk5N1JjVzRhdkpkbzVJeDFnbDFvMkJFZ3ZHVjhDcUZFZGFk?=
 =?utf-8?B?VXQ0OC9jU2FkUVhEVjVvNUVoQm84MlIxdW4vaXR5V3BnSTVJVnhNU2NwTjJs?=
 =?utf-8?B?NHZxMzVWcjFFMGw4NkJuRkx5MjNXOEpVc2FjQ0xyd291ZmcrRHlxVlB2Qk42?=
 =?utf-8?B?UlRCVHhyN3FHSW1jZUhFQVhuNGFvbXlFeTRiM21HR3RTbCtodUNISHQ3UTNY?=
 =?utf-8?B?QkcrS2U5aDZYcThGZCtHSTJ2VEFRcFFMOW5oMTc4R0pjWXNtUDQ4U0Y4NXkr?=
 =?utf-8?B?dDhFajRQbGRKckFvU1MwUWt5MUtQMnNDUTlOakFXQm9wZG9SYzVqN3dqSTU4?=
 =?utf-8?B?TzUxb3pRcXZ5UEtHRDN3bFJaOGhLd29kMEZ5Sm5LRVlTc014L21zVW9tTHpj?=
 =?utf-8?B?VHZrdHlkcUhLR0EyNHNVU0JyejFzdHU1R25jT00vV2F1c2JOWkx3Mk85WDI1?=
 =?utf-8?B?QUZtemovZmtxRUdZTmxTV0RVVDM1dGZNajdrNSt6QkhoNFo2WXZ2ZWFueTJ5?=
 =?utf-8?B?c3p0aXl0Mk4vVVVKUXVKU3FkQStWU0dManE5TkwrTU5VWjVNcjlGM0dnTUpk?=
 =?utf-8?B?R3RlaHBjdmlETnJNZFltSXFpOVNYZW1zUnVJU0lBcEtOa3EveGx4aEhQUXds?=
 =?utf-8?B?MmJWamliSWxhR25INGlnc0xxTjE3L0JDVm1rWG15RnU3S1VOM0tmR24waUd3?=
 =?utf-8?B?d25tTFc1cFRHQUgzSk5BMzZmS2hYMUhES0tHekQ3MjA5b290R3RJYmVlQm9l?=
 =?utf-8?B?ZDAvODlpMXJIZDM2Ulk4VXVXbDNwSnlHU1ZXMEtWbER5SWFYaG9ZaWZvMDBj?=
 =?utf-8?B?ckh5YjFINzdEdXoxQlk1emJZUW9NMzA0cU9mUmFoU1ZUYkJiZlNEY1lhZXZn?=
 =?utf-8?B?MnFJUnZBWUM2a29lQzlQNnpYNG9SYjZkT012bmUvKzcxT08vbzBYSitnd1p1?=
 =?utf-8?B?Y0swcXZIYVhOWkFLMGluL09BeUxRRktFclh3bDZPSk9MYk94cDRkSThjNzJ0?=
 =?utf-8?B?VzVWZG5MK1JtNEdzK2JLaUY4a1lid2ptVE9VTXp4QWJjbkk3akN4TitSYzBX?=
 =?utf-8?B?cUgvY1R0LzJzWi93K3FIU2plYkltejlKaXQ5RUxPNHhYY2d6VGRscGFLTFpH?=
 =?utf-8?B?Y1ZmMnJndW1MbkpuV3Jpd3pRamw4Y0pYZ2RPNnV1TC9Ha3VSYjRQVW82aUM4?=
 =?utf-8?B?ODl6L2FyYzdIVGlBMTdqazQ0UHNFZ3UrSGg2WHk3YzNybUZ1OVhxU0ZzdEFY?=
 =?utf-8?B?TDlJaWRpcGtxU3pyNXA2Tys4TUtjKzFDdTVxbXlhVURHcHc4cGYrUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <268B8A1F59BE3B4C8018D57B93213BF5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	TM2lnUFVkSA+R3sZ4zM9XKk1y6z06+HQGRn2QTWs3Hbja3kPGR0DTu+EwhexNWFUfXjs3eVxp4Dy1hrZHKJMQhiAxd/X490+3e8XuBkOyVlY57tpGJJZvgqhe5WnevJyLpKLox+p2VL+DLBKIEYOL3R1feMdzkFXiNMaFMq54aMIu+QlbWPGxKYO9Hy6DJrf9xzBIStgNdTr+911IYCJWOHX0qZQyLFM1xAOtsLE9UYhrqGzSaJokFmPIJ6jRLeMH87h719hnq7MaODuMThQ+L62zT4gwxQzBjO92bZfla2xg6261maDq4dV/DvOUv3xsroJ+Hoaony9eTWsCbaihw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZDTwtVp2iq1oLzxHNpB984bgWxJWEdZLd7lUtPCrAf7PRwLljYC7dW4e+Xoq/L2MiIkVEWVawSE5+GWWw5UDa6ItZKhEW6wXLjgDlEaFZpAwNf+YNpdHVR9tvx70B6haZQ5toW8V+9DbTDktDuI48rhmyK4wcfg4qsdEfLlq0NRsRmO3es4io07Q4IqMwaReRYaNvUd4gjDoW7JlUdRkKw0RT9LcSvTMoGeYor2j6JHFz0LrTmSCFDzldOQRTecMqxbXlthojqE263+Nb8UIW9T2hAvw/q0+nw3M38jXYgR8bZYgN/nlzMcA9bkyG2tTG3PsSEwIFhgPD5SwYdKaGq+NtychsE2M2z4+7YIE/rbbXq+cOSccSUvmtxUKZB7bid52URX2JncdGZb+AnAmaeMFKJPsGXvR8M7UVTu4f2J20C5ZYBKuH0X9QuC2ft+AJa6bBWWO68Eh/XpJp4k8wDOhv+TyYonaQi+yv7l7ycAo3ldqbQQTRQJn1NjuU56FAmC1NtyiXyw9GH7np0007VuHrtjc4vn1uk6S4fgIQz0SE/apWNtzEezKm0F3wHWPA5YCQj5Y7zZINF6vE5/0g3chNSUiN+z84GQIFBjvQGcicaIu/QBJ2J3CAzziPlUiPTX7fgh9Q2cW8z1HqZ9fBg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1796f4d5-0ced-4115-e82d-08df0aec2702
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2026 01:22:29.2440
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LuGpMZaQ53ulmPEZaZsy+Hvl0IE90OFPZQ0l+/LclWQyUNpFaIXoS9PGRiDE/DJtAsI9opi+AjmYTT5WWobaxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6863
X-Proofpoint-ORIG-GUID: Ig2PAo0B6tcRSWGRAgWnO-jmV9GbIM6T
X-Authority-Analysis: v=2.4 cv=L88theT8 c=1 sm=1 tr=0 ts=6a9b6edb cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=ISoU5ZqBy8qLcA4Un-EA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Ig2PAo0B6tcRSWGRAgWnO-jmV9GbIM6T
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDAwOSBTYWx0ZWRfX7q56npD+N964
 ChIc5sr2dP3cjPuUf9yxbJDnSmpokf2NNNpRZfX7cK/YNg3ygOog8LPl2KVVdTcpdU9ZhOiQnaK
 JJzEGiF5LOhasiVu68IBfQOXowE7Xpg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDAwOSBTYWx0ZWRfX4p0BI7eLSbPr
 KdjbK/IsTtvpH2qkqD0a3xRAs9trBlV1vThNPe0qbL8R8P9fak61EJKCdyFJyAkiayFJZh92wSY
 dyezbm22EahmqxNPDpnHp7WSBslH1K1CUMdA6p3QSQqjJ8eaNz+jqt1GkcSqZQG00VKpwGkboYf
 EQ8LUXbvmmumY+E+chmxmyMMwsZGSDPX0KlQdpkIi6hVLbPM4aOrECBCF8jSSEtijaf/+Z3KLkj
 m/16sVRzWqYfzXD166Y2dHp+tc5mvN5pWR01InWRPZvhIl9wpx4Q1ujFSl7STYtJzSrHZKuhzLn
 ePTLdeaG46jHO+lLgK9/YWH636wgMnkMdTSnde7SeQVtzG5zFoRikK1wIQ2xfLKKnOh3WDPAL1i
 oucdjY9GHDogV3qUOpzWGDDWVpvC24iEaFkmYMg1BbcFUGSmhEQdw5sNiUxblK8TKxcicKx4GI5
 e64dIc8J2ZLq+pwh0lg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2609050009

T24gU2F0LCBTZXAgMDUsIDIwMjYsIENvbGUgTXVueiB3cm90ZToNCj4gT24gRnJpLCBTZXAgMDQs
IDIwMjYsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBOQUsuDQo+ID4NCj4gPiBUaGlzIGlzIG5v
dCBhIGZpeC4gVGhpcyBjaGFuZ2VzIHRoZSBkZXF1ZXVlKCkgYmVoYXZpb3IuIFlvdSdyZSBicmVh
a2luZw0KPiA+IHRoZSBkb2N1bWVudGVkIGJlaGF2aW9yIG9mIHVzYl9lcF9kZXF1ZXVlKCk6DQo+
IA0KPiBZb3UncmUgcmlnaHQsIHRoZSByZXR1cm4gdmFsdWUgaXMgZG9jdW1lbnRlZCBhbmQgSSBz
aG91bGRuJ3QgY2hhbmdlIGl0Lg0KPiANCj4gVGhlIHBhcnQgdGhhdCBhY3R1YWxseSBodXJ0cyBp
cyB0aGUgZGV2X2Vyci4gZl9mcyBkZXF1ZXVlcyBlcDByZXEgb24NCj4gZXZlcnkgdGVhcmRvd24g
b24gcHVycG9zZSBzaW5jZSBjZTQwNWQ1NjFiMDIsIHNvIGV2ZXJ5IHVuYmluZCBsb2dzDQo+IA0K
PiAgIGR3YzMgMjMwMDAwMDAudXNiOiByZXF1ZXN0IDAwMDAwMDAwYWQ5MmYxYzQgd2FzIG5vdCBx
dWV1ZWQgdG8gZXAwb3V0DQo+IA0KPiBmb3IgYSByZXF1ZXN0IHRoYXQgY29tcGxldGVkIG5vcm1h
bGx5LCBhbmQgdGhhdCBub2lzZSBidXJpZXMgcmVhbA0KPiBlcnJvcnMuIFdvdWxkIHlvdSB0YWtl
IGEgdmVyc2lvbiB0aGF0IGtlZXBzIHRoZSAtRUlOVkFMIHJldHVybiBhbmQgb25seQ0KPiBsb3dl
cnMgdGhlIG1lc3NhZ2UgdG8gZGV2X2RiZyB3aGVuIHRoZSByZXF1ZXN0IGlzIENPTVBMRVRFRCBv
biBpdHMgb3duDQo+IGVuZHBvaW50PyBUaGUgbmV2ZXItcXVldWVkIGFuZCB3cm9uZy1lbmRwb2lu
dCBjYXNlcyB3b3VsZCBrZWVwIHRoZQ0KPiBkZXZfZXJyLg0KPiANCj4gSWYgdGhhdCdzIG5vdCB3
b3J0aCBkb2luZyBlaXRoZXIsIEknbGwgZHJvcCBpdC4NCj4gDQoNCldoeSBpcyBmdW5jdGlvbmZz
X3VuYmluZCgpIGNhbGxpbmcgdXNiX2VwX2RlcXVldWUoKSB1bmNvbmRpdGlvbmFsbHkNCmFmdGVy
IHRoZSByZXF1ZXN0IGhhcyBhbHJlYWR5IGNvbXBsZXRlZD8NCg0KVGhlIGNoYW5nZSBjZTQwNWQ1
NjFiMDIgbG9va3MgbGlrZSBhIHdvcmthcm91bmQgZm9yIGEgZGlmZmVyZW50IGlzc3VlLg0KTWF5
YmUgdGhlIGZpeCBiZWxvbmdzIGluIGZfZnMgaW5zdGVhZCBvZiBkd2MzPw0KDQpCUiwNClRoaW5o
