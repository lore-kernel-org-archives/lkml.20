Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.153.120
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794868610;
	b=4ZbE1Jg29LIJinHRnzCmXdeVVuOpNbQPD164i6fZBzmOEnMkQOvk7GXAWQJUkYZMiDIB
	 uxFI7WEBGO0r93JolcuGRCKcvH99oCuMabs6qVPGYwVvDREk+WOdNapx/vqBcX8XRT/nf
	 SsaJ8fFdQOWQL/amL10tEtdDN2ZyjFXjT0pTdT0OVW3qX1YB11FC++bdNccHB9/v8L4GY
	 p8DTsz5HgR8lz2tJw9rLjIPHxRrpv6wT9Neq/IUZ4o2u9BDZqTsvWTZwf+j4jm7oDTcZa
	 U695XpIxVmUKXoThXzAifWr/lgz4oJpriadomRdVJBRhqC2b4mY+jcfNcBq1eyA4L+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794868610;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Language:Content-Type:Content-Transfer-Encoding;
	bh=hyzgM9dXvkX5v8zBHKoVo5Pzp/x6tSgBundWlT6O8gM=;
	b=HR2dfFoPLMbCmAidA5/Cqi1WmcibjpWA3KiEI7Kl+u7gVbvbNipwY2y/IFc4V6KrZkyY
	 zPfn0Rq7+R414Tud0zZXfLjzpXP3Ve0z8i2Cyr/6HTs2sBUJljYnHH81J/SFmU6l1CgmG
	 iMkoDfNuDcq+XvMDRZvl1SpvW+ndTZmo6rQ8zLuafgEnL+ld2WcXPpv+c3fQ2q7U2q/Cl
	 QlDbgsluoLYSJuc2yY+6L5Tyr363eBfKKGDB6IHLchMycQ5SAglvkwuoLO5G7SmkyG+9k
	 IZULN3iQMfPrEvEFb7SS89tKZYMaLvflv1mQfHV9xSkjF46hS0ecUavoUumGss6zK9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=onsemi.com;
	spf=pass smtp.mailfrom=onsemi.com;
	dkim=pass header.d=onsemi.com header.i=@onsemi.com header.a=rsa-sha256 header.s=mimecast20250127 header.b=WyVFZvvN;
	arc=none smtp.remote-ip=170.10.153.120
Received: from usb-smtp-delivery-120.mimecast.com (usb-smtp-delivery-120.mimecast.com [170.10.153.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7235D606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7235D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onsemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onsemi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onsemi.com header.i=@onsemi.com header.a=rsa-sha256 header.s=mimecast20250127 header.b=WyVFZvvN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onsemi.com;
	s=mimecast20250127; t=1794868601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hyzgM9dXvkX5v8zBHKoVo5Pzp/x6tSgBundWlT6O8gM=;
	b=WyVFZvvNzDqxGL7RAhBc+T5U8mzyfcWLVsSh13aKogM7vfigEozwQkR4t6Io0nBNwFTP3F
	cHan/d6g6io4bzXCGUuuQ8uR5QveKGAlUQYMxlWY4IgfGuX6I/4+T5HhDTxvegOs4vVsa8
	koDsU14XhDwj0tk5Zllm7VAxrVndEAOcGclV0zLRvUOfb4wWu1bCZlCueHC0HbBsrsjPrR
	pf4Gigzw4qMkB15RntQYMhS/ctoGE6+6qveJul4uwbeGQaUd+LiTLZ9Ne1B+8LQUl+jkzi
	p8sRTVdHFEzwnHWNDoMPBrQlMgh5z4sIG+bdtKOz8+F/mEjWsSlavoPnAYXwcg==
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012063.outbound.protection.outlook.com [52.101.48.63])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id usb-mta-70-CE9V889RO4uWdfg-0_6Ecw-1; Mon,
 16 Nov 2026 14:36:33 -0800
X-MC-Unique: CE9V889RO4uWdfg-0_6Ecw-1
X-Mimecast-MFC-AGG-ID: CE9V889RO4uWdfg-0_6Ecw_1794868585
Received: from CH0PR02MB7867.namprd02.prod.outlook.com (2603:10b6:610:110::22)
 by CC6PR02MB312476.namprd02.prod.outlook.com (2603:10b6:170:209::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 22:34:23 +0000
Received: from CH0PR02MB7867.namprd02.prod.outlook.com
 ([fe80::d722:d686:a9cb:6c2e]) by CH0PR02MB7867.namprd02.prod.outlook.com
 ([fe80::d722:d686:a9cb:6c2e%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 22:34:22 +0000
From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
To: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Parthiban Veerasooran
	<parthiban.veerasooran@microchip.com>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Richard Cochran
	<richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
	<hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Eric Dumazet
	<edumazet@kernel.org>, Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Jerry Ray
	<jerry.ray@microchip.com>, Ciprian Regus <ciprian.regus@analog.com>
Subject: RE: [PATCH net-next v11 10/14] net: ethernet: onsemi: s2500: Add
 driver support for S2500
Thread-Topic: [PATCH net-next v11 10/14] net: ethernet: onsemi: s2500: Add
 driver support for S2500
Thread-Index: AQHdc5BowdVTxN3v+UOVrKAtGFYQercxSTBQ
Date: Mon, 16 Nov 2026 22:34:22 +0000
Message-ID: <CH0PR02MB7867CE1D45CBC874F8E5FE2E837C2@CH0PR02MB7867.namprd02.prod.outlook.com>
References: <20261113-s2500-mac-phy-support-v11-0-7a186141952c@onsemi.com>
 <20261113-s2500-mac-phy-support-v11-10-7a186141952c@onsemi.com>
In-Reply-To: <20261113-s2500-mac-phy-support-v11-10-7a186141952c@onsemi.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR02MB7867:EE_|CC6PR02MB312476:EE_
x-ms-office365-filtering-correlation-id: d8006a5e-5007-4320-ab50-08df4431c31f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|18002099003|6133799003|22082099003|20046099003|261009223027099003|921020|11063799006|56012099006|10067099003|4143699003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261022075727099003|5023799004|38070700021
x-microsoft-antispam-message-info: JIx+2t++9df8ZNOwqvHBmpiM6kcFMMyl/bHRaike4JLOkMg1xO5oMJyS5UTQRpXfemNjuzqjtoiYSwGhB4EJhV7bEuHQgKXg9uqrQQuV+ktSyv1VDLY1SgDQcav9JXC3WdE31Cd3arFQXn3by8CR1EhPA5RTofqnTaZVlrNXSxoZLBz7/O+zPoIJeENq1OsFnF+RSWiHYXZnJ9qiqG0iFodDu+8GbPz2jF7q+aLctzgHOc5Qb7APWsUwNZVxSmxs7UwzKf9hbaMLosQep0XURl1lRcBCYz15QKeyD58CqlrcaAFZEjbEhK3ISJV25UY7Rebw5NPN4ZqHZVIW/WQIxe/VSb7TJdxodVxZ7gLGOiIcnuzuTYCNzXP0p/A/DFuilh2s/9nD7bg3jVpebSE6y67+SGhnVGgkmuKXRCykq4eBtvMvRqV2pqF2UvCkLh/sfI5J+DTabtR12Kp+bPMuwZS7Mm+GUZSj6UXoURQVkj/cbrdDa/l0rRqbLspVMYkwmti7uSdQc9cX3h6+P03iR4ojbbJ4D3ELgpETUrjINa7QbsfOPw3HXlu4ds5YMWzcWZLMt9G9XOaHvuZqt0IFnMBLL8nH4pCp3zy4/EQqeKLr2fLFFEQ08cHuVm90xV8vEf8tHLOC3bi3AXCSeXbyYc0GWRpYHKk7Wsq/xs6Sy+LLYRU8/RwTA+3n7cP0uBL7
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR02MB7867.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(18002099003)(6133799003)(22082099003)(20046099003)(261009223027099003)(921020)(11063799006)(56012099006)(10067099003)(4143699003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261022075727099003)(5023799004)(38070700021);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y1FsY0ZyRThjNUJaVmR4M29NS1ZabCtUVUw5OEI3WmRWZW5qcThqeGt4Z1dz?=
 =?utf-8?B?ZytMbVZIRXdLLzNuYVQzeEM0SnYxOG80Z2F2Nytjc1hRT0VZNHlnTDVocTR0?=
 =?utf-8?B?anMvTXRFdjlEYmt1OVhENXFUbnBMMytZd05GZGs4YTlvUlVTczZxdzRGeVdL?=
 =?utf-8?B?dDMxQTJBYTBHajR5YkxKa2pndWtNK09MTWVqcVltcmsrY2pRbmtFOGRsT1pE?=
 =?utf-8?B?czdrdEZvNWExUVpOV0kxQTZOTHdvVVZoTmdWUTJaMFVNeVd1Y296aHJsRUd0?=
 =?utf-8?B?VGVGeU52UGNidVM4Ymc0WTh1dHI4cWFPMVdxWGFoUTZiU2htdy9SeTU2VFBO?=
 =?utf-8?B?bmJSYjc1MGYrcytVRDc2cWYyMkh2TjdydEFIelRtYkFKZXRKUnJUMDFCazVz?=
 =?utf-8?B?MzBFcjM3OU1XT2lXZlJxYjEzWjlrOWpQc2VFRjJlNjkxV0dxcFU0K1QxQWMz?=
 =?utf-8?B?L25SVUdvZWJVRGhJQjdENlJiclBVV2xvamwycnRFaXhIaWs0NDAyVXY2TkdQ?=
 =?utf-8?B?RUx6YmNHK2hsenoyQVJrNlhhV0hxOGsreDl2dGpWWFBIS1k1aVIrT2YwRjFu?=
 =?utf-8?B?dTczblF1eHh1MVE5M2NLWDlORXowWUJvSEFHTnEyM2x6aHNTeHRpYmpXY0x4?=
 =?utf-8?B?S1U4K2x5c3lvdFNhcmpWT05Pak5zRDVyNXkzZ2hhTnNxSG1UczZaeUVEYnlw?=
 =?utf-8?B?c1FQdTlOZE56d25uNHVsbkhiSC9Hc1ptZjczeURiQm1vL1B5Q2lJNnM2eHRj?=
 =?utf-8?B?QndpbjNuVEd6Wnp6d3AwQkY3TGI4U3hYQ0xvWXJ2cWYrRzFXNXJ1SHBtN2hx?=
 =?utf-8?B?bFZmaEh3UUJxTkxuTnVIbmJMWWtjTHZjaHBzb0NxSFluUkFEcFUvYUJUUEtT?=
 =?utf-8?B?bVBnRGRHdDlnZ2xNK1NMK1VTREVueldkWWNoMkx5QVJyYmd3T0ZvWEZhcWg3?=
 =?utf-8?B?UTRtNTdLSlBmRHhYVEw0bFh1ZTk3Q243VW9Fc2pvellPVFcyUXRIK1JPQkNw?=
 =?utf-8?B?dkFTdUY1RktKa3JsenlHazlDTkJMVU02MWl6cnd3cTBPTVlUZ0t4enZsYVNZ?=
 =?utf-8?B?SVloNTcrYVVZTnN3RHAybFlGM3V0aU1uZmJZUW54c1I5RytxSnl4SmY2a0Jh?=
 =?utf-8?B?QnhvMHBDQmNpVDR4WWZvNSttUlFHV04wR2lqU04rMGp2TjJLMG9KNW1zWVg1?=
 =?utf-8?B?NHBMWUhKWUhPdjNFQ2ltNjBONHFuRm84KzFEU1Q4dnZ6R29PaGVnOWZmWks4?=
 =?utf-8?B?Z0NmUHYwZFlEdE9tWm80YnlkcGhLQktHTXRwVi94VzV3MXkwT0djcm9nektQ?=
 =?utf-8?B?MU5VUUd0T1BGVU40OExuWUgwTSt3TjUzbG1uV1BZN3YzamNZeUpjWjNhNkJt?=
 =?utf-8?B?QzRvMUIvR0dsc05pQzhKdUxBZGo1cjUxTnpMcUxLSnNZUFAza2wyVXBZOVBn?=
 =?utf-8?B?WEdwc3JyMEdYNUVqUkFvYU1Pa1ZzZHFxTEFTWE1PZHVMN1dGRGtoRmE1VVpx?=
 =?utf-8?B?ZWxscWlIZjZERDBvWkJjdmJoc2ZQc0MxbTVyd3IzaEduOTFmTms0LzVTYXpp?=
 =?utf-8?B?UFMyc3pDNXl4NGZNNEMyWWNIbnllZVZaVVAzNFBwM3VucSt2b1FXT2dLSTFG?=
 =?utf-8?B?cXZHeTJ0MWx2ak5WZE11WXY0Qko1VndkdlRrMnppNWZJRFVVZFF3MGEwTWZX?=
 =?utf-8?B?VWlhYW94R3BWRTNzNmM4RmNLOVFRK0dGcmpadGNMemg2RTQ3U3VOZVlJVUY5?=
 =?utf-8?B?bDY0TVdYSVhUdmNlQ3FZVDhCWVppRFhmRWU3NnFBM0dkSzhJaHBTa2Q4VEJ5?=
 =?utf-8?B?eGRJODhnelc1Z0d5bWcrMWRjL2ZKSWRzREZqMHZiYUlTYkFTRjRwRjcvL3V3?=
 =?utf-8?B?TUcyT3V3YmxQK2FIZnQ5QUx0QklzTmVLRXV1ZHdVLzkxN1crVG4wMnFia0ZL?=
 =?utf-8?B?eVowNlNHVm9ucjBHdGdBNEN0VS8xL09wWGJ3bjdVWTRZeVJXd1dRMHJUUGVM?=
 =?utf-8?B?UnA0cUovUGFobW5qNzhQbHp4dHg5WkpLQnE5NFhwWXZxUXRzeE1vb043aXJy?=
 =?utf-8?B?bUc5YVhaRXVjNEU0ODhOcklpenZkTXJhUnI3VDZGeTBseVZnczNrRzJMYktD?=
 =?utf-8?B?cnpESjhoaS8yZDF0SkNiVnJKQWpXNWJUelRNQXlmZG5Cek5aU2NlNFh3bUs1?=
 =?utf-8?B?c3haSW9DOWo0QkxBRGZibVJrRktjcFpsOGhlS20zYVhHS21xbjR4QUlzOE9K?=
 =?utf-8?B?TW40Q3FBQlBpNlAwUkZvQ2Z5ZVIyOXF6VlRoeU55QnI5ZCtMNDRvM2VOMUtr?=
 =?utf-8?B?TXhXcHZqalMxbFJkNEt6bnh3MEttZnhEQTBISkpobzFxTlVIeHh3MVo3K1Mw?=
 =?utf-8?Q?OTUV9jzSzYGJt1Ts=3D?=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 3ygZXhEjfqY5zw5WKRvN7wxkJI88J5tcX/wOjy5AYYsFVQkn2Vmnn6KW5fII0onXwSULZo4aiaHnBQtgSeSFTfpqfx18txoerG8YIDKjoI5MoyzNoZqwuE3XO0X24j+P66p+CuCbBGoadSyJQrfl/5zxKY4mrNtDfjZZdLyF0r57q7NtQEG/kYb5loZDGy/D/oVWXBnwIFjhWJIjpy9gMn1BngFyjvxMrVCAQJSDCxS24JIT//TYq/LRUvPpr7DI0sObrf+zUWYlp1DqSs+vRZE/L3ZvQPEcFm2RyK048glM3i2zPQZ43xgXh+oVdHaFyAskasD7fOJxOtG9HpNX3w==
X-OriginatorOrg: onsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB7867.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8006a5e-5007-4320-ab50-08df4431c31f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 22:34:22.6878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 04e1674b-7af5-4d13-a082-64fc6e42384c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5+6RXVTZ918fUVPalgPvmRzLMWetxIb/FdA/t4/TmyPY6V2L/iJuV8iJwfZUTgppnAUOfWXhwipTzG4Vr1J2ID65Dp77Ow/UoegdoM5pU7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CC6PR02MB312476
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0EtqF14MtWwNXbgHleP75eZ2HY9ZM9TSlWjwkgLViIM_1794868585
X-Mimecast-Originator: onsemi.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

QW5kcmV3L1Bhb2xvLA0KDQpJIGFtIGFza2luZyB0aGlzIGJlY2F1c2UgSSBoYXZlIGEgY29uY2Vy
bi9xdWVzdGlvbiBhYm91dCB0aGUgc3RhdGUgb2YgbXkgc3VibWlzc2lvbi4NCg0KSSByZWFsaXpl
ZCBJIG1lc3NlZCB1cCB0aGUgdGl0bGUgKGVtcHR5IHN1YmplY3QgbGluZSBmb3IgdGhlIGNvdmVy
IGxldHRlcikgb2YgdGhlIHJlY2VudCBzdWJtaXNzaW9uLiBJIGFtIHdvbmRlcmluZyBpZiBTYXNo
aWtvIHJldmlldyBpcyBhZmZlY3RlZCBkdWUgdG8gdGhpcyBtZXNzIHVwLg0KTXkgcmVjZW50IHN1
Ym1pc3Npb246IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvc2VyaWVzLzEyMTA3ODQvDQoN
CldoeSBJIHN1c3BlY3QgaXMgdGhhdCBJIGdvdCBjb3VwbGUgb2YgQUkgcmV2aWV3IGVtYWlscyBm
cm9tIEFJIHJldmlldyB0d28gZGF5cyBhZ28uIA0KMSkgQXMgeW91IGNvdWxkIHNlZSwgbm90IGV2
ZXJ5b25lIGlzIGNvcGllZC4gU2VlIGltbWVkaWF0ZWx5IGJlbG93IHRoaXMgZW1haWwuDQoyKSBB
SSByZXZpZXcgc3RhdGUgc3RpbGwgc2F5cywgIlNhc2hpa28gcmV2aWV3IHF1ZXVlZCIuIE15IHN1
Ym1pc3Npb24gd2FzIG9uIE5vdiAxM3RoIChTZWUgYXQgdGhlIGVuZCBvZiB0aGlzIGVtYWlsKQ0K
DQpJIHNlZSB0aGUgZm9sbG93aW5nIG9wdGlvbnMgZm9yIG1lOg0KMSkgTWF5IGJlIEkgaGF2ZSB0
byB3YWl0IHVudGlsIEFJIHJldmlldyBzYXlzICJyZXZpZXcgY29tcGxldGVkIg0KMikgSSBjYW4g
YWxzbyByZXNwb25kIHRvIHRoZSBBSSByZXZpZXcgZW1haWwgYW5kIHBoeXNpY2FsbHkgYWRkIGFs
bCB0aGUgZW1haWwgSURzIGZyb20gdGhpcyBlbWFpbC4gSWYgSSBkaWQsIG1heSBiZSBBSSByZXZp
ZXcgd291bGQgcmVjb2duaXplIG15IHJlc3BvbnNlLg0KMykgSSBjYW4gZ28gYWhlYWQgYW5kIHJl
LXN1Ym1pdCBhcyBJIGhhdmUgc29tZSBmb2xsb3cgdXAgY2hhbmdlcyBiYXNlZCBvbiB0aGUgQUkg
cmV2aWV3IEkgYWxyZWFkeSByZWNlaXZlZC4NCg0KTGV0IG1lIGtub3cgd2hhdCBJIHNob3VsZCBk
by4gVGhhbmtzLiBTb3JyeSBhZ2FpbiBmb3IgdGhlICJlbXB0eSBzdWJqZWN0IGxpbmUiIGZvciB0
aGUgY292ZXIgbGV0dGVyDQoNClNpbmNlcmVseQ0KU2VsdmENCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBzYXNoaWtvLWJvdEBrZXJuZWwub3JnIDxzYXNoaWtvLWJvdEBr
ZXJuZWwub3JnPg0KPiBTZW50OiBTYXR1cmRheSwgTm92ZW1iZXIgMTQsIDIwMjYgOTowMCBBTQ0K
PiBUbzogU2VsdmFtYW5pIFJhamFnb3BhbCA8U2VsdmFtYW5pLlJhamFnb3BhbEBvbnNlbWkuY29t
Pg0KPiBDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IHJvYmhAa2VybmVsLm9yZzsgY29u
b3IrZHRAa2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIG5ldC1uZXh0IHYxMSAxMC8x
NF0gbmV0OiBldGhlcm5ldDogb25zZW1pOiBzMjUwMDogQWRkIGRyaXZlciBzdXBwb3J0DQo+IGZv
ciBTMjUwMA0KPiANCj4gDQo+IFRoaXMgTWVzc2FnZSBJcyBGcm9tIGFuIEV4dGVybmFsIFNlbmRl
cg0KPiBUaGlzIG1lc3NhZ2UgY2FtZSBmcm9tIG91dHNpZGUgeW91ciBvcmdhbml6YXRpb24uDQo+
IA0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBm
b3VuZCAzIHBvdGVudGlhbA0KPiBpc3N1ZXMgdG8gY29uc2lkZXI6DQo+IC0gW01lZGl1bV0gbmV0
OiBzMjUwMDogZXRodG9vbCAtUyByeF9taXNtYXRjaF9kcm9wcyBkdXBsaWNhdGVzDQo+IHJ0bmxf
bGlua19zdGF0czY0DQo+IC0gW01lZGl1bV0gbmV0OiBzMjUwMDogUzI1MDBfUFRQX01BWF9BREpf
UFBCIG92ZXJmbG93cyAzMi1iaXQgbG9uZw0KPiBzY2FsZWRfcHBtDQo+IC0gW01lZGl1bV0gbmV0
OiBzMjUwMDogczI1MDBfc2V0X211bHRpY2FzdF9tb2RlKCkgZW5hYmxlcyBNQ1NGIGZpbHRlcg0K
PiB1bmRlciBJRkZfUFJPTUlTQw0KDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBTZWx2YW1hbmkgUmFqYWdvcGFsIHZpYSBCNCBSZWxheQ0KPiA8ZGV2bnVsbCtTZWx2
YW1hbmkuUmFqYWdvcGFsLm9uc2VtaS5jb21Aa2VybmVsLm9yZz4NCj4gU2VudDogRnJpZGF5LCBO
b3ZlbWJlciAxMywgMjAyNiA4OjU5IEFNDQo+IFRvOiBTZWx2YW1hbmkgUmFqYWdvcGFsIDxTZWx2
YW1hbmkuUmFqYWdvcGFsQG9uc2VtaS5jb20+OyBBbmRyZXcgTHVubg0KPiBTdWJqZWN0OiBbUEFU
Q0ggbmV0LW5leHQgdjExIDEwLzE0XSBuZXQ6IGV0aGVybmV0OiBvbnNlbWk6IHMyNTAwOiBBZGQg
ZHJpdmVyIHN1cHBvcnQgZm9yDQo+IFMyNTAwDQo+IA0KPiANCj4gVGhpcyBNZXNzYWdlIElzIEZy
b20gYW4gRXh0ZXJuYWwgU2VuZGVyDQo+IFRoaXMgbWVzc2FnZSBjYW1lIGZyb20gb3V0c2lkZSB5
b3VyIG9yZ2FuaXphdGlvbi4NCj4gDQo+IEZyb206IFNlbHZhbWFuaSBSYWphZ29wYWwgPFNlbHZh
bWFuaS5SYWphZ29wYWxAb25zZW1pLmNvbT4NCj4gDQo+IFN1cHBvcnQgZm9yIG9uc2VtaSdzIFMy
NTAwLCA4MDIuM2NnIGNvbXBsaWFudCBFdGhlcm5ldA0KPiB0cmFuc2NlaXZlciB3aXRoIGludGVn
cmF0ZWQgTUFDLVBIWS4gV29ya3Mgd2l0aA0KPiBPUEVOIEFsbGlhbmNlIFRDNiBmcmFtZXdvcmsu
DQo+IA0KDQo=

