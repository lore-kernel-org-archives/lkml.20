Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793753307;
	b=qeP+Qp7gysf5HFsifrAtn8aJ3jgL6UzXd7xag6sBUIfIcK4IdezEt+h4f7HEY9LPq5Lk
	 UC0NVtbxnQgT1qnoUUPt62CVCV5mYNwftYchS/l1FMzQokmVDPLykGBVjJa4EQcJDriO9
	 GjO8ohLkUdlOt19OFBkB4FtqXkpfy/CJzU2ECySNMykTTIaKn9KJHPj+KRMwBg9ZX6egL
	 jEDRG/d5gy9OcgAYHNUjTphgVgNL5Kl4GbaruQBwMvnqROjgOX++7NZ60VfhZspQ2isVE
	 w1tICXhSK631sF0sRCoefzuGQKz/op1Ovc5vex/TotTfk+n36M8yfg3ObfBB9UZDoew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753307;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:Received:DKIM-Signature:Received:Received:
	 X-SNPS-Relay:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=e39mzHv+JlF3qW0jbHBh/oQ7/MxB3StTp3LK8r1vgjI=;
	b=TUkUj+hIqtwv3KqVV/K0uNw7Mmug/dR8S1YiIpgsabwgptgeKrGHcpVVLOxUvIBAvC+q
	 QdD3V23TsZzudtlv+hk1sT8i1r+PD9FUyWqoqqdryHT/pDEkDIQdUzZW0WSR5fr65rJso
	 Fc2f1lfyX/fqsza0R5P0M6S3rs9Pz0JvWSRhmv7f7TUFFwNkls4LfiEiPuWXScTlekzlM
	 saAxpo4YheVJpIoqk/f9BDkVIy35KPLrfCSu0Y3lkPNco1PDz4P7XCeOBQTGyStt+oEOz
	 nGPoMH5BSJdVuJX8ZcJD4/SrPXebUuH+X6N97w8pLGxIuzSgX0TviuMzbhFo0qpCkBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b="u/Sazr1t";
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=GAP8UPEn;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ZCHG+jGA;
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76283606A31B;
	Wed,  4 Nov 2026 00:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76283606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=u/Sazr1t;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=GAP8UPEn;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ZCHG+jGA
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40SWxl1377443;
	Tue, 3 Nov 2026 16:48:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=e39mzHv+JlF3qW0jbHBh/oQ7/MxB3StTp3LK8r1vgjI=; b=
	u/Sazr1tAmgSaNQryIrk0MvLelxFWIWl6kDekv9MzynJUPF4qMxqLP1aVNvwhfUD
	IP35lwoXKtyzBipo/8aO8o/qK9g873h9qyYpEvZaufywENDHJSwxeYHwTiOc84jv
	zEZwlGsqDdfpVwZCbRuGYIHDp3J5RlMB1KDD8+5QjWtBxYLFfo6HbWCslzKxtsPn
	olDLivhXRl7nGD0q60IrlKcfSXWLTFaKNpMxvFDwmWQi6zP6bdRe/Z8dzpZbF8Hj
	A3VniNlx8yya7TDQDBgw5CrMZxIgody4K4/dK4XoR97+Vkjyj3+Mjcs15GFtpobF
	eBSWCk3zX0y+bMNX36IumA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4hqctvykgd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 16:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1793753295; bh=e39mzHv+JlF3qW0jbHBh/oQ7/MxB3StTp3LK8r1vgjI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=GAP8UPEn7DkVHxY8ifrlYRxLZS1hk7booXykmW8Z7ie0DzcyqDwZ6SpkROqdnLMkU
	 y29sR1SjNpjylfrSYW5Cy/l7Gxx/7B/McJYZblKrIaOhDSF0tZnKJk84yIg5AJL4v1
	 RWBWxUyVcQx2d244oG1vBzeOpLiDsoAEOP4fvvb0UUxN8D7Ww8h3ngXg7ChZao/AoL
	 y/HzUOnykUD6zIKyNKpG8SPDRu2yLO9f/S3cp0avxyWFQ5Pf5RdMxFiKH+gytyUxz8
	 F+fXrFntmzbb4FWnfMNaKkbAZPWkat5CR0i3W8zLsk2sUMmcpR23ad4EpiePzzG68v
	 k241zeTHwkHxg==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A951B40158;
	Wed,  4 Nov 2026 00:48:14 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E554CA0070;
	Wed,  4 Nov 2026 00:48:13 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ZCHG+jGA;
	dkim-atps=neutral
Received: from DM2PR04CU003.outbound.protection.outlook.com (mail-dm2pr04cu00302.outbound.protection.outlook.com [40.93.13.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2B48A40140;
	Wed,  4 Nov 2026 00:48:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V9UDsqDP8t1EEkPhQlCPz0KUT7MSK3t02MZ5Z4gEMJhxepLkyfweBDLF6cvNIqQaBbYppSg3Hz7jjh73oXSDJj4HNmV5Pg1WfAsyYKPU2bidUSv6XgR0U07hNfn/aL3tfTmaqpx4w/X5/YveGKJ9Kv6KBfkQJAWep7Lx43czycpWfvHUDRQqU5vK7FPRMgMlRR8XXk6F8Rd5nSrY1qpElS74yzXn++Pxu4iQxXnaWAlQCAAfqYFjkVe+5pDakp9ANxRZ4P8LFwsBjo1kbfeLrDWLpIG5t/RZI6AxGF9rQGNaXQnOrqA4PoeXWP8vOzVemIXvSDMZcf5K7BZ/zak8uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e39mzHv+JlF3qW0jbHBh/oQ7/MxB3StTp3LK8r1vgjI=;
 b=WB66MlhIvcW/aWWjkDvBLsSzFKADF6MNk1InAHy7q4OeXpqI5rsue+ICjK5u9UcPpMVuhn5P+8D4tsizyYdks+ITVeVwNci1HpaHuWAqvt+MMww6cPO5VOKFmJk/daNjhu3wfMfhdPB8t2l/lN5CpawfMePac9cHxx01DGDgQShneNnXoeNd3hU+6mak+bkM6djvYsrLcWrT693jlSrLwwWogbxlOrtZLqpuL2flyxvgJxdT9heGLSZY5M4J2Zd0EQkxognzXIieMFRduILfKYn/g6DkAk6jj/9XJDTrRcXQFpVnkqC5as6MTr0toHuPoLo25D6rVVpfnGBZBx5GlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e39mzHv+JlF3qW0jbHBh/oQ7/MxB3StTp3LK8r1vgjI=;
 b=ZCHG+jGAt4ONemxB2kNbnnLt/l6emhdqrZEu3XVWjwZQkfIquE3jcirmx+Tvx4YC5tUST/X5fZ536HGq1uHl3IDmqcY2lRecg0Y8JsZsETQyvOf1Veb7FYRyuFbl84VhsUexoFhi0dHqCgW5BZ1ivSBQdf00J+5UUzUDEnrypMg=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by IA3PR12MB773567.namprd12.prod.outlook.com (2603:10b6:208:706::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 00:48:09 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 00:48:08 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
CC: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "stefandoesinger@gmail.com" <stefandoesinger@gmail.com>,
        "krzk@kernel.org" <krzk@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 22/24] usb: dwc3: generic-plat: Add ZTE ZX279128S
Thread-Topic: [PATCH v2 22/24] usb: dwc3: generic-plat: Add ZTE ZX279128S
Thread-Index: AQHdW6z9REouRbLJpkK8mHwEZFW+ObcdNNyA
Date: Wed, 4 Nov 2026 00:48:08 +0000
Message-ID: <aup_2nJhE243HVAN@vbox>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-23-ghahramani.navid@gmail.com>
In-Reply-To: <20261014072109.1759502-23-ghahramani.navid@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|IA3PR12MB773567:EE_
x-ms-office365-filtering-correlation-id: c537ecd6-78dc-4fea-1992-08df3a0d4ba1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|261022075727099003|261021123027099003|38070700021|4143699003|56012099006|11063799006|261021121427099003|261009223027099003|261102123227099003|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info:
 P7ArBTY7naa0WBF86KmdtW9tzl6kMb/3DvtsTddc5nHoaTLdWhsLiaQ59IVKXWPP9gr1BQ0nxe8tkhQcbstWJIHejnmkEE3Bj4kfjflcyEFnzGOSILOXaslqR4FeoeCojE1R9OHuSEnKPq5CoalFL8FSojDyBP5Z6FUtzQxp7ArBUnPTKmp772TgK69V7kVG6y4Sc3fQktOsQZKmOFbk5msUoKTy+6s1ZgtHa82UX+/ju5Oc0ENkBJ7YmR8raO74sGrf2O94hFyOD4GPFCZZbhrDeGrKbZXyv36rgdgojGq7ZWfBOzIxjfDiNWVh7qu5ZTeYAyM4ujYaKhm35fhYD18QAGJ96Hm7VFrnA1OcLROIrxXbcWnVJFxQemqDTpwA5X4/0nBvcrYy0d5kVSsB+u4PCGVZ6FXYlW6iCGHm6EDHibYgQvNsP4xhMB0Smy2Ztup4MlzomnKfrcVWHagI4XJhcpOlNukqIGTvKViZunyeXuFvPJiYlG0lDj5UQlsfScEYrgSK3rBam2m/YRO8EctexlTdNL4u5FIVhd9ddzwoGX4AqC7v/X6c/LNk+NPAbi5cUAMrnwZ9DbqsEzg0Q2isaojm4jAfSqZzXd61cNF9wXRVXfmPFFqYSvEbDw8S0x94FKXW52/vJSOg+Wy4/795Q9DZuMXSLcFzE627PiE7Me1axZKIWZQJFOXCOcDi8KcDVSJ2fGXeG+O5V5CI/qxoCnPU386OXqn1LRmKPpo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261022075727099003)(261021123027099003)(38070700021)(4143699003)(56012099006)(11063799006)(261021121427099003)(261009223027099003)(261102123227099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZXNKUTVKYzNnT3VFRGVQbFFiR3pvVDdHU1R3dW10VXI1SFFURnNORzFRbHlw?=
 =?utf-8?B?dWFubSt4MktvRTFiSGJnNWlTd2dVUmpsKzZvVjNsOW1PWURleEM0UGI0Ulk1?=
 =?utf-8?B?UjhnOTloK1A2VWtSRXNYWm0ydTFnaDhGUERWa2t6ekF5T3l5OVFaNmx0ZDB2?=
 =?utf-8?B?enh5eUIxSjNsenV2T3JpditjbTBtcG5CcGhGMHRTbWZ1eEovN0RQSTlvSGg3?=
 =?utf-8?B?RlBNM1dTL0xQbFp2V2c2UGdURWJTZHkxcDFMa3BjL3p1WGd0TWZwVXlPOW9J?=
 =?utf-8?B?c1ZYWW5wR1k0THg1WVUvQ2pUNk14dTNTWWk3SG9TVDBVOUJqdDQrUXpIcXFM?=
 =?utf-8?B?TmU5TVAzQzNlckMwaGFobW0va0NwdEFWZ3Yvd0RRWkw1UDZITHhicllBRXhY?=
 =?utf-8?B?VkkybEh4eGRrejFPMHRJT2ZndzMyOXBOZU5Qb0wwSW5idkdXMmZnZkgwc3Nx?=
 =?utf-8?B?UnVxcEd2Zm1UR2FhbXJ1TXJSd2xEbHhQUm9reXVDWFhZays3NStybGZnZ2tV?=
 =?utf-8?B?UVNoQzFnYytpYjB3d1BQaW5mRFpnSHlGbVBFQnpzWTBXdGNnVlVUWWpCWHR2?=
 =?utf-8?B?ZFZ0U2YzK0c0WXViK0xxRnV6aTh4ZTNQNC9nblBMcXpkcTJVb2JZNUJuQnNV?=
 =?utf-8?B?cml5MHIwNk03blZwTTBPVjFjeEVJYlV1WFlFSGxPZUNEZGdPV2lFcGNvRlBG?=
 =?utf-8?B?Tm0ya24yeDRmKyt5QlRTMzNOL3pGbkplOUdDUmgzZFZGdkhLeXhWSGcwaWo5?=
 =?utf-8?B?RkRoZWx0aWpCbXRHb01rMkpxckEzdVcvb2FzUFVGdzNESlU3RFM1aTJWWith?=
 =?utf-8?B?T3grTG9ienJ0UXdReTBQa2wrR3hpNUMrQ01zUWNwQzIzeFRuSlYxTFdlVjNS?=
 =?utf-8?B?ZTFRSEpTZCtHZDJyS1ZOZExDQTE2cFRUdmRJOElxQlQxaFkzVkFxRFdZeHR6?=
 =?utf-8?B?Tkw1a3BUdlh5aUQ3TmM3d29uOTlDSSsyWjNDZGdJQy9TN3NoUDQvOUUzMk1E?=
 =?utf-8?B?cjJ1SU5vVkQzZlNWUEh1QzlOZEVJVmxBdm9qR1NKRzJpZE55STArTlYvN3FL?=
 =?utf-8?B?d1ZndGViajI3VmRtQ1hrc2szclBlTjUxdVFxWHBYSU13bi9MbWZuUG0rZ0ZM?=
 =?utf-8?B?TUVrVkozaTZTdFRnN1ZRcmZMQy9tVFAyQmVtb0JYQ093WWNTQzdDR3JLU0Ja?=
 =?utf-8?B?eEoxUzhaNkZPWTJBZldOT2lZY3ZjamZJNUZCNDhpZ2NIZXhPNVNYdUpJNDJC?=
 =?utf-8?B?M0tUeEhzWFFtaXJmVmpkTWdMTjBSSi84ZHVwdnpZYi9GZC9NdGNEbnhaT3F6?=
 =?utf-8?B?UXlOOEVMOWN2cFgvcnZMaCtLM0tzcjl4Mk4xZSsrMHJ0OWFxblNkUzIwbXFt?=
 =?utf-8?B?Y09BZ2tRV2xlZ3YzMU81R1pENytST1BFTW1BOC9hc1gxdU9aV3NnNnhIZzVa?=
 =?utf-8?B?bVNUa3dhUWhKaGFvUys1THM4V3BRTUYySnRPY3NBdmJCVUQrdTNQaFpwK3dw?=
 =?utf-8?B?VTZsaHg4WDhCVnFyWGs1ODhCbW5RVFI0VmdHT2IrRXJxbnZRUWVKSjlmT3JM?=
 =?utf-8?B?SmRmb200ZlZDTXVaVkZ2YkF5Z0pEME5RQjRPL1p3SGJvMU5yYW9aazB5MURK?=
 =?utf-8?B?eThzZFpzb2tBVkFGUHZjckdKUlc4ZWJ0TVlabm0wT3d2NHpDM05yeWxEVUZX?=
 =?utf-8?B?OGlDT2FJaHBJRDVzYlo3d0svaVY1RS93TnZtZGVzZkREbWhIOEtoQWdKMHh3?=
 =?utf-8?B?dVUzWVkwUzlBakRiUzJSK3AzNm8rRDVHcWhsTnVtN0ZkN1RFTllSZEN5VHBh?=
 =?utf-8?B?c3RXcjBpVDFVTWVFenhmbDF6T3V0WmdDVEgzd0RkTkxGZW5UZVVRVHpVbkZK?=
 =?utf-8?B?VkFESkZyZDRqaXFFejJFM2V5YWViVWplYUUxKzZhUjYwS2pDZEFYdi9qZ0dV?=
 =?utf-8?B?dFBlalpaeDR2dlUyRnp6MnZVVC9LNzROSFh4SU9rTWZHVW5XSUkyVGZxb3NF?=
 =?utf-8?B?UXE2VFgvRnBCa3V1MHZNRnFZRkVCVStKdC9tN0MybXJlYnlBdEhNS2NnYmV5?=
 =?utf-8?B?T01HR2swTnREUmxReTBXV1BpNWVBaUJJLzkyT0VIR3A2WjY5b0pIQjdZTFpI?=
 =?utf-8?B?UlF1VG9zOC9VbDgyWisrNURIM0hzMUtnditzZUhZdTFTZHNjd1pXQ0IvTG1F?=
 =?utf-8?B?V1V1blV3OHpKSDBocFNKNHR5VnUxZjJONkVIeStCTDVFT2pnWVZHTGg5ZzVq?=
 =?utf-8?B?aEI5c3BiS0F0azIrL1lGRUZ3dlMwZGhmTDUzck8yL3k4Z0NzcTcwTDVweGor?=
 =?utf-8?B?RlhZdzdnMUxLcXZWckNUeXJEVXRGZ2Z3SnlFU29UdWFaOVY5Vm4vQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D42204E0F6598948A51DCEFA7193D1F0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
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
	EVkrR9DAdUlT52gssUMp6dSSdkV/YO5mnUwKqVLflZdkeR75tXK7vLeMcbSImV5JreOe+Q0julohCm3OJ+ZK4e/Gh48wpFG5y/Wy/JrvxiemAXZqm4XLnwoE4rmPMpSo8sNklolw46mKjJe168aaaxxp5QcN4agpoeTHIDoFGAY8C4pjttRORSTrt0Jo3D3SskZjHvDHKh5sHox27NXFTLNrTxQl45VTcR0xg2Wh6DASzeLgQDNb0ROZ3eAZpokl67JaCvtD9FoaloOJpbSiXGg4olwbVuw6GejLPaHRaaJrFRdUQCDEaYGzhxNb8ZY+jy4YZPfLLhGeaULyaL82fA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NqG4VgXmUWpYjx3HXvj77UTzELyA86ePvlq30epVQKOl4Gv+1up8BVWdSJCLDhXQouMhGDwQ/j3xyi+o8QW7zUYREKnVn/JRdcrudZfYsDshoWsr3xEb/4NkON/zXPoqvtpg0B3yinftPOlz2IwnYFK669NMS+TVEDytPCMYHIsIrTUtITJcy7uQPhPTPfp8t8eHapRxePnppTpgBQwES+x62Ct/uClimFAYcDKBq1grg031+AGU29yp18rI0zePC4R5Bqdrbazhym2Lih6EXNOmMcwIWKQkovxl+jKjCNW6xL3oOx4NP1EgPrsWD05eZnALxma2SfORyW5WYYFI5wQYHz8QDX3zS5nK7k7ykQ8P90K5LgVMnOsRmrg/mkzMpeUZxU+8Hn0k0zlLaFbete4gUCb3wL6HlEtSigIq7NeM3k83GhdfjoF+UCvBjGS7cbKa7/ZgpVdfyjrH5PPRQYduTEWWzGpHmmsFdDc9CMe+zVD95G9IiFNOGPQpqIMrcbIlBU00Cfjs/iAjwkTUrIFUkDv5jqq2goo5cF6PRo2Bv+14pKaqPyuhP+h0127as6DlcBQHbutg/ZfygLXxemjtQa7ccpJZnkUxzA2DjAcTxnESGqcK+DOwVKKDj8IeDBVCfnECfW9kUL/2zSEL+w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c537ecd6-78dc-4fea-1992-08df3a0d4ba1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 00:48:08.7294
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R12AV04Wn3zIW3rWaQaQfQoe8cIVnyKvOZQ+kA63VL+Wqh3lAEEZ7V8FGXDc2n8/u/Ti21q8+4B7tcS6tZOuaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR12MB773567
X-Proofpoint-GUID: yi0QW6DK10yepBRvPf-OHcAkZ_eG-S0q
X-Proofpoint-ORIG-GUID: yi0QW6DK10yepBRvPf-OHcAkZ_eG-S0q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwMiBTYWx0ZWRfX5T0jaxK2ge+1
 BsVSdpYX+2RqhCCDXyY7VXQdlb/2UhQtRfT5PK5SIa3VsTdRwjlChc+A4StzhZwSqTolGmTM/cZ
 YW/OQP7k389Sc+b4dA25T+X6hIOhqMEOABNsP505znPOK11UnQYkvkm9POevx18l2xpB+RN9Ohy
 fisqBDkg8My6EdovsX4mVCYWGBIcz01/DMP4jb78V/FXmZ7Sppw0ku+WmWJC6Rw8II/l6rQfpcw
 YsC14Dh9WWaDdn6F7UQlilKbJyBHV5TDjzYCmOl6JxHbiDaRokNCDTH/FUEe6VkRHPmD+OF51Z1
 XIkLSxighevzJpby5ymH1zCrnMdu+jDIVFM0I4YPyt+1w7wOsGQKU2OkAImrjljG/G6J+tNAguJ
 zCK/NZr5+RfjGvifFZhz7HJ0rBsX6RKTPdby6sLiFABFmLUwq5gjaoDV9MydRIFdThsU0YxMhi4
 PIosNFF3V4+13DuA64Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwMiBTYWx0ZWRfXyviw80wkzoPY
 p7JHGgB2ObeVrAV4j0BTLXjPc+DpVMzGBygWeF+vue+NRYk+HeA2x9cbz/CuzB3NBRL3+KNEe2z
 2Jr9W4M9JF1V3FRCgkDvLRxklTXuW60=
X-Authority-Analysis: v=2.4 cv=ce5HPXDM c=1 sm=1 tr=0 ts=6aea80cf cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=pGLkceISAAAA:8 a=jQW2Yulzfx7Tq6XjMV0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 phishscore=0 bulkscore=0 clxscore=1011
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2611040002

T24gV2VkLCBPY3QgMTQsIDIwMjYsIE5hdmlkIEdoYWhyZW1hbmkgd3JvdGU6DQo+IFVzZSB0aGUg
Z2VuZXJpYyBEV0MzIHBsYXRmb3JtIGludGVncmF0aW9uIHRvIGVuYWJsZSBjbG9ja3MgYW5kIHJl
bGVhc2UNCj4gcmVzZXRzLiBaWDI3OTEyOFMgaXMgYW4gYWx3YXlzLW9uIG5ldHdvcmtpbmcgZ2F0
ZXdheSBTb0Mgd2l0aG91dA0KPiBzeXN0ZW0gbG93LXBvd2VyIHNsZWVwL3N1c3BlbmQgc3RhdGVz
LCBhbmQgdGhlIHN1c3BlbmQgY2xvY2sgaXMgYW4gQVBCDQo+IGNsb2NrIGdhdGluZyBpbnB1dCBo
YW5kbGVkIGFsb25nc2lkZSBjb3JlIGNsb2NrcywgbWFraW5nIHRoZSBnZW5lcmljDQo+IHBsYXRm
b3JtIGdsdWUgc3VmZmljaWVudC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5hdmlkIEdoYWhyZW1h
bmkgPGdoYWhyYW1hbmkubmF2aWRAZ21haWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3
YzMvS2NvbmZpZyAgICAgICAgICAgICB8IDIgKy0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1n
ZW5lcmljLXBsYXQuYyB8IDEgKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL0tjb25m
aWcgYi9kcml2ZXJzL3VzYi9kd2MzL0tjb25maWcNCj4gaW5kZXggMTgxNjk3MjdhNC4uZGQwZjZk
MjVkZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9LY29uZmlnDQo+ICsrKyBiL2Ry
aXZlcnMvdXNiL2R3YzMvS2NvbmZpZw0KPiBAQCAtMjA3LDcgKzIwNyw3IEBAIGNvbmZpZyBVU0Jf
RFdDM19HRU5FUklDX1BMQVQNCj4gIAlkZWZhdWx0IFVTQl9EV0MzDQo+ICAJaGVscA0KPiAgCSAg
U3VwcG9ydCBVU0IzIGZ1bmN0aW9uYWxpdHkgaW4gc2ltcGxlIFNvQyBpbnRlZ3JhdGlvbnMuDQo+
IC0JICBDdXJyZW50bHkgc3VwcG9ydHMgU3BhY2VtaVQgRFdDIFVTQjMuIFBsYXRmb3JtcyB1c2lu
Zw0KPiArCSAgQ3VycmVudGx5IHN1cHBvcnRzIFNwYWNlbWlUIGFuZCBaVEUgengyNzkxMjhzIERX
QyBVU0IzLiBQbGF0Zm9ybXMgdXNpbmcNCg0KVGhpcyBkcml2ZXIgbm93IHN1cHBvcnRzIG1hbnkg
ZGlmZmVyZW50IHBsYXRmb3Jtcywgbm90IGp1c3QgU3BhY2VtaVQgYW5kDQpaVEUuIElmIHlvdSBj
aGFuZ2UgdGhlIGRlc2NyaXB0aW9uIGhlcmUsIHBsZWFzZSBrZWVwIGl0IGdlbmVyaWMuDQpPdGhl
cndpc2UsIGRyb3AgdGhpcy4NCg0KVGhhbmtzLA0KVGhpbmgNCg0KPiAgCSAgZHdjMy1vZi1zaW1w
bGUgY2FuIGVhc2lseSBzd2l0Y2ggdG8gZHdjMy1nZW5lcmljIGJ5IGZsYXR0ZW5pbmcNCj4gIAkg
IHRoZSBkd2MzIGNoaWxkIG5vZGUgaW4gdGhlIGRldmljZSB0cmVlLg0KPiAgCSAgU2F5ICdZJyBv
ciAnTScgaGVyZSBpZiB5b3VyIHBsYXRmb3JtIGludGVncmF0ZXMgRFdDMyBpbiBhIHNpbWlsYXIg
d2F5Lg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLWdlbmVyaWMtcGxhdC5j
IGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLWdlbmVyaWMtcGxhdC5jDQo+IGluZGV4IGNhNjlhYzBl
YjAuLmFhODM4Y2YwNjcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1nZW5l
cmljLXBsYXQuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMN
Cj4gQEAgLTIzNyw2ICsyMzcsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBk
d2MzX2dlbmVyaWNfb2ZfbWF0Y2hbXSA9IHsNCj4gIAl7IC5jb21wYXRpYmxlID0gImZzbCxsczEw
MjhhLWR3YzMiLCAmZnNsX2xzMTAyOF9kd2MzfSwNCj4gIAl7IC5jb21wYXRpYmxlID0gImVzd2lu
LGVpYzc3MDAtZHdjMyIsICZlaWM3NzAwX2R3YzN9LA0KPiAgCXsgLmNvbXBhdGlibGUgPSAic3Rh
cmZpdmUsamhiMTAwLWR3YzMiLCB9LA0KPiArCXsgLmNvbXBhdGlibGUgPSAienRlLHp4Mjc5MTI4
cy1kd2MzIiwgfSwNCj4gIAl7IC8qIHNlbnRpbmVsICovIH0NCj4gIH07DQo+ICBNT0RVTEVfREVW
SUNFX1RBQkxFKG9mLCBkd2MzX2dlbmVyaWNfb2ZfbWF0Y2gpOw0KPiAtLSANCj4gMi41NS4wDQo+
IA==
