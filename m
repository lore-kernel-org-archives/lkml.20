Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA8B435A80
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 12:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791291072; cv=fail; b=R8nZ2XxNt319zQlRxqzmoMhT4FXyjvsNQl1k/LLopMBH+sJweXOFI2bSvZDNcgkr3lsGpunAZedZEYJB7n26akZ8qbY9yVvrLRW/wvm9zM9FQWlrmwpww1aFO2dDUA97+c+uHIbPQ0gKJCTjAlyJn9uBycGwyU0W4uGnKDIWYNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791291072; c=relaxed/simple;
	bh=u84mHqv4c+khLDDRF35VaDgHmlmtKa1jYFfPq1tkR40=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=CS1vkFN7jJ5HnckxwBMGf/6+8Vzuw+oqEIs96YSsXmihpEzNGO+SEmI++x6JRQrUD+yQ3x0metgOG5bmQ4XegVIpTze+6n4NgkBTAuK6nhYhVWLEDxeAxzjL0DDRzzm54O3coe47BFE0RaPD7PiHSI6o0WA7QiB9kuCqNVYxGQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ebZDkaqo; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebZDkaqo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791291068; x=1822827068;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=u84mHqv4c+khLDDRF35VaDgHmlmtKa1jYFfPq1tkR40=;
  b=ebZDkaqogLpHO2FgzegUPaRK5NQBJ26CbTDFR3PwGiVEhrCvPTNC8rei
   9q7Zxgq5SkvM6bjooVDYQ62sZ3YkdWRkvE5eZ2+sgQmU3KbmGuFq+Szan
   wYbsBSFi/Kfe9SM4W99RY7FnVRso6RH/ldo0B96+7ybVnm8RDPI7zUsoi
   HYywdTGv4r3/kxDmBvH182XsIVAzNG0Yy0k5RQ9Dp8XWWe7Q4y+MNbwCK
   gHQCns9E1iU0UhlSiVs0NFqk/6YTtV5AT8TpGEZxyHLzW0EzkKPRUSmUt
   HsZSkTqlrRGFKOE+PBQO4BCmeI4Z1XyO7mhBEtza53D2ph1eeQyy+NCsj
   A==;
X-CSE-ConnectionGUID: 6ZWPAllvQ7Kx4/GkDImIlw==
X-CSE-MsgGUID: +wVJlBPgR9iu9MNtt1v6eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="17793"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="17793"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 05:51:06 -0700
X-CSE-ConnectionGUID: gnCSAsAQQ56rljohfFqvpg==
X-CSE-MsgGUID: dP4rY4nbRHm6BQWe/iaKwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="277261621"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 05:51:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 05:51:04 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 6 Oct 2026 05:51:04 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 05:51:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ga4/StxgCLpHWU5LOKnZnTWWnU3kNgdvuCUOHwqiVhj93azVKq/IjmadtKiYKzuc18CPdCVCknvSIK9ILC/IgfgEvKOm7WjpFamCNYG/hXR6Aj3tdyjKyGnYznPz11EC4K+7sBduUgPO8mq872vG2WokDKNW66HStCfNnMhasOSVJx7P1Ys0nea7NBOM6Bv52fUmpdVssDmTItliKOzxpOXEOwT99TcT52Y20V2nX16Mt74LjF5B5qxOdcttzpdsuBfberO3uu5jU6CYnfkBuZZ3cdh4QrZM2ABIygIs1DpL+WGQ9Z/6PqJNckXIEzpB9NQ6zfRQJPHN50TMEr7WLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54AKmDYZJQeajhu5Ahn6et2lK4yhOVd0BIZv28WsVOM=;
 b=LdqlcLO0wI8fSVhOl1djW2DYH4vS1dJIkhFXsMzo18z7hMPqKzkN23Bpw1S9Qc1WWVgVxO4/bjHiAdv1amLGTonb2JE9XaSLS1bHtvLM4w4zyJ6L7GUSX7lYoPn6VNioQ/SPp8J1TP/0hUNXHS4ZzPJviS8rmtSsxcXjAZrAjN6gdLq+MYQuMuFYvWYxZVHYYZOl2GbH+c2CAWXQI9KpTZ73kWkv+DTS6tZydhtLMPPwhDItK3SshynGwaV6cCodvGLqMHTG71jhsLRIpwMtNDERw+8TiQYmMazTgLNhUFPlslIALj9iJ/d5S2xlxnDXhgtWeofxyzoRKRG7JM7QWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB081371.namprd11.prod.outlook.com
 (2603:10b6:610:34d::17) by PH7PR11MB6403.namprd11.prod.outlook.com
 (2603:10b6:510:1f9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Tue, 6 Oct
 2026 12:51:02 +0000
Received: from CH3PR11MB081371.namprd11.prod.outlook.com
 ([fe80::dead:ac74:f146:cf8c]) by CH3PR11MB081371.namprd11.prod.outlook.com
 ([fe80::dead:ac74:f146:cf8c%5]) with mapi id 15.21.0496.010; Tue, 6 Oct 2026
 12:51:02 +0000
From: "Hahn, Matthias" <matthias.hahn@intel.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>
CC: "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"peterz@infradead.org" <peterz@infradead.org>
Subject: Recall: [RFC/DISCUSSION] x86/tsc: Handling legacy PIT fallback
 calibration on modern platforms
Thread-Topic: [RFC/DISCUSSION] x86/tsc: Handling legacy PIT fallback
 calibration on modern platforms
Thread-Index: AQHdVZFXIyukWU6WzEKYtLMb++DcgA==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Tue, 6 Oct 2026 12:51:02 +0000
Message-ID: <CH3PR11MB081371F9BA6B54E4BBC1BB456EF1952@CH3PR11MB081371.namprd11.prod.outlook.com>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-traffictypediagnostic: CH3PR11MB081371:EE_|PH7PR11MB6403:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1640349-3486-4abe-d0f0-08df23a87a36
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|23010399003|366016|38070700021|56012099006|10067099003|11063799006|18002099003;
x-microsoft-antispam-message-info: KgjC69uJ9mHvNKGmw8nN6YRKGrb5yelEiR8ym9s4+l9VrHQ7mHMF5BX9owUxw1xMr5uVKqfYS2VF926nz+UAz5VY0INOG5Wccrs2cqE9lu6NUhAKGTorVL7kJlngix/RPp0zrMSCaiyHmNrMk85Ou4ioWQQ/CCcLwRVULb5q9C+OOqQzJ55JfSS2L6DqI11qoJsK8+IIogAzB0p8qCsLbUonuNM4wuNOoPy+J0whJAqsTInUcroQ+x9X/ETOPakrm7Gpo3zJlBWXvXuC5tHoFW0IqvNZGuMC2rWjVjJsA+qE258IzeEHrAlyY2fx0YnJwBN2twuRacGa7iCLhpvDoRaIeGYbee3VJq+orLAdjCVGeDdNPJE0gHIUuprhEEU6twybTWycPUaMiAf5zBHaD4SxyIuQvposCYtS2kZ3h6LJMM9A7ctOjIXaJrCMdgkObpWdK2f6JCd0p6FgVaAdA8QhvUCuLMMjoWkJdssM2f8IdfvUqOPjiD75iaCCV2f4SmV8cwQ7foRpybBkzpQFkONHmzxxnqvdHPN1pf1v9mqLcmodJHrnt2bl3SJY1kMBguoVjX6nqTZzQd058TFaBbsejbJ7cWudDcKNSocKlwwgtzq0P86H1aNbBDaOrsEdbEWHotrNqKK3aQBfwJcV8v6rOONIqb8gP/3N7Rfina8LDZ1xfL9WLuUQ5M3E9nX4cwH7J+XDcwo4htBGFnKvDXpJX1RQ07EsjfpEkMQlHzM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB081371.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(23010399003)(366016)(38070700021)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DQioMFMZ+2lSzqwmW4zBkcmmoK5/kae6RTtBo2HtJc8iSOWNgkUnUE0U50IA?=
 =?us-ascii?Q?l/t5pr1S9SVxpJUeCZnZi8s2vNTsAPu4XIITij0prAiOkKnc5med1h9y4jtB?=
 =?us-ascii?Q?hqbLOc6chpTktBrx+MU3ZyUackfc4ylAGT30Kp31gpFWgFBzKbXLH7Faz/aN?=
 =?us-ascii?Q?GwzEst5jipdOP1WsV/xVkE0yB30iUqvyoz2JXq79XfQQKsaENm8aTNiTSspz?=
 =?us-ascii?Q?UssAFNyBoStpxK8iRw7fEB2x4TEoS5V2qnoMdZVf+o3NAEXsRy8Jz6tt9LsW?=
 =?us-ascii?Q?AvWr5kFDiM8UZ28nlchpfXuJDOgfKo/Nka/799Sq89sg0gAJpPf0+K6ii7Gm?=
 =?us-ascii?Q?a7UAMwG12I3scYcjcJI5eDgzz/b1a2O+BAxDee5wdl5YCqqaFHzp4BKgUdB3?=
 =?us-ascii?Q?WMPMZgpOKByYWEJ7IJZgLzcb1M3KA9j6O8Dpbp2ErXnPglUKG/g10CmAABAJ?=
 =?us-ascii?Q?nnbM5aQftbK0xPk0E4lhiczBSFpq+VwuqjITze7SbhnO8wwMXw4F8dVEnfxC?=
 =?us-ascii?Q?EkYxGY5EtMYvl/CZomDBQSrQe13hB38BuOXPKBhY3W5GkArn15RBzQsmhB94?=
 =?us-ascii?Q?ePJDGzVT0EnrkaYVRc7y3x9o/xIxRfbayAv1zC//iDCxmPHnl9GS+Sn1dDR2?=
 =?us-ascii?Q?J2Pn6Xn0YMOkcSicxqlOsJkBfOtwJPVBROU6rWSlDRb9EtlfMSsSQu9zc77t?=
 =?us-ascii?Q?GsrHbLPL1C1rCreFHQFrxu4b30sin+AgTiCDEAOvfqygeSEdq4c1XcQoyEe2?=
 =?us-ascii?Q?nZCxmfc82md0lsJnjLoxd+HWNVw9blEZzdu5NXXEk0pex+nBfThDi/DXlOZW?=
 =?us-ascii?Q?zU5SNdZ4OI3HqjFYP9ZLi8QhI2IWY51vMzJuCMPmuysXgdeXhHn/fEhd+y1b?=
 =?us-ascii?Q?E5cUzU17nrRlaEb/l9HycFIOTdJZr9iJ4QpLu6rVFhdCWBayyqC1YQhXhZXD?=
 =?us-ascii?Q?BCe4rBliE2dv46xSRrOntIo+Pe4s8Lxr6kRHMwZaWPLV/Hv+ejlmMtupKpL2?=
 =?us-ascii?Q?XKY/5N3ytLZYPVTWeQlpe+CY4kok+5w3ueInOgACubJUoYlfvxYPn4IFZNvN?=
 =?us-ascii?Q?8951PXv+CYU7Y38/e/zgAWHrDgBuaKKHks3IJsWfhUCfoteRw2klG7TvLQrF?=
 =?us-ascii?Q?kVvmEfVG6D8Xz2fvrSD7RsQHCHFnRvOXCY+FxdJAxoUEI/mWq3eGqQ9flO7F?=
 =?us-ascii?Q?W3xSz2+FNVUSQJQxNaxIZvyIvO8KLfpetItJ91Mizv6sm7T4nOFo8afVoX3k?=
 =?us-ascii?Q?//Eu/VEh3r5BjkBVs1HGJ7uUdNsh7sA2zEdSFSPMuydisymVi65clsHJnYdc?=
 =?us-ascii?Q?6y6jluTNfhkRWNLV5rkJgIQGfFUNOp856tBA/jb8xGsnuonCtZqVUrbdGGPS?=
 =?us-ascii?Q?KlPb5DY4K8vLrEVOd8HnLjdU/2XX6cuNjyyGBkF5vIdc3UYjlBi3u/J/Ackc?=
 =?us-ascii?Q?i+nFT9cR61xQn9PO4JU/XD2rJbBNAp8O4meCpNeluisuXXHlnA/YWum6urH4?=
 =?us-ascii?Q?x24x89Gt1tsiZxbry4E03fURAEJvUIXvMTdWR7+xTuOGAwFn+RRFb+AvoIbU?=
 =?us-ascii?Q?QLlyBN9lBBCYH2p35S5H0w4rL9y9Z92bAklnQwAoVLjVnwLe9s3kwCN/usmK?=
 =?us-ascii?Q?6B0pxCWI7Gh/5sMmuaCdv+j6WQ1CuzPBAs9hYhvZpvYaoa/hzqqVk973e/68?=
 =?us-ascii?Q?4BxoeZrSCQ9cQw+9HLcujdF1SgWCDi9JLi+pW2WNRLbAB4/PNyOQq54WFYAh?=
 =?us-ascii?Q?IsneyAWms69RPIkUl1w3ZWsCAsm/OvfOD4jiTirmXCdE4uspAbnRIn9h59La?=
x-ms-exchange-antispam-messagedata-1: Y3j8pOtUgXWHPA==
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: AxfgWlXQxjuRnSQKn0KOS79OUnUPzbxFWgwLdzoxrgmb88uzXDKJQ9c8Pin450343GitoJtQoMcPIqhm6JrDaEOkEb91eqcY7M6NwF5OdWzO4CtWOQpt0bLZqW7yqL0sDUd7ksOvVS8dMHGiIBSnBsfp9sfQvuBhbKPSialhG0hR3FhlB875/HH20/t3CxIkIgnL2/Ihu7bZsVrrQ0jKZm47WW2CsaXwqNFgdTkKbz+bK0FNrXWfC/Bm7PD4b1DPWS8DH3mw5kTQs61Vz9jGdANTJU/y8Soc0+rfC3oXwDPgxbRGcESMXq90WkXuJa1Ux7o0R3ArorfOg0SqNWSOqA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB081371.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1640349-3486-4abe-d0f0-08df23a87a36
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2026 12:51:02.1300
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-transportrecall-originalinternetmessageid: <CH3PR11MB081371F92CCBF8F8284234ACF7F1952@CH3PR11MB081371.namprd11.prod.outlook.com>
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e7JSerWOpv+TSppmrcDsR/f9JiI/MCQ75NlIcKK+aoBKM/C4ShPlcMSS/nXPAPjsDVknpHW8q0mbtYIPdMygvg==
X-MS-Exchange-CrossTenant-messagerecallsenderobjectid: 7cb6f614-a65f-4a8d-90aa-2dc0a3e97b7f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6403
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: quoted-printable

Hahn, Matthias would like to recall the message, "[RFC/DISCUSSION] x86/tsc:=
 Handling legacy PIT fallback calibration on modern platforms".
________________________________________
Intel Deutschland GmbH =


Registered Address: Dornacher Strasse 1, 85622 Feldkirchen, Germany =


Tel: +49 (89) 99143-0 =


www.intel.de =


Managing Directors: Candice Moore, Jeffrey Schneiderman, Ramachandran Sitar=
aman

Chairperson of the Supervisory Board: Sonja Pierer

Registered Seat: Munich Commercial Register B: Amtsgericht Munich HRB 186928

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

