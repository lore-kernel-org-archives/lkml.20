Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794823760;
	b=byX0+xKRH6WreASEnjjaXV5Q375jjYYoCvNCnIj8nfx9t33uJJV3URK3tX6y6MR0zySg
	 4zALDp9Kd09Fzk7sHcfwGp9y9vaSMz67p3kJaRAQLrsL2Ozg9hstDmhD0Icd2w6q/nlft
	 QEZgENaBvrcdxyGd0RmLiMKoGXtY4ibSFDZ/48NWXjRN9a/fMNMtsFKMhCRfiwPlxJBBd
	 xlh9R024CTl2QeszRcJgZMsIG6FOHYvALBYCWvX169LdoM/GuVf4fXVN3QOhBtSNeLzHI
	 JYkxmLukS3NaSykDyzTeRsqVb/z5jyVarZ15TVzBkouUVAoUShmAwvyEIwMPyd/p0iA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823760;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ld-processed:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
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
	bh=3YYJRMetFhB2HYky+OCQhqaBO6XybzVgOAZbfy7YyjM=;
	b=T70nfVq3GuoWeIIMjwM6kVSMjQIcEukZak+1ATqJ78Gf3RnY3gc7SZPEYf6F3YIZUjvf
	 vnUsEiwFFCyhvoL4I+kK9tguO3AIDAWGlLfR+D+baqOMtjM9HrNW7AlD/aH+ccejGiO+8
	 8yfAOZnVVtoQ9xAsd3O4MI77dVZyNYP8BBLyhRjAhUf8jVUEv3C30vrsSRQ0wka98txi6
	 EpDjwBrzePw0z1NIFIMoskfbYhx2YYCCoqB44BWGCwAs0gzNz4nc6Izqlto0URjnydt9W
	 f+GiNMy3G4x3kq5cXFWN6zvk7GWsJyoFpzRXwrtUH986IuV6sQ+5zPLxaC6ACQ/SgRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=IwCfvqwp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.7
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010007.outbound.protection.outlook.com [52.101.228.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABE5606A323;
	Mon, 16 Nov 2026 10:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ABE5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=IwCfvqwp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PATUK4UdKZPWJZVg7bol6ll6A3+Di/C+t2DEPQA6zeavIgLNpt2tuJFOt/HtYWHz22eYybUvWbwGKO6ZJff+PPPxUawZfoSmKlbLVuxkkdmEEiL35YD/YMbXeyXTDbCQygU+VANK81xQuMvjcRfCHsmYwjan9CSHjRrNpYVcpQ3j5L4XYdAaPXHNOceem9f43TUb8viAWfQXVm70uTcyoKBXfGFyYHV4M6wPuRLvTtcKQEeydAwtUGmzLhmyop+imYVJXvNalYzpMGOanRO9yJWFsxZGeDXG6C4T5XpHdZG0I3WLG50QXPeVPxY91cKeXwTYhBbIEVw4SfmNeUCyeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3YYJRMetFhB2HYky+OCQhqaBO6XybzVgOAZbfy7YyjM=;
 b=ScLWtFS8stVStWytcrveILa2yF4gEVUkRXMKm2q042ZUtUs8hTL+ha8b2dUR7f56T5IVmD1L+G7dNnn0c7XBDku5creKR3whkJEqQMYfUtU4eOsJANJ3BU4S13ZzgwhtqKBy8ClS4geXx34rM/9AfCY7vsG5gSD3dn6CJQfh52HbCj/4ypAs0mSldqVfD9ODNArtJkos/DIbksBtWGTpE83sZrf9bQ7/8rgtIC1h9eJ8b4Gx4taCD4ex6QsMdcVE847qGOiMS0SN/BtmLWwEjKvRq1kGRNh6/i9YQs+8zemDl9WHiAEmWP1iNYm+Ly4hKMQ8KV1iVS3nQSZDPK/GRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YYJRMetFhB2HYky+OCQhqaBO6XybzVgOAZbfy7YyjM=;
 b=IwCfvqwpki4aoWch4ysdTUP7eGZnFJnkNs6UKb6lXP6In7JwSavyZrwzO0mK0YwourIcb7jimjSn0XwoR07rsUHnbMzJYPKBjYQVBJLGp3Dnq2YAMqEPE1rFpZ0QjaOki4wh2H0i9vHYX7i6SOq+itzC+ju7Qn9m53G2lXyy9aQ=
Received: from TYYPR01MB6603.jpnprd01.prod.outlook.com (2603:1096:400:e0::9)
 by TYCPR01MB18376.jpnprd01.prod.outlook.com (2603:1096:405:3f1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 10:09:16 +0000
Received: from TYYPR01MB6603.jpnprd01.prod.outlook.com
 ([fe80::145b:b854:162:2e7f]) by TYYPR01MB6603.jpnprd01.prod.outlook.com
 ([fe80::145b:b854:162:2e7f%5]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 10:09:16 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: wsa+renesas <wsa+renesas@sang-engineering.com>, "biju.das.au"
	<biju.das.au@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, "magnus.damm"
	<magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 0/3] Enable RZ/G3L SDHI
Thread-Topic: [PATCH 0/3] Enable RZ/G3L SDHI
Thread-Index: AQHdctfrGrtgDYWCyUexWrA6qF34pbcwfj0AgAABB4A=
Date: Mon, 16 Nov 2026 10:09:15 +0000
Message-ID:
 <TYYPR01MB6603EA94E4500584DEC57AE8867C2@TYYPR01MB6603.jpnprd01.prod.outlook.com>
References: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com>
 <avrVVjHY4Pp1hFvt@ninjato>
In-Reply-To: <avrVVjHY4Pp1hFvt@ninjato>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB6603:EE_|TYCPR01MB18376:EE_
x-ms-office365-filtering-correlation-id: e11b9d74-4840-4ad9-9873-08df43c9abd9
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|38070700021|10067099003|56012099006|11063799006|4143699003|261009223027099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 vu2aFUlJxXhfe1XUoRUXsjNzaRDo2PLTk4dAGPDqwV3TsN3nxG24smetx9Mf92AVEPrg2XR7ZenwD42+YH6xLp+2zJ09TUlD8VBSG+/AaXoFhjAyHANvZFFZqObXl7mYYsRPTPmrRpK/tsC0lNOu/mPWeEP14hvUsKfPzPWold6hWI3gDGLB+3HC8lrrxtQz/rhic7/bb3Th4Px6mMD6xX/bCOUy2ibCOTQgiFPBiDfU93mrsgVcUehyEXnmJA3zLx+v5RQwKV/L4UWVtVnCJNq4UDmvmffXrNELl/dXsyV0tzdtZF63BIICZiyrW0I3B9KD2zBndjwdBx+wrA0Qh0CUHnIjo1XoRP08bbnVRHM/J31+GW8fV0mfwk+ymicBn7LgVTYsO9QBCRjtNDiwe3wJ+VCLVkJO+/eotm8HclHivmu5pvHzmu/FjzVAE66ZgAC3es6SJGh0krs+NG0vkhtBiReF6lnI23PcsMZc+Yj9gTMOLOzTrR85+Z6/9gaQ6pjHKDfUMu6RkJ6ifEEmhruUsoPmXAQTq/kwkpwWcD9Rl3Jx8PXVH+cZPd6k1yqQv0WS5adN7RWa0kagWWvObiMTK2BjkudJMD/Qmtys59AI9FNXfgNYo6cnZ7lz15NbIUHvvzXNLErQdEKaadi3GwZmM4wAJmJ7WY+wSMe2XBo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB6603.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(38070700021)(10067099003)(56012099006)(11063799006)(4143699003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Hqg01IKMHXu3jcBbVHJewoMKJCaa1mpOumenWZU3zHUK3yhJqBVwqJOCj53D?=
 =?us-ascii?Q?N4TN5n0OSSCkFv44NjehThzGiNzvK1Cb+JQp6fMoqYFwVI6TkepqiiTaH7DX?=
 =?us-ascii?Q?4KhknpqhlZisw5nDOwcSztjEV24bn9i0mqh5UuI6SiJd2TfDLacbU70Ad7OA?=
 =?us-ascii?Q?Ai4InrX/jbtly1ZgI82kM/0+uhRkJHPSCIOBU05KFLM3EMlR+M6S1XqWvxm5?=
 =?us-ascii?Q?0oCgxEYA6DwG6YjglRBK7kqYdLho+NCH9CP2k0LLIYdqhpfvw9W/oyQ+FipG?=
 =?us-ascii?Q?yPSwliGNo+IhrM6k4pPkFeN99rMKie8rcPei/AdMx2UxQkVDI5RXzJim+sbK?=
 =?us-ascii?Q?tnbhVcz2IodH5DjlwSUwC/Qv12v7bu4lklxebssUXZf01YlN9MHHVfaQSJAt?=
 =?us-ascii?Q?JPG74xVg1LaHDsHtaP/FYckC/KS7f3tTtsGbsoUwhJZriwLwiOm26gEUPc7R?=
 =?us-ascii?Q?2cpEDy5zZGu/cvhqTLoEMLV060j2L6asu7lbmBVfMkSOKYd+3GxM+Gb4ASiE?=
 =?us-ascii?Q?fiSIeIgsxNLfFurnQ12euLxlP+bxibTxWiWrXL3st7pJdepjxVseid9qKygl?=
 =?us-ascii?Q?p/TgfGXxvoUQSDNMscAneJ14z6fgbg1SMua1BTLywwIRWDx6cikJKwYV6hCi?=
 =?us-ascii?Q?LU6fcptM6MSC3K+5XKQ+F7HM1AmUf3F4mncR4+qZRF38+FLXmEI5wcijDxGm?=
 =?us-ascii?Q?DnKkguZGSCWSE4NmTROnzSr9chqBY/ffFK3Ag0jEWjYuZ8jjRqrHLJIZ/GUI?=
 =?us-ascii?Q?FCfBmlPaO49JzKakBkOshDBl27uM6Q8jM+FvvfrtrZ3bEiHUb25c74OjFN8v?=
 =?us-ascii?Q?HZ0FfrtDPWXrQyKImIFQKFse0yh+cJIg6Az68a6qs2ErAkCJgKIJ+YWg+gML?=
 =?us-ascii?Q?0s9pqmCVdDBnFZ7DiS92kHLkfVYbuBu/O9buMtxvQf4FukglepJN42zgIzmu?=
 =?us-ascii?Q?V+IX5zwGwHROV/Bw4z8dj+KVtNGwWEegDhumB/dnbitnC8j2smHCZ5SRFBKg?=
 =?us-ascii?Q?rl92deooiIlAJzovi79uEUEDoTthrJAoo/7wyuF8DLPZMEJwFHjrBmJ84S15?=
 =?us-ascii?Q?/Gt9YUbob1z5+jFGGwWRP+auoRWu+F6b7jnVagw7fGk97w/KTqhrImrPFHEL?=
 =?us-ascii?Q?dmwQdIsbiqsGRu7laYOsNqHC3rhlGNfwE7dxyqs4SPOr8J4m0Jh5iChpmUQK?=
 =?us-ascii?Q?DhoRGy5NBAkfxHMxYS+kZ03qI66HVglXkLJ0kbe9MctgK+aBgLfulohEjBGT?=
 =?us-ascii?Q?gAj9D5swaZcRilkvoAbaorou0P4uDjflEW6gEpLEaGJXIYX/gaWbYANxEQyt?=
 =?us-ascii?Q?frlV+ERNPoW/Ykv68RCkCudpzOn82Q8wlG5AhXChG4LNkvAJe6K+ccJQUl36?=
 =?us-ascii?Q?qiCs9qB1C4ijbEGqDCsR09+27HhEIr0jkrXzhMGmQQoGVvf6N1FdqPJ3XOfn?=
 =?us-ascii?Q?6VKtb4VpKuKvhcDBP5q+Z03VSJMXCm5LinkCOBlLxu8hBLtfRoo0CEaiy9Os?=
 =?us-ascii?Q?0yAOpLy16ZCXSGiccZOjqWxKrDOdvcjexYRKgWFZ3da5agH27DmLgUQdgZez?=
 =?us-ascii?Q?2Y3XoBp3oTlPvd3XqTMliPpdJ36RXqHPsx23qz3Dv06O5anNPM+qe0E4PbQ7?=
 =?us-ascii?Q?9g7kutgfzVu0T6m6VQ/lfb+6KZ6/XahL02VCcGDwZSVxZ27GiJ4UcAIzODMz?=
 =?us-ascii?Q?4C9MW0/YDd0EqO/usAfK4H6KwdDbUA+xEfp/b6UHN0KjtmJqbFDr8bw+Nork?=
 =?us-ascii?Q?aGWEYqir2w=3D=3D?=
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
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB6603.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e11b9d74-4840-4ad9-9873-08df43c9abd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 10:09:15.9914
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jQIn5bKaP0x+hSVJfBCX1VVh+UH1/xrsaceOSlCv9kumgbnKi5zsFyXd8OraM7R++RLAelmvReD80jrLsrW33yyRKwwSWYVb6ihD8HsOyOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18376

Hi Wolfram,

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 16 November 2026 10:05
> Subject: Re: [PATCH 0/3] Enable RZ/G3L SDHI
>=20
> Hi Biju,
>=20
> On Thu, Nov 12, 2026 at 06:48:49PM +0000, Biju Das wrote:
> > This patch series enable eMMC on SDHI0 and SDHI1 on SDHI2
> >
> > This patch series is depend upon [1]
> > [1] https://lore.kernel.org/all/20261104-usb_rzg3l-v8-0-ab109c4bd108@bp=
.renesas.com/
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> could you comment shortly on the Sashiko reports, please?

Sure.

Cheers,
Biju
