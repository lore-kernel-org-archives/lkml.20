Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3575D44A40C
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 12:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791291233; cv=fail; b=d4DnLt4VWzSLkxEaB9w7XAOIQ8BEFPtUHxdCXwii/xduSAUnPSi1/0JBBrVoecbezwtlVGYJDdnPUHdgv5pnHd9/JphB3CS7VR+XXfN5jI4KzHPPJVBRCQULQFCmuLQR7GdCNa70Wizf+mTc8ZVEGflX9zodaFhvaicwhQNkqic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791291233; c=relaxed/simple;
	bh=K2wT6CHc0l1UZXiGHbpCOd0qDa8xCFNpfy4hxfwl7m0=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KQH9ZQxYNN94We02ykuA2R0SKt/jP6KcIBTgUbGfff2tS6eRwRsBC/lZkjNF9eW0f4gkWt0Sv8G+f8ZfGVrFac1/wyRWPR4X/n46v8LyWL+enlywJvsitpZR1x9eamzldU7bTtwFtxi5n88vWqFYcA87p06kQXmT/IS0y+5FwBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mSIeKmqJ; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mSIeKmqJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791291232; x=1822827232;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=K2wT6CHc0l1UZXiGHbpCOd0qDa8xCFNpfy4hxfwl7m0=;
  b=mSIeKmqJF7UE2hRp7P/nX/BkBBssBGGfOj9YY+b/C2ZXQOmAESYfjreR
   wHQhHfrRE+3RzeJDhBpFNKnscL3mgfPYDCpwn3ahbMVZ38oT2C35OR2te
   NeGPQO54jw/JRytlnM0989xOKD7kNPgfsz7w8K83BVDbA/eDRfoK7befd
   YtYYknsp93jb4WP7ev94DDYOzPnbtd+Ux4mu4MucDscYV9LGiZe3fbApr
   gXwq+6OKN7k3chzuL1PdGA320/AOwe1srwwWBbn3nLFZ8qZUaXNndxN0w
   FpDCDrm5WMrq0PoehBHDcK0kKBeVP2IgLT/GBaRoEeBREiQ85DXXF8H9A
   w==;
X-CSE-ConnectionGUID: 5jiy9FtQRSavs4saH27phg==
X-CSE-MsgGUID: H2ODGsxZQ/ua1A/iKdh/iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="17887"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="17887"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 05:53:50 -0700
X-CSE-ConnectionGUID: e1bYvLyKShu0fW4XKSPhHQ==
X-CSE-MsgGUID: ngMf2/kbQ8yaTQ2YlPmfQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="276264262"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 05:53:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 05:53:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 6 Oct 2026 05:53:48 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.8) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 05:53:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bveiH+IZPPUz831jI+37CrAr4GIXgFq6PJmF6TKwzqYNkRsbT256O+/XvHKaRGGkvg3Nc0fJFNpZ/rUNzPzqUIpLE7Mq/54zyOysaaNNAEHTMN55ZNmQJj/VEp0KPgQ6H+TDj+5WnIJZ23cxTtgdDaW6hC83Odysr1fRB46SAU5msi/nFxbypaCS9C2kc5P1viY7ZMO0Arn+AjYHdvJq6BzrGrgCdWZKhroUUfF+uKb6G3t4i8rkRMCIU8Q2TB0SgmyobL1x8MTXEXzqMDbNVknMLqmzdrPLogK6wHDEe5MDg0UteioXExZOJ8I/HD+0ftZa5cQkiTIemZT5Ew4TqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgSMskvsXDWXQpH54YPgCiLgXF+lpGnj9GqEdEWtTFk=;
 b=gWRpwgjLYbtTWIrYOHI6LOLVOegtBhLtgqhi4sO7xPaRDV248qtXuFonLa1z0S5b4p8XUklTYo39Isjf8uSkC4SEU+CRJWAKC8bxVQsVkd5rM47XrtiTt+WQI6i+X/LqEr41R/zUzD7E01RkGSQn4VPyQ55Y+Oc+x90SglCtqGgpvyHlza3D7nczlRDfPmPk3cbqPx2TYiSIGTSXqKvo/jvooHao4l0hLt3Wk7bthZQgQqw2QxHYhJUfP3rxi1PvqKDD4rqgwlcRNadD5Tp3UFoGftjKHg695VMbwg+12DSiBfPYLE4ewj/lWksudlH6thEeseH4c46bQ3TuAociDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB081371.namprd11.prod.outlook.com
 (2603:10b6:610:34d::17) by SN7PR11MB7020.namprd11.prod.outlook.com
 (2603:10b6:806:2af::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 12:53:44 +0000
Received: from CH3PR11MB081371.namprd11.prod.outlook.com
 ([fe80::dead:ac74:f146:cf8c]) by CH3PR11MB081371.namprd11.prod.outlook.com
 ([fe80::dead:ac74:f146:cf8c%5]) with mapi id 15.21.0496.010; Tue, 6 Oct 2026
 12:53:44 +0000
From: "Hahn, Matthias" <matthias.hahn@intel.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>
CC: "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"peterz@infradead.org" <peterz@infradead.org>, "Hahn, Matthias"
	<matthias.hahn@intel.com>
Subject: [RFC/DISCUSSION] x86/tsc: Handling legacy PIT fallback calibration on
 modern platforms
Thread-Topic: [RFC/DISCUSSION] x86/tsc: Handling legacy PIT fallback
 calibration on modern platforms
Thread-Index: Ad1VfW6GJFdWcHhxSfSywrMry6HhvA==
Date: Tue, 6 Oct 2026 12:53:44 +0000
Message-ID: <CH3PR11MB08137159D0CC079C8BFA13F6E7F1952@CH3PR11MB081371.namprd11.prod.outlook.com>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB081371:EE_|SN7PR11MB7020:EE_
x-ms-office365-filtering-correlation-id: 5a942b80-0737-4d6f-7266-08df23a8db0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10070799003|10067099003|56012099006|6133799003|11063799006|18002099003|38070700021;
x-microsoft-antispam-message-info: 7ovW1LV1FEpEItTLkHj3i8fhUZGhDU+jn3LMo2mOVyACi0tO9hhmLUBJ7C0cFznAox8RQlHnzmQY7PRtTmEKHAEX5s6MT7am2sV7Tg6qrMl3+LUW5OCPwIww3pq4e0uNA12gf3LTe2FipxT198yuOlLz6VGk1qxpaEGS0l7I3TMdE5OoyTVGPa9a92CFR9goO1VdAfUYlBhtAbm6a10yJZ5/Nt3O7gGLxYlmBQoz/6dpuQXh6P9DngxxZu84DXIWozZCiX0zymuLaz6q1IHn/krbYJZ5N8R+PTRBvGfZEvfyh8M60Vo+SQGAtC/joyuDbxyo3p0tTtW90K7/+ekCcEAprHYp0Atsl3vvZg3RJDUv3CSXmOXzybRkT9XWLfeEXQ28GaLVAHiIip/UwJorEb4YdgFZNaikXGotUs9nrEe6chAq8n7cOQ6J2urpC1C+S4X+Ra/0T0DAg/GNu/eQKKwNPUlvVpqGiIcnnB/plZpqUQXKPRO2lrqS7A7w7Km/6QQcp5vC/7f+r7uhwsbvUU+gP6RHAqEgZejvSY+RlLyTOhDWxiN512lbBo1O+dnGEI6whVMMnNGwArmdpXejoXQZm+xsYUKiawSBm+/HZo+kwaCsbzfatl+LOb1yZkDK6jR/YLkOfgYIpLHTCz8B1MilDulk/zI9n74q2F/88ss=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB081371.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10070799003)(10067099003)(56012099006)(6133799003)(11063799006)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnRvY3FBVXpLMWxCcVhzNjA4T3VXRzMxT1Q4QThNQ2pST0xQeWVRdTNIVDJZ?=
 =?utf-8?B?a1o2NmI1ZUdBRndEWXE1RmltTlc3NkJzRFJRSmltV0xZMWRCT0p2OE5zUVcz?=
 =?utf-8?B?QnVRM0VpQmhMVlE2ZnJja3RNdDBjeUlhNm5BdHRUV3dIaUdkZXRhUEhpY3po?=
 =?utf-8?B?dlppYi9jOW9QRm5kYWsrMjV6anF3RjdQRXZxT0lvVFVzVHJtLytKYXFHeWxp?=
 =?utf-8?B?KzgwZS82NnpubnFDMlBhQllFMWJiT3IrRWQxT0VzdU1oY1F6ZGN4RGlTbWZu?=
 =?utf-8?B?Si9BNWNhbjhrU29EN2RVWjY2WkxubDNJK1NocG1XSWRBVkxEb054V3A2anZ0?=
 =?utf-8?B?QThkVmptTndXMkVnVzAxYVpuUkU1MVpXSUcyK09TemcveWgrWXFlZ1RLcmhu?=
 =?utf-8?B?dGtEbWNGSEZabUw3L3BxNDhXZFJYd0pRUEpEckY4djdzL1UwMHZUVlNhLytu?=
 =?utf-8?B?ajhicWN4QUNlQjhPOVk1c0VzWE4wRkRvUzJ4WWNrSE00ekhTaWo3dDF5UVhC?=
 =?utf-8?B?cXQ2SlBWM1BxZkVQOUZKTWJ2Rlh3NXptTktmZmZWSkppaUMzT3VQRFBnR3ZR?=
 =?utf-8?B?ZExrdXI4NFkrUGh5d1ZZMDk0ZjdFeEZmZFI1elFYT01uWkRmdGlKaFh0L3cx?=
 =?utf-8?B?eXhJcnNCUXFtVzlGRE91dFNaUld1WHpXempMdkxmNkRxektObmNZUjJUdmNp?=
 =?utf-8?B?eDQwZURvY3gwd0ZoenVBZXF6ZTVHWGFqV1ZydktwSm5LcDcrUlJLOUZMLzN4?=
 =?utf-8?B?KzNocDZhTWIwSkgwdHByUndqQldseUtObnhMcXVWTUdrSll4QXJJdXJwdDFU?=
 =?utf-8?B?d2ZZTnE0MmcrWVNCSWtxZ1hsUU9qZlp5emVRZDBRWDVMMjJ4dW9YczQxK1ls?=
 =?utf-8?B?SmYzcm54cXlGRGZ3Zld6RS9HQmY0OFhYL2JVanp1SEpLOVpUcFl5TGpMN0ND?=
 =?utf-8?B?clBCNFFPeDlEU0dQLzUzOVlCMUd5bmNxWXhKTTNkbE1VcHVzRkZ5Q3AxaGJp?=
 =?utf-8?B?dWIyVVNIZUE4Z09zUWg1bzdReDVRUE9OYi9OU05DK3VJUkFGaFVqSmNXVjJt?=
 =?utf-8?B?M0RUc1hZVmtDdE9GMEk4aUIrL29GYVRjbUJGTGJpdkNkQVRsdnFMK2cwTE1N?=
 =?utf-8?B?emVNYmcvUkdrZXhsYnlRaHBQbmYrY2Vod3NHR3RsQTBFbTEwang3VDYvcngz?=
 =?utf-8?B?dzN6cEdMY3NEK24vOGRvK3pxRnNnc2hwOXA0QXZOV3hlYTZ5WjJhWDUrekZX?=
 =?utf-8?B?eEFUcWNqbUlZdTVNVit1NlBBdzYveVNVYmJ3N0E1d3BOYUppOU55dUt6dHBo?=
 =?utf-8?B?dWVlYzcyZXB0RW1HRU54R1ZBNlVWTnJOamR5ME9FTEZvN3VSTXgzRkVYck9u?=
 =?utf-8?B?MXFRWFlTQlUzbTRNWWk1N0s5dStOSlNvSlNWKzMxTGtPMjl4bzZBVmwrYnIw?=
 =?utf-8?B?d09kdlNlWWdaZHp3MGpjbkhKYlJ5b0JkTFozejZRK2JLZFFCWUlXMStnSTRq?=
 =?utf-8?B?eFpQa0RYZEZhVy82ZExoL1Vpc21mcElwcSs1SHloY3VXRFFaTnRaU0M0cFNU?=
 =?utf-8?B?anNUUjJJdSt4OTIzMFBEWVRJVkZVM0hMV2lZZjRreDVHdWd0ZXFMTCtCbWVU?=
 =?utf-8?B?YVN1Q1VBa3N3bUNHN3dwWWZaU0tCN3p3K3crcGhMM2dRbWtsUlgwckhxUmRE?=
 =?utf-8?B?RXIwZU9CbzVCcFMzb21PMllCbDltMjNJNFltbE1WNis2RUVHVmk0WE5VeHVO?=
 =?utf-8?B?ZnppUE5QRitTLzh5aDBOeXlSUmFINDVwN3diZEZvWFlzVE95aUVWa3hEZ3RQ?=
 =?utf-8?B?OVdSZWphTm1qemdDTFlwelROcndieStETDJCdW14T3U5MDBVTW5DSFFrUjhu?=
 =?utf-8?B?bmNDckI0VGs0MXppS21nT1pOK05xZGxybURqclplUHVwS0tpYW9KOWRJbUN4?=
 =?utf-8?B?eGdEWWE5QlJWNDZ6ZHZQVGsrVzhrd2JJYXBZZFBTZGpxV1gwbUxERGJzQ0g5?=
 =?utf-8?B?T3BvODVpWUYxSFQxaUo4TndGUk43YVRaeHBCaHFmbnNlTjJoVXRlN0JEVlBY?=
 =?utf-8?B?SGhHZFVmZW93bTlNUEZyZU51MTJFcHZmRXBHekMyRjhZUUowR3R5UUUrTm94?=
 =?utf-8?B?YndybW5HZ1hSdEZvMDJOdzk5QUZ0dGY4QWpLTGVrUjUvc05SeFZpQmg0czhM?=
 =?utf-8?B?TXRiVTFnUFo2dkxGcW5MU1ZPK1NVSWN0cUhrQWtxdGRUdkFic0htdFZUY2xY?=
 =?utf-8?B?SExrbXlYQ0tBbExWcFdrTDBMZnNnUE9ZOFdPdC9tYm5oT0doV0ZEZ3YzeWpv?=
 =?utf-8?B?R1ZTZGNPVXB0T2NtUzVxeGIrYUtlMWNvZEVJTFpNTUJTYmdVaDUwVFo5VmlV?=
 =?utf-8?Q?niD+Ufq5/x+wmFo1//5GneC3YiJIaQrLpiOkdJf0ud9Ou?=
x-ms-exchange-antispam-messagedata-1: 1wcAhxWBtBImKQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: VuiK06elwFrw56gbYMIziV8OoqFLTJpS8U/LpodPvPbHwz0pQgqhvVbvy1dUEJyI3EMR73INmUwggEnaYJvQkQIoWPwXvYf5/GwdsSmiMriPTuDl0Wvg5Zm9CshusVMZlLlrIU20xskNY66M6eLdhJzzen1jZxtI+ew1BK89t4Hb4gfBontEnbqYCYtgbTWnE9zhqLB4e733CLi+wws7AlMbQW46Di4PBKSLr8nlYiR0LyYLORhtxQZm18/jJ5cntSGmaXOBXYSzuTxbc7qQWCl6zYQlb03P84eaSAKstuIuKYJJPMLZ9YXg3FtYAXvz3LtyHmqzKhaqbY/61q9zRA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB081371.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a942b80-0737-4d6f-7266-08df23a8db0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2026 12:53:44.6323
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wMGDKt4vQDhz759pVpaKtWgeSR2elwQ7c9SoeGbvgWk7Wq4JlwOVd5WUXLlw1BAWMvUHOBfCFx+AJpKtqeZQQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7020
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: base64

KHNvcnJ5LCByZXNlbmRpbmcgYXMgcGxhaW4gdGV4dCkNCg0KSGkgZXZlcnlvbmUsDQoNCldlIGhh
dmUgcmVjZW50bHkgb2JzZXJ2ZWQgYW4gaXNzdWUgcmVnYXJkaW5nIFRTQyBjYWxpYnJhdGlvbiBm
YWxsYmFjayBvbg0KbW9kZXJuIGNsaWVudC9zZXJ2ZXIgcGxhdGZvcm1zIChzcGVjaWZpY2FsbHkg
UmFwdG9yIExha2UgYW5kIG5ld2VyKSB3aGVuDQpydW5uaW5nIGluc2lkZSByZXN0cmljdGVkIHZp
cnR1YWxpemVkIGVudmlyb25tZW50cy4NCg0KUHJvYmxlbSBCYWNrZ3JvdW5kOg0KLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KSW4gYXJjaC94ODYva2VybmVsL3RzYy5jLCBxdWlja19waXRfY2FsaWJyYXRl
KCkgYXNzdW1lcyB0aGF0IGxlZ2FjeSBwb3J0DQpJL08gYWNjZXNzZXMgKHBvcnRzIDB4NjEsIDB4
NDMsIDB4NDIpIHRha2Ugcm91Z2hseSB+MSB1cyBwZXIgcmVhZC4NCg0KT24gbW9kZXJuIHBsYXRm
b3JtcywgaG93ZXZlciwgbGVnYWN5IHBvcnQgSS9PIGN5Y2xlIGxhdGVuY3kgaGFzIGluY3JlYXNl
ZA0Kc3Vic3RhbnRpYWxseS4gSW4gYmVuY2htYXJrIGNvbXBhcmlzb25zIGJldHdlZW4gb2xkZXIg
cGxhdGZvcm1zIChlLmcuDQpCcm9hZHdlbGwtREUpIGFuZCBtb2Rlcm4gc2lsaWNvbiAoUmFwdG9y
IExha2UpLCAxMDI0IFBJVCByZWFkcyB0b29rIH4yLjdNDQpjeWNsZXMgb24gQkRYIGNvbXBhcmVk
IHRvIH4yMS4zTSBjeWNsZXMgb24gUlBMICh+OHgtMTB4IHNsb3dlciwgeWllbGRpbmcNCn4xMC0y
MCB1cyBwZXIgcmVhZCkuDQoNCkFzIGEgY29uc2VxdWVuY2U6DQoxLiBXaGVuIHJ1bm5pbmcgYXMg
YSBndWVzdCB1bmRlciBoeXBlcnZpc29ycyB0aGF0IHJlc3RyaWN0IG9yIG1hc2sgbW9kZXJuDQrC
oMKgIGVudW1lcmF0aW9uIG1ldGhvZHMgKENQVUlEIDB4MTVIIC8gMHgxNkgsIE1TUl9QTEFURk9S
TV9JTkZPLCBwYXJhdmlydA0KwqDCoCBjbG9ja3MsIG9yIEhQRVQpLCB0aGUgZ3Vlc3QgZmFsbHMg
YmFjayB0byBxdWlja19waXRfY2FsaWJyYXRlKCkuDQoyLiBUaGUgaW5mbGF0ZWQgSS9PIGxhdGVu
Y3kgYnJlYWtzIHRoZSBpbnRlcm5hbCBsb29wIGJ1ZGdldDoNCsKgwqAgYGQxICsgZDIgPj0gKGRl
bHRhICogTUFYX1FVSUNLX1BJVF9JVEVSQVRJT05TKSA+PiAxMWANCsKgwqAgdHJpZ2dlcnMgcHJl
bWF0dXJlbHksIGNhdXNpbmcgcXVpY2sgY2FsaWJyYXRpb24gdG8gZmFpbCBmYXN0ICgiRmFzdCBU
U0MNCsKgwqAgY2FsaWJyYXRpb24gZmFpbGVkIikgYW5kIGxlYWRpbmcgZWl0aGVyIHRvIHJlZmlu
ZWQgY2FsaWJyYXRpb24gdGltZW91dHMNCsKgwqAgb3IgaW5hY2N1cmF0ZSB0c2Nfa2h6IGRldGVy
bWluYXRpb24uDQoNClF1ZXN0aW9ucyAvIFBvaW50cyBmb3IgRGlzY3Vzc2lvbjoNCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCldoaWxlIGh5cGVydmlzb3JzIGNsZWFybHkgKnNo
b3VsZCogZXhwb3NlIHJlbGlhYmxlIHRpbWluZyBpbnRlcmZhY2VzDQooQ1BVSUQgMHgxNUgsIHB2
Y2xvY2ssIGV0Yy4pLCBmYWxsYmFjayByb2J1c3RuZXNzIGluIHRoZSBrZXJuZWwgcmVtYWlucw0K
ZGVzaXJhYmxlLg0KDQoxLiBEZXByZWNhdGlvbiAvIFJlbW92YWw6DQrCoMKgIElzIHRoZXJlIGFu
IGFwcGV0aXRlIHRvIGRlcHJlY2F0ZSBvciBjb21wbGV0ZWx5IGRyb3AgbGVnYWN5IDgyNTQgUElU
DQrCoMKgIGNhbGlicmF0aW9uIGZyb20gbW9kZXJuIHg4NiBrZXJuZWxzLCBvciBpcyBzdHJpY3Qg
YmFja3dhcmQgY29tcGF0aWJpbGl0eQ0KwqDCoCBmb3IgbGVnYWN5IHN5c3RlbXMgc3RpbGwgcmVx
dWlyaW5nIGl0Pw0KDQoyLiBHdWFyZGluZyBieSBQcm9jZXNzb3IgR2VuZXJhdGlvbjoNCsKgwqAg
U2hvdWxkIFBJVCBjYWxpYnJhdGlvbiBiZSBhdXRvbWF0aWNhbGx5IGJ5cGFzc2VkIC8gcmVmdXNl
ZCBvbiBtb2Rlcm4NCsKgwqAgQ1BVIGZhbWlsaWVzIChlLmcuIGJhc2VkIG9uIGZhbWlseS9tb2Rl
bCBvciBtb2Rlcm4gZmVhdHVyZSBwcmVzZW5jZSkNCsKgwqAgd2hlcmUgODI1NCBoYXJkd2FyZSB0
aW1pbmcgYXNzdW1wdGlvbnMgYXJlIG5vIGxvbmdlciB2YWxpZD8NCg0KMy4gSGV1cmlzdGljIEFk
anVzdG1lbnRzOg0KwqDCoCBBbHRlcm5hdGl2ZWx5LCBzaG91bGQgdGhlIGxvb3AgdGltaW5nIGhl
dXJpc3RpY3MgaW4gcXVpY2tfcGl0X2NhbGlicmF0ZSgpDQrCoMKgIGJlIGFkYXB0ZWQgdG8gYWNj
b3VudCBmb3IgbXVsdGktbWljcm9zZWNvbmQgcG9ydCBJL08gbGF0ZW5jaWVzIG9uIG1vZGVybg0K
wqDCoCBjaGlwc2V0cz8NCg0KSSB3b3VsZCBhcHByZWNpYXRlIHRob3VnaHRzIGFuZCBndWlkYW5j
ZSBmcm9tIHRoZSB4ODYgYW5kIHRpbWVyIG1haW50YWluZXJzDQpvbiBob3cgdGhlIGNvbW11bml0
eSBwcmVmZXJzIHRvIGhhbmRsZSB0aGlzIGFyY2hpdGVjdHVyYWwgZ2FwLg0KDQpUaGFua3MsDQpN
YXR0aGlhcyBIYWhuDQoNCi0tDQpEci4gTWF0dGhpYXMgSGFobg0KQ0NHIEVDRyBFQ0UgQ1NFRSBF
TUVBDQpTVyBBcHBsaWNhdGlvbiBFbmdpbmVlcg0KUGhvbmU6wqAgKzQ5ICgwKTg5IDk5MTQtMzg2
NQ0KTW9iaWxlOiArNDkgKDApMTczIDY1MTQgNTc4DQptYXR0aGlhcy5oYWhuQGludGVsLmNvbQ0K
wqANClZJU0lUIFVTIEFUOiBodHRwOi8vd3d3LmludGVsLmNvbQ0KwqANCkFkZHJlc3M6DQpJbnRl
bCBEZXV0c2NobGFuZCBHbWJIDQpEb3JuYWNoZXIgU3RyLiAxDQo4NTYyMiBGZWxka2lyY2hlbiAv
IE11bmljaA0KR2VybWFueQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQpJbnRlbCBEZXV0c2NobGFuZCBHbWJIIA0KDQpSZWdpc3RlcmVkIEFkZHJlc3M6IERvcm5h
Y2hlciBTdHJhc3NlIDEsIDg1NjIyIEZlbGRraXJjaGVuLCBHZXJtYW55IA0KDQpUZWw6ICs0OSAo
ODkpIDk5MTQzLTAgDQoNCnd3dy5pbnRlbC5kZSANCg0KTWFuYWdpbmcgRGlyZWN0b3JzOiBDYW5k
aWNlIE1vb3JlLCBKZWZmcmV5IFNjaG5laWRlcm1hbiwgUmFtYWNoYW5kcmFuIFNpdGFyYW1hbg0K
DQpDaGFpcnBlcnNvbiBvZiB0aGUgU3VwZXJ2aXNvcnkgQm9hcmQ6IFNvbmphIFBpZXJlcg0KDQpS
ZWdpc3RlcmVkIFNlYXQ6IE11bmljaCBDb21tZXJjaWFsIFJlZ2lzdGVyIEI6IEFtdHNnZXJpY2h0
IE11bmljaCBIUkIgMTg2OTI4DQoNClRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5
IGNvbnRhaW4gY29uZmlkZW50aWFsIG1hdGVyaWFsIGZvcg0KdGhlIHNvbGUgdXNlIG9mIHRoZSBp
bnRlbmRlZCByZWNpcGllbnQocykuIEFueSByZXZpZXcgb3IgZGlzdHJpYnV0aW9uDQpieSBvdGhl
cnMgaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkDQpy
ZWNpcGllbnQsIHBsZWFzZSBjb250YWN0IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBhbGwgY29waWVz
Lgo=

