Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9AA3C73F6
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790579708; cv=none; b=O87xOBmHkKrHbE/n/+kJ7n2sOuAv8qCsC0uahMbTIMVwD+yCWHXi1uoaDM3jT9laTAmZECMMvVx1FwhMGST+yN13Z21XbEgPtO6nzzGQdlhm/mkxAfuNv/B0vH54ybh1KNtNmtlNcflPQZ8A2ZN1cYa1ZL6bFeE/noSGhig/Eb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790579708; c=relaxed/simple;
	bh=2JOatvMFDs1sxNlc0tAZ+Fcs4fd0ALf4SfsAkqL+Qv4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Hrp/Wb9ey+W5HjbJLO+mDRLRkSLvwaDJRwZb+DWOJQRRNB4QbjV0aUG5XMeiKSVRYZZs4Pomu78amwSaEleHby3+rZ7IbcnP3CBysNsbXtBl6RkgjZ5Z+Qj3z2l9S7NnITE5bwfSzbUD20HwOWdwhuv5d/n5TkQGFcOReGBSJSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cf1DUSos; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cf1DUSos"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B2F1F000FF
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790579706;
	bh=4sL/UrIHvVuKyvvXgtFLvfWM2Znqh2XeaSxuEkH5kq4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=cf1DUSos6epQror1jML2h7zmtgObejWhFq5Q7faZ0IWDnP5dIL/WtYKTyMwyHshCw
	 D+Fh9RMXv+RdFMvSnShnnQkoPplTkX6rb9eI3pOBRX9bhDkRP5yk3NdNfQB4A4IBXF
	 4wgFsIND3gzAABZjIAuKXdR15OAimBWHe3rYiZ/QLMOPq4OjpYVSbBJ52RUBYR7P9a
	 X/qO/wQgsq1qJnnWFp1M0WA0ofM/G4mNR5EY/DTruWddTDxmsVpVR0h+sFFAZfOYWG
	 EZh8zjI9EmEHI0vsnKNCbuChv/eXP+9pzwjW8F3Metmaw7My7hoMXSidsDI/wELoQT
	 eK0OJv43XWZXw==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 5F6EA198004A;
	Mon, 28 Sep 2026 03:15:04 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Mon, 28 Sep 2026 03:15:04 -0400
X-ME-Sender: <xms:9xO6ao1sozKW2evMbz2tD0zB89tFpRsDRorU9kabmiDQ0bOjDtMrSg>
    <xme:9xO6at65ppb732CzjeV_1r6tBKqP1shUkelsK1KvmPlo0lGbwbenDROs-lFtxxrHL
    GuIVcBI1VusmvVTJs90Y24zhie1U5S7VvuCmY7zTYlHtFGitG51NPM>
X-ME-Proxy-Cause: dmFkZTGeGObekAfHfaWAxq+GB56ZW0VC3dXyteTo3Nibvfc/gra5/29Uch4PWVsOjnkGCW
    cf2W8neK7ijoqNKaEabfsP1Jpgk/CJAoBbUR5NnRyxCosPw01hVndzYyYGvlYO+vdKbsAQ
    bdZf5j3cJmnvOKPM5Gb1E5idAsMGGqezn241afM/IRl5mFe2naKySd1uZ2OumX1tpwkpyk
    hwq5nyf4kS5Kcmgos7h6LzObuaswmvcLiFf9dElkAp3L5PgVVF4g9VBamf/O3kwWcGCW9O
    kaMDi9B9CBZt3++VjUU+xoQykgGYKBtcm30MFzwbGVhGQOg1bMJXgkFFjsMXCYQsV93JbO
    OsqguO2m86lW3/rT+viTuIno/5N/UuqOsqSPzU5M27pjcn0ZZPnLlEgrt8Zz/qkosymFxZ
    2zRtZGZcYlSBO9fU1FE/0OZ5nnwEmye5jFARe/SDlGcx6F+4+3xn/dTcwHCkBWtXbtGmOT
    9Tex0UWSaYDO2BE0g6BMGTqHULbiGSzkgySeh6NUxw/cmAMsSqUywXD4tAl6XstC4rUGaV
    QmtpNWhKJI3YZte/F1M1RWiYqMxq6x7nWWPSuNKPkOpWTYSwo6O6bjWK+ihbuv0lDBwjG1
    WjxDqJTNUdpbY2aQE9jHowHPkfI0podT+HDa3fuxZvSTGkm2xBjNFELeBnJg
X-ME-Proxy: <xmx:-BO6aqYS1_cgQxQW9Begtgmst6Z0KRWrLL2GvfX7ynZbsoHFBbYl6g>
    <xmx:-BO6au4-_WsDhIAwgracQIQlo2XLSglLLK_uMB7jA05cxAsC461FSw>
    <xmx:-BO6alBc2x1O3CxHZOkvp8mnxvzuIhQrlxNFF7ikOONQVhmeQ_e2KQ>
    <xmx:-BO6aseHEkk4FYmFjRlSfJfGH8MgVOBWx5bjSygs9LFxZOXziKvIlw>
    <xmx:-BO6asLhjdYveGjbus9MHFjUJ2VL8aN5f1Rg99FxG5cW8uaX6nqvvCHq>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id E837EF80080; Mon, 28 Sep 2026 03:15:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 28 Sep 2026 09:14:41 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Melody Wang" <huibo.wang@amd.com>, x86@kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 "Tom Lendacky" <thomas.lendacky@amd.com>, "Jon Lange" <jlange@microsoft.com>
Message-Id: <335670cd-db18-4442-a3a9-5c99daa7d262@app.fastmail.com>
In-Reply-To: <d6c409da-44b8-4c17-bba8-dc5aeee219c5@amd.com>
References: <cover.1789927246.git.huibo.wang@amd.com>
 <1a64a4fb-c14b-454f-a89c-43112b01d187@app.fastmail.com>
 <43674b3b-15a5-494c-b1de-041070b1e816@amd.com>
 <517e154d-dbdf-47f9-849f-2ee369dc832e@app.fastmail.com>
 <d6c409da-44b8-4c17-bba8-dc5aeee219c5@amd.com>
Subject: Re: [PATCH v3 0/8] Alternate Injection: Secure Interrupt Delivery for SEV-SNP
 Guests - Guest Support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Melody,

On Mon, 28 Sep 2026, at 04:55, Melody Wang wrote:
> Hi Ard,
>
> On 9/24/26 12:06 PM, Ard Biesheuvel wrote:
>> 
>> That is not what I am suggesting.
>> 
>> What I would like to see is an abstraction implemented in OVMF that encapsulates
>> the logic that you are adding here. All the EFI stub would have to do is call
>> the protocol, nothing more.
>> 
>> After ExitBootServices() is a different matter, and actually, I think doing
>> the memory acceptance at that point was a mistake, and I'd like to fix that
>> but that is a separate discussion.
>> 
>> Before ExitBootServices(), we should not be poking MSRs directly. We should
>> be relying on the abstractions exposed by the firmware.
>> 
>
> ok, see below what I did, I think the following is perhaps what you had 
> in mind but please let me know if that is ok this way.
>
> In there, the guest kernel will register Alternate Injection through 
> OVMF if Alternate Injection is enabled in the special sev_status MSR.
>
> The OVMF will check if there is an SVSM present and Alternate Injection 
> is enabled or not, if yes, it will register Alternate Injection for the 
> guest kernel. Otherwise, it will not. A failure of registering Alternate 
> Injection will terminate the guest.
>
> Cc Jon Lange, the Alternate Injection spec author as an FYI.
>

This looks much better thanks.

> -----------------------------------------------------------------------
>
> Kernel code:
>
> diff --git a/arch/x86/boot/compressed/sev.h b/arch/x86/boot/compressed/sev.h
> index 22637b416b46..62e50c2e71ed 100644
> --- a/arch/x86/boot/compressed/sev.h
> +++ b/arch/x86/boot/compressed/sev.h
> @@ -14,7 +14,6 @@
>
>   void snp_accept_memory(phys_addr_t start, phys_addr_t end);
>   u64 sev_get_status(void);
> -bool early_is_sevsnp_guest(void);
>
>   static inline u64 sev_es_rd_ghcb_msr(void)
>   {
> @@ -37,7 +36,6 @@ static inline void sev_es_wr_ghcb_msr(u64 val)
>
>   static inline void snp_accept_memory(phys_addr_t start, phys_addr_t 
> end) { }
>   static inline u64 sev_get_status(void) { return 0; }
> -static inline bool early_is_sevsnp_guest(void) { return false; }
>
>   #endif
>
> diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
> index 93161b663d9b..13f2e8c009b4 100644
> --- a/arch/x86/include/asm/sev.h
> +++ b/arch/x86/include/asm/sev.h
> @@ -471,6 +471,8 @@ static __always_inline void sev_es_nmi_complete(void)
>   extern int __init sev_es_efi_map_ghcbs_cas(pgd_t *pgd);
>   extern void sev_enable(struct boot_params *bp);
>
> +bool early_is_sevsnp_guest(void);
> +
>   /*
>    * RMPADJUST modifies the RMP permissions of a page of a lesser-
>    * privileged (numerically higher) VMPL.
> diff --git a/drivers/firmware/efi/libstub/efistub.h 
> b/drivers/firmware/efi/libstub/efistub.h
> index fd91fc15ec81..d65cdc8f2acd 100644
> --- a/drivers/firmware/efi/libstub/efistub.h
> +++ b/drivers/firmware/efi/libstub/efistub.h
> @@ -177,6 +177,17 @@ void efi_set_u64_split(u64 data, u32 *lo, u32 *hi)
>    */
>   #define EFI_MMAP_NR_SLACK_SLOTS        32
>
> +typedef union sev_alt_inj_register_protocol 
> sev_alt_inj_register_protocol_t;
> +union sev_alt_inj_register_protocol {
> +       struct {
> +               efi_status_t (__efiapi * sev_register_alt_inj)
> +                       (sev_alt_inj_register_protocol_t *);
> +       };
> +       struct {
> +               u32 sev_register_alt_inj;
> +       } mixed_mode;
> +};
> +
>   typedef struct efi_generic_dev_path efi_device_path_protocol_t;
>
>   union efi_device_path_to_text_protocol {
> diff --git a/drivers/firmware/efi/libstub/x86-stub.c 
> b/drivers/firmware/efi/libstub/x86-stub.c
> index 2a1fa773d241..b6e58ade4162 100644
> --- a/drivers/firmware/efi/libstub/x86-stub.c
> +++ b/drivers/firmware/efi/libstub/x86-stub.c
> @@ -783,6 +783,36 @@ static efi_status_t exit_boot(struct boot_params 
> *boot_params, void *handle)
>          return EFI_SUCCESS;
>   }
>
> +/*
> + * When the guest is running at VMPL2 with Alternate Injection enabled,
> + * register Alternate Injection before ExitBootServices().
> + */
> +static int svsm_register_alt_inj(void)
> +{
> +       efi_guid_t alt_inj_proto = OVMF_SEV_ALT_INJ_REGISTER_PROTOCOL_GUID;
> +       sev_alt_inj_register_protocol_t *proto;
> +       efi_status_t status;
> +
> +       if (early_is_sevsnp_guest() && snp_vmpl) {
> +               if (!(sev_get_status() & MSR_AMD64_SNP_ALTERNATE_INJ))
> +                       return 0;
> +       }
> +

No need to test this - the protocol should deal with this.

> +       status = efi_bs_call(locate_protocol, &alt_inj_proto, NULL, 
> (void **)&proto);
> +       if (status != EFI_SUCCESS) {
> +               efi_err("Alternate Injection registration protocol not 
> exist\n");
> +               return 1;
> +       }
> +

Just ignore the error

> +       status = efi_call_proto(proto, sev_register_alt_inj);
> +       if (status != EFI_SUCCESS) {
> +               efi_err("Alternate Injection registration protocol 
> failed\n");
> +               return 2;
> +       }
> +

Distinguish here between EFI_UNSUPPORTED (which can be ignored) and
other errors.

Only question is whether EFI stub and OVMF are guaranteed to be in sync
wrt snp_vmpl versus AmdSvsmIsSvsmPresent(), but I guess things would
not work at all if that is not the case?


> +       return 0;
> +}
> +
>   static bool sev_prepare(void)
>   {
>          u64 unsupported;
> @@ -793,6 +823,10 @@ static bool sev_prepare(void)
>                          unsupported);
>                  return false;
>          }
> +
> +       if (svsm_register_alt_inj())
> +               return false;
> +
>          return true;
>   }
>
> diff --git a/include/linux/efi.h b/include/linux/efi.h
> index aa15ff88539b..ebf7b4b9a292 100644
> --- a/include/linux/efi.h
> +++ b/include/linux/efi.h
> @@ -444,6 +444,8 @@ void efi_native_runtime_setup(void);
>   #define OVMF_SEV_MEMORY_ACCEPTANCE_PROTOCOL_GUID 
> EFI_GUID(0xc5a010fe, 0x38a7, 0x4531,  0x8a, 0x4a, 0x05, 0x00, 0xd2, 
> 0xfd, 0x16, 0x49)
>   #define OVMF_MEMORY_LOG_TABLE_GUID             EFI_GUID(0x95305139, 
> 0xb20f, 0x4723,  0x84, 0x25, 0x62, 0x7c, 0x88, 0x8f, 0xf1, 0x21)
>
> +#define OVMF_SEV_ALT_INJ_REGISTER_PROTOCOL_GUID 
> EFI_GUID(0x3cf00587, 0x2329, 0x4c44,  0xb1, 0x84, 0x8f, 0xd9, 0x87, 
> 0x00, 0x42, 0xe0)
> +
>   typedef struct {
>          efi_guid_t guid;
>          u64 table;
> ---------------------------------------------------------------------
>
> OVMF code:
>
> diff --git a/OvmfPkg/AmdSevDxe/AmdSevDxe.c b/OvmfPkg/AmdSevDxe/AmdSevDxe.c
> index f10f37719527..c7f471edd838 100644
> --- a/OvmfPkg/AmdSevDxe/AmdSevDxe.c
> +++ b/OvmfPkg/AmdSevDxe/AmdSevDxe.c
> @@ -24,6 +24,7 @@
>   #include <Library/PcdLib.h>
>   #include <Pi/PiDxeCis.h>
>   #include <Protocol/SevMemoryAcceptance.h>
> +#include <Protocol/SevAltInjRegister.h>^M
>   #include <Protocol/MemoryAccept.h>
>   #include <Uefi/UefiSpec.h>
>
> @@ -193,6 +194,42 @@ STATIC EDKII_MEMORY_ACCEPT_PROTOCOL 
> mMemoryAcceptProtocol = {
>     AmdSevMemoryAccept
>   };
>

Add STATIC here

> +VOID^M

> +EFIAPI^M
> +SvsmRegisterAltInj (^M
> +  VOID^M
> +  )^M
> +{^M
> +  UINT8 vector = 0x02;^M
> +  AmdSvsmSnpApicConfigEmulation(vector);^M
> +}^M
> +^M
> +/**^M
> +  Register the guest kernel with Alternate Injection.^M
> +**/^M
> +STATIC^M
> +EFI_STATUS^M
> +EFIAPI^M
> +SevRegisterAltInj (^M
> +  IN OVMF_SEV_ALT_INJ_REGISTER_PROTOCOL  *This^M
> +  )^M
> +{^M
> +  if (This == NULL) {^M
> +    return EFI_INVALID_PARAMETER;^M
> +  }^M
> +^M
> +  if (!(AmdSvsmIsSvsmPresent() && AlternateInjectionEnabled())) {^M

Please make this !cond || !cond

> +    return EFI_UNSUPPORTED;^M
> +  }^M
> +^M
> +  SvsmRegisterAltInj ();^M
> +^M
> +  return EFI_SUCCESS;^M
> +}^M
> +^M
> +STATIC^M
> +OVMF_SEV_ALT_INJ_REGISTER_PROTOCOL^M
> +  mSevAltInjRegisterProtocol = { SevRegisterAltInj };^M
>
>   EFI_EVENT  mDeregisterAlternateInjectionEvent = NULL;
>   /**
> @@ -355,6 +392,8 @@ AmdSevDxeEntryPoint (
>                       &mMemoryAcceptProtocol,
>                       &gOvmfSevMemoryAcceptanceProtocolGuid,
>                       &mMemoryAcceptanceProtocol,
> +                    &gOvmfSevAltInjRegisterProtocolGuid,^M
> +                    &mSevAltInjRegisterProtocol,^M
>                       NULL
>                       );
>       ASSERT_EFI_ERROR (Status);
> diff --git a/OvmfPkg/AmdSevDxe/AmdSevDxe.inf 
> b/OvmfPkg/AmdSevDxe/AmdSevDxe.inf
> index 0db38471020a..bc6c1827e649 100644
> --- a/OvmfPkg/AmdSevDxe/AmdSevDxe.inf
> +++ b/OvmfPkg/AmdSevDxe/AmdSevDxe.inf
> @@ -53,6 +53,7 @@
>   [Protocols]
>     gEdkiiMemoryAcceptProtocolGuid
>     gOvmfSevMemoryAcceptanceProtocolGuid
> +  gOvmfSevAltInjRegisterProtocolGuid^M
>
>   [Guids]
>     gConfidentialComputingSevSnpBlobGuid
> diff --git a/OvmfPkg/Include/Protocol/SevAltInjRegister.h 
> b/OvmfPkg/Include/Protocol/SevAltInjRegister.h
> new file mode 100644
> index 000000000000..cd6c32384a51
> --- /dev/null
> +++ b/OvmfPkg/Include/Protocol/SevAltInjRegister.h
> @@ -0,0 +1,28 @@
> +#pragma once
> +
> +#define OVMF_SEV_ALT_INJ_REGISTER_PROTOCOL_GUID \
> +  { 0x3cf00587, \
> +    0x2329, \
> +    0x4c44, \
> +    {0xb1, 0x84, 0x8f, 0xd9, 0x87, 0x00, 0x42, 0xe0}}
> +
> +typedef struct _OVMF_SEV_ALT_INJ_REGISTER_PROTOCOL
> +    OVMF_SEV_ALT_INJ_REGISTER_PROTOCOL;
> +
> +/**
> +  Register the caller (guest kernel) as an Alternate Injection consumer.
> +  Wraps the SVSM registration; increments the SVSM registration counter.
> +
> +  @retval EFI_SUCCESS           Registration succeeded.
> +  @retval EFI_UNSUPPORTED       Alt-Injection not available on this 
> platform.
> +  @retval EFI_DEVICE_ERROR      SVSM call failed.
> +**/
> +typedef
> +EFI_STATUS
> +(EFIAPI *OVMF_SEV_REGISTER_ALT_INJ)(
> +  IN OVMF_SEV_ALT_INJ_REGISTER_PROTOCOL  *This
> +  );
> +
> +struct _OVMF_SEV_ALT_INJ_REGISTER_PROTOCOL {
> +  OVMF_SEV_REGISTER_ALT_INJ  SevRegisterAltInj;
> +};
> diff --git a/OvmfPkg/OvmfPkg.dec b/OvmfPkg/OvmfPkg.dec
> index 50de41b7fcc8..cc3fa86a30d4 100644
> --- a/OvmfPkg/OvmfPkg.dec
> +++ b/OvmfPkg/OvmfPkg.dec
> @@ -213,6 +213,7 @@
>     gQemuAcpiTableNotifyProtocolGuid      = {0x928939b2, 0x4235, 0x462f, 
> {0x95, 0x80, 0xf6, 0xa2, 0xb2, 0xc2, 0x1a, 0x4f}}
>     gEfiMpInitLibMpDepProtocolGuid        = {0xbb00a5ca, 0x8ce,  0x462f, 
> {0xa5, 0x37, 0x43, 0xc7, 0x4a, 0x82, 0x5c, 0xa4}}
>     gEfiMpInitLibUpDepProtocolGuid        = {0xa9e7cef1, 0x5682, 0x42cc, 
> {0xb1, 0x23, 0x99, 0x30, 0x97, 0x3f, 0x4a, 0x9f}}
> +  gOvmfSevAltInjRegisterProtocolGuid    = {0x3cf00587, 0x2329, 0x4c44, 
> {0xb1, 0x84, 0x8f, 0xd9, 0x87, 0x00, 0x42, 0xe0}}^M
>
>   [PcdsFixedAtBuild]
>     gUefiOvmfPkgTokenSpaceGuid.PcdOvmfPeiMemFvBase|0x0|UINT32|0
>
> -- 
> Thanks,
> Melody
