Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C2A3CD8A4;
	Wed, 23 Sep 2026 16:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181351; cv=fail; b=Ria3AZv5Zy+2jJihEaBYSjOy4l0yEM8cQ02FbNedjGZhZJJWR7J68EKIF6V7dq1xPuGXsdRWxbrw5U7iZIFfyOKvYjSto7YY1+SrpQHMhBxENxl/eT8CsXO+dzdlXopzr2jwxyFy9X3Y+BSiuKF18OlpxjgPJP+vB3EZF5/irCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181351; c=relaxed/simple;
	bh=XgGpvb60MYJHEZPB6XEoIg2EmABun2WWzYI432+uEHE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=txD63NCeyF34+vwnaaV02aR1WxDMBBJgsWEzsHvVLZjnQJJyRfwsVTa0dcYuKXI8hFnFK7P4Jx4vWUOiqEUmQpjgjRRspPCYYYw29myVSEtcGnjL3TpXrG70mZiyyp4RPeZhYRYXwxyZ19k3vgs2/DPS9e6UeH6VrW7oOqGy9N4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nln8OuWA; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nln8OuWA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790181346; x=1821717346;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XgGpvb60MYJHEZPB6XEoIg2EmABun2WWzYI432+uEHE=;
  b=nln8OuWAB90NkN3BNWb3VrUEsLUMyGEvp+OtvfibCVZWPjolKEsgbXv+
   72ggtTLoFj2D1i9bwDlajnbUjJvl4z+V8Wk/syzcXSX/Jpb3lIn4i93Ht
   DjH8aI7xcyNEcosy3bJptSRljusp/hlIFEKYnWDdVaPPFJ054iGoMmqCC
   einvmRI1p54KJht/d2B7OclKvxHUPNXlTe7kyWMaob5M1uODOdGX37qDR
   oBNbVtl9g58DZ1f1RINei18KW1dqaRCEnueVao+NgCggC3NKMIfo2IQ86
   Ct+Eh/nrYCyKcGcud7Do6rbPhzt8mcGpMEqIos68VBmmUIYQf6YRJ98eT
   w==;
X-CSE-ConnectionGUID: Q0iUlviMQTy7cOdQGGGPpg==
X-CSE-MsgGUID: kpWg2QMERFaAOLTdVq5AYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="102257232"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="102257232"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 09:35:39 -0700
X-CSE-ConnectionGUID: Rzf5bwdvQdeigQrrwT1nTQ==
X-CSE-MsgGUID: FBFgP3mITdOTt7QHGw4Jow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="272864398"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 09:35:38 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 09:35:38 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 09:35:38 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.4) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 09:35:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYYKQjcMdEvp/pltaoJ+GfugQL0EjUfHQ3ogVib0CQvCW1PsiW9ArrYgUSAHrJxuhHUdsX2QuFzzMk7sIKB7+TJUwndevw/MA3luyCVUXcYGfSQKZkYbYPRS21uJKG1bQrS6pq2G9KI17o/RH5AGvEApREw4pDtkkE/ngg+7g9zXr2ZL+43A1JhKuKCz9ioFPFKjxVPbirpLUzkLaNHibjRr4pchv9X5PliD4liQEsVxD2FOO9NAHEb1m87f7eYgaSbQYr3ZFMzooalxhjTED/hK0uGc8s4DU+0aR9qH59NWDUXU+C0W1jd5rHPqdnWZKsSpom8DhBJ7s5Y1AdWN8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgGpvb60MYJHEZPB6XEoIg2EmABun2WWzYI432+uEHE=;
 b=odUIFNp+UpADYheEFq7whvbQVFkBNc0uloedxnWwVeSInulU3S5xZDJcRrC39nmkDwmzUrKj3lpfCQaEqZJZz333XKIxMtkGCGU6tlWmekJM//M8B05tvq7lf+iKtOGzWfif/miy9H3lPulyUyEoLjzphaMPrZ338Ma4rCj0SQ0YGaBXopAR1bozTX1E5QeWzADtJMBHV2tVb49FKcRmPUcpccLiyym2MQcObMK/DK/AdrOhPedcQO3bgN4NzIrOCSa/gSpUW3tuJc4wmHNgurHNjYSc+MaUTTFLcNseEPhc8UuYC0BxW4f5uJZcG6S/UWRYt4mPwpqke3Rh/itciQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by SA3PR11MB969295.namprd11.prod.outlook.com (2603:10b6:806:532::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 16:35:36 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 16:35:36 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Bryan Chan <bchimhim15@gmail.com>
CC: Borislav Petkov <bp@alien8.de>, "open list:EDAC-SKYLAKE"
	<linux-edac@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] EDAC/skx_base: Fix ambiguous bitwise and logical operator
 style
Thread-Topic: [PATCH] EDAC/skx_base: Fix ambiguous bitwise and logical
 operator style
Thread-Index: AQHdSujOtwSXUd3zgkSv5v7UR9c8LbbbTDowgAA6eACAANY08A==
Date: Wed, 23 Sep 2026 16:35:35 +0000
Message-ID: <SJ1PR11MB60834A6CB20792962CE05051FC822@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20260922231854.108188-1-bchimhim15@gmail.com>
 <SJ1PR11MB6083B6CEC6BA730C18AD450FFC822@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <179013525089.122719.12798013417319991127.b4-reply@b4>
In-Reply-To: <179013525089.122719.12798013417319991127.b4-reply@b4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|SA3PR11MB969295:EE_
x-ms-office365-filtering-correlation-id: 3c072f12-92aa-44d5-6cb8-08df1990b1d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|11063799006|10067099003|56012099006|22082099003|18002099003|4143699003|38070700021;
x-microsoft-antispam-message-info: rLKOZBsJpl1QvKQ+v6VAKmmF9eTIqXoNU/6rVD6ISC5qsYSggOl2uLAGyJwO4Sj3Xw6EDWxp4Vz+D/zavmPYzRiqYHKXC/V0ocRjFpbZwSurBCP72ICptB3sjMdYFuIQxtxwPTdwQMEDa/Y/7RCjUiAuYHP5MGK60yDhnqGoRQwORvqVVYNGwatWx8OUwq7fyrggpis4ftNxqWTdWi6CSFYXmHVWwJhiM7szjRlcaRJSZD4RbGE9NABQyuLxtNzhPTRWUXaDQxcIrQQ3UcnMvxBSMOTt9POfNVNBLX14oAYYg2UccZEu6qj+eCu1ecpVrKjt2bCwoFfcWJ/wmv1c9Cq3htFgsOCC2uJzGaqLL8poq7K46Y90OFJLIZ7J6aToaI+42/Bdf4p0GNDZPdAZdBIi/P6W9g9/inBx48n2/4kE1wp/F2TWKHEpRtgkEUCjQI+mxVNaCDXAGWvCLd/8oxZfxH37yIRUP/Ag5q18xmGjhTUcUklRqoPhCkGVIq1XSZISJFQFWbKUg14DlVhEWWURvOLMBztsi3j/c/P7p+YUdTz7XW/XKWI0pyoDLu30+jIl+TCQdn188YVV2zThkE/8I2oG8oubbJa5pPLh3J6hFJD9V0KKcioJYCdMBQCwFoGNpnZ5nyHK7Qx4sxNPfTQV9Q8BzmiQX/Hvib/diIwcyw8uQrOLq/aAhmvR9X2qpE79gJpKvdeLfc86g8zX4gPl4tQPgGT0BvNfGceJ/Wc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3dLNVFqMmxiSkQxdytMbVk3VnludGNrUXYzSFNzTDBOTDNrVWU5OC9HeXJG?=
 =?utf-8?B?QVJSREU3c1l1ZDY1bEluZmRhRE5BcjNVemxtY2dJVmRHQWNCTDhYTGdsZnBm?=
 =?utf-8?B?Q084MVlpZ2cwTUFvYTI2WTVtUXBhTXIvb0xuTHgxaWlqR0ZnemhZd1NWR29N?=
 =?utf-8?B?YVdVMFU0T1M5YzFteFErYkI0YmRHUHFzNXB6NHlOeStkcG15Z3JFTEF5QXZS?=
 =?utf-8?B?Y3RscVdZNjF5bHVoVEJ4dGdVWnlJSXIvVWVwS2ZnYnh6UkJOZy81aFY3ZnlC?=
 =?utf-8?B?Vmh1b2RMYlJIdmx5WWVpUnQxMFNzQ2E3YTZpQlZ1U0o4eG9MN1hYaUJXUUdo?=
 =?utf-8?B?S0dETndsNzlIcWtpQ0lQL1VoNmMzVER1WnZCSk1BczFPZ0d3NGN5SzQ3dXEy?=
 =?utf-8?B?c1F1eUtjZGE3L29SZHd5cXR1bWNNYmQ2Q0FZRDlndVRjNEN1N25nOFYyL1RD?=
 =?utf-8?B?dDNWQytlTkxWQzdVSlNndzUwQmJDd0YrZjRERllMTjRuTGVXbnFDRFJ4bm11?=
 =?utf-8?B?WGwyYTlPWEkrdlJCTE16UHJ3WVQ1VHh5Y2NmSXJ3RW8vZ1BmeWFYWGtrNUg3?=
 =?utf-8?B?RzFLWTJqVVM2a0FKU1NrTldxMUVOQldtVlA1UkVrQ2h2cXpXNlYrV0hqZGxS?=
 =?utf-8?B?TGdJUmJSV2Z5UlhJTWRSS3RBaE1BZUFaWTFxMFFtSUpQaHBqQzJUTWdtRGUw?=
 =?utf-8?B?SmNJZ0d4WkJuRkRsdS9SSUxnK2JESkRPWTRuY2YyejdIN3BKUTdlSmNqVlhh?=
 =?utf-8?B?bjAxbDlONnJTY3g2cGppNVd0UmZVQ3RkWk54T0lTTjIzOXYzTVZNT0hpUXVG?=
 =?utf-8?B?ZEZ5U25KWC9EYk5tSWhsY0dZdUVCTE1XZDNqSDhUWDZOQitmaGlKTDNPSHVR?=
 =?utf-8?B?cEorVEtobGFiYzhXVHdNa0NqbUZuMndKaDA3VkZySDVoNWtIazE5R3dmY3ZR?=
 =?utf-8?B?TE9nTFFvNG4wVWpKcjVpNFhDVXp5cHZwQlNCM2dPT3ljVkVWbFljU3pOQ3Zh?=
 =?utf-8?B?Mk9qSTZRTkNpNmtMOE5oVlpOemV5QXJhYkx2NWNlZC91ZEtJaUg3WU5Sdlhw?=
 =?utf-8?B?bmhJdGcvaXVnRHpVdFc1YThJeVU2VklSeFZoVTJLU0NITUlyWTdxaUVlVjQ5?=
 =?utf-8?B?RU5KQnpFZU0rbnMzTTlSV0EyWU1CdmlFRFFrRTcweFFXRkZZTys2K1M1M0dY?=
 =?utf-8?B?VDVmUlJCSWs5MnRVOWMzdWhheCtkSkxxcjhiN2R0dmE2SjkyT2ZidjR5RHlQ?=
 =?utf-8?B?MHlFZno4dFZZZDFaNGNCSXF0eWgvLzdSd1Q3d3pIbGlOeGNTYkYvSUwzcU1N?=
 =?utf-8?B?OFJQem9NSnE3aVhmOXZnaVdYRVk1NUY1bURVeGhaWXNGcXhFdWFaVmMzMGJN?=
 =?utf-8?B?L3daV0pIWEJNbVIyZ3F0bTZobytRYkp4UHFTbzl4R2xCRTNiRWpYdUFMZTFF?=
 =?utf-8?B?RG1rdWxPVGVBdERoeUtmYzdpOGxJSGtFNU1yTUtEeUljeWEyZSs3cGgySDF0?=
 =?utf-8?B?NEtmVzgwRjMwYTZ4b1VXblRneURtWEZkUFFZWDhUbHRRVWhUakRESkoybVli?=
 =?utf-8?B?WjRoT1Y0VWcwQ1Vpd2svbVhDQkdFMHAyUngwY3N5aFR3NFFQZlQ2cFNFcG00?=
 =?utf-8?B?RTlTSXFJUTJEM0kxZHlkQkkyUFJSNEJGZGIrcTJ6T3Nadm5ZSTVLQk9NbzZY?=
 =?utf-8?B?all3VGM4OFB0R3NxMlZ2RkpEZ21OYzBJZUY4ek1oOW9jMm9LWnlYbkwrRjVp?=
 =?utf-8?B?NmdlbXZXQTVibVVKaE90Zmh4ckQrbUoyNHFScnJ4TFZqdlFxVi9YNDRGcmhX?=
 =?utf-8?B?MXhsS21uZTF2eXZEcVlTb2xrN3lSM0hHbm5CTFVqMEZ3ZGtwa3ovbnllWlN1?=
 =?utf-8?B?ZmlVdWxrUVFzV2xxeXJlOGQvZTFZUEFyNlI0amlmVExaSUx1ck5ZR1pJSHNy?=
 =?utf-8?B?SWhad0ZFNk9wenk2a1hKanhnTWIyajNIbVZHTnBFcGxLU3lSU1hIVnk4SmYx?=
 =?utf-8?B?NjBTS2d0OVEyRnJuUld4c3U2YWhZakpoS2o3WUVwUHNEMDVDMmJYVzMvUEsr?=
 =?utf-8?B?OXpVTkVXSlNiUUZPUWVnTm5PYXd2TnA5Z1ljWUdmd0FkTjFwT2pMU0wwb1lv?=
 =?utf-8?B?aXRMMHhGNlN1aUlHdmVLd3R2bmQzM1UwTTluMTB0MXVvQ1h5Vm1DM1BZN1lj?=
 =?utf-8?B?ZG4zUXNUSmwya0xyTWQyNzZDWEREY25OQlpKanNueHQzVXdSVUQxMEM4RHVR?=
 =?utf-8?B?SGxNREpkaStDT1c5MWZHbXFwalZlNGdVa2g3MDJVZGdqaS9HOWtMTVZrbHlk?=
 =?utf-8?Q?gtdVqANDtWwz2V2hgX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ndNxd1SXYr+OvbxhGPl3vX4fHwbTyWNtNAVlbyijOhs8nHLq/8DZBeNhyMiHpx/gUomU/PFntQVDvMcZD8qVojGJZ8281JTRQbkDYSNzZg2/2Ko57LwUUu6v+7ZIbACu0WyjTtlVd+ho8VDuzi/4vYlB2Kuqjmhg5+lQpG971866ETCGyf7rtKnD2YQe0Y9MeETVfbhYnH6tNTBnu6kwf8P57pQ6BQ1/zT0VnPTps9MUl1WCC3RIzB15MYbQG2ZMDZfpTp1qTFElQkS7qCRHNUOohj0MYn/yT7tPJlv9zX4ptQCL0XdQ+1b2xNIZ4/AWvjWT1SLGR7wrqmOBWucGKw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c072f12-92aa-44d5-6cb8-08df1990b1d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 16:35:35.9245
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JxUhOf0wUeWlRX2Q88NoKXSx+jg36wwGNyesC5DUTmhOSx1CweQKRKVedYN5dJDPx3wv1pV0udgM06V9UUYIiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB969295
X-OriginatorOrg: intel.com

PiBTb3JyeSBmb3IgbXkgbWlzdGFrZSwgdGhpcyBpcyBub3QgY29tcGlsZXIgd2FybmluZywgYnV0
IHdhcm5pbmcgZnJvbSB0aGUNCj4gc3BhcnNlLCBoZXJlIGlzIHRoZSB3YXJuaW5nIG1lc3NhZ2U6
DQo+IGRyaXZlcnMvZWRhYy9za3hfYmFzZS5jOjM1OTo0Njogd2FybmluZzogZHViaW91czogeCB8
ICF5DQoNCk9rLiBJIHVwZGF0ZWQgdGhlIGNvbW1pdCBtZXNzYWdlIHRvIHNheSAic3BhcnNlIHdh
cm5pbmciIGFuZCBwYXN0ZWQNCmluIHRoYXQgbWVzc2FnZS4NCg0KQXBwbGllZCwgdGhhbmtzLg0K
DQotVG9ueQ0K
