Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792444013;
	b=oL13lOFdtYmycs7chODxMa4dZIc9iDzbVNRHKshXDSDpHtogoYAU3UkFowgOqAzN3Z1a
	 qslrnovYPjZUCpiI3Zb6dy/lD4x6q1Au54ALzyj7XhaH/y8kD6zOFEToOmAFxQe2dgSE7
	 PpDfwm9+KuOhuwbxhvTL5fbS37FRli1zMIBjMTienmpwjRpQQTRJqufVPWiQt5Xq7mTBY
	 +aTuTNR12CNHvZ+6BGsC8ArnNZ1wHlmz4q/3dcA/MZZ9IZRaKM4EkTL3oVZ4nZYXwtMWc
	 dQQxmwSXZlbhe2r2dAZFQaKgIIKcqIHb4WFAyEk9R/ioKr7GV7AcHtuOHtXyuajhr1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792444013;
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
	bh=eJLc/ZGJKIlatJ8KsBaIZrFaoDjxPy4WPDJTdIgOa9I=;
	b=ccTO9grwW7Uzsq/Kn/i80a+Xa3IzFTCpNTBS0tdlI7iHkYOQUHVlHBAwxDCjVn5kO5JF
	 hDbUwbtj8kWsTK0vwl4JyBKRC1YQ55C9EK36DQfY0ZcZKpcIvBxfuHDmfjDYmCPp1oIvx
	 2HwqoQ9jE1bjBBpBKJFlLWsdr0OEtXH4BmjCST7Gmoq8HLlxOzljfQvLz7W6QnYs2pegS
	 GmY1fmnlcWiv4/ZrIu+O17IjjsxE2iCVTklm5S6RbBaJF+cOXGM7qPsn2rmbWTMM6A2Dt
	 GLeIr/CbHj2+X/FhSzvOtL/RZa+3JIR+ApZxIUjS/A+KrAUZnccOn2CTaurpfSjDhLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="kWR/gDGu";
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C6F606A31C;
	Mon, 19 Oct 2026 21:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0C6F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kWR/gDGu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792444011; x=1823980011;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eJLc/ZGJKIlatJ8KsBaIZrFaoDjxPy4WPDJTdIgOa9I=;
  b=kWR/gDGukve3BiHEVE0wYuLbxpSVTUj8rs0nIKHxUvvnauDNtctGlazH
   NQMCuD5MdomRmnXjc5Xn/Yryo97HCQuYLfKFhmrC0vaQ/rXMclJ3cugI1
   6uCWSaebXg9LcuC0Gd3Tx8GA470WN0dZcv1QAyrGEJFiCpp+wRB8VbM33
   4lMrMMwY27H/wpVhDgAfmbw/0rycYSfgutlDlXg/Q60ux5P4DIiNRk8f6
   KEPQgPKvtENeRvfvlU5hsN61yqrD5NeR332BdZPrlrrGXMjR/b1qbUhGU
   9FouAANNgDX2AudwZrhOkyItsDylCULaWU1vfSMYoT8rEwI9DeMq7N87/
   A==;
X-CSE-ConnectionGUID: c7wGCplgQwOFgJeixU2+7A==
X-CSE-MsgGUID: 8ycGsiHnQxmKUBoMBFIjhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1032676"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1032676"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 14:06:51 -0700
X-CSE-ConnectionGUID: atq7CPN6Qjyq4lb0KX5baA==
X-CSE-MsgGUID: scnXSWhvTJy3DBsEBCrEHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2739492"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 14:06:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 14:06:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 19 Oct 2026 14:06:50 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.14)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 14:06:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+6k7FJtRO8MetGTGZrhKV957TTDQaTAxu2Ss6BOi0yivfh5TXpXzMyz/yqR8rFPkF+FpLuYa3G4vDUgFF24zBfqL00lmQnpX0WlHRX3U/1rWP5e7ZS2mvJKFdoUcgrt6NGVgUB8KLKYHt19XNQnTj5F+mi8oX8X8MsrpNWpeqiWp2tiyz9fYMx43hTPpxZWaRSLNsJYi4o1juD2/PhxlcZd+L3jaEdWI4+tqocQ9VPRydDB9HBhNWvBkK8sM9GKlGERDN8ETyRyi/J772afVkaXXAVS0xyX0i2KcDslNSu9He4QTGkUmWf18Amq721yUIHzlx3nFDQmFxeiCaKGUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJLc/ZGJKIlatJ8KsBaIZrFaoDjxPy4WPDJTdIgOa9I=;
 b=JOAWF8k+fMngV3RRrjDk4llaVZ18nsX9pRc/ANF/oplWQMn9i+emXwIyTwKKKeTau0rA6in2wO8IQEIdcQO/0/be/GfaDGm4KhLGfzZVz+dZnGc0P+yPn/r8l07tITCtp2bwXvK3sRyYDGZoHhsacU6tVhOA1L0lrnlR32ksjfKjguDYVy9q4jXWjQN8R7W3DLXgWZEnaHlvJDvY6fQ80qrldeA4Q+o/6g57eEAyk/7w1vQPcFiDyO6bU5Gw0TBxIOr+1GIVbAkM5ORf6bqE1lQdhrhi5GngWk3evHWGeADlHv6enLz/OO8KYKWfopGP07s8vDv3x9pu4JiLlkhuLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by IA1PR11MB7871.namprd11.prod.outlook.com (2603:10b6:208:3f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 21:06:40 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%7]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 21:06:37 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: "Mehta, Sohil" <sohil.mehta@intel.com>, Adrian Schlegel
	<me@adrianschlegel.com>, Yazen Ghannam <yazen.ghannam@amd.com>
CC: "bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Huang, Kai"
	<kai.huang@intel.com>, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, Dave
 Hansen <dave.hansen@linux.intel.com>
Subject: RE: [PATCH v3] x86/mce: Do not treat cache hierarchy errors as memory
 errors
Thread-Topic: [PATCH v3] x86/mce: Do not treat cache hierarchy errors as
 memory errors
Thread-Index: AQHdWoCVugPTELkXJUqLbiWa7DZ63rcFCP6AgAAy2ACAACTFAIAAAqdA
Date: Mon, 19 Oct 2026 21:06:37 +0000
Message-ID: <SJ1PR11MB60837CA7EFFE0AC99D01904DFC982@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20261003222012.19685-1-me@adrianschlegel.com>
 <20261012193305.38931-1-me@adrianschlegel.com>
 <20261019153207.GA144824@yaz-khff2.amd.com>
 <DM914GO4A8WW.Q7YN7ISOQJJI@adrianschlegel.com>
 <7886e7b1-95fb-4338-a7bb-b6bf1da3a634@intel.com>
In-Reply-To: <7886e7b1-95fb-4338-a7bb-b6bf1da3a634@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|IA1PR11MB7871:EE_
x-ms-office365-filtering-correlation-id: b07dde09-e4c3-45ff-4cd8-08df2e24dd23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|38070700021|56012099006|4143699003|11063799006|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: 0cg2hDg3CCVOJ19SdeVA2wn3fOpf20AhUW38Q5RPoOE2PsIiaivYxoBkHYATAldonIcfw3MnwVQoAy8meRODqhfjEnNo7peeRdpinZ0lqLkCpTIsJozg4bGB1RzdEmaG4J2d5BrCvTUcR9MqZbuegbxyJ42zVoqVHGZGoQ+dwjwebY+bWfPR3tSPjRBDCk87nd4W8ss1bU/A2oQU4xRZ3lGmjO3q7St0YtJ/vFaaqaXkIiBlehuQB71UCUdidkKUdltOq2JPHS1wH3wrdVj/OZRIb4nhPXzRFIFE9E9XHyoeOnaR/s3LWDjyy7YJc4I1Nd9GQlYBYYsKKDvXKOYW5vhZ+2tkpLjJInN7FNKsdJI3eSxPsJi81s8e/w2jWgqYut+LpY+LrvA2EmGZKNrc8R2F4EXwLVNPqMOwXG2San0qBzYUB0hdc+EVe+OjsvyAsZhJHqlGMWY/ho/rA+anVzFU3TyIX2TynvDnziOsX29PbmoU9sNlP4Gysj8ltTNdSYCu7WHi2SdVdJqXUzBOylJgb33tVNLSDV81bjfEvL7NzbIzgOLv3EONhH2hnqJ5uXp82RU3P2y0QlWCcUaSt0itq0dy73KA9pHAzohuUEspNAWyLbgDs1liVT30trwMVsc6vQytHlpn83ewLNGLDf9dQz7kqOY5ecPH3NbcCPvZyU4cdz32cLGogMxDQ7Cee810NIkRsgf6o4iOT3cBUFgmBN/gmAyIJJqlHpvT3n8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(38070700021)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UTZwdXpTcmY4cW9pTlVScHpPL1ZzVmNpRCtmMTEzaUd0ZzhzdFN2Sml0WktW?=
 =?utf-8?B?UFJmVjYvV1YwR1lLK1E2cnBYTCs2VURoVE14aXFJS1BPS00vNG55cjJxT0J0?=
 =?utf-8?B?eXVPK3Q5R2N6WkdEVG1yNG1uc3I2Z3U3MkYxTHllOWl4SWh2cWpKekNySVpL?=
 =?utf-8?B?Y2pUL1VsNEgzS0toSktmQTQyaFpJcVROTEI3TGJOTTVPM1RMR1pYN2xZRFNo?=
 =?utf-8?B?alkza3RVWG5XMUpVTmh4b2FSZnJ0Vlg4azNweXZ6TlRzYmlhektLT2V5eWF6?=
 =?utf-8?B?YUMxS1dLL3B2ZDA2ckxabXY0V1VPY3VhZ2FTb1NvK3VSQ2FkeGhIVE9TTW5Q?=
 =?utf-8?B?SUlCWHVxR0xoQm1BUnZ1bWJmR0FaR1h0alRpQko0bEV5b2k0M05DWVcrdDc2?=
 =?utf-8?B?Rk1NUFUwYVkvMW53QjViZzEvUGN1dlVaREp5V1ZtNlpGMEpHQUlXRHVOWStP?=
 =?utf-8?B?cVJ1MVFtbE1mTW1Xa0VINnF2dXJUbFozVDFIR2xWWW9aeTRMdlVUbzR0N05w?=
 =?utf-8?B?QUhRN1VOY1d6aWRvSlhRNHduQm5nMW9BTCs1WkNFU2FxTWc2ekluNjNEVk91?=
 =?utf-8?B?ZFlFeGlhUWtqMmFVd3J3aHoya0c0RS9XaHFIYWlPMXh3Y01OVDFIaTY2Q0Rj?=
 =?utf-8?B?NXM0YitteE9tdjJXZWt1dzJ4QW10ZkgrZFRvNDJvR1hhZEprZDAvMlE0c3NL?=
 =?utf-8?B?Zm4zanBaNVY1dW9EUURYTFJJNFo5RW01TUcxVDZDWlYrTVZ5bVJBRWFNcWF4?=
 =?utf-8?B?NHZTTEl4a3VodkNsdVlLTWNTbjZWckF2cktjZnlsRndiZmtIaVBkSHZQWjhV?=
 =?utf-8?B?RmVIYjBHQ01mV3B6OHNWc0t0V3dWUzVBeVVTSWEycTBZZVoyZGl5aVl3U3dS?=
 =?utf-8?B?QURBMVl2UGtsZXF1aFRyeU9yR2JYQXU0bEcwMG82d2M4LzFWeXNhSlZtNFZE?=
 =?utf-8?B?b2tCLzdMMExBSkJseU4wQ3JOQzRsbCtQQjJoODVKTzUzVk5YWEgvWHdXQUlv?=
 =?utf-8?B?M0ZTNDZoYk9oaTNQYmtTVlRoYzh3YzQ3MWdyRjBOdVlaNkdVWWdUcjZwOFox?=
 =?utf-8?B?NVhlbUVSSkZwWEtkcjJGMHFKdjZNY2tBWktWRHViTWNBWnhaeENrYkd4a0lN?=
 =?utf-8?B?ZGpxY1lJQVI2L0U0Mkp5L2daK0hnbUw4K0JFTCtPOUVFVzVNOXljcDAyMlZC?=
 =?utf-8?B?Ui9YelRsWE55RGtubUtVYmgrdzhJTmJTSkw0VVhoaWlDZVcrZ3ozbmd5UjVy?=
 =?utf-8?B?QkpLMFZJWGhCR3RoV0xJek5ocUREVGdQMG1sM0FvWFBFK0w4UGJwOXZhSGhF?=
 =?utf-8?B?cTUwWm14N2tZQzlQd0gyZnhBZkQycUhlaDZKR3FjSnJESnpNK0dlMGJzVFU2?=
 =?utf-8?B?WVJEKzZMQ3NRK3RYdVBXWFNHSmFwdUZNanpyQnVWV0lWNWNCeE1IUzBQSDZM?=
 =?utf-8?B?VlkrcHRjVytpbzFqV2lqWDJmR2ppTzRrUTZHbXNNWnNIbG9FT2JZMHhaeDJk?=
 =?utf-8?B?cnEyOS9vRTNieUVlSmxLWDRkeWZCY3ZvQ0JSRzhUK1I4bnhKZkRPeDZSZE1p?=
 =?utf-8?B?d2pINzlwQVUwb1BYSVhiemduRE95SzFTWlpvcHAwM1BremlpMGdhRk9BT3FV?=
 =?utf-8?B?YTM4bVUrZTlMZ1Z3Z0IwZDNJWk1zczJyenpPVk5PWTNCSW9nVGxhYXA1OU41?=
 =?utf-8?B?WnpWQS9hMjN3TDdIRE14M0Z5MEVrbm9PSStVd2RCMUI5emtqcmI3SFZOSEhC?=
 =?utf-8?B?TUtRN2JCKzJCeHo4SDhWYXhURmhhUE04b0llY2dsVGkybXAyWUNYOTNLa3Y4?=
 =?utf-8?B?bkN6WDlJWURDTGZFSVVzMTJJOG01QXpZTm5yKy9tUWtUMW1LZGN6VThvMU44?=
 =?utf-8?B?bGUzME5HK2diV3V3RS9EUUQ5blI1VVFweWdSRWkrcDMrMGRacjhJT1dNUGNJ?=
 =?utf-8?B?aG5BOVpqTDBXWEJ5ZnFDVytpM3lONVo0bi9KQzBJaWRFK0plS3V0MCtDNDli?=
 =?utf-8?B?Y3h3NnRUOWFNbi9OVnQrNktQNlMzbGtnd1NjbUtyM1VxMXpFU0t1QjJWZ0NV?=
 =?utf-8?B?MzlDd09tcTFXMjI3WTB6R0FGeFFNam01M1BRNk8wTVF5ZjZ2TEVOVzRPS3pJ?=
 =?utf-8?B?QTVtdk5VRWY2MWliSlNlM1BMVzBaZnVIc2NOYS9oRG9LSENZR2w5ckdmTVhx?=
 =?utf-8?B?UUFQdDVwUUE4SWZiaXNRY0pTQVJNdlhzYk9LV3pVdEE0ZTRzS2dtUEhVYlp5?=
 =?utf-8?B?SGNXTjhuVGZFVXBsMWlONW5GSWU0WmM0dmJTM2FHMHhabTRSQXBsRVZnazRV?=
 =?utf-8?Q?wAO5ysI7IyLuaD2F/3?=
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
X-Exchange-RoutingPolicyChecked: G70d4EJpDmlYvR47VfOkQ3vLm+y9XKBeLpyVR5XONVDONzufZepZQiygvjtHb1f+s6U2b62HQg4sK6Ko0gTL14r45I0qRvBfOgr7dbxoxTLp7cJGYLxvlWB0xPxiZDkITJ0YiqrG2sLF1hVv5oAuPJ4CbEjhNFE4LustVtmGkKE4jMvhRAKUiYv1kgABYrN5TyNZKlIa7uTJsCNunFpHflilPAwBxPvaQI1l8KUPq/dXXiTaPe0mYP3MP+Mm9vtV0qIRAFEkUhtj6CtA7uPHmz0rCikfaKIoXe1S53mWEuV5c+UHroKgrE2CTao28YKnK+YR9lM2qe6IR2bxvW4GIA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b07dde09-e4c3-45ff-4cd8-08df2e24dd23
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2026 21:06:37.3275
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X5wk+jCvzx1Gy8IZTYRySt69xnCpjEfmazCA1K/7qbrNO0XuMZJCg5hiuYRMxjbnsb3XJr+IH2A8AhjO2KCa8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7871
X-OriginatorOrg: intel.com

PiBMb29raW5nIGF0IHRoZSBjb21tZW50IG9uIHRvcCBvZiB0ZHhfZHVtcF9tY2VfaW5mbygpIGFu
ZCBjb21taXQNCj4gNzAwNjA0NjNjYjJiICgieDg2L21jZTogRGlmZmVyZW50aWF0ZSByZWFsIGhh
cmR3YXJlICNNQ3MgZnJvbSBURFgNCj4gZXJyYXR1bSBvbmVzIikgY291bGQgcG9pc29uIGNvbnN1
bXB0aW9uIGJlIHJlcG9ydGVkIHdpdGggYSBjYWNoZQ0KPiBoaWVyYXJjaHkgY29kZT8NCg0KWWVz
LiBBbGwgcmVjb3ZlcmFibGUgcG9pc29uIGNvbnN1bXB0aW9uIGVycm9yIGNvZGVzIGFyZSAiQ2Fj
aGUgSGllcmFyY2h5IEVycm9yInMuDQp3aXRoIHNpZ25hdHVyZSAwMDBGIDAwMDEgUlJSUiBUVExM
LiBJdCdzIGFuIHVuY29ycmVjdGVkIGVycm9yLCBzbyB0aGUgcmVjb3ZlcnkNCmNvZGUgd2lsbCBv
ZmZsaW5lIHRoZSBwYWdlLg0KDQpCVVQgLi4uDQoNCkVhY2ggc2hvdWxkIGJlIGFjY29tcGFuaWVk
IGJ5IGEgIk1lbW9yeSBFcnJvciIgd2l0aCBzaWduYXR1cmUgMDAwRiAwMDAwIDFNTU0gQ0NDQw0K
aW4gYSBkaWZmZXJlbnQgbWFjaGluZSBjaGVjayBiYW5rICh0aGlzIHJlcG9ydCBvcmlnaW5hdGVz
IGluIHRoZSBtZW1vcnkgY29udHJvbGxlciB0aGF0IGRldGVjdGVkIHRoZSBFQ0MgaXNzdWUpLg0K
DQpUaGlzIG90aGVyIHJlcG9ydCBzaG91bGQgYmUgdXNlZCB0byB0cmFjayB1bmNvcnJlY3RlZCBt
ZW1vcnkgZXJyb3JzIHBlci1ESU1NLiBQZXItY2hhbm5lbCBldGMuDQoNCj1Ub255DQo=
