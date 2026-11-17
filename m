Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.153.120
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794880479;
	b=p8arluPxiPOT/WJs5PjMENI1n/vuFUNfhGtonm/ZYTjSYadM0D3la5J+ej28mzwk919q
	 lgWIPeQsqVtUF7DmnhHYRAlpgU0r5uPqwZrb1OV2SRuGyYpN92rZLjKbVPfqG5FMvdsoc
	 mh8HnBOgzA05YWupUNk8H53ZZdYb0fLaoD256T5FyguewqU//c3i5UhGqbQgTa8nogQOy
	 irZBCG0UiShnvIvSCoWPFx1PXr7y1GHPuBunXHUzyXGWTHsTxFD8w6pMJHKRXHNIpppFB
	 N5UgqNH7sajWDi8e6DcnDBFPxNeH0G06NCJ3t/6lRxwgZSzwCP0fbprZ2RbvuAK2MSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794880479;
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
	bh=ufVBsn7mkbwZZWo854y5GVl06hxkx6XFqvUAG7KqxDU=;
	b=5EvU+iVq+zJG2QW2tIQUTmpcAkd94H5ALBXsucOEPND4lSSFPsB1OZ9EDqkX/TWGpSmN
	 SuMclZE3G/+NeYPHYAXjS88epib/5poUBFs43pWMPFN806f1ExLuLSQZnauDbKa7lTmFP
	 J9qiFk7hgA4ZahUsKY+z0i5M5BehcfDFwVsKL6Gp4Yl3+WZhR93rVI7OofMeHR84VFMFU
	 OV1PGd7B6p0UnAFY6rywAstk/hXceg9XfYpTGrYLJEji3dZkk4YGpTBu5Ze0kLxVjxXRI
	 Rec8kN3Z8kWc+Iq1HT0LZHHxdk2/7GQTxrt3zrC0/gsfPTWAJNTLJHwGTTIyDe3W70w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=onsemi.com;
	spf=pass smtp.mailfrom=onsemi.com;
	dkim=pass header.d=onsemi.com header.i=@onsemi.com header.a=rsa-sha256 header.s=mimecast20250127 header.b=igOvGHKm;
	arc=none smtp.remote-ip=170.10.153.120
Received: from usb-smtp-delivery-120.mimecast.com (usb-smtp-delivery-120.mimecast.com [170.10.153.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3717606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3717606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onsemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onsemi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=onsemi.com header.i=@onsemi.com header.a=rsa-sha256 header.s=mimecast20250127 header.b=igOvGHKm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onsemi.com;
	s=mimecast20250127; t=1794880473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ufVBsn7mkbwZZWo854y5GVl06hxkx6XFqvUAG7KqxDU=;
	b=igOvGHKmt8cg0VGy3lY2rGzw6WhumqHjVhAyDbZoDNqajFIOZ/weCiobHS2v3S1XjSGWg3
	sez9ESHsuJN2yL6UKnTStk3YP9CVontOOivflyWMWVgsHIvnWij5c7uJGB6hDxP7YsFb7p
	YxeesSVC6Avgn2LZvy93ZrDIb9YqcRGpZURVba+KOcq91OLM/iPEZu0pPPjs0oF8f8Vch4
	ZDAfMPChObRqUOyTAXHtlN21EFldRRgV3aA9DTmlVNwXhlKp4GRGAGb3RGUKJBAoHIpBJ4
	gVGrIjAWPl7ASdGBFRkt2rWaXHwvF8vlDzSEYiKUnyqSLaWACL5e9BBChN3Ktg==
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011009.outbound.protection.outlook.com [52.101.52.9]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id usb-mta-20-HAajZ-7LPnGUH7sngghxrA-2; Mon,
 16 Nov 2026 17:54:27 -0800
X-MC-Unique: HAajZ-7LPnGUH7sngghxrA-2
X-Mimecast-MFC-AGG-ID: HAajZ-7LPnGUH7sngghxrA_1794880461
Received: from CH0PR02MB7867.namprd02.prod.outlook.com (2603:10b6:610:110::22)
 by SA3PR02MB9325.namprd02.prod.outlook.com (2603:10b6:806:311::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 01:54:18 +0000
Received: from CH0PR02MB7867.namprd02.prod.outlook.com
 ([fe80::d722:d686:a9cb:6c2e]) by CH0PR02MB7867.namprd02.prod.outlook.com
 ([fe80::d722:d686:a9cb:6c2e%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 01:54:17 +0000
From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Parthiban
 Veerasooran <parthiban.veerasooran@microchip.com>, Simon Horman
	<horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Richard
 Cochran <richardcochran@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@kernel.org>,
	Piergiorgio Beruto <piergiorgio.beruto@gmail.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, Jerry Ray <jerry.ray@microchip.com>, Ciprian
 Regus <ciprian.regus@analog.com>
Subject: RE: [PATCH net-next v11 10/14] net: ethernet: onsemi: s2500: Add
 driver support for S2500
Thread-Topic: [PATCH net-next v11 10/14] net: ethernet: onsemi: s2500: Add
 driver support for S2500
Thread-Index: AQHdc5BowdVTxN3v+UOVrKAtGFYQercxSTBQgAA57ICAAAKSAA==
Date: Tue, 17 Nov 2026 01:54:17 +0000
Message-ID: <CH0PR02MB786757EE3A90A7F3079B8380837B2@CH0PR02MB7867.namprd02.prod.outlook.com>
References: <20261113-s2500-mac-phy-support-v11-0-7a186141952c@onsemi.com>
 <20261113-s2500-mac-phy-support-v11-10-7a186141952c@onsemi.com>
 <CH0PR02MB7867CE1D45CBC874F8E5FE2E837C2@CH0PR02MB7867.namprd02.prod.outlook.com>
 <b98d498e-0574-4a6d-913b-739896b0065a@lunn.ch>
In-Reply-To: <b98d498e-0574-4a6d-913b-739896b0065a@lunn.ch>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR02MB7867:EE_|SA3PR02MB9325:EE_
x-ms-office365-filtering-correlation-id: 7732c3a1-79a3-46ee-2830-08df444db0ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|18002099003|22082099003|11063799006|4143699003|56012099006|10067099003|261022115727099003|261022113327099003|261026121527099003|261028144727099003|261021123027099003|261021121427099003|261026140227099003|261102123227099003|261021130227099003|38070700021|261022105027099003
x-microsoft-antispam-message-info: SeK7npJLLXzDRXnNuQwPSEDMrfbIn1nPEbF9ImWQF0BNyuLrbCCYYRX/LP9fwJ0SYG3oKnOEv9Cqb0/zbq4qC3BonOhACrR2t/xEACfnKottIKaQ74Yw00k4Ro/EEwPtAm8croMGf1fRgrGAty5fE6h7YY0W0nQ7LRQ1JOTIdUQ4rUueC16tNCabAphPMfFei+NNup5B0lXP2hFD/VciipWLF/WDS7WK2ciKJ4LNfSiLc6im5ykiYdrjU+Vv2qATEv81ofHud18iFlzgxZn+raNmXnR1GqftLmSDOepv6UZNfl/QYJEU9IXpvhk26sLXk78Wp6Hxw+DBFR1CuvAgHlh9Xi49AkdEip+2gqCEZ2NV2dyoOLlWtZIlvSa9ecDQcF2FTNj7SY5K8DTK8XKJ4zBuhZA6bypokkwWyom19VhrojC2OsagMAbFCvBdTVQsRhHMsO5je5Q37tWzag+FSbb7W3gtJeB/vWCnA73zvvi3RwpURZg+Rnfcp85wBEJp60O/iRnDpJmTeXtFaH7pogSkBvmgu4OOww6ttqt9xdYWfFjnmJKm/oOvWutllM8MAY/2EUss8tfAi6osmwtk06lO/EvM8BkflprH/iW80ODSnjawS2sjU2p2GhlYOcGWnLg5MpvR31KrxpllTYbARh/zJp+oiEnDS43s1rt0uuFQguxbDxje+uUjklKF6SxLT/MXMn4QX/j5yVQNwvzAW3CmI47SlbEfBXmNdVPTFoI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR02MB7867.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(10067099003)(261022115727099003)(261022113327099003)(261026121527099003)(261028144727099003)(261021123027099003)(261021121427099003)(261026140227099003)(261102123227099003)(261021130227099003)(38070700021)(261022105027099003);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGlKTXc0Y2I4aEYvOE5RMXIrVUUxWjd5YVRiLzdxRFBoS0hOZi9pR0FMcWp2?=
 =?utf-8?B?Zlh3dytndkZmbzYzUXJEL2ZVRWpwUmZXRnlvZFlYS2dUbGZuYVJrWmp6anUw?=
 =?utf-8?B?dzNtVUlRZmlJbVcwZkhJNzJVdVNsUkx4dlk0RDB6RUJCazEzeXkvRE9hYXRB?=
 =?utf-8?B?dUx4ZDdsdnFUZ3NQWWh2UXhCK3BEV2g2RUVKVXRIVERyd0Fpd3NLUlhLeGRy?=
 =?utf-8?B?MGdwK3VmdGFER1MwSnkxY3BSNG05K2tELzQ4SWhYcSt6dHhKV0FYSEYwcktk?=
 =?utf-8?B?UzRpUUJhZXJWOEZaZGZoWVU4WDRCUG5sL29TcUc3ZXdMSkQxMytRRTNiZ0FF?=
 =?utf-8?B?RVB1bGNoUWZGa2ZmZ1JBRkFTcWhJOGZpQUVtc0FRUHNZa0M5b1kwTUZzbDB3?=
 =?utf-8?B?SGtRTVU0VkZ6NzJNS2ROL01IbVh2RTVpWURlcUdFN21DVTFsWUkzZnl3SUJJ?=
 =?utf-8?B?Mml3STcvUy90UlhPQVppTktQTk9hNnRpOEJsOGNPcXlsR2RvOUFMOXB6Yjlw?=
 =?utf-8?B?OUZjSW1nMzNNaFJFY0l1azhzalZDbEd3b3k2K0o5czJ5NjV1WGIzWkh3ZUtH?=
 =?utf-8?B?cm5qc3pzajEzSjB6U1JodW1TTHdPWlFIN1RHTENPQklxZE55S1M0VjZjVk9s?=
 =?utf-8?B?OXB3Y2ZqeER0U3lmdWlMazZ4Z3AzYitMUXZONXpKNnA1RE5uWUhuL015aHpr?=
 =?utf-8?B?ZTZRaEpiZG4rTEJ4Y2oxOWlTNU9nUUptbU5KdCs1MzgxNmIycmdLSy96M3hR?=
 =?utf-8?B?ZDFuWVU4aE5QL1RXc25hUnp1YW9TRi9uNTFMYUUzaktSQVVOOTdKOE1ucHdK?=
 =?utf-8?B?TUVSejVzdUMxdFZZWE5zVXg5YkVuK3JwbWRHMHJlRGFramYxZ29VOG1RNnBs?=
 =?utf-8?B?ZGN2RTVBUUVVQmZseCtWUkhSWUxXV2hMUWQzWXEwc2pWbDhvNlphcDZwR3ZP?=
 =?utf-8?B?TEYxUEsrWTNuN1FtV3RXOXBXOTJpKzdIS0F6Yi9VM0VjWmwwNERaSndOUVhy?=
 =?utf-8?B?SUVXWmRHUlY2M3U0T0w1cUc2NzdYQVI0NnZVNzJlQkxIWGRqZUpKUitFaHpZ?=
 =?utf-8?B?Q0FDTmpUdSt5RWhVS3Z2NWRYVkFOYy9HTE9xalZHMUgwaFFVdzluTTl4dmdo?=
 =?utf-8?B?ajFPRTJmV3ZDNmpNeHY1Yy9nN2dyaTdRZS94bWRzRFBtb0E0SGx2cWNHTzA3?=
 =?utf-8?B?QUd5MHRlREhsLytlQjc2aFFMZnROakpVTk1WU2JaZ0NDOVJNL1BEU0Y0a2FU?=
 =?utf-8?B?RmM1UU5vZldTWTVyTUsvd3NlNG5jVzc3Uzk3aXBwQ0NveTFQeXJnUkpWby9O?=
 =?utf-8?B?NEptMmhoZTRNNWZsbkk2RHF3VThUdm0ybTk4WmkyNmRuT2VqOG1mZFRrdlMy?=
 =?utf-8?B?aXBCTmZHcGw2TnFINzJxb1ZoMnhoZjBlcHZVRXVJN2VlbjVBOU90Q011RlE5?=
 =?utf-8?B?WVVLbklXUlU5MmpIbEtXRUcybG5lVFByV21nL29aR0JwVFoyMG94TWM4WHhx?=
 =?utf-8?B?SFBVZzdWM1o1akRoM2lVRmc2MFJ4Nzl1ZFRTRy82VUlsZEhkb1h1KytFSGhy?=
 =?utf-8?B?K0R6eDFscjRlb0NERDhURm44MmFCNE5BWCtEMzh0RVF3bTlyQ3ltbjVHTFY2?=
 =?utf-8?B?cGpqNS9qb2d6S0ZUSlBhQmxQdUFxTlhlQjdzakNiWkNwSmRsUmt6TEg0WnVm?=
 =?utf-8?B?bWlGWUw5NGhNWXFYMTByVmw5dGdxdWgyTUk3NDFPTjhxY080SEFycTRRTEdR?=
 =?utf-8?B?bkgvRnlLZU11UGVtVWRLMjk1TUg2bnpyWTJMOVpnWEs1ZzBDRUNXc0xjZTc3?=
 =?utf-8?B?ckt4ZWN5Z3N4UFpFZG1LbnYwQWZ3UjBscW5TYWZNejFPL0F4Mml4SzB0b3M1?=
 =?utf-8?B?c29abUV5VEoyclArZi9Ob09Dc05hd2ROMGJuUmFaT1pPNDlOaW82a0RnTk1t?=
 =?utf-8?B?NG1WMVMwcmdxWE94VkVRa0lIUitNZ2NvTE01RFRDdVBJWEc5eGdnUDI3d1JH?=
 =?utf-8?B?dGlRMzZTaC9Yemp4cFJpUTZka3RneFEzdUlaaUVZL1hVUGQ5dGdxc2xNZVV0?=
 =?utf-8?B?YzJYRk9pSnMrNmVHbHJPZ3lwYi9FTnNsT2gwc0JzRVdIY1BWR2hwUkY2YjFm?=
 =?utf-8?B?eHlVQVZMaEE0ME1WTWZxVlpKRit6RkVqS0V2SVpsTEU4Y2wybjZkTllMdmRn?=
 =?utf-8?B?cmw2WUVzNEl6bnRRV0FVWk8zdW5QYlFZU3JlVE5BODFXZDBLZzNLUG95UStn?=
 =?utf-8?B?b3RlazZGcldESnJDZ1owdm9KbGZJZldQWjhZcnI2cnJma3hMWlJKU0RLSXM4?=
 =?utf-8?B?blh5MXZ1KzVNRlBZREZHQzVWbzdlYzVKTDhrWG40Ly9zQWY5cVNKd1pTU1lz?=
 =?utf-8?Q?+5YCSUHnF54Co2WA=3D?=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: L+RcP92cGzJ9jOSYC2pSXg3RC4PJJqUq50NrxwUH40tPQypY4SzXxmQxC+E7ve24oEg/plGy9mrsm+0aJ8bAKBZJ/Q4HoHMeW3dpbY8XQawnJ3Y5SCcfNd5FfumoM5L8NGGNgeXqAoA4SqssCogSeRAOgSemfI4ooHV/v31FvTFf6E7PpKQByq7yULfON4e/h1i8qhJawNeMDkrxQS/V+DuU7nzYq1iK46ezYtlLe0iHNoTWonzorBLmFslYvkVLCCSqg0kN97O8d0b7N38w7jk+heoIPCv3shA8MIeFqYe4iih/M5piIVGUPcUdS55uIvpAv7VKsqKyRW5ppsVBHw==
X-OriginatorOrg: onsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB7867.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7732c3a1-79a3-46ee-2830-08df444db0ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 01:54:17.8694
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 04e1674b-7af5-4d13-a082-64fc6e42384c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6acRRqIazeRr5VeHtE5FMBnrVIal3MeDGTiDDa/5ruXgFbmoCHmctdPWAgotWgysot/0bcCQ2Hueb5LmKD2zpQmZqY3foM+Bw0WnBmk1c2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR02MB9325
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: R-YOfQBdE1JHUU1q0J9ZQKEN-vSQM2i9rAzrbGpWnSU_1794880461
X-Mimecast-Originator: onsemi.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFuZHJldyBMdW5uIDxhbmRy
ZXdAbHVubi5jaD4NCj4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciAxNiwgMjAyNiA1OjQ0IFBNDQo+
IFRvOiBTZWx2YW1hbmkgUmFqYWdvcGFsIDxTZWx2YW1hbmkuUmFqYWdvcGFsQG9uc2VtaS5jb20+
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggbmV0LW5leHQgdjExIDEwLzE0XSBuZXQ6IGV0aGVybmV0
OiBvbnNlbWk6IHMyNTAwOiBBZGQgZHJpdmVyIHN1cHBvcnQNCj4gZm9yIFMyNTAwDQoNCg0KDQo+
IFRoZSBuZXRkZXYgYm90IHdpbGwgcmVwbHkgdG8gZXZlcnlib2R5LiBJdCBpcyBhbHNvIGRlbGli
ZXJhdGVseQ0KPiBzbG93ZXIsIHRvIHN0b3AgZGV2ZWxvcGVycyB0aHJvd2luZyBwYXRjaGVzIGF0
IGl0IGFzIGZhc3QgYXMgdGhleSBjYW4sDQoNCg0KVGhhbmsgeW91LiBXaWxsIHdhaXQgZm9yIHRo
ZSBuZXRkZXYtYm90IHRoZW4uDQoNCg0KPiB3aXRob3V0IGVuZ2FnaW5nIGh1bWFuIGJyYWluLCBh
bmQgYnVybmluZyB0aHJvdWdoIG90aGVyIHBlb3BsZXMNCj4gdG9rZW5zLg0KPiANCj4gQW5kcmV3
DQoNCg==

