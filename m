Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2463F58F0
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791994598; cv=fail; b=W2/y7rp6LdtHbHzxf8wrmi0pY7dmn3mKwlFW6SFr0xl3wvhPlbt1RklM8wPBCC/gw0oDI27anUa18ztn8TJ+FVhoffyUGbpuvicx+yCaGG1lANqLhYt9qp/xWCUg/aaGthGRQuqHf6W9WKy7aymdP2s9OmzVdSPxR060q86BBYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791994598; c=relaxed/simple;
	bh=ExuZOj6SmY/fZrVTiZbGeIwCGfFX8iQXPKhEnrRcr34=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LZPvhbJicuhOQHfGWUptfl58lvQ+9va76KaJIBdLZy6yyIxWyfRxVgk+jbsTYiO9lkM4Xdm3Rn0U0DYVYBlWzSSdl+qQLfRLO4SmkOtVzzU3zqRvFNhgJQF25s9zQrDWDwQvjm7PbWmzVXjOIPrxkysqAJuoHaOEOG6RCrpeGf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YI1CItS5; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YI1CItS5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791994594; x=1823530594;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ExuZOj6SmY/fZrVTiZbGeIwCGfFX8iQXPKhEnrRcr34=;
  b=YI1CItS57CESUoZBFIC/LGQmWNZmIcU/Hx052piBM0pCqKBhyy43UumV
   g7icRrAHUFwLFYAUhk3hb4lV9EeZIsBuYU5fa1uiZh4KAFYUAXwxbaBLq
   4dqo8+Pq2b5xN3g1zbzX9H3BQfUpIBtorDKwxkDLh5fv3cooW+1mF6NaX
   YWj4mFyo22ERnu5JvSYWcimWwhqrNtJu9PeZkrYcK32iPcPOwZneVuNRy
   Aouoi/gycDRIyXCKJQvvB3VowcMSoJW3b9h7bZwFlOOGhY6SfULSV4rAJ
   CmRYwy+RqoEM4hAVO5bCqMDd5xWR84zoJh8n4RR0Cxeihau0MYH04pmI6
   Q==;
X-CSE-ConnectionGUID: wWlNrONRQqGaxRPi+t5fmA==
X-CSE-MsgGUID: C7474Xv2T6eet4FbHK4pTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="652981"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="652981"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 09:16:32 -0700
X-CSE-ConnectionGUID: c7kajgHJSFOL00YTvyir6A==
X-CSE-MsgGUID: NR7QKZFsQb21kmW6vrqBGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1548809"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 09:16:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 09:16:31 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 09:16:31 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 09:16:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kiHOnuCs+rOMkbJlSICug07NCchylprVR3Z0UR9s0lPB6i7Y3IcwLkbINzgiDL/TrTqTap2Kd7MckPEi+AbAfuzccx5EUkrfVOzianbpMMgZN3uabE5eRbkV5EA8gLsKDWZcRFtPC0blUe4pETs08sUzC9Cxt99UT8DDZiYDBLffd8MbFOM4Sg+qdyK6l5tjbzAq9M0dOvGrDKX7WXBLCfNY/Ayyu01VdCZeb/sos+KzsF5zFoFgDK9mDa1O5blaGKE5Ny+0ofjPH+7wqnsd8+99aQ40/dEKgHn9t8uTnquDZcLsUi/2tKxklF/1TQHDf6F8vgGFb4xeq4/Bio1IKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07OlzqAQfcWQ/jtfshaOmpd2Bj60ca5XrNCA/0xedKs=;
 b=taL6aRzXjHSy4hBnYOaFOq6Ob0Lk/ievGa8yEzW+Tc8eZvois0Y2VdxZmrQIE2dkNKuevFFlrP64tPKQQ8jqxh+t9xrYPsokGvgix3OxtoCtIeWiZUDM0OzewuDkYX/OLMmux3kLbLPuc5zLdnfrlI/MVp4seTMPmBwUeAWcEqRC6Oj11ip1cQSEhP0N4F8vAviRmF/qRUns7wG8pmw6USVy24dJ0Ip5quY/8vy2PeS3o+RXl9bLSLqpOxg4mRzOSvLmK2ecHZ6walB1hOMfRRpmV+jgp+8ydcooCuZDXObMDm8KR+n9xvSf41RZy5oBu+oWqMA+uGU1wsZgJtBVvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by CH3PR11MB089109.namprd11.prod.outlook.com (2603:10b6:610:361::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 16:16:28 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 16:16:28 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: "Graf, Alexander" <graf@amazon.com>, "Chatre, Reinette"
	<reinette.chatre@intel.com>
CC: Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>, Babu
 Moger <babu.moger@amd.com>, Thomas Gleixner <tglx@kernel.org>, "Ingo Molnar"
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>,
	"x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "nh-open-source@amazon.com"
	<nh-open-source@amazon.com>, "lshahed@amazon.de" <lshahed@amazon.de>,
	"jaspwise@amazon.co.uk" <jaspwise@amazon.co.uk>
Subject: RE: [PATCH] x86/resctrl: Require force for L3 CAT on early Skylake-X
Thread-Topic: [PATCH] x86/resctrl: Require force for L3 CAT on early Skylake-X
Thread-Index: AQHdW7ctwhe34TdB8kuPVkFyNyFN9rb9MmEg
Date: Wed, 14 Oct 2026 16:16:28 +0000
Message-ID: <SJ1PR11MB60834180D74FEF6B0A804CD8FC9D2@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20261014083637.65430-1-graf@amazon.com>
In-Reply-To: <20261014083637.65430-1-graf@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|CH3PR11MB089109:EE_
x-ms-office365-filtering-correlation-id: 725828b1-18b8-4cc9-39b1-08df2a0e8063
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|38070700021|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: 8q21M8jyPGQhlEQED+xytZ9lakWVV0ElW53vT3fQ2Xwp2R9xCHSmlfCBcWtrdqyQ2BmAz9G0YJ4O2Xa6JeHkWoeFv/VOLPUhNCORAAxMfTjQ2mtSW9xIT6zXUGAvcv6zfH1OVWGjXJcq4ypD43KKM1nzXlGV53PnqtllyUA5Ygnv5sbrvTpJPOEc/O1ApYO7OXSnkmKbTFbzGwW4dLq5h8bumXOkuTbANzrWDI3rSW7urMi1YNkm5fh7QsTTHn6aYAqUWGK/lWL0ElFI/MaiPeNnM6KRScDS4DkAgj514GDcSJzYFfXcqBv333ul1z4RiF+u0/32N3TQ3QavSScMbM7O+gq8exl3e/yOf6BXMDOpTGAzZh4Gly2S+SbNVFwYS/HHm5ilDSKlp10Ex8qiWAfOAMcx1WnzAZVrzZz3H6/WwfB+tuwHRaT3yxR0zjvUJO7k7E3EVwRFM8QZzSLthOsUeZh8jT5Cty+D3B9J9S8iw1eW/eqraL1zxKlBvxlqs3iGQyHkcUCgOt6YjJ9AcnPmPE6MVOChF4KMZBw0CESgcvx496FJ13VNat5pgyhgOcvRR75HX3dGGaqt4LsZSGpJueneSRANNcGPG/P7Su8e9CqiaZ5g8CdS6iGfpEkLj0px7wZD12tQX6SA0ox5RHXxRVLUkZGXcE1Csc+/mPzB4KJ9msE+q8yPo/30KR2xSBFcBYpoXkVCJRCpLnX6M7gtaSIaYbe8avwoXadEoic=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(38070700021)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8il5WfiBGPNARUAGxyh4+j3uVrQ6GUg1kGdJfhODlVuCf9Svis3n34S0kqcT?=
 =?us-ascii?Q?0NSPZJM1pAAfmGmv43CIn8The3m7pHkS6dQdJV+sscnnsCtFHP5C0S1IcDVy?=
 =?us-ascii?Q?1aptV2kec/Mjtj1cMm14xNjrbkNLnitNqlPzc51bnDD5fM2paTeVuinDKbjS?=
 =?us-ascii?Q?hdNKTAvG1MjEWSai82jmnmYwV/ntIUz6hK8NsuuIMIT8gOahNVPYEQEHTI56?=
 =?us-ascii?Q?xOyUoWxe9ddXb36/2EA6K5H5e+u3qGBlVeLp6BXEnW/WwdVHcb6hSeHpCwb1?=
 =?us-ascii?Q?1k5Wx1tUt3EmE4yKsyKRqJT7xadNxRi6SwGY98YWHDjICbY0njBid52WVX9g?=
 =?us-ascii?Q?9fCXkhuvS/koMJyzPk8PDawTAQ+Ur+uUo9lvVZM1zGf9vrMARvK2K8hbPus+?=
 =?us-ascii?Q?qiTg+DXYeHIBokxGQkIVvDQHSKUsK2s7Fm8V/diCzJBvCtcPAd2ILelhMGAG?=
 =?us-ascii?Q?TPjF3bwan/DeP7hunNA8T42ttRESKnuV4DbNBtSRQwn4C+vobwb1AnxWOWTU?=
 =?us-ascii?Q?CffuaxY/t86DfaBk8Le2b1n14w0kGvkj7lq4CI6BAPV1DxRZm4v6lfWrI92C?=
 =?us-ascii?Q?Wx4cQlsUDAjQgJ01kVUGLD6/uszuFo+2HrnaUqglkEtPbXpSyYGlH4OD8o+7?=
 =?us-ascii?Q?5NMVYcPRoAfeFbWRwvydYHUZzmtjgfZBNsd72Y01peZdt+cGa6MIgKotn1kH?=
 =?us-ascii?Q?4qy8l9HYYb8qq9vV3hdQAFQuGmS1Df3yrSfm8UCWtvsjNrbsPdswnhfbHs9+?=
 =?us-ascii?Q?RTeW9YxLZk6dwTNXIaW9yts11x4FogEP2hL0WC59ZXaKUplnkAJ1KqmSTydW?=
 =?us-ascii?Q?l71IeBiadDhZ4BEcdpwD2LjsKk10f1oMcixm1wPwmhhvOeY/pnFxKRY3iF1u?=
 =?us-ascii?Q?O4JBhvRMuT+X42VEAAVdcB/0Le9dcJ+zvcVlBcHx3356+Rpr084+CUa1xSqD?=
 =?us-ascii?Q?lT1pXRM/gIaBqxB1scehAyau3dvlhKE2jp0ZMV6zgGIR1OiqdxQN6YNbuV94?=
 =?us-ascii?Q?bVK1mgsAWtkFOg5L7I7wgH26P8aipdf44F99PR9BwfNlZcI+c34SIlpc+6sJ?=
 =?us-ascii?Q?K0E41w77qh3UlVwFaBTgvbksKU0zeGW2HYxGNXQBKx/xam/iRmJCtSPO2/xY?=
 =?us-ascii?Q?Ug66Df5TrD+H8hT9eyhWSE1IG/pHY9hkpr5on8OWG5VQEYg9YR0715ZpOf+s?=
 =?us-ascii?Q?MOEjgqEdt1pvR22PE1cus09OfVwQgHJlCOCSYaMmfJ51Ws+F2hZGL1mP+9OD?=
 =?us-ascii?Q?ASOELTfwsF58IVe/5zGgPLyGd3g7A+TJFY/NBFyiBkmA3j2/caQLh3hY0pdG?=
 =?us-ascii?Q?EgszDM/e+S6W+i/v0vi6GcLacQ5bt/TiP8t6YVYjjX70/NZwQOaEHEcjcDjn?=
 =?us-ascii?Q?9QUMI7ZqBtf/riOq7nSwtjUyiY0obNMjVbSo4Woc7E1z5ISd1XtDfVgV2BjO?=
 =?us-ascii?Q?9Hz4i6YCt1vXxijLPMQoB1MZSoVIaYJrEklcMRv11zS6cNeNZRQA/oo8xOAA?=
 =?us-ascii?Q?JvBczOOv4CKeMkP1BmkjBPRdSWV6nrgXqYXUszwkcsPNzHnNTZG9ZcqJYUIu?=
 =?us-ascii?Q?oRxrXe3O9GyMEfDZUpH3m+aEmUTjjBtyf9J/IZhI5FAAiP1FSxHmFyfU9d5y?=
 =?us-ascii?Q?hnMOnll2Z6Ox2RiwS7OVUs9NsEFo6Ug2ordmAfSjTcgfAFS1vUMFYLoosLoZ?=
 =?us-ascii?Q?He5ntlradsXpJ1K+h1KGr1P/hOPahJQ8zOmrpe7oqOWZjkX5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: mbtxH2NV6mm64OBSP3nEIM8to7hVpKDIa1Vad5st5BK9HLISjVFtIlT5rRItQNd1POH2/dQ9+phJ5Bbe1JY1d3JpzQKDU/ixZIH+F/hRS+GOVqJtjGwrMEzm2ONEqUeXCyZqtr+P/euQJo53j2Qs/j/vm5vQ7p0sqXe6EFf2QOZji7FEjTjbiByqqVSgRkPVZ0WjpoUCj5liyZOtJZwtAVtUClUfODfAhwiPeNjw1NZlNO3cIfXjn+AssN5/7DKpAeXvMWvnuxaPeq0APrzmzkRtkmemho5NoiXtKHDGjTQgrh7QmJ5L0q+s9n9PgYpEg6wAJeyii4BV75pWsFm9Nw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 725828b1-18b8-4cc9-39b1-08df2a0e8063
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 16:16:28.1692
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N0ppdtEuUOS+zEbmJykt6Cs7D5CtJVyjCQRM41zaY4WaAzF1pdiB2QiUK8lRD/NVUZOwcyAE/3MNyhgrZ/oddw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB089109
X-OriginatorOrg: intel.com

> When L3 CAT gets enabled with rdt=3Dl3cat on Skylake-X stepping 3,
> consecutive kexec boots hang for me during secondary socket bringup.
> Cold boots on the same machine work.

This is troubling. I thought that the problems on Skylake were simply that =
in some circumstances
the CLOSID cache mask would not be honored so that data would spill into ca=
che ways that
were supposed to be reserved for other users. I did not expect that the sys=
tem could hang
with L3 cat enabled.

Your fix seems quite complex.  Perhaps something like this?

	case INTEL_SKYLAKE_X:
		if (boot_cpu_data.x86_stepping =3D=3D 3)
			setup_clear_cpu_cap(X86_FEATURE_CAT_L3);
		if (boot_cpu_data.x86_stepping <=3D 4)
			set_rdt_options("!cmt,!mbmtotal,!mbmlocal,!l3cat");
		else
			set_rdt_options("!l3cat");
		fallthrough;

-Tony
