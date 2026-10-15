Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA3744E02A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068470; cv=fail; b=hyhGGvk63dg5A5SGwqtNGl1X/+HsQv8XPL9cRtvssqKOTTv8lFY+EBa6Ti9ptHuHU4DfvS39NIizf3diX7JI6Opn7I1W/BRxEPGViaKVQ29zGbnH2D6oKFg0bl4kMwOZWmCHraDrC9QqjqMEXIgY419Y/Y9fcWbch2Wcz7b0g7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068470; c=relaxed/simple;
	bh=NJn5ceVtUKjElEoBQkHwyTSIXTs1zaQesDuUQo6kVQ8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PkohwannlgRR/78C/7P+JIUKWKYVFMbvpUCqeCzHmTj1g3W1qpGAxfbH21kW/JYp/z6QZQzCWH0/rWTD7fbyFOCAHR6+pGBtPfZVw79W2o9W0WMDBOUCxeaD/LM0oZYuCb36jgaD0agsNIG3ReeH+lkesQbFKn9ucTc90H17RIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdPc5Nra; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdPc5Nra"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792068469; x=1823604469;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NJn5ceVtUKjElEoBQkHwyTSIXTs1zaQesDuUQo6kVQ8=;
  b=CdPc5Nra8Lwm6xJWkkVLQ6gLX2nrkdmDUay0HB+9PG7MHgyTMcFP02M5
   UEYlUswxUPnvS6RBZrcMSkgzynCfr875qvxCeqVzivSTi/f+Lnxin5eBR
   c1ThCBYZ4yhG+q0nf9mLGljm3p1ujV9bYNtDYVBqRvw6lJ3kR7i2I5PaC
   fv6vQLRqZ4NuCZS7MBs7C4/M/FLQcBGedTVqEuWOTyVl8JYNuJukqnxdD
   CiBp/apuH2SuVGxAhkt7orvcNEupDPqjre8LqaWf+gZLQv2uCcCPxPpN4
   GItrMYFuedsLu4GopKO7nn7mh9gZ+kPaIqnLaVcBHaNqMqBsX92sV0N64
   Q==;
X-CSE-ConnectionGUID: J2NrMVHZTBqzBYp6VBE0oA==
X-CSE-MsgGUID: Zwzl4V0aRY+LqnW1WtYUjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="734843"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="734843"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 05:47:48 -0700
X-CSE-ConnectionGUID: M8JyW9xlRGOuuvw4S7MMCw==
X-CSE-MsgGUID: b486h6S8RqyxJxYfFK1H7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1567850"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 05:47:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 05:47:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 05:47:47 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.1) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 05:47:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0xMlTvxI+6dTRcAJM+u3WdVC5RRffxQPXXLdhW7B+E/JPXqX+Ch3OpF78wiwkGa+uxGknHIXy5gFRw0m28G8c6XpPMGBAEG/hNWvlBLB2/jsRSuGrZA6FADpgdeXlzsXAKTGUg+JWhbDeQ5MHlo5e5MG7M4IJ8XCUZk9CkPIhBbBzljpmldBh3+BLpCufh7znEewiVKHA1mT2MC7W9jpT9e25iASsNyv5/5bIufl9AkANHTdPNM5ZNgpsA/aHlb8lopHqlgZuEYIYKjt9w7GVdRERinlnVyRFGdtNI186xdl4xkZMc5dtdX+rikHLevCc/aDuEmmF/7+g1hQBk+hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJn5ceVtUKjElEoBQkHwyTSIXTs1zaQesDuUQo6kVQ8=;
 b=O4LoIOzlxPxggL1nzHwc9i/qAJJLDp1Ij4aB5yJjV/xxo3dHT92vPUOffOaNf/X4C2ufU5euvoidzHd7rksa+mCMgnHzgbBC11vdrfq+qvH5NE3p6d2g2fP+tMlU11nCD3QQWfVPNtut253V3h0j+fjMJf6r7vJG1u0Unmrnwd5gKTOCMs5QxjOPMCLBkmiHDi93zaKImiyOv+ThqmgMbrPuvcwcxU3P+hGBzIHXVgejazE48idT7KoDXvPFx1aDF2biuZMjkXRApSFcJeTrwyIBygrQgRYawOZQi2SyfgugAbWR1TFOOnkRT5/Mjg37Vxcp58crtUQDgV57Cv2jjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPFE241D7F14.namprd11.prod.outlook.com
 (2603:10b6:518:1::d57) by IA3PR11MB053507.namprd11.prod.outlook.com
 (2603:10b6:208:620::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 12:47:43 +0000
Received: from PH3PPFE241D7F14.namprd11.prod.outlook.com
 ([fe80::4ea1:23b2:56c4:3c54]) by PH3PPFE241D7F14.namprd11.prod.outlook.com
 ([fe80::4ea1:23b2:56c4:3c54%7]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 12:47:43 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Adin,
 Menachem" <menachem.adin@intel.com>, Andrzej Kacprowski
	<andrzej.kacprowski@linux.intel.com>, Karol Wachowski
	<karol.wachowski@linux.intel.com>, Reuven Abliyev <reuvenab@gmail.com>
Subject: RE: [PATCH char-misc-next 4/4] issei: add driver to driver interface
Thread-Topic: [PATCH char-misc-next 4/4] issei: add driver to driver interface
Thread-Index: AQHdXGYf3xuX1sqvBUuFh7/AAO76qrb+JGEAgABjOZA=
Date: Thu, 15 Oct 2026 12:47:43 +0000
Message-ID: <PH3PPFE241D7F14C878F571D90A5918000EED9C2@PH3PPFE241D7F14.namprd11.prod.outlook.com>
References: <20261015-issei_pm_and_itf-v1-0-8212238a57a4@intel.com>
 <20261015-issei_pm_and_itf-v1-4-8212238a57a4@intel.com>
 <4253b355-9505-4854-8ee0-3c1db765d3d2@app.fastmail.com>
In-Reply-To: <4253b355-9505-4854-8ee0-3c1db765d3d2@app.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPFE241D7F14:EE_|IA3PR11MB053507:EE_
x-ms-office365-filtering-correlation-id: cac63de3-85f7-4942-7b22-08df2aba8157
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|10067099003|4143699003|261009223027099003|11063799006|38070700021|56012099006;
x-microsoft-antispam-message-info: Wf+KMhPzqO8jpXss0F6ZuwL/+vYMpmq1AzpwiRTFqrV8ZXmYkCcC6cNcftB6ocpQqqeFUBmixGDX53wG0o3JERYGE8a4+PabQIwEU0Dpq8KLxL6USyJpaeZvybPmr1Hm1pnyMiOa1F0vvjvhMNshXuYFQ97knbpOv4ugNPo+rJs9OTrDVMcTa2OlHMJ3okOi9gDPY8bhYHPQzvKuNhxy7Gw1gSu0+XRbQiIOvjc+Jdls8OZUrH/dzQfJSCYjDXyfeCPOXJlb+oZzhhGAV30inzeIeWdc5zlcV3nfisLicFHjkQh+oiaN/nIzRLXFw1wFQUCGrbqAzg3XSaoJlS/VTn2tcLw3XtPgLDKkzyC7Hf7lM1smbkzseZkZKFKbMdSp2q127Wlm8ENOOxND3agaSbfLZ2IKBIr2eOJjS4AU7vPV/TthHpLt9LrTUSI5ezmbTVZNYtBS6kx/mGqflrPlKlowcp45sIkJ6yUMvtGnUVc+o5gLmTyJ9qY/FTPh05tfEX1tzB593k7R9ap3ZAMroxa9fg7i5yDQGdDzl+XpuUpNE4yCc1sqjy5puQOwUWdG6BLSTXvNPKzZ+Qn2fM4+Tbr+zmmotSOOUfPSJLNev4erqJLi2u9+kBzffRUzU42N15lgUDEGL9mJ/QYIIzaZlwINPX5CtAISTg8q7EMDUgcsMsEk8i4AGmKd5kNg8K1cZ4CdczfmBGcweSUY3lCVGBAsN2aLBlbF+5j1NY+IWuA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFE241D7F14.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(10067099003)(4143699003)(261009223027099003)(11063799006)(38070700021)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGE2aDg3dUszeHR5V2pnWHV2d1ZvOURyVm9oV3l6MkhEQWhwak5rT2lxWVcy?=
 =?utf-8?B?SFhqNE1GZVhXM2pLR3ZqTWw4MU43YWdkanI4V1creE9BZ0ZGL2dsbGJtWnda?=
 =?utf-8?B?bHc3V01pc21LaFYxckthTmVpVWRqWWl6eS9xNmJXSURFRHZzSmlhaXhPS2FS?=
 =?utf-8?B?MTd2SWVvd2ZJL2NrbWxnOURaSm1aa2prdHNGRi9sV1A5TkE2T0hDV3p0cWVK?=
 =?utf-8?B?SnJkcGNBYWtuRkNJblkyOFFOVXRtUk5yQnhpTXROWkRUSFh6Z3Vxc0gyc1or?=
 =?utf-8?B?VnZ3RUNzTkhoY2lTUDk4Mkg0eFNYYnNBME43TUtWUlVOYjZJbVFWOVp5QmQ2?=
 =?utf-8?B?Y25SMk9BNlYxTXh0YVZCek80K3lhcXlYaVZ1ZWRJS2wvVDAvNy9LVVdNcnFh?=
 =?utf-8?B?Y1NrSDZIMlUxc0lhd2RabEJaRnY1WmYyTmZBamkvcVRPRlNqaTZmWVRyM2lQ?=
 =?utf-8?B?a1h0VCtLTjdaU2k4Y2JjOHUweE52SGRuMHVqQlEwZlF1ckZWR0NKVFVlcTE1?=
 =?utf-8?B?U3lTRTJDQWx6RmY2QTlaZjV0cnByRXR1eC8xOWowNWcyenlHQ05uVm1wbjQ4?=
 =?utf-8?B?L0VTekh6RnpZN01yRjc3WE4yWkpFczJ3RERMS0NoQjNFNThYTUM4U3AwR3pL?=
 =?utf-8?B?bDJOelMybnpQT1BraCt1NEZ2bzUySXFrQTkxUHc1OVhBRWNra0xjbEhOeTM2?=
 =?utf-8?B?VDdYZXhkOTFJUnNwV3A3bDJxOVFpbGpnSEpHWUh6RlpSdHpXU2JJNW1acTE0?=
 =?utf-8?B?d2hucXhTeWdUejl0LzRhQ2FQcVh0VjhDSGR4Vkl5NXJLREhhN08xaHc2WEhP?=
 =?utf-8?B?Z0lRRS81NkROYnpFeEhzeWlHYWdtMkhzeFRML000UEY0dW9ZWnFIQ1F2Wk1i?=
 =?utf-8?B?bUVDc1huYUY2aFZsRzd6RFB4TkM0NEFGNlVBN0xQQllnNXFkR1VsOEh3WFJj?=
 =?utf-8?B?N2lPbEFWWmZHUmRXT2NucjdaRVpuSHgvdkdJaEpoY3FuS29EOGY4T0ZzdzlG?=
 =?utf-8?B?UmJWaklOdExiM3hkQ1ljSjVnbnhpTm1Pc2hjdVVLc0tpblU0b1BhWjVGRy82?=
 =?utf-8?B?aW51cnRrcTBaU0lYaVpiMVRhUFk4T256Mk11SVlpU3V0QndHNWNrSDZhaFk0?=
 =?utf-8?B?Vy9HbVNKMFppTU1Fb0M2RTk4NnNtUXpsS281SDh4eVJMMUdBUXZqdkxQdExO?=
 =?utf-8?B?TGQ3VEkzTDZSOGxyK0ZJMytQUWQrZXc1ZlA1L3YwNVYxd1lIUU4vS0J6UU1x?=
 =?utf-8?B?VTFmZ1JoRGhoZWJYUUV2L1pDdHlYcENPWGIvclludUJlb0xlczlWcHhuSVlt?=
 =?utf-8?B?NHBjZjd1N2pEakxiV2lxM1pwZHdNL2I0MDlhc2tnS0VLeHc3Y041WDc3UUJ0?=
 =?utf-8?B?TE5Zd1ZDby91WGU5dUg5aU93eWR6RFZyNjJNTS9iSi9sRGw1RGlwb2Z2Zk5O?=
 =?utf-8?B?czRXVjA5RDVqMy9tc2F2NW9ORVN0SnJUTnFJcSs5OGtzMnYrS2xlRkM4Sllz?=
 =?utf-8?B?Qi9LYVIyUGZvNU92Uk5Ka29uL015Ymg2MGdQQ3hpb3J6b1lqbUwxSFRTOGRl?=
 =?utf-8?B?Y0JUeG01Qm03YUorM1hZTHVSV0M0Mk04R0x5WTFFN3dmRlhmc2dramltUDhC?=
 =?utf-8?B?cjFDMEJLSStFV2ZzdTh1MDVDTjl6ZFZWbTYxSnhnRW5zSTVmNnF5QUlWUWwx?=
 =?utf-8?B?NUsxYS9RSnVqOEFSdzBoMGg5WjB0U2VZWi9FbldXa0l6V0dpMUtkY0ordUhF?=
 =?utf-8?B?a3pRT1g2Yk9XQlljSlJGdmVCNkcyaGdHV1dHWXorVVpxQ0VXcFBydytyMFJT?=
 =?utf-8?B?U1pVZG04RGxBd1BQc0MyQzNKbzdoUEZsNUt5UHBxNGloQVdFa243eUdQaWNq?=
 =?utf-8?B?VllDTVdGMmtHUXVoRlFNeDNhbFhjamZWd0lGaGdXeHRxbGJuMEt0TVJYaWtO?=
 =?utf-8?B?NUhyRHEweHpuSkRtYUNrYkZEMVl0UVJvc29VMzZ5b0c3OUp3YWQxZ1ZvWG03?=
 =?utf-8?B?d2N2Q3Jtc01RZHJzdHJnS2doTC9uWEU0akRkTXc4cDBBSWh1SGFQeDM0UFZW?=
 =?utf-8?B?SlVlSDNBWkZHSDJ0TTZsVkw1UWI5V1cwSTJjclZKd2l4Q1ZpNjA4SWNuVG52?=
 =?utf-8?B?UVZFZkcrM1g5QUQwYU0vSVlacjhPblR2eXF1VUtBTEVKdE5VWVlPUzhhQW9V?=
 =?utf-8?B?cldtZVdJODNNSjZjUXlvRUxTMjlOYkkySnBqSTZtMThpQkFQc3pqUVQ5Y0lV?=
 =?utf-8?B?VWlYNys0THlGOVFqeHRDeTdhZlBHRVp5NGk0TFJ0Zm92RG1MWkNOM3FvQ0Za?=
 =?utf-8?B?Uy9ONTdPblV4Y2E4WWN0S05sc3FnTEFHR0lmSTFoVjZkKzJ0M2IrZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: KAXr0JRa4PJ+3QY/43OWXoiAM5w9za4NT4kzfb6xMqP8gpaYcwjayc8+PDJTU1c5iYNfZTFEpxaecNw/C8pNTknraf2lJmvC3TE9a+uHlNV/hykf5CQJmfEvDX+c0kiKAdhiA476Eg2P+magGN5BjHCSJvjakH2I3Bcfj/zAuAC9xgaydHWREH2NulcZFcChApPjm2XP2dcsZMwHmfa5jSF3aROIlU10uIGCPfkI9YczSnd4WK9hcynC3NhzBBt/wDxKQS8bJd+ZfvTyuBkjNGxjF+1D3/ua0ByON3jt4I5CN1X3dIqBqYX6kXOioSspdFi53w2mGutf5Kgqq9WEog==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFE241D7F14.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cac63de3-85f7-4942-7b22-08df2aba8157
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 12:47:43.1681
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bAF5bR6J5/So3cq+CRxIkqFWDM4bnmX0hRGWI+8VfZdmZeYxVMam9JuibqTpOQGPxq+f+oHHO3MjOvxfDvXz2lTaoh2aieYyJ2sc5zueIUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB053507
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBSZTogW1BBVENIIGNoYXItbWlzYy1uZXh0IDQvNF0gaXNzZWk6IGFkZCBkcml2
ZXIgdG8gZHJpdmVyIGludGVyZmFjZQ0KPiANCj4gT24gVGh1LCBPY3QgMTUsIDIwMjYsIGF0IDA3
OjI4LCBBbGV4YW5kZXIgVXN5c2tpbiB3cm90ZToNCj4gDQo+ID4gKwlpZiAoaWRldi0+cnN0X3N0
YXRlICE9IElTU0VJX1JTVF9TVEFURV9ET05FKSB7DQo+ID4gKwkJd2FpdF9ldmVudF9pbnRlcnJ1
cHRpYmxlX3RpbWVvdXQoaWRldi0+d2FpdF9yc3Rfc3RhdGUsDQo+ID4gKwkJCQkJCSBpZGV2LT5y
c3Rfc3RhdGUgPT0NCj4gSVNTRUlfUlNUX1NUQVRFX0RPTkUsDQo+ID4gKw0KPiBtc2Vjc190b19q
aWZmaWVzKElTU0VJX0RFVklDRV9DT05ORUNUX1RPX01TKSk7DQo+ID4gKwkJaWYgKGlkZXYtPnJz
dF9zdGF0ZSAhPSBJU1NFSV9SU1RfU1RBVEVfRE9ORSkgew0KPiA+ICsJCQlkZXZfZGJnKCZpZGV2
LT5kZXYsICJEZXZpY2UgaXMgaW4gdHJhbnNpdGlvblxuIik7DQo+ID4gKwkJCXJldHVybiAtRU5P
REVWOw0KPiA+ICsJCX0NCj4gDQo+IA0KPiA+ICsJCXdyZXQgPSB3YWl0X2V2ZW50X2ludGVycnVw
dGlibGVfdGltZW91dChjbC0+d3JpdGVfd2FpdCwNCj4gPiArDQo+IAlpc3NlaV9jbF9jaGVja193
cml0ZShjbCkgIT0gMSwNCj4gPiArDQo+IAltc2Vjc190b19qaWZmaWVzKHRpbWVvdXQpKTsNCj4g
PiArCQlpZiAod3JldCA8PSAwKSB7DQo+ID4gKwkJCWlzc2VpX2NsX2NsZWFuX2FsbF93YnVmKGNs
KTsNCj4gPiArCQkJaWYgKHdyZXQgPT0gMCkgLyogdGltZWQgb3V0ICovDQo+ID4gKwkJCQlyZXR1
cm4gLUVUSU1FRE9VVDsNCj4gPiArCQkJaWYgKHNpZ25hbF9wZW5kaW5nKGN1cnJlbnQpKQ0KPiA+
ICsJCQkJcmV0dXJuIC1FSU5UUjsNCj4gPiArCQkJcmV0dXJuIC1FUkVTVEFSVFNZUzsNCj4gDQo+
IFRoZSB3YWl0IGxvZ2ljIGlzIGluY29uc2lzdGVudCBoZXJlLCB0aGUgZmlyc3Qgb25lIGlnbm9y
ZXMgdGhlIHRpbWVvdXQNCj4gYW5kIHBlbmRpbmcgc2lnbmFsLCB0aGUgc2Vjb25kIG9uZSBmbGlw
cyAtRVJFU1RBUlRTWVMgdG8gLUVJTlRSIGFuZA0KPiBldmVyeXRoaW5nIGVsc2UgdG8gLUVSRVNU
QVJUU1lTLCB3aGljaCBpcyBhbHNvIHF1ZXN0aW9uYWJsZS4NCj4gDQoNCkZpcnN0IHdhaXQgaWdu
b3JlcyB0aW1lb3V0IGFzIGl0IG9ubHkgaW50ZXJlc3RpbmcgaW4gSVNTRUlfUlNUX1NUQVRFX0RP
TkUuDQpJZiBhZnRlciB0aW1lb3V0IHRoZSBzdGF0ZSBpcyBJU1NFSV9SU1RfU1RBVEVfRE9ORSAt
IHdlIGNhbiBjb250aW51ZSBpbiBmbG93Lg0KQWJvdXQgc2lnbmFsIC0geW91IGFyZSByaWdodCAt
IGJldHRlciB0byBhZGQgY2hlY2sgYW5kIHNwZWNpZmllZCByZXR1cm4gY29kZS4NCg0KU2Vjb25k
IHdhaXQgd2FzIGNvbnZlcnRlZCBmcm9tIHdhaXRfZXZlbnRfaW50ZXJydXB0aWJsZSBhbmQgSSd2
ZSBtaXNzZWQNCmRpZmZlcmVuY2UgaW4gcmV0dXJuIHZhbHVlcyAtIHdpbGwgZml4IHRoaXMuDQoN
Cj4gPiArI2lmIElTX0VOQUJMRUQoQ09ORklHX0lOVEVMX1NTRUkpDQo+ID4gKw0KPiA+ICt2b2lk
ICppc3NlaV9kZXZpY2Vfb3BlbihpbnQgKCptYXRjaCkoc3RydWN0IGRldmljZSAqLCBjb25zdCB2
b2lkICopLA0KPiA+IGNvbnN0IHZvaWQgKmRhdGEpOw0KPiA+ICt2b2lkIGlzc2VpX2RldmljZV9y
ZWxlYXNlKHZvaWQgKmN0eCk7DQo+IC4uLg0KPiA+ICsjZWxzZQ0KPiA+ICsNCj4gPiArdm9pZCAq
aXNzZWlfZGV2aWNlX29wZW4oaW50ICgqbWF0Y2gpKHN0cnVjdCBkZXZpY2UgKiwgY29uc3Qgdm9p
ZCAqKSwNCj4gPiBjb25zdCB2b2lkICpkYXRhKQ0KPiA+ICt7DQo+ID4gKwlyZXR1cm4gRVJSX1BU
UigtRU9QTk9UU1VQUCk7DQo+ID4gK30NCj4gDQo+IFdoYXQgaXMgdGhlIGludGVuZGVkIHVzZSBj
YXNlIGZvciAhQ09ORklHX0lOVEVMX1NTRUkgaW4gdGhlIGNhbGxlciwNCj4gYW5kIHdoYXQgZG8g
eW91IGV4cGVjdCB0byBoYXBwZW4gd2hlbiBDT05GSUdfSU5URUxfU1NFST1tIGJ1dCB0aGUNCj4g
Y2FsbGVyIGlzIGNvbmZpZ3VyZWQgYXMgYnVpbHQtaW4/DQo+IA0KDQpGb3IgQ09ORklHX0lOVEVM
X1NTRUk9bSAjaWYgSVNfRU5BQkxFRChDT05GSUdfSU5URUxfU1NFSSkgd2lsbCBiZSB0cnVlLCBJ
IGhvcGUuDQpDYWxsZXIgYW55d2F5IHNob3VsZCB3YWl0IGZvciBkZXZpY2Ugd2l0aCBpc3NlaV9k
ZXZpY2VfcmVnaXN0ZXJfaW50ZXJmYWNlKCkgYW5kDQppdCB3aWxsIHJlY2VpdmUgZGV2aWNlcyBh
cyBzb29uIGFzIG1vZHVsZSB3aWxsIGJlIGxvYWRlZC4NCg0KPiAgICAgICBBcm5kDQoNCi0gLSAN
ClRoYW5rcywNClNhc2hhDQoNCg0K
