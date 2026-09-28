Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013049.outbound.protection.outlook.com [40.93.201.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BEE4F55B2
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790624050; cv=fail; b=CB0gn7W/rfRnjTJnABqi5zHgbh4W0nquDItIYeVWAUH17pCYkjvlfufWJ6dU4P/a7lu7P+ZsVvJ+zIQfE3q4LlLrdKqd114xJiBmvg/giJFwN3jli/8hnznmBcAt1q0dOI/3IGc6ZyMflcbwmN5PVAxTLUxNugzTe2uwxaXTMYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790624050; c=relaxed/simple;
	bh=hhfyeHmIsuCdyBl8RA02xGRr5a/NPg3mDwnNebGI+QA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ymqn/MWGug3Kr1sP5ia6t205ICc836eMljNAKLvudOm9EXuKgMk0cM93Sb53zIkeXsUivpCyUmQ2b64aHe41zdurOQKee7nmzzdSS8HUzC+Xf+3bNPjPrkdkS/yX6Xb5NSMkWwiqrJ6McqaMobTLV8TshNcZi1ldCbg3+U+S5R0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fj5vCmEr; arc=fail smtp.client-ip=40.93.201.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fj5vCmEr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+5yIX/y4YB1T/Aa4/rKMwL8HlSKsRV2F2lzZM6Hx3G91TQ7A2ZqL0P5UWnNoYA/zBmKvy9wBQqdC8b4FV8IE6wcUoxFH6+Yaz0UK0jjkDYm5FM9OQTYvxEbO0zip8ST7gNYajFwWfz4dZcCbYRK6kxONkM7w5QL1pgcU1rJhsgZn8fa4rLlzQx8MeCtSwqP16y3t6z6ikQOzdsro6wYDoWduT7o7SakprplqsfIyomOHB13RwzrFgIhAu+aP6UFV7Y0DYsCXY+as75UBpY9u3vwDSelQdS/rH1gzDFgkggCBJLjD2++B3wamhfdyYj+W+mZr0COj1sk+gT4zpeXKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CC1FPpeu5TX/gFAjOkyoR2QGFKPhvzCDUjXebjqya6E=;
 b=dfZdSktiJREtDr9FYipV+KuUQL9l3g7Mcto8NsZL8dvwil+kJlL45l8Oou6b3vOobHPlKfMLEX8Tt0dgp4q825+k4UwV4lnpusg+qrAk6OCR3zJX9pVt7YnxH4OS2P8oPI1o+FPKKnGSuFLn+GwU9tj4AFSd/9SznyzWBrqhWyxlu8cW3T9oezchx4VFLBDglvToWO9ICTbT9o8sYeXz0xwO93X0yQ4Tzf8F2xUG9axHD8C2pPHDBNxedELkqiyT6fqJxz4sTUhgjAZxTm7tKbgkYrgJzMryN3FEYJgz7NShBQ4aLSh+dkEcKJD42YO3jVJydKd4OqqafcJk6NffYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CC1FPpeu5TX/gFAjOkyoR2QGFKPhvzCDUjXebjqya6E=;
 b=fj5vCmErNv9Sk+cGPA9aru2G3gY1Z2fHeP8azFeLiJ0cvy45qkr9isLzhAlYAz5VDN6XtZnM/Kmtu7XhA3F6vb4nDQgzEK4N8uaEmhltWUg7N5Dhxt7jnaooPO//0PQyvfW0TRzUx/CiJ6wEempq30nsM2NvLfK1flxLwYIU1so=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH1PR12MB9575.namprd12.prod.outlook.com (2603:10b6:610:2ad::12)
 by MW4PR12MB5603.namprd12.prod.outlook.com (2603:10b6:303:16a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 19:34:05 +0000
Received: from CH1PR12MB9575.namprd12.prod.outlook.com
 ([fe80::2aab:a788:44ed:f4da]) by CH1PR12MB9575.namprd12.prod.outlook.com
 ([fe80::2aab:a788:44ed:f4da%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 19:34:04 +0000
Message-ID: <922b5501-2e3e-4286-8709-3c6f0c2ce9b1@amd.com>
Date: Mon, 28 Sep 2026 12:34:02 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] Alternate Injection: Secure Interrupt Delivery for
 SEV-SNP Guests - Guest Support
To: Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Jon Lange <jlange@microsoft.com>
References: <cover.1789927246.git.huibo.wang@amd.com>
 <1a64a4fb-c14b-454f-a89c-43112b01d187@app.fastmail.com>
 <43674b3b-15a5-494c-b1de-041070b1e816@amd.com>
 <517e154d-dbdf-47f9-849f-2ee369dc832e@app.fastmail.com>
 <d6c409da-44b8-4c17-bba8-dc5aeee219c5@amd.com>
 <335670cd-db18-4442-a3a9-5c99daa7d262@app.fastmail.com>
Content-Language: en-US
From: Melody Wang <huibo.wang@amd.com>
In-Reply-To: <335670cd-db18-4442-a3a9-5c99daa7d262@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::28) To CH1PR12MB9575.namprd12.prod.outlook.com
 (2603:10b6:610:2ad::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PR12MB9575:EE_|MW4PR12MB5603:EE_
X-MS-Office365-Filtering-Correlation-Id: e96f6db7-fe52-4942-0bc2-08df1d9774b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|4143699003|18002099003|22082099003|56012099006|10067099003|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info:
	EbbTaYxopgXnEn9Vj7kOoFBdWV9vwksylLxh90ekq6Y+CgQiTVftqlccNHK3XDbtvmCnv8phAGKG9YihAm5Qa2zdpJ1djlSow78noCBiWh6NNsl+nhD094el94DIQcI7mcDzzSYTZyo7KjxzniFG9kbMhVq6rTFVEuhbHN0h2l3g1rY9sj3gsPCqqJP6tyKwRKkS4bop7ssA1CQpddA5XlLBn6yDQRW/yvuzayyv8K0Kv23iQmNbXsVD0t8z04ENTOkupZ7e/jNu2cQ9cYUodUmajl0xz0lZfYE+SMx1ILy63s31InMUHa7lj7u6b+qRVEj5AG+zK/vtKnstYZWLZ+BSk57kXHd1LMNvPa0zXTrx6nFzQMIzULj6LgzOIJFMdC53ykCqL1v8tyVh+xMbjeZ/ELa/trsxWfYOMtObN1ocW+1d3DTTjedDcrQTDPllReQpvGquYMDGmb2VBni4+RSmm74DWGp2FFvbgUE8yidDHLCBcGuYQ6LQQPp8m8cpn1gKRsEP1VpEA/8UFP23eMXJkS1OErnEZ+lpR/D3/nx6j+vzcq2XSlvGzZk5aM/HglxJHiato1GlpNk+mEcLQubJgcyobU8n0XX442Ye4Nrx2yDEbMFgazQ8/iIVdwXGtrwpwsm+j8D8aK23kNvQXgiIg5w8CBVZ5QqucGC8DV8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PR12MB9575.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(4143699003)(18002099003)(22082099003)(56012099006)(10067099003)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTZ3K3FvaU44NU1JVnJETkZWNTB6eWhUck9lQjJsNFQxUHNGZ3hTb0NnZ3FJ?=
 =?utf-8?B?MTFmYmhNQ0Q3THJyeEcyT1UxV09hMytIVG9aUisvZzJmR01UN3FobkJ6S3Na?=
 =?utf-8?B?NzJaYlRENmplOExLdzk4YVg0Sk13ZlJuNUgwdjZuLzVvb051RmNLWGRsZFA1?=
 =?utf-8?B?dFBDbW1vbGs1OEtrRW9lQjhDTktzdmFSZ09qbG9scXI4WURMcHRvam0ya3Fj?=
 =?utf-8?B?M1VXREVtWUVBRmEzejFmanh4QzR0K2ROT09EMDYwRy84UitRdElBeENXWFcz?=
 =?utf-8?B?S2ZWQUJCSlY5YWdNSkVDNmw0QitYb1RGbno3WFJUQ2ZST1VZanA4ZTQ5R2NC?=
 =?utf-8?B?QVJ4QUx0c08vbU16UmY1V2h5MVR0U3IyLzdXYmRJRlZTQVZQdVdFTnlRTkt0?=
 =?utf-8?B?dXg0ZWp4T2pLblJ1QmkrUzdlUm5HSnlpQVRoVGFTck9tcjM2MzZWVFBSWitL?=
 =?utf-8?B?TWJMK01EUHJZeWd5SXJVZnVSZjZNVXUzQlpNUitkSlU4QWtKWFVJZjVta1Z4?=
 =?utf-8?B?ekVUWXl4K3c3ZjEwNUsrQVdqOE00N0JDN1RINGgwbXZpK3Z0SllkTnlIVHBD?=
 =?utf-8?B?dnNJRGNhMUczMkRVNDFGS1VyZmtKeUxwdkJ5NXZ1K1ZWdjRKYkg4aE9oallJ?=
 =?utf-8?B?V2VDdW9YWm51QUJzVklZQjVMNExFbFdYb3k4YlFnQmhxWW45UzNVSEhvQyth?=
 =?utf-8?B?Vnl0L1ZGN1B1RS9EdFdTZ2dxdnR6NVVMVU1INHdGVHlYenJWQVVNL0hTWDlP?=
 =?utf-8?B?c2J4TytLeVNCYVdQUGxjOWRoc0xZWUc4VXk0K0RMNjVSQ01hUlUzb1d0YnZV?=
 =?utf-8?B?OVV6d0JOV2JjbndJRTNtMlQzdHgzdjN6Yk5BZktsVXFkMnh0ZENRU2ZQcDBl?=
 =?utf-8?B?a0ZXZ2tPTFpoQ3hhNU90ZnFmWno0ZTBqRXRIenBMa3RMc2dtZGJHT1UrL1Jy?=
 =?utf-8?B?eFFLczQ1dVNoU1Z0TmxGbXI4bTlpMVFvWjlXWkRmY1orT3VqQWhEVlpHSFQ2?=
 =?utf-8?B?azJGbjBTSUxLTFFFcGY0ZnIzVUxXNzk2cGpQa3dzY2dPNHBJbFBnTlA2cGNv?=
 =?utf-8?B?cDQ2cERMamg1VUFkU0pyVG9yUDA3MURpVEptaDk4YktFcWVHclVrdjFHUExs?=
 =?utf-8?B?bnpwd3I2M1ltb1Z3dUV0YUNwQXBDdkROa2VUWnFQa3c2MnI1dG43ZjVKTnVj?=
 =?utf-8?B?T1JkYmRoY2FadGg0Zm5wTElLdmJmNENSclMyOHhQaGt6a2hxbG5iVkxQTTRy?=
 =?utf-8?B?YTlBYTB2c0hBWlJSQkV2N3NGbzZmTHN3UGJCUGlrTWZvT3JBdGZOS3FFWmFu?=
 =?utf-8?B?eGtNTnNjMDJWZkdzS0thUGJjSlpGVnlvNmlrNmI1UWUxUHRtTTVwM0I5dGNE?=
 =?utf-8?B?alZMUDc3WHAwUThzVTNNVzFRcXM0cjI0MmdWTitoMW0wTi9xV0toZURIZ01U?=
 =?utf-8?B?QUgvYitSVzVITUQ5K09ZVSsvYjkrVGxkNHBPbUg0ZG5WN0Zjdmw4Vk5aekNS?=
 =?utf-8?B?ZXE0Q2tPQm9sQ2t0K3VlcHNrcFVwVE92RVVPZVFXcmVYbU94c0g3YitBeENF?=
 =?utf-8?B?MDFQZ0xsODJjeWY2aTFCT21rTm02VEw1YjNjQlA1NnFPM3pUMzhiQjViYVFl?=
 =?utf-8?B?Q2hiNWxPMEtyM3hSMmJKRUVRN2JQSlNvdURSVlp2ZU15NEFwZWlTMndTS29Q?=
 =?utf-8?B?NDlTeW5tS2x6UDN4czdQODB5RXA2U1RCMkxqcjJUQXM0aTdaTG5peFNURFBx?=
 =?utf-8?B?SEVDVUU2UlJkaExBUlFiSXNHMmlyaDQxL2hpU3h3eEQ3RFdhNGlwb2p1M1ZE?=
 =?utf-8?B?d3hTcWtzVGlkeGxRR0N2ZE9jSGE2bU93N1JNNExKMThBY2ptc3hPNEJSWHJF?=
 =?utf-8?B?VFdodmhHUC9jOHU5Z01DbFRudmJVK2lIU1NSQVpTamg2UDVCbXU2TkRRSXg0?=
 =?utf-8?B?Z3BSQXZKUUc2b3RWb2loRzdqak1VUm5VOHk0cG5VdlVTU0dzNjFnNFpwbkQr?=
 =?utf-8?B?eVJ1cHhFcjhOWncyeW1pd1BHQ2FJOVlxYWhuOUVtR0JnUmlXcFBYYWJWOUJP?=
 =?utf-8?B?L1dUSklMbnNMVEozNFF2d3g1YkxrSVp6TTJoYTBRNjRLQXR2ZThzdWw3RlVG?=
 =?utf-8?B?SUprUVJTV3ZRR0FBaEg4SDRTMUthVThoYnhCRGszeHZOdWtXRUdsaURIV2ZE?=
 =?utf-8?B?WjZmcUJza0xjQ2RWNlE1R2hYYUF0MUhxY3d0bG9aeXRlSWltU1pvcFFEUWRk?=
 =?utf-8?B?WThQdzMwbVFyZ1R4NkVNYkUxOWRmQXBwYVc1STNhcjM3ZUdrNm5aWWx1M3pI?=
 =?utf-8?B?UVJpb0xVaVFKRkZzU3NOeG1CR2p5RmY1eWdWMkFHcmxkbm1kTEJSUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e96f6db7-fe52-4942-0bc2-08df1d9774b0
X-MS-Exchange-CrossTenant-AuthSource: CH1PR12MB9575.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 19:34:04.6336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lDIZabwC/JWBvZ44zJ3o3ljYTspu+dWx86FVLTjKe8nJAxPHgOYi0u4NYUCDXVfOI/0UnWIHJbnBA1QCgBuE2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5603

Hi Ard,

On 9/28/26 12:14 AM, Ard Biesheuvel wrote:
>> + * When the guest is running at VMPL2 with Alternate Injection enabled,
>> + * register Alternate Injection before ExitBootServices().
>> + */
>> +static int svsm_register_alt_inj(void)
>> +{
>> +       efi_guid_t alt_inj_proto = OVMF_SEV_ALT_INJ_REGISTER_PROTOCOL_GUID;
>> +       sev_alt_inj_register_protocol_t *proto;
>> +       efi_status_t status;
>> +
>> +       if (early_is_sevsnp_guest() && snp_vmpl) {
>> +               if (!(sev_get_status() & MSR_AMD64_SNP_ALTERNATE_INJ))
>> +                       return 0;
>> +       }
>> +
> 
> No need to test this - the protocol should deal with this.

I think we need to test this because the guest kernel should not try to 
register Alternate Injection if it is not a sev-snp guest, and running 
at VMPL0, and Alternate Injection is not supported.

Only if the three are satisfied, then it should try to register 
Alternate Injection.

This way, when the registration failed for whatever reason, such as the 
protocol is not supported by OVMF, etc, the guest should terminate. This 
way, the registration decision is still controlled by the guest.

All in all, it is the guest's decision whether to enable Alternate 
Injection or not and that check is done here. OVMF should not be 
responsible for checking that for the guest - it should simply do what 
it has been requested to do.

I hope this makes sense.

>> +       status = efi_bs_call(locate_protocol, &alt_inj_proto, NULL,
>> (void **)&proto);
>> +       if (status != EFI_SUCCESS) {
>> +               efi_err("Alternate Injection registration protocol not
>> exist\n");
>> +               return 1;
>> +       }
>> +
> 
> Just ignore the error

I think I need to check this error, as mentioned above, so the guest 
will terminate, that means the OVMF must support the protocol, when 
Alternate Injection is supported, and the guest kernel is trying to 
register it.

>
>> +       status = efi_call_proto(proto, sev_register_alt_inj);
>> +       if (status != EFI_SUCCESS) {
>> +               efi_err("Alternate Injection registration protocol
>> failed\n");
>> +               return 2;
>> +       }
>> +
> 
> Distinguish here between EFI_UNSUPPORTED (which can be ignored) and
> other errors.
> 
> Only question is whether EFI stub and OVMF are guaranteed to be in sync
> wrt snp_vmpl versus AmdSvsmIsSvsmPresent(), but I guess things would
> not work at all if that is not the case?
> 

yes if a SVSM is present, that means the SVSM is running at VMPL0, OVMF 
and the guest kernel will run at the lower priority level.

-- 
Thanks,
Melody

