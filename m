Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.34.181.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35F4513574
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.34.181.151
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748066; cv=fail; b=t06IxMXUPL7XAfy8Y0+8KvhEKaJ7JOwhfKFUfI932TwaziNfTAsPHjyZlBFkm6b4vAR5n/9pMiuUy8ELlYC5gVfY6aGkidmhilBrryqlKxadnDjw3vfuZMyiHd51ufssd82O0na0H263SRp1vAn2A2/IGurLYiMzmrwtOg3lWB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748066; c=relaxed/simple;
	bh=jxwETDLeblTQZUKrwnnw2RzCUtthFIcALvM58ZSRYIc=;
	h=Subject:From:To:CC:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MB0hlMyC2+OZthVsTkdBmNSP6hnAJCRU2f3fBgM5LHPR7KCYRqhf08hFICepKxZQfwA+7WJWwFEK+36EkS38NXFGpNvrugrEnxrasV12wEmx+v1degL7zqiSuB8jitjpQ3se32UQc/jCL4GKE1co9Ue2USx8eQUcITMpz4hKICg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=OOpkoftZ; arc=fail smtp.client-ip=52.34.181.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="OOpkoftZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1789748064; x=1821284064;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=jxwETDLeblTQZUKrwnnw2RzCUtthFIcALvM58ZSRYIc=;
  b=OOpkoftZw1+FbubbUIOLwiHzCWppsHV9/+tL161EfOy6YXNCprNaeE75
   xQEeYZMhEw8iEne9b0E3n9sa30ZbYlc6zpz5b2BcPYaHlnJm127Lx26gt
   zGmSYQ500P8UL12mMW1sN9lcfLEJi5depQQyWc7ofBxJxLPEL+iedK8FU
   LZkvdK+vcDPMrd5QFLy2OFkTSN9JnLs1E4TmyLlA4/N1w3I9GKf9+KGD0
   3O7mXw13VhBXM1l2vyCuat6Is7uZXbAG63YN2SkGh5wmNSkFqGroIVwb8
   ld/Yfs/15UrR0W8QPHoRSLcx9PXYmXACwtt81BKYc8LrDRIuf8k5sGI4C
   w==;
X-CSE-ConnectionGUID: TikSe+EwTPypTsmjPyaSJA==
X-CSE-MsgGUID: NBeHBYF1RBmuplfJ0P3FWg==
X-IronPort-AV: E=Sophos;i="6.27,109,1787011200"; 
   d="scan'208";a="29039970"
Subject: Re: [PATCH] genirq/proc: Fix missing CPU header in /proc/interrupts
Thread-Topic: [PATCH] genirq/proc: Fix missing CPU header in /proc/interrupts
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 16:14:24 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:19295]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.33.247:2525] with esmtp (Farcaster)
 id d323e9f7-96ee-464f-9777-79032132c1d7; Fri, 18 Sep 2026 16:14:24 +0000 (UTC)
X-Farcaster-Flow-ID: d323e9f7-96ee-464f-9777-79032132c1d7
Received: from EX19EXOUWB002.ant.amazon.com (10.250.64.247) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Fri, 18 Sep 2026 16:14:23 +0000
Received: from BYAPR08CU003.outbound.protection.outlook.com (10.250.64.206) by
 EX19EXOUWB002.ant.amazon.com (10.250.64.247) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46
 via Frontend Transport; Fri, 18 Sep 2026 16:14:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PDPwVyGDmN1qd3vMiU2FlSZYKvCg5ew1L8HeT+yvOyqN4ptjmF2Rz/MRhssFXSnFGH4wU4BtjKRt60iTAQujW4RAxrvLvvihUwgl3Hp7jqVsdxy6H0nrfMlcb3rozhECwhzulWctKbA6bTdRMopLP8lK1pyMRFPgzLhHD4T/4qpW8pevdYK03X4HaOhHQeqdMeDU7N26X9RhiFuJr40V8FEVniW19EyJLDpRluHTIud6dha4LO3noIj/1rxYWRzIy71auk19X6u2Hs0t/1YLzg+3etSjpvnjb0MwIxyxSVGOlGfr8tNGObMLlW/J3B6mR5tWn2qwytfRMmcCKHfetg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxwETDLeblTQZUKrwnnw2RzCUtthFIcALvM58ZSRYIc=;
 b=ftRM/1CVeolMJLBflufzBVDjGKpoPemDPyXklRSSBZMcHqI01HJdFmndPQKcxLMt6u14usutl6M0yR7z9mzO4ddhddk6o7hnsXlRDDzg2zlHFZBNPlzzrTToUa1Q6TIDp2FM3DvTQHuICpDSAhyDl1zQnxkuiZfF1wsTNo01ag395JpeDbNkbzrDEBsx3HmWlUyzC4pwORGjhXuDowvMcqiMYIZcKLBsstNDuBKBs5S6T+YBXVWbeR+pGwFUKgIeEtJ2vHlkrJs+Rsh0l7qyRVRZcfYmwEfsoYc0bY53HrtRRX6yJ7OAsMLnf8fINKnsbwNK7QlItrMwmX0mpUJbZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from MN7PR18MB660231.namprd18.prod.outlook.com
 (2603:10b6:208:5f3::23) by SN7PR18MB5363.namprd18.prod.outlook.com
 (2603:10b6:806:2e9::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Fri, 18 Sep
 2026 16:14:21 +0000
Received: from MN7PR18MB660231.namprd18.prod.outlook.com
 ([fe80::97fe:4c12:b98c:3b70]) by MN7PR18MB660231.namprd18.prod.outlook.com
 ([fe80::97fe:4c12:b98c:3b70%5]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 16:14:20 +0000
From: "Okanovic, Haris" <harisokn@amazon.com>
To: Radu Rendec <radu@rendec.net>
CC: Michael Kelley <mhklinux@outlook.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Dmitry Ilvokhin <d@ilvokhin.com>, "Thomas
 Gleixner" <tglx@kernel.org>
Thread-Index: AQHdQhvpTXj4uWvh7UCW09xtood/NbbTrhcAgADezAY=
Date: Fri, 18 Sep 2026 16:14:20 +0000
Message-ID: <MN7PR18MB660231F0BEC4867EB5C18D25ECA8872@MN7PR18MB660231.namprd18.prod.outlook.com>
References: <20260911-dev-harisokn-proc-interrupts-fix-b4-v1-1-f9ff208efcfa@amazon.com>
 <0f9ca9d4af4ac5cb5056c4900e61b747e4d7a806.camel@rendec.net>
In-Reply-To: <0f9ca9d4af4ac5cb5056c4900e61b747e4d7a806.camel@rendec.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN7PR18MB660231:EE_|SN7PR18MB5363:EE_
x-ms-office365-filtering-correlation-id: 11111f4e-0aa0-4324-baf5-08df159fe57d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|38070700021|11063799006|4143699003|10067099003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: 3WzRzEnw7plKD4giHITrOqqs+f974mo2G/HPCdlm8z5PfDYr5ITzn6oUGOhqmigOM3gxfvs+XqFUmDwrThKUNkypZzr5TAGxDJjshoMH6mUjDRUu+iegcQdU6qutx4qfYfSvUEINU37Y9YxPAn1Rpqu9AWBmzYDvVhz87T3aUYsAu9TMxmbWQfJxUzg5i9dmrhDiMyQCSdPynbau7P/M7/eJnoMJKaGLm9jASlzQE20OvzjuBOpa7SxFwTYRwa2RQ9rq/7n0r9jkHYNOO650SRUow3TVHuvYCQuydNbfORz978CS1txxzXh/8CY+woO1hk/2eXbwlGwrDu5/qYhnk1RHjvbw9qeVW/e9E9Ge2NwgcYvLEJhez5PXTj4JrwXCGdQau2DZJ9diYqRhmS47330RHimzpjYAUD3bXDyrZ/EIQOKhLSiiOm7v03Y1UB2GAgKy69l7FtSmTZRSDvFyGDv1Z5RgMF4MFNi5qyGsOMCS05la1h4W0tCTEZbJlVE1j472xoxtg4tQsDMIyPuB5jcbP/wpFR1Bhdj0HEykHxxuwt4V7Ex5Md+JTO9lC5XuEIcLjpYQ/v8SrvojB+ii8A3kkr9EoAbulf3wuZwMbvioAFUyaeOv7XuWY/6OVp+JAaieETA1m3o2Zic3Kw/Z8oiOgAN5R5ydSsZgcD2VUC745FEDu9+iT7p3yJhbTfx2VZwvKfZiT7XJu05hintKXFcjtvqCeVFAGOkiIoFYopY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN7PR18MB660231.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(38070700021)(11063799006)(4143699003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?CN7I0WfzTIcDshl8VThO7M7AP5TYvEUpcYb3c5FBTyqZIyU2t5JxL0xyfC?=
 =?iso-8859-1?Q?BO1E6nN1foPwc/KeyshP6WZZOOphuKP5FUnKOWDKN9/HkuiZ8w3Eaa7tNr?=
 =?iso-8859-1?Q?Mtqlbv0+KDOvNGCeyv31PWk/2KeQXE0+SjQOGE5V4cQW9JwVDyTVj9XjaK?=
 =?iso-8859-1?Q?wuhW/gtHHyEOp4qzmutl2pDcHv7Wa5duQ0da5ELBrT+FvLcCnEFFZ3yA+j?=
 =?iso-8859-1?Q?x86prAViUUUsumgFMLwjwNWoDadYTEFVtZTILBvLvHy+6DfdGvLuPhFpbK?=
 =?iso-8859-1?Q?D/vqiMKfaocdLnbAvU93iuXO9jPg4dXuo36jaOHk+NiO0WFfo7aNgrD8x1?=
 =?iso-8859-1?Q?IjOfITbLWNv3y+GmRUaOVTNoT6iCNq2pW5b+Qr5CMtJYM0t/FYX2x5GYXD?=
 =?iso-8859-1?Q?lgnFyfp1iZrTYjE2AmMMdH7AdWgX1M/1yZjlb1bUCxpbeCiCxeqiS9dJ6S?=
 =?iso-8859-1?Q?P2Os/KZmrmQT3l7CHJ3ci82ibR8mIaz9TFad8XhszZlX37z81ZLE9w1s88?=
 =?iso-8859-1?Q?ZFw24fj6xoA0xdNMbOcN9RzlwWv239lCm5BngaMatCQQm9kwVQs21N8aYY?=
 =?iso-8859-1?Q?nkunYvCZhP15sWVh5WUtSg+ttKncRuYcqVvKwNT5WihealyrBXB7+FmF/p?=
 =?iso-8859-1?Q?wd+l2wyq21pVtgnR/JDDdTvG2J4FvluEeEStexobxSdrbESTPpixd3EaIz?=
 =?iso-8859-1?Q?YSgE9XvkFFHXrgzDq2SP3CwWhPOb2zxqteJQTksp5Yj47QmjCrzyZjrtdk?=
 =?iso-8859-1?Q?u/OahBs6hlwc1qN2tZhrNAU/xQ+uzZvGYx8/Y4SRDtiWJv4E4lkODsW6zq?=
 =?iso-8859-1?Q?1M3ZK2APTlvl4XJXntgNTrSce6CmZKGSqciPGnSxzzAajoLvdtNdo1jxPu?=
 =?iso-8859-1?Q?AshuQcoiF6gYcM5ZbL713LsW+dq2HpHKiE0VOckEUXFA0DOQ1lx9Z8xKCR?=
 =?iso-8859-1?Q?ubVFSRIPe+Yoe6jtGqUGrKUYp4LUwiRZIswOH0HLyJjQ0BkSoiHo6oQSj9?=
 =?iso-8859-1?Q?o8dEufJkfEaEcsFPQ7vl8iTr/IIZJBZGIiN6mk8zaES4Bu3k7eS1ziyknA?=
 =?iso-8859-1?Q?oW9o6E1yQB872jUlfshf7jh/5gcIFQoWO61rOgmpCsWNuDmkwEnAikYf6q?=
 =?iso-8859-1?Q?ExylGZKzE67qRlBZhnZI3S8bZHRZfVxnvx/gngiXbKvD61948BddgNWszx?=
 =?iso-8859-1?Q?YHqcXQGa5H6Aj2XatpH3Z2Mek+AB282lAdaoLIy/+Aq/nJyLeCs4c5ZPe2?=
 =?iso-8859-1?Q?6SXitAx9DoBbypOUL6UJpVrVzw8iILg4+u6k4jvTvWJOZVRJn4oUamACCv?=
 =?iso-8859-1?Q?i6W+IBVXSWMf7UJGnCTNlTq/x6G7WTg0GmD68vShC6kEOEfcGlnZMuS/8o?=
 =?iso-8859-1?Q?6YhLi3O/DQQh+jEAQoBZFXU2dmwnOESMT2lNdfpIUGAnuiPtZCiKlfRX4b?=
 =?iso-8859-1?Q?TzSwcnwMSu6xjcgqbo1iqt3cYQvZvPPbnoMNc/Hz5VtmEm7R1yf3z7tBO3?=
 =?iso-8859-1?Q?PV9v8KBWAISbMQ8bG9GE0YUE5CUyXs7egw81QrZcwXGZzFBpWhUwjvAZGe?=
 =?iso-8859-1?Q?FEscDopFcB7SRumahv+Q/0e9fq4+2B79i4+H0sv/w/+y4pJPeF0jkmH2LN?=
 =?iso-8859-1?Q?a2fE2hn4g0QnLmWMXmkA6fQw8XFlU5kgr/9uBgT1ZS8iEh1U3EEHYp3D6Z?=
 =?iso-8859-1?Q?X2iqI/03sZFDBTQX4+1frJEqFDtwL6dpJPWpPWenG2XxjbfqV1WsQlcqAn?=
 =?iso-8859-1?Q?JOe+Y6TEVkqvfe50F8PRMVKURoxzxYySaQfd/wv+D0bKEo?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: N+GOz24J+G3NNuwPUN09w4L8dZq3RJflPQvKAqF+Jg4hMnCfUMxqkiz9iVRIn3RM/anHAdd9q2T5m6LZ4L9z2pxrUGeC2nFVlAZGo+thtVfw4NEBV0vx5B4zMjwC+nGoIBoo4dtOiSF7vap8WR9Y26oYXvMoiaxPDqFI59rHg5vJP3QQlwG3MHnSDDqACWn7hPIxOB4sBBN/UCXgRmWURfUSgka8IIB73z+k5NODueqq4U1UNCfcY+fWfjQ63Pb1JTTT5YPhopF0zwGRe4BBRe0Fz9WIcpdWur5je51iveQABWnF4B8jVWYSlIYj0BXqeLXXFjot1ETGy+jrJtHz1Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN7PR18MB660231.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11111f4e-0aa0-4324-baf5-08df159fe57d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 16:14:20.3721
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DP2zxvromB2yIYEVZnRhxzV1pJkY21ykck1G5yAlWl9nrC/6OEqJ2IZT33JeMxGGh8HBcFHCZUJchaYrIQfkEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR18MB5363
X-OriginatorOrg: amazon.com

On Thu, 2026-09-17 at 22:55 -0400, Radu Rendec wrote:=0A=
> Since I don't have access to a machine with so many CPUs, I tested=0A=
> locally in a regular VM and simulated the large number of CPUs by=0A=
> adding artificial buffer writes to both the header part and the IRQ=0A=
> counter part of irq_seq_show(). I could reproduce the problem and=0A=
> validate the fix. Also, semantically the fix looks good to me.=0A=
> Thanks for catching this and for the patch!=0A=
=0A=
Thanks for looking at this, and for finding a way to reproduce it without=
=0A=
the hardware. If a large machine would help in the future, let me know=0A=
off-list and I'll see what I can arrange.=0A=
=0A=
-- =0A=
Haris Okanovic=0A=
AWS Graviton=0A=
