Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F002D5923;
	Wed, 23 Sep 2026 00:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790122832; cv=fail; b=QaaZWujAM6Qz6gIju39OrnplWq8x1W1jScaah52B5QhVNz54W4QltntcBteLM2DYFQj0YJA3LYrYXZN8n+b5kf0mV7amMe/FNZpensau/l7ZRB6XhMD3Qne4drUlVyKtCWk4G+272hhVTtPTZGnIOFiaOybHQR+bt9cLuhRrxy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790122832; c=relaxed/simple;
	bh=nPPEyjzggSPNkK7zHTx6GLlKPBUN0Ka2F2nFn4beCdQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aiNtzbsEechUEXAMnGpPoikrR6a3hWSuyCXwnh1Lm8yiE8nGoGaOEG2IM0JbSkraML4HgKJZ79hnbCiVCshwljca5x1b90Scy8rdO0dm92b/9VVDrUt/CutWLyZyb/NKf/vgo7CwcZqJ5thpoBPG76019USvMkgMK4+hCWGKPnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U7FLmr91; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U7FLmr91"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790122831; x=1821658831;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nPPEyjzggSPNkK7zHTx6GLlKPBUN0Ka2F2nFn4beCdQ=;
  b=U7FLmr91ziSo/+NSy7hU7xFrtw0/QFhCC3hiARSnB9V590fGUzHd3V+b
   yOw1N5StFLOKMsDT2w6VehUoh5oXvo12n9P5+KgrjdUtS6ETzBuDLXk/A
   gzx9siI5AOW/hV64RLz2xNI0YBVO2DXnJ2FK3Q/FgbKJ8zdyR3PqbhdRA
   PHMm+y3qvNIKSRLkrUmvcxsM1clKjn+cYk+ngMn+zURnqOafccaaGJeCA
   WUufM08Z9+kBX0ccxmJ0jEaM8D4yZCI6h7/602QmtTYO8X3gGcwD/YA6j
   OJp4ogRYJaNC/V59e76WIqbK7JE8snnPawF7Vtw1YWXenJ08JsVGcAc+a
   Q==;
X-CSE-ConnectionGUID: vJcPMr4FQpigWHESGk0B0A==
X-CSE-MsgGUID: TxHuG/jGQ3+4NsPZZxw36A==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90645144"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="90645144"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 17:20:30 -0700
X-CSE-ConnectionGUID: 6E7SFGw9TKO/66JUS2szWw==
X-CSE-MsgGUID: 7FjWWqFNQNSuY/IUa1QJWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="301289772"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 17:20:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 17:20:30 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 17:20:30 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.18) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 17:20:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=crwr/MuLlTXuq0ao7b8W4Tjzfevy74k7ZHjNuLk+1hvbmK0TT9iAH/s/PkKTYhzUJyAbAU2gtS7UIxZscn6Ijwc203TmUl1Tnr94MvFggQN1h9Zy8bTZjDgA9+fo+a1+2Dq5UxqWfByQ/ALsY8ssuSCtcodVJQwLrJ0sERNbbYAGig3j2IruAjaVKb8/yROaZ77FFHmZ/P8hH5kIUbHq/mF/v7IH1IEwQjCYY30+w2q3NNu9IrqTROpGdkS3ypMGsMUf6sIsk5bUpAQytOXvtblAobbvxrnlw5PLAYY37SMO9mHOdORNDzO+xYtvPoeNyJ0A6UVKNHiL63G9akzKZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPPEyjzggSPNkK7zHTx6GLlKPBUN0Ka2F2nFn4beCdQ=;
 b=iNB/wIS5npuADWXkHMg4Ay7Km/GW7eqFVA1hel0/nINqKZdA3DCSfg3oN2K/j9Kn66nZyZoP4C+NY0CeDvgoVGtyxfhe/8c7W0C9/ffsxDaOr3ctThXwCIjRkhKD/kgx9br745H1Z3xSNUoPdNiPar5LG5Y0vx09XoDNfICwvBb8LmDtL1c95MAunyeEYFFtgZWiGc4TaXzE1xdaynqvtHw0uQugIAV+PiqKO/YzW7HAHVDzO7IxPnjozOX1jD8jZz7ido3KWog4U98SJgoMQE7U/Xa9No+5NztNFxF1MuifT0HLbEOqqOOR11TkFPRs1Ss+qxun5Txv4nfEdhMi6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by MW4PR11MB6690.namprd11.prod.outlook.com (2603:10b6:303:1e8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 00:20:27 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 00:20:27 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Bryan Chan <bchimhim15@gmail.com>, Borislav Petkov <bp@alien8.de>, "open
 list:EDAC-SKYLAKE" <linux-edac@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
CC: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] EDAC/skx_base: Fix ambiguous bitwise and logical operator
 style
Thread-Topic: [PATCH] EDAC/skx_base: Fix ambiguous bitwise and logical
 operator style
Thread-Index: AQHdSujOtwSXUd3zgkSv5v7UR9c8LbbbTDow
Date: Wed, 23 Sep 2026 00:20:27 +0000
Message-ID: <SJ1PR11MB6083B6CEC6BA730C18AD450FFC822@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20260922231854.108188-1-bchimhim15@gmail.com>
In-Reply-To: <20260922231854.108188-1-bchimhim15@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|MW4PR11MB6690:EE_
x-ms-office365-filtering-correlation-id: d1fbc337-28dd-434b-5008-08df190877e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|11063799006|10067099003|22082099003|18002099003|56012099006|38070700021;
x-microsoft-antispam-message-info: XWyUIcCBYS1u+N3rS0lbxWvYo1VaMlKiuHCgCKdFPWwwrKcX4eBigsAJDWQDRux9U1Dcnwdapc3MYZbbjY7a+2wS9gcBhyg4WxnBeOkYKWn1SRWghxRPDxGe4KdDnICwsnE7vWmJb0VY8D0YU8CNHu+Eo9xETkVb1BWhId+fBYGbLY8rDgMFXkp1TNt/f4RWvc7VDodqRQ6VH1CmO1N6xaJ5CnExfoIiyjxfKqVEET2WQYXDROCA2iISbHpC55+ttQ3ZmWQja7v9huP558Ns2pVUlhHITLvFIC4IfTBLrjMpxIRU3+PH9wL/R8kN9GyMELqYN+4UYG/66m1/0gQfWyRmuBttaTN4MSSSvYsSdPVeIFPVkXLuFjgGcnHUuMkuQLmQmzqJj13TPIaTJsZeFJq0RIdFhBfaPVssjMn1aBVNunVt8LKBEWoXi1KTIZgJnr4q3nt9Ipr+0A0wyCv4IXty9gynjM0MWQXoTCMIoIzc7qsE75HX3pnUBQjB6yXn3R2PnF0LrdkvVaD94nKf23sRlN3YOC3qd2444LuS1MK1YyLQsQVZfjbt4U6jsP4UCCSFXcuGWqKaMIKzE+m52tcS7amO2RBXGtRc0e4gYDwjINVBfEvzkihfj9rdFkjaGiybc7h31hp/3qJnkB9yAtHDlkaBa/AhOiSGMov8gyIfsA7EVOB8+/4tsDEzse1GhQGyXZvj+4dq5IcoAoUw2es9zQ3JWNkPjj8HnkT4ky4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(10067099003)(22082099003)(18002099003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2/lZiD03vtLzzwmlDFX1jc4ps/Snzw+lPFAVqLE1ZJPozK7xFRqogwsURWLt?=
 =?us-ascii?Q?eBWFjeBBGc96mknfQh/k/vL0F8Yb+OIhumIv6OLDdv1z/m043Z21Jd5kEFA5?=
 =?us-ascii?Q?BTz9dafFDDGD3cz9cGx9nENMiAdXHTuSctLQFmzYBGKUtd6AhDB7FkHnFS5l?=
 =?us-ascii?Q?P7icWtm+Br934VpA6di77b6DoUuE+se9ri0WMN+T1Hyh1M5Wvql1KGzuVx6l?=
 =?us-ascii?Q?psXXnUYVzXh5bbxkv+rtfsSzfJo0Vh9rNIY07GrFR6onp9YbVEzuIvZLCccl?=
 =?us-ascii?Q?zNNpLrj4NFI5+bJvcxOkvt+JfUK4ygzd5zifSQXkD8s4vYwpJCtEmjJE1hZf?=
 =?us-ascii?Q?kqUArfjn6vu/sweOUbHLIes2GQ7NZi7kSx7lOzM3VndY1G/yKhimgnR+Flyq?=
 =?us-ascii?Q?9ay+JB0o7L6IwqnMvdoKsaFOcBxfAtbqjmzbJxVeoF4QL8Hmdj6LvxEU1ke9?=
 =?us-ascii?Q?pdi9HmU9VkX+AnVH8Bu/KT2gQ9qULf8pUKO4ND2Qn8GV2xs3PfgKgdiA4iCM?=
 =?us-ascii?Q?cgr8cWGN+bV9rv4FaUqq+RzWMimpZgjOcHq8ecL7lG1Zlf9WdoM+uSUqrkzv?=
 =?us-ascii?Q?ZaHgM3tZaA8KsG2izu+Ek9LN5xzo6/MqM5ZaKa5APaLOvJnIBJdfuLwlzrie?=
 =?us-ascii?Q?J5KBfPK5ebwdcRgKMjtKbDb9kVZuRyuVTJyq7PiqP5TT2gF9FSI/WU2ZMK8z?=
 =?us-ascii?Q?Jbfd38j/KfeGCmmRl+EMR1fBZGajDwfr3OuzUtbt8FNSHc8J7rN4we8GRye6?=
 =?us-ascii?Q?mKIb8Qv+y10PrYXzqYzdb/cGrlUco4JMhtSEYN9NmSVJgc5EPYrKteSfX3Vl?=
 =?us-ascii?Q?tu+x1VN7OVQfn1bMtOlBMn/0ta6hyTJ1SkNNTdG7TtI/lfSrW1QwRnOmdIW1?=
 =?us-ascii?Q?H9E7njNpfPFMrCFVeaDuIeGOc4u9tWB/hoCB43ssgaVVMmgSrDZnsrRJfQi8?=
 =?us-ascii?Q?B4Ysbs9pV9mS9/gkcH+wvoEuxrzYWadbBgub3d6uGhKdA+4Twe+q1BkbFT36?=
 =?us-ascii?Q?75NOJFexhEHivI9+9Gp5G1RncTEhKYSd3vf+sgrwpkeuW1HkEJHCWR6A6tDY?=
 =?us-ascii?Q?lOZp5U/Y7dBnQIdjheMGNuGPgOEfK3PCdlsOgZKMsfX6n2wkgRUFv4p+BIa1?=
 =?us-ascii?Q?+rdiX+H3KrvURjTRTvBsGPRu6k1MP7KE9h0dXCsU4Ot32uy5jpt3U0QSvqQD?=
 =?us-ascii?Q?PZE6cftXKghvC2PDtV/IJ47Q7GmrQU1Knkrf3O3r6Z1QNvQPpi1KI+Lcl4Oz?=
 =?us-ascii?Q?Xgd35WrIV/x5OxQIAv4qvZEgHfbwBHxSNNKSx+Z4LrW7rYW1wFY7w2wLvZck?=
 =?us-ascii?Q?rMBaXLYNTTmraWaP8sNB042AhDMx0oujLO1+GSnaqggTLyHRkc108YlP6wGq?=
 =?us-ascii?Q?9QTsQoxi00dWnS8dpEXJ5Izgysyypq7Dsy43eDBU20+0Tgjh5LjtKD/FHSVE?=
 =?us-ascii?Q?DZqsVu/hSopIhQK4lkiyfFs/NRN6IQZYFARDT21AjjeJSU5OT5xtzImBtG4x?=
 =?us-ascii?Q?OvXMVL4HTnlyGcBL6o9lpYxrWwQk9WO8CKoTKMHlJSjtZh5yT2E+8KeNz3SV?=
 =?us-ascii?Q?3pgAdhf8bT/bQFtoClQfAsTKdpco/juQmJlRgM0nyzNyLenDakM1SfYhUxrB?=
 =?us-ascii?Q?XCZSEAfwtnkdauy0VTaml6efc3jdCR3ccydyhKxEnOWZs1Ht3hg28LDpYI4m?=
 =?us-ascii?Q?SX335oaPQrLLnoll8frumI3+E9T5cOvkdm0zfRNokquA6L6j?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lIE7sTUu1wcRZxMHEk6kVNJvPjmFLg7H6EnC/Rv/VWE4ZsNGf3kRrcpzjD1s962fB6zjqOI6ymkRXmUsNWXu6lTL4uOMs5ElNjNYJrwHXxtfQevGdXHgnPMo6et0xIampkoBZLXzdLtw7oxFF1kVBSLfksTCRwO8ufz+0gs4Oxt/QcEJ6y9zo2ByAmTuzYgR8NyNy4R6l75aMaY/GUObguuSgD0NyqJim1T10Io/uk6hGP87wxS6xI/amlXvlQJyHBnYb3rLBBiY357TMDzCEOGc8wUMs7iJ9/ZmYtBfvTV7jvuoXHBJwpgnZwo9bRw6K0rzULaVPtFxA/mRb2IrIA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1fbc337-28dd-434b-5008-08df190877e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 00:20:27.1145
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qxE4/Z7B0pRe35TDic55xVpBG97So4qNi6ste5jpEtXocURO4vX9dlh/eO7HYO4eHsqYXLYkC1tvhIVMOcOBDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6690
X-OriginatorOrg: intel.com

> The code works fine and works how it should be, the fix is just for
> uniformity/consistency of the bitwise operations. Also fix the compiler
> warning.

Details? I don't see a warning with gcc 14.3.1

Which compiler, version, and any relevant compiler flags.

What is the warning message?

-Tony
