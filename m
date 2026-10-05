Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F992F691D
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 19:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791229203; cv=fail; b=M8+5C4hsInybdHCvzPXc2CLoUmvxt9DpiyyvQlYy4sJgI4uHxEN+bK+17VDNxUfrr6mdRLBIdHzJotGfgl7jwGGkMVA4su9npa19yACmDUYSQHr19h63aa+lLq/eF1zPY78evjztFGmZMVt4reZ8XG2rqxIzehBOdqcKvvAZ/FY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791229203; c=relaxed/simple;
	bh=DHkkp097pSsu2ceQTUH6KoAY5g+jiw7n8QvQ9a0cktk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dB2sTV1wbJjlB6u31Dr43Fx/INU7CqKSsxhRI7ageUhQ9EY7WKLxYpQP+7sDC2tNnSwldhfJvZUdy0cqvh9AMghCyeu05XfpPlx1w6zbYyGlTLrMlufEpgOIIXd4fzCEERCpSSFqnsX0DQN1FcbdwTtsA6cBtU5kx4GmmHSQEyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WiV3sBpf; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WiV3sBpf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791229200; x=1822765200;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DHkkp097pSsu2ceQTUH6KoAY5g+jiw7n8QvQ9a0cktk=;
  b=WiV3sBpfAQ3+Un9eY19kIVVbKgmjC9Zs+R7Jiq97QZuJt6S37rsZ2DuQ
   CAU3bqvvehzdCaQONRsonbf9+v1wmmLkKvn168tWsXXl5n3oSNwdtELNI
   NgEOW1KTyyoiPla9TdCJnmlziGjyqhsz1n7vwZKMaXoT0BlrXdFO91ulO
   Q5yfGysf0MQ+p+8eznj0+FYzKuDTG4dljdZDeQ/80+i2oSmxkPMIvuJ3J
   IoNm9qnattUMeGU0EVcTzU2Y4fsW6PmUIahNJoiZ1iKxKlp+6Q9SD5N68
   UMr5L3miU3ASuSXhW4n2/z40cYFH3vE+SfFLWmVNDpSuwgJl8pYim1ev7
   A==;
X-CSE-ConnectionGUID: CXSzCe8ET1ufpwkEOhL4+Q==
X-CSE-MsgGUID: +KvYPl+sSr6dLdkK09sPNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="92020199"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="92020199"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 12:40:00 -0700
X-CSE-ConnectionGUID: 8Zfd+XXuQICaBGhuTwTTRg==
X-CSE-MsgGUID: aBEqX+49T/W1M7M7I2O6ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="280641260"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 12:39:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 12:39:59 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 12:39:59 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.57) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 12:39:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ot2bwmVaMHi2POP5lPBIzXP19dOMGb2xuYWlfFS/gljFo9/a69DXZwswY2jKjwKv2h5Yj268CmAtkCqB/n7j8HmsDnMloepBLu/I4SwHHqrL6i8VBZ5amlvTKVq2QHTG10uV2xynOLhiQaI/M8bDVuFCb1/3ZBzi4cm7MjghKE+6BoV9CVcfV7PN1LuYM8xSB26HPGokDd3Ge6EQ4pAM1b1ks/VEgxEcCp+0OaSw7rcZsq4lhVeoNOjmNr0FlNUUfHzm6X6WiQNC2hM2oTyhuL2tiPwVFg3PJSzi/CvpRt/pssPkRROe5fNmR7dcYyv9aQsCKRVBNQnG3Rj7bKMvOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L+Wt2/8QjF6GKX6bqfHEApo9NoAXkzgnE4zMEQdryzE=;
 b=LsEsjq0hMl2WxLpOOu8pJW256LAWqe9JVf/jBzv3lYCtab+0wcx7AQpq52p5mAWVmfnvh8uR7ons0FdG/US8CG1Wwrlp/RssNqmSMCPs1n9rMPgSYl2COUdnWqd3hnEonotv8giolfJiGF2FE2f9KybagrmmZThhSNASuU4WP9ZH/ZMrME7a9QMDo9YMVUVsYuG7uKxhcLcPftCuvwkru7B4zaFnj4sC33eZZvxRCW3DBo8RD2Z9v4BPjfA+qj6Z5JD1RtOZt4U4unfIoMODiKSD530uuD84rZGkG0cNnw9ljRFLdVUmpaE6KQHgPeUxhRQIB9uywBlRc9rD5PkEyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV1PR11MB8790.namprd11.prod.outlook.com (2603:10b6:408:2b1::16)
 by MN0PR11MB6206.namprd11.prod.outlook.com (2603:10b6:208:3c6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Mon, 5 Oct
 2026 19:39:38 +0000
Received: from LV1PR11MB8790.namprd11.prod.outlook.com
 ([fe80::27cb:7a60:19bb:584a]) by LV1PR11MB8790.namprd11.prod.outlook.com
 ([fe80::27cb:7a60:19bb:584a%5]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 19:39:38 +0000
From: "Nowlin, Alexander" <alexander.nowlin@intel.com>
To: rivaldihormat-debug <rivaldihormat@gmail.com>,
	"intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Loktionov,
 Aleksandr" <aleksandr.loktionov@intel.com>
Subject: RE: [PATCH] i40e: fix integer overflow in i40e_dbg_command_write()
Thread-Topic: [PATCH] i40e: fix integer overflow in i40e_dbg_command_write()
Thread-Index: AQHdP6htoeoT3XPthU+6WJelXhDr07bvgwzA
Date: Mon, 5 Oct 2026 19:39:37 +0000
Message-ID: <LV1PR11MB8790E916B2F0478BA43F677390962@LV1PR11MB8790.namprd11.prod.outlook.com>
References: <20260908153933.2417-1-rivaldihormat@gmail.com>
In-Reply-To: <20260908153933.2417-1-rivaldihormat@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV1PR11MB8790:EE_|MN0PR11MB6206:EE_
x-ms-office365-filtering-correlation-id: 22119cb5-eaaf-4ca4-a1d0-08df23186466
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|6133799003|22082099003|18002099003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info: gj7XvnsT7oZMK9ZHQ4FMinU6RUX9Bu2ROwHWHDQDAxPB4RNrOgnYLvXAHU9kpKOtmRx8YJRcOOq3FyPo5KMYzohSz1ZZG+MY52LGI2CPw+YZfIPGabp8hsd6gIg1aFiQ06kd2pQYKbTXqTXGO4sspRKhzgwBsRA0OsnKh3P++hV4iPPzKFfpmswhS2CvB7PMmxP8akYN3+4ia0jzOgFNbR7GddCRHbuVof5SL6jTJ26LQd23X0bIvXQnC/fhVRBqcz2Y2C3gED890cyB4WqsthNF04+yJbO6/pFi/vJliIWfR/Ylyrtj5lLbVKz7d794b6NSDTe5SpaQjnzT7WEDluRFKm9RdzZ5e52bcnQBQ8xcmCwAh6guXhWFajQLXe6bZwFh6NXiHLYXVcWCY2qqUf4Ait9OF1CWzzGFudI9X8W3O3CxV4PAI3k69ylOx3C0vPjJoV4sJDArOxF9UpiWFbc33RIxSpwht2MEDv96QYg8/Lp7Z0JROU2qCdkdxYHkefWkouM0+f2qvab+Wpl3N5DmBxGIQRb8zCiWlJ3rZI1A2L/E05QUVjXptyCkGN9ZxfcxIuNedsSdFcFgzCZ/T9eD7DZXg44l6Xc0viwEugLU2SkQpm48FrCsWL+Kcs6Du7t+hi8vbJOET08SfBZaEhmxZhbDfNbSR2vC4kcJGPk7nqhpRv2vhLKu9zmsbr41F/nrEfFSck8dZIRTUciV7xlliAd4nOTYsM8DgoOuc5c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV1PR11MB8790.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ERVHQFHBHxgbcz/ARBjNpQKF0fLsKoozz4i0LCqLnnvBVu77JliU+/u9dr+K?=
 =?us-ascii?Q?zmHg4hPijCC+IDG3X2ewOBAmLqFqZkxy/QPbohOWdyL+ZctwoHd/ZcaDzNFv?=
 =?us-ascii?Q?tu4586w4EufbAZ4yXJfQoWEr2DcxTbcgBJVNvas265DbJ+2ECV/Ku42F+xnc?=
 =?us-ascii?Q?iHKGTz6gCPZXdf0De4KfnUtIEOI2/sHKJNCmVB03GvkbBzpgm/Shu/4Q1pyG?=
 =?us-ascii?Q?SLOyDixIZ3vsmOCHUZzVHYPN2fArcoz0XFXS54IWRmpcTgJD9fcSY6n56yFR?=
 =?us-ascii?Q?mcz8F/cTrtI0yL7x5a+jOO0YqsOTHD1eqaospLpToqDLhgef/+CzZQ3OPsnp?=
 =?us-ascii?Q?Y7pgnLQ9JIbtVn315nwKIphM3mPE+J5bQtVFnZIY539MUJ4jCRfACvW7ssux?=
 =?us-ascii?Q?LldQrZza3rfCQjpua3K+RbeqF8O/2WVi2JDzTWIYX6gZOm0LC4P25Ms8q1zA?=
 =?us-ascii?Q?MXwEibytbUQ4hdLg0X4tThsztITY+fu1LQVbXBCctoptaB8PdoRzTIDcNQ8J?=
 =?us-ascii?Q?ZjslgnYff3v/8rkK1VWSW49X4EZtbT9lAHFUaP+1h1FBRoFZp2YQKfY1NwI+?=
 =?us-ascii?Q?W8ZU/K7tpWnvUARGt3AkKpFctE2DNgOwfEHaqGHg9Up+qnqrp8+nLcRcFA4R?=
 =?us-ascii?Q?LZGsglfEuQVJ4QBJW/Oyy28tMANWZY3+8NpJXM/VidJy/rfd732KZLejDbhB?=
 =?us-ascii?Q?0XRQY0V85E9y0xDUmoni2Qg0a6et5jAJT7cuhQvpRXAtFCRdGyc6ILO5qfD5?=
 =?us-ascii?Q?EcWdUJyNdzxT+WckL+hCLBAOcINJXk9LGD3ZszXmsDxJ6JzOc+XRSCIsCeOq?=
 =?us-ascii?Q?gwyDgscFTjvInnGASQW9Wmfi7dubP3exwxU8H7kMpq/E3IphbJ9Lkq2Vivss?=
 =?us-ascii?Q?45R2l+X5Mtt1/5CFeNb8mMlqShtT1RH4KmZz8yE3Uv2OncKrstuoE25ehyJA?=
 =?us-ascii?Q?BFBRAJCuO3Vz1rSEcnMlVjDf+vOZN/GGvlqT08WA14vc0DkqFkwkm/Z88tnh?=
 =?us-ascii?Q?bhmJOjbg+jKIrtoADP/NSNZCuERE7B4b8a0lOkRYQ2PKnIdVlqsiDanPk1M/?=
 =?us-ascii?Q?ezgfK9KGmDutSv+bd1hBbviFVkD/HzPQzMt/XeRQgMppN5+igvzym1W4CLD7?=
 =?us-ascii?Q?FdFCJetE30fFPITozg3Y7QYmeoCchNaWMlVBW6SYdwQ/AD/X8GLjfyx4Ezjs?=
 =?us-ascii?Q?epCQgiNrR6q4Hm8DRuRzDvLQIm6l4jWtYB88BAG1fhiAGGU68huP2mczkwkG?=
 =?us-ascii?Q?N3QmVEeNBXqHEhEVgaVf4CzuocT7OBJZetARxhy5n5ywW+Vb80D0Di3Vh9Su?=
 =?us-ascii?Q?gWg5l4i/pvnx28yZSM6x9hqIvld7d8/0l9bHD3jGB8FjZ3S4mkZl3zcENTcg?=
 =?us-ascii?Q?afW6fHiHGPABE3jnkT1I4PDEkjIoiLa/YP+C2JRaU67GASdq1CDh4VrpETh2?=
 =?us-ascii?Q?jsYcq4CZLqjFg3BIwoqNUxBJk6HYRj3ZsRwvvMmiyYumLZ3DZ/RrZeMXIyCG?=
 =?us-ascii?Q?WfHAbfn1smcRhopK6tprWJEEMs1bg2hWyALB4AbN7EKEJd29PeRVT8fNePTf?=
 =?us-ascii?Q?00StDCBDDTTrGrFEUJMgzCkocjEUMPL0IS0IBGwQ3LYWp8bWHTcmexJJjjEn?=
 =?us-ascii?Q?+VgBqAIghdVfg2jFxdMZAH+PxKRL+JNwZfh2WDYr3cmT265otq6Z/YSCZKwP?=
 =?us-ascii?Q?KWtkuEf5csZ/rkFhYUsFKSFsN6PUKBUA3mcw6+j20TPnyzAiZJyEpfaHQAnd?=
 =?us-ascii?Q?u9/UxVNZsg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: BsmF8AIdXUZtvmQZJWGZWLx40yzOZKs9R/jwBdUJ62Q5GNGqs2sQAA2X13pGgKwmwa5WSwTRGy1/zjgR2Y8lLj3LL/BBM+0GQOF9B5AX3GM07opBQshNY/OauIshvZZaX9keKns1EoCQIZlIgaTWJd7dQV3cJRYAgmZRZP6NF11bIVaVtBWfD03WpxytGytIQuL1nQVfeZPQxgr1KI/wK6M8qf4A0e0B9cKj7E3shMZcM819Q7gUHPaQyxLTjorgFPycou6qiWrSeSWNWLF3zlr6G2FeK+WN9XJiTWcTLdV+jTbbzGfqPlsjkcZ8cf9e/D8Y9h9TrIbUAZ8JHQCTdw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV1PR11MB8790.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22119cb5-eaaf-4ca4-a1d0-08df23186466
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 19:39:38.0204
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UEumPuMMMjgtH2OX9v2XbannqSTipN1SEXdxkR663GZ6TJt66cXznF2kc+gaYFZOcK4AnHb8wZ4yiv/FSPQKaFbAObiPyU/muPGeB9X6ljo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6206
X-OriginatorOrg: intel.com

> -----Original Message-----
> From: rivaldihormat-debug <rivaldihormat@gmail.com>=20
> Sent: Tuesday, September 8, 2026 8:40 AM
> To: intel-wired-lan@lists.osuosl.org
> Cc: linux-kernel@vger.kernel.org; Loktionov, Aleksandr <aleksandr.loktion=
ov@intel.com>; rivaldihormat-debug <rivaldihormat@gmail.com>
> Subject: [PATCH] i40e: fix integer overflow in i40e_dbg_command_write()
>=20
> The i40e_dbg_command_write() function uses 'count' from user space in kza=
lloc(count + 1) without validation. If count =3D 0xFFFFFFFF, integer overfl=
ow occurs.
>=20
> An attacker or local user could trigger a buffer overflow or integer over=
flow by writing large amounts of data to the debugfs file.
>=20
> Fix by adding validation:
> if (count =3D=3D 0 || count > PAGE_SIZE) return -EINVAL.
>=20
> PAGE_SIZE is chosen as a common limit for debugfs writes to prevent exces=
sive stack/heap allocation.
>=20
> Signed-off-by: Rifaldi Hormat <rivaldihormat@gmail.com>
> ---
>  drivers/net/ethernet/intel/i40e/i40e_debugfs.c | 4 ++++
>  1 file changed, 4 insertions(+)

Tested-by: Alexander Nowlin <alexander.nowlin@intel.com>
