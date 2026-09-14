Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE4F493639
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789405257; cv=fail; b=o3crJD5yDU9WlgIdy9lva2/VnfzvIv7Xy9A+/ACQKda04eRqjuEN75QgZsHYBv4D4LjgCwVA3L3O74owLVRa5KsmJLbDVxveCQ4y9AziI/H6H35PiQvKa18M6MNTvbiu03ZgfWCDEfhg2elpa6H2lJ5JfUo1j/Kqfx+yxfu35Ws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789405257; c=relaxed/simple;
	bh=vv3+/e5WamxK2hICPxz/Mim1HO3/Uq8bU++Y6z2FbpU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TQuHJipa3X4BLxhjO5pxL00ht39g2k6T39cyHn4FEhnPlArAF3c+lXx9T5/Qco0G8nDUwdOfXVVyKyj2rB2pupR5NOeEenhrQiNG+4ivfRitAE11VtDRiL2YoPcZ1EGSsE/tZczoiG8sJ0ASS4KBhJv1NTk5pwSbjpP+hX8l3sI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dL2ODuYs; arc=fail smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dL2ODuYs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789405256; x=1820941256;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vv3+/e5WamxK2hICPxz/Mim1HO3/Uq8bU++Y6z2FbpU=;
  b=dL2ODuYsgCSs+MaHUwG8twYnc8QdYsC88ZiDMLuIqt1H1kSUsS9jQ6+M
   I6+hHLy7cT39I+RAVbxRONzZLIBiO0DofKZjTaVfssRYjjjEsUMO0SQJV
   lQhKmJGaFsHp35J5u3J56dACf+MwDSqZYub0iyM8mjRMSKi8XAxRgg+8L
   fFEMuqkojG2xdjd/zJzEjv6c4+olILxdEXpe9w/cU78acXbK/yRAa1lZb
   5ZlGBNo4BDcJlLi0o5sD7SayfkBvhqW3pAohNvFS+Ia5oc/RFttXmVds/
   cnum5IbtUeg4af1OM/RfpcZXZBlJxkDHj5sEyZcI8dHw3yRTDWXdEYqda
   A==;
X-CSE-ConnectionGUID: tG5WFCSIRnqUImWQ3X6HdQ==
X-CSE-MsgGUID: zZxrfCAyQ4G4pqqzD+pm/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="265504"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="265504"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 10:00:55 -0700
X-CSE-ConnectionGUID: IRk1f+0dTuKVNcWDaoiilg==
X-CSE-MsgGUID: hKCr9PIsSs2Z/CznsPHXFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271274048"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 10:00:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 10:00:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 10:00:54 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 10:00:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+ZQl+ggl/oKL16R5JoXHs/oYgOi3Bqp4/sr2GUt40SMBgEFDiWTBSqDD1+xhgA+wxgSFEZTR4Cjz6ZjKZOS/UX7ZAylHAazLCxc6m5TwnXXSQtZOXvQXqgAocLrc6D0j6irVt5tCE00EYJ5565fTS2+5PXRzkx/t78b1x9JmagSKAPFK4dCNAGMFs0rZilhGT1DU8fl8yL+Neyz7CKNNqEO5m65XY/FNKqUnRNKi08Y5wiIVECUJhjsAwrMjfGg+DYoucFcWGKaDuLJdOxcsYaRw8pxwdk6MKMUEjdoCdcV4lXz1k2kBSdUr5rQxJ96/0TSeX4wbP3SG3KnXnVYTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bp7O1nnFZwaV50mnxtkXY0ZcfYVo6mxNFYUnp4+4AVg=;
 b=ylP5kEWSSSsTy5lsihLqQI5wV+F3lg3+gxFpgHZvcn78f0SjorLrnvQE7mQFVNgg6Lpn42AizS3ky7HaW+rAYYshqXwf03h7SQ1iJjmQCqI5LZkHe2iEFnih8xW/AU5my0+d69qx4BPmcfmpDwAPZEAZUMr8G+buNIkB2qiQac65rscZKaCQOTkyePd7vw6haX3jGvkIfDBNzB+fSy8XCDJC4qSro2YyiGdzpV8WmuqLotQXBS/erOpdNaZd1nHE6mIatk3ecDLv/bitCrmbtNOipeOqUMwiWh3qIucFq4oztYWRhPUOXoCAbiRMgbQWlri5JOvzY3VDLdNWOL3TUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 EA8PPFBCD0F742B.namprd11.prod.outlook.com (2603:10b6:30f:fff5::797) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Mon, 14 Sep
 2026 17:00:50 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 17:00:50 +0000
Message-ID: <e3a39ad8-367e-4adb-805c-9fc6923769e0@intel.com>
Date: Mon, 14 Sep 2026 10:00:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] x86/fpu: Extract restore_from_ia32_fxstate() and
 clean up fpu__restore_sig()
To: Andrei Vagin <avagin@google.com>, Thomas Gleixner <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>
CC: <linux-kernel@vger.kernel.org>, <criu@lists.linux.dev>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, Alexander Mikhalitsyn
	<alexander@mihalicyn.com>, "H. Peter Anvin" <hpa@zytor.com>
References: <20260908043427.1842515-1-avagin@google.com>
 <20260908043427.1842515-4-avagin@google.com>
Content-Language: en-US
From: "Chang S. Bae" <chang.seok.bae@intel.com>
In-Reply-To: <20260908043427.1842515-4-avagin@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH2PEPF00003857.namprd17.prod.outlook.com
 (2603:10b6:518:1::79) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|EA8PPFBCD0F742B:EE_
X-MS-Office365-Filtering-Correlation-Id: edbb6eab-7d8e-4910-77ed-08df1281bade
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|56012099006|11063799006|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: cXH8r7p/9Uc9/HDkWgLFdL4VpuwNTdjJczSdnGg40L6IOJhW0hNd/fozPVxWgX8kmWVeWHTlN3qdzWrdU2NPgORbFshLcRaKfM3s5YfxtI3c3uw3NMooWkVrNQPYGdPjVVfZRH8ndo65Jbwmc7DTqeFW3LEILHFWMG0YN7SJ8/9BOmtYHM1ZQ6g1y1zxnvyLk61zoo5CLUKvFgXsJmCs1bQ1uxeb7VLi2RPOuLc2dM4ZG+xnK3Y9EXIT2l4ebGDleOWUWOAbzz2rGCJnf54/tuBmdNlTzKQsNZlXzeM/ZIyLUrchfwOKFWCMLdP1Zvn+HeHa3dKl/7qlVsdMJsNiJCFBtdeCiQh2lxZ+eRE3aABdsVvaqr/4vf/2uEaW3sICEqALFYG4BD5w+d14hLKrqh6NQTSr213qdEWQPjahEMfNX5nRrPpiYbxjXhL/GsZztedvNcl+M24KgbEgQ4zrW4fJbW2f6sA1T+y4DV3gml2JV5yyfkOyt5C/Scz5yyMhy8gXjWGlwuYKPoJTuAnwlsVoYC9sAgDddECG2+ghju96c1GTdKkRYnUp1/hHrrtrDkaSypPw3MyUa1I6SKjHwNwWdEEy2ZE9cp/K5OmVngc3iFnmy/8iY/7XKyFFjklYPdRiGEBgGNvTJKIv3riComoSgmqjmWojuvjHRddm+fQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnFQQTFLL3oyMStmMk41aWh4aU40U05YNmlVVlY5b1pYUWRwYlkzNFdPQUNJ?=
 =?utf-8?B?WDNvOWlUS2IrV3JhOTAxeC9HRzhXVUJHSXprSGtSKy94REthbVVZZ1JPRGFi?=
 =?utf-8?B?azlGdlRpNlNOeDJpTkEyYnJ2eUVVVjRWTkU4UGx0T1BHa2VMaUlRdkhhRnJC?=
 =?utf-8?B?RVBmMFJ1MSthLzNJNDBhOWxENWhUUGJ6ZkpDWWpBRXI0SVNnMEJkQlRBUGE1?=
 =?utf-8?B?RG1lVDNyaHJMT2FpU01uVnBZcnE3QkhDbFY5emdaQ0FiSHd2ZjFsSWpMY0tW?=
 =?utf-8?B?anpYRWdxNnFtQkU5ZGZrV1JWQ2IrOXN5Zzl5L0M3MVRnUDNRbXYzYkF2cGhi?=
 =?utf-8?B?QXQzakJwUmtuOHFxVExDQ0FzNUtwOENQWWZ0dUJ6eTM3ZXhLelpsbVFidS91?=
 =?utf-8?B?OFNacjlMaEExQU5Yb3RRd242aUVCTUxGQkRqVkNSMEQ3dU5YTFVadEVBdjhM?=
 =?utf-8?B?NWN5K0xJL0JuWGtCZWpMTmxJNFJ6cUF3L1NzQTNnSGt2R04ycUFTV1NNbHcy?=
 =?utf-8?B?elZhWU91cTJqNEtLWHZuRnJJMzYwQk1QRGdqYWc5VElpNEFRMmsxQjYvU3dZ?=
 =?utf-8?B?b0FQMEJpQ3c0TWFONzFRc0ZRdG5hYkdHRnZPUE41eVB4ajBPOVBNUkFDcG4r?=
 =?utf-8?B?RnhOUS9IdmhCb1hicStUVnl5c082eW9HWHgzcjFBYjdZSzJjd2dJSmtTYWY4?=
 =?utf-8?B?QWgvYVRsMWVuRTZQc1EzMUdFVnp0Ui8wbVRUSEVxbXc3ZUZPalRxMWlaTU5W?=
 =?utf-8?B?RG1QU0g2MFhWN3BLbU84dkhTVHc3QlpQTmp3b2JnMERVS3ZiVitWYTlQYXR3?=
 =?utf-8?B?VVdFSUpTOGprNHd4RVRMU0RaQkVBSWJOMnhla1Q2R3hPTWpMSFl3RkVSSHlq?=
 =?utf-8?B?SVB0bVhqRERZVGZxRHo5L1NjUEtTcWZFc3hnenU2QWxYcm5NZ2pxYWZieWU2?=
 =?utf-8?B?ajdsczBlY0pKTllWMHdlb0R2cFZyMkloMGtYMDVFaDB1ZXNNcjBSOENLTXl5?=
 =?utf-8?B?UnRJR25WaXl2WjBmc0FUSld2RHlZSHFZTExlWXJBR3VhM1BEblp3WVhVK0c2?=
 =?utf-8?B?bjRDN1FFSktkeWo3TE1YangreWpQcVZGeFFWUnJwUlA3bGYxb3NPanRPY0d1?=
 =?utf-8?B?enlxVkJUQ1kxQlRKWitrTktDQ3YvNlhvUTVyTlcxSWZ1MklxQ3RJK2NMM0ZF?=
 =?utf-8?B?bUxBS053ekNoL3FGVzRTOEpDWkd0bmt3Wjd0d3V1eGNMMUpZZnJoL09TUm9v?=
 =?utf-8?B?cjdXWVB0OTNha0J2L3oyd0JKWGxYSlVOWjhvY1ZZZUtITTF2WVVFbUMycjBE?=
 =?utf-8?B?OUZ1ekpGdmd3NEMyTXVrbG02ekk1MlFzSkR2UjNHZWM0dTcwa3hWZzRrdnhs?=
 =?utf-8?B?TFU3K00xejE3Yk5wakJQVmxWL0ovSmtVYzg2N1lPeWNZdEtya2FieVNpaTky?=
 =?utf-8?B?K09RUUNKUUxJYTRHaGZONTh5TDhGVndyWVIrSXQxaVQvWWZaMzFZUHVGL28y?=
 =?utf-8?B?UVpmWlJ6QmhlNjVrWFlXUUltNlJvWmNNYTVzWmpKbUl0d01NbThNVFNUdVFk?=
 =?utf-8?B?WnVmSlRCMVh1aTNmcStuK1NYdklpSG1jMllOU3FsVUFtZmtXVnk3Zi9GUGV5?=
 =?utf-8?B?VTdUaWpjcEtoeFVaOXl4RVFtajhpclVNRFJQZStUTUZxek50UWt2ZVVWanNV?=
 =?utf-8?B?bXh3ZVpKN2p5Yzg3UUxERzJKa0RxZW5qeWdLd3JuUXYxMzd4MW9HT1lOUHdW?=
 =?utf-8?B?NFZIVzRJa2h1VE1TS2lzc3o0ajRFTHN1VmNtUWdiOS81L04rV25LdU01d2M2?=
 =?utf-8?B?UWxyZmN0bXVXaFlsamd2K3VtMlJvamJvUjYvK1UyTmRpTHdPRDZKTkE3N1o3?=
 =?utf-8?B?SEZ5bTdmVE5BSDFWamU2R0x3MGdYRHRiNkIxalJkOVd3N0UzNnM3OUREcFpl?=
 =?utf-8?B?cEY4dFQ5WU11bWZzcHM3WXFWWXlSVnl0OUZPeXBFeldkSGxrTUxzSE5KY2h2?=
 =?utf-8?B?MXl3Qk9taDBucFVXM29xaU1LamIwcmhESytNeWJJRURKMUszZDRiQXhYZXZK?=
 =?utf-8?B?S0E4dnNybThNOEJVWVRLUjlGRk50bnJGaFRBTFVRSXlYczJlTTk0OXhYZm81?=
 =?utf-8?B?WXV6aFNYZURNYUg0ZlRycDBvSjBYcTR6ZThTVDhKNXJpeDlnSjNVWVpyVHlM?=
 =?utf-8?B?V012OGl5eWRPL3RzUTlYamhkZFE2VEMzc04xa21BbVNRbnEvU1FISXdielZP?=
 =?utf-8?B?NnAvSEtlY3Q0TmgvSTNySEh3R1pQOVdoMG8xOVZ2dlFYYjRpMXFkaEd4aTVH?=
 =?utf-8?B?ZWdMSWxScWtQc0J6dFh2ZGw1OS9ObVFhejFmODEyaURubzNrYlV1QT09?=
X-Exchange-RoutingPolicyChecked: OdxlMF0yXbKOFwJxTJ4HLScc0toBu8RI77/eIb0utmYdP3Y5C2UXYHV7Ue/NoV+JJEwCtirhrGD1I+LWoixb5FjEAseXMfUrxEX5eEwP8nglWTOcZtPg6BbHL5i7JRqtNb25iMvEsYXC+X6v9vNjB+EJPc2lDEydVSvB8BjVUSGg0i56QKNKpG4E8PDzMQwt0SIxSL4LXZG3781lClsJ6sK9a2g0z/eh7hO7iGPPIfV46jrKIGjnQqIm2tSiE96zsoSRBcLKdteWtBdwg3KC2kUCBGHE2WyEkVlkbKn+pehQBoRRCPzSRIDVY9cCOYqOcu1bsvDgcDDSkaFi8QpTDg==
X-MS-Exchange-CrossTenant-Network-Message-Id: edbb6eab-7d8e-4910-77ed-08df1281bade
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 17:00:50.7360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R8FJOs2ALgQGBgXgcnpi4n4V56LmCZd5bdkH2vNJZWp71S/nTFwXVRpZZwRdhOjb6KDtCDJLRviHAZVDI5W6gJgwfKXit67X1UDDGYBPvxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA8PPFBCD0F742B
X-OriginatorOrg: intel.com

On 9/7/2026 9:34 PM, Andrei Vagin wrote:
> Improve readability of the signal frame restoration code. Previously,

Note the tip- changelog style:
   https://docs.kernel.org/process/maintainer-tip.htm
   ... A good structure is to explain the context, the problem and the
   solution in separate paragraphs and this order. ...

This first sentence doesn't appear to be the context/problem itself.

> most of __fpu_restore_sig() was dedicated to handling the 32-bit compat
> fpstate, while the native direct path lived in restore_fpregs_from_user().
> Having the compat handling intermixed with the main flow made it tricky
> to quickly see what code was doing what.
> 
> Extract the 32-bit legacy/compat FPU restore handling into a separate
> helper function, restore_from_ia32_fxstate(), and inline the remainder
> of __fpu_restore_sig() directly into fpu__restore_sig().
> 
> The legacy 32-bit FP frame duplicates the FP state portion of the
> FX/XSAVE frame. For backward compatibility, the legacy FP frame is
> treated as the source of truth, and its state is folded into the
> FX/XSAVE state before restoring the registers.
> 
> Reviewed-by: Alexander Mikhalitsyn <alexander@mihalicyn.com>
> Signed-off-by: Andrei Vagin <avagin@google.com>

...


>   static inline unsigned int xstate_sigframe_size(struct fpstate *fpstate)
>   {
> @@ -450,10 +449,11 @@ static inline unsigned int xstate_sigframe_size(struct fpstate *fpstate)
>   bool fpu__restore_sig(void __user *buf, int ia32_frame)
>   {
>   	struct fpu *fpu = x86_task_fpu(current);
> -	void __user *buf_fx = buf;
> +	bool success = false, fx_only = false;
>   	bool ia32_fxstate = false;
> -	bool success = false;
> +	void __user *buf_fx = buf;
>   	unsigned int size;
> +	u64 xrestore_mask;
>   
>   	if (unlikely(!buf)) {
>   		fpu__clear_user_states(fpu);
> @@ -482,10 +482,29 @@ bool fpu__restore_sig(void __user *buf, int ia32_frame)
>   		success = !fpregs_soft_set(current, NULL, 0,
>   					   sizeof(struct user_i387_ia32_struct),
>   					   NULL, buf);
> +		goto out;
> +	}
> +
> +	if (use_xsave()) {
> +		struct _fpx_sw_bytes fx_sw_user;
> +
> +		if (!check_xstate_in_sigframe(buf_fx, &fx_sw_user))
> +			goto out;
> +
> +		fx_only = !fx_sw_user.magic1;
> +		xrestore_mask = fx_sw_user.xfeatures;
>   	} else {
> -		success = __fpu_restore_sig(buf, buf_fx, ia32_fxstate);
> +		xrestore_mask = XFEATURE_MASK_FPSSE;
> +	}
> +
> +	if (ia32_fxstate) {
> +		success = restore_from_ia32_fxstate(buf, buf_fx,
> +						    xrestore_mask, fx_only);
> +		goto out;
>   	}
>   
> +	/* Restore the FPU registers directly from user memory. */
> +	success = restore_fpregs_from_user(buf_fx, xrestore_mask, fx_only);

Nit: Just stylistic - maybe this could also be kept a bit simpler:

   if (ia32_fxstate)
       success = restore_from_ia32_fxstate();
   else
       success = restore_fpregs_from_user();

Overall, I think this refactoring makes the flow easier to follow with 
smaller pieces:

   Reviewed-by: Chang S. Bae <chang.seok.bae@intel.com>

Thanks,
Chang
