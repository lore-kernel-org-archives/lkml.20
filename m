Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4AD3E51F7
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 18:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792260982; cv=pass; b=suUqLrqizpmdRuLkLVFm1bHQC4LP70VqXNle4f+3r+rHNQrL7WrY9vfDAHI+/IC+sNI7cfBB10RxMEsXgBA6S7/4SVB8+KwSEfV6ftjhqqyIgI5SR2IYIGJDqSnxXHwP3e/uk17hURpr+9IaNUXyazKk3NrC94WYEnipOiNF6fQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792260982; c=relaxed/simple;
	bh=gcTSzRaGTbutrkt9X+KlfCvLxA9mYQLFAjncxzTeeQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lYAMqztE+6vv5ZQBTAIDoCoRRTLeEYqvgvau9IhezSdLxdVbsHC1lhdSF0T07WNtN554ub9MuKawqkeTW2jNIp9HAuOzfas04vReycXiJ+n8QYWbYlmVV9hCfTLrUnnVHfuCnvCw61Z13WNyFgd/oIwds1ATlfcZ7nCBKBZDNzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSBPb9o+; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSBPb9o+"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e96502e447so6063845ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 11:16:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792260978; cv=none;
        d=google.com; s=arc-20260327;
        b=V5QfFjunkjOM4Ra8R2ZBB1n0OMRxkizWeXqbmQmbaoyTbNTaYHDtYrbdGhFKvgzxge
         t2cEPJWwbt0FaLeWzUWd1E/EAUChAngCUCKG/CFk74mN1Kb/odTvKfAS7QUAfXbnbdvg
         oS9OH5CHP2s29GAicwmj86R9Dm+QZeWYbyIpOc0bDRS5yZbi1wKZn7Sy0lcGF1Y7oHpB
         ALiC02aRYo3BU4IrasMAXk+D/p86mWXCAP9eTrqm14wWZPXXV3ez7y32xsaHXeUr5Suv
         ABm54w5OgOnL4WV7/scGwrMCI5DCWy4yvJlEjoH0ymWE7PHxGo74T8xcmcyNSo62Ao1F
         ZKkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gcTSzRaGTbutrkt9X+KlfCvLxA9mYQLFAjncxzTeeQ8=;
        fh=urJ11hKva/WcxZ6riAjtRqusH+w6vVuyEbCnAEE3HD4=;
        b=DrkEB/pITph/U9umpLtdwohgOdxO+EIMrVaL+PYLzE2H2fKz9wvxuz+0uHwHSZWLCT
         AQYvNDIPc6vlMgRnXvGEeMEeHssknBRZebszInBqgVdF6N9VjhmMPhiOnoXkIL6YvcCl
         S6nTLJj0AXyo0AhC3cA/pPvtRJj/utYwSKseh3aBz8MnCbVOdC7X2BGzVp5IsoJzSlKF
         SnQd12i7kJaCuu1HBtN4WlHCnsYomMPfaW2cQUdJMMUUJd0iNK3ye4NoUFrxXi5DUdjU
         JtxVQiCnJG8ZBIT83Oz7Ka2Ej1Bo20tbpjbJW2JDlRstpsQLiegXbDIsyckPb/uKHXsC
         v5TA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792260978; x=1792865778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gcTSzRaGTbutrkt9X+KlfCvLxA9mYQLFAjncxzTeeQ8=;
        b=RSBPb9o+qHBLqf7bPx4y/6eKLwAKmZ+JOdHhySY5dPsZkHK0gGqeGdhpkqiUEfDWTn
         Xz7PgRs27MXpUKTwyE0U+VoeDSTiyToGowF+EzRalz22KGX2leouQlNL31ubIAQqxe0t
         Z//bjUPSCLxz7263vGceb3XbzHMGXb+Pu6OuAeab8pQXlAc/GOQjk1OQHlREVugWF6Ug
         ThgM3qTgDvB0YPC3gEOKxnbYRarTHjvnzPkWed7+rinme3a3Tw8oBwrwogQ5AAbFU7u9
         0b+amr8eG62aakcybZAT3IUX6asuL/0b8FIjFpEn4h/+4MSt13PLy0JYa1UD3EcNtg5s
         AQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792260978; x=1792865778;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gcTSzRaGTbutrkt9X+KlfCvLxA9mYQLFAjncxzTeeQ8=;
        b=YuCU6c4ZD1UoZUBySn63Gc2dboycrCSNSj2uTzqT5ZaQrXRvbZZvYmN7fCL3g174MY
         o1l276ktGRY0wysS/haNIB0oQbMyGg0Qa+dBDYiRSvdXBE0CS/KmKjP+8Gwt3r4F8aUp
         MIp66K26VTLlxSRNCf4s35JAXlQCrxx4dLj/FVVdkvgH4uFU3lHf70iCwSWarzEmuJwU
         hzpOs1aghAMhv488qN6FhHgN1qBas8Oj58wRlU+ZfeH19bU6+TOqEdtIKYHThVthyRdY
         +qdw3Ks4LFSuKnJZfxszaR5Xl/dIfl373mnN5gLfybedqGxe7SP9JNzz3HwI22cdPRrA
         htFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzINcoOB+HFJPMvB5HqI4UhRRNzpA//tDMwklo3Eny3EOJCdHnypHk3EpRKgENdo3+tML9gQLJE4nhFkLA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwbX+ccHtDF4ticLI82HZaCfTkhNSYAzz20n20yZDqGDzc4zWo
	JuEw3ceczwwwqUJPyLRariJEDZAaOpABNK+/Ze5/4uXhIZnNsV2AfeY0DGzWYDTbd95jn7Z9faX
	2OOY/2xv8hrIwGZLqiVBfR1OJSZD3H5U=
X-Gm-Gg: AYBFou2chpvRJLIlB/u5n3LisQz2l/7FPVl3urbdWMmxMTafjvOMVGWYaFoHxLroJNR
	+DtIKNR4l6JC4ZQhPjD+5X68yRTPtQ1RkfF6a6C8RoGz8l+angMAtPdyTWyMwJ58mrxt1AbFzfP
	gCRnGZrhfdN5hj00affTrd/NVW8WkMtjY/sNOpTo4Mr59LIerZltdUePzhX9X+sOuC/8EBBJo8x
	LxfyWpo+Ccu+++lwTN4D/DbAJ11f01b6gc9PnLuS1YfXpQcOdSn2mU2G+DRD+Ud+BM31F9NWeQ5
	vZGU+G2Kf1Lw95cdP7sGxPBlReHZUjcj+GD74hiTCtJcbdi2xc7G9Dbqc6M73uPCfsGVT7JJJIp
	lTCOnDIn/stxn/KftPA==
X-Received: by 2002:a17:903:f84:b0:2e8:1f8a:9113 with SMTP id
 d9443c01a7336-2e9a6f58265mr30097085ad.40.1792260978190; Sat, 17 Oct 2026
 11:16:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015145053.3664509-1-jiri@resnulli.us> <20261016234354.GA664420@nvidia.com>
In-Reply-To: <20261016234354.GA664420@nvidia.com>
From: Dionna Glaze <drdeeglaze@gmail.com>
Date: Sat, 17 Oct 2026 11:16:07 -0700
X-Gm-Features: AclHuK_VfiECrlJzL8WxJydqMRSqCDHROeCkJ1kn-iT7JVYpxgerlwtvN-75yu0
Message-ID: <CANwfdvXFLJpC4Bc1PwRoUUP20fu2K8b+FHZ1JLLFXAikC-cBaw@mail.gmail.com>
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX support
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Jiri Pirko <jiri@resnulli.us>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, x86@kernel.org, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, david.quigley@intel.com, 
	lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, James.Bottomley@hansenpartnership.com, 
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com, 
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com, 
	jarkko@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 4:43=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Thu, Oct 15, 2026 at 04:50:33PM +0200, Jiri Pirko wrote:
> > From: Jiri Pirko <jiri@nvidia.com>
> >
> > Linux has several attestation interfaces tied to individual technologie=
s.
> > That makes evidence retrieval, measurement registers, device state and
> > kernel consumers provider-specific.
> >
> > This series introduces a common attestation subsystem. Its goal is to
> > support platform, TEE and device providers through one model, including
> > TPM2, TDX, SEV-SNP, Arm CCA, FIRME, Caliptra and PCI/TSM-backed devices=
.
> > This first series implements the common subsystem and a TDX provider.
> > Existing native TDX tsm_mr and tsm_report interfaces remain independent=
.
>
> To add some more colour on where this came from for others..
>

Forgive me for my following "I still don't get it" responses below.

> About 3 months ago we started looking simultaneously how to support
> roots of trust (ROT) HW in place of TPM and how to respond to the
> feedback on the netlink proposal for the TSM SPDM.

Given that I was tagged on this thread and not that one, I'd
appreciate a pointer to which you mean.
Is it https://lwn.net/Articles/1079098/?

>
> We began talking about generalizing tsm_mr to handle more than just
> "tsm" into a broader set of roots of trust, including TPM. In this way
> it could act as a multiplexor for any measurement user in the kernel,
> like IMA for example. I see others have independently come to a
> similar conclusion that IMA needs ROT agility, but I also know that
> DRTM needs the same ROT agility too.
>

+Jarkko
The TPM driver is pretty entrenched and heavily used by different user
space applications, so it seems really ambitious to bundle in TPM
here.
Consider that you have to do a lot of command interpretation to know
whether a user is getting or extending a PCR value, or whether it's
systemd doing an NVPCR thingamajig.
I don't think you can intercept commands and translate to intent for
any kind of extension to be correctly tracked by your MR journalling
addition here.
Can you explain a little more what your intent is?

> Bringing in the SPDM side, the netlink TLV uAPI fits nicely and can
> expose all the structured binary data it has. SPDM is also effectively
> a ROT without any measurement registers.
>

I would push back on SPDM being a ROT because you're talking about
different devices.
If we're Linux running on the CPU, the ROT is TPM or one of the Coco
things (SVSM vTPM, TDX attestation on MTMRs, ARM CCA attestation on
REMs).
If we're Linux running on a DPU, the expectation is Caliptra
bootstrapped the device and a DICE boot chain got to a Linux
environment without runtime extensions.
There is nothing to communicate with over SPDM to learn your own
measurements since the boot chain is available to the kernel.
If this is changing, please fill me in.

There is nothing that you communicate with over SPDM that acts as your
_own_ root of trust, with one exception I can think of that I would
call a platform security bug: a platform root of trust.
If a PRoT holds back firmware from interconnects until it has verified
the signature, and then the devices receiving the firmware do not also
have their own secure boot, then there's a physical interposition
attack surface.
It won't be the CPU that communicates with the PRoT, it'll be the BMC
(as far as I know from any architecture I've seen).
The BMC can be running Linux, and be treating the PRoT as its ROT in
older architectures that don't have Caliptra on the BMC itself.
The CPU can talk to the BMC over a privileged veth device and use
RedFish to get SPDM measurements, so there's no new device needed in
the kernel for that communication.

Are we talking about this BMC without an embedded root of trust (eROT)
case to treat SPDM as a ROT?
Any other SPDM communication would be for composite attestation by a
lead attester that all gets bound under the ROT that the lead attester
uses (presumably TPM).

> Combining the two needs together it seemed apparent that TSM is a bad
> name for this expanded purpose so we start calling this attestation
> subsystem. "root of trust" subsystem would be another way to look at
> it.
>

I don't see how a trusted security module is a bad name for this.

> The general notion is any root of trust can come with a single driver
> and expose a bunch of different uAPIs. The modern most capable one
> would be the CTLV based ioctl interface through a char dev, but in
> cases like TDX the legacy uAPIs will also remain supported.
>

What capabilities are you trying to enable, though? I'm not really
getting the picture.
If I was right about you referencing Alistair's patch series, then
perhaps this is a clue?

>>This series is different to Lukas' original approach and the approach tak=
en
>>in the previous RFCs and instead adds the PCI-CMA support as a TSM driver=
.
>>This was described by Dan in [3] and [5]. The advantage here is that for =
PCIe
>>we can leverage the TSM work for a lot of the features and provide usersp=
ace
>>a consistient interface between PCI TSM and CMA.
>>
>> [..snip..]
>>
>>Other transport mode (such as ATA, SCSI, NVMe and MCTP) will
>>therefore need slightly different approaches, as TSM doesn't apply.

I don't really know why TSM doesn't apply, and how this proposal does.

> In this way I view it as a further evolution of the tsm report and tsm
> mr components in a way that lets us harmonize the uAPI and avoid
> hardcoding things in userspace. Though the name has changed so this
> linage is not quite as apparent.
>

I don't know why using a standard protocol in user space would be "hardcodi=
ng",
if we're leaving the SPDM message construction and interpretation to user s=
pace.
The TPM commands are standardized and left to user space to manage for exam=
ple.

> For example the end goal is for systemd report to be able to
> dynamically enumerate all the ROTs in the system, include them in the
> report, and generate signatures. Without necessarily requiring ROT
> specific code.
>

What other than TPM quotes and signed SPDM message transcripts are you
trying to cover?

> This applies to SPDM as well, ultimately every SPDM user in the kernel
> should be able to get an attestation subystem cdev and flow through
> the same uAPI channels that PCIe TSM uses, also into systemd for
> measuring and logging.
>
> I'm looking at something like 7-10 ROT drivers just for the current
> set of NVIDIA ARM servers. Probably another ~5 for NVDIA non-ARM
> servers. Then a couple more down the road. It is alot of variety and
> today all this HW is largely unavailable through Linux.
>

If there are NDA'd docs to get more info on these, I'd like to work on
getting my eyes on them.
Are there some doc numbers I can ask my hardware engineering rep to
pull? They manage vendor engagement.
