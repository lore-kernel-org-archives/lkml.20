Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=107.22.191.150
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793988088;
	b=42PMrJR1mCS5g0QkyLvm3HYkEUo6KA27uSOSWaK7X6NiQ9xqJedW+X582Y6MqYMDk8oy
	 6EaDFBpZipxbf0eDRHW4S0m3+JHWhdDMnkVwq7JYtIyMRRqvn5Odtn5jutmYHAONVIfOW
	 f48ucKonZo4IYf5Z2UEh3y7rGGaqity1Dh8+wuLsEkLPNYfdKOtS5UVPoa3vu/xnmToSV
	 gUlMjH2pleCD+6GzOpBd9Bm7tYaJ+oXnWQpDAe0N6l1tIs477f0nauvaQFZBRDLMk5pDj
	 diXBFY4P5agF79TAMy5DR7oxL7K9Br5pHYop8BUJBE/Yo/ThUEhG7+l+HYnyMueOxPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988088;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Subject:Thread-Topic:Received:Received:
	 X-Farcaster-Flow-ID:Received:Received:Received:Received:Received:From:
	 To:CC:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=1yG0UXLpO+ySjtv0MKOmkCnCrULLH6pEI+DkiczZNf8=;
	b=IedLjTz4Wk9lqzFvN5IHj+zu9q/dPy4yN7l1aigqj4BH1ctD845rKYm3B5wEYbkJ9Yzv
	 rSWEn+GPhbPIqAfpCW6He5fL2/WwAOkVJVgEkm3eviKxp00L7cC/G646TMdYoAOctEmhr
	 kqZ003uSVstimiUmn9xv/n/dgEeEYWRzcY/5Pux30ijWJSAKQANCf3n8Ih0O7dPDTAnve
	 jGABa1i6YmIHp6lQa18dTI2rGWpYA+ip0SXGiFDYVGFcz1+i8TXbACo6c8EJUqzjMyTdd
	 ugqpz9m02ngh964qRprmIZWqHncFCFB6q6+HL7UB7HbGq6aAO0EAVujzEQOIZLYKqAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=tgtprq7G;
	arc=fail smtp.remote-ip=107.22.191.150
Received: from iad-out-001.esa.us-east-1.outbound.mail-perimeter.amazon.com (iad-out-001.esa.us-east-1.outbound.mail-perimeter.amazon.com [107.22.191.150])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB76606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AB76606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=tgtprq7G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793988088; x=1825524088;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=1yG0UXLpO+ySjtv0MKOmkCnCrULLH6pEI+DkiczZNf8=;
  b=tgtprq7GRW5SqXOh72e8SR//u/g/RdXbFdmsZXUak+rzFKx6/OScoR5b
   YfhPlyKpf88Unu0RS2KJ5AQZCOf0o4Mt0E8EQtha2JqxpvpnQ47a89HFt
   X/Hq0qBmQUQxVXariN2kvabNpiXUtUx1kQZQgA22uGV5AbOi5zxCTYJaY
   BShbwMU7N/nUQMyeWEnpZDGZsrlrS6jP7o4TbdQCjfY34ipUwEA4G46CQ
   X5fmUbJ7zEByGJ+ZMVrd/1fdjm/aPTcJ+WlGRAvuJ/man0Vx1Q4DdraJw
   7YODsY5TuOLM3Q9Je/3PffUgnamPXsvzasVgnN7MJm7DmtNLp9MYZfFL9
   w==;
X-CSE-ConnectionGUID: zZwi2+z+QUiIFxPNTKpZMQ==
X-CSE-MsgGUID: Dfpw/4NgQkysbnpDXopRWg==
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="30895777"
Subject: Re: [PATCH] nvme: avoid wrapping admin_timeout and io_timeout
Thread-Topic: [PATCH] nvme: avoid wrapping admin_timeout and io_timeout
Received: from ip-10-4-17-41.ec2.internal (HELO smtpout.naws.us-east-1.prod.farcaster.email.amazon.dev) ([10.4.17.41])
  by internal-iad-out-001.esa.us-east-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 18:01:27 +0000
Received: from EX19MTAUEC001.ant.amazon.com [72.21.196.66:16561]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.8.178:2525] with esmtp (Farcaster)
 id 8a666ad4-17be-41e7-9d15-6f4d317d3528; Fri, 6 Nov 2026 18:01:26 +0000 (UTC)
X-Farcaster-Flow-ID: 8a666ad4-17be-41e7-9d15-6f4d317d3528
Received: from EX19EXOUEA002.ant.amazon.com (10.252.134.207) by
 EX19MTAUEC001.ant.amazon.com (10.252.135.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Fri, 6 Nov 2026 18:01:26 +0000
Received: from EX19EXOUEA002.ant.amazon.com (10.252.134.207) by
 EX19EXOUEA002.ant.amazon.com (10.252.134.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Fri, 6 Nov 2026 18:01:26 +0000
Received: from BL2PR08CU001.outbound.protection.outlook.com (10.252.135.42) by
 EX19EXOUEA002.ant.amazon.com (10.252.134.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56
 via Frontend Transport; Fri, 6 Nov 2026 18:01:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y7pWKCgnAUqbQ+XQZSwxu/DccRQh5QRirj/Bex2a8vfhO9aQNgkBABURNPCmPaoANK2HQmZhyRIS1doE2E/3XgPjdHm9fHiAaSEgiw1mhfW+X0eVO7FV3nDaHMnrT/+5TUNfateWRKHfdWHrc2V+gDnEI03sAsTPjxAVrs1fy5SYwWFsywznBih9TzR33JNgTUWn7zpUGS9p4BYUWHc92t7pR5WSp+VUtPUsXSghmWhE2NOg64xMuu5dyiDo5PXDnZJUZMzdUZEwsD0TZRu2CejPAkZfSvg+DHYkP4XD9AhAItg2Xdl6XAWceKRZgyLaohpe8mH0QOYYaJmdjMslBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yG0UXLpO+ySjtv0MKOmkCnCrULLH6pEI+DkiczZNf8=;
 b=J3waMzgqE7oMyVwUiyXcmuimM7r2FNojDSOfktCo/sQJzbqomRgY4LciVJHFsIdKbqFW04ww6ysODPyhCkfyxIFRTi6YAFEWcyxrieNU1TkC7tZjotw5PkZyYJ2XsO/VngXWMFYAUvfM4BMphBqkzhNeviDFoLrsDvQ6owuxvpDZ0VOEXVV4nathEM5VU2vR6do7mzUieOPUraDZYC15jZR2897Lmuu2J1zxkGO3fbgONlD3JQa4KQ6Z5V4cNa1e6RmjPExGzlxu01nmMBtBEQTprakvoDX003QIhzc4cbubOhaF5JUhxv7gNnw9Mu2VCy5OakQlP0UQOMIojYLpBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from DSVPR18MB988782.namprd18.prod.outlook.com (2603:10b6:8:41e::22)
 by SAWPR18MB988694.namprd18.prod.outlook.com (2603:10b6:806:560::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Fri, 6 Nov
 2026 18:01:25 +0000
Received: from DSVPR18MB988782.namprd18.prod.outlook.com
 ([fe80::19be:a6dc:c88b:2f4e]) by DSVPR18MB988782.namprd18.prod.outlook.com
 ([fe80::19be:a6dc:c88b:2f4e%6]) with mapi id 15.21.0569.011; Fri, 6 Nov 2026
 18:01:25 +0000
From: "Olson, Marc" <marcolso@amazon.com>
To: Yingjie Wang <1075151112@qq.com>
CC: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, "Christoph
 Hellwig" <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>
Thread-Index: AQHdbbeuQPHryKFUzkm4wZdMmIeFAbchVdld
Date: Fri, 6 Nov 2026 18:01:25 +0000
Message-ID: <DSVPR18MB988782D0113FB2AE0607F34431A1762@DSVPR18MB988782.namprd18.prod.outlook.com>
References: <tencent_1B8D08FB52E404EC3FE4933548D6CACB7305@qq.com>
In-Reply-To: <tencent_1B8D08FB52E404EC3FE4933548D6CACB7305@qq.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DSVPR18MB988782:EE_|SAWPR18MB988694:EE_
x-ms-office365-filtering-correlation-id: b2dd8c0c-663b-4c39-b54a-08df3c2ff937
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|22082099003|260925021311599003|10067099003|260925021911599003|18002099003|56012099006|261022075727099003|261026121527099003|260925022911599003|261022105027099003|11063799006|38070700021|261026140227099003|261028144727099003;
x-microsoft-antispam-message-info: XI5H9cU7wFndt3iLUI0bHcpdPeP4vJbojXpUelNaIqFhAgnnPcukMCC/EgDKfCQs5sITin3IYcxypRO+1kFJDqdnjicvHV/3f5aEKvG7I/0iIJ0Vqb9NZjgxQGUFu1h1in+PasrYwOZXBb/BEiUXqswdQWJwn+zpfsLcWhtEyy6SxdhNqKb1/2arBtk1LyY7Y5xqhCmveohhO1d5mi/P9jNRi9K4Nw89jOJxav++K2efmEI2jIMJuAivUONTVd0fGRIxfuxbFntCfSammuAA2jhHViih1YEg1Q3h9uCKKxF5KTrQIX9Lc6grDrxLRXRp9vpuRS09hn87mGxntCBYRPPzZmMYq17JSuNGbq25yBGoerw6y10WxiBwFdPnuQBxgYdFbQtbODEjaaIyQk0EPBX8G0BXCfNafkliXOKxzfCGLGD2hZuA4YE4juAWrzRwELLZkZsGw8LCGc/E50aUCuB1XU8rKd1CV9A42a6ihOYw1uQTBbPtuQyN7N1n6Xmq8fgp0GRgWd6yd8gXJ0mvNT7YoXtn/sqqXC4z36tGPFpuDGRX4CXWX2z8NdFA22HtPCCsjQVIix/0po5yag227+4AddYgGKEGGQ/QdFLuNzT5FLa05YbywH9oEy6P2i5IVC41G25Hau7n0/Oaxft1Pe6raLsWlmih1uNKrbRLwGWuGiGFmHbrFJBnkBXjMXoyOmaY4qPfnMY27rLFcWqJoLUkRGrG4bsQVSr60c/qsC8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSVPR18MB988782.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(22082099003)(260925021311599003)(10067099003)(260925021911599003)(18002099003)(56012099006)(261022075727099003)(261026121527099003)(260925022911599003)(261022105027099003)(11063799006)(38070700021)(261026140227099003)(261028144727099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?NDJykFvCnU3INpzom2mX/rjb9hq/E0HJa+zSgkm6gxrSmfecSWjMAJwtnw?=
 =?iso-8859-1?Q?W2hCEFCoSHe/Z2UHYBr46Wr7qNMGcjBIBQOE4gc0V1MC/bm21Hu1EtE4YL?=
 =?iso-8859-1?Q?JYBHyUsGY2jf/EBVZQBqNnLcslLT+/LEYfMxWQuiBT5YEscUkq3fS/QJl4?=
 =?iso-8859-1?Q?vAegqNDRE3Wpn8zsQMwMYyEva0sypkDlI+SwGVAPul+QvhOSG5h+KlPa3l?=
 =?iso-8859-1?Q?/vBuMbn4QIxvMF5gEPOq0gvPrgxNBMNFDBhnSjbaj0a73HBO8M65wn8mPw?=
 =?iso-8859-1?Q?QSO3TxrEGSUYFs8kaJ60HU928kZcXRCLcPW+SsUD5ERXHYaJmtadc5kk77?=
 =?iso-8859-1?Q?xYOWr9XBIPI8J9gJUGC2dfZ8GajSMUW4/hIF+0UMGGYuZ+/ecNxwk+d83V?=
 =?iso-8859-1?Q?l5IMngTgRQWZuERBccXItLCWpoaIaF6Snak4qz76DEgt8VoeDBtEEnUc4A?=
 =?iso-8859-1?Q?2gsBQyv2Z3JZmn694kvoQxSsRQmAJ2PSSKkeQhAKU/iVN8JYnGJDUtktSB?=
 =?iso-8859-1?Q?4SnTK/ABDWnbludeKg3D9rO9P7PBb/RIFiMDhkhWeVT94EZyRcBshJcOdd?=
 =?iso-8859-1?Q?NXDCPzsIkZ8YeI0Ubi64qBFUD3b7zyJUuSClSg/k+oeY52rlE5xvmadJi5?=
 =?iso-8859-1?Q?i/mxVGuqv++g1k99cSo2RBkSYscZ1MYyYz7lUd6xbrIl1YDQoBgMGprt0m?=
 =?iso-8859-1?Q?RwkxMyWkCw9QiVUH1PGvzUj7Sn4F9zIE7hVxjFf5O00hgC0EAkVjzKJHrE?=
 =?iso-8859-1?Q?y2LY+jTHUP1TQT97er7ZiNGar9x6Viu8v5q4sl/8i8CqUf1mz4CZG8srTi?=
 =?iso-8859-1?Q?HZHX6InJM6B0dzobCDS34UKxlyRBPJFKowe/eknewew4MXkVizyHel4ci+?=
 =?iso-8859-1?Q?TOXWdh+mBrzNefhcJYH/seRAoeaG436cLzSELqlkb5jfNrtWMJ1ZOl5hCt?=
 =?iso-8859-1?Q?3Awh6p3nOYd97YooPzueDLBlOczpWTSrzLdM7QBgV9ACaxHOZhoAJrGfxx?=
 =?iso-8859-1?Q?DJzYOkWVDO2gV1J1QM88GQr3QRAmE3eOIYXpTx0tSMmoRALWIbp/UX234J?=
 =?iso-8859-1?Q?ByPEhQV9B/WoDjhsikEMuGXfRYVdyRf6gezPX1iwoyl+egldviar8FcHtt?=
 =?iso-8859-1?Q?erTZyYSHl/NQSHfTNs9V+R6VFCHOTccYetgMyGr4jEYpsEgt544u4oFIyP?=
 =?iso-8859-1?Q?c5EvCJngJy88rUPBAo2p8t5KbWIwQDyHS4p3xIElFPonMcUgo9CcjkiOHg?=
 =?iso-8859-1?Q?3JR9WnW8EZh5wOBa7W0esIH6Lm+1Bv7xpQ6uhCHOJRjsAxtM7p4Umi+qHg?=
 =?iso-8859-1?Q?fMMNUbDAWTDJBVFkpZq+yuACfu62OveV9ybjDquxaFIS3kg/oLkNfBytwp?=
 =?iso-8859-1?Q?e0zNLrQf33CVqPBz90mRoA/EcIXdu2C6PeFs079Io4YtZ6zOU8QVS/CnYj?=
 =?iso-8859-1?Q?la0KG2P1ZKqeK/I9lrddT1DmdGX1YJVlKS9nFYVysqEUrY8ipHAZu6paL7?=
 =?iso-8859-1?Q?639Z6ujt6sC8IBKPEZ3ZigAQ9hBEv/BIGI6l4RBmOEv66cSt3s9A1F2F0m?=
 =?iso-8859-1?Q?nNuamvQo5Vl7fJsjU3TVm78YlMptfAP7QdQyPRpHN2GCqQY6GbqWSgRYhf?=
 =?iso-8859-1?Q?p/CTAlogZpnsCNJdhTOZkTiYvey4s4QgNPOUaDrbQ1jWKFrliMs7EAY1Ga?=
 =?iso-8859-1?Q?mwx/WC0V6/t1OVNix22cFVTPjYbgeVboTlgw9iqtjnfednkVCAM+6AATby?=
 =?iso-8859-1?Q?4hNfTmSnjRgoFS+VVVx7WIRdUk23PiU4pW2ujCWPYCcITv?=
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
X-Exchange-RoutingPolicyChecked: nfrTHoRf8e1n4xt+mOsh4DTSPTB9olfUv7Bu1qd1LZf/o/6VNsznhgsve9Kvs9NJq/gNxlApRqIGyRPWduiPqNR5lDKPmDO8g6q9bbckToiBxNb66E+GXBdRX1vt3L2QqB3J5ZvsYtixNpYbEYSY+An0/Okt9OWv6qpRUv7ZRMEaRK9o9q/Pi25E52wlaZFiosn3MaSR7V4WjCMdu39ADe0GyhjLrgj+c2VK9cXkdJls6OwPwoOKGeG4/hP2HDtdua0En7Bv82qlYdozeKwq612HFmPwkNtzOY/GPvk1jdXztTttzv3G7f7Fr78/8TunQi5xJ0YrSC35B1Qvi29ncw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DSVPR18MB988782.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2dd8c0c-663b-4c39-b54a-08df3c2ff937
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2026 18:01:25.1699
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iNAUkrepfz8MHoHyodr80oyDpXaN1ZNcA0QqELVxMZPfdcFbBsj9Z3HQZdDsPLMhHtRu+lFBvsvFOvwXiM+o8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR18MB988694
X-OriginatorOrg: amazon.com

> Fixes: 8ae4e4477d8f ("nvme: update timeout module parameter type")=0A=
=0A=
Makes sense. I suspect very few (if any) users choose a value between=0A=
UINT_MAX/HZ and UINT_MAX, which is why this went unnoticed until now.=0A=
The documented EBS io_timeout=3D4294967295 only worked because=0A=
UINT_MAX * HZ happens to wrap to UINT_MAX - HZ + 1.=0A=
=0A=
The fw activation wait also got worse with 6cf828d2fbeb. The old=0A=
msecs_to_jiffies(admin_timeout * 1000) clamped the wrapped value to=0A=
MAX_JIFFY_OFFSET, but secs_to_jiffies() doesn't. On 32-bit with a large=0A=
admin timeout and no MTFA the deadline is already expired and we reset=0A=
the controller. So also:=0A=
=0A=
Fixes: 6cf828d2fbeb ("nvme: convert timeouts to secs_to_jiffies()")=0A=
=0A=
Reviewed-by: Marc Olson <marcolso@amazon.com>=
