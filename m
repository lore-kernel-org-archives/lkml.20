Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.43.103
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793580821;
	b=l5enzNEuB9frmqgJMgXHLHv00RhPAh7mFEhPx8qsz+phLfWWExIff2PVKyDfkEWk/RQc
	 OcissDoi5TNOfEOoTk5gdlbFQK+NfcvEN92N85GqolKwLREWpTmQEw6tP62BijAHSahYv
	 jfdm5dKMsVCuRWR/aku1tw8OFsGaA/PzkC3zpURoNzgmfxPcC57xeL1E26uCvBsYKGwB6
	 xsin0bU4RYGW4cTTbjE0bjANPhCCpvtW4ID3Kgkmc+1WhdabGVm2GXfxZ4WB0jGdaaS1l
	 rdik04Kzu166gme19WIhskIx0eAHipFcNLVlcu5OeZZ5oPz6Nnh+xSZBJVglx+jsNlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793580821;
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
	bh=N8dIJcjrIIkQtZPVHkph7+9wXagyTG/FsRzre0pI4TA=;
	b=QpKxk/Q5bv9DMK7T+CmzcrOUDRJI4Iw3s0sF0sW4hbwylR8jcIblZfEZ87DEcHMuIw8D
	 hJJdU6o6BVD9+zaN7JS4yJpgJW1oAae+7nS0IgFGKjVq9+gZiNbkXN/YaNUPFTBJdelh8
	 7AXNjbR0y8XGDWvLgdah/GDoMVp1PbWfr+5AEAixC25kz6OP60cyR+p+K/GiDOTe4UM30
	 Msv58UieDhzOdLz6SlOx8CMTtag8/Lo5VF+SRTgS0oIxrlfb9rvihz9ZniZZlo4P+HqDM
	 hTmdMu4GoMZWRHj4ANn2w1jLDJuK6kM5xujuEgYqEsB/Vl1lIPz3oTZNVexXrWW1SGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chipsnmedia.com;
	spf=fail smtp.mailfrom=chipsnmedia.com;
	dkim=pass header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=wcGWYYPo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.43.103
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022103.outbound.protection.outlook.com [40.107.43.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78946606A324;
	Mon,  2 Nov 2026 00:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78946606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=wcGWYYPo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qk7NZiAe26izVz/UmtMK5ea2OB8E9BIatXW/AKpYF8wCpF3+BG+W4V8WLSwAQW2TmCxuNl4UNBdFOkupWWH8TCcyzMa+YSgw0R16l/qEn66EumYitTT4zw0VPug9CXLXLxKUd/+lweocCRYh5IoezMu+ZxJ8Uv2fLBoa1/uSCgTpFugjs4hFZyAaziBnbRlY1PA4ygX+R8U+lWorbsnOd0YTVmt2dtUYo4ColnPME2QGz3jbH4bH48QUeMhaY6ZwlkgsyTLNEcMyPCCkNwTOXUUne6NkdHxjlKiVmFdW8jpjIuVh4ehkfzZlkSkpgC22iwR+PpPZt4pv3pyXYiu3Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8dIJcjrIIkQtZPVHkph7+9wXagyTG/FsRzre0pI4TA=;
 b=n0KLmtq+RpdBeS/Wj+dCwoI28RiNLmIpViFHkkfndoFGZQDlcrQrM0WAk+Ijjd32X/s/3jV++JUVzvubG3SKLYfvcC8WCSjRUQq1r0tPXZzmB7jWXnk9cU9W8ASUv06WakXF27l9N5gMMfZL8M77gkr1yYHOVETqs8C5U3+jgHCwxUsMoCyLvcT/ZGJE4m2MsmBCv4KtF8Fxw/z5Qou6FCRsE1AWtSwsD1vLKoF97oS3h39aIch6CLYVCPr0yaO2+do+uFglXq1d+/zpVev4j7WnA5N4JN218PnJyyFneymiWNo6UtHwBiMOeWzIFy/7t8XREsuTIZS9fK8fGHBufg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8dIJcjrIIkQtZPVHkph7+9wXagyTG/FsRzre0pI4TA=;
 b=wcGWYYPou4Oeqqx+mRpp989TTCWjmxtpCIHuu+4k5quzYtNA3i2HgVF46quUWNr2zBjI/ipM0VWDLmGVmGgzqYCMbOOVpdIIWjnMZmoubsNghWr92vHvdK4/N1dtWtNAgmC95Pdyq+WGvEyK7cDtIwzvxoKM35wyhO3brkaFT9nraJVLTbdrIFGCovkSdjZFZEpZWHRgEipYq5F2BTkEKt+US4ZQYx3jKvppMhZxGfdGEfbz1aJtPOB5jZK+FEWD6onyUYN0l9dLYy2co6jTWrXYGAyLVAmh+5xAcPkwFzaQx7S/trXLoXMYIOyGxRpgPW0zAdfWv57tkDC7sQv/tg==
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 PUVP216MB231379.KORP216.PROD.OUTLOOK.COM (2603:1096:301:170::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 00:53:36 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 00:53:36 +0000
From: "jackson.lee" <jackson.lee@chipsnmedia.com>
To: "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, "bob.beckett@collabora.com"
	<bob.beckett@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "lafley.kim"
	<lafley.kim@chipsnmedia.com>, "b-brnich@ti.com" <b-brnich@ti.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung
	<nas.chung@chipsnmedia.com>
Subject: RE: [PATCH v1 0/9] fix decoder corruption, stalls and seek issues
Thread-Topic: [PATCH v1 0/9] fix decoder corruption, stalls and seek issues
Thread-Index: AQHdVf+Npv4bU3wpiES4uhcjpnAy1bcaG24A
Date: Mon, 2 Nov 2026 00:53:36 +0000
Message-ID:
 <SLXP216MB11481068F1F87A6E64040BC4ED6A2@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
References: <20261007015946.53-1-jackson.lee@chipsnmedia.com>
In-Reply-To: <20261007015946.53-1-jackson.lee@chipsnmedia.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB1148:EE_|PUVP216MB231379:EE_
x-ms-office365-filtering-correlation-id: d3df6ca0-0b23-4848-c110-08df387bba13
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|38070700021|56012099006|261009223027099003|261028144727099003|261021121427099003|261021123027099003|261021135927099003|261026121527099003|261022105027099003|261022075727099003|261026140227099003|10067099003|22082099003|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 y3WKbL9YVnQQcwBqekwNfHHahf5FNl4PERZn0h9Y6DpIubq5A2E/iTuF6FwD8g2KW32jMJ42H5zJaUnW5cm/vHtln/7E08ou0Cqo3RE1Qon/OZJnYrtFzvpJ+4mr0Zse5zP4kueGG936XYVSdKuRjhIhPnlnD548BLwQSPv2hOkQY2QWEvNsHwnAdPtwEDnk/uuGQfAoQJ72M1JD2YQfKpEu2l+yluhNQrownBKNeY0LMFQhqz/xcO67D6dwrPHW1wZN8fxuXoZDmzsUIEysHLfp1DJGHFRIQT7NYV1KUoH73kjz+ErCbePAadAbd3XEl/CFUld9n9tA7KQvNln+Naf+YLgGcE8sAvPynJUw/w0i0bC/HYnEubqPgr1+Gj+g2xa8Py4b9/483LoXah6vLmdeCkgpi+MqY3j0/kFwBx3V5n1YgLbx0E4eNQpKhR/TXei2OPDuRM7U7WCAgUGn36Jds65cHR2JGBlPmO1bpL7V4Gp4yc8mNfxdqatFmEJNux8rL5nI83hy2xeNOe0j5b3MduaKqxWR0HZKI9jrRynEGP7mSFp1yzfl+SvkdJlqA7+uNbZr13pJwfnGgc73X6FntBt1MKb7BQeAYxxl1fSGUsUCmleOdvFeVMPr+jmD3Z+vu3PI8xxaPbrkb+EmxLsL0C2v9QBU552s0PN2Pjx9eS7M2V333TFUbcxAJqkVYymBxQboBI8ikUgPpPaSlgYHIXBqUudk5r+Fb7D7XaM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261021135927099003)(261026121527099003)(261022105027099003)(261022075727099003)(261026140227099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?FYDfcq2J2sYIpMuvHNZGqEaU96gdPzmtGsVu38aF3NbjPF1LTIJpFHFBVVvf?=
 =?us-ascii?Q?jvssP/1W3k1M9RxepPb4UhSh+i2EPaskNIDnrWQRqlFtw5hefVoxgcI2GbmA?=
 =?us-ascii?Q?hmsyUSyRO5QHRRL64e4cpAo3UUNZTNEMndOoTtdSSPgUFk83RaWBTRvZRxVj?=
 =?us-ascii?Q?sN9ft6dkRtbQ6u+BSfJT+N8qpw3VMZdBAc8OCPLeUyrfxXW2JYwzaOMkg+5E?=
 =?us-ascii?Q?jhYONTwqSudaRWcjAhOadF3PKgPfyJ5XCpxiWfwbUJjTiSzrKz54SyjxaAfG?=
 =?us-ascii?Q?FpRW1JzxFwq7MjEDmBBf5nOFO+S4nr/axbXcHB0LxTUMsc1oBfaSHY/q6M45?=
 =?us-ascii?Q?YNVOUL5dUP2Nbcv2lATgLL3q3At9klOW/ZliiYRXQIqZRsC/qI2wPnS6+FYj?=
 =?us-ascii?Q?82inE+Fr7p71u0xTM1fsLERMQz3YoRoRjHGI7lKGH180VGwA5n/6iuNAHeKc?=
 =?us-ascii?Q?RFtQNc4p2nVESidUuQiggIh/2ySRonhJ5EopNDiQ8XeyZzx87rMbGRm1sudN?=
 =?us-ascii?Q?9EX/OKf+JCiIvKPbDqO1lb4l9g41MVu+j/itVUFYTciuFw3CkqND/frJdAjE?=
 =?us-ascii?Q?J+0XbIDhSQvfzKO8gIskpXCbTuEsALk7DK1kjK3Rx1jbR8ne6+ge8iiv/Eh8?=
 =?us-ascii?Q?Y/yGLKDAxRFrf94i8mmYJ7M2cvl0W7WN2faRRmo5rfcEkl+iyi7eIqb82RSz?=
 =?us-ascii?Q?MeriKCa8D+E4NVo/Hq17xRWm6EMQyM/k5FAuIyyqulhsb8ageg2frG4AWORs?=
 =?us-ascii?Q?safvb1Zz31ZeTiH2Q03z5OONhpGGwfHZk766c5BrtaMfKXNJFTWsgOhwkzPU?=
 =?us-ascii?Q?P+gwyPKtmAuLzY0pgXIOlUkM4StYRirDxp1hiXSY7vV/4YjQPqUvbMga8qsc?=
 =?us-ascii?Q?cPjiY2Hv6zLxxHGBXEE+Oy5WvCZ5O4AG0F4fVowVJBwwxnJjCZE4JivIPQ1l?=
 =?us-ascii?Q?/9ATdiEx/hhMBMNKlE4ItrujoVODjSpxsAYurxLkxMuWLuVRIs0KfKgoH4lK?=
 =?us-ascii?Q?R/DELUj9fb7f80x9HXXPbNXZxSjXnpaZ7lWbvPAqBvQmESiJ/wN3280Z2TLX?=
 =?us-ascii?Q?tRguZ1b8SgdKeGWvz/DuyYK2CvU9oBLM0WI75J7yyQ3jwfLYuoDM4Pz9Woe7?=
 =?us-ascii?Q?vsERnEpy+7XFdRHSLrCJpQCFSsOK69cFYEpEHpSMSHlBb5UhwpNeyeMU++dC?=
 =?us-ascii?Q?tWviOZTXByScgT6W2hSQhnKjH+ifMsiT5VheCTcmZuTglzhM5pvy7lx533g4?=
 =?us-ascii?Q?b6kaDjRmaJCIxB4mNLNJ90LrCLwMnu6EfpmibOq/ZbnpJ63ND9FxWQWZP34n?=
 =?us-ascii?Q?h3ikBPnzrdZknUSv+OioefXLPbc64DT//bwoh+v4IUiyjaxwIifAdtP+TAi4?=
 =?us-ascii?Q?d7Qw2NBmrGcj+6MeVEs8Zg9Dh2VmZEwxWBiwd+7cuHtOhE3pDwJOeWw6uAoz?=
 =?us-ascii?Q?bCLCInwQADS3nNcbEAFZdBOKGS98yqVY1X3DdYwE8LiB3/3m7X6OdRZFZa4I?=
 =?us-ascii?Q?uVrcPBenqg5SW5fxHM1tlwilq/ZbuN25pY39gRvnt553vjP1et6UljS4JKva?=
 =?us-ascii?Q?Wl7e2KfCNTztxztIqnvk30vaTqkHPsSMnuSkeZ6Kef0q+pHsyn70hOUbpg0t?=
 =?us-ascii?Q?riUooa9fHqpVjZHgaNaZQS63LdhFJOnkb/MGkPdIo0fUUhssVbkh7UjxiGO3?=
 =?us-ascii?Q?owkXfC+3iMw5HlGo7Ppg6XYqFWA6roY0bxeaY2YAbI3Ix5AEjGKlsfPURy3G?=
 =?us-ascii?Q?sWpXe71dNA=3D=3D?=
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
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d3df6ca0-0b23-4848-c110-08df387bba13
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 00:53:36.3825
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zkj+9GcR2RNhXmr6qlKe4csn9xcPFD3HQ6TAWn9dPQuxX2un8OnHNkE8EV9ERATXM8fjPWP93H+ytArcZwtdH8/r9z1l7fkZbxVW8IjAesI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUVP216MB231379

Hi Nicolas,

Gentle ping on this series. Brandon has tested it and didn't run
into any issues, and there have been no review comments so far.

Is there anything you'd like me to change, or anything else needed
to move it forward?

Thanks,
Jackson

> -----Original Message-----
> From: jackson.lee <jackson.lee@chipsnmedia.com>
> Sent: Wednesday, October 7, 2026 11:00 AM
> To: mchehab@kernel.org; hverkuil-cisco@xs4all.nl;
> nicolas.dufresne@collabora.com; bob.beckett@collabora.com
> Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; jackson.le=
e
> <jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>; b=
-
> brnich@ti.com; hverkuil@xs4all.nl; Nas Chung <nas.chung@chipsnmedia.com>
> Subject: [PATCH v1 0/9] fix decoder corruption, stalls and seek issues
>=20
> From: Jackson Lee <jackson.lee@chipsnmedia.com>
>=20
> This series fixes a set of decoder problems in the wave5 driver that show
> up as corrupted output, stalled or crashed instances, and lost frames
> across seeks. All of them carry a Fixes: tag.
>=20
> Locking and job ownership
>   1. Serialise removal of OUTPUT buffers between finish_decode(),
>      streamoff_output() and the start_decode() error path.
>   4. Acknowledge the interrupt only after it has been dispatched, so a
>      completion the VPU adds meanwhile is no longer dropped and does not
>      leave an instance waiting forever.
>   5. Finish each m2m job exactly once. A second v4l2_m2m_job_finish() fro=
m
>      the same context could clear curr_ctx under v4l2_m2m_try_run() and
>      oops in the m2m worker.
>=20
> Decode scheduling
>   6. Issue DEC_PIC only when the ring buffer holds bitstream that no
> queued
>      command will consume. The current check compares two unrelated
>      counters, which sends commands against an empty ring or duplicates
>      one already in flight and corrupts the output. A delayed work restar=
ts
>      an instance left idle with data still buffered.
>=20
> Seek / flush
>   2. Drop the consumed-byte tally on OUTPUT streamoff, so it is not
>      credited to the first buffers queued after a seek.
>   3. Wait between FLUSH retries instead of spending the retry budget in
>      microseconds, and ignore dec_info when reading it failed.
>   8. Re-establish the display flags from the vb2 buffer states after a
>      flush, so buffers held by userspace are not decoded into.
>   9. Do not reset the frame buffers on a CAPTURE streamoff that is only
>      part of a seek.
>=20
> Timestamps
>   7. Hand OUTPUT timestamps to decoded pictures in decode order. One
>      completion can consume several source buffers, and keeping only the
>      last timestamp lost the others ("Too old frames, bug in decoder" in
>      GStreamer).
>=20
> Testing
> -------
> Tested on a TI J721S2 EVM (Wave521C, product code 0x521c, firmware
> revision 363254) with GStreamer 1.24.13 and the v4l2h264dec/v4l2h265dec
> elements.
>=20
> fluster (GStreamer-H.264-V4L2-Gst1.0 / GStreamer-H.265-V4L2-Gst1.0):
>=20
>   JVT-AVC_V1      77/135  (-j1 and -j3, identical per vector)
>   JCT-VC-HEVC_V1 133/147  (-j1 and -j3, identical per vector)
>=20
> The remaining AVC failures are interlaced, MBAFF/PAFF, FMO and SP slice
> streams. 11 of the 14 HEVC failures are Main10 streams, which this SoC
> does not decode ("no support for 10 bit depth"); the others are
> PICSIZE_A_Bossen_1, PICSIZE_B_Bossen_1 and DELTAQP_A_BRCM_4.
>=20
> No oops, call trace, workqueue warning or "invalid display frame index"
> message was logged during the runs.
>=20
> v4l2-compliance 1.28.1-5233, SHA: fc15e229d9d3:
>=20
>   Total for wave5-dec device /dev/video0: 47, Succeeded: 47, Failed: 0,
> Warnings: 2
>   Total for wave5-enc device /dev/video1: 47, Succeeded: 47, Failed: 0,
> Warnings: 0
>=20
> Brandon Brnich (2):
>   media: chips-media: wave5: Ensure Atomic Access to src_buf list
>   media: chips-media: wave5: Stop FrameBuf Reset During Seek
>=20
> Jackson Lee (7):
>   media: chips-media: wave5: drop the consumed-byte tally on OUTPUT
>     streamoff
>   media: chips-media: wave5: wait before retrying a refused flush
>   media: chips-media: wave5: ack the interrupt after dispatching it
>   media: chips-media: wave5: finish a job only once
>   media: chips-media: wave5: decode only when the ring holds unclaimed
>     bitstream
>   media: chips-media: wave5: stamp decoded pictures from a decode-order
>     queue
>   media: chips-media: wave5: restore the display flags after a flush
>=20
>  .../chips-media/wave5/wave5-vpu-dec.c         | 312 +++++++++++++++---
>  .../platform/chips-media/wave5/wave5-vpu.c    |  28 +-
>  .../platform/chips-media/wave5/wave5-vpuapi.c |  18 +-
>   .../platform/chips-media/wave5/wave5-vpuapi.h |  13 +
>  4 files changed, 310 insertions(+), 61 deletions(-)
>=20
>=20
> base-commit: 58348f64125e9a3e44d3abb275ca7f4e6c9641e5
> --
> 2.43.0

