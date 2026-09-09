Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6333F4F0556;
	Wed,  9 Sep 2026 10:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949979; cv=fail; b=H0VoH7AFowCcUYb6V5RadoFFPX4AZCp/DntB2Fn/b/oUliE5UCwziJKdt2u3QTbfqAfNH8MeTgAvGiRRCtJpzzGW+uFN3gVAM5hg/tJUyN4RIjEkD6gK81L8LUY3NwSNOak9ampSAHMkkbozVgZp0y7Uw7KsPCcSaPIb8BBRqsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949979; c=relaxed/simple;
	bh=EFv2QNaNBoYY1k5igUh+Ga5T5iCpjmdWug+y0EG8kQU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bguGaRp8DVUub1ibEI13+KR7IcaSDvTniojaOEs3kJPuiNVacZlQHP9GGHzUIfvyBmTryfkV8XdcaunHl3nRd843NDMQyWCQsF+7J8cmlgtg2bqsCRzGrjvBi8feQvRJVhgwtcu0k3iTH+6OVy9AseaM/bC5RmJ7Zx1HM8TsvLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEGmWWnl; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEGmWWnl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788949977; x=1820485977;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EFv2QNaNBoYY1k5igUh+Ga5T5iCpjmdWug+y0EG8kQU=;
  b=TEGmWWnlgwjKtRU/hju4mI4akgd+2rahpt/Xo+Cz6hkmkiZ32lxcxkol
   iH6K5+vjXl6IPI9LCVO6fVh2Mg16M7PQxCg+xPnoBW9HwrfkEhGeowkRC
   b9gGUkfrr8puLgpB73VJ6XmbIPzLi4V7KAa+/l43QjCFChDLtIChG3y+c
   c62He+V9guxrxl2+fgkdN/1dI0t2WEtjHVPXydNr6tuPelOcAZs7MNZ3x
   lRmIMvqwNNKobwoLMAA7YPOPhiZgQXyxw7mGmGNv3q5H/+AJD8kpv5RpS
   DViqY/EE6NHbi+L666YfOviZOS6hvDeF0e6MsqjdCBRa95tdqpMkul5/E
   w==;
X-CSE-ConnectionGUID: W7fxGXGLQd6+++1ZWPBmKA==
X-CSE-MsgGUID: dazne4ODS1eBpQxQrA272w==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="106888485"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="106888485"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 03:32:56 -0700
X-CSE-ConnectionGUID: uWWPABxcTAWkct+vMMHh1w==
X-CSE-MsgGUID: dmfPtD8EQd61SDkQfPLRDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="268709704"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 03:32:57 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 03:32:56 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 03:32:56 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.28) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 03:32:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ErGVbeAG/e1msfKSgi6Rw7Ox+VYOR73O2kxnZHyGWV+R499+sn351k7fJtZyUOJSHrP+eQr9CRwYIJQxQdFCpFlwnt9trRwIQawRxRxXMus7au7KPltorrepVv+qoNLjO+fLR+ZcBkIOnd7gqBqjOB1e9fKUqX5YJY6nkaxpq89xf0rdjft0C7unrpKWIy1/31ZkkGnLM/dW/z89J1800kGVVA7IqS95CBN+ob11e4NcyP0VGvfbO2KxxMztNK8c7zOWjCEfgcuNFegyHS8KoQv+qDytMeNpwzIeyg5qk56jBlU11ngWQQC/NJq1XotyeGinum9q+8JRq7G5gi0hWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1ABoFJKxylDn/YiW1NDgBWvge4d0Au6AJiQklwrkos=;
 b=qYK/97tuv7juS1T864KS+HscYp0BnuNZXMLhAS+UBHgeFnCXKvJ0lvvWCImWrJ7KPiL56yfNdYR21wV+a7ful8jxXVZUVvEAOge82rlHb6KXwtwnrLqTsWZPRhH3/QZ5+1stSEzofOQCBM0SRD9NyScz+t5zax7dgqd77vfX+kALhMu9jqok1iW5nLAZam2z8gA5Wll8tgQQd5jLKVaqMOGlSwz0ZqTp+ZbB9Xy0xpOf0o/dBfVO4pX0yx0lwzWIKfNzv8LhGcQ1M83w1AVrAw1+S+/I6YQgbfGYdcOyChCrhiJxtusLlOruoCr+j9LWWRvntlVmXZxJhx7OQLag5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPF7708D4D9D.namprd11.prod.outlook.com
 (2603:10b6:518:1::d31) by SJ2PR11MB8588.namprd11.prod.outlook.com
 (2603:10b6:a03:56c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 10:32:48 +0000
Received: from PH3PPF7708D4D9D.namprd11.prod.outlook.com
 ([fe80::26ca:9fc5:a64d:2ed1]) by PH3PPF7708D4D9D.namprd11.prod.outlook.com
 ([fe80::26ca:9fc5:a64d:2ed1%8]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 10:32:48 +0000
From: "Zhang, Qingwu" <qingwu.zhang@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Pierre Pinon
	<pierre@pinon1.fr>, "Su, Jimmy" <jimmy.su@intel.com>
CC: Jason Chen <jason.z.chen@intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Vadillo, Miguel" <miguel.vadillo@intel.com>
Subject: RE: [PATCH 2/2] media: i2c: ov08x40: Do not expose the broken
 1928x1088 binned mode
Thread-Topic: [PATCH 2/2] media: i2c: ov08x40: Do not expose the broken
 1928x1088 binned mode
Thread-Index: AQHdP3ZNq5QwWQBAWkSJORDRbzR76rbFzEaw
Date: Wed, 9 Sep 2026 10:32:48 +0000
Message-ID: <PH3PPF7708D4D9D95D62B6929DEB21637B888B02@PH3PPF7708D4D9D.namprd11.prod.outlook.com>
References: <20260904134604.595685-1-pierre@pinon1.fr>
 <ap_YYNDTG7Va4MD8@kekkonen.localdomain>
In-Reply-To: <ap_YYNDTG7Va4MD8@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: jimmy.su@intel.com
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPF7708D4D9D:EE_|SJ2PR11MB8588:EE_
x-ms-office365-filtering-correlation-id: 94c8786e-3d56-4486-c0ce-08df0e5db1a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|22082099003|18002099003|38070700021|11063799006|4143699003|56012099006|10067099003|3023799007;
x-microsoft-antispam-message-info: tGyHcZKLpConLMCDNdmp0pxd22K2CGKCFHNVgLtueXFd4raD1vyY+x4DEXW+UOFNt5SjmUcCHc4ZWRETT3ODOJ8GGubTGM/Wwbfoaje/H1LovElmK7i2Er3b5ZsM9fcdOXPmqx1ufJoiIw5Lcg6BYbh2fJ8RfpqObOtZGROoz0R/QalbwmVCj6SfSaKTwfZ6BDRyo7575Pw6RXBhrPrTCW6tO3vF0N66obV/99n+6ceFLbNWvtMaKS6lASakrwqJ9D4Xop+XvaOp+4NHjem2XrXN1iU1UmYpkj05H4ULaei0jjbCpHUyIjRXIjwC5cLg9xxMXxq0QTuEj2dW6wEmiffepDct+JBlyRRCWjAKRTeLI+V0UV7zIMKTORh6hW5JlVzKJv/BiyqX5oGEcwk/KQedqN5MS6eCu7ixMmbKmQJoBpm2CMuU0iSORTrvGHH0iDvfo1HEYvVRwqBBi8SwkBBXN7M2UtlnAW8g/Qrf3dUIOQwixjx0dVv5H2MVjxaw/o+I74BjY57wZ8tEJB+2tgVMh8uZ+JVniEwquYD5R6iehB2nrdYAkhF6rwruKBiAZa33DPQ6b0tc36iyhakgcw7G49/CYMbo0ssGIswfnjnYEPyR1IzU634oLtyT6eSGPudf4LETIXfNr8mCEVsVLnC7BL0W5X9Uox1vlVP+/avXHllaxNN0Z0EgoTNG+BP+qhYpobnmcsy5hnQcFIT3683/mSzdsN7mojnGm1A5bt0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF7708D4D9D.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(38070700021)(11063799006)(4143699003)(56012099006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?51VDLBFyjLJPDd8Ae1kx3hcGCK2FxAPBNxDTaITEx9BJsKjTlwcJ5EgdzW?=
 =?iso-8859-1?Q?7/9bVf1/VxrQtLISfnhRoDpYV3Aq1Tx93Y23FYiKfH9zkScM16A2Y+JnEL?=
 =?iso-8859-1?Q?tk6cVxbKZspoHj+T/we7SpkDjseMr9Qqlr2WVLANATZFf5U1Ynh69ZUXVa?=
 =?iso-8859-1?Q?zZXIOyb5hLGwDDSGL/mhKCBo44xC6Lp4NCzUJdP0XDHSVQLQ+2sJNGtL1J?=
 =?iso-8859-1?Q?o5dYbsYhuaxzMiV2PGiBcTU24tdnuWmxjU2INKKFkKuuZyxWsmqhUZAWKf?=
 =?iso-8859-1?Q?QUCNVOnMvc5u0DacHbRC2MeqI4YIrm9bNg3NED8s3G+VtpHUKyBXsMrhpb?=
 =?iso-8859-1?Q?HV33rFCpPOjEyjHCmr2OJb2FSsld5cInEtKxYl4/Qhrpa5sUrr4fjWw1tu?=
 =?iso-8859-1?Q?ua0uzN39G3Qjx3iYlPzGQ2BfMJDr41GqaNSaGFyhUmv2QKr0PBYGbS8c/s?=
 =?iso-8859-1?Q?7wXYxU+X9f89sE/F+ygNyUHQR5CWAzgUBQawgs1IrukqTV/X6t90Q1KrgM?=
 =?iso-8859-1?Q?GM4pzk/vrzGDFrK+ykofu1Grhqoeprnqyb+Vdf3d1rxe1GjrkYMua7nGNZ?=
 =?iso-8859-1?Q?9vTtG/iygR9eaxa/4u8YELwmJJg75tlFQPWFGggSVqgjrYX+vunqV5CMVy?=
 =?iso-8859-1?Q?/Ta8XvVSq497d1ucFH1Tym92l3wzvSd/4cY85he5qVO0xhKY5SyOsfzap+?=
 =?iso-8859-1?Q?7vWzoVdpF/jA18VCUgXw7jbMRafGULf8FKvQzcXwOV6+4GFJKwQVrMopSq?=
 =?iso-8859-1?Q?81lg54LmDE4OUPd1/7HZ87VN17Qs4GvokxjaU7+xqa43uZSJiCZqC82WuK?=
 =?iso-8859-1?Q?0pgWDjsn3yPdnW8zaCudO3TGt7R0wkZIGnIizB6VwR/bgZXwBtcmmi2BFA?=
 =?iso-8859-1?Q?ryoJ4xnzFAoSIAEY3I9g5wq/IZDKqTQRb6wRQocfXmm2ibtYsk2N+z+ZzW?=
 =?iso-8859-1?Q?i8ZjeXW/yXqcJZv228e/7IX9blctf2KrRGLp5kn1ySRbYEpm+ZV9XzB8+Q?=
 =?iso-8859-1?Q?rQWwUQkCkZaW4ANyJwjjB/3NX0RneWhcEK/GhOf+uYBt0Sp5lVMUXBuBjX?=
 =?iso-8859-1?Q?aRG17BJWvMekvNTqxGWIbO2np0BlMGViY+w/fFGh+JhiwsgfjEKykBvKoj?=
 =?iso-8859-1?Q?3lzZai+hu1yei8XeDw593L/C4NckEvPOAO66jJ3XhnV/uwaJcI9QDzl+Jh?=
 =?iso-8859-1?Q?UwiFZBigz6giNY4qyHxzZkrLzwG5HqauU9HobmWIbobsSvXJtb5EtMm6lH?=
 =?iso-8859-1?Q?DIBTYyGPEPUXZA7CqDQin+cFicBPUNKVg0Rrz6NYY8X28u+OP4sCgWR5ay?=
 =?iso-8859-1?Q?y+wgCDQNJu7bZNEpTNXZfvIvRPXGdqTofix2HId8BXayMv65653gpRtIEM?=
 =?iso-8859-1?Q?gtfHix4BfsQfBlLzOqnvJaXC7/cnK8tI6lnNt6SlkzbKH3jsoy4t1A2klP?=
 =?iso-8859-1?Q?7uTu4HQ30OuHdYyfHE6IhRcI52H1Dwaf53wvbOwDFGHfropA/SllePTHrJ?=
 =?iso-8859-1?Q?QGU0lreAITfmVBxeF9pQBTp2GXAcQrV1XerhpuOfapJ6VOGwGaADg7oEfO?=
 =?iso-8859-1?Q?8/COh13NlvKlOyhrkZ+pocYm8bCLPs7KwHSUe5uYmPnJJ5PgyhXs4zvjD6?=
 =?iso-8859-1?Q?wOPi4IsyPwd5yeNxCSOL/gChC5Dx8FQyNNpHdN1UrFUEA93Kxxy/FfLG3W?=
 =?iso-8859-1?Q?Q0puVgWPF1Xf+rK30TyR2ZHoqQdTv0EdKdeAJf5WS4KFkST6Va776zQ+5w?=
 =?iso-8859-1?Q?7VAVr6LeomxTjGSb07u260Bi4ZeQmTT0sP0Y6OwLW4mfGNrpCbFuyT/3IC?=
 =?iso-8859-1?Q?1YXZqlSecg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: mqTr1neVtAAkUIG380rjJSf6F2JKyLhvJcPKxsGOaOWYj6//buvn2JsNpcirzTDYSw12rtUtF8tVLoDuzRxmVRsX52ymg8ZVEofM8WG4NvsGmCBJzxrCXImp7fVHVzFOYCJPsg9YzTGbEklt4WJ9y1J+S39DiuXuwllCZBZufr9zQ5cpkS/1K/KSC4NaPR71/xXUA+HwP7ezrS6A/kgC5XscLSP4xYsBH1FH5pTU7kguUPSbYa1Mrphir04lWm8ao5CyquiXtx+/STh8vNtobVMxK1Cgqzvjs1UqRTzCXBNizJ/sp+/aauBerRb3MI1B3BGmNbFyRIb1ARbZgsReoA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF7708D4D9D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c8786e-3d56-4486-c0ce-08df0e5db1a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 10:32:48.4411
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BjE0kxq5vcWFBcK80zGVdmpWZiiyv/GwAEtoQERusHIyCO3LNhGuNAr5C/RlF5ddcG8jP3ytKFfRvdkefuYwyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8588
X-OriginatorOrg: intel.com


Hi Sakari,

The binned mode of ov08x40 was verified and already had been used on many p=
rojects of Chrome and Linux.
We didn't verify the binned mode with CVS due to no such device in hand.

@Su, Jimmy, please help to comment if verified with CVS before.

Best Regards
Qingwu

-----Original Message-----
From: Sakari Ailus <sakari.ailus@linux.intel.com>=20
Sent: Tuesday, September 8, 2026 5:42 PM
To: Pierre Pinon <pierre@pinon1.fr>
Cc: Jason Chen <jason.z.chen@intel.com>; Su, Jimmy <jimmy.su@intel.com>; li=
nux-media@vger.kernel.org; Mauro Carvalho Chehab <mchehab@kernel.org>; Hans=
 de Goede <hansg@kernel.org>; linux-kernel@vger.kernel.org; Vadillo, Miguel=
 <miguel.vadillo@intel.com>; Zhang, Qingwu <qingwu.zhang@intel.com>
Subject: Re: [PATCH 2/2] media: i2c: ov08x40: Do not expose the broken 1928=
x1088 binned mode

Hi Pierre,

On Fri, Sep 04, 2026 at 03:46:00PM +0200, Pierre Pinon wrote:
> On IPU7 platforms the 1928x1088 2x2-binned mode does not deliver=20
> usable
> frames: the sensor emits only the first and the last line of each=20
> frame, and the rest of the capture buffer is never written.
>=20
> Measured on a Dell Pro 14 Premium PA14260 (IPU7 + Intel CVS, 2 MIPI=20
> lanes at 1500 Mbps) by instrumenting libcamera's software ISP to=20
> count, for each line of the incoming buffer, how many samples were=20
> left at
> 0xffff:
>=20
>   3856x2176 mode : 2177 of 2177 lines carry data
>   1928x1088 mode :    2 of 1089 lines carry data (the first and the last)

Did you use upstream kernel to test this? There are some hints the CVS coul=
d be the culprit.

What USB and I=B2C devices can be found in the system?

Cc Miguel and Qingwu as well. Qingwu: any idea if the binned mode was ever =
tested and if CVS was involved?

Removing a presumably otherwise working (?) mode seems a bit drastic.

>=20
> The raw samples confirm it. In the working mode they sit in the=20
> expected 10-bit range; in the binned mode everything outside those two=20
> lines is
> 0xffff:
>=20
>   3856x2176 : min=3D59  max=3D81
>   1928x1088 : min=3D261 max=3D65535
>=20
> The consequence is not cosmetic. libcamera's simple pipeline handler=20
> selects the smallest sensor mode that can satisfy the requested=20
> output, so every capture at or below 1928x1088 -- which includes every=20
> resolution a browser asks for over WebRTC -- is routed to this mode=20
> and produces a uniformly saturated image. Requests above that size use=20
> the 3856x2176 mode and work correctly.
>=20
> I could not determine whether the fault lies in the mode's register=20
> list or in how the IPU7 CSI-2 receiver handles it; the register=20
> programming is unchanged since before commit ff1f5010a96a ("media:=20
> ov08x40: Remove common register settings from resolution-specific=20
> table"), which I verified does not drop or alter any register for this=20
> mode. The 4-lane binned mode (1928x1208) could not be exercised on this h=
ardware.
>=20
> Until the cause is understood, stop advertising the mode so that=20
> userspace falls back to the full resolution mode, which works. With=20
> this change a 640x480 capture on the affected machine goes from a=20
> uniform saturated frame to a correctly exposed image.
>=20
> Signed-off-by: Pierre Pinon <pierre@pinon1.fr>
> ---
>  drivers/media/i2c/ov08x40.c | 28 +++++++---------------------
>  1 file changed, 7 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c=20
> index 3de06e19803c..7b10780f25eb 100644
> --- a/drivers/media/i2c/ov08x40.c
> +++ b/drivers/media/i2c/ov08x40.c
> @@ -1318,27 +1318,13 @@ static const struct ov08x40_mode supported_modes[=
] =3D {
>  		.exposure_shift =3D 1,
>  		.exposure_margin =3D OV08X40_EXPOSURE_MAX_MARGIN,
>  	},
> -	{
> -		.width =3D 1928,
> -		.height =3D 1088,
> -		.vts_def =3D OV08X40_VTS_BIN_30FPS,
> -		.vts_min =3D OV08X40_VTS_BIN_30FPS,
> -		.llp =3D 0x960,
> -		.lanes =3D 2,
> -		.reg_list =3D {
> -			.num_of_regs =3D ARRAY_SIZE(mode_1928x1088_regs_1500mbps),
> -			.regs =3D mode_1928x1088_regs_1500mbps,
> -		},
> -		.crop =3D {
> -			.left =3D 0,
> -			.top =3D 120,
> -			.width =3D 3872,
> -			.height =3D 2192,
> -		},
> -		.link_freq_index =3D OV08X40_LINK_FREQ_749MHZ_INDEX,
> -		.exposure_shift =3D 0,
> -		.exposure_margin =3D OV08X40_EXPOSURE_MAX_MARGIN,
> -	},
> +	/*
> +	 * The 1928x1088 binned mode is not exposed: on IPU7 platforms the
> +	 * sensor delivers only the first and last line of each frame in
> +	 * this mode, the rest of the buffer is never written. Measured on a
> +	 * Dell Pro 14 Premium PA14260: 2 valid lines out of 1088, against
> +	 * 2176/2176 in the 3856x2176 mode.
> +	 */
>  };
> =20
>  static const char * const ov08x40_supply_names[] =3D {

--
Regards,

Sakari Ailus
