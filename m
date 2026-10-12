Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC29547A876;
	Mon, 12 Oct 2026 14:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816389; cv=fail; b=hNw0ARMw5SR6dveWTUXnDgrA9yFkH3Y7I6oEMozVcNiTWHX22eklS+U8KVLgYh2b+JQMc2/TBYHnetTm2aewQ7reTM1I1y1Pt8Fz2yLhvcCsHs8npheXZV3uYPRwkM13j23koQWktC7hqdxGgdCF5Mc7Zz6o3Wez0Kz4Z36p2AA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816389; c=relaxed/simple;
	bh=nZSkDq65WZq3aN/y5o29C2VEjxbOW0700+R4gm7ysco=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tEMvjm9WZlwrwP50znwUVQcf5U3KkPjQFwhi0tEBOQvjl9MuBCWhd0eMywWszyx9TeaPCZdhe6vKFtLSOY5IhUpVPJyO/zAAT1UemIwhvsKkjd7slij/ixqo/e3IXgV1YDi4b3lhRK+NxQmwCod+o9LNlH/7RzQ1KZ7iPqx7PCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KyNr0LQH; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KyNr0LQH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791816387; x=1823352387;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nZSkDq65WZq3aN/y5o29C2VEjxbOW0700+R4gm7ysco=;
  b=KyNr0LQHbViwvR4r53/Yxgm3HAPlzsl+TmfrDpSpYCVwxF11WXurAZ2W
   9ke4iA057EjdW4zRELpSkNXxz/B2z/ao58VFWSZ9vjfJtkgEM5HhyhVUr
   3U2QZAZHVxESiInP1KXe2XDGe24VQcUqLBarBIjDZsfxSPYBBRepIhe9T
   MVcAKm2p2iG+0rcsCD8BnbwpVMdcHW3nX5Hoj9eFxcIR38B10lPSQUYW5
   OVyMcvxQiWJBRDwXZrQOD1h66cI7IdO9Mwj2s4RTeFPG3q7x1TeaXViiy
   Z8Cd2Eg2atMO3XG7CD8/6JpuVQ4IMUmyY/PlGabqqTomi0Ld/mrg5+M9M
   w==;
X-CSE-ConnectionGUID: cU0gOdHISYOySIuqqIEUJg==
X-CSE-MsgGUID: zwQ6Exg2SvC9NyDLnw3wCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="527617"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="527617"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 07:46:26 -0700
X-CSE-ConnectionGUID: seb7Nx7QTKC1YcaFxgRY1Q==
X-CSE-MsgGUID: s1zGWaL9RtmLkJqWYTuLgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="881729"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 07:46:26 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 07:46:25 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 07:46:25 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.51) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 07:46:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OyiPC6OQ+TOVA3iFUkWuOBnsDGAST0Pyrq75RfpNWxLrBgkwweAWB6AcuSzZr+NtMGzQzOy2yQozU87ppftxeO6VIet/gTbX43UyQTPdCU3PED2gAc/x7LiMlCFxHfbpIvXIcJievdt3rnG7UuBHNnaxgbvPNItrNuDKgdXSa0Y/buYV9nFnp3UtDY3Hzfzpua0gEEJhVUvjg3eCaD4nO6xyKkZxXy5xpnGJFIWBVucndBn6MNn3pO478S0mkD6bLu0DT6tnxkFJJjW2xHELLxNG4do5/hI+Ii9FTeKT3qVuqdIJDfYlvfd2fe3loPDBsbbZf1f296C+TpoB79Ui/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZSkDq65WZq3aN/y5o29C2VEjxbOW0700+R4gm7ysco=;
 b=p3kWoRNkr5hxLX0F8m3zAJbClF7aULGCw9a2p7fzPR6pb2833quj4e4T+FpB9RYapw2mJlnZYxEZwtX8LDH7A0DfzeDO2LDkTDTDRkBzpVSNeh6NpJW6zazNcQWWti62BMzDFr0koXdOxsuNLzXBEKXtoOYC6e196AHTA1hMnAIcoTD94oESQC4rqrD7XakFg2MiOnUBVeF7fZqBNa4coEVEC6KTwYZt5CHN/zNvFVlBC5tB7MDSTebkg9Y+dLHzBlAi7mHxTKtzciDkGjc5m6lsFTcNHerTOCVId4RcE3ZxZ1yWIB7tNjjWUp0+4pB9YiK4WWNSGm7akqVmcbcO2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by CHXPR11MB9628.namprd11.prod.outlook.com (2603:10b6:610:2f9::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 14:46:23 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%3]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 14:46:23 +0000
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
Thread-Index: AQHdRRQPZ2kignuw5UqsnkRDoqnbO7bQAQ6AgACIb+CAIPHYcIAA7uqAgACxODCAAOnSgIAF+pjQ
Date: Mon, 12 Oct 2026 14:46:23 +0000
Message-ID: <SJ2PR11MB8424CCF92DD83A5E890E9C39FF9F2@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260915131327.1783551-1-yung-chuan.liao@linux.intel.com>
 <528a9777-1587-4dfc-a366-000fc0867d4b@linux.dev>
 <SJ2PR11MB8424E1911A4CA6F9414A07DAFFB92@SJ2PR11MB8424.namprd11.prod.outlook.com>
 <SJ2PR11MB8424E1FAF2D8D1EAD84C3B92FF942@SJ2PR11MB8424.namprd11.prod.outlook.com>
 <3b718d6e-462e-4d22-b42b-915cd88bd60f@linux.dev>
 <SJ2PR11MB8424C255FBA45B9F4CA02113FF932@SJ2PR11MB8424.namprd11.prod.outlook.com>
 <175ea8c2-2375-4b1c-a2d0-dcc7998c9e76@linux.dev>
In-Reply-To: <175ea8c2-2375-4b1c-a2d0-dcc7998c9e76@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|CHXPR11MB9628:EE_
x-ms-office365-filtering-correlation-id: 9901f8f3-a67b-40d0-911f-08df286f9621
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|3023799007|38070700021|4143699003|11063799006|5023799004|6133799003|22082099003|18002099003|56012099006;
x-microsoft-antispam-message-info: 8moQmBTRVZLHAmjCAUvFLo7JHnCUii5JNScsqPhb0fXPhrSF0IF6u9uhE1/VLRikJxO/XZ5Iao3p2JuxgKdKd/IYEH+FhXAhjjB1BsCUSGoG9OdPCOxnhH5tDKzdPa46SPmUcMmGD2Ae1eN+IzsAtHZb4YIG/fbdTWkJ0a6wfYJlIxPJx9zYVwTq3nwzxirEt36Vpr63NPaQQq/N4+cwCrM04XpDGhqVb8+LJIT3P8maaW2bre2iGfvlDQdCpFh5oNtR3wYMgOd7XRiAw7AwxNJcr7c3w5KfNLxqlD8UvIBkjgyWW82yXDo85+SdnZd0W4T2oSIgaR/999DjG0u8ahsc3qweTVII/g8yH359CAI2xjDR2sgUVANkuVYszPVL746FHF3IOM489DlPFSegjul0dTzOw3MP8VHRkkDh5D/1EjQ9X60FhvXybqQE8ixRIsyARr2DXvWmAP9tZzMacHu3hz6BbCZ/dhEnSd4x81V2CSATnMnPKA+MO9CiufaZJzgmmzzCg6YMG7PhmLSGCatR8PdLLh94lN5R3ysYXcmVKVCigCXSyYUM4Yi9mimloamSjico6dN6X4O1Ac2oD44JiMbxYGWGekHiRMdM0Dr3bx2nHuhUjD9dj7yUG/8QU3soZbk7ivrkD+Hoeip3dc1rPRDXvfW/usV3NqRScHvWbVxERhSjoVModV6IWx0Cuy2Ajx2ZuQZkf/PgfHEb7YoPN7s9dVAS8epsGR2WGp0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(3023799007)(38070700021)(4143699003)(11063799006)(5023799004)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eFN0OUpsVDNLblc2UWdUUUpSSDd6TGo0UFVzdE5lNlk4R0xyeXVwUlFIQWVk?=
 =?utf-8?B?N1Vrb3VKOS9EekcvMWVCY01QSmFVRUJFQi9yOWRxd2diMW1hQzN3cTRUNkN6?=
 =?utf-8?B?Tk8yNVZxTTh5MnVCeVJERHlsYktHVHVaMkM1SThNdjZ2SFgxcStENDVFcjN2?=
 =?utf-8?B?YVVNblF3R0p1ZDZMeE9sOXp3eklxdjNjL1FXYkRoT1RRV2hxUHVVK09yYUdw?=
 =?utf-8?B?VHdsU256d3hvSVQ0TkhRWFAyaCtrVHQ1Sk9LMHdXeStqaDdKYzZWak51Ymtt?=
 =?utf-8?B?OUJVdEMvb2Q3dnczZ3FLV0hibmV4V0ZCUUhmTHZaVHRiOExQMFpmMHRBMzV4?=
 =?utf-8?B?UDVBWjNxZUEwS3hYbFRNT1JDQi9pbU5PdUdBKzdYNytlZFFXN2xhUDcya04y?=
 =?utf-8?B?eHhJU2I2bWROaENUbnMxNnZkTXRkY0IvcEE0V1NYbzNmWGxhQlcvWVUvZG5w?=
 =?utf-8?B?MkpGMGlNMm01QXA4SzA4N3diZFVqS3czMjBoTjF2SkRrTVA2clFKczlZbm1R?=
 =?utf-8?B?OUVFZGVXdTdrVkxRcjI0Zy9heWh5LzRXeENEa3FyR2JwU3pMa2xWMWhJWFFY?=
 =?utf-8?B?SmcrMjJhNXNGb1J0Skg0SDFjYWdWUkhNQTJrYUhwTWUvWlZZQzc5d1gzMTlH?=
 =?utf-8?B?ZEtYTkl4OG94TTRGY2NpSnlnQ09LUUR1ZVdTRnhXdk9JdVNZVG9wQnNLdGdK?=
 =?utf-8?B?bDZNckhrMzVqTGJpSDZnRVR6NjdwR1VlbmZna1FVSHRiMERPOHUzaWRFYjZp?=
 =?utf-8?B?RVBiZWkvSEFhK1grV3NqS2lybk9wandKa1ZjT1JOSElSM0h4alFHSVpTZ21B?=
 =?utf-8?B?Zk93cGg4SDI0RC9CUlY5Sm5yODBUQnpna3kzT3dzTGM2WWtLY3VWVDJHVHQy?=
 =?utf-8?B?a2lqRmFxdG10NkwxRnZFaVdsd0JVN2lnMk5XSytzK3ZEdTRVK2JpSjZRSnVa?=
 =?utf-8?B?Mnpkb05aaHFtRjJ5RVRvUWcrZDFHYnlMY0FybmlCWnphZHdVcW9nTnVXb2po?=
 =?utf-8?B?VHFCVHhETEpyTkpZYjNoWWpWekJvU0hsVnZBMXVQTlYzb0paYk9lVWFSTUtJ?=
 =?utf-8?B?OGRVVlFWS1RxeGdRYmRzaFgwZU5qZmY4WTNhWUFZck5iaXNoVlF2d3hlZjl5?=
 =?utf-8?B?U2NmY2hSTmJOTWZWSzY0N3lha2Q2UllnRlBpcTZMWU52aHlPaFNabFpmcXZZ?=
 =?utf-8?B?K005U1RkdzE0bWJqNWlLcXBTVnJSMnAxV0JDYkVrMlIyRzhDTFppaXd5NkJl?=
 =?utf-8?B?YmZYK3B2TkluOW0xVHprd280d0dEL01Nbmg3VGxJKzM0Y1JacmJidDdrdEcw?=
 =?utf-8?B?Q3FEMFhzbEw2aG1RRjRDTW9BMnhrdEpKU3hlM2hyY1h4VHN3d1hnTnBWaWla?=
 =?utf-8?B?THRkbmxHQ2FpNHNCTXBnVWhsMmpnd05EQ0NKNTJOckdkdnEwblovSGQvL2h5?=
 =?utf-8?B?bmVMdWR5ZTZaRFdlYXkzdC9ScE8xSDZjK1ZyN2JkcFdUNzBjRmhvTEZMWmdD?=
 =?utf-8?B?MXlNU2ZvenltbjkyS1pYS1RJNWdtRCtwM1VuUko3UE5XLzA2TFZuU1IvZTlE?=
 =?utf-8?B?bTZ1R3pnZVhXMmNwSyt6WWNLSTd6L2RZbUhNcmYzYkJGc3hyUnBGRDluY1BK?=
 =?utf-8?B?ZWNrcWpTVzVQcnFnRkZETU03QXloaHhVQlRjY0ZuOFF4Q2ZweVlKNFBJbTFq?=
 =?utf-8?B?dHBQZHdhMStqUVNHVUVpSTMyVXNla2lkUDVXZCszZEFjNUVKRFNFYXU0TEgw?=
 =?utf-8?B?MlRncENaSW13cFpFS2tQVHNpZE5PTUkwK0prNGJSdzlPYklLcW83OXNmT2VY?=
 =?utf-8?B?R29MM0tTMjZKdkZpQjRyWWgwOUpBTU93NjlEK0paRkxUQzJaN1RXejFwbCs1?=
 =?utf-8?B?WUMvOXdCWDduRFRyaE0xUDVMbDdqSFdqVzFCQjlydVhpUTNvNWY3eHhKaUNv?=
 =?utf-8?B?aEhVN0l6NTMvNVpOc0xCeTRNeThFSUVlM3Y1OWxRVGdma2J6ODRhem1HTVFw?=
 =?utf-8?B?aGpnSUNJUHJwWDFQYVFVa2NYeWNHZDk0SUVYVis1M1lFQWpaeDBrdytHYVBi?=
 =?utf-8?B?TkN4bDdZUjRMWXNpYWlTbnRjejBNNytWbno3enQ4WmdXR1N5b0pldk9XaklY?=
 =?utf-8?B?ZmVvT2VCK3ZtNVNsZlkvbGZKYzdsdFNIc3ZYUFgwWUZmVFJMRkFEUWtJdGFH?=
 =?utf-8?B?OWhRamhvOERFWkM1TmdxbUdDcDZIYWNycnhZWTFSVmxXVG5nM0x3WUZHN2hR?=
 =?utf-8?B?WkhvOVFaMzVTSXF2T2dlMHF6R05vd0pRRWdHSUFSQ3VTZWE0Y3hrV0NUdkQv?=
 =?utf-8?Q?sRwODaV10+xXaOK+BZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: cnuwPlsB55eCXLRilADM1chJ4GY79qz728yL76WKwBQRUc5Gf/SmY3Idn8jkwv3o4fTNbbqNnLv03Lxh1++KIE0WAnGy6QRUJOD3mTE4Ysihy+NVHwfakT/Ewr8ONCJuXa48E37ETu7dZTIYpoUp7L2qbCfVC97GgZy0+h3riwOXTmuQj7OVXAarB+QnEG3akcMrbKZ9tDCP2WmL+G/SAbCz18vA8ea9qxfsmJR8swihM5Ylf8604oB8aYdhQpyTPXD/q3rAz3Bjuluk/4wbFh0oNaqSOvYNjuYTMPZnhV62h/LLrgUgUg7Xl0aTG0N/vnk8qG1OUiXUu8y5X/O+MQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9901f8f3-a67b-40d0-911f-08df286f9621
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2026 14:46:23.4933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Ar9E0vSEaKvwaSBRkL4ZyPe1wKiqD55G+Kmc5niwL7qoy8b8OFjtpYzj3Bl+P3t6j2+67bgzBRFwwslKyfc1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR11MB9628
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGllcnJlLUxvdWlzIEJv
c3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmRldj4NCj4gU2VudDogRnJpZGF5LCBP
Y3RvYmVyIDksIDIwMjYgMTowOSBBTQ0KPiBUbzogTGlhbywgQmFyZCA8YmFyZC5saWFvQGludGVs
LmNvbT47IEJhcmQgTGlhbyA8eXVuZy0NCj4gY2h1YW4ubGlhb0BsaW51eC5pbnRlbC5jb20+OyBs
aW51eC1zb3VuZEB2Z2VyLmtlcm5lbC5vcmc7IHZrb3VsQGtlcm5lbC5vcmc7DQo+IGJyb29uaWVA
a2VybmVsLm9yZzsgdGl3YWlAc3VzZS5kZQ0KPiBDYzogdmlub2Qua291bEBsaW5hcm8ub3JnOyBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBwZXRlci51amZhbHVzaUBsaW51eC5pbnRl
bC5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAwLzNdIEFTb0Mvc291bmR3aXJlOiByZW1vdmUg
Z2hvc3QgcGVyaXBoZXJhbHMgZnJvbSB0aGUNCj4gbWFjaCB0YWJsZQ0KPiANCj4gDQo+ID4+DQo+
ID4+IFRoZSBtYWluIG9iamVjdGlvbiBJIGhhdmUgaXMgdGhpcyBwaWVjZSBvZiBjb2RlOg0KPiA+
Pg0KPiA+PiBpZiAocmV0ID09IC1FTk9EQVRBKSB7IC8qIGVuZCBvZiBkZXZpY2UgaWQgcmVhZHMg
Ki8NCj4gPj4gIAkJCWRldl9kYmcoYnVzLT5kZXYsICJObyBtb3JlIGRldmljZXMgdG8NCj4gPj4g
ZW51bWVyYXRlXG4iKTsNCj4gPj4gIAkJCXJldCA9IDA7DQo+ID4+ICsJCQljb21wbGV0ZV9hbGwo
JmJ1cy0+ZW51bWVyYXRpb25fY29tcGxldGUpOw0KPiA+PiAgCQkJYnJlYWs7DQo+ID4+ICAJCX0N
Cj4gPj4NCj4gPj4gVGhpcyBhc3N1bWVzIHRoYXQgQUxMIHBlcmlwaGVyYWxzIHJlcG9ydCBhcyBB
VFRBQ0hFRCBhdCB0aGUgc2FtZSB0aW1lLg0KPiA+PiBJZiBmb3Igc29tZSByZWFzb24gYSBwZXJp
cGhlcmFsIGF0dGFjaGVzIGxhdGVyLCB0aGVuIHRoZSBlbnRpcmUgbG9naWMNCj4gPj4gd291bGQg
YmUgYnJva2VuIC0gb3IgeW91IHdpbGwgaGF2ZSB0byBhZGQgYSBsYXJnZS1lbm91Z2ggd2FpdCB0
aW1lDQo+ID4+IGJlZm9yZSB0cnlpbmcgdG8gZW51bWVyYXRlIGRldmljZXMuIFRoYXQncyBkaWZm
ZXJlbnQgdG8gdGhlIHRpbWVvdXQgZm9yDQo+ID4+IHRoZSB3YWl0X2Zvcl9jb21wbGV0aW9uLCB3
aGF0IEkgYW0gcmVmZXJyaW5nIHRvIGlzIGEgZGVsYXkgdG8gbGV0IGFsbA0KPiA+PiBkZXZpY2Vz
IHNob3ctdXAgYXMgQVRUQUNIRUQgYWZ0ZXIgdGhlIGJ1cyBzdGFydC4NCj4gPg0KPiA+IE5vdCBl
eGFjdGx5IHRoZSBzYW1lIHRpbWUsIGJ1dCB3aGVuIHRoZSBidXMgc3RhcnRzIGFuZCBkbyB0aGUg
ZW51bWVyYXRpb24NCj4gPiBwcm9jZXNzLCBhcmVuJ3QgYWxsIHBlcmlwaGVyYWxzIGVudW1lcmF0
ZWQgYXQgdGhhdCB0aW1lPyBJbiBvdGhlciB3b3JkcywNCj4gPiBkb2Vzbid0IGl0IG1lYW4gYWxs
IGV4aXN0aW5nIHBlcmlwaGVyYWxzIGFyZSBlbnVtZXJhdGVkIHdoZW4gdGhlcmUgaXMgbm8NCj4g
PiBwZXJpcGhlcmFsIHdpdGggZGV2aWNlIG51bXZlciAwPw0KPiA+IElmIGZvciBzb21lIHJlYXNv
biBhIHBlcmlwaGVyYWwgd2lsbCBub3Qgc2hvdyB1cCBhdCB0aGUgZmlyc3QgYnVzIHN0YXJ0LA0K
PiA+IHdlIGNhbiBhZGQgYSBxdWlyayB0byBza2lwIHRoZSBwZXJpcGhlcmFsIGFuZCBhc3N1bWUg
aXQgaXMgYWx3YXlzIGV4aXN0ZW50Lg0KPiANCj4gV2VsbCwgeW91J3ZlIGdvdCB0d28gcHJvYmxl
bXMgaGVyZS4NCj4gDQo+IGEpIHRoZXJlJ3MgYSBkaWZmZXJlbmNlIGJldHdlZW4gZ2VuZXJhdGlv
bnMuIFN0YXJ0aW5nIHdpdGggQUNFMi4wLCB0aGUNCj4gU291bmRXaXJlIGJ1cyBpcyBzdGFydGVk
IG11Y2ggZWFybGllciB0aGFuIGluIHByZXZpb3VzIGdlbmVyYXRpb25zLA0KPiB3aGVyZSB0aGUg
U291bmRXaXJlIGJ1cyB3YXMgc3RhcnRlZCBhZnRlciBmaXJtd2FyZSBkb3dubG9hZC4NCj4gDQo+
IEluIG90aGVyIHdvcmRzLCB0aGUgdGltaW5nIHRvIHN5bmMgYW5kIHJlcG9ydCBhcyBhdHRhY2hl
ZCBkaWZmZXJzIGJ5DQo+IG9yZGVycyBvZiBtYWduaXR1ZGUuIEkgYW0gd29ycmllZCB0aGF0IHRo
aXMgY29kZSBtaWdodCBicmVhayBzdHVmZiBvbg0KPiBvbGRlciBwbGF0Zm9ybXMuDQoNClRoZSBj
b21taXRzIHdpbGwgbm90IGNoZWNrIHRoZSBleGlzdGVuY2Ugb2YgdGhlIHBlcmlwaGVyYWxzIGZv
ciB0aGUNCkFDRTIuMC0gcGxhdGZvcm1zLiBTbyBpdCBzaG91bGQgYmUgZmluZS4NCg0KPiANCj4g
YikgdGhlcmUncyBub3RoaW5nIGluIHRoZSBNSVBJIHNwZWMgdGhhdCBzYXlzIGhvdyBtdWNoIHRp
bWUgYSBkZXZpY2UNCj4gc2hvdWxkIHRha2UgdG8gcmVwb3J0IGFzIEFUVEFDSEVELiBBIHdlbGwt
aW50ZW5kZWQgaW1wbGVtZW50YXRpb24NCj4gZm9sbG93aW5nIFJlY29tbWVuZGF0aW9uIHsyMTIx
fSB3b3VsZCBlLmcuIHRyeSB0byBmaW5kIHRoZSBzeW5jIHdvcmQNCj4gd2l0aCBhIGRlZmF1bHQg
ZnJhbWUgc2hhcGUgb2YgNDh4Miwgd2hpY2ggaXNuJ3QgdXNlZCBhdCBhbGwgYnkgSW50ZWwuDQoN
CkNhbid0IHdlIHJlbHkgb24gcmVhZGluZyBkZXZpY2UgMCB0byBrbm93IHdoZXRoZXIgYWxsIHBl
cmlwaGVyYWxzIGFyZQ0KZW51bWVyYXRlZD8gSXMgaXQgcG9zc2libGUgdGhhdCBhIHBlcmlwaGVy
YWwgY2FuIGJlIGF0dGFjaGVkIGFmdGVyIHNvbWUNCnRpbWUgd2hlbiBhbGwgb3RoZXIgcGVyaXBo
ZXJhbHMgb24gdGhlIHNhbWUgYnVzIGFyZSBhdHRhY2hlZD8NCldpbGwgaXQgdHJpZ2dlciBhbm90
aGVyIGludGVycnVwdCBpbiB0aGF0IGNhc2U/IE15IGFzc3VtcHRpb24gaXMgdGhhdA0KYSBidXMg
d2lsbCBvbmx5IGdldCBvbmUgYXR0YWNoZWQgaW50ZXJydXB0IHdoZW4gaXQgc3RhcnRzLiBBbmQg
d2Ugd2lsbA0Ka2VlcCByZWFkaW5nIHRoZSBkZXZpY2UgMCBhbmQgcHJvZ3JhbWluZyB0aGUgZGV2
aWNlIG51bWJlciBudXRpbCB0aGVyZQ0KaXMgbm8gZGV2aWNlIDAuDQoNCj4gDQo+IElmIHlvdSB3
YW50IHRvIGtlZXAgdGhlIGNvZGUgYWJvdmUsIHlvdSBhYnNvbHV0ZWx5IG5lZWQgdG8gcmVjb3Jk
IHRoZQ0KPiB0aW1lIGF0IHdoaWNoIHRoZSBidXMgc3RhcnRlZCBhbmQgd2FpdCBUQkQgbXMgYmVm
b3JlIHNpZ25hbGluZw0KPiBlbnVtZXJhdGlvbl9jb21wbGV0ZSgpLiBZb3Ugd291bGQgYWxzbyBu
ZWVkIHRvIGRlYWwgd2l0aCBhIGNhc2Ugd2hlcmUNCj4gYW5vdGhlciBkZXZpY2Ugc2hvd3MgdXAg
d2l0aCBhIGRlbGF5LCB3b3VsZCB5b3UgdGhyb3cgYW5vdGhlcg0KPiBjb21wbGV0ZV9hbGwoKSB0
aGVuPw0KPiANCg0KQ2FuIHdlIGFkZCBhIHBlcmlwaGVyYWwgcHJvcGVydHkgdG8gaW5kaWNhdGUg
YSB3YWl0aW5nIHRpbWUgYW5kIHdhaXQgdGhlDQpsYXJnZXN0IHdhaXRpbmcgdGltZSBvZiB0aGUg
cGVyaXBoZXJhbHM/DQo=
