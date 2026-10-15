Received: from fra-out-001.esa.eu-central-1.outbound.mail-perimeter.amazon.com (fra-out-001.esa.eu-central-1.outbound.mail-perimeter.amazon.com [18.156.205.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5314FECD9
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.156.205.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083549; cv=fail; b=tKd/wJtkvqhoKinaJhcRgvXCqyV8FQoyO7/Lpn2+YymZV8xjcqBk7IntyInc35tym6kJDamq8l5RREJSDUORm/hdJk/uSAd64cRf9Ey+pCSPzEPB+3Tsaa02i0E9dE7UMbc4ARmBFzeV2ReulokQ21+vV6jrpaZxmZZKCwajRm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083549; c=relaxed/simple;
	bh=aYbkgptoi2eT18uIcoHYh6RtX0eZFsrP22pouNri1jk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rfCfxR1EKIil5D4THkXRU0oyYQlwLQLa1/zlQ4FXMT0SyO5H2Xq+gqjjTnl+Im3/a5GFMEXgePgpHYtUlFYfdk3rtXRpC3ccM+3p97KFpH+kfcrF9C+GbVYzKoDGoi0b6fP2EhUM5bcuG1pHUyeHdU/yxwxy/Kiikz2wvOkt6wI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b=kS5QFVEv; arc=fail smtp.client-ip=18.156.205.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b="kS5QFVEv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1792083535; x=1823619535;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=aYbkgptoi2eT18uIcoHYh6RtX0eZFsrP22pouNri1jk=;
  b=kS5QFVEv2M+cbWtJig8j9my1hOYGTC20+7uXA/sMT2jJQyc2CxB95Fc6
   sNQv6iV4xV2Js/3B4seg4gEIZDcy2hbq6AoBsGytCxlg6HvsiiwhHKraj
   JAtknmqqcxmPQQzYfrP53Nr5AsyKy2BYc3z5ez6M2a2JquZtSrRIDan1V
   0dAQq7DSthUUormdeTtGYrhjpuDhP2e/FLWQEeXweAIYNO7q57NiOPKQa
   Y6hNEbVsmVpnS0XxxWgZIvdX9xI5xkTFaamAWhZKYliJOQnzuUD39/+hl
   hWeNFyffh4f99pjMHr+P+qr2lhJsqVZIBPIZ+KDZTsVA2oXH9jNmPjV/W
   w==;
X-CSE-ConnectionGUID: Ps4EClfDRneKqWHkn174Vw==
X-CSE-MsgGUID: eeqvWBEhT6S5wIRmCTHJ4A==
X-IronPort-AV: E=Sophos;i="6.27,160,1787011200"; 
   d="scan'208";a="20913528"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
  by internal-fra-out-001.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 16:58:50 +0000
Received: from EX19MTAEUB001.ant.amazon.com [54.240.197.234:12325]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.5.86:2525] with esmtp (Farcaster)
 id 44f160eb-98a0-44e2-99bc-b89d61dc6bf8; Thu, 15 Oct 2026 16:58:50 +0000 (UTC)
X-Farcaster-Flow-ID: 44f160eb-98a0-44e2-99bc-b89d61dc6bf8
Received: from EX19EXOEUC002.ant.amazon.com (10.252.51.145) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53;
 Thu, 15 Oct 2026 16:58:50 +0000
Received: from BEUP281CU002.outbound.protection.outlook.com (10.252.50.44) by
 EX19EXOEUC002.ant.amazon.com (10.252.51.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53
 via Frontend Transport; Thu, 15 Oct 2026 16:58:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnUap2NC7JTCVMRhg01NWE5cMoBoKNb33URI/ETDOVZZJDbStsmlQ+Rnojz8oAWyUW9SyGLbo9NHoEiv6EgtDhpArFRp4NtFr1jV+ZHtvJYapGQBhDl2fRFq+Ez/8VUvsfBQhvsbgunZ7DEv0ykRwQ4+37RwbbmAj8tDRcaNZDyYdhHuMSyZZ5kwu+tONwspDvLN9CFPZ8hniF3I5Gv8q/6/aSvxNxhmpqle9BF6w04A5+/2a+MgP+dvmGBSAwsTnez+381e82+ibxIVOOzkbN0Us4f2Sndnm5okQecOu3j+HaKWT9b17livRquU83JKL/o1vcHy3v89w/R60dVmvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYbkgptoi2eT18uIcoHYh6RtX0eZFsrP22pouNri1jk=;
 b=QjkOB00ebgd9mwM7PkeRdZ52l1AfNmReiVI49/Rv4j/SM/IkvYJ5gpBSpBr8f0l3xsgx5UWRgQSkUAaFLZ5ZS7YGLGwtoJlFW7BUm82RWae4E3z8l+VrIm7+w+AbQfIwYCbAIAPLn/yv4T2ekpQ1DujzW2nd3v5W6B2DeYjmpuEtMtezNdZyOuJso51wAAS343I6QcMT5x1O9/M0s33ofMZyv3RkvEr5gmmA83pmSyuMDYgODzHLtl2YAQNpQH5mEUnmAvOb8adwQT7CcZx8HNwzrMpbbqxmfdRNaRh9y9vKPI6UwrvOrsyKFjPQlAeyqTreNu266CLle3rR0xIdiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.de; dmarc=pass action=none header.from=amazon.de;
 dkim=pass header.d=amazon.de; arc=none
Received: from FRVP281MB744463.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:20d::13) by BE1P281MB2838.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:4e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 16:58:46 +0000
Received: from FRVP281MB744463.DEUP281.PROD.OUTLOOK.COM
 ([fe80::7b1c:7a5d:c405:6c4d]) by FRVP281MB744463.DEUP281.PROD.OUTLOOK.COM
 ([fe80::7b1c:7a5d:c405:6c4d%5]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 16:58:46 +0000
From: "Graf (AWS), Alexander" <graf@amazon.de>
To: Reinette Chatre <reinette.chatre@intel.com>, Tony Luck
	<tony.luck@intel.com>
CC: Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
	"Babu Moger" <babu.moger@amd.com>, Thomas Gleixner <tglx@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>,
	"x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "nh-open-source@amazon.com"
	<nh-open-source@amazon.com>, "Elshahed, Ibrahim" <lshahed@amazon.de>, "Wise,
 Jasper" <jaspwise@amazon.co.uk>
Subject: Re: [PATCH] x86/resctrl: Require force for L3 CAT on early Skylake-X
Thread-Topic: [PATCH] x86/resctrl: Require force for L3 CAT on early Skylake-X
Thread-Index: AQHdW7dnEJsiUg12FECD2RKP4xyCS7b9gh6AgAFTUgA=
Date: Thu, 15 Oct 2026 16:58:46 +0000
Message-ID: <841a8030-f639-423e-9bd4-c4d4566450d2@amazon.com>
References: <20261014083637.65430-1-graf@amazon.com>
 <4bc68d06-a45f-45cc-80a4-f72806d5c976@intel.com>
In-Reply-To: <4bc68d06-a45f-45cc-80a4-f72806d5c976@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FRVP281MB744463:EE_|BE1P281MB2838:EE_
x-ms-office365-filtering-correlation-id: be1a490e-0b30-477b-df86-08df2add938f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|366016|1800799024|22082099003|18002099003|10067099003|11063799006|4143699003|38070700021|56012099006;
x-microsoft-antispam-message-info: wH9K+CnPC4R7oyRsRMyqnQN/x8zsJv6YeaWgufoRKPgzRMR+6OJaZ/GqZT6gPCGGN2FXIy7iO13RWiPPgYB18TTEkj3GKWKCdxO5MFHQInvPtVpaPtCK15bUKjfJ+4uRTBNvfCBthO+4WWxWg589eunIW078z9x/BT6KmROTFvo0Pwcki+s7zPZAvD3JGgh0JfEf5XXV9GU1ulagZcwMMPiuoxa1Dtr8XqKc6SM0Hov8rqrauktXO5YiyPSfO8kcbbui3fBzI+hsed9WqgFI8YAZYHC2hd3KZZWjvbrwgeqeaZ5oIxvmWpF+nS/4KD7VnawcZ6TjBShgegPqG5LHD8oKADKijxqvqAcejEiyiL8My5aGIIoXdilw6hjoQcaKATL+6MloUiwqgfnp8ywnJ29xio+6P2UORl2OoaBlUFAhhn42Eadw8x0zFXE1zZ989op8HlZz9shX6iMI31rqlgGkWjMdZTXN1H2IKntvNOXZm0c1aVXrP2YJl5IaLD6O5ZGt7Ps2ipe7kgzZMdyrhY24gftTpqa+EL2nj5lsWsT36uteD9uZtEANW+8StlBj53GInMylyee+JnePByGU5AVUmwdDVpHlwJk1Z3t0Ti7CemLsPtAhN6XvBAicVfHxjZVmi3lWWN5YAkLJsmOXeFu8mb5SCA4CScCrBADI36Nng3Krkjik4/PhsaoHzCoAlqTaEAT3SP8xXTf++jc1OTy4SveCJB+Fs79LZeW2DRI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRVP281MB744463.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(366016)(1800799024)(22082099003)(18002099003)(10067099003)(11063799006)(4143699003)(38070700021)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGdSc1d6S00zeWJwNHNlTUdFaXJJN2V4Q3NZZkdadEdidGhnOWEzVUlvRGpL?=
 =?utf-8?B?K0pUNlpGdTFkdUNqZEwzMlRTdXp5bkFlK1VNU2MrS1JneDBjM0Q1a2MxMGdi?=
 =?utf-8?B?MVdDRzJodTVGcVE0V2hGaVVzMFYyVnBIOUFYVVZFTDlPMlh3ZGRkejVjRUxu?=
 =?utf-8?B?aFphK0k2WW1oZHBLREhTWkpYUHE3RitPMThUWWpvdEczNFhGd0Y1MWFyWXpj?=
 =?utf-8?B?d1BJMnpscDliREJLSUIxTW8wRk5IZjllTndTTlJRQWlOTWQ1MHF6U1ZOSE1t?=
 =?utf-8?B?MzVHZEU3WlpNRWdnaXEyU2t4Sk1UTjFVMUxlbkV6UmNrQ01VTlJ0Qy84NUkw?=
 =?utf-8?B?UW9MUDgvanVQV1Y5Y1h3N2tidEF1a0t0WWtDUGZpK1FzMHZmMWV5RTYvdlpB?=
 =?utf-8?B?c0hOYXN1L25CdWc2Rkg0bEs5aUo0eDQxaitBdExRdXNsYXo1T3pGZjAxNGFF?=
 =?utf-8?B?Y3QzcUxzUm5nZW1qSW5vRjJBeENmSEorSzZiNFA1K3Z6dFlnL0pRY2M3NEtI?=
 =?utf-8?B?OHc2QUl2NjNTejBkeDI3aHI0SHJ0SFFFVFhjSE9SZDFoT1BXaEZHVXlQa2pK?=
 =?utf-8?B?anZwSVl1QkUxWXBOOERVYWJRcnBEcTNsRDBmVmJOQmxKSmlYeHBPdEhuaURj?=
 =?utf-8?B?TFhBd0VXM2l1eDB3U2YrYlZWTk1DT2ZHN1B2bmx3UllBWWNPMEFXcGVsTjRU?=
 =?utf-8?B?SjI2UUhtdjhhS1FWaFJFdjhvalkyUW90K2FNaUl6ajF5cWJLN0FoN2VWSlhJ?=
 =?utf-8?B?UzI0OVZnOXVLYy9GOENqb3ZQSTdqeFZvVzk3VjBlM2Z6cndacUs5U2s4amF2?=
 =?utf-8?B?Y0paaGE3cEdFbmwyajJhNzR3NE5KL2RrcmJ6UFpwUmxwb21MeHg5QndiRWxW?=
 =?utf-8?B?VyttbkVFUW0rSVFyRWpxb0hWZTFZVEg2dG1GUXk1NXFzK3NxZW5kcldidW0x?=
 =?utf-8?B?Z2dLa25mWkdFb3pOSGxNTzI5UFVRM2pXUUlMZmwvTmRVeXV3RmhXMUozbU1B?=
 =?utf-8?B?QlZCVnd1RUFCWlk3UWRKbWxhRDRmRDh0UWpidW9CcEVIK29oWXgwUjgvZ0wr?=
 =?utf-8?B?WTNzR0lINUtOQ1l5aXNQeEhaN1NTMFRiZWNrZlhOTVlBUmgxMXZMaVlrWFlG?=
 =?utf-8?B?dStXVVErUXZhVmNBbURwRklmRHMwVzhCeFVUaXFBSFNTS3FIRnpWNE43d0dm?=
 =?utf-8?B?L1l2Yk9zQWZtSDZ4Wi9LaHIwdTBsU2Jhd1R5enlsbXpwRk1uK3VqZTVRakU0?=
 =?utf-8?B?bjNZOTJOWi8yZStMVEtJUE5yV0Z5endYdkdjVS9qdnNOUU16akN0UWpqTU5r?=
 =?utf-8?B?OVYxUnF1LzdlT3YwRXBuc1V5aWNYUG9qYWFYRzlTSXNuYXVNbFV4WTZIOGtV?=
 =?utf-8?B?RFF2R05rdVM0QXZPNkR3VzhtUmxiclllOEpNNE54S1o0QVNWN25TeHY3WFhO?=
 =?utf-8?B?L3BDMmlOWXhUTHRoSVNtMGdXUTVkRmxMMmVURDlucW9iNG9rdE9MQ25vVVJa?=
 =?utf-8?B?a1NzbDhXcUhwc0Z5cWxvSzlxYTZ0TTdXTHhRWmYrUTByVlNjd1VERzYwK3A2?=
 =?utf-8?B?NjcwTDhUcUh4WjhZZFJ5TlJsaVNPUDN0ZXZCd1Vud3dpZlpvUHpBVDQ1QmRt?=
 =?utf-8?B?enpwWTEvY3kvaVg4TWhKa1NaOG5lQWVsSHo0T2dlcGg3UjVDWDI3LzFaeE5T?=
 =?utf-8?B?cFJqNTJicmFBNFBEMkl0UU1ueGdTVDBKUVVvR2QvR05mNkJMQnA5ZVM5YjQ4?=
 =?utf-8?B?dlhacE41WTRzeGxNSmViTUZBT1hBK1JsTXN4c3h4M3VXU3ZUNjBaekg1blAv?=
 =?utf-8?B?RGVSYkdaYlRkRnZRMEtLc0dMVDhoRlpxUVY0dll1dFB0UXJDRk4wdU10SjZY?=
 =?utf-8?B?QVNFTGs1Q21PUElyVGlObUFsQ0lCNDN5dGhCZzFpZWtYaXFPclQ5K2w1NHFw?=
 =?utf-8?B?YXhkR1NqeEJsV2FIVTRDbEROZWxZTEIreEJQdndYS3B3NlNTY3l2WlNLbW5a?=
 =?utf-8?B?Y0Y4VmpRc0FzdU11aFh6cmZ3ZUdUZGJDMzFZZEdLTStpVGpzblEvZytYRnB2?=
 =?utf-8?B?YUtsVDZsazBFSkZSc0oxcml3SjNFN1ZpZTlveXBnKzNjN3AyK0hZalg3YjdS?=
 =?utf-8?B?WFFQZTM4VjFYZjU1Z2Q3dlhPUzUzU0pnRlF4TGVWTEhFMFVIcnR1bTZYSGh3?=
 =?utf-8?B?VVdoVlI5K055OW1CNXdQa1U5ZEZicWtHYVAwdFF4NVNORXZSeUd2a2NicGk1?=
 =?utf-8?B?bG5Bd0l5UHgwNFZpeSt3L1h5VUEwOE9SdnhvZEZ6VkRQSk51T2ZLVUdQRkNY?=
 =?utf-8?Q?olOWIanR63ze3v605b?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0ABB8B70AB971418E30A3EF75F8578E@DEUP281.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TYVy7CChn6H9E0+DGJOPbP5UUSsjKRHf18n1ZHTQpOlQMNfN5Aw0HUCKCB7NCl3Z7sNG1jowZmfg64SPt8uSkhkyiCBQvpCXaDTFyEGu75IL6i8MvLPMBv2CLLJ3OpfEqbAufG85SUsXzwFaDRwIeutv+K/bnGOiD0jHw6YHwJwJnDPe0Zu293Z0PtcexicKLMfXWOZtjsrFFpaLzdg4Naj+XWufO25tE4+pL+hKa+NfChpKZeOwxWZSaAEBaPpFfHJ0+jvzhYEV21Pl56Ev46upQqFGWB1Tzgp9sRy6ZmctkzbKoQxKB6MBP3yGnK/JXJCxtb3/54/XYHSFSmyuAA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FRVP281MB744463.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: be1a490e-0b30-477b-df86-08df2add938f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 16:58:46.1096
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /SNrnQSHXFX1w+abAr96NI3j+5CcVyZCQJQkrK8EVUywyOwqZXi4TE67QfIRHt2Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB2838
X-OriginatorOrg: amazon.de

SGkgUmVpbmV0dGUgYW5kIFRvbnksDQoNCk9uIDE0LjEwLjI2IDIyOjQ0LCBSZWluZXR0ZSBDaGF0
cmUgd3JvdGU6DQo+IEhpIEFsZXhhbmRlciwNCj4NCj4gT24gMTAvMTQvMjYgMTozNiBBTSwgQWxl
eGFuZGVyIEdyYWYgd3JvdGU6DQo+PiBXaGVuIEwzIENBVCBnZXRzIGVuYWJsZWQgd2l0aCByZHQ9
bDNjYXQgb24gU2t5bGFrZS1YIHN0ZXBwaW5nIDMsDQo+PiBjb25zZWN1dGl2ZSBrZXhlYyBib290
cyBoYW5nIGZvciBtZSBkdXJpbmcgc2Vjb25kYXJ5IHNvY2tldCBicmluZ3VwLg0KPj4gQ29sZCBi
b290cyBvbiB0aGUgc2FtZSBtYWNoaW5lIHdvcmsuDQo+IEFueSBpbnNpZ2h0IGludG8gd2hlcmUg
dGhlIGhhbmcgb2NjdXJzPw0KPg0KPiBXaGF0IGlzIHN0YXRlIG9mIHJlc2N0cmwgZnMgd2hlbiBr
ZXhlYyBydW5zPyBJcyBpdCBtb3VudGVkICh3aXRoIHdoaWNoIG9wdGlvbnMpPw0KPg0KPiBEb2Vz
IHRoZSBib290IGhhbmcgd2hldGhlciByZXNjdHJsIGZzIGlzIG1vdW50ZWQgb3Igbm90Pw0KPg0K
PiBJZiByZXNjdHJsIGlzIG1vdW50ZWQgYXQgdGltZSBvZiBrZXhlYywgaGFzIGl0IGJlZW4gc2V0
IHVwIHdpdGggZGlmZmVyZW50IGdyb3Vwcz8NCj4gRG9lcyBrZXhlYyB0YXNrIHJ1biBmcm9tIGEg
cGFydGljdWxhciBncm91cD8NCj4gICANCj4gRG9lcyBpdCBtYWtlIGEgZGlmZmVyZW5jZSBpZiBy
ZXNjdHJsIGZzIGlzIHVubW91bnRlZCBiZWZvcmUga2V4ZWM/IEFzIEkgdW5kZXJzdGFuZA0KPiBr
ZXhlYyB0YWtlcyBzeXN0ZW0gZnJvbSByZXNjdHJsIHdpdGhvdXQgZ2l2aW5nIG9wcG9ydHVuaXR5
IHRvIHJlc2V0LiBUaGVyZSBzaG91bGQNCj4gYmUgbm8gYWNjdW11bGF0aW9uIG9mIHN0YXRlIGJ1
dCBzeXN0ZW0gbWF5IGJvb3QgdXAgd2l0aCBzZXR0aW5ncyBsZWZ0IG92ZXIgZnJvbQ0KPiBwcmV2
aW91cyBydW4uIFVubW91bnRpbmcgcmVzY3RybCB3b3VsZCBnaXZlIG9wcG9ydHVuaXR5IHRvIHJl
c2V0IHN0YXRlIHNvIHRoYXQNCj4gbmV3IGtlcm5lbCBjYW4gc3RhcnQgd2l0aCBjbGVhbiBzbGF0
ZS4NCj4NCj4gV2hhdCBkb2VzICJkdXJpbmcgc2Vjb25kYXJ5IHNvY2tldCBicmluZ3VwIiBtZWFu
IGV4YWN0bHk/IEZvciBleGFtcGxlLCBpcw0KPiB0aGUgaGFuZyB3aGVuIGZpcnN0IENQVSBvZiBz
ZWNvbmQgc29ja2V0IGlzIG9ubGluZWQgYW5kIGZvdW5kIHRvIGJlIGhhbmdpbmcNCj4gaW4gdGhl
IHJlc2N0cmwgb25saW5lIGhhbmRsZXI/DQoNCg0KSSByYW4gYSBmZXcgbW9yZSBleHBlcmltZW50
cy4gVGhpcyBzZWVtcyB1bi0gb3IgaWYgYW55dGhpbmcgb25seSBtaWxkbHkgDQpyZWxhdGVkIHRv
IGtleGVjLiBUaGUgcmVhbCBjdWxwcml0IGlzIHRoZSBtaWNyb2NvZGUgdmVyc2lvbi4gSW4gbXkg
DQplbnZpcm9ubWVudCwgd2UgYm9vdCB3aXRoIG9sZGVyIG1pY3JvY29kZSAoMHgxMDAwMTU5KSwg
dGhlbiBob3QgbG9hZCB0aGUgDQpsYXRlc3QgbWljcm9jb2RlICgweDEwMDAxOTEpIGFuZCB0aGVu
IGtleGVjLiBJbiB0aGF0IGZsb3csIGFueSB3cml0ZSB0byANCklBMzJfTDNfUU9TX01BU0tfbiBz
dGFsbHMgdGhlIHNvY2tldCB0aGF0IHdyaXRlIGhhcHBlbnMgb24uIEknbSANCmNvbGxlY3Rpbmcg
YSBiaXQgbW9yZSBkYXRhIC0gaW5jbHVkaW5nIG1pY3JvY29kZSB2ZXJzaW9uIGJpc2VjdHMsIGVh
cmx5IA0KbG9hZCwgZXRjIC0gYW5kIGdpdmUgeW91IGEgZnVsbCBydW5kb3duIHRvbW9ycm93IG9y
IG9uIE1vbmRheSwgZGVwZW5kaW5nIA0Kb24gaG93IHF1aWNrbHkgaXQgZmluaXNoZXMuDQoNCg0K
QWxleA0K
