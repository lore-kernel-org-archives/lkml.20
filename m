Received: from iad-out-008.esa.us-east-1.outbound.mail-perimeter.amazon.com (iad-out-008.esa.us-east-1.outbound.mail-perimeter.amazon.com [34.193.58.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2643EC830;
	Thu,  8 Oct 2026 08:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=34.193.58.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447651; cv=fail; b=q0UcmnEqii7XpPCLUeeJTQB8j9mAXEi/EJrgI7Chb3FkzvjHDh8cCrYAV8nl/vGqTDJnMJYLGPZEmI/cvzGMoHQ/hyykEt/MOMK6gulOU9kgDPqtNM7XtgrcMDyGck/2DmFxgADEPAkzJUQoAr6KYdPJf8114v2CkzcEyGviXXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447651; c=relaxed/simple;
	bh=iF3pxln2ipKl2HPf+GjIX7brBfzb6UPj3KIl39clY8A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ti4/pf/SvLsS0+7PZ0Y/g5SscsW9sq8/suqNES4VSwKtHw74WG+g2rHIor77fMM8Y3Q9nFr8KWhAqsDV4ifM1M5IbS6QlqmKmRWEBQ+6KdyndHFI3VmaD1bkOrdY9nVXn2dG2g9I7H74FMA85MhM+kZRQYreEUD+kB8dC5uVZxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=sN60Gl+V; arc=fail smtp.client-ip=34.193.58.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="sN60Gl+V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791447649; x=1822983649;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iF3pxln2ipKl2HPf+GjIX7brBfzb6UPj3KIl39clY8A=;
  b=sN60Gl+VbrYjkUFaIRes3cTwJQ4/Vadq+FHlVzg8s9vZ+Xiqt+rBg0Ll
   FZXsqN/d3gEYXh7yEntMFyqF1jIrAW9aPfdnm9Yl1tRxzpKAlkcv9axV8
   F/iTtf9usKstmYxc6JTYprJLKiec+YC+h7TpjCb1uAFwqiETQnsR5W0By
   TPabuOOo6OYvPSrwqJfcecBXWZ416UUcvnKEEeITn3N8wqe67GzwGS6/k
   qF6QiDLBPAs/Oa4vmDVRFYqtMPfhBGm/PN1XN+mGASUxTbH06B7BUzP8e
   VhlV1YV7obL8BxaEltr9owRfIajZwoImKnKzZqE+gjHgIDOFFTMNzwrtc
   A==;
X-CSE-ConnectionGUID: /xv0LUEcS62HQXLQ/23I+g==
X-CSE-MsgGUID: cTLeERdCR3W3u9Vkid/Gog==
X-IronPort-AV: E=Sophos;i="6.27,146,1787011200"; 
   d="scan'208";a="28973558"
Received: from ip-10-4-13-79.ec2.internal (HELO smtpout.naws.us-east-1.prod.farcaster.email.amazon.dev) ([10.4.13.79])
  by internal-iad-out-008.esa.us-east-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 08:20:46 +0000
Received: from EX19MTAUEC001.ant.amazon.com [72.21.198.66:15059]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.14.245:2525] with esmtp (Farcaster)
 id c0fc1df7-93b4-4610-a33e-1da9d3c3912e; Thu, 8 Oct 2026 08:20:45 +0000 (UTC)
X-Farcaster-Flow-ID: c0fc1df7-93b4-4610-a33e-1da9d3c3912e
Received: from EX19EXOUEB002.ant.amazon.com (10.252.135.74) by
 EX19MTAUEC001.ant.amazon.com (10.252.135.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53;
 Thu, 8 Oct 2026 08:20:45 +0000
Received: from BL0PR07CU001.outbound.protection.outlook.com (10.252.135.199)
 by EX19EXOUEB002.ant.amazon.com (10.252.135.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53
 via Frontend Transport; Thu, 8 Oct 2026 08:20:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KP+mMqkN6tBqUeJIu/cesfQYfdjcBxU2kYCN63Bul61CruEaPkxf3V5/P0CaWjTY3e1PhLkSrXKxeAOhvEjfZspqzWpErwCLNzk05uUa6hT951V4GkO3UlGeu6QDmogz52zMC5nFfzC4wyMDxyJGM3nYX6xQFy/4i6ZXKLxXtWxO7TaaurrtAsDUDLb0wzJk8WGJoVFj2SgzilBcApqQHgicXIlymL7BDmtsmjQy3/CkduXG7JJzpcMiUsywefcOVEP75PCPa1IOgkxSKhg+0o5k6fgAhgLlVGFZyuKxnS6wiHlMHnm2JijThbSivWEBrkD3ZhqklwNykAzT6w5oNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iF3pxln2ipKl2HPf+GjIX7brBfzb6UPj3KIl39clY8A=;
 b=nk362ScmUSZUzftDWPEbPVGSTz2KniF6HtPHOO71h4eSFtz9gqObIalRvumod/Q1RAE6Zgqp9N4+jEVXLwXqIgKiyQLqADm47YCEPQPt0jllpcdpTCKjRh7q/1zpXzov0RuHJ+A2dcqxMlHAiN9qDAW18kfNM2QFUhu3ZwcdyTUy713VXpWH42DFT0NASCvK24vUVflfmGdNjy6rSrhABDrYVLkSDN1XFPaf0woeeRwTSiTsUm+LdhIdCiujJSd0ph1lLNULVW4rMo4fIjKxjWdO3Ps62dFwP0F782RAtSkydIOZ/RQ930eHBp3Z2HwsLOhWk5nPsHQ305iBv+43+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from BY3PR18MB4722.namprd18.prod.outlook.com (2603:10b6:a03:3c9::19)
 by DS0PR18MB988691.namprd18.prod.outlook.com (2603:10b6:8:42d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Thu, 8 Oct 2026
 08:20:42 +0000
Received: from BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219]) by BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219%4]) with mapi id 15.21.0451.022; Thu, 8 Oct 2026
 08:20:42 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Radu Rendec <radu@rendec.net>, Thomas Gleixner <tglx@kernel.org>,
	"Shenhar, Talel" <talel@amazon.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 6/8] irqchip/al-fic: support error and fatal outputs
 and FIC v2
Thread-Topic: [PATCH v2 6/8] irqchip/al-fic: support error and fatal outputs
 and FIC v2
Thread-Index: AQHdVv3o2f3SoEE7AkiodYG7UHIZlA==
Date: Thu, 8 Oct 2026 08:20:42 +0000
Message-ID: <BY3PR18MB47220972A911132F9FCC01D0C6932@BY3PR18MB4722.namprd18.prod.outlook.com>
References: <20260927080637.27285-1-farbere@amazon.com>
		 <20260927080637.27285-7-farbere@amazon.com>
	 <a74366542ddd5e0e3fca71c5dee5d535cc9c560e.camel@rendec.net>
	 <BY3PR18MB47223DDF986081E1A74E4A40C6962@BY3PR18MB4722.namprd18.prod.outlook.com>
 <43538d360e9344e13359dab406dd7484b1a67967.camel@rendec.net>
In-Reply-To: <43538d360e9344e13359dab406dd7484b1a67967.camel@rendec.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4722:EE_|DS0PR18MB988691:EE_
x-ms-office365-filtering-correlation-id: e4557abe-bbdb-48cb-58ed-08df25150b41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|10067099003|56012099006|4143699003|11063799006|5023799004|6133799003|22082099003|18002099003;
x-microsoft-antispam-message-info: NA7WWsobY0fdgdTUkdE0/waem8FmUbb+fb4sHRFnFp4kAeE/PM5K9x8gba4U5ckn5px4xa7NXrMKJe9OssdFOX755mYHOhkiQEimA5PZ9uGv6xVvYJkb4kjWLXpcNjsJOB6ilnXVC+pc8xA7VBhhRqaccBpDtH/T4Y8JfaR8y8mlHsR9ocNh17cWZCqMzlty4ZiNhYzaDxmcJmYOF+zajc99Q65V5i5F9X8DoDOvEaSBvOA/ZJBE0kF5bsEPs8/NUeeXN5wZCz6le5cwsAxhPdFOexgqWgVA3ZtTt/lfeHlq1HScZfn8YhQdISE1kQjJobptW6Kutt1/U5AIUQAROlZiAgbPlFT3gbt9/YAjAbX8JnhYM4dPltw01SJXq694r6Ze8pmwWulWq5eu+DeLzYtSI9gL7LfKm5zuCH9x6KRUhUeiY/pHxTFn36Z+G+6WWERRx0/aZ7YULMMZzwCqFFSFnyX3mSCzVwHFhqGkbNYRbshw7oLwQot52ttZbmy3737XISgIye3fibV2r9f7tXrouEx7WIQRkQdnj6FHTOj0yf/ygQR+lVLf9bHyOo1g0wg2IwmFsWF3tZe7JYOOVTeLBfwtNKczk5wL32WQgQpP2FY4Lbe6PpHaqb8CUgAAl2as3rEX56EnU1ct7ZqpPu2S4UR2R8wR23Af1X0x5S9PRk/XUcRzkmh9srJ7xb6cMUXMIfZx5bHmkCmviT8png==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR18MB4722.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(10067099003)(56012099006)(4143699003)(11063799006)(5023799004)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SW5ySVljUU1MUFlCdVl6SURHSWF1Y3U3aURrK2JvNUpxM3hUTjFOMnNsRGtW?=
 =?utf-8?B?b3cwUWp2dEt2Q3c5cnFtRFhiWVFJazlvbkZqSlRHY2NuMDN5R3k4YXUvekxN?=
 =?utf-8?B?N2NXeXZ4SC9sOGl5TWdlS1RlZHV4alVRWExhK25oNHpPYWpEaTZrcEpNNVpx?=
 =?utf-8?B?VlBnY1V6bEtzcmx1eVZFOWRORnlhYTZHbjBHVjdBRlJNSXdnSUNuTi9uK2dn?=
 =?utf-8?B?ZXNTSFJLdC9BK2xvbUI5Ym5sVTJQQUR1S05vRjIxcDhXZCtRdzBPT0NWUWlh?=
 =?utf-8?B?Q29aMTlFOGI3dTBVRFR2TkFYa2R3SVRnTTdSM09sNHZENUJZdURrVklVWmVn?=
 =?utf-8?B?TW4yWlJpeHpOZjd5ZWJuTWlyQ0lBRWNNdExscXJnam04ZWFYbUMyNUVTSGRZ?=
 =?utf-8?B?Y0NVS0ZROWwwT2ZLTkp4amJIRkNGRWZ0T0ErSDRsQXptSE1Ec3RWZUNWdmNX?=
 =?utf-8?B?VC9VR2U0OTYyS29SY2FJc1pzYmorakxDSEVvWXp2REc0RGt4d29lMXlDR0Ev?=
 =?utf-8?B?S1B4UHJldlYyZDhPZWNFdjZoQ3ErWmZxNWw2emdnMU5TSkpqalpZTUZoU0R2?=
 =?utf-8?B?a0lrNDVqOGl4UU1Ba3Nnb0R1SmVKVDFZWXMrdjk0RnFTSmQ0QnNoZldVMmR2?=
 =?utf-8?B?N1B4OFhqNVlLSVUrRDRRLzFOM2V0Q1RhRkFISFhpajRKeUlac1M1VE8xTnhN?=
 =?utf-8?B?VHBCemlwMFpNSE96cEZrS2tOTUMxVTk1S3VCeU1xcFlCam1TT2gvd0U3aE8w?=
 =?utf-8?B?ZWtyQy9heUN3cElFYVBUbXFqbkhOYTZrNml1SGdkd2o1T04xUTJYTGphZGg3?=
 =?utf-8?B?Qjk5TE9uajFtQW5oRTZLQWtzTlUxVjExOXZuSjZEL1l0OTZSYWVkTXpSc3JB?=
 =?utf-8?B?WGk5Q2pUaitMakdpQmQ3bkYxOSs1N3JEdTRzVXFJUkt1NG8rZ01Pb0sycVkw?=
 =?utf-8?B?M2ZoTFlzY2R5eFZaU2dhVThYNE9BNmpsbndSTGRxd2lMVTFkRjZleXFZRFZz?=
 =?utf-8?B?TmpZK3JBNnV1UTlnV3g3TDJ6K3BrektvQitSTXBNNEpJMFVhaXNQOGhGK0dq?=
 =?utf-8?B?amh2SS9Bb0luMmU0M1lZZWZMbzJtQjAyNkVGR3FDbHZVcFRrT2hvZFROYVRI?=
 =?utf-8?B?WC8xaEJRelZJU0UxMnRFSHVWMmU0UWYzSXpzY1dZWStnZ1pPOWJPckxRUXNp?=
 =?utf-8?B?dVF1a0I0QlppMS9qVURSYlNCTDVUaDU4cDhCbW1YaXNPMXdjTmpRWllQTWEz?=
 =?utf-8?B?akE3eDc4QXBVQUZpanB5dXNzUDU0WjU4bHozWE81MDF2TGluc1dBQmJUTEV1?=
 =?utf-8?B?a0dPTHN0OFA5TkE4KzVwTWNkUmEybTBta1NLNzBYMGdxTnp2Wmt1OU9oTlFa?=
 =?utf-8?B?b1dRbmlIaHZOUGQxWVVManNNZlQ2QTBPa09aUFJTYm5vLzM5TlplcTFZMCtl?=
 =?utf-8?B?QUo2dmFIRDZwdUVUY09YM3ZKVC9XaDVLcktEZzlscVdqRGpuL2FiTXhXT1F0?=
 =?utf-8?B?YkVkUW1lVXBsM3hJNnRQV2FHZXpQcElobWMrSzlIKy9OVjBHTzNuRkFHQmRE?=
 =?utf-8?B?cnVwV2haODhYZnNXQ3BtRDRHU1o0eUxodHE5R1Z3dGVFdkV0TmI3dU05Y1lw?=
 =?utf-8?B?NmVEaEVPNkg5L2Z1RUthcWxSWG9wWFpYRG92MkV1QVF5ZFRnNzBmWUs1Yk5Y?=
 =?utf-8?B?QUtKYUNOK1pFSmtKSHN0OEpYS25ra3F0aHFMTWJSR3pwRGlJeG16KysvcUx0?=
 =?utf-8?B?UFV5VFpyZk9BRHBaOWxrUEpJWGlyeVNCUnRGampYMVI1amFuK2lYTVArUkJ4?=
 =?utf-8?B?bHA4MXJNOFFjT0V6NkpQcU5NVWwrUEJFMFlWK3ZxUEVwSGNrR2NialowbTl3?=
 =?utf-8?B?N0kzdGRyKzROeFhDa3F6RWtjSVcyeDkrN01XOEM3S2h6RW9LK3MyUjNVL1U2?=
 =?utf-8?B?Yk4rOE5zZ0hmdHVaWWF3K2ZldkhqUTVFTmx1WUtVVGF1a1llV3RvSUt2ZW5p?=
 =?utf-8?B?Q3k3dUliY3VPKzNJTWtWQ2FhMkc0dDdVZjZLUTNUOUFzUTdtUWhLM1luQjMz?=
 =?utf-8?B?ODcyaWxMTURha3NlNjIrT0I0djJtTmVVdDM0aVdBV01QZnM2aGRubFd1MVJ1?=
 =?utf-8?B?RTA4aXVXWG9EK25iL1FHK2NtOGFOMllFeGhPaUVUUmkvQnhlWDZaQzY2NUd0?=
 =?utf-8?B?MmpKSnNlbkYwbjVuc2ZSV3ZuVDR3R2pMTE1ZMjFZWjAvZUFlcDFDYndkQVND?=
 =?utf-8?B?cEd1V1pjZWp2MGFUOFN6NzZYK3hqTmlTcVNyVXo5WEZVOFBKY1lkTmNYZEVt?=
 =?utf-8?Q?aWn99WtsLQmDzc4zJ0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 3r932p+Z/i+yVAEfz21dRG6nDQzJ2Mb8lJSlskgtgcqhCxno7ragBnQTZvOmQLkfqC1mj6H8vdLRzBXI1bZJPNSGHRwliAjYHCZ7MHW6utWs7Yupz4lFPxZbF/m83SlvKN+iSuto84cz7iUuWZNT1ZuiNopB/aSuiPLCTsfWfrSiEfrz62FTVB5WMnWP5b9eesllywwWBJUE/P/BDmGTQLXCCTItr+OQiTis1a6pBRQjunDPIb7GzUlD5fSMS5JQ/gnF9OPPLMiEr9xjJTN4Rx31MSMvXK1sd5JvuwSx0VorjJp7VEI7cck/2VMtZJq+IHRmCo+GsRhtCclgAl5Mkg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4722.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4557abe-bbdb-48cb-58ed-08df25150b41
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 08:20:42.3021
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2uMQGCjZ5H2uNjhM7vCr2d3fY9E1m92qv6o9y+WrTA95NcwCOucDR6qhgeKdKFHvxzJDv3QTEtKCuidv8am7Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR18MB988691
X-OriginatorOrg: amazon.com

T24gVGh1LCAyMDI2LTEwLTA4IGF0IDAxOjE5ICswMDAwLCBSYWR1IFJlbmRlYyB3cm90ZToNCj4g
SSBzZWUsIHNvIHlvdSdyZSByZWx5aW5nIG9uIGFsbCBiaXRzIGJlaW5nIDAgb3V0IG9mIGhhcmR3
YXJlIHJlc2V0DQo+IChleGNlcHQgZm9yIHRoZSByZXZpc2lvbiBiaXRzKS4gVGhlIGRyaXZlciBj
YW4gb25seSBiZSBjb21waWxlZCBhcw0KPiBidWlsdC1pbiwgc28gaXQgd2lsbCBuZXZlciBiZSBs
b2FkZWQgbXVsdGlwbGUgdGltZXMgZHVyaW5nIHRoZSBsaWZldGltZQ0KPiBvZiB0aGUga2VybmVs
LCB3aGljaCBtZWFucyB0aGUgaGFyZHdhcmUgd2lsbCBhbHdheXMgYmUgaW4gdGhlDQo+IGFmdGVy
LXJlc2V0IHN0YXRlIHdoZW4gdGhlIGRyaXZlciBpbml0aWFsaXplcy4gSSBrbm93IG5vdGhpbmcg
YWJvdXQgDQo+IHRoaXMgcGFydGljdWxhciBoYXJkd2FyZSwgc28gdGhlIHF1ZXN0aW9uIG1heSBi
ZSBzaWxseSAtIGlzIHRoZQ0KPiBoYXJkd2FyZSBndWFyYW50ZWVkIHRvIGFsc28gcmVzZXQgaW4g
dGhlIGNhc2Ugb2YgYSAic29mdCIgcmVib290DQo+IChlLmcuIHJ1bm5pbmcgdGhlICJyZWJvb3Qi
IGNvbW1hbmQpPw0KDQpOb3QgYSBzaWxseSBxdWVzdGlvbiwgYnV0IHRoZSBkcml2ZXIgZG9lcyBu
b3QgZGVwZW5kIG9uIGl0LiBJdCBwcm9ncmFtcw0Kb25seSB0d28gYml0cyBvZiB0aGlzIHJlZ2lz
dGVyOiBtYXNrX21zaV94LCB3aGljaCBhbF9maWNfd2lyZV9pbml0KCkgc2V0cw0Kd2hlbiBpdCBp
bml0aWFsaXNlcyBhIGdyb3VwLCBhbmQgc2V0X29uX3Bvc2VkZ2UsIHdoaWNoIGFsX2ZpY19zZXRf
dHJpZ2dlcigpDQpzZXRzIG9yIGNsZWFycyBmcm9tIGlycV9zZXRfdHlwZSgpIHdoZW4gdGhlIGZp
cnN0IGNoaWxkIHNlbGVjdHMgdGhlIHRyaWdnZXINCnR5cGUuIEJvdGggYXJlIHdyaXR0ZW4gdW5j
b25kaXRpb25hbGx5IHdoZW5ldmVyIHRoZSBkcml2ZXIgY29uZmlndXJlcyBhDQpncm91cCwgc28g
dGhlaXIgdmFsdWUgZG9lcyBub3QgZGVwZW5kIG9uIHdoYXQgd2FzIGluIHRoZSByZWdpc3Rlcg0K
YmVmb3JlaGFuZCAtIGFmdGVyIGEgc29mdCByZWJvb3QgYXMgbXVjaCBhcyBhZnRlciBhIGNvbGQg
b25lLg0KDQo+IEkgYWdyZWUgdGhhdCByZWFkLW1vZGlmeS13cml0ZSBpcyBnZW5lcmFsbHkgZ29v
ZCBwcmFjdGljZS4gSG93ZXZlciwgYXMNCj4gcGFydCBvZiB0aGVpciBpbml0aWFsaXphdGlvbiwg
ZHJpdmVycyBzaG91bGQgbWFrZSBzdXJlIHRoYXQgdGhlDQo+IGhhcmR3YXJlIGlzIGluIGEga25v
d24gc3RhdGUgLSBlaXRoZXIgYnkgcmVzZXR0aW5nIGl0IG9yIGJ5IHNldHRpbmcNCj4gcmVnaXN0
ZXJzIHRvIGZpeGVkIHZhbHVlcy4gSW4gdGhpcyBjYXNlLCB5b3UncmUgYXNzdW1pbmcgaXQncyBh
bHJlYWR5DQo+IGluIGEgc3BlY2lmaWMgc3RhdGUgLSB3aGljaCBpcyBmaW5lIGlmIHRoYXQncyBn
dWFyYW50ZWVkIHRvIGFsd2F5cyBiZQ0KPiB0aGUgaGFyZHdhcmUgcmVzZXQgc3RhdGUuIEluIG90
aGVyIHdvcmRzLCBJIGp1c3Qgd2FudCB0byBtYWtlIHN1cmUNCj4geW91J3JlIG5vdCBtaXNzaW5n
IGEgY2FzZSB3aGVuIHRoZSBoYXJkd2FyZSBjYW4gYmUgaW4gYSBkaWZmZXJlbnQgc3RhdGUNCj4g
dGhhbiBhZnRlci1yZXNldCB3aGVuIHRoZSBkcml2ZXIgaW5pdGlhbGl6ZXMuDQoNCkFncmVlZCwg
YW5kIHRoYXQgaXMgd2hhdCBoYXBwZW5zIGZvciB0aGUgdHdvIGJpdHMgYWJvdmUgLSB0aGUgZHJp
dmVyIHNldHMNCnRoZW0gdG8gZml4ZWQgdmFsdWVzIG9uIGV2ZXJ5IHByb2JlLCByYXRoZXIgdGhh
biBhc3N1bWluZyB3aGF0IGl0IGZpbmRzLg0KVGhlIHJlbWFpbmluZyBiaXRzIGFyZSBub3Qgb25l
cyB0aGUgZHJpdmVyIHVzZXMsIHNvIGxlYXZpbmcgdGhlbSBhcyBpdA0KZm91bmQgdGhlbSBkb2Vz
IG5vdCBjaGFuZ2UgaG93IGl0IGJlaGF2ZXMuDQoNClRoYW5rcywNCkVsaWF2DQo=
