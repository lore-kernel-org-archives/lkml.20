Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD185372058;
	Wed, 16 Sep 2026 05:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789536541; cv=fail; b=Gif9POYddF0ABBbIPJHlDziS9jeNiM2XzPmtEQNxCxqMpYgUSvggYyBX3uZVN7UhlXWL2Z7S6zq17Jz08vDtfJw3DtmpEG4dHKpelACTiFmSf5FjTh2X5GwT4vg1pm2H3jMAGlebvVNeNjh/+LyI35OaoD6POQ55TnmIPpiA5Qw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789536541; c=relaxed/simple;
	bh=3Q19ec883wb+VDFAlVR4+2qfv0jTT61436rerZ0vIpo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=u93NJC5ne1YfGXj9M3jLdpsn0f39HgiWtYDC3/KpLGpU3N4uuJvwmMfk2SyQhlOEFJHkqZM/rkPKTDAgwnIq5afk4GgaUcrcyKJW9hRz2d36wbIjs9U+9xjbJeh0fgyr9yjl6sCQ/Yo6s6D1tTcq2zvILtd+L6BmFmXAZ3U+t9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gOZOarlZ; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gOZOarlZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789536540; x=1821072540;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3Q19ec883wb+VDFAlVR4+2qfv0jTT61436rerZ0vIpo=;
  b=gOZOarlZZuzBIA7v89+PWGYxr1/IQDr9mC+qAcp4dGZBmthgQG5uDOFU
   X/mCdG0S/WqUu677YgIy2ezPmbxaSmeB/lUFPQsH6U1hQCJJK/PGsUgOu
   vxlbs4AsXIMi4rCo4j4pS3AN4SmRQy95nD52iha9Ugoxq4TW/tZYJJtlG
   pa3GIHljfzC/amFmD6DWpsJUedowY3kBiu055qoKWKNFvREXIpPhgGBwt
   9gmm9/Fw6Pf2EDp80HXY/y0uQ/89DXFXG91pe2v6ODg+VDBBT+GKzN/RD
   mTMBBOcS293eCUQt83HhTZJ0ufA4IWYpykoNUqsMdeBnjbj5pER4L64xp
   w==;
X-CSE-ConnectionGUID: 2lWhlZEtSZW8f/Ep0ZPh8w==
X-CSE-MsgGUID: DgNDKXRtREeJUJLthGQqng==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100506081"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100506081"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:28:59 -0700
X-CSE-ConnectionGUID: ATVUCXMpRiiiaATCAR5Qcg==
X-CSE-MsgGUID: nL4NiUADS2awyfP389ZlNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="278472643"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:28:59 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 22:28:58 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 22:28:58 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.55) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 22:28:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N976zD/m749jeJTVf+Icw7sGNEFeL/IyQZAhWRY049K+9uOjaU7xrNI1HeLVUiDCN6ro96XRg6kh6klW65qjPGSIYxXKaXaM73H8RZPTxJMfeDf/r2mKyoizk/fz1HOJyzdZbTQGdupw+McBXn5mbStmV1Kg6KokbsZMALSo4m0XAdSXXZV+dvwZsw3r8mwvpUZIsMWfuQL2V2cI8QvSznB8LQyiCva7v4/sKgjILlE0Dq3JyE4R0YMY222jQvyKR3NbDlEsRpNZJL7WR3ph0y5P/08ePSxZGIfcmPyIJOBVTfQ/hRAdh+XF8RRp9O/R/Z6QXjg86lGcqq886Rb0cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20+cZxZiw6UOz5bYeW48RfKXrw50GfXN8gvH/bMGHcw=;
 b=EDDrRZOn2PcztzUph263Fc6geresOuUr9eQ3LtzeFKtgXgvLhJay2Jgs3eKK9WllXgfDNYbWrrPfY8iPsmy1ML9vzOGozPw62Jm0SuewiWQGdlsuJN83hO8bNKgkqGHvEfvKxWZUGTCcGEQjSH5kmXfPdQB/BL99eLk1Guen5NQAdP7XcbQ2sg0NiFLI1LYty9lAwnjSblJqRXOMzS6csGRbfAhgJ4k1ZxpbZH0IH7HzrNzSopi0/NC6hcITQZNpqYqqzMgXuLmYRPL/j5h2uXpaTpTy/VYh/FUBEL5jh4efthgCdunMrMYp7wj6Doaj+76ddVEyxT1BqlC+w1ihPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DM6PR11MB4708.namprd11.prod.outlook.com (2603:10b6:5:28f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 05:28:49 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 05:28:49 +0000
Message-ID: <4277c043-c854-4c9f-90cd-9cceaab3c88c@intel.com>
Date: Tue, 15 Sep 2026 22:28:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/16] fs/resctrl: Introduce kernel mode states for
 resctrl
To: Babu Moger <babu.moger@amd.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <bp@alien8.de>,
	<ben.horgan@arm.com>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <fenghuay@nvidia.com>, <akpm@linux-foundation.org>,
	<rppt@kernel.org>, <dapeng1.mi@linux.intel.com>, <elver@google.com>,
	<jlayton@kernel.org>, <enelsonmoore@gmail.com>, <kuba@kernel.org>,
	<ebiggers@kernel.org>, <seanjc@google.com>, <peterz@infradead.org>,
	<chao.gao@intel.com>, <jmattson@google.com>, <naveen@kernel.org>,
	<ricardo.neri-calderon@linux.intel.com>, <tiala@microsoft.com>,
	<chang.seok.bae@intel.com>, <prathyushi.nangia@amd.com>,
	<kim.phillips@amd.com>, <elena.reshetova@intel.com>, <darwi@linutronix.de>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <x86@kernel.org>
References: <cover.1787772750.git.babu.moger@amd.com>
 <89413e63d627ed967108bb77e6f56e7ceb977571.1787772750.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <89413e63d627ed967108bb77e6f56e7ceb977571.1787772750.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0330.namprd04.prod.outlook.com
 (2603:10b6:303:82::35) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DM6PR11MB4708:EE_
X-MS-Office365-Filtering-Correlation-Id: 3040173e-d550-41aa-53ba-08df13b362be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|6133799003|18002099003|18092099006|22082099003|3023799007|10067099003|56012099006|4143699003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: ypo+dJ4GLbuT2/0FHe+8ODG5K35cZmDA5l2QRPKqD0OjJlKXc0RE4mjL2hBXmprUHyOqrwHRwIY9RUAxFILLZ9A3CSp7Q14GchT3dTglfhpfi7d84CvWFVTNst85S28SMLHap4vtruLxcwGGzOefOibQ+83N0sZn8OcId1Zo1bFQFbc9nxcCHbhTJ5DvzAwWe/qBhE4wNw9QtIA0H9BH1HEk1WTR4gSOGarnlBDnGDpiRTfZgB0QZy5fsXu4d43L/kfGCVMGkmQKVAqXB6lccqP4vSNxTCQIEJga33sVWaKy7r1P5AhDF2OuxHZjutrya/r01Sz+GdLRWBvxmBCA1Ti6e4YUdw67+gGeJpy9pA5X9FTeOyyPjnj+5AAza5o0RvT3hfkLqFiFFqxsntjfnhvX+Hdqo5b9wSA+vUSVYYtDsNfwxp92XBTH4TlYb1Dvr6isFGTrAjezmRvgY/1OU/cVzU/Hlfs0pKyrAZRPsz3TlJ9k2q7+1A0tyPR9STC0PXudkklPVb+COfUU88wHqA3STsk8ggxwIM2/2+jc72jtrEbSmFcFmu1B9IU/B+iuDY8+ULd+xQr8VFX6vKrxUqFKV9b/0cvvl8axyDTdj8qCKc5MF0OzuIuuPjhN/WV2jk4kZLuI1WdCMnWpoiiShFlP/NSV6noVeXpQvl3mc9w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(6133799003)(18002099003)(18092099006)(22082099003)(3023799007)(10067099003)(56012099006)(4143699003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WExEa3Bra0RySGxWVm9HT3V1TE1BOFFlSjBxQ21SeEMrRWJOZlAvT293OTBt?=
 =?utf-8?B?UC9kWVlEUVdxMkRXbjYwbzJ4MXVjak81L2RZdjBRR3E0cURJVFR4aFZtZUVW?=
 =?utf-8?B?enl2Uk84U3Z2WXUrWUh0KzhyamdvdGdKa0tPTlVNbVVxWU5YVnVFdjd6dml1?=
 =?utf-8?B?ZnB1Y0FJUzNuUDBOWTVvbzZjd09ySk9WTElUUmdpUmpzRnNBWXczUkFhalRy?=
 =?utf-8?B?UE41V3BHR21GbVJGS25BYlU4Q1IyVzdBSElCQU0wL3JBb0tFenpjVCtGREI3?=
 =?utf-8?B?KzRIYUFKMTBiaTc1NXJTa3hLNUpzVXorMFZ3eTF6ZzhuYXFGQ2d6bnFXRG9F?=
 =?utf-8?B?d1QvRStIMHpMNThyZkJjM1pUTXJyU3hjczgzV0dKSHorS1pZYllGME93cGxk?=
 =?utf-8?B?TUtibGlSOXgxdXBCbWFXYzhjZUJPcENCT1BERW9HaTd0d0JqU3lXa0JTU3Nv?=
 =?utf-8?B?cXVuTHJReGgySE5Qd1l1NnVSZ050eGRiS3dlbW1VMU45L1FoZWxwV2dBZksw?=
 =?utf-8?B?ZlBkVUV5aVB2akZoZ1VlQnJhTE5pQkVUVGtmaEt2bTZlS293UE1KdlJtVzV1?=
 =?utf-8?B?OUdVbUVWYmM1Q01IeE5lM04rdjErK2RiK1V5cVZkT04zUXF2NEc1RlBsbnNz?=
 =?utf-8?B?OUgwRFU1eHhzSVRrdzA0YUtkcEJKMjZodWVrRWxkNldnRklJQXIyMExERmhn?=
 =?utf-8?B?ZXNBSU90djRFYmVKRmRpVXB0MmxjQis3ai9TREhLQ1ZVa0tOa0J1NDdCUGQ1?=
 =?utf-8?B?b3FsdDVOaTdPcFJCVzNHSmxsUForRzM3SXlVTVdWbHFEdmdIVzB6eXE3VEl1?=
 =?utf-8?B?Mzd0eUxNSjNMVDU5VGZoZWM0ZXRSOVVTbUNMTXg5Z0oxQ1pOOUhBcEM1eU1X?=
 =?utf-8?B?bERteVJjbU1KR0luS3Zmd05RWlNhT0p3WHgzUk9zYmt0cnh3TDJUbDl3eS9H?=
 =?utf-8?B?SFdXcFpsbXVFWm9aY2V3dXAyMG5yMllkTFJ2VFVxc3NuaWxlU201YUd6QnFK?=
 =?utf-8?B?clBjNkF0UWRWRkRsaW84SHp2aXR6ckJRR3VFQXErS3VLK1BEZ3p1S1BNVkNU?=
 =?utf-8?B?L29RK01JbkxNT3JwSG1ITjNaK3ZHS2k3aGdhbDFhTnJvVXp1R0lXR1JvZ3Iw?=
 =?utf-8?B?SzA0SWc0cktDRnVOd1FjRGRhSHFxSTVDOUJJc1JoL05NSkNkN0VqVUtrekVI?=
 =?utf-8?B?V2IwVjJ3VWN6UkVPaVJMLzBXS2wvZzZLQnh3N05MUGJFelZMakVCNFYvd3pn?=
 =?utf-8?B?VVZhRjhwWG5USjlwNDZGdXp5a09ZMWpTVk95Vk94blFIa2U0bTBheUdxT2VB?=
 =?utf-8?B?K0NQaTI4UzJzQnljMWVQQmhBemhTazgyZ0tRMjhVc294a1JmdEpXV3lBTUdk?=
 =?utf-8?B?emlLaUZxQ05FdDdQaUZubGprUUh3RC82TVRBSU9iOXdzbFFEaHBIUEdDbVFU?=
 =?utf-8?B?Z2E1MUQ1T3EyWlBWZFNKWlF2Titxc0FvMjJDbjdtUnlkNVRucnA4dU9pbUFV?=
 =?utf-8?B?NmJzL0Y4enBBZ3lCY0pjOUNjMnFGYnh4MjlNUXR1NHZtZGcxOWFrbE1YWGlt?=
 =?utf-8?B?bGticHVwQ3NHdWlpSE1ZU3YxZWRqQm9KYklpZFlLWTc1UCtZU29zc3Z3czVL?=
 =?utf-8?B?UVZ1MnlmVVlOa2NtcElWMkFhdnRuZTRVUnlHRFMyMUpGck5tczFSNzZOeUZ0?=
 =?utf-8?B?aGNvRWlyRXVwVkVVd0I2NCtGMWgzWVRKbU9SRHlFeVBxc2ZVQlBTd0t0eGRL?=
 =?utf-8?B?MWVFd2J1eWhISndPU00wbDA0eG9uYXkySC96MGhSOENaYjEyRlp4bG91MFVh?=
 =?utf-8?B?Ni9pUmF4QlhXQWVvNW4ydTIyYTFtYjc5ZXFnNm5NN3NRRmJmRGlwVXl1NCtj?=
 =?utf-8?B?cFhlMi9HYUFJVUx3Q2xEQlFTKzEwN2ZUdUdZUE9yV2hKK3FpYllQbFZ3SG50?=
 =?utf-8?B?dHFTdVl4VVI4QzU3eTNiN1NYQWhQRjh2elYvREdWQUxXTEdpZ1I5cktQSjBH?=
 =?utf-8?B?WDNXY1JQYkMvRUovZlJ4OExDRFBMVUhyTUFXR1RBQ29KdlZLQjk5aUhmaUNh?=
 =?utf-8?B?aWJwOVh3Mm05WjZOclYvUFMxK1Jvbk9wQ3YzSzhIZ0tKM0ljdVpkRC9vNlhk?=
 =?utf-8?B?MmVXWGNaanZtNDYrNU5HdHBzN0Y0V3AwZCtvV2lCT2hYTUhxalh2OHR1R0Vh?=
 =?utf-8?B?M3I5QzM5WWpvcmRObTl2RjV0dEhqU0d4bm05QzVweVhZWGxMOGRyU2d3aG1U?=
 =?utf-8?B?Q0xjODJiQ1ltUkp4RFFKQ3Jrd1Z5a0EyckdQNmloQmVBaC95ay9Cb3Nkc3g3?=
 =?utf-8?B?ZnMzMU9abmhta1RvSDRsc0hHdFhWYzNEZy9wVDd5TU1GYlZpMEpGNlMxVTJ1?=
 =?utf-8?Q?AvPjCFHBWWn14Vdg=3D?=
X-Exchange-RoutingPolicyChecked: IiFLhXZaq0IdJs9Rv0/sf4/d6ltZeZtFAmPDChmlfHB2OPR+RDhSUjuSC9yy8djyUG0CFV/sB/OzXPYqzv5AqvXbkh43zDfJb0BBF5WhRtUuUbT3Lu9knlFKYhS3LtMppNRolfEjpdwTFf+TjRMGhpoLU/zLkF3yAwTDDU0kAy11tYgr/rgS149zV1zU3R34uu2hJAplmy7xqQAxx8vj8VSHyNl9VNkKYdhGYkKCIadb/G5KDWWR1vdr613rOyX0yF0d/p13Y68D25XVbGUuYLo0vIwksFRBIXjRfy6P/9vLcPkkUn3k95wPXpSaMAxPAyBJuhQpiDt3S/wM/5U+6g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3040173e-d550-41aa-53ba-08df13b362be
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 05:28:49.2307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FwdgBgg/8pCYF5LwX3DI5tXuUYcXpCs8D7rbOxgE1ua53obdTekIrj0qeA1W+/9YVvwoa/uFE5KClHMHIGC/X45yfDmA+9tGAwRdriqv6cw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4708
X-OriginatorOrg: intel.com

Hi Babu,

On 8/26/26 12:32 PM, Babu Moger wrote:

> ---
>  fs/resctrl/internal.h | 51 +++++++++++++++++++++++++++++++++++++++++++
>  fs/resctrl/rdtgroup.c | 33 ++++++++++++++++++++++++++++
>  2 files changed, 84 insertions(+)
> 
> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
> index e62a277dee85..4087bf44a06d 100644
> --- a/fs/resctrl/internal.h
> +++ b/fs/resctrl/internal.h
> @@ -314,6 +314,57 @@ struct mbm_state {
>  	u32	prev_bw;
>  };
>  
> +/**
> + * enum kmode_state - Control or monitoring state for a kernel mode
> + * @KMODE_INHERIT: Inherit from the user space task.
> + * @KMODE_ASSIGN: Use a global assignment for kernel mode.
> + */
> +enum kmode_state {
> +	KMODE_INHERIT,
> +	KMODE_ASSIGN
> +};
> +
> +/**
> + * struct resctrl_kmode_caps - Static kernel mode capabilities
> + * @kmode_sup:	Bitmap of supported kernel modes. Empty when neither
> + *		@ctrl_en nor @mon_en is set and kernel mode policy is
> + *		unavailable on this system.
> + * @ctrl_en:	Whether kernel mode may use global assignment for control.
> + * @mon_en:	Whether kernel mode may use global assignment for monitoring.

Why is ctrl_en and mon_en needed? It seems to just store the output of
whether system supports allocation and monitoring. I only see these used
when user interacts reads or writes the kernel mode so not a "hot path" that
needs to be optimized. Can these just be dropped and just use resctrl_arch_alloc_capable()
and resctrl_arch_mon_capable() directly? Please note they are in process of
being changed/renamed:

https://lore.kernel.org/lkml/20260831174421.13921-7-tony.luck@intel.com/

> + */
> +struct resctrl_kmode_caps {
> +	DECLARE_BITMAP(kmode_sup, RESCTRL_NUM_KERNEL_MODES);
> +	bool				ctrl_en;
> +	bool				mon_en;
> +};
> +
> +/**
> + * struct resctrl_kmode_active - Runtime kernel mode state
> + * @kmode_cur:	Currently selected kernel mode.
> + * @ctrl_mode:	Control assignment state when kernel mode is active.
> + * @mon_mode:	Monitoring assignment state when kernel mode is active.
> + * @k_rdtgrp:	Resource group backing global assignment mode.
> + *
> + * When @kmode_cur is %RESCTRL_INHERIT_USER, assignment state is ignored and
> + * @k_rdtgrp is %NULL.

This implies that this is only the state for RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU.
If it is made specifically so there is no need to pretend it is generic and
add all these caveats.

> + */
> +struct resctrl_kmode_active {
> +	enum resctrl_kernel_mode	kmode_cur;
> +	enum kmode_state		ctrl_mode;
> +	enum kmode_state		mon_mode;

Is "mode" accurate? This is all about kernel "mode" and now control and
monitoring have other modes?

> +	struct rdtgroup			*k_rdtgrp;

Could naming be consistent? Consider, for example, kmode_rdtgrp? Although
if this struct can be specific to the global per-CPU kernel mode then it can
just be "rdtgrp".

> +};
> +
> +/**
> + * struct resctrl_kmode_cfg - Global kernel mode state
> + * @caps:	Supported modes and assignment capabilities.
> + * @active:	Active mode, assignment state, and assigned group.

Please do not list the struct members as part of its description elsewhere since
that will be difficult to keep accurate. Just describe what the struct represents.

> + */
> +struct resctrl_kmode_cfg {
> +	struct resctrl_kmode_caps	caps;
> +	struct resctrl_kmode_active	active;
> +};
> +
>  extern struct mutex rdtgroup_mutex;
>  
>  static inline const char *rdt_kn_name(const struct kernfs_node *kn)
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 5dcbb0a964e8..3c53f3f74e5a 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -76,6 +76,13 @@ static void rdtgroup_destroy_root(void);
>  
>  struct dentry *debugfs_resctrl;
>  
> +/*
> + * Global kernel mode policy state: supported modes, active mode, assignment
> + * capabilities, assignment state, and the resource group selected for a global
> + * assignment.

Same here - please do not just provide a list of the struct's members. A high level
description instead.

This code is really strange. This whole series is difficult to read. I have not seen
these styles used before and surprised that it comes from you.

> + */
> +static struct resctrl_kmode_cfg resctrl_kcfg;

I think the code will be easier to read if "resctrl_kcfg" -> "resctrl_kmode".

> +
>  /*
>   * Memory bandwidth monitoring event to use for the default CTRL_MON group
>   * and each new CTRL_MON group created by the user.  Only relevant when
> @@ -2297,6 +2304,30 @@ static void io_alloc_init(void)
>  	}
>  }
>  
> +/*
> + * Initialize kernel mode policy defaults from architecture capabilities.
> + *
> + * When ctrl_en or mon_en is set, RESCTRL_INHERIT_USER is supported and
> + * selected as the initial active mode. When neither is set, kmode_sup is
> + * left empty, kernel mode policy is unavailable, and kmode_cur remains at
> + * its zero-initialized default (RESCTRL_INHERIT_USER) but is unused.

Above just verbatim describes the code. Please provide higher level why the
code does what it does.

> + */
> +static void resctrl_kmode_init(void)
> +{
> +	resctrl_kcfg.caps.ctrl_en = resctrl_arch_alloc_capable();
> +	resctrl_kcfg.active.ctrl_mode = KMODE_INHERIT;
> +	resctrl_kcfg.caps.mon_en = resctrl_arch_mon_capable();
> +	resctrl_kcfg.active.mon_mode = KMODE_INHERIT;
> +	resctrl_kcfg.active.k_rdtgrp = NULL;
> +
> +	if (resctrl_kcfg.caps.ctrl_en || resctrl_kcfg.caps.mon_en) {
> +		resctrl_kcfg.active.kmode_cur = RESCTRL_INHERIT_USER;
> +		__set_bit(RESCTRL_INHERIT_USER, resctrl_kcfg.caps.kmode_sup);
> +	} else {
> +		bitmap_zero(resctrl_kcfg.caps.kmode_sup, RESCTRL_NUM_KERNEL_MODES);
> +	}
> +}
> +
>  void resctrl_file_fflags_init(const char *config, unsigned long fflags)
>  {
>  	struct rftype *rft;
> @@ -4816,6 +4847,8 @@ int resctrl_init(void)
>  	if (ret)
>  		return ret;
>  
> +	resctrl_kmode_init();
> +
>  	ret = sysfs_create_mount_point(fs_kobj, "resctrl");
>  	if (ret) {
>  		resctrl_l3_mon_resource_exit();

Reinette
