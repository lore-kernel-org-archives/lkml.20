Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E02448B9A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792185467; cv=pass; b=JjSqSb+pYh8aRMv7HJo/LeQACCa7NRA6wdD356s9TJY8aP5+7eYhu25PO8gw0zRI/s6he/EeMDr4unSs8p7b/QP5dHhqBRCVJH2JXWll7CVRY2t0a+UejvUkBSEPkyUWPzPSxw67w+I/TOQHWBNVwEXVy6P9o+GrjWPbyK7fkAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792185467; c=relaxed/simple;
	bh=Xo4SuVAkwhUfmLEjXQw1rkMVGu6ZcsrZb6xQHUYm1Js=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PZrCr7va8nvWvwPlrN6OkGEjYebmGrgErrFUY/U8UM/Zzc4IjKNZ4tj9QgNET2KzdwlNCvRR6nMnu1na1L+VpF4NseCbEbYa1zKfwM434x7AjYgkjvrIFJwDURkx3FuYdsHqZEOeU3/Hdlp/BYefWbL/tn4Uwe3IrhQkgbREY6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ISVfacDC; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ISVfacDC"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso4117a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:17:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792185463; cv=none;
        d=google.com; s=arc-20260327;
        b=fCVB7LYmlqizRrQi7LgiG2Ix00QtepefZuYu/yawkxIp7CCzrhwQBDoqqUPbuWlN1X
         9ZhUTB24x0hvHqQiJ8IEbycrChse843vYkQolPE/CvQ4RyMaxpCjzy/oD5bX/gamgtBM
         vNnPvK5zHsQjAILsMixYVgyYm9+RnP7vfM95xJIod7BLghxzmWAneLDeeVGaon4xAoy+
         32HR6DUXcjJDd3AwsaGfuelmpvokCXheasnPdlQ4581/B8rZqVkAReHpKacEya9dzfIF
         8qZ7BoR0jtL6QDqCF13R+wtekh7vjXC0ofRnh401T5DJJj05ikJQShKt0WclsA3HSfGZ
         iOcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yqwdcpJ3cGMcIcxOWOSXEb4Qi+fpKcEZP2GPtydVxR8=;
        fh=Sdb0KOqB73bifKIbHzsz6Y4aIEm1O72fRD9nIOp40ws=;
        b=QVe323UDzD6aw4vKbpFI+Ium75mQhX038f2y9GzGbI9lg933PjMV8p3DPWqbNcIiah
         Ka988Z5QhGg+6NcwUp5hWeaLweUtr82N0efjLQSQuC+llto85BE8x7VtLg4azfoTvGVf
         vNUMR7ZN2fosu5txt/DEpz9Irn0t/P0C1z66wjn0ul93Tlv5kUib8b7YxO185WBbMJCc
         jnUuvTyZn3Ijn51HWQ9jhEzPB5dcDXzOauBUoqtrsVYqoqIEt3vPJ450KMr0vegTq368
         3I9XkCaQy+YLKUVSRFGrgpXf5xUkP+uU0ZQjGxK6bjwjO28jknztMPi/6mrQ7bHJIhVU
         LoKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792185463; x=1792790263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yqwdcpJ3cGMcIcxOWOSXEb4Qi+fpKcEZP2GPtydVxR8=;
        b=ISVfacDCRAqHPqVylxrybLLPcmeYtQnjjqciEg6dxeFKh6+vqPKIomkt3yXGg0+hu7
         uDbAKhiklrKycpqwGFHeZJ16Lqk316HGU5PBz5HdASamYJDDXoGN1J+QMjXQJqbf4/yn
         sII1Z/brxx/U2dOoFGUBNJ+ryghugz7UX40LSka32RkzaPpGPRE9QhV7TbheG/9Q/B2/
         aTQguSA9099iFijptro2iBIWNvhhrPVvdpG4lFaex/at5S1oLvAM7gqFRSHXThjQFVtx
         eeQa4mTNBgrQ56cPAHoIOgwYbwFMUbLjaPks9wQRy0gzyZfFhEWuS3nYU8gao6NvZEM2
         c/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792185463; x=1792790263;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yqwdcpJ3cGMcIcxOWOSXEb4Qi+fpKcEZP2GPtydVxR8=;
        b=rt18Cfv33/s5VrzWgwzoAneVb/mgkPYE19jsraBOju0Xc2IJYu3MezdiXYqVe+8dNP
         CMR+XeIqnJL4sPTVxooYI7q5GpwHQsP6Pi7qk+GC4G75dpznT9ZTspzAuf7+n4lXiPdf
         a1XiMcfuwHVgmd5PJiDWrr8FMvtPk2VN5rYlsCvXs+KTaDueZXRu3nKsoAQx51Ud0JgS
         LdV9rhlHjRHsuihEXuASrZZFgpBkGDWFEhZ83lupMho0wCRX2vj2iU/e15nShwh8AEdy
         9bzKI2BtFAdssei64UdgMSWOyLjdqYy9Ukbi2n5Co0dVVrVIgSrpiXiOw/tRz4WhQrMM
         ROjw==
X-Forwarded-Encrypted: i=1; AKwUvBw6SZlMo65qI7ZXIPda00F8Nodx53Hq/lzZdat6HKrV1DQ0HHmDJJ+DrLJyIuZh9e43Zrh3jndS5fwVN+U=@vger.kernel.org
X-Gm-Message-State: AFq9FYL035qLYDwzZjDDxAlyfVbJIIGqM4Mv+Y0V5Cx2NtVpjw5P5n5Q
	WXRtEWYHcDdup/nfCZdGrX47v/5fy6oG9b4Yv08O/YyaHtl9bkC+t8JK/KJ2R6ZY+EttnN769hp
	ph+OQgihZCJ+jn5B6jTMzGY3Vd5nFSJx489z62aV/
X-Gm-Gg: AYBFou2JkmsNFYjWr/JImLgWMf/3o8QrU9PZcDZKxi3V4SMfGwQd975MdjO0gUPr4G7
	8C+SJRscAfq884tnvfInmLeeLyochnIR83aei0/EkGsI1LuMALyJzVBGruTWhLjf+V5bqXcuuMs
	6HZFT/XoBx83taMBck2XvCV/cFSfV1L0GUNQ5gHS8rMW2G01jQRQh3uJFwOlUVX2QM9Pjg+9eT2
	/MKezbHfdXqbPumFu5qAzy25qh1e2ZhnL/bChqZA5krFPtY88S9UchFYeM0aKvjL2Db2jbknzJg
	vt7WWaBphVsbP+25/By/wY5aAoFY4uJmaXKvA7/0JvNQV12tgRqFIHsSSbCGJOcdbQulH94S/Bv
	f8qrEFym9sOpPcXFD/tn8ULs4YymPAy3AS0tL
X-Received: by 2002:a05:6402:a58b:20b0:6b1:c3f3:225 with SMTP id
 4fb4d7f45d1cf-6b3a8697d78mr22141a12.0.1792185462133; Fri, 16 Oct 2026
 14:17:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-27-yosry@kernel.org>
In-Reply-To: <20261012233638.2546339-27-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 16 Oct 2026 14:17:30 -0700
X-Gm-Features: AclHuK9F3IRSQWq-rRd2sfxk5IrJhnxcD3qf_KqHgb_kMW3Lv1Eba5dVyLI-W-o
Message-ID: <CALMp9eS8KDozNGT9J_uN69W32QEvTbg2JrtRqN0ESi00b_uq=A@mail.gmail.com>
Subject: Re: [PATCH v3 26/27] KVM: nSVM: Use different ASIDs for L1 and L2
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 4:37=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> Now that TLB flushes are properly handled and tracked for L1 vs L2
> ASIDs, allocate a separate new ASID for L2 for each vCPU, similar to how
> VMX handles VPIDs. Drop the unconditional flushes and syncs on nested
> transitions.
>
> L1 and L2 can now only share an ASID in two cases:
> - KVM runs out of ASIDs and uses the fallback ASID for both L1 and L2.
> - SEV VMs always use the same ASID for SEV-specific requirements.
>
> WARN if the ASID is shared otherwise.
>
> Initialize last_asid to 0, such that the L2 ASID is always flushed on
> first nested VM-Enter after it's allocated.
>
> On SEV VM migration, free the L2 ASID on the destination vCPU (if nested
> was already initialized) before overwriting it with the SEV ASID.
>
> On a Turin CPU, this results in 8-15% performance boost in CPUID rate
> microbenchmark [1] and netperf TCP_RR latency/throughput.
>
> [1] https://lore.kernel.org/kvm/20231109180646.2963718-1-khorenko@virtuoz=
zo.com/
>
> Signed-off-by: Yosry Ahmed <yosry@kernel.org>
> ---
>  arch/x86/kvm/svm/nested.c | 32 +++++++++++++++++++++++---------
>  arch/x86/kvm/svm/sev.c    |  6 ++++--
>  2 files changed, 27 insertions(+), 11 deletions(-)
>
> diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> index 4ffc10bf9232e..6fe68f2ae282d 100644
> --- a/arch/x86/kvm/svm/nested.c
> +++ b/arch/x86/kvm/svm/nested.c
> @@ -711,6 +711,10 @@ static void nested_svm_entry_tlb_flush(struct kvm_vc=
pu *vcpu)
>          * context is not tagged by the ASID, so the shadow NPTs cannot b=
e
>          * reused across different L2 ASIDs.
>          *
> +        * Note, last_asid is initialized as 0, so the first nested VM-En=
ter
> +        * after setting EFER.SVME will always flush the TLB to avoid usi=
ng
> +        * stale entries.
> +        *
>          * If L1 requested a full TLB flush for all ASIDs (including its =
own),
>          * L1's own ASID is also flushed on nested VM-Exit, before runnin=
g L1.
>          *
> @@ -727,12 +731,10 @@ static void nested_svm_entry_tlb_flush(struct kvm_v=
cpu *vcpu)
>          * If L1 and L2 share the same ASID in hardware (when using the f=
allback
>          * ASID for both, or for SEV guests), flush it on nested transiti=
ons.
>          */
> -       if (svm->asid =3D=3D svm->nested.asid02)
> +       if (svm->asid =3D=3D svm->nested.asid02) {
> +               WARN_ON_ONCE(svm->asid !=3D fallback_asid && !is_sev_gues=
t(vcpu));
>                 kvm_make_request(KVM_REQ_TLB_FLUSH_CURRENT, vcpu);
> -
> -       /* TODO: optimize unconditional TLB flush/MMU sync */
> -       kvm_make_request(KVM_REQ_MMU_SYNC, vcpu);
> -       kvm_make_request(KVM_REQ_TLB_FLUSH_CURRENT, vcpu);
> +       }

Per the APM, volume 2, Section 15.16.1, "TLB Flush":

> All TLB entries belonging to all ASIDs are flushed by SMI, RSM, MTRR modi=
fications, IORR modifications, and access to other system MSRs that affect =
address translation.

With two separate ASIDs and the unconditional flush removed, do we
flush both ASIDs in the above instances?

Moreover, does this change the semantics of PV TLB flush? In
record_steal_time(), we have:

if (st_preempted & KVM_VCPU_FLUSH_TLB)
        kvm_vcpu_flush_tlb_guest(vcpu);

IIUC, an idle vCPU that wakes into L2 will flush only L2's ASID. In
the past, with a shared ASID, L1's ASID was always flushed on emulated
VM-exit anyway. Now, L1's ASID will be unaffected. Though I can't find
any real documentation on PV TLB flush, it *seems* like the remote
vCPU would want L1's ASID to be flushed. OTOH, this change makes nSVM
behave just like nVMX.


Nit: with this change, the following stale comment in
svm_flush_tlb_asid() needs to be updated:

/*
* Flush only the current ASID even if the TLB flush was invoked via
* kvm_flush_remote_tlbs(). Although flushing remote TLBs requires all
* ASIDs to be flushed, KVM uses a single ASID for L1 and L2, and
* unconditionally does a TLB flush on both nested VM-Enter and nested
* VM-Exit (via kvm_mmu_reset_context()).
*/
