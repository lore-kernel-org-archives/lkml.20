Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A4F2AD00;
	Tue, 13 Oct 2026 00:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791849722; cv=fail; b=cUf3XSJhIF1iW8ufqpqCD1wTMXfFrPCdfltwU6f+sV0Xz+tgI7YgX9/ptICoM7KTgoiWI7yWJ4SpM2mQv4nJRZYDZudtSCUY+k+rV1vd75pzEhpX0V7U9EGTJ9PXxXrLqZEQtrYlM0WlNUQZ67v+GzxpEToihmde5q+phWwnT6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791849722; c=relaxed/simple;
	bh=YZifoPj7VifE8FvXEbgWeXalasMwxVAx7VMuJ5TKQoE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dubxsR4T4F5XseVCITMBlFTIIYxbKzocROV18ZrAYrXX0ezdnvq7Z80t3Az35Z61cPic5iB+KTqAmpMBI8K+qj+DQMhFt65uBnEtIPobCMRmGhlFqkq7c0rfmKHtZgcR7UDbKbH/MQqi7r7bv35V7EOttqhN6uF8eO6oNnyTnVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H85wuK+j; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H85wuK+j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791849719; x=1823385719;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YZifoPj7VifE8FvXEbgWeXalasMwxVAx7VMuJ5TKQoE=;
  b=H85wuK+jHVCtAt9K3MDrR+gC552nUSD3E/yD90h877KjRLg8PdTR+HKO
   2jyAMN/Z5KvTpJ118JrCVGf72jYw13B+iePnYTD7LE8w2X23cUzVTdDbU
   z5CpLneSgxOteRoeDukDj/9kJweTf+PwXkhcD3Q5+xAs9RYHnqHBQcLNn
   q9Xnlc40LunBE1wq5X91H4hX2pk9gY+i9sw9EZqra3mU10h8j+x5ynLbY
   J2Stjn8RtGCUwEgs9O+awoNA+jbdB539p9QRlx00v7Tm5XuSUbJP68C2f
   63GcOsodWPJMgThtfUK5snBBvggcNj3MRsycCFAmq+eKQXXcdW7nCx5dF
   g==;
X-CSE-ConnectionGUID: nypPFFlDRp+VZuxRwdJ25A==
X-CSE-MsgGUID: faL5IjbOTaS23ZV5dpxK2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="456067"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="456067"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 17:01:59 -0700
X-CSE-ConnectionGUID: DpApGAvlQxGBRdqCuBtLHw==
X-CSE-MsgGUID: 7dcD3EK1QGOg3BLcFtU7bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1005498"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 17:01:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 17:01:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 17:01:58 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.32) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 17:01:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fq0FGd+MQ2WQardelDUZxk7YIDwibYSw9oM/ly2hNUZirg0kmUDWIdNv2BKagdJ940KBEMaYHBY76ymp9amzbH4TmLz5KIBY37zCK0Qsm0TfiHYW7YBKK8QKqxGSMVdCFhqsJ//aLiGhRW3fonueez9gpc5KzErceZwNZ9MtQMhcjkQ9I7QU6Vv6ERyLLK/WezL1dy0OZkXr42Icc8HwT4TonUAcX1E7i7LsUl93TgeJP6d0Zy+t00wcXlK/e+Y5aUYEML7bi1LfdOwP1hSIk3GQROli+cVvArYcGVchbyk0PJOMN/k58Sc7uCrPfIBabyWhhJWGNZP0pmJ1Szw1nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZifoPj7VifE8FvXEbgWeXalasMwxVAx7VMuJ5TKQoE=;
 b=EknLFw0UfyQEJk95xMr5uY2C+gRSxQfgYosN4iSqruq9X/dUXgL/IH6eTf3KEFQJPMbNA9IQQ0JYJ8zIdmAJ71l785P2HpgLLcDP9fKQrcr7+V93NV0a6ASCsPBKVlzmE5dCX4RnHRqiY++DlnTthmJIlIoceNeg4X2MnRY6Y0inYfd7aMBEe/XdsmdiqlXGGEOZPESMSgGtfwIZ5M5x1ODj3U+CXLFmXVNylvs+CP5Ao4ccgHO1sE8ValqMqnB7SjjDdIM/GEDAkZa8AdPGcKpAaCcb1cV7ZE4u/APITNkhO70dzdeQEWrvihkBD260yhRJpaBwBUsn8lJVUke/vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by PH7PR11MB6476.namprd11.prod.outlook.com (2603:10b6:510:1f0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 00:01:55 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0496.010; Tue, 13 Oct 2026
 00:01:54 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Adrian Schlegel <me@adrianschlegel.com>, "bp@alien8.de" <bp@alien8.de>
CC: "x86@kernel.org" <x86@kernel.org>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3] x86/mce: Do not treat cache hierarchy errors as memory
 errors
Thread-Topic: [PATCH v3] x86/mce: Do not treat cache hierarchy errors as
 memory errors
Thread-Index: AQHdWoCVugPTELkXJUqLbiWa7DZ63rb6lsZg
Date: Tue, 13 Oct 2026 00:01:54 +0000
Message-ID: <SJ1PR11MB608305BA1ABE469CAF1187EAFC9E2@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20261003222012.19685-1-me@adrianschlegel.com>
 <20261012193305.38931-1-me@adrianschlegel.com>
In-Reply-To: <20261012193305.38931-1-me@adrianschlegel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|PH7PR11MB6476:EE_
x-ms-office365-filtering-correlation-id: 33583f76-51ac-4b20-ceaf-08df28bd3112
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|22082099003|18002099003|10067099003|38070700021|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info: PuF8/QtQeqB+zN9bWU4qrKlzYwmR8YOhC4FyakF5SO2CpDzbDQg1hk5v+WHcTH7CM4fGYX5jQUszMKHPj9nbn2AOBQ5uDdAz8rvELRICWKuFRokWpWh2TScdszQJcVapYIfEjrl2P4utOVx8HR9zg/5WQ4AqczneLuAUpP7vXHmSQ+9Z294PiaWpBRzP7UQiUpYkWLyO2maDG3AYkDUgOM6uJ/7hbuU1VRLppeqK7USBZybowC9wjG4MdTvLXimP7m6Z8Vv22o+/qNDpDeCIEDk/4kXDuarKZDCMeL/ZHUhI6Y56q3qkrZEZHquLC18kYAfzD94CFpuiOstpY7HxOCcCCalkVQtjs6+04DzcBGoLJQziuhaplEMnr09ljq4V4Mz6+ZPduJrSOQ+MuBNtf2EKAnDrK3vKce8UCMnK7CyEKkSXvzj2FRGnxfiK1ft7A9yb7UIVyyljvHvXFGTb7CvEA6YHcTt6ga35R3Xd3Eu3dslNnUlVAb8NhmV7Pxq7j9caucgbSkFJyUQjbYskoXcmmWpoMftDyzD9nkuHbQstta0W97Re5WZGTlxUErbKzcV5M6j+Bce3C6ftFO7aeSrK488pwWKhefWBnC/r3HdrxtghecN4RSPtHa0CaxYHHe0g51upGRzxdgXbB8lEGYnMm8CxFBFjPSjEOyXcaT4WKofVX9PyJ2HLLPa8R1vdHi67tHDsjtCnMZOCZ/nRb5McOiAXF9mYvs6MrqS2xpw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(10067099003)(38070700021)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fnV9uhywaYR26+AvIMvkpCL48ujRwOU2rK4u1ARL2kxMtGXpquMHtiXdFNX3?=
 =?us-ascii?Q?N4YZx5baxmI5+Og9Jrsb12Bbn5l/Dm5obLETj0XYJ608chLYhMqLC1+lQ+BG?=
 =?us-ascii?Q?M4T+k2VtsJAIP870rrckuowVRYWsCF9lKainyvQJAiUkxhQXpyugdLL74N1R?=
 =?us-ascii?Q?UsYdGe+EFgDF5oa+4nMeM6zzOmpmN/WMLRPPiYJqRhyg0KbwBG1i38JywOfv?=
 =?us-ascii?Q?MkAfqalSp9Hwdoal+wSFrGatk+AeZOCCW02+pa/s0Ugrfj+0ygoWO44iAOg1?=
 =?us-ascii?Q?zPviE1o4vp9zCbXiY+1JbXpUe1K1ISThqsnPp5/JqxoO6VNcKv4y7V29Bxfe?=
 =?us-ascii?Q?GfgelJfXTNN+GWjnPXcYkSIB3HVrglSu//LqFT+BLX1UP2pH/7CkCIld3mMD?=
 =?us-ascii?Q?4xwcehmvIDYAEAU6G5CK+QJuLZYow36o4TChrknFqu9GBhlb/cwYkdy890fn?=
 =?us-ascii?Q?Vwxjkfc53WddYKfvRsWwRV8efPpwYAAFe9cC0tzxP9zp3hXWqEd9jF9K61dk?=
 =?us-ascii?Q?1YUCOE12pg6gKqE4y8L6+v9y0KeTy8IOBZt98+16TdhDkep1vfRenyjtpPOT?=
 =?us-ascii?Q?0v4DsPAxdEXNdfwEWknUOTz6dJiPO8LQVjdFkXdLJ5h8tcPuTwU/u5QqKeHN?=
 =?us-ascii?Q?Ae1UUgejLd4boYl4qIVWaylJLA5RtRcxcTdlB+oWW2hykI4akaf6vgv8EtsY?=
 =?us-ascii?Q?P3i+44Jvcx1+I4nvH14fDz5xAVobGe9FxcVBT3o+DM9yTCO8IdzVcRdOzOce?=
 =?us-ascii?Q?z8JyKtPxeIvNdNaHfLfysrTw4+jO3jeH4vAjcJmvJoj6gOI7iPT/gaGGyzpk?=
 =?us-ascii?Q?iRYzWH4BYOBX+7z9QyJArdvZlAXCzjjI9BVCHsvIjBJpTIXG/P7oXPjT1jKb?=
 =?us-ascii?Q?VYhomkXEQ3Gqwpcy79gtFMaWSVyLEkQ3NSAU2MBxJSA5sV46b/JUsn4WoeEn?=
 =?us-ascii?Q?uDm0wJPEK0XUFjU906nqzDda7U4/KTG933i0AzrOmZFk4k4vrxp59FkwC+DT?=
 =?us-ascii?Q?4kJgs73S+vbo5hOfKXazrZB9oaSnfCcjQdaPUQqXxYmP5BGPAm2UU+Fz3kwd?=
 =?us-ascii?Q?grBmWtE+SLEkRoUXMlPjcOIGiYst6Sih1OKD1t+uwfYTEu4r6GHsph7yCSP0?=
 =?us-ascii?Q?8kRH0BEqr/zOp/kMOenbllbsB+fIpbKp29c9x9wS+VQznWPoneMuEKhVh5gk?=
 =?us-ascii?Q?Hrk1ZbiiwFQR3E0p0RELL8YLusp0IrlvSBApRiHIl6vm8geHD+nmTJfO6Zq6?=
 =?us-ascii?Q?N9fPh8WucEMWv7di/eBe4AIGLEZQZWaOKRQ6pXGMcYTJpQtonFOqaxK0w+bN?=
 =?us-ascii?Q?s8I6LWuoCVyA/4+/lZ19MNqagubE7vwULeTZ65wgUSuTa6gpMC/tm2ypv+uV?=
 =?us-ascii?Q?Ro/PTFB+htU9mYnpEuIfRuayz3ofZjdMnHuhHp6rfk3r/2IzyGDava5xb5IC?=
 =?us-ascii?Q?TbxX56TJa0gBoAlyArBfZ35qAPE+F7DLBC3YQF6yAVUXZUeoazrGXXVAezac?=
 =?us-ascii?Q?q7YnZD6mOwIGd9t/fVKVqU4JxzdQssDNRIoD0Ssdlifks4H0Fj/HxOERZXck?=
 =?us-ascii?Q?20OtaJTI8dV/wOUL9QO7W4wg+ieEyC0dKvtubTzF5Ef2tlabpt59TIoYt+Vy?=
 =?us-ascii?Q?F9CM0++1yOb8N8B492jvPjnjN2APucH2LM1Y2I60KKbHdtv3vISJ2sigjVEy?=
 =?us-ascii?Q?zaCwon2g27UisQ0aQGhrKFPdEi2bVZBvnhbH1SalYGaA+vbK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: zS0jU6X7+oFl4ADAud0t3Cz0HZywjxOUOhMXDaykhm72x2o7WNmtJdirL2QCpCTJDQyRDLzV1J6YVHeLFeq684X/jBQdnk0kwCa4Bl8AnPNJK1qw3hUtLtkLOur249SvwEcUy6S/PxaGSl4xSwDnlbwfkADDC7q/C4XEY/SYjgTieff5xfHm2bwyxp9+IWsJn/EoZDbFwThy8oozp168sKHjuxi2YGbK5hUPAxY/ORyZcK23PscW2cJR4iIV9RGmntibO11aijSvIlpNm5IudQZJK0oZCBUoUM82rtoe9+ns2JyzmxxgYJK9bVHj0sxp6mMaYtNdKFp16Jz9yNYiUQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33583f76-51ac-4b20-ceaf-08df28bd3112
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 00:01:54.6506
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x6B6uCzXyPnbloegkaBe3RKJnsGi7NWb08a+f5atbxPRdDPOv3Xbnr0fTXS37lVf7jjw/xHsHbmSpha8XPF/0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6476
X-OriginatorOrg: intel.com

> On Intel and Zhaoxin, mce_is_memory_error() also returns true for cache
> hierarchy errors. All callers expect it to report memory errors only.
>
> The CEC uses it to count corrected DRAM errors. A corrected cache error
> only names the cache line that was affected, not a faulty DRAM page.
> With a faulty CPU core, the CEC therefore soft-offlines healthy pages.
> On an i9-9900K this caused about 500 soft-offline attempts per hour.
>
> Report only memory controller errors on Intel and Zhaoxin, as is
> already done for AMD.
>
> Fixes: fa92c5869426 ("x86, mce: Support memory error recovery for both UC=
NA and Deferred error in machine_check_poll")
> Signed-off-by: Adrian Schlegel <me@adrianschlegel.com>

LGTM

Reviewed-by: Tony Luck <tony.luck@intel.com>

-Tony
