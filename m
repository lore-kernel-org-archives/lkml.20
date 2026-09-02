Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877C3249EB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788330101; cv=fail; b=iB1MXjXkEyMNdHdRe73KKJREagNBh+NrW1A4gys5usopSzG/HHno5AKNdM+e134l7/OJypBXXTU3Yqso2Ss7+jOxWCDHhjRweNDg1a9qWMvucvUfbC+Z0xvtb9mlTncfUQY+D8wI3/Y4oeDN28z++OrP2Mhmp2jGZqZSv7bJ6GU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788330101; c=relaxed/simple;
	bh=1Aayi4gfPWC1LRokvnxjOdNXMqMOaxLXGhSIf1I2bu0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XiNYgUJS8Wg4BMjAGoDNZ1oL4JLksA5uiWuYRT1WWWHHBAA2ddRjX8YNe1u0SU7PmIVt1zKaMZt1OKlDpMcGx4rtvGQ1qZIuQX4lxeiiGD77NhMCG/mAnyYPk50X/KaevyfBx2h5njbFjfkuwm69D232X9QUoR/Y1YyVYgErLBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GF3I/6sI; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GF3I/6sI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788330099; x=1819866099;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1Aayi4gfPWC1LRokvnxjOdNXMqMOaxLXGhSIf1I2bu0=;
  b=GF3I/6sI0tqTA82rTzMFpmN+gP4TAFmDw/qVPrOlY3j02QNkq7XamyRz
   TWHCuy3vGIBGCaLQkXxwq4NGtIV71eP6cSgF2yUbWgN4/Vy+9krujAb5o
   /O4NpCcAP603FwdPEyAdX14wUZJQ3yotqhyQSQKw9P/6g8OxzrPfzDDV/
   2IXumkaRmNTYe1c9wotnRv2ySHhhRX8FtMJuFX9Vzmf2beatJx++1kSEs
   d69xqSt4C46dIWFqh0TQ5jo2/RBW3Egl+EDqNx276r0yE9ME6Ce/c4h6G
   Rvlp4nETo2tKzaRAvVXjLzCrUwlgF+WPOprR1Zj8c3Pch16y1u3doD/pP
   g==;
X-CSE-ConnectionGUID: fusgJFlnTfaeYSHnp2JyjQ==
X-CSE-MsgGUID: uTBQDz0nSW232ndTefJp7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="92597311"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="92597311"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 23:21:38 -0700
X-CSE-ConnectionGUID: zAdgnkCbTDSWDtPicnBoZw==
X-CSE-MsgGUID: Z+ob6WLMQn2shw8BT0pZNw==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 23:21:38 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 23:21:38 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 23:21:38 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.35) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 23:21:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcbNFtWVhaatSUYoZlqKjvY0VlB8uiZS4XSsfMASfL+JVgE7YDnzIrXX1lybe+gAdUgJw+Z0ZT8++9VhGmB06RhOzIJyoEHccKQacCy4XBsjQWdZ3vgt/v3Fg4SKZVGAMWmOzfFZLy+f7uk+545AItRtt5uFDu+sxpB8kFRHX42Nw7C1Kda5R6odRjFfP8KNgKXf26OHB7ek0JSePMna+17kDYVqwn0jK6aqolbmqiL8OFYZergFMbgv+luMSyUQuNQINVfGKCqdJu+EA4wnKGx83M1AUUPDsGiIpx4IS+YqsaluakCxPCcbI/uUxLIaBQolvgoI4KjsS7Mr1V5uTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Aayi4gfPWC1LRokvnxjOdNXMqMOaxLXGhSIf1I2bu0=;
 b=S2C3l+bRYQZbJBwtHBI1bOHTFuHg+6abqsfrfySHtZ5zRLPq8soe7djid7O/nY2scqX496+LlGfgbd+slg+sZSlbrUicW3uKysyM/6kozj6nPxBubHzHTFliIW//zWqF8xUbB6g6sLGseWHEVS4rT+csQeNDnt6Wjc9LuazLXa9b1wirFL8QgOIIVc9lpWszPvLq1vIG94yxfhs+lZujThkKC50fLuLZ+mQJ0rfts7rAJL4/yXJNvG1/I7kCylT9ELqGqh4VoAb7KkpO0HqX1EK23yh7EE3I5anDGjkaOXHm3j+ENEsdfwHzlqQu8Ujvt57UKgjBvae0XJaLM0FHTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH7PR11MB7449.namprd11.prod.outlook.com (2603:10b6:510:27a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 06:21:36 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201%6]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 06:21:36 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Wentao Guan <guanwentao@uniontech.com>
CC: "hansg@kernel.org" <hansg@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] mei: vsc: Initialize mutexes and event work before
 requesting the IRQ
Thread-Topic: [PATCH] mei: vsc: Initialize mutexes and event work before
 requesting the IRQ
Thread-Index: AQHdOpHCmFViDfEcwk6dqMpKiQEQNLa60V7A
Date: Wed, 2 Sep 2026 06:21:35 +0000
Message-ID: <CY5PR11MB6366A07F4771D827DF680913EDB72@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20260902041504.967524-1-guanwentao@uniontech.com>
In-Reply-To: <20260902041504.967524-1-guanwentao@uniontech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH7PR11MB7449:EE_
x-ms-office365-filtering-correlation-id: c45bc032-b286-42bb-2459-08df08ba70d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|23010399003|376014|22082099003|18002099003|56012099006|38070700021|6133799003|11063799006|10067099003;
x-microsoft-antispam-message-info: RbotF9u4a1X6drBL/mEq+6m8QaCJO22XlaO/iY3JPk/UQhkIDsH4dWni+WKFmFgzswjaLSejaY3dOy1shSzv9jJahBX2N1cuTZC2htoFatkmeB2+ffBlwT6nXGXWrJCmbSd2etyBxNOHnsSZhDsPKgPkYvZeyLtQGijfVBrtT1AlZyGiDaTcYduIfeL4m3ps+qhgJnXFCOAIHaPItekkmmkmLOt5NZOrJ8oBZsqEjW7/LBgvH5iFVQ0znIkGwY0+6/TCMEm2m5LS2x6oXaYosFeoS765eoXytipMOMP7h+De/x6oFqH/079rgJFZ1P/Bg2T8SQe9bibKSbQh+W5kiVrJfbYVt2Y8p4qaq7gmdhEEbnsxh6p6yInNod22BJLPL4dZQ143C4yeDqCv9OpJEEQZE+TPc8ntSKtluoP8nAqWVtX3hcBnoBjVLHOt6ZmAFACctzx3D0XoAl0pGKbXhbQQVJZQNWWv3sEDhoeIHfnbYGybnbx3KIILOu1nuJ/jIbNZz8syRXef1HWQpemE5t22rp3seDNozCk7ZXD9NQ0fA2yf5r6yIdGaj81hmBd4S0jtn0nVKmcElUFxjqSYsEtKk+F+0840oMLQDcafNL0LmuDI5pHYo144zipWY4T+P25wOpkPYCqCl5qOcQ4qrcp1Vmdn2L0qaxvp0CtCipRmUXb1QZYC0zha3saWG+ePymHhZ5CDxNOAANCs1i/Qzg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(38070700021)(6133799003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qk5qcWNGeWxHaWpBbTlndFNHVUJhQXhDOFJUeEEvSzg2ZVEwZkpLQUoweTVI?=
 =?utf-8?B?cURaenovMHBadEhWT0J6OUx4TGZ1Qk1mZWl3cEgzSmJPWENPdmdhMjQ1M0ZZ?=
 =?utf-8?B?VGpXOFFuZmo2NmRnQVRFMStQYlYvSFlMYkwxYm16azVMUTZQa0dmVjVQMHhL?=
 =?utf-8?B?Y25HTGNUd0NmZElxZVFSbGhQVXRsZC9LOVczbDhKT3FraFVOek0wMElmOWNn?=
 =?utf-8?B?b3A0WnlVeWpnZlE0MDU0VmxJWUZaMmZGM2V5VVFTdGJIQXpySGY2dVlHa3pi?=
 =?utf-8?B?enBUbm5udFFGZXhERTdWbjlQUXRNbEdwL3VDeU8xdWVoWE9yQVB5QU5FdU81?=
 =?utf-8?B?NDNaR3VxSmxWMDByUGY0Q3pWYm8xOElrY3pWdmJubFA0bEdSZjg1a0wzMkVS?=
 =?utf-8?B?VEpTYjJOSmJzS1EzMjZWektRblYxS2JmaHIzY0t6TG13Mi9xWDVoakJkQzF6?=
 =?utf-8?B?NlNURmEyVVZBc0d6Z1lwbnBhQnUzQUx0Q05DMEFsL2QxY2VERXFzQ0U1T25w?=
 =?utf-8?B?SlpGeCtZTUdMVW1LSzhoREUveFZYUW9MUXE2NE1MUXlrRHpySGxoa1NyMG1R?=
 =?utf-8?B?QkQzVnF1NUNxYXdSQTAxcXVrTGNxMHVMMkMxTlFNT0JaK1IvQVNoeU5nZDFj?=
 =?utf-8?B?aExnMFg4dFlwUExtRWlqQlFKRmdEZ2x0R3ZZaU9aMUR5T3VScDFYU3R1b29i?=
 =?utf-8?B?c1NtWXpvUDZqR3hvL1lBVGNnRm1oS3k0OWJNZGl1YTJtTTQ4ZkxSQlNjeGtH?=
 =?utf-8?B?MVlKNHBPQldxRkVQREhHaE1GZzRCOTFXWk1vUHJtVlAreHcyL29Za3ExVzYv?=
 =?utf-8?B?OWtyWHpNZmNjbTA2TytOeVR1d1cxbmYzbFlZcUM1YStVTlNsU2p3akQwK2FB?=
 =?utf-8?B?c3ZuOCtuT2lDUDhhaFM5TW5MRlFnY1U0eHJaSEQxTExESjFnUzloNGFVV3pV?=
 =?utf-8?B?L01LR0dHUUxsOGxVUXZrRkx1K3A2ZGhpNTdlekRUb1NqRkpkejY0bHFVOXlZ?=
 =?utf-8?B?cWpneDFZM3BMQ1hrUXAwa3MxRVJScVdWNWpJOEJMSmR4dGVSRisycVlwOXZu?=
 =?utf-8?B?a21GTHpMRzAyWkFXVXZ2S2lrR2pIOUh2bENBaG43SnBqeUk0ZitLaTZCTmNz?=
 =?utf-8?B?SjRCbVNPMGVQb3ZoUG92blIrUnNlSnR5UjBFamtoeWJUTHdKNXFPY1hLbkNZ?=
 =?utf-8?B?UWp6WVF6R2daNzRSb2J2SmxPbnUvL3ZmMTQ2VWppL2N5YjRoeHJadG9NYTFE?=
 =?utf-8?B?MU5ZVmNHekVoMlVMMjVhM3djdGpUcnFuV3NOWkVYeGhocmViek5SamtQT2xC?=
 =?utf-8?B?a3dYQUN2UFVHb0lHYTBXa1BRS3ZHcDR0N09WVHJWd3V3dTI4clpBbEJieGhq?=
 =?utf-8?B?bVBzQVM5QUEwVzJKeUhRZm03Q2x0ZERmUUk0Y0k1NnAzNThDN1dYa0xiU0Ru?=
 =?utf-8?B?QU4xVzdRV0lPMUhhaWU3K3R2SG4zcHhjRjZMOFJ3cDRHMm9WQ243eHRGaXp5?=
 =?utf-8?B?UlZPTFc4ZVQxVnc4TnEyU2ZReGdISXQ0UG9PVDEzVUNOK1hxY0RQZFdna1gw?=
 =?utf-8?B?OC9YNFg1enRHSUtvN3Z1a0VBSlBlazZ5V21kSU05RzVwL0t1a1M5cWEvbjhy?=
 =?utf-8?B?NFBwUkk5RklqS3RqZXJZTzJtVXQ2OU9rR0NuYmt2SERsV25ZQ0tneFZ0ajJt?=
 =?utf-8?B?SDhGWkpBMG5VREJzOEhaOXNQaTVDcE1ieWJ0MXhOc2R0ZEpZdTZCSUZNSTY3?=
 =?utf-8?B?UmV6cStYcnNuUEMrbTZOMTJNTGpFcWR4OVdVWXRWL2ZwSmFUNTdOTUxBZFRS?=
 =?utf-8?B?TU9JcUNoV0lsZlp3blY3bXNaN25iYmFPK29qM0tFdnZ5OUxGdWJLSHJPL2pm?=
 =?utf-8?B?b2hJTXhkNEVldGZVZG90WFZHWWR2bWRlZ2R3M0dkaHY2VzFBbW9lT3FrWEpy?=
 =?utf-8?B?MGJkbGdKNWlUQWs5Z3RtUFJjUFcwRWRmSzZ6eTJkODNCWmNxelB5cmg4U2lQ?=
 =?utf-8?B?SHh2b2dzSVVCcE5LbS93RnE4YkhwVENzR1NvNUFGb1BGWXNvdkZ2UDFsek5j?=
 =?utf-8?B?UEpCdndUMDl0LytGaUtDOWcwT0JaWmFnams1N1ZiYUc1cGk4MGFvbzl3TDFx?=
 =?utf-8?B?OVpWTlh3OExGbXhHZG9pVm5KN2RJVXZXek1CaGFheHdzTVNhMzJWbTJWYWlG?=
 =?utf-8?B?QlRtK0RpaVVRS2lkLzc5YUVzcStKRU5HSmp2d2Y1ay9ESm9GZE9DYVp4ZWpN?=
 =?utf-8?B?ai9RVU9jNFIyNTNrL09Pdlpod2RDU2oyU0RMQnA4b1VsengvOWF2ZytGSmEv?=
 =?utf-8?B?NG5ocFJYcnp2UnhUdmxpczlncmQ0YjdwOW1iL2ZYc2krTFJ2dnJyazloUHlV?=
 =?utf-8?Q?rQmgl23NPd89cEujyErHak4KsdOIY1Myynqx0EF73UXGr?=
x-ms-exchange-antispam-messagedata-1: zqSCdek5PeFTgw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: c1Wwm3n6nDhELG0mL02PBLIEcI7xt/li6JCfyzZiDn7BZhJ86d91KfcMSaZuaf3xpVf0qKMC2PxThukqfrAb9L7vohy9smvL6noOb7brI4o5YQP+2BwAn+Q0kUm/OMLLpaKS6wQca9TvGHXc01WkD7qN2vSAo9OeEc2N/xNQK/bvlB8EGhJtxa2P/BRjKKjxSXiEMfurVFmaz1wV3L14gDXGZsMy6qMoanWv8rjY4tRqtUIG7vWxVKGtCwU66I+onWIFmAqBb05hp3M8uEynXjAYJj6sTVsljZeB20M1v2b5qMPlMKdFEqfvEjT4RL7HzLbqrodKlGimd2xhLRULrQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c45bc032-b286-42bb-2459-08df08ba70d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 06:21:35.9086
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z/iLceOJNEZhkuNzmmlmrhn28IIALgBExbSCmSauNwkFID/uI8wAIK6T2TUQ+ru0WsUbsH4XO60fT4T7PzSy5r39b3dhVHLAP3suBT4Iny0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7449
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBbUEFUQ0hdIG1laTogdnNjOiBJbml0aWFsaXplIG11dGV4ZXMgYW5kIGV2ZW50
IHdvcmsgYmVmb3JlIHJlcXVlc3RpbmcNCj4gdGhlIElSUQ0KPiANCj4gdnNjX3RwX2lzcigpIHNj
aGVkdWxlcyB0cC0+ZXZlbnRfd29yaywgd2hvc2UgaGFuZGxlcg0KPiB2c2NfdHBfZXZlbnRfd29y
aygpIHVuY29uZGl0aW9uYWxseSBsb2NrcyB0cC0+ZXZlbnRfbm90aWZ5X211dGV4LCBidXQNCj4g
dnNjX3RwX3Byb2JlKCkgaW5pdGlhbGl6ZXMgYm90aCBtdXRleGVzIGFuZCB0aGUgd29yayBpdGVt
IG9ubHkgYWZ0ZXINCj4gcmVxdWVzdF90aHJlYWRlZF9pcnEoKSBoYXMgc3VjY2VlZGVkLiBBIHBl
bmRpbmcgd2FrZSBpbnRlcnJ1cHQgZHVyaW5nDQo+IHByb2JlIGNhbiB0aGVyZWZvcmUgc2NoZWR1
bGUgYW4gdW5pbml0aWFsaXplZCB3b3JrIGl0ZW0sIHdoaWNoIHRoZW4NCj4gcnVucyBtdXRleF9s
b2NrKCkgb24gemVyb2VkLCB1bmluaXRpYWxpemVkIG11dGV4IHN0YXRlLg0KPiANCj4gTW92ZSB0
aGUgbXV0ZXhfaW5pdCgpIGFuZCBJTklUX1dPUksoKSBjYWxscyBiZWZvcmUNCj4gcmVxdWVzdF90
aHJlYWRlZF9pcnEoKSBhbmQgZGVzdHJveSB0aGUgbXV0ZXhlcyBpZiBJUlEgcmVnaXN0cmF0aW9u
DQo+IGZhaWxzLg0KPiANCg0KQWNrZWQtYnk6IEFsZXhhbmRlciBVc3lza2luIDxhbGV4YW5kZXIu
dXN5c2tpbkBpbnRlbC5jb20+DQoNCj4gRml4ZXM6IGRlODhiMDJjOTRkYjcgKCJtZWk6IHZzYzog
UnVuIGV2ZW50IGNhbGxiYWNrIGZyb20gYSB3b3JrcXVldWUiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBX
ZW50YW8gR3VhbiA8Z3VhbndlbnRhb0B1bmlvbnRlY2guY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMv
bWlzYy9tZWkvdnNjLXRwLmMgfCAxMSArKysrKystLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L21pc2MvbWVpL3ZzYy10cC5jIGIvZHJpdmVycy9taXNjL21laS92c2MtdHAuYw0KPiBpbmRleCA1
ZWNmOTk4ODM5OTZiLi5lMmY2NWU2MGU0ODkyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21pc2Mv
bWVpL3ZzYy10cC5jDQo+ICsrKyBiL2RyaXZlcnMvbWlzYy9tZWkvdnNjLXRwLmMNCj4gQEAgLTQ5
NiwxNiArNDk2LDE2IEBAIHN0YXRpYyBpbnQgdnNjX3RwX3Byb2JlKHN0cnVjdCBzcGlfZGV2aWNl
ICpzcGkpDQo+ICAJaW5pdF93YWl0cXVldWVfaGVhZCgmdHAtPnhmZXJfd2FpdCk7DQo+ICAJdHAt
PnNwaSA9IHNwaTsNCj4gDQo+ICsJbXV0ZXhfaW5pdCgmdHAtPm11dGV4KTsNCj4gKwltdXRleF9p
bml0KCZ0cC0+ZXZlbnRfbm90aWZ5X211dGV4KTsNCj4gKwlJTklUX1dPUksoJnRwLT5ldmVudF93
b3JrLCB2c2NfdHBfZXZlbnRfd29yayk7DQo+ICsNCj4gIAlpcnFfc2V0X3N0YXR1c19mbGFncyhz
cGktPmlycSwgSVJRX0RJU0FCTEVfVU5MQVpZKTsNCj4gIAlyZXQgPSByZXF1ZXN0X3RocmVhZGVk
X2lycShzcGktPmlycSwgTlVMTCwgdnNjX3RwX2lzciwNCj4gIAkJCQkgICBJUlFGX1RSSUdHRVJf
RkFMTElORyB8IElSUUZfT05FU0hPVCwNCj4gIAkJCQkgICBkZXZfbmFtZShkZXYpLCB0cCk7DQo+
ICAJaWYgKHJldCkNCj4gLQkJcmV0dXJuIHJldDsNCj4gLQ0KPiAtCW11dGV4X2luaXQoJnRwLT5t
dXRleCk7DQo+IC0JbXV0ZXhfaW5pdCgmdHAtPmV2ZW50X25vdGlmeV9tdXRleCk7DQo+IC0JSU5J
VF9XT1JLKCZ0cC0+ZXZlbnRfd29yaywgdnNjX3RwX2V2ZW50X3dvcmspOw0KPiArCQlnb3RvIGVy
cl9kZXN0cm95X211dGV4Ow0KPiANCj4gIAkvKiBvbmx5IG9uZSBjaGlsZCBhY3BpIGRldmljZSAq
Lw0KPiAgCXJldCA9IGFjcGlfZGV2X2Zvcl9lYWNoX2NoaWxkKEFDUElfQ09NUEFOSU9OKGRldiks
DQo+IEBAIC01MzEsNiArNTMxLDcgQEAgc3RhdGljIGludCB2c2NfdHBfcHJvYmUoc3RydWN0IHNw
aV9kZXZpY2UgKnNwaSkNCj4gIAlmcmVlX2lycShzcGktPmlycSwgdHApOw0KPiANCj4gIAljYW5j
ZWxfd29ya19zeW5jKCZ0cC0+ZXZlbnRfd29yayk7DQo+ICtlcnJfZGVzdHJveV9tdXRleDoNCj4g
IAltdXRleF9kZXN0cm95KCZ0cC0+ZXZlbnRfbm90aWZ5X211dGV4KTsNCj4gIAltdXRleF9kZXN0
cm95KCZ0cC0+bXV0ZXgpOw0KPiANCj4gLS0NCj4gMi4zMC4yDQoNCg==
