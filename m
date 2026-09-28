Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010031.outbound.protection.outlook.com [52.101.85.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613551A6823
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790564145; cv=fail; b=ELNZPQLqcAtoIyPajOTIMh3pWwnRGf3z21ZBiEamkfpG+jNeVGLcuSywEhlT6uSA6LfoRPuCkMfgz4N4whFfSUB8zUBqOfUij+UJHFk0QLdzkZoMuI/INrnioMR7dsPEHYpzUwdGjPPb8JXS13RnACpMKOCAf5zbpY39czynP6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790564145; c=relaxed/simple;
	bh=pLdLC6EjopzrMaSZHdIPH8913ZkhvGbYCnwkbGo2vGc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fs2zSrayZjj5OGjodLGNZRbjgQuJYupXTQc78BkpPvEtvReOk0F9VTrSzwlgxWxR9NZd3rrYJMm/ZuBNOddcLfJ+izaOr5t2dyl1Lw4cw1S7svAGh1ZySzLDn0Ng5EP76FhooDCxE7/w1jcvp0013+9T+1WHpiGlINBxcwLfdmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SkVXo0kS; arc=fail smtp.client-ip=52.101.85.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SkVXo0kS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mrBw+sTFLCFjvtvOtB3eqiSe1qSdOEfB6jPp1PtnxaAWCs/PA2cKd7inBnl+k2kUxPNRAkQCMyiEYZgibp2QhCbpUmR4v4gW1IjvXw0HmfhBWCDrot15YISITxHs2DMVAv+37M0dNFaa2vBpvV2i7S/v9Xb7juVnxaCdZN9Rc09IHsNXq2/3Wzmu8i2CcAGgWQ9s4Y2tTEozyRflHsZO/sDCGc4nB4CdRccz0h63Dl0BqZH5LeIMvYqTmYf+Z8+PBkV26xVijROIUatkwWwUX4ey0DQih9rHzduY5CBGxFXrTIE4mFGaCteKjpm+gQ7F4owSksx7mTuKvwAMAcJIPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UyOYiwS4E0cUCDoX/OtOau/hTtclbaPEmtcej538wR4=;
 b=C7GgLCUMzelO4YX2nLWlY0Riwa8T+0bp5+EPVzbw8tkKDb40iLEkD05kYj+m/4iOATlmN2Z3uorWo7F/scMYdGnj6be65KsEl+j6FM4AXbbSWLxbenrCy8DBAtW/noy3CWGigR6qGS+7oMfr0dWgbam2SnXm9OQh27vQkM6BKzi0+e9P+OND69BHy18QcbWi7Nxy8+fKYX+rYtrb1Jv0SAAMZazZNqhgLMnu+Rb3MrrMm+iQZEB4cr+ho5bHbN029mvMnoSHtvK4oFFJ/Lir7EPx9xBEjwNalm16Sv9ArKlFLmvVI/P+fCE3KW6cDR7N8QhH4ZNbBlKrHVFBpy2IfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyOYiwS4E0cUCDoX/OtOau/hTtclbaPEmtcej538wR4=;
 b=SkVXo0kSLWkD11fxElUqZT3K/RcW/ZGOYUtxd3kczYtX91BvA6Bj/pJjSkmD/Q0ksHFEiFCySUoet4P72fkRpzvljB2QIBU5/9I7mxNoGzq6sKfvo/pS2y1VwhwKsM73xCmRuGrRJ/EWYttPooM48acFzpU1hxkBodPT2F5+XM4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH1PR12MB9575.namprd12.prod.outlook.com (2603:10b6:610:2ad::12)
 by SJ0PR12MB8616.namprd12.prod.outlook.com (2603:10b6:a03:485::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 02:55:41 +0000
Received: from CH1PR12MB9575.namprd12.prod.outlook.com
 ([fe80::2aab:a788:44ed:f4da]) by CH1PR12MB9575.namprd12.prod.outlook.com
 ([fe80::2aab:a788:44ed:f4da%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 02:55:41 +0000
Message-ID: <d6c409da-44b8-4c17-bba8-dc5aeee219c5@amd.com>
Date: Sun, 27 Sep 2026 19:55:39 -0700
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
Content-Language: en-US
From: Melody Wang <huibo.wang@amd.com>
In-Reply-To: <517e154d-dbdf-47f9-849f-2ee369dc832e@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0180.namprd03.prod.outlook.com
 (2603:10b6:a03:338::35) To CH1PR12MB9575.namprd12.prod.outlook.com
 (2603:10b6:610:2ad::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PR12MB9575:EE_|SJ0PR12MB8616:EE_
X-MS-Office365-Filtering-Correlation-Id: 3281cfc4-b04e-45f0-a03f-08df1d0bfb41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|4143699003|6133799003|10067099003|56012099006|5023799004|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	QjADr7J87Lrs446dBCIHmAFcIKjLP2sgEpFGlc11kjGE4Ru55GOtUHXBrGpY5cyKK67ZtVPRG6l7Dd0qZTAO947bUUr/rmucZlOpCp7epqV34PlRwIic3oeLn8StSDRaVGQ7nQ6l920I91sApHCnHzH2lQJ2qLt6FGMThZ/uDCXJnEv4NEmXh5WxJsw4nVMQF8r7f0ifdtoRaaOMS44ryPRj/rhnEhziX7qtvZp5iDD6/If3vTpPmtuvlyvQSnuGLAaTovCT37hZ4euSxVr7oCa3cMG7A/Srik+76SZftf3O5gDfp/w+eKBh4sHnlEA/+dFg5pKXTTUdWSVbej+yNAdPs5pzQdYvBaPbSnjbhHrMkSHKmipOHyYtAoWt6VR4sStbHAPU8bbGWZ0pM7oEvgQ4zd4gukel6EJl5xEZ0NMDj1JCxlQ0/nH577Vr/RFsQkbp9oGUeBDWuko9bvtsd8Yqly8CNB2/Cgsd3lerPTzgIMWtB2Do/I/tGwTZJopR7TJCrOBnUrJJan6UOq8Sl9jPluOi2jnRwkw+b+wkDBY2KJ/8LKNUCB0NaasdGkasaH1nPc2h3XMbRuY8LOP5awvAKjEW3ERlQNm1YGlOqtZERlUW1yvSfZslXz/SQXO3OozDf6CcJdqD+Y1ddsh3m0jsX5D6iYjVNPyzNDNIvU4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PR12MB9575.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(4143699003)(6133799003)(10067099003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmlHNDRjT0JLZDZxUFpNaEI2SnpJOXFlblUveUVKNlBKMEw3M1oxWm9mUkpL?=
 =?utf-8?B?TUlGRTFqZDNhL3d2R1QzYzJwQTJHY3diMUdpVzZ4LzNNcmh6ZHlFNDh3MTh1?=
 =?utf-8?B?K1J5bmdQdGhVWTZsQng5Zi92M1JxUGUveUNpVWhwMUlVN0phRTFvR241ZjBq?=
 =?utf-8?B?cmE2TmYrSXZOSEZ1ZDBFbjN6ZUVBaU5HQVhNWG5CVEZHNUpIRDZEakVpZzZp?=
 =?utf-8?B?MnBCeVl2cEh6blJjaldNYU5qdmhQLzE5eWNOOU93OS9UTGl1S2JURy9ETE1B?=
 =?utf-8?B?Z2Y0bUFvQmxnUmxPZVB0QXhwRXdsMEdFOWQ3VnRIMW9QbzVZa3paaFE5NlBX?=
 =?utf-8?B?bGt3Y3orS0h4OXJTWm5EeWtTb3lHRWt4bitKKzRRc01xMlhnS05ld09BUitL?=
 =?utf-8?B?enhwZjNVQzZuV1FsU0o4Z1YzVklzL2NZN1cydTNuU0tYditoV28yOUJJTE5o?=
 =?utf-8?B?cmxtQ3hXMFQ0MWUzMEwvZjRrbXR3aU03cU8yajBmNXZ0NGpIWGhKYkFKRDhi?=
 =?utf-8?B?US9nZExNZThucysvUHhPRDloQitxWGVnSlFZZzEwSzh1T3l5NnZva3RPd0du?=
 =?utf-8?B?SDEyZkJBcmozaGlKb0w1aTN5LzlNK3Y4NkRLSkVQbmxTUldLcGpaQzFNUjh5?=
 =?utf-8?B?ZkhxYTN4enczN2N5dVI1djlsM2J5TGhOdTEwSEhzMzl5Y3FmS1ZYUTVrTXF1?=
 =?utf-8?B?SlkzVnpJOEJjNzNrMCtzSGtteUdybGJqVy9BZmVsNVhWWkRsU3JKd2VxV05q?=
 =?utf-8?B?ZzNwNThxZkU3SjFJZ2cyWUFkT2d2enF2aU0vT0NhNHJHeE1HcVB5cE1HdVY2?=
 =?utf-8?B?TVFUSC9DSWw4TXdSUVQvMWZWNzVid1ZjYTAyejhqbU9jRVNMZWpwdHF0bUZ0?=
 =?utf-8?B?Nm9SMjZhRnJaanp0eVRwTE9kUWlWWWNkYlpXL2dPenRPMUw2YkZpNmtldm84?=
 =?utf-8?B?SVJSa3k0VTluTTF1M2Z4S3JyYlhhTWN0b0V0SGlEbFhZVzB2a1BSNGRuN1hk?=
 =?utf-8?B?RXYzQkxMSG5Nb0NWY0p4MmRWWGtjMXA5ZEFaMGF5Y0tiQU11NTh1bmpSS3Y3?=
 =?utf-8?B?WVg0TXNnMG0yNThqVUxoRWRSSE5McXVLTlJaa0VsY2dXUGJpUk5vT29Wa1pF?=
 =?utf-8?B?Z2hQbGlTMlNWWlEveEhTdFlDNkpTNVRoMDgwUFJKWXVIaTB1cTZDRzVIcUVs?=
 =?utf-8?B?aVdudElaYVJmQVgvdExOaHJSTmI5V0xqVGs4YUR1Ynp1SElzVTVSK1NXZnIr?=
 =?utf-8?B?S0xvQVNoREt1U3FGSEdJU1R2R0Y1YTI1djd5bkVnVy9MS0V5Sko0ZzZncEN1?=
 =?utf-8?B?bHovYUNoY0J5VWhWWVZieFBnMGFrbmtNSExyY09jeEFSK0dnbVFYZGN4ZVR4?=
 =?utf-8?B?RTJPUFpHWFJVMjh2Zk52VjNOdmRRaitQUmF5SEY3ZXZGcHUzdEYrblpqd0I0?=
 =?utf-8?B?c0ZZV3czMFE2ZFRHbDlFbmlUajZJdnJiTjdLaWUxbnBrMUhjd1lYWHJ3ZEcz?=
 =?utf-8?B?bThOZUNrMW5NdXBSVEVBYXpvSnNHUmdnVngxZnl1ek1OaDY5V014b0RwQ3py?=
 =?utf-8?B?TDUzRzl6K2h1ak5wMFlXek9GTmE5MExkTm0vK00xeGZXVjJzRjlJSE9tWUJE?=
 =?utf-8?B?ZnZnWnMwQU1jYXNNZVo0S3Ava05CdkFiR2U3RWs5NjRINmptQ1dpcXoyVGx5?=
 =?utf-8?B?TGFmdldUZGs5dnc1enZOeU16MUhXNHlYeVdXSU55RkgvZ1p3UFRnOHB2Vm0v?=
 =?utf-8?B?TGdRWU5GTVJRWFp2MHEzUWl3ZjBmaEJyRE01ZzRxbmxrUHoreWpxQkZ3VWty?=
 =?utf-8?B?YlR4SEJOZnhWRi9xZS9iSFpkZFBZdzF5RjNzdk5kQlJUYU8rS2tTTXF1Y3NM?=
 =?utf-8?B?VmkwTDlDRDlDbGhLaVpycUt6QTdYb2R4Q3p4NmVaUjhLY3lIMWwzRFpKemdx?=
 =?utf-8?B?ZCs0aWZuR0wxb3ZCRjBnZmlUOE1kd3FNeFk0cUlkYzJHREdPSU0yd0Qwd296?=
 =?utf-8?B?eWtlem1CelE3L3hKdWhDdkQxNDRFeEJuanAvaHYrSWdvaUUxK1ZqbXd4NHVM?=
 =?utf-8?B?TVE0OG1kdDZMOW1TREtlenpUaUZGV2xGWXdxSTRHd3BqZ013c1B1SWFtbElZ?=
 =?utf-8?B?NGxTY0k0YTVHTzdncXg3Nzk4bDhMOG1WVnlVQWR4b1UzdGQ3RythNWxDOWxY?=
 =?utf-8?B?bEsxdUViS0VVTENLcjB6cHpZSVJISFZjOWxHUWpmQTZXNUV6M1haVlAvSGR3?=
 =?utf-8?B?UytobEZCOHgvRzJRd1N0Sm1HR0tRLzFJSjJsNWs2cGdDa3ZKTUhZSzZXamFU?=
 =?utf-8?B?Tllycm5Rd2p5VVZlZkJpZ2trVFBreXRXWEhmTEowR2hIemZrNDlBdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3281cfc4-b04e-45f0-a03f-08df1d0bfb41
X-MS-Exchange-CrossTenant-AuthSource: CH1PR12MB9575.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 02:55:40.8959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ie8vjv1dFm3wryZviUMjX8qlbfvfFZoInueEiauGc9N4WvXgYisCxG3Krl5AJED8YoiG6EMbrFh4+NViCORawg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8616

Hi Ard,

On 9/24/26 12:06 PM, Ard Biesheuvel wrote:
> 
> That is not what I am suggesting.
> 
> What I would like to see is an abstraction implemented in OVMF that encapsulates
> the logic that you are adding here. All the EFI stub would have to do is call
> the protocol, nothing more.
> 
> After ExitBootServices() is a different matter, and actually, I think doing
> the memory acceptance at that point was a mistake, and I'd like to fix that
> but that is a separate discussion.
> 
> Before ExitBootServices(), we should not be poking MSRs directly. We should
> be relying on the abstractions exposed by the firmware.
> 

ok, see below what I did, I think the following is perhaps what you had 
in mind but please let me know if that is ok this way.

In there, the guest kernel will register Alternate Injection through 
OVMF if Alternate Injection is enabled in the special sev_status MSR.

The OVMF will check if there is an SVSM present and Alternate Injection 
is enabled or not, if yes, it will register Alternate Injection for the 
guest kernel. Otherwise, it will not. A failure of registering Alternate 
Injection will terminate the guest.

Cc Jon Lange, the Alternate Injection spec author as an FYI.

-----------------------------------------------------------------------

Kernel code:

diff --git a/arch/x86/boot/compressed/sev.h b/arch/x86/boot/compressed/sev.h
index 22637b416b46..62e50c2e71ed 100644
--- a/arch/x86/boot/compressed/sev.h
+++ b/arch/x86/boot/compressed/sev.h
@@ -14,7 +14,6 @@

  void snp_accept_memory(phys_addr_t start, phys_addr_t end);
  u64 sev_get_status(void);
-bool early_is_sevsnp_guest(void);

  static inline u64 sev_es_rd_ghcb_msr(void)
  {
@@ -37,7 +36,6 @@ static inline void sev_es_wr_ghcb_msr(u64 val)

  static inline void snp_accept_memory(phys_addr_t start, phys_addr_t 
end) { }
  static inline u64 sev_get_status(void) { return 0; }
-static inline bool early_is_sevsnp_guest(void) { return false; }

  #endif

diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index 93161b663d9b..13f2e8c009b4 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -471,6 +471,8 @@ static __always_inline void sev_es_nmi_complete(void)
  extern int __init sev_es_efi_map_ghcbs_cas(pgd_t *pgd);
  extern void sev_enable(struct boot_params *bp);

+bool early_is_sevsnp_guest(void);
+
  /*
   * RMPADJUST modifies the RMP permissions of a page of a lesser-
   * privileged (numerically higher) VMPL.
diff --git a/drivers/firmware/efi/libstub/efistub.h 
b/drivers/firmware/efi/libstub/efistub.h
index fd91fc15ec81..d65cdc8f2acd 100644
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@ -177,6 +177,17 @@ void efi_set_u64_split(u64 data, u32 *lo, u32 *hi)
   */
  #define EFI_MMAP_NR_SLACK_SLOTS        32

+typedef union sev_alt_inj_register_protocol 
sev_alt_inj_register_protocol_t;
+union sev_alt_inj_register_protocol {
+       struct {
+               efi_status_t (__efiapi * sev_register_alt_inj)
+                       (sev_alt_inj_register_protocol_t *);
+       };
+       struct {
+               u32 sev_register_alt_inj;
+       } mixed_mode;
+};
+
  typedef struct efi_generic_dev_path efi_device_path_protocol_t;

  union efi_device_path_to_text_protocol {
diff --git a/drivers/firmware/efi/libstub/x86-stub.c 
b/drivers/firmware/efi/libstub/x86-stub.c
index 2a1fa773d241..b6e58ade4162 100644
--- a/drivers/firmware/efi/libstub/x86-stub.c
+++ b/drivers/firmware/efi/libstub/x86-stub.c
@@ -783,6 +783,36 @@ static efi_status_t exit_boot(struct boot_params 
*boot_params, void *handle)
         return EFI_SUCCESS;
  }

+/*
+ * When the guest is running at VMPL2 with Alternate Injection enabled,
+ * register Alternate Injection before ExitBootServices().
+ */
+static int svsm_register_alt_inj(void)
+{
+       efi_guid_t alt_inj_proto = OVMF_SEV_ALT_INJ_REGISTER_PROTOCOL_GUID;
+       sev_alt_inj_register_protocol_t *proto;
+       efi_status_t status;
+
+       if (early_is_sevsnp_guest() && snp_vmpl) {
+               if (!(sev_get_status() & MSR_AMD64_SNP_ALTERNATE_INJ))
+                       return 0;
+       }
+
+       status = efi_bs_call(locate_protocol, &alt_inj_proto, NULL, 
(void **)&proto);
+       if (status != EFI_SUCCESS) {
+               efi_err("Alternate Injection registration protocol not 
exist\n");
+               return 1;
+       }
+
+       status = efi_call_proto(proto, sev_register_alt_inj);
+       if (status != EFI_SUCCESS) {
+               efi_err("Alternate Injection registration protocol 
failed\n");
+               return 2;
+       }
+
+       return 0;
+}
+
  static bool sev_prepare(void)
  {
         u64 unsupported;
@@ -793,6 +823,10 @@ static bool sev_prepare(void)
                         unsupported);
                 return false;
         }
+
+       if (svsm_register_alt_inj())
+               return false;
+
         return true;
  }

diff --git a/include/linux/efi.h b/include/linux/efi.h
index aa15ff88539b..ebf7b4b9a292 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -444,6 +444,8 @@ void efi_native_runtime_setup(void);
  #define OVMF_SEV_MEMORY_ACCEPTANCE_PROTOCOL_GUID 
EFI_GUID(0xc5a010fe, 0x38a7, 0x4531,  0x8a, 0x4a, 0x05, 0x00, 0xd2, 
0xfd, 0x16, 0x49)
  #define OVMF_MEMORY_LOG_TABLE_GUID             EFI_GUID(0x95305139, 
0xb20f, 0x4723,  0x84, 0x25, 0x62, 0x7c, 0x88, 0x8f, 0xf1, 0x21)

+#define OVMF_SEV_ALT_INJ_REGISTER_PROTOCOL_GUID 
EFI_GUID(0x3cf00587, 0x2329, 0x4c44,  0xb1, 0x84, 0x8f, 0xd9, 0x87, 
0x00, 0x42, 0xe0)
+
  typedef struct {
         efi_guid_t guid;
         u64 table;
---------------------------------------------------------------------

OVMF code:

diff --git a/OvmfPkg/AmdSevDxe/AmdSevDxe.c b/OvmfPkg/AmdSevDxe/AmdSevDxe.c
index f10f37719527..c7f471edd838 100644
--- a/OvmfPkg/AmdSevDxe/AmdSevDxe.c
+++ b/OvmfPkg/AmdSevDxe/AmdSevDxe.c
@@ -24,6 +24,7 @@
  #include <Library/PcdLib.h>
  #include <Pi/PiDxeCis.h>
  #include <Protocol/SevMemoryAcceptance.h>
+#include <Protocol/SevAltInjRegister.h>^M
  #include <Protocol/MemoryAccept.h>
  #include <Uefi/UefiSpec.h>

@@ -193,6 +194,42 @@ STATIC EDKII_MEMORY_ACCEPT_PROTOCOL 
mMemoryAcceptProtocol = {
    AmdSevMemoryAccept
  };

+VOID^M
+EFIAPI^M
+SvsmRegisterAltInj (^M
+  VOID^M
+  )^M
+{^M
+  UINT8 vector = 0x02;^M
+  AmdSvsmSnpApicConfigEmulation(vector);^M
+}^M
+^M
+/**^M
+  Register the guest kernel with Alternate Injection.^M
+**/^M
+STATIC^M
+EFI_STATUS^M
+EFIAPI^M
+SevRegisterAltInj (^M
+  IN OVMF_SEV_ALT_INJ_REGISTER_PROTOCOL  *This^M
+  )^M
+{^M
+  if (This == NULL) {^M
+    return EFI_INVALID_PARAMETER;^M
+  }^M
+^M
+  if (!(AmdSvsmIsSvsmPresent() && AlternateInjectionEnabled())) {^M
+    return EFI_UNSUPPORTED;^M
+  }^M
+^M
+  SvsmRegisterAltInj ();^M
+^M
+  return EFI_SUCCESS;^M
+}^M
+^M
+STATIC^M
+OVMF_SEV_ALT_INJ_REGISTER_PROTOCOL^M
+  mSevAltInjRegisterProtocol = { SevRegisterAltInj };^M

  EFI_EVENT  mDeregisterAlternateInjectionEvent = NULL;
  /**
@@ -355,6 +392,8 @@ AmdSevDxeEntryPoint (
                      &mMemoryAcceptProtocol,
                      &gOvmfSevMemoryAcceptanceProtocolGuid,
                      &mMemoryAcceptanceProtocol,
+                    &gOvmfSevAltInjRegisterProtocolGuid,^M
+                    &mSevAltInjRegisterProtocol,^M
                      NULL
                      );
      ASSERT_EFI_ERROR (Status);
diff --git a/OvmfPkg/AmdSevDxe/AmdSevDxe.inf 
b/OvmfPkg/AmdSevDxe/AmdSevDxe.inf
index 0db38471020a..bc6c1827e649 100644
--- a/OvmfPkg/AmdSevDxe/AmdSevDxe.inf
+++ b/OvmfPkg/AmdSevDxe/AmdSevDxe.inf
@@ -53,6 +53,7 @@
  [Protocols]
    gEdkiiMemoryAcceptProtocolGuid
    gOvmfSevMemoryAcceptanceProtocolGuid
+  gOvmfSevAltInjRegisterProtocolGuid^M

  [Guids]
    gConfidentialComputingSevSnpBlobGuid
diff --git a/OvmfPkg/Include/Protocol/SevAltInjRegister.h 
b/OvmfPkg/Include/Protocol/SevAltInjRegister.h
new file mode 100644
index 000000000000..cd6c32384a51
--- /dev/null
+++ b/OvmfPkg/Include/Protocol/SevAltInjRegister.h
@@ -0,0 +1,28 @@
+#pragma once
+
+#define OVMF_SEV_ALT_INJ_REGISTER_PROTOCOL_GUID \
+  { 0x3cf00587, \
+    0x2329, \
+    0x4c44, \
+    {0xb1, 0x84, 0x8f, 0xd9, 0x87, 0x00, 0x42, 0xe0}}
+
+typedef struct _OVMF_SEV_ALT_INJ_REGISTER_PROTOCOL
+    OVMF_SEV_ALT_INJ_REGISTER_PROTOCOL;
+
+/**
+  Register the caller (guest kernel) as an Alternate Injection consumer.
+  Wraps the SVSM registration; increments the SVSM registration counter.
+
+  @retval EFI_SUCCESS           Registration succeeded.
+  @retval EFI_UNSUPPORTED       Alt-Injection not available on this 
platform.
+  @retval EFI_DEVICE_ERROR      SVSM call failed.
+**/
+typedef
+EFI_STATUS
+(EFIAPI *OVMF_SEV_REGISTER_ALT_INJ)(
+  IN OVMF_SEV_ALT_INJ_REGISTER_PROTOCOL  *This
+  );
+
+struct _OVMF_SEV_ALT_INJ_REGISTER_PROTOCOL {
+  OVMF_SEV_REGISTER_ALT_INJ  SevRegisterAltInj;
+};
diff --git a/OvmfPkg/OvmfPkg.dec b/OvmfPkg/OvmfPkg.dec
index 50de41b7fcc8..cc3fa86a30d4 100644
--- a/OvmfPkg/OvmfPkg.dec
+++ b/OvmfPkg/OvmfPkg.dec
@@ -213,6 +213,7 @@
    gQemuAcpiTableNotifyProtocolGuid      = {0x928939b2, 0x4235, 0x462f, 
{0x95, 0x80, 0xf6, 0xa2, 0xb2, 0xc2, 0x1a, 0x4f}}
    gEfiMpInitLibMpDepProtocolGuid        = {0xbb00a5ca, 0x8ce,  0x462f, 
{0xa5, 0x37, 0x43, 0xc7, 0x4a, 0x82, 0x5c, 0xa4}}
    gEfiMpInitLibUpDepProtocolGuid        = {0xa9e7cef1, 0x5682, 0x42cc, 
{0xb1, 0x23, 0x99, 0x30, 0x97, 0x3f, 0x4a, 0x9f}}
+  gOvmfSevAltInjRegisterProtocolGuid    = {0x3cf00587, 0x2329, 0x4c44, 
{0xb1, 0x84, 0x8f, 0xd9, 0x87, 0x00, 0x42, 0xe0}}^M

  [PcdsFixedAtBuild]
    gUefiOvmfPkgTokenSpaceGuid.PcdOvmfPeiMemFvBase|0x0|UINT32|0

-- 
Thanks,
Melody

