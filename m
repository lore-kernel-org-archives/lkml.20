Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794838613;
	b=bXk1WRlvTcqEarV8wQhJ4QvwkNI3DSVVrsBWcXdEW7MkX85giH/OMcbnUnX3QHpqPzms
	 BetcDHHfwYbIos1GdeN8kSja4tyvTLZ6CKwooWqAW7UI/fglVm9clPTcXlZo3abwmSbYI
	 X0AfReYrYS+KHerfZrghPc1GaV03moh4+/FPuSITjYLq+A3Tq422KM3vkodZRY0NstJzc
	 eYBsfCOZCsN3M770TjlVs5Fd/qXc3pw3w9DFPAIknHem3AcY7/1ZwYtbhgkD3FHzbCgUU
	 YRKNe5Tt/Ht7c/YZtCct/rRYkSonNzxlcNnqs5CU9Yn1vlAf9NmZs0UzbJW57aOJtvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838613;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=6DKxB6S+t4EdaRUq0IRNJNMPDVbxVgJORcgfmPwJ2TY=;
	b=IcmzPGEsmdUi5WJKMIAc0JpCjh8dWe5b0KRNrFEUAh6gA9awqC+vhaOLc609KQRH1MUb
	 UD7cZiA/GJJvDZd7FohrzLoLFL8BgzBY4vPERLG9ApzhfhgIBIWPrvX5r+QgKI5IyV07g
	 SBpFknFCqcQB6MFgQcrnYa3DhwcAMeK2J6N7A8CeHGmfRjymKP4Sd3UaR3QXTelJhdM/p
	 nib4fOnC3+05mlvJ9aGi2pAQSYIsxQWL9GBKKx2dAMEtqC6+CVTqIfJ2BP3xJJMayN4cV
	 Vl8N9AiNCbEo8CKgxgFdeZhcZdgTr3wOc6RcP1yQ7zPXOho4Wfxru5OxqkJ4lejYTsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nokia-bell-labs.com;
	spf=fail smtp.mailfrom=nokia-bell-labs.com;
	dkim=pass header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.a=rsa-sha256 header.s=selector1 header.b=QL2k6qVY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.35
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010035.outbound.protection.outlook.com [52.101.69.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31397606A323;
	Mon, 16 Nov 2026 14:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31397606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.a=rsa-sha256 header.s=selector1 header.b=QL2k6qVY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uKZjJXxZe+ohqLzUFtsLruSQ8DFMU6qCuYIeAyVBfA/XO3FaDe4yFLs4g7ghq+Y/tixq4Vtrj2AhfEBEHEGJhg4hWSlWmT779T/sXHVLRZ0myCbt+kGvHIIJgefluhS4+O4wveZOeYUjciw7g/B5XXcgoJuro9oESYwlA2p4DGtgJywna6xWBNRH+mGFFp27BOu0H3VHrXhh0Um5iKALk0u0XlGXMk7n6diuTgkehp6+RH3ZCb3z91PO0V03HGxFYeiAHogXJ0fRZxkjEhf7tudMZ1Z27k6Az8YRLy5UkfSQmugsc4rRtJQ2y9/vT1rpIit9nOsG+qO3oZ5MD7iaVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DKxB6S+t4EdaRUq0IRNJNMPDVbxVgJORcgfmPwJ2TY=;
 b=HgjHWddQK5DrtuMCZwpLsiZXPocl9tCKZFBQcri9sHc90n42RtlLcwmsqZikhtyvrBvI55OvzbyWZjPdYJ2HLFbaycKDunE8kKqvxQWxKp5wOLujxBewh9Gb56SamgI0CGAYMhq9hBfxDLoc1+2diSPQfddNKSrGY/xTiWEW7kpZYZKPl8SruHpVuBE3mVHGvSZ82Dl87l7aOaqM3qe4d5jT4wjkoYZzuWIEbfOzrmwA5vEBfL4QaO2HrNi1umrYqNWP++k8xQS4Rseit9Ffw0qky5vxddxRpu2e8K5Z8RUU7Jah8pPxN7G7YZwaNTis08fA/eo11N8gbnAPOUA/Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia-bell-labs.com; dmarc=pass action=none
 header.from=nokia-bell-labs.com; dkim=pass header.d=nokia-bell-labs.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DKxB6S+t4EdaRUq0IRNJNMPDVbxVgJORcgfmPwJ2TY=;
 b=QL2k6qVY/hpVBvyZsOoG+yezcU50MCn7k/4rq/8JUv9lp1PHUKiMyVp85UO04EMO4pGnR9l+YNZ4prcP/XbVr7VtDuE6eNAoB6b9nTQ755rzlm2T+k9sZa7LWdlo/kvDZbXruBhnx4r5vT1AYeNjlCKuK4b2nXbqICuVjTj5gH8J30nP9vTQ2Gfzrtq/kPMpgaxkZ8uTbOtC9UPj98Xh9SqdlNqJGeXmcjzKsdB3FBYGw8PwAl+s9hKY2kXmVmU1zbw8VjWak405Kdwt3zO4Km19Tykb7RES77gZT58vSFOLBayyP0Qy/GXKK8ZRwGKw0VjV1KcwQY7QBNaUUunOgw==
Received: from AS2PR07MB9123.eurprd07.prod.outlook.com (2603:10a6:20b:55a::8)
 by AS8PR07MB9020.eurprd07.prod.outlook.com (2603:10a6:20b:56d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 14:16:40 +0000
Received: from AS2PR07MB9123.eurprd07.prod.outlook.com
 ([fe80::ddd6:7bad:4de5:5106]) by AS2PR07MB9123.eurprd07.prod.outlook.com
 ([fe80::ddd6:7bad:4de5:5106%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 14:16:40 +0000
From: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>
To: Thaison Phan <thaisonphan@google.com>, Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>,
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, =?iso-8859-1?Q?Ilpo_J=E4rvinen?=
	<ij@kernel.org>, "Olivier Tilmans (Nokia)" <olivier.tilmans@nokia.com>
CC: Simon Horman <horms@kernel.org>, Stan Iliev <stani@google.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH net 2/2] tcp: accecn: initialize AccECN fields in
 syncookie path
Thread-Topic: [PATCH net 2/2] tcp: accecn: initialize AccECN fields in
 syncookie path
Thread-Index: AQHddFMNm6KjWbogrU25Trk104APIbcwukrg
Date: Mon, 16 Nov 2026 14:16:40 +0000
Message-ID:
 <AS2PR07MB912321354BBBB27BEC882C11A37C2@AS2PR07MB9123.eurprd07.prod.outlook.com>
References: <20261114161248.3428695-1-thaisonphan@google.com>
 <20261114161248.3428695-3-thaisonphan@google.com>
In-Reply-To: <20261114161248.3428695-3-thaisonphan@google.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia-bell-labs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR07MB9123:EE_|AS8PR07MB9020:EE_
x-ms-office365-filtering-correlation-id: 21e7a7be-1d59-4f86-4478-08df43ec3bd2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|38070700021|10067099003|56012099006|11063799006|4143699003|261026130827099003|261026135527099003|261026121527099003|261026140227099003|261028144727099003|261022115727099003|261021135927099003|261021130227099003|261021133027099003|261022113327099003|261021121427099003|261022075727099003|261021123027099003|261022105027099003|261102123227099003|261009223027099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 29wxudKhwjlX4J22rQ4b//xPfzfUqVyUR/gGD4RhYJAiqG4qpLRjAhUTYzG16Apm0euFzKGeoYMK5i7lvqzlm/1W9tc8PDPzdtPQiGDxBMxJRqPLhit7GjpM5Tpvc/AEhlco98wrpEhTHRQeOh0ctQV6m1MiqKeiaSd2S9hBS/I63CtLzHPyYR8X8S7eisRLYSmlOHmPJxvacC0543wMWNKm5qC7qJEFLMT4amTk+WTS1f/TG2/RVl4Ep3Idl2zONYG2QAUQeqbEFVCtbMAAf+VSPF/wiOvl0BG7Xx7ViawyBsMv6sfjYbpgihIPzQwy8TLVm7kwOi/F1xJfGXyndtrK5rqrUa8yw46FGN1Zv2Wx1RIF22dAthmu3i+sni/lMBVEsTM4Qe9eFwfsVCuSI/jxe2ABLsNqcedFripCz5mL1nN08NfSX20TBi236gLUcWU1l1fEYOfs5zt2PXIUAxt+poNf9EGE/oaJl8+tEzUtvpuTQgzbtqaNyBH8NjDFCkXmbIT9CnhSPdaQjzSc9X7N4dXL8NdvQUI4wF7QOdpk/PyU9+j31ZLfmPThqb6lvIvZi2RfhNPsvDWeKbAAsyOTzlftz5cFmmqTpHTZO3HjxC6ofEnqdlusCEr0qHawBvi2y7wTvF6k38D5wusZOvP3MhOqy+SCs7HUYCPATRE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR07MB9123.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(38070700021)(10067099003)(56012099006)(11063799006)(4143699003)(261026130827099003)(261026135527099003)(261026121527099003)(261026140227099003)(261028144727099003)(261022115727099003)(261021135927099003)(261021130227099003)(261021133027099003)(261022113327099003)(261021121427099003)(261022075727099003)(261021123027099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?QR2UvMJ3fMWWLWGFOuSx+OGPv41PQm1hu+T0+kZvBhYfiLhuoWquVhlqBo?=
 =?iso-8859-1?Q?PpsYHCbzTsnPa4Vb+eP2ipUbw3ddQjw2/Lx1zD5LUvho38ZeFfjn2NWlTm?=
 =?iso-8859-1?Q?2KTmwBqvJxSHTNH1gAOClhHvXC2v5bFajP+wgoCqLHTo5rvYfn44Mq2SFI?=
 =?iso-8859-1?Q?WNwGQHq1WtiTlyNBglmjabMPoAs1hut7wIyNTo8ViIti+Q3ZCO0pPKWO6M?=
 =?iso-8859-1?Q?8UjLuJmx5aM8g/O3fH/KwT44XXmx5Xw82wbB2ivoy0UND6Cno+bt4zp3hU?=
 =?iso-8859-1?Q?1rN5vd58zbhtOeaKMhiJRpyek7q5LJfaFKcrnPfP6C2A6A/gl3rBdvUWvt?=
 =?iso-8859-1?Q?4JbH0wSVKWV1z9EXrdqp4iy0gpM9comxXF6SfPnqsh5THhBJ1U9Cb93Rac?=
 =?iso-8859-1?Q?eJwsYjCvbltLZTcJzgr6bQIwlMpmO+oCrufqYxtIZbnqeYlbC+im6Wcede?=
 =?iso-8859-1?Q?un0qgQ7fWaQcYSxouwIYu63TTCVODlrTo+sPhEuDawsWaNR1NWOv9QxAfs?=
 =?iso-8859-1?Q?iXwWPd8I3k6rF4geRGagJuJuZ2AsLCuHYOE7dUMOpBc4e7jYT1AR9Gh+rf?=
 =?iso-8859-1?Q?LXr+TFW7Fsio2DZjmQdyo3oz35aI/L12zaqyklqLCm05wk5pqKQuo2rvE6?=
 =?iso-8859-1?Q?chgRGbzh/EmAc3pJO0b6PNFAjWiJriZP3ZPxFd03fCylIwCsT1DjuMekVi?=
 =?iso-8859-1?Q?nCKUqEjxVPkjAD8EfenNDQq84Kjloa0wTGlT3tU6+7M+qvCYk12vil5lGO?=
 =?iso-8859-1?Q?kdPI6rxi/LpZQZnfvdaRP1KkX03WMxz0GILr7OuX2HCoqSkkshBn8gGF1b?=
 =?iso-8859-1?Q?dbJc0lQ+BQ80WQI9GXSp/4XH/yql0x7SoqfGgnggoPtS6BUmnvx74568Kb?=
 =?iso-8859-1?Q?yQtFmxvLFmyRYEMzamTBZ+SOFoUwNhhV5UGgESFxzcIvXDb3Vn3l2Dabo/?=
 =?iso-8859-1?Q?q65m26KNQWIWmAYaQSS5IDGv+tsdx5dZW+/LIy4vWwzIHhAGKMZJHpdZX7?=
 =?iso-8859-1?Q?4chBRRji31nAmUIa/AJFhHxYavExPuu/yToE1f1tLc/z6eqEQiwgjDWAZE?=
 =?iso-8859-1?Q?uHuIpQyGFwOaYX5BJNTNMU7SpQsiJhYYTBtCKwN7Y6pOZRWo3XYJeohzIE?=
 =?iso-8859-1?Q?tKpvawDtghCEa40IARMiFFZekbvX+zko7OtKni7MMdZUB3IwZBpdOwMV/T?=
 =?iso-8859-1?Q?toIQhhGE8+iVev/JWQiz5/k91vgcz4MfE+p6arHiagzt2dPManDFMn6S7t?=
 =?iso-8859-1?Q?6Tsyej0rY3NhiM9aoiM0JBN7Uv0korPBBV6tkcsWJPP/MzJ7amshLQmoNT?=
 =?iso-8859-1?Q?ZcQVfOcwpDPkpGegb+RWD60pE/E8u1pD6btBWnWU+fxQd75i2IUlzJ41ny?=
 =?iso-8859-1?Q?CCr+hJcFpUEN7toYoo6Rma7yiCwihSDskxDKJh/dvxx/ExVtZO3as5nXda?=
 =?iso-8859-1?Q?jrBzFa6oStGiHMNSadXfx0z+J/6WEXdI4D6uLbZlO2+FIczv1uwJwNS0+E?=
 =?iso-8859-1?Q?Ln9BNA+XZ3ZyrqdNTo/LWYaT6KUr96e0zEx85QhGaZpRUR/8iPESwl6aKm?=
 =?iso-8859-1?Q?6L3r9eXErNw8DdfvnuXwl19cZlDEyaum7aVMN7+4K68Nb1h2RTaAEizr+B?=
 =?iso-8859-1?Q?9e4G8gkdsSH6Hsx2AvAKzjcDuQ0IbD2++Ugqsr1LHfsJK7Ga81wF6avWua?=
 =?iso-8859-1?Q?LpPt+BFORCYXGfAq0lepeSL3t2HFKtsFCSdgM41FiqUUhBKpe2rg2Qdxp8?=
 =?iso-8859-1?Q?MI0VC3beAioQiof8NRrhPCVxV9HDMZPF5XUbrnxNBM1jxNGHlamEi3EYFv?=
 =?iso-8859-1?Q?UuMXzgGeAmhHBpsVE34A1nHgOMDAe6k=3D?=
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
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR07MB9123.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e7a7be-1d59-4f86-4478-08df43ec3bd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 14:16:40.4682
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iuABNdRA2XHhsL2GDqVOuo4EkkOp1ZPzw41EcicKs1Wn5WRV0YG6Z68pqHlHiLX6nWPlGwCxHuhTqTzbrv2OBo1DVN7OjWbEnmmGst/rcj4tUj0vXFXp+PrBnzpFcb+T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB9020

> -----Original Message-----
> From: Thaison Phan <thaisonphan@google.com>=20
> Sent: Saturday, November 14, 2026 5:13 PM
> To: Eric Dumazet <edumazet@kernel.org>; Neal Cardwell <ncardwell@google.c=
om>; Kuniyuki Iwashima <kuniyu@google.com>; David S . Miller <davem@davemlo=
ft.net>; Jakub Kicinski <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>;=
 Ilpo J=E4rvinen <ij@kernel.org>; Olivier Tilmans (Nokia) <olivier.tilmans@=
nokia.com>; Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> Cc: Simon Horman <horms@kernel.org>; Stan Iliev <stani@google.com>; netde=
v@vger.kernel.org; linux-kernel@vger.kernel.org; Thaison Phan <thaisonphan@=
google.com>
> Subject: [PATCH net 2/2] tcp: accecn: initialize AccECN fields in syncook=
ie path
>=20
> [You don't often get email from thaisonphan@google.com. Learn why this is=
 important at https://aka.ms/LearnAboutSenderIdentification ]
>=20
> CAUTION: This is an external email. Please be very careful when clicking =
links or opening attachments. See the URL nok.it/ext for additional informa=
tion.
>=20
>=20
> If the listener marks ECT (e.g. DCTCP), leaving syn_ect_snt at 0 causes t=
cp_accecn_third_ack() to flag TCP_ACCECN_ACE_FAIL_RECV when the peer reflec=
ts ECT, disabling ECT for the rest of the connection.

Hi,

Thanks for the fix, the only change I propose is to clarify the above messa=
ge into:

"For AccECN connections where the listener marks ECT on the SYN-ACK, leavin=
g syn_ect_snt as 0 causes tcp_accecn_third_ack() to see a mismatch between =
the expected Not-ECT and the peer's reflected ECT in the ACE field, erroneo=
usly flagging TCP_ACCECN_ACE_FAIL_RECV in accecn_fail_mode.
Refer to Table 4 of RFC 9768 for more details."

Because RFC3168 ECN does not use this syn_ect_snt.

Thanks.
Chia-Yu
