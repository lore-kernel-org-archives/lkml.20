Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011009.outbound.protection.outlook.com [52.101.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F5F3DB32B;
	Wed, 16 Sep 2026 16:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575215; cv=fail; b=PWbosqkuBjfsHImRwTYF98VoUwAiQuVbNtCbKEyWXHCM0GjMgkagt9AMsRoPrXH0x/J1e9lsbd/c/zbd9YdORl3kBde9qgYUVcY+0MOoieh3JKpkluD9g7rYmu89390jwUlIDU6l99CQ6oqV7sN67wHQ087PHGYNNwmvZ9w6LYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575215; c=relaxed/simple;
	bh=YJeDEXoXg99lT2aY9YuzPL/SQVvMMkM3ncFvjvRNsvQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KW7tF9wgNyGc8+Pi9mVCK4OTzFY4yx6bkMSvgZDSxdh5LQ9rHp3mzkcuyRIFGmO8AvrPgiJNKDL00JXw6cOcJCVtTlb1YmnFBYp3XW52R9ZWPJ6taLTDjFUIGNUcRBuvJ6dCY2Vtk3SIXoS7ZyUQvXG9FIw74sNzHGJktBQbAXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IJ+23lUB; arc=fail smtp.client-ip=52.101.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IJ+23lUB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XigVq++v7qlIechjge0ZgQSY4FjszGrkX866NZ1MIvCTe7eNdSWt3WxCZF8M8YceIGrIMF93ro752hvqOw93S4IrIwFTGpf/vmdUGkleEHsNHXWFwWVmaeq+AoGkZ3NSIfsoZRcWzqdvM0JBhSxTqxEGr1faPuRwsuxng8oz9seMRSXjvYEk4EB/3mQwStAguCf5b4a52ghJnvTf7bXKA3V+aYpxNuLnH5JniMqDDf++gnMo0/vg1KCWukghbttPhwZLKFg+SYmhMKRGvylwHmj9zVx4OX5r/pB9yp4KmNwxiAhAl92+YXFZHrN4CmH/JpUQyZNFLU6Z56Mr5pl3cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prUC4gkv1kAXKSfVOOQ+lrnnxsQ2pyA+qiGxXOhLaTE=;
 b=AVp8kLGlV8zfky2rqX5ggsT7Sq+8JMQzslvjqQRucMNKb/pIY0JKe76dmvFpBFCfKGVQ8etmRlOwGzQJpUTOU3/1VSrF5TExQHljT5vw+N6+HIJWn5QRPYtRcNqT97gRTYUyoudwE4a8QL+9z3x6psZbG+/AxwDjHcPG7cVQ8ZKRanwbq5huQ8D7LJF0mpnQeeK3r4CrQz+uq5ymG/1Qp7o9qMbTcnZzAT7C1xiS9ItzsS4i9fpjeJFAXAKVg5SnmXg7saaNilHFRZqOgd+H18CmKln1mhgBw3BWNRHtVpRh8i0UrTmeHDV8yokwlwEmtuKdTPoPKPwIFhZDz4hKHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prUC4gkv1kAXKSfVOOQ+lrnnxsQ2pyA+qiGxXOhLaTE=;
 b=IJ+23lUBwJbELvLcHFtne4Gj+7xxGjtET+/l6U7GSSfFGbjkuXwf62A2rzruSNc2iK/myOCbRgIfeqdBeNcDcUAM0IeN0I9cKnuxRMyzhUoGowX12NvKDAAREXKUf+NKmaC4nHr7hRQ9Fb/MHwhGmST7SSBiFWcbVrKpns8ryW0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by MW4PR12MB6998.namprd12.prod.outlook.com (2603:10b6:303:20a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 16:13:27 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 16:13:27 +0000
Message-ID: <a2af93a8-3803-48d3-9ed5-71a0a50a1b01@amd.com>
Date: Wed, 16 Sep 2026 11:13:25 -0500
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 1/3] x86/resctrl: Fix ABMC counter programming for
 extended counter ranges
To: Reinette Chatre <reinette.chatre@intel.com>, "Moger, Babu"
 <bmoger@amd.com>, tony.luck@intel.com, bp@alien8.de
Cc: x86@kernel.org, Dave.Martin@arm.com, james.morse@arm.com, corbet@lwn.net,
 skhan@linuxfoundation.org, tglx@kernel.org, mingo@redhat.com,
 dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, eranian@google.com, peternewman@google.com
References: <cover.1788545152.git.babu.moger@amd.com>
 <9e85f67add9ac84f55e4b0fced92ed8994f8419a.1788545152.git.babu.moger@amd.com>
 <afd86b47-d508-4739-ba6f-fd1c341e09a8@intel.com>
 <10240e0e-6879-4378-8763-cb1a9baf1f2d@amd.com>
 <30dc55d0-511d-4f5f-92df-5dd0add354a2@intel.com>
 <dbaf3440-9d10-42a4-80fa-677451085198@intel.com>
 <5af3cdd2-9436-498c-bfe0-03765eecaf39@amd.com>
 <f1c98e95-5df5-4c8a-be67-df8ecba0c28a@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <f1c98e95-5df5-4c8a-be67-df8ecba0c28a@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:610:76::19) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|MW4PR12MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: f01a0ff0-b6ff-43b8-5cb5-08df140d7107
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kDEd8Xf6egYSIzLThPjMgqEXoafnlAx4PegAR3g3Gene5Ze/X2tmEyQrIzep5GUeFZ9pQBxFHUCJMDmDskBVO96PqGTYaUdwW9RmrUkFzXR1XzXR5zqai02aNJic4x8H9m6nLV2GJ2oK0y1dTPo6NvMip1GHfkkfzq6/vKfH/OHEAxRXp7JOjUXynQyEUgZJeymf/gRBQDHbfVabyy+v4hOR2+0W2o3uZDloXXVhMZIZMPpBbm+nwgKIJ+LwBdx0VIRRy3AxThF1NN/inWyvWiwVcGyRo2R+esI62MLsNmgdSoaSfrzGcwM1QzuxObiokJ08JBCtmoFP8d6p7qTiawN4T3JNnoWfx3PQ3VdjdykIltb9wajrIIy5j/tg8is47KYA7xGEPH3EYpLjYd8xU7bQBU/aZBeezCRVkTXw/I5im1S8b1kgv5akhBj/3hHjfgg/q6zQDuFmN2/8d3fBWmABxcFeSpNsrTjZAyEWC2ylST201KpQTj2CY1baavNXJG17L0zL1zk0jI2Q/Y5gfQ/cu7IIjsIZmWyYpYTDnf4APr/+e6I+YO050g7WZBi26ZF69IbMsgWTaJpSHcJpTR8MsQotxzCD0maXEl8Ora05+aLEVQ9mQgRwqHOwjz1K2gDmSya60Oe4v9/+iXRAI8asENBoUKB2gOJOc0InrL4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M29WR1FXU3FzbklXR2J1M205N1cvMkVFSkxld25VU1JaUGE5Mnlnamg4YXJv?=
 =?utf-8?B?MERaMnUxdnl2UXl5UGFtZ0lMVGtBM0lZWm5DajJ5cDIwKzR1SHVuSFVZYk5p?=
 =?utf-8?B?bmdsMzF3dkpheS92UmNzcU9XRm5ULzNnY2NpNWFLZFlTaDRnSzhzWVFtL2lz?=
 =?utf-8?B?WFdmc21nOTQ3TEk4Q1YwWkp5TGNoMklXNWhZdjM2dnF3Sm9RWG9WSWVRa1Yz?=
 =?utf-8?B?MHcrWEd3OUxzblowZ200Z1FOS3ZIaGtpVlV3WXJNY0MxS2ZPMFNVcGpBQUdD?=
 =?utf-8?B?NmtJbTlmYW1rZWp6RUJVaWYzQ3FNYnlwWmI5SzFBd2tERnVuUHQ2aE43Unhv?=
 =?utf-8?B?MjVjSzRCWHFLNHoycXUxTU9qdVBKMGJJZnFhVnpnUG40WElCL1poeUZXMDU5?=
 =?utf-8?B?RW1aa25mbXdrdkcycklOUGJzUFpHQXdkNnA2bWhacGhjYnRKTlJ6cFlINTEx?=
 =?utf-8?B?OWRPS0NsWVkzT1Q2SGszaFpMTmh6SzQ5dDNpWWkrS2dTU2h6eWhlY0d2SCtX?=
 =?utf-8?B?ZFpmR0hodXRmSUwzckdDWWVtR1I0VWt3NkplMGhsVnVkMGR0VzBSVUNkZ3lC?=
 =?utf-8?B?KzEvWXdXUE5PeE84VkNPK0lzbXo2djhxOG5IZHdzcWZyNDExbHQ2YWdwTlla?=
 =?utf-8?B?ZFNMRW5maDFTbXk2KzJVcFkyWE03VjRGWG84MktLZjBMcDk1ZFVoK3psTklT?=
 =?utf-8?B?VHdjeGQyUU9YTUtUaXhZbUdaLzFLWE5MSHVrbU1ZdSsxQS9BRDBxakhrWWV6?=
 =?utf-8?B?SmtaaVY1ZUdON3hkYkY1Qk5LRWxlbmdqdlJwYXBVK3Q3RHJ4R0NwWUkvMVV3?=
 =?utf-8?B?c2NFZzFMV2cvUXF3d0RndmdnK2NEUnUyQkd6VUJaMXNubTZsUlREaDdGa000?=
 =?utf-8?B?NTFtcTV5dCtleElyTkxCKzFpYU1qbGZEQmZLZERmd0JxWDd0Zlp1ZTU3dito?=
 =?utf-8?B?aE1UblFQdTlicWZEVWxUWTJJN05TUVVheFlmTlNyamZ0SGdqUDd3S3VYUGhW?=
 =?utf-8?B?ZlQxTkI1cElib2Y4N3kzQXg3c0pYRWRyUkFmOE52anNoQTE0QjNqVzVMRER0?=
 =?utf-8?B?WUhUYWZPSW8yVTkyR3VSZHlMRDZIN2lrdlY2bXVHdE5WZktUa2ZCbGVDUEFB?=
 =?utf-8?B?OEhHWElxVmgyTVRzVWhaUW5jQUVaWmZsT1NGNWgvMmUzZGdlU0xUTEU1alUy?=
 =?utf-8?B?TVN4NElCN25GUVJjRDd3RmhmdjBSUk9qRHRKMlorWENlV3p5VmdGOVJSNysr?=
 =?utf-8?B?UmtDUHVicDhXOVpESUgxdnM1STNNN2NaRWFDd3IrZHlTdXFXN3VCaVNmL3lX?=
 =?utf-8?B?aW8rYjN0STFkTjQ3Z2ZYcWJvYzVqWGhPaU1NZXRETldUWllKd3ladTROaGNx?=
 =?utf-8?B?Z1E4R0pVVzYzSVZWMkUxaFpNdnNrNnNraFFRL2tiZSsrYUJmSEVGOUdDcVdL?=
 =?utf-8?B?Z1JPcGtaVkM3UjJ5QllGcmlDdVBBQUw1SDgrRHQ1NVNLZ3V0Q1FJWjR3VzdB?=
 =?utf-8?B?QTVFRUQ3RWtSbmIwZXpYSHR6RTg5dWdGbWkrTTZRS3pmR2VpVS9YdTJUemg4?=
 =?utf-8?B?OXlsUUkxdlNIVmVwWS84QzFYUlpieEl3Y3Mwa0owalF3U2pMQTZ1dHJZUnZx?=
 =?utf-8?B?TWozR2l4ZGlOblFBUWl0U21GOElQUlU2WXdYVFp3MjBsQm5UOWMvcjBZb1dQ?=
 =?utf-8?B?Y0lzOUJYUkRnYjVmYUtZeVNVeUNwZUJXOXdjREVTa2tBL0RoZFFEYW4wWm1V?=
 =?utf-8?B?cEhvMGovanhDYWUySitwWW4vWEM3ZkRwQWhJcG1wQk1yQnp2RGp3dG9ZTDJq?=
 =?utf-8?B?cnlWQndNczkrYkFOUXFGcTI3NkluY3hlSytWVnlBc0lzRThjamZCY29iOGpU?=
 =?utf-8?B?VGJ5ZkRuRU1mb1c3SVZsUWMrZXI2MENDT09udEdpMjlUWVBodjUxaFJRcm1h?=
 =?utf-8?B?VllZMnRqbUVIdlRpazBqVFA4YjJROUhUZk55OXVIR2E2cm1iVlNoWWx4WnRm?=
 =?utf-8?B?VkpwaklUdmRicmNOYTk1UUdQR0dtdkpmYTEvZmFHbE5UNmMxaFZwcGJJaFFu?=
 =?utf-8?B?bVZEdDVpWXlpVUdMSTE5VDVpYUdCVHFkVkZaR09ncy9aTHZxZitUeTE5Mm00?=
 =?utf-8?B?dXZmRVg1czRWQituNWpPSlBjSXdvdXI5QmI3MnVMMWo4VFl6YWdMWHYwaXEz?=
 =?utf-8?B?VzNMMHFuTElpOE4zUnpSa3JlUC9lM295S3Nza1NoNEY2akV5UUFyb1ZXZDVy?=
 =?utf-8?B?ZHova3dGZ24vVlNXT1JFUEppYXBEOUNnZlExRWF1WkpLVERyeGROaXN0dDZL?=
 =?utf-8?Q?aOx4ibAmnicudE72J8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f01a0ff0-b6ff-43b8-5cb5-08df140d7107
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 16:13:27.4213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lAryTSsYBD22+gObXDohqWGeP1xBF8V+hSSG+GiHIFpO5sMGJBRf0fUdL5MD9801
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6998

Hi Reinette,

On 9/16/26 09:58, Reinette Chatre wrote:
> Hi Babu,
> 
> On 9/14/26 5:18 PM, Moger, Babu wrote:
>>
>> The original issue arose when programming a Counter ID wider than 5 bits. To address that issue, the Counter ID width needs to be increased to 12 bits.
>>
>> Currently, the RMID width is 12 bits, and there is no hardware that supports a width greater than 12 bits.
>>
>> How about we address the Counter ID issue for now and revisit the RMID width when the specification changes?
>>
>> Would that work?
> 
> Neither change seems to be reflected in any public spec. The comment in this patch
> seems to be that the upcoming spec change will cover both?
> 
> 	The AMD64 Architecture Programmer's Manual [1] available at [2] will be
> 	updated accordingly in a future revision to document the expanded cntr_id
> 	and bw_src field definitions.
> 
> If you thus plan to change RMID width when the specification changes then it is not clear
> to me how the timing is different from the counter ID width change.
> 
> In the end it is up to you though since the impact is on AMD hardware that you
> are best to judge.
> 
Thanks. The immediate priority is to fix the counter programming issue.

Thanks,
Babu
