Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793657020;
	b=xfMTBg7Iz+S+OIMP8f4XuWgbZj5XPDv65mXk5usR0zn2lz7P0/GZRB0PqjBM3xUrTYhq
	 RMBmHHUjdfrf8TEsRA5Gp+jDQx6U1FFmnWE6O9OGQ9+d4H5AR6+pwGf3fxmV39CYJZTai
	 ha4sfKd/LZ5dq7/Cx4JEdN8ZSYuHHLGXQJQoSHoSvI7TtUsJgQ1Sk5mSDDVXoDVi6Ti+n
	 I24VbP28hAYZXdjaEnTliDhH9tzNRHcF7PkExCx7JahK/Mfu5JZ3Ik9zC052Q5PDq4LGz
	 z7z94OQqnttMmebXeZDewaVOFIlciPsFUbSByGNy7y9Ei3BfVjQ3qG0Np7Lx+XqrrKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rrfVG2EGCWVcNVqJJ0w+zoLBPZPkVLhQgz0OvfGHs+s=;
	b=uv3Xjr5jvZAzj91LsBa4HXk4HA2HmY3cpRBnMNdwH1Ido2WSPsVsNIU/hV209mTfUDFg
	 e/oEqtilcG/+mtA/bJBOjuCHgqfjekuucrWqldWiHReLk3kzzf2D8kqa+zb1D/xTGtLuq
	 0bKmqSHFSaa95/pDksZWtb7osIysmFimdap/1bRBPp+IEyyqe/QE4+c4TXTa+38/GkzML
	 6qSwqWSdCYgrviVf4irrKGGQVzeqdecWKGRueR2YcTk/kkPLIG6rEDhjIllSevGlOHDHr
	 ms/wAqKtNVIy/JrtyT699qnfNYYeMhZGnV0qkk1mYbwS5d20+WQSSM313ILMlTSXAPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eKIjyL9t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2AF606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF2AF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eKIjyL9t
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so3092a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:03:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793657018; cv=none;
        d=google.com; s=arc-20260327;
        b=pT82Pa2MFk84+mJ5atkzHiKmUszO9aTFvkAEIo0fBs30IQlRTx7Fpj5Za6NNHeq10f
         APJAmVWuL/FywXKS1LEd+l/lvDAZ4gzfrCI81Yoz3eI34I0zFtCWx72W8fhXAgWpHgAF
         yFwP5qPo84F/FQ4L6xpuK1fchvEjeduGRCRJV+dxVAFLaXZF1F83SpT095VF17DhXzpY
         4nkdZeSXRWwRqadUpTm5Gxa7qvRz+Y6ele/RpsO2OzXWepBtXlfv8Qs37Kf6CSNy8AoE
         o14LixJBUqdEkIe7KK6pprPddazlxmXFqQsmLiWA3M8vnjLv9DyVqBypfjQby5Az0u8R
         DGMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rrfVG2EGCWVcNVqJJ0w+zoLBPZPkVLhQgz0OvfGHs+s=;
        fh=U43Ga9dTt1MAamj/QxxKmte9cOomEUhQGsQrlQ40JGs=;
        b=F5HT1dROCqSpMfEKaLad/mUkcHlUaip0KtgDZzPmsi6XUfPd1mj7foCcsNsWF6F8jk
         LgBqzfGfurErxQTX7hmTg3DqfRkVu/FxpuCq5U5g+HfB3aVLnr7IYk8BcCYlkxDKbP5t
         WgqnjDR+Z1KvCiJ5xDy6YJEY4gdpSlGlPxEPqnux4dBg0xoC2fV9zVe9NNaqRYg7fuTb
         S0H1U54R/sybjjC8FU6QuHFUijQA1ilqDgdlpCvfunVMDu3PwqyroSsuqkNskFYntAc0
         KSVJTjxhU/BLNXQWz3oIJTkXAvLC3o6wwEnOu/oMkTUM2iY9IszF9N0xfSQcGEw6eVlb
         tLGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793657018; x=1794261818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rrfVG2EGCWVcNVqJJ0w+zoLBPZPkVLhQgz0OvfGHs+s=;
        b=eKIjyL9tJJgkUM84z/AEYuKFdq2F89MguOg4/JVV770xf+cFqZnUOCaDRGoGs17CVK
         5LsH3tiIEzTZrwgawdNY/w/0rnY1/NNaBZUDy13IjciYwldh5bZov4HLLdr/VTUqxe50
         WIpzFdEtlxh7vlkRwrK2NbO/Dm//tNglyyJ7bzZgaGwUwgRRV5oMpsKtl9RA3inBJuG1
         AbSeB2f5on544dmM+ku70U8aTDcmI+TX80ZvCRJVCjx3w1EyLvs8wdqT9a2Ga9mYhwZm
         bHfRrTu2gSB5GCI46FK0Y22BQRXK4p7A8dFCIIWFFGB+uhp8r3AkeZwNcuTITCDriyYu
         3R5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657018; x=1794261818;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rrfVG2EGCWVcNVqJJ0w+zoLBPZPkVLhQgz0OvfGHs+s=;
        b=w0G9FdNnrHgS/a3SWNPg3rs77JnRE3P0qu3w/8oaOJcho3Jy9C+eEU+nIok23GI+qC
         62asGpKNebAxKFEfcExhZB5kUFMm1Hk182VlOxM7I+d4UoRLbayCnPlJxLxPG7ljyoD5
         lCIeSLFiCFaFQuUDqCjLwOBy0FfCvDeqXld/SiaTLpjxVxt+9copEzvp+gwY1yG/sMqn
         AdfhKgL2N6uEXi8lNAD+6EFcwib5r2pfaqDWzQ5ixepgrYF+0+UlekFrqOQQ+w9fYZs1
         aYMFr/rt8H9BWeWiEGfvGBzE2AEV2v38Cc92cpRB7wDB+VhGu3nwXNaF2xjIWr2ECjK2
         /hWA==
X-Forwarded-Encrypted: i=1; AKwUvBx13x2Wn6RThWT/4q06vjLTKGLAL2EZCCop2LpkljecP2w8JxAmmg0pgDtdbCh2hDyg59kwShqRcbdNd7w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LRwPAhh91/U6K7ItTpoY9BvsEUdn0VXf1BXdNiqQiVFlOxhUo
	kqspDTrsG2vLJoruiqV+kcciHTRLeOco9vGaVuIb8Q9sOjUTXBRDI+0NVB6oklK0jRQDQILSsq3
	eK5wSMETg1G3iCcR5hOKFAVNbkZgQdUSzd59Sb/xaTcMHTDwVIyAoh640iR8=
X-Gm-Gg: AYBFou1XaOMopzhMINelOFMFaHQnfBoKZrOGFEeKZQgAqiVw+/APa7qFaiu+JGhVgPZ
	RtugUeiXY2L47L8n0+UzTmBJh43rcrWIs9tT4c34IiV6ebaQ4CiIPRlur7Z6Z/6R8XN3m7vboHi
	yQV3KngYsHXuBxu/6ekTLCevtPurQist7+1HUWIcBdnVKVzY9Pz7jh2FR/skM4MlPPl5gAKv5N/
	Z+pSmX4QCibk2UvCBL9oadIe80Uyr8i3g5bfWRHlK1zBmX2o6pr0ASRa49GQQddL60oJZdv9RL6
	Fbd3gWK0Wkf3idevzGgWbM3llbXUjBHCSAGB8at/dlHQJFDBWsWCdqCvqDYx6nZWibIbS7Plaii
	fRbC/IeOUzSSTp3hrCrr7QRqaEgqLmP9O8lWjyA==
X-Received: by 2002:a05:6402:2750:b0:6a6:7dff:61ab with SMTP id
 4fb4d7f45d1cf-6b53e7796a1mr3987a12.15.1793657017608; Mon, 02 Nov 2026
 14:03:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030212112.2598640-1-seanjc@google.com> <20261030212112.2598640-3-seanjc@google.com>
In-Reply-To: <20261030212112.2598640-3-seanjc@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 2 Nov 2026 14:03:25 -0800
X-Gm-Features: AclHuK_pbmXvVHoGFvB48dY3tOJxijbO3CKujkx_4ml0ueoZxbb4z5FYesg9juM
Message-ID: <CALMp9eR-di2U5QZzDHh7CjnVg20ZnBcTBu0CKbbWh9QCxYiJdQ@mail.gmail.com>
Subject: Re: [PATCH v4 02/23] KVM: nVMX: Don't force a full nested VM-Exit
 when destroying a vCPU
To: Sean Christopherson <seanjc@google.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, James Houghton <jthoughton@google.com>, 
	Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 2:21=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> For all intents and purposes, revert commit b4b65b5642d6 ("KVM: x86: clea=
nup
> freeing of nested state") and go back to manually tearing down nested sta=
te
> when freeing a vCPU.
>
> When a vCPU is destroyed while L2 is active, KVM synthesizes a nested
> VM-Exit, which flushes the cached shadow VMCS12 back to guest memory:
>
>   vmx_vcpu_free()
>   |-> nested_vmx_free_vcpu()
>       |-> vmx_leave_nested()
>           |-> nested_vmx_vmexit(vcpu, -1, 0, 0)
>               |-> nested_flush_cached_shadow_vmcs12()
>                   |-> kvm_write_guest_cached()
>                       |-> __copy_to_user(ghc->hva, ...)
>
> Accessing user memory via a memslot during VM destruction is broken, as
> there are no guarantees that current->mm =3D=3D kvm->mm when the VM is dy=
ing,
> because the last reference to the VM can be put from a different process
> than the original creating processes.
>
> And even if the original process does put the final reference, during
> process exit, do_exit() calls exit_mm() before closing file descriptors, =
so
> vCPU destruction runs with current->mm =3D=3D NULL on a borrowed lazy TLB
> active_mm.  If the borrowed address space has a writable mapping at the
> to-be-written userspace address, KVM will corrupt an unrelated task's
> memory since uaccess APIs, including __copy_to_user(), don't sanity check
> current->mm (and *can't* sanity perform KVM's current->mm =3D=3D kvm->mm =
check

s/sanity//

> since that is firmly a KVM-only concept).
>
> Furthermore, the shadow VMCS flaw is only the tip of the iceberg, as the
> MSR load/store lists mean that emulating a nested VM-Exit can read or wri=
te
> an arbitrary set of MSRs, e.g. if MSR_KVM_SYSTEM_TIME_NEW is in L1's MSR
> load list:
>
>       kvm_arch_vcpu_destroy()
>         kvmclock_reset() - takes pv_time off kvm->gpc_list
>         vmx_vcpu_free()
>           nested_vmx_free_vcpu()
>             vmx_leave_nested()
>               nested_vmx_vmexit()
>                 __nested_vmx_vmexit()
>                   load_vmcs12_host_state()
>                     nested_vmx_load_msr() - writes the MSRs that L1 liste=
d
>                   kvm_cpu_has_injectable_intr() - reads Xen's vcpu_info
>         kvm_xen_destroy_vcpu() - deactivates the vcpu_info cache
>
> processing the MSR write puts the "pv_time" cache back on kvm->gpc_list,
> and the next list_del() writes into the freed vCPU.  And as effectively
> pointed out by syzbot[*], attempting to fix each case individually is a
> losing game of whack-a-mole.
>
> Deliberately leave "nested_run_pending" as-is, because even though doing =
so
> creates potentitally inconsistent state, KVM should *never* consume said

s/potentitally/potentially/

> state while freeing a vCPU.  I.e. if leaving nested_run_pending set trips=
 a
> sanity check or bug, then that just means there's more fixing to be done.
>
> Open code only the "free vCPU" path, i.e. keep emulating a nested VM-Exit
> when forcing a vCPU out of L2 via vmx_leave_nested(), as there are a numb=
er
> of updates buried in the nested VM-Exit flow that are needed if the vCPU =
is
> going to run in L1, e.g. clearing pending exceptions and MTF traps, setti=
ng
> the TSC offset+scale information back to L1, and so on and so forth.  Not=
e,
> this means svm_leave_nested() is all but guaranteed to be buggy, but that=
's
> basically an open secret at this point and at least any bugs "only" break
> L1, i.e. don't corrupt host state as is the case for abusing nested VM-Ex=
it
> when freeing a vCPU.
>
> Link: https://lore.kernel.org/all/6ac0145f.34119e79.2f92f3.0003.GAE@googl=
e.com [*]
> Fixes: b4b65b5642d6 ("KVM: x86: cleanup freeing of nested state")
> Cc: stable@vger.kernel.org
> Co-developed-by: Chris Mason <mason@kernel.org>
> Signed-off-by: Chris Mason <mason@kernel.org>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
