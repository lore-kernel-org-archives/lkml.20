Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.42.203.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818A231578E
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.42.203.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791233215; cv=fail; b=fzpIjeZprdUOeBJrSKE4G/t3W5SypYH9rLpt0zV3HJp6GX7D+vp/pbbUEPlxavnsYQCRBv8aHPv+9mY5Z3I6kfW6/z50tjFhLcAe5/+tzYIWt2mFh1aaR068jOimxLUYyO8Jk9lEh0D1B60WK32SfivyjqNSnKcvOU7y828kfII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791233215; c=relaxed/simple;
	bh=cMazKYpKuj4eKuOZdBJ8xukygcJEfjlFV14kFvU5DHg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=amhej1OSTNrHnfBVVFU8TBoHcYeu1ZdFgiIVXZoqgyFRV4TUrg1sqcSg6LCmTyjjIa3BM2EVGYV3esO2NCI1mtUadtrYH1wMsJgPCfCOZaAoNpSBvOEhvq/+8ZaswRjYLyGy8BHyTaBenBfYVUGEFi6g71bwVR17w02P0syFFPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=pamIH6Rx; arc=fail smtp.client-ip=52.42.203.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="pamIH6Rx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791233214; x=1822769214;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bZFvkgLBT0FJqsMwh5ZQAi8OsIIlLuAmg0flA7qb704=;
  b=pamIH6Rx5Mow8XMfIPib/26pOq1yVSwnMKWBkmbptgv0MI/fO7Jx08E9
   ZgHZ7O0JXJ2g3kyasrSGrLi9z7iWdOvKNGRTcwNyajGsNiAgFMZcrFmQh
   PtjHRJqrQ70VUf9XW8t+aqmuo2i64p7tHIpJgr4tiWqVZBCuE1OOQoQEH
   Fuec1kXbPBCgk/6oohXWrE/37WNM6AjfNMnwiYJ0zklPmVSryXLeAW83i
   gHCvEk+cJQ6RxdgAwOgXCqFgd+oHB2sz9y9xsweMnSePJJiWgNBm3Z/5G
   tMZjsV3IDqg1GoD+bD5jjmzpSJhnmDnutUjmgmPZ40OUNlf62EXvdbYlG
   g==;
X-CSE-ConnectionGUID: J1xttRlnTNa5hc9XVwDjwQ==
X-CSE-MsgGUID: C6ZCsdTLTNq/N4/8Ar8nFQ==
X-IronPort-AV: E=Sophos;i="6.27,142,1787011200"; 
   d="scan'208";a="30508086"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 20:46:53 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:21300]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.153:2525] with esmtp (Farcaster)
 id 8e30ca54-3963-4f33-9c99-5e2c5fc9a420; Mon, 5 Oct 2026 20:46:53 +0000 (UTC)
X-Farcaster-Flow-ID: 8e30ca54-3963-4f33-9c99-5e2c5fc9a420
Received: from EX19EXOUWC001.ant.amazon.com (10.250.64.135) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Mon, 5 Oct 2026 20:46:53 +0000
Received: from EX19EXOUWA001.ant.amazon.com (10.250.64.209) by
 EX19EXOUWC001.ant.amazon.com (10.250.64.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Mon, 5 Oct 2026 20:46:53 +0000
Received: from SJ0PR08CU001.outbound.protection.outlook.com (10.250.64.206) by
 EX19EXOUWA001.ant.amazon.com (10.250.64.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49
 via Frontend Transport; Mon, 5 Oct 2026 20:46:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jTenQ+isqjI8488ZapbC9K3nm+BaMnDDgvQ091dUvHL34SDbTpKXVEGWtzno2jtHYbZuXmMoODujZcZdgxi0j6sINbdJP67u/T0RJiGJZDIy+hRFav+dHuKQlThQIXJju+OHtLVDVuIRnbYDC1ZkD9YeY16aKuta5rDnS0gdJ/lKHqpFtcqDgq+ri4HhtuGJK8nUA79JcE06GFk2JS5iooNKQiSzbaxhAHtWRwkuUrkxOfH5R2vU0UL6JZSNvkPbxuvVWH0YISVynYixYBwp6P4MYAWdbxILEKNkxzTomX4ZGCVcUcD05HveBemTMjNGFn7CA8V84HNsniRq1q6cFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZFvkgLBT0FJqsMwh5ZQAi8OsIIlLuAmg0flA7qb704=;
 b=e23HM4V1+cDr+1v783gVLcILLn8f3eS13URPJ4nCPLLCB5PZeo/c6bhh5nF1Lu1fEuZpdMYs43SPLwRWWRP/B7+HtECJEnuzTUo+q3etP758Blh7VmpDd2LYjo92+2+3FwT/txOCADUJokvUP8lysoguFUyMmQnejl4p7Jw6op1VZey8F2/aKb6Tx5GNGbjU0FZcunG6iF8+pKJ9BU+0zFKVNFC/yaUaW/nUNnIiv6EzsrsDxGyQ3DNg6CnKxvPvb29UN2tPFUpAts9k4BNF5W9vAZ8+3k47D+7OCiKMItZqJMR/o6mHty3cxEZ3tbWNHbhcsZxA4fn6X3yNq8jrtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from MN7PR18MB660231.namprd18.prod.outlook.com
 (2603:10b6:208:5f3::23) by MWHPR18MB988533.namprd18.prod.outlook.com
 (2603:10b6:303:2a7::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 20:46:49 +0000
Received: from MN7PR18MB660231.namprd18.prod.outlook.com
 ([fe80::97fe:4c12:b98c:3b70]) by MN7PR18MB660231.namprd18.prod.outlook.com
 ([fe80::97fe:4c12:b98c:3b70%4]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 20:46:49 +0000
From: "Okanovic, Haris" <harisokn@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Dmitry Ilvokhin <d@ilvokhin.com>
CC: Michael Kelley <mhklinux@outlook.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Radu Rendec <radu@rendec.net>
Subject: Re: [PATCH] genirq/proc: Fix missing CPU header in /proc/interrupts
Thread-Topic: [PATCH] genirq/proc: Fix missing CPU header in /proc/interrupts
Thread-Index: AQHdQhvpTXj4uWvh7UCW09xtood/Nbbvju//
Date: Mon, 5 Oct 2026 20:46:49 +0000
Message-ID: <MN7PR18MB6602311B7A89577CF63B562105A8962@MN7PR18MB660231.namprd18.prod.outlook.com>
References: <20260911-dev-harisokn-proc-interrupts-fix-b4-v1-1-f9ff208efcfa@amazon.com>
In-Reply-To: <20260911-dev-harisokn-proc-interrupts-fix-b4-v1-1-f9ff208efcfa@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN7PR18MB660231:EE_|MWHPR18MB988533:EE_
x-ms-office365-filtering-correlation-id: b0775c97-01c3-4088-f2c9-08df2321c789
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|11063799006|56012099006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: iQTwRbS6FPO4zZmTc49b/H9UBqD6htcDbpBme3a2bHlkx8XTKAFfX+9kSMdkZqSyJTBaHlShtxYjGPmeypWGetSdqq6Orq9PgqXj6Br6MZglfa4FO49FFGo/95BJCmmcIJBzmMq1edionQA1aJAlWfSiaOBtGDR3uS5Y3JNTLyLDGr/hwvLWV7A6JUMbxx/d/UeG+IIO+N3F/XyF/isGJOr6tVWwAXO8LuBZOikSbPzncEhLa3yoSfj8KWY6DeL4598zeyUbfZy+R4Nu2SHbnVvhXDBTUoJgcLp8Sm+l1kIF1Mr7rgnOTDtjSGHEHtWUaxdzW07ioJoQDirmFNe0XpYZnRix7lMuTrXXq20DDJh49Ahnyb0Gq4xVBn7HJEJu4Vb1KwyutwUCJBDuspWZhyPLU3waJuwnd5M58yfx8FjCiGx72k+9BodE8bjyMByR1v7CmxwVBpFyP+/hFuHGuyI/R6BAoB8zI2dX6tWlZsAW9ssRBcP+M+Q3hgpINe7lM8xXJi4RDhOWRvBy0bZgrnq/BdzqL/cgYfzW5qMsAD5u3sthZouBgzgE/z4Sa6QwdMjnXjRokK2HKIxnGYnNXtS60nv29eE3OrxeIbwgnwibrtSzdRQl0D+2uBVaU2NcSMUAhKidiZhA06JFCbqPsHxS+jUGGaMF9Nb0PRRC3q9piWASsu4loKHttJpVJUArQP2ehZeCpd8+4aplYhntN0tZxpOcjpG06HHmLl2PVdA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN7PR18MB660231.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?v/WO7IRsLbm1R/X/4GpkmW1DrfZtkq1M+o2mrGg7wttmgtVKGfOpQa9FcY?=
 =?iso-8859-1?Q?JQVaA4AsBRL+UgBFw+8HMjy8/HfcpUFEuei45R9A+ik/2xciPdXpQhUl5N?=
 =?iso-8859-1?Q?MdbDP+llKOq5KaE8byABilQSrPOyQrVYKdlIjCgKRf7CWTlV88KmMdsdU0?=
 =?iso-8859-1?Q?QtMvU+NjkN3H8czC8nkfj+0bDOxM79RyF8uBYnxfHnAGhZdQfHr14JOIeT?=
 =?iso-8859-1?Q?S2hZYcRcmquBIEe64XEiG5gHNfoPp/9Jin5X68PJwXWE4aKP4Fr3pzben0?=
 =?iso-8859-1?Q?2nuvivCWgTIkv2v0WvIbfoBlrcSn2ISi3Sq8qooSkXlOio4zWZ4AYymTsq?=
 =?iso-8859-1?Q?6qnavPXj79tHm7/6SA3ihIUPZ5RpwFfTnokXTMEjnLKT6Du53c2xJts1Na?=
 =?iso-8859-1?Q?kkJRyDHGCpkTEVPQfeJOf8qgdBIS3geOD214D/9TMv3aYcWprxBaA3SiZJ?=
 =?iso-8859-1?Q?R8BHBHdmR/TkXkBHAnW81uoeqHMfl4mlBB8dtNQbhVOjzw0fZYW8gA/8qc?=
 =?iso-8859-1?Q?ruq5xHvSLUTP5DHNZa/29HIo8B1LYFweHbk4XtQzXDsmH0eU4zASmon7hC?=
 =?iso-8859-1?Q?nn+fNe5LbxkFIxucEE2EiUnOL8UWdi3Z5dakTjh59rzGa3ocffk/r9qYwq?=
 =?iso-8859-1?Q?MUw0KeyUMcIRvQfGt5g/sF0sfhHqOI0ud7lbnG17oU+9LqfL+t2GFhxtCk?=
 =?iso-8859-1?Q?NCgnLVvfkRko6euuLD41gxdr8WMYwNU/db0XfP4LO2kz7VDL6YtP+V6blL?=
 =?iso-8859-1?Q?DqzxlSKRMU6RyOY+Io08Sy7yVM8rmuDbOlT91fcqt7UpAnYkXuVS3J9/Tz?=
 =?iso-8859-1?Q?n1npxz3wNsr9O3F+DDpjHDlmuc/eqd2TpISUTZIKvQlzredQ0TUsqNI8tC?=
 =?iso-8859-1?Q?fr6bmZedVU+iv/P+SWE3hkyEKHG8077AOdnQHGHhNB8ZuAhO2dxC3Gsemn?=
 =?iso-8859-1?Q?Uwxzvqgk5dD+unO9GXWn10bDgvDTE6JXsjH1oyPNbEBoBjc68ntQPY1aUh?=
 =?iso-8859-1?Q?/cmd8cqqUhCk1rBXne/edOTVEAeXNQtEZhtz3nKaVAyqSZAXiMD7HlrR8b?=
 =?iso-8859-1?Q?d5jV9iNuW5bzrTu5mH7N/JF2WtiYZSaRLMyZq9j2ugXE2KIkDIFL7oGhT1?=
 =?iso-8859-1?Q?fE0ncybOjVBQ8ibzHYfN6NWACot9J6n15Q6rtSe8FPECPhQaKxZpOC/1fM?=
 =?iso-8859-1?Q?IyWFANfbx06tSBlYdFZcb9G1FfFtm7aIhTiNyE/ehUSDBm/3uOZVP0Ulnn?=
 =?iso-8859-1?Q?VeNZenngpOyExfO4NRV7ZAM/FYmxTTgSBpVQJQTuKZGVgJ2bpN4sdPLS3n?=
 =?iso-8859-1?Q?KRPYQ/cpcZ6euGYeT0D0TPNQ2HzTSjFdPjjCLE4jylaoHNpw+qQpLs32I2?=
 =?iso-8859-1?Q?mV4EcPr7NGR3c1P0bY4cs4mY5K0Yuy656Xdk5SoXrbJyVzTu5h8jioXFBR?=
 =?iso-8859-1?Q?F8tN7Lfkq49zrSTXLbSwwCOQq1EAH96OUIqmP2AEfegIU1m04G8CTlWGvj?=
 =?iso-8859-1?Q?imhgZKtVOSav8gAdje4rphKayVy8IySrtamNJsmDpxPXzeZpVC7hhBIpsd?=
 =?iso-8859-1?Q?u7a4zmh1EmtoRyPR5Nm86iZdQDVCvNhpZI9RegX+l2cuat4Hjy8jbxP+64?=
 =?iso-8859-1?Q?IZrSG0vXk5tmqSQC+L4jM4raaXPA9EgA06PZs9Y8KR85GizJYKbrZmJcDy?=
 =?iso-8859-1?Q?w1okAZtlTKJV8Kpay5A/yegl87NRVOSES+VRIGLFsOx13+z7TfooSqfkdl?=
 =?iso-8859-1?Q?v9nFxb34Wjnfhpp0nyWFaiYGdxYKVzhtMu2d2f9X6TCAxk?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: sfw2VY2sWvz8wS5JYhJaubEfFzabtcxoNylZu3A4J8yNoIOiFs1St+PaZvwj3Xs7WjwKD5eteRs2X37IhtbTy0ET4m6FrUuDP2Le8A9lrSaBG7JmV+RrR+7I6q18ICJ0lYNik+J4DDbnikj+/zRbR7+EzzFkWSnO1BDinypq+Jggh1e7SsJPfcGgSOLMF2PMaz+EVq96VEklmy1B5wxgp0APavY9VyJK/dv7apLa5UNtK9aHS4ajlS879GF0nzPUIT8+pdF30hkTzMpYLKTDI8zA1EvWTPAUsiHltQSSjU3jdblKEM/8u73wYbGcMM9gbm5OV/jPIXWSp1tkH7ocng==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN7PR18MB660231.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0775c97-01c3-4088-f2c9-08df2321c789
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 20:46:49.7874
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IiU0Oi0SFrhWK3FGtGpvFaeSxkiZa75Fp3EYZ+n494XqSEKYq1durL61lV6gEuHy10iGSrL7MNpsPGwLCYAlRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR18MB988533
X-OriginatorOrg: amazon.com

Hi,=0A=
=0A=
Second ping on this one. It's been reviewed by Radu and tested by=0A=
Michael on an Azure VM. No outstanding feedback.=0A=
=0A=
I've also tested the fix on aarch64 and x86_64, on AWS instances from=0A=
three major CPU vendors:=0A=
=0A=
  8g.48xl   192 CPUs, Graviton4 (Neoverse V2)=0A=
  9g.48xl   192 CPUs, Graviton5 (Neoverse V3)=0A=
  8a.48xl   192 CPUs, AMD EPYC 5th gen (Zen 5)=0A=
  8i.96xl   384 CPUs, Intel Xeon 6 (Redwood Cove)=0A=
=0A=
Let me know if you'd like a v2 with a different approach.=0A=
=0A=
Regards,=0A=
-- =0A=
Haris Okanovic=0A=
AWS Graviton=0A=
