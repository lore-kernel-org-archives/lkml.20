Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B929E469828
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458948; cv=fail; b=bsAa0eFv81top9O4PzLOfetcDILJZlMxaahMZOI4QcqBTOv7Vb7QIc1mC1noufONKpdoPeyCw/aRNqaVTqRBMk917H08Zxhw7zPCvrYgE4b2jH9fMu6FVR84MvmbOH8IFh/luKglc1vIsslyal/8BecnxTqJJ2q7grrDl2ICgTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458948; c=relaxed/simple;
	bh=QboB8NJT0sENMOHFVDzayaRNtYW3Np6S2qMraRmNr48=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Stxs2MYiMM3ggepT0IXH+UvmiPxqc3gSYP5SSpEiWyJu14cRNqqZCqvhzi+FYkXfq3CWuhAaemnsAaZAuewDFGYhnv2TJflhcd55KPEwxHJnuckKHSUaRq6XXXWddVjQN0qKreOznN3gKs8qmJzTyu8eeOLhzsIcdpelCAVEEg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jl6uWgYH; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jl6uWgYH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791458947; x=1822994947;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QboB8NJT0sENMOHFVDzayaRNtYW3Np6S2qMraRmNr48=;
  b=Jl6uWgYHMsx7f9rZ2BIDiEQZ/hVrO3ORGL1zYnziOzeQrqBMfXzT6MB9
   652WG6IkdyZTr8hG4P7FxpAIrDUQVAeKRdsZIcNNGrFcbZk/eEj9eIKXW
   HBHyZFkKKtPQXKrQmYFIIcEwiG/s/j035hQy/dGH+W+kfuSvfsjoTdIhl
   dvY2sRGBuUuvg8VrpxBgPr0q9sKbQ8pGaSvSpqVsISUs3FUkdizj2eAFs
   2qslGhb6BmnAY0tiDxx2Ja7IBsAPE491Jh4KYHl0ZPgrNFhzToZ2JioPu
   vvJ0K/wza+COkJA2ypVSCZgaYWP9dpAOxBSw0WVs5mxtGgczO7hDRnYqs
   A==;
X-CSE-ConnectionGUID: cPDQB10KR7itt8pSR/I6RQ==
X-CSE-MsgGUID: hiNFAGTlQGS+T4k96xB2kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="132391"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="132391"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 04:29:07 -0700
X-CSE-ConnectionGUID: dQ5U5pFxR1+CLvL+l2HODg==
X-CSE-MsgGUID: K8wcpwlvSUqz166utMYqnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="125297"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 04:28:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 04:28:57 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 04:28:57 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.17) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 04:28:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GAWbdEpo4jtyL8jys76PZTBYxDozkXvCOrmMIqtEjo/hmGrsaDtDhXMlSyq/9c2YP9zNxnyWrJ6iB1RmnHzbVPB2j1Jmh7pB7Zl1MTtPBpG4SizzZrQcZQFFxafd2VIx1hi/koG09recgBZW1ZJZuif7SiNpiV3XzkmNDn3yJlTGGq4ipJs8k8913Pgeu1zwVwMQiw997m23FMQolLW/RlQ5qVVfP6XK5zVZbj/ArEiRzihSBE7/tcdh6vgFNhHI/KiFRmG36NwbrkXqAEKOCab9RJmihFf8GRUX+xQHBJtFoBuZNK21l8YOyJatj8X5NA4J5aYniZdEDlolGgZoOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ao7WZw2g/VPBnESeg7u201TljVSK9wVNlKSw5fC3eAk=;
 b=GMN2qacOtlznTBNhwpxYwOJbb+qwh7COEyEFCcbcSSFBSjpUbD8tpD5ZP6mIiEuaLUUFT/vgxpnjt6iOqurX+nhBO1w71S1ZRo4g9OjbernwkKQ/0UPHVz3BjksDXVWzC3xlW3HLFqux/2difLBxnsTrc2qIE19UGunoVZAH/kVbjrPrP9/O8isinFFtx0hNimali/yuE70KgKoYH3izah2oUkt928acH3kdkOBu4eTl7nQQAMrlq4cUHxxOwPv3GEivEPnrEOWoSJSUQ8eRmhJ+lNf4LYdtfOltslIJY4Tl7G7B+e5fg0qhJj50z/bJVKEvUPwXZefzImaEJZiR6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6453.namprd11.prod.outlook.com (2603:10b6:8:b6::16) by
 DS4PPFEC77118F8.namprd11.prod.outlook.com (2603:10b6:f:fc02::5e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 11:28:54 +0000
Received: from DM4PR11MB6453.namprd11.prod.outlook.com
 ([fe80::7416:2f56:a8a0:f723]) by DM4PR11MB6453.namprd11.prod.outlook.com
 ([fe80::7416:2f56:a8a0:f723%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 11:28:53 +0000
From: "Zhang, Guobin" <guobin.zhang@intel.com>
To: Aurelien Jarno <aurelien@aurel32.net>
CC: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] riscv: signal: protect regs->status RMW from concurrent
 preemption
Thread-Topic: [PATCH] riscv: signal: protect regs->status RMW from concurrent
 preemption
Thread-Index: AQHdJhkAENIlZT4JRUqEFIdoplr5DbbfAe0AgBTd8P4=
Date: Thu, 8 Oct 2026 11:28:53 +0000
Message-ID: <DM4PR11MB645348B7A1FFBD4ED9AD800883932@DM4PR11MB6453.namprd11.prod.outlook.com>
References: <20260807-vector_fpu_regs_status_rmw_fix-v1-1-0c16848b60db@intel.com>
 <arX5rpNRRk8r2Nve@aurel32.net>
In-Reply-To: <arX5rpNRRk8r2Nve@aurel32.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6453:EE_|DS4PPFEC77118F8:EE_
x-ms-office365-filtering-correlation-id: cccf7ac7-eeac-4a63-6e73-08df252f555f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|22082099003|18002099003|11063799006|4143699003|38070700021|6133799003|56012099006;
x-microsoft-antispam-message-info: J1cKMoLrXTUfZPQRIS3dL+LwiLww+cLO404B7JObfTILadtdO3HR1/w01jtgOks1X321y/JIAufbDw3Km/fEfg3uJv20AiAxDL4dwVvkuZT7PC05TqGV6KPM42TUHjEBjDoNlN9Tq6zBdBqqh6mXRZFu3leh3mr8Vt3xpxpU+5RzuP4WJNEdpNEfIZbXhIR6gX0E1IWjCTJOTkFw/LBgyp3D1UFM+GE5cFRbxYEI9D5wXMbRZOB1lTLy/KlbK5hT0LLz/MyXJ+DjU1iXR+XX8mkbH2TKOVKNmZ1iS9dZWQLnOmrJ74bHOHu+16amv0orfdbNL7KC/AsISnlPg61mp4Iv1x/g17sQ8eUYEygsdCVLGXbWP960U3arVxmzgAyMkQLX+mdRbXVBH35Ni+ZnD7zZl+2G+Dlz2RwdXp2Ice3onX64Ygxt0xN0i5JoOCvyjjOLmcMuWVNz/YHH06zDi/UzgIiwnzdBVoke9X5dW45Fe6I5ANgPmbjiiunwt6WKE++uhqRuE+gs383XSJDx2FcBPkkGmaPL6Yl1ICniSc+7bE3Cy+BZLKMrtfjrxzU0wv3DcP6WaosLQdN9YXqjSs4R6Br2Rf7EHYww10RR2LXsb/rU/LFJlxHg10lii1cwxQBjrY7o50zH9goZk3k//XL8+Q1/nJh12qIGRgL+zCmGlv8TiExh7AjezlL/o2yDFQu/S+Hr8cicY16s35B8+g6kTxhHJTo+qFC1rJs1klU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6453.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(38070700021)(6133799003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fL+y73PzjobL0BxLUCb0OJa+M10gHpe7nLOk00FmNjbDTYRWG7ZJGYBhg0nC?=
 =?us-ascii?Q?zOTbpaKw9Z5auaqTyHG/smyTGYA2bherWcKA7Z1/e/bv+uEMJn0WNppK1y7x?=
 =?us-ascii?Q?27fjqKlrZmci7tqWKxS3Kzw1cX2/h0Z6yjbkDKgvs4s92pxtBhZT94TabRpj?=
 =?us-ascii?Q?X9+DPSi7pONyDeFDvEnHuTD8YpERV9O1rNdAHbBK5l6EoJGr6kzUqvLwChTC?=
 =?us-ascii?Q?iStHMq0GBrrbeDN2aCs1uuZ2FFYjtBl8QpsQTmuVjq+F9DkqClgO5Oni/Czf?=
 =?us-ascii?Q?Au8aDRSf5Z9XwJ/LHpU8ndLZh1nV6KXPzZaklFe733L+gqwTCoJkGtOqSdFq?=
 =?us-ascii?Q?L68C7qsnhMx96EcojaD7WoaAmAE7lo5S92LkrPKJCXqWR2b7uSljqV+0wzDC?=
 =?us-ascii?Q?Ek4QCqj4dRGKoGV7qRl/jxUO7eqMoenFN1zZ6+pDDEsyrhZ04vOemCiAhaml?=
 =?us-ascii?Q?Le3c3/lEBnlURGWxKQf+W0+VA5wBj578Pc62dvLY3Dm63sswpqqMwT8L/mgU?=
 =?us-ascii?Q?ySit21jh0F0KzxB9b0e1rqQw2MdBKVWWPHxBqOqUEonrpR9G5Mi+UbseZs2s?=
 =?us-ascii?Q?NMlWx/ApkSJodwh9DlqWWy/9jZggjfhnDNwstcJNlcelcAfpycE45i+avV3r?=
 =?us-ascii?Q?07XPWhPiZPDiyz+mnVZq55dQzQRKVl/4sTvc/0OhUMtZjF2GbuWyQ8UeQ4E5?=
 =?us-ascii?Q?MRbfS6S5idol373TyZEllr8ksgYLIY5jC7hu43hTzYhGAjsUk/7plKoFg1Xr?=
 =?us-ascii?Q?ocguOYjOgNiS/ZldGrg4foemh+A9aK5m1dpldcRWfUrtzxG9yFMnhgBBKasj?=
 =?us-ascii?Q?PMZiRruZl2oHNyT8OneXf/HldfygiVOVfJGdTIaF9gcNDHx0qmmtmKTR63/m?=
 =?us-ascii?Q?YdDTvs0bLbVFxJ3g47fyIZYpxZqG1FP55j7dlu6ZHOn+ZigPhXlqw19qok2Z?=
 =?us-ascii?Q?nibiirkDvfEOM6RM0CoK2EAi5NlKttx3n3446TlmK38LDMIVeIS7FAeRG9Ua?=
 =?us-ascii?Q?gFx7TozlWWuRKroavpI0OfqOZ8LBiv26V39Xi9/rnGJBRVP+NZWA/cRjf1d/?=
 =?us-ascii?Q?6gzrE91rJSQ2HVcNF2I3+GbIXqgVHxpUG7u+cgkKQwlRHxG740RcKgfpwyMs?=
 =?us-ascii?Q?sdbWIqP9c5bISg6nxp7rQQ5sCwWUOitpKuXGUvAJOgs/VBcAaJVLBJ1Hnvab?=
 =?us-ascii?Q?BVIZwfAdJCIK3k2CK4g343J4DglHK3cmgEku+sT7xQox4YyrnLh50wzqU+3o?=
 =?us-ascii?Q?+AmOQmF5LBZFp9T/oA+s5KonG7CmqPr3TO93NsAXAIgtvBhTI55aPU0kOCwn?=
 =?us-ascii?Q?66SorjL2mhOkSyuU8ly4sUA1CGiglrkKPT/ZM4cpsbGIcLGrRJ6fyXvpopPM?=
 =?us-ascii?Q?zWXieCOLtdGZdEIUf0R9tYp/xfAu98TB/Dig83AhNUD4gQMo0IRaM84FzdIq?=
 =?us-ascii?Q?oaSoK795MEfYhUm61Ix8c6jboofjDuOyF0KPaGvp+2iCK6m3otr+0jAIDk0K?=
 =?us-ascii?Q?fWNLg+3uqyhqHik3IWRBkBPAK7Z3+sgYNiabTkC+90yYjSiAzekjm4+tbzqX?=
 =?us-ascii?Q?9YEMIUU9xb1t9yheM/djEsaIl1D2FJ9ss8nXAJbaPe3CQhsloU0s6DQT1PQE?=
 =?us-ascii?Q?U3frOIdzm2//hTQzaT0pNxdd1HRHA/nb6otfugG39McLTXE6JNFhUeyATQ45?=
 =?us-ascii?Q?bIPMCdEMnrxTXCGARvc8T3hjftoxzzx2e9ir1DWKHUfg5rE1zy6n1VqqZhhy?=
 =?us-ascii?Q?uGm2xS3kxA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: mKGH8ncbYPia0EjUbgn95vHCg/nq+5TcU2xT0183KdNRumXEGL58RDmKzdlI3JNKz1EXhcdFDU6u/39cWVeOYGeXQndo3JWvlNiUyjPRVRkR9XlnzQ57yfYIAGpjExT0UMGEG75A/OldUl6+hkclrGhNLxYYRvYJ2YUZnV1Lh5YsORzmeleyT1u3BWZckVsdNqYAu4+ONqZicixQkJk/lSwXWN99N3K5grBMcW9Hi472p8Y9kB5Pmm41G3pwkFQauTCbAk0CR0pkGPOaWl6/M4zLj3UwaEqr+p3LXEE8gSDzmi2Xa7cL1dRpz/knj16p+Jc2OAQAheSzL2IrMWAYUw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6453.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cccf7ac7-eeac-4a63-6e73-08df252f555f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 11:28:53.5704
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8IFxB1yOToSRFi+AOYYsWJEh7QNndNuk7ADBGq3yHbGo8fCpIkhw/rfneI3QYRw3Iq3zQThasI5bdPM04o8jTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFEC77118F8
X-OriginatorOrg: intel.com

On 2026-09-25, Aurelien Jarno wrote:
> As you also mention that you reproduced the issue on the Spacemit K1
> hardware, can you please tell me if the bug appeared with similar
> symptoms?

In my case, the issue manifested as a SIGILL coredump. The signal
information was:

    si_signo =3D 4 (SIGILL)
    si_code  =3D 1 (ILL_ILLOPC)

So the observed symptom was SIGILL/ILL_ILLOPC on SpacemiT K1.

Thanks,
Guobin
