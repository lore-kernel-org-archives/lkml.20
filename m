Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793253304;
	b=g3BvyB9lCNehDYXPr6Qy9TSGU81kitYcMF0cbg9OqbDxF0hMZ34lQzNy6Ni4l4l2ZDAq
	 cW417fm7JGFCW58VraK8UeJ4yx73rY+4RB26aEdJVcMOc8zEb0FlKA2YoiTUyrABhBpbH
	 xcrfV3sz11VQxDWTAN+FPGJI8/HAvHiYgaY7GQgiwtD0c4V20xLuuFfNlcSi5/gvJ6iyp
	 3hsVjoonOm3TmxR9yZX/fJIjiycjY63Zg5i+w5nHWicliHA3hZNR/lyRl4ROdet8mkX3u
	 dN6sBNBqYYwgeA6KieKxMNup9rY5T6C6cgLatQQEgKUFKPpXsOR5cVp2M04dM8xVO6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793253304;
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
	bh=3hxLV0TfyQ7WOsc5yWrSZXNhSH/01MjCGD12j01KFrc=;
	b=Xn6KKu0kGs1YCdtoNN/XUFFc24dJ5JbXg9lJ1FjoUVkD8GtXMUTDrcFZESDo8n7W4CW5
	 NkIGx8y7W9Ozqe+VMO1kwiumglpwZ2f4D/QoZMTh2Ez9X6jAIgJ4YyEJ0k5cuBQSkFpkR
	 tOTy7YWxMhIZFjcRFPdIPdLe8OJdQL17S9icTpNt3rlaF8PyC+Hu1UlLQrzLX96pHVTdb
	 zIvULT5En0XNFKCcd/9/AvcuZoJR4T3SjO7oIJaGRu7UzDgP+xY1vH8ZsPCR829Vrwu9R
	 aQxESFQhWeHUm1dZ9Ns+sPQa5tFAmF6LIiTuaTUhYAZ31i+1xNlX4U+zOWnhm0GWC2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RsX0lJSS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0AE606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C0AE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RsX0lJSS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793253302; x=1824789302;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3hxLV0TfyQ7WOsc5yWrSZXNhSH/01MjCGD12j01KFrc=;
  b=RsX0lJSSStY4mvHEiysx0mSL1upOpf0lvgGuvY2/72psqk6++wJ6821w
   NvcjIKLE4WFQGPX1XYRQFVuyeZSlcroNhZXA8uFg1ByiaQOzHMEHCg5At
   7iG0zxCpxOcY3kNm1I/XuaM2nJbfUoYNcs6CE8lO8nKjgEaXKTvuPVbny
   0iJSjPa9Bci1raz2j6zVU/aaBGLV3ncDdOmernbATtd5Z6rsz6EJBxaJq
   LNKW7+lsiU07U5dYBkYncjlra5GOjg5RCf2be2E7duI+XK/5CuWZhUiE1
   rav9DqnFjtcFi7MZ3O24N3Qj02a3VNrypNwkSkMtc7sTHf2119UaqQCnb
   g==;
X-CSE-ConnectionGUID: L9CQ/biBTjiLSZEgW9iWcw==
X-CSE-MsgGUID: udx/uHlzSgqsOW2Wp3Fb5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1980890"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1980890"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 22:55:02 -0700
X-CSE-ConnectionGUID: pRxB50+LTpKHkBud4YRetA==
X-CSE-MsgGUID: PLdiQy97Q/CVjvyB5ksZnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5174448"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 22:55:01 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 22:55:01 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 22:55:01 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.13)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 22:55:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYkcVYD2hsincQbG5ulgQdC7jrTWVGR2hobouF5WrD3pqg7w5sRBKZhSCylFS59ZT3U3IdNExzTkeGi81UCkzErn50wgxg5gzN3pTzSBBjSRJzaO0g1I918jnFeQvSIiKaREm6R3vV6PWgRsMSSB/wAnckk1jff1HA4Jp2QN0EgnAwUsdnCLsULnc+smcQjLkqb/EsTfzbxJUMgoaZ7ubG2g7NMqYPFm4iYoMH6n51TH2I8jHje/1GGSXLzb6J4SPfCijY/sZOFSWKi3KCD0iaQuAwT7d80u6OmcDAahkETeuY75RBgSrB9uu2e/mAd3Mqo2V36xhm6bsKM7tDqQhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hxLV0TfyQ7WOsc5yWrSZXNhSH/01MjCGD12j01KFrc=;
 b=TmwqtRfzdVHQ8m3skh5meXchQtva3fdYXpMgRia8cdd4jtLim2pOXTQCFfDwABWXvvYg9Cbrpf4/WiicA9qxgTgPHNP1DfWQ4VrBIzigolX/OBd/MPeSfquGXPOv9Kqm1r3EE8NOf1utuObT08MbDB5Uc5MacGnja96BeEJJ34Yv+1qzGDZY+cTtGRoSmqxq8R9wHLElIC3KcB+z4ICwD1DObSZciCfUEToXE+bmezP3RisATAVUkBeGh2y8G4KN3V0OnQRCaBB7LQDKAcxtUQmXz51r82RXDsP2Ds116ZpH8ZingVCvQS8vgqshj3mD0fGOFA+fZIqlGSmMLZd9tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPFE241D7F14.namprd11.prod.outlook.com
 (2603:10b6:518:1::d57) by DM3PPF31D2DA56C.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 05:54:50 +0000
Received: from PH3PPFE241D7F14.namprd11.prod.outlook.com
 ([fe80::e459:ea7c:45a:2ad3]) by PH3PPFE241D7F14.namprd11.prod.outlook.com
 ([fe80::e459:ea7c:45a:2ad3%4]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 05:54:50 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: =?utf-8?B?QW50b25pbyBWw6F6cXVleiBCbGFuY28=?=
	<antoniovazquezblanco@gmail.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Arnd Bergmann <arnd@arndb.de>, Dorian Stoll <dorian.stoll@tmsp.io>, "Tomas
 Winkler" <tomas.winkler@intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] mei: me: add ice lake point LP iTouch DID
Thread-Topic: [PATCH] mei: me: add ice lake point LP iTouch DID
Thread-Index: AQHdZykwEJWblQzRD0Oh/Y15zr/e/rcUAuqw
Date: Thu, 29 Oct 2026 05:54:50 +0000
Message-ID: <PH3PPFE241D7F14371F8930495B386A1648ED6E2@PH3PPFE241D7F14.namprd11.prod.outlook.com>
References: <20261028221017.54426-1-antoniovazquezblanco@gmail.com>
In-Reply-To: <20261028221017.54426-1-antoniovazquezblanco@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPFE241D7F14:EE_|DM3PPF31D2DA56C:EE_
x-ms-office365-filtering-correlation-id: e28fccb2-413b-4465-2e08-08df35812530
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|261026140227099003|38070700021|11063799006|56012099006|261022075727099003|10067099003|261009223027099003|261022105027099003|261028144727099003|261021121427099003|261026121527099003|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: 3kBAjZSMkczDCXavdi4V5rAVdW99Vr288G592ZO0BIfqWesULKCuMgZaFldgRTGOsJ8oWa0BUxecHjekS34Pqp3O276gVk6NY0A55cXPN2Nfxq2ayt5hDUQ7Qvnm0MC/pzj1BHoLpr/xU/in4rw4kFmF1PmI0hviBXQRHnSBmm4az9m/Rhwk0Yr16ep8U/9jjfhho98MIfcQmIDel2/BJ2DhAqaivo4kcX507zWGoPjyUtpQ/wWeNyVIa1gUSIoVpZV0fzb/PfqPvkHBDoNz/ixobaZHGvhxdwsF6dL2QneFBRyPw7HHzZ/q+c+sZHjbsCbdrM0r/u2GuJXhmaJ2M+h+yj9AixBf64ew6MGK11he/nWw+RNjGzNwbS00jrsWZsbaS65gwUGkj+K1QgCk+4oCdx0PI03PqIWhctQfrpDlJQ47Z6JEibDnKSkMfQ0JHQu+ABxKp8qpsCBtX1mnotgaTlH85ZVk0kXTsQ3Gnzx4aMIz+h+NYky5nSXhELZGqCgMz0rQEpG9AmjSzl2RXx0cTA4Jzm2/gbyL9Njd2pY2jBftcMsXMA3QnFLs9FMPQuoiwtELkuiy6/kNGFOQGyeT+m/Qkx8KWzhsOmZvVoJYV0RItlmuZ0I+5ZPupi/P7N3/pcZjfJo3sxncZRbahb5GF494mdes+kwKyBP458xccb/QqjoNUGpBH20pOAYT
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFE241D7F14.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261026140227099003)(38070700021)(11063799006)(56012099006)(261022075727099003)(10067099003)(261009223027099003)(261022105027099003)(261028144727099003)(261021121427099003)(261026121527099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?THg3MjRQVitoeWp1L01ZdDVWaGsyY1FRQmI2Q1hGbU94eUNPWDBOenhzWERa?=
 =?utf-8?B?L05CVUZTTWxFbGJkczQxOXUvOVFCekpobTNZbDZLRVB0RGNVd01ZME1Xb2hD?=
 =?utf-8?B?bDhEamcxazhEWUM4dVp0RGV6OG11RWJPRG44aGhIRzlGSnprOUxobWhOVk1T?=
 =?utf-8?B?TnlReE95aHAwRWI0b1BwSjdEcGlqL1ZzZnNrQnZNc2FKTjMrVmRQMjdXTTYy?=
 =?utf-8?B?NVRtYm1iVURHQWZNckZMSW56WlhLdEtaanVIUnBvbjJHTFlaWmNJYTRicHMy?=
 =?utf-8?B?QW9scllqVlVnVFJqeTJiSUk5R1FCYXhtbnRORGdJZ05Gc2VtQTRiL3ZQNDZ0?=
 =?utf-8?B?U0FkUitpeFJpR3RoRGtzeFBOR2t6TU5NQ1pvWFlqNHBoNmtiSlUzdG5VTG9E?=
 =?utf-8?B?MlZUVXRIRlRIcGdkWDNSQVJxS0Z0SWNsQWF1NUlJWTBXWHhlaFRQNkEybnhS?=
 =?utf-8?B?ZjdTNjV0S3I4Zm1YTUZzTElva2hkRTNkS09heU1iQ000OXJ0V2dPbjRRdnYy?=
 =?utf-8?B?ODVkcVpPYk1nQ2VVTkFac3VLaGlEZ1NEZ292bDhYTFBzNTZpSzZpL1dwZjB2?=
 =?utf-8?B?TWR4Mmw1RTAvdDJZL09XcUV6M2RWR3UyUHNoUHJTS1c5QWFTWTZsR0pKeEFF?=
 =?utf-8?B?U3RtZ21udU1kWlJ3VE5UeDVKMDdLOE9EMEVRak9CWWlRZ1VHYlo0ZFh4bGd6?=
 =?utf-8?B?MU1SYkxJa3V4aU5TdU9jRTZZS25oNEVlZitFWGpTVDgwN01lZE1talFCZ1ZV?=
 =?utf-8?B?ZCtuVTJCNENYSWkya1JUekw3VStmM2FTdWczTkYyQTlSczFLSFUyeXpWMDFv?=
 =?utf-8?B?ZUtUeS9qQzc1V1lncHpFcm1NVGZjN1NvNUVPYjNsRmdsNzRhU1grL0lVcmJw?=
 =?utf-8?B?ZVI2WFU2T2pncHR2WHhBQTU3NVhEN3pzUTR1dXIxS0Ezc0Y1YkdjeVc0SllX?=
 =?utf-8?B?ZjZYeUFQbUdPcmlyVGprdS95VWp0dTkvbXBSZHA2SjlZZGZ2aTA0eWIxQVYv?=
 =?utf-8?B?TmFEM20yOExxaCs3OE9vREdZNDhtYnBuMnVVNGk3OFJHNFg3Yi9zbVdMd2ZU?=
 =?utf-8?B?MkkyTlJ0YnpuU0hsQ2NvOTdzTzBxeDJ2QVErSzJMSERXdnYwbFZSN09NeGNJ?=
 =?utf-8?B?WTZvRkozNzR1d0lxSk8xQ2tVelQzeG1zWFp3T1o1OFhOUjRzSWc0b2VpWmdq?=
 =?utf-8?B?TFFmMWJ5RHVEODB2UGhuSmhJMDRJOU9RR1NyeXgwT3dLalI0Z25aekFVVlhV?=
 =?utf-8?B?NVU3cnBlWjJTeU8ycjhyL25mNVEvekFNK0gwbjdqV3A0UTNnTlhUKzN2byty?=
 =?utf-8?B?UzQzUkhqV1FyekNNc1NqN1N4ZEc5UFZSKzN2TUFyU0RzRWttNkUrbWhRU0k1?=
 =?utf-8?B?RGx1bHYvMjBtQms3YWF4MHRtZTRKMXk5VVhYWmRSVUoxSXF2dHZEcGJqMmxH?=
 =?utf-8?B?elBjdWcwei9NeFJPNHFxL2RzWnNQOXZWVXk0Rks0SmcvQjMvOE04djZmUWRO?=
 =?utf-8?B?VHZ5VjExUWJGdmZFK2xiL1pDWGtmUGFCdTNpbms4M3Y5UUswYllBRCthQmt0?=
 =?utf-8?B?aHVqTXF4M0xIUkovZ3VvWVFiYWVrbjIrcXIvaDhkeTJDcWtrQWlrVnkvYTJT?=
 =?utf-8?B?OXNLZlJtVWVMbnZKZm1nczh2Vm9OVHpUdXpWL3h4M3FiWkZmUkkzMDJzTUVr?=
 =?utf-8?B?UzAwb2dWbDRab0o2dXUrbHBLaGs5WkptT21qSVk2NHVKTEFNTnN2UEd6ZVIv?=
 =?utf-8?B?QWJja0pzTlM5WXVaUFd4d3RqeXdaN0RmUlF3dVVmejFLMFNlaENVQjcyMTEy?=
 =?utf-8?B?dUR6ckVvdUJQZ21UWk1QMnMwOFZwUmx5eUN1SWZqTVJYVVdodSt6TUErMCti?=
 =?utf-8?B?bVhiRmRtWFdNSDl5Nm0rN2xiWmRkL3NWT0tZMjBMRXVkSzZ3bFNTcmFNS2dT?=
 =?utf-8?B?NFF3VkEyOUp6YjJuWTdUOFFIZUhWT01mM1lJREhrOFRmd3c1Ym9RODhaRFYz?=
 =?utf-8?B?RlhDd0JBWlJSSXp4WjAvMUxyY0xKT0lMdnJFU1V3VEwzMmtWcS9BbHd5YWEv?=
 =?utf-8?B?SFhIUi9jTndJbk9BbDRtTi82d3JjeWtDblQ4eUJRQjZhOWUyNDh6eVhKRHE3?=
 =?utf-8?B?RjNaL0szSlV0c1prUm1CTGs3NGIrRHZEZTBocDNwV1plbmhHRjBneXJRZldT?=
 =?utf-8?B?QmtsOENrU2JDMEZHZENmMnhUb2xYVm5MY2l6NEkvRE50aEZaYU5jVUgzejQy?=
 =?utf-8?B?Q2lFYU44TXJMcUdMMXhpNWFscDJlT0pDeWlWSnBycHJROGNudmo3T2JlYnZD?=
 =?utf-8?B?d2NOT3VmY3FZUjYydjhlM1cwMVluNWp6WlhQWDJwUmhqLytPdGxXdz09?=
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
X-Exchange-RoutingPolicyChecked: tEH3sfRj4TJV6nXpt8hTNcMVDISWW4SctR60fM09UoPrkEn0EsXpinBWnAt+gbUwa/GddfR8U/01AfEQj45ENy2bmBsvf93B0CoQxu/GaXPPcD5stq5ZNL5UBay3s6805dej2LGyKdLEwyLV5aPL7zK8NktF9wXNDIGyeqaxOKlw0+gYajk93Nocpj14hS2jglM8EKKCPCeSGFyVb38fDTm50Nz2+6QHO7ncDfYBrl9wliRbVHrS1ngTq0gq3Jf1OFeeBHmV49L1bkYIXOxKFLnAXs2x1Rkw/vQ3TcvgFPhcMztU/pskbiDQLR3aoXifguCX+DNVYDLeDhTI0FYYeQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFE241D7F14.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e28fccb2-413b-4465-2e08-08df35812530
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 05:54:50.0513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MpcbhUoqz+XGL8yCBi3obfdYT0xGc+W0gyEjQmmKaTWos7/3OD7NjheNY3Mu/jUKtqIrNuDYDzrC4dMsPZvvnjFHynRFM5y9PR1QuS65qXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF31D2DA56C
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBbUEFUQ0hdIG1laTogbWU6IGFkZCBpY2UgbGFrZSBwb2ludCBMUCBpVG91Y2gg
RElEDQo+IA0KPiBBZGQgdGhlIGRldmljZSBJRCBmb3IgdGhlIEludGVsIFByZWNpc2UgVG91Y2gg
JiBTdHlsdXMgKGlUb3VjaCkgZnVuY3Rpb24NCj4gb24gSWNlIExha2UgUG9pbnQgTFAuIEl0IGFw
cGVhcnMgYXMgUENJIGRldmljZSA4MDg2OjM0ZTQsIG5leHQgdG8gdGhlDQo+IHJlZ3VsYXIgTUVJ
IGZ1bmN0aW9uIGF0IDgwODY6MzRlMCwgb24gTWljcm9zb2Z0IFN1cmZhY2UgUHJvIDcgYW5kDQo+
IFN1cmZhY2UgTGFwdG9wIDMuDQo+IA0KPiBXaXRob3V0IHRoaXMgZW50cnkgbWVpX21lIGRvZXMg
bm90IGJpbmQsIHRoZSB0b3VjaCBjb250cm9sbGVyIGlzDQo+IHVucmVhY2hhYmxlLCBhbmQgbmVp
dGhlciB0aGUgdG91Y2hzY3JlZW4gbm9yIHRoZSBwZW4gd29yay4gVXNlcnMNCj4gY3VycmVudGx5
IHdvcmsgYXJvdW5kIHRoaXMgYnkgYmluZGluZyB0aGUgZGV2aWNlIGJ5IGhhbmQgYXQgYm9vdDoN
Cj4gDQo+ICAgZWNobyAiODA4NiAzNGU0IGZmZmZmZmZmIGZmZmZmZmZmIDAgMCA5IiA+IFwNCj4g
ICAgICAgICAgIC9zeXMvYnVzL3BjaS9kcml2ZXJzL21laV9tZS9uZXdfaWQNCj4gDQo+IHdoZXJl
IHRoZSB0cmFpbGluZyA5IGlzIHRoZSBtZWlfbWVfY2Znc1tdIGluZGV4IG9mIE1FSV9NRV9QQ0gx
Ml9DRkcuDQo+IFRoYXQgaXMgZnJhZ2lsZSBieSBjb25zdHJ1Y3Rpb24sIHNpbmNlIHRoZSBpbmRl
eCBpcyBwb3NpdGlvbmFsIGFuZCBhbnkNCj4gcmVvcmRlcmluZyBvZiB0aGUgY29uZmlnIGFycmF5
IHNpbGVudGx5IGNoYW5nZXMgd2hpY2ggY29uZmlnIHRoZSBkZXZpY2UNCj4gZ2V0cy4NCj4gDQo+
IFRoaXMgSUQgd2FzIGZpcnN0IHJlcG9ydGVkIGluIEp1bmUgMjAyMCwgdG9nZXRoZXIgd2l0aCBT
dW5yaXNlIFBvaW50J3MNCj4gMHg5ZDNlLCBpbiAibWVpOiBtZTogQWRkIGl0b3VjaCBkZXZpY2Ug
SURzIGZvciBTUFQgLyBJQ1AiIFsxXS4gVGhhdA0KPiBzdWJtaXNzaW9uIHdhcyBkZWNsaW5lZCBv
dmVyIHRoZSBzZXJ2ZXIgcGxhdGZvcm0gSUQgY29uZmxpY3QsIGFuZCB0aGUNCj4gU3VucmlzZSBQ
b2ludCBoYWxmIHdhcyBzdWJzZXF1ZW50bHkgYWRkZWQgaW4gY29tbWl0IDM3MmE4Mjk4NjJlNSAo
Im1laToNCj4gbWU6IGFkZCBNRUkgZGV2aWNlIGZvciBTUFQgd2l0aCBJVFBTIGNhcGFiaWxpdHki
KS4gSWNlIExha2UgUG9pbnQgd2FzDQo+IG5ldmVyIGFkZGVkLg0KPiANCj4gVXNlIE1FSV9NRV9Q
Q0gxMl9DRkcsIG1hdGNoaW5nIHRoZSBhZGphY2VudCBNRUlfSUNQX0xQIGFuZCBNRUlfSUNQX04N
Cj4gZW50cmllcy4NCj4gDQo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIw
MDYwMTE1NTk1NC43NjQ1NTgtMS0NCj4gZG9yaWFuLnN0b2xsQHRtc3AuaW8vIFsxXQ0KPiBTaWdu
ZWQtb2ZmLWJ5OiBBbnRvbmlvIFbDoXpxdWV6IEJsYW5jbyA8YW50b25pb3ZhenF1ZXpibGFuY29A
Z21haWwuY29tPg0KPiAtLS0NCj4gTm90ZXMgZm9yIHJldmlldzoNCj4gDQo+IEJ1aWx0IG9uIGNo
YXItbWlzYy1uZXh0ICh4ODZfNjQgZGVmY29uZmlnICsgQ09ORklHX0lOVEVMX01FSV9NRT1tKTsN
Cj4gbWVpL21laS1tZQ0KPiBjb21waWxlIGNsZWFuIHdpdGggbm8gbmV3IHdhcm5pbmdzLCBhbmQg
Y2hlY2twYXRjaCAtLXN0cmljdCBpcyBjbGVhbi4NCj4gDQo+IEkgdmVyaWZpZWQgdGhlIHJlc3Vs
dGluZyB0YWJsZSBlbnRyeSBpbiBwY2ktbWUubyByYXRoZXIgdGhhbiBqdXN0IHRydXN0aW5nIHRo
ZQ0KPiBtYWNybzogdmVuZG9yPTB4ODA4NiBkZXZpY2U9MHgzNGU0IHN1YnZlbmRvci9zdWJkZXZp
Y2U9UENJX0FOWV9JRA0KPiBkcml2ZXJfZGF0YT05LCBpLmUuIGJ5dGUtaWRlbnRpY2FsIHRvIHdo
YXQgdGhlIGhhbmQtd3JpdHRlbiBuZXdfaWQNCj4gd29ya2Fyb3VuZA0KPiBhYm92ZSBwcm9kdWNl
cy4gU28gdGhpcyBzaG91bGQgYmUgYSBuby1vcCBmb3IgYW55b25lIGFscmVhZHkgdXNpbmcgdGhh
dCwNCj4gb3RoZXINCj4gdGhhbiBtYWtpbmcgaXQgdW5uZWNlc3NhcnkuDQo+IA0KPiBJIGRvIG5v
dCBoYXZlIEljZSBMYWtlIGhhcmR3YXJlLCBzbyB0aGlzIGlzIE5PVCB0ZXN0ZWQgb24gYSByZWFs
IGRldmljZS4NCj4gDQo+IE9uIHRoZSBjb25maWcgY2hvaWNlOiBJIHVzZWQgTUVJX01FX1BDSDEy
X0NGRyB0byBtYXRjaCB0aGUgYWRqYWNlbnQNCj4gTUVJX0lDUF9MUA0KPiBhbmQgTUVJX0lDUF9O
IGVudHJpZXMsIGFuZCBiZWNhdXNlIGl0IGlzIHdoYXQgdXNlcnMgYXJlIGFscmVhZHkgc2VsZWN0
aW5nIGJ5DQo+IGhhbmQuIEl0IGRvZXMgbWVhbiB0aGUgZGV2aWNlIHJlcG9ydHMga2luZCAibWVp
IiByYXRoZXIgdGhhbiAiaXRvdWNoIiBpbiBzeXNmcy4NCj4gVGhlIG9ubHkgZXhpc3RpbmcgR2Vu
MTIgaVRvdWNoIGNvbmZpZywgTUVJX01FX1BDSDEyX1NQU19JVE9VQ0hfQ0ZHLA0KPiBhbHNvDQo+
IGNhcnJpZXMgTUVJX0NGR19GV19TUFNfSUdOIGFuZCBkcm9wcyBNRUlfQ0ZHX0RNQV8xMjgsIGFu
ZCBJIGRpZCBub3QNCj4gd2FudCB0bw0KPiBhc3N1bWUgZWl0aGVyIGlzIGNvcnJlY3QgZm9yIGFu
IExQIGNsaWVudCBwYXJ0LCBwYXJ0aWN1bGFybHkgYXMgdGhlIERNQSByaW5nDQo+IGlzIG5lZ290
aWF0ZWQgYXQgcnVudGltZSB2aWEgaGJtX2ZfZHJfc3VwcG9ydGVkIGFueXdheS4gSWYgeW91IHdv
dWxkIHByZWZlcg0KPiB0aGUNCj4gZGV2aWNlIGtpbmQgcmVwb3J0ZWQgY29ycmVjdGx5IEkgY2Fu
IGFkZCBhIHBsYWluIEdlbjEyIGlUb3VjaCBjb25maWcgaW5zdGVhZDsNCj4gcGxlYXNlIHNheSB3
aGljaCB5b3Ugd2FudC4NCj4gDQoNClBsZWFzZSB1c2UgTUVJX01FX1BDSDEyX1NQU19JVE9VQ0hf
Q0ZHIGFzIHJpZ2h0IGtpbmQgcmVwb3J0IGlzIGltcG9ydGFudC4NCkFuZCBhYm91dCBzZXJ2ZXJz
JyBleGNsdXNpb24gLSBiZXR0ZXIgYmUgc2FmZSB0aGVuIHNvcnJ5IGhlcmUuDQoNCi0gLSANClRo
YW5rcywNClNhc2hhDQoNCg0KDQo+ICBkcml2ZXJzL21pc2MvbWVpL2h3LW1lLXJlZ3MuaCB8IDEg
Kw0KPiAgZHJpdmVycy9taXNjL21laS9wY2ktbWUuYyAgICAgfCAxICsNCj4gIDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9taXNjL21l
aS9ody1tZS1yZWdzLmggYi9kcml2ZXJzL21pc2MvbWVpL2h3LW1lLXJlZ3MuaA0KPiBpbmRleCBi
OWE2NzYyOTQ5NmIuLjM5NzJmOTUwNGYxMiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9taXNjL21l
aS9ody1tZS1yZWdzLmgNCj4gKysrIGIvZHJpdmVycy9taXNjL21laS9ody1tZS1yZWdzLmgNCj4g
QEAgLTk0LDYgKzk0LDcgQEANCj4gICNkZWZpbmUgUENJX0RFVklDRV9JRF9JTlRFTF9NRUlfQ0RG
ICAgICAgICAweDE4RDMgIC8qIENlZGFyIEZvcmsgKi8NCj4gDQo+ICAjZGVmaW5lIFBDSV9ERVZJ
Q0VfSURfSU5URUxfTUVJX0lDUF9MUCAgICAgMHgzNEUwICAvKiBJY2UgTGFrZSBQb2ludCBMUCAq
Lw0KPiArI2RlZmluZSBQQ0lfREVWSUNFX0lEX0lOVEVMX01FSV9JQ1BfTFBfMyAgIDB4MzRFNCAg
LyogSWNlIExha2UgUG9pbnQgTFAgMw0KPiAoaVRvdWNoKSAqLw0KPiAgI2RlZmluZSBQQ0lfREVW
SUNFX0lEX0lOVEVMX01FSV9JQ1BfTiAgICAgIDB4MzhFMCAgLyogSWNlIExha2UgUG9pbnQgTiAq
Lw0KPiANCj4gICNkZWZpbmUgUENJX0RFVklDRV9JRF9JTlRFTF9NRUlfSlNQX04gICAgICAweDRE
RTAgIC8qIEphc3BlciBMYWtlIFBvaW50IE4NCj4gKi8NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bWlzYy9tZWkvcGNpLW1lLmMgYi9kcml2ZXJzL21pc2MvbWVpL3BjaS1tZS5jDQo+IGluZGV4IDc5
MGE0NjQ3ODExYi4uZTg4MDViY2QzNjk1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21pc2MvbWVp
L3BjaS1tZS5jDQo+ICsrKyBiL2RyaXZlcnMvbWlzYy9tZWkvcGNpLW1lLmMNCj4gQEAgLTk4LDYg
Kzk4LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkIG1laV9tZV9wY2lfdGJs
W10gPSB7DQo+ICAJeyBQQ0lfREVWSUNFX0RBVEEoSU5URUwsIE1FSV9DTVBfSF8zLA0KPiBNRUlf
TUVfUENIOF9JVE9VQ0hfQ0ZHKSB9LA0KPiANCj4gIAl7IFBDSV9ERVZJQ0VfREFUQShJTlRFTCwg
TUVJX0lDUF9MUCwgTUVJX01FX1BDSDEyX0NGRykgfSwNCj4gKwl7IFBDSV9ERVZJQ0VfREFUQShJ
TlRFTCwgTUVJX0lDUF9MUF8zLCBNRUlfTUVfUENIMTJfQ0ZHKSB9LA0KPiAgCXsgUENJX0RFVklD
RV9EQVRBKElOVEVMLCBNRUlfSUNQX04sIE1FSV9NRV9QQ0gxMl9DRkcpIH0sDQo+IA0KPiAgCXsg
UENJX0RFVklDRV9EQVRBKElOVEVMLCBNRUlfVEdQX0xQLCBNRUlfTUVfUENIMTVfQ0ZHKSB9LA0K
PiAtLQ0KPiAyLjU2LjANCg0K
