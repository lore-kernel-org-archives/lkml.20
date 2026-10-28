Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793223014;
	b=RUspQH0MOYskE7clfIrQh/Na+gKPmWozTj/4mBg0OYardQp+Vr6tYLOa7eSJYCGASw/D
	 7b/o2iyYf++3EW0kq7m43YcQw4E6jD+twNjx3Lz2z/lQm6mCPYMPWskEG6shP839Nl1sq
	 JOXzTaTj/kMKCH3jPrpXGvE5ZSNk8VBD3bHuPCYJ9ACWz1DXf/bO/W0GkmaA1Fa9AOfZH
	 vVBmpsCwOmjYb/1aNv9oyO9ZdtYiA4MQGKnn83d681Njt/6UiMdNYyty2Oi07wduNzcCx
	 yOc7zOKI/c9FoVAJwQJ1KPZm9uSxB4eXEb6mjiCmwde/hPLE6+eNqyfbE57E1HC8COQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793223014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=f/iuDxmqrMhl1VYOTXsTvpTzJ5X7HX9OcrfeaMqu1fU=;
	b=H4aZfayx3yNwCW/UPz2E7jDrwsI8NcphhGIwFaxnkBcDpfA29LpV53VQtWa3+8iHWcsk
	 u7AbcOFhGqnUrQdO8kCbLepwMwEpAcFNe3aDDvOVUhVEmtjLcIVUpWkW0Ns37yW2KaaOF
	 vKECSU4gkPKKyVH3jzC/VMS8tMy8P+O9+dcZEsXxSZt8jm7G5rZRrXO/4+EPPVwugu/PG
	 YcXuG1rlNVJ6WtKB0V3pR+MV7ppKVWtaRXEt0H9FkZNP8pv+RZV3IM1iCziB+Za6g0BX0
	 qsAJ7Dkor8lg8pGW5JjlWUjMQZ2BwGGfLtAIVmaYpR+f7MnpNHlmRl7Weg5jNYqMATQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="d9vz7P/k";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00791606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00791606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d9vz7P/k
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-533202fe429so107011cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:30:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793223013; cv=none;
        d=google.com; s=arc-20260327;
        b=VBZdPcDuD9h4Z2xrE1wT0YqLZoaxII665o2Qv1IE51Uh1A+NOBOjLszYQAOhzxSTwa
         E10d1Q0mHtRefkZ2SV73s7NMbpFPCeZWldU/PZNrpHbU5pgAlffo1vSFzf49DmZLszEk
         LoGQzpjAdEP9XD1hU0fXIQZV6iQhzJgEpIX//wFfQm4yeyuPjBFY+S+Fq8/H7cSu/DL4
         NlM8ragTL7s+GoLAIu4EldJu6kQIWjOKl/ugTO8Y23GocAZvTV1fVg/dMq+3i1tVzCRz
         xpM5TQ52chN8NgwnZ+lkPaivQD1CRH6Uy0afuO3GOJaFWsVu360HsS5v7K/gui5TZ6/V
         NLrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f/iuDxmqrMhl1VYOTXsTvpTzJ5X7HX9OcrfeaMqu1fU=;
        fh=VhnhYYvfxTMaq11Ixg+L1QZgqF5zVKtDCjS3lf+dlz4=;
        b=npNxQYoWeo1hldXt8o5k8yQ8pUwcRY+Wmc0F+CTTSuTknksfNejc+KiIln6v4K73s6
         WDng/5eh6NRs6IZcN8YoJCx0Dk88BH6j0aqompejkALXmOAJriQQfrYmmhcmGzBYraX6
         l5eT74qoQ+m14uCjqi9Seo3ARfYMbGyfU3K01Bctpl0rz5ao4zxS+0IOCQva/U8lGBj9
         mkz/aNHj+1AKmu93rDes60ycb68Dr6SM2sSoJQi2k5xQiPfMlL+WbuDg6JZ/byeflpOn
         8jJFI+1RJAAXYaeWF7MkvFl4FK+EhMSKhAqqq14JGXwzgEM7guVLg/L5koCMlZVjv4Tb
         36Og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793223013; x=1793827813; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f/iuDxmqrMhl1VYOTXsTvpTzJ5X7HX9OcrfeaMqu1fU=;
        b=d9vz7P/kZsRdWzQMueEQu7hgoDTHyZsYXDaAprTmxt5bZZ2pFNNNetqD3Uk/VuJTAl
         bixqckmvrn+TLsxSytAyjcpXSW2uvyJa0JicafLN5M2p0eSmDD0yts3eAcaDztvynoU2
         0QPdaRefu3W3eD4wDhHzczRk2f9/opD8qNUkUHX6+kRJLOTMP5Zl+ieCgiR+FYtmjd0y
         H2QNPGJtWoSGHhLAF8A+ZgAvMwEYL8sBPZxJKsZMJuaKieIBwr4oRSmNvTdN0oneIZwH
         YDlUkK/2ymrzNIwAqGJvJ1VFVDw8xHmXaU5+sLHcyDWF5fPId3MzcbDk/Rt0gmZSwzSA
         uvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793223013; x=1793827813;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f/iuDxmqrMhl1VYOTXsTvpTzJ5X7HX9OcrfeaMqu1fU=;
        b=aVjazsqFePD7Wr18sT3ZoygLkphuTDKPIFpxZpMGKDNqQ4lZ7pRVBkiz7qwkWsCd3K
         ZOODS8VAZfvuhd13jlrqVYV+03BfXBqPwsPRc2Fsm52SIEs3xJu1m2SlZfjBWhgK0Qlg
         GckyvZhOy5BlKHa0yX+1NfvErU34B0kmfGEKFdhMBJ7+bZ1vcaDLYhuTv4xAsJwFOYbH
         odH2cCCJcuZpLZS+U1RHlGvwn0tHDmA/9JbW5U+jMVxY4/4Ino7dMxDneq8BENU23w7W
         G1aud7HLlYgnvQrjCrKdmfWohdjG52eDfDwpR3RXGmmb7WXZWOYlGlFIArIlqcC+twWe
         tN5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxJ+V00NpR8FjeovW7pCfIlowMtaOM8aV/YJy7W1yduBT7aTrmRAlonPBZauaIJ+ry+5V5Axhc4CRmEoqk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTBcW/rrHv03O4LXpfd2G5/7vXMeDFxaJlBvQzNVFw+gwSu9lB
	5NgqI1XItQ9hrNawRxIeH8rQpC1AjLtrziplypn5w0nFCM3+4Z5l0ce9rGDFQVJnT03FQRd5HNb
	ur+5eHpS+HzUQIXRWiFpRf6Xgk4RwV6ZF3Gv3XIpQ
X-Gm-Gg: AYBFou0NsWvVECC0L1mClXzE8W3RKpqVLUd8J9rYc17Kmh9HwTR7R0OVu0rhZJyQcV6
	Rip3B4xp8j4alGVM6htgqpoEptk0EyGP/KEME4e5F+3cPUaGN4qMZ83rk1fA1mk8tkdyDriKRYo
	TU+TOr3nkc8db7LpNNuCiFqa+bzZAF+oD0f2raVmkuWvzF/bv/gKAzkEMexQq5j+QtzCFtWGEaH
	BN/KAmpjdtX3j2uNHahF8faxLZ1EWc8x7J7k9kICADCs7V+VmZcqGu4Z9br9sZcFbQDTfitjLNi
	ZnsjY5WS1AMkplxf2rwsSSxKlGeSgVuCpu5+zA/IyyGOEcmBDvBdO0tOojNKIFdaBxziw3O7NkZ
	uD1jHUXZaPqhMz0B9BewBNct5WPRg4noqL3oIABcXl9LmF/trOyDcSvQ3XA==
X-Received: by 2002:a05:622a:114b:b0:536:6ea4:e6a0 with SMTP id
 d75a77b69052e-5414e3fcf9emr2352421cf.11.1793223011921; Wed, 28 Oct 2026
 14:30:11 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260827223755.143247-1-zide.chen@intel.com> <20260827223755.143247-13-zide.chen@intel.com>
In-Reply-To: <20260827223755.143247-13-zide.chen@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 28 Oct 2026 14:29:57 -0700
X-Gm-Features: AclHuK8vezI6NYvSp2Xp1TdTy1Mae1XRDaHylKueLYQF7kDBtJS4PPhPLDPkSq0
Message-ID: <CALMp9eSz6eXpuR2R2dfU+fek8iYHOQNP07L3UZGxeRugyGKRng@mail.gmail.com>
Subject: Re: [PATCH v2 12/16] KVM: x86/pmu: Populate CPUID.0AH:ECX
 fixed-counter bitmap
To: Zide Chen <zide.chen@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, 
	Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 3:48=E2=80=AFPM Zide Chen <zide.chen@intel.com> wro=
te:
>
> PerfMon v5 adds a fixed-counter support bitmap in CPUID.0AH:ECX.
> This is the superset of EDX[4:0] which indicates the contiguous
> counters starting from 0. For backward compatibility, it's recommended
> to use the following to determine if a fixed counter is supported:
>
> FxCtr[i]_is_supported :=3D ECX[i] || (EDX[4:0] > i);
>
> Originally-by: Yang Weijiang <weijiang.yang@intel.com>
> Signed-off-by: Zide Chen <zide.chen@intel.com>
> ---
>  arch/x86/kvm/cpuid.c         | 5 ++++-
>  arch/x86/kvm/vmx/pmu_intel.c | 3 +++
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
> index 106e719e7aee..63201d4ea4a1 100644
> --- a/arch/x86/kvm/cpuid.c
> +++ b/arch/x86/kvm/cpuid.c
> @@ -1547,7 +1547,10 @@ static inline int __do_cpuid_func(struct kvm_cpuid=
_array *array, u32 function)
>
>                 entry->eax =3D eax.full;
>                 entry->ebx =3D kvm_pmu_cap.events_mask;
> -               entry->ecx =3D 0;
> +               if (kvm_pmu_cap.version >=3D 5)
> +                       entry->ecx &=3D (u32)kvm_pmu_cap.fixed_cntr_mask6=
4;

Is the '&' necessary?
