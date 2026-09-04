Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0B442124D;
	Fri,  4 Sep 2026 11:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521780; cv=fail; b=inqpaa/zcz4gE8ABVgYtPY0Zs6SagsV/JfIDCOLg28ouTlfNYwSGI7V4ViuV52zl8UIcG5hQR+fBhuMetDq3xPhTfGcUSXLdk7s7apnjlSpKuteRHYF+9tazYWjrJhqS3v5Mli2qIHUZvGf5alCYbOlTefqhVw0Ntvcan/1p2CY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521780; c=relaxed/simple;
	bh=EpnlWMiwy1o1fx++wuuqxAtIKGVOeeyMSMWb62fnPIk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d3Ly/htTh755XakOcWJtNpdDULF3YuDTxjmp/g4Y1iOeqWxJsxCsQN+sL0W5RTPdM21tFrofM3WV1HBQ5x/ZwXDoxtl0CLqrNnUI7VdA26NfJ7cXYNd+D4BpF5rCBOTHBxnnsljuGAEjXq/CULZrwMzBkgJhvZ9b/e7YL1Nz/fM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b/UknRCX; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b/UknRCX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788521778; x=1820057778;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EpnlWMiwy1o1fx++wuuqxAtIKGVOeeyMSMWb62fnPIk=;
  b=b/UknRCX8jV9y5hMNHCDc2JZRfP4o4G7sE9r/6bshWAleYzjzi0H4Z/k
   fft9Bru7wj1Dg7y81Nf5EmSA0gUdS3qaNXu5A4+KEI3ywj3WtBf6mcLY/
   XFJD++tU2f0Ngj+XBUKIqk95+LHfbXLkxiv6bDc2gMag4SH9y0fgZ+BOX
   BpPBmfeFjdz9YGQvYN/1whLAQ9WAn4wCzlEO2mkTClPtgRPF3FlMbjcM5
   3keUnaP328CYd5WLCas4+c6t+IU4cZDxucbgnQv9XfsLclVH/faUBz6Em
   DNkx3Ku8pcTL1/89vLqm7jaziFyG3Rbi7QxY4aqd+gVnHgk6a4Wvempsl
   Q==;
X-CSE-ConnectionGUID: AOa8IHPqTQ2NcngpihL8bw==
X-CSE-MsgGUID: ceS+7UfPRXyPJs65I1hgcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="92719659"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="92719659"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 04:36:17 -0700
X-CSE-ConnectionGUID: WXuP4WsuS9eYxPeZWM2W4Q==
X-CSE-MsgGUID: sO0HvuS7TfCZovuyzc+XwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="268698348"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 04:36:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 04:36:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 04:36:16 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 04:36:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oBGHjg8e+BkwTzQJo0JSOJPEEomg4rnh6++rSr3xV4zMSvjpviq1Go7mwtHZjGcazmYK35UZCEZKk0ntIGkk8fkgazBCCOx1kUG6heGco9UdsA3dmkiS9J2ouqhaEv3gXlBvakAzUllwhv6NwY24lLsbeLpecgTPFEogdEY64aWe1BrLJpoPozIdwGs96wUz2P72KD7XzPBBlLCw6Y6v2+FtvtGH3IcQAO2HttdVRYi+b9kkGB5lZs4gH7XzlfWqVTkYCZZEQTAnx21ZJ0LF+WLtq5XEzOFZZCPVvh4b1tfUinBqkrLHoHKFQ9m1PNuGqbfR3TmMwaQL5s2/Yo4c+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpnlWMiwy1o1fx++wuuqxAtIKGVOeeyMSMWb62fnPIk=;
 b=owm3/S437cNn1YtoxeunNq4W/coBrzuW9hAS/WDXvQT5hBY1+j27NXeFjpp7xv8/9dK9+nhInq4xGK8yXzsQccqpxSQys4lmSa1psUD1VimHV7DgWNdK6JwHQoLHA5OUQ1cdKdssyJXy/ausTNGVY+sF+Y8CNtZfEEYbCvwBjtxa6pW1yv61CDssh3FKhmeQfq+tRdhX9XsB6tiMdBV7/uMrPru4i7qomQR6EolR6n5FdniR0WXVhizC8oG0AyRKb+8T1Xr2/DXr95lQEoN59xHW6QoDncheexf6m4KPj/IjhJSN6xhQC/smBmPLUMuGFz4wfEywAkCE5uNimdEtew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by SJ0PR11MB5183.namprd11.prod.outlook.com (2603:10b6:a03:2d9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 11:36:14 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%5]) with mapi id 15.21.0360.006; Fri, 4 Sep 2026
 11:36:14 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "vkoul@kernel.org" <vkoul@kernel.org>
CC: "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>
Subject: RE: [PATCH] soundwire: debugfs: add root-level peripherals table
Thread-Topic: [PATCH] soundwire: debugfs: add root-level peripherals table
Thread-Index: AQHdOrOen/oFmooauUKkOpcPrWvyALa+CnOAgABCCWA=
Date: Fri, 4 Sep 2026 11:36:13 +0000
Message-ID: <SJ2PR11MB8424EEF8CC938A4DD842F06EFFB52@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260902081802.420946-1-yung-chuan.liao@linux.intel.com>
 <6aa4b17e-042e-4319-a3a2-41f7346f3755@linux.dev>
In-Reply-To: <6aa4b17e-042e-4319-a3a2-41f7346f3755@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|SJ0PR11MB5183:EE_
x-ms-office365-filtering-correlation-id: 89f33372-3a94-423a-96bb-08df0a78b9d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|56012099006|11063799006|4143699003|6133799003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 8CXZ7ly30I6WJT4mr61GLMTSZFWLS4IbwATa/wZ0ialdIaB72lc2huF/z/pUw+5qSr9vU3wZKL6zZ53UhfpT6HNbS9G1tyQh2MD08EWFN2bOxvORjv1nVyMlRed12l7iSJr+PgKh2baEoWsDdm7UIrF3p1ofVt6ePgBmrLpHh4h5suJhTX3lAFO5p4CHLXRuL3pkWAWVEIFSUCxff66DjHgBl8i/cCJ+HKwt86oyF9QdCMyJzFapFX1/UuDIPI8UPSjdPZhQPVmk42h3Lf9+f7Ito7RBFnDLsCezNR7xJN/i/DgRW6Xn5hYibM5gUQfTCHBN9ZgHDHwH0jO+LIbXEnyxrIdAdI8JqkdCamHHiMFF9t95ul99jW0Zvz8cZvcRmKkNnwJPD1zyLf8GHB58ygBOL5jSj0Lxo83IPvKSZPtT4u+W87qmrQyL5RUKHyelfk6M/sGyMfngp6JqsdYGi1V7p2xaIPDqCKO3fM4ksdBhdGR0m/ddrgHrHb83h2Rjc3wIVeoF+7K8Ru/dGpkW/EXJj9xd6UwabZ1SpvCLNSYkROm8QLHTtBv9LVovKa6Kar7orQkVs+QlWo4yMbXirz5ttfHzodZsf5Ynl74jGdUX1D/BYt1gZl99Y6K751P5qYq0uTy5UkJLm8158KT/WaWmTNqVNqu3Zjp6U3qhSLuoweTv02CK2edsPEXLqBwQEOKCoxhR4RUQTX6SOPOEyzAg8ibsRhEDuj6IAvs5obE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUR1ZHZQaWhybTM5UUxTZUg4NzdGMU5uNG44dTVKWmVOUTJteGNMM0RBTUkr?=
 =?utf-8?B?SjVBMDN3VzlUb2pQeEZxSmJJZHlCQU9Dd01QbHh3Uis3c2JhK1BWQmFqWjJ1?=
 =?utf-8?B?bStpNkdiNDVnaU01RVluQTdWcklrcUJwT0UyMThUamNLRkt6aGQ5eVdRSHRU?=
 =?utf-8?B?MWFhQmUvaWZyZHpEVWRUK3ZjZWYweXNuRXcwekorZldLNjk2U1owOG1MUC9J?=
 =?utf-8?B?NmtXQmhXblBPQ2pSWUE0alNJQUlyOXhXYnVDZ3Fub0p2V05oZ1lkbGhTdG1j?=
 =?utf-8?B?a0NVUWxSYmhtOHIrNDV6blFRZ2FqR1N5L1JXd1BoN2lvM01RV0YzTUk5NDl4?=
 =?utf-8?B?UVFOOU5lMlpGZEZwc2ZZckFtQXc2bTZ5Zlg5ZGZWNDY5bm1oU3V4VTJxcmtq?=
 =?utf-8?B?RElYMWJVbUE1SEdoNUdpdzFPbWIwU044VUJpTUdMTXBZN21KSVN1eTExeGVH?=
 =?utf-8?B?YjgrajlvNzFSUSt2UkdZUVlXbk5tQ1ppb2ZPSzg4VmU5NVNBNmxDUTdja2I4?=
 =?utf-8?B?R0d6ZncxalpLdlV6WEZsb1VsMHk4NUFlN2FFeXBHSENSemszcVpHb1hBMWEy?=
 =?utf-8?B?eHlIZU5kWWxMSzlZVUUzenJrMDVTcjNWK0tKZ0VodmJLZVdVMnAvc1daZHZL?=
 =?utf-8?B?aHZnb3JKUldLM3JXQjVESHdSdlcvdk9yQnJ4ell0MVVwT3RRUWVLbnBESUpL?=
 =?utf-8?B?QzYzUko4M29HQ3ZPRlJZZTgyNWhMUHdSdVhZcmxJc2MyRHdWeDlRTjNOdDRu?=
 =?utf-8?B?cGFKekRyZ1Viclp6MXF0cDJieUhIc0w0V3JNU2N0KzZYazhhMjNWaTFuNVQx?=
 =?utf-8?B?UVB0NkwrcnF4SERIbVFHYWs2UzlLZWgvUTVlWlB1ZjZaVmZoQjN0MXJWdUhV?=
 =?utf-8?B?SFFKRCtyZFB1WlFzVklERlNxbnBZRkYvRm5ydXNDUThPRGlhelBwRHVRMEZW?=
 =?utf-8?B?WDFRazVmeGs5MUtUSFlqODVLTHhWR2lrNEgwbFV2TnlMblVQWmMxLzQzaUZG?=
 =?utf-8?B?T1d3akdBTTRXSXpQaXBxZkZlTis0TWtINVpZeFdxOTE1cHpDQldndStZS092?=
 =?utf-8?B?Q3JpUkdlYVZrVjNOaGhwdFUwcHNsU2k0eWl2SEF0cndpL1RxUER2a3lZSlIr?=
 =?utf-8?B?a1FJZGpGR2NweWxndXRNQzdSOTJvenVPbm1hNzR5Q2xVSTNzS1I1NVhXOVJo?=
 =?utf-8?B?eEZQckhwOTVGSHhIV1hEbmV0ZEFIRytIcFkzY2F5YnBhdkRkUnUwQXJIQ3BI?=
 =?utf-8?B?TzNkSkI2cXZoV3EvemhOcWpFMHptUjBnQkdaOU9jRnlvL2tmQW94RWNFZjF2?=
 =?utf-8?B?bFIwNW41YUNrWHpEdTJHZ1lQT2FNUEc1UlhXN1hIYXBHenVXcUkrTk5HaXNq?=
 =?utf-8?B?cnNkZmZPYi9pdVhqSGE4bXZHK3B3bGgxRnQ0REF2dEhJK29pYzVieW5NTTBH?=
 =?utf-8?B?b0daaHpuc0JuZUpZb2UzeUh1b1hTWVhEVlA5RTZrcFh2cTE0b29OdEhJdlpS?=
 =?utf-8?B?bFJWaU9KdERIWmRkYkVSS296U0lkV3c5T3pKSHNzZU5FUzRwSzVCQUJUSjJp?=
 =?utf-8?B?ME1zK2VIdEtkbmVjVDVQSWsyZklWUzVSRGM5bkN2cnpmNGI5VDkxWGh0ZTQ2?=
 =?utf-8?B?czZZNEVOWHJnMm9ZcExYdVFFQnhtR05DUDJ2L3NJNnJkVHBXN1ZHMElaNjQw?=
 =?utf-8?B?MnpGMXpMbXRYTUdUSStPMCtxb0dpcUgxRXppQmpXWnh5WXQrSk80ZVhjL0NE?=
 =?utf-8?B?YkVBUzNpR1pEOWIxNWVrdGZwTHFTS2tmS0xIdktPdTd5aUFMTGZ3bzFBVTd2?=
 =?utf-8?B?VmlWZFhrcmRMY1h1ZjRXNU9Cbks4KzV3YmFTQzJzcHBXYkJqUzZKaUF3bDhD?=
 =?utf-8?B?bjlZUjNoSGZna1ltUmpTVmFGNW9BT1RpWWJLTHdsbzVvZVNVaUxVWDkvdXVu?=
 =?utf-8?B?dDJJU093WTkzbElxcHpNcnVQVmhyL0NjZC8yUG03NkQ1YUhxU08wK0prYWRk?=
 =?utf-8?B?bWdSeEtNcENKYmJJNms2dzVoZnoyUlp6WlFIbG1PQ09HOXRaWm5UeEtqQzha?=
 =?utf-8?B?QkhaczZhY2JiSEpqSzh2SDdoVCt4bmdmWGZNd01lUXZ1cmVsZldDTjJoNDha?=
 =?utf-8?B?ZU5KZDJScXFJUkNWelJnc1VEelBNTTRiZGU5Q2pldkJRUXZNazQvRHAyNkdK?=
 =?utf-8?B?aXo1WW9tTEt3L3g4NTVVY3JRWWU3WUk5RUludk5LeUtyWGJsbTdseGNiWVZK?=
 =?utf-8?B?NThscDN5Rlc3aHg0a0lEeFJZTiszcXJnVWdSdWEwblBVdE5jaE9mU2tVZmdu?=
 =?utf-8?Q?P2Yv9aETco67DG4MAf?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XQXZTNz/hbllwe2m0Z74dqIgq3fCfseuEkPpfBwG7KJdfLBiyZUVF4HrkRsA85pNSVlWG2FGTnAIrp0tkJ8M6N7+xfiQtYRA46pmgu0OFrmDgS0Y9mSfjHxdkAagYgKviuD2rLiGEm/PDcG4eu7jxoU2zVOc6ZwI6tnUyw2WX+u0ZdBv/A8sOHwbkfOs0Nx53RFvGNtLPGAg03Q8YYE+P/ooBamgLQRhRDAQWDqVpPSHgqLevV4GI0b7B+aLrF4w3WIJeB4PE/Ma66m6WyybkfQPjwBZp0WetwC54O/RLBAKBx06yY3G7iyW8rfFR2weX3sMpj+gf1fNG0/qGy8GHw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f33372-3a94-423a-96bb-08df0a78b9d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2026 11:36:13.9233
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eTQ/ZAF3zvQYrCs3a+G9kw+SE8sooQrnmr4UBOq1wrvo6+CjJCpuXe+AMwq+laQ3Lc69ogP2c3gMl6+PDx7m9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5183
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGllcnJlLUxvdWlzIEJv
c3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmRldj4NCj4gU2VudDogRnJpZGF5LCBT
ZXB0ZW1iZXIgNCwgMjAyNiAzOjM1IFBNDQo+IFRvOiBCYXJkIExpYW8gPHl1bmctY2h1YW4ubGlh
b0BsaW51eC5pbnRlbC5jb20+OyBsaW51eC0NCj4gc291bmRAdmdlci5rZXJuZWwub3JnOyB2a291
bEBrZXJuZWwub3JnDQo+IENjOiB2aW5vZC5rb3VsQGxpbmFyby5vcmc7IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7DQo+IHBldGVyLnVqZmFsdXNpQGxpbnV4LmludGVsLmNvbTsgTGlhbywg
QmFyZCA8YmFyZC5saWFvQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gc291bmR3
aXJlOiBkZWJ1Z2ZzOiBhZGQgcm9vdC1sZXZlbCBwZXJpcGhlcmFscyB0YWJsZQ0KPiANCj4gT24g
OS8yLzI2IDEwOjE4LCBCYXJkIExpYW8gd3JvdGU6DQo+ID4gVGhlIHRhYmxlIHdpbGwgbGV0IHVz
ZXIga25vdyB3aGF0IHBlcmlwaGVyYWxzIGFyZSBsaXN0ZWQgYW5kIGdldCB0aGUNCj4gPiBkZXRl
Y3RlZCBzdGF0dXMgYnkgdGhlIGRldl9udW0uDQo+IA0KPiBUaGlzIHNvdW5kcyB1c2VmdWwgaW5k
ZWVkLCBidXQgZG9lcyB0aGlzIG5lZWQgdG8gYmUgaW4gZGVidWdmcz8NCj4gDQo+IFdlIGFscmVh
ZHkgaGF2ZSBhIHN5c2ZzIGVudHJ5IGZvciBldmVyeSBwZXJpcGhlcmFsIGxpc3RlZCBpbiBBQ1BJ
LiBFYWNoDQo+IHBlcmlwaGVyYWwgd2lsbCBoYXZlIGEgc2V0IG9mIHByb3BlcnRpZXMgZXh0cmFj
dGVkIGZyb20gRGlzQ28gdGFibGVzLA0KPiBjb3VsZCB3ZSBwaWdneS1iYWNrIG9uIGFsbCB0aGlz
IGFuZCBqdXN0IGV4cG9zZSB0aGUgZGV2X251bT8NCg0KSXQgaXMgY29udmVuaWVudCBmb3IgdGhl
IHVzZXIgdG8gZ2V0IGFsbCBpbmZvcm1hdGlvbiBvbiB0b3Agb2YgdGhlDQpzb3VuZHdpcmUgZm9s
ZGVyIGluc3RlYWQgb2YgbG9va2luZyBmb3IgdGhlIGluZm9ybWF0aW9uIG9uZSBieSBvbmUNCmlu
IGVhY2ggcGVyaXBoZXJhbCBmb2xkZXIuDQoNCj4gDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBC
YXJkIExpYW8gPHl1bmctY2h1YW4ubGlhb0BsaW51eC5pbnRlbC5jb20+DQo=
