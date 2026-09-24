Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010054.outbound.protection.outlook.com [52.101.46.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6DD4AFE29
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790274890; cv=fail; b=slfP+BB3RkSM9upzIf9aki7tAKYoF+Qw5JFinjjq2xtoi/gT6iJc5PBQm30K+mX6wZxAxxLFKKYUAx/HAddTFZdOBuvvR7IDQqL3uYo/iIrICuA/4f6rSzvL7RCjwEAW2bui0bsRBHNZwM4qPSNTJV+ZRXBKxzZnRJ0zby5TiCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790274890; c=relaxed/simple;
	bh=IsG63By+M7/sjivrTBHWRH/Dpu/96mPIcAnHPPo6gYo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FUOi+d8iF1w3546NFa9G8ENcpVNvRSn0ru+kTscOlf3cIBGFiz06iz9EngflJ4BXEhkFKTwNdK2TznBVOaSdE3sEfLcZBQUdLlQsK//xX1UhcJAhMJ2r6fP5kdR6GaGsOBqdPaApWiKlLLuFGDwi/31XUnbakhKQPbc84LQg09E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=n8YT9z8B; arc=fail smtp.client-ip=52.101.46.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="n8YT9z8B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jb5QvARvdIvyOuoJd0Z3+fOHeSgmRrilsHP+enumcie/ogsALCfEtmlesKL1qrnLmdBsnF1cF371INR2ljgR+8lPctCSztiSAtclfZc5u313D70pHDjxd20Tsgrbp+ewHSuN9n4oEUUMjvd9iJdVEJLSbivCKWG0Hn1P16vKEgXJXF9N9waayavWHKQ/GrtJSpeSx43iPQwWJlnl+JUf5eY6TGXYBKcQODWAHnsUpfsX4LkZItqZafTlfxOgMeQBhtKwb9IWEqjKT8P5c3jjnsKLejN14my6oaQU2A7FRczU9p5ZPPCAXjF0qG9c5f4Gu5BeEb3s8XZEj9cvTat9ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UwWovZ/FLg3ewY5AXyvDQEnizH0h5ssN2FHNnl6xEHA=;
 b=gVZXvy7I92tIU1pk8/EgczbjOCrmkOO+X3WH2hpey+I7OK9rUBic93kVfU3R/qHsZy/RzX5j7fkkGtHhqKnumAaqnYpCBoU6eHpkqbmZvopB9zA7agQvxyOabMPSabUwd0kJHVHDW0A5wtbC6OavKHrD7OKHsaPjo6fj7UZL0qy54MUYpsCMa+Fv3IndfBnf8F+io1KZxRTx2M/m6/0FlF3ogJOVZi+Xam4GmX4u3SbCPl+zGza2BT2Sc2uhtqa7PW7+/oa2huhOkyAZMJTZgzv8+AoaspHtxq7Z3N3jQu6gzOI4a4vUxk3q9agr/tLx08sKzkrIdOxS/W7+520mrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwWovZ/FLg3ewY5AXyvDQEnizH0h5ssN2FHNnl6xEHA=;
 b=n8YT9z8BM/K1BskVKyrXUXQXTgivDWvJkyEnCXJF0cz5SAPI5yJCdCSK00hqUagQnizDuLqGM/dFKmkKP5fxfmOy6dKvfcKvvhgaBDcPJUSbWKRmSxFWV6GBPOX9XBDXLzObecXvrDM47CA82TedEOeq/mU6J96RI1eiinYEGVk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH1PR12MB9575.namprd12.prod.outlook.com (2603:10b6:610:2ad::12)
 by SN7PR12MB8170.namprd12.prod.outlook.com (2603:10b6:806:32c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 18:34:44 +0000
Received: from CH1PR12MB9575.namprd12.prod.outlook.com
 ([fe80::2aab:a788:44ed:f4da]) by CH1PR12MB9575.namprd12.prod.outlook.com
 ([fe80::2aab:a788:44ed:f4da%5]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 18:34:44 +0000
Message-ID: <43674b3b-15a5-494c-b1de-041070b1e816@amd.com>
Date: Thu, 24 Sep 2026 11:34:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] Alternate Injection: Secure Interrupt Delivery for
 SEV-SNP Guests - Guest Support
To: Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>
References: <cover.1789927246.git.huibo.wang@amd.com>
 <1a64a4fb-c14b-454f-a89c-43112b01d187@app.fastmail.com>
Content-Language: en-US
From: Melody Wang <huibo.wang@amd.com>
In-Reply-To: <1a64a4fb-c14b-454f-a89c-43112b01d187@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0PR07CA0038.namprd07.prod.outlook.com
 (2603:10b6:510:e::13) To CH1PR12MB9575.namprd12.prod.outlook.com
 (2603:10b6:610:2ad::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PR12MB9575:EE_|SN7PR12MB8170:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c7e6aba-f499-4f0d-3b52-08df1a6a80ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|11063799006|5023799004|3023799007|6133799003|10067099003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	f7zMqJUI4mgam+Oh1CDoWfJXBUbXd2W/Z/jC1yaJGFKkyHvqJopC5CWBv8E0crLjzhi+98Pvb1CEqZZZrZGclgRTrTJAObTGdkuPYs0hxUurF9qehnG38yUIYSJ8JgCaMnWEskKECE3rUMg3BFeHRN49ob1GZ6Sxe7ztZhXnw2SrU6VJY0Lj3k+uH+tXGeGL14UvWJIT90kOcK/4bnmXvdH7p9dD6yyYR4DPxGGd4vJ+6rfEzZmxHiK4YNqTpH5G6Bk1o9DoOeeOpapNW6QotoIXwnLx1JJE9XJp7hoW560PiD/uXayF+dpgAj/BheySOR1johET9NZ8RLVsIVQy7Xbohe26ns0pqM1j3pJmIURRMO0tRTKzSwo3UaKBYvah4rsRBc4w6Zn5ocyVUQQQiqRmrh1W47XDweAxt7dHraPojCKEra8inHIroWiZYLmRu7SEZmi2B8mcAecF8FWusjEqhOfBApWqnebIqvPICRiHlvbBJHFVG0OxeibKKGJXRq1S9lRwr2VeslhccnZCNKh2A1TGKkmVlwOwHWwqnGmZz009aemuaE/QupA0dj8gfuqimV0116NnYAaEHhZ2e10z2Ya9Mhp9O3CSo5ITMnA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PR12MB9575.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(11063799006)(5023799004)(3023799007)(6133799003)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDgyRVVMOWdzSVIyUXJxc2tnTW9jYWhSMEFudlBXUjlqS1Y3N1FkMWJPVkd4?=
 =?utf-8?B?dEw5UXNuOGNnVTFVWVpkMDR2SkRLWG1ZTlM2WjlqcDVPemVhczJnckxQQXho?=
 =?utf-8?B?NmJXOXRhclpPeTVrcFpWakt5M3BnQnFuQmFYZzcxYWJuRzB1NFVaRXA0cmpn?=
 =?utf-8?B?dWxvQklQQk1LVkZzODQ1bVZ3UUQ5Z0ZiNDREUmdpS044Sk40d1p1bVlOMHd0?=
 =?utf-8?B?Y3cwMDZhd1hZN0dVRHZNdWhKRTEzVVVmRUI1U2tqMk0vLzcxaDdXbXVDT0Iy?=
 =?utf-8?B?MHRvL1IvZDBFYUZla0hSd0NYbVBJemlYVDlGdEJLYjVYTkxiWHhMU2t6QlNr?=
 =?utf-8?B?dEdyejZKaWtJbnVMNEtMcHNrZ3oxZUZLd0VuNjc2ZU1KaGhjbWtPNUNNREFy?=
 =?utf-8?B?aUs4TE9iSmd0MVhFcmwvdVMrOTB6eVA5VzVCWUVUWE9teGxGcnByV04rUjRs?=
 =?utf-8?B?RDQrUEpFZi9UcXVBekNlU1Vaa1hqeVByOFBNZS9kZlgzK3d2Q3FCeWF6aWxR?=
 =?utf-8?B?OXl4NG9QL09LcnBhSGxzL05JSGJyaFY5UEVOVHJTZkRmM2s2Z090S0lucVBD?=
 =?utf-8?B?TWVSdHNCclBwK2VFdnY3RURlVTkwdWovYXZTWWh3SlRGSFdnb1dFK0pleDNC?=
 =?utf-8?B?MytuZzloYjZYRnZKOHlmZDIxL2ZPSlJPdzFxTXBPSVR5WTRmSjY0OEQrcWI5?=
 =?utf-8?B?TGVTSitrODBEdUpUN3Qya0Ivbm9SWERTc2NBbWxzc1MydDVGUzNYNU5sUGlB?=
 =?utf-8?B?SXJhN3VHQit2SWp6a0phNDQwbm1WZW9uYzJYUDFIWmpqMkgrSEJYQjJBbTA5?=
 =?utf-8?B?UDZwWTFkMjZ5MUdyMkFqTk5mc3VWejBTRVdoTmpYcWhYLzhOS3BWWW51TFRB?=
 =?utf-8?B?cnVIZ0I1V05qZmwxRXk4MlM5R3Y4TXpLbVFnc1lFR3NkWVc5WTNJTk5tMTQ4?=
 =?utf-8?B?R0N2c3RFb2grdzd2aFhES3VyZDdyQjR2Q05abE9ibjJQbWJNQTFMMERxa2Rj?=
 =?utf-8?B?SjBpZG9JeU90MThNcHhKYlpyQkpFa3I3T1FhcUVwL2xDQ0JoUkpabU5FNVoy?=
 =?utf-8?B?akRGamxmQ2poNW5meWtEakppVWdVTW1kTXF5bytpdW5YU0JmT25lVnVTOVJU?=
 =?utf-8?B?NlMrc0VGUm4yWFNhZWFxZ2o1Z3IzenR4UTVrbHJGTXJDa2o1d0hoYWF5NEhz?=
 =?utf-8?B?SUF3TXNiNyt5ZU9lbGdBdlROMklmL2dvaHpiZzZoODY0STBuZXhNRjVaQnBS?=
 =?utf-8?B?TVBOY3ZjaFZaTUk3eVhsN3JaQmN0ZXJkZE5Fa29iQ1NSU0xGUmEyRVlJOU9M?=
 =?utf-8?B?RTl3Qms3WXJGaVJkTkdTQUQ1SE04VzVkYlBGLzRhYTA3WnYrSjFDMGlWcS9N?=
 =?utf-8?B?cFIrWFlQODFXS2Z6UFFEWFBxOFRkeFV1RXhUUU1uM1NyZHI4RzZlTzRRakhY?=
 =?utf-8?B?YmlXeE9wMzFVdGVFVzB3SU1xL1RuSmtFVk5MVnltZnB2T3lsTklOMisyOEhm?=
 =?utf-8?B?NDJ1MTNVd1Q1WkRoc0I2NnBWbXJXTCtIKzNNeTArdnI4NXdrbzZtWjJuZmhs?=
 =?utf-8?B?QTBRUHpzWHJXMk9XRFhWUkRnYTIwMTNBSFFvdWE2MUlxOFMvcmRmWFEzUW90?=
 =?utf-8?B?cGdrTTVaODkwS3plSDFJZVZNWW5nb1FJK3M1dG81NUdteDIvNkhRWFkxOXNC?=
 =?utf-8?B?cU9sOVlaTVZaZDJ0cyt0NTQ2enlFMi9HK01WaEk4ZHB2bUo5R0RBQWxRazlI?=
 =?utf-8?B?UjB4dGhnekpqY2dMMlJRckFWc1FxZzlLU3EzZXI3S1RSTVhWOHp0Y1FIZGJq?=
 =?utf-8?B?azBTbjRmL0l5NlpGdHBtT2cxMUhsZDlSdHlsdGVWbjU1YVVBTk1yeWw2eUxh?=
 =?utf-8?B?enpCVTdQaGVaQUF2V05GMk9LWXZRZlIxYW5FT1B4cWFQSTJrZkt4cXRuV0Zx?=
 =?utf-8?B?WlZHRHZkYU1lblBNa0pIRXlLVElpWW1YTHFTU2prdk1jT2lGM3E0eFZkcDZJ?=
 =?utf-8?B?Z09WSFlhV1c2TStOZFFtUWphV2g1Nm15U1lLZytuTlQ4R2tMTmloUnRrY0NZ?=
 =?utf-8?B?WUVZOHNDdGwrVGRaMUMybmJ1VytteHVtQ1Z2ZEZyNzlMYUdhUzNBUWhsc2c5?=
 =?utf-8?B?U1FkUThrbWV2UVFHZFBPYkJtcVVrQmJpcy9oa1pGSUk1eGxaZFNHZHNKOFFN?=
 =?utf-8?B?Zi9pTXozeUVqNk5DaEF5L2RCbTJOWHFOVkwwcWVuQ1lKSXJhY1duTENtZWVz?=
 =?utf-8?B?UUI4eFJtQldxaUJnKzJoclZXL2IrNW1MbUZkeUhmbm9lMFQxS1ZOMHhQVG1G?=
 =?utf-8?B?dlpWd21JZ3cxUEJKVHpQMXVqZldudkE2eHJHSU5CWU9kVS9VMHBvUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7e6aba-f499-4f0d-3b52-08df1a6a80ec
X-MS-Exchange-CrossTenant-AuthSource: CH1PR12MB9575.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 18:34:44.3126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WZEqwxCVC6YOZGL2CuDYRI1bMZaL50BpnolZeX5LoxfEiSNx1lDZ6LBF485w2aH49NhAV2a/g7ZyaxcbVdC5uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8170

Hi Ard,

On 9/23/26 1:56 PM, Ard Biesheuvel wrote:
> This may be a bit of a 'back to the drawing board' remark, but if opting
> in to this alternate injection scheme can only be done from the EFI firmware
> before ExitBootServices(), couldn't we wrap all this logic into an OVMF
> protocol instead? That way, the EFI stub can just invoke it if it exists,
> and what happens under the hood as a result is entirely under the control of
> the firmware.

Let me try to explain and please ask if anything's not clear because 
this is a complex topic:

When a SEV-SNP guest starts, a Secure VM Service Module running at VMPL0 
(higher privilege level than the guest's) is executed first. That's a 
paravisor, see here for a possible explanation: 
https://ksayid.github.io/confidential-computing-notes/docs/core/paravisor/.

That paravisor will boot OVMF, and then OVMF will boot the guest kernel.

The SVSM must know the Alternate Injection choice of the first component 
which is the OVMF, so it will be able to enable Alternate Injection in 
the guest VMSA and record OVMF's registration.

The guest kernel should be able to make its own independent decision 
about whether to use Alternate Injection or not. If the kernel wants it, 
the kernel must register itself — this registration is performed in 
guest kernel code so that it remains under the guest kernel's control.

The guest kernel needs to register Alternate Injection before 
ExitBootServices() so the SVSM registration counter always reflects the 
correct, current state of Alternate Injection across the OVMF-to-kernel 
hand-off.

But if we leave the OVMF to decide for the guest kernel, that is 
violating the confidential computing principles of the guest being in 
control.

I hope this makes more sense.

Thanks,
Melody.
