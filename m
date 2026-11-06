Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793925658;
	b=J0FF3I56ESZXGBJwWmsRkFpynuislgTmGeo0nWlYHB3rkKl7nTVAFkAmxSPm1QNgasPj
	 omVULv4ePyl2KBOebiuDFdK5Fb5RmxoH7rV+y61HjMi04u4YCUcBVEYt/KhRpuMgqPQoC
	 E1f9v45wGyIY8PVtygLQ4QJZ/wnJH3V2bOd14jS0YL8mGNfvgs14ZMxUz8sZ3AMahGH9f
	 Jp6yAFP/94enaWWXT50LFpjqVRDH/H2FfZcCd5uFilqle1/P/H+LsTapxgcrLVmn0Ezhq
	 dturp7kKfHIPNImFooqmIPqQuEZIGEoVuIJzKg/VssQ+rTp73CMDLRxJKlCVF7RIciQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793925658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NWW6VWRvfnKcgFIlw1Yh6tcTkZ0ARdGpxylaeqJx8hg=;
	b=bkjjgpTERVWhRsuQrN0SZWaucpw7Quax2GLAg3hgYBZd7l1co/pPBumlFYtY4+FGLxsu
	 Ik4c/+Kyx64k0B122Kg5TecWn1AZz7/yWnQTS+6opy2B9TNUJ8FaMKwrouF5qIO6H2FS9
	 QBzjMJAAxhxKNBCobMIvLvHBr4Vvdm4y0QbqE8NwSjs1JRYFnSeYzthvnzUmVpuakeH8H
	 T4zbHCfoUnpyldbT+EWZ73Z22S+GaQmyfsIfwZeDVX70fE9D1YYerjbN1ZKPtZ2BpxpY0
	 HJlfZH1e8eKD1utyGc9hZLPVdsIYe1i7agu/pbnUNyegQBNXtGUIr1tplRSTbWLvhPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fvdvi436;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4D8606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF4D8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fvdvi436
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b6966d9508so20a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:40:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793925656; cv=none;
        d=google.com; s=arc-20260327;
        b=kjYwvHoXPi3qvrJZBK1rhZtDxA8VNp4VlAcO3a/AtySAA3I2NqOZZk+k+Soyp2HtQJ
         M7It4ZCeeTYbrLNmefdjfdSFhjloUzftnkLHkP7WeqsYzUsw2AFCGPEazN4C4HSi+iea
         YfM5oq3pNzteAYVlOxSgQR5xFAjpZl6q7t4zHorbH2jOb/72Ju81YgoCzvEJfOwXMhT9
         HIMLJWF0vktMix3Xr3pcsKhr0FcRIQpQq/oTUBaJUSvsBKR02132udW+HvrSpJY5jLb2
         kBF6HFv7l/RTWiHUcjYIyr/cvigj1AzAqWIXFslCdWsx3Zk66F6tTvurmOUMmGeT//iw
         Mtlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NWW6VWRvfnKcgFIlw1Yh6tcTkZ0ARdGpxylaeqJx8hg=;
        fh=wNzp1F9cPvySlRwZ9dEl8uk3G4ILHypIuIUIvrrK4ww=;
        b=ZWIDHRgxENGu6IcYbI+pzY3cYMqW+LUZJD4k64ctUlA2LTeKPu/TJeccNc1cirSBRB
         LUGA+35t+mTiLZ7mmIsdg2qO2Rae5vJIAosQmIgsKcRugrerQZjKqWTl64ga2dKRM65L
         5PnAP1cHOeX+nSJOQgDdL4lU09JAsvBiUwwMVVuhez7uCIODBPXmzSWvmbQoQ4w+kURU
         YH7rdUEa6A9+SPI5nRdYBKgScgE27iUfndH8FNtlXv9b8fRkLRSo8b+OcvEM4uTV/Pzo
         uJBUXN79YaiKpWXwL1VNWOFAtE+wz2Aahpk1avWE1jN0hnOezqpVtYj5V34DKRXKSp3I
         OQnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793925656; x=1794530456; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NWW6VWRvfnKcgFIlw1Yh6tcTkZ0ARdGpxylaeqJx8hg=;
        b=fvdvi436qEqauV2hnhDmQVirJAqbX7yiljRe9cOvyeMaPEVMh2eDz1lenbawGE2ZwD
         7nICz7zL7xJq1VNJn1KzBqi2RzRWUTUd5j23vxjqnME7d5n3JmCMRfK2Jz6cbPFUkHGW
         JJqreYxj0zMKkDnTYEVldHl+NH8VkdhA/wYXf0D9iDHGZoDGG5Xkt7+ic1X8Ne3jjyui
         Gr3LTLhA9G4Hjl+exYc1rSLykY5LzBpL9IPfRrd4Y7vynHORBNwb2OT/5T3HOqJFtcB2
         8b7bP4Op1s1KC19DSn3v3YbWpdC+cj7sbJHijwxKTvOSjyB5yvBKizjm8qr5htCtGNO6
         Vn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793925656; x=1794530456;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NWW6VWRvfnKcgFIlw1Yh6tcTkZ0ARdGpxylaeqJx8hg=;
        b=bO2Ih1/ZO3HLmszUV4S1uk2+d8ePvuEBnPcdwmvCBlpjmkVhJk9s7kNAXndUjc02L5
         iS6z+CRG6CWvSHVG2QV5oLtnuuKc7oustXbU2KkAaTLvNtV7Iami7ePwcFG4W2R0BKmC
         4OYXvLvwmQf+i1CItY3P0MSMe+PH+5Sl9a+VAjCXX/oWK3oQ+yqXe5GPPasXD38a5648
         oGYBTJ+RU/0lgBQ/8v1/FguCOKds4oOQ1gPF5ETpI26Dodkri0+9o3auM5l5lx8xNVl4
         j2X0b4F0AXxMHpdJzAlMv0jKDQ6xy/PvN9N/j4JUKxIC2IA7te3ZzOI+GzB6E2j8Ilp2
         mPRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwt1YIUdDP5h6Sv1hroJAqfkKvjqyMXZ4W5NGwMQnSeJiVFDH1E9r38M4Pdq6x7UorNrmd+rKybHZnySuI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+408sgAXeNlXmMBBnCG3URKtLKUnUqStIWTCBhaEmCi1Sc9lT0
	1AFJrjsZtVdh3tSgP8bek0ACaG20975R01LdvJnXgqyBKULj398w5+we6hVwvuYo01yPXI620z+
	aLn/PlVsk4rWVbQ/0XjaqgQgMs2mD9vCNDxjKxw5V
X-Gm-Gg: AYBFou3xlikNkJJ7MoNiK1wV7VhhxrkZFEHq9GEOww1wXTuWxyXQ7s15GB7gqzopfPb
	NZRS9VA6gran1p7vQ0165lnCRpgHqoZxuGU2H73+LSK8/aRAJG8Gfm8php9D4EMsoLPKcOA3H+U
	pxUoKPN7Dieq8eLNKcwjCqfFNndjCftH5IQGWBrQFKh0iEGTxM2Jg+/3AEo54v2rQSK5RMM8+2g
	ROCkYGjuoUXpWlcMendWJSCp1uTuwFL1Qflo8PgkkeI+8whlFCz6o0VbXt5yRA9qsGDfKLt3PLv
	aMe3KOHalE1ezRcy/bMHuLfLq1f2COOi7lr5sSypCvpMgACDYe0zsdpPYKmDq87eZbVmfsaBA5S
	aAdMOrSnXPyp/vi6hhToipEvobEqqvDXKWfnNJ9mTuMTESe1ppagTUlBbPqKN/Gk1Yqn8WExsuh
	z9AX1eNSfdf9mCQNNXMKleQjuPDQ==
X-Received: by 2002:a05:6402:1806:b0:6b4:629a:6352 with SMTP id
 4fb4d7f45d1cf-6b597833cb7mr35960a12.5.1793925655384; Thu, 05 Nov 2026
 16:40:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930210750.1487547-1-chang.seok.bae@intel.com> <20260930210750.1487547-9-chang.seok.bae@intel.com>
In-Reply-To: <20260930210750.1487547-9-chang.seok.bae@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 5 Nov 2026 16:40:42 -0800
X-Gm-Features: AclHuK-4sGsbJMrfSl64kCcEOiMA7UjfuzawJTnrgKST2LlZsQ5qYXn3PXqPGmk
Message-ID: <CALMp9eTEd3jHNwh8M-xbtrTVD5-RgWuUDr=ZxRPWtL20_=WDQg@mail.gmail.com>
Subject: Re: [PATCH v8 08/20] KVM: VMX: Support instruction information extension
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 4:55=E2=80=AFPM Chang S. Bae <chang.seok.bae@intel.=
com> wrote:
>
> Define the VMCS field offset for the extended instruction information.
> Then, support 5-bit register indices retrieval from VMCS fields.
>
> Note the APX enumeration alone indicates the extension is available.
> For safety, do not assume that previously reserved bits were zero
> on older implementations.
>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Tested-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> Link: https://lore.kernel.org/aakEsXJgO-3m2xca@google.com
> ---
>
> Note for the review of extensions in following functions:
> +-------+------------------+------------------------------------+
> | Bits  | Field Name       | Related KVM Functions              |
> +=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> | 3:2   | ASIZE            | vmx_get_instr_info_addr_size()     |
> +-------+------------------+------------------------------------+
> | 4     | Mem/Reg (1=3D>reg) | vmx_get_instr_info_is_reg()        |
> +-------+------------------+------------------------------------+
> | 9:7   | Segment          | vmx_get_instr_info_seg_reg()       |
> +-------+------------------+------------------------------------+
> | 10    | IndexInvalid     | vmx_get_instr_info_base_reg()      |
> +-------+------------------+------------------------------------+
> | 11    | BaseInvalid      | vmx_get_instr_info_base_is_valid() |
> +-------+------------------+------------------------------------+
> | 20:16 | Reg1             | vmx_get_instr_info_reg()           |
> +-------+------------------+------------------------------------+
> | 28:24 | Index            | vmx_get_instr_info_index_reg()     |
> +-------+------------------+------------------------------------+
> | 36:32 | Base             | vmx_get_instr_info_base_reg()      |
> +-------+------------------+------------------------------------+
> | 44:40 | Reg2             | vmx_get_instr_info_reg2()          |
> +-------+------------------+------------------------------------+
>
> Reference:
>   APX Specification, Table 3.11 Extended Instruction-Information (EII)
>   VMCS Field
> ---
>  arch/x86/include/asm/vmx.h |  2 ++
>  arch/x86/kvm/vmx/vmx.h     | 42 +++++++++++++++++++++++++++-----------
>  2 files changed, 32 insertions(+), 12 deletions(-)
>
> diff --git a/arch/x86/include/asm/vmx.h b/arch/x86/include/asm/vmx.h
> index f98e40df5004..0b1e2353db3b 100644
> --- a/arch/x86/include/asm/vmx.h
> +++ b/arch/x86/include/asm/vmx.h
> @@ -277,6 +277,8 @@ enum vmcs_field {
>         PID_POINTER_TABLE_HIGH          =3D 0x00002043,
>         GUEST_PHYSICAL_ADDRESS          =3D 0x00002400,
>         GUEST_PHYSICAL_ADDRESS_HIGH     =3D 0x00002401,
> +       EXTENDED_INSTRUCTION_INFO       =3D 0x00002406,
> +       EXTENDED_INSTRUCTION_INFO_HIGH  =3D 0x00002407,
>         VMCS_LINK_POINTER               =3D 0x00002800,
>         VMCS_LINK_POINTER_HIGH          =3D 0x00002801,
>         GUEST_IA32_DEBUGCTL             =3D 0x00002802,
> diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
> index 863b08478544..4a76af613720 100644
> --- a/arch/x86/kvm/vmx/vmx.h
> +++ b/arch/x86/kvm/vmx/vmx.h
> @@ -330,9 +330,18 @@ static __always_inline unsigned long vmx_get_exit_qu=
al(struct kvm_vcpu *vcpu)
>         return vt->exit_qualification;
>  }
>
> +/*
> + * The APX enumeration guarantees the presence of the extended fields.
> + * The host CPUID bit alone is sufficient to rely on it.
> + */
> +static inline bool vmx_instr_info_extended(void)
> +{
> +       return cpu_feature_enabled(X86_FEATURE_APX);
> +}

Sashiko is not wrong. When KVM runs on top of Hyper-V with eVMCS enabled,
vmcs_read64() becomes evmcs_read64(). Because eVMCS v1 does not define a
mapping for EXTENDED_INSTRUCTION_INFO (0x2406) in vmcs_field_to_evmcs_1[],
get_evmcs_offset() triggers a WARN_ONCE() and evmcs_read64() returns 0 on
every instruction exit that calls vmx_get_instr_info(), even when APX is
not enabled for the guest.

Until eVMCS supports EXTENDED_INSTRUCTION_INFO, vmx_instr_info_extended()
must be predicated on !kvm_is_using_evmcs().

Moreover, enable_apx should be forced off when kvm_is_using_evmcs() is true=
.
