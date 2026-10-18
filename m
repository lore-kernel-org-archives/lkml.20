Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D46378D8E
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792314571; cv=fail; b=O5hFo9dD08rxnTj+IQctG+1jWy0NJSZxvi4KNjvgE7wZTF5gMoD6nQqlmTcUphRnIx4rEjOdCl+6KV/yZopiWqx8BmcA8GDaUkUFAIxrNjR4emU3WnzctQrft0KgNh75OxvcmtrqFM5a8RxvNx5ncCpzCsrGaW/4zIBqpWcjhqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792314571; c=relaxed/simple;
	bh=IjeuFhCddfdXsc6bzWWyFX3ifBiZ2bhxuxEvV5m5F80=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NM2z1XBkKZs4OIZsXCw/vN32/PxqxsDZpVNuQE2y/zEGrKJFAQVo+LqI22ANlErnzuDI5MQFHHMBUpr2z0SVHhl4dabQOAfFkazqs56NxE7Cup5IjZqiOZK9tLUPfuTcKKJVBn5wjgqnU6Rjh1AEPZnbVPmB5/DbfxcrXGg+A5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BziqOt0N; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BziqOt0N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792314570; x=1823850570;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IjeuFhCddfdXsc6bzWWyFX3ifBiZ2bhxuxEvV5m5F80=;
  b=BziqOt0Nv7nCFafkBZopWpShWWMRBCSHX0vZKp5NKtbgTkMIsBf4f5X1
   H+BU9K4+KTa2dOybRCfzcqRp9zE/teyrFtYJEhY5YCADbdzDBJpNh568l
   lVTjPsgqM1G+9hgTuarKf0v3zP1fR8dJPc/VOIVEa5yaXFkWOcGkzfLAV
   JhYMRwdMbFRJzkud4s7Xlkr9mu9l4Xa7kKw4TQ+ahxDdpp3eriIg+PANh
   sZl7nKTJWfkyIsllbbhRQVDoftrHUafEXcuGKyx1RrfUwDVRqSIhsgPOA
   Cxw7aucBSX/7raXpxilk3TSB0dYiPz3C1pzqI/AhMy6yqf8p6Yb36eAfS
   Q==;
X-CSE-ConnectionGUID: ji4VabESQx6W0EDNx3vGqQ==
X-CSE-MsgGUID: 8KaUIOeQQQS73a0adNCRKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="1133811"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="1133811"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 02:09:29 -0700
X-CSE-ConnectionGUID: IovajCaVTsiQI2xRCqJv1Q==
X-CSE-MsgGUID: x7oibLyQThOelP7MOn/Hig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2671592"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 02:09:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 18 Oct 2026 02:09:28 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 18 Oct 2026 02:09:28 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.42) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 18 Oct 2026 02:09:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQguKJ+aoCUvqNGTyme6DC9yE+WjdDu/Si9qNAalVv467EuJpoNalXGLMmMNKH+aaKxDi28ZT+YJno/94QZzx2ijvnaNLeAY71u57u04z87IPpr8EHGkF0oMN7j2c8LiNbQf8JWTBttMBV+fJFEyObvCGhFxGaEa6Oy6PwpJPbZOZPFsVQNnmQSSdMc4lcdcqg5JkmtAzzvpfKG8ezsywJaJbwhla4r1C4AkDQX9veRSmIQcZPB20JnYwJUZvbB3Dkr06d6nM1WqHTt0ZhrGKkmTSlFtD9ollrbfapLArWj8qMauZYewicvU18adkylUz86KphYp9ZhYQFf/EbH9cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjeuFhCddfdXsc6bzWWyFX3ifBiZ2bhxuxEvV5m5F80=;
 b=PheU1d3T4/6TPizGD+7NZ1kRdcyTwmx1xYzU5HO8zYxVi89JTiXcl0MVEWIaJJd+8ifI9Ybj5cFiu4SZxGj28UMp0RF0N9l0abaSyEysqw06B5X95SodrUg8Djd1KiLMqitrPq6kQtsC9GhOq4UryHw5FHegpq1g7CJOPY93GytQEia+KdBvLRroQK3DrcUB9NKZZSUcINIrL7KG3R9ux+wIMqWNft9sTrusAcJbxEb1DWmbs3voawE1drQMgpSbVwZzvuTD3k2Cewf8DXy3OsOxXWeDz3jtoiT7s6HVBbvH2nART+wCcw81sAZJY56s5Z9J5iYiEs7qgCUnFgGGMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPFE241D7F14.namprd11.prod.outlook.com
 (2603:10b6:518:1::d57) by CY5PR11MB6115.namprd11.prod.outlook.com
 (2603:10b6:930:2c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Sun, 18 Oct
 2026 09:09:26 +0000
Received: from PH3PPFE241D7F14.namprd11.prod.outlook.com
 ([fe80::e459:ea7c:45a:2ad3]) by PH3PPFE241D7F14.namprd11.prod.outlook.com
 ([fe80::e459:ea7c:45a:2ad3%4]) with mapi id 15.21.0522.017; Sun, 18 Oct 2026
 09:09:25 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Adin,
 Menachem" <menachem.adin@intel.com>, Andrzej Kacprowski
	<andrzej.kacprowski@linux.intel.com>, Karol Wachowski
	<karol.wachowski@linux.intel.com>, Reuven Abliyev <reuvenab@gmail.com>
Subject: RE: [PATCH char-misc-next 4/4] issei: add driver to driver interface
Thread-Topic: [PATCH char-misc-next 4/4] issei: add driver to driver interface
Thread-Index: AQHdXGYf3xuX1sqvBUuFh7/AAO76qrb+JGEAgABjOZCAAAlJAIAEdrLQ
Date: Sun, 18 Oct 2026 09:09:25 +0000
Message-ID: <PH3PPFE241D7F145C27D7309D06B89222F9ED992@PH3PPFE241D7F14.namprd11.prod.outlook.com>
References: <20261015-issei_pm_and_itf-v1-0-8212238a57a4@intel.com>
 <20261015-issei_pm_and_itf-v1-4-8212238a57a4@intel.com>
 <4253b355-9505-4854-8ee0-3c1db765d3d2@app.fastmail.com>
 <PH3PPFE241D7F14C878F571D90A5918000EED9C2@PH3PPFE241D7F14.namprd11.prod.outlook.com>
 <d753e1fa-29c1-4692-b2b3-d592475ae77f@app.fastmail.com>
In-Reply-To: <d753e1fa-29c1-4692-b2b3-d592475ae77f@app.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPFE241D7F14:EE_|CY5PR11MB6115:EE_
x-ms-office365-filtering-correlation-id: 4d0f5a02-3566-4e5d-8d7a-08df2cf781cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|38070700021|56012099006|11063799006|4143699003|261009223027099003|22082099003|10067099003|6133799003|18002099003;
x-microsoft-antispam-message-info: V86KdotfmTiCys0Vr6hgCpYEGUnBa9q6z5wb2sMO5QlZUYg1qVX4QwmgRUlamLHy6k8xYt5+Ttomd6v30OKIhETmDLiIv7mKCCA2Ba03eiufSU2uRc7xgXGLKiaQETFT9lbg6RrDr3uhTkTgSSYT7Krb+uN3v06wg+JplPkbMKrwPmQFsoEOlAaWwYzHq+MClvKUeWKDSfHLCn52yaf1g40MITyFTtG44gZfvIQNa4GfTPey7/qN9+39bVBTw2vUhnPGSF1OP9fFh7xt+PeQ1cxenpbXNCY4RrlQRswlAFPdh9Q9olKnIL7hgCedtKK/SLEXbs81KChH3mpKtNwc4escMQHewJ/R4nB6YzbZqH9xXdnvuHt8yjMLSG6vB8UfEOiQq49fTxmMIdR5kAFL5j0cyh9qTLvXqVIxOdOakJ7IA2MwlHqjcVIgSjs9Idzm4X9Vvq1lDgMC9RClYO14/XtKIkodIkmfOvXPgNtrWj3kw5DITD9QknTK0DJwJOmsgdqTTQ9Oa1kwiMcJw9CBVkCjVp9UeIy7glDM7K6VF4/uyHU00kx2HYQRLrvqxinSgDGDCe2dlTTIHYsTbcpdPHPoOx7zRNB+jDG8ame0b2U/P+FKoGzodYsl1tcCiH5u+Umeb2ZLFDaDetGVaD85iJq2+LFJXYJI62swMLlUK6QSmX4gwjQDIujjuOs+I6exofyxwK/3E/A6k7wkQch5nVpmZ5wn81C7wBLhZa+ybJc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFE241D7F14.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(38070700021)(56012099006)(11063799006)(4143699003)(261009223027099003)(22082099003)(10067099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkZYQkszWXJJOWVYWVZsZU96T01vb2pCTHlJb2RBY2NzUnROKzFSaTFwTWMw?=
 =?utf-8?B?UkgwZmxDTXVjRXcxZE4rWlNRaTFXdC92eUZqcndRdm5sRUFxYnd0WkJ4b0tX?=
 =?utf-8?B?cWVuV3NlZzBCbzRtcUdRZzU3TUdYNElZb3dPb1ZUeVZSOHFaSXVFU1gwNFJa?=
 =?utf-8?B?K3QxZ1l5dVYrVGVKbDEyVXZpeklzMkloWFA2YWlOdzdHelhyc0dFZVgyaW5U?=
 =?utf-8?B?QlZIbWdJdys3V2UxQzJyYlVRSnBjZ1RvWXZxWFdwVDI4ZmVPUTIraVJUTWtO?=
 =?utf-8?B?SDRGUzR0NFdnS0ZQTVU4VE1LTU0rT0xqZk13Ti9xUEZFTk43MGhQTmprWC9W?=
 =?utf-8?B?eWw3NmR2bFVSbDBTQjVRSyszOG5oSUVSN2NDenk3MGZsR3pzbHF4MitEVkx5?=
 =?utf-8?B?YTBzcWN5N011Tjhwd2d4UzdvaXZoZGxFUlJTd3dlV3N0dG02VG5YaWFJV0o3?=
 =?utf-8?B?RmRsUUJCUC95bUdMdWxnekUwRzhZMEN1Qm12NVc2VWc3SmRxRXJ5RnBJTkVi?=
 =?utf-8?B?RU9nQU91UHlTVkJSaWlSZHZwdUZsYThnbnVXWC94QUdWY3RYd1JqWENFazFJ?=
 =?utf-8?B?TGxnQ20yTXlYRkdHL0J2U1dlcWRrdHdCYTE1TWhpNjFNY0FUeWwwT3F4UzJw?=
 =?utf-8?B?cTg4bjRJazdQdUV0cTlNd0lFTVBqYjB3MTR1NTNsenVGbDI0WkQ5QzBJWHdy?=
 =?utf-8?B?MDJ0M0lsR2ROYTE3d3AyM2ZRbkJqQVpoTmxBNFBRR0QzTVVaeE93ZkNMSENT?=
 =?utf-8?B?UzBLUUV3ckNkTklWc2VxWWc3MTBneVFIUDFJS3lxeEhMYVBZV2VjUHFTTmxk?=
 =?utf-8?B?d0tDQWI0T0oxcnhPS3FRNEtwaXNYTitnZTE3L3VZVkxTWFhrVGtsUjZ6T3gr?=
 =?utf-8?B?emkzVGNtQzhWeDkySENEU3lJWUloMmZlY3NpOTYxQ3ZqUTdkbVY5OHQvZVhs?=
 =?utf-8?B?bkQ1blJjeWtVaFpJclZhSVFXRGtBKzU2dWFYQ1plazMrc3dzMHZsSHhveWFp?=
 =?utf-8?B?QzZaeUpSWU9zbm9oODE0Yk5iemlxWFNSTjczY0RFQTFzMTNKbWJaVU1SbHpI?=
 =?utf-8?B?bDJKRUtZdTVYZlduSlNlNEk2bjQycHdsakhtZVhtZnMvc29MNUlDdnVSWllO?=
 =?utf-8?B?L04rNWR6VHhXL3Y4TE5uUFhXcVJnR2lPejNmZE9sYkg4b2NYQ2k0a1I5SXNk?=
 =?utf-8?B?QTA5MEtEM0lnM1pXakRZSHZEUVZqejUvREx2QTBJUUdOek5vVExTeCtmTEhh?=
 =?utf-8?B?aTFydjlqTnVGbk92ZDNBQzFLVThFODNMMGlJMnFlenM3Mzh0UitUTDR3a3pV?=
 =?utf-8?B?NlkyZ3l3ZGV0UkFUa1B2RGcyWG9aV3F2MjVxQkY4MzBZbkZudnBCOEJPQW5T?=
 =?utf-8?B?SDFGRGFuOUd3bW1DMWlsM2YreXhHNzhvNHJ2cHVCMkQ2bndIcUhBUG5mVEhk?=
 =?utf-8?B?RjVuUUxhK1hLT0F3M2ZZdXkxOXpCZWovcG9CZWlNUGtpSjhoRHJ6MitIWHJ5?=
 =?utf-8?B?WFVjQUZBYjcrb3JNdnF0d3dtQkFDellnTTFmV3JTRGEwNWxzUjJJa2RTblZq?=
 =?utf-8?B?MHBjY1VacU1OOHVtZ2lKSzdXTTBxOG1DNjJkbVVzd3dkRFNEVnd4emtvelR2?=
 =?utf-8?B?MmRCS3V0T0IyWDNHd1BjcExQczl2T1FIMUFhSCtZaFFtcGpxMU1oTGhJd2dK?=
 =?utf-8?B?OXNZRk9ON3FSUUxuOUhVbXVQS0VYTmt2bEgyYk9GRG1aVWJVN05OR21XV1lX?=
 =?utf-8?B?ODBPUEMwL3RZWHRmcURFZXB3Qms4dy9uVldTQUFyYS8zN0QxN2tXU2xsSVRT?=
 =?utf-8?B?V3hnZkErbHJaaXlZWXhKUnpkSENMOUQyNnN6WUFqdENHR3Axc0dHSkFOWGov?=
 =?utf-8?B?Qi9WR09scmN1aDczcGNJUVNHRjByOXdtQ2pBdEh4ekFsRVpGeDNGQlc4Nkxu?=
 =?utf-8?B?VGd4bDZKSFgzekZuWVVOQ1RRU1RZdlZMcms4YVJ2MGY4M3RGcWNwcnVoM0RH?=
 =?utf-8?B?QnJPR2J1eUsxSUNqMi9PbTZGUkpYejNUUkdRQmtuUnN5V0VLKzc2cVI1YWNY?=
 =?utf-8?B?a1l4NC84aTUvdThZbWUzcENxaXN6ZlJ3MEd6eWpIbGk2REdZQWJsenFHRHd2?=
 =?utf-8?B?UzdJd2JJZXpzbjhMSzdTcjNLTnM0V2hBeW5zaHFUYTJuS3dkYUNEQUF4QWxY?=
 =?utf-8?B?WkRrQjJzdFlnU1FZcWE4OHBxNVdmQkI4aDhrak1SRkdJRXp5RWo5SWFTYlNT?=
 =?utf-8?B?QnhaVDhxbU91T0dheWtxdDJad1I2Qnh5WHo1TWcvOXl5U0FVeS8vMVJ5TFhv?=
 =?utf-8?B?UjRCbGNkV3NRYXppKzZUMStoVEkxS2J2bWxYNFlwOFY5VUpJejNVUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TOkyPkrTUvErAyQKUTw/t5EMG9Kc5Acu6SXA/ph1nPGGSvrzmeuRT3CUq4wZPd0aaUxhxsHgpBvIX64MTtlo/Z408k51kXkYi7ILTqO2pyGZ8u9PZaoMLduB7QLyMqI7IX5ymNGsqJBA0FbkAsH+TTL3bT+3PKKwM6Fhp/BF0aBG2KPY1s+tzXdzty3NoB/Hwf6n5VTd4eVLBRSBlrsM0FiOuz0uW4UGQ8aJj6WW+qiS/SbG9vrJ/JNHsgJ7EA+JhCLsu5QtxwAOWRi4LkXA5ebsCLuNMHXTaVM4fxXxM3A+N+GQlaLDrgHNHfgxnwSKiZuBrus7mEfaQv15dMftCw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFE241D7F14.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d0f5a02-3566-4e5d-8d7a-08df2cf781cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2026 09:09:25.5885
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WXPgO0plgErq71ShLeKV/G61hhbjhthlr0iZ6N7qcPHXXHOUQRhd4I1yoEW867d/TQKxIlyaQuBRXXw5JQmRCae2qTa5GuVMqZyoXpVjaNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6115
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBSZTogW1BBVENIIGNoYXItbWlzYy1uZXh0IDQvNF0gaXNzZWk6IGFkZCBkcml2
ZXIgdG8gZHJpdmVyIGludGVyZmFjZQ0KPiANCj4gT24gVGh1LCBPY3QgMTUsIDIwMjYsIGF0IDE0
OjQ3LCBVc3lza2luLCBBbGV4YW5kZXIgd3JvdGU6DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
Y2hhci1taXNjLW5leHQgNC80XSBpc3NlaTogYWRkIGRyaXZlciB0byBkcml2ZXIgaW50ZXJmYWNl
DQo+ID4+DQo+ID4+IE9uIFRodSwgT2N0IDE1LCAyMDI2LCBhdCAwNzoyOCwgQWxleGFuZGVyIFVz
eXNraW4gd3JvdGU6DQo+ID4+DQo+ID4+ID4gKwlpZiAoaWRldi0+cnN0X3N0YXRlICE9IElTU0VJ
X1JTVF9TVEFURV9ET05FKSB7DQo+ID4+ID4gKwkJd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlX3Rp
bWVvdXQoaWRldi0+d2FpdF9yc3Rfc3RhdGUsDQo+ID4+ID4gKwkJCQkJCSBpZGV2LT5yc3Rfc3Rh
dGUgPT0NCj4gPj4gSVNTRUlfUlNUX1NUQVRFX0RPTkUsDQo+ID4+ID4gKw0KPiA+PiBtc2Vjc190
b19qaWZmaWVzKElTU0VJX0RFVklDRV9DT05ORUNUX1RPX01TKSk7DQo+ID4+ID4gKwkJaWYgKGlk
ZXYtPnJzdF9zdGF0ZSAhPSBJU1NFSV9SU1RfU1RBVEVfRE9ORSkgew0KPiA+PiA+ICsJCQlkZXZf
ZGJnKCZpZGV2LT5kZXYsICJEZXZpY2UgaXMgaW4gdHJhbnNpdGlvblxuIik7DQo+ID4+ID4gKwkJ
CXJldHVybiAtRU5PREVWOw0KPiA+PiA+ICsJCX0NCj4gPj4NCj4gPj4NCj4gPj4gVGhlIHdhaXQg
bG9naWMgaXMgaW5jb25zaXN0ZW50IGhlcmUsIHRoZSBmaXJzdCBvbmUgaWdub3JlcyB0aGUgdGlt
ZW91dA0KPiA+PiBhbmQgcGVuZGluZyBzaWduYWwsIHRoZSBzZWNvbmQgb25lIGZsaXBzIC1FUkVT
VEFSVFNZUyB0byAtRUlOVFIgYW5kDQo+ID4+IGV2ZXJ5dGhpbmcgZWxzZSB0byAtRVJFU1RBUlRT
WVMsIHdoaWNoIGlzIGFsc28gcXVlc3Rpb25hYmxlLg0KPiA+Pg0KPiA+DQo+ID4gRmlyc3Qgd2Fp
dCBpZ25vcmVzIHRpbWVvdXQgYXMgaXQgb25seSBpbnRlcmVzdGluZyBpbiBJU1NFSV9SU1RfU1RB
VEVfRE9ORS4NCj4gPiBJZiBhZnRlciB0aW1lb3V0IHRoZSBzdGF0ZSBpcyBJU1NFSV9SU1RfU1RB
VEVfRE9ORSAtIHdlIGNhbiBjb250aW51ZSBpbg0KPiBmbG93Lg0KPiANCj4gQnV0IGlmIGl0IHRp
bWVzIG91dCwgaXQgd29uJ3QgYmUgaW4gdGhhdCBzdGF0ZSB1bmxlc3MgeW91IGhpdA0KPiBhIHRp
bnkgcmFjZSwgZm9yIGNvbnNpc3RlbmN5IEkgd291bGQgYWx3YXlzIGNoZWNrIHRoZSByZXR1cm4N
Cj4gY29kZSwgbm90IGNoZWNrIHRoZSBjb25kaXRpb24gYWdhaW4uDQo+IA0KDQpXaWxsIGZpeCwg
bG9va2VkIG5vdyBhdCB3YWl0X2V2ZW50X2ludGVycnVwdGlibGVfdGltZW91dCAtIGl0IGNvdmVy
IGFsbCBjYXNlcyBuaWNlbHkuDQoNCj4gPj4gPiArI2lmIElTX0VOQUJMRUQoQ09ORklHX0lOVEVM
X1NTRUkpDQo+ID4+ID4gKw0KPiA+PiA+ICt2b2lkICppc3NlaV9kZXZpY2Vfb3BlbihpbnQgKCpt
YXRjaCkoc3RydWN0IGRldmljZSAqLCBjb25zdCB2b2lkICopLA0KPiA+PiA+IGNvbnN0IHZvaWQg
KmRhdGEpOw0KPiA+PiA+ICt2b2lkIGlzc2VpX2RldmljZV9yZWxlYXNlKHZvaWQgKmN0eCk7DQo+
ID4+IC4uLg0KPiA+PiA+ICsjZWxzZQ0KPiA+PiA+ICsNCj4gPj4gPiArdm9pZCAqaXNzZWlfZGV2
aWNlX29wZW4oaW50ICgqbWF0Y2gpKHN0cnVjdCBkZXZpY2UgKiwgY29uc3Qgdm9pZCAqKSwNCj4g
Pj4gPiBjb25zdCB2b2lkICpkYXRhKQ0KPiA+PiA+ICt7DQo+ID4+ID4gKwlyZXR1cm4gRVJSX1BU
UigtRU9QTk9UU1VQUCk7DQo+ID4+ID4gK30NCj4gPj4NCj4gPj4gV2hhdCBpcyB0aGUgaW50ZW5k
ZWQgdXNlIGNhc2UgZm9yICFDT05GSUdfSU5URUxfU1NFSSBpbiB0aGUgY2FsbGVyLA0KPiA+PiBh
bmQgd2hhdCBkbyB5b3UgZXhwZWN0IHRvIGhhcHBlbiB3aGVuIENPTkZJR19JTlRFTF9TU0VJPW0g
YnV0IHRoZQ0KPiA+PiBjYWxsZXIgaXMgY29uZmlndXJlZCBhcyBidWlsdC1pbj8NCj4gPj4NCj4g
Pg0KPiA+IEZvciBDT05GSUdfSU5URUxfU1NFST1tICNpZiBJU19FTkFCTEVEKENPTkZJR19JTlRF
TF9TU0VJKSB3aWxsIGJlDQo+IHRydWUsIEkgaG9wZS4NCj4gDQo+IFllcw0KPiANCj4gPiBDYWxs
ZXIgYW55d2F5IHNob3VsZCB3YWl0IGZvciBkZXZpY2Ugd2l0aCBpc3NlaV9kZXZpY2VfcmVnaXN0
ZXJfaW50ZXJmYWNlKCkNCj4gYW5kDQo+ID4gaXQgd2lsbCByZWNlaXZlIGRldmljZXMgYXMgc29v
biBhcyBtb2R1bGUgd2lsbCBiZSBsb2FkZWQuDQo+IA0KPiBJZiB0aGF0IGNvbmZpZ3VyYXRpb24g
aXMgYWxsb3dlZCwgdGhlbiBjYWxsaW5nIGFueSBvZiB0aGUgZXhwb3J0ZWQNCj4gZnVuY3Rpb25z
IGNhdXNlcyBhIGxpbmsgZXJyb3IuIFlvdXIgb25seSBvcHRpb25zIHJlYWxseSBhcmU6DQo+IA0K
PiBhKSBwcmV2ZW50IHRoZSBicm9rZW4gY29uZmlnIHVzaW5nIEtjb25maWcNCj4gICAgJ2RlcGVu
ZHMgb24gSU5URUxfU1NFSSB8fCAhSU5URUxfU1NFSScgZm9yIGV2ZXJ5IGNhbGxlciB0byBmb3Jj
ZQ0KPiAgICB0aGUgY2FsbGVyIHRvIGUgYSBtb2R1bGUgaW5zdGVhZCBvZiBidWlsdC1pbiBkcml2
ZXIuDQo+IA0KPiBiKSByZW1vdmUgdGhlIHN0dWIgaGVscGVycyBhbmQgdXNlIGEgc2ltcGxlciAn
ZGVwZW5kcyBvbiBJTlRFTF9TU0VJJw0KPiANCg0KV2lsbCByZW1vdmUgc3R1YiBoZWxwZXJzLCB0
aGV5IGRvIG1vcmUgZGFtYWdlIHRoYW4gaGVscC4NCg0KPiAgICAgICAgQXJuZA0KDQotIC0gDQpU
aGFua3MsDQpTYXNoYQ0KDQoNCg==
