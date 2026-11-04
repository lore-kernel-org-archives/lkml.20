Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793829399;
	b=4yBQFuQFtcon0d8wsMPDXfg3ejllDZ6Z1ANShMbKa/An0+6HRU+kzFy+Icq4DynTpr0Q
	 bYm2CQtjODFeJa/VA9nMVbnMlaNXyRAheIhu6mUPl/vzuig0hIdxcSILnq85Qre5qpMwN
	 HKi8QTok1yakFPjLJr8YS8TUADDBDWjfdfUcXZHqug4oOdj8qKlUP9WWVKa6BaTZY/6ZO
	 zVqFs/lPtaICkz/dw7Q8J78Hr3dv4LUrqoXsmPOyzm32FAyn0H+k7bPnNMplPmw7wgtpY
	 Bwge0Dx22e+d69DUw6TfsvLmqndcwPZ8uBs+h+jN19J3fSV9u27yd72ZklRMrVOK1Ag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829399;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:From:Subject:To:
	 CC:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=JehseBUxXnVCY3CQYULzkhpPh1rXuwz3budE61dgg40=;
	b=0JBwWZAINWrXCTEGItAmLPVSpD5hjRrcoxGJgnqWuFGpgjCf56wiBoWn1Bd+dGu1v3MZ
	 vnkedhdjE7o9PPVp8PR5rfY6PFqeOT4ZlQIPLhOySEmulcwNpHhFXddwqojSdQi6P6FbA
	 6R8k/2O087fMPOrZ2RWReFnL2cErE9sd+NoYPKuHdIRju/PmHHNDQ9HUwaipgAucxopGy
	 ARaHq3jmMvywRpFIWr4w0fI7sQlVfOxRfT8R7W5IGU6ascjVMKA71wr4rCBWsp/Mm3Iix
	 0wynSn2t9Xk+JpN1qyUKSD6IF2X/wt/ZxUn8317WADb7svC5jGXK1a2LOzEylt1mFyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OyK00sQd;
	arc=fail smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F0F606A865
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90F0F606A865
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OyK00sQd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793829398; x=1825365398;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gcCF9T0CRNz3O8Y0+1EQqsexuHXvdqFIdvlEGytrfro=;
  b=OyK00sQdER1/RBmEhFE4/oxulRFkk2DT37ZZ3sUyStUcHe0PPPJftts9
   eRztlwyR/7PMQNs2rqJdnMB3bqoCy3durlkcF01NEcMBIKrQZRJj4/mCx
   hLxum1n4KlI8b6vxUYNtI1F9pxQd+eMp5AYf2Fi3QuCaXFJyjz9YNGGUA
   GKsiAoxE7sVPQPuE0aH25+hOb4IvR8Sjpt/emVgKGKQSY1SieSYpFrZks
   9OoPMA4LXBZhFL9JZEt4Pk8OmiZclzlkaIPHsqPGeWnnMMnw8UMg8FSrb
   f+m1/ibGCUBU5riyRuerm6NEoTnEoewPOsSrzY+M65EX7b3CSsqMkWhew
   Q==;
X-CSE-ConnectionGUID: LN590CesTYufzQzJEJ08jg==
X-CSE-MsgGUID: agcLSAVDTeWkdtq91DOupQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2501559"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2501559"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 13:56:37 -0800
X-CSE-ConnectionGUID: dqaQT1t/Q+qU0fxzJFushA==
X-CSE-MsgGUID: /N0hO1/eQtKSGZYAWOKyFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6737762"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 13:56:37 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 13:56:36 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 13:56:36 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.39) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 13:56:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UNqnG5MnBakJlSSQhFOLlrb3dwtKrSEePnbBAS6VzDCd6Lm3O9NQw/9PCghYJEZ4e++4OujC7aI0GnOv1tQr7AocLkZtHVucvCZVC6nvRbuqXWcpA3h20XGQW8Zc9ZJ2Lpob1TXJta3qFASy9vOa8oyLqLInmyJ8Af5NyqQwA0aMa/CDssrQjiIO2Qvn4AcnMfuwoFrZNmWQX2asQm5DC3r9yVCivqiCKbuc4iIqhwXBwjoQRK5hRZNKSYssh9NaQRtblCVpqYE/oYyPNnw/Im712y95msYDMcxOdi3/MS0UhjRNKJpK34+bDUb9nR8ZkrB6ygD0T82fC9XCWXT8Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JehseBUxXnVCY3CQYULzkhpPh1rXuwz3budE61dgg40=;
 b=iWjzXazFEHPKV6TRVbfvNKvkRdU0wqHJymjV0Jtp7sSyxuHuPW0LKnFznFI8+IYqcrHbqFjOdDCMmFhBvLAIYl3vdpEJGHDHnuzixb+XFRpiqn0vo4mrX7HBwmOuVKYgb47HJSwwobZJT/S1xqRPe6yJ+uXUk5IbLaFj+ydKOs7XZxoW8hf26GSrIK7EqZFLjyi3vq7MgY2Y3t8KvKPzMT5pqKx9jCfRsXdIXCYsAkW7SCmiEIRXa9Gu46h0reMm2NRGI/KDkfVsOcMh2YCeFgLz4VevhiiyCgUMeN6Z4GQ0Zk+JZtDi7Fkf6W7V4NASFPP8Sc8ppmlyaD/gA39Xmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 SN4PR11MB9965.namprd11.prod.outlook.com (2603:10b6:806:4fe::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 21:56:35 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84%7]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 21:56:34 +0000
Message-ID: <1994d38c-6944-451c-8416-7be4859e2ecb@intel.com>
Date: Wed, 4 Nov 2026 13:56:31 -0800
User-Agent: Mozilla Thunderbird
From: "Chang S. Bae" <chang.seok.bae@intel.com>
Subject: Re: [PATCH v4 8/9] x86/nmi: Simplify offline microcode handler
 invocation
To: <linux-kernel@vger.kernel.org>
CC: <x86@kernel.org>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <peterz@infradead.org>, <david.kaplan@amd.com>
References: <20261104182322.578066-1-chang.seok.bae@intel.com>
 <20261104182322.578066-9-chang.seok.bae@intel.com>
Content-Language: en-US
In-Reply-To: <20261104182322.578066-9-chang.seok.bae@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::12) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|SN4PR11MB9965:EE_
X-MS-Office365-Filtering-Correlation-Id: 5063cce4-883e-4dcb-b364-08df3abe7ddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|22082099003|18002099003|4143699003|56012099006|261009223027099003|11063799006;
X-Microsoft-Antispam-Message-Info: UR8stGe7yZreXHMJ/t+ptw+cC0l/sPXWdfpcr0hmgQBXv8EwFNlogYor55BmZt1RTmftgKVbSQxz1hICimtGn2SgqoN19RHxA+8FIJ4V6HFPQCde/y68Ce+QtK9g5MUG1VI97E+UbfAVfhi03C74z8UspZTfTcP0eEFr0Y1GmhSwxej7iM1RfAM7D4Le9d78tF7aFoUgQYS+Th1EfE0Vc9WDpBVNbTo33ehTi8Gzezz1Z6ZRyNBx/xkOXr9xG8IZP2fVN1dA5qTLstaGWkZlVxhmtZdIzg1ZqT22Vbou5glFg4W0X84qwaByoHcrUcoI0qEaBdxVXO/4BNPd3ondDS5U07EJ8QI6nXYOoOp+CP49KdTZ8tYayccfw2RUgc6sgztojdiv2GlkFHfBljOjMOm4cWBssnMWhl6SjKGdsr99MX9+fDH+LjKzpMuOG/tdSyRHuF/jyeVoTB6eqliq1CAdzEJWDa290L8luAqX/HmeV6BLVAXEo4CcoUdBPpOxXEsgt7XNyWJALaAXqWjw3rpgra5MliixEmRge1FIUrVHncSEfyzWXakwyH4HM5a3e0GOX6/XCcunVrhbcGi70mAa/xaba5bEivVZYa6YUlY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(22082099003)(18002099003)(4143699003)(56012099006)(261009223027099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3NRRWxOeGlWQit3S0wySXphaG56d3IvRklIQ2NMRGV2cnd6MVNXV0Rmb0dk?=
 =?utf-8?B?dzNOak4rQzY3WUcrS093YnorVEhuc0hpdnNsQnBtNXdUeXZqUmlYRnd2cXdz?=
 =?utf-8?B?QnFZWVhTNzkxVkFEWDRoZGZTMCtvYXJSS0t0enZPU2M2bXFGazBWamY5aGxu?=
 =?utf-8?B?MjlKd28xeVA0bjE0cVFNYm5odTVrN2xNL0w1Q0Uvdkt4dmRpbmdPVXV2RFFv?=
 =?utf-8?B?Q3ZnSUVBQmxQTkZqa0hMdG8yQnJTbUpOb0FEQkFDZUtDdmRnVU1TY1U3SSt6?=
 =?utf-8?B?UGIvbmt6c09TaC8zbE5mT01zdk1PUWJTMUhCQzlodXYxTWk4WXhLOGp5WlZS?=
 =?utf-8?B?dmlnQWZBQ1F5ZzV6YjhsTUJ1dmp6bnNBc3IwcTV2aVVrdFpnTnlxK2kzREJv?=
 =?utf-8?B?K2krWUp5a3pOLzYvcjdXM01uYU5XZXpsWi85YmxxQ1lzWWIrZ1NITW94Yyt4?=
 =?utf-8?B?UVVMZjRTaFBxREVQWGxoSWhybHVFQ3dhUTZjWUw2b0Q5WVpoaERCT3pXb0Mx?=
 =?utf-8?B?UzQ3d0RoYi8yejkrTEhGaTFiNzlGeVliUGpIbTNQcnZxRVhFQUhGMklmM1du?=
 =?utf-8?B?SVRNUTVuZU92NHNsSGhQSnpFWVlXWHFPYXNCT1cybXJtQ0RVbWdUalhadjZO?=
 =?utf-8?B?NU81N2pVNW1kamFIclhwc2dpaDg1THJ0UmJCRWNybGFZTng2dEpJVFVFcGZU?=
 =?utf-8?B?ZWdWRkx1Y3BONGNBQVEvWXdDK0s0QkQ5R25FYkxneWZQa0MxVzZyS1QzVWF3?=
 =?utf-8?B?bjlJNDVZcXdRckROempsdnNEUkZ1UlBRcDJvTXM3RHBlMnZ1V2VQczdaWDdN?=
 =?utf-8?B?TGhSUXNQVkJkRWwwWWdLVkNYRys1MkdiZytzVDRibStoVFlFYUNOMCtTYStH?=
 =?utf-8?B?TTZUZG85SEhScEJmK2g1TjFqM25yTVZRM21HSjlwZGdwaExXZE90TDdXaHhJ?=
 =?utf-8?B?UTJxSDc1c3lJTFJaQ25xTlNKRFlMNUpDOE1rSWNqQi8wcVV0eHZaWnMvL2ww?=
 =?utf-8?B?dXZVWThhdUpTeGNJdlU0MDIrTEpWRnYxdnM0cUwya2Q4RHFMc0hUK0JoR0hY?=
 =?utf-8?B?U2dYbVZBdXdXbyt5UE9QL2EvNXhkdkxtZDd3cHAvRVZWY0R5RjZXRGRUWE4x?=
 =?utf-8?B?WU9waHdPYlZGa3pVYTNTc3FJRjJMVGZSKzZ4YXB0ejU1am1Gb09EcEtRRk4v?=
 =?utf-8?B?QWZMcTFnMUJrZDlNS1YzSGtIOWZqSEVKbUk0ZkpNTUk1TGNpS0tyRnZiNE9N?=
 =?utf-8?B?RFpkR3cxVHFsanl1dVZwOUFiTHcxYU9jNTQvNDRqQjgwcVJ5OEVFclM5b2RW?=
 =?utf-8?B?K2I0N2FjNEE5YmNFcUhRT3hkQ2R1Zm1UZEJXT0RnVll2TUV3YmZ3eUV2OVJL?=
 =?utf-8?B?UkZnY1k2NG5Sc0ZCdEVSSUI5UmlwbDNqRHVzT1VCT1AvM2M4dC9oYU54UU9C?=
 =?utf-8?B?RGhYYWwzNlF5R2RJWHgzZzdPbnVySzdVRWp3eEdtMXhMeHZ1dTNDQ0RPQ2Nr?=
 =?utf-8?B?bzNZa1p2bUNSVHZneGp1RGZhWllZRnRaRWI3RzErMWZTdE5YYmZDTWJMWXdw?=
 =?utf-8?B?cVhrWTlUSkNMcjhZYnhmZEE5a0o4SEJnbi9MajU3NlpBbGFOdm10NTZYVitV?=
 =?utf-8?B?dVJ0c1czaUpVbnZWbDV0WU9MZDRzOWJnMkp0elNKRTkvT1N2cmdBUTNIWkMv?=
 =?utf-8?B?VVM2YnduOWh2YzFtb3hmNGJjVnRDaEpseGxOOGl6M29BTDh3RklGOCtsZkJa?=
 =?utf-8?B?ZVBRVW8zU3lkMlBkb2szZU9BYmNQeGg2ZzY1OEVNa3oySTNLRjRxd2RwNXA5?=
 =?utf-8?B?NmFiUXZiQldSbGZoMUFTV1pVWm9VaDdkRlljUU5lU2owY0JZenRicTh4Y1ZT?=
 =?utf-8?B?ZXNPS0ZMVkNGMm1rOVRtVVFqQVZZVms1R1VSOWxFMWZqTnpzQ2JGUFRGYnYw?=
 =?utf-8?B?NEo4WWtsUkRIVUZzWFRvUDIvNXZEaXp3SFNvWjMyd1ZJeko5WU1RWndMY25p?=
 =?utf-8?B?b0ZpZkhiN3kvK3g2NStrTEl3b2xValIybUdkU0lFRHhJVkYyU1d6UThlMkZp?=
 =?utf-8?B?Uml1YVFwRnQxM1J4WG93WjFnSFIxa2NFcjdBZXFkR3piTTNWV0F5UDFCWXBm?=
 =?utf-8?B?MHpWWkhsYXM3c2JWK29WWDBTUGM5NkFFVi95bzJGa3ovRzVGeVhDN3hWNytP?=
 =?utf-8?B?RU1ieXZkdjhmV2YrNVNNWUFQTVNSa1BUc3hKU1MrZUpmck9YMVgrT0tBSjRi?=
 =?utf-8?B?QmJNaGlKQWE1UHVuQlhVWFkrck42d2ZUcjViR2xTWmVCSnhidDVKb3BCRTRD?=
 =?utf-8?B?cm95MDlWOHN3VHFjeGd1SHZFSGdCSHpJaFdEUWpWMzJZUUI3NUlyZz09?=
X-Exchange-RoutingPolicyChecked: pp8+pXwAtla2Nf5InivX32z2YeBZkfdiAs/uFU0patTN91w/4cTi6rKZrh7Dy9JuDC6CdDzapUVCCdcGCzJpgRhP2Bhpr1wKp+4XZPJyM5+p6N9Ubsc2RjUWfWjuvkz7PWgWAAbyIFJnOJXXyUY4uIhf4tTFC2aDVeYjV8wPtyuj+VyKAQ0dMTamUKZK3464JrXlB8UOr26C0JYaUZwxSZN51t1EONoFHhCtaZZeEN87+cYMNJPYuhHNpHyd2DKNH6eXCMlVlT0hF1hhL+cHV9uqyw4CTq4bIHMWMtvTBNR3ZoveTUZicV+i3k9omH7+VJC3IdUXfvoaJr9MkhAGxw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5063cce4-883e-4dcb-b364-08df3abe7ddc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 21:56:34.4268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TP4hGZNo5B2Tfidu6D3Qv8QpxruC9odn4FzwS4ZlKPUYs5pmsXUudho5rBKfHNKXkEkl/qIY4ogfOBIbvwGM2fxWqwozvu4Q8hKxIvYg/Mo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR11MB9965
X-OriginatorOrg: intel.com

On 11/4/2026 10:23 AM, Chang S. Bae wrote:
> 
> diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
> index e3660b8b8f38..11c965445bdc 100644
> --- a/arch/x86/kernel/nmi.c
> +++ b/arch/x86/kernel/nmi.c
> @@ -553,7 +553,7 @@ DEFINE_IDTENTRY_RAW(exc_nmi)
>   		raw_atomic_long_inc(&nsp->idt_calls);
>   
>   	if (arch_cpu_is_offline(smp_processor_id())) {
> -		if (microcode_nmi_handler_enabled())
> +		if (IS_ENABLED(CONFIG_MICROCODE_LATE_LOADING))
>   			microcode_offline_nmi_handler();
>   		return;
>   	}
> @@ -715,7 +715,7 @@ DEFINE_FREDENTRY_NMI(exc_nmi)
>   	irqentry_state_t irq_state;
>   
>   	if (arch_cpu_is_offline(smp_processor_id())) {
> -		if (microcode_nmi_handler_enabled())
> +		if (IS_ENABLED(CONFIG_MICROCODE_LATE_LOADING))
>   			microcode_offline_nmi_handler();
>   		return;
>   	}

There is a Sashiko comment on this:
https://sashiko.dev/#/patchset/20261104182322.578066-1-chang.seok.bae%40intel.com

I thought waking up soft-offlined SMT siblings with an NMI was benign. 
Right now the path is not explicitly gated by the use_nmi flag even 
though the underlying mechanism is NMI-based.

So perhaps it's better to have this reassurance ahead:

diff --git a/arch/x86/kernel/cpu/microcode/core.c 
b/arch/x86/kernel/cpu/microcode/core.c
index 330c62f6dd32..cf3c02622dc1 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -502,8 +502,11 @@ static void load_primary(unsigned int cpu)
         unsigned int nr_offl = cpumask_weight(&cpu_offline_mask);
         bool proceed = true;

-       /* Kick soft-offlined SMT siblings if required */
-       if (!cpu && nr_offl)
+       /*
+        * Kick soft-offlined SMT siblings if required.
+        * Note the mechanism is NMI base.
+        */
+       if (microcode_ops->use_nmi && !cpu && nr_offl)
                 proceed = kick_offline_cpus(nr_offl);

         /* If the soft-offlined CPUs did not respond, abort */
@@ -511,7 +514,7 @@ static void load_primary(unsigned int cpu)
                 __load_primary(cpu);

         /* Unconditionally release soft-offlined SMT siblings if 
required */
-       if (!cpu && nr_offl)
+       if (microcode_ops->use_nmi && !cpu && nr_offl)
                 release_offline_cpus();
  }

Thanks,
Chang
