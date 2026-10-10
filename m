Received: from iad-out-009.esa.us-east-1.outbound.mail-perimeter.amazon.com (iad-out-009.esa.us-east-1.outbound.mail-perimeter.amazon.com [34.198.94.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD182E7622;
	Sat, 10 Oct 2026 18:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=34.198.94.229
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791656906; cv=fail; b=SOA9XX2Bjjeyqv6/X+9DoYE9fyGE/4d6MGlXV0hsEFiJobDpW4Eoe06BG9w9bZlLcYdP8wDa1v3wX73jhfYUu5VhKMsN8hZyiOHX/Eq1v+SKZVs3e/B0yeOlbo4Be2OhCAK2beN0z6E0zHws5n3UMdMDh2FC2uyYoWPfJmA2uJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791656906; c=relaxed/simple;
	bh=pfT3wOHyKi9Llc2uwpZ5XzeXRipyHebHM/7Njzj61Uk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iRRkw5dFriNmMv+g29iR90zSNb8lgyHcrxu+xls/DiavDV5lIJqMKLGdudaV4/Ua2C6r6snWKnQ2Dtb22AZPqbDP437RU+i/GjmQOAGWNPAwH1t8RncCtJn1WvBM/9bh2V3FZfnwC328NU8Kq+RQFBp/tvPALNiOdGvSzOxASA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=nzO7g/Zk; arc=fail smtp.client-ip=34.198.94.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="nzO7g/Zk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791656905; x=1823192905;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pfT3wOHyKi9Llc2uwpZ5XzeXRipyHebHM/7Njzj61Uk=;
  b=nzO7g/Zkqlat7O+g/2Q3EXXUR7CSqDfttPmjJsdXPzPxn/aMNP1pU5zv
   osj/Ndt27wKyjEpM2GjwRv11d0fmtnD+BocFla6SJg6bF5bsvECHLATyD
   1csXa2vgB/U4aQfQw4JkVF0mjxK01yA8XV6K6fqJR6IiK+FfV6P0rAwgT
   vZONQZ+eCa0gKels/f4fnjkBVQ32rJs5wiAeERA2eUcY+fQgeuu9AV2qD
   j8FoOLzZS+0xSfCAwbkB+HFK6h5pSyarGyvRXBPTOYVcZYzpw/X3oFqGY
   aYSUBK3sFnOu2Yo8waQ3aro08jrhAUuMh1GyXAL81TVjZewiqXnFsikbK
   w==;
X-CSE-ConnectionGUID: 5uZt84lOSMK6fCM+o18nCw==
X-CSE-MsgGUID: G4FbVC3AQdu+VizLIQNepg==
X-IronPort-AV: E=Sophos;i="6.27,150,1787011200"; 
   d="scan'208";a="29248840"
Received: from ip-10-4-3-150.ec2.internal (HELO smtpout.naws.us-east-1.prod.farcaster.email.amazon.dev) ([10.4.3.150])
  by internal-iad-out-009.esa.us-east-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 18:28:21 +0000
Received: from EX19MTAUEA001.ant.amazon.com [72.21.196.67:17783]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.33.149:2525] with esmtp (Farcaster)
 id 95bb0b5e-d1b1-4438-86b9-626777475949; Sat, 10 Oct 2026 18:28:21 +0000 (UTC)
X-Farcaster-Flow-ID: 95bb0b5e-d1b1-4438-86b9-626777475949
Received: from EX19EXOUEA001.ant.amazon.com (10.252.134.47) by
 EX19MTAUEA001.ant.amazon.com (10.252.134.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53;
 Sat, 10 Oct 2026 18:28:21 +0000
Received: from BN1PR07CU003.outbound.protection.outlook.com (10.252.134.239)
 by EX19EXOUEA001.ant.amazon.com (10.252.134.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53
 via Frontend Transport; Sat, 10 Oct 2026 18:28:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENtF4bSVQCiAj36VqEnVvIq8PPoVtLLSjz2OyowFWhaD0ox5lrKPFW+zQc4lyT+vyc29PmD3DSGbmkEJiFuN63kmGU7s6cqyMZvFl5gVpWF2iCFmN3hkYvmZVsTYFkeEYQoQmjCuAQqIXTnQBR/t4cPHj9xGEPy8u949myZLeWgTo+e3VmoVA9nV+0pKCna/7cpALcLca3WD8xxk0XyEYEHMPlFqbwuksE4T2Oy0CuO/9/tn68TlhKpwrrG8HrZaNPBJLO07ksqaGbpqQxQ4RggWp3l02V4xb+cC3vILPrFc7e8XzfHZ2HHLDZ3Gp5IBfeyJo85RjRS5FaavvblX+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pfT3wOHyKi9Llc2uwpZ5XzeXRipyHebHM/7Njzj61Uk=;
 b=BuIXJWNeeKgAVuY8V6btVNB+Of8h9XQTM1BZRepT6B28+9+j8QAcgoPOcpqwDEYTroEgX/L5oR69Y1zThk9U7N76rn6QIhqhdsnQ24gw8wvlnKB48vxSElwTe7NgsS6xbuAm6tKV2bCGw3Q7kGAOlcOsmlwVcS7+G4RiL7f3fhGGPWSMcc8ODtnjwW76M7zUZIg9Pz5eB+8IXQl1vGTT2vJMU+r4dm5OKMjdTTJ2CthX4CIffMh2TGMP9VXQkq0cJS1CZbXXtmF3PKfq/lYOhj+opLP63FhRuecgz5lFZI1O/DPqvd+KjGZSVaYecqUUQ1QguLTBvzpa89LPwNZd0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from BY3PR18MB4722.namprd18.prod.outlook.com (2603:10b6:a03:3c9::19)
 by LV1PR18MB988707.namprd18.prod.outlook.com (2603:10b6:408:3f3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Sat, 10 Oct
 2026 18:28:19 +0000
Received: from BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219]) by BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219%4]) with mapi id 15.21.0451.022; Sat, 10 Oct 2026
 18:28:19 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Radu Rendec <radu@rendec.net>, Thomas Gleixner <tglx@kernel.org>,
	"Shenhar, Talel" <talel@amazon.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 3/8] irqchip/al-fic: keep the device_node instead of a
 cached name string
Thread-Topic: [PATCH v4 3/8] irqchip/al-fic: keep the device_node instead of a
 cached name string
Thread-Index: AQHdWOUfjIFNbynY5UeDkhAMrqUkog==
Date: Sat, 10 Oct 2026 18:28:19 +0000
Message-ID: <BY3PR18MB47225F67839A01BDF368090EC6912@BY3PR18MB4722.namprd18.prod.outlook.com>
References: <20261008090058.38591-1-farbere@amazon.com>
	 <20261008090058.38591-4-farbere@amazon.com>
 <c0901df657d57f2a23e606aa55c0d70b13587e45.camel@rendec.net>
In-Reply-To: <c0901df657d57f2a23e606aa55c0d70b13587e45.camel@rendec.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4722:EE_|LV1PR18MB988707:EE_
x-ms-office365-filtering-correlation-id: 83b2e6be-6c5d-41e1-00f0-08df26fc4226
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|11063799006|38070700021|56012099006|4143699003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: +6ARiRPdHokV0MIuhTZ6TwpB9lxSb8a3PO8C+yNSqMlF2Wtsrk8XJKFZ6zFFDTWnaOo+DCBZ3USdAochMNk3UrJ394T+rrBMaH+52+qFAqTL2+xFS26t0mPzyQ0+jB9chW9LXNiN7NKj1sY9AaxH2pwIb09kN9QZjr6YrFmOtHf/FOcXx0y7AawHggEeBFwIGlblEp2fbD+LG6DIWtW9FRRfe3VL8tw3zqd21u469hq9+pzwed0aaQXnUh2eR+16Nf6y4ZDNlGcMxOGnWHv+Zy6NlOW6p2JHzeGs5Ti0oIgEwNF89LWObwZbHlioKbSTuqVEvSs5wXp5o181Jo5bf/+b0fRpW5/TkG9ZIEgkWjJVV87oasiPCkohh6dTAKXG57Fqvtt4VF5nwxxvMB5wErTp2zKfNlubS5mc9BsZdxrLGWpJGxYn3Gty2JKyDiTXV4wk4dSLWO7z4bAeiKYOtu6dpxdV6xxLx15/nKG2wu/+MTaUuT73tH62HWYDFK+LuOXwbrwBmuhk0kgnUNdgVjWGcdcA2XqiJPob9hgfLp/ZdyUy4v+NRW5SEtOTE0kMOdMBkHQ/2E1PcWkQ65tD/vf4yi95qxSR05l8PtgMnKjBoM3ahOxispzGkB2BO4Nfe0UaPd1h1fbdBETbjDaK88WNsiX3cRKvtl2yn2cnShkqOyQzilt85m7Ip57ml7ZR0BMiITX3wOzPU0uROPakRYtGFhfcvKW7/aWegpHrtAA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR18MB4722.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(38070700021)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVpyME1lbXFWbWZVcGs5NXZIQklHWjdNUzZlOFZZcDEraUJTS3VHSENQWEM2?=
 =?utf-8?B?dlhrUmRBK2RTZWlVNml6MXBBcS9zUExOUFBraWo1NXVUa3RDSmF2REliNCt2?=
 =?utf-8?B?MDh0eC9wdWQ4a05NMmRVS0FicmsxU1hIcHpoZWtpM0F6ZTFrbWh6WjBOOTNX?=
 =?utf-8?B?YS9OZDJVcHB4eFdQd0VUbWZhalg1blY1aGhwRkxWVDVaR3c4bUg3V3lkdzNZ?=
 =?utf-8?B?czVkSElZeWc0d28vOXVRaFpIU1lNcVBkNDdqREhKUS9PdFV3ZW1uQmVTVmZZ?=
 =?utf-8?B?TGFIcG03ZXJGMk55WTljN1Z6THZiWUlVSUUzeldiY2R0VGJ6Mi9vTGlnVElN?=
 =?utf-8?B?TVFmQ0w5WVJSNHI1LzNhNzFGOGxHcHdMRmZJeDU5cTkvOExOeER6ME50OWZZ?=
 =?utf-8?B?ZEN2dnBvSGxBTHNNUXowNUtHTEY1M0JhZkx1cThkMnBpSFZlVENpa2FyRHpp?=
 =?utf-8?B?T3FvbHphdlJHMllrQzI4L3hJaGNQUHJhSDY2Q3cxL21EMG45NGRPRmE0dXBQ?=
 =?utf-8?B?QXJiLzEvOWRNT2VPK091Q0MyeE1BSkRWMDJhU1N1N0xSVW5FdWc3TFJFUUpj?=
 =?utf-8?B?SG9IbHhuY054ckFIUjB4NmtkRFBQSWVHbVoyOHlaNk5zVFdORnVCTGVnSnJy?=
 =?utf-8?B?anpGd3hvamowNkx6N04wM3hHRDZBS3d2dFZUbUNyZlFDcEpkd3FCODhFSDZw?=
 =?utf-8?B?QlZXOEc1VlZ4RFNZWUw2YXllQlpUcFAwNGpITEhkb3BlTGdBUDFqWkVGZzVm?=
 =?utf-8?B?ZDJId3lTR21OZkREQXhrSmhhdWhnUG9VNllrYkZDMUZhN0ZGT1ByRitJR0FN?=
 =?utf-8?B?R1hHMGltdGVhelQzQlRZNVVLTVBDMm1VUWtoRlBGWTRBblVGL1NyaXY0R09k?=
 =?utf-8?B?YWJ3K0dYSmdzUUs0aDlueUZYUGxtOFc0Q0ptd3pwWFZ1b1BXaTNLT2U1M1lR?=
 =?utf-8?B?TGZDNFhSUndvN2RRUkd5WWsvT2RwbENjdkZicjdrdFpZRGJBbEU5Z0x2bWhy?=
 =?utf-8?B?Z2xuam1HeU1ONGFIR2Y0djlsR3pya1NsTGx5YUtYZHFLc1pxOThkc040WlNR?=
 =?utf-8?B?VzEzNGJENnRMMGY1VTArZk1lcUV1aDlJa2kyQzFmSTYyOVJqbDIxU0h1MEM3?=
 =?utf-8?B?TVVLQ3Nrd3VJbU5FaVdHZjlVNEtMSkpEYmVzRStjWVZXNnZjQUNIT2lRQ2dw?=
 =?utf-8?B?VWQ2QWszNGs5Vzd1MW1ZZkkvOHdCZXljTkJFL083bTRQZlhEWk5LR2lsSk94?=
 =?utf-8?B?SjBIdW9iQmxkeUhieUQ1LzBBUm1hazhGSXE0eExQMmRrMVJEOUxHVlJsVE5h?=
 =?utf-8?B?UXRTcHg1MVFtQnRzRUd3MFl0TE0xaEF3bHJ6ZlY3U1lGTU9uRDEyMEdoU3VB?=
 =?utf-8?B?SjczNWJHajlVSzNWNkE5anEzV2N6VlNFaE1ONHBLUVp5dEh0YTV4MTBDT1ZE?=
 =?utf-8?B?U2crUlRMajdLNTE0VTZJamUybzBJUGZYakdhTEF1eHJKVVNDQ1RyaFNXd1J2?=
 =?utf-8?B?a3BQaDZYRkZqNkx5UDhKY2VPS3dxY2F4SkdRSzdldU9DRU85d0ZyVDZZVTRY?=
 =?utf-8?B?R1EyVGs4aTcxMnphaFhoV1hRRWxVVldqRUd4MHNmWGh1S0Y3R09VbENpU0hO?=
 =?utf-8?B?M1hOT095NHVmdE5GRWFBMzZGbHROQnZ2TlJldlV3Q3hWeUo4Vk40eTd3Njhn?=
 =?utf-8?B?ZS94dkhHRkdTekFyalNETXRSaHFBVHZ4ZFhpVk9oY2ljQzBhc0dGMklxVnVk?=
 =?utf-8?B?NW16M0pLOUNjc3gwWm51SGdwVEZYNGE1cXFyaGswYnVwdmRwaUNQRGQwVXdD?=
 =?utf-8?B?YUxKWWNOOGt1Tkw0c3hhMklHQVQvU2JaOWY3Qi9PN0RwcFdWWlU4N0I5QytM?=
 =?utf-8?B?U0NzdTZSYXMzUkV4Z0RUSFgwMVQvb3JSaGltZHlMbEY1VEJJWmYyVnY4blQ5?=
 =?utf-8?B?QUs5MXhVQzFCZUtSOHhKVTZZK2lVUWVTQ21OdWR5RFhyZHFRRXMrUEZPL2R6?=
 =?utf-8?B?Zy8rRlg1ZEVBdlBUYVo3NGx3SG1rR0thR0xJYlg4eWU5WjlvRkFsczg1OW9G?=
 =?utf-8?B?MTFzdVNmVkRTcjZsL3BUdEZPdzJBOGgvVmRwZVZlMGZ0TSt3OU9oek8zeW1V?=
 =?utf-8?B?OTJRMWtleEFsdHYvSG9oVHdhT2RzRmJBdWZpVmRodkNxN2JFWWZzQndnREtL?=
 =?utf-8?B?dTB5bk5CQ3kwdnN1QnI5RmJORkpvaXJHZlJJWmVVY2V2WDUwcjYvcjFYUWtR?=
 =?utf-8?B?NmdsSVhMbEE1ZHpyckd0NXZhQXc4aVZvTmZDczl5TEZtaVVEamVpMmZORkdO?=
 =?utf-8?Q?XHHbmhfHQepzfVkRb/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jqXU3M406/4+vPREdO4o0ZtOPMdo690/m7Fm5qg4r2wH8Y85sAS8WcO6HbU3qjwQE5xbFXNTO4Tz+nrxDQwnoJ0c4knyoSn+lBduaQHeFxsk4qHNcM2jIqBdOLWtjGwazi1WpJJggGIUwzKZWEN41scYWNDem7c8jECoMFiH5pyIDIdzTMMa4I8sVYhfDZ34rZwYAviAq/78oVWavpv0lAz2ANvw0TN6awggyzvxtGS8O7UOGy2z3pIu4fj5JfnEXJPjRHAuz+1fu5ys0ptPw1W7Vtec+oIuhWRQgrFreKRz40J3ja4fWcgAr+Dv3ODl49Nr4egsWsfPEWjOfefY5w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4722.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83b2e6be-6c5d-41e1-00f0-08df26fc4226
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2026 18:28:19.3288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Og3RbmCsqcJMjdmiN8+TetO5gvnhb2M3N9fFoQRAjNcmnYE6KuUE6rYLMmDP7c+ZAR+L88uYgq2kTC7YzRNXug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR18MB988707
X-OriginatorOrg: amazon.com

T24gU2F0LCAyMDI2LTEwLTEwIGF0IDExOjMzIC0wNDAwLCBSYWR1IFJlbmRlYyB3cm90ZToNCj4g
SXQgbG9va3MgbGlrZSB0aGlzIHdhcyAqbm90KiB0aGUgaW50ZW5kZWQgYmVoYXZpb3Igb2Ygb2Zf
aXJxX2luaXQoKQ0KPiBhZnRlciBhbGw7IGl0IHdhcyBhIGJ1ZyBhbmQgaXQgd2FzIGZpeGVkIGlu
IGNvbW1pdCAzMDcyNDU0N2IyMjENCj4gKCJvZi9pcnE6IEZpeCByZW1haW5pbmcgcmVmY291bnQg
bGVha3MgaW4gb2ZfaXJxX2luaXQoKSIpIFsxXS4NCj4NCj4gQW55d2F5LCB5b3UnbGwgaGF2ZSB0
byBhZGRyZXNzIHRoaXMgaW4gdjUgYmVjYXVzZSBpdCdzIGNsZWFybHkgbm90DQo+IGdvaW5nIHRv
IHdvcmsgd2l0aCB0aGF0IHBhdGNoIG1lcmdlZC4gSSBndWVzcyBqdXN0IHRha2UgdGhlIHJlZmNv
dW50DQo+IGV4cGxpY2l0bHkgaW4gYWxfZmljX3dpcmVfaW5pdCgpIHdoZXJlIHlvdSBzdG9yZSB0
aGUgcG9pbnRlci4NCg0KQWdyZWVkLCB0aGFua3MgZm9yIGNhdGNoaW5nIGl0LiAzMDcyNDU0N2Iy
MjEgaXMgYWxyZWFkeSBpbiBtYWlubGluZQ0KKHY3LjMtcmM2KSwgc28gdjUgaXMgYmFzZWQgb24g
YSB0cmVlIHRoYXQgaGFzIGl0Lg0KDQp2NSB0YWtlcyB0aGUgcmVmZXJlbmNlIHdoZXJlIHRoZSBw
b2ludGVyIGlzIHN0b3JlZDoNCg0KICAgICAgICBmaWMtPm5vZGUgPSBvZl9ub2RlX2dldChub2Rl
KTsNCg0KYW5kIGRyb3BzIGl0IG9uIHRoZSBlcnJvciBwYXRoOg0KDQogZXJyX2ZyZWU6DQogICAg
ICAgIG9mX25vZGVfcHV0KGZpYy0+bm9kZSk7DQogICAgICAgIGtmcmVlKGZpYyk7DQoNCkkgYWxz
byByZXdvcmtlZCB0aGUgY29tbWl0IG1lc3NhZ2UuIEl0IHVzZWQgdG8gY2xhaW0gdGhhdCBvZl9p
cnFfaW5pdCgpDQpuZXZlciBkcm9wcyB0aGUgcmVmZXJlbmNlIG9uIGEgc3VjY2Vzc2Z1bCBpbml0
LCB3aGljaCBpcyBubyBsb25nZXIgdHJ1ZS4NCkl0IG5vdyBzYXlzIHdoeSB0aGUgcmVmZXJlbmNl
IGlzIG5lZWRlZCBhbmQgY2l0ZXMgMzA3MjQ1NDdiMjIxLg0KDQpUaGFua3MsDQpFbGlhdg0K
