Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B254308F39
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 02:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787970401; cv=fail; b=osXlGL9y072XVlL5h9giVy8mx4K1rTIAXo2b4yhqduUudnxWjKRZsY5USfl4N19Fpg42QpisEjc1ZHjMTGsXH+z52480grZ7dNqv1VXaOxJF8kDB3f7pCvQ6qufNPrny3wBEYgNqzUo+0cn++coJnlOv4PmQBt+oMAUnEpJQ1CA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787970401; c=relaxed/simple;
	bh=MX049z3rEcffVHipVNdNxOLzJ4aDZRZFukoE0bYDhKk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R0Mlp9dr2dRX2EX3FOHsXu7Wh0SZvK9yWjOEBff7hK/QH8tcMG1+CFlAdp4/rdjMKU6Ii350d/JQ3w226BFbrF4BOoOqQVBiWlzNQQKmM2PMj86mMReRevHBome73ttNb/hcdOyCHM1z2pHlV8vpTqHiVyw4/gOgN9arvjoCx8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JfyE4dN3; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JfyE4dN3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787970399; x=1819506399;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MX049z3rEcffVHipVNdNxOLzJ4aDZRZFukoE0bYDhKk=;
  b=JfyE4dN3jhk5gFl51W1eCqxzpSk2Sq6ztlAUYvd4mcDyrtMj5Tba8IRR
   aVQ0idjJDlbUyYs3kNlMvwMrZVCC1WExKpfeZ/OMKBuSBJOXKrAfTbxdw
   /f2qUu5wKr82OBHPDvGTd10PlxC3PAmkJ0B1GsJqqf8dn6GnYYZx5FU2G
   h4JzJ5NU/VtlXBYAtnWHbp6nHnmJSGIIsRVLacVLXp09qZ6XOFe0/QLML
   jmN3PlADRXGUhdQiZ6e/tROSRYNvsl9w9G4ufDXXoRPKyrjpNYWX1QBj0
   ryDc46ZVnIsKomdQz5vWmqsIjBMnjFlZklMfGdEBcRAFNxFBzONtPCSb+
   g==;
X-CSE-ConnectionGUID: vqxmvoewSq6m7Y2DBjw48w==
X-CSE-MsgGUID: laqFMg1iQAKI4HAhSgL/LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="99988608"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="99988608"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 19:26:39 -0700
X-CSE-ConnectionGUID: vDbDq08dS92PGYPNdfnsIw==
X-CSE-MsgGUID: uN4750XVSraIZYvLs1Kjbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="291812540"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 19:26:39 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 19:26:38 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 19:26:38 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 19:26:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bb8EUWDqw6sCA6/uioU65I+EAV8siAB7cmjJRjPWsNfkyfVpQUIwXF6qkZ6U3pf1WJTEKrKRwe3N+XR377tjPlOdwnNnVP0wQI4YG5W6KxZ+Xq/jtYbW8eFZDW2NFiNnT0F5K6Xwo7aWqsEJEhZWVsRC0kxgeCpjV2yG0b9/vnktM2U2vUIixr5lTn7wJWL/XZiJCzsywy2QgVEte90Xzdd1+UDjVO7XdI2VPmyi2eCDZpHbuxnAsXeMGqNVCyr6z+M1E0gIndJVfzxo9WvbP44W8PLtKLQUGZoQBVFyyZt9cVaYqEbCDcQnaC3fTqXUuDd/v3Br9fF29284GaZ6FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MX049z3rEcffVHipVNdNxOLzJ4aDZRZFukoE0bYDhKk=;
 b=b6waQVJGmSa4zQNyU161OgysYqEhSY7F0d5rIpFxzQIIeVkGjcQ3tBIchihCUTjIjNr6/cMpdSQjd8ZpUPP+E6MDmwXfOxXoLRF3CXwBqOsi+zIg1bT1rhoO8ru6S77cIeqh6wVdqpodTm16sdtIxcLowhwA2GwTAQ36Rupfc54O/UHlBHlt6pN1GagR5ppg7N5E8EyWrBGl58+QYPC8xtyXnIDT+cm2axaln7Z4+lXtA+gjOkQMyydyswaqOgyRxXcbirNMLPo3RDex2f5owrchinXI9HOSDphv3S4+RWuapMlwAvrLaWilZe0zQiOpJcR8IzMNcfLjYihffjN8BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7881.namprd11.prod.outlook.com (2603:10b6:208:40b::20)
 by DS6PR11MB178640.namprd11.prod.outlook.com (2603:10b6:8:4c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Sat, 29 Aug
 2026 02:26:24 +0000
Received: from IA0PR11MB7881.namprd11.prod.outlook.com
 ([fe80::1f88:583a:5b43:4fa9]) by IA0PR11MB7881.namprd11.prod.outlook.com
 ([fe80::1f88:583a:5b43:4fa9%6]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 02:26:24 +0000
From: "Pan, Kris" <kris.pan@intel.com>
To: Max Kellermann <max.kellermann@ionos.com>
CC: "arnd@arndb.de" <arnd@arndb.de>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drivers/char/mem: splice the zero page for /dev/zero and
 /dev/full
Thread-Topic: [PATCH] drivers/char/mem: splice the zero page for /dev/zero and
 /dev/full
Thread-Index: AQHdNxd0cC8nmV5sM0a2ulVMMD3LIba0TBJA
Date: Sat, 29 Aug 2026 02:26:23 +0000
Message-ID: <IA0PR11MB78819384189FC6FF9E7583A19DAB2@IA0PR11MB7881.namprd11.prod.outlook.com>
References: <20260820071217.1663709-1-kris.pan@intel.com>
 <CAKPOu+-HdT7S-aGtVVBvV55FQPMSPn18=n3Oe7XaxwUBjMzciA@mail.gmail.com>
In-Reply-To: <CAKPOu+-HdT7S-aGtVVBvV55FQPMSPn18=n3Oe7XaxwUBjMzciA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7881:EE_|DS6PR11MB178640:EE_
x-ms-office365-filtering-correlation-id: d9177117-8ad1-4cb4-5c89-08df0574ebc6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info: XHX73ZB9a6MVvLtNV4BoLh0UBZ2IgmEfgXalMRlP+IYS/gCRxUtzP0LFYnA7QwQ+Y3NXSfj1SPYfuCzfrpATJ1WL86RhxeXbAsRE77h610H9bIqB4DXNd+eKs/1JacbcgPmf1XznPb1sOIMKwimsiuld4+9Gd0hnIRGxXfnKaKmBCRMf/tSPR+5t9e0nxc88295a2sEdoF4M+QsqzCfc/ItKJpmy+Gx2L/nZcT7RakjrxPzO2uZS3CS9v+/i61gaAG122TfdjVXq7YGctttBxoGjVQslxaEeWG+P26d9m2NvW1KxZPTZ9CxzlLOQrShxX01HG7dNxGcNHhbr9YcYaE8IwJgEkngCMLMIWZyj7MZus+ttjvrx5zdhEfsZhRRcwvZwNeM+mlNPXLRQknyqT0ukDnpHcQ8jximMwTvEER45CL362eVl7HSEje98zbDyCEyC1A4JKB0o3uEOGH0uUbtSHGc6xcODz3OsISsCLbdwrpTVMlwWdGxu2ICPPMxvhmyLoJMMAUzFWrFaPAGQWC2P5lickiUlypltG6bEk9hmlM+W8Lt5BXxXKN/gDVe9ZjTAJMPaWyf5w/j6c2WoJMR4YSAzMhEvuRmISSFQIZGtrdXWlBxNmqouShjfCAilzJ2WyRXSRJnuYhKUAFkRCT+lYZAnGc4wn3Ex/kf/ZuThIYBsUAhnd+ZYj0FMvvWoQhJiYNuhmgt5ajdUjavhKBcFBZ/9FFgFVgE2U507MwA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7881.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NjZWbGNDV0pNRllNSFJ0ZEZNRVpJSk51akpnQUpWeUsyMUZWM1NGQWdxaVVE?=
 =?utf-8?B?Y1c2b1lGaXJxaXdlVDgvMk91TkxrQ0JoczR0bVpzSGNrZXlPU0NWZzA4WDdW?=
 =?utf-8?B?R2pzSWI0Q1htYm11WEdKTEpqZ0dRQWZGY0hHLzZtTU1FZGFXUDk3Z2JGbUlQ?=
 =?utf-8?B?VUtGMGVJWmZWNldLa21kRVB3ZEdFY0RkOFJMVmpIeERtOUdpd3FKOUtYMGRS?=
 =?utf-8?B?aE9aQjhpMWZaeFZ0a0tXNXRITUhkdFpjT2Z0MzVBU2gzayt5TGpnQmtqQ20x?=
 =?utf-8?B?ckRrY1RqWlZieHJOb0NUd3FZYS9ZY2JIaWZ4OUJWNVo4NFZHYXlNaXR0aFNQ?=
 =?utf-8?B?dS8xNnJma2d2SWxmSDBuWXdjb1NDZDF3VXFNQ0cwMGhvSW5uN0tpOEJtQ1ds?=
 =?utf-8?B?VGhaN0pYWHFxTGNVbUduRTd0L0haSzV2M2RJcm5MaWRCOVFFYWl6T3pJNjZQ?=
 =?utf-8?B?a0ZIMFI1NERnSGtySkZtRUpiN0FrYWcwVzg1V3E2eW82cWNHNUlaaFZFWDFx?=
 =?utf-8?B?OW0rSm00WGFuZ1pOMGFyWmZuc1ZQcmU0TGVZT0dxSlE4cEpiaDZyaTBnYnpM?=
 =?utf-8?B?Sm81RWJxc1pCeWZ3TXFITlNwcml1NStOdUhPVFZRQWx2SGx5YUtCbFlFVThQ?=
 =?utf-8?B?OUFDWVJoRmRFOWQ3WVB6UGFGWm1HaWEzOE9zbUx6Y3VtNDZ0RlZkQ3JjYytL?=
 =?utf-8?B?Y00yV3lDb0JTV2U3VmoyQkNTQ3BaemhCN0FqdG1OQmRWLzR2NlA1SnVyZ05O?=
 =?utf-8?B?YVBMZHl0RGl1RFB1MEVzSldFNHRtaUJDRW9nWklVVXB5TXNTLzhpS05kN0dB?=
 =?utf-8?B?RWIzZXdzYWJ5WHAxSDJyNGV1WWpFbmRCVTJGaU5UWjF1em41ZHRRc0pxRjBz?=
 =?utf-8?B?alJXY1ppQmNQMllCWHRYaGdIQW5JU29iUlo3K1JwdFV2R0d0cGNpYWxjYjgx?=
 =?utf-8?B?TzQvaHVKeGhlK2ZuYmZTSXQ4aXgvQUczamNXcVF5MkJvMC9oc3dreEk3cS9i?=
 =?utf-8?B?djRXVVpUeTVTZkExM2NjTjhyaTh0ejBsbjdxTXFKVVozTjAyeEdXQUpVTjVX?=
 =?utf-8?B?enF1NFVjTk5WNVhHMXVQSFQ4NDljVjBwZG9Wc3NlWTl3VWsvenZqMTdibHJK?=
 =?utf-8?B?S0M1SllKK3orb0FuQlA1dThSaENyYlo4UzdYRlh2NVRJVGZaNUwyMHpTS2xV?=
 =?utf-8?B?aDBzcTRaNlgwdlRYRndRMEFFakRCc3dxS1d4dVVDeUo3SjY1bndpMFlqSVZT?=
 =?utf-8?B?YURWdFl1YzhwbnkwcTd5YWNIRUNUQlBwUW5xT0xldmhhU0xpUUxya09VTGFu?=
 =?utf-8?B?cTJvblJHelNwVEFVMzVEcmFhdkhpc3lFUEdYU0NxdlNWbjZYMDFPVFg4Q2pl?=
 =?utf-8?B?L2hkUmxoY2dyUGdCWFNWOHdYNzBaVmt4Tk96cVo2MWFITXNZTnpzZFQzeUNr?=
 =?utf-8?B?ZXpwK0dQQi9xc25HVDNaU0lEbzA0ODllRFYyckNLajk0SXJObVdPeStQa3Q2?=
 =?utf-8?B?WFhVZmFTV2lRUDJKM1lVd1Q2NUNWbVYyVzlHUVN2ODZOZU5NcGxvenNVRzd1?=
 =?utf-8?B?T0NuaGFqVHZSWEhxK1hmdGg5b3UzYmgwZXBvcjVNaFQyZU1IeWJhek40ZjVB?=
 =?utf-8?B?MmNWRFlVUStrcUhQS2pVUnZJK2xVcFJacHJ0NkkyV1daWG5vRi8zQ1FnRWg4?=
 =?utf-8?B?QlRPeUVuZDZKTjJVbi8wZWZ0ZmQwcElBMDJDakg3K0JsdElaOW5tbzd0dFdX?=
 =?utf-8?B?ZDNlVWdpMDhvS3RGRDEzR1dJUEdFRk5nNnBmSVpsZVFMVXZyLzN4TjdUQVNL?=
 =?utf-8?B?eWZtNEw3bzVkWE4xRmxDZ1V6c3ltZnJEMnJySS9iQytvZktzZG1vb2NMOEhS?=
 =?utf-8?B?U1laeHdVM25UMWdXUmZVdlUzYU4vZm9WWnA1UG5qQ2JaOElveHhzZGpFNWhp?=
 =?utf-8?B?Sm1xeUtOaW03a2NMSThwL1VSZ0VGaGp0b2U0KzRPNGUvWFdqUVE4ZWlSeHNj?=
 =?utf-8?B?MWFaS3haRmMxb3NsR1VhZ2Zqc1I2cUltZWZGZHd5b0VzMDV3M2pkZ3R0dVdl?=
 =?utf-8?B?VlU0QVM2MStLNloySFhNYVpKYWYyeGVWVGhyQjRacUtPUktNVEhZQnVDM1lp?=
 =?utf-8?B?LzVhN2hrNUlLc0Fac0NTRVZ6clNrL2FhdDlvVVNzMko3TytwOWRuMXI1KzFF?=
 =?utf-8?B?UU81eE5aT3VXSjNkWjRtTjYwRHNVTldWaGxtcW4zcVhpZCt5VUR1enBPSmhX?=
 =?utf-8?B?d0NwRHJEQi9wazl5dXk0ajc5OXErWVI1R1htaGhMTVRhTVM4bmhOYm1YZDBU?=
 =?utf-8?Q?Aa9nNXe6/zMLEmk7VH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: sZIgBTGmwVoZ7RSnql7vd8xKtQsHRBu+YjAPMBYU01069g5wWv5E4R7L58aiHdh47xzfdRFy9iqTe1WVKUuEGHmjZt38Lm69DxGXTrpP+i4Uj1M79AFzYVDfh/Jn2MOjdql9sME2gWjY8EMLJT9jvecgyEfBu0cPxaZ++BZEvaeBj90KXHvWbgrpyfvYXmwhRt5ZZU3uNtY0luDXXX6Mqw7rPVDKJyeI5/dTE+4xHn8JJyHn1Kf2Ffg9nUoWKmjBi4R6h6PIE9O17Ip/VLmYwQbU1XWZnGHUnbWFWg7kEJuTbXavODn9zzDvIdc/1tYEumWUPPmcujLQP0bekUrRgw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7881.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9177117-8ad1-4cb4-5c89-08df0574ebc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2026 02:26:23.9784
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tvac2LUi+c+eNXUmd9fkKe8cWE+y1EDLaRBCj0m53OY+s7+5dlqfaeac8ESrzSOTR/FtSHatJWlgbcKbMNramw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB178640
X-OriginatorOrg: intel.com

SGkgTWF4LA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcgYW5kIHRoZSBSZXZpZXdlZC1ieS4NCg0K
R29vZCBwb2ludCBhYm91dCB0aGUgZHVwbGljYXRpb24g4oCUIEknbGwgbW92ZSB6ZXJvX3BpcGVf
YnVmX29wcyBhbmQNCnNwbGljZV96ZXJvcGFnZV9pbnRvX3BpcGUoKSBpbnRvIGZzL3NwbGljZS5j
IHNvIGJvdGggbW0vc2htZW0uYyBhbmQNCmRyaXZlcnMvY2hhci9tZW0uYyBjYW4gc2hhcmUgdGhl
bSwgYW5kIHJld29yayBzcGxpY2VfcmVhZF96ZXJvKCkgdG8gdXNlDQp0aGUgc2hhcmVkIGhlbHBl
ci4gSSdsbCBzZW5kIGEgdjIgd2l0aCB0aGF0IHJlZmFjdG9yLg0KDQpUaGFua3MsDQpLcmlzDQo=
