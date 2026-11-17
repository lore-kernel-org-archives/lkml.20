Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.76
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794890086;
	b=UXHhbOImuisFp/N9RXouaQYA8KvBeknhANcGGhGziN5gg6laKr9gOJmC4SOExVT0yMcx
	 zLfesWJyZ5NB162WfJemjufoWI+57X5V2PCfXgulCa4u3SUHZ6UfIuJSVd3mNcMz5Sr69
	 aq10DiTijzVv+fdo28xd9VarDNHZtU+015pRhzHzu/2mVP1GHyWBNYIH02SsLffiD6FP5
	 wV36Owukg3B9PVSv8OFz0cALNGyRqvzdxaRew9qzsgotPUV3jEUhAw+OyP9jtT8JrhMzW
	 ZxjHKyvMxfbLSQTBNMoNDNYSL5Bu0LZ5ulQFHLjWre56tOFVBDWe9uU5KKrzUgK7phg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794890086;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=fGyZs87pbsSvhhgTElNPVcLsDCodgkelglp8m9Txbjc=;
	b=0KQhPaQGwoImEukLCR5QFWCGfUgCeug1RaJeN9fTJGCxtKXIanqSDHhpIC4gjv3Kasxi
	 9u8n+oNUvU/HYSRSvr31gDg0ZnkRVE41ddBhgJ+Jgf1Lu4/v/kYTP/3Ivm9uXESH2cjmf
	 KshCXE8Dtk9TqSZMc2Lo5JgUvNP8TnowtGLz39eHV14CuGAbeUlVRxLKTmmwO6ucgs0nu
	 TQhE/WgCho+UUu6sJCj49bVy2bwkyBG400EPiCmz+l01ZmlRC4IXE8lz1Z67xPwXqPvcP
	 fYCK1Z5HgRSjbhY15uxC4lQchcaSWl05Ydl2L0HViAUWBQ4kAyiwJmQQysySu3+bJow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aspeedtech.com;
	spf=pass smtp.mailfrom=aspeedtech.com;
	dkim=pass header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b="oo1h/igA";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.76
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022076.outbound.protection.outlook.com [40.107.75.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADA8606A32A;
	Tue, 17 Nov 2026 04:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ADA8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=oo1h/igA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYdpykzTTUSDDh1kkTzohDG27S07F84tqREFS1FfWG8Mq+j1uAINWON/nkSzVWS4w4olpMjwyG6HDVP0K+dQCLPRKa7A6G0XNodZeIcS1HTyxv8wovi1lBvOqnz8Lll5fYn/XltUe+2wfbgBg9REDw1Lbp9BpZhthW8KdYhS36EYeTGNGgvacgfpCX/ZbFoD54MxHIH6vbykcs71Pkq6tiZ67bl+2vjypwtE5/v/aEIsMT3rWRGdOBn9/812oujHyNurvS4ZMf7V9LOWZ+oZG6W1TjtJQAK31vCVCKPQX7eYVBp/zOXJRw0JihzdEYObPqYHxNnz8HKwwkCoCt74Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fGyZs87pbsSvhhgTElNPVcLsDCodgkelglp8m9Txbjc=;
 b=x8QebbUNOnIV4ps6qffA6yMbkb1zE1+DuXpgSooscuDYirUB58G9MY4FbJ6GsaZJtVVGnCHiG3877CB6N6R/33Wnb/oJFSKrM8NX1+annfz5oF99M78njRX+et21jp6ZTr1xBCPmi9mzksbyAvzKs3yef8Y72NuujeRJcO/BZ1MErtJtq7Y/r83n8iiRsuRqnzmJ99HNZjEaWv7nWqW6Ltr3ToaP7Qi/DoginZjhZcAYw4tEWE0iKawUnuYCA7/lJJmNxELSA0dq/xnqIdGTrY8y3oDWJMlKgtdSqxq3N1sfOUrHVkmxWLwi6B6Ffa2ps05wN8lLHSQYiHocns7JWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGyZs87pbsSvhhgTElNPVcLsDCodgkelglp8m9Txbjc=;
 b=oo1h/igAMkUz3Eg4vf/kOA+u8y6c3Nu+7oMTBP2QoUPBiMnFRvPoh6z2kOlW8/0u/tV5B55acYhKEkFVt1LDs8azOjAQLaCdnoPe1xKI4QCab+EiUgT3v07N2uBMr7gUQSd69WttTMIG5Z2tftGRHjojvt597sbjSPJ6APtQ1mhi/9u97MvDbF2tQNNsfJDFtiuNiLrT0ceLbPmf829elBJLPd2XyVTg4qPtv3oKovK9N0wBB2vZ2JE30Lo1G8L5jxNPnTJ1ul08h2C2qOeICEZevmIK/IGhfx0aroN1eMku2ZDjsgyoKh5lnx6VaMS0OTTiHS1I372U34xNBAx0Sg==
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEZPR06MB5965.apcprd06.prod.outlook.com (2603:1096:101:ed::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.7; Tue, 17 Nov 2026 04:34:42 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::9d82:c43a:404:99a9]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::9d82:c43a:404:99a9%7]) with mapi id 15.21.0639.006; Tue, 17 Nov 2026
 04:34:37 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Andrew Lunn <andrew@lunn.ch>, "netdev-bot+sashiko@kernel.org"
	<netdev-bot+sashiko@kernel.org>
CC: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "ratbert@faraday-tech.com" <ratbert@faraday-tech.com>,
	"edumazet@kernel.org" <edumazet@kernel.org>, "hkallweit1@gmail.com"
	<hkallweit1@gmail.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject:
 =?big5?B?pl7C0DogW1BBVENIIG5ldC1uZXh0IHY2IDIvN10gZHQtYmluZGluZ3M6IG5ldDog?=
 =?big5?Q?ftgmac100:_Add_AST2700_compatible?=
Thread-Topic: [PATCH net-next v6 2/7] dt-bindings: net: ftgmac100: Add AST2700
 compatible
Thread-Index: AQHdcoFN+8JnXVXgiESP7FRZBqX4RrcwvuyAgAAEf4CAAPEScA==
Date: Tue, 17 Nov 2026 04:34:37 +0000
Message-ID:
 <SI2PR06MB51405A2A5DD4F1E8FCB108669D7B2@SI2PR06MB5140.apcprd06.prod.outlook.com>
References: <20261112-support_ast2700-v6-2-238020bf46cf@aspeedtech.com>
 <179483725554.3136.8359940788845125105@kernel.org>
 <51667f1f-4f2b-44ea-b725-87cf63c2c9dc@lunn.ch>
In-Reply-To: <51667f1f-4f2b-44ea-b725-87cf63c2c9dc@lunn.ch>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5140:EE_|SEZPR06MB5965:EE_
x-ms-office365-filtering-correlation-id: d6b783ce-f1f1-44e5-701e-08df44641645
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|38070700021|56012099006|4143699003|261022105027099003|261026121527099003|261028144727099003|261026140227099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 q+ahv3THG1RzljMOUSvmu3U9s0LvQB8IHnm+j1amwk7e1R33T0o7/vuzqgu+6DUGGjLeChRAdFQONeNQsW03BN5e0Gxh9PDwatY3uvAN+l/4f+grrxT3Y0Qh12o9YT1vLLBoM9qiRBvdJ+wUbvb6lZdRsSQQQYNrrw/9+VuDzwdAdbXZUtPzDlQegvQU3xePmQn8NHx7KOKxtH8tc7bUdEOGzxA9AdfPlm+YSwBdZZSYl2R7XvxdTxXc3/1ZD3JiItqcl+oIF2ZMAcf2D43ysX4Mem9nGOpkO3Z31exflYpSQbwSEBPThOUWSVg+ZuEhZUJxklHTpODt5n4NYQ5rMVmBnzZVXp/xRE6lhnxv7pJ0S92CDSn3gNFEz/wGYMtqtzOPqSe/RpgTfDD02pWw8OqsxHFTAwIYk2mNhiBCXMSXrcY7ba1zeAl7JEGcEFE9RPVApeP5myUJ2Avrr8K6uQzDKiUKJfsjVNj5tCfAxllg79XM3D8yyGeYg5DA5rJO9gKrScrKxIdgRmvan6lfPQUnQ9vA4Z3oCQJi87X4fHVehQWMsJEPf15IS3rrglveIE6ZOIpKp0YBgfmaYpgbVKkj8k0ugQ/4BJw+NSNaN3tEhFhId1anpJMm2qf1qEYiFaRy3OXAS9bPjyKGmN08ICUnI+exh85Gr2nSytdivkB6hjkgWZR8Gnfog3bLNwBI/uQskiB30kBVdunBFl7OsvyX9TKqBr5HJkuUnmin07o=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(38070700021)(56012099006)(4143699003)(261022105027099003)(261026121527099003)(261028144727099003)(261026140227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?big5?B?YWVFcU12djJad2xEWlpWQnBWc0hBSFkzdFozM2wwNFlKTlFQSGczcm5FTzBRY2pX?=
 =?big5?B?RjdCdlM1Q2JYb1ZJYXJ6Yytzd2VrdE5TSkZHVEVLYzVWajBwak0yVTVZL2hNNldZ?=
 =?big5?B?Vnk3QUJCcC9HZHQxNVU1c0RVZHlOOGJqRVNDazBxZnRUU3AwQ3k1MkhrelQzaito?=
 =?big5?B?YVRhQ0thd296QmIyczY3S09FMDc3YVlqMzZ5LzRyTElFQnZtbXA0RlZTRWs2b2dK?=
 =?big5?B?K2txMUVKdWdwVXJXaEFGdEFpYnBKN1VYYS9zYW4xRWxXZGJnWm5QNXBrd2Nhcmx2?=
 =?big5?B?VVRoUWU5cTVwblZrNHkrSTF3OUN3UnNuRzE4TUpkR0l3LzVQdTY2R042M2VuTi9X?=
 =?big5?B?anlNSllVcHlKRVR6cUx3cWUxUk05SkFBWFQ3SDJUTlVFZk1hd0hscUxhdFZxSFJN?=
 =?big5?B?VUFHWStRcUJRWFJDU3h0Q0RWWlZ2a2lrdEcrNUlWWmdtODl0SDhrcDZybzZjUE9j?=
 =?big5?B?TjR3OXhXU0t2akhLVzByOGdKRFAvTUxUUENEZ1NwM29EQmlUaTZud0VTYlgxOW90?=
 =?big5?B?VUx3Z2o3SkpKdVhMb0pPZFd4S2xPaGVBWTM4Q1V4Y1FVcmpzN2VPeUVLWDJsYUsv?=
 =?big5?B?eVY3QkdGL1JTQlFQQ1BaZ1FWOGtndnByMmZ2QStLc1pNalhnVHZNZ09kVTZGcGgy?=
 =?big5?B?U3FwdVRPd3c5a1QwVlVSYW5EK0U3anQ4NEVXQUdabURUZXJ2SjZZazErZzQ1eXNW?=
 =?big5?B?MG9Ja0EyaFNxVUNlb3JSK3h0eGlCTCs0VzJ2ZnRBMG5rcU9hREZsRDlWMm9tMjlT?=
 =?big5?B?ejk5b2tKQzBNNy9ZTVdqdTJFWnhYYkY5NTFOdjhGRTFkbmg2Q1VFRER2d0FUdGFE?=
 =?big5?B?aGhxdk5IV0grZ3NUTWNnTGhOTWNBblhqTHdmU25RVHBFNXZyUUhpSWNOZitWLytS?=
 =?big5?B?WEhEVjhEcjN1V25lU1lYWWZvK2kwVXNSV0pwMHBFT3BuS0FWU1BvK09XMi9NeElR?=
 =?big5?B?bG8zZVZ2U1pJNkIrd2NVOWxMQkdSQzVSZjVqSjhocjZhcnM1aVRGSkNmaFBCYW16?=
 =?big5?B?L0ROSlo4ZGVEbGxaOE5yZlJGRmxkMFdRUTZ5a0FOOFhWS3pqWUpCUTQ0WjMvdnM2?=
 =?big5?B?Q01pWXF0eGJWakpSRlh2RmxNRXpud1BXbHpQNlIrcHY2ZG94a3VCTmJnaHNjQWZv?=
 =?big5?B?eCttaU4xY0ZrbmJnKzczNldBK21hTGc3cGpGVFZlc0NnM0JQYWVGNytjakE2STND?=
 =?big5?B?N243VUhXMnRERnZNTWZaS0dFcEJPODZlS0RpTGZDV2hDL0cwdFlzaHNtZW04eTBD?=
 =?big5?B?dGRMVTlMWC95ZXUyaFpjM09YVzlqelBQTGp6UURKUDdUQlU2T1RWZHBDZktpamYz?=
 =?big5?B?Q0tLLzFaNmRySnE4YlhQUk9wVHZ3SmZ4dEhkQ01JTkFlUEpodEZnelNxZXNOV1FF?=
 =?big5?B?ZUkrMUFHZGlqOSttL0hHcVZ3czhOZEE2ZFAwYVQxSDVLTUxYSmhIRXFxS2szRU9E?=
 =?big5?B?UlRJSlBKOWNTZjZqeEx1Q0NmSFd6NFZXQmxFTHNYYXJlczRTTmZBRjhKZWtad2Ey?=
 =?big5?B?ZmxZblBsTHA5MmcxTnlvc3VuUEZ3ZFRDU081SCt0SDc2T3hmZnNNQyt5U3kxUGsy?=
 =?big5?B?UC9pVkdqRDZNcmtWSStRd3RpbkhUbkg4Ync4OWhkTHJaWTZUSS9wQ2lyWklKQzlX?=
 =?big5?B?VHNMRVI0S0U0UDZycW9zUnZKME5tb3FFWFkxWGpmNFdZUW9sR2l2NnlxdSthTGFl?=
 =?big5?B?MzZMbHM1MHU2WmlnMWVnZ0FkbXNmZEVscHcweGFadUtrYVFaS3R0MklVZ3YxNHhq?=
 =?big5?B?ZUxWUm1HOTBKbVhvQ1Z1RVJNRHdUSXlvc3RpZUlBZTVNaDZMakhZbW5HU1hNVWFN?=
 =?big5?B?bmd0aExEZ0Q5WUk1STFNK1NYaEVhQTM0LzVoWGZpUWFieGE1QnhjNm16QnFvR05J?=
 =?big5?B?K2J6ekNhU1JMQVN2cmZzUC9SeFBNSFdXSWp5dkliQ1k4eWpiN2kremZyT29yT1lI?=
 =?big5?B?eThPbU9FTkVZWWNyK3d5bVd6L2ZaQ2EyYTcyUldYVEcyZHBaMnA0SHl0UENuZi9K?=
 =?big5?B?alBDRHFJazFldE53TVVWVXplK29ITHlidmMvb2tOS0g3eU9OMEFlT1Z4Qk5rdlFz?=
 =?big5?B?V3FNdmc2bmJUUzZGdFdtZ1U1ME5LTVdORnZlZE1pZzRuelRLdWtqeDZnNlhJR0xm?=
 =?big5?B?WFBjSWJYTzhmaHR5bHU0OFQ1N1NZUVExdmRzcnE1S0g0T1h1bkJaOGZ3K085NFc1?=
 =?big5?B?aG4rd1pudEFkQm9QZGZDNTNGeTNvQT09?=
Content-Type: text/plain; charset="big5"
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
	JR6wd+jEhhZA9lVfeIzhbTZNA3gHvTydbfI0oMFhyGlAPqamGj9DcxEtNsWjbAO1yy+dEp8kaUGbydzdOONl1oDHO3HaDYG9Q+JEkGFW5SMqCDmoea7HtoVWpb4nMxXPCZN1WcUj73VTCTAJr0pxzEHTtjwNxjUVmg5vzpUU/CJplKN04fd7eP9rj1KmEtXX7I0P81L9KvzjNPMTr1kpSLqG5oK8/rt3yPohLPm5tsUwKCyQXcKVAfa6LfptQN4u7biyPxL2V3dyytlmhXdSCmdm9Y4cRHjcOMbzbT8eF/Im9VNO3yM0Tm5qVxd5XXAnrEhBPukdpdQSICuCDbpMEQ==
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b783ce-f1f1-44e5-701e-08df44641645
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 04:34:37.0541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KtBzHnB/wjract1hnBcNpwhVcrDxOr3HtrlTkFVWSJGeRE3/nuFfcDnF0zz82QEUaSHnnYul/AvP9b9VHSu8VNygLLlfM2cZ3cl4Cur6ddc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5965

SGkgQW5kcmV3LA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuDQoNCj4gPiA+ICsgIC0gaWY6
DQo+ID4gPiArICAgICAgcHJvcGVydGllczoNCj4gPiA+ICsgICAgICAgIGNvbXBhdGlibGU6DQo+
ID4gPiArICAgICAgICAgIGNvbnRhaW5zOg0KPiA+ID4gKyAgICAgICAgICAgIGNvbnN0OiBhc3Bl
ZWQsYXN0MjcwMC1tYWMNCj4gPiA+ICsgICAgdGhlbjoNCj4gPiA+ICsgICAgICByZXF1aXJlZDoN
Cj4gPiA+ICsgICAgICAgIC0gcGh5LW1vZGUNCj4gPg0KPiA+IFtTZXZlcml0eTogTWVkaXVtXQ0K
PiA+IElzIHBoeS1tb2RlIHJlYWxseSBtYW5kYXRvcnkgZm9yIGV2ZXJ5IEFTVDI3MDAgTUFDIG5v
ZGU/IFRoZSBiaW5kaW5nDQo+ID4gYWxzbyBkb2N1bWVudHMgdGhlIHVzZS1uY3NpIGJvb2xlYW4u
IFRoYXQgbW9kZSBydW5zIHRoZSBOQy1TSSBzdGFjaw0KPiA+IG92ZXIgUk1JSSBpbnN0ZWFkIG9m
IHRhbGtpbmcgdG8gYW4gTURJTyBQSFkuIFRoZSBmaXJzdCBleGFtcGxlIGluIHRoaXMNCj4gPiBm
aWxlIHNldHMgdXNlLW5jc2kgYW5kIGhhcyBubyBwaHktbW9kZSBwcm9wZXJ0eSwgYW5kIHRoYXQg
aXMgYSB2YWxpZA0KPiA+IHNldHVwIG9uIHRoZSBlYXJsaWVyIEFzcGVlZCBwYXJ0cy4NCj4gDQo+
IFRoaXMgc2VlbXMgbGlrZSBhIHZhbGlkIHBvaW50LiBNYXliZSBtYWtlIGl0IGNvbmRpdGlvbmFs
IGxpa2UgdGhlIGNvZGUsIGVpdGhlcg0KPiBwaHktbW9kZSwgb3IgdXNlLW5jc2kuIEJvdGggb3Ig
bmVpdGhlciBpcyBpbnZhbGlkLg0KPiANCg0KQWdyZWVkLCB0aGFua3MgZm9yIGNhdGNoaW5nIHRo
aXMuIEkgd2VudCBiYWNrIHRocm91Z2gNCmZ0Z21hYzEwMF9wcm9iZV9kdCgpIGFuZCBjb25maXJt
ZWQgdGhlIHVzZS1uY3NpIHBhdGggbmV2ZXIgcmVhY2hlcw0KdGhlIHBoeS1tb2RlIGNoZWNrIGF0
IGFsbCAtLSBpdCByZXR1cm5zIHZpYSBmdGdtYWMxMDBfcHJvYmVfbmNzaSgpDQpiZWZvcmUgZnRn
bWFjMTAwX21paV9wcm9iZSgpICh3aGVyZSB0aGUgQVNUMjcwMCBwaHktbW9kZSByZXF1aXJlbWVu
dA0KbGl2ZXMpIGlzIGV2ZXIgY2FsbGVkLiBTbyByZXF1aXJpbmcgcGh5LW1vZGUgdW5jb25kaXRp
b25hbGx5IGZvcg0KZXZlcnkgQVNUMjcwMCBub2RlIHdhcyBpbmRlZWQgd3JvbmcsIGFuZCB0aGUg
Zmlyc3QgZXhhbXBsZSBpbiB0aGlzDQpmaWxlICh1c2UtbmNzaSwgbm8gcGh5LW1vZGUpIHdhcyBj
b3JyZWN0IGFzIHdyaXR0ZW4uDQoNCkknbGwgY2hhbmdlIHRoZSBiaW5kaW5nIHRvIHJlcXVpcmUg
ZXhhY3RseSBvbmUgb2YgdGhlIHR3byBpbnN0ZWFkIG9mDQpwaHktbW9kZSBhbG9uZToNCg0KICAg
IC0gaWY6DQogICAgICAgIHByb3BlcnRpZXM6DQogICAgICAgICAgY29tcGF0aWJsZToNCiAgICAg
ICAgICAgIGNvbnRhaW5zOg0KICAgICAgICAgICAgICBjb25zdDogYXNwZWVkLGFzdDI3MDAtbWFj
DQogICAgICB0aGVuOg0KICAgICAgICBvbmVPZjoNCiAgICAgICAgICAtIHJlcXVpcmVkOg0KICAg
ICAgICAgICAgICAtIHBoeS1tb2RlDQogICAgICAgICAgLSByZXF1aXJlZDoNCiAgICAgICAgICAg
ICAgLSB1c2UtbmNzaQ0KDQpvbmVPZiBoZXJlIG1lYW5zIGV4YWN0bHkgb25lIG9mIHBoeS1tb2Rl
L3VzZS1uY3NpIG11c3QgYmUgcHJlc2VudCAtLQ0KYm90aCBvciBuZWl0aGVyIHdpbGwgZmFpbCB2
YWxpZGF0aW9uLCBtYXRjaGluZyB3aGF0IHlvdSBkZXNjcmliZWQuDQoNCkknbGwgZm9sZCB0aGlz
IGludG8gdGhlIGJpbmRpbmcgcGF0Y2ggZm9yIG5leHQgdmVyc2lvbi4NCg0KVGhhbmtzLA0KSmFj
a3kNCg0K
