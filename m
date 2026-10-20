Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792516195;
	b=bemjwYT/ePuyVCJnN7bm7hBVgdu57tWPt41+nOuInOCVUBL/N+qw6W6+vBT0oDLr2Rbu
	 71U4gtTgIb5Bwaj/5stNif0hrofKbirWVSI9xNukEYc/gpwHzRo//FB4vgR/IOmoXt+It
	 0GPnXh/oiZ62OBQqr5iDRwmCdB7H9RIBxupT5upzs9HnrausoVPm9qeyKCwGk3DxRYhMJ
	 3+1PuCYw14Ef08VMTt5+ClkAh2p5NcE4D3/kG8CxPSqtoOI9S2Ubba7w8qv+oxJv5+p/V
	 Mw58OlzgkcM2ujrjgPR68eapuTwtsfvY1YdevY3MuXEtEh3pw71xQs2xkIElZmggifw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516195;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:
	 Content-Language:To:CC:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=Hv+usk/zMYOUViORGQEJqE3Pzezx7kblRHFiXguXVF4=;
	b=cdognaXPHwsEWPa+VSYBAv0X2lzke1dSOfyfMjC7WjyJ6l2FVat0o1SRaJ62o7Voj+TK
	 +vmoLBdzGH3QDmYAhWMvCtJLJYwuY4QxtKd5CAK39s8dL47a44/l+7bBIR3tbEr5flL+y
	 PDj/q1DGNfN6EXNhnUw234WT7V+lDFCUlvXkH7GxbSM0E5HjSZ6I4BZeqksU9VeJ4rUL8
	 udwDn8UsnHe9GSa6ZRUbDN47E8s/H0jlSRKmw6/K0Fvge5g7QlyNZZ3HFXVFSte77O/sR
	 mfoUqOinbuND60TDy6M7dIHWmbJICFOqbE5rxnUVj6U0f1AD8u/BOeVyovyiNwgUDuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FloSNP24;
	arc=fail smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D09F606A322;
	Tue, 20 Oct 2026 17:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D09F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FloSNP24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792516195; x=1824052195;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=f/KKB6jHZSF/2UYaKhk33Pd39GGfwPzVUZ9ZaHXc+vQ=;
  b=FloSNP24BmxA6vne5QNwCTmqvxAtHHTmBkWBsff3Yxaqu8PfzYlwAT29
   zO42FfM7eWTFlZwLGGCPpQX9NDgkH9u802ZQ44ce2pktfXukzpWLdh0xn
   r4JTwIa8Vg222Bhc3D3HEU+pZ9jzdd3OGVJAV9t48CpCTgnbLTaAcuUtV
   H2+v1pRwWuP55BHnS9kyb9lLTMxXin8BUuBq1BKuPHGnogrCwNgiZMcMg
   GhHbNVYGV8DGA4synsVjo9Aw1j6IkFpPMek4vmIZOY4TK86PpZvibGtI5
   ngs+FDAk9/WLxzAqGg348YN/edvUevG+UlZuhwT3xIHaP+nKw7+3swNg0
   g==;
X-CSE-ConnectionGUID: nfYNA/RTTAiGHANwHW+EYg==
X-CSE-MsgGUID: ekPAf/quQD2Bv7ssUM5/8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1240750"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1240750"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 10:09:54 -0700
X-CSE-ConnectionGUID: EBX/leJCQpOVEZrJ2wJuZA==
X-CSE-MsgGUID: Ztu71YMRRGCGX3XjFqeXbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2873759"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 10:09:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 10:09:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 10:09:52 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.59)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 10:09:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gpPceWhGEczIcldbWe451lHZMIHYu+3PTPo91TbmJD7+8vn2KN9ljk2v/PLPM7XKeyzRJMBT0TubeTib2Ra8RKRb8UWx8aWvcTTVr8HVLzegOqLp2Lplmrxv8yOuyLdSmhw5AJyPmE9unMS9W1vt66qfRLyvp1Wz+W9xEiBPkKYajMe3iVN3GFWAkpJ2HatsUcJsk5o2RQnlCxWZhHKxAWeh6kzg038mx3jUKXiu8ITzWnph4oPZwYeEb6LTsU/4+recfzNfF9VXaKJZ5i1iEY2kwOw42tFo+XJhcwSQ/CV4adEZ0Jk1oulvEUkpukkpAKCS7atbtmjijVwqCw5/AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hv+usk/zMYOUViORGQEJqE3Pzezx7kblRHFiXguXVF4=;
 b=DxekYFr5NNAWpVg6fwpmdhrRTOc4Mxdo7o2KrmxNC78Sc4+nWvVQIJvw9k4u9++Y7nFce0tYOF856Ke31xexvc0KMcCtt0SWN5w51rd2F+6Y+8ItcnxDje1l+QFKfLX30Au3Estvm6cwZ4+f8Biy9G9WLuTw+OLajTLjeaL6siYKRoU6wZc6GDlVnTvF5AJV243IsLiDESERHUg69sPuT9mbgF8yxFA8iZa9W1aDqDh6oEzcFKU+rl9WK/5CewE0H5WB+OdmhIhg+fzkb3B8zKmVi5dULkZ3s/UAd2Ka4dRKLh8GSTH4Yz2byc21URzaH3wXChd3ghtTCoou7mnXmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7846.namprd11.prod.outlook.com (2603:10b6:930:79::14)
 by LVUPR11MB9566.namprd11.prod.outlook.com (2603:10b6:408:39e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 17:09:49 +0000
Received: from CY8PR11MB7846.namprd11.prod.outlook.com
 ([fe80::cae0:d05c:b2fc:c395]) by CY8PR11MB7846.namprd11.prod.outlook.com
 ([fe80::cae0:d05c:b2fc:c395%5]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 17:09:49 +0000
Message-ID: <ba508991-6a98-4aa2-a98d-e85307d50cef@intel.com>
Date: Tue, 20 Oct 2026 10:09:46 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/mce: Do not treat cache hierarchy errors as memory
 errors
Content-Language: en-US
To: "Luck, Tony" <tony.luck@intel.com>, Adrian Schlegel
	<me@adrianschlegel.com>
CC: "bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, Yazen Ghannam <yazen.ghannam@amd.com>
References: <20261003222012.19685-1-me@adrianschlegel.com>
 <20261012193305.38931-1-me@adrianschlegel.com>
 <20261019153207.GA144824@yaz-khff2.amd.com>
 <DM914GO4A8WW.Q7YN7ISOQJJI@adrianschlegel.com>
 <7886e7b1-95fb-4338-a7bb-b6bf1da3a634@intel.com>
 <SJ1PR11MB60837CA7EFFE0AC99D01904DFC982@SJ1PR11MB6083.namprd11.prod.outlook.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <SJ1PR11MB60837CA7EFFE0AC99D01904DFC982@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:254::18) To CY8PR11MB7846.namprd11.prod.outlook.com
 (2603:10b6:930:79::14)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7846:EE_|LVUPR11MB9566:EE_
X-MS-Office365-Filtering-Correlation-Id: 83883519-34bd-4600-57d2-08df2eccf2dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|6133799003|56012099006|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 2TLUAR5LiOONyZF8DnMKg3R1tMpEQQIWyrpcMowu/Vwizd1bZdgOKTMjhwPNqiBp0f2oCkNN680L/Um8PgfLQD490agBsq87rBexYrWZaUt4ObWZRVy90uakaAArKufN7UeKOoklue21XruPBW5OEaxI10gKpVcoZjTwDHhwmdTfLHmwJrXmYuno4RE1uj4v/fNKHAF/FFBS979tTmAB0L1D97HIgNEhjBzNqna41pa80E5mSIC6fAFXnJ5nh2HIi+DlYpHrK42NaUlxqHWfAcDdqc7wtbcFOuSPy+9pJ60dOiIWTil+1VA5b6QH6SrkFat11SOYwztp4Pn3U9275mYznTjNwEfxMo27NgA682LRmHgG/YJEiLt4vEq6xJVZXmGQ1Bif7L739Cp67A4OMNOqBrejQN8rkFO/lYFvd80BSBNaI+roIny8hrNAfzoIUFpotyN+awDrpA6fxgy5CmniBWXTbiqIjDKQf0dcxxdP73pH2td+2b8NljoTjBDRCFCKcX5YPHFqC9cV9sWJkCA3XlVzWPZiCuYNinc1Aco05DdXoXzoD14x6XyN59Li6L9bmn4dc7L6t4QhHPTdEgExpJE04m8gA4rzDaAhg0UKa4lctjBJiQfpfA5p3TPOwBH7VVkSfqJ81asHjrsGaBQ9JMxDVMIA/V5fOj0s3AI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7846.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(6133799003)(56012099006)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXkrYVRlYXRETmo0a3VEWUtWdzRSek5uZHlUZzhvcUdBMVJTRlpjaWFCb0lz?=
 =?utf-8?B?bGdiNnh0Tmt2Y2JTLzg2Z0lpQ2FXMHI4TEw4RzRMMC9UZU80WXdyVkkxb25k?=
 =?utf-8?B?Z3ExNU9NdmhTMTcxVXJZcUZmaGs3ZTQ5dkQ5WmpRL3VUR3hpQjJ0TGZobUtp?=
 =?utf-8?B?dEdsMi94bGI5NVdLdkZJZ3lPKzVqQmdZMTFtdnhjNXo5VEN4d1lrNzYyN0o5?=
 =?utf-8?B?ckRxTTVOYWgrSVlrTjhMWmFOSVhwYlVOS2w4YmdPWnV4TEV4WWlGV21lRXRn?=
 =?utf-8?B?NGZramdhckRTd3J2K0d6YXptVU1oNVRHcGoycFhQeC9pd1FlNzNVOUJ6WlE1?=
 =?utf-8?B?bVJOMHhXTWxFSThCUmlPM3VzNG9LMW1iUTlkWWVoalJIMEc4LzBsdnZZQVlL?=
 =?utf-8?B?VzUxMHdYcXR3QkQxZ2xVdWx3SDJES2tPUjVCUHhXcm5ib0hERWI4L0crRlNl?=
 =?utf-8?B?Sms0cWhzOHNhRkYxUjVWQUs2K3lLQ3pZWXpDTCs2NDBwak1Rbm8zaWFhZ3E0?=
 =?utf-8?B?YnlNM1BxbGtYWmo2TDBSOStLTXNkendqZ3QrVDk0Zys4aFMxUU9YcUtkSzlt?=
 =?utf-8?B?WktFQzhid1RyVGpkSk5DbXBPdU5ET0xDcXFFVTh2eng0ZmpyNDRCNEZ4TzRo?=
 =?utf-8?B?amtYbHArU09OT2dub3JaZWhEb1Q3Z1U3RGdZc1dEYkRrWmdQUnlUa2NqSDk3?=
 =?utf-8?B?NDMzeVNOQ0FwRjlpZHdkMm9zTmRCNGNITjhLWkxQdS9ieDdpaUMzeVVRWVkz?=
 =?utf-8?B?aWlLNWZSSVlyRVgwcmFESjAySC9kTDdwODRhOHhQM0tSdE9QK1J4TWVYUm9m?=
 =?utf-8?B?OEpYRCtuUzlneFlpVDJLQ3ExRnFsOXB1bGdpZlZ4MUJPc3BlLzhsdmhuOW03?=
 =?utf-8?B?dHhKMk02R1h1U1hEVHEvdUpoenA2Z0dHMnZIL3hnZ210dTNaeXJjSFJZc1Nv?=
 =?utf-8?B?NTVmc2JDSGpEU0lib1RPTzBJWkJtbWFEYmM2Rk1MVjR1Zk5GN21Gb2NwS0hO?=
 =?utf-8?B?bHQrMExyU2dCZXVLSTZXR3pqRUgzUFlLTC9zSHZZcFZBQXlTb0tvaWM3blBQ?=
 =?utf-8?B?dGtFVkNzQUQ3U0FUczFCZWYxQ2lkVTc4eE1YNjZxdXVudUh5YTlsOFZTdXhv?=
 =?utf-8?B?UDhxRGhxTWJJL2czRm40VlN2Y3ZCN3U4VTNvYXh6M3ZXR1B0OXpaMG1OK2R0?=
 =?utf-8?B?Y0hlb1FEVkxqTHpKR0hSWmxTZUVSa3RXNmpSTExrOUNsejJvbWI5OGMzVlZ6?=
 =?utf-8?B?MGd1aGZaQlhhU2Q1WFFFeXdTUTdkWTdZREJJeTJVTnZYL3p4RGNhRUM1a3cy?=
 =?utf-8?B?Kzl5dTgxclhjRHlyVm8wUE1RSXBCUjdGbUxRS0s4bGNXNVRIV29sbUdZcWtC?=
 =?utf-8?B?SW84ZTd2RFZHSlJoMVlHOWVJSmc0TGs4b3RtSVNETjdrZlR6eDluZExtZFFO?=
 =?utf-8?B?bXp4bFFVTWhLTkJMek96V0xmNnd5VGYwb2NmY2I0ZXRVK2oxakk5VXNQUlVu?=
 =?utf-8?B?WHl5aEdyUXFCTXhaR2xhNzc1RWlKdVlxdjA5M1FRWUlySGZpOVlRd1BzRnBy?=
 =?utf-8?B?ZFBOMlZKVjhJYnJxUnM0c2pma2trRHRYY0tUM2NBY3J5U0svMW9pNjNHbmVU?=
 =?utf-8?B?UmRkM2dtZmJuWC9DTWxXKzJER2d4cjBtZlY3ZlJib2hJaWlveHk2bWYzb21s?=
 =?utf-8?B?RllHQUJuMnpVN0dzdHp4cVFBTSs4NU03TE9RNCtuVFU4SnB2dmdtNy9NeG9l?=
 =?utf-8?B?VG51UHRRcCtxS045LzdFY1VuZERJQ3lrb2R2NWN2SlBKN0hWK1lldkJmNjFB?=
 =?utf-8?B?VFcxTXh1dm9IdW01d2dnWGhFZzdUUk4xUkd5YStYaUthdDZmN0JEN2VPR0dP?=
 =?utf-8?B?a3hGY1M4cW95dS9KTTVDbStacTZVRlpJZ0JCV0lXSWMxNDZsU1E2dDBOakdv?=
 =?utf-8?B?Sm8zVHhoUlRia3dWUjdmU0tKOU9aZWU2S09vOHRqWG1yRVZUUjBaRkVLSUFh?=
 =?utf-8?B?dThhOHB2ZzZtQWk3Q01SU2tQdG9wTkpEdXVxd0YxZjF5R1dXbFJ4Rmo5cTZY?=
 =?utf-8?B?TUNiN3J3bS9ZRG1vVzFxWVAreGdRaUY4c3VpRS84MVhySXRCSlJwNVJIbnVY?=
 =?utf-8?B?ZS9PWExmRUpvSDFKTzhBTUh4ZGdtTkQ0OTV0bm5sZnZvelh4QzNKQllhRFZu?=
 =?utf-8?B?U2JOUVZsRTBXc3BVZjBEdENFSDJ3L1ZHRVVCa1NMaTlrTHB1bkZyMEtUc0p6?=
 =?utf-8?B?cGgzQkZURzJmVkw1SlkvNFp0WFhzY04vUkNkZTJYNjJZMVlwWTB1ODlZcVVx?=
 =?utf-8?B?dmpvU0RIV00vSWRZR01FVERTMVg3V0tGSGhiV2pLR3EweWtZVjk5QT09?=
X-Exchange-RoutingPolicyChecked: ip/gP5EjF7ueSJInjATPcUtjFjBfpNEK4RQR7fEX9BPaG9do92rOXJbV4Nc2rHY87B2KVEscAARAYlq7Go6qXMDP6OwWGyNpVr7QGOoN3Up6heHmAiN+h+xIaQgzxAcsUG3oEqPI93bHObS4cC93RSNIuQt2wYAm7KChqvrYlcV8A7qCCYO9YWJ4z91SkWj1qqPfARn8NI0tU+HDYv7D2OBVWq2Nn/xzxJi0dAg3TSslhpiSKvem5cozSjFaKYp+L441vCZSnre5FLd8LivDl3crzZu47u4kq2y2F/KeR28CEXa1A6MR7v1deDGLtTI/+NJSB4P3sSEE4QeX8A8JeA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 83883519-34bd-4600-57d2-08df2eccf2dd
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7846.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 17:09:49.5128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hBUS6VQLaUFZt1UjJrk50TpFvLO/NY43ifaYaVs5w3wHhd3XfrmkiH5jBQXaF4HH54ddrBOXzLALDKYesvvyag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9566
X-OriginatorOrg: intel.com

On 10/19/2026 2:06 PM, Luck, Tony wrote:
>> Looking at the comment on top of tdx_dump_mce_info() and commit
>> 70060463cb2b ("x86/mce: Differentiate real hardware #MCs from TDX
>> erratum ones") could poison consumption be reported with a cache
>> hierarchy code?
> 
> Yes. All recoverable poison consumption error codes are "Cache Hierarchy Error"s.
> with signature 000F 0001 RRRR TTLL. It's an uncorrected error, so the recovery
> code will offline the page.
> 
> BUT ...
> 
> Each should be accompanied by a "Memory Error" with signature 000F 0000 1MMM CCCC
> in a different machine check bank (this report originates in the memory controller that detected the ECC issue).
> 

Okay makes sense. I am fine with the change in this patch now.

Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>

If needed, the TDX side can change tdx_dump_mce_info() in case the
desired "TDX private memory error. Possible kernel bug." doesn't get
displayed.

> This other report should be used to track uncorrected memory errors per-DIMM. Per-channel etc.
> 



> =Tony


