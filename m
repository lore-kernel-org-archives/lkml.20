Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794675197;
	b=aol71GXfKjhM29yt64+haNVxiE4Eovke8wP12Aja+TQAJPWlT41vONnvJnCB/B/mjGUc
	 rljL05Y3fX8eHscu6brkQnBYCcxBr8Vr8NOMQVsR/pD+g4dxqLNt8sLU0Y1Ptn6epd02M
	 040Q6j/A/cHeRJNP3YdiLZU72DGXmnbiFQaO0IQnvF3fio4KMcNC1ppqpwm5PMod2YreR
	 mFTl5BSoKgYD7PAYwCoPy7fLILcO7YGk54uGo6vjJ/ycH48PAMytbMSNamapHSJgkGH8v
	 Bxfu/DKMlycWNQIZAXJUJDWC2lcWm1RUetWslqbPIpSw4M4m8OSL7XfJi3zckubtBeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675197;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:
	 x-ms-exchange-antispam-messagedata-1:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=YcrXAbJwHNfTZbe+MW/7BDafD2ccoGNSc72qSFDn8Jw=;
	b=x7pCeD0FYef3lQcatfFzxz3NXIwtWmnJOtsm/W4AdsRbXvkYdBvtEE72bCx7jQKzbMtd
	 XOTT2nmcT+CH1a9dAoVcph0DucjvbCNCellWV9iEA1Ih/vPMYe+Uiarqun65QgWysk8Jx
	 bG0yJLxlL82xFFtpxKUVmMgWWQXueqQv0BaNyomXP1yPfYfvUo6SamZd8IsVpkbN46v+7
	 SLNKTOzCKDogPxO6HddLLKvA5D/fjaO7pXkrjtVfO9YoUm7b3RZVHgqBrCIPZpXrV4AVJ
	 81UvxCrVHTxsPDSiBV9qq7RAGvGBjsD/Yp0qmJDcSNwxFAnwWal3KUh0ylbkrq2Vv5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=est.tech;
	spf=pass smtp.mailfrom=est.tech;
	dkim=pass header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=bIYMGEEq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.51
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010051.outbound.protection.outlook.com [52.101.69.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1ED606A32D;
	Sat, 14 Nov 2026 16:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED1ED606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=est.tech header.i=@est.tech header.a=rsa-sha256 header.s=selector1 header.b=bIYMGEEq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/jx00nfnsrI/0YFguwWeeEYXxnLGFMoea4ZsUzyt/TBf2Fbsc02NlEtfPYIpco/XHo5wT/nr1P2x3gAmS0T7Vr8rx2j40/zoBRoBuRFDggXvdi2b/DjJDFZ6STixPRmjtFh1rsU4XsMCuGOsuzVlG2GtvlLIGX1FM4t5wyl7ruROPS1UziymQ8dVvwUpTWiHdAEKoV0NsOxXv3MuhV3WKTT2C0qcfj72qYaK5bmDaN9gbaATthWWuEH5R9KDlVnhDJPDPGuOsDiGksvBkSpcgGoOQaT++XQleTUZGrSIo83V2B1vkoupTNBpL6/EEYEX1BXOFWGuRdiK/SD0rN9Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcrXAbJwHNfTZbe+MW/7BDafD2ccoGNSc72qSFDn8Jw=;
 b=W5mGiudJ5rukQiVnfLCnADKXZLbRXEfVAQHnSZzY7CKIdOU3Q/z/MOB19QPqv2sq0luyRBNfkjhkvUXzRd233A9ziZ1ro3F2etval0Z+p9McVsiMo+FakCAzzMBdyjLavSI6JoTH1P0g51E90Aj6umvpZHN+06IS4mJToNbtojJp4d6TPske3NYcL6VcBGzZoMR+9+9nGme3JOyw6stzXQS9wSLIw4dUs8LA4UN8V4RjmcZBzC7sgeIGAPbAkFs6gAhDZUq4dqo9acUKGUfAEri3b7913kOO/rmk5QCXYEhKMcf7TZodf6dnv/RC8lvMW8L3h/0CVuqr4hfZP5wpkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcrXAbJwHNfTZbe+MW/7BDafD2ccoGNSc72qSFDn8Jw=;
 b=bIYMGEEqbj2IYLaao4CDvLHZVNmSYTSz2p4b5hKn6bdIr8FaDu29YvhmMSGZLvNPHyyxDpzCwQuFALr1dSI2rPUQgx2Xs5ZAPemUduCPDTPesCwwYL6GGy7zD7Mk4I8Mh+ByIYpFUt5qSpI/hkU8iaF7ftrwtzzj6UecKhJo8+j8f+70cSKVKPELXOK+ounLx1e1O0cQyrzSNheqvhj9sgB+3mEwK4RsJwN0rsrYPpD4yAZhYuqsfepr/ORBfwOhTzZ4BnLbz3gw5Hzatca/K1InJHp81Y+PwCMawK2YMw4TguTcu/spKZgFtTkgGTndBShxxQFlOKpXkgl7ZWPqnQ==
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17e::23)
 by PAWP189MB2546.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:35e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Sat, 14 Nov
 2026 16:53:10 +0000
Received: from AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5]) by AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
 ([fe80::86f0:8ce1:a437:b2d5%6]) with mapi id 15.21.0615.009; Sat, 14 Nov 2026
 16:53:10 +0000
From: Tung Quang Nguyen <tung.quang.nguyen@est.tech>
To: =?iso-8859-1?Q?=D6mer_Mete_Kaya?= <omermetekaya0@gmail.com>
CC: Jon Maloy <jmaloy@redhat.com>, "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"tipc-discussion@lists.sourceforge.net"
	<tipc-discussion@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] tipc: fix rc_dests counter corruption on reinit
Thread-Topic: [PATCH net] tipc: fix rc_dests counter corruption on reinit
Thread-Index: AQHddFWbEDLs9Orei0mBobR8JkW4R7ctxzgH
Date: Sat, 14 Nov 2026 16:53:10 +0000
Message-ID:
 <AM7P189MB113751ABA8530A43A188A392C67E2@AM7P189MB1137.EURP189.PROD.OUTLOOK.COM>
References: <20261114163113.208769-1-omermetekaya0@gmail.com>
In-Reply-To: <20261114163113.208769-1-omermetekaya0@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7P189MB1137:EE_|PAWP189MB2546:EE_
x-ms-office365-filtering-correlation-id: ca72c97e-f291-4f7d-5ff3-08df426fc3ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|23010399003|7416014|376014|366016|1800799024|38070700021|10067099003|11063799006|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 kHdGG2Km5k7s7U6V+hBYi4gQDemEeYz7evru1aoycUDvBWZgIuodc3SLogyf3XMXNZaxHq2Sb7UfYwMppLfVkPiP5jS3ymONE4quxD9houhYrVxCEOr6OT+vpmWP/s2Rh/tukT4ZZwHVibo3d+qEMb4taHFex5M4Ah6rpt5vBqBBEU4mj0Oz1vpV3aL02SrzwNIZajMmsXZ1Pk3M8fknAIamQYCVoaZphAtrZ6zugArITH+tdEdw8u0RWNqM1Cx+XvAoCF/mxzCTbeyQptEgBchNFBwZUgL3NCO05ujkXEak85VjRYh06PTkmrEc/OT3ebXlJUZIjSOi2oyYFRMxjJk2PJ2LiR8yuUsT8SdVLszoCrYtbsup9qWQG03lHQQtRz1S/ipQmA4Lvey4U9TyVwml6MIANx+GZfmMuyKpnGliNcawIWp3TalBfLqBC8/GqxtlUMvMkWCh0BQ0Th3XJX6ipfTNdGXYyRjJY5ETb60ydATiNRb5M7+gWX4LMpnWuxz6QVel7S2fmQXgEyXwrwuOM8fjeytpYuHtjkGoXulw7KVenkcEd7fd5ZoqIvdIEMDNac7xRc1YiptqomfRw5M9xplyD6lU/D52K7PrCmO5TqEC/8FldmxcTzqhA/BIoB4uVGvGX+ZXEqkYgonLIRAqP8fQaqF9PTFve84u/mg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB1137.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(7416014)(376014)(366016)(1800799024)(38070700021)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7v7Dzb/YObeVpg4BQ3HJPq8W1Z325/E9g3r8AYghcA2SGHZFqQykI7MLxi?=
 =?iso-8859-1?Q?8E0NW4cP4X79Ayu0/G9QRXY9VSioCIEcU7nQxmFz81pJ/teyx1fQ74JzjC?=
 =?iso-8859-1?Q?odyO5mNLZDq0I2+1A6yjKg27ZYYAoW8hCfUVBd+r0CoQaEjGgWipfvYSFt?=
 =?iso-8859-1?Q?udG/RfwiDPzOmaasZ1xueWaiSsoTQ7MODFuCsiGDn5LouYAw3iLVYD3LOA?=
 =?iso-8859-1?Q?DHgkLsngd7/V4bj8TGwv03qAiUVBwqSO/IHJlPXzarr5V4t8oaLuCR00qh?=
 =?iso-8859-1?Q?4VZnQMxDAHtgC3BvYaObacrriGNAerJuT/DeUBqRIaPJUbZRemVLuKQEhm?=
 =?iso-8859-1?Q?ssm6TFkhSgF6Gowa7grWbJmKtcl6M0Y/RwNocU/ba4v9bvarAe9l6p7L7j?=
 =?iso-8859-1?Q?6jaj7CIVrWWxeA4Ds3M5Pj3xBEOjFxW+80OeS4uvmR8W0/nMFs3QNtmgaX?=
 =?iso-8859-1?Q?XU5sPWvcIuWqxSi0DpiI3HB8OZk4TwuNmczLwQ6NLxHkldfa/lROyTX0u8?=
 =?iso-8859-1?Q?xUBp/X0DMqGKvhr9zI8+jApsJIG+9bN42wPTJ0iZ1QwHSaqkzUg5dWT1qW?=
 =?iso-8859-1?Q?kxAduoYc5iSBfPdjeW9QjHtQcfJsxA/rBUXgajs3+QsYXW9haK6FiESRdH?=
 =?iso-8859-1?Q?97rBlwkwjvKUsVPsNAePEfy+cVKpjwWvDvef4nZQJJRUoXc+u82/cMLol8?=
 =?iso-8859-1?Q?sW56gIdry2HL4QbeQIfx2ELl+wcKlLpu9bsH72wQNlcHIbTP/6RgGeP9qc?=
 =?iso-8859-1?Q?7qZzEWZN2yG1AdC324BGmwP5UDkJ8ww4gYv9+/jBAiCrBgoNtjpuXiXVew?=
 =?iso-8859-1?Q?cCh9t765YKPBpeKGP2+39OvlsGMuAR4Ilbmy3+JC8xsIQkkDavBXY7Yo27?=
 =?iso-8859-1?Q?DahIXaInn4gt9QK5o2tcxn/hv5Xz+sBB6BE1PlL335Im5LiIsSRCPAGixs?=
 =?iso-8859-1?Q?tEn1TEP/d8KnBo1zlfbE07po0yYsvRgXBVzYVlPa1wObAbwXusroKi/VPi?=
 =?iso-8859-1?Q?fxamG+7+uyTsc7Xiu66nqmTCTIOb06NLPq71JNoZRue1Fn8yKw1Th/QCbJ?=
 =?iso-8859-1?Q?MSZI7Z1rb+nKBrh0bTsBYibpaqde3UKfu4hsKVah8iNr9nwzURnmIlzLuv?=
 =?iso-8859-1?Q?EL4fSDl7acfXNnAU2UDadMdOqRTqEf1eDF4nMA/2TQ4BsHMxektx44f0g1?=
 =?iso-8859-1?Q?0xXaoUBr7kquOQFB3ztCqvV9/NP2DsISapSTyTVuiSdWRFtEy4yDpq1Ihu?=
 =?iso-8859-1?Q?RpnrTxrf3n7B9X58s0WJpc2UfesmqJscIKnqD0JyNE0u49+FDNqJ8XBR3w?=
 =?iso-8859-1?Q?KZJAg58JzT8sQwz4ZRfB8nfwlKqzuXcm9JKzMqzfcg9Mx1ny1zNESM3Ivc?=
 =?iso-8859-1?Q?iq7hDe6s1qrb86dwHPSRULP2CCmsNuNLABWsxX25qBa9g7/EiwmH5VKSAb?=
 =?iso-8859-1?Q?gnxEDdOgHtDWFZ+47NCrnJCh0YDFRLc1xP9/898Kow45Gyo0ivniFb+/ns?=
 =?iso-8859-1?Q?8ReBqSfBiA4MM3h+Y21cINfIooqEhgGKECJBCNuvoMSJEFL24zhNHFaID+?=
 =?iso-8859-1?Q?G82lAk6J+kyeyDPeFsbHKpb89WzKm5bxnBD1QqqCFbAvK1OAck50iRQDlk?=
 =?iso-8859-1?Q?QFXqSIL7l7iioB8BxOpzIEUCCnJln0z1AEI8PO5oql5pO3txMSLnsmTcQK?=
 =?iso-8859-1?Q?o/iC2JoaKdrclhq5RKPMR9bB728JfeFwI0Z2tdsoTx3njBuZpTY2vxiobk?=
 =?iso-8859-1?Q?UOd5rolV9fPtKWh2Kz9K2aqtCAj/nrz5yoShhGfXsazEU0XppoulxxF+ln?=
 =?iso-8859-1?Q?F/NMlBHYzsqTzcPnNiiLQmzt8/+2gLQW6MDKjrWtSlS3n5Ilxx7Qc8QAEr?=
 =?iso-8859-1?Q?Sz?=
x-ms-exchange-antispam-messagedata-1: hyvTSMWcqVJjMQ==
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
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1137.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ca72c97e-f291-4f7d-5ff3-08df426fc3ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2026 16:53:10.3504
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rrBo9X0b9eN71JTGcysOHzZczza3m1i3Zy8qEGiGvd3VrmohareHOUbw5237xhNxqaHhUn4u+Taz+sk7FEUDcyHUmPNeikX30GSsdcLaM1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2546

> Subject: [PATCH net] tipc: fix rc_dests counter corruption on reinit=0A=
=0A=
This is part of my on-going series: https://lore.kernel.org/all/20261102034=
207.10639-4-tung.quang.nguyen@est.tech/=0A=
I will send new version soon.=0A=
=0A=
---=0A=
pw-bot: rejected=0A=
=0A=
=0A=
