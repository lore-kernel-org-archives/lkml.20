Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.192.116
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794364933;
	b=L5ky5TFHXSQrgJEmX3f+lUAS9lchK3ryPOO/ZPYr4S7EYu9nU+9ptPgu+OHCHT6/eUyJ
	 Sgl2QvkWZYIsopP9jp1drbGnTsLTWwDc61XvNwSWRIVKLsmPvnE6qNzhNXzaRTmbzqaSJ
	 JfAqZuQOchCtziOk3hB5qyh4QG2ysMo30ZyJdxhC8G+5y9Xo7lol6WJGy19HndsbajSyJ
	 40xc8hdZrE7IgQGkTghcDhrvo9qAgCb1ZJnfoghUV0XxeZCGEXrJiPcoULPCy5nCbFw5B
	 nukuvhx0VaZjGECdJbqLvr4iIAREKwXf1nDlJ5+xZB3XS0f2qna906h/BBi3rNrVn6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364933;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
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
	bh=oaHprJTNv+hJaNteMNc82433ylnaWw072ztdknR0q9A=;
	b=1G7AHVZE6RKZFun9RmamEtILhS/cQJzXQ+r3F0a09EAqKj8Dh4zyw5xq/OOfWFSYucXw
	 xiycTPK8ET+Qigi9is6iDz1EAy3ZJEzMC1zUZah7K5vJU36ochEPOLaPpfw/kKCJYVQqs
	 7DXEpBFECGO/NVygrxt5du1wYbZQhc4c9wHXQOVVuqSIZ282ZOUzl8SZOccCzvKvkpzt8
	 riZWQBccEy2sBEDKCibDmqgcPC04FqpoeyDjNu++JAq3T896jseSM61ZFBSOPNZOB+PpZ
	 barL73PbQQ5hM9yMPmnYhQ8mvYUkhJxdvwE7j9RQE3LU9bw/BpKRIwh3KFx2AEBeBgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=belligerently.dev;
	spf=pass smtp.mailfrom=belligerently.dev;
	dkim=pass header.d=aflaloinc.onmicrosoft.com header.i=@aflaloinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-aflaloinc-onmicrosoft-com header.b=XVIBPVzR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.192.116
Received: from YT5PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11021116.outbound.protection.outlook.com [40.107.192.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BF8606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6BF8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=belligerently.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=belligerently.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=aflaloinc.onmicrosoft.com header.i=@aflaloinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-aflaloinc-onmicrosoft-com header.b=XVIBPVzR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H1NFJ+IFBgPN0snp55PPN5rj3Bms8AE0Hl60lJ9+iouJumfTVEOkw4dsOJNtAt0LNH+qtfvkimtd1xpKcIEtF8GeJzoC/8Uv1KDoBPsrw6gM4TkqoR45i5WBoGvD/lqfvCZPhZM+fizC5B+Wu9TRxu5Rgd3Ij1iAZS2r5cU6RmfgGADrOwFVCaZYaHD8Ave5ruWc/DTZlHBHXQOXD5AVIxN7xJX0J8quDfzL/+eKHp/YVlZgcgaUtn2Pm9HSIr1MBx+3m/TQvQg4hhlnabhJxphTD8TNIdstj01KvmYBqEu6NooAhElXCMjv8YKjCRXFaM82HY7LVaagGghyGBSkVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oaHprJTNv+hJaNteMNc82433ylnaWw072ztdknR0q9A=;
 b=JjV8wp6WKmD9yhB1QgKYoKkKq6yycj5LyKcFdw4Ros4TIWqBv4Nw/gN6bO6dR0hmfgqH4M1bcOoC3ULJIDQf7OE3uOmR+Q1XGgnlM920qWEpPZ7BxKm7o90+DhGoQ5SoPEHFSDvvH5ERSIKVaegYUSaS9iXpNkrN0yyU3RoYNe8EtcaCs4NZwcaMLCqBpSglhbDz382qvySm/uVRb3VNkiJmetQ0Cntcbv8qAlrL8t8BZG6fI8i6PFpccL+ci/M/gFghKtzcyUHsypiUhSVv/vTU+AEdQJdX2H6TH7RPPi/GjzYmauBCnJO/krajHaurNvuPElwnOUUfKpmZhX6lkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=belligerently.dev; dmarc=pass action=none
 header.from=belligerently.dev; dkim=pass header.d=belligerently.dev; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aflaloinc.onmicrosoft.com; s=selector2-aflaloinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oaHprJTNv+hJaNteMNc82433ylnaWw072ztdknR0q9A=;
 b=XVIBPVzRf369F40Gt69pHAnTMzkJb3XT4kstXDJZGAcWZcAAQX2SnXiF3Cyg1qi8aAanncuk0Qv5RpWjXhbe0z2IogZR/dHTvfPoglvA9lruz//iRIP7cn4UfaKiE0EHr3k+JiPOkyUEvQolaJCKdS0kahfYyZJnzWlH2TDBo4Q=
Received: from YT3PR01MB9108.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:a1::19)
 by YQ1PR01MB587270.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:cc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 02:42:08 +0000
Received: from YT3PR01MB9108.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::8426:fdff:9196:f2d2]) by YT3PR01MB9108.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::8426:fdff:9196:f2d2%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 02:42:07 +0000
From: Zachary Aflalo <zac@belligerently.dev>
To: "parthiban.veerasooran@microchip.com"
	<parthiban.veerasooran@microchip.com>, "christian.gromm@microchip.com"
	<christian.gromm@microchip.com>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Zachary Aflalo
	<zachary@aflalo.com>
Subject: [PATCH] staging: most: net: Preserve network device registration
 errors
Thread-Topic: [PATCH] staging: most: net: Preserve network device registration
 errors
Thread-Index: AQHdcYWCPvSkDLCOZ0+Th3rHuE0+3g==
Date: Wed, 11 Nov 2026 02:42:07 +0000
Message-ID:
 <YT3PR01MB910878CBF3D8FF5F25367214AF712@YT3PR01MB9108.CANPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=belligerently.dev;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YT3PR01MB9108:EE_|YQ1PR01MB587270:EE_
x-ms-office365-filtering-correlation-id: 7d35c66b-2e2b-459f-4660-08df3f9d60e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|10067099003|56012099006|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|18002099003|6133799003;
x-microsoft-antispam-message-info:
 2sDr5X0NAg5DVu48ZDDNqHGGrSGeKn76oGQ3/MC25mRbVV2g0Hgm0k/ppb0z6cPMYadOV4rzdHY2TfYZ1YRUzU+c8/6x+cRzsg6iwejblXLqo1qk3ayu2olQmm5Xh+usIeL8TgVB/vIC49co8r5PqNH8/pkBhBSa8L44Mxgj3lGfPKwbs2zgCZJOOzC0K1YL/c4RX+8QKLL0cdWwqmkqi4TBeRoC8JOhIm8TTC/uiKinSJB6itAvgm4L7xBZfuQbhkNGNzt60jVSom2KbwsNCPbxauNBN9JM0TFGPw8uBIHdcq0jPzl/ZbPZUXWh4QCaQDoiHdNXEpDPGMa7o0Ft1bg2o1FXv1Q9bdcAm5pu4lIEBAIWxdrvpf9T4zb7AkkRuyGn9NWU6zni5+PFjnSd7UYwMlxJTDwnOT0rGD622B2/bhqW1NSW9ir2MgTjDTLsXcZKBOty+BSBFRSno7si7GZxd4QAW7OwFCTrWk3sxxJELQe6AO1KrofvWg8uwkGqvVNRVam67BoMbQTTmKH1vl7hW/qZzBisDjxfY6c+VcF5t1pnqtynho8KiQv1DFWXpmUBm4pvUS/lVXEnEA9x8wfIzrPNvALTEfk5mPGMTykaReqS9RGuFwHG+poPSp5n0CyBE67voQn+tiNNeEdLtO4OGabjEa6p2PB2AgKq6dWSFzu0QtQkkoBR+nqsA+hB99bNqHCUA8AUZU76ni4AIw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB9108.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(10067099003)(56012099006)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Up/bMWkpnaQnrb9klUCM5ZlwreCFZbTRYcYd9+N5ReDVTpMSgeNnDUYs8F?=
 =?iso-8859-1?Q?JjBAM3aaO2ynxX4pWCGHTECUMlbkKy7jexb5DrZglXlEQxdNXzCGXvIQF9?=
 =?iso-8859-1?Q?fsE+hMVgPUnZfV6DnqDvJKnTtKpTxBtJAMqxrgLD4CIGsIP01ICfF3pP/L?=
 =?iso-8859-1?Q?ID1jgbm+t3EDCA2omm4XukZb7vyo9KoQdYfHI8N2H4mJKYTEyovA7eHGJf?=
 =?iso-8859-1?Q?pSak4aVUU9HbdjA9k7ksQrXGiBhP1CylMRJPh+bhUNf8zJfi9tiy5bQItp?=
 =?iso-8859-1?Q?6VSqfEz0wn8jy/lj9GvghaOcmTpV/M8XvQx++PJFINiIi2zPt+LYR8Ovsf?=
 =?iso-8859-1?Q?uAXT2Qfu9dWyYFLNTmq4F0CJ1I56zixaHvlavyo//FvGh4noqpfb+MOs6v?=
 =?iso-8859-1?Q?/9Z1riTJbvVocXKfKtRB1IGO8BKZWMMzJorlgwoT9Pez1gxO3c7obFiB1O?=
 =?iso-8859-1?Q?/earp1mH0F2ZPxkJFe4V845AGMy+Clh0FGP6KMdiDUptsEsuIXoCKeMd0i?=
 =?iso-8859-1?Q?gMP+9Jmv9VU4IDcQUkqXDs+mup/Z5pLxb0UuqwaN+f0ZzlnP5JOF6alrNo?=
 =?iso-8859-1?Q?YLUlOyN2hw4HKj3bMJH38ZwQatQkdSpdVue0O6zySserNaeDiO0Ojqj8jS?=
 =?iso-8859-1?Q?8DYSdWPwOAX75nhgt3k/I1/6aFTtiyU3tfftJvnNriW1FhLnA+YQtFwQcE?=
 =?iso-8859-1?Q?YFYuz6XUN0bjNOSZMxvCQoL/3CvLg/dVQigQj5+OGII62TkieitP7RrnOI?=
 =?iso-8859-1?Q?dlMSYrqMFwJuJBaeHprbuuxuLycZt4+RVoNa/Pl0I56f6KH6bqWYmGKAjx?=
 =?iso-8859-1?Q?feUDsVWP448Cqg+tARzGwI29msk0SoixfGdiVb2f1jf3Z0bKTBxX/pZFTB?=
 =?iso-8859-1?Q?ui0rChEJ/6Hv+dc7t568uBtqtcECgSXdQ6eD/vIimGwjK9v6cW/qrDv1yd?=
 =?iso-8859-1?Q?M8uIELd0hG8A3JhzZb6IsXZu8ADq0WyMXInb2wc3BINJ3thiw6kQulY575?=
 =?iso-8859-1?Q?3vQt4nuvlNAQDtDZnjWz8ty3rUk0LgGPOi3DZQDoapYpa9Uihq3lzQOWZ8?=
 =?iso-8859-1?Q?lwi4BSIVWTP9ZN1Ykn42buyBLnLbPkmnso7x8yTuMVcj4vVhmfIG3r8NUG?=
 =?iso-8859-1?Q?ozVva/bYJkRQT6d+frsvA7xlcBLC0++NHdBAf+qhedo2DNNuvjF9AZOwrQ?=
 =?iso-8859-1?Q?E7DpfrTsmAEINADoC3jnuNsDX4G9fYW0jccTcs8SFlo123Adf/zv7ROdIj?=
 =?iso-8859-1?Q?kowCjF8yhdlGbarUJ3ybf5d33sD2fUldc8msghr/zqGRCEUk2MQAS9Vmwa?=
 =?iso-8859-1?Q?tYySz6j581zWh/jdhGiJXtR95yyMB7TDzg0R9V6C0nirImHKrILOp7Zxqa?=
 =?iso-8859-1?Q?BKjYYD6qTEVHFeXjdklanmA/FOwnw75jIddybVF11eslCl3UyPQ905wSL/?=
 =?iso-8859-1?Q?XuuR0nf3XX9e1ynr5uftzlm6qmzN5EMZmwF2BiQykEo+HtoxydEoeT3Bp5?=
 =?iso-8859-1?Q?wvlMlrr4m2GamhOZQcFP9FPJXNT85RvA+q/pGn/5m6L/qA9kZ+a09Vkdw7?=
 =?iso-8859-1?Q?PuysHX7709B2GXiOCATC5ioMC0kdiStugkysVy8erj0HIob29zZhiFEt6I?=
 =?iso-8859-1?Q?hCW7sfcgqe34am6QF18GM3uNpkQQJMsDIvjwQTEU81rlQ1C6K/tp/QRFO6?=
 =?iso-8859-1?Q?Sx3GSVhWtXObCslPQGcmP4NXdN3uu2Th4kwejNvhHqW4cj3oyDw9bPfcWS?=
 =?iso-8859-1?Q?897sQb1PWkSNZ/o1WbLqP1jfJPANbol2rDDG3i9cEyVT+1?=
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
X-OriginatorOrg: belligerently.dev
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB9108.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d35c66b-2e2b-459f-4660-08df3f9d60e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 02:42:07.7791
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca1ac321-d0ef-4a0f-ba98-dcee4386f0ca
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8ow5majs8QUc1crZ+2R4y6wv6zWs9kvBdkpN4wpGMkHm1qMfHnzJstidj6lSzi8OZBG+IF5pbt/w9XgJFV3BWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQ1PR01MB587270

From: Zachary Aflalo <zachary@aflalo.com>=0A=
=0A=
comp_probe_channel() replaces every register_netdev() failure with=0A=
-EINVAL. This hides errors such as -ENOMEM and -EINTR from the MOST core=0A=
and the configfs create_link interface.=0A=
=0A=
Save the registration error and return it through the existing unlock=0A=
path. Keep mapping -ENODEV to -EINVAL because configfs uses -ENODEV to=0A=
accept a deferred link when the device or component is missing. Returning=
=0A=
that error for a failed registration would incorrectly acknowledge the=0A=
link request as deferred configuration.=0A=
=0A=
Codex assisted the source review, implementation, and commit message.=0A=
=0A=
Fixes: d4a8ce7f57fc ("Staging: most: add MOST driver's aim-network module")=
=0A=
Signed-off-by: Zachary Aflalo <zachary@aflalo.com>=0A=
---=0A=
Validation:=0A=
  Built the original and final driver objects on Debian ARM64 with=0A=
  GCC 14.2.0, W=3D1 and C=3D2, using upstream sparse at=0A=
  84ec0658c81db4ccc4aabc420d3dc118c2c6a310. No driver diagnostics or new=0A=
  warnings. Both versions produce the same unrelated sparse warning in=0A=
  arch/arm64/kernel/vdso/vgetrandom.c for __kernel_getrandom.=0A=
=0A=
  Extracted-function tests with mocked dependencies cover both channel=0A=
  directions, registration failures (including -ENODEV), successful=0A=
  registration, duplicate-link rejection, lock balance, and the actual=0A=
  configfs create_link store function. These are native userspace tests,=0A=
  not kernel runtime or hardware tests. No physical MOST hardware tested.=
=0A=
=0A=
AI assistance:=0A=
  Codex inspected staging error paths, proposed this focused correction,=0A=
  checked caller behavior, wrote the change and mocked tests, and drafted=
=0A=
  this message. The prompts requested a small meaningful staging fix,=0A=
  preservation of existing behavior, and validation before submission.=0A=
 drivers/staging/most/net/net.c | 7 +++++--=0A=
 1 file changed, 5 insertions(+), 2 deletions(-)=0A=
=0A=
diff --git a/drivers/staging/most/net/net.c b/drivers/staging/most/net/net.=
c=0A=
index e6e4498d3..5dc867d0c 100644=0A=
--- a/drivers/staging/most/net/net.c=0A=
+++ b/drivers/staging/most/net/net.c=0A=
@@ -334,9 +334,12 @@ static int comp_probe_channel(struct most_interface *i=
face, int channel_idx,=0A=
 			goto unlock;=0A=
 		}=0A=
 =0A=
-		if (register_netdev(nd->dev)) {=0A=
+		ret =3D register_netdev(nd->dev);=0A=
+		if (ret) {=0A=
 			netdev_err(nd->dev, "register_netdev() failed\n");=0A=
-			ret =3D -EINVAL;=0A=
+			/* Configfs treats -ENODEV as a deferred link. */=0A=
+			if (ret =3D=3D -ENODEV)=0A=
+				ret =3D -EINVAL;=0A=
 			goto unlock;=0A=
 		}=0A=
 	}=0A=
=0A=
base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620=0A=
