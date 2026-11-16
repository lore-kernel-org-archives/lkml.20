Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794815868;
	b=NDvDRtfcYjBTAuGeShNfxTa9RGq/i89ZUjLM2BU+k/jEQ6+0yl7pGONJ18SGlzu38BxV
	 ko1YA/6bS8ZNTH52dw2WJnG4E8a17B3b+qG6ZdwgVY+CYhUGmDsbIwlGvmE/0Khma96T4
	 80wzeFaqu61p3oS2oSyxK817O5YVGphVk22w1hmlqJc0+en/AubXrwuYjlA1rMlHhRQId
	 yfQwzhoYJXLJj3b7T4VPKtyF8QV++gmrOwhBO+XaRzzr+c5fGqFoHWa3/k0/hhCaPPUeH
	 noaf9QJpGJZ+4NDeNzzeC13wR6FnjJys3plaqR2Wy+fpxpddhFWG/hc9grZarYoifgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815868;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
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
	bh=I3i98w4i9DOHH13fA3jw3Tb0gkTJGORKTbejZbTM/mc=;
	b=WYHHVfqI7aT9yNhsqy3PPNlrIKIlvJBON36GXZL+6iYwS/p2Tv4nMxdT/IZd18O+y7SV
	 y8aHYy4RJKYdcQGSTju/9TPou9BxlRkhndSztxP28DynJZ8I6Qm+fxWtC0LwSJVX4Wq34
	 DApfeXQVwfBXqy60l3DcBiuzDPdUvqBX/UflYZpmTkvevH+ZaMvSYz15OJPpChA2GALHC
	 mkw0lw9DneRJvwu0213PlR9oUZHcPRuDf7xfaWYgAnUVDXMdrW5YxU26gSqnWg7F7LJAY
	 dbsWIZ+O5UbmQXUGmuZpc42TvnTZOoqITokDY9/weOUVJ6nRD27zqDhYENHoiUeWjdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lS04LAi5;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=QS8PxlXT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C45606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:57:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91C45606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lS04LAi5;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=QS8PxlXT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794815868; x=1826351868;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=I3i98w4i9DOHH13fA3jw3Tb0gkTJGORKTbejZbTM/mc=;
  b=lS04LAi56RCpheBbw3y1GZtC56AW3BZiUGfQcc6lAA24mOHQYj10UfD5
   ZOwG4tTwEBsgLVvNwPiQcT0oI2EjFbm8Q892LwdFSZLI0B7O46p8ef21o
   f+Vk97EX8hW9/ALQb+l6wET3niFYoAE6TEalCXYOlLyRr3doJajo/43p7
   hJxplY4u+dNj8M0Nj+QOsIrQ/yyv2JV1Wq6PBhtm9fAR7d1/xk49J04bT
   8AEkrACQrDguVXNAsgc1SfFcyk2kAVttJmOzW4HbGOT2P5N4Gk9++dK36
   m6GRRlwzNtcLydHV3xeowOOgzYgqTVQ4cUS+r8R8p6lFzOhGNFLsNzVKb
   w==;
X-CSE-ConnectionGUID: Bw7V2SFIQ0W3P5ibPFo+OA==
X-CSE-MsgGUID: 9xAMHeIVQWeqh4gCcRzPvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3461044"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3461044"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 23:57:47 -0800
X-CSE-ConnectionGUID: uGVc6Q3WTI+INf8X3WJwXQ==
X-CSE-MsgGUID: eSX5zDhORCS+FM01rhBtmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9322220"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 23:57:46 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 15 Nov 2026 23:57:46 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sun, 15 Nov 2026 23:57:46 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.12) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 15 Nov 2026 23:57:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQhPx8ENkRnu5QWy3m5XuzKy2xNQcm5E27MZ+f4tWPwXcOD5JqhfuxNcZRtlJby9Py2/ek8Tp1qhGoMRe1d2078DmlgJ3BitF4F/kOVwcr3sT53Pk2iQc1j5Hr1U6khJkJcWS12eGs7dt8vj4ZL1opPlv/gWnWb7OvJ2gYK2ygpnimwlRA3mA5VlxVTqJp9e//9mDDK2DaEbxJL//LIqJaubKPCBldYlBAAswEDc31PRXGFnUEfbTfbISAB6NBigztNVmPIxn0sXm3k2iZDl9C/mclU+LYHtETrT3qvfXSu6sdrAt2aw5hWvE9dJl9C4yFIE2ztUvzFGd+Lu6aVcaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I3i98w4i9DOHH13fA3jw3Tb0gkTJGORKTbejZbTM/mc=;
 b=ORtyduHwu/VSmGpcXSdJQ+7fYKeZvYyftQnI+jEvl/H942kZi/lHx5WeZIPXIqxgp4ckJm9GVkn7gMEeB6mXJLqwwni1wv0mxh0bjL1z1pApUJWHs+0nySU4GOy/8NWj3w1zCm2KYvQtdmKEQByBPgnWwKnR+PbeZnQ1FCWKDZYr9/BZyhq+qFSYmLdgj4o2P+DOvChJnuHmQI3nfc3xDu7ttrrrIsyP53lq8QoJDy6hQyJs0aSivCwGrfvuQuxtVCEK/OVHLtYCzv3vyhTM00mt0ajrrf0IV40dqgp4PoF4MBBg7IfyU4dGb2f5/a26SUyNu5u3T8YVLxBBDcxBVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I3i98w4i9DOHH13fA3jw3Tb0gkTJGORKTbejZbTM/mc=;
 b=QS8PxlXTb0nm1DVc81Zs58mszJI4UlpsLGZcxU6sOA3Gz6OlGseVgFIboxkX85JIXIiDZpYHxXxiKUojzR2/riOgCrwWxGeWjndLIEowRe+fME+UQYn0FEMEi9kLPh16ARlZ/R7JExkJ/3wAMZaimKVfJtn1yi4jEMMsJ1O8x1c=
Received: from PH3PPFE241D7F14.namprd11.prod.outlook.com
 (2603:10b6:518:1::d57) by SJ2PR11MB8515.namprd11.prod.outlook.com
 (2603:10b6:a03:568::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 07:56:43 +0000
Received: from PH3PPFE241D7F14.namprd11.prod.outlook.com
 ([fe80::e459:ea7c:45a:2ad3]) by PH3PPFE241D7F14.namprd11.prod.outlook.com
 ([fe80::e459:ea7c:45a:2ad3%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 07:56:43 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Andrei Rusu de Castro <arc@empyreal.works>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] mei: allocate client DMA buffers on the parent device
Thread-Topic: [PATCH] mei: allocate client DMA buffers on the parent device
Thread-Index: AQHddWVXjhMJ6QwIy02c8rxuyJZlAbcwVQgQ
Date: Mon, 16 Nov 2026 07:56:43 +0000
Message-ID: <PH3PPFE241D7F1448D366FACDC57DC31CC3ED7C2@PH3PPFE241D7F14.namprd11.prod.outlook.com>
References: <20261116-mei-cl-dma-parent-60802f47@empyreal.works>
In-Reply-To: <20261116-mei-cl-dma-parent-60802f47@empyreal.works>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPFE241D7F14:EE_|SJ2PR11MB8515:EE_
x-ms-office365-filtering-correlation-id: 9142af3b-e878-4187-b37f-08df43b72797
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|38070700021|10067099003|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261021123027099003|261102123227099003|261009223027099003|18002099003|22082099003;
x-microsoft-antispam-message-info: SwAMRb67dhal2wBOjkcNRebYQLnhZHuh7/72WL84d7RQFozrCMUy9EcSy/BneSbNUYxY/aqpQXs0sgaNHrOX+S9et368rnbMbi/10o/GBHJ1Vdb4DzFKlXuamf3xZdm79NQWNkFI8LQrAfg5RUbZ4r/dpdLQQDiMI5Lu9OLySPM/njCCXJPTAlzxonsDnJ3N9TotXoYfI2ldGhB/dRHivljtQtsfIeIccmXBogoLrJJXwDeow0OWN4l2BHH/rsgpuEhGPH4+WFfKZ30IBcQjUi9eQm5RPoAS4rg4N93QyOitoexjHYAOX9B5aQlDnpiVsVOsh42O7wn5PhmILFg+GjRuI7ksLVLa4cc9IN0Qc+l6eHKMbM8uKq3feuYo6E606GpNld1ti4cfZ3S0a3GD2048D2PeC6yvNpZv0NFB+J/28TV1KpCv/B1Tu5pBH6Dnn8zoAE0xTHl7KhZq958X2DXNlkq+5zNDA+6T/m/i4DLmStmtGauH7UIRHSb2EUG0OWcGDEh5ZNYu3UR16anixoz5vZE++wB+HZls4ZCAixoQ97vgnCVAo1C5ezfTcXxepvPB+f03zUEjAh0mW8JF+xeZdB0vI1oMLcT/4xil+NmDIkQNKlv19esql2rgFMjylnBj64OfAeUZFvgp5JAYZBxjvPscxoyCuExY4UB1meMy+R4/VZVh1XVGBU5NOZD+mMYF41RU0agyQYY4ZDpauc2YN5v//gm1C10prbvJL0g=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFE241D7F14.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(10067099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261021123027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?clRVdStLL1VlT1Q2UWE0amVLZUgreDg2MlVDMHZHWDlhenY3OEVJYldUWjAz?=
 =?utf-8?B?NzN3WTFNOGp3UWR2Q1U1cjhpTnhNYXdScXhZNU1ydklrVkgzWUh3bFJHNWtu?=
 =?utf-8?B?RjBMbzhvQURTNktBUUFmQXc0MVh2Nnc3cm5lS1VnSys4V2FONGYySEpUeUV2?=
 =?utf-8?B?RUp6VnhDVHlmemRsOURlOXhhUnlIaXFvUUpXKzBLRE9nN1BqN0lsVlNOUTNT?=
 =?utf-8?B?R1dpUUhIZkJyUWhtT0xXeFk4WHQ1MmNsRU1LWVZoeVFsREZ4SjZqUjNGSVhC?=
 =?utf-8?B?T3d6alhhZ21MUVJqMFM5RE5rUmZnQ3drWmlSTGtaWWFRc0xvZXZoajRydnZo?=
 =?utf-8?B?UGdhOXBtL29UVzdIWHpPSjBVc0FreldLRHl1TXYzU3lWTjRjY2VoQ0d3QUpS?=
 =?utf-8?B?emNRZS91OWY2WFIxNVRxOFpvNWxDZWxpeEE3Sis1djg5QkpRRStoTXVsb015?=
 =?utf-8?B?akZtaU82ZkpKc0p1WGlBVkhWdTYwQjNPUG5TZ0hoTzJYSVA0THBmc3pPYXJS?=
 =?utf-8?B?MWJIUUlJUlE2Vk9QU3ZWVEtSbk1zc29hRytncUpWUGNrNFNDZnY3ckwrMmpL?=
 =?utf-8?B?d0llRVVvc0xLdG1IODZnaEZrYUV5Q0JnRTEwTzBnWnREekw0d1BDbUV5SVZX?=
 =?utf-8?B?ZHhKclZCYk9scDl6dXNZRUh0Z2o0c2R4QitSdStNMHRDcFZYZ3gyeVJjMG4x?=
 =?utf-8?B?Z3lLMllkRDRuQ1YxNkZsTU1RR1VqZVNQOHJwRjkyazlxbFIxbGl3emdGeHda?=
 =?utf-8?B?Zmd6SEw1bUtaRENVYVl0SXBzTzZ6R0RVRGxiY1pTbW9JTCtnd1BRWnVCTzBH?=
 =?utf-8?B?TXd0bUVXN3ppNU9nREdmNzhqNTVLYkNMUHBySTZNOHNLYTdMSlp4dG9GRnFa?=
 =?utf-8?B?cVBScGtPM2RMYjVsMFlONkJodHFhT2lSTkdyZEtCY2NxdVBNeG56NzZiK1RK?=
 =?utf-8?B?U2FESXNJalVqVE82SE1pUXMvQXhQZlRXaWNlZUtWZThrZGwrVkF3UHR3MUpJ?=
 =?utf-8?B?SXJncEkrcWNVMFZLT0R0MXdOeFg2NlRJekFEZ1ZPZTQ0eTQyTCtuV2ZqeTdX?=
 =?utf-8?B?dFRITmJRT0lMeDRsa0JsRUpNR1hIbVNwb1VoNFVZRUhJOG9jTnlGeVlSb2po?=
 =?utf-8?B?b0lJSXRpcHBlRHhZQTVhakhYdUcxZnA1U3BYQ2RNVVJ5UnJaaGt4aDAzWVV6?=
 =?utf-8?B?RGhTSngzZm1EZVU2M1JoK1F1NFV6VGF4Y2NvUjZUMlNOejh3Z3krR0NaeG9m?=
 =?utf-8?B?T1Z2Lzg3ejhENTc3QSszZGl5SmcvVTZTSUJpMEx1R3V6SGcyVExFUGRxR2Yw?=
 =?utf-8?B?R1BTdWJ6Zk1pb3lad0VIYXJMcWVNdHdTVy9HYVhRMWNndm5FL2xaVUJOZVAw?=
 =?utf-8?B?dTN0YnEzVlB6WURaT3owcmZWbGVZNmFMSDYyYmQvSlRzOVhiZEo5bXJBbnRx?=
 =?utf-8?B?NndWd2c3UXloSUI1QVNYWFNycWViVnBkZUVyb1hiUlhTdkFTekgwdGFnQTBw?=
 =?utf-8?B?OEkwL0hNY0orVHBZOGFaSTFnYjMxb2thdm1Qeks0cEk5anhrU1UxMHZJN3c1?=
 =?utf-8?B?MFEvTUdoQUQwUjNTNVMrZVFMaXRaYUNUeDMwTkJWdjAxcDRYd01heXZEcFdC?=
 =?utf-8?B?UkR1bG9JUWM1MjRSZkw4Sk9yeklCYVFqR2JEQ0lUNWZBaTlDRWVwSE9vVmNw?=
 =?utf-8?B?ZmpQRkkrNzNUUUZqem50MnlmOVFtYURJYSt1MVcxbWYyWmZHNGp5clliaEhZ?=
 =?utf-8?B?VGx0UGt4Q2YxKzN4N3NkcGVpdFRCWUZuYkgwakEwRXI3SncyRzN4S2JsQ1VQ?=
 =?utf-8?B?S1gyaHRKUlRwZ0ErenJ6MEp2ZTZMNThTOUFBR3F5QzhscVVuZEZ1OTRuR1NF?=
 =?utf-8?B?SzVNWHM2dFlrdWN6MFNiUnN2UmtaRmlYVUF6ZUZMSzlGOGw5REZsZjZFZEs5?=
 =?utf-8?B?T3R1cFV5MDJVMkdDMmQ2WUY0KzFiVER3WlNLa2ZuMFlicHBqM1hWbHNwOWM2?=
 =?utf-8?B?TFU3OUNxMW1nK05oZlZUeTYrWjFYQll2dmQrMnZ2NCtoWjIyTWJLVmFVbVY3?=
 =?utf-8?B?a01vSmNhWWtxcHI3cFRKQ1l4amlkUTZ0dW5QMjBsOFpJelFrc1dLL284T2g3?=
 =?utf-8?B?R1VlY1FBUTU3cmFBTk4zY0JEUFRZWXBzaFgrK1Zkd3k2SjNFcVVEZXF0bUoz?=
 =?utf-8?B?elh0NFF0aUhUWEEzam1aWVFQTkRJdThqOVB6aUZ4SHkzZ1JLSUdyN3pnRTJT?=
 =?utf-8?B?aHMxTVZ2RXM4TTRDYWw1a3pOQ3lIa2VkR1kyM1NQazJYdFJPWnZpWG5ud1BN?=
 =?utf-8?B?b0piQXZzcVVjOTBXWHBqeVh1VGRZcFNuUW82VElmZlAxcUlDdzVkdz09?=
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
X-Exchange-RoutingPolicyChecked: UxP7eXBINuOzU6cXuDPwGM0l4taJLxCsWqvCzgRDhAe26feDBLxLDO1D9K8vh1+HUdrN0Uw0r2UiJSDd7YfHZG9Jzk4t8LoItopWP9a/r3cAME2qidEp4eI2FzaV5KarrG58XCDgMJi2iO89jhFcN8/o6DmnZMCuVgJ7WhfOoIe9UqjR7wa0xI42D6Ed/OA24c5qevRmMiO7CgKmAtLKT2z6V4NTkl0pBSYKi2G5rU0fR/vjn1ikvOuDFTRqaAL/6ApeA0xqBCjhqGEiQeOPDBnfhhYB0yZ3fhTiJjvlBoTBeflACyO5QofFIJ6VH0hwZsUGwDS6OBmYohpH9FItfg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFE241D7F14.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9142af3b-e878-4187-b37f-08df43b72797
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 07:56:43.1621
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hmxcjknCizATeO/7VpTy/ZZ4EiRcYNzsSO1AAKd+BRLQz0lujwscaq5hPQ8OWg4O/m20ttAp5hSj018eJlP8hvkOOyC9xSqbIdRPz88GvYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8515
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBbUEFUQ0hdIG1laTogYWxsb2NhdGUgY2xpZW50IERNQSBidWZmZXJzIG9uIHRo
ZSBwYXJlbnQgZGV2aWNlDQo+IA0KPiBTaW5jZSBjb21taXQgNzcwNGU2YmU0ZWQyICgibWVpOiBo
b29rIG1laV9kZXZpY2Ugb24gY2xhc3MgZGV2aWNlIiksDQo+IHN0cnVjdCBtZWlfZGV2aWNlIGVt
YmVkcyBpdHMgY2xhc3MgZGV2aWNlIGFzIGRldiBhbmQga2VlcHMgdGhlIFBDSQ0KPiBkZXZpY2Ug
aW4gZGV2LT5wYXJlbnQuIFRoZSBETUEgcmluZyBtb3ZlZCBpdHMgY29oZXJlbnQgYWxsb2NhdGlv
biB0bw0KPiBkZXYtPnBhcmVudCwgYnV0IG1laV9jbF9kbWFfYWxsb2MoKSBhbmQgbWVpX2NsX2Rt
YV9mcmVlKCkgc3RpbGwgcGFzcw0KPiAmY2wtPmRldi0+ZGV2LCB0aGUgY2xhc3MgZGV2aWNlLCB3
aGljaCBoYXMgbm8gRE1BIG1hc2suIFRoZSBhbGxvY2F0aW9uDQo+IHdhcm5zIGluIGRtYV9hbGxv
Y19hdHRycygpIGFuZCBmYWlscywgc28gbWVpX2NsZGV2X2RtYV9tYXAoKSByZXR1cm5zDQo+IC1F
Tk9NRU0gYW5kIGl3bG1laSwgaXRzIG9ubHkgdXNlciwgY2Fubm90IGJpbmQ6DQo+IA0KPiAgIFdB
Uk5JTkc6IGtlcm5lbC9kbWEvbWFwcGluZy5jOjYzOSBhdCBkbWFfYWxsb2NfYXR0cnMrMHg0OC8w
eDMwMA0KPiAgIC4uLg0KPiAgICBkbWFtX2FsbG9jX2F0dHJzKzB4NWIvMHhiMA0KPiAgICBtZWlf
Y2xfZG1hX2FsbG9jX2FuZF9tYXArMHgxNTIvMHg2YTAgW21laV0NCj4gICAgbWVpX2NsZGV2X2Rt
YV9tYXArMHg3Ny8weGYwIFttZWldDQo+ICAgIGl3bF9tZWlfcHJvYmUrMHgxOWUvMHg2YjAgW2l3
bG1laV0NCj4gICAuLi4NCj4gICBpd2xtZWkgMDAwMDowMDoxNi4wLTEzMjgwOTA0LTc3OTItNGZj
Yi1hMWFhLTVlNzBjYmIxZTg2NTogQ291bGRuJ3QNCj4gYWxsb2NhdGUgdGhlIHNoYXJlZCBtZW1v
cnk6IC0xMg0KPiANCj4gVGhpcyB3YXMgc2VlbiBvbiBhbiBIUCBaQm9vayBGaXJlZmx5IDE0IEcx
MCAoSW50ZWwgV2ktRmkgNkUgQVgyMTEsIENTTUUNCj4gMTYuMSkgd2l0aCBJV0xNRUkgYnVpbHQu
IEl0IHdlbnQgdW5ub3RpY2VkIGJlY2F1c2UgSVdMTUVJIGRlcGVuZHMgb24NCj4gQlJPS0VOLg0K
PiANCj4gV2l0aCB0aGlzIGNoYW5nZSBpd2xtZWkgYmluZHMgYW5kIHRoZSBXaS1GaSBoYW5kb3Zl
ciBiZXR3ZWVuIENTTUUgYW5kDQo+IHRoZSBob3N0IHdvcmtzIG9uIHRoYXQgbWFjaGluZS4NCj4g
DQo+IEFsbG9jYXRlIGFuZCBmcmVlIHRoZSBidWZmZXJzIG9uIGRldi0+cGFyZW50LCBhcyB0aGUg
RE1BIHJpbmcgZG9lcy4NCj4gDQoNCk9wcywgZ29vZCBjYXRjaC4NClRoYW5rcyBmb3IgdGhlIGZp
eCENCg0KQWNrZWQtYnk6IEFsZXhhbmRlciBVc3lza2luIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRl
bC5jb20+DQoNCj4gRml4ZXM6IDc3MDRlNmJlNGVkMiAoIm1laTogaG9vayBtZWlfZGV2aWNlIG9u
IGNsYXNzIGRldmljZSIpDQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJlaSBSdXN1IGRlIENhc3RybyA8
YXJjQGVtcHlyZWFsLndvcmtzPg0KPiAtLS0NCj4gIGRyaXZlcnMvbWlzYy9tZWkvY2xpZW50LmMg
fCA0ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9taXNjL21laS9jbGllbnQuYyBiL2RyaXZl
cnMvbWlzYy9tZWkvY2xpZW50LmMNCj4gaW5kZXggMjZkMmIyNzQyZDUwLi5hMGY2OThiNWQyOTYg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbWlzYy9tZWkvY2xpZW50LmMNCj4gKysrIGIvZHJpdmVy
cy9taXNjL21laS9jbGllbnQuYw0KPiBAQCAtMjI0OCw3ICsyMjQ4LDcgQEAgaW50IG1laV9jbF9p
cnFfZG1hX3VubWFwKHN0cnVjdCBtZWlfY2wgKmNsLCBzdHJ1Y3QNCj4gbWVpX2NsX2NiICpjYiwN
Cj4gDQo+ICBzdGF0aWMgaW50IG1laV9jbF9kbWFfYWxsb2Moc3RydWN0IG1laV9jbCAqY2wsIHU4
IGJ1Zl9pZCwgc2l6ZV90IHNpemUpDQo+ICB7DQo+IC0JY2wtPmRtYS52YWRkciA9IGRtYW1fYWxs
b2NfY29oZXJlbnQoJmNsLT5kZXYtPmRldiwgc2l6ZSwNCj4gKwljbC0+ZG1hLnZhZGRyID0gZG1h
bV9hbGxvY19jb2hlcmVudChjbC0+ZGV2LT5wYXJlbnQsIHNpemUsDQo+ICAJCQkJCSAgICAmY2wt
PmRtYS5kYWRkciwgR0ZQX0tFUk5FTCk7DQo+ICAJaWYgKCFjbC0+ZG1hLnZhZGRyKQ0KPiAgCQly
ZXR1cm4gLUVOT01FTTsNCj4gQEAgLTIyNjIsNyArMjI2Miw3IEBAIHN0YXRpYyBpbnQgbWVpX2Ns
X2RtYV9hbGxvYyhzdHJ1Y3QgbWVpX2NsICpjbCwgdTgNCj4gYnVmX2lkLCBzaXplX3Qgc2l6ZSkN
Cj4gIHN0YXRpYyB2b2lkIG1laV9jbF9kbWFfZnJlZShzdHJ1Y3QgbWVpX2NsICpjbCkNCj4gIHsN
Cj4gIAljbC0+ZG1hLmJ1ZmZlcl9pZCA9IDA7DQo+IC0JZG1hbV9mcmVlX2NvaGVyZW50KCZjbC0+
ZGV2LT5kZXYsDQo+ICsJZG1hbV9mcmVlX2NvaGVyZW50KGNsLT5kZXYtPnBhcmVudCwNCj4gIAkJ
CSAgIGNsLT5kbWEuc2l6ZSwgY2wtPmRtYS52YWRkciwgY2wtPmRtYS5kYWRkcik7DQo+ICAJY2wt
PmRtYS5zaXplID0gMDsNCj4gIAljbC0+ZG1hLnZhZGRyID0gTlVMTDsNCj4gLS0NCj4gMi41NS4w
DQo+IA0KDQo=
