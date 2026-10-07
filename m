Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41050221F24;
	Wed,  7 Oct 2026 02:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791339914; cv=fail; b=PWMZo3TLJutI/Wi9WVCTR7eX4TX2Tf2AtDb//7E8FwgpO5RIClYVQ64zlIQzP3szx6aafrWqBYYMoUA8TiXhQuxjby6GP2gduRo50JQdn4gjuGgZ51rvQNj/Q2JQm/9TJa8mrNSU8E/A8k5edIlFq+TQOnDaeLj2eaD3t1dPoJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791339914; c=relaxed/simple;
	bh=XprkQgdehDXe0nTJWmFLu11wADQtxtbBJ4RxtchGKAo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iHzhAH3acoisU2BeNiQ+FiKRDO6mS4l0OoL8+KkRT9KBe5wtQifiEIx88WQRSTC9xQt0zjERBGaQeVaZAPZmJ2NOPBOJCihUx3lFnNGKi8qC+N84/N5Vt0YeLi56YmeDBUQ0t3HSNVWU/7DYp+aFW8V14KgjS7GXBg3txntCMlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QWNvgDca; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QWNvgDca"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791339912; x=1822875912;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XprkQgdehDXe0nTJWmFLu11wADQtxtbBJ4RxtchGKAo=;
  b=QWNvgDcauowT34t2UUTc/cG5cShIcbd4eyWP93ZNkHWy2jaI719MT4IG
   04b1PUTu+V8yY0sKqpu0kn1T/TO3hMTgE4/tfYAhqz/3IV+HlU+kgPLUV
   Dv9qU2YPJzZCvJFOo9fUvdR6zrw8vj5dRLIEuCx3z+ADTXh9bxXFUnyDX
   hJTee86n9ZNcKOxFE2uU6B1nbe8VcdEm2Iya8tu9pPl3Ry0L+sTYK0IXO
   Yukp12ojgeUYpRqTVVd6RX/n4IhTno6lJ/u9S9lkR42TLt2dwSs1gx738
   pnwDJw/AFJgpePb0ED7EoRgpxp9d/4zW5g5gu7cRYf4IQjD2LtH0ObJOv
   Q==;
X-CSE-ConnectionGUID: bnJf+dBnTSumaRqwHKak7Q==
X-CSE-MsgGUID: xR/YtUNeSHKwKn6+EOU9dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="103412476"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="103412476"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 19:25:11 -0700
X-CSE-ConnectionGUID: 7LEpNDtlR5OWEZHtTp9qbg==
X-CSE-MsgGUID: 9kOdnq7dQQK7SclyjFGQrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="273656170"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 19:25:11 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 19:25:11 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 6 Oct 2026 19:25:11 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.28) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 19:25:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2jnF854B3bzL1Mo4VHMw7NM4ZnyoVQKJUPY+oRhwFtmLzcUiaPpxiW/Ar/p/5FAijlQvCk7vd5Wrs9GHTVq4PY/UPP5qGG4H6habljIbJzltdIBXMg/L3UWtV6GQ+mNF9Ad1+p5oEcqCcjhWQ9j0MOW4WTFtREVctC+SYepwcqX4UGHKmoSGC6CRqk7UEaoVXZ0yrumeIpKb6d613DL4PvRbsScqeq5dtHavsSiTa/PV2Id68GfX/Ff7iELSFVzaduX56AahtWDnI0eeV3d/KYjur7ENhmFwnGndNQasBOqaaeVu6sIrnczL9zTKutHK7G0sqUrmXE00idemvMi7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XprkQgdehDXe0nTJWmFLu11wADQtxtbBJ4RxtchGKAo=;
 b=cHT/OyYiNZ7+UnmGF0SqMiGwbfwJYDbtCb6245hHKYtehz5HLt8D9Z3unGSw5CsvdMNydeRFTgNSnGFRguZF+MLFZV3OO346+20n9b5hi9cShq/h0+63yQz9qFsA0Vs/sJEkz8ytrDbz9IrJy9VTgOTEaSMVt488Gdmsl37eA4UEqsI2xH6qkk0q878eKYxh+kw8iAuSOIIfT6pJ4qPx2FQVpH4jDAXPvSL6Z4r8x3LR+4BY3qtXlJ0Od597alw5lrlsFXb2DQVmt7uwpLki2okSlVr62E2wB4uvf3NEyerS8R53SrZasCxuwORNzkf9EDaJ4OZyBLbRvgcCCLOV9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by SA0PR11MB4718.namprd11.prod.outlook.com (2603:10b6:806:98::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Wed, 7 Oct
 2026 02:25:04 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%3]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 02:25:03 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "vkoul@kernel.org" <vkoul@kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.de" <tiwai@suse.de>
CC: "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>
Subject: RE: [PATCH 0/3] ASoC/soundwire: remove ghost peripherals from the
 mach table
Thread-Topic: [PATCH 0/3] ASoC/soundwire: remove ghost peripherals from the
 mach table
Thread-Index: AQHdRRQPZ2kignuw5UqsnkRDoqnbO7bQAQ6AgACIb+CAIPHYcA==
Date: Wed, 7 Oct 2026 02:25:03 +0000
Message-ID: <SJ2PR11MB8424E1FAF2D8D1EAD84C3B92FF942@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260915131327.1783551-1-yung-chuan.liao@linux.intel.com>
 <528a9777-1587-4dfc-a366-000fc0867d4b@linux.dev>
 <SJ2PR11MB8424E1911A4CA6F9414A07DAFFB92@SJ2PR11MB8424.namprd11.prod.outlook.com>
In-Reply-To: <SJ2PR11MB8424E1911A4CA6F9414A07DAFFB92@SJ2PR11MB8424.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|SA0PR11MB4718:EE_
x-ms-office365-filtering-correlation-id: 5bd1b062-c159-4d8b-9e06-08df241a3211
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|38070700021|11063799006|5023799004|56012099006|4143699003|10067099003|22082099003|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info: OmeZtWhCHgCO/QlWxUGtj7GSlpUCObKLAkA0jsy88M1X9klovfeiFLEHlpnlPl16ZtOFactGVzjacx8SRqUryL7hOFPJrFCWGwGwHUqsC+xYou72PBmJSCn4DRfPFgQHfpvMTBAsV6MmKDJnDtWOhwH03VIwc4wiLqAz0mZkSyRu7pt9siNAQY4hyOpAqkCA+puWDLFU1M04rnr6jMd+bxh6i5mwG3f4lSudb3SYYLqg9vPAH6xxN1MZjLZJIu2G9JJF/36gRDFk7LHD0fANk1jxKnwK5OwjJMucws/Yzzv6e2fUckYhdH/6jFxQ2L9W+bG/WrJ6pTsJ5RRoC8aISTCf2MJVDyBll3a5hZq5pk1OeV7Tenj5RaM7IRof3UKHqx/IqglT2TbxBSsm9qaClLjZXwqmSIdDxqTgf/SXloVTTPNPsXNAXD0vPRUEwUD9ARMUGnvcWQHBRdVO1QMKMr49X72LqJDK6QHHRaq3CelHIsIRjIJ43wx5PimGl7oFHk+IDVNawzuvj0K7kqhVgO3xGJabZGrVyZoXnia/WUz6CXPQsqIQS4rWxqnci9BHWUYieLqpWfcIz0PypgdPebiNfqBJfjtQftUMs98djNAaxtS3a6DCSM4A3/WeRKipVWd8F9awuUxZ2QD8/bvSNMZ8Dof42fI+Ca/joVwWV+zYm4FjsPyEWrczRjTwgU1B4eADeMkroBsobA7qkqjojzdXQzGeRZXUWsHw6iyQvf4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(38070700021)(11063799006)(5023799004)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VmRiOUVQRFhmcm0rb0ZlZWVrdmVCSWdDczREK1M0cmh1amFDL1FKeW54UzJh?=
 =?utf-8?B?ZlVkdDY0am5TVDlNSlJPOEFHUjM2Znp2UEFucm13TWdTLzBveU9IYlZORGlo?=
 =?utf-8?B?a3ZkcnVVZ2lITklCRjFjdC80QVNkYXJZdEd2ZVZ0YnowVjhZMEVVQ1p1c2RZ?=
 =?utf-8?B?ZXhJYUtNS1ZzclI4UFR1bStDOHRxNWdET016TWFnOHJ0ZUhDNys2L1NYT2g0?=
 =?utf-8?B?a0VoeTRNOTc1SDBRMm9SODMrd3FFT0VQeUhrc0xUc1RCQkFPcGZadXNQSUpx?=
 =?utf-8?B?OXhMRm1PeDJ5NTZHRWJaMmtMWnRFd1hBU1VSREpJV2RqaVVsUHJQN01GWWNB?=
 =?utf-8?B?UHh5R0tUcVZqcDNvWmFKZWJtYTdteURMaVJaTUx5Ni9NZThKdjE0QllzOUt4?=
 =?utf-8?B?V1hFWlh0YWFjc3hEVGIwbXM2VkF0eEZZSWdzVmtTUzJZQ2NyWXpmeGJVNWlj?=
 =?utf-8?B?cWlHdkcrM3lUVHZLY3J2WlJJMVdONDRtV0FjVlF3UjVFMGdEaDV3Y25HS2dG?=
 =?utf-8?B?MnpZd3l4cHVUSVB2WHo1TFEvSVI4c3djdTBDanNxUzBlVU5BVU4xVTRPT3Vk?=
 =?utf-8?B?c0FoeW0vUnpTWjZVV1ZmS2FlZzYrNmFlUGMvbzZsMXF6eHo2QU5UN20wTWsy?=
 =?utf-8?B?S3pkeklsM3lkMVRySFNRQXEySVE3TnltUEJBZFZIcW9VZVhEZWZ4MGJMUlFP?=
 =?utf-8?B?UkVHTmFSbkFKc1RjQXp3WGcyaVNsN0RZVGZyMnIwd01wRlF5TFFITzF6M3Jn?=
 =?utf-8?B?WFR5aXNjQjB5cHdDNmJNeVhGL2JCQnNndU1PWnBROEQ0Tk02anhkaW1PUndo?=
 =?utf-8?B?ejY0OUNuNGJEbTJXOEgvSm9xbmozTklnNk1aU05IMk1uUXVPK1Zab25QNjAz?=
 =?utf-8?B?bFRSZlJSaUt2M05rRGpqckhOR0c2ekpNazZYclVKcjBOenE0N1hnendYZ2Zz?=
 =?utf-8?B?Z3NQdHpreVJQSTdHZW43UFpRNW9rQTkzWXJCNk1xb2dzMFhINDBoNHhzODJ4?=
 =?utf-8?B?a1dQTHBzaGJBTnRMM3NIVzhCWUxjb09MTlhkWml5NGRjQ0ltZzF5SHVjVFpH?=
 =?utf-8?B?dzVtcnhlTXZFME5kM3Z1dWcxM1lJSXFRNHc2ZDN6UnBzWEhrdTl0cjl5Z0ht?=
 =?utf-8?B?UkZOeW9NSDkwNmVhcm1ORFN1dk9DUGFSY2M3TW0zS3ZTL01MYzBTbkFBR2c4?=
 =?utf-8?B?OTZ3VHBRQ2dtNWxBRVdPQWdlQjdBR3pHTE1kc0VpV2xWemtQYWdlY2N6RWJJ?=
 =?utf-8?B?bG1DbStqMjFnaWo2bHQvYlp4ek1kNThZSkUrWEI2UDhObWV4S21sa2tNOEdF?=
 =?utf-8?B?cXA1bkUxTGY0dU9GKzBpcnk5emY4a3NsQ0RXZGIvVHpmYnpHN1RRdGcyTldY?=
 =?utf-8?B?T212UlEvYUkrQkJmWWJaOTVXVDU2eFo1aXJzb2VZclAxNVp3SDhSajFlaHFX?=
 =?utf-8?B?ajNLZW9ybzZwRXN4MVpFMGlPcUEyL3hNVy9HVTNuMkYvRVhrN0dScnVsNDZE?=
 =?utf-8?B?NlZPQlF5cktBdmx6TGV2aktuekM5clBDMFhUZTQ3V2lKUWx5Ui9kRTQxM2Uv?=
 =?utf-8?B?SVAvazB4S1g3b3FBZjYxek5kSGxiNzEyNXRoZTlnbkx0SW9uSkVtbDd1Mlhs?=
 =?utf-8?B?dm1Ib0t5VXhkODBJdDVMak1HUnRSYzhmbVZ4cVlaY0tzbXJwdjRYVUpGd3U0?=
 =?utf-8?B?SDVvUTAzSHBaS3NBQTFxNUE3aHRvTEJ3Nmd3dnFnRjdWNFB4QmtYS2FLRTJj?=
 =?utf-8?B?Z1hTcHc0MTZydVBTOVozMGFhTnNMSUMySmN0M2JoUFp0TzVCMlcxeFcyTitm?=
 =?utf-8?B?a2tLd28wRE8rVE5kK1ZISzlmNklUK0hleHQzS0dIaHh0TGxTS2YzWjhubG45?=
 =?utf-8?B?QkFSYlZhQUVGVTBEUW50U2NjMC8rcXlpM1NXL3NqWU9yaVpraHZRVFpTUjRi?=
 =?utf-8?B?enZRR3o3dlpNVjdkU3hVZ29uKzZSd2dYZFo1NWZhZy9XNkxPdGdaTUlLL2xk?=
 =?utf-8?B?RVpnYXA0WmZDbk1qY1B2MXV6cTRPTnhwTS93OVJFVWxyRFQwbG5tVW83NVRV?=
 =?utf-8?B?N2EvVTRwQ3RLbEJNVDR1R0ZueGxSQi93cEtQSHU4SjJsTEhRakFTK2pxQy80?=
 =?utf-8?B?MFpSTk1yM25XeVhTeEVNVmpjYTlMUFBDemdDY1haUnhaZEZMeFhyMWMzWCtn?=
 =?utf-8?B?aXAzSVBwNVkxQ2VLSVc0ZVNVVVdmblR5eE5zMEZ3L0YwY1ZFNFk4NWxPQWl5?=
 =?utf-8?B?RmZQaXZyN1Qzd0Q3bkNYSk1FbkcyYWFYM1N5aE9WdnRuYnl5c09CcktyTWxo?=
 =?utf-8?B?akFRVnVaeU1YTFQ3eVVxQkwydGlHOUphcjcvUHNSd0p0MEFMRHFHQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Q+R/50+DOdq75WtuRWYZ4+qAGW/i05+5dE9SO8JeZBHVUh/oVvP/QCbMnGVThzjvYyMsuRmFlAOIMPHTwus80JEk3RUEj0YJW4DDHEEq+VZ448qZ3L5f4dGVRVeuNnhfFEnKAyPNojUdXFHwlf1yRj9wAsXoYOrdwaWrx60gJKNKTsFqGzeZl4PqIiDH8G5h69QJPLFR9EpSl8p1R2L41skHyn4nF8BHkcD9z/Za4OdjqQ+OxWGff9Ng1SvmaSLVzy6AImcsPprZAcQAAGUsOriOeFaSWux+5bQqeejR7DmZPlA/K+wXoaiZzr5Xoj8NR8N/mofeRRJ6BO8Rq8RUbw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bd1b062-c159-4d8b-9e06-08df241a3211
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 02:25:03.7193
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jehIZEWp3y7oVhXwirr2fnK6PfbFeUJgsVD8myo4eylAyB0jbOVUdPFRbsxPPL533nHDwLAHA/vekBg9uJ/oyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4718
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGlhbywgQmFyZA0KPiBT
ZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciAxNiwgMjAyNiAxMjowOCBQTQ0KPiBUbzogJ1BpZXJy
ZS1Mb3VpcyBCb3NzYXJ0JyA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguZGV2PjsgQmFyZCBM
aWFvIDx5dW5nLQ0KPiBjaHVhbi5saWFvQGxpbnV4LmludGVsLmNvbT47IGxpbnV4LXNvdW5kQHZn
ZXIua2VybmVsLm9yZzsgdmtvdWxAa2VybmVsLm9yZzsNCj4gYnJvb25pZUBrZXJuZWwub3JnOyB0
aXdhaUBzdXNlLmRlDQo+IENjOiB2aW5vZC5rb3VsQGxpbmFyby5vcmc7IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7DQo+IHBldGVyLnVqZmFsdXNpQGxpbnV4LmludGVsLmNvbQ0KPiBTdWJq
ZWN0OiBSRTogW1BBVENIIDAvM10gQVNvQy9zb3VuZHdpcmU6IHJlbW92ZSBnaG9zdCBwZXJpcGhl
cmFscyBmcm9tIHRoZQ0KPiBtYWNoIHRhYmxlDQo+IA0KPiANCj4gDQo+ID4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBQaWVycmUtTG91aXMgQm9zc2FydCA8cGllcnJlLWxv
dWlzLmJvc3NhcnRAbGludXguZGV2Pg0KPiA+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDE2
LCAyMDI2IDM6MDkgQU0NCj4gPiBUbzogQmFyZCBMaWFvIDx5dW5nLWNodWFuLmxpYW9AbGludXgu
aW50ZWwuY29tPjsgbGludXgtDQo+ID4gc291bmRAdmdlci5rZXJuZWwub3JnOyB2a291bEBrZXJu
ZWwub3JnOyBicm9vbmllQGtlcm5lbC5vcmc7DQo+ID4gdGl3YWlAc3VzZS5kZQ0KPiA+IENjOiB2
aW5vZC5rb3VsQGxpbmFyby5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4g
cGV0ZXIudWpmYWx1c2lAbGludXguaW50ZWwuY29tOyBMaWFvLCBCYXJkIDxiYXJkLmxpYW9AaW50
ZWwuY29tPg0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMC8zXSBBU29DL3NvdW5kd2lyZTogcmVt
b3ZlIGdob3N0IHBlcmlwaGVyYWxzIGZyb20NCj4gdGhlDQo+ID4gbWFjaCB0YWJsZQ0KPiA+DQo+
ID4gT24gOS8xNS8yNiAxNToxMywgQmFyZCBMaWFvIHdyb3RlOg0KPiA+ID4gQUNQSSBtYXkgcmVw
b3J0IGEgZ2hvc3QgU291bmRXaXJlIHBlcmlwaGVyYWwuIEl0IHdpbGwgY2F1c2UgdW5leHBlY3Rl
ZA0KPiA+ID4gZXJyb3IgbGlrZSBkdXBsaWNhdGVkIGxpbmtzLCBjb2RlYyBkcml2ZXIgY2FuJ3Qg
cHJvYmUsIGV0Yy4gVGhpcyBzZXJpZXMNCj4gPiA+IGNoZWNrIHRoZSBwcmVzZW5jZSBvZiBTb3Vu
ZFdpcmUgcGVyaXBoZXJhbHMgYW5kIHNraXAgdGhlIG5vbi1leGlzdGluZw0KPiA+ID4gcGVyaXBo
ZXJhbHMuDQo+ID4NCj4gPiBJIGFtIGFmcmFpZCB0aGlzIHJhaXNlcyBxdWl0ZSBhIGZldyBvcGVu
cywgc3VjaCBhcyB0aGUgJ21vY2t1cCcgc3VwcG9ydA0KPiA+IGFuZCBkZWxheWVkIGVudW1lcmF0
aW9uLg0KPiANCj4gVGhlIG1vY2t1cCBzdXBwb3J0IHdpbGwgbm90IGNoYW5nZS4gV2Ugd2lsbCBv
bmx5IGNoZWNrIHRoZSBleGlzdGFuY2UgaWYNCj4gbm8gbWFjaCBpdGVtIG1hdGNoZWQuIEFuZCB3
ZSBjYW4gYWx3YXlzIGFkZCB0aGUgbW9jaHVwIGNvbmZpZ3VyYXRpb25zIHRvDQo+IHRoZSBtYWNo
IHRhYmxlLg0KPiBBbmQgaW5kZWVkLCBpdCB3aWxsIGFkZCBhIGxpdHRsZSBkZWxheSBpbiBzb21l
IGNhc2VzLiBIb3dldmVyLCBiYXNlZCBvbg0KPiBvdXIgdGVzdCwgb25seSBhYm91dCAxIG1zIGRl
bGF5IHdpbGwgYmUgYWRkZWQuDQo+IA0KPiA+DQo+ID4gQSBiZXR0ZXIgd2F5IHRvIG9ubHkgZGVh
bCB3aXRoIGFjdHVhbCBjb2RlY3Mgd291bGQgYmUgdG8gb25seSBwcm9iZQ0KPiA+IGNvZGVjIGRy
aXZlcnMgd2hlbiB0aGUgY29kZWNzIHJlcG9ydCBhcyBBVFRBQ0hFRCBhbmQgZ2V0IGVudW1lcmF0
ZWQsDQo+ID4gaW5zdGVhZCBvZiBkdXJpbmcgdGhlIEFDUEkgcGFyc2luZyBzdGFnZS4NCj4gDQo+
IEJ1dCB0aGlzIGRvZXNuJ3Qgc29sdmUgb3VyIGlzc3VlLiBUaGUgREFJIGxpbmsgd2lsbCBzdGls
bCBiZSBjcmVhdGVkDQo+IGFuZCB0aGUgc291bmQgY2FyZCB3aWxsIG5vdCBwcm9iZSBiZWNhdXNl
IHRoZSBjb2RlYyBkcml2ZXIgZG9lc24ndCBwcm9iZS4NCj4gT3VyIHRhcmdldCBpcyB0aGF0IHRo
ZSBnaG9zdCBkZXZpY2Ugc2hvdWxkIG5vdCBiZSBhZGRlZCBpbiB0aGUgREFJIGxpbmsuDQo+IFNv
IHRoYXQgdGhlIHNvdW5kIGNhcmQgY2FuIHByb2JlIHByb3Blcmx5Lg0KPiANCj4gPiBUaGlzIGlz
IGEgc29sdXRpb24gdGhhdCB3YXMgZGlzY3Vzc2VkIGEgb25nIHRpbWUgYWdvLCBwcm9iYWJseSBj
aXJjYQ0KPiA+IDIwMTYsIGR1cmluZyBvbmUgb2YgdGhlIExQQyBtaW5pY29uZmVyZW5jZXMsIGFu
ZCB0aGUgZGlyZWN0aW9uIGZyb20NCj4gPiBtYWludGFpbmVycyB3YXMgdGhhdCB0aGUgcHJvYmUg
Y291bGQgYmUgdXNlZCB0byBlbmFibGUgcmVzb3VyY2VzIChwb3dlciwNCj4gPiBncGlvLCBjbG9j
a3MpIHRoYXQgbWlnaHQgYmUgcmVxdWlyZWQgZm9yIHRoZSBoYXJkd2FyZSBjb2RlYyB0byBiZWNv
bWUNCj4gPiBmdW5jdGlvbmFsIGFuZCByZXBvcnQgYXMgQVRUQUNIRUQuIFRoYXQncyB0aGUgcmVh
c29uIHdoeSB0aGUgcHJvYmUgaXMNCj4gPiBkb25lIG9uIGFsbCBjb2RlY3MgZXhwb3NlZCBpbiBB
Q1BJLCBldmVuICdnaG9zdCcgb25lcywgd2l0aCBhbg0KPiA+IHVwZGF0ZV9zdGF0dXMoKSBjYWxs
YmFjayB0byB0aGUgY29kZWMgZHJpdmVyIHdoZW4gdGhlIHByZXNlbmNlIG9mIHRoYXQNCj4gPiBj
b2RlYyBpcyBkZXRlY3RlZCBvbiB0aGUgYnVzLg0KPiA+DQo+ID4gSW4gcHJhY3RpY2UgSSBhbSBu
b3QgYXdhcmUgb2YgYW55IGNvZGVjIGRyaXZlcnMgZG9pbmcgYW55dGhpbmcgd2l0aA0KPiA+IHBv
d2VyL2dwaW8vY2xvY2tzIGluIHRoZSBwcm9iZSBzdGFnZXMsIGF0IGxlYXN0IGZvciBBQ1BJIHBs
YXRmb3Jtcywgc28NCj4gPiBpdCBtYXkgYmUgYSBnb29kIHRpbWUgdG8gcmV2aXNpdCB0aGlzIGRp
cmVjdGlvbi4gU0RDQSBjbGFzcyBkcml2ZXJzIGRvDQo+ID4gZXhhY3RseSB3aGF0IEkgZGVzY3Jp
YmVkLCB0aGUgc3ViZGV2aWNlcyBhcmUgcmVnaXN0ZXJlZCBvbmx5IHVwb24NCj4gPiBlbnVtZXJh
dGlvbiwgbm90IGR1cmluZyBBQ1BJIHBhcnNpbmcuIEl0J3MgYSBtdWNoIHNpbXBsZXIgZGVzaWdu
IHdpdGggYQ0KPiA+IGxvdCBmZXdlciBwb3RlbnRpYWwgcmFjZXMuDQo+ID4NCj4gPiBQcm9ibGVt
czoNCj4gPiAtIHRoaXMgd291bGQgYmUgYSB2ZXJ5IGludmFzaXZlIGNoYW5nZSB0byBzZHdfc2xh
dmVfYWRkKCksIHdpdGggdGhlDQo+ID4gZGV2aWNlX3JlZ2lzdGVyKCkgc2tpcHBlZCBhbmQgbW92
ZWQgdG8gdGhlIGVudW1lcmF0aW9uIHN0YWdlLiBJdCdkIGhhdmUNCj4gPiB0byBiZSBvcHQtaW4g
YW5kIHVzZWQgb25seSBhIG5ld2VyIHBsYXRmb3JtcyB0byBhdm9pZCBicmVha2luZyB0aGUNCj4g
PiAnbGVnYWN5JyBkZXZpY2VzLg0KPiANCj4gSSBkaWRuJ3QgY2hhbmdlIHNkd19zbGF2ZV9hZGQo
KS4gQWxsIHRoZSBjaGFuZ2UgaW4gU291bmRXaXJlIGRyaXZlciBpcyB0bw0KPiBhZGQgYSBmbGFn
IGFuZCBhIGNvbXBsZXRpb24gdG8gc2hhcmUgdGhlIGluZm9ybWF0aW9uIG9mIHdoZXRoZXIgdGhl
DQo+IGVudW1lcmF0aW9uIG9mIHRoZSBidXMgaXMgY29tcGxldGVkLg0KPiANCg0KSGkgUGllcnJl
LA0KDQpEbyB5b3Ugc3RpbGwgaGF2ZSBhbnkgY29uY2VybnMgYWJvdXQgdGhpcyBzZXJpZXM/DQpP
ciBtYXliZSBJIGNhbiBhZGQgYSBtb2R1bGUgcGFyYW1ldGVyIHRvIGRpc2FibGUgdGhlIGZlYXR1
cmU/DQoNCj4gPiAtIHRoZXJlIGlzIHN0aWxsICpub3RoaW5nKiB0aGF0IHdvdWxkIHRlbGwgeW91
IHRoYXQgYWxsIGNvZGVjIGhhcmR3YXJlDQo+ID4gb24gYSBnaXZlbiBwbGF0Zm9ybSBjb21wbGV0
ZWQgdGhlIGVudW1lcmF0aW9uLiBZb3UgY291bGQgaGF2ZSBhIGZpeGVkDQo+ID4gZGVsYXkgYnV0
IHRoaXMgd291bGQgbmVlZCB0byBiZSBsYXJnZSBlbm91Z2ggdG8gY292ZXIgYWxsIGNhc2VzIGFu
ZCB0aGF0DQo+ID4gY291bGQgbWFrZSB0aGUgcGxhdGZvcm0gYm9vdCBzbG93ZXIgdGhhbiB0aGUg
Y3VycmVudCBzb2x1dGlvbiAtIG5vdCBpZGVhbC4NCj4gDQo+IFllYWgsIEkgc2V0IGEgMyBzZWMg
dGltZW91dC4gSSBiZWxpZXZlIHRoYXQgaXMgbGFyZ2UgZW5vdWdoLiBBbmQgdGhlIGZsYWcNCj4g
YW5kIHRoZSBjb21wbGV0aW9uIGlzIHRvIGF2b2lkIHRoZSBtZWFuaW5nbGVzcyB3YWl0aW5nLiBX
aXRoIHRoZQ0KPiBpc19wcmVzZW50IGZsYWcsIHdlIGNhbiBlbnN1cmUgYSBidXMgd2lsbCBub3Qg
YmUgd2FpdGluZyBmb3IgbW9yZSB0aGFuIDENCj4gdGltZS4gQW5kIHdpdGggdGhlIGVudW1lcmF0
aW9uX2NvbXBsZXRlIGNvbXBsZXRpb24sIHdlIHdvbid0IHdhaXQgZm9yIHRoZQ0KPiBnaG9zdCBk
ZXZpY2UgdG8gYmUgZW51bWVyYXRlZC4NCj4gDQo+ID4NCj4gPiBBbm90aGVyIG9wdGlvbiB3b3Vs
ZCBiZSB0byBwYXJzZSB0aGUgQUNQSTAwMTggZGV2aWNlLCB3aGljaCBkZXNjcmliZXMNCj4gPiBh
dWRpbyBlbmRwb2ludHMgYW5kIG1ha2VzIHJlZmVyZW5jZXMgdG8gY29kZWNzLCB3aGljaCBjb3Vs
ZCBiZSB1c2VkIHRvDQo+ID4gZmlsdGVyIG91dCAnZ2hvc3QnIGNvZGVjcyB0aGF0IGRvbid0IHBy
b3ZpZGUgYW55IGVuZHBvaW50cy4gVGhlIHNwZWMgZm9yDQo+ID4gdGhpcyBBQ1BJMDAxOCBpcyBu
b3QgcHVibGljIGJ1dCBjb3VsZCBiZSByZXZlcnNlLWVuZ2luZWVyZWQgZnJvbSBXaW5kb3dzDQo+
ID4gcGxhdGZvcm1zLiBUaGUgbWFpbiBiZW5lZml0IGlzIHRoYXQgdGhpcyBmaWx0ZXJpbmcgY291
bGQgYmUgZG9uZSBpbiB0aGUNCj4gPiBBQ1BJIHBhcnNpbmcgc3RhZ2VzIGFuZCBub3QgY2hhbmdl
IGFueXRoaW5nIGluIHRoZSBwcm9iZSBhbmQgc3RhcnR1cA0KPiA+IHNlcXVlbmNlcy4NCj4gDQo+
IElzIEFDUEkwMDE4IHJlbGlhYmxlPyBXaWxsIGl0IHN0aWxsIGxpc3QgdGhlIGdob3N0IGRldmlj
ZT8gVGhlIGdob3N0IHJ0NzIyDQo+IGhhcyBhbGwgZW5kcG9pbnRzIGxpc3RlZCBpbiBpdHMgRGlz
Q28gdGFibGUNCg==
