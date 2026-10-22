Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792663373;
	b=lFgPsBHX0VrghBiIKsXX+ECsUTIFc7j2N5rqjLof0QMHtfZH12uhMQomjn8mn5rwZfaW
	 kRUapogXZsu+TDnzM83o6dbBVqycl9qkOQQa8rQs4+CDmswTaZMgjjdtvadAN5Tha4mDh
	 hcZGabpORSsQi3S2r5moem9stsc96b0An6DDDyvvJCcvLb3j7amvMuug02iBAvKJjrF5z
	 sDoJOEBJQ4LuVfu5WoH7FcnFlwi3cew5ckD8i/SkXTXIHM2SrJfRVIGw+qOFG+68X5e/n
	 eXA1ad2p7PMtZfg3cWT+/YKzrufPfs1xIokpbBkG3S5OH4h/Q/rvNVu73wjeSJ81U7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663373;
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
	bh=Vslfzzzn+CFZR+Cbhvz3Rjn4uKc+tfYImknFtNFzxrE=;
	b=z6C4lFj21mmzs94BzaS4j4AgcIUQp5qW8tT9NNgj6IReiTFuwbqos/609PJeFC35NhgK
	 B/kT3Ouu+eHf16I+52TxPfsPTiEeQIc6PIBKMzHP3P/RbJ41Zh0958Yb7uEbhFCYuuZfF
	 5qmhivQqafB5mZ7XiZ3aIMP5sOVrpMqiQaSDkcBa65TG8seoWSb7FkM9bcpzQBovxylTz
	 sQNnfp/rJ/t5xwp7T95MZy/Ct7jhV1cIe32t+esdYr280d0ry2t+JRZPfotF/y84tPCnu
	 521flLAE3tOuHOyZB3ULBOa2TawvMtHEYC7ihT/nnGbZMgmOuA29BzBBKByXvZlcngA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KskxoVYV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE05606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DE05606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KskxoVYV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792663373; x=1824199373;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Vslfzzzn+CFZR+Cbhvz3Rjn4uKc+tfYImknFtNFzxrE=;
  b=KskxoVYVchbkxr82lQQL4SrMuk+3lKlLpoLusc6JIvn1xnZlm6Ll7NQY
   1Jpk61zc1yg5+vHWWSVgzwhMVXtLoKL1rs4hTLGqJC+THQk6We2PSta3q
   7c7xn6Q2o3ysB/lMczkbXCn+HE6LyM1MD3LHf9Te+R9gpNIJQ20yxFRUO
   o0dApmAI31hIXTRx949dT8idG7y5jq0wCV5EoAh+JxrIG0s4fI+lv+vP1
   3RYAgaK1dRfXdHUaDgR0gb6UcCyVDnW2z15/4QaAubzE9w1z1H8+GOlkv
   1wn88eLh8oQ+pNWFRee6QCASHm/EVmZSMvI0eLXcbAjCju8qgZtHBN/TZ
   Q==;
X-CSE-ConnectionGUID: MNHjAO5iTDC7ghVS9jYCXA==
X-CSE-MsgGUID: 8+L9mgBESqyBn8ENIx+Jxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1296810"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1296810"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 03:02:52 -0700
X-CSE-ConnectionGUID: XaAFDzCVRd2WkMdz+ZPJ0A==
X-CSE-MsgGUID: JDPNYpWxQ8COpXLkKM7QTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3683631"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 03:02:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 03:02:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 03:02:51 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.4) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 03:02:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HnrvHu8mM0w/ERfIvGo3tn6YxnIyBCpxSaVsgu2iiCypRL/i8DIhdMFmbmd8RWS+FupLQbT/Zsm+t8+3hAWh1C7zFn/lmrL72Fpmfz0hZMmyqaOks3O41UT11W2N3tcV5e/d0tC3s4aSXO1ayWI5q24cvPfORIkQJQMqIZPd+5HUjQJj0dQ9rWRSLMA9zrYJgSNk2SazoO4w4U4Svzf5+GiNkjGEKJneJwTPtrRtkPyaPUQ2nxsuHqYnkBtYEm2Gl1OIfu0bxGMkNBm9lwVmCT/Lc3mrzQSOVWoRRURmxQkn4Gz9QGINxVdWDq8UtFg6CvxYz0yXHZ1u45rfhlyYmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vslfzzzn+CFZR+Cbhvz3Rjn4uKc+tfYImknFtNFzxrE=;
 b=CG+JIAqmQjscT2RdKnRY2MnC9EP4Y+mTES+5iw2GZ9Z5qxWVjfu/mR3ggcYI5+F6aymP/X4bXuQPujXzE9+l7sLSpsisLAEGY4NFM7v+ZR1ihxCFBRVlrxOq/gLVupcrTPgvCsGH2I+skQYpIhf55maC7y8l8efD3SlHXBlraW9hW3oxRb0/RfGS6QmudwDJtE/HsxD9lAH7U+MfBssX2K0rIB1y3d0m0N0F4C9XqhejPQhnM6ys5tpWyc8l+nsLdCAg6ZQbJ2Ez9CmdNoXqb3cjXeDxdpxT69U+bt3P2rAUL9N978lyzDwpBwxGx/Mh9uRiLTHzV+Mxj2dXpD2jZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPFE241D7F14.namprd11.prod.outlook.com
 (2603:10b6:518:1::d57) by DS7PR11MB7781.namprd11.prod.outlook.com
 (2603:10b6:8:e1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 10:02:40 +0000
Received: from PH3PPFE241D7F14.namprd11.prod.outlook.com
 ([fe80::e459:ea7c:45a:2ad3]) by PH3PPFE241D7F14.namprd11.prod.outlook.com
 ([fe80::e459:ea7c:45a:2ad3%4]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 10:02:40 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: David Laight <david.laight.linux@gmail.com>, Arnd Bergmann
	<arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Vitaly
 Lubart" <lubvital@gmail.com>, Karol Wachowski
	<karol.wachowski@linux.intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] issei: INTEL_SSEI should depend on X86
Thread-Topic: [PATCH] issei: INTEL_SSEI should depend on X86
Thread-Index: AQHdJYiVaJdWcRApYkq6Q2Y30S7BBbawKfAAgABSQICAATamAIAGrFYAgAAXXiCATGZlEIAByRYAgAA1msA=
Date: Thu, 22 Oct 2026 10:02:40 +0000
Message-ID: <PH3PPFE241D7F1431DFF972D42810194E50ED652@PH3PPFE241D7F14.namprd11.prod.outlook.com>
References: <7145ead76cf7cf399eb4e1e6039f51cae07b49b4.1786009079.git.geert+renesas@glider.be>
 <20260826100848.12eaf40e@pumpkin>
 <CAMuHMdWDcfrUM4tKGOO3fHJQ3FnYBu-tPG61BY_069Yv_TxXKw@mail.gmail.com>
 <20260827093502.23b6b062@pumpkin>
 <CAMuHMdVWvezFSy3y8mwQvTxxp0C-Pr3YuSEuHGm4P+7kR80+nA@mail.gmail.com>
 <CY5PR11MB6366EC84A3D4511C5217A1EDEDA92@CY5PR11MB6366.namprd11.prod.outlook.com>
 <PH3PPFE241D7F1486A6B879134C0FE43F3FED982@PH3PPFE241D7F14.namprd11.prod.outlook.com>
 <CAMuHMdUr7_460y_h+BfDeYAFx7iC_wkFKT1U-BMAOOdivpcUBw@mail.gmail.com>
In-Reply-To: <CAMuHMdUr7_460y_h+BfDeYAFx7iC_wkFKT1U-BMAOOdivpcUBw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPFE241D7F14:EE_|DS7PR11MB7781:EE_
x-ms-office365-filtering-correlation-id: a863dcb2-83e3-41bd-65a5-08df30239ba7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|22082099003|18002099003|261009223027099003|4143699003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info: 7hNbaTxIzkq2w/zF0J/YoQ2NXp21DRdjzemGBv6dFsJl1UI/YK69CD33mdt5+037b3lGyvPs97Py2Sfv5H01WzSsUA91Vxl66TAZPzD0foHwqeEx/V5QP8Z3yZgc0AqHLpi5DqiOXTvh1xUJBTEkBWJ2j0XhPW4fl5q8Z9NqIy4+Jwxn8JRz6QkUtW5cjSjvMMjhR8icsSRKYpyKTh3CVOJqIozMNzFj1uHY7Kkl4hyUz+Gw9GMH8YoBOF/ClbhKljY0+xehbpb7Of+r0DfrIyU9HAlNjN15amkygZS2p1SOFruQmjNVf5FEWECaMsFqufJO+fa2Pu6o4U3oWVe5YNH15U1hQu+3KU9BlCRBzpvj2ZoVaReJDbsPhfk27tho9sWhqJ4Duc0iY1attl+b9fXXaFzBZCD+M7o3cVLpzZkrw1aXSNfwIwUUNSY53CsWqG2NL4ckeXp+ZH1TTzCbFOzXFarlyxcIRulmgQcCwjRHNt8orNIMUCERPLKVr80M6qCMCAqvF0kppWpIwJJ/3uFyYvsEHQhSmPOD3stsCxtHRaygo3IUzJ4/Fn0lvqW6EqUEBZ2KN5E80FDLvJF79DvDoLreloUDhI8Y+h8JlaZ9V94iX+XF4we/YoqMcFwBS4qt/is6KkglV2fXUjY0P49qfTmW+8tpo+tmLlI8Fv2AVZtg7aENA1f1B1Z0sgJBaj2mFv0TZnvqRBwSM/l+a8YxuBpV3AiwXeeMtQsLuTc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFE241D7F14.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(22082099003)(18002099003)(261009223027099003)(4143699003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2JDVG1la09xbC8yemhFcGd1WXJ5YnphQlhJd1lFRWFOS2xFWjNGcVhpdjVI?=
 =?utf-8?B?ZXJ4d1VvM2EveUVKakV2KzYrV1g2eTkvWTFYalBlVGZtU1FRc0E3ZjFtR2Ni?=
 =?utf-8?B?QTJwczIvTXhOQ2dDSi9vNWF6YjB3SzdvZFJJRDl0OW52NU91SXhTNjFIdGZu?=
 =?utf-8?B?VWRPMDJUVFIvUm9aUnNLSnFZVjBEdUdjZStuaFU0elB4dEZiVG9IRS94QzBi?=
 =?utf-8?B?NmRhdS8xeitqK2VwcURBYys4TE9uNmRPbWVPSEpETHhCemVLNEFzM0hNVkhQ?=
 =?utf-8?B?QzJ4Ny9yaklTMjI4U00yUkVDOVZlc01SOWYza09qZEVsczEzUnI2a2hpUlE3?=
 =?utf-8?B?RDJKS0NlbFJkWml1Skd5V0U0eWlGeWhLNEtBTHNaS0ZDVW1KYkJRUVVWQkNK?=
 =?utf-8?B?RFRJamdBSFJrR0lxOFVIbTdoQTN0Tlhpb0tHQkVyWmhDQllUYWFHSnJjUzk5?=
 =?utf-8?B?TE9QR3BOMENYcllnbUtENjlUK0hWR1gweEl1ZHJqdEsrcVhta2R0Z21SU00w?=
 =?utf-8?B?MGZNcDNtMHBEM2VJYURjekppT2RhKzdLNW5NeEhxWWZzK0xNclc3Zk1yZHJT?=
 =?utf-8?B?N3lQYWNuTEZwVHJlR1FqQkFELzRHOXRvbWtnTkkrVTV4R3h1ZHV4am50U3Jm?=
 =?utf-8?B?WVgwTlNoaWdobGgrSmF5SWZFTnFSNU1ucHg2aXdwcjJlWkV2K1h6NkNYYVQ0?=
 =?utf-8?B?NGV4ME53aVVFamZ6aW1HcUdPWUJaSlNDYXVuN2Eyd0YzdjduS2RWT3pjOER0?=
 =?utf-8?B?QklaWHMyaURwOWk1WHA0OVErYUVuc1hIYkpsaTJ1UWEyaEI5M3VyRnduOFFB?=
 =?utf-8?B?dEs2SFg0aHBvTWtvQm9rSFE0V2hFeTRnSGNkVWR0L1NMVHViYVlMMW12N0s5?=
 =?utf-8?B?V2txeFBEKzNvUG1Kckh0QU9XYWJHNkZrcldJaHpjdmFrYndld2xjaDJpeUp1?=
 =?utf-8?B?b2VxajVIdktHT1VlZmxMZUR3bjZCS2gvbGE2eFNkRkgybzJ6dVZHK0JtVVQr?=
 =?utf-8?B?dzBaZ1BVQVM4MVZQcW9sM09ZTm4xZVdHMkVMRVN2c0Rvc3hUM1orT0F6SEpp?=
 =?utf-8?B?RElWYy9DSmhGMjJ2K29ncHgvRFo0NGdxSGk1c204UkgxUlJpL1J6SzhOZUxO?=
 =?utf-8?B?dXRlN2pKZzhGUGp6TFBZeC9jTWdURVRUcU9YSGpLMWZJSDAxYzVvRk42VEJl?=
 =?utf-8?B?cHQrbkQ0OWVYdGtQMnlPSm4zdFlxRXV5bm1INnRkV1FqV25XYS9ZbHNVdXpC?=
 =?utf-8?B?bDYvVjdEUzhXVnNEMVZGSzM3VkRKZ3I1Szg5aUpEOE1DL0l4bldQb2YyeVBw?=
 =?utf-8?B?UmFza2NlWGEvNlc1OHhwMXU4aGo2Q0JLb1RaeGFDd2xYRU8vdkFUdmlUb2J0?=
 =?utf-8?B?VFlUaTc2dVZBeDgwSk1zVGYrdHNCUkcrL1VzZW5namYzRUdOU3pYRUNtd1ZP?=
 =?utf-8?B?ZUc1NnRuWTNaYzFhRE00K2RCVHNoR1VnZmpoUlpXTWhxRWRscU4zQkZ3cGV0?=
 =?utf-8?B?SDN1TzIxcHRZVWFncUJpQTRXeG5tbXZZcS9pRXFmQlJVbmk0M1YzMDFwR21i?=
 =?utf-8?B?azl4NWplSExWYS9Na1VZMEhET3hYRDA4TE5LdmZ6Y3ltSmtYQ2lDdW8yUzlo?=
 =?utf-8?B?b1dzdUExVmFETlk5WWFmaE5XcG0zZ1BSS0pQV2lKbG03U0tNWmJmSDFqU2pU?=
 =?utf-8?B?N0g4YTQ4TGFlaWRLendIbzIrUkdSUktxL0R4YmpKU0pSNnpiUjFBbHdGRk1l?=
 =?utf-8?B?elJZeU5pRFpIMmNkZy8yM0pyai9zMUhvR1czN0U0cTZvb1hGSlh3clBoNjRP?=
 =?utf-8?B?Z0IreFBBZllYSjY5OEVxemx1YnFITEUrQkVteFpSM0w3ekJXMmdtOWFvcVFs?=
 =?utf-8?B?SXVzS3FBWWcvbGZCd3NwdERWOUZza2tNY1BBOUVzNVZ4dEhRVWdTWlBBc0tv?=
 =?utf-8?B?Z09NK1V5VHFlbVAvbEhoUmJpSGdDK3ZMNFo2TWczMXlhRmFKQkw3TUsyL2ZG?=
 =?utf-8?B?cmFSdXViREt4TS9XVEVjNjI4S2swV2tWbEtwU0JqOUZZR2FEQS9OMFphMXVk?=
 =?utf-8?B?WEcrUmc0dVkzbkMyNUUraVpTeHhQZkgzMlRYQ0VaUEtOQjJNTkREVmpOQ0R0?=
 =?utf-8?B?dXAvdXpiQmY1QXhCMTl1L25JUkRNTkl0NE5Qemt5Z091aHcxeVptZXNFeHYv?=
 =?utf-8?B?cDg4bms0STdzeFBMYmYwSktHSjlnd2V5ZjZjcnEzMFgrTHhBeUR6SHRlWFVB?=
 =?utf-8?B?RlhhZGp5Z1p6dUtxK1g4QWR2STY1QnhQMkVmbytXeXJmYzlhTDdRVC9tTTdD?=
 =?utf-8?B?RkpIZVZGQ3N1ZDh3NjRlTjdoY0xFYlBxa2dHTUJUeUkwYit1Q29qQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GUDJlO0YHz9cxg1UKp79lU1AzBH+bu6dU3aJr9LhypdYhXCvZQ477kIVOAdQmZzrk8yiPCJpJan+J3IPcpEeDN3gjECZTBdKuKGwe52zsn1YgxbrzxiwyrLYYtkItU6satG3zj1iq6CpMPsHQur3lsCUsb2+GoEEuyrj7j9PmGlxIJBYJDpWfdTVNfeEpkd0mrJOvBEuOnAj0zz752oyMc6KYGX9jxYiWlfGi6RlbH8GQzItUORis/Y/M/yS55Nl44kVCQVd/kBhqEOqe64Q/Y+NKb0dmT5LSlqO/oaAWfhw75J00wDm8kO9D3eIpqyBzpLWdh5Q6CgFCMJNiR4TQg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFE241D7F14.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a863dcb2-83e3-41bd-65a5-08df30239ba7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 10:02:40.2079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pgh8AG5xJvQ4VBzOo4VFcvdHQp0IftT45B7YoihQFTLaUKXygdm6XwiucUN+e5t0Yu/KjoCO9GOgDSQbxkO5wk8j5NcmdUOeiYgGO4ggeZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7781
X-OriginatorOrg: intel.com

PiA+ID4NCj4gPg0KPiA+IExvb2sgbGlrZSBpdCBpcyBzdGFsbGVkIGFuZCBJIHByZWZlciB0aGlz
IHBhdGNoIGluIHRoZSBvcmlnaW5hbCBmb3JtLCBmcmFua2x5Lg0KPiA+DQo+ID4gTEdUTQ0KPiA+
IEFja2VkLWJ5OiBBbGV4YW5kZXIgVXN5c2tpbiA8YWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29t
Pg0KPiANCj4gTWVhbiB3aGlsZSBHcmVnIGFwcGxpZWQgYSBkaWZmZXJlbnQgcGF0Y2gsIG5vdCBz
dXBwb3J0aW5nDQo+IGNvbXBpbGUtdGVzdGluZywgY2ZyLiBjb21taXQgYThhZjkyOWU5ZDc1MWE4
NSAoIm1pc2M6IGlzc2VpOiBGaXggaXNzZWkNCj4gYXJjaGl0ZWN0dXJlIGRlcHMiKSBpbiBjaGFy
LW1pc2MvY2hhci1taXNjLW5leHQuDQo+IA0KDQpPcHMsIG1pc3NlZCB0aGF0IHRoYXQgcGF0Y2gg
d2FzIG1lcmdlZC4NCg==
