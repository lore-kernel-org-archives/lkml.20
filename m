Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012030.outbound.protection.outlook.com [40.93.195.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B5E3E8330
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792036598; cv=fail; b=XkqU5OurnKIzvHnR5Xk7h2xEodDJ59DU9xwT6/k/qhada0d7zprt6OEIrQcWGBGWKXOGAh73V0QfkarAY+wLZDSZ9ChXarZ16EdJ+/RH5ejVTgFuMltBEY9sXaM0qWN+zec3BwwrGA3p9v2RXxXtwWhAXp7qRDJVmT3uxwRzfr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792036598; c=relaxed/simple;
	bh=kU/uwq6/i2cMi7hsUsutBjM2qslhz2kRlAieWEE/EJE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cuT9lacfJwQ0g48LGsswvM6ic1v1XArvr4iGHWAaEWMTBaklbDg3WTknk4BeaeLLv6rcpZiPepYqIsi9JF8egbrNAa/e5YvGIQJM7J21Ktt+82rETT8RXOXVVLPypin074tBTKaY8aHml3ht+zAgHWb5Qmo/paJeLIt+Sh1zOjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gRt8J/68; arc=fail smtp.client-ip=40.93.195.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gRt8J/68"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XqcQx84tQx7SFy4eIjo8FQKW4xly5j81U7Zk81kjtwN/aybD8HP3DZGVaj7krCLDd1OP5tncaFd0Rw7BqPDHgLiEE4C+O+iE/qUJm5bRAso9nI32FSiiSpVR7UGTYTmf7boxU5/wQASw2+YpeZl1VBAxqLX/nJwlsUSYmzIsF9Rxqv+EniAbOVUKggv6TJECF+tP/ACbm4t86Ch7lR5qVwGKbWNLm3eBd7kEiVbdMvrqy0ZA7Ax3+ce0/Q8ke9wGFTAMxep4yAIn8r43JLS9Fbu2mniStsta6TyPGdoC0huLFn+o3cBaAdaRewnLCTs6QOVMfnNr1bTKLUtKjxzLEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INNZPQcF3ykxfq2Uiwq52NQPqVmOUj0lpODDH8u6jVA=;
 b=ZTVR2DoBra+PCVp78mSLuhR+IZiqVpu9Cp9ATaV/9gUzSmaYNNZPXEOM2DrAIXibycal/vOHLch+5FWCVn8qKuXhFlvHErcFjdQrGgmkrS9jT73SVx4YRolmBx9/Y1yzKjxfLTVTXA13gKyyT2cIVI+HU5+KZacSe9yR0n9KPfxIGbTmck4/7kvXyCMjcZJti8FV3lvWL8EUKk7NjJjzNuIrGq2HcHSDXpGy5a85olidbBVJVDNDBe/JDi5RaQEY1Ls2jgD2QKGjLjZ+RUfit+U5PwDxLpkXy+oi5GsCTu6hcDvChIOkwz/twcyHt8ps6AW0Iu9FST+bECIGTIGJSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INNZPQcF3ykxfq2Uiwq52NQPqVmOUj0lpODDH8u6jVA=;
 b=gRt8J/68DCGSOEJkUxDhqid5xWp2jLf4EwDycZj20+qAxAWoYtq1iU+hCmS9NvZDa4TD2Xj1N5/PjNnsI7v8bfCyt9tbQ/VqBsCq70ioUxoLgkMzAqJUkKj5Ir7mfBPzGYcIEPlg4YD+vS6nyHzzaN4yGB2qrT1F9ib/jFAuTTA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH1PR12MB9575.namprd12.prod.outlook.com (2603:10b6:610:2ad::12)
 by PH8PR12MB6698.namprd12.prod.outlook.com (2603:10b6:510:1cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 03:56:33 +0000
Received: from CH1PR12MB9575.namprd12.prod.outlook.com
 ([fe80::2aab:a788:44ed:f4da]) by CH1PR12MB9575.namprd12.prod.outlook.com
 ([fe80::2aab:a788:44ed:f4da%5]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 03:56:33 +0000
Message-ID: <061fef95-1a27-42e8-86e8-23172ff2425c@amd.com>
Date: Wed, 14 Oct 2026 20:56:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] x86/sev: Register the guest with the SVSM APIC
 protocol
To: Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>
References: <cover.1791912902.git.huibo.wang@amd.com>
 <5ae01ceb58a3fdf6ed9367e236d77b4a21a3363c.1791912902.git.huibo.wang@amd.com>
 <81c6d97f-850e-4f51-919f-cb3a11f47962@app.fastmail.com>
Content-Language: en-US
From: Melody Wang <huibo.wang@amd.com>
In-Reply-To: <81c6d97f-850e-4f51-919f-cb3a11f47962@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0025.namprd10.prod.outlook.com
 (2603:10b6:a03:255::30) To CH1PR12MB9575.namprd12.prod.outlook.com
 (2603:10b6:610:2ad::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PR12MB9575:EE_|PH8PR12MB6698:EE_
X-MS-Office365-Filtering-Correlation-Id: c25f1957-6fd8-4b86-65a8-08df2a704d67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|4143699003|11063799006|261009223027099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	wLP51vPE+Zhho1goMIpFdt69IyiuZ8umhE0qpblj4ULiMaXN9QXnxOmGaDrpVTEAof2Q8cWVKZHJ/BJGR5IhnhgZJg5eJBusNh2U/PmwrpQ0KrV0VKc4fr9q8WWm7XPxGq04jNQFlXC5DRuikgcGB9w/3uQ3eRuzXG77zQzGlhzP1HvPVvXnxGmUYaR2hFJPbQEiGeF07vIWgGSYl41F9RFyjHXrNHnTmU68jLvKdhMqI890GYZ7avO4sGuvfhpiKcq/6dFS6XLWhnlchTzU+1griS3s1ZoVfLKXqT6eHSMzducF1VcxTBoc28OWLfB+IfAbnuuQRSfAY3rlMi5rf91n4J6Iyrsb3wQ3Nhqb497mifs/7Y84Ptul+5yMWjapa4hVOqVYP6QV3pZL02ZAfwFda09lz84zgtEqdUUZ1KSml0wZDMVk8oQNHJIhkq2hA19/WN4xNQFhcCqPsf5Qv63dSAPvrZN0r4y7bt7FUXYsTDEPog881Ho5b9vVRiJmE50RU1m7Xv5Ns/42VgW+z9ZvQv1KiLz8ME4Az9RQOODbnas+8dwnCkR+GLXWY2He5yaCOBMoEuGi2OuqBpILEn3MVXjZ9trgFiBIicq10yxWmjreg0KUGl20cR7n3qzgqezPkTdrmVpR/iMzk+Wzs3K7QPMXumSWhGC8Ncp5VjY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PR12MB9575.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnlEZG5WdWxUNFZCSzYyMGZkSFk3V3dTTFAyQmtVenROT3luc25nYTVBMUE0?=
 =?utf-8?B?dmFyMW42YXF5cWNXNkJpUk01R2p3YU4rd3FhOTJxUUx0VFpCVCtEbjlDNEIr?=
 =?utf-8?B?aVNiOTR6WnVqSHlYMXZ0YjFZRG11MXNaemw5SUlnOG1KK1Y3TllrMUpMcmph?=
 =?utf-8?B?RWUvcEc5eStoY0UzTVp0OTBIazBiUUp1STRaTkdPS2FIUTI2dXcyVWwwSWsr?=
 =?utf-8?B?dlFLTWQrVk1LK29sREJKSmd5Mk1EVW5qSEZqNG5VT1JHcDRhWGMzUjJiYkhU?=
 =?utf-8?B?ajhxTjIvRUpZMXRualg5SFRzeHV0RmJkVExzZ0NwSkEwSTUyd2l1NURtREEy?=
 =?utf-8?B?Zmhzc2NvZWJDRGJ1MEZzTk9GbkU4SjIvNWtVSjkzTDlVSVByUGlXazR3TG1H?=
 =?utf-8?B?ZUJjdzNPRDdLdUwyV2I1VURBZU5Vb1I0TC8rd1hibm1NYVo2T2JSakNNY3lw?=
 =?utf-8?B?a3NCRVROT3hBK1N0a1pUbFltZGFERlkxQjl6MG41S3ZuV1Z5eFRDcDVoR2c0?=
 =?utf-8?B?U3Qvb0EvaU12ZUhVRlEyWGVxRU9JOWVTQytqVmpadEl0a3l5Y0Vuck81VDVJ?=
 =?utf-8?B?Y3NGeDdPUm9ZTzh1Y3IyZmdNNSsybmRWZFI4cFBNZnc2S1BmNS94RWszY1Jy?=
 =?utf-8?B?OEJ0aG1rcUhHTTZTSDBqeUVXNmJyUkhNL042YThUcnFWREd5aDBTWDVTUk4x?=
 =?utf-8?B?RmZBSlZZZDFhUk5NSkVIR2xKeWYrdS9RQXZJQU5ONG53dlBHdG5HVlU0SVcx?=
 =?utf-8?B?bjZuYkJQYWVwTlNZVnZsN29XWDZSdUwrZWZRNzA5TkJCQ0hFbDVoTGhDT2Fs?=
 =?utf-8?B?eWJ0N1J2MDExQkZDT0poeHZGMHl5ZFZxQUVJUHJsZ1lybC9hL0VtYTRuQnlQ?=
 =?utf-8?B?MEx4U2dYaFhxTWtSbmVlbmJQMUVwV2Q0K0YrOG5QWk1XaFdmMzYvK3A1VExE?=
 =?utf-8?B?TEVrcm1rZW52c1JVRy8rVW4xWWpuS0VyQk1IMkdqOTcwSEw3azJybE5tVXhM?=
 =?utf-8?B?NjVUcVd2M3ZxWW5TOWNaOG9ycU1USk94SmxLUThOb2wzeUk5WGNEZVJYVWZG?=
 =?utf-8?B?Z3NEc2dSQ2VmVGUxNVJrM05DZGIxMlFTT3pvekFwNzVEdTlOTkFoYVdsekc1?=
 =?utf-8?B?TGcxUW1mZWoxTXJpbUt1OHpscERWK21oOGFsZDkvbEFsWExUR2w1TDE1Vm11?=
 =?utf-8?B?UnJpUWRndjBTdzVWWnltSlZvMnZDaFZlK3ZhTXlqckhvQkVjR1k0VDVsTHRr?=
 =?utf-8?B?VjFPbmtTdFg3dHV6UDdONXlvczFIRmFid3VKdzBOQ2ViR0gyY3EwL3RRcno1?=
 =?utf-8?B?RGpkWXAxRTZHcVkxUW90Tm5ScUgxRnB2SlBSdmIyelI5RnNOZXNDY2tkTjVU?=
 =?utf-8?B?bmxaN0V0SDZhbnlCRGRCMUZwZXM2dURrMUtzbFpMNDRETWJYcGQzZ2tvdXlD?=
 =?utf-8?B?NXVPRmE1enlESXdsUnZHNm5VZmNDWS9nbWhPa0Uva0h0LzE2RkFEL1VhOHIv?=
 =?utf-8?B?NnpZa01Qb05EeTdscmVkbUVTMGhVMUFyeW9xK29kZVJheXNxQXNINVptaDZl?=
 =?utf-8?B?MS9qRGd2VmxxMDdreFQ5K0FVbG1acUtEdVpTRXU3SHF6RWJKS01ka0NiVmdD?=
 =?utf-8?B?UU1iZEhNVlp2TXpuK3JGa0Y2ZmhmVUN5a3hHRldTc2h0aEdsTzZaT0tYckx6?=
 =?utf-8?B?WmRib2FrM0NtNFUzakh2SjUza091SStMZ0ZxSmFZc0UzZVVEcHNkSnpUWXR5?=
 =?utf-8?B?R3VmWEVmVkMyUVVNWklCZDdsYTdLN1pSZm1JZFpDVzlqOTgwa1BKYXV1M0w4?=
 =?utf-8?B?RXRGSlJtdm90dkpRV294bjlNdUxiTnpJREdWVUdXT1VOOS9jUzJIdnM0Uk03?=
 =?utf-8?B?dGxtQkdmN1lraFNER1BGYVpMM054ZDZ6d2hyQVJibmJhV2wyV25pbTQ2ZENa?=
 =?utf-8?B?WnlKN3JTZzRaYyt1cEI5U1JGRENmYjVTNUM1NS93MWgzNFpjQnhhcVhQcFlw?=
 =?utf-8?B?QjJ3UkxSYzVFTnJqWHlIZ0NNa3FHOHQzYkQvaXpMbW1ObmhxK0g4MTFrSm5H?=
 =?utf-8?B?aUt2STNXdnR6OTdUZ0xnWmZFQ1M2ejBoTklScXpmbDZDNUEwWnNxMUlFem5I?=
 =?utf-8?B?aEZsN0NMZDFwbTJDYUwxZmpqZmdjUUg5TnFqKzRpTmxoZzBPVUlzUDdmVVNi?=
 =?utf-8?B?bmcrLzJYcjZ2eEpnbjVaNGEzK1I4cTB0cldMVm5rQzlwc1dtS3kvK004QzBK?=
 =?utf-8?B?Ymk0ZDNiWXYvdDZQcm1KOUpBZVNPRFNMbkdKOW5GRFZONlA0K25MQ3BBbjB2?=
 =?utf-8?B?U2tYWldjWXg0ZUF1dGo4QnhlUmhtQ2hTYlNIbTZrODNSbUF1UWY3Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c25f1957-6fd8-4b86-65a8-08df2a704d67
X-MS-Exchange-CrossTenant-AuthSource: CH1PR12MB9575.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 03:56:33.5052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IKCojTEXmwfB2Xnip3qT9PQeUnLcba6ae1G14oFAm8a/IwYUyAtwxBuU/OV3rut/1GSzJHPRgTHHwDqHiXtB0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6698

Hi Ard,

On 10/14/26 2:43 AM, Ard Biesheuvel wrote:
> I'm struggling to follow the logic here: doesn't this attempt to locate
> the protocol on non-SEV/SNP systems as well?

Alternate Injection is only working for SEV-SNP guest.

> Wouldn't it be sufficient to do
> 
> if (!snp_vmpl ||
>     !(sev_get_status() & MSR_AMD64_SNP_ALTERNATE_INJ))
>         return 0;
> 
> and leave the early_is_sevsnp_guest() check alone?
> 

The thing is, snp_vmpl hasn't been initialized here yet. We read here a 
0. So I need early_is_sevsnp_guest() to initialize it to U8_MAX so that 
I know that there's an SVSM present.

Then I can enable AltInj.

-- 
Thanks,
Melody

