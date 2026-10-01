Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E25B3D47A0
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790872467; cv=fail; b=pES9p6HV1xs4vpjcz61njdBb4yDas9L9c63DHaHM0u+oZ/DzoWKnDM9i40MydZ1sQqCBVZfUpd3elgOjIJdzjVq/Oewxut4FdFILq1DEnzACd532MU2xXF5JusrYRCNcILVawiizgP2jkH0L8C1S/iNhUo06DCIY4rW7pRTa+h4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790872467; c=relaxed/simple;
	bh=4oUF/JhSbmDyo8h1TEUYXZOvq52xmcffvF+slndcdnA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bj5VsOjObOwbELn26RadZ2C8X3KwHhIFd7IHzFCimU3pPXJell6h3ry4XQAj37Icg6Xq+Uofii9TpsyQ0rBpuTz+grTsrECInKmetQsXJmpNgRSWxDoOgSvDoTIn74u6/icakvsxAYOsrHQ1iyRaDSa8erYTqbK5J7kyKmO34kg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dt8vDt4y; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dt8vDt4y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790872466; x=1822408466;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4oUF/JhSbmDyo8h1TEUYXZOvq52xmcffvF+slndcdnA=;
  b=Dt8vDt4y5rc9Sgm+HBW3BrfnP4DGoK+YPEv+BL8d0g11foDnc/71k2Ai
   0ixZ2P/QJQ4z+zSe5iscn0Mx2LcPmkC/3zA5pjwA4LWfxo8cFMCFFqvgm
   IJCFLHIAfzDiWO2coLUWYH/M6cveOlyu5kg4MCJJCo4Q1FMpR8CKkbTD9
   x9RiVBdCyg3Upyie5eWZwXSFhAquEk/XVxqlJMA1jivod6ocalT5t587h
   Nco6jYjDwdb6QLReJs8GVFi7bEldy/3p/K3GEVZlxkJNzg9t3hs+I2vDt
   k8vzTU1ErZj9rC/fNaex3lhWav4Qe75CB3xx2ypAlqCn3kuoAM/OR6jkK
   Q==;
X-CSE-ConnectionGUID: aof0XE0NRpmhrmmW+zWV4A==
X-CSE-MsgGUID: 5bvwNlNLTEeNzpNuBRRcFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="94123491"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="94123491"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 09:34:23 -0700
X-CSE-ConnectionGUID: ZJCPJaEmR8GG/2eknLv/Yw==
X-CSE-MsgGUID: 4W/CK72/S5iCK5pu4aawiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="280794457"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 09:34:23 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 09:34:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 09:34:23 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 09:34:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/KQM7pAH6uCB+Zpxc1BH4rst+HpHq2GqeRYOtIOb78BnuXBhUIPcefIJ+wnizI7cMkkbfBPHG1cffnUzaHcdW5nqCzNGYQVew26OKVI8niF4ETVxQ4xRjPyq02RGtonL3qk4bI6jqP2Ik+vIOt/DV5r1k7BV+jl2t0IcdEFBvv8oy22Ek/0IHKQ1fK/Z8NOyXM3Zkzczlxl62uy9Vv450IqFUSLY1BKUB8E9PQ3tm262hIogKui3nMklZgk0fw93rIpBgy8PN1KQbVR4pEKtlNNRpCrIg5fa4lKxXcXpN0AyKUW1hT2sBAEytV6ohVHXea2BqjEhNvvgoiWGgFhIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4oUF/JhSbmDyo8h1TEUYXZOvq52xmcffvF+slndcdnA=;
 b=Ms7c60CpRrR+3T5As21QiEmmBi15beZazG2NMVVGcUKDrLVNpTdOz3RV6gNVKXZcFhxqMRoPkJtewgqrSLI9GAYK4N01QI1uoDiH0QVLcRfV6G5cPNMAdx8DJooOmJbURpzBD4bJsWX+VXUUCBbwVm8OCj89RULbFbp45EOleGCJ6zfjc+t+H1DORiqhcrtXgAHc0t5Umpnbr8X40tI0uVyjixpqr1oulg8/HZKoqK30qCESqOc12pVFfS7qeawmN/9VN5yLYfs8aAOPynlOxwjvLqpvRUD5+wAUPQanDhEygsoiYjW3H6ddbkI72idDC5+raqKp1KDhI7UHQjaAMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by SA1PR11MB8541.namprd11.prod.outlook.com (2603:10b6:806:3a9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 16:34:17 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0451.014; Thu, 1 Oct 2026
 16:34:17 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "Yu, Yu-cheng" <yu-cheng.yu@intel.com>, "luto@kernel.org"
	<luto@kernel.org>, "hitesh.murali@imperva.com" <hitesh.murali@imperva.com>,
	"bp@alien8.de" <bp@alien8.de>, "peterz@infradead.org" <peterz@infradead.org>,
	"x86@kernel.org" <x86@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"rppt@kernel.org" <rppt@kernel.org>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "tglx@kernel.org" <tglx@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] x86/mm/fault: Test _PAGE_RW, not pte_write(), in
 spurious_kernel_fault_check()
Thread-Topic: [PATCH] x86/mm/fault: Test _PAGE_RW, not pte_write(), in
 spurious_kernel_fault_check()
Thread-Index: AQHdUb+0pwYx9q5XNkGJXxGTNARCh7bo4eYA
Date: Thu, 1 Oct 2026 16:34:17 +0000
Message-ID: <10955849251def44fdc006926b78b1dc39301032.camel@intel.com>
References: <20261001-x86-fault-spurious-rw-v1-1-7fe1189b5efd@imperva.com>
In-Reply-To: <20261001-x86-fault-spurious-rw-v1-1-7fe1189b5efd@imperva.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|SA1PR11MB8541:EE_
x-ms-office365-filtering-correlation-id: 0171fa30-84e2-4164-49f7-08df1fd9d652
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|10067099003|5023799004|56012099006|11063799006|6133799003|22082099003|18002099003|38070700021|921020;
x-microsoft-antispam-message-info: nN0scXepvM9PNs1X3AFpwJxz2+IeyNyZzXXPgfqmIlfcYfiApuztv5Rsit5tFATi4FmFbR3k/cCL7yg84RGY9EwGrIpR2VsaIilcRY8yThhywhiwZOdap1WofV4BpbSaroWm8/7teQmgxTBde8iQ0NhNBeUOqUK4GdJxK2x9Pgexi2g7GnQJjPhhTeA6vlIyKy2Nc8d1nvI5Ccg5tm9Iq5y4/kJVN6I8xQdM78CR4q9B3kXIOrJTZs9vdOuvmhbFIg+Xwm4Zu6Z+kwilnTMxrB8rto23dlGiiYBYq7Ym9WNxRxi37h34VykiDWeAVFhYpJsenNvfZYW4ltDdvr0menv4EAbB/bbqJW7ReKg0kTcjEKAIUdZjV87/A+/T46VLbADYQv4r9vTzDojH/5tw1ZYaz4kv7jrgAvc7H4rDNR7AVwWAP4VFnaabctyBDEJ1TmpgsEqBNPxw3f2icyAN564V+2h5tEC6cu4+YFE4uBkHapKmJ0LdHeR2I8/QvWmMLrwNltP5g6x9Pn/4E6Z2+H2wOkL9eUQDJMxL8bJuEZKRhclEODxgBrb2cVcCutJjkRyN6cYhvxsiRMjU10y9g0uos3pmg5fIsRgshuDB3LnhUumXY7JGEdA8zfAJaMv4ON0r/h91x8edfb4mam3EKHhqgPh/3jG4eGXFcGA0dfusva8ZWm/GULHduztM/+U92Ug7ImwzXaZl00FY+i/qjACiykBBf4MA+pqPbTjd3ZVWPAgB2wCSjxuLuBDt8wNj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(10067099003)(5023799004)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?LzdLblhpazhKMGowa29waHpDa2lwNjZYZEhjcFRKTlRaMjBsRTBNdG9jdElr?=
 =?utf-8?B?Qkt0OXdTWGVobldHaUdjbjhQczN4T1pOSy9tTnFIbVg1Nkd5L2hyaFJFVFZ4?=
 =?utf-8?B?WjhmTFlkaHVxb3BxYm4wbHBza0ExSUtlaWFKN2crUE9HSUhuTWVVQW5XV0pI?=
 =?utf-8?B?Q29KT3BMdXdzR2NlemNXT0Yxb0JMd3NCMTRkVFlvK1VIN2loMk5XWEJGakFV?=
 =?utf-8?B?bDZEOFN5Zkk5clllZElkdmRCdm02RXRoYWxhR2I0Q2F2ODQzRHpyVVVSQUNN?=
 =?utf-8?B?WnBiVTZvemppR001cXpHNWEzOHZPUEtwMldqVHN4TWFzSHlxY005NncwVWZ1?=
 =?utf-8?B?d3NxNWk4SlAvSURzSDMxelU1UWovRmZrSWNBMzg2VjRBRzVzRzJYUGxZMkxv?=
 =?utf-8?B?UXRWeFRqZnF1TUgwa0VTSXE2c1JZZ1A2aHFsM1ZVY01lbTNGLzFmVVBoTlN4?=
 =?utf-8?B?TzVRVUU2aVJkOCtka3RQc2xKOFc0b2dyUE5lRnljZTRBOFNSVWMrVnpJWXFY?=
 =?utf-8?B?ZnVGaXJ6SllOY2dzL1FIcEdRVHFBUWhSVTBrYm5YanE2aDdIZ3EyUnJ2UWJr?=
 =?utf-8?B?MHlzRjhwbFNEeGVHU0dWQm5saEMyVUM2T0IxTWFxWFRtYXE0NXFIZEJIYkJ6?=
 =?utf-8?B?S0RlTitNbTdpK1d0Z21MdmRvWktwdEhtdm8wdDZvLzdKczJuZHpWM0NkaWZI?=
 =?utf-8?B?MFpZWjlGajduNTdDYnFmWkNRYUpyNmRIRjhQYW13bEtPUmdDeURBbGR0YUJM?=
 =?utf-8?B?MTNVT3ZUczZIQjRUb0JXanduREFncmRMQjBnank1cHdNK0F0SmozSlN6d203?=
 =?utf-8?B?cExicXlkNVNmaFg0U0NuM3RsOUMwcGhnKy9HRDhXTmVxZXc2d0NieVBVL3pv?=
 =?utf-8?B?NFBYSEs5V2V6Zll1L2hNQlMydEgvMEx2aWY2eTFZQmNHcHhhK0RFMU9McjND?=
 =?utf-8?B?K2Q5czcwWHhhZ3A1Y2pVTVVhWkFLYWUyM2d3TVBRcjlZK1UzT0phV3RIQ1Nj?=
 =?utf-8?B?eTBsZC9FYjNLWXBuLzE2MUxaMU9IYmFxUlFZYnBlL3VLWExYUmNzVHFiV0R0?=
 =?utf-8?B?eG5LTGpidUFuMllScDAzMDY5bXBraW1xRHpWWmxERkdqYXdsdlpRS3VLOEd5?=
 =?utf-8?B?RXFPL3lBbC92YUViMnpoMHc5Z2hXWXZKcGhqV1JlYXVjWWVSMFkxMDNTOGVZ?=
 =?utf-8?B?enRJRWZvUVF2Qmp3U0lnRlFXWHFHeXY1VXNCdXZOWmVpaTVNR1lRUUVBcFd4?=
 =?utf-8?B?NlBMbmFIOW9rbzVSd2t3MjlWTmJCRHJiOU5pNUR1cmRLakY5eWhGdFBPdXdJ?=
 =?utf-8?B?VkVWMkZGMkppWllUWWE1c25jTUdoazFOcHYzU0h1aE1NTGVwNWV4VXl3SUZH?=
 =?utf-8?B?V0ExWHpCSXA2Z0daMEpKNCtnTExlV0wyUDBOVHZ1ZERScEFFbUo1OE5BYTJP?=
 =?utf-8?B?NnhtdUpFMElJUUhzbTJIV3Z0SU1acTFuL1lzVE82Y0o2Vmppa0UvS3U4djVv?=
 =?utf-8?B?WUxWTW53R3JKZkY2UmFBUGZYdDBGZVUvT0RaeGd6UDk5OU42ZkFpSGtjUmFk?=
 =?utf-8?B?aWt4QXJMK1NjL1QzU0JZUUd3N0RoS1lKbHhkT1NFRW94Z0FsZ2tFVjJDWDFn?=
 =?utf-8?B?NXVnSjZ6Q3pROS8zdkwyanNubEg1RU9lbzFSWUQ5QWVwWFhiNytPWXlWQ01Y?=
 =?utf-8?B?L0cwYzlkTDRCNDNFWkNxampsNU5iTTFNVGhVa1BqZVloMmZpSkRnRnNUbnAx?=
 =?utf-8?B?TU5zelpLNEVyYU5NVUh5MmVNWlF1WFZ4WlFhYVJncExLN0Z3RHdKQTE2a1Vs?=
 =?utf-8?B?R2ZBYkpBUkhRb2FNQXZjS1l0WFdXOWV0N1QxTVdLVWNrejRsT2NFNEtub0pp?=
 =?utf-8?B?aUJSWmMrQ1Uxd0hNUjVtV3JPRWFpalRuVFRzT1cxemRKNGgvYmlNRGJGYWFV?=
 =?utf-8?B?OW50NGRSbVFPMmtZTTI2SThLbDZrUUVpalc1cC9WeXA1RXlNNnYyaTFaa09y?=
 =?utf-8?B?SkVMRmltaFQxVGM4VElHakdsZTB0cm5UMUtQam9WQUFiMDRSSkYvaWY2TjlX?=
 =?utf-8?B?a1ExWTVPbGN1OXR6b2hVY21UNkxRSFVmc0E4Q3d6TGFMZlNMdDJ0MTFDWUZu?=
 =?utf-8?B?Mmt1RXBCcVVNd3dseGJVZ3diUjIyYi9oQmh5TjEveEtZaG1WZ2ZNL2JzT0Y0?=
 =?utf-8?B?ZmZRRWMzeHhzdWVqdXluSXNudkhIa0NNWjUyQUR4d25rZk1UWEcrREl2WU9i?=
 =?utf-8?B?OERGeUNlM3NUdnlWMEVKQlB0ZlY3emFCcVFLbmZUSVgySWNYVHkrWnRwRGQy?=
 =?utf-8?B?VXhvWWtIajNkVy9IZ1JHUXQ4OTJoWWtuVDJPV1JPSzZYM29uQ2tvbWlVTlFp?=
 =?utf-8?Q?uB6vJ5H6gl4Tm6lE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2FD4DE59CE83BD4CB107488EBE58B80B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: PL6yNB0evzLuqiUEUmoYmE+/YHZNgA6xl40osVHWzsCxEbU+V5v6pvKihUyDAIFaPoWIv42ZUBTfxQazs6Zmk4d6MOYhc4QKGALOLlLw4Pyxs405qlMtcFytdycRXJ+QneUIZdiPYho5pC1E4NyxQnPdpkHym9nVFng1BL23AWteeX2X9g4EjncFXYSZvsn+wXu1dP//xCW+UJiyRERmswwvjY39By/OZuTZqd1eP0kdCq9m20RehRip1B98EfWIim1jVCfTXN8j2It0HcFqFwd4zZzkiPyEEq1j6eHIMeE3IkIJUxknOOu9A8melTfs/ZZe7jT05ogvWNipVt7ulQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0171fa30-84e2-4164-49f7-08df1fd9d652
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2026 16:34:17.3860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3HnrecQQMrRpzxfWufc9E3AY0QOeWRHsAyJDJHK1rXVA088abM+oHL2EJ3Agb4dLx3oukRM20nn+8TWHmgcuYb/pGMmtYGPT6SxATpDNURI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8541
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTEwLTAxIGF0IDE5OjEyICswMzAwLCBIaXRlc2ggTXVyYWxpIHZpYSBCNCBS
ZWxheSB3cm90ZToNCj4gRnJvbTogSGl0ZXNoIE11cmFsaSA8aGl0ZXNoLm11cmFsaUBpbXBlcnZh
LmNvbT4NCj4gDQo+IHNwdXJpb3VzX2tlcm5lbF9mYXVsdCgpIG9ubHkgY29uc2lkZXJzIGZhdWx0
cyB3aG9zZSBlcnJvciBjb2RlIGlzIGV4YWN0bHkNCj4gWDg2X1BGX1dSSVRFIHwgWDg2X1BGX1BS
T1Qgb3IgWDg2X1BGX0lOU1RSIHwgWDg2X1BGX1BST1QuIEEgd3JpdGUgZmF1bHQNCj4gdGhhdCBy
ZWFjaGVzIHNwdXJpb3VzX2tlcm5lbF9mYXVsdF9jaGVjaygpIGlzIHRoZXJlZm9yZSBhIG5vcm1h
bCBzdG9yZSwNCj4gbmV2ZXIgYSBzaGFkb3cgc3RhY2sgYWNjZXNzLCBhbmQgd2l0aCBDUjAuV1Ag
c2V0LCB3aGljaCB0aGUga2VybmVsIHBpbnMsDQo+IHRoZSBoYXJkd2FyZSBwZXJtaXRzIGEgbm9y
bWFsIHN0b3JlIG9ubHkgaWYgX1BBR0VfUlcgaXMgc2V0LiBUaGUgY2hlY2sgaXMNCj4gYXBwbGll
ZCB0byA0SywgMk0gYW5kIDFHIGxlYXZlcyBhbmQgdG8gdGhlIFBNRCB0YWJsZSBlbnRyeSwgYW5k
IF9QQUdFX1JXDQo+IG1lYW5zIHRoZSBzYW1lIGF0IGVhY2ggb2YgdGhlc2UgbGV2ZWxzLg0KPiAN
Cj4gQ29tbWl0IGJiM2FhZGY3ZDQ0NiAoIng4Ni9tbTogU3RhcnQgYWN0dWFsbHkgbWFya2luZyBf
UEFHRV9TQVZFRF9ESVJUWSIpDQo+IG1hZGUgcHRlX3dyaXRlKCkgcmV0dXJuIHRydWUgZm9yIFdy
aXRlPTAsRGlydHk9MSBlbnRyaWVzLCB0aGUgZW5jb2Rpbmcgb2YNCj4gc2hhZG93IHN0YWNrIG1l
bW9yeSwgc28gdGhhdCBjb3JlIG1tIHRyZWF0cyBzaGFkb3cgc3RhY2tzIGFzIHdyaXRhYmxlLg0K
PiBwdGVfc2hzdGsoKSBkZWNpZGVzIHRoaXMgZnJvbSBYODZfRkVBVFVSRV9TSFNUSyBhbG9uZSwg
c28gaXQgYXBwbGllcyBvbg0KPiBldmVyeSBzaGFkb3cgc3RhY2sgY2FwYWJsZSBDUFUsIGFsc28g
d2l0aCBDT05GSUdfWDg2X1VTRVJfU0hBRE9XX1NUQUNLPW4uDQo+IEZvciBhIGtlcm5lbCBtYXBw
aW5nIHRoZSBoYXJkd2FyZSBkb2VzIG5vdCBhZ3JlZTogdGhlIGtlcm5lbCBuZXZlciBzZXRzDQo+
IElBMzJfU19DRVQuU0hfU1RLX0VOLCBzbyBhIHN1cGVydmlzb3IgV3JpdGU9MCxEaXJ0eT0xIGVu
dHJ5IGlzIGFuDQo+IG9yZGluYXJ5IHJlYWQtb25seSBlbnRyeS4NCg0KSSd2ZSBhbHdheXMgd29u
ZGVyZWQgaWYgd2UgcmVhbGx5IG5lZWQgc3B1cmlvdXNfa2VybmVsX2ZhdWx0KCkuIERvZXMgYW55
b25lIGtub3cNCndoYXQgZnVuY3Rpb25hbGl0eSBkZXBlbmRzIG9uIGl0PyBBbHNvLCBhbHdheXMg
c2VlbWVkIHN0cmFuZ2UgdGhhdCBpdCB3b3JrcyBmcm9tDQp1c2VyIGFjY2Vzc2VzIHRvIHRoZSBr
ZXJuZWwgaGFsZiBvZiB0aGUgYWRkcmVzcyBzcGFjZS4NCg0KPiANCj4gS2VybmVsIHJlYWQtb25s
eSBtYXBwaW5ncyBhcmUgY3JlYXRlZCB3aXRob3V0IERpcnR5IHNpbmNlIGNvbW1pdA0KPiBmNzg4
YjcxNzY4ZmYgKCJ4ODYvbW06IFJlbW92ZSBfUEFHRV9ESVJUWSBmcm9tIGtlcm5lbCBSTyBwYWdl
cyIpLCBidXQgYQ0KPiBzdG9yZSBtYWRlIHdoaWxlIF9QQUdFX1JXIGlzIHRlbXBvcmFyaWx5IHNl
dCBsZWF2ZXMgRGlydHkgYmVoaW5kLCBhbmQgdGhlDQo+IGtlcm5lbCBkb2VzIG5vdCBjbGVhciBp
dCBhZ2Fpbi4NCg0KVGhlIGludGVudGlvbiB3YXMgdG8gcHJldmVudCBSTyxEaXJ0eSBtYXBwaW5n
cyBhbGwgdG9nZXRoZXIgdW5sZXNzIHRoZXkgd2VyZQ0KcmVhbGx5IGludGVuZGVkIHRvIGJlIHNo
YWRvdyBzdGFjay4gU28gbWF5YmUgdGhhdCBpcyB0aGUgcmlnaHQgZml4LiBEbyB5b3Uga25vdw0K
d2hhdCBmbG93IGxlZnQgdGhlIFBURSBpbiB0aGlzIHN0YXRlPyBJdCB3YXMgdGhpcyB0ZXN0IG1v
ZHVsZT8gT3Igc29tZXRoaW5nIGluDQp0aGUgdXBzdHJlYW0ga2VybmVsPw0KDQo+ICBBIGxhdGVy
IG5vcm1hbCBzdG9yZSB0byBzdWNoIGFuIGVudHJ5DQo+IHJhaXNlcyBhIHByb3RlY3Rpb24gZmF1
bHQsIHdoaWNoIGlzIHRoZW4gY2xhc3NpZmllZCBhcyBzcHVyaW91cy4gVGhlDQo+IHN0b3JlIGlz
IHJlc3RhcnRlZCwgZmF1bHRzIGFnYWluLCBhbmQgdGhlIENQVSBtYWtlcyBubyBwcm9ncmVzcy4N
Cj4gDQo+IFdoZW4gdGhlIHNvZnQgbG9ja3VwIHdhdGNoZG9nIHJlcG9ydHMgaXQsIGl0IHJlcG9y
dHMgYSBzdHVjayBDUFUgYXQgdGhlDQo+IHN0b3JlLCB3aGljaCByZWFkcyBhcyBhIGxvbmcgcnVu
bmluZyBsb29wIHJhdGhlciB0aGFuIGFzIGEgd3JpdGUgdG8gYQ0KPiByZWFkLW9ubHkgcGFnZS4g
VGhpcyB3YXMgZm91bmQgd2l0aCBhbiBvdXQtb2YtdHJlZSBtb2R1bGUgdGhhdCB3cml0ZXMgdG8N
Cj4gLnJvZGF0YTsgb24gYSBkaXN0cmlidXRpb24ga2VybmVsIGNhcnJ5aW5nIGJiM2FhZGY3ZDQ0
Niwgb24gU2FwcGhpcmUNCj4gUmFwaWRzLCBvbmUgQ1BVIGxvb3BlZCBvbiB0aGUgc3RvcmUgZm9y
IGRheXMuDQo+IA0KPiBUZXN0IF9QQUdFX1JXIGRpcmVjdGx5LiBUaGUgZmF1bHQgdGhlbiB0YWtl
cyB0aGUgcmVndWxhcg0KPiBiYWRfYXJlYV9ub3NlbWFwaG9yZSgpIHBhdGg6IGFuIGV4Y2VwdGlv
biB0YWJsZSBmaXh1cCB3aGVyZSB0aGUgYWNjZXNzDQo+IGhhcyBvbmUsIGFzIGZvciBhbnkgb3Ro
ZXIgcmVhZC1vbmx5IHBhZ2UsIGFuZCBvdGhlcndpc2UgYW4gb29wcyB0aGF0DQo+IHJlcG9ydHMg
dGhlIGZhdWx0aW5nIGFkZHJlc3MgYW5kIHRoZSBwYWdlIHRhYmxlIGVudHJ5Lg0KPiANCj4gRml4
ZXM6IGJiM2FhZGY3ZDQ0NiAoIng4Ni9tbTogU3RhcnQgYWN0dWFsbHkgbWFya2luZyBfUEFHRV9T
QVZFRF9ESVJUWSIpDQo+IEFzc2lzdGVkLWJ5OiBMTE0NCj4gU2lnbmVkLW9mZi1ieTogSGl0ZXNo
IE11cmFsaSA8aGl0ZXNoLm11cmFsaUBpbXBlcnZhLmNvbT4NCj4gQ2M6IHN0YWJsZUB2Z2VyLmtl
cm5lbC5vcmcNCg0KDQo=
