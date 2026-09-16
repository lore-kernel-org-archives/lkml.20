Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013011.outbound.protection.outlook.com [40.93.201.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDFE4DAF8C;
	Wed, 16 Sep 2026 20:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789591547; cv=fail; b=m6y5oacHneUb5uEGESUludzBe2SfRhVXiZ0f5jHIQvOoRtbS2J+hPyy7TLL4E9HQaXMTY15udNsZlGi29Ak0+Fu88HxF5OWxqD+x664zjRMWDLVdIiqqpWrCbrRIRLw+ckIbfGAk289xGVpyRDcXzROahjhrI9HCadmXRs+cGCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789591547; c=relaxed/simple;
	bh=KYeFwBpFtmKDa0gwG6/DgNuIhhyFLqAYEZz0yWaLuW0=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VwZwYS8xrfsi6e6+cO08ZXbNeUqnwW6FZgTROADitVLTpZz/b5e83JYTGNfBwchUdNTNt+r5byuxL26ShF8E79Bue6/31wLn6lhIdItAgKAfMOk69C7/3WV+p6cC4XRkcpMJgEEymL6KddLymcYI8FncYgQAQSPvHhJoCRRA718=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KAxaRrIF; arc=fail smtp.client-ip=40.93.201.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KAxaRrIF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oAToHui9+asQ5HrxganK6e9GqjY5v5UbWcnSlLbHVfUx6bR8AN9ikA5wNxDNEEtu+WeyzHkw+hhUeyfOV9tFRYDNMG7/2PQFm+pG/JC5K/EWcmDLf1vyxTvkTKJZ6UH4mtTgBFmuPYfY9gBWW4m0iauhcLSEb+oEadegO8QtTW9ixmvnYnLnaZfEzWoljkguNAJHx6orb8DOzvjfYh2nX29DVBdNY5kUGtf6cEal4mZlfwtDj37R7SE8SXFtjvHCk0yFQ/XW2N5xk6S5uxmA4thffIMoydxRahfUPgQuZJLdTvk5hsMnvZrG+tFWn45xLYhIopnMoIb8iQpZ7MbMpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MG3ld6VcXqYkMoH/XOL0AclURW5xWJNY96Ip5AMITXE=;
 b=jaWZw++PEM/cgYlvfRqgiFeDDMj0HfGx2FpAIIbQGzYmEo0XD6RzHXZaR5dB3WjVZhvK3LL4hYXCiI44R/hxGp3kY88uL/roF45Brwd9acpvEjTbunsoTyTOLiSTYECs44oPMk2VWiWJfjPQn9qBJpQvqWwAjpRSR0C7F577UZjNa9okqcwDY+A84HHA0b3c5aIgF7AFu6KVJz4jAI/9BnrCuBvNBLtN3YYMIY1Rtt3jfN+yA7qp3KnUgggVCleENyGZ/3XeevPugYTaPFyX7NPZ5tESkct5gcVajlVMwKgpiQslK6ULqfHc0z51/M0aCr60f2ccakX5+GjZCOMx6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MG3ld6VcXqYkMoH/XOL0AclURW5xWJNY96Ip5AMITXE=;
 b=KAxaRrIFVdSuA+yKC8ZCPdYzSJx9UWtXiJsD+0EgUOgSrq3sN45XhZr4e+nKE7iXlajZ9lQRfxZdQ9U9mxSTd9T7dib+OK2i8X1lIXzVO2HjeDuLZcPVQCsXVKnsnHw2J8D5GgOA8L2A/IBXOClDVPrWdbGbxN20BmTAUF/euAY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 20:45:34 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 20:45:33 +0000
Message-ID: <6be71f8d-579b-4673-865c-f8ab1c0ae379@amd.com>
Date: Wed, 16 Sep 2026 15:45:30 -0500
User-Agent: Mozilla Thunderbird Beta
From: Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH v5 02/16] x86/resctrl: Add PLZA support to command-line
 options
To: Reinette Chatre <reinette.chatre@intel.com>, tony.luck@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, bp@alien8.de, ben.horgan@arm.com
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 tglx@kernel.org, mingo@redhat.com, dave.hansen@linux.intel.com,
 hpa@zytor.com, fenghuay@nvidia.com, akpm@linux-foundation.org,
 rppt@kernel.org, dapeng1.mi@linux.intel.com, elver@google.com,
 jlayton@kernel.org, enelsonmoore@gmail.com, kuba@kernel.org,
 ebiggers@kernel.org, seanjc@google.com, peterz@infradead.org,
 chao.gao@intel.com, jmattson@google.com, naveen@kernel.org,
 ricardo.neri-calderon@linux.intel.com, tiala@microsoft.com,
 chang.seok.bae@intel.com, prathyushi.nangia@amd.com, kim.phillips@amd.com,
 elena.reshetova@intel.com, darwi@linutronix.de, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
References: <cover.1787772750.git.babu.moger@amd.com>
 <e669cb9aa6a2a4f4c1720d627278bb287cb20479.1787772750.git.babu.moger@amd.com>
 <07d90b5d-d512-4059-898f-42531fc649a7@intel.com>
Content-Language: en-US
In-Reply-To: <07d90b5d-d512-4059-898f-42531fc649a7@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0232.namprd03.prod.outlook.com
 (2603:10b6:610:e7::27) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|DM4PR12MB8476:EE_
X-MS-Office365-Filtering-Correlation-Id: f4e81c9c-c86e-4efd-a112-08df14337455
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|7416014|4143699003|56012099006|10067099003|22082099003|18002099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	+RN0C9wtMmBOMaW/zJB3J/ltuUvUDjQV8ekz7hfxK8JnDV5aDjQnWuZfRNxDbzY5rE3y+9u5KyZUQQ2r/wv75Cdiq1qb55mPWfP4ht7lSHPy0RNdbCFmUhMpRKnq5DW+l+jYmmQFdt/9mwXbEDTfBtThnH64F02nv5HM68e4XgCM7bBeoVTRvF/BJqHTa/a9SojnByhJts8ybV0xQ6LsQbQ1yFAfddP33ZRJ1Yw3shbJhtMHIBnb7OzbRkuyLu8KLtCU/fJyZ8KVc7hYuyVvFtjlBfcIo7qgVA8S0mV+B6hHlwOoud1g8HxCQItDtWYSSkNdS28DoWVyraELbGA8Vfx9Lh5GhkGyPHm9ncG39Gg+iTorvQtLhyTvw6FkJuvQV8D6E6shN6xu2VXDBfSKFSMXVbRkx3V9/5bCWIx8jlCF5vdgccyCSaV488877o4ezHAaTJKTHD7UKLp22zu22t/AL/fDfSse2VOCVkhpzacawP4Vrx2JorY8rvobq2VpJMlq41AyGIzSFTxfwl1dyanNAqsJbdVaRUFWJE77zaYa3veAYYRRDKEd7PGvAyVM+JcOXbx7F6PvHMBJebL6iLImHM6opNzGgb0+rAZdYjUbe5w+pnkG+4nZRfq3veLMssgjqOQ1/6s3dG7jkoVa+ojRM/Fq4UXNeJm2HOdlQiw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(7416014)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkhiNTRkcE9ZZ21EUE5jRzZyMkV2MVU3aGlyZVd6RmpvcThUZ0w4dVFhU0Qw?=
 =?utf-8?B?R1pGeW1yRmwyRmJscUNzZFVOeVBUV0QxTmUyKzBBdHFOcHJUQWxEVDVpSkgy?=
 =?utf-8?B?MjhMYjZKY2xkYnE2bGVGUTcvRW1NaVB5aFdyNGxMSEZFZ1BUOW1LSHJZWjFk?=
 =?utf-8?B?OWtsZzNWVjVPNWJ4aUx4WWZrNXJsbllhUmQ2OEw2TGErTTlsZjdWQVBuMEtF?=
 =?utf-8?B?VEE1UktPbWZoWFJoOTR1YXF2b0dHaTVERndUb2JjWXZXTHpQOCtyNXR3WjBO?=
 =?utf-8?B?RE1UR0xxYXRMNUlZTW5OUWwrbkZNd0RQNnJYdzdYQWdkZzU0T3E1WW1ndzVP?=
 =?utf-8?B?TG1iY1l3YlV0enlmdTRWa0YraGF5Y2lDTUk5bERhMGtwWEJkb1c1N2RoMUQy?=
 =?utf-8?B?U3M4RmsxckZqck03NlVrYkFQWWlmdmlvY1Y0cm80L2NwZWdiQzY4Z0VCazFM?=
 =?utf-8?B?OXI0aS9hblB4Q04rY1JJMkozSTlkZHdCQWllQU1MRktZTmhLRmNWYy9jVzRH?=
 =?utf-8?B?UnBZZi91a3RvTDJac0k1eDg3TlA1aUdTc05KWmlNWVpoMVlWdzVtY3FRVWRo?=
 =?utf-8?B?L2FiZnNVSVB2MXZIbnNiU3pySS9mSHdpV0h3N0U1SzVlb0VqRVYyQVZGRFI3?=
 =?utf-8?B?T1h0cm1NellFU3NxYzJTU1I0M2ROVERWYVpQK01EVGl1c0Jac0RER0FOMW5S?=
 =?utf-8?B?TWE1WDdJaXNaWDFiMllCVFFaN1RqL2JKNmtXQjhnc2FkTjNDQktUbnhrSWhE?=
 =?utf-8?B?Zm96dURMbHg1VHJlQk9RNjhqWVRJT29HSGxpWUZUTmp3WGpIeDBERzhObENJ?=
 =?utf-8?B?emN4cE5qcXVKY0VnczJCaHdab0FCNGVPeUVuK0hrYk1GamcrdUUxTnptQS8v?=
 =?utf-8?B?YnB4RlUvcUtpeTJEeGxqNGlqLy9OV2NaZllVUU1JaEZMb3VBZmFGcmMrM1VP?=
 =?utf-8?B?cXNTRTZaY2x2ZlVmc1Y4cVVDazhGcnUwVVcvNHpubFdSeThwbnRHMGdWRy9C?=
 =?utf-8?B?SVROeTNwNEpaRXJKYksyVDZhTkMxMFRmZ2Y0d3BLQ1N6cWJqYUk4UTBaS3Qv?=
 =?utf-8?B?WjVlUlhZR1IvTGZIdUxiTy9yUElyVFRlSFlPUmUySk9JalhGaUxUZER0U1Ur?=
 =?utf-8?B?U0NMK3hGYWRmM0VIRThoYk5PUCs2RDBtT09EMUVzMDFSdWlNNitNMjAwNUND?=
 =?utf-8?B?b1MxOW1OemxBV1BNWDBpL1ZmTXJFNjhQTS94UURhMzlvbGNNQzRxeGJoMTdv?=
 =?utf-8?B?UXBqTE1YWjhJWmp5ckZwV2tXV0tXMVBrTzYyK2pwWHYrbVZQdGJycWIwdWtL?=
 =?utf-8?B?Yk1OS2JBd1ZudEtLRlQwamVrSDRCa2ZOcHMrcnRXWkFDY1ZYMXdGL0d2ZThY?=
 =?utf-8?B?UkVGcW41eHlLWnVZdWdVZFlZRGFtMGdnZkVKV29Ka3VXZTNHSXhVeUQ5dWEw?=
 =?utf-8?B?bnV5SnB4VjBJc2cvN29jdHNyR2ZNVkFqMUwraWJTVjlEZnJIZkFXbWlPRWxl?=
 =?utf-8?B?MU92aXVxODdzcnBQQWhqNktqNmVwdDl6M3dJMGs5RzA2Yk1BZ3hkcmRCN21m?=
 =?utf-8?B?TTJZUnRrcUY3QzBKRVV1b0NjNXRwaFBHbGUvbXVlQmdNK0xvd25ueUExcDB5?=
 =?utf-8?B?K3F1citMTVhRamtOSWZkUVdacFBTZTdEMFc1NXlTSU5wV3VSc2tPclZjRHR5?=
 =?utf-8?B?Zk0zNHFGSTEvakxBd09OTTRpUEpQWThNK2JuVjcxQkVOZFMydklNVkcwK2Y4?=
 =?utf-8?B?eDMrOVJZZk5RajYzTW93d3ZCMm93bndVNVMxR2Z3b2hiM2gwd3MwTnovZEpa?=
 =?utf-8?B?NnA3em9PcVdJTUU2MS9JY2hHWDFWL2wvWFFMdjNxcG5ndGNkZHljS3Yya2NS?=
 =?utf-8?B?aVJ0cG13Uml6bkNGQ2RKcERwbHFyMVR1OHU1RzQvUzBCQVJ5KzVmQXZ2MEFx?=
 =?utf-8?B?WE42M3hOS3hBcndjVElWMFEwRmJHOTdjYnI5Tk4xbDVLWk8vTi9rdkExdG5k?=
 =?utf-8?B?ZHFJVGtlNlQrR1AzelZxa0hFWFp1ODc5S2hwL0RUZThEWHVaVHVQVDZjZzdO?=
 =?utf-8?B?MnhaZzJ0dlgvR2pUaXhMbW50dnFmYitMV3kyWnVwTkZETDlNcHpDNGJpNm5w?=
 =?utf-8?B?ajdZaWgwZ2YyWG1oSEdkRm1HOVdyaysxY2lwRTJNeFg4WXdDTit1T2hOckhK?=
 =?utf-8?B?T25Yckh6dnNPblZQZXNVYTM1UkFaSmhZMTB2ZC9JK1FiNzBUZEIzU3hPTU56?=
 =?utf-8?B?N2MrZnF1Y0kyN3R2K3BBNVpHZmFqdzIzYUFlT0paUVRxQnluTnk3WGZlbzVy?=
 =?utf-8?Q?N922zPjRFLA0RyqvUZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e81c9c-c86e-4efd-a112-08df14337455
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 20:45:33.8718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z3D2DWt7Y8imjLb1KzJX1qqQMth88jR3OFlf4XByKOgHS2aHx/ltR5dMTWXyUIc0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8476

Hi Reinette,

On 9/16/26 00:12, Reinette Chatre wrote:
> Hi Babu,
> 
> On 8/26/26 12:32 PM, Babu Moger wrote:
>> Add a kernel command-line parameter to enable or disable the exposure of
>> the PLZA (Privilege Level Zero Association) feature to resctrl.
>>
>> This allows administrators to control PLZA visibility at boot time via the
>> rdt= option (e.g. rdt=plza or rdt=!plza).
>>
>> Resctrl exposes PLZA by default without requiring any explicit rdt= option
>> if supported. The rdt=!plza parameter can be used to disable PLZA exposure
>> to resctrl, while rdt=plza explicitly enables it.
> 
> There is a lot of repetition. How about something like:
> 
> 	Add "plza" to the rdt= command-line parameter so PLZA exposure to resctrl
> 	can be enabled or disabled at boot. PLZA is exposed by default when
> 	supported; rdt=!plza suppresses it.
> 
> Patch looks good.
> 

Thanks
Babu
