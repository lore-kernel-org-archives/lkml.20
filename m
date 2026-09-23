Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011004.outbound.protection.outlook.com [40.93.194.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E7032F764
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790196411; cv=fail; b=HD8wRy+2GI82fXAITc49FclgnPArbmG8dfzaGRc4LIpHmZmUYZOXyWZfuQ0T6Yl3M6YHdcC/Az1GuwNgqvZyCZxzaJ9I1DL8J4hqq+Q0w9mw6Sn0YYJOehX3Fc6Zgu1UxqUwJ6kmmPdzWSk4SU1CgFpBYgvYUBNPC/g8/n/ZYpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790196411; c=relaxed/simple;
	bh=76bzu1D6WAne2b4i/d4NtaX6c2Dfsg8y12YPvC3MaOY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pfyee/4Vyc8vl5U/FpVOsP1RucfA5dzfSjVrjJ+QspCe/E8OdXRB5XzYKwXQTqJiZDnGXAivYJNg8rL6rj6sHtb/QM6dR6XhAuP5fyxQoSafn+RiMCpUX8CXRnW5HeWqHVB3nUnsR5r59qyAYNJOu+f7/R6+lgsdxL/9RZ26JoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YqQeONW8; arc=fail smtp.client-ip=40.93.194.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YqQeONW8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jy9LiFOl0J6iZxq/Pz8o8+RrvUFnhNgs35dOWyNEfe5HOW/+28H7bacFx7I1R0ugIK9DqPLGgig7fK4FOfMMJxYnamP3+xH3LohFESW7B5/WAJY0oAOWi4uVWJiGHMV9U+QrQvXoEmdxyT48LKrXjwsioZ0vREge25O+N6FXVqiFAltM9hzV6Ix4Kcof3FgMIpu+d/NaiSqTOGYG+KCQmqwWsVKBja9muBsimJBNOA96E1bCowXftj9frzUX3+JB1aQvfaHLS82C8cSrEGXmnOPL6kG7s13VydvdCfzHEVyL7b3oVjPPSFBMIyjdsQvnCqfAhR5G8+2qNu4cUnVLcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qon70D+nJER4e6VQjKwrYVtkr9dtnZQ5Vs11Gkyi4HA=;
 b=sJ09wQrD91lqOnJ5ggSPK95o6muYyJsvhMXBxazhumF8qgn/quEBElAFeBpxKwE6ylo+XyjX8299ex+GdtIGFOkoSesPTiTkXzhtVEM6u7OuwkH9XjtHszUt4p7zZHZtxu1NOtZ6Zn/j48eKCoJ3GuCmEm19J6MAchc0NAIO7aJTQZLbYb2WB4tKsW8u7jaIW+onliLOWmOjCsSsfSuDN0t1Go5rb7MeWPpir91DHkmIutFKkgqHvrBQrqeJNS6R24Q84TdaCka1OnBIURkdKakpgIk9FklOfB3l8KVadLymo0q/40TAKXwFFfVRg6f6hgCu2ofZ5Rpkqg9TD6Lf1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qon70D+nJER4e6VQjKwrYVtkr9dtnZQ5Vs11Gkyi4HA=;
 b=YqQeONW8QPUBpMb93gXkKYMXDQFsVR+KaL2nhSF64GiE1yJAQScEUDocyDpLom114IqwYSYQi07RyBXVMoHLokPcL2bQa9SRroBtMDBcTZXnVptTwJQOhFjwZyfx8zEeiunEehnch+/2z4F1u5TcTEnxeuy4zDwzwdVviaegArk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9558.namprd12.prod.outlook.com (2603:10b6:930:fe::13)
 by PH8PR12MB7136.namprd12.prod.outlook.com (2603:10b6:510:22b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Wed, 23 Sep
 2026 20:46:45 +0000
Received: from CY1PR12MB9558.namprd12.prod.outlook.com
 ([fe80::920f:8246:c48b:7ce9]) by CY1PR12MB9558.namprd12.prod.outlook.com
 ([fe80::920f:8246:c48b:7ce9%4]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 20:46:44 +0000
Message-ID: <b04febb4-5016-4f56-9b99-551180362da4@amd.com>
Date: Wed, 23 Sep 2026 13:46:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] x86/sev: Allow the guest to configure interrupt
 vectors for the hypervisor
To: x86@kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, ardb@kernel.org
References: <cover.1789927246.git.huibo.wang@amd.com>
 <e13c5758945b82ecec381d2b210e80b00aaafb50.1789927246.git.huibo.wang@amd.com>
Content-Language: en-US
From: Melody Wang <huibo.wang@amd.com>
In-Reply-To: <e13c5758945b82ecec381d2b210e80b00aaafb50.1789927246.git.huibo.wang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8PR02CA0038.namprd02.prod.outlook.com
 (2603:10b6:510:2da::10) To CY1PR12MB9558.namprd12.prod.outlook.com
 (2603:10b6:930:fe::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9558:EE_|PH8PR12MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: ff384c3a-1312-4f96-5f6c-08df19b3c734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	KbwT1uG3zsdQF66ybS3ZyTtgHgCa8aYh9ihoBTaz27Ln5a0wKFbR5WPaYZuwouRSULbiVhVHu2LZ5njIytiRx964fkS+L+Sh1wN4TZy705nf0byfzJwu56D/5usB48KY1b+cjSWYXHUuSJN9KQO3y7EGJ0xTRHw8bI2jo9SKblvPG/wTAfCp9qgmo2WpDwY7zNXPDW+QgL476B2LjuoXhMsZMnApl5IRorJQlI/hTbraf9OBI2JkNtZYPMG+jyDMHUMoC5VpCS3olIv7EKsoDvXOLJ+I4jUU2Mxu0OoMICn/1X0m30b2By4kVwzKUhLGR64vu3AjshxRLIOctSTfTWG/SDDwMklqLvrI6kFUubUv/TmuOQFG0qCTVX9OuSzljlGK34zJpf1R07FMWIhxUUuHioczbDNKLM6QZNjvvDNPQEhrYHizTDnG+d9WZAdcXp9rD/dPWaaU6yRNXKjzUJDZfbEK3jcabJqHqEmJ5lG2yZm902g/VkJzX591QI8zGRe5/NT87P98Zjao2GWZcYIhHb4ZB0hHugtGSSr0s3x+xryjILH7bciBjYo3F/wWJ86ShsKwdIfcYFjqTlHGRQSW3I8RiGN4EAmr4xeXABfRdLJ4iKa0qD3d6OQUPFcj/EOzBxTr+HhNB1LLWtYnFsxADw10mNzgcMj6de0tZNI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9558.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elVJdFZiNnhHS2NpNk4wK2p3L2tXWHUzNUVTSEhxY05Mc29oSGRQMUJQU1c4?=
 =?utf-8?B?N0hOU09wazJuc0w0Z3lBdjgyTWwrQ1U4L05pdWllV0p0eE5HK2Rmc05rT0Ju?=
 =?utf-8?B?TzNqWHZQVnphb1NMeDZEMGlqOVgvcFNOVGdoS0I2TlBoa1hjbHltZmdNTUcr?=
 =?utf-8?B?TXdneEFHQlZuUEw5eVJ6ZmprWXhLLzFocmN0amNHSk96eDQya0pmaktoRXFQ?=
 =?utf-8?B?cjdwdzhJanMxWXpWczBMVzRMc09mWUhDeU05aG5MRS9NTnlWVnA4RVhOYkdN?=
 =?utf-8?B?NHV0bDkrWll0NzJlNE5lWU40V3RVUWRScGJ1aGE5Y1Q0U2xTZkVvVThWMnFI?=
 =?utf-8?B?UmpSdnFLbEdRZGgyeE9qbXJVU2d6TGxtUnljTGd0MXBCOW5zN1duTDI3WXZT?=
 =?utf-8?B?ekZwdzJYRHlRZ1d4L1NldVRHd2l1NEptRnlKbk81RnZ6dHR2ZmZGSkdZcGJW?=
 =?utf-8?B?anBYRStocUN3SWg0UkZWVGc3bS9wNjdrcVd0Z2wyZjdYZUQ0bmEvU3A1OTF3?=
 =?utf-8?B?TkxpRFM0SzFHaXhzZVA3VXpXUkcrcTA2NXJoeVVxUW82d1hNM0h4KzU5dGtL?=
 =?utf-8?B?dHpZUjMzemZpQW80ZlRYMFBibStZTE50emYveGIwM1YvdkpnRlc0Rkh1WTBL?=
 =?utf-8?B?NDF0d3hEdnVpcG5IWHlDOElTc2dkWS9tWmNudW4rVnIyRDdrL3cydkhQUkE0?=
 =?utf-8?B?c0U5Lyt4TWpQNkVTdElMaGh1czR4ckZJd0hiRnREZHRhS3ArcldpNzBYSmt0?=
 =?utf-8?B?R0Vjdm9CTmdlbGl5cERWQi9EdWdpR2JEWEZwSVpYYTA3MDE2K0Y3Mk1zL3hv?=
 =?utf-8?B?TjlaMHFFNXhxd25ESEJHNWxlNk1JT0pDQUN2b2d2ektPUzFVeDk5MjczbHdu?=
 =?utf-8?B?VTNmMHcycjV0UnA0MDgvUXRsQzg4dDRmcURxK245OTg3aWNlWTQxdE9iNVFV?=
 =?utf-8?B?aE10ajlXK2dqc0phRUp4dnNNZC90RThZOXREQTZzdjZpQVpWU3RPOFl4WjZN?=
 =?utf-8?B?bm9qY1E5c1BHZUpmUmJMSnFGMHE5K0VQVUFGbGhNLzBRUExIbnozZkJ5SXNW?=
 =?utf-8?B?QkxSdWZCTE1GTlJDU3g0L01KV2pyUFEzUGV1T29wOFY1aUVNWHgvTE5ITytt?=
 =?utf-8?B?VmNod3I3TkpvV296YmpQa01EVnp4clJLQ1VmWnE5MmhKRVQxWFZGeXlpYTc0?=
 =?utf-8?B?NTNrcmFmMmQvUjFnUnlKTUJ2cktmVXI5bGw5RlRDSXd3NWZ1MGJIakRHamo2?=
 =?utf-8?B?VTVONUpBeEFNMm5FSGt3Z3BKV0tHbUloWXo1VWVNN2xHNmorbGJPSWlaT2pR?=
 =?utf-8?B?SlUycjd1Tnd0R1pnVHpIMXdoUGhtUUZMZHQwc2Z5aVVrOXBsQUxYemNLNjBG?=
 =?utf-8?B?alpETVd4WWYyU2RxU1BQeHBZUUhDWmx2a0dWZ3dzZHIrYmtMeWhYa3J1MTVK?=
 =?utf-8?B?QjJXU2dlTmhqMWNTM3V0SVFhQ1VaY1J4MHBQRUNENTEzVW9CUkE2QTBNdXNB?=
 =?utf-8?B?dFg1NWhMV3V5TjVkVjFZYkhzVGM0TXNGdms2UFJ5THFkZy8wTWZzdDJVUUhC?=
 =?utf-8?B?cFNnOExFS25SQ25kRm9razRqd1E5SmZra3c1U1lYRkx5ZExWS1pVMENOamhm?=
 =?utf-8?B?Umx2NHB5WFFEdEd1Q1JZcnVSblVrb2JpOEJjVHBiNllPak9HZC93WVJQRDFI?=
 =?utf-8?B?WmJEdXhPc3NsNjJJMFNZdnhQcTJrL250TWQ2ZHhPcTZoNXg5MzlGV1dNaytL?=
 =?utf-8?B?LzZGeU5nbGZwKzJYcFNQTkNkczVDc09hSnkycnlsTnk1MjJ1WkdTOTkrWHBI?=
 =?utf-8?B?RjRwdGRGc0YvZERNamdlZGZaVTlBeTcyeUwzQ05ic3pQK1hHM3phakRHWkd4?=
 =?utf-8?B?OStkZm50NUFJV1pIMmRpUTlrbDFUWURJbk1TUU5BbDdBcjJhSmNqRGwrWGE4?=
 =?utf-8?B?V1djcVV3dWVZMnFXM1NMUlluaVExSHBpd3prMjIrVjFMdnZvUktvSC9HcVJF?=
 =?utf-8?B?L1pkSnNCVEhsdy80ZjBFMzlldHhhYmhEV25iSndGc3BDMS9xbThvaFBkcXRM?=
 =?utf-8?B?QzFqNmZtVVlZaEl4dmlHY3lKNGtXZkxwbkNtdHVQN3NiWkREd0NYOUVoODRl?=
 =?utf-8?B?bitFRFg3S0IveFJWK1hLRWJWcDRqcG5MNVFXUDlsTzVmVHVDblVoV0h5M3pI?=
 =?utf-8?B?VjZycFRMTEtvRnpUZmNqUTh3UmthVGxCU2pYenBIUTQvcUVnbXRPdXFWczNR?=
 =?utf-8?B?L2duVHJyTkFWWHBpOU9RVUdNMjgzeEU4L1VJSDljVmxFQitUV0hRNGhHK3pu?=
 =?utf-8?B?WG1IM0htR1BRTDQ4Q3ZmUWFSMWhEVWhiSzZEOVY1K0JoTWpXN1BCQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff384c3a-1312-4f96-5f6c-08df19b3c734
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9558.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 20:46:44.4794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tgPJFSYr/bAVEkx6fORsdDUHWB4Z/X+LIjiskS/ThdtOXC+nSOyZTWhgQ4+AX6bg4iXPqKIeMfS2nIg+RJscHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7136

Hi all,

On 9/20/26 11:16 AM, Melody Wang wrote:
> The SVSM APIC protocol supports 5 API calls. SVSM_APIC_CONFIGURE_VECTOR
> (shortened to SVSM_APIC_CONFIG_VECTOR for brevity), call 4, provides for
> the guest to configure an interrupt vector which the guest allows and
> the hypervisor can use to signal interrupts for it.
> 
> Implement this call, and make the default interrupt setting permissive
> to allow all interrupts when detecting an SVSM and Alternate Injection
> is enabled.
> 
> Signed-off-by: Melody Wang <huibo.wang@amd.com>
> ---
>   arch/x86/boot/compressed/sev.c          | 24 ++++++++++++++++++++++++
>   arch/x86/boot/compressed/sev.h          |  7 +++++++
>   arch/x86/include/asm/sev.h              |  2 ++
>   drivers/firmware/efi/libstub/x86-stub.c |  2 ++
>   4 files changed, 35 insertions(+)
> 
> diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
> index 9f776ba7f123..6ab6276f731f 100644
> --- a/arch/x86/boot/compressed/sev.c
> +++ b/arch/x86/boot/compressed/sev.c
> @@ -534,3 +534,27 @@ void svsm_register_alt_inj(void)
>   			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
>   	}
>   }
> +
> +/*
> + * Configure all interrupts as permissive by default for Alternate Injection
> + * enabled SNP guest.
> + */
> +void svsm_config_alt_inj_vectors(void)
> +{
> +	if (early_is_sevsnp_guest() && snp_vmpl) {
> +		struct svsm_call call = {};
> +		int ret;
> +
> +		if (!(sev_get_status() & MSR_AMD64_SNP_ALTERNATE_INJ))
> +			return;
> +
> +		call.caa = (struct svsm_ca *)boot_svsm_caa_pa;
> +		call.rax = SVSM_APIC_CALL(SVSM_APIC_CONFIG_VECTOR);
> +		call.rcx = SVSM_IRQ_ENABLE_ALL;
> +
> +		ret = svsm_call_msr_protocol(&call);
> +		if (ret)
> +			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
> +	}
> +
> +}
> diff --git a/arch/x86/boot/compressed/sev.h b/arch/x86/boot/compressed/sev.h
> index dd058af2e7aa..035a7b46085b 100644
> --- a/arch/x86/boot/compressed/sev.h
> +++ b/arch/x86/boot/compressed/sev.h
> @@ -18,6 +18,13 @@ enum svsm_ai_ctrl {
>   	SVSM_AI_REGISTER,
>   };
>   
> +enum svsm_vec_enable {
> +	SVSM_IRQ_DISABLE_SINGLE = (0u << 8),
> +	SVSM_IRQ_ENABLE_SINGLE = (1u << 8),
> +	SVSM_IRQ_DISABLE_ALL = (2u << 8),
> +	SVSM_IRQ_ENABLE_ALL = (3u << 8),
> +};
> +
>   void snp_accept_memory(phys_addr_t start, phys_addr_t end);
>   u64 sev_get_status(void);
>   bool early_is_sevsnp_guest(void);
> diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
> index c1e31fc9c918..a6d4e5ea0913 100644
> --- a/arch/x86/include/asm/sev.h
> +++ b/arch/x86/include/asm/sev.h
> @@ -544,6 +544,7 @@ enum es_result savic_unregister_gpa(u64 *gpa);
>   u64 sev_apic_ghcb_msr_read(u32 reg);
>   void sev_apic_ghcb_msr_write(u32 reg, u64 value);
>   void svsm_register_alt_inj(void);
> +void svsm_config_alt_inj_vectors(void);
>   
>   static __always_inline void vc_ghcb_invalidate(struct ghcb *ghcb)
>   {
> @@ -654,6 +655,7 @@ static inline enum es_result savic_unregister_gpa(u64 *gpa) { return ES_UNSUPPOR
>   static inline void sev_apic_ghcb_msr_write(u32 reg, u64 value) { }
>   static inline u64 sev_apic_ghcb_msr_read(u32 reg) { return 0; }
>   static inline void svsm_register_alt_inj(void) { }
> +static inline void svsm_config_alt_inj_vectors(void) { }
>   
>   #endif	/* CONFIG_AMD_MEM_ENCRYPT */
>   
> diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
> index 35b8641119b9..7082fa10d5e6 100644
> --- a/drivers/firmware/efi/libstub/x86-stub.c
> +++ b/drivers/firmware/efi/libstub/x86-stub.c
> @@ -796,6 +796,8 @@ static bool sev_prepare(void)
>   
>   	svsm_register_alt_inj();
>   
> +	svsm_config_alt_inj_vectors();
> +

Sashiko said this:

"Does this configuration need to happen for non-EFI direct boots as well?
Since svsm_register_alt_inj() and svsm_config_alt_inj_vectors() are
exclusively called from sev_prepare() inside the EFI stub, non-EFI direct
boots (e.g., passing the CC blob via find_cc_blob_setup_data()) will bypass
this code.
In a non-EFI boot, Alternate Injection is never registered with the SVSM.
However, svsm_apic_probe() will still successfully probe and enable 
svsm_apic
because MSR_AMD64_SNP_ALTERNATE_INJ remains set in the hardware status MSR
provided by SVSM.
Will this cause the first APIC operation by the kernel (e.g.,
svsm_apic_msr_write()) to be routed to SVSM, where the unregistered call is
rejected and triggers sev_es_terminate(SEV_TERM_SET_LINUX,
GHCB_TERM_ALT_INJ_FAIL), leading to a deterministic boot crash?"

Alternate Injection does not work without OVMF support so no need to 
handle the non-EFI direct kernel boots.

Thanks,
Melody

>   	return false;
>   }
>   

-- 
Thanks,
Melody

