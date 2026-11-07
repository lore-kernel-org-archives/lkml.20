Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.144.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794022119;
	b=vPfzDZNXc75tCcpJUMYe1Ncy21GGQnzZGhkrsDOkAUZM7DKS5oGzwqAxdr3yJZnGFd52
	 s7X9RumP2Jp9Fv+yi41dzRvqOovwtIaQGZbDovGyEod4D2hHnwInDfhz/XnsLq3SSZJtz
	 3GfKigc1faZvgonWD4c8ZXQNn+Hmmd6KWD9eTl+gekP/thBlkA1pGHF8zz2Nn8aq9ygor
	 2PPP7rxaAm4HyO02LY9pO+6lgJYdEWeIaDcCuacSQ8rVS5Vu5BhyjtM8DIgO88VAxM/x4
	 0WcHU05PIv67EtlBMRFUHEpS2sYg82Guo1oYOUmRDw28pfaBWfQrgJWms3l74zoHTbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794022119;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:msip_labels:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DR0Z92cfdBrkaLWqAluhNyhfX1RRtlezTZx8DdT+mEM=;
	b=ofX1U+KPQQlxCpLhTtV13m3pCEbYsPf9s7jWQVFnEddmqKf16HveXfOI6tX4I55Tcxjq
	 xMBr41jH+wKajmWOAJIWrQABKUjPDZnA4YS4n/GgRAlETOnon6uRxt3k0IoUqEKvvXzh8
	 JVgV2xvyfu46jGFRMOQCco0NmGYgvIdhsouOHnJ9FysnLgogTjM35QTZt0xz0kbpdVVaN
	 KozMIc9iRdOF3GGNR+vyXhIYIMWZ/wU3mTioLki6Az1bt5XBxwDmugLq0UK/BivhBHfi7
	 XB+jJM1JMwZdoSRPF/xa1Yl3trOwwXGP/2PHDANFLSuoFKA34+WwoorX9MKHNawkgNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wsu.edu;
	spf=pass smtp.mailfrom=wsu.edu;
	dkim=pass header.d=wsu.edu header.i=@wsu.edu header.a=rsa-sha256 header.s=pp1 header.b=CK7Ml10G;
	dkim=pass header.d=wsu.edu header.i=@wsu.edu header.a=rsa-sha256 header.s=selector2 header.b=x7DeJegq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.144.34
Received: from mx0a-0007b301.pphosted.com (mx0a-0007b301.pphosted.com [67.231.144.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B71F606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 03:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B71F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wsu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wsu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wsu.edu header.i=@wsu.edu header.a=rsa-sha256 header.s=pp1 header.b=CK7Ml10G;
	dkim=pass (2048-bit key, unprotected) header.d=wsu.edu header.i=@wsu.edu header.a=rsa-sha256 header.s=selector2 header.b=x7DeJegq
Received: from pps.filterd (m0000264.ppops.net [127.0.0.1])
	by mx0a-.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A72D7BO523027;
	Fri, 6 Nov 2026 19:28:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wsu.edu; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=DR0Z92cfdBrkaLWqAluhNyhfX1RR
	tlezTZx8DdT+mEM=; b=CK7Ml10GmTw6scyshG3sVz5Hzp15S+grz/z4nzhlz0ev
	0Zj5HJNBNuB+fMCCKgKTPpTabixicFlwh3sg3Tx1ec+PHLjbqunHAUCgWVrC+J5C
	wXZoljNosczKmK3sh8d5vWReRtxyyBse9DJd0NJaCwfgYueU7T6alyx97lqsQpBd
	i78ksq578bEewwleU9d3+7eAwoLfR1ae7/3Oo64+5/grkEWCkyKp6uVKevPGuE5u
	u1JnKmRa/AkDyrrcw6+6hloVrLy8jGuHmTXlT3u7E3wfh2K98CsLaKb6Cs8OEEQN
	J2myKxnsK2ffLceWvggIDveFicYLx6IR3nx8eFBwEA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020090.outbound.protection.outlook.com [52.101.46.90])
	by mx0a-.pphosted.com (PPS) with ESMTPS id 4hsm19922b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 19:28:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOZ6yXSupcd5YNDPDpXGF0j0SSOBCHn4xzVNww9VYJnO8pB5yc1xXycDwnogAwOiYm9SFY0ex43p6Ph7XgjC06NsJUStwNISZ7i6WNe46jHgxtCqkjfrTOrANOdFrGID8Afg8ERqTazgzdMEMDvqx6P5s40RSRpgh/6YBWnGeSM3CJ3dnUd/w8SUn1ZCk4dAJMVbB7luxFws4+H+MbratAGjqWtaGmSsSyXS8anefJuWlpPd7ujeSoYi953VGsjcVwUj3swzr9c+lPxUoYMRcSfJu7Qy5RW09sfhndEEJBy+TGqcoTuSarkkET+fUdUrNcfNhxeknNNmUVC/jvazEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DR0Z92cfdBrkaLWqAluhNyhfX1RRtlezTZx8DdT+mEM=;
 b=WrdWDXxKpkP1bk5VyG4sRGRf4LtAmIh3BgEOI15lWOwQqba3YLbex7kukAOZ1CJltDK/BJmaYxA4/L6G+0DYCTWkyoMvSmqnmjN8i1MOlyXCKYyMXErtWlFzbrTsL/IFWdZjQSWQPvDDS1wYi5eOXfCJltXkLRbnrZwMeNWd/eTii+BuKTiakse1/yXbjMDLPkp1C2XWHDVyo6TZulpvs0LHjddg3qJp8Veb0ylSYNwrHdsnUxKSjzAIBIvfAiUZ7MDuWmP+G3k7XQ27xgtJjpCl6G4iwzhWLcINzRMxpBG6VNStebzYtIdIDrxUQchHIdpGbVqnvn2dTOemghHwAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wsu.edu; dmarc=pass action=none header.from=wsu.edu; dkim=pass
 header.d=wsu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wsu.edu; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DR0Z92cfdBrkaLWqAluhNyhfX1RRtlezTZx8DdT+mEM=;
 b=x7DeJegqVCITa1JkLOc8TbgUDYsentizFfgoYJ798vBa67cY1h6q3BFqPOSxxHPDe3Xpa+xrHyOQKzzp2djSmcHoVXsdtScdIVTbqmHfPCAmYdcnudtyCejyQMWCcK1zPxFlfgYpzCPExmvYZkkLhbxVbHyDFQIZbvFVXGbgkT+X9JNl8GtLSPc9+kdYh+JZSJc3M0mfdgMG86i4u5/9Sqn+ItHlmQCapWZBGVM6pWw45hAyw0LGuEkfN4ypT3KeiqU+XnEqd8p/vEvda4EdMvfGSqwEj1vBbxQ2VlXbj8zrfaxBHhX5c3y6ihvWbi5lzsQavaxv7Dx0wb8UZ9GkiA==
Received: from DS4PR01MB994453.prod.exchangelabs.com (2603:10b6:8:35c::18) by
 BY1PR01MB9042.prod.exchangelabs.com (2603:10b6:a03:5b5::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4; Sat, 7 Nov 2026 03:28:23 +0000
Received: from DS4PR01MB994453.prod.exchangelabs.com
 ([fe80::e4b8:f0ff:396a:103]) by DS4PR01MB994453.prod.exchangelabs.com
 ([fe80::e4b8:f0ff:396a:103%3]) with mapi id 15.21.0615.004; Sat, 7 Nov 2026
 03:28:23 +0000
From: "Puranam, Ananta Srikar" <srikar.puranam@wsu.edu>
To: "pjw@kernel.org" <pjw@kernel.org>,
        "palmer@dabbelt.com"
	<palmer@dabbelt.com>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
CC: "alex@ghiti.fr" <alex@ghiti.fr>,
        "thecharlesjenkins@gmail.com"
	<thecharlesjenkins@gmail.com>,
        "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "Priya, Swarn" <swarn.priya@wsu.edu>,
        "Ammanaghatta Shivakumar, Basavesh" <basavesh.shivakumar@wsu.edu>
Subject: [BUG] riscv: module: single accumulated relocation indexes  outside
 one-bucket hash table
Thread-Topic: [BUG] riscv: module: single accumulated relocation indexes
  outside one-bucket hash table
Thread-Index: AQHdbmc9G6pFaY4OsUWoWf98GwgAXw==
Date: Sat, 7 Nov 2026 03:28:23 +0000
Message-ID:
 <DS4PR01MB9944538C201D6EA4D2FE4C1418EA752@DS4PR01MB994453.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wsu.edu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PR01MB994453:EE_|BY1PR01MB9042:EE_
x-ms-office365-filtering-correlation-id: 36a05de5-fcb2-430d-2d33-08df3c7f2d95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|786006|366016|1800799024|6133799003|18002099003|3023799007|38070700021|10067099003|261026140227099003|56012099006|11063799006|5023799004|261022105027099003|261102123227099003|261028144727099003|261009221227099003|261021135927099003|261021121427099003|261021123027099003|261022075727099003|261009223027099003|261026121527099003;
x-microsoft-antispam-message-info:
 py2GvmqUwpBuPdgafXC2G0lz/HrjyDkacZUJ6uvslBH6bp7ClFA9uh6D8G8vjgjD7wuQLQFZpG62uIuSefw/Cbm6CzIu6VG2JhQih9RuJOlCkMm0ilsDQLIWIhQdlMSRBDkuD4JqgEJkuWrzsluyopBs9If8aokYlxAB5KDoB4Fex6VbmUj4N0dma7FDOwNFy+l+gULzo0S6nA2qOG2tsM+v/y9VeryIXg8IxY0bR7sV3QIJKJ+t0/CgPb6UJuuZBbVFJxn7F/jp4Y201AN3RwCcUI8E6mD0flxEJibUblzZ+u9+2Dxv3CjX/tfjfxiH0RzUFWBISgdrOrN457eLhpAgkk0PnBdHD6kh1sA+ww3L8de4pwWlXvNwZ4Aq0cK2dFt/heoqksbnFm7jRYGoNPRpfJn+D8IoTPSTy2aGrccbcrE5eXP0VoVSVM3rnlkUZYbFQioT4SLHsQtc3+WtTi00cguchfq93UEHR3Qf2Zu2AEuk5Foc40WkqnNw6kbTE/7Yv9G48F6dbk6tsIQk4pB/NiLqg55radDZwMlv+C2CkmeXneU/iEgOBg5rzxOQs6TUM0D6qaiOgyWOZ2cpNkcYHKB0a4ZTzlQcTohOXjkn9CO95PwcLaBe+3idB5qmK/V5Kb3Aha7u8XBMk+UwTtzIJue5dK9073YKspxGDHbOpwJ0WvHlCvZ7MPbXebFFKAkOJzZWwkuhzjmzg6hkgf+CAkx4IYyMgGbaR/XkHmk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PR01MB994453.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(786006)(366016)(1800799024)(6133799003)(18002099003)(3023799007)(38070700021)(10067099003)(261026140227099003)(56012099006)(11063799006)(5023799004)(261022105027099003)(261102123227099003)(261028144727099003)(261009221227099003)(261021135927099003)(261021121427099003)(261021123027099003)(261022075727099003)(261009223027099003)(261026121527099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?msnHv2ReoOxltRMBRzglqH2JPhOemoyewXDJ35HoNX8v8+yaYB9u8KgM6M?=
 =?iso-8859-1?Q?xZF/Kn91OryV6D4GV7tXqNy+vdW5hmw2SeOEnD6YyFRp/xE/Ztb5tjbTzQ?=
 =?iso-8859-1?Q?PAqR6XaIC6oslaCVXj8LgQn87Z/474bGHN6Y6ipl1Q2EhJxVpdqpFZVkXi?=
 =?iso-8859-1?Q?TpwfAQ/TEwo7znfNn1Ns4C32P1OXf0rCsR9BhDPVhE4rqMFn5NyBVSQMav?=
 =?iso-8859-1?Q?7o31H/QWhJLxyodIKaehRpd5PWu+y6zmU14WrlaNtZYWtDZDJrvGgvQRB4?=
 =?iso-8859-1?Q?Hycf4uhmV+Rw+OV+9likIJYLhDVWAZaj+JUaePySHAQTetVFE7q38jqR/5?=
 =?iso-8859-1?Q?KI2cKEST+SwlbOjVy9T/nxsh7vRVHM6BzfhukBpbpHEnEr9fm8y+UTd6z2?=
 =?iso-8859-1?Q?2yztohiSFQrzUftzIbR0vspP7tHVlO5F9WppXhn88Z5jrQeOz1B29RGcOc?=
 =?iso-8859-1?Q?Xe/i8xiuJwd8bISfP+VEQMwWcMWCPDk+f7ykTd1zJvJJwbdf3vXMpVEZvg?=
 =?iso-8859-1?Q?zhqxV1QRGhks3d3VkYbAFaSqhYFCRl7Bfb87mKGfYrkJv8aJ9BbvOTVABN?=
 =?iso-8859-1?Q?GY1UGN1REenWyED4j2xtcHTYlA/CliWLayxXnsOoOlEBwBQI5n1PFPNAW/?=
 =?iso-8859-1?Q?IbUghumrUM6Ag4uKZiqhX4iCD8hNIA12mznLw3feGs6h7sRdSQj5UQiDrY?=
 =?iso-8859-1?Q?dMP7ewdMLhEeozPFp4iKOBsPDJp7fX/ZN6tmAKH454pn9r/2JcYnWC/KCR?=
 =?iso-8859-1?Q?/0c9kLu6aoxhqhRa+k844dciU7C5xzeKuCJdg+CIpg5vGMQeF+RxyAFWiB?=
 =?iso-8859-1?Q?TTxHcZo3QYBhi8vyOcctMHOyAQYdeGwtdw0WvScP3EWI7ZslMM3r0WbC7n?=
 =?iso-8859-1?Q?w9EzWvH/n0y8KDQqjeDlvDCSQAl89+YzrkDl1+4VFD2echsvTZmS1imBIt?=
 =?iso-8859-1?Q?88rhXZH2V2vx27TGTZsNj/YxbxBhPN+YSX1/2oWsunFtc+fh5kA2CL9tHi?=
 =?iso-8859-1?Q?1q+r8DX9xLjZp42pn8FOe2QxFwL5+IDnz612r/TmKpRpMWvoq59WepFHVh?=
 =?iso-8859-1?Q?sKH9Q+lF9wEVF6C4eR1lD0pSjCUp4UTcylKwFwcHz474lbxc2WbNOZZETx?=
 =?iso-8859-1?Q?ogPMLNC64CJvUhSw/NJUDtLiSct9j580tq4bt2vDa8K5ad7YR4L9ED29pU?=
 =?iso-8859-1?Q?eAVeWK+CcgKh4lM4RT/UyireIYpbbOLo9fpTxIQXYZLDGrqIZbr6KHIG/Y?=
 =?iso-8859-1?Q?jzot+TYgyDGZ6txykZK5KjV7k8/hUwYBiLcfEVe8MWb2BBr6bEyrsCAWo3?=
 =?iso-8859-1?Q?2IYoSGKwwj85xdzkQtIFe1kvJN5MkvOMcIt83ElIlFfrvXumo9dE4/kDkv?=
 =?iso-8859-1?Q?NU9YM0c7HcmhD7eQ/g71xjpebACODLe9Bkoj8issY5udp9zOaEErg+XT/q?=
 =?iso-8859-1?Q?lUw+NNJ57xxeYw8WJaMSV9fpE/qo8LUGskInP0mpDyquLIoPQLe3ERpuEr?=
 =?iso-8859-1?Q?J19GIxtOaSuKh0tsRA3VT05dSdGdWBcrMpMC0ZFeWXbjIRzY9QLumPo+iK?=
 =?iso-8859-1?Q?YH8etOGdLVXSfWP5nep0sGWnwH1Dl4qAjFCbpMtIVu7QbGkC7LW3RjtmI8?=
 =?iso-8859-1?Q?K29phWleIvOPHgbU56prmthX3kxQ8gOGoEMYw4sm9iYBsUgbvSAr7WGyyZ?=
 =?iso-8859-1?Q?ak4qL++EtWOSIDqtn2NKcJROLw9kabRZx/XWInfrrZCVJvcVzQKWk0NAA2?=
 =?iso-8859-1?Q?JhUjhczPCsAPlx/7j0y7qclKoF41x8po3HHMmdwqLvbTxYvtfUit3PctRu?=
 =?iso-8859-1?Q?QXwqNwCvpQ=3D=3D?=
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
X-Exchange-RoutingPolicyChecked:
	J5YIRxjFVJDNCIqn7f+/Had58JYNugLi0fAcjQVVGL82Tnt+iBk/dpMvF6QjTIPYX+OBBDjNZ2oghGTGilXy+wOAvs9K2/+KqG/mylhvjtl2uVResEioPnWOMEpcCKEnsMMQKtQaspWDuz1QfvjX/3HwSGzO4mhuyO45JwycvCSb9OANIpUqfGQHWlkKhc+Q8GWRWUOo9ZaLixEctCLcn38L4HDYtKASpYBOfPtiKRhCeFKw4ZxmTh9MAsbobkqs9i0lUUT7JuqKUaTvAZRqGpJWQ56m5TctQ2graPcvV72xn8n9lTqCwq5IjlQTpVJzh9dUtvsd5oudvn/YWMGsxw==
X-OriginatorOrg: wsu.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PR01MB994453.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a05de5-fcb2-430d-2d33-08df3c7f2d95
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2026 03:28:23.2938
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b52be471-f7f1-47b4-a879-0c799bb53db5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 25HHjftz+YPUyU2VFCVaVK/PocFS9gKzXsLHcIp6+0hxWiPLuw7sIqYwAmiZEM8F0aOkfRp4Ippdr7c2ZI7V+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR01MB9042
X-Proofpoint-ORIG-GUID: jCiVJV9jTsSWjXqirH0C4fAh4TXQKtQ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAxMyBTYWx0ZWRfX+YPVIJp4y7U8
 AVeZKFO2vEf8/8Rq1MhEelySSUzudS4mSS1erKbgBfHQ80mDdgM23YUFtOWv8yMeYOu/G2XAvLZ
 1A1LtzUgYdhsoeFiRvbeKoCRhtwJTscVjj5wres8wmKF14ge/jQ5Z+5dzAZFhLM/jqB0we4iLXa
 CYEVVzaqFGtAH5Vu21qAXvvLgCLgdRzNjozHJKoZgFmDz2STWsQwOqr5CyiJvUqCXYpIbAmK/I6
 7MWWB6T1uCh2SilWd9VsE437OmWhEnKqPHDOyt2JFR5r/dwH2TeM00EDP/n11LPgtvqGJ+NprBV
 ZH2VVCxrxrmUe8X4PfMs2KRTBqvlc+RYEp1e/6jFJ/b1L6Q9gH4iBrO/vuGl9Tsi2khAoy7vi1I
 GYEMpAJQmL/ZlFODiWcfyj03kQkAAkJh7NUfQxGosTWBIy8FwfuYgv7Pzm8FQ9HENEKDP57cl9Z
 8lVLZHbTVwv0J3PNXRw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAxMyBTYWx0ZWRfX0Al7Kvq6piUj
 4ngvULu8OhYL42EwfQerOldBoNW+236PgnkRDIwj+A9d1DKGInZihTUyDTLY++NXe4MBZ9xZVlu
 /VsVPbgRb4yo+DQmf62lGM+caVJZVhaIuDFoTFCPmzGUE6i+6GlB
X-Authority-Analysis: v=2.4 cv=a4ilZkSF c=1 sm=1 tr=0 ts=6aee9ad9 cx=c_pps
 a=mKvPdnfujGBEPWwSy16I3A==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=WNJZbBgGTWIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QNy-vP4XruPnrUY3G42T:22 a=iAZ2WUf6Rar6TDnrPU9j:22
 a=DSV5JiwxtB8mBEpK71MA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: jCiVJV9jTsSWjXqirH0C4fAh4TXQKtQ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611070013

Hi,=0A=
=0A=
I'm Ananta Srikar Puranam, a PhD student at Washington State University.=0A=
I'm reporting this bug on behalf of my team: Dr. Swarn Priya and=0A=
Dr. Basavesh Ammanaghatta Shivakumar (both Cc'd).=0A=
=0A=
Loading a RISC-V module whose relocation section contains exactly one=0A=
accumulated relocation (for example a single R_RISCV_ADD8) makes=0A=
apply_relocate_add() in arch/riscv/kernel/module.c access memory far=0A=
outside its relocation hash table.  The module load oopses; with=0A=
panic_on_oops=3D1 the kernel panics.=0A=
=0A=
This is a separate issue from the negative ULEB128 accumulation report I=0A=
sent earlier; the code and the fix are independent.=0A=
=0A=
Trigger=0A=
=3D=3D=3D=3D=3D=3D=3D=0A=
=0A=
A minimal external module with one byte of data carrying a single=0A=
relocation:=0A=
=0A=
  R_RISCV_ADD8  value 1=0A=
=0A=
A matched control with the same relocation twice at the same location=0A=
(two accumulated relocations, result 2) loads normally on the same=0A=
kernel and prints target=3D2.=0A=
=0A=
Observed (current mainline, generic KASAN)=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
=0A=
With Ubuntu's default panic_on_oops=3D0:=0A=
=0A=
  Unable to handle kernel paging request at virtual address fffffffa2691673=
c=0A=
  [fffffffa2691673c] pgd=3D0000000000000000, p4d=3D0000000000000000, ...=0A=
  Oops [#1]=0A=
  epc : apply_relocate_add+0x550/0xbfe=0A=
   ra : apply_relocate_add+0x496/0xbfe=0A=
  Call Trace:=0A=
   apply_relocate_add+0x550/0xbfe=0A=
   apply_relocations+0x1be/0x2ca=0A=
   load_module+0x2db8/0x36c0=0A=
  ---[ end trace 0000000000000000 ]---=0A=
=0A=
insmod is killed with SIGSEGV and the system stays up.=0A=
=0A=
With panic_on_oops=3D1, the same fault (at fffffffa269941ac in that run)=0A=
ends in:=0A=
=0A=
  Kernel panic - not syncing: Fatal exception=0A=
=0A=
The faulting address differs between runs because the bucket index is=0A=
derived from the relocation's location address; the fault itself=0A=
happened on every load.  KASAN does not report it: the computed bucket=0A=
address is unmapped (pgd=3D0), so the access faults directly.=0A=
=0A=
Tested=0A=
=3D=3D=3D=3D=3D=3D=0A=
=0A=
  - Mainline a91337fb5e8e ("Merge tag 'configfs-7.4-rc2' ..."),=0A=
    7.4.0-rc1-00590-ga91337fb5e8e, generic KASAN:=0A=
      reproduced in 2/2 boots (one with panic_on_oops=3D0, one with=0A=
      panic_on_oops=3D1); two-relocation control clean in 2/2=0A=
  - Earlier validation: v6.12.57 2/2, v7.3.1 2/2, mainline=0A=
    f66469d9905b (v7.4-rc1) 1/1; two-relocation control clean on=0A=
    v6.12.57 and v7.3.1.  On v7.3.1, singleton cases covering all 15=0A=
    supported accumulated relocation types faulted in 34/34 runs, and=0A=
    matched two-term controls loaded cleanly in 30/30.=0A=
=0A=
Cause=0A=
=3D=3D=3D=3D=3D=0A=
=0A=
initialize_relocation_hashtable() sizes the table as=0A=
roundup_pow_of_two(num_relocations).  For one accumulated relocation=0A=
that is one bucket, and hashtable_bits =3D ilog2(1) =3D 0.  The comment=0A=
there says:=0A=
=0A=
        /*=0A=
         * When hashtable_size =3D=3D 1, hashtable_bits =3D=3D 0.=0A=
         * This is valid because the hashing algorithm returns 0 in this ca=
se.=0A=
         */=0A=
=0A=
add_relocation_to_accumulate() then calls:=0A=
=0A=
        hash =3D hash_min((uintptr_t)location, hashtable_bits);=0A=
=0A=
On 64-bit, hash_min() reaches hash_64_generic():=0A=
=0A=
        return val * GOLDEN_RATIO_64 >> (64 - bits);=0A=
=0A=
With bits =3D=3D 0 this is a shift by 64, which is undefined in C.  On RV64=
=0A=
the shift instruction uses only the low six bits of the count, so the=0A=
shift is by 0 and the full product is returned.  The resulting bucket=0A=
index is far outside the one-entry allocation, and=0A=
&relocation_hashtable[hash] is dereferenced.=0A=
=0A=
The hash table code was introduced by:=0A=
=0A=
  8fd6c5142395 ("riscv: Add remaining module relocations")=0A=
=0A=
which is in v6.7-rc1 and later.=0A=
=0A=
Impact=0A=
=3D=3D=3D=3D=3D=3D=0A=
=0A=
Triggering requires CONFIG_MODULES=3Dy, RV64, and permission to load an=0A=
unsigned module (CAP_SYS_MODULE) in the tested configuration.  Per=0A=
Documentation/process/threat-model.rst I am treating this as a regular=0A=
bug, not a vulnerability.  I have not established unprivileged=0A=
reachability or code execution.  The demonstrated impact is a reliable=0A=
oops on a privileged module load, and a panic when panic_on_oops is=0A=
set.=0A=
=0A=
Setup=0A=
=3D=3D=3D=3D=3D=0A=
=0A=
  Host:       Ubuntu 26.04.1 LTS, x86_64=0A=
  Toolchain:  Ubuntu clang 21.1.8 / LLD 21.1.8=0A=
              (make ARCH=3Driscv LLVM=3D-21, built with O=3D)=0A=
  Config:     arch/riscv/configs/defconfig plus=0A=
                CONFIG_KASAN=3Dy=0A=
                CONFIG_KASAN_GENERIC=3Dy=0A=
                CONFIG_KASAN_VMALLOC=3Dy=0A=
              (resolved with olddefconfig; full .config available)=0A=
  Module:     out-of-tree, built with M=3D against the same build tree=0A=
  QEMU:       10.2.1, -machine virt -cpu rva23s64 -smp 16 -m 8G,=0A=
              OpenSBI v1.8, no KVM (TCG)=0A=
  Guest:      Ubuntu 26.04 riscv64 rootfs (debootstrap) on virtio-blk;=0A=
              module loaded with insmod over SSH, kernel log captured=0A=
              from the serial console on the host=0A=
=0A=
A tested source reproducer is available privately on request.  Per=0A=
Documentation/process/security-bugs.rst I have not posted it to the=0A=
list.=0A=
=0A=
Fix=0A=
=3D=3D=3D=0A=
=0A=
A proposed patch uses bucket zero directly when hashtable_bits is zero=0A=
instead of calling hash_min().  On f66469d9905b with the patch applied,=0A=
the reproducer loaded successfully and printed target=3D1, with no fault=0A=
or KASAN report.  I will send it as a separate patch.=0A=
=0A=
Tool transparency=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
=0A=
The root-cause analysis, reproducer and proposed fix were prepared with=0A=
the help of an AI coding assistant (OpenAI Codex).  The QEMU=0A=
reproduction environment described above was set up with Anthropic's=0A=
Claude Code.  I re-ran the reproduction myself and have checked the=0A=
statements in this report.=0A=
=0A=
Thanks,=0A=
Srikar=0A=
