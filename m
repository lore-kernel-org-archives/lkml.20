Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793673346;
	b=zHdcxIttucl03KB8uO8YJRIz9vWZKpJtfljyKQrX8rzeYHCF9Ku8HSK7UgMFK8te5g9U
	 FC8AAfS7cKsJxUPzsg0f8GdH3tMKfglrBaIU9NfW/kRlKxQnSOPHdF3qM6lCbTtiUJfRV
	 MuRC9QODKS5bLoBnEqID/MkWCUqd46dmzY0PFvpyYyuXxdp49zmrLqmoOpn4bZfWq8zEw
	 CqKXncZhOzpraue72ckv1hI1WZWI21P78CkHsI71T3z6ZY3+mmbarxoNZOkbPYQ+XIFy7
	 9HGLjo08qlZrxcOnG1oStqfL2qeIYlIjvSHiW3XPOvnzSMDZl4mSNfYGSm4pBX5FmWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793673346;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
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
	bh=JbHd5+7JWv1oWcpza7U5btVXEfVOQKgdayzJ6qpIwao=;
	b=lrBdUDwT1O/hR+yT4QJO5fItzMrFLGR+EBMTyyit/vxGAfhEN52MreHnESIZUaMU4/kk
	 JzSDVMLWxMinOdcVxr2eqf6vNuhcVhNo0eImWH77YsVcdrBma1WPo37JwSnJe8gSh7BG+
	 D6mVwOvzdh2wZvRFPl/O7AHjJ6rhzw4To7XbM1KOZzSOZG3z1Q0LX5VfGiSa8UmkcFYd5
	 3L3SdULzZU1CPCN+lARLOQc7m/ddW1F4wgC2iUIXXPQVfXeGjb6J6qlyurKrbOPvVKBoQ
	 1TtuyGQn6q7dxIinrMnLU4E/0FDE+vx9YcrqIyHJbvnzm8RWZvW2U0wXQAQBZ9RU5EQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="QoxgqM/Y";
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F718606A326;
	Tue,  3 Nov 2026 02:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F718606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QoxgqM/Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793673344; x=1825209344;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zsaZ2i28ryElvhc8ueI9YpesByU7G5brlVuzYUzT5wE=;
  b=QoxgqM/Y/DnHyM7xaEQ70b4J2r6lESqB535nt/N3/Jjj3dWUIXcWvrfN
   99To59F2WWvkCI4RGXsVfPYGeEWZjpznmg81FFle07IIDeNPmp1Jn+Ipx
   pbPZkGGzqR56Fw0fEHq8pBno3ITdOuaZ5gwc89bZVHZZp5jdO2GYKs7t1
   p0fD0OZkcMfD2u65aPFz4DSbZJbM2k2DjUk3HKhcZV93NTdRKuAPBi2SB
   WdN/lICb4Z/3eKRk+JD7Ll5El5B7YN5QaBXVPbOFtBLffEIse9JdVEYVa
   xC2gOdklqMFZwq4HJjkRUF/hUBOq53fzAvCWAzlxhk58p4yzqoFO8t465
   A==;
X-CSE-ConnectionGUID: E29TthWHQs+Vo7+l/Yk5WA==
X-CSE-MsgGUID: pOF1fv4aTF6w+qGuPOqNow==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2263849"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2263849"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 18:35:43 -0800
X-CSE-ConnectionGUID: 2tv9e+B1S0yFt3Lsah8cVA==
X-CSE-MsgGUID: kAYa8K20TmSqoHwR5hRKaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6672471"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 18:35:43 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 18:35:42 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 18:35:42 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.28) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 18:35:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VbGAaB1cVy2KcVLvDM6xiFVEDdPOT6vfgulSd7BvAwOUTIOYQJI1sSeavJm+4jR3oYTbu8PUDk/g9vtY/kVNb/U7TDE4djy3dlU6cuQGHtfaB1tvmPenDsptIml6ZbrKH3v2txxlFRQFpEuGOKGPb9MrkypoiGx7vQwwVAjuhUvp5QV93k9rkslI3So0nOaENHaql7luT3VGrUsXE41Xr8QxWVu53GT/Cw1UrCAwHD1dPUwE+4BUSHwRkbJbqS+XRLAtS4BNCDmU0YM4mFgp1kb/xi3KXhcwgO4HVuSlCShbj+vqMLUGYYMz8fnpDJyXX4QtXN4PmHK7P32srh1EXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JbHd5+7JWv1oWcpza7U5btVXEfVOQKgdayzJ6qpIwao=;
 b=RZR2S7DMnLYQl+2pWTiaOlzlx4LR+dDGKu8OgT5deO0MHz+dlWg3ojl9KCgS6PzEsgrReSGQPexKWf5e6THaqzyG3XuZrEb0NNYmh2WTBQtCPR5ZooGVFHc86eLluO0xq7f6Ejvxue2PZRPBW0lrn1nRlm9/RneifGccaQOSBZomB8Yy2s7pJU5pthgCV/eSI6cxusFLmYsW/aMvNx9uYkvYwhNNUkvLXolJYtMz0UkZqgXdseGYdB9Laqy62Huvrp/y/TXuH5mf/jXaJD0OOXhrWyO6dRMa6hg6QQCMIlAHb/C73zc6USA+Jyt8JnzzOnRfFCB6NzFhff833pi+sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by PH7PR11MB8479.namprd11.prod.outlook.com (2603:10b6:510:30c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 02:35:12 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%3]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 02:35:12 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
CC: "broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.com"
	<tiwai@suse.com>, "perex@perex.cz" <perex@perex.cz>, "amade@asmblr.net"
	<amade@asmblr.net>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "yung-chuan.liao@linux.intel.com"
	<yung-chuan.liao@linux.intel.com>, "pierre-louis.bossart@linux.dev"
	<pierre-louis.bossart@linux.dev>, "vkoul@kernel.org" <vkoul@kernel.org>,
	"Rojewski, Cezary" <cezary.rojewski@intel.com>
Subject: RE: [PATCH 3/7] soundwire: intel: Split PDIs and DAIs initialization
Thread-Topic: [PATCH 3/7] soundwire: intel: Split PDIs and DAIs initialization
Thread-Index: AQHdawR7WRSTes9JXk634JmhgG8GM7cboRbQ
Date: Tue, 3 Nov 2026 02:35:12 +0000
Message-ID: <SJ2PR11MB8424F37260E9A70E14744CC7FF692@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20261102181042.1922005-1-cezary.rojewski@intel.com>
 <20261102181042.1922005-4-cezary.rojewski@intel.com>
In-Reply-To: <20261102181042.1922005-4-cezary.rojewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|PH7PR11MB8479:EE_
x-ms-office365-filtering-correlation-id: 6e64f557-1f15-47b8-1e83-08df395315ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|6133799003|10067099003|22082099003|18002099003|261102123227099003|38070700021|56012099006|4143699003|11063799006|261022105027099003|261026121527099003|261026140227099003|261009223027099003|261028144727099003|261021121427099003|261021123027099003;
x-microsoft-antispam-message-info: lW01l8tktfJJOBk6fxV/ymS8GfE49fKInig1EH69YS9y5TA2qogH4x+VmGHUf/b0dcxiZsWWm+0uvSNI7eRa50BoLlstgZiTUODroFaVTKb4F6m1p2VyT95pllE28dOOAS6fsFmRXuz8XL7fmIQpfEF7jpIP0p0Qa4jnaKoE9Yh8snNEK07ixCL2k4SYSJAzvZvCjWlQmub9pe/4gj1P782AjdZDBZZLbaWqMK2JVM4roAfmaUY31EfIhfnERrrnmWWV1R0vhfEPyNvx2DOBXbrP0C59emGbMRaPRK/12PKG0X4PmvbEnN077Bw3+clLAAIKpK6xxmEO0TkJHFtIIk74uqFATm9r/0nWndc7Bb5kGFgMgM9G36Y+BMVkeCffvZhkxjh621ArOhJMmJG8V8RfRfSC75g58CbBbtSGZewOyvidYOhguyQQqxJf3CrznonIgzUnRMod+2clxVBLeEMQ8z8ZYo0Cq5SqfPfjJp3+RqpPz5QLhC6LgTsxkiEd4+91Dna9q/aCl289oo7AiBhQCrU3Jemv6nqvKZzrm9Gm7obduWft4IMQ4ejHBI8xNLNYzmxGjarG4BuO+FzBi4e2dyL1eSywctDn0Etmsu68U4i0l15jp4pCIu+mxquRWIybbwPB+GwdvrfWZAU/Gb5Fnz/BRlM/jokgstIKRYqvxKAjEroWpNi3BzY7H0DDpv81hkKarlYJeJJmi6epqMwJUGR0enBcOHx3+m53PYw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(6133799003)(10067099003)(22082099003)(18002099003)(261102123227099003)(38070700021)(56012099006)(4143699003)(11063799006)(261022105027099003)(261026121527099003)(261026140227099003)(261009223027099003)(261028144727099003)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VThpODxR+zPFctXkxhRWto4aLugKc02s3VbCcuO8tcp+wZ/olkxESGhyYk4C?=
 =?us-ascii?Q?XSThGFLkxTr/gAIzxSwm8Gs8T6O0G0UK/ESs7Z/oLiAGQUzdFfSbNs2uPev4?=
 =?us-ascii?Q?ZxIsY0rBN/Ofrny0ftzitnUHqqq7RcNl9xQEQVgcevUPk3V8oJNCciUpVh3r?=
 =?us-ascii?Q?3JT8TzxRje1TGelKUpGOAFS5h8HN/drsuI8u/Sdeg+i1igP49u5l6P0VQv/1?=
 =?us-ascii?Q?qNyMfVL++TTSjn8HiTMrCTr+pAnPYSvE5jALcVcooLNwI42nhsDKVhN2eUqU?=
 =?us-ascii?Q?IPkWlgqg40IJgE+LtXdZLRJNvyXuiPaA5dl6iCJzxmMVGfLU+uUaXIOp4M8M?=
 =?us-ascii?Q?vr4pbOQewNk0Ofkva9SSi3Twf3mKrd+R5H7LlfcIw1UuOBCia+0e5UHsFgfA?=
 =?us-ascii?Q?2fML28DK2AGLQhtzYMa02QYBhwZlKcvXTEFMMivZ1xkiV17dZ25EwiQFQaE7?=
 =?us-ascii?Q?pAQmrDyeho+Kk3y2YK+4UUvweX33ca9c5aO3PjG4CsdTIeoROPXDioPXBxG0?=
 =?us-ascii?Q?kfCggiIT9wF9DxrX2QqFqe+HDLa1DVgMQZpEUYGlqkeG8ta/dG/06iz9U4Nq?=
 =?us-ascii?Q?I6jmgHW07N3hvGLzYJxUNe1BwpeqqI5trQbHBUfloQP67qENSpVqRmYO1M7w?=
 =?us-ascii?Q?uS9NjeOfL3Ys1MrEcusuRyMnPPnXNcXxf4SzOXFQK3LZsiWREwwDYLtcBk+k?=
 =?us-ascii?Q?og6NwzCyQkAUDy25c97sgJjqF1Y5823Zz0c7JlPFmJreJhWiIj7u/l4eVjXW?=
 =?us-ascii?Q?WV36Y+09YQrt00Y3OYObFmQ3Rdbl7npC4/5vYA9jMet7/VYp/WlWxvdz6yDj?=
 =?us-ascii?Q?gJXnn4KhSKCbpeNB2w0spuIwZiPD8y47nK5xSczJB07ByydO5OPWoipSVybm?=
 =?us-ascii?Q?hjZ1H8RK4GRTWY1HkarQGOVfbZlYftvWfrgxM+omykZL6Kwhqz8SwD9kaQMI?=
 =?us-ascii?Q?nOzII+3EZphRd6R2IXL3eUHatUT6j+PV7MEWGWlKEmDnixFzsNTykZ8BJqkH?=
 =?us-ascii?Q?0KDztQD7zK89w3fRDLnWr5TQ/Yu+o21BRtXU1JJO4PygjFgto3R1aNGecCjt?=
 =?us-ascii?Q?XMXEZcMkR42WzXb/9WFyqVzcrXKxo+gjPXHiP/J02JDyPYDrHjBPjR7W+NoW?=
 =?us-ascii?Q?yDYTqLUIIXf5vFopMy8KtlSh/MzjSbvqGF2RV2XGSzGCh+dhlSZQ/5IzO+Dh?=
 =?us-ascii?Q?wN9dKg0tKJNmIpiIFeTlejnpWkIZ9LSDe2XbH5MZw9empqweWGniRLDKSe+c?=
 =?us-ascii?Q?A4KpTCz8cLqVHq0m0T1fYa+Zp60c9pWL/uyJu5O1ezWyjxLRxTQo4Q5AeNff?=
 =?us-ascii?Q?VEiS9Zb2ZW7d+Jbf3JMYySvxXKs8fmMRz5v/gveonHJoTvFyXbmhfwzXKHCs?=
 =?us-ascii?Q?sPyOOmgy323o82xqst/w9W03m9BqYbnoGixX9d0zBaFn48SruKdU4733HgYD?=
 =?us-ascii?Q?51XcRilr3CDp3fScOTXgu7M/bfjM210M+ec4roibSC8KGhSLW19I8qX5nfCj?=
 =?us-ascii?Q?Lq0oiMEQgF+9f/LQI/mTTHxlgL7Vh7/J1G2yCDSs5LG/tVIEtsSYMtRkGGjM?=
 =?us-ascii?Q?hEguET7EIjMlpDZXgQFPPRjQUgNzET80mo/HQHxGNXITPvSyKBqIVACQ35LA?=
 =?us-ascii?Q?TgUyu0nq7vDKGRVz3OHLopAirLcAvc6MzboUyqrZbZExT5QwJfePoKErPzez?=
 =?us-ascii?Q?Nd6G0a62HfzZ2duHGwZx+Uitm4xpiT//7rJDF8QIHIUSOX0f?=
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
X-Exchange-RoutingPolicyChecked: jVHu+WI2xt+/MSYDFBNANxKr5tVPOWFKxF3odf/fA8LFbPWv07P7iSLflFkxgTfMqwEL9zI8eHgjVX7Hw0px42ty2YbBKrnIkC52yhHC6wMbsC+nuENmeMHyMnr7xysWICP3VvaAPt0rW/+SNFNxnXGwqpbBV/WR5bjh7Dcjq29/ICLedTqrKEPJPbMEVN92k7LLdHtPy6TJ7832uqT+zFlAQYiTNRtgsVKL3LlSmrA1OMx8ErFqffZDT3K+TTpj6OCz1L/tKkpq1MJ3Nog/YVhb4QqOF/t4V2c51M3J+l/fg7uEZkQ0LtimwuJriSerCq15yM8NMJH/JAFyfQaJ+g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e64f557-1f15-47b8-1e83-08df395315ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 02:35:12.2286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rpX4+bGFHKUwY0jv0hA0tD+eqJjEZKgDk2nIZdzC6CD9n3RnWBoEIiaU/Iir40smS1ibNfHge/d39ZQvef17qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8479
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Cezary Rojewski <cezary.rojewski@intel.com>
> Sent: Tuesday, November 3, 2026 2:11 AM
> To: linux-sound@vger.kernel.org
> Cc: broonie@kernel.org; tiwai@suse.com; perex@perex.cz; amade@asmblr.net;
> linux-kernel@vger.kernel.org; yung-chuan.liao@linux.intel.com; pierre-
> louis.bossart@linux.dev; vkoul@kernel.org; Rojewski, Cezary
> <cezary.rojewski@intel.com>
> Subject: [PATCH 3/7] soundwire: intel: Split PDIs and DAIs initialization
>=20
> Not every client of the soundwire-driver needs the secondary
> soc-component and full range of DAIs immediately when initializing the
> device. As function intel_register_dai() does all of that on top of
> initializing PDIs, split it into two logical blocks to accommodate for
> both approaches. In consequence, register_dai() callback becomes
> optional.
>=20
> To keep things in status quo for existing users, update
> intel_link_startup() to call sdw_intel_init_pdis().
>=20
> Cc: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  drivers/soundwire/intel.c           | 24 +++++++++++++++---------
>  drivers/soundwire/intel.h           |  3 ++-
>  drivers/soundwire/intel_auxdevice.c |  4 ++++
>  3 files changed, 21 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index d53fa3d299bc..708503373183 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -1027,23 +1027,29 @@ static int intel_create_dai(struct sdw_cdns *cdns=
,
>  	return 0;
>  }
>=20
> +int sdw_intel_init_pdis(struct sdw_intel *sdw)
> +{
> +	struct sdw_cdns_stream_config config;
> +	int ret;
> +
> +	/* Read the PDI config and initialize cadence PDI */
> +	intel_pdi_init(sdw, &config);
> +	ret =3D sdw_cdns_pdi_init(&sdw->cdns, config);
> +	if (ret)
> +		return ret;
> +
> +	intel_pdi_stream_ch_update(sdw, &sdw->cdns.pcm);
> +	return 0;
> +}
> +
>  static int intel_register_dai(struct sdw_intel *sdw)
>  {
>  	struct sdw_cdns_dai_runtime **dai_runtime_array;
> -	struct sdw_cdns_stream_config config;
>  	struct sdw_cdns *cdns =3D &sdw->cdns;
>  	struct sdw_cdns_streams *stream;
>  	struct snd_soc_dai_driver *dais;
>  	int num_dai, ret, off =3D 0;
>=20
> -	/* Read the PDI config and initialize cadence PDI */
> -	intel_pdi_init(sdw, &config);
> -	ret =3D sdw_cdns_pdi_init(cdns, config);
> -	if (ret)
> -		return ret;
> -
> -	intel_pdi_stream_ch_update(sdw, &sdw->cdns.pcm);
> -
>  	/* DAIs are created based on total number of PDIs supported */
>  	num_dai =3D cdns->pcm.num_pdi;
>=20
> diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
> index 7a2e7e73ad63..12416cef8224 100644
> --- a/drivers/soundwire/intel.h
> +++ b/drivers/soundwire/intel.h
> @@ -158,7 +158,7 @@ static inline int sdw_intel_register_dai(struct sdw_i=
ntel
> *sdw)
>  {
>  	if (SDW_INTEL_CHECK_OPS(sdw, register_dai))
>  		return SDW_INTEL_OPS(sdw, register_dai)(sdw);
> -	return -ENOTSUPP;
> +	return 0;
>  }
>=20
>  static inline void sdw_intel_check_clock_stop(struct sdw_intel *sdw)
> @@ -262,6 +262,7 @@ int intel_start_bus_after_reset(struct sdw_intel *sdw=
);
>  void intel_check_clock_stop(struct sdw_intel *sdw);
>  int intel_start_bus_after_clock_stop(struct sdw_intel *sdw);
>  int intel_stop_bus(struct sdw_intel *sdw, bool clock_stop, bool wake_ena=
ble);
> +int sdw_intel_init_pdis(struct sdw_intel *sdw);
>=20
>  /* common bank switch routines */
>  int intel_pre_bank_switch(struct sdw_intel *sdw);
> diff --git a/drivers/soundwire/intel_auxdevice.c
> b/drivers/soundwire/intel_auxdevice.c
> index 5983fbc5725a..114dadedfa14 100644
> --- a/drivers/soundwire/intel_auxdevice.c
> +++ b/drivers/soundwire/intel_auxdevice.c
> @@ -423,6 +423,10 @@ int intel_link_startup(struct auxiliary_device *auxd=
ev)
>  	if (ret)
>  		goto err_init;
>=20
> +	ret =3D sdw_intel_init_pdis(sdw);

intel_link_startup will be called by all Intel platforms, but the PDI
initialization are different for the ACE2+ platforms. Please call
sdw_intel_init_pdi in one of the sdw_intel_hw_ops ops.

> +	if (ret)
> +		goto err_init;

This is after sdw_intel_link_power_up(), please goto err_power_up

> +
>  	/* Register DAIs */
>  	ret =3D sdw_intel_register_dai(sdw);
>  	if (ret) {
> --
> 2.34.1
>=20

