Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012023.outbound.protection.outlook.com [52.101.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384D14BF926
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789584344; cv=fail; b=idvfX0YxcK/2ifJefxEPgkzzmNrIy3lh+l6uK2RvLEQzafMn5KlXp8DIhs+zMO28u8cEmGdvrefKse3XhT6jk+UIy0UsoftguEEpoJkiyV/wAd/o3CSDJwZmeTKnVk/SIGKoip3JPBF1JyOdDr0gLrgWWOfKEGC7AnS7SAPkJtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789584344; c=relaxed/simple;
	bh=ZzeybMpsMYVcOUwvjekZkels9m7F8X1lpRwNYPRPbxI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NYy9xDhyd+55yLk0ixbyro2Q3WHiEUQLWWnLJ8cxP1pKsHdChrRgafJuUfGOgJ1wWuOYHm2BOA/EttQn8Qd6UZRM2+L14e0muyPr5s+v3oWv3KD2ByAKSx/nRZhsHuqKlc3Yu14cmo1rZd6wnsiXDNZ4qdiFL9d0JPgLd0jw1E4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TnwjkWbJ; arc=fail smtp.client-ip=52.101.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TnwjkWbJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HfQtxG3hcTSvOhCdkA7cY6+0AMn9AFGpqrUbyIl/qHvWTkr8ReqYjvczUMXA6Z7pbaYuZVk2tB/xkKWO1AXFXCenfkCmEohpM4Ylzoay0fRb/I+i4O1LkSfTLhUkBR6tBGWcPDQucYImpCBskiu1TpdaT8rEq6mympRlev+bNRmuU3Nq9L54YyzrjHr6skkOfm8Q1UNO6ZDOtjwI2nyU9o0tU0fHZCWXtnlVo5pTAGT9MS2NBEL0dAQbSRAA6E89aqJOfI1GEoN9gWwdc62BVfai4JLooq4G4hqgDczrdGtPeqYeR5peABfafwrs52JNFFS0fZ3Zzz4kq2Pxw2gaWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5ZRgBSoGZc5uueSrRkk9p3uzQaR8tIaQoEvVJqwxnk=;
 b=ZrNjnsh1/ByoX+4vHL9Dxcx4EJHepblhv8pEEXK4OZ6dXt+iG9pTiY3OEDON9EHW2FkxukgbIk8HbC1SvlEWyh8lBa0SgNydrX1KccLndDVpDILChBUE7nEardzEemVe02zgUPka6biyl3f7wPk+sz6J++SpA3imGe8OKPTPO04vKVctSdiwLdGiFd+DdLaR+QoAKRY2jxOIPJYDDZjG5enBqrhUOkq9CsALzSyK2aBazoIidXYGK44F3yJbXCpSG8IdISfPPk4UEY7afiXpYr8mTIVs8CdX1IhwukNOInnX/atH5Oialh65b/xJeIkDyVtW+ChUbDA6env0yaO8SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5ZRgBSoGZc5uueSrRkk9p3uzQaR8tIaQoEvVJqwxnk=;
 b=TnwjkWbJ+ULZqqtQx27LkCEXijZQ9YrRDPXa8ur//f4JbUgFFzdg8CBnfAhFnN2/hf1pJUBjyjAXxlw2Q1x6WAymcCgdASxxLMf0kmDepk7PtJ14/xKZuJlqSxk+dapPcjgjyEgdpR0AHLflJd6ZgbPsjvyQASoagzrMKLiX4/4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH1PR12MB9575.namprd12.prod.outlook.com (2603:10b6:610:2ad::12)
 by SA1PR12MB8641.namprd12.prod.outlook.com (2603:10b6:806:388::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Wed, 16 Sep
 2026 18:45:29 +0000
Received: from CH1PR12MB9575.namprd12.prod.outlook.com
 ([fe80::2aab:a788:44ed:f4da]) by CH1PR12MB9575.namprd12.prod.outlook.com
 ([fe80::2aab:a788:44ed:f4da%5]) with mapi id 15.21.0428.008; Wed, 16 Sep 2026
 18:45:29 +0000
Message-ID: <b0927c73-9171-40e2-9d1a-3dcb2da1c839@amd.com>
Date: Wed, 16 Sep 2026 11:45:27 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] x86/sev: Register the guest with the SVSM APIC
 protocol
To: Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>
References: <cover.1789345277.git.huibo.wang@amd.com>
 <d0b15a9b5f6e2199ff48bb77e9396044fa96dfb2.1789345277.git.huibo.wang@amd.com>
 <8e4b05a5-61e7-4015-ab72-1e55156e1772@app.fastmail.com>
 <3f4e75ed-9a4b-448c-adb4-5e2e8bae8b11@amd.com>
 <e624a245-e699-40d5-9948-aa77da5c44e1@app.fastmail.com>
Content-Language: en-US
From: Melody Wang <huibo.wang@amd.com>
In-Reply-To: <e624a245-e699-40d5-9948-aa77da5c44e1@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::11) To CH1PR12MB9575.namprd12.prod.outlook.com
 (2603:10b6:610:2ad::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PR12MB9575:EE_|SA1PR12MB8641:EE_
X-MS-Office365-Filtering-Correlation-Id: b7cd97e4-c189-4735-a595-08df1422adf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|4143699003|11063799006|10067099003|56012099006|22082099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	6YEmj/ntiUgHIAcyTro5hzma2csZ5y6EcTLEgA9iZ+td7s0dpsFK0nBKxQlUpsY0ETvyfbFMcy+N5QMQDWI6mYBdrkHh7uWNgf+FnPgbfpSr7nQ76txXQtvAHFS5SKsy2QFMIbvg6FiTWTxNgc1fWxp9Ccsas9mnXampRAe1dTCBsW7Sa5SYZyChlOaRP62xco5Desa2gd4coxXojXkyqv2APpOEuIr1i2MZzF/qCLsL3XfEj9qxWNDycn/MGwB2NdMvoekbzqOFBRWGOstQogsSMzPVG7zz+2iVhOzLm7ifotk93bpMWz4l0sVmbq2sHKHN3Nxk+rQBtF5nsutPczs6QKDSvYf+kKKmEqcUK3cfxGGsIi+yHLxkf9wgN3wmBmj/4KKJk1Gmj31P3EtL90xCjDT3FVwhh98ApIeBdnlyXo0RLiwAodaE4ftBywhi2i8EhgWbb1dyxiEqf1bEEafpUIK4sAeh0/WJbjDYZwD+3Y34Ufld/pJa+F8l5th82g3GCrVbaD85DrjQ19KyFFdHv4avh4NAFmlIvFRSFhqCqLescLKYFrrDSau9eJ/F9v4orOMxRQbCLr1CjKJT3vWw7fLabrXtWgXZdKDegWVM5lWJf24fTHYG9hIzXle2INZNXknQJoa8tJqe2T9Z6GPJawMPDprmUwwWLwx1INs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PR12MB9575.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y29VRDZGTWw3MnZmWm1XMGxTdlA2Qm16aDZYZGNHci82SXFKQlRpbTZJeStx?=
 =?utf-8?B?Uzd1R216Q1oyclZuK2R2cStXalAydUlSbzZLY2l6andQTmZTTURnM1NwZy90?=
 =?utf-8?B?QzlTZk5ZZ1RMU01xbHdTaXpQR1p6OFkrbkZvYTFSTFA3VWJsanJaUlZUOStC?=
 =?utf-8?B?QkljdisvV21La0xkQm1kZ1c4UnQwMXBkNTRVOFg4R0cyajd2V2dsUkZ2VnVw?=
 =?utf-8?B?U3krUTJUa1UzL2wxL2E5dXQvMHRpeHhMdjRybFMxaDR1aDJJRXdKYk1iTUJy?=
 =?utf-8?B?VEh1MFZROWkzZXRDLzFHVUtDL2JRU1NCZUpRK0cxRGZCbE5ZZG5uaVNZSXRk?=
 =?utf-8?B?cE11Ti9JZUFIS0ZEaFR1M3lYQ29ZbmdWNTMzSjZ1M2tiYUV2Rk8xQndkaDMv?=
 =?utf-8?B?dWJtZDNjRkRvK3UxazVhNnJUajZlTmZkbGZSbllPS0QrSUNIOHZRSXhtTUNx?=
 =?utf-8?B?b0o5UWxobUFXOU5OWEJlSWxUV29BUy9henNoUWJqdmY5eTJpVkhXQStIaitp?=
 =?utf-8?B?TE5nTWFseDg3Tmsvc0pwdC9GWUY3cDB1OU1sT2x1TFJsRk5YVVowRXBDZVRZ?=
 =?utf-8?B?TDlZMGFCNTZpOGZvVHBlT2htR1ltdmkwZkxyRE0yTHAzcGtvTWo5d0NqVVE1?=
 =?utf-8?B?em9HRExPWWQ3WlpZbHZXMFVNYlM5VDUwTXVDUzJpWEROT1Q2N01ydnBsVnhH?=
 =?utf-8?B?NWl4WS9zKy9OdHY5TzJXQUdadlRvNzdhWnN1czlSbWtkc01QUWhCNS95UFRp?=
 =?utf-8?B?TU5CcVZmZEVBS21ETnduU1N6cE5VaTdRT1dxcE1EcnNuR0xOcTZLWVlOSzhz?=
 =?utf-8?B?YTk5WU9vV2VYTXk0V3cvK05YODBWaStUcm1ZaVFNeUZhZkViQjFLYldBY0tW?=
 =?utf-8?B?VWF2OGg2UWNHZllseUI2Q2hYL2dYK3FnTGM5eGd0VnJyUzl5Qjg0VkRwZUE4?=
 =?utf-8?B?Rk1KTStYaVFZVVBzSGJsWEVKSE9PTmhCRVdEQUNHZ2tDdHNyeHEvSzBZbzYr?=
 =?utf-8?B?bFduUjJMN3dya2p2SWVkVVlrWkY4YVB2WFdma013Wkx5NjBnN0lRalBvQmJQ?=
 =?utf-8?B?K3ZHMmV5d0FyNzExYTVRZWR2Sm5Ia0Q5c1BzcXNvbFV4RzQ3ZHVHb2xmdGU2?=
 =?utf-8?B?dko3bzlCQVlHYmczU3JQemxmVEhHT2lpd2RlMTF3K3BFNlgvWHZ5ZHd4Z05y?=
 =?utf-8?B?KzNHK1FxeDNEeWZZbXg1OXMzY2M4L1ZKMGJYa29LYStDY3ByUFQrbC83SS8r?=
 =?utf-8?B?WmJ4YUR6QlE3WXpRL2MvRlZKYWVHZ3ZuVElqb3VvNjBqRG10dW51bEgwT0gx?=
 =?utf-8?B?RE9IS3IweDhNYmVNQTRQVGU0OFZ4dXduOHIxOUphRFdXYWNsMzhPaXpOUFA0?=
 =?utf-8?B?SU9lZzBtbzUzR3JFQ0ZMY2ZqbFFOeUdHREMwQ1BDQlZQakFRWGZZTEc3d3p2?=
 =?utf-8?B?SFBsWU95VmIrZEVYVFBTa2xzK0V3cXphdnpVZGJodlVaTktjdmVweG1hbHRj?=
 =?utf-8?B?YXhhMzcvY05lUGtWM3JGU3BkVFA2OTNibW01WDArblJFZEYyeDV5Yy85Nkt3?=
 =?utf-8?B?amc3OHZ1dmRobVhxcnYydFROL2syNFRRWm0wSTBTQkgvUGtFMUN5WFduaHhD?=
 =?utf-8?B?azE0Z29zM0Yzb3BxQjFWT2hsVmZWL0ZDdmZyU0hvREQ1R054NFZKUkhxVHdZ?=
 =?utf-8?B?a0YzQ0FqK01CUldkako4NHU1ZE4zTGFRUEVYOER6b2RSRVhyVENTWGNrUWc0?=
 =?utf-8?B?SGdYeEFqUWhxdnI4djJZU1RzbGV4MmpuOXFVYUxwQzZuVkF5amdUQlVpa21v?=
 =?utf-8?B?TnRScDJtcWs1RDdaa3lRdVlLODJSeVJ2eVBFMHQwc244UXBheWx1bVlpZDFS?=
 =?utf-8?B?WlJ1YkszM3NCTjRkNVhoa25xcTZtWHVqcXlWenRidS9xQWpHS0xVSHVhdkFP?=
 =?utf-8?B?U1VXaVUyRlZlbFZkTGdLbngvOUhtNjU5Mml6Z2U4Wm96cXcyYzdoR0J1Zitw?=
 =?utf-8?B?VUZvVDZOdGx0S0N0WEgvTE8wMFBuaDFKOVVOZWVZblI5UmlFYUFld2lYVWdD?=
 =?utf-8?B?d3NuaXp6K0FRV3hEQWp2YkRmeU51Mm85dGZZemdYQ09ycTJKaklvbGFpY0w4?=
 =?utf-8?B?ZGxtcDBhNmpqQVpRb2poTE9pOUJKeWNDbUpYNmF1ZGJVOG5aV2pjc0VaYlli?=
 =?utf-8?B?NDBENHI4bUwyMzdRT0djRGVFaWtOOC9lNTA0UjZpNGhtYk9iVlBYNzF3R3BR?=
 =?utf-8?B?NVBpZVVHRTNxeDZJckIwTEhWbUgySWZtQWRYRjdpMnhjME5USnh2YWFJQTk1?=
 =?utf-8?B?MlZTU1JxVzNrb2VMYjlOYmpuVkhlZ1RKeTYyZnpZdFJLS3ZXcjhDdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7cd97e4-c189-4735-a595-08df1422adf8
X-MS-Exchange-CrossTenant-AuthSource: CH1PR12MB9575.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 18:45:29.1731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7FhdZditUBqsTuIupwUAFLm3iYMFwmbvvhDKrdy3Uz1jBiUvkV4Uao/8aCnTKVT857poULFF/mA6JsNwXnoZ+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8641

Hi Ard,

On 9/15/26 12:44 AM, Ard Biesheuvel wrote:
> So please add it to the EFI stub, and code it against the boot services
> (efi_err() for error messages, efi_exit() when aborting and returning to
> the firmware, etc). Implementing this in a hybrid manner seems entirely
> unnecessary.

I moved sev_prepare() into the EFI stub, and I wrote a wrapper for 
registering Alternate Injection in the EFI stub but kept the code in 
compressed, otherwise I have to export early_is_sevsnp_guest(), 
boot_svsm_caa_pa, and svsm_call_msr_protocol() so that it builds.

How about this below:

This is in the stub:

static bool sev_prepare(void)
{
         u64 unsupported;

         unsupported = snp_get_unsupported_features(sev_get_status());
         if (unsupported) {
                 efi_err("Unsupported SEV-SNP features detected: 0x%llx\n",
                         unsupported);
                 return true;
         }

         register_alternate_injection();

         return false;
}

and the stub calls this function:

+void register_alternate_injection(void)
+{
+       if (early_is_sevsnp_guest() && snp_vmpl) {
+               struct svsm_call call = {};
+               int ret;
+
+               if (!(sev_get_status() & MSR_AMD64_SNP_ALTERNATE_INJ))
+                       return;
+
+               call.caa = (struct svsm_ca *)boot_svsm_caa_pa;
+               call.rax = SVSM_APIC_CALL(SVSM_APIC_CONFIG_EMULATION);
+               call.rcx = SVSM_AI_REGISTER;
+
+               ret = svsm_call_msr_protocol(&call);
+               if (ret)
+                       sev_es_terminate(SEV_TERM_SET_LINUX, 
GHCB_TERM_ALT_INJ_FAIL);
+       }
+}

which is kept in sev.c to avoid cross-dependencies.

I can send it as patches too if it is easier to review this way.

-- 
Thanks,
Melody

