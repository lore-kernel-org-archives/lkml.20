Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E65F4A0EF6
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791840211; cv=pass; b=qyB3OwRN0kMudaQLG9iZDWVqUSg5Ms58VM1j4Sf4faSkVqyvFmZq+gjL904wFnda69zQuKQIQdZflKX0x1xNR9Rvyiua+LsTDJVm5n426+4A8TT0kmFVgZIqbq6hCEkoYjTNsmGfl091G8H6eP5g1DPBzj0vj5mfgroO4gC2sUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791840211; c=relaxed/simple;
	bh=M/ThXiHN1P68R+1YhMAmr597pKOSWjt23LCQQNjErlw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V4CA/ZCZ41m+2pq22QF+hCECRMn23fy34Ajwb80yAnr7FVx2DgKDuqZPz3gMSSHvk0n/n+FOmOqNhdghhkY2zB2nW5TqE/blyg4P4hl461U06JV/ZmxXknGt6STLRvdAX+3HYghhkkxNVu4Yz4LFUcxcwJMgnk9H+V1ypff+BIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YxyjDzyY; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YxyjDzyY"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so17623a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:23:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791840207; cv=none;
        d=google.com; s=arc-20260327;
        b=UNgrjiNHAGVoxvy7L+k/8J8BqREhjQbo2/xn1llpna6BIM/vk3KGbdWfmU+LBLbn68
         UsXUlK4cCKaMVh6tQuhz4J9Ak6CtCo54mVanwZxuTLKMALKplCGy6oWkfonlZhWTiIzA
         N1LQrqd0e4IJkWXfFATeSSJhLDFii/alUxjS0K1Q0RY7DrbF1Gs0dIJZfb1C2S93nYBN
         Ucf7xR4OMPc6G9RwiDW8H8ElZ9dXg9pW1I1reqnODB72Lj66Z9QUE1AP8mVZ26PQB3t7
         BOG4YO5pn6rf1XO+C50jTenvj4LOoYkIAEUn7I1oJ2z7cC5DpljIC0oO0HU/0hHmJnBG
         g5iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ee4DfkcYbf3IOngkIJrGviVyrMh0yvV16mhd+eYxirU=;
        fh=X9luluxhUFrqd3w/xjGWPWR76djtk0bDBQOEBBJjwC8=;
        b=KPBkcFMg77JY35FB3QLRanwsid9L/RX64d5jgFMtQM9b0hkXauBC/2eBpqmjWAECm7
         5FlMf8qG9uqf88YF+nSPfdKzBPK8Xc5ibJdzVGASvuH/Ixcq/WUvsazKRGNZeVDpvdep
         Awb0M7lp4J5vBw4GyiHz6JQqCc1iblxbV7E0t8jAKU+TXYwCr1CCsxXBnG9xNAbYD7yj
         I+bZHTTfZf7nsXo4T/W5X+VrrmcpMXrH7TVpj+6Pl/GGHo6wwGdcqnIDAtnoSt0OcqOg
         h/hRJqyHv6Zv6KIqZjbNbIcFnrhkYineycqPxDn9OtCYAjYrHUrKAiE74/2iOXucI6bO
         RsVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791840207; x=1792445007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ee4DfkcYbf3IOngkIJrGviVyrMh0yvV16mhd+eYxirU=;
        b=YxyjDzyYf6cnh0FGlyV4iPCczRMiNCHVZdq6ohQBqN6eDGCRuRPUDnWlsXdkEHzwt0
         tS5s1EAYYZYZjZ8Zq8XnqwSc7MDU1+7WMrUR6eGLaR8fkT96LOrmcchgTDd4TDn90xc+
         QXZH+ewhwhNumewH0GMLanH1ZmpBL95gIELragGoWu1RVWJm7py86QkQo6MLlT9qDz/u
         VqmcK0H9c8KRoZJLR+8JzXoWVE1ET895yQ1dnQ5K+d1RRDNg1ReLwRdBNfXsV+8r1uAN
         dF9XOSVVpwM5qBr/T110MiMC5saFB1LwOC4ls0+pHu4d1tXvxpMgjlnwoVLSwL5Ls5CI
         5TXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791840207; x=1792445007;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ee4DfkcYbf3IOngkIJrGviVyrMh0yvV16mhd+eYxirU=;
        b=1ymJutydv8bAsoFnYMjLnXF77bCp6bm3pLXqWjZiOM83D7D2KGyOWvxZefwfbJiJNw
         grWk5WNtJh2U1B1xlddKOqJo187QD/tsZwcsh1FKAaKEkkoCtepYRYo+8bwmELPhoUxj
         XGspgszdQnHTWG75pG3jjLvzLc+hFpvsInlpKmo3RYiSF0eHM5+AVjf5TlwF6XOJCH8Y
         /vKOCDZH8vuyaCuWs/OnUCDOjkSY/hZARTaKyTtvQzVvGeS1ZQ6VZsHKBhUDEJjqS4it
         FD1k/6oeNqNme9wTNOvi7grJfNxC6MoS4kVF82EM92IvN4vcEEkqPu8vfTUvyRglx4Ys
         TftA==
X-Forwarded-Encrypted: i=1; AKwUvBxE6nRVCWo2YRsHagCJAO09DrmfmHFryJgsLquYGUnvGFTWS3tPgyCM+0DG50fo8RPx2UbroRbEqZZrOd8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIO15ki9bHfK0wndkp3gegfLYAr73/d0wclEyJpZTOnT4WTFT79
	tebRwNbl8weI4bsETzxJfFFxUbYY7Hu3/pMdP9Lh3eTiLulCkpXwwBcd4YavK37Voor3WzGkkpU
	aB8k6uPtDIpXPqcLl3wSCO1oDKCO/ebRE3sJL5fey
X-Gm-Gg: AYBFou2wkbN7tLAH4962r2kxvhF2ITWnGBqxEW25ZQJTLtY1pOvq13CZHf/VmaWmB0R
	eWEAYQ++JyLk1cdiw1xsslB042kQ1xDKT7M1TK3zsvmg+cZ59ISemUogtgKsFd35PpGG0pAD6aY
	xDd0j+J+YGSoKcyvZNnckIpuh/LyQDHPiInnLr6+plCeteOFQAFpTODL1BbrC5M4+coxnvD5UNn
	TO+0xI8ySxp2YC3MFEv/hfzmxCwImrS1Gy+TkgZ1ik0UU4x/Dks4JzGTpIK08L/7Y2FVJXMALVS
	IfE7rO33T/+2bu2BZ7Y9CbjVGxqF8pMGj4d/Hwbg2NIBtPLjSyqwOCA=
X-Received: by 2002:a05:6402:a203:20b0:6a9:f353:ef65 with SMTP id
 4fb4d7f45d1cf-6b1988db8e0mr99917a12.5.1791840206242; Mon, 12 Oct 2026
 14:23:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005192431.87317-1-hmushi@amazon.co.uk> <20261005192431.87317-4-hmushi@amazon.co.uk>
In-Reply-To: <20261005192431.87317-4-hmushi@amazon.co.uk>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 12 Oct 2026 14:23:12 -0700
X-Gm-Features: AclHuK_0KBTsLrSFa-h9vss0cVbmlNZ4lJ9qkYRPDWcihjTkz5_I3EkMbPan9w4
Message-ID: <CALMp9eQz2ouQvFhBYv_R33_sUQ+ehxv__-f5iZ=_3aA2Guwy5w@mail.gmail.com>
Subject: Re: [PATCH 3/3] KVM: x86: hyper-v: Implement HvCallRestorePartitionTime
To: Mushahid Hussain <hmushi@amazon.co.uk>
Cc: kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	"K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, linux-hyperv@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nh-open-source@amazon.com, mushi.shar@gmail.com, 
	Todd Frederick <tfred@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 12:26=E2=80=AFPM Mushahid Hussain <hmushi@amazon.co.=
uk> wrote:
>
> A nested Hyper-V that sees the frequency MSRs lets its parent own
> the partition reference time. After a resume from hibernation it
> issues HvCallRestorePartitionTime (0x103) with the TSC and the
> reference counter it saved, and expects both clocks to continue
> from there. KVM rejected the hypercall. The guest time base stayed
> inconsistent and the root partition did not run.
>
> Restore both clocks in one pvclock update, so no vCPU runs with the
> new TSC and the old reference time. Each vCPU computes and writes its
> own TSC offset from the recorded step, so no other vCPU writes its
> TSC state. kvm_synchronize_tsc() writes the offset of the calling
> vCPU only. Mark the TSC page as changed by the guest, so it is
> recomputed even when TSC emulation control is set.
>
> The TLFS marks the hypercall, its input and CPUID 0x40000004 EAX
> bit 20 (RestoreTimeOnResume) as reserved. Microsoft's hvdef crate
> defines them (hypercall::RestorePartitionTime), and Microsoft's
> OHCL kernel carries the same C definitions in hvgdk_mini.h.
>
> Advertise bit 20 and gate the hypercall on it under
> KVM_CAP_HYPERV_ENFORCE_CPUID. Hyper-V offers hibernation to its root
> partition only when the parent sets this bit.
>
> Assisted-by: Claude:claude-fable-5.1
> Signed-off-by: Mushahid Hussain <hmushi@amazon.co.uk>
> ---

Aside from what Sashiko and David have already said...

> +static u64 kvm_hv_restore_partition_time(struct kvm_vcpu *vcpu,
> +                                        struct kvm_hv_hcall *hc)
> +{
> +       struct kvm_hv *hv =3D to_kvm_hv(vcpu->kvm);
> +       struct hv_input_restore_partition_time in;
> +
> +       BUILD_BUG_ON(sizeof(in) !=3D 32);
> +
> +       if (kvm_vcpu_read_guest(vcpu, hc->ingpa, &in, sizeof(in)))
> +               return HV_STATUS_INVALID_HYPERCALL_INPUT;

Nit: some validation checks are missing here. Per the TLFS, hypercall
input parameters must be 8-byte aligned and must not cross a page
boundary (cf. kvm_hvcall_signal_event()).

> +       if (in.reserved)
> +               return HV_STATUS_INVALID_HYPERCALL_INPUT;
> +       if (in.partition_id !=3D HV_PARTITION_ID_SELF)
> +               return HV_STATUS_INVALID_PARTITION_ID;
> +
> +       /* The guest asked for the step; recompute the TSC page as for it=
s own write. */
> +       mutex_lock(&hv->hv_lock);
> +       if (hv->hv_tsc_page & HV_X64_MSR_TSC_REFERENCE_ENABLE)
> +               hv->hv_tsc_page_status =3D HV_TSC_PAGE_GUEST_CHANGED;
> +       mutex_unlock(&hv->hv_lock);

I think there's a window here in which another vCPU can consume
HV_TSC_PAGE_GUEST_CHANGED before kvm_set_clock_and_tsc() steps the
clocks. If TSC emulation control is enabled,
kvm_hv_request_tsc_page_update() won't invalidate the resulting stale
TSC page.

> +       kvm_set_clock_and_tsc(vcpu->kvm, in.reference_time_in_100ns * 100=
, in.tsc);

When stepping the reference time forward, don't we have to recalculate
the hrtimer deadlines associated with armed synthetic timers?
Otherwise, those hrtimers will fire late.
