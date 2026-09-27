Received: from iad-out-003.esa.us-east-1.outbound.mail-perimeter.amazon.com (iad-out-003.esa.us-east-1.outbound.mail-perimeter.amazon.com [13.216.7.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351F52DECA1;
	Sun, 27 Sep 2026 08:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=13.216.7.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790496204; cv=fail; b=PbhjiFQtA7n4h5rvEaIfNxiztPx60NBKCH04OX+Epgt/8PDxwWQcHl4s8nvn9jECSsIEXzGAzd4CLgJNG7zBZz4lyN2onI3vI3nVDjaGdHmLb0EgdY8YDy66/3V0CPUKTX19bVdlPVTJZT9m8MifUVE9HGqRm7JMNHhLLBLz5e4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790496204; c=relaxed/simple;
	bh=GjHu9dYO0nO8rJ1tBAvqV6TZ1F4XA++LgPO9UI1PkhM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XPJCmY/nUFkap8LupyaIBzZy29ZNCmruVoewA2IT0pA7/vbeFSWgzg6UGQ6cZizYVrYviydanXNxJ0nYPQv+33vROFVgdj/E7aMSCNCd5VxzwZWTfjSE1Ni8uqppfXIoFSOaHk4Th1ZxJ+HbY94ebYBk2jp9m8y9+4SYgh1r0DU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=BDwATz/W; arc=fail smtp.client-ip=13.216.7.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="BDwATz/W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790496203; x=1822032203;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GjHu9dYO0nO8rJ1tBAvqV6TZ1F4XA++LgPO9UI1PkhM=;
  b=BDwATz/WMUQpl79V774Z/YypjC9FNz/JKtbFXVUkfMsR8NTqYRQfX3o6
   mFBBet4dq/W+uLKjUYBnm8bD5iLAmsUdzBATlLIZ+IWcIzg5kfyqAsyu9
   VekOZ/oMvRcr5PNM9djrPTAhiep0XkA6WiSvh0/+kg4uhkZr0D8+nvOr4
   FHvZaouuV9gjr8KKKZeovbfMZ6HQPpGCyNdvp7BJqwrt40qwxT0Mu9Kmu
   Kd/qv/DZXjse5ZlKl7/j7ciWFX1+TtCsFkuTkml0YN42IzzIRSLrkrEIc
   DY5b5YKh+Ow3M1W7dxODOYCUEGJVL7+5AEDEdQAY4KUWZOJ1D9gImVRFd
   Q==;
X-CSE-ConnectionGUID: YRb5jX6VSWK7uJx9r9EumQ==
X-CSE-MsgGUID: 6SXjLRM4TPWA3LWhEl03NQ==
X-IronPort-AV: E=Sophos;i="6.27,125,1787011200"; 
   d="scan'208";a="28135039"
Received: from ip-10-4-17-41.ec2.internal (HELO smtpout.naws.us-east-1.prod.farcaster.email.amazon.dev) ([10.4.17.41])
  by internal-iad-out-003.esa.us-east-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 08:03:19 +0000
Received: from EX19MTAUEC002.ant.amazon.com [52.94.133.130:2382]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.53.245:2525] with esmtp (Farcaster)
 id dd75a00b-fb42-4fc2-a630-02722d2027ad; Sun, 27 Sep 2026 08:03:19 +0000 (UTC)
X-Farcaster-Flow-ID: dd75a00b-fb42-4fc2-a630-02722d2027ad
Received: from EX19EXOUEA001.ant.amazon.com (10.252.134.47) by
 EX19MTAUEC002.ant.amazon.com (10.252.135.253) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sun, 27 Sep 2026 08:03:11 +0000
Received: from EX19EXOUEA001.ant.amazon.com (10.252.134.47) by
 EX19EXOUEA001.ant.amazon.com (10.252.134.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sun, 27 Sep 2026 08:03:11 +0000
Received: from CH4PR07CU001.outbound.protection.outlook.com (10.252.135.199)
 by EX19EXOUEA001.ant.amazon.com (10.252.134.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49
 via Frontend Transport; Sun, 27 Sep 2026 08:03:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p8A1kuVjSJ2GqncxGMTEDney5MCTBlAaxN4le3axYPG2NoRFnBbpTHcpXGHt4JmSouhjCMwAEow/KIhrWvGNdcNKXMEOIuC+dACyCl3gFdYeF8xlboNPklOvmWRXWt/vTj6LGEloLcgfozLqMtGAW5YaUJ0/06cnJUXK/0hSPN5TMn117592+ztNzXdZs+3YK94WfF5Fdz2Ko106WO/qMRGeM1y5JmBt6qgbbxYlB2cxDRYL8vS6YPJOT6OQcvX8IwWA5UVjGQTC9LK4/5HGqiM4wkDb+bU02U/n+AxyRNxYkcwEhJwmP2IHJEEek4hyhUca5M6a9HMLItcIFN/i3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjHu9dYO0nO8rJ1tBAvqV6TZ1F4XA++LgPO9UI1PkhM=;
 b=CRQgShjteXh8sf73nUq2hB+UKc8je1yN4PdANoYSMJnxvAo2YhLobtJhsObD45mTPwKA6HwAHgjBOs1RSB4Lyw3ziwDmEbheJl8RRvWS8b/cKUckKbhShdq2m9to3HU1MnWpr3mxU8nICVtUjKph+33ovtYrqCh4CjCj/2OqoPQ1huczlUhEQ0JlsmaurfME4OurLJ9Y3eFg0H5DINxMXHtPZJBNpv018+d71TPoQtx5h3W45WMuaSg24rkcVwlVwmsGJ+XH7H9xGk157tI/IAv/2+eRZaGwIYtG0Fg7Ye8SyI07ON+2wKA9jQX6DeTHAngbY7F7/rBbp+l9RzJldA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from BY3PR18MB4722.namprd18.prod.outlook.com (2603:10b6:a03:3c9::19)
 by DS4PPF5BD37EB68.namprd18.prod.outlook.com (2603:10b6:f:fc00::a9b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Sun, 27 Sep
 2026 08:03:08 +0000
Received: from BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219]) by BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219%4]) with mapi id 15.21.0451.022; Sun, 27 Sep 2026
 08:03:06 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Conor Dooley <conor@kernel.org>
CC: Thomas Gleixner <tglx@kernel.org>, "Shenhar, Talel" <talel@amazon.com>,
	Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 3/6] dt-bindings: interrupt-controller: amazon, al-fic:
 add error/fatal groups
Thread-Topic: [PATCH 3/6] dt-bindings: interrupt-controller: amazon, al-fic:
 add error/fatal groups
Thread-Index: AQHdTlagN2PN1tdOOkOTwpAApPyqqg==
Date: Sun, 27 Sep 2026 08:03:06 +0000
Message-ID: <BY3PR18MB47223BF66D289D4AD9A77BEBC68E2@BY3PR18MB4722.namprd18.prod.outlook.com>
References: <20260924062311.37308-1-farbere@amazon.com>
 <20260924062311.37308-4-farbere@amazon.com>
 <20260924-majority-amazingly-58df3d86190c@spud>
 <BY3PR18MB4722BD55C256787423DB5CE7C6802@BY3PR18MB4722.namprd18.prod.outlook.com>
 <20260925-emit-activate-672c6e428fcb@spud>
In-Reply-To: <20260925-emit-activate-672c6e428fcb@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4722:EE_|DS4PPF5BD37EB68:EE_
x-ms-office365-filtering-correlation-id: 427abb5b-bd01-4ef2-c6f1-08df1c6dc35b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|3023799007|10067099003|5023799004|11063799006|4143699003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: LyACkq529Rj8v/CHChmmxPUNtBPVYQFpg6BEUYj7da/CNzgRRAsPA+SNaoMxbEvarkwiDIzOvXuD2fHaizXD2nhChIKOFQeL4m558pXqylUO2cyHgn5ITbSeLrwtZI9KNxPweldtSxe9z/YOEUPhcM3yNu/wJJhnx+mgIh3eOzvf0dbYamOKKLSFjUTpQIg9AdW0rRC6TM3fMH7PyDxb5OgmsWo8fkhb1A2sZjsh8W6iBpeBXtWewAE7jxVknntgX5KMVrN/I7Tq4UG9h/oK5cwXec4PxwYR9c7S/aLcH+GOGUKUjj0Mgna9Gaf8BnCXWsj8FimQpBlwNbBNA6GV6uewcTgirIMx9OUaballi8jRAhgaV0Y0yjsB6+ViDRrLYeGnUG5DRZK5Pq3j7bpQYdRwSVmil64f4at4YiDBdq9Ew1Sd2SQ6k9xNhUPeVED53oNWQzyj1CDQZcCr9+nEyoRXvgcoY9jY5eoz8s47A5HDGsqQUDEOoI7LyFv1Ht+x52Cyd9p6yOFMj5MaxsHb9k/gJiERNLp6J7mn1P8YFpE6sB6ilIMrIfnm/jo7O5Qr5/Xa4q5bbFjYImlrU/FYCmGPYcfQNFGTSyGnK/Xr6TbUPEgd73+GzU5qgbP1YQj1CdRimwEeo5g1BwComuDgJXLIPImTkBlnuQky+ezZVjzova4NNl+wo3RoBtRwRfWJk6P7UMbzyI+fCGi3NiaQmkXPZDwI5BE3oVG0aEmsJGA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR18MB4722.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(3023799007)(10067099003)(5023799004)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xlcCSd+j7jVQE81f/rqedEVeSuUoZmyjgJnMAFLhbC9qUOt3zcfBFO5k3eMU?=
 =?us-ascii?Q?9cIyeHsYrLBqUwAWyXl64eRj/0vD5DAOn3kP6OQibhbJyUhaxAVdVqLoVzXs?=
 =?us-ascii?Q?Gf9lk82TAlMjCmyU6wUKpKQnVvcl50dCNoVSiKLb6z6sZYvMBHgpLPSYDY9y?=
 =?us-ascii?Q?7Zp6hDFWLCKtiBFOFMBJb31UysmxJKwgJiOyIYk2XIxflncRsmyC+QleRq+0?=
 =?us-ascii?Q?WPVAd9NHQCIV5edqUdMoFfBrKZHp0+DGvFLn9z1EAPurC0TxShVOm6f7gtGO?=
 =?us-ascii?Q?ehFobC92TKeqG7Alu3qneFgiOIdYBXroyle/CyYHwyJBwZ6kSp8Xe/Uzeim3?=
 =?us-ascii?Q?z9JpJKDsZZGV6jyHwO7UZNVtcbJaYH6DVR4BY9GGyswGlHSQmpp+YKqaIWdr?=
 =?us-ascii?Q?LMbA4cpPJdmky6YBP0Xs3OF7KfRTJpKJc8xNwgj1sXPjXRI6YMEhtuT41gXr?=
 =?us-ascii?Q?Ln9qKUzc9oKnEiF1Xw1qLzBj0JXR9L/g/BvrSzp22uxAliIfdyI9NX5g96tM?=
 =?us-ascii?Q?scBMYauK1Il73hmRqSqbfvMkUtI3Zc6kxxyD+ORcfZU11e3Hx0057+4LOBr3?=
 =?us-ascii?Q?kWtvoYhyxzLn2iyLFXx95GlavPfon0jl0GOpWTJYtkGr4rD0TpHboF9P7Bnm?=
 =?us-ascii?Q?UjJDlwC+dakfwo6L/Hvhrxyhr4dLXLqu+voEY4qU3KkzhbuQcFqHj4BjrSNe?=
 =?us-ascii?Q?6xJcitMwdKawAQNWtvQXtqXR/6kRKXrpmviMfgSjRHIGSba5+xsvapTe2KMF?=
 =?us-ascii?Q?fbMRMSrErlx2mqxoUwauLwDksl58mi4W1NGRisD5itoHXB6OXwhso3I6Segg?=
 =?us-ascii?Q?FssrJpENHvtBgxZmsFgwOjdcWNqqWXaVpl01+8NW945wBzNhvplaDrgi48PH?=
 =?us-ascii?Q?dj7USdzUxg31hA4vpNG3jgY7IqAmu97VYI/3L2RV+akzhiJScTnBH8ijD7y3?=
 =?us-ascii?Q?cDKyQlhVq/LtQuCP4fqQOkSro08KL0DC0d+n0ywWNnuytO1qx5alBSj/whmA?=
 =?us-ascii?Q?WTwk+3Tv0PrJMsMxoZ+tITpctDX8g4xg4O3E/8V7MwAwhPHLDU59BjvhVB+V?=
 =?us-ascii?Q?RFuSpmtDof8d9LrnyHQXP40cEkPwNzjxR70qz+YpZ57lQt1KVEwM8XL7YE3w?=
 =?us-ascii?Q?N9xnn93PsqkLfDJJYmFymhnohYkYNHFW4jTxDKKzTaN6vkFpyKGjUiGfsoGy?=
 =?us-ascii?Q?0Su/ubGIzCaSeTfHA1y+o98LyTT/TKFFoyg/b49UXMO9vdp6PmzzqYsNF1Fw?=
 =?us-ascii?Q?TjWqE37g9l4T3O9FKf6L6N8D85BkJfY49BvXHgTQ9a9cbey7UFdWAREd1BXV?=
 =?us-ascii?Q?Kurli4ZQuFMUDEqfSA7sLeNbbmgaF7i4R6YtuezTzhpEMt2r7ytsqoQ2nHjW?=
 =?us-ascii?Q?eYKoG4r6RRtdH0IrHGBepbh6gxL5KMhIoYEbd3QOVWPsMdCLOKtykUseTur+?=
 =?us-ascii?Q?eBeQvahPTmQAvaCYStHZNOeVK4RXLPHNl2/hZgP7fOIWUVBpKcVS4ZPqPR8s?=
 =?us-ascii?Q?5sqaEH6sKh6bFNTDS6QWl9ZbxbWCaVYmWc9XnJw5brdiB+c1Y41q5hZBe7L+?=
 =?us-ascii?Q?SNGXcYnCTl+DBT6WKdZ5ySrWgzdgqKerJ7rD2ciO04SJH5zD700723xa0kzf?=
 =?us-ascii?Q?9yHRY8GO01X1WRsF/29kfc9yazxH3Tw+z7q0kr9VCOgHxmuYpSIQW1G7wuSH?=
 =?us-ascii?Q?ZIRzfln+NQNG1ZgRMwexBCBC8VudFiE9R2a7S1/6qmYgri06?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: y83yfV+ToLpNofbr9iLP3Spq5lD7tZR3sC2b7zUf5pUm9yrVRNbsgDVNhMte0jAk126pokU2MXYLnSGWN2EC3tA/rxCvjCnVvB2We2SqCssGp1M66Y2nkgy2zLLAutx2YKz8Aa35fudLJgjUl1HLtpun6lxFJ1VlPfjLHkbxM9EmRbijBdQ9W8sBiPn+qxAK+A96ilQanQaOtNXE1hODpiE0fqTc0CyERGia2IotnZfz4+T7HDi1G780fI+0HpRXfaqGy48SaWyfbG8BVKvoI75eWk1L8nUe89VYgCUW6Q3sJf8L7NmMriMv69tfJlqIQV3S9LVsTEHlH08u0XOwow==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4722.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 427abb5b-bd01-4ef2-c6f1-08df1c6dc35b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2026 08:03:06.3856
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6fVaEzgaFYftMRBR3oiB9nLNlvdouD4tPRMTkdhnI+xWMoKvWR2bgBeySVSus385ucrttjcPHQhPcnCJuHXznA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF5BD37EB68
X-OriginatorOrg: amazon.com

On Fri, Sep 25, 2026 at 06:13:38PM +0100, Conor Dooley wrote:
> On Fri, Sep 25, 2026 at 10:24:38AM +0000, Farber, Eliav wrote:
> > Agreed, the message failed to describe the hardware. Here it is, and v2
> > will carry it.
>
> Cool. I won't pretend to understand all of what is written here, but it
> does assuage my concern that you were coming up with compatibles for
> the 0x2c and 0x34 registers. I'm not entirely sure that a compatible
> change is the right way to communicate which aspect of the device is
> being used - typically things like this get dedicated properties because
> AFAICT from the below the hardware is the same, just the output path
> differs, something like this incomplete diff:

Agreed, a property is the right fit. v2 does that.

One compatible (amazon,al-fic) and a new optional property,
amazon,al-fic-mask, enum [info, error, fatal], default info. No
amazon,al-fic-v2 fallback: a node describes one group, and the group
reports its revision in its own control register, so the driver reads it
rather than encoding it in a string. The default keeps existing
amazon,al-fic nodes behaving as they do today.

> The fallback does worry me a little though, since it'd operate the
> instances intended to be fatal or error as info, which would probably
> cause problems? Unless each has different output ports, and it's not
> controlling a mux to a single port, and the worst outcome then would be
> that nothing would ever be reported.

Right on the second half: they are different output ports, not a mux. A
group drives exactly one of three separate outputs (info, error, fatal),
each with its own mask register and its own aggregation tree to the GIC.
The property picks which mask register the driver programs; it does not
retarget a shared port.

That is also why there is no unsafe fallback. On the classic revision the
error and fatal masks do not exist, so asking for error or fatal there is
rejected at probe against the control register rather than silently
falling back to info.

The commit message now describes the hardware and the group granularity,
and the binding gains an example.

Thanks for the review.

Eliav
