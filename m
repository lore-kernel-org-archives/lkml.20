Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3648E3AA4E1
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792392093; cv=fail; b=J7skqFXatgJzdQDnTNpD2HOdsXSJqLPa18RjTatm9XMUKHI6pCUq7qFMd1dxTSmXuA9zz4vSWaqjcWlMlnZG1lIv1Rd635h1609JDRg2dl1k7s07uhXawN61KJfZKGElEP36EdYakrJTWo4AFFMCga4RsLQNl5/BqQw8H4J6+vY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792392093; c=relaxed/simple;
	bh=Dv0nfFXLAErTO16JyFBCHBc0P5U/6ee4Kne8IuU/Xo8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pkXHXJqx+J3DtyX2d+mobqWfuHjMIqYZQhnTYe8sb+1ckde0asNf0VLRJWgskK245Lp8NkTfmaDLKwt5svmV3NTXeNU9gnjvl13FeWWyQ8LGCRYJsOLmer8ofWuQ7VXXl9yCQti3u+kXAqr8n6UBv8E+VPW0hoRY79RJqZQFPVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BSTUqP1X; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BSTUqP1X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792392091; x=1823928091;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Dv0nfFXLAErTO16JyFBCHBc0P5U/6ee4Kne8IuU/Xo8=;
  b=BSTUqP1XSNcW07ZCPGq+jmqix1liIQuDi/dzF+Js9+C1pSBO027Dr1JQ
   SaG1WiKDkCNDhOBqj+lc6u7QaD67oaE+nyb9e4jzldLLCdpx61R0mGf6m
   WWuICkE3G5WCVdGizjDlRzfIEFwsUyQkZ4RAtPhc+VNzRhvdxXrUYgGGj
   uR1QLhehgqmgmsHnD5yKOTc1Ehf0bpZYDtAI9RSrx270GrqEQuCKott3x
   sCm6373M3OMMC87yQ/EcAxqIlcVxQW+hXESZYwOVmgJ1bHV125ZjYYzUB
   ttzxrHRG+x4jem9pVJHJ9nrPYl4ftclFWb4CAF/AUbSauvBUBDbltadkw
   w==;
X-CSE-ConnectionGUID: /gGR57jCStClNM9P2TPIuA==
X-CSE-MsgGUID: KHDehgpQQJqgsmBWevcu7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="972394"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="972394"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 23:41:30 -0700
X-CSE-ConnectionGUID: bTETQCUrTgq0OTzJBl04zQ==
X-CSE-MsgGUID: 9oRJnGkHRtWllhdygfMmMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2858111"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 23:37:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 18 Oct 2026 23:37:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 18 Oct 2026 23:37:25 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.47)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 18 Oct 2026 23:37:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q5RMZbCv2cGbGqhDGfgIL/xPjq4lgQYahmKpNFHAFDQ3fMAxLnvRAUvOnWefqK5ogX3DVGIo+p77wVHAwheYNI7TB9LYgQE12grnWl+5ij0E4wNgv1RG7CY6+l4Pb15v8PbQS4a2fcvDxDhBJ+QIIpaGYIQDkE7fobu75Skum1+2pthN91u5VDHmAjtwD/MqlKVnMG9duZGSzKH/01JwhXylTH0c3Vj4Q0lH4ZktoPLGGhcCHmj+NEkBODK6sRF08CbbKxPzKfZE6WPIk5VCxvWKo07ySD7iqL3ZmDablCMhusVt5kacTU6pzFV5p0u99LJaMkNG2otNDn/qh96wcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dv0nfFXLAErTO16JyFBCHBc0P5U/6ee4Kne8IuU/Xo8=;
 b=BkZrIaU9sxbAX0Tq7+dOxHPXAfMfW3UZ7ljO6VxPphwOXWDRHcuKBEm1QtiK1OF1Y+AJKQMtMxAkhXFq2/DHPr6GZWmbuzTS9z0UlPAfXr9gFTehqE9aUejdXKhiJNWeFLN6qLapezLB61QgchO59D7GGNZ3zK3rnVYIZ84TmtbI62vQemarQS/rYTQCuuhbFGkmIqYC2jIBJ/DNMA0U7GA5Pgl4WA87jFlchAPtH8xJ2FxXHjn/pFhVHHxBD9XvVrAHPzAg9xtLfZzWqnAlYRjxUolXlY7IozM88kwFUjJZOc+SrwmBK7wb21uPmPp/CJE0ZBIPk5bnI2tQA+unUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPFE241D7F14.namprd11.prod.outlook.com
 (2603:10b6:518:1::d57) by SA1PR11MB8490.namprd11.prod.outlook.com
 (2603:10b6:806:3a7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 06:37:23 +0000
Received: from PH3PPFE241D7F14.namprd11.prod.outlook.com
 ([fe80::e459:ea7c:45a:2ad3]) by PH3PPFE241D7F14.namprd11.prod.outlook.com
 ([fe80::e459:ea7c:45a:2ad3%4]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 06:37:22 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, David Laight
	<david.laight.linux@gmail.com>
CC: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Vitaly Lubart <lubvital@gmail.com>, "Karol
 Wachowski" <karol.wachowski@linux.intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] issei: INTEL_SSEI should depend on X86
Thread-Topic: [PATCH] issei: INTEL_SSEI should depend on X86
Thread-Index: AQHdJYiVaJdWcRApYkq6Q2Y30S7BBbawKfAAgABSQICAATamAIAGrFYAgAAXXiCATGZlEA==
Date: Mon, 19 Oct 2026 06:37:22 +0000
Message-ID: <PH3PPFE241D7F1486A6B879134C0FE43F3FED982@PH3PPFE241D7F14.namprd11.prod.outlook.com>
References: <7145ead76cf7cf399eb4e1e6039f51cae07b49b4.1786009079.git.geert+renesas@glider.be>
 <20260826100848.12eaf40e@pumpkin>
 <CAMuHMdWDcfrUM4tKGOO3fHJQ3FnYBu-tPG61BY_069Yv_TxXKw@mail.gmail.com>
 <20260827093502.23b6b062@pumpkin>
 <CAMuHMdVWvezFSy3y8mwQvTxxp0C-Pr3YuSEuHGm4P+7kR80+nA@mail.gmail.com>
 <CY5PR11MB6366EC84A3D4511C5217A1EDEDA92@CY5PR11MB6366.namprd11.prod.outlook.com>
In-Reply-To: <CY5PR11MB6366EC84A3D4511C5217A1EDEDA92@CY5PR11MB6366.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPFE241D7F14:EE_|SA1PR11MB8490:EE_
x-ms-office365-filtering-correlation-id: 209a73ec-300b-412c-b4e5-08df2dab6e9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|261009223027099003|10067099003|56012099006|22082099003|18002099003|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info: 2NJFXG5SIHwnaBY7ZpHWYMhkdA9rqj46KhvyJPAVDKMM1s8kiFpg795LriRPxrQwRMxN1MwwSM670G5WjccbL3axjo6FS9TRDmx3RwFdd4rWDVkK0Oe5FEGTKxgrNrGVYQk7CYJu+/RihwjPeTPny7JvtTnb7BCtJkKPn1xypx5YTinEL7Nlad3KpCDpj1QtIc4oQ/OulRu8TpWz+fVc3mwROLu+Sc3uFaBm7t7MubvUXTSWE7gtoZKHKNzBQz+U/edhw5uuIFXjQg8GAcCKmfmSiftv41Ur0vfJupWNkazSo8eHTauZ1EELEyxdSn4XPdyJy9AqR//kjcIPrASSNEM3k9nOe2ObJoaGJRFNTc3rZdYkyMap1NgUWo6/IEFw5zqkG7wST4WwXKrf2W6/pfayooMlRig4y0imY3+Lu60rtMykiQPDSLmzWo2YdQ9ZUWnFLnl3s9yOiYjW6PFdG/DehUXuJmZGfGCA2Ese59rPGWFX+Khd9p5RNLyANUawKTFMaBESuIE7cxG33iu6eqPvlvhxN8/t+bCBpbY2/sX3kHiQRxuEjkEH4GKdNvtu0PWUsG8YKynaG2aFvzHmMqztLz+Apj3K6IbedJ2O61IIai+RC8Pjh9mwtpM7mB6WTkmZO+NYWtKuZGdPhyqwi7P1K65UsA5vA8DT2OlNqlEG6Mke8CkvcxpE9ZdDzias+JQrPB/a5r+ExskFntsEImCxKkLyyShkyaAuNahXK3M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFE241D7F14.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261009223027099003)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXJTRHdJR3RrS2pITXU0Q1EzYXpVYnN3NWw4dXk1ZFFZL05wY2JVUEMvQVZh?=
 =?utf-8?B?eFZkSnYzMzVBVUtxN2FRZzQwVjBQU29iemlyWlBBVGFwUmdsbDBqSCtGMkFN?=
 =?utf-8?B?Vm9tYURTNUxWNndwa2VKTFkxbWE5UXo2U3JWcTJRdGRaWDFZbnVzY3kreXRl?=
 =?utf-8?B?ZkhYSFhSYm5QWG0xRmhFSjJzckVUdFZYVTlNTUdGNVBRZTBvRkQvOFYvS29o?=
 =?utf-8?B?SDgwR1NVQ28vdE9EQ1lSZ2ZaQzJoeGxqMzlKK3JPOWRtdHFSY1hMeDgvZEsv?=
 =?utf-8?B?WXlmWDBxMVRHc0h1K0o3c3RuajlHT0IydE5CL3A0TXZaTjlZcHNVM1Jybmd3?=
 =?utf-8?B?NUw3SkNlMnhXSUJRZFgwRXFiU2p0bDVoY20za2dmMjRMUy9zQ3RKUTdKeU83?=
 =?utf-8?B?NEFQTDdKSFJwdTgzNUk1NnlmMkU2SzlRYjFGYXdjSzlGbkhMUmZsbjZ6K0c0?=
 =?utf-8?B?c2FBcTBoUkFSRkt6bnR1a0NpZ3V1OFphY25zMmhzTzFaMDlIMk1qb1M1d3Bq?=
 =?utf-8?B?ZDJhQVlBbXg2c3VBRDJsS2xNb29MOHdKeS9raThFOEV5a1c0Tmc2K0k1L2ZZ?=
 =?utf-8?B?bDlkQ3VZNTBwYUlVM3dzS1BrZndqYTkyYWY0bVA4U3ZBa3d2bkNiZWtqVHlM?=
 =?utf-8?B?aDBPTmlod09SbWlWRDJjU0daY0M4QkkwTVVlamlER2Y1VEZxdElpMDhZMG00?=
 =?utf-8?B?SitwdEsySVVBcjg0OWpBYThTbzJzZDZrTElKVlVTb3FHamlHWml6cS9tWjhO?=
 =?utf-8?B?RURLVUZsSGJjS1BKQ2lUZFh1djFJeG1KTGFNdjF4K08weGVuVFEyQitWd0NP?=
 =?utf-8?B?ZVJvUjREdkpDRTFOdVNOOG5UK3hlc0ZOdC81cHk5Tkl1dVdCMTVYaXlzem5J?=
 =?utf-8?B?Q0JUVEpRNWg2VXZEU0JDcm10MkNnRElaWkNqSFVIZE9xUjFtZFlMRGFVR2lw?=
 =?utf-8?B?cUZGYitrVkxFS2tkcisrZTZJRHd2eVUyVmRSbkNMLy9paW05RTJ1M3I3K3cr?=
 =?utf-8?B?RjRaeEgwTmlCQ0NUeXZ1TnE5ZlNpU2pVVG44YVIvOTVXbElQTUdXNVNhTmk4?=
 =?utf-8?B?S1ZOSm1qWjRpL2xoSFhGdU9CUzRvTFJXc3B2by9PZk5paTc4OHNyOVJHUSt4?=
 =?utf-8?B?OFdWS05XdWN5Y0VRenQyUFd3T0Z2dTVDUmxYRlZQRytnSEdRdXdCT001UUdV?=
 =?utf-8?B?ajZ2U3BJWHhCd200cWFJRkU0Q1VTM1FQT08zL2JjVmYvRmJCcWl2MHVHVExC?=
 =?utf-8?B?T2x4YTFBWFpOTTdnZkFtUnVhV1ZqLzRCQ1VQdTBQNE9wTXc4aUQxSTVBeEVP?=
 =?utf-8?B?MzI0N09zSHdXSnZYOW44dE9KaGRUN2daMDU5cFAzZzQ3enVOc3lJUml2enVE?=
 =?utf-8?B?S2xBYURRTnpBT1lVVlV4Z2Q5aFR4cVlVMzhpL0gyVGxXZGp4NjdMcU1kYjdp?=
 =?utf-8?B?RklleC9sYS83cVFBZWt5cW9iLzRGc3BTNlFKcGpxTjlEOFNTenNiT2NaS21m?=
 =?utf-8?B?VEU1YjVOVGVONzU2S2JnL3ZNYXZkMnJvbFhHaGxydWNpeGpHRjZOOHhJTVJB?=
 =?utf-8?B?R2R2a2k4OHRTUFlkRWxnL20vZHFyNHZtY0ZOekpDV1paVTlJQXB4V21kZEZX?=
 =?utf-8?B?QkpKeG9LMHcxUExmYm10NkdJTVI1cGdOaGFRS3VDdXdoNjJGT3JQVVpuSzBi?=
 =?utf-8?B?dlZtVmhON2tmWGNSMHh6SnhQemYwUzR1RVJsOW5qOFk3b0FVMVo5cCtseXhJ?=
 =?utf-8?B?bXp1WllTSkFvSmNobGFhWjNQUlRPT3VrNC9OQlYwTUlZMTB6eUtScUpEVHN2?=
 =?utf-8?B?WWZHRWpvaFBaYjI4V3VPVmZsT2tra3pKUWhFM1JIM25iUVVQb0NGQUs3U3BP?=
 =?utf-8?B?eVRJNzBPaDZwdVJlaDVDYVprM21yVVc0NG42ZmpIbVdyd2NyYkwybzhBSjJM?=
 =?utf-8?B?aFh4WnlrTXloeGkzMWtPeGNHSUNvbUE4OXVVQWxmdWNWRjFTUEVPTWl3UUta?=
 =?utf-8?B?dHI2b0YwRXRTY3h0cGdTWGVRUkRxd2hnUDBOTWtZMVJRcTdGb2xtb2VVUnVU?=
 =?utf-8?B?UEFUOFFtMVlMSjdjN1ppTjJZR2pYL0hoRjdOVDZwd2p3dlFkOTVlaGpHSjNt?=
 =?utf-8?B?ZFh6S2pqK2dWSHlZUWpUaThudktINzRKdytkbVlBb2ZyZVhNRzZod0pIL2U4?=
 =?utf-8?B?REszb1dGbm5jNW5SVnNNZGxEUGZLZVBNd0k0bXNEL0JleVB1a3NTM2dZREpz?=
 =?utf-8?B?NEV3Z0VNaklMaU5xc1l0QXZWcFZub1prTmExd2Mzb0RjcDRtZUwzQkh1QTlX?=
 =?utf-8?B?RjFGVVRrdEd6REg2ZWFJeS82bHlwRlZNaXg5aXgxZ3NqNG1VckhRZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: os1iLq+er/GSg0KqrofY0HTXeRmBW7+Be6CYkOh7Ah3KCddrUWwJErkw44JqyJsUDgZ/6uZj3xyy5OiLeUAmrsl0YxtetRRGdpzzw5rcHGqtk66jfIyuscZLCkeWoHLc2sdiVL0KJ/rUclDh8uOyac1rrpUXnGnddVyjFE6gLuWsYwenrN93hylduB5kWeySSJtN+S3qiykWChulR/WQPgvpuVUcU/Q3HiE33CWRzHo4VZnazaGnlQ0YyHsWL+WXkskPGa1kE7FtocWKBP7ZM03uuI9GDxX4dfv2bCGqNcJEyvzRaS1SOoJG5pReEpOOkg1X7PoX/uXyIwpNvJuGEg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFE241D7F14.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 209a73ec-300b-412c-b4e5-08df2dab6e9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2026 06:37:22.7858
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tRwAwXwx49VP11P4yO9O+nqvxiQZcAWjSHgWQKSs2mBxjjX0EdOyA/AlnooxeLICimEwDU8TBAtKVmZXgyHoslNo4uPsT29Vs89j7LtZBFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8490
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBSRTogW1BBVENIXSBpc3NlaTogSU5URUxfU1NFSSBzaG91bGQgZGVwZW5kIG9u
IFg4Ng0KPiANCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIXSBpc3NlaTogSU5URUxfU1NFSSBzaG91
bGQgZGVwZW5kIG9uIFg4Ng0KPiA+DQo+ID4gSGkgRGF2aWQsDQo+ID4NCj4gPiBPbiBUaHUsIDI3
IEF1ZyAyMDI2IGF0IDEwOjM1LCBEYXZpZCBMYWlnaHQgPGRhdmlkLmxhaWdodC5saW51eEBnbWFp
bC5jb20+DQo+ID4gd3JvdGU6DQo+ID4gPiBPbiBXZWQsIDI2IEF1ZyAyMDI2IDE2OjAzOjExICsw
MjAwDQo+ID4gPiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90
ZToNCj4gPiA+ID4gT24gV2VkLCAyNiBBdWcgMjAyNiBhdCAxMTowOCwgRGF2aWQgTGFpZ2h0DQo+
ID4gPGRhdmlkLmxhaWdodC5saW51eEBnbWFpbC5jb20+IHdyb3RlOg0KPiA+ID4gPiA+IE9uIFRo
dSwgIDYgQXVnIDIwMjYgMTE6NDY6NTUgKzAyMDANCj4gPiA+ID4gPiBHZWVydCBVeXR0ZXJob2V2
ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPiB3cm90ZToNCj4gPiA+ID4gPiA+IFRoZSBJbnRl
bCBTaWxpY29uIFNlY3VyaXR5IEVuZ2luZSBpcyBvbmx5IHByZXNlbnQgb24gc3lzdGVtcyB3aXRo
IEludGVsDQo+ID4gPiA+ID4gPiBMdW5hciBMYWtlIENQVXMuICBIZW5jZSBhZGQgYSBkZXBlbmRl
bmN5IG9uIFg4NiwgdG8gcHJldmVudCBhc2tpbmcNCj4gPiB0aGUNCj4gPiA+ID4gPiA+IHVzZXIg
YWJvdXQgdGhpcyBzdWJzeXN0ZW0gd2hlbiBjb25maWd1cmluZyBhIGtlcm5lbCBmb3IgYSBub24t
eDg2DQo+ID4gPiA+ID4gPiBhcmNoaXRlY3R1cmUuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBTaG91
bGQgaXQgYmUgWDg2XzY0ID8NCj4gPiA+ID4NCj4gPiA+ID4gSSBkb24ndCBrbm93LiBDYW4geW91
IHN0aWxsIHJ1biAzMi1iaXQga2VybmVscyBvbiB0aGVzZSBDUFVzPw0KPiA+ID4NCj4gPiA+IFlv
dSBzaG91bGQgYmUgYWJsZSB0bywgYnV0IHRoZXJlIGlzIG5vIG5lZWQgdG8gc3VwcG9ydCBuZXcg
ZmVhdHVyZXMuDQo+ID4NCj4gPiBGVFIsIElOVEVMX1NTRUlfSFdfSEVDSSAod2hpY2ggZGVwZW5k
cyBvbiBJTlRFTF9TU0VJKSBkZXBlbmRzDQo+ID4gb24gWDg2LCB0b28uDQo+ID4NCj4gDQo+IElO
VEVMX1NTRUlfSFdfSEVDSSBpcyByZWxhdGVkIHRvIHNwZWNpZmljIEhXLCB3aGljaCBpcyB4ODYs
IGluIHRoZW9yeQ0KPiBJTlRFTF9TU0VJIGlzIEhXIGFnbm9zdGljLg0KPiBCdXQgaW4gY3VycmVu
dCBzdGF0ZSBoYXZpbmcgb25seSBvbmUgSFcgaW1wbGVtZW50YXRpb24gaXQgbWFrZXMgc2Vuc2Ug
YWxzbw0KPiBsaW1pdA0KPiBJTlRFTF9TU0VJIHRvIFg4Ni4NCj4gTm90IHN1cmUgd2hhdCBiZW5l
Zml0IHdlJ2xsIGhhdmUgZnJvbSBYODZfNjQgdGhvdWdodC4uLg0KPiANCj4gLSAtDQo+IFRoYW5r
cywNCj4gU2FzaGENCj4gDQoNCkxvb2sgbGlrZSBpdCBpcyBzdGFsbGVkIGFuZCBJIHByZWZlciB0
aGlzIHBhdGNoIGluIHRoZSBvcmlnaW5hbCBmb3JtLCBmcmFua2x5Lg0KDQpMR1RNDQpBY2tlZC1i
eTogQWxleGFuZGVyIFVzeXNraW4gPGFsZXhhbmRlci51c3lza2luQGludGVsLmNvbT4NCg0KPiAN
Cj4gPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvbWlzYy9pc3NlaS9LY29uZmlnDQo+ID4gPiA+ID4g
PiArKysgYi9kcml2ZXJzL21pc2MvaXNzZWkvS2NvbmZpZw0KPiA+ID4gPiA+ID4gQEAgLTIsNiAr
Miw3IEBADQo+ID4gPiA+ID4gPiAgIyBDb3B5cmlnaHQgKEMpIDIwMjMtMjAyNiBJbnRlbCBDb3Jw
b3JhdGlvbg0KPiA+ID4gPiA+ID4gIGNvbmZpZyBJTlRFTF9TU0VJDQo+ID4gPiA+ID4gPiAgICAg
ICB0cmlzdGF0ZSAiSW50ZWwgU2lsaWNvbiBTZWN1cml0eSBFbmdpbmUgSW50ZXJmYWNlIg0KPiA+
ID4gPiA+ID4gKyAgICAgZGVwZW5kcyBvbiBYODYgfHwgQ09NUElMRV9URVNUDQo+ID4gPiA+ID4g
PiAgICAgICBoZWxwDQo+ID4gPiA+ID4gPiAgICAgICAgIFRoZSBJU1NFSSAoSW50ZWwgU2lsaWNv
biBTZWN1cml0eSBFbmdpbmUgSW50ZXJmYWNlKQ0KPiA+ID4gPiA+ID4gICAgICAgICBzdWJzeXN0
ZW0gcHJvdmlkZXMgYSBjb21tdW5pY2F0aW9uIGNoYW5uZWwgYmV0d2VlbiB0aGUgaG9zdA0KPiA+
IGFuZCB0aGUNCj4gPg0KPiA+IEdye29ldGplLGVldGluZ31zLA0KPiA+DQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgR2VlcnQNCj4gPg0KPiA+IC0tDQo+ID4gR2VlcnQgVXl0dGVyaG9ldmVu
IC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4g
PiBtNjhrLm9yZw0KPiA+DQo+ID4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2hu
aWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiA+IHdoZW4gSSdtIHRh
bGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5n
IGxpa2UNCj4gdGhhdC4NCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExp
bnVzIFRvcnZhbGRzDQo=
