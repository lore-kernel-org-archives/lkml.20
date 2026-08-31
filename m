Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9676A4B2CC5
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191787; cv=fail; b=iWdD41u0t+FW+WxxvthPkVOKUuC2fCK1wm4+Rvi76Z6H+G8DnVJP/Jj9wBQBKGn0F1dSqiwRaKCLJzMUAsL1oo27huQpueGK4yAWXEekpprdvvif/0UIpG5noxC4D/PjNLPVJQIh1ZJou3NA//ZLUSfWmg2WcbdsRmwrTRX4mA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191787; c=relaxed/simple;
	bh=MYzVhgrnyYIjViFdLnH6a4SF/2IQordiDoNUrMe5kA8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PEO/OpK0FpDPwP7eiMLPJLDhPbTAxxOpYrhAhxPtYhDlWM/LX+gvA5l6bjFa7aP+LaygTWugIj1G2Gk0FituueTa3TA/tT48mFeos2IlYKx/OrfkexxqCGJveKnDXVLRcNJXyXvlA0hd5Vl7yul1p569P91rz1S/LP9M/SOOtkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fPSKECVn; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fPSKECVn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788191785; x=1819727785;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MYzVhgrnyYIjViFdLnH6a4SF/2IQordiDoNUrMe5kA8=;
  b=fPSKECVnEKberTLgJKAnQvvln5XWGpOUwCByCzVJZhlDyKdnKKzgdo4Z
   PPWQDONP8j8FMaPXmGawZUosN5tzlkLVsydNABjArx3HBwXDeK+GlC2vT
   vDh/XcPmDRRX6qrBzkkMGKjA1hGhXXoKTZNOWl+KkaUC+C+z9+tTmIgd1
   KMbAVo5xTsQIW+gBZnZOvxbW0VWEwXMLGkrR++e/loTi92MA5rou8ZgaQ
   C84MlCJJ298mjvaewYw2fUBCB5Shf9LGwrDKMyCbtdh1ctTKoKHWw1hBc
   T1Kmoz+wcxzLW7umDvhuwIXogRP3RoUKYJqwiUI5z8o9s0jUrccS+pZXc
   g==;
X-CSE-ConnectionGUID: Kgt/LXDrT6GKaJ+THykg7Q==
X-CSE-MsgGUID: aZbgnLYnRV2N2vKXpMj5Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="92415478"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="92415478"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 08:56:19 -0700
X-CSE-ConnectionGUID: IckEj6PlSSOuATkof3r26Q==
X-CSE-MsgGUID: 5UD5UXFqRsW5n//xV00J5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="293671718"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 08:56:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 08:56:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 08:56:18 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 08:56:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GuSTIWgx5NzmSCSaODKCyVbnmXPvWqHQg651LZF2szAeRpv8psmklutFLT/T9CtvsxTic5q17ku2Oj5G3ylWiUmj7IMk1wor7wq0tgPn0LLrqiw/5ud1Apo27Kpxi5fgA+v5Asfdq5f46xKkzj+Q1TZ6VpjM35qnyYvr/oRSE5EcyGUc7E1TJUVHR3TvVOpdU1lU84mX8nHVzaUF+rgnBbgB0XWhldOSj1JD/5h7f8psO+fO4OvYvcFqW/SUOH/4fRC9CGREWtT3ZqpP7fVP8ZCSJUfxrzMcBebG+l12U6rkoFgiPVLa0bbyovXT/qVVXSnZ1hkMcJhyVjW9zG7KCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MYzVhgrnyYIjViFdLnH6a4SF/2IQordiDoNUrMe5kA8=;
 b=nTJPWG+KDg2QZC/8VnwXTOWF7Yn/oB6I9yAlaerru3sqnfxzJvBMzUHV9yMTW3MHZ6basDNT7qP3rBDbvmevVNgv781RvvJuP4AHFxGi9OD0pcX93Qq48vjJZxC/8ZGKsE9jqqujo2VkB4yzWRrcZTkqYFeVyecqxRwsAEPXIvLLISbdAsetLop3SZ+RlmddM5Strs8l0dVFtQcXqXESYNE/FNPuNDRpvofSqHZI45DOBzz/sylV+T6ShtdBfLRv8VNUfln60/q/k5FFyvWzrBoaZ4AyIFMRYqILo3+06DJFoLvDDNBKf9BsP6L9PInEMrbDt0VhUviRl4RXrKNAbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH9PR11MB522318.namprd11.prod.outlook.com (2603:10b6:510:41a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Mon, 31 Aug
 2026 15:56:09 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 15:56:09 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, David Laight
	<david.laight.linux@gmail.com>
CC: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Vitaly Lubart <lubvital@gmail.com>, "Karol
 Wachowski" <karol.wachowski@linux.intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] issei: INTEL_SSEI should depend on X86
Thread-Topic: [PATCH] issei: INTEL_SSEI should depend on X86
Thread-Index: AQHdJYiVaJdWcRApYkq6Q2Y30S7BBbawKfAAgABSQICAATamAIAGrFYAgAAXXiA=
Date: Mon, 31 Aug 2026 15:56:09 +0000
Message-ID: <CY5PR11MB6366EC84A3D4511C5217A1EDEDA92@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <7145ead76cf7cf399eb4e1e6039f51cae07b49b4.1786009079.git.geert+renesas@glider.be>
 <20260826100848.12eaf40e@pumpkin>
 <CAMuHMdWDcfrUM4tKGOO3fHJQ3FnYBu-tPG61BY_069Yv_TxXKw@mail.gmail.com>
 <20260827093502.23b6b062@pumpkin>
 <CAMuHMdVWvezFSy3y8mwQvTxxp0C-Pr3YuSEuHGm4P+7kR80+nA@mail.gmail.com>
In-Reply-To: <CAMuHMdVWvezFSy3y8mwQvTxxp0C-Pr3YuSEuHGm4P+7kR80+nA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH9PR11MB522318:EE_
x-ms-office365-filtering-correlation-id: 169a4681-33f6-4d48-c026-08df07785fe2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|10070799003|376014|1800799024|366016|23010399003|4143699003|11063799006|56012099006|38070700021|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: PDpUsyIVmEzV06aMQFe377wy4rhi6TQJOgjXWzPVWz1tO82Mcycu2XQUmnfD3YnwVbeeA5OD8VSl+HJQYmm6ww5YbNROu7TdNN43kEVqjKPnD4GCkh83QiZt9RNd2uF0RxS9EmkHhf04ZngFwlD91zBlHnHKaDg7AgTpJiFpvFcVdcYVXBi65pwGhO+BNFZybKk5ru/3AHwiU4fyHiQvYXmhRWWq/dYk+4c9O6yUW8w6LXsO0TWdengECESIUmMM1LjRUI8z5ghMT85vnH//F/FuI2MgsJ2Gx7pknH0NEqZvd4ooV4LzjUcWyNS6aYpalFYEBiL1WxECC5qoGdxl0hkOIiVh5j9Su3NQ7dODFN1m4UvPgvm6I4IsHX0N8IK++FZOXpAAAyRgfvJNSdkfsldH0gKJfalxWJ60KFt2TX+3EN5nC/wzDJLwhQ9Ek87Uthrmch0EbY1hskZrPun1znzQPE0QCeWrO0jzedXlHGPoEnIovbOwb0oQgaMF0kBJR7Jt5lr/Ecog9Sb057JPKUcmmDJNe9sdsIFWaQdZcHZtWio+bWCXTwGiVdWwg2WIVzJsthlPucKy38r750Ts97luGddx7c37DLVmtBWjV+w0nxyoES8xV/vXOYZoin7Yw9Q4pNX2n3YHfqMBt4CmnotgmPrnOvxa73Ykx0JiOfp5YtgxasGxgNs6embFfQhgBj4XTjZfdyAsE+iW9NHnXQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(23010399003)(4143699003)(11063799006)(56012099006)(38070700021)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mk9SN0hrQzBaeStRemhkVlhqOFMrZGJKd0FtR0dEN1pzY3FYRkphODNKQmsr?=
 =?utf-8?B?TzI3RjBvRE5pUzRzMnJRQjVSbmp4dG9kZkRqYjllVnEweWxsSnBIa21kKzBY?=
 =?utf-8?B?WXgzcHpkRmR2bDNlNlNIMk5DVkJUWERWSzBZTVNFOXFHdlJFa1RsU2c2Z1Bx?=
 =?utf-8?B?S1czU2FlNldlMVlCNEkvb1dSVU04YVJybEc5VDFQU2NWelpUMHMzT0ZWWW1P?=
 =?utf-8?B?VDRXYUVYbkRTTWc2WXpMT3RQTVpNQTlwL1kzZnpyZERNUVQ4ZGJzbmxuTjlD?=
 =?utf-8?B?b0IzcmljN3Y0cldOZjFFaUg3K25jODBWSTBidytldDh0Qk9wengwMXlSWWI3?=
 =?utf-8?B?dFBTSzQ4amIrbXVoalBsN09OeGRrL2MzTG9DeWpKc2xYRVRtaGtYOEpXRStt?=
 =?utf-8?B?SktIVEZvUHVvdVN4dWEvTElCa2M0RGMxbHJ5RlJFVlF3VUtIaXJFdng1TlJj?=
 =?utf-8?B?clhsb3VBR1czbE9LdDZLVXhDaVd4akhwdmpvWGtLQzRzaU5CYWtJWEhLTllk?=
 =?utf-8?B?bjJtSExUWldWd2VldEg2ZzAydDMwOGZiSS9JMjFHQVFiUDFZTDVINHpDNXVw?=
 =?utf-8?B?OWhsMERYMmtwcnpadnFJUDZIS2hQL1daVmhuaGRMRHlmZ3NhcUdzUExTZFlp?=
 =?utf-8?B?NTJtblpLL0NTVVlOSUMzc3BQb2M0eHgxcFN2V3JPR1MzZFZBemViaWtWR0VW?=
 =?utf-8?B?R2EwajF4YmpOUS9WSWx1Y3I1UkNHNUI2YUJGS1lSNzZzWHQ4NmlYeWxIOW1M?=
 =?utf-8?B?WTBDTysvSkYreUsxcGh2WVlMZVk5bTlLcVUrQitReVN4U2ZqM2FDSWM3cFlO?=
 =?utf-8?B?dlROT2RhR0loWnI0TnQ4T3R5enhvSmtqaEhRUWNmTWY4R2hRdlljdUNWR3BC?=
 =?utf-8?B?TERxUURtVTNwdUk2RVg1dElYRHBHS294djI5eU15LzhGb1BFWFFvbkJsWVpT?=
 =?utf-8?B?OW93b3VVQW1IZFpzbTd4dVpHUTdHeVlFNlVNQXNqZ2hRcmV4Y3A4M1JpcnBD?=
 =?utf-8?B?MXZrWUhnMXVPeWdlR2FObXdvc1htNkZRaHIzTHdKNXRUemFiK3FRYkVrbnNL?=
 =?utf-8?B?Z0JJanJTVWVIVUFWd0FuYXFIZkxPRTBRSGk0VTI0aUJqdWFwVS9WdGczS0Fs?=
 =?utf-8?B?RSs3eWljMWYyWmszYUxWL2lGVHlmSkFoc2NlWHZ0dFo5NExQS0o2dmdMblZI?=
 =?utf-8?B?ZHYvY201Q2N6bTVRYW8xaEFYY2hRaDFZY1o0TWJObHlRZE8xR0JCME9UUFIz?=
 =?utf-8?B?ZzJ2bnptYlhUbjZlQjNqeEtobkZpckFqbkdKRWJyUEZXSTBOYURVYUxWdGVX?=
 =?utf-8?B?M2o5eCs4WFlWMjN6a3JoK2pFeEZEc05FeXQvOWYraTB2dk5KL2ltdzJKbXBr?=
 =?utf-8?B?YXB6L0orODhZajh6RGp5SUU4YS9Qa1FaMXBpRktLS05hem1VOVRYU05OZlpR?=
 =?utf-8?B?b3BsM0NYMlpiTksvQTIrMk9keXo5aVFYZ3NUQkNqalZHdHhGb2xxNzBvK0Uw?=
 =?utf-8?B?QkZtTXFhQlRLdytqZDYvVjYvVjNPbmpQNUk2UVZhbGJpRENLNW4zZVVIQXRx?=
 =?utf-8?B?SDlnUXV3UGVqTjhETStXNXQ1MlBwN1lEUkw1VHRyTllpTjZpbTlBUTEzQ3BZ?=
 =?utf-8?B?aFRUakdpSmNlVnFYVGZKNUZRQndaMVNHMzZsdW9uWHc5QVozQnFDS3FPOG14?=
 =?utf-8?B?Q3MyZlZ2NERxT3A0MWhBKzlJN2wzNjd5LzRUL0lzQmlsT2szamw1ZUh6akcz?=
 =?utf-8?B?ZmFyQStybjlpZ1lOdG9ZaTBYMm0xa3BmN1R2TmtnZll0c01WdUp3cFVyM2lV?=
 =?utf-8?B?aXRvS1oyK3loYkZxbzY1R2dBOVNaZTY3QkFDcDJLQXZIZ2hkMmFtc051bVhG?=
 =?utf-8?B?S1N3d0k5M2xSei9yUlc0WFR6aW5zcjRZM1gxS3ZRMk5nS3FrRkQ4THpnVkJM?=
 =?utf-8?B?TENmUVpBTXpiYlJQUmc5OXBMTkZBeHRScGVrL09EM3BHR3VCc3dLWmNGK2Za?=
 =?utf-8?B?ZFlzMmZFWVJBWlhJTVdzWTFTb0l4ZG5KaDFFb1piWHkxMXZSbWZwL3NXbEJZ?=
 =?utf-8?B?UlZCc0RCb0xDVlZpWEVIM3RIcFRkejlpbHRzZVFIY3hoRHc0SW1mRnVMUG5y?=
 =?utf-8?B?SEo4NWtaUTVMSXZ5dW9LMU5YYXAwcE40Y1RaQ0RjbnRhTE15cVlENzNoRFBL?=
 =?utf-8?B?WTVHVWpDamFLU2doajR5TUIvVlFrQkl5eDRRWGxwUTYxNjF6S0JmS2FxRmlo?=
 =?utf-8?B?VU9JL0x5cmd6MlAra20zSnI1YXZOaEdjcTBwQWw1c1Vkd052SDJ5ZUhRRzZX?=
 =?utf-8?B?Tnluc0RZdm4zYnFwZXlsSVp1Q1h5citZa2x1eGZYd1hpK1JMM2l0VHV1RENC?=
 =?utf-8?Q?hVNYl4h5WEZGy2JkjxBXpBLSboHeMT5/48XgO9Sh2SR+l?=
x-ms-exchange-antispam-messagedata-1: HjszQIRGfkjFMw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: DfccLeUMdToEixhdxXNzoM0In4tIbp6DnvKMNklYt0K/izkMByXB9vtlzdFNmS3/pK9/fmrQWlG+rF0tRj9NnrDlThsGnp1OycGu6Ri0cT2SrESFTrTYRSDdiDlTauUoM+NxlhtHspTNr+SFKk445xC9S0mA/tLUQBoLQ3LPZ9T4GN0pwzhpjiG/GDQ9qYu5GIYMEwS5lM4rnJnjbUE4BlzzyHQVYJb5HAzWh60uylYX5D7Wdo63xx5EC5ixpmkxWtnL+te+1WQmq6mlrpcvAoEMHmioZ1KW7NBvdfdQ7RTQMan/ZpWESBA7NvagzCahKO9pNql5HXC7e7toFLv59w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 169a4681-33f6-4d48-c026-08df07785fe2
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2026 15:56:09.5898
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IVFR5OSIw5H/wrPaGcxnewTWbqCHeQIxMLI9EljAOZc+RToxVZMt+zsgQmxeNXQ76sS9H30CZYtNZ0VX3e21TbsACeKdb41MhtNBxu/koFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR11MB522318
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBSZTogW1BBVENIXSBpc3NlaTogSU5URUxfU1NFSSBzaG91bGQgZGVwZW5kIG9u
IFg4Ng0KPiANCj4gSGkgRGF2aWQsDQo+IA0KPiBPbiBUaHUsIDI3IEF1ZyAyMDI2IGF0IDEwOjM1
LCBEYXZpZCBMYWlnaHQgPGRhdmlkLmxhaWdodC5saW51eEBnbWFpbC5jb20+DQo+IHdyb3RlOg0K
PiA+IE9uIFdlZCwgMjYgQXVnIDIwMjYgMTY6MDM6MTEgKzAyMDANCj4gPiBHZWVydCBVeXR0ZXJo
b2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToNCj4gPiA+IE9uIFdlZCwgMjYgQXVn
IDIwMjYgYXQgMTE6MDgsIERhdmlkIExhaWdodA0KPiA8ZGF2aWQubGFpZ2h0LmxpbnV4QGdtYWls
LmNvbT4gd3JvdGU6DQo+ID4gPiA+IE9uIFRodSwgIDYgQXVnIDIwMjYgMTE6NDY6NTUgKzAyMDAN
Cj4gPiA+ID4gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4gd3Jv
dGU6DQo+ID4gPiA+ID4gVGhlIEludGVsIFNpbGljb24gU2VjdXJpdHkgRW5naW5lIGlzIG9ubHkg
cHJlc2VudCBvbiBzeXN0ZW1zIHdpdGggSW50ZWwNCj4gPiA+ID4gPiBMdW5hciBMYWtlIENQVXMu
ICBIZW5jZSBhZGQgYSBkZXBlbmRlbmN5IG9uIFg4NiwgdG8gcHJldmVudCBhc2tpbmcNCj4gdGhl
DQo+ID4gPiA+ID4gdXNlciBhYm91dCB0aGlzIHN1YnN5c3RlbSB3aGVuIGNvbmZpZ3VyaW5nIGEg
a2VybmVsIGZvciBhIG5vbi14ODYNCj4gPiA+ID4gPiBhcmNoaXRlY3R1cmUuDQo+ID4gPiA+DQo+
ID4gPiA+IFNob3VsZCBpdCBiZSBYODZfNjQgPw0KPiA+ID4NCj4gPiA+IEkgZG9uJ3Qga25vdy4g
Q2FuIHlvdSBzdGlsbCBydW4gMzItYml0IGtlcm5lbHMgb24gdGhlc2UgQ1BVcz8NCj4gPg0KPiA+
IFlvdSBzaG91bGQgYmUgYWJsZSB0bywgYnV0IHRoZXJlIGlzIG5vIG5lZWQgdG8gc3VwcG9ydCBu
ZXcgZmVhdHVyZXMuDQo+IA0KPiBGVFIsIElOVEVMX1NTRUlfSFdfSEVDSSAod2hpY2ggZGVwZW5k
cyBvbiBJTlRFTF9TU0VJKSBkZXBlbmRzDQo+IG9uIFg4NiwgdG9vLg0KPiANCg0KSU5URUxfU1NF
SV9IV19IRUNJIGlzIHJlbGF0ZWQgdG8gc3BlY2lmaWMgSFcsIHdoaWNoIGlzIHg4NiwgaW4gdGhl
b3J5IElOVEVMX1NTRUkgaXMgSFcgYWdub3N0aWMuDQpCdXQgaW4gY3VycmVudCBzdGF0ZSBoYXZp
bmcgb25seSBvbmUgSFcgaW1wbGVtZW50YXRpb24gaXQgbWFrZXMgc2Vuc2UgYWxzbyBsaW1pdA0K
SU5URUxfU1NFSSB0byBYODYuDQpOb3Qgc3VyZSB3aGF0IGJlbmVmaXQgd2UnbGwgaGF2ZSBmcm9t
IFg4Nl82NCB0aG91Z2h0Li4uDQoNCi0gLSANClRoYW5rcywNClNhc2hhDQoNCg0KPiA+ID4gPiA+
IC0tLSBhL2RyaXZlcnMvbWlzYy9pc3NlaS9LY29uZmlnDQo+ID4gPiA+ID4gKysrIGIvZHJpdmVy
cy9taXNjL2lzc2VpL0tjb25maWcNCj4gPiA+ID4gPiBAQCAtMiw2ICsyLDcgQEANCj4gPiA+ID4g
PiAgIyBDb3B5cmlnaHQgKEMpIDIwMjMtMjAyNiBJbnRlbCBDb3Jwb3JhdGlvbg0KPiA+ID4gPiA+
ICBjb25maWcgSU5URUxfU1NFSQ0KPiA+ID4gPiA+ICAgICAgIHRyaXN0YXRlICJJbnRlbCBTaWxp
Y29uIFNlY3VyaXR5IEVuZ2luZSBJbnRlcmZhY2UiDQo+ID4gPiA+ID4gKyAgICAgZGVwZW5kcyBv
biBYODYgfHwgQ09NUElMRV9URVNUDQo+ID4gPiA+ID4gICAgICAgaGVscA0KPiA+ID4gPiA+ICAg
ICAgICAgVGhlIElTU0VJIChJbnRlbCBTaWxpY29uIFNlY3VyaXR5IEVuZ2luZSBJbnRlcmZhY2Up
DQo+ID4gPiA+ID4gICAgICAgICBzdWJzeXN0ZW0gcHJvdmlkZXMgYSBjb21tdW5pY2F0aW9uIGNo
YW5uZWwgYmV0d2VlbiB0aGUgaG9zdA0KPiBhbmQgdGhlDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9
cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVy
dCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdl
ZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3
aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVu
IEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNv
bWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0g
TGludXMgVG9ydmFsZHMNCg==
