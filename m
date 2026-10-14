Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CA94ED190
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792022055; cv=pass; b=U5Vl4bi31USbI1c40FIg4DKKBS5zOjQXPq6VeJYT4yj0X5sG7MDIM4cMAzA0P+CpGu527pIogCmj3gjqDoOzs72Xe4UP37WHF//pwvSNlqBtWyTEtoJKEa16agMAr48eGy6kIhGQxtEKQRv9TXEYYxp4kwA1Pi9xMECGc3NExLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792022055; c=relaxed/simple;
	bh=4H0Bgva3Ydel0kL3mvgFhxMi1gLUgRSwy7ED0ZLa5xA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T51ZYrh7qTBgkyQsLSBPe9A7ucifXm4EZYPJ6CbCb/53Uksir185WEctLVbfTPgKkMwI3i/+8b2FACjghl3jz53VkO2cZRSwP+Bx3B9tqEv6k01+OFpyh/bly1X0uLz6O7l9zV8IAS3kqmrMUBVnhghdXC7hCdn/ALQhqYvXdV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X/mNh6m9; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X/mNh6m9"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso1328a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:54:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792022051; cv=none;
        d=google.com; s=arc-20260327;
        b=V9ZNfLeG9P9kqKNX/wQfKKPY6TDhe3X+gkqEUUT/6isNNxOVBNN/X01fZOfFRA6RYR
         6X6JfA2xPhy/gcpms/5D92JcP7d71SK+prWWqkVYfituh02esXrLEzGLal3xwTO9y7BZ
         q4B6enDQiYvz6kX9DkHnVfDTrYGWGokiU9Qd4MOfF8B+h1nX6h/9kwykadWoDLu5ZpkR
         HJGNG/EshnyS73jbTgt4fhLOWmOaN4jWxFE+vbxUNt0yXtnJBBQohXqL+Ni/EJVQpih6
         NfGuUFDmnOuoKMCucBKsVVp7tlRbs9hOuxnXu8K31u6FJpwOfXmUysDuTBpk7vcKMxd6
         jRtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=03x45p4Sm/ofaAJEtxKDi9izKZVyf4Piq/s/1arfqh8=;
        fh=3uC6jAtQh3N8JCJDW/WXNEK/RfwrAaoI60gBWFNIfTU=;
        b=dqUXewLu622HfAZsAAGeR1Ba/2NXfHxpsIAp9/wLcyDv2E+ZE/807u8BZwsmqeaMnz
         +YDExwPnN8bhj33DDOJQRJZ0cf0sn221vstf74Eg4bGEV6bTFre5z5SMyQeQhTbVT73y
         E1Zbjoon4fDHrTci+Gl5GAcDADKtng0P/J716a9x+atHrY7deiZVfWXJB65xj0EXjdqd
         U06us0ekFPs5Br3hSfznbjP46uTHyd0J80YdjdpIQW8dJkhr6wbTiPF3On2Tm/o+fn2q
         9LrxcNHdYL4JTbTGUEjuXSzLDl24SyDTkGpHr2gvWHqWT+wxXuI++DEc5wSDagscb5+6
         wn4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792022051; x=1792626851; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=03x45p4Sm/ofaAJEtxKDi9izKZVyf4Piq/s/1arfqh8=;
        b=X/mNh6m9o1A4Kg52ztKPG2Q0b1vwmhmjFPabBoSig0SbT0EqnwmAPEJxc4/XbO7RWN
         nMuZ+Q+Og/cj74I/qlxdPXyxVfarmKf5BLy0eZhHYsINwMcfVtuIGxdaVuA/vpsLFpNO
         CObGolVO8+ixXs7zTVUX5Bfc7MSFgjg+7FLCOe2cvrzkcZjAYOJVNfJcfnlMoJrj4bUC
         HHwprheWCMTPXKpU4yv4FkefxubG+RXouA0ddlE10vXgTZmsuveb8ehtmLorZAIpqqNR
         SNa5DDAj7u+TM9wODSsd5ZUKvg7WyrHc+LLlViaPjqgsdwqkmdD5Ec5gGN/Sz7QKPZr8
         JVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792022051; x=1792626851;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=03x45p4Sm/ofaAJEtxKDi9izKZVyf4Piq/s/1arfqh8=;
        b=zmyigeL/RYVupDQvCJv0SiH9IiyAtWWGZ0Q+XwFy1p6XjRF6sgH/FU+ffbV48cxC/2
         KGgmQSZ0BErj6pyMGEKZvurV+XAiRq6482w57UuIPmAdmm6Y1K/Ygu630l0FxHGgqcMw
         BGq9NUDkBCRi2qKxcBT2wa0s3gb2PnZ3sSgcXtD5yf1S86TudfFzOulfdgwHMUtIrUfe
         RUR9TTYMVVriVcVKD3/Nq3LUIMFTzadcE7RC+BQHm3fluq0XD61cMuYdnjTkxycgPFyl
         YSk1ZdSqRd/KDPGsXnTM4uDqbVT8UBkxT+OXD5i0ztQePxtsz7QXDRVaBU2K4VGs73Ci
         UERw==
X-Forwarded-Encrypted: i=1; AKwUvBywt2GJ9USv+46F3JZ98PY5MwdJZd30Ux62S/LvBqZ3GHzUO7YEK4BuO05YfoyG5DClkTZR23j7+rihX54=@vger.kernel.org
X-Gm-Message-State: AFq9FYKY3uN98PtM+dUrhk9SD3qSKCZTdf2QtjTrlzuYdq49VmrP/SNj
	EYiZlVG9tqLNsph2OVOXT/B2FGdbNgbh+MdF1Uw14W8a4ILNbsVLZemK8Kc9clHZHI3luB4lqGe
	Sc3pTMJM/aZYk/2J6Xbk0KXSsx/PcUwpFJGj/vPle
X-Gm-Gg: AYBFou0POvOeRf+x/pDJpwAyf2JhKvLSYnakTx3ISXKbPDEsx+Z21/pSPxht3Ri21HC
	aRCzxoqNtDiuUSMBcygYmHINaRAZxEHcwnnuF8VX0aTba+X1Xy/ug/kOtnmVDZVphWUYgQLDjOT
	Un9tZQwz5MD+cKssc9N3pWEPaBEDDHrTGS9mqgyysuqCTCGxyTR0rR36k873NmlyqGjg8EnQDnc
	BtTtZRmg4cN8UnEfK8GQOpJApWFUSds1UhuNyK2TbAKcYKkj7sghD3r7js1lla8viY9Lwfrqvsm
	TuypIMvi0FodH1KnaUJi6JcVG9ordTzQP4DpCD2ZoKbQQgm5JbaEQ8I=
X-Received: by 2002:a05:6402:a2c9:10b0:6ac:bd5c:9e2e with SMTP id
 4fb4d7f45d1cf-6b33387e2eemr4330a12.6.1792022051078; Wed, 14 Oct 2026 16:54:11
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008001425.2458927-1-yosry@kernel.org> <20261008001425.2458927-11-yosry@kernel.org>
In-Reply-To: <20261008001425.2458927-11-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 14 Oct 2026 16:53:58 -0700
X-Gm-Features: AclHuK8iHkRx3rLAQYnS_QgUQR8LswtkxfUo75oQKZHQFZ5tImcdhWen3PD54ok
Message-ID: <CALMp9eTE4DB7Ek4BiHheD-Jr_GjwhiFpcQNHco4uYKQvMbBvWQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/29] KVM: SVM: Use a static ASID per vCPU
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 5:14=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrote=
:
>
> Switch from dynamic ASID allocation to a static per-vCPU ASID.  The
> dynamic ASID allocation logic is now only effectively used when running
> out of ASIDs on a CPU (uncommon on modern hardware), or switching CPUs.
>
> The per-VMCB ASID generation is initialized to 0, which never matches the
> per-CPU ASID generation (bumped every time a CPU is enabled for
> virtualization). This leads to a TLB flush of the ASID on the first VMRUN=
,
> allocating a new ASID, and bumping the per-VMCB generation to match the
> per-CPU generation. The ASID remains static until one of the following:
>
> - The vCPU runs on a new CPU, in which case KVM resets the generation of
>   both VMCBs to allocate a new ASID on the new CPU.
>
> - KVM hits the maximum ASID on a CPU and increments the per-CPU ASID
>   generation, at which point all vCPUs on this CPU will allocate a new
>   ASID.
>
> - The CPU is re-enabled for virtualization (e.g. after CPU hotplug), at
>   which point the per-CPU generation is bumped and all vCPUs that
>   previously ran on it will allocate a new ASID.
>
> Drop the complexity and make the ASID static for each vCPU.  This makes
> SVM's handling of ASIDs closer to VMX's handling of VPIDs, and
> simplifies the code. It also completely avoids full TLB flushes (i.e.
> TLB_CONTROL_FLUSH_ALL_ASID) on systems with FlushByAsid.  Full flushes
> previously happened when updating the generation, so not so common, but
> should generally be avoided as they cause a VMRUN to invalidate the TLB
> entries for other VMs as well as the host.
>
> When a vCPU is migrated to a new physical CPU, flush the (now static)
> ASID instead of allocating a new one. This might cause extra TLB flushes
> when switching CPUs (compared to just using a new ASID), but odds are
> that the TLB is cold on the new CPU anyway.
>
> Static ASIDs also make the following fixes to the dynamic ASID
> allocation scheme unnecessary, so drop them:
>
> - Bumping the per-CPU generation when enabling virtualization on a CPU,
>   added by commit 25f744ffa0c8 ("KVM: SVM: Bump asid_generation on CPU
>   online to avoid ASID collision after hotplug").  A vCPU can no longer
>   run with an ASID that is (re)assigned to another vCPU.
>
> - Resetting the generation of both VMCBs on a CPU switch, added by
>   commit bf260dc9e7b8 ("KVM: SVM: Trigger new ASID allocation in both
>   VMCBs on pCPU switch").  An ASID is now owned by the same vCPU on all
>   CPUs, so a VMCB that misses a CPU switch can no longer end up using an
>   ASID owned by another vCPU on that CPU.
>
> - Tracking a pending full flush per-CPU (i.e. flush_all_asids), added by
>   commit 60d93c27859f ("KVM: SVM: Preserve TLB control (i.e. pending TLB
>   flush) on failed VMRUN").  The full flush on generation wraparound was
>   needed on behalf of all vCPUs on the CPU, as their ASIDs were about to
>   be recycled, so it had to be tracked per-CPU instead of in the VMCB of
>   the vCPU that happened to trigger the wraparound.  With static ASIDs,
>   TLB flushes are only needed for the vCPU's own ASID, so tracking them i=
n
>   the VMCB is sufficient, and a pending flush in the VMCB is still
>   preserved on a failed VMRUN.
>
> As using ASIDs cannot be disabled like VPIDs, allocate a fallback ASID
> to be shared by all vCPUs after running out of ASIDs (and flushed on
> every vCPU run, for now).  If a fallback ASID cannot be allocated, fail
> vCPU creation (for non-SEV guests), but do not fail SVM initialization,
> to allow for allocating all ASIDs for SEV (if at all possible).
>
> For SEV, the same ASID continues to be used by all vCPUs in a VM. Move
> svm->asid initialization from SEV-specific VMCB initialization to vCPU
> creation, such that svm->asid is always initialized on vCPU creation for
> both SEV and non-SEV vCPUs. This makes the logic simpler to follow, and
> makes it easier to hide it in allocate_asid() and free_asid() helpers.
> Decide whether to free an ASID based on the ASID range rather than the
> VM type, as an SEV VM's vCPUs may stop being SEV vCPUs (or vice versa)
> as a result of SEV VM migration.
>
> Keep the ASID initialization in sev_init_vmcb(), even though it's
> already done in init_vmcb(), to handle SEV VM migration.  svm->asid is
> already reinitialized on destination SEV VMs during migration before
> VMCB initialization, so the ASID ends up correctly in the VMCB.
> Additionally, free any existing non-SEV ASID on the destination vCPU
> before overwriting it, to avoid leaking ASIDs when creating vCPUs then
> migrating an SEV VM onto them.
>
> Note: A nice side-effect is reading the min/max ASIDs once during
> initialization, instead of once per-CPU.
>
> Signed-off-by: Yosry Ahmed <yosry@kernel.org>
> ---
>  arch/x86/kvm/svm/nested.c |  4 +-
>  arch/x86/kvm/svm/sev.c    |  7 +++-
>  arch/x86/kvm/svm/svm.c    | 79 +++++++++++++++------------------------
>  arch/x86/kvm/svm/svm.h    | 25 +++++++++----
>  4 files changed, 55 insertions(+), 60 deletions(-)
>

[ ... ]

> @@ -1375,6 +1370,12 @@ static int svm_vcpu_create(struct kvm_vcpu *vcpu)
>                 goto error_free_avic;
>         }
>
> +       svm->asid =3D allocate_asid(vcpu);
> +       if (!svm->asid) {
> +               err =3D -EINVAL;

It seems like -ENOSPC is more appropriate, and would make triaging
this failure easier.

> +               goto error_free_msrpm;
> +       }
