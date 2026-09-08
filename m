Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazolkn19010020.outbound.protection.outlook.com [52.103.43.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630F13B2D04;
	Tue,  8 Sep 2026 20:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899641; cv=fail; b=LsipVTkowAPdbCsGqAHc1aD4cKS3jiecfmJrxQnkAf/pvobCd1WbO9yqeK/GBe5L/mw+aBj4WSZtwfe4BLAXY5zCom9bMzSvqX9M8ci3ULdB1/OS5oOM9xirEAJO64Pb2r23+pfi+I7CqSARLxqWWj2yczqYFPZSRTxe/dp9ruc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899641; c=relaxed/simple;
	bh=tkKG6y9u2b/FZLbFWO4we+qBt+tImCXJRlpI4g2tQug=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ijke3puKMKuHdscjgmAGOCvuyH68thd7c1rBVK4vujn9hUOIhxgTXqr50E27Il3YSsUdPlQduIO4MX/SW1yz368uUKNArvoUcdX4VSJq+nsEPj9dfZOgvWKGuQ3uTJO45Qrd9lXQ+ZwKFNNy82vgZH3c8gQdNfb1V6JYWViphoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=dhA8h0zp; arc=fail smtp.client-ip=52.103.43.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="dhA8h0zp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qNC3rC9XTFpFfHzKgF65iutroZo0aX4IiSypkt4y2BR3bZaE7Rhvs2dLFle7RgvB4OEtpzyVLxUR7F5kLOmWQ545k5kslidiJCY551AGkegfivytmt1/w3JN9YehrLst3eY1zNz0desmF45tsWgabrwcleYyu0s5RFfyLbD7pgEbNcFgiUBqNU3Mbxvt54Qb0npcaAhi7sc1XML3zU9Yk+6WhGmdkfPBCRXNW5I9jtOnmpD8cCbz649HLbNRtNTQyLRTgYGH6QBzy0BaaCUMIuwkfIBdPZYr5jieTUUvti5VYnAvrTyU1T2OogkA2kesibv9aCllG6UGSXEey1F4bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6uyno6U/00PMMF2edr7TKj8LP84UOE/BUp/wDtEuOuE=;
 b=l7DmfK0KgbV9sWTgc7rod08VTijePW0G6UjXe25KqOedZOCXOD9BW6sG/a2sP5ttGRYm1tZKMgF32UfJaxT6QNvJdt8mdxzWYzmroyPTOrizvpTe7hpQFU3TG8tXsZh8IzwkGPR2q2cbuYl/7nt9f1pNR69xX1gupqz3/wD12oqqODMuX6IgdUtS04SaIfdvZEIniIgQbMN1rJg5taD5xhkxZFmdNtPnOqatoXMY0BYK4mCfxIDKFOWX4OaKayhbhIhryF7PqTJmEw1dMLEv6LFyGpXn3RFIWHU1nGYoBY/oiFJxohhl04zFrogDmnWoiFDu7irbp13LiIVnNfXpNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6uyno6U/00PMMF2edr7TKj8LP84UOE/BUp/wDtEuOuE=;
 b=dhA8h0zpXkr3uBTMALV5YRK8rFj+Spmwpjvqib8XMu7cc9ImYikNXOnww7/VZl+8fa/d7i/70xWfdEpYHbh0GHBpGOIJ8St89n4jxcOXQtX2IJ/S7YSDMplatRmKEOYPIONsQBwlLdFn57h1bDnAj7VPGD7MguFedf45ShN0mzKrsq7Xny/Kayupmqj0DTkCV2rjaa1c/NZ79PBw0D+7vCNqsNIRznWul5UxnbGbOCaKul9ZJZTlA0BsBvgilomdaqVtRIYuP72OgRcvyNIhs5bVeAPLUIh7R0Va+qP/C8SVHTTERtWffiZU2p+/9qiSs51uuUMCcI7RvlL0wBGXfA==
Received: from OSZPR01MB9313.jpnprd01.prod.outlook.com (2603:1096:604:1d9::14)
 by OSCPR01MB14838.jpnprd01.prod.outlook.com (2603:1096:604:3aa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 20:33:54 +0000
Received: from OSZPR01MB9313.jpnprd01.prod.outlook.com
 ([fe80::90bf:9b82:54c3:1542]) by OSZPR01MB9313.jpnprd01.prod.outlook.com
 ([fe80::90bf:9b82:54c3:1542%4]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 20:33:54 +0000
From: Keisuke Tsukuda <catnyaaan@outlook.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Alan Stern <stern@rowland.harvard.edu>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
	"syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com"
	<syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com>,
	"syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com"
	<syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com>, Keisuke Tsukuda
	<catnyaaan@outlook.com>
Subject: [PATCH v2 2/2] usb: gadget: f_mass_storage: ignore class requests
 while inactive
Thread-Topic: [PATCH v2 2/2] usb: gadget: f_mass_storage: ignore class
 requests while inactive
Thread-Index: AQHdP9FdpPARheSSvEO+Fl4V0g+46w==
Date: Tue, 8 Sep 2026 20:33:54 +0000
Message-ID: <20260908203348.95825-3-tkdkei@outlook.jp>
References: <20260908203348.95825-1-tkdkei@outlook.jp>
In-Reply-To: <20260908203348.95825-1-tkdkei@outlook.jp>
Accept-Language: en-US, ja-JP
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB9313:EE_|OSCPR01MB14838:EE_
x-ms-office365-filtering-correlation-id: 9d4a8b1b-34dc-41fa-acd2-08df0de8802e
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799012|25031999004|8060799015|8062599012|41001999006|15080799012|31061999003|38102599003|24021099003|12121999013|8022599003|25010399006|1602099012|10035399007|3071699003|2607281247196008|102099032|4302099013|3412199025|440099028|19061999003|1710799026;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?5o/r+vFXKcIthcoBHOeB+vru9qGqoU5P5ujMmhNL6UAMQYGYzV1aye9eh9?=
 =?iso-8859-1?Q?2DZ2UROa3pyr/F/vmnmLIQdvHhExEMtaxsKr5I1GK9hpATxXI9eSTyzd9I?=
 =?iso-8859-1?Q?jfxA7tnmXHtX7qDx52Af0pgoJPV0GrNGMS849jbqvFM1+AiKxYX5wGvWrS?=
 =?iso-8859-1?Q?XD6npeR2gnLAA07nU8rkvbQWvAU3ftYsnqPjVCkprbFDGJrgraiaK/gXs7?=
 =?iso-8859-1?Q?5QhWY9w1UK145GWOuKOOZ3uyrK/Tf6HwqnDuvbArPSMEeOK3VAHJwbakGp?=
 =?iso-8859-1?Q?k/GiCibs23mIr9lR2Blvu2nVVAQFswnovIP+tbU6x/1dcWWNig1+EasxjA?=
 =?iso-8859-1?Q?nq1mBOlIDu3hSVyYM03C6tBtIJlcsSfDYHQJJDqXWq3zhQIBpEHIod231c?=
 =?iso-8859-1?Q?o/Cixrh7dJhrjrP2/eOUGMpp1k9MY9Hr0OhgKimWQv7w0U27qjmGxeuqHw?=
 =?iso-8859-1?Q?I2fKamePEjRTV4UNf1xBSGN6vP+wwIgaZxpOQ7fbCplGkewBunAjxEbnBc?=
 =?iso-8859-1?Q?/S2JJJTv+TR9Bh1eOC48jSiubbBd34GnOQ5xBehS8tAl1YL3x4kbzl4MWj?=
 =?iso-8859-1?Q?3Kb8rDBnTIts6G8rOpLANUJeHEsRM0gyxUCpkAdpd0HzpOkyTJP0mFCEiB?=
 =?iso-8859-1?Q?49aIjzgLBjJMj8P/mOZ8W2X3A1Q0bVL0zWjEXueqpyKLFR8INCueD4fV6M?=
 =?iso-8859-1?Q?70cXgTszlFS8Dvwt0qZDg7RC2TNORDjuQBdtj0kyt1pxdoiPvAxQXMJFsW?=
 =?iso-8859-1?Q?RvYeOGoI5d/xtrME0oYOOHVnGd7YJfR6q/73h4FFKg3rll4eN97C6Ji/WY?=
 =?iso-8859-1?Q?ScWobU1nxLRkdX6KHne1C5/eWvm077F5SXSmyR//7WGLT1yG2fID/C1Aro?=
 =?iso-8859-1?Q?ANqBfUgSJwyg/ytQLTkjfLJWvR2bBbsQ8g1OzgpPO7lKqTyr1InihG7Ego?=
 =?iso-8859-1?Q?ZVb5O1jYXuXWeO4Nl9vw7OqkT7in6DkQIpGnJRUH80RnGefHfwUzoH6VuD?=
 =?iso-8859-1?Q?p5SCftZYE2dyHWbzgTU6hqnn/jarB5WqPUL8tSMO+xjAjPMY3cM06QbLpz?=
 =?iso-8859-1?Q?1xyO8yVSCpEyFRaHuzpa76/EhMMncIAQqMzjSvM8dIKXUPBknJWZ2UHc2l?=
 =?iso-8859-1?Q?gcXH8YcJBP/gZQqWPPk7B4oTLjxJKIHFCufQ9LV4L7T0otzmeAlrCiMix5?=
 =?iso-8859-1?Q?haeBxjJvvqujfFeBSn723Wj+KSWSMWZGjCc=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?XhwZAFEPJ2h/ORczFQq3GS/Azy/qf1Ecatv5nukilEY9gbe2G6tJwDlv/5?=
 =?iso-8859-1?Q?BtrN+DVt8bcyAKPk3nrJH9xbGDh6dYDzGISUE9PGeedL/DfTZcs2fzwtWo?=
 =?iso-8859-1?Q?nMeF9iDklJ0zMOpoKoSJ4QNW4l0AGn0EIDEu/VEpaydF7QnD0cSvAf/1tj?=
 =?iso-8859-1?Q?0oCO32NTQhQwNXmY/2X/CVdcffdrzD9VKyLOPspdE4eUVJgXM4zyKvRVjd?=
 =?iso-8859-1?Q?UGS1ddTISe790aVn1otu6cxD+tWvM4qa7sDxlY4sScB7P+5iLCUdY2orux?=
 =?iso-8859-1?Q?ZSjArzha5rjnecw81lBFCxQrm6nocEcuSU4BdfhZPYiRGVEYpVGMena4fl?=
 =?iso-8859-1?Q?oCCGkjYyyk7s3gTZCvduL/kRz2+JzcfvG7xrJzXTuQgNcXmP1IBGPuXJNC?=
 =?iso-8859-1?Q?QuBvtujDYrzLekIQ3nRgs6XVBCX9y2gMqQqG+/YGt2Dn9dy2iLPzNgSkns?=
 =?iso-8859-1?Q?xReJfn+geAiM+y5GiBllJsga2d40HNpjG9x9SCK/GTKmPBzIFizsU5jsGx?=
 =?iso-8859-1?Q?mIbppL96sCigAG9H5LB/88Wqi6bmhfAgcp6axqyOr/DUP2SmACRaItya9T?=
 =?iso-8859-1?Q?XESP9LOPx6VuDRNMLGYm6DYh0DvTXQwFMxlvs8a7EkKAldADkOxO4xuQ2M?=
 =?iso-8859-1?Q?FDRF7W9xHX04YG3BEOjM07YsEEnjyDolRAsbeRWbbXFD3JP1Xs+17jsWoV?=
 =?iso-8859-1?Q?/rElPUod5/XC+YWKsDTRjQdsqtT7hI1SHbqmOW5jWdsvfRXG4ak9xUWKWu?=
 =?iso-8859-1?Q?lmjRYpBFYhcYjO6N8W98EVTdW4WwkbtIvO6Oxm/5YMMYza2gjjHLIbceLC?=
 =?iso-8859-1?Q?QeIS4oEwho1hEuX8/ZDtr6L9HzoxPR8EXOshv1VqYQ79W660Y5kYJimf5n?=
 =?iso-8859-1?Q?33e4/K/LucmtE8Opkr963pRz38pQiR7/KVas/L8w/YboKoI+rmlysSXokE?=
 =?iso-8859-1?Q?GeYrD5STJP61Q/uh4yWyhOF14HLB1E/Zb/B1WPpn97XTWn41kZWRuMsLu6?=
 =?iso-8859-1?Q?r6dHfEm/ucaiE+XfyUmTHAMdma/J0UsgMiNBLiVzIhZ5g9epYtO+cIDqP+?=
 =?iso-8859-1?Q?1bnspsDAQjZn/5DorG4+vOJx04V4Qc2km8XV9k/wV14NcRMUEEgAJwsxWO?=
 =?iso-8859-1?Q?87SEyeVMRA6y0unvstCvt0ypcBAd3FHpXQUM+RNGTH82SsrzJWn/Yn8wm9?=
 =?iso-8859-1?Q?cnRFs1kIr7F2IU/z3YdAEq4vnZ5M9320aT66c3UzLomB44fWF28aLhnyno?=
 =?iso-8859-1?Q?bkptKWj3kh7e6YQoc9n8Nyq3tAimwl6WQnyZ4CxjDHDdnEyOBx0uTfsdhA?=
 =?iso-8859-1?Q?yBBUflTA1YevBJxxRMoCDBPMi9zpsaeMKa8KnhhKGlIVJJO6Jr6FHptRsF?=
 =?iso-8859-1?Q?03L40bWtd9alJME1QqjEnf7dOiXtkUyaeniAnax/AQb0iAK4EWXAtFOaln?=
 =?iso-8859-1?Q?a2yN5BtVRp4d1Fjq?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB9313.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d4a8b1b-34dc-41fa-acd2-08df0de8802e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 20:33:54.3641
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14838

SET_CONFIGURATION is handled asynchronously by the mass-storage thread.=0A=
A class request can arrive after the composite core selects the function=0A=
but before the thread installs common->fsg, or while the function is being=
=0A=
disabled.=0A=
=0A=
fsg_setup() already rejects this state with -EOPNOTSUPP, but checking it=0A=
through fsg_is_set() also emits a warning. Check the active function=0A=
directly so normal requests during a configuration transition are rejected=
=0A=
without hiding fsg_is_set() warnings from other internal paths.=0A=
=0A=
Fixes: 8876f5e7d3b2 ("USB: gadget: f_mass_storage: added eject callback")=
=0A=
Reported-by: syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com=0A=
Closes: https://syzkaller.appspot.com/bug?extid=3Dd31109047baed8f3b590=0A=
Signed-off-by: Keisuke Tsukuda <tkdkei@outlook.jp>=0A=
---=0A=
 drivers/usb/gadget/function/f_mass_storage.c | 7 ++++++-=0A=
 1 file changed, 6 insertions(+), 1 deletion(-)=0A=
=0A=
diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gad=
get/function/f_mass_storage.c=0A=
index a50743c..e80ff0b 100644=0A=
--- a/drivers/usb/gadget/function/f_mass_storage.c=0A=
+++ b/drivers/usb/gadget/function/f_mass_storage.c=0A=
@@ -463,7 +463,12 @@ static int fsg_setup(struct usb_function *f,=0A=
 	u16			w_value =3D le16_to_cpu(ctrl->wValue);=0A=
 	u16			w_length =3D le16_to_cpu(ctrl->wLength);=0A=
 =0A=
-	if (!fsg_is_set(fsg->common))=0A=
+	/*=0A=
+	 * fsg_is_set() warns when common->fsg is NULL, but that can happen=0A=
+	 * normally while a configuration change installs or removes the active=
=0A=
+	 * function.=0A=
+	 */=0A=
+	if (!fsg->common->fsg)=0A=
 		return -EOPNOTSUPP;=0A=
 =0A=
 	++fsg->common->ep0_req_tag;	/* Record arrival of a new request */=0A=
-- =0A=
2.50.1 (Apple Git-155)=0A=
=0A=
