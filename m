Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3185293EC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689974; cv=fail; b=BuP93FOENmEOriTy3CSsq0xpD3HPPZH1i1FjE9zcEwm1dYWkHgORrs6Bq4nfYASmN2XigtBBit1+i0BlScvll94nMwBxm5R6cOcpX+WvkvR9vmjc4PnE2u8ct2RrMk5k6vFDDW09EfESsoFyZX94g6SqjcSZqyxT7rDuL1E1f7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689974; c=relaxed/simple;
	bh=nbue0Fneu3CtvWeecZNVr1ZJ2BFNjTAzgiEr1g2iTKM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jMobYJ8evqu1h3wJ7wLUxrMs0DK8/B7a1LZmIkD0jgUULmieUwYP8UsU68KvFlLxn6PyaKrP4l36LbeEMX3H9+1ZLKVxbqoV+m5FqvcA1SgoPpUfCWdgNq310GlzW7l3+e5vdBRgqtbstoJXjGZvBcl7bqZ7PKzGZW+iv3viIHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WbooHIcl; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WbooHIcl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790689971; x=1822225971;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nbue0Fneu3CtvWeecZNVr1ZJ2BFNjTAzgiEr1g2iTKM=;
  b=WbooHIclYAF2MH7AgFruXOiV8Y9LtefVfww6rP+tOoygDK9mYWutDVV2
   T6eH1zou+Y71o8wa/pgSojN4lU6769PeL+gJO3+1gEUCifnndsLtDJujQ
   4tszXUzVWjdAtJC88mhR1db5qoaf8dxkHxkmvzr4PPBG9Lc+ivCuAnzsa
   hzEc0Mpxq9Y+KQyZ0NcoEv15kIEyzvXrlSBA0V37I5dSYOfY+KLfn7sHu
   g1u1pAsxLfIKjaTxKi6mRpjj8ILh4jQLuTgZmA3h026sVY+F8+nBLKLWE
   mip4SoDgJ2vm47ped3E7tP54M4H6gz+uFQPHymbWllUzB5oP5ATTQdU3y
   w==;
X-CSE-ConnectionGUID: tnjbSiVCRLmF7hSoeDtskQ==
X-CSE-MsgGUID: PbKwDG0MREOdB9qOUMM/xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="107793835"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="107793835"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 06:52:51 -0700
X-CSE-ConnectionGUID: P8YZhwIgRtqwMovhv7vK2Q==
X-CSE-MsgGUID: TrM9TOC0TYaJ6CGWLD7lXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="275408432"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 06:52:50 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 06:52:50 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 06:52:50 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 06:52:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aspyd0/CtaS9PZvNsSX9bNoorUlwBQPB1wb3uWkLOXBVRvHmm+Vv2IfqafewcvoWJ2+9INArcSwhQgsdeonTFrxKdfykn/ZvCTptotum1L6xpkHLfN59IKVaQ5d4U987X+Z8XTNo8oNVLxxILfMIHA+n/pPFUhuttAvsNz8GsW86nz/azxnqgMpTVOe9L89aHoFIoan+mxobMhg5AGisgf66NQhjz24Cu3z2wLeyVzBZAxMOIrdbMmo1HU7lpsSKLqezzv5QglJmn4MInU4v27h0pYXrq6bgkrrUGjE0SJUqzurZUZW+XxTFe5Gu7FOxGYzeZxQwCFNfrTEVmLdRoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbue0Fneu3CtvWeecZNVr1ZJ2BFNjTAzgiEr1g2iTKM=;
 b=B1xzrOaJNbZvFpod0srMcDa/fESdPBdvTpkWWVfCfsyegt6ytUKEU3iCl1s2kwIAIS4QAE/2+Kw/Ta5BwH/H0p06b3d5nwltV8kCYXR+09wFwa2MAWzEeoeBqKR+Lb+LOrZCFivLC9IQqypRDzgEMm5mQNfjhxoQEuSZHPslZb2vmxBAwgTs0WBxde9B1tpOr+GBmtZgLinUy1xOUhyp3cKKrkbiW/Jx/79/uCSX31qux83vAEh1kJ35FxowmrOut8wmx6C6BMGj7cA7x6T3cUZq4VdalZhTGvRAOgB69KY4Xw5Nl6Mq/YKdAqrRNxiLJzHnoU6O6az2Djobbx/XkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6824.namprd11.prod.outlook.com (2603:10b6:806:29e::8)
 by DM6PR11MB4690.namprd11.prod.outlook.com (2603:10b6:5:2ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 13:52:47 +0000
Received: from SA1PR11MB6824.namprd11.prod.outlook.com
 ([fe80::e9b0:be93:d665:7096]) by SA1PR11MB6824.namprd11.prod.outlook.com
 ([fe80::e9b0:be93:d665:7096%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 13:52:46 +0000
From: "Deng, Pan" <pan.deng@intel.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
CC: Pedro Falcato <pfalcato@suse.de>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "liam@infradead.org" <liam@infradead.org>,
	"vbabka@kernel.org" <vbabka@kernel.org>, "jannh@google.com"
	<jannh@google.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Li, Tianyou"
	<tianyou.li@intel.com>, "Guo, Wangyang" <wangyang.guo@intel.com>, "Zhou,
 Zhiguo" <zhiguo.zhou@intel.com>, Tim Chen <tim.c.chen@linux.intel.com>
Subject: RE: [PATCH] mm/vma: avoid redundant file rmap tree re-insert on
 new_below=0 split
Thread-Topic: [PATCH] mm/vma: avoid redundant file rmap tree re-insert on
 new_below=0 split
Thread-Index: AQHdTQJ2IWgb0v7YE0+qNmQ/GCpDurbfbz2AgAAHEACABJzHcIAACOaAgAF73mA=
Date: Tue, 29 Sep 2026 13:52:46 +0000
Message-ID: <SA1PR11MB682442BFF6B76F68ED38BAED968C2@SA1PR11MB6824.namprd11.prod.outlook.com>
References: <20260924054301.2330822-1-pan.deng@intel.com>
 <araI4WsI0XMXOR10@gremlin> <araVBBBVY-jafePL@pedro-suse.tail5790ac.ts.net>
 <arab1d8-4b3SzoI6@gremlin>
 <PH8PR11MB68327CAD97AC4E0B161BB997968D2@PH8PR11MB6832.namprd11.prod.outlook.com>
 <arp_gP_o9eacNXre@gremlin>
In-Reply-To: <arp_gP_o9eacNXre@gremlin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6824:EE_|DM6PR11MB4690:EE_
x-ms-office365-filtering-correlation-id: 3ae62d47-fc5c-4e08-6dff-08df1e30f185
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 3gq1sPPNM0n91Gsl2P8imSf7SCRA/k3oQTRsrDLSX8IKOulnt7fSZ+ssoTNpP8kVB8lAturOH/vO0pGNrQa6qV5pexoWHceAxpwCCVD6J/qMLXtR/vzWwGJaDD46d9wye0csuB5nbXCfNYLsm5pUmjdlGWh5nU5i6lmBtVfmDhQDv0RWX13BKsELS7u2n9mwUDOnmsPsN2yKXV6K5hdJwb6JvFEWY4Hnmg2PAYBBRiFJJHJLTVk+svDY6N0KYOtP1E0ROIe6Iimk4tmQLo+bptut/oRBN8jRqGaW3LbqRTmGYw53bUZ92REKyZlF3kwpvakFaPso5163bkqDLZwYGYEaqCp9F4QGco73zNKhoN0HD0dOvw9KErTWOTvFpRyCz+IyAY2wPobOB0M2EW32gTSekK0UmXgmRvslIumQqppUak3if0usW1E0+6dS+ysW6wcWUy33EFR9EHzVjSYeEHstab/trnR6iKWPwBJ4zBUVxggF6I8bEc0+RbCS9qanPhY4s+xStRYWBujjGptQKm8D2jvPCOgczXeEDiXbuMn3jBI84jbZjhNJb1tFkLCVYOYzrBxu4b0vflu5RYIaabM9vDQIqECk23TEFwdb3CsMaHVHfHXtigQ45bomV4i5amN1aG2FR30DhJEDBwYmLBh75r3anE3+8v1stz9itZgUBJq9FYfDScMA4JTWWTNGkT2M3HoenCP0mWLCeBPjXM2S061tyL9FE7qrpxAeffE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?voDMh8qPgRpzvWtI8gBJ1iNnMQL8PMMyxaGx3On201ldFzok71pufIKh+DrY?=
 =?us-ascii?Q?ZdxspS8RmFgCy+1uZGAxw3E0inOePw5SDgATvwmLOlcsg0avVwSQ19Pm+wtc?=
 =?us-ascii?Q?6OsCUDOz5xWvKYtMiMnkM1XrV5+2OLQc5ViYAlvOO0ox0wrZ7aY46eQtdp4R?=
 =?us-ascii?Q?pGp7iwq0rqNAy62EN3vffxpkpQr6cIJ9OZlNTRjkPHJ20s3OqhYPW8BG8tAm?=
 =?us-ascii?Q?ypsUWHEUhyLZCXFzTvZl2qoUVhFiliMGU8uvmC7FWxnOhV2QcBwAc559YToW?=
 =?us-ascii?Q?LePYB3HEZ1G3qm5Nsay+/YrN4G5+1JCsMMThaYqSgcDK5Ppebg23CTqY+L95?=
 =?us-ascii?Q?1fMythHVyj9c1a4li4xRkcdNrwlUJRvs019E2Zvbojh8tQEjZJeUbRImiVMG?=
 =?us-ascii?Q?iEECgrGYvbL0EtGyOQdR8QZxQbPqgHHGh8LwYgLcciwxbxC1czy1D//usn/G?=
 =?us-ascii?Q?6yQbwkOc9mrK+De2yROr5ufnjXfDvFRqxhwVKSbqqLW/2ni9WgOPflyJSTKo?=
 =?us-ascii?Q?XclAUYa4N5lzmaq/5UVLD74f8QFdhAN6CjdaQSppXXOlMQ7uL5F1Mt4FnWpN?=
 =?us-ascii?Q?ykVS0VLWLEW6PkGRkl4HLZ30z49kdGqX07nlgFak9PnMDBvs6Rj2ueeqxeNm?=
 =?us-ascii?Q?QGK2CAtrj3w+yo7JeZZ3WP98f1QBBTTfoa9YMKBD1jieW5el7sWKJzb8Ityc?=
 =?us-ascii?Q?+onEQX5ED114WNoo9dNZZ72MqnnfcQXV6hjhNzxT31JFHmcQlb8oN0a9Nr4k?=
 =?us-ascii?Q?+181/oAM7aNqqzKgCqy7sHiYzFbSefcySUTXr56HI75zdILm1pCKqSRNBj37?=
 =?us-ascii?Q?+dF6vFr6ZJa8+dru0QHiU662Eh8OSdhIP94B1WltrHDottL+ZkniNMlukizs?=
 =?us-ascii?Q?gD/KbS37CqriHb95VDFfHIZH+2LQrb+eulb4Gufu+TNZUBFExOYREAFGQYpF?=
 =?us-ascii?Q?kGnn6gSDTkl3oV9h6dMW+ITnnGhzf4cxX2R6/51+FWT+1ZxyNYTNqblGT/3M?=
 =?us-ascii?Q?4TvgvyJxHCHWdXhjRfnQ8P4l7FDtR98JV8duot/24IWAyEDd+scA5B7zMBB+?=
 =?us-ascii?Q?wWl1eJlBl7hnkb6i0DV1hvfuI23PQzwc8zkgLfStpuEZlhssEhIg7jduaTnv?=
 =?us-ascii?Q?Ka9wtCB826EEVdcEqJJeXWR6H/n2e8SaH7aoSS3sfTgJIqkVrJ8CNtbiJTYb?=
 =?us-ascii?Q?lEOh8XCATJZNxNiQSodDkTP64+T5rvZDV94NnGb+kQcjToZ7bEmRsDq/9UzA?=
 =?us-ascii?Q?aUhLmobI7zTJX7x+knsuUr3oAAJ8vT1Hvhr1pOw0En2wvFdcKAv0hUCXSIaU?=
 =?us-ascii?Q?ud2gghWULzu4Dam3pjjxEBK5wI8fkl0Mj6XfIJo+waOt4mJBzHjKwENF5x4u?=
 =?us-ascii?Q?x9r+N9Pon4wAIcBaazbbQjpymrPBw4COZw3tVmQdi+nmo+eyKqTwsRRc9nW7?=
 =?us-ascii?Q?9plgutvAfgTakzY64n0wSRn8PUZGzrQnXlFhfgbhAq1SWJpwqfePCmx/IsdI?=
 =?us-ascii?Q?sGdkQp6Do9Ocpil49tvY1kHTI+7iWzZOfm1vCMNalYZtza4YrWWmlxpeK/aM?=
 =?us-ascii?Q?OGS1r9IbR34zwPGP5Ti85rjQC7BCPuUw4xNzrN7Dt+RM5WeDNr0XRr2vjSto?=
 =?us-ascii?Q?XERvuf+dYIz4WWL73tte7MUuLkh9chllSjKZTkmsQeWISUIXveEuUj+hnh/b?=
 =?us-ascii?Q?22UATvcd3iD8IGPFKD9Fd3mh7We3zGU/HK0Eu0LLFpC1b0bK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LgA71e5u+M/HJhsk9heijEtwE2uisTz2TwAhppQ0ih1HJjr+om2mzpinXLqTRjJ5Q0eXo0h22yf9ag92PrRNnIb5KbqGpQJxIFZvseLEvTnuZEnfxJ6tYf1Yk1FIL2WX9v/14gLHAKYM8G+RdX3Y60tGXLhLF1HyItHUOLf9SIcumuhvSwvudxZ/pvSetz6MW/vv07dc0MZitHdRDBcJE+93XLW+Ppk3obT5LiEmJMpv0zevOlybhB28d/8yCokj5UJZS4ygWM0GRLL55YIGeCWSlG1bZgYojPtZFvfjTOqxobc527gVa72Nz16jBOD9vcqnmGxseJ5rjsVM9r8JLw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae62d47-fc5c-4e08-6dff-08df1e30f185
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 13:52:46.8587
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NDezEhTD+QvWJD4HYGyp+y4JkmEhvFZbrzyZKa4L1J7oUx+GXOnKXjKZ1WON+HpQCwOY39NGTiCeCZHwropuiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4690
X-OriginatorOrg: intel.com

> >
> > I just saw Lorenzo has picked over this work in
> https://lore.kernel.org/all/20260925-speed-up-inplace-rmap-v1-1-
> babc48ce7c83@kernel.org/. I've read through the new patch, which extends
> the scope to anonymous and covers merge and shrink scenario, more
> complete than I just sent, it is great. I fully agree that it is a very s=
ubtle and
> fragile part of the kernel, I did spend time and struggled with the patch=
, very
> appreciate your help.
>=20
> Thanks :) and thank you for your understanding.
>=20
> If you are able to test that locally with whatever workloads you've been =
using
> and report back there that'd be helpful? Thanks.

Reported back in that thread.=20

> >
> > One last thing, and please read it as a question rather than a request.=
 I read
> submitting-patches.rst, and it says "Reported-by" tag is intended for bug=
s.
> While I wasn't reporting a bug, so would you consider "Suggested-by" inst=
ead
> (or even "co-developed-by") if you feel that describes it better? I'm fin=
e with
> which tag you think is accurate, and I'm not trying to reopen the decisio=
n to
> take the work over. Again, very appreciate your review and looking forwar=
d to
> your help in the future.
>=20
> Yeah it's not quite the right match, but often the resultant final patch =
is
> quite substantially different than that submitted, and Suggested-by gener=
ally
> implies:
>=20
> Person X: 'hey I want to do ...'
> Person Y: 'have you thought of doing it using <great idea>'
> Person X: 'oh yeah great thanks will respin with that!'
>=20
> Whereas in this case where it seems it's end-to-end LLM, none of that rea=
lly
> matches.

Oh, it is not end-to-end LLM, actually a lot of human intelligence is invol=
ved :)

> And if any tags are to be given then Reported-by, Closes is closest.
>=20
> However, since you're explicitly asking for it and the idea itself is nic=
e, I'll
> ask Andrew to switch it out :)

Thanks a lot!

> (One small note - please wrap your lines to ~75 chars in emails makes lif=
e
> easier!)

Got it, will do!

Best Regards
