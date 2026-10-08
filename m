Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792853A6F00;
	Thu,  8 Oct 2026 03:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791429314; cv=fail; b=T/kh6R5i80OutgGsji+RGhhLRmcOYM1ShQJpSmyDb/SAYqnQRdChgIwTQoe+6BGp6X8G3/dcLMxv6UjTwVnbc0Nm6G78TrCeP2JH9FdNCPlluyk9fSnHP3LLJ9qLsEfFy2V0t0gvZ9lKSfAMtTxpkTFAbq24Iee+ZfYzHqjyMGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791429314; c=relaxed/simple;
	bh=fPP0CK/JRW6gBxW8I55AD9RnHU6LWNpxfThb7fjndt8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gN0fw2DGDM7LIB2M1tMUUUo5HhDtlfBRzB5vYJrlGkgUJ5zFhrSQPaPGcWdPtsFhSQIGuXzaGmY2LquPWFa2+G/jt98E4aAzUCUq+PPKvYhnP5HcS3sdPm3kG7/930t09hf046zkTGoQSgq98t0UK0mXmJRCfg74YkS6R8hWjzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gKgAwmGQ; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gKgAwmGQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791429313; x=1822965313;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fPP0CK/JRW6gBxW8I55AD9RnHU6LWNpxfThb7fjndt8=;
  b=gKgAwmGQeBcsijv/HLUT1yZ+vdp+5sckdRvpmZmxt3mNxYKx7AJ//M2T
   ByqzX+5KrE8Rv6kxg1hC+wfAaq6i/FmKf6PGijR0VuG0slOkQh2to3T9m
   Mm8VBXw5iCORbCOA3Wyd2RjDiM0Ii0Z9vtsw9QbPpPoSW6PuTtPfAj0Sc
   7qblqxuS1pb8EiGd0Ziyx/sqJq9kR7RHMpgT9gpCYblXWesMi7R/pBPWu
   nvy4mJxOt3dujMjhTBYHMO0/EOV1yU79NCXeXE8UqOPr6wETJYsabbBYX
   KuGRXQRAb9vD5LJPHil7nTalX/5fIdHOxJRGIgwJbJvP7F82BmlcVyT5B
   g==;
X-CSE-ConnectionGUID: jpZJhDXNS/uH7sQKs2b5Fw==
X-CSE-MsgGUID: Tl9XIht2QF+wdQKxPOg6wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="89737"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="89737"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 20:15:12 -0700
X-CSE-ConnectionGUID: 8NbXTbqhRfa87Uv3Hf+DEw==
X-CSE-MsgGUID: lrHTb8T0QJO0+/hA8CCWVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="315653281"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 20:15:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 20:15:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 20:15:11 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.12) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 20:15:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFBOi4gc6K4g2yQLN4BQa45otVqx0C03h93wbUWQhfAV1oV2lGNApdixqq6A7S612EyuBPyD39etAosSyzrEu+cBTU6sjBkbLZ1E2PSUPuyRO5iosdoNm9QpuP5qvHczkSzzQbgmbO+CaCda0PnCJI1YcEnpknXd8gnHf63QBnVL9NApWwdFfFPRcxA5vCLuPw9eUbyTM8n7UFDW//rdG6nkMbNnipwRdShLLP7zGbNY0DZW0P9/an9a05YW3ngdc54lg42U5BO6qcrw0A6437wcJMHUzKOtP6ztlTr/N/GtFM4S4cpZatC2C88L6r+a22FPcK3azSyCRYgT3VpfEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPP0CK/JRW6gBxW8I55AD9RnHU6LWNpxfThb7fjndt8=;
 b=eIZS0Ir7Qp8vufgMFPfQQjxKqQtsfYKlfBhtpb6K8cI5292lf3nuLd4Iv7hYUQTXR95RYZzkoP+OLVTFGLAEnDHItZnPHO9ky19RyqpAGEa7RxuRqX7tsJl/j4qIgzYC8ps5yED+XhhQ9sF05K2kPh6i5F2s+HdyN0U6c/4toj3tXipl8xfBUI9mreCUzhN44OItB5RVTdMTYVCUSmXau8EDkKAmHHDyrhS9JgdRM1ZwjSvVBvsvx35aToYocgvIogt8f3UOc1+K+qmYo74njpW3coo2Wd5ShMlZ2HgcMSXDER4SFNf0Daph3JqvwPtHs52TT2ACxQ9bOL8IIOP9Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by DM3PR11MB8760.namprd11.prod.outlook.com (2603:10b6:0:4b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Thu, 8 Oct
 2026 03:14:58 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%3]) with mapi id 15.21.0496.010; Thu, 8 Oct 2026
 03:14:58 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "vkoul@kernel.org" <vkoul@kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.de" <tiwai@suse.de>
CC: "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>
Subject: RE: [PATCH 0/3] ASoC/soundwire: remove ghost peripherals from the
 mach table
Thread-Topic: [PATCH 0/3] ASoC/soundwire: remove ghost peripherals from the
 mach table
Thread-Index: AQHdRRQPZ2kignuw5UqsnkRDoqnbO7bQAQ6AgACIb+CAIPHYcIAA7uqAgACxODA=
Date: Thu, 8 Oct 2026 03:14:57 +0000
Message-ID: <SJ2PR11MB8424C255FBA45B9F4CA02113FF932@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260915131327.1783551-1-yung-chuan.liao@linux.intel.com>
 <528a9777-1587-4dfc-a366-000fc0867d4b@linux.dev>
 <SJ2PR11MB8424E1911A4CA6F9414A07DAFFB92@SJ2PR11MB8424.namprd11.prod.outlook.com>
 <SJ2PR11MB8424E1FAF2D8D1EAD84C3B92FF942@SJ2PR11MB8424.namprd11.prod.outlook.com>
 <3b718d6e-462e-4d22-b42b-915cd88bd60f@linux.dev>
In-Reply-To: <3b718d6e-462e-4d22-b42b-915cd88bd60f@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|DM3PR11MB8760:EE_
x-ms-office365-filtering-correlation-id: 5c2c3ba2-535e-4c08-3acd-08df24ea5520
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|5023799004|4143699003|6133799003|10067099003|3023799007|56012099006|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: vXtsGx7BOkZhx8Toylo+7MMS1pG9alsfoHJ/V+KBe1F40vV8qG2SNT7ijMcfCvbYaoeZmvmDU4Ni3xinVH6UNGKfzx0DwehYGS/3SccptA2Jehhr0Eywv0D/fLUbvHuMfrlCjkITsohrZ/xTGbffYuW23kcjX0tCbRmfoT8jGAelRgm4KBK8cKwpEEMYaVtce6qzepstpvi9rq9TdxKNHF7gHKVJrbHORLZir7aPWrlD4LcC78KliF1/TN0sMJBzEfazJXvmFw6trSFmrCKr0yN1NZRBkFzjwdHmYGpnjTxtDnY/xFrTdvSzeJdrlB6Z8VFULZcwpqHrfM8hq4y/U+Uw9DnRZMLzvTVKCwlD5v1PzRrH9iWSiFyrz8ARlvYIYFshaH4bwfwWBosyccxoZxcVxFOk4co/sQaJkddwvTxJToYAa6hWJhcL/VqZPpruHbPaBJHKBx/axpGtfVRhgnFh9WO1b4kwnDd2hhy8sNSr2HRqUDOIz9r8oDpm0mywmv0iJ46Mrqxy6IV6hmTKApMdsYj+MKPyr80YVKZ2cA3asb4aMzyj+sRhDIAgLCRcLyb+OgBLFqy3Bv0VvepIic7sC/dhnLk5vaP/6sqAmcCYM+mvjAM3uTG4LJ65FhxvPEKnr1LhP1j9Bd0D3gNqcHg0O0ec0PcNj2/Ioyeqm2uqW7spIQOuwqAIMesLnVGmOfnihdr5z0w3ZQx/s+DteA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(5023799004)(4143699003)(6133799003)(10067099003)(3023799007)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dldMTWtIWUNVajNBZHVkNVZUemdzRUdmRkdheExtMk9xanF0Q1V1b0tFWERo?=
 =?utf-8?B?ak1ucWpseXN1YzFpZkVBbmpNYWVEOXVtdmpmZVVKSkc2RkJBb0NWK1ltRDZF?=
 =?utf-8?B?MkdRSzI0Z1RGTkJNUUxnaDliaW5GTC9RZTQ0S2ZKajhTdzFJbnYrMk1oUXRE?=
 =?utf-8?B?bnJ3Nk1zTUhEWFhlTGQzRVBIVEdlaHYyTjU2TlkrUDYzdzNDUEgvYk84cjRU?=
 =?utf-8?B?OXJTMHVwc2pEL3ZSaGpDMmUvMFhnRlo4ZklUTlFveWZHRFVOVFpFUlZpeDBj?=
 =?utf-8?B?c204SVdUcEowY1dCQWZsNkw0bklBZnErdVUxVkxSMHNNL1NKRWN0WnM4N0d6?=
 =?utf-8?B?bFN4SGYxa1VOcWpvMk1ISnhxUlJNOWJGa1ZlM1ZiNGVnNWxXOStSYmQ0MlpJ?=
 =?utf-8?B?OUZKZ2NNRUJWVFEvZ0xVV0dSbkx0RkRtVW5EMXNSMGU1aWk1WXhPUWFPR21a?=
 =?utf-8?B?VTlaUzByTE1JRTJRMDNBR2VLZHYxakx4ZElnWlhwU0dsSUg5VmovcEl0QndW?=
 =?utf-8?B?dUhyd1ZUbFBBSFlLTVpqdkxyUkdWT1BlU1dCWEZSMTBzUi82UnNmdlhhcDJ5?=
 =?utf-8?B?SStkaDlxZ1Y5eFRYZWVkSU1YbWFpTHIvbk9oNnB6UmJGVklZVkR3bkt6WTdU?=
 =?utf-8?B?Y0hWZnEzU0VQMG1yV3psVjE0aG42SURnRHlDZlJrQXZSQ3pVYnhmbUxCM09r?=
 =?utf-8?B?aVVDTEpFQzB0N1c0ZGpFRTkxbmY3Y1FxK28xNzgwMlNlSnJWYkY4aXRzY0Jr?=
 =?utf-8?B?elZLL053VGtQNzlRUFFmUXBzMFAyV0ZKZ2pmRVVpYjFvN3dWRlYwZ3Eya2px?=
 =?utf-8?B?ZFBIcmRhNTR2S0Q5elRlazVQTk5iUzgzcHFkZklYRndjbkwvQ0QvcU5scEFJ?=
 =?utf-8?B?WGJ1cnBoUUxDQ3VhcUV3Vzc2RWdOTUE4eUR6cnhvQUx4WEh4S0JuZlhXTGVs?=
 =?utf-8?B?aVBEMHgyaGo0NHBLaU5ZQlBBdmUvT1ZtbER0R1pjWFc4Mk0wajNUZFN1OWpK?=
 =?utf-8?B?T2dWN29lWU5INncrc05lTzRLOFlXS1BmOUNlTURjMklzay9jNTA5T1AxUFFw?=
 =?utf-8?B?RVBDdThXU05mUXRCNFV4ZlprSm10eG90Zkw4Wkl3VlB2bEVSZEt3ZkRLT1hV?=
 =?utf-8?B?OXFsc25qNkxpYnlkNU91bTRSTUk0SlhXMzBoWmlYdzlzNHZDYzdKZGFSV096?=
 =?utf-8?B?TUsrdGlMcG9tOVJUYnUzYVhuc2xVT3dZMGNUVGRNTFlFTkNnN0ZXRExQVlNI?=
 =?utf-8?B?UXQreW9KeFNGNktxUENkY3Q1Vk44V1VSOUcwREM3NU1HRnIzdVJnTEk5V0VW?=
 =?utf-8?B?UVR0UXltTHhiV1REeDNwVkVCNG5GK1NCUUxVcjhVV2F2cGtmNlppQWtFZU5i?=
 =?utf-8?B?OGVycG9VbmorR01xak8ybjNqYllWNEhlSjVLazJDRXVoWUZBMXJCUmpocTUy?=
 =?utf-8?B?UDJtRCtwNVR5YzFWVFBLT1NSTEVaK3IwbiswUU43MW1jeHo2emNSemw2US96?=
 =?utf-8?B?dWhFazh6L3RPWlZpeWw2TW5ycGVVa0dFQkxUaXRaeVVXMEs2VkpSSkZTWUJj?=
 =?utf-8?B?ZlFWOXE2eEJpVWprWmpHVUFLbG9xa1V3M0UyRzIrREdaUGY1Y1N5WHU3V2hX?=
 =?utf-8?B?dFZrOTM1OVRsSkpGZm8vZzVRU1VtdzlabFA3cEJhaVRQeDArd29CZVdwRHEv?=
 =?utf-8?B?aFQrREJGSXloY2xnYTd1SDFUc0tLRDVGRTY3dkdka3lLZzYrcFk0UXhuQlpH?=
 =?utf-8?B?U0dEdk9lWFZIbWFHSEJGUXJXbHBuR0plZGlwSi9SU2FFcGlwZzdpVDJoZEFz?=
 =?utf-8?B?VVdEandKOXp1MVZIMVU5N1ZKdC9KSjhDQUhYNlowalNraEtWRjNDUHhxa2Ny?=
 =?utf-8?B?QUlLMDFGNllJUkFYdjREaGtUOXJ6Q0tRWHlBMGpJeTFyR1hOb2dqcmFORVJJ?=
 =?utf-8?B?L2dyYlc1Mm5QTnJ4anAxa3JaaWpVN2xMNzhyTzQ4WndMdk1LUkkyTlYyZ1dP?=
 =?utf-8?B?bHVtajdvQzF5Z2RZZHZWMGxnM2JSN1FhSWQzdGpISC9ybFRpV1VLRzgzbTFu?=
 =?utf-8?B?TDBrTHRydTlYK0FkdWxDZVN0bmNOUzM0WUpYdXNZU3BqZE9PV0JRZWkzbXpq?=
 =?utf-8?B?WWRISzdIWEhoNmkwbDhBMEtsYng0NU1uQ0ZLRGYrYm5HUklZMGxtNUIyUzQw?=
 =?utf-8?B?bXNCYzNtWEZhbnNSQXBWbE16ZEg3MUpWeHVtdmF3QWMxZGN2UWF0MTczeldP?=
 =?utf-8?B?QjMySVFHTlhwZ0c2ck4yRUpKZnJZQk5QZXNMZjFHMXpFNVQrZnREUHhaVEJw?=
 =?utf-8?B?Qk9sY3NERW44cGxsYnRBOVVlc1crMHdnMzIrOTF6ZUtGcTE5cjVLdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: d8aBMYWf3jQ3c82sY1H+xZ+gBPhorxtzWKG5fjztVAbpqt7vjp5sSO6KCh8A6K2jZJpQB7W9iF763Oowz0ZkThet083HyjpkUcxfWY61UruVNY1Y0PeDOElQrF8yhnGCcRBZGAExh1fucJ/CdIUQZh4Dd8aQvMhROWwSwnOP3/IRUNWN88CR4jk8QyJ8EGmCgCGSDdVpL/pnqo/CesvnO8Njr2VJrL6ez/EnHkyqy6dngm91A0tYSDaJfcQv5zzC2HaIB9dfiItl3w6uCHx5TkqRNksZy8tmoMR/UsQ9F+9bBI6MHjpb3YUgwZNeZxoYK39TP2Vj7dH4i7vtV+ZX9g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2c3ba2-535e-4c08-3acd-08df24ea5520
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 03:14:57.8391
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7lv5PkF8XdGlGyCgmRvwmrTO5R4f0XOmLfn/ptN7LepL5oSJYUeJbOSMlYckJRuhYT9fnBPK9ld5HxSddfKVXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8760
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGllcnJlLUxvdWlzIEJv
c3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmRldj4NCj4gU2VudDogVGh1cnNkYXks
IE9jdG9iZXIgOCwgMjAyNiAxMjozOCBBTQ0KPiBUbzogTGlhbywgQmFyZCA8YmFyZC5saWFvQGlu
dGVsLmNvbT47IEJhcmQgTGlhbyA8eXVuZy0NCj4gY2h1YW4ubGlhb0BsaW51eC5pbnRlbC5jb20+
OyBsaW51eC1zb3VuZEB2Z2VyLmtlcm5lbC5vcmc7IHZrb3VsQGtlcm5lbC5vcmc7DQo+IGJyb29u
aWVAa2VybmVsLm9yZzsgdGl3YWlAc3VzZS5kZQ0KPiBDYzogdmlub2Qua291bEBsaW5hcm8ub3Jn
OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBwZXRlci51amZhbHVzaUBsaW51eC5p
bnRlbC5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAwLzNdIEFTb0Mvc291bmR3aXJlOiByZW1v
dmUgZ2hvc3QgcGVyaXBoZXJhbHMgZnJvbSB0aGUNCj4gbWFjaCB0YWJsZQ0KPiANCj4gU29ycnkg
QmFyZCBJIG1pc3NlZCB5b3VyIGVhcmxpZXIgYW5zd2VyLg0KPiANCj4gDQo+ID4+PiBPbiA5LzE1
LzI2IDE1OjEzLCBCYXJkIExpYW8gd3JvdGU6DQo+ID4+Pj4gQUNQSSBtYXkgcmVwb3J0IGEgZ2hv
c3QgU291bmRXaXJlIHBlcmlwaGVyYWwuIEl0IHdpbGwgY2F1c2UgdW5leHBlY3RlZA0KPiA+Pj4+
IGVycm9yIGxpa2UgZHVwbGljYXRlZCBsaW5rcywgY29kZWMgZHJpdmVyIGNhbid0IHByb2JlLCBl
dGMuIFRoaXMgc2VyaWVzDQo+ID4+Pj4gY2hlY2sgdGhlIHByZXNlbmNlIG9mIFNvdW5kV2lyZSBw
ZXJpcGhlcmFscyBhbmQgc2tpcCB0aGUgbm9uLWV4aXN0aW5nDQo+ID4+Pj4gcGVyaXBoZXJhbHMu
DQo+ID4+Pg0KPiA+Pj4gSSBhbSBhZnJhaWQgdGhpcyByYWlzZXMgcXVpdGUgYSBmZXcgb3BlbnMs
IHN1Y2ggYXMgdGhlICdtb2NrdXAnIHN1cHBvcnQNCj4gPj4+IGFuZCBkZWxheWVkIGVudW1lcmF0
aW9uLg0KPiA+Pg0KPiA+PiBUaGUgbW9ja3VwIHN1cHBvcnQgd2lsbCBub3QgY2hhbmdlLiBXZSB3
aWxsIG9ubHkgY2hlY2sgdGhlIGV4aXN0YW5jZSBpZg0KPiA+PiBubyBtYWNoIGl0ZW0gbWF0Y2hl
ZC4gQW5kIHdlIGNhbiBhbHdheXMgYWRkIHRoZSBtb2NodXAgY29uZmlndXJhdGlvbnMNCj4gdG8N
Cj4gPj4gdGhlIG1hY2ggdGFibGUuDQo+ID4+IEFuZCBpbmRlZWQsIGl0IHdpbGwgYWRkIGEgbGl0
dGxlIGRlbGF5IGluIHNvbWUgY2FzZXMuIEhvd2V2ZXIsIGJhc2VkIG9uDQo+ID4+IG91ciB0ZXN0
LCBvbmx5IGFib3V0IDEgbXMgZGVsYXkgd2lsbCBiZSBhZGRlZC4NCj4gPj4NCj4gPj4+DQo+ID4+
PiBBIGJldHRlciB3YXkgdG8gb25seSBkZWFsIHdpdGggYWN0dWFsIGNvZGVjcyB3b3VsZCBiZSB0
byBvbmx5IHByb2JlDQo+ID4+PiBjb2RlYyBkcml2ZXJzIHdoZW4gdGhlIGNvZGVjcyByZXBvcnQg
YXMgQVRUQUNIRUQgYW5kIGdldCBlbnVtZXJhdGVkLA0KPiA+Pj4gaW5zdGVhZCBvZiBkdXJpbmcg
dGhlIEFDUEkgcGFyc2luZyBzdGFnZS4NCj4gPj4NCj4gPj4gQnV0IHRoaXMgZG9lc24ndCBzb2x2
ZSBvdXIgaXNzdWUuIFRoZSBEQUkgbGluayB3aWxsIHN0aWxsIGJlIGNyZWF0ZWQNCj4gPj4gYW5k
IHRoZSBzb3VuZCBjYXJkIHdpbGwgbm90IHByb2JlIGJlY2F1c2UgdGhlIGNvZGVjIGRyaXZlciBk
b2Vzbid0IHByb2JlLg0KPiA+PiBPdXIgdGFyZ2V0IGlzIHRoYXQgdGhlIGdob3N0IGRldmljZSBz
aG91bGQgbm90IGJlIGFkZGVkIGluIHRoZSBEQUkgbGluay4NCj4gPj4gU28gdGhhdCB0aGUgc291
bmQgY2FyZCBjYW4gcHJvYmUgcHJvcGVybHkuDQo+IA0KPiBJIGRvbid0IHNlZSBob3cgdGhlIERB
SSBsaW5rIHdvdWxkIGJlIGNyZWF0ZWQgaWYgdGhlcmUncyBubyBkZXZpY2UNCj4gcmVnaXN0ZXJl
ZCBmb3IgdGhlIGdob3N0IGRldmljZT8NCj4gSSBndWVzcyB3ZSdyZSB0YWxraW5nIGFib3V0IHNl
cGFyYXRlIGxheWVycy4uLg0KDQpTb3JyeSwgSSBzb3VsZCBzYXkgdGhlIERBSSBsaW5rIHdpbGwg
YmUgInJlZ2lzdGVyZWQiLg0KV2l0aCBjb21taXQgKCJBU29DOiBTT0Y6IEludGVsOiB1c2Ugc29m
X3NkdyBhcyBkZWZhdWx0IFNEVyBtYWNoaW5lIGRyaXZlciIpDQpXZSB3aWxsIGNyZWF0ZSBhIG1h
Y2ggdGFibGUgd2l0aCB0aGUgcGVyaXBoZXJhbHMgcmVwb3J0ZWQgYnkgQUNQSSBpZiBubw0KbWF0
Y2hlZCBpdGVtIGZvdW5kIGZyb20gcGRhdGEtPmRlc2MtPmFsdF9tYWNoaW5lcy4gQW5kIHRoZSBt
YWNoaW5lIGRyaXZlcg0Kd2lsbCByZWdpc3RlciB0aGUgREFJIGxpbmtzIHdpdGggYWxsIHRoZSBy
ZXBvcnRlZCBwZXJpcGhlcmFscy4gRm9yIGV4YW1wbGUsDQphIERBSSBsaW5rIHdpdGggcnQ3MTEg
d2lsbCBiZSByZWdpc3RlcmVkIGV2ZW4gaWYgaXQgaXMgcGh5c2ljYWxseQ0Kbm9uLWV4aXN0ZW50
Lg0KDQo+IA0KPiA+Pj4gVGhpcyBpcyBhIHNvbHV0aW9uIHRoYXQgd2FzIGRpc2N1c3NlZCBhIG9u
ZyB0aW1lIGFnbywgcHJvYmFibHkgY2lyY2ENCj4gPj4+IDIwMTYsIGR1cmluZyBvbmUgb2YgdGhl
IExQQyBtaW5pY29uZmVyZW5jZXMsIGFuZCB0aGUgZGlyZWN0aW9uIGZyb20NCj4gPj4+IG1haW50
YWluZXJzIHdhcyB0aGF0IHRoZSBwcm9iZSBjb3VsZCBiZSB1c2VkIHRvIGVuYWJsZSByZXNvdXJj
ZXMgKHBvd2VyLA0KPiA+Pj4gZ3BpbywgY2xvY2tzKSB0aGF0IG1pZ2h0IGJlIHJlcXVpcmVkIGZv
ciB0aGUgaGFyZHdhcmUgY29kZWMgdG8gYmVjb21lDQo+ID4+PiBmdW5jdGlvbmFsIGFuZCByZXBv
cnQgYXMgQVRUQUNIRUQuIFRoYXQncyB0aGUgcmVhc29uIHdoeSB0aGUgcHJvYmUgaXMNCj4gPj4+
IGRvbmUgb24gYWxsIGNvZGVjcyBleHBvc2VkIGluIEFDUEksIGV2ZW4gJ2dob3N0JyBvbmVzLCB3
aXRoIGFuDQo+ID4+PiB1cGRhdGVfc3RhdHVzKCkgY2FsbGJhY2sgdG8gdGhlIGNvZGVjIGRyaXZl
ciB3aGVuIHRoZSBwcmVzZW5jZSBvZiB0aGF0DQo+ID4+PiBjb2RlYyBpcyBkZXRlY3RlZCBvbiB0
aGUgYnVzLg0KPiA+Pj4NCj4gPj4+IEluIHByYWN0aWNlIEkgYW0gbm90IGF3YXJlIG9mIGFueSBj
b2RlYyBkcml2ZXJzIGRvaW5nIGFueXRoaW5nIHdpdGgNCj4gPj4+IHBvd2VyL2dwaW8vY2xvY2tz
IGluIHRoZSBwcm9iZSBzdGFnZXMsIGF0IGxlYXN0IGZvciBBQ1BJIHBsYXRmb3Jtcywgc28NCj4g
Pj4+IGl0IG1heSBiZSBhIGdvb2QgdGltZSB0byByZXZpc2l0IHRoaXMgZGlyZWN0aW9uLiBTRENB
IGNsYXNzIGRyaXZlcnMgZG8NCj4gPj4+IGV4YWN0bHkgd2hhdCBJIGRlc2NyaWJlZCwgdGhlIHN1
YmRldmljZXMgYXJlIHJlZ2lzdGVyZWQgb25seSB1cG9uDQo+ID4+PiBlbnVtZXJhdGlvbiwgbm90
IGR1cmluZyBBQ1BJIHBhcnNpbmcuIEl0J3MgYSBtdWNoIHNpbXBsZXIgZGVzaWduIHdpdGggYQ0K
PiA+Pj4gbG90IGZld2VyIHBvdGVudGlhbCByYWNlcy4NCj4gPj4+DQo+ID4+PiBQcm9ibGVtczoN
Cj4gPj4+IC0gdGhpcyB3b3VsZCBiZSBhIHZlcnkgaW52YXNpdmUgY2hhbmdlIHRvIHNkd19zbGF2
ZV9hZGQoKSwgd2l0aCB0aGUNCj4gPj4+IGRldmljZV9yZWdpc3RlcigpIHNraXBwZWQgYW5kIG1v
dmVkIHRvIHRoZSBlbnVtZXJhdGlvbiBzdGFnZS4gSXQnZCBoYXZlDQo+ID4+PiB0byBiZSBvcHQt
aW4gYW5kIHVzZWQgb25seSBhIG5ld2VyIHBsYXRmb3JtcyB0byBhdm9pZCBicmVha2luZyB0aGUN
Cj4gPj4+ICdsZWdhY3knIGRldmljZXMuDQo+ID4+DQo+ID4+IEkgZGlkbid0IGNoYW5nZSBzZHdf
c2xhdmVfYWRkKCkuIEFsbCB0aGUgY2hhbmdlIGluIFNvdW5kV2lyZSBkcml2ZXIgaXMgdG8NCj4g
Pj4gYWRkIGEgZmxhZyBhbmQgYSBjb21wbGV0aW9uIHRvIHNoYXJlIHRoZSBpbmZvcm1hdGlvbiBv
ZiB3aGV0aGVyIHRoZQ0KPiA+PiBlbnVtZXJhdGlvbiBvZiB0aGUgYnVzIGlzIGNvbXBsZXRlZC4N
Cj4gDQo+IEkgc3RpbGwgdGhpbmsgdGhpcyBvcHRpb24gd291bGQgYmUgYmVzdCwgdGhhdCB3YXkg
eW91J2Qgb25seSBkZWFsIHdpdGgNCj4gZGV2aWNlcyB0aGF0IHJlcG9ydCBhcyBBVFRBQ0hFRCwg
d2l0aG91dCBuZWVkaW5nIGFueSBhZGRpdGlvbmFsDQo+IHdhaXRfZm9yX2NvbXBsZXRpb24uDQoN
CldpdGggdGhpcyBvcHRpb24sIHRoZSBjb2RlYyBkcml2ZXIgd2lsbCBub3QgcHJvYmUgYW5kIGxl
YWQgdG8gdGhlIHNvdW5kDQpjYXJkIGRvZXNuJ3QgcHJvYmUuIE15IGdvYWwgaXMgdGhhdCB0aGUg
bWFjaGluZSBkcml2ZXIgd2lsbCBvbmx5IHJlZ2lzdGVyDQp0aGUgREFJIGxpbmtzIHdpdGggdGhl
IHBlcmlwaGVyYWxzIHRoYXQgYXJlIHBoeXNpY2FsbHkgZXhpc3RlbnQuIFNvIHRoYXQNCnRoZSBz
b3VuZCBjYXJkIHdpbGwgcHJvYmUgYW5kIGF1ZGlvIHdpbGwgd29yay4gVGhpcyBpcyBhbHNvIGJl
bmVmaWNpYWwgdG8NCnRoZSBjYXNlIHRoYXQgYSBwZXJpcGhlcmFsIGlzIGJyb2tlbi4gVGhlIG90
aGVyIGVuZHBvaW50cyB3aWxsIHN0aWxsIHdvcmsNCmluIHRoYXQgY2FzZS4NCg0KPiANCj4gPiBE
byB5b3Ugc3RpbGwgaGF2ZSBhbnkgY29uY2VybnMgYWJvdXQgdGhpcyBzZXJpZXM/DQo+ID4gT3Ig
bWF5YmUgSSBjYW4gYWRkIGEgbW9kdWxlIHBhcmFtZXRlciB0byBkaXNhYmxlIHRoZSBmZWF0dXJl
Pw0KPiANCj4gVGhlIG1haW4gb2JqZWN0aW9uIEkgaGF2ZSBpcyB0aGlzIHBpZWNlIG9mIGNvZGU6
DQo+IA0KPiBpZiAocmV0ID09IC1FTk9EQVRBKSB7IC8qIGVuZCBvZiBkZXZpY2UgaWQgcmVhZHMg
Ki8NCj4gIAkJCWRldl9kYmcoYnVzLT5kZXYsICJObyBtb3JlIGRldmljZXMgdG8NCj4gZW51bWVy
YXRlXG4iKTsNCj4gIAkJCXJldCA9IDA7DQo+ICsJCQljb21wbGV0ZV9hbGwoJmJ1cy0+ZW51bWVy
YXRpb25fY29tcGxldGUpOw0KPiAgCQkJYnJlYWs7DQo+ICAJCX0NCj4gDQo+IFRoaXMgYXNzdW1l
cyB0aGF0IEFMTCBwZXJpcGhlcmFscyByZXBvcnQgYXMgQVRUQUNIRUQgYXQgdGhlIHNhbWUgdGlt
ZS4NCj4gSWYgZm9yIHNvbWUgcmVhc29uIGEgcGVyaXBoZXJhbCBhdHRhY2hlcyBsYXRlciwgdGhl
biB0aGUgZW50aXJlIGxvZ2ljDQo+IHdvdWxkIGJlIGJyb2tlbiAtIG9yIHlvdSB3aWxsIGhhdmUg
dG8gYWRkIGEgbGFyZ2UtZW5vdWdoIHdhaXQgdGltZQ0KPiBiZWZvcmUgdHJ5aW5nIHRvIGVudW1l
cmF0ZSBkZXZpY2VzLiBUaGF0J3MgZGlmZmVyZW50IHRvIHRoZSB0aW1lb3V0IGZvcg0KPiB0aGUg
d2FpdF9mb3JfY29tcGxldGlvbiwgd2hhdCBJIGFtIHJlZmVycmluZyB0byBpcyBhIGRlbGF5IHRv
IGxldCBhbGwNCj4gZGV2aWNlcyBzaG93LXVwIGFzIEFUVEFDSEVEIGFmdGVyIHRoZSBidXMgc3Rh
cnQuDQoNCk5vdCBleGFjdGx5IHRoZSBzYW1lIHRpbWUsIGJ1dCB3aGVuIHRoZSBidXMgc3RhcnRz
IGFuZCBkbyB0aGUgZW51bWVyYXRpb24NCnByb2Nlc3MsIGFyZW4ndCBhbGwgcGVyaXBoZXJhbHMg
ZW51bWVyYXRlZCBhdCB0aGF0IHRpbWU/IEluIG90aGVyIHdvcmRzLA0KZG9lc24ndCBpdCBtZWFu
IGFsbCBleGlzdGluZyBwZXJpcGhlcmFscyBhcmUgZW51bWVyYXRlZCB3aGVuIHRoZXJlIGlzIG5v
DQpwZXJpcGhlcmFsIHdpdGggZGV2aWNlIG51bXZlciAwPw0KSWYgZm9yIHNvbWUgcmVhc29uIGEg
cGVyaXBoZXJhbCB3aWxsIG5vdCBzaG93IHVwIGF0IHRoZSBmaXJzdCBidXMgc3RhcnQsDQp3ZSBj
YW4gYWRkIGEgcXVpcmsgdG8gc2tpcCB0aGUgcGVyaXBoZXJhbCBhbmQgYXNzdW1lIGl0IGlzIGFs
d2F5cyBleGlzdGVudC4NCg0KPiA+Pj4gLSB0aGVyZSBpcyBzdGlsbCAqbm90aGluZyogdGhhdCB3
b3VsZCB0ZWxsIHlvdSB0aGF0IGFsbCBjb2RlYyBoYXJkd2FyZQ0KPiA+Pj4gb24gYSBnaXZlbiBw
bGF0Zm9ybSBjb21wbGV0ZWQgdGhlIGVudW1lcmF0aW9uLiBZb3UgY291bGQgaGF2ZSBhIGZpeGVk
DQo+ID4+PiBkZWxheSBidXQgdGhpcyB3b3VsZCBuZWVkIHRvIGJlIGxhcmdlIGVub3VnaCB0byBj
b3ZlciBhbGwgY2FzZXMgYW5kIHRoYXQNCj4gPj4+IGNvdWxkIG1ha2UgdGhlIHBsYXRmb3JtIGJv
b3Qgc2xvd2VyIHRoYW4gdGhlIGN1cnJlbnQgc29sdXRpb24gLSBub3QgaWRlYWwuDQo+ID4+DQo+
ID4+IFllYWgsIEkgc2V0IGEgMyBzZWMgdGltZW91dC4gSSBiZWxpZXZlIHRoYXQgaXMgbGFyZ2Ug
ZW5vdWdoLiBBbmQgdGhlIGZsYWcNCj4gPj4gYW5kIHRoZSBjb21wbGV0aW9uIGlzIHRvIGF2b2lk
IHRoZSBtZWFuaW5nbGVzcyB3YWl0aW5nLiBXaXRoIHRoZQ0KPiA+PiBpc19wcmVzZW50IGZsYWcs
IHdlIGNhbiBlbnN1cmUgYSBidXMgd2lsbCBub3QgYmUgd2FpdGluZyBmb3IgbW9yZSB0aGFuIDEN
Cj4gPj4gdGltZS4gQW5kIHdpdGggdGhlIGVudW1lcmF0aW9uX2NvbXBsZXRlIGNvbXBsZXRpb24s
IHdlIHdvbid0IHdhaXQgZm9yDQo+IHRoZQ0KPiA+PiBnaG9zdCBkZXZpY2UgdG8gYmUgZW51bWVy
YXRlZC4NCj4gPj4NCj4gPj4+DQo+ID4+PiBBbm90aGVyIG9wdGlvbiB3b3VsZCBiZSB0byBwYXJz
ZSB0aGUgQUNQSTAwMTggZGV2aWNlLCB3aGljaCBkZXNjcmliZXMNCj4gPj4+IGF1ZGlvIGVuZHBv
aW50cyBhbmQgbWFrZXMgcmVmZXJlbmNlcyB0byBjb2RlY3MsIHdoaWNoIGNvdWxkIGJlIHVzZWQg
dG8NCj4gPj4+IGZpbHRlciBvdXQgJ2dob3N0JyBjb2RlY3MgdGhhdCBkb24ndCBwcm92aWRlIGFu
eSBlbmRwb2ludHMuIFRoZSBzcGVjIGZvcg0KPiA+Pj4gdGhpcyBBQ1BJMDAxOCBpcyBub3QgcHVi
bGljIGJ1dCBjb3VsZCBiZSByZXZlcnNlLWVuZ2luZWVyZWQgZnJvbQ0KPiBXaW5kb3dzDQo+ID4+
PiBwbGF0Zm9ybXMuIFRoZSBtYWluIGJlbmVmaXQgaXMgdGhhdCB0aGlzIGZpbHRlcmluZyBjb3Vs
ZCBiZSBkb25lIGluIHRoZQ0KPiA+Pj4gQUNQSSBwYXJzaW5nIHN0YWdlcyBhbmQgbm90IGNoYW5n
ZSBhbnl0aGluZyBpbiB0aGUgcHJvYmUgYW5kIHN0YXJ0dXANCj4gPj4+IHNlcXVlbmNlcy4NCj4g
Pj4NCj4gPj4gSXMgQUNQSTAwMTggcmVsaWFibGU/IFdpbGwgaXQgc3RpbGwgbGlzdCB0aGUgZ2hv
c3QgZGV2aWNlPyBUaGUgZ2hvc3QgcnQ3MjINCj4gPj4gaGFzIGFsbCBlbmRwb2ludHMgbGlzdGVk
IGluIGl0cyBEaXNDbyB0YWJsZQ0KPiANCj4gSWYgaW5kZWVkIHRoYXQncyBjb3JyZWN0LCB0aGVu
IHRoZSB1c2Ugb2YgQUNQSTAwMTggd291bGQgb25seSBtYWtlIHNlbnNlDQo+IGlmIHRoZSBwcm9i
ZSBoYXBwZW5zIG9ubHkgb24gYXR0YWNobWVudCwgbm90IHdoZW4gZGV0ZWN0aW5nIHRoZSBBQ1BJ
IElEDQo+IGFzIHdlIGN1cnJlbnRseSBkby4NCg==
