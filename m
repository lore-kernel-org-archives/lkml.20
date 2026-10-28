Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793197559;
	b=K8AXCA4jq4PuIVfSjpV+RzoDlcHYirsAUw5LgIGOZba+AQUHJNQBvS2VB9dVXYcs1odk
	 Qsz3Lt+VTmNaz5zXnxJ4Au9Zh8hDreX64vu2a+/hWKQVCpZFd87fpkPEdUmqw5DZhsohh
	 uWqXK101q8ySmTCodHmocqfbCWCF91fcm4dynhMaeZmsf4DixLF5mB/6zxWaiDUPxh7eL
	 Q4cyx0mobs67FSBfFBT0xtoS3hagUgOYP+WkU+VrUibQR+APPhMDzpH0GIKvoG3J8Pgms
	 6IE0i7/WH3tnJRh33vXzR4VQQ/roWZv3uHwmTeV0bMX8YDTlznCKkfkoodlpayt6vow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sVJnEkkaWyS3Mhu2w9u2jCkAacOtPK3HyLqTOhRVQ6A=;
	b=JryrI8crdUlHKy0/fQTCTxXehUUiARML4mQu69Izb7B+IgoFTUSw0SHRlF0ruXxHdhY9
	 yBI0/0TFHVu2ihLaze2C+MzHtaKudR3qpOZPn5tk/SzuFgfFObmgLlL2Q/m+wDpBkZbI+
	 E1qFxeSCRSDSHctcOKcA+3ANbOU9+U/voTHifNDk/puMKAOJFaDsROsdYw3dfHE5cHuvf
	 lxzJb/R5aXu2XFwwjU1hRwyamZqC4uwwC+aAeiYAEStZ7acc/WDofYl0yJXxhjoBP6OUd
	 ucA7itjfBda34zd3C5e8hzTmaxaDiSA5T+c94Mq9MrClUwFudNE0QXkv3xTjIUjb9gA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=brD7IDE9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C663606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C663606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=brD7IDE9
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5383c97c8cfso296371cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:25:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793197558; cv=none;
        d=google.com; s=arc-20260327;
        b=oh4gpAscvL1+CqDIMxmQ+nrFjqGMXLTJ37rs5o19kmPQLhoFTALa8oPhI8cN22dEl4
         xj0XpEjxCm1bJB1HnI/F+dKdjoHsaO8b+sV1mbaOQRwazH9txG2njO4mixYJILOU8yCr
         6UjI3kXjxxJpWZVRM+A57EUq00tm0XDKk7MImDYugkq7M3wquz/4b1Y3MjLLVQivhKPd
         KBuWdloTKYoFp1nmgxCmo3GNSXjQogweWH+tScvaclRoG2yWE+0QI/h5oMIsa03X8FBS
         Pzgjuzwycr6MQ64Vbf1kRIje8pC9hjnnj/cXfpda5/grQvTaHHrycvXDGs2J4MDSWxjW
         8hVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sVJnEkkaWyS3Mhu2w9u2jCkAacOtPK3HyLqTOhRVQ6A=;
        fh=0dIi55RB0ERLGYPh6pOU5QakBoxHZXiyAlQpE4hsNMA=;
        b=ZUf3n1Azb2vGjC+NUgL05Z/lwax7PddqJZF8cid049gwXTdsmlKW9+ms8y3wMycTp9
         2vCABmyH+2awsjKs9lbad1yRglMon1mqGrZ+YUupo7L9tAzfxgdGXMgyqKeucuDiJwg2
         j/JUUufHrrVOyi/sB9qJXRpnRqhiS2JcOBMWIi3aKZYq+yJ3JxTdFYLEK9IPi+YkH5cp
         O9OMmqbxKfqrnIARHf8XuHZzBGINyZXef89FlWTEprjIho0GSOTNhlPwRJxZIHGK5zyO
         t83W5K+jLQhksnBtR2Ftk0B7ekrRM+Sib9HhuitfQyWUfqkTtH+NHd42B0Dmbr5VsT1r
         0f8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793197558; x=1793802358; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sVJnEkkaWyS3Mhu2w9u2jCkAacOtPK3HyLqTOhRVQ6A=;
        b=brD7IDE947T6D/aBrnEkNLot/JQlZs1GDnEQ7U3EJeTPft6utw7s83SMHXvYfrsBQZ
         rveD2dexzb2bgX/rWhFpFI1P5WcMQeHB/7VYsKX4v3PKVWxntAodR01hVDiVjtb3FaMB
         1IBFQqddxh2XsiAnmEvq442JYGPuZKxITaWXwcpfEOdqW+j/AvtWFl1cPCfYac4wP9Lo
         8TchXfRV76Y+TKxwfE4ZfewLzsv9uf9nWhhyNxgm7Kfy6LzdWjUfWrbgjH4YF4cmWMjC
         QtoyDn7yHZoljGbzUc+jFJCKWtUts86AZF3HWGbDMcLBAqlYnyOuGhjHb7UN4KpnmX0Y
         WkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197558; x=1793802358;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sVJnEkkaWyS3Mhu2w9u2jCkAacOtPK3HyLqTOhRVQ6A=;
        b=sk6QYdmHh04hCjmfmMqtv0XHEYW9cf548UawhLR6Fp8LYq44tBqDhtjeg0xo/OoMLf
         Hn6KOOuRKlSlko8nIJ4eE6Ez5Qb6AVJU/cwpUA5ML+n2YDgTslsledArjTmOX9OlXRei
         DcmcdNFbWmHs0KJW6wKF+cdh8Fjig6dXSjK2m3ArgWWqQFfI3NwHhdU2P6pJA9NuZoWp
         w+PueikdPcEb5OgLy7l8uG9UJlORed/K+r9qABQCXgrq62eriY1yhucN4OevyRYA9Nrv
         BQdQ8vaIE9xv54zTREf3do9WHd9yDO7/t07ctrY4HMfl8f6tQ3VHYwhG5PffX34oUx0I
         mcMw==
X-Forwarded-Encrypted: i=1; AKwUvBwlh8DtOCpU5Dr3dbj29e2SiGvU0fahbnHTgnqt5QzKgXT9Py35JM6JIW0LJm1NPfAXdMZJQb+ff2z62PQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrsB/bWgV4HzplQyZ1ptYbwb9lhnu91zrrHUYEABMgy+3Ipdeu
	CtzZk/EGlys6ZIo8hLTKvsBpSm6ZV+K4N6n5aGSfmY6nA7BX6jTkXf0FH3EhYVraYj9DoGXch1j
	pIMYd0FM+mtvH9+O19fqA/xXBrv3EnhfpUkbweiL7
X-Gm-Gg: AYBFou34tcugVhWO/epozqzRfTOTJOPoMfZu1I52pyu/ZRPYvX/TIoaQJOesq1whDhr
	NAg0PSdQY26kL4nwWs3yTWtavw1kWT5Ih58olPz9D2W/y8MjEXmBcS6gHCw4sCmhbPb9yCVzsAJ
	y6Y7eXnW31Fv3eBbKsCefwJcPVsoIJYD/wewLaShqrxm9Rpi24UKJNWqSXJEUZOrep/sFKmyF3L
	XDTBqBiKSqrqTClm9BCECjUoU0GOVlbx6rYonoykBq48MMkCxCv09iiEqREIN6Gp5azBplGEhWn
	AtUStGAl8wJj3kJwzkmWdTgbuAS0Pu6TPBoCuME6m3IWegcBdBZMARfxE3ppwYDwY7iWqrzXh5o
	A9WcSMS53XltXshAJjtNIeP8zqy04r0HuFrun
X-Received: by 2002:a05:622a:4c1a:b0:536:3ee4:81cd with SMTP id
 d75a77b69052e-53ff26f72f0mr18093951cf.4.1793197557717; Wed, 28 Oct 2026
 07:25:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260827223755.143247-1-zide.chen@intel.com> <20260827223755.143247-5-zide.chen@intel.com>
In-Reply-To: <20260827223755.143247-5-zide.chen@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 28 Oct 2026 07:25:44 -0700
X-Gm-Features: AclHuK-xtYfw983mE5Q7smgMFsswwoQHfGy-LeJFK4rz25_4O2Brshc8dDEycC8
Message-ID: <CALMp9eTq-yPoQwwoEFPYLqvLNc_2n-4kGbnZ=x=-ZAJjyOrvnw@mail.gmail.com>
Subject: Re: [PATCH v2 04/16] KVM: x86/pmu: Gate BUFFER_OVF reserved bit on
 guest DS
To: Zide Chen <zide.chen@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, 
	Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 3:49=E2=80=AFPM Zide Chen <zide.chen@intel.com> wro=
te:
>
> global_status_rsvd unconditionally clears GLOBAL_STATUS_BUFFER_OVF
> (bit 62), even when the guest does not have X86_FEATURE_DS feature.
> Clear it only when guest_cpu_cap_has(vcpu, X86_FEATURE_DS), matching
> hardware behavior.
>
> Fixes: f5132b01386b ("KVM: Expose a version 2 architectural PMU to a gues=
ts")
> Signed-off-by: Zide Chen <zide.chen@intel.com>
> ---
> v2: new patch.
> ---
>  arch/x86/kvm/vmx/pmu_intel.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
> index 11c9161dc853..9fdae437e569 100644
> --- a/arch/x86/kvm/vmx/pmu_intel.c
> +++ b/arch/x86/kvm/vmx/pmu_intel.c
> @@ -576,8 +576,16 @@ static void intel_pmu_refresh(struct kvm_vcpu *vcpu)
>                          ((BIT_ULL(pmu->nr_arch_fixed_counters) - 1) << K=
VM_FIXED_PMC_BASE_IDX));
>         pmu->global_ctrl_rsvd =3D counter_rsvd;
>
> -       pmu->global_status_rsvd =3D pmu->global_ctrl_rsvd
> -                       & ~(GLOBAL_STATUS_BUFFER_OVF | GLOBAL_STATUS_COND=
_CHG);
> +       /*
> +        * Layout of bits 48:0 in IA32_PERF_GLOBAL_CTRL is identical to
> +        * IA32_PERF_GLOBAL_STATUS, but IA32_PERF_GLOBAL_STATUS has addit=
ional
> +        * bits.
> +        */
> +       pmu->global_status_rsvd =3D pmu->global_ctrl_rsvd;
> +       if (guest_cpu_cap_has(vcpu, X86_FEATURE_DS))
> +               pmu->global_status_rsvd &=3D ~GLOBAL_STATUS_BUFFER_OVF;

According to Intel SDM Vol. 4, Table 2-2 ("IA-32 Architectural MSRs"), bit
62 (OvfBuf / ClrOvfBuf) in IA32_PERF_GLOBAL_STATUS (0x38e) and
IA32_PERF_GLOBAL_STATUS_RESET (0x390) is supported "If CPUID.0AH:EAX[7:0] >
0", and bit 62 (Set OvfBuf) in IA32_PERF_GLOBAL_STATUS_SET (0x391) is
supported "If CPUID.0AH:EAX[7:0] > 3". Though it makes some sense, a
dependency on CPUID.01H:EDX.DS[bit 21] is not documented in the SDM.

In mediated PMU mode, vmx_pebs_supported() is false, so KVM clears
X86_FEATURE_DS for mediated PMU guests. However, when PMU global controls
don't have to be intercepted, MSR_CORE_PERF_GLOBAL_STATUS,
MSR_CORE_PERF_GLOBAL_OVF_CTRL, and MSR_CORE_PERF_GLOBAL_STATUS_SET are
passed through directly to the guest. Hardware certainly allows bit 62 to
be written to IA32_PERF_GLOBAL_OVF_CTRL or IA32_PERF_GLOBAL_STATUS_SET.

If a guest sets bit 62 in hardware via IA32_PERF_GLOBAL_STATUS_SET,
intel_mediated_pmu_put() will save bit 62 into pmu->global_status, and
subsequent KVM_SET_MSRS(MSR_CORE_PERF_GLOBAL_STATUS) or intercepted writes
to MSR_CORE_PERF_GLOBAL_OVF_CTRL will fail the pmu->global_status_rsvd
check.

Essentially, this means that we can't pass through the PMU global controls
unless their reserved bits match hardware.
