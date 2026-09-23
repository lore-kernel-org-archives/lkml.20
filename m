Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C12446BFA
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197035; cv=none; b=jVlHgqo5goxwUbQh+xQcJFgFN28m6cjiZ0NFF6FgEnY8kSGaarVHrMORjtWIirEGB15QCNSMcvSiqGSnVdjuoLnnWNQM1wv3h+UOUwRpPPrXuKs8OAR+e90+I/HrjkT/J5jQ+FGERlshRm5POjMYuCV3lCCPx35nejrLIvCWrks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197035; c=relaxed/simple;
	bh=idLSmzoJn/OFwsvxENjCPxZ9RwvuDZ2ZJgdZ/G0M0/E=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=KMi6V4EQVbjl79S+0y9d0kaFALvTD7Zi4i3dZkHKnWG1L5AChzFVB/4s8sS5GEjGHd7mYoCM4+0xgPuHAdiBr3XsdcKC4Ugm5ZvrbNJuCECz2jBrxFXWOpWUJFBwh26CdcjLlJ59e5JsGhjafvn0+Nu8VULKAFJpPBG9OJXbsWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ElyIKXMI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ElyIKXMI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6413D1F000FF;
	Wed, 23 Sep 2026 20:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790197032;
	bh=A71ynVy0IxtX/6OXERxjMrX71OhmcVL7CyV6ob58IkU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=ElyIKXMIheI/ImR1F9B3YcXdI2lC2BbcYKYkYlDP09pKbYoAoBCtSh25sJqqIO2Jv
	 WSKP6qbUluZDL28VhirbVXT3hrOIl5sljjzy0pqLGHLJOmW+sahcFZpeu5biYOjlgJ
	 +82R7kqK6+ZxtyMZqnCMS7BhZp/AED+ZBU1iQJ69tInkWP6oejsm/1dD6y41xT5u3A
	 C89uc4g/wzFx22HERDHBjxmFmwq/xpXCRd8hL9YByZ3n5z3p5/VPjiQrjkb2aAtUb6
	 Ha6og7C4FvIu2tWOdfWpzCZ2ecYmT0Sav9Y1wbYAxpS5BUMnhHv6Jihpj5sBCblN+F
	 EoGFyyOb1BVQQ==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id D50E21980058;
	Wed, 23 Sep 2026 16:57:10 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Wed, 23 Sep 2026 16:57:10 -0400
X-ME-Sender: <xms:JT20ajOd_7ZrUIO0J6vyMZixsuWeNVqs-HkSASpuATiyUAi9IutgYg>
    <xme:JT20aoyUpJK6PKZtfBACUjtGgEjCcDhQEMP2Xqnop3rKkuDWyVljQjnDA1odUz0wL
    aghFqsSwW6gwYxxYzIrM_bXyEHdqDPtELabtg72V4XgblJQDzou3yAk>
X-ME-Proxy-Cause: dmFkZTFti4aaQMbVQ3GQkPHccGXm8wJue25y/YJW5qYg5aouBTLi61Sz2Vd4btFKrgBPSi
    E1oC5rwp2uE1fYldoe/Yw28gUjLv2ZJfJBBMTLANdK5RE21wuT25OoJZib4TH8w0aU8srk
    b93QW84H8KhdGv1IL6dEW1XnXz7x6RLDVNkcI+Z16L51Ji7ceaO4KAjNh1dCga00DQ7vw7
    UJsuQGC4arHj9daHeda8jDYJb7p5uxH6bPKz5ntpPF/OFnuLHvxzAFf74u5a8m+muB6ixE
    KCgciLG4ql+WwgY4HjwS42TL+DXvf0Zeejh+K+HC1/o1+THmwOAEgLjxZnuwTJRs9Q1UXP
    zECivnd81nTrhAgyiOkppj7mPG4vscoDM/qeKTnugTE3g4BxKZ/HaBXGgrWR/tiZP1j9mS
    jUbOiWCuteevxnh3obUaA10/o+NKAy7yb1RBasrtW/jpHaKi4QN8uZn99Bto/ahZcmdtgc
    iUYKGw26yNSHUrgSs/PtAqwet+8RuhsDXbupw72ZxxC+T1qAt6G4K/ZWC14kBRu+PGogku
    60DCD5XNn1JlxYIUWKgt2M3iisjp/bEZ93TIPfIM/gAzy8khd5EVC/wzicx/ISjS5K+v7Q
    JdL5uFgVEBAqDjhHsd7T5T+RU1sVkS/zdezks6UZl8W2Cx1QTB99OBhyAH1Q
X-ME-Proxy: <xmx:Jj20ai2T3XelYw5rHt1L2cIZA_wWShT25Rn6vj5a9_0mYREGVU0FJw>
    <xmx:Jj20ai4mLqiK9g5SrnCYhbQ80pQlYHKbziovSSIRGE_llYDeqI3pVA>
    <xmx:Jj20alXLnNX3aKAZLrvjK-vDAcmszq_igNQ2bifEdHSBSXei5NA2eA>
    <xmx:Jj20ahA_Y0mf3_xXlABRmwxsZoRf7IT0fTmtS1zvo5HHdhweprM1rQ>
    <xmx:Jj20ak5NlfRypSM9ZnfgaDh5NT1brA7ftgoxfG9iSVf3Qf25cPSHCWuu>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 899EAF8007E; Wed, 23 Sep 2026 16:57:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 23 Sep 2026 22:56:49 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Melody Wang" <huibo.wang@amd.com>, x86@kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 "Tom Lendacky" <thomas.lendacky@amd.com>
Message-Id: <1a64a4fb-c14b-454f-a89c-43112b01d187@app.fastmail.com>
In-Reply-To: <cover.1789927246.git.huibo.wang@amd.com>
References: <cover.1789927246.git.huibo.wang@amd.com>
Subject: Re: [PATCH v3 0/8] Alternate Injection: Secure Interrupt Delivery for SEV-SNP
 Guests - Guest Support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi all,

On Sun, 20 Sep 2026, at 20:16, Melody Wang wrote:
> Hi all,
>
> This revision addresses all review comments from version 2.
>
> The changes include:
>
> 1. Moved sev_prepare() from decompressor to EFI stub.
>

This may be a bit of a 'back to the drawing board' remark, but if opting
in to this alternate injection scheme can only be done from the EFI firmware
before ExitBootServices(), couldn't we wrap all this logic into an OVMF
protocol instead? That way, the EFI stub can just invoke it if it exists,
and what happens under the hood as a result is entirely under the control of
the firmware.



> 2. Changed "Register Alternate Injection" and "configure all interrupt
>    vectors" as two APIs located in compressed/sev.c since they are
>    self-contained, avoiding exporting functions. 
>
> 3. Added more comments for better understanding.
>
> Thanks,
> Melody
>
> Changelog:
> v2
> --
>
> This revision fixes all the review comments from version 1.
>
> The changes include:
>
> 1. Changed a few comments for better understanding, deleted some unnecessary
>    code, corrected some typos, and some minor code fixes from the review
>    comments by Sashiko and Boris.
>
> 2. Unified sev_apic_ghcb_msr_write() and sev_apic_ghcb_msr_read(). 
>
> 3. Move x2apic_svsm.o after x2apic_savic.o so that the secure AVIC gets
>    preferred on machines supporting it.
>
> 4. Reworked svsm_apic_probe() as Boris suggested.
>
> 5. Updated tools with renamed MSR_AMD64_SNP_ALTERNATE_INJ_BIT and
>    MSR_AMD64_SNP_ALT_INJ for completeness' sake.
>
> 6. Changed svsm_apic_send_IPI_self() with writing to the dedicated
>    APIC_SELF_IPI instead of writing to APIC_ICR.
>
> v1
> --
>
> The revision fixes all of the review comments from version 0.
> 
> The changes include:
> 
> 1. Changed a few commit messages, new file names, variables name and order,
>    function names and more comments for better understanding.
> 
> 2. Added a pre-patch to fix the problem that in two functions in the the SVSM
>    vTPM guest implementation do not disable preemption when fetching CAA. It
>    is moving the CAA fetching operation inside svsm_perform_call_protocol().
>
>    This series relies on this fix too.
>
>
> 3. Removed svsm_do_call() helper function and some intermediary layer
>    functions in SVSM APIC driver.
>
> 4. Removed the Secure AVIC check in SVSM APIC driver since it will never be
>    touched. 
>
> 5. Terminate boot when Alternate Injection is enabled in vmpl0.
>
> 6. Added a common function for SVSM APIC read and write.
>
> 7. Added a new SEV_TERM_SET_LINUX value for Alternate Injection and APIC ghcb
>    msr read/write.
>
> 8. Reworked sev_prepare() to reflect the error conditions correctly. 
>
> 9. Moved allowing all of interrupts right after registering the SVSM APIC
>    protocol.
>
> v0
> --
>
> Alternate Injection is a method to provide secure interrupt delivery for
> SEV-SNP guests against malicious injection attacks. By handing over the
> control of the interrupt injection to the guest itself, the security is
> applied. Alternate Injection use Secure VM Service Module (SVSM), and APIC
> emulation in the SVSM to secure interrupt delivery.
>
> This is the guest side patches. The patch set includes the following:
> 1. Add support for enabling Alternate Injection.
> 2. Add support for the SVSM APIC protocol which uses a subset of the
>    X2APIC MSRs.
> 3. Add support to allow the guest OS to request Alternate
>    Injection.
>
> Melody Wang (8):
>   x86/sev: Make SVSM calls preemption-safe
>   x86/sev: Add support for Alternate Injection
>   x86/apic: Add an SVSM APIC driver
>   x86/sev: Route unsupported APIC register accesses to the hypervisor
>     APIC emulation
>   x86/sev: Add a function to contain all SEV-specific setup operations
>   x86/sev: Register the guest with the SVSM APIC protocol
>   x86/sev: Allow the guest to configure interrupt vectors for the
>     hypervisor
>   x86/sev: Indicate that Alternate Injection is supported in the guest
>
>  arch/x86/Kconfig                        |  14 ++
>  arch/x86/boot/compressed/sev.c          |  58 +++++-
>  arch/x86/boot/compressed/sev.h          |  13 ++
>  arch/x86/coco/core.c                    |   3 +
>  arch/x86/coco/sev/core.c                |  48 ++---
>  arch/x86/coco/sev/svsm.c                |  10 +-
>  arch/x86/include/asm/msr-index.h        |   4 +-
>  arch/x86/include/asm/sev-common.h       |   2 +
>  arch/x86/include/asm/sev.h              |  21 +-
>  arch/x86/kernel/apic/Makefile           |   1 +
>  arch/x86/kernel/apic/x2apic_savic.c     |   8 +-
>  arch/x86/kernel/apic/x2apic_svsm.c      | 243 ++++++++++++++++++++++++
>  drivers/firmware/efi/libstub/x86-stub.c |   9 +-
>  include/linux/cc_platform.h             |   8 +
>  tools/arch/x86/include/asm/msr-index.h  |   4 +-
>  15 files changed, 398 insertions(+), 48 deletions(-)
>  create mode 100644 arch/x86/kernel/apic/x2apic_svsm.c
>
> -- 
> 2.43.0
