Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C355C3033CB;
	Wed, 16 Sep 2026 05:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789536577; cv=fail; b=YNgSL7KMwi5DxXo3mWgiS8RiB5j5z2zRNxK98GAhrJ8WI9k9IvManpUEZ6Q7WRFOkk7nw5AcWrRoAdw8er8uL2f6qViu/WmGQeHWR/Sa7QKCvEQZbzc9Mv7yXNUd81vgQvfPURf7PPE8Nb6N/9zx5CR0fc2OEqfp7D8fK5/HN4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789536577; c=relaxed/simple;
	bh=GCi/+1VVvXEsqsNWqLPEaM2pyrlVxPBmT9OmfFfaiNo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=snhrnQAfHqIXH+68qFAPmJfhX19XE26cWsuHfouEY+A32Gqrc1PsABhOU/Aw7kLyvEmqlki9z31zrLrH/5+P4u4q7OArSJtUUjmPHs0KlPahfAOA1HzAA8Ism/+oMmQidHZpFoF2VRIW2IQK+WzucoAMfm8HIPlZMexzAqI0MfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VzIwQ/yd; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VzIwQ/yd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789536576; x=1821072576;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GCi/+1VVvXEsqsNWqLPEaM2pyrlVxPBmT9OmfFfaiNo=;
  b=VzIwQ/yd5A51mFQS3albQxrd9RfLZPLpDMC1t8AEitoUJmKDoSlV+4fO
   5CWJJPk4uyuKL5s3kgoWe56hmRx2HkZwLzOtVvdFGPC8sxFFCmzOchi1e
   2MFGyg8men9JG/venlKgqm3M+lBaCsc23SCElryJmcQvjEVAUuwhM2IK/
   vle6/hGqrZvJn2go2B4winO5V0uAgsJTc1qU1WkDDWR5ZoWHj6t9+Khbs
   pIKmzH59j/T4OpQtEDcrwQKbVMH17C28n+iVNcsV0oPCHBwb0WdDJJ7c1
   JynOaxDgbjI3HM3sdPNDMOnN9hxo91NTgzaElbh47ncjdU5bbG66qlpvl
   A==;
X-CSE-ConnectionGUID: pv08nP4KSTqj+jBHwwid0w==
X-CSE-MsgGUID: IOETl+7ZT+GpKr/PZCnPzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107417579"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107417579"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:29:35 -0700
X-CSE-ConnectionGUID: NDF+aTmbTuybHn6DrcT4HQ==
X-CSE-MsgGUID: FZrpHvSmQOiOASOcEnA93Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="267020118"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:29:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 22:29:23 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 22:29:23 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 22:29:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PTgZnoGlTXDw4jb5pkZEtgDu1KkFL06PG0m6ZN31wYOcggmSdK36YXX/A7f6zh+kr1ipA0d6y7ymcRme+vn8wJ0t1P8nDjr4HiQ+alTGXbPYy+atsARU8Hn03KR1MhbAgGJzuMyguITdhE/RcEPycKRyluReCh0xBPDcINeCG8BUvkZvTHExkrkqXyjEK45+ggDO4DL/7TXS7uwfzKwJ+WZ+7lJyNJ9MIsmZKJaDukTUimmu18OP43Hx1LfzNRPDFQqw8sN0phnD+zztXOHlY2JwJ7TjlpP/V74beXt6VzM+Ai9McwEydV9jcmRbqGAdHUMGuYoetA9sc2R6mNMTmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4SDD6e6uTP4BKiZeh0WCfYNtPmWkac9ci7NV3BYMcQ=;
 b=o7Jwcepz1MXjN8arhb427oHb/7srlDD3UuL/fBkc8mPt/DD1d7BU3RrQwZ1RAghYXU/yNuFKkAHXapvyz9mTQFFCVVDeKMIcs0t5taGOpczKqFRLxpwRGgRXZYr1u7524i/t+LRwUigzEfDzMnO4WSXsjZN0kJkKFbaL8ea/hDoeQQMn/81gGDPPqKqaMm0Bq1T67BSu+JQrr03n3lz7sFIPcBCF91wdgtJU9pMoOsgv4wPzYKRP0st+j9RfR+490yXqgVFb4YoLurwrY716UblBwVMApDXjkDxYqQV3rH9pcDfplmEkJMRzB2KifHCpF4wZ/Y0xRfcglXJNwbociw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DM6PR11MB4708.namprd11.prod.outlook.com (2603:10b6:5:28f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 05:29:19 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 05:29:19 +0000
Message-ID: <2e0c9195-8599-43db-aced-dbe8a138956b@intel.com>
Date: Tue, 15 Sep 2026 22:29:15 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/16] fs/resctrl: Introduce
 resctrl_set_kmode_support() to register supported modes
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
 <077f2c8ea7e5b7ce89e63bf4a67bd74eee16f7ed.1787772750.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <077f2c8ea7e5b7ce89e63bf4a67bd74eee16f7ed.1787772750.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0260.namprd04.prod.outlook.com
 (2603:10b6:303:88::25) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DM6PR11MB4708:EE_
X-MS-Office365-Filtering-Correlation-Id: 61c975dd-f9ad-4e49-77d0-08df13b374a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|6133799003|18002099003|22082099003|3023799007|10067099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: izNbbuWy8+Y3ix6frdN5TJkm86pVdbCuvdGsCmH+kyc6sPGGTia9kTDwi6Q11BTrIzBIhF00m4/Ob10C1c4NDjoWgqcT/aQSsQdcYAgSNkZ4BLeHJA/AxqWmItLMfLGUikHWuRm/QmEg8KoVYczPYNPhsDIfr7/gL0oJ5+PWUNgbJPEBQPqrxXJF3f/fwCSMkW1oYgW6N5G2eya0tB2IzXWot6TkpN/9XPF9poq1wdD5VPghfhlvBNCrgu226ddBgMyqsmPdWeQQopazSVWl5ehOZ7QM/eLVR5vtUU+R/SxR2pkXtGq/7QlbVUGLC9NLEH2zjTvT/KQLHfJZw6V96SWpmtBE9aJOoKPewd8GyOUdIWizUWeWnz/bgoj8bJ525GAHoowlYUTKhkVviPN2towyaqZs9L9QIqq6Jlq0f0umGOpTrn1FietaiLMalF4yyJaK6JpTagI8cbz3MNBYZsRIr77/Qe+Cj56cPpQpFkj1DBR25+zVj6DNbVNeoCa081sjy1yO2DHVJYwnkhh2ir4Rtpx9u8SWBbJBvdTv5nI1S59BH2Kmr25A82I2SGbogga4172yCe+JrlhLgrOrW4BfXLNX8r+Bw0JgDflPCtVKZErsZttzMJ1rsLdTvfzi8oYna0QsMkUMbH1Q65BB+rlBjc/rT7pO3KnvQR1drw0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFNYREhWZnZGZWJhK21QZWQvVU0zaTF1aDByNUVjcFNUK3ZNV0tYVnJkMmNx?=
 =?utf-8?B?dnE2VitLdXR6VjRuR0oraGJCSU5RekVBT0R0TG8ySmtBOEE0QmpyWHkrK25F?=
 =?utf-8?B?c2txYTVsZVl6MlRWeE53MmphbzA2WjVmM3FQL3Jibmo3RTlqSmF5NE5nT0tQ?=
 =?utf-8?B?QzZCTXowT2c5UEtHZU5vZGk1OGVWREhuRnlOSlhHcnF2NnljRHBRcWJtVDI3?=
 =?utf-8?B?aElZZU0xcEUvWE15cVJ2d1k4WTZIWEZRVkpGNUtaMmVmbU9LTFdONHlqSVZX?=
 =?utf-8?B?bUg5MmtkblREQWR5RFFJVVlXZjZJa3dvdGZ0ZnNONkRlc0FhcHh2RHg0b1RN?=
 =?utf-8?B?NEw2cFFFVXlaZlBTNFF3YjJXMHlLWm5ic1AzOWh5RUxRQzF6N0lGeU43WUow?=
 =?utf-8?B?RlYyZHNGR1ltb05MUlJxRVgvTzlSR1JMSEs0UFBJeXN6cWlaVUpENno1YUJL?=
 =?utf-8?B?R0ZoNnNrQlNoSDY5WnNOdTlKVGZhMENNUjNBSW95UTQ1dXkwcHIwbGZjdEwy?=
 =?utf-8?B?YmNCTWwyUFJuSTNPbnVhRmlPY1NRWXJNRVBGWU1HV0VJa2JPZlFuaFRPaURL?=
 =?utf-8?B?L1U1Z2RvUzBqMDdHSG5yRXhKYitoYlZZelI2c2xaZmE2eXhhNW8ya2g0Y3Zt?=
 =?utf-8?B?bjFyOEdwY2lsRFFIekxEZXRJVHhJekVJUldhVUFCbUZCMWhxa1FRZU5ZY1V3?=
 =?utf-8?B?Sm5yWFlmMS9QWlJzd0FwR0UrWjFhNU5MZTEzVHdyWlRFNzNRdjJ3UG9iUDR5?=
 =?utf-8?B?TjFVaDE0dHFnV211MUxMQjMzQ1lvSUp2MHJONXNLSzlBY2N1ZlQ2cW9aMFFw?=
 =?utf-8?B?QytBc05WMkxFa1o3OTl4V3BOVWFWWmlacnFvVk1zRDh2MGd3ZHZPL2htNDZ2?=
 =?utf-8?B?L0JFY0d0NWNoa001VzAzVHlWMVR5U0trcnFBQXF3endFTGN0aXZVaitIdTFV?=
 =?utf-8?B?NWx2VFFxM2dheFJhNTlGeEt1S1h5aVQvOHN4UzBRc2VzclJEbkJ1NE1LV1Fm?=
 =?utf-8?B?TkpQNktITVpETjFEVk1pNzVGU1NJbG0zSGM3VWp5SlNEL3JhNlJYbVdBME1v?=
 =?utf-8?B?ZFVNK2RmL1JlL25uVWtoaHZuVWlHcXByR1J3ZkhabGpjWm03WWVaVkFwaWdw?=
 =?utf-8?B?aWVuOHgvdDUvVXBuZjd6bHdXUG5BeGwwLzU4N2xOWVlhM3IxekpVMnMzNDRl?=
 =?utf-8?B?VVAxWHZwaTBYaStiNHJ4b3Q0b0RoM2hkQkM5SlhVZjRpdms1cmE1WWNWaGhF?=
 =?utf-8?B?TnA2dGwzd2JGejNXbEtiMm1CUDk3SmM2VjlGSE8xTzVxUEJMTG1tMUtPU3I0?=
 =?utf-8?B?Qy9LbTVGc0dZbmhWSGV6MXNSQk1ZSXVHT0hiMTVpbXQ3L2ZXc2JYZkwxUWdh?=
 =?utf-8?B?UE95OWpLNGNJMk1XKzlYU1k1dVk1TUZGR3J2U0VxbzE3VG4rQitObE9jNmdS?=
 =?utf-8?B?SW03bkROVlQ1U1RUOHNzby9UU0JyWlQvVi8rcy8xOTZtYW9Rb0xhQ25CQUdz?=
 =?utf-8?B?bnBPU3czeWZDaWlnMDQ2YXZRdGVVU2RmTzdGYm9lQjlBOGM5UnlLVkdsN1FF?=
 =?utf-8?B?TzRSZG1UNVZueGxYdG9jb29UU09TUHNrY0NpN1orYjRUWEFDemlGR01HdHFX?=
 =?utf-8?B?RWs3ck5PSC95TmNkWUcwTHBTdU9jZldQYWU3blc4U24yQ2UyMHU4VDRvVDhj?=
 =?utf-8?B?TDJlRVkwa0YvQkt3ZFE0cVREaEdvWTlKWjN3T0RRMlRDOFQ4TUJHakJHamF1?=
 =?utf-8?B?Szg0SWFkY1Yxd3MxRE9Fd3pXR2gzS0NTVEwwTVBtbUlYc2JIRmd1L2tHNDNY?=
 =?utf-8?B?Ynk2OXZIbXY4RWNoTklubkNMa3RDcm9zNFFlRVNQWVdqbFpWcGZwSWdHSWgr?=
 =?utf-8?B?SzJxZ2lGTS9HR0F6QjFGQ21PeXF3NUdFd2tQMndWc2hIMVNPMjdpbTFWZFY2?=
 =?utf-8?B?QllCTDI4NnJjWWxkTy9YR1pnYzFrbFhZVVBwR0lScDcrVXhmUlpIN0k5bDc1?=
 =?utf-8?B?VG9TaEJqSHUwZk1waFNhdGpZVjUyS2o3eGNGeWNleE4yL0YwQzNxTlByWUF3?=
 =?utf-8?B?TnRqVTVDVGNrOWZ6V2RjKzNmYVpBYUxnR21yN0VWREJ1V0lLRG14bFVSaEVZ?=
 =?utf-8?B?WWJyK2x0djlEWlFxSnBQejZmUkt5Um02dWJlQ1lOeFlaUGc3UXVjbktOcTQv?=
 =?utf-8?B?SG9keHA4bEJOTUpNZWx2cWNEampkcVNNL3F5RUNJUldNOURFVzU5eDNUVnFk?=
 =?utf-8?B?MDRkVkJoWm5pZTd0NlgvRW9Eam9ieW8rQ2RObzVXNXNhT1BGVlljSHB6ZU0x?=
 =?utf-8?B?K3B0NFRZak1BTjYzNUVXQTVYZGp0Y29mQmpEWlhsMzNUU2xtZE9mamxiVHpQ?=
 =?utf-8?Q?VuGlRDJhzvXXeXik=3D?=
X-Exchange-RoutingPolicyChecked: rGHTgoMXLySgYsO520R2Yn7PU7YcHRdk1UPTuhWhzmmKBj2a85AXUTP2KhQ9AWghfG3uBhO9/vJpYci24SKE7dRdKsHRTQwbZkOjcW1ozliZp/2kzZK0At+xCHFGJ4ArilZlKLUhw72LMG6H5ZqxMVomtljM5k/7ZF1hqKUUApf6CGHvwZZJwB3hkgMixrTCGAoL2cmDxuaPccDCqYDDGrtqmiJciaxU4K7ARNFbEQqt1AktnsBqGAq2RSVjehI6gj0/GvjdeW3pudiyyK5vlM03eLS1RT8eklwHGGbGbzkEkIxUuZsRyfGUIsd+9ZJWLoK/q7yCNX2f/O+n5Ga8Dg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 61c975dd-f9ad-4e49-77d0-08df13b374a3
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 05:29:18.8672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ke9cQgqB7bAhcKVnUqypwLShGdKNYhUYa+0QKwEKQ8/McEqKAkgCxq6jevFAZK7Gu9P8Z5l3lZcoZVArxIN+FNyzEM7HxCSAa0wKDWyetqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4708
X-OriginatorOrg: intel.com

Hi Babu,

On 8/26/26 12:32 PM, Babu Moger wrote:

> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 3c53f3f74e5a..3bb0e3a203ac 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -892,6 +892,19 @@ static int rdtgroup_rmid_show(struct kernfs_open_file *of,
>  	return ret;
>  }
>  
> +/**
> + * resctrl_set_kmode_support() - Register a supported kernel mode
> + * @kmode:	Kernel mode policy supported by the architecture.

How is "Kernel mode" different from "Kernel mode policy"?

> + *
> + * Set the corresponding bit in resctrl_kcfg.caps.kmode_sup so @kmode
> + * is visible to the resctrl file system.

Verbatim description of what can be seen from the code.

> + */
> +void resctrl_set_kmode_support(enum resctrl_kernel_mode kmode)
> +{
> +	if (kmode < RESCTRL_NUM_KERNEL_MODES)
> +		__set_bit(kmode, resctrl_kcfg.caps.kmode_sup);
> +}
> +
>  #ifdef CONFIG_PROC_CPU_RESCTRL
>  /*
>   * A task can only be part of one resctrl control group and of one monitor
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index 8b30eef835aa..051aece77eb9 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -729,6 +729,23 @@ enum resctrl_kernel_mode {
>  
>  #define RESCTRL_NUM_KERNEL_MODES (RESCTRL_KMODE_LAST + 1)
>  
> +/**
> + * resctrl_set_kmode_support() - Register a supported kernel mode
> + * @kmode: Kernel mode supported by the architecture.
> + *
> + * Set the corresponding bit in resctrl_kcfg.caps.kmode_sup so @kmode

No need to describe resctrl fs internal details here.

> + * can be exposed through the resctrl filesystem.
> + * RESCTRL_INHERIT_USER is registered by resctrl_kmode_init() and does
> + * not need to be registered again.
> + *
> + * Architectures use this interface during resctrl initialization to
> + * advertise supported kernel modes. Registration of a mode indicates
> + * architectural support only. The final decision to expose and enable
> + * a mode is made by resctrl based on system capabilities and
> + * configuration.
> + */
> +void resctrl_set_kmode_support(enum resctrl_kernel_mode kmode);
> +
>  /**
>   * resctrl_arch_configure_kmode() - Program kernel mode association
>   * @cpu_mask:	CPUs to assign the kernel mode on.

Reinette
