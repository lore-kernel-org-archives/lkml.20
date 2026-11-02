Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793644373;
	b=IGwcm/kMqcrIPLCg83n+VxyqDGOmuStoUucy9f+PmLhAYPmOd18fh8yc3QJ72WmLnsPS
	 XOiZQmRjh3TfYADN5Hj/zioeZv1H1NLiiJNHWgufHoBW8KGkQtdVCX7VgCwQmcaZi9aOh
	 BB+NEkOp7sJh8Pd3B4VOlv9Vsll4/vmDyTznpilpx7vvu9st5HuWbyCFVzyw8UlZV6nsV
	 WDcAZX1kGi/uZm+Bmugfa81SV7bmTcrN955OcxEtEaDHeNZMkuT0APdvodoqqa0vw6sry
	 a1TPOuGPpX4nDB6oYd3K05MmB47ulGQvkSzwyWo5ejkR4s+BSnrRUgARLpHHdKPZcqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793644373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YB3c0VJ2rpFd4tVqUs/wI8HYHytn5yPy0WZ3W2zVxqk=;
	b=NR5Lb9SNGbJirL92uPLZhP/i8KvnweTfRz+IYBGBaiGzu7tZzWE7qUI3TRNhx62uym9w
	 wPotQxahEdhQvzHOy/j3iLuaTTb9ZPrTMPvwV9D0glxKwBTGZKhIsaTJhrr7eltvMOPKC
	 XWPGLQC8s7JyacfhZ9cZZJaFj4rbqcs6HedRerpRbfQD9XeZ13VdBn2xQ5C4SrA4f/yKL
	 J4lMNOxeXhnEJFLrodiIXptouBeJF+Sqs/pVI8kkimCXdCP3Q6vI/mtGSWVtWZrv7o0sB
	 ccCNqdkbvJN9xKsL+aX8xwIY2mMStlqtUBed9IWJCAf83GozLPnGXQtI5wIhC1NXPsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wjptjc4z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75721606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 18:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75721606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wjptjc4z
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso43a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:32:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793644371; cv=none;
        d=google.com; s=arc-20260327;
        b=VLPCtxO1TF0RT1bhn4NebpHInORtiB3kGpV4HPExQNbkfKpcpluo6UOtWqYNHDLW5W
         PaXv7JMewJPLQMxPc/Z6hA7ckb/XmYQGVCDYHoMIeg4h4VqHd2TiZ+f/YN4cEb5z4MNL
         dkBfm1sy9K3y/4yvfmlbpEi8/0ZRrcFL4bynvT9CKnpZMtv/QdZKI1McBM+cdNHaEE98
         ic7DEOZnhVn4LjTppxNdZwt7RghcAr3i1X4xSKZL9x7s45tCSFBGBF/b6WW6eMdhT2ES
         BqDVxyD6nmzbsn9fBkuaVip+QFU9f0ZlSLg3TT9EwLz00Pt0sHXD4EMX6XvCGA4z4tn7
         jJCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YB3c0VJ2rpFd4tVqUs/wI8HYHytn5yPy0WZ3W2zVxqk=;
        fh=ISiCiwvnK++dy0RRKJqtzZJwCifJYLFkvzwm7uDYniQ=;
        b=U+fdOfOnJA/aZx0JNLfPyOxauoJ1Tds0OREB2L96NgJER8RiMkxgD9p+OSkujiRhEr
         AurZjEFV7NGFyf3xUGqG6U4p9En4vRTjJ1b0kgnQJyukDSfWfCj0ptp/1+j/poc+Shqn
         iWWSRCkJ4Kw3qB055TwwHFpoT7SG8d7Wyd//XWwn0fFWhXec4ssdHhSUs2z3Gmt6mbkD
         Bpi6XblIZEJlqs9vsV91mxGWJRrTWd5wSAGppk+/iNB/wBfsoM7bGgcBZDV8COEduOvr
         0iJ1DMCOXD5wNEKCXOxJfN4jsZglFcPio5kt0+Ykc82U34MkRg9EJXyaDZG8775cthhM
         qZFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793644371; x=1794249171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YB3c0VJ2rpFd4tVqUs/wI8HYHytn5yPy0WZ3W2zVxqk=;
        b=Wjptjc4zJZSx2STlK1NxCVRYDtRciqfYpzSJqPY1hypYzaOZRsWxmF8Wh8zT0UiypU
         slhcjtoaPPnaXkg6jwnRWi50ip4LreVUYPMYbcTT4bnhnT2AwhQ2/EbH4JI7JW9denj+
         AFBbcqwrQjhZwdrcuyqrfn/QdUwKCNqV147jCWsnM20K3h19yoEPoAnb5da4blLg8jqd
         gOWAUDcCvCmFi8CwpBe0KQ865xVXSHrsx2XTRIHcqIIaO24zeyiQOYFF/0lRcB+d3u3j
         ipJZP3jvalHJM9IJvvozebnsJbpFL4PV9WZP8SBBLaDTgiZheO/5oPRjCOtLfPBsxqAF
         4H7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793644371; x=1794249171;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YB3c0VJ2rpFd4tVqUs/wI8HYHytn5yPy0WZ3W2zVxqk=;
        b=nD9rErNYEkpLdJvTy2Sp7LPhlzZO5nVIkTb8Nr55fz+fFFaIxwsZEJYwO2YVJm8pYE
         k0HgVFlBSyprJYHVYYQoliu84TqzOIp6l2YcGIeJ+00dY6Wl7CR9zShFi+MbvSVA8YwE
         3A4RgOTerkxmU9HxiMhWFIquwiPVLw7U8LQaXtUbLgZzO5Olq/Wqk9rdK9geq/XxiRQc
         bvQ0QlUs9sWgO0rsstQRQT2Efa4fQ9dx7QFgypWJNCDpGps1HY3/DDNmgqPK2vEi+wiO
         HMdhkfqt5bcEn0lU9nOAt3SftyKfl3vcHOMCzRyQUpxg6AGfnMa8pr5MeYO6o7VbxYEZ
         YV5w==
X-Forwarded-Encrypted: i=1; AKwUvBxIcGY5poTXC1OSliccPZxnFwXVY8IhpdDr2tXa+tvmSaMbJcqpamVT0bzh5UOHm4Zzg+p/8aleYfVWdqo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ecuInPUU2+0pDcBvHb5wdF8mHp/Ffoe+95CfqU/66OeP9ZnQK
	4vQBGRHdquOGcUKgP6nO841z7egNywxPO7eB7zw2lfoDXlryFpnbWdIMApnUTJ/kvxBu/qPKCMW
	+U1DTSPe2zx0V2eRagpDDWfboNxGQl2w02UpkU/21ysWIyS/qOryIQ6rf
X-Gm-Gg: AYBFou054+YCLYqV3MQE59VaY2kZIOwoEzxI0tSzlxPdyMpuL+a4dLqKU7io8zV0wwd
	7jtb/MLlFoyZgMkDahEuzyAgh2ZveeUp/7WEhgdygtk3HE8JMrUoU0Aw5QCSsw/0CXyD7rhnoMB
	1KFXvixCdvdT6/tnjCANqjIveC0z1L/KWOrOvoMuC4PIBdsOR+K1pghIDbxmYVerjZ36oYUyz7n
	SYsmqwHoF/o6y02PtJXqZFfY1Is8aCVtohc0LxYdVkiArrHz4pau4q2lV94/OX15tzJXfCDK3C+
	niAlCXzX7Bp39Fd39p2eoBZjZzmQb4LoCi0kRsMuNOR34bOMZ5flNUXwIUgojGbrAKnaGXdXZvn
	CvADKfD/f5SfrfhRnH0J4ZyUFOXINq6gaLtJ7
X-Received: by 2002:a05:6402:460e:20b0:6b1:aa31:a627 with SMTP id
 4fb4d7f45d1cf-6b4b10df53amr314955a12.4.1793644370270; Mon, 02 Nov 2026
 10:32:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260827223755.143247-1-zide.chen@intel.com> <20260827223755.143247-12-zide.chen@intel.com>
 <CALMp9eRvQ+iQdw_dWPLqZCrO7zpLut+O27pb-EPNa33hkegaBw@mail.gmail.com>
 <auUQgRVFASkWtkoK@google.com> <3276824d-f6a0-455a-bf0c-703fc6d52cf1@intel.com>
In-Reply-To: <3276824d-f6a0-455a-bf0c-703fc6d52cf1@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 2 Nov 2026 10:32:38 -0800
X-Gm-Features: AclHuK-Bo4Ydf5I9_TcA3ok2eQLscUvZDzf1qXDouSZiHdDa6pavu3yPyZGjv9E
Message-ID: <CALMp9eTiAMLsH7cO9Mc982WwDTAFcYOua+32Ykpj3gR_Oscfww@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] KVM: x86/pmu: Emulate the GLOBAL_STATUS_SET and
 GLOBAL_INUSE MSRs
To: "Chen, Zide" <zide.chen@intel.com>
Cc: Yosry Ahmed <yosry@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org, 
	Andi Kleen <ak@linux.intel.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 9:38=E2=80=AFAM Chen, Zide <zide.chen@intel.com> wro=
te:
>
>
>
> On 10/30/2026 5:13 PM, Yosry Ahmed wrote:
> >>> @@ -865,6 +867,7 @@ int kvm_pmu_get_msr(struct kvm_vcpu *vcpu, struct=
 msr_data *msr_info)
> >>>         case MSR_AMD64_PERF_CNTR_GLOBAL_STATUS_CLR:
> >>>         case MSR_AMD64_PERF_CNTR_GLOBAL_STATUS_SET:
> >>>         case MSR_CORE_PERF_GLOBAL_OVF_CTRL:
> >>> +       case MSR_CORE_PERF_GLOBAL_STATUS_SET:
> >>>                 msr_info->data =3D 0;
> >>>                 break;
> >>>         default:
> >>> @@ -931,6 +934,12 @@ int kvm_pmu_set_msr(struct kvm_vcpu *vcpu, struc=
t msr_data *msr_info)
> >>>                 if (!msr_info->host_initiated)
> >>>                         pmu->global_status &=3D ~data;
> >>>                 break;
> >>> +       case MSR_CORE_PERF_GLOBAL_STATUS_SET:
> >>> +               if (data & pmu->global_status_rsvd)
> >>> +                       return 1;
> >>> +               if (!msr_info->host_initiated)
> >>> +                       pmu->global_status |=3D data;
> >>> +               break;
> >>
> >> According to Intel SDM Vol. 4, Table 2-2 ("IA-32 Architectural MSRs"),
> >> IA32_PERF_GLOBAL_STATUS.CondChgd[bit 63] cannot be set by writing to
> >> IA32_PERF_GLOBAL_STATUS_SET, because IA32_PERF_GLOBAL_STATUS_SET[bit 6=
3] is
> >> reserved.  In other words, it is not possible to save/restore
> >> IA32_PERF_GLOBAL_STATUS when bit 63 is set.
> >>
> >> Because bit 63 is clear in pmu->global_status_rsvd:
> >>
> >> 1. An intercepted guest WRMSR(MSR_CORE_PERF_GLOBAL_STATUS_SET, BIT_ULL=
(63))
> >>    succeeds instead of injecting #GP(0) and sets bit 63 in
> >>    pmu->global_status.
> >> 2. When bit 63 is set in pmu->global_status (whether it was set by
> >>    kvm_pmu_set_msr() or by intel_mediated_pmu_put()), the next
> >>    intel_mediated_pmu_load() will try to write an illegal value to
> >>    MSR_CORE_PERF_GLOBAL_STATUS_SET. I don't think we get a #GP, becaus=
e
> >>    every wrmsr is "safe" these days, but the write will be ignored.
> >
> > On SPR, it does produce a #GP that gets ignored (and logged) and the bi=
t
> > is not set.  Interestingly, on CLX, the write goes through and the bit
> > is set. Didn't check other CPUs.
>
> Good catch! I tested a few more CPUs (DMR/CWF/SRF/GNR/NVL/LNL), and all
> of them #GP on writes that set bit 63.
>
> However, SKX, CLX, and ICX accept writes with bit 63 set and do not
> generate #GP. On those systems, bit 63 also becomes visible when reading
> back GLOBAL_STATUS. This behavior is documented in their errata:
>
> SKX95/CLX89/ICX166. Bit 63 of IA32_PERF_GLOBAL_STATUS_SET MSR (391H) is
> reserved. Due to this erratum, setting the bit will not result in #GP.
>
> SKX:
> https://cdrdv2-public.intel.com/336065/336065_Intel%20Xeon%20Processor%20=
Scalable%20Family%20Public%20Specification%20Update_rev17.pdf
>
> CLX:
> https://cdrdv2-public.intel.com/338848/338848_2nd%20Gen%20Intel%C2%AE%20X=
eon%C2%AE%20Scalable%20Processors%20Specification%20Update_Rev028US.pdf
>
> ICX:
> https://cdrdv2-public.intel.com/637780/637780_3rd_Gen_Xeon_Scalable_Spec_=
Update_026US.pdf
>
> Given that SKX95/CLX89/ICX166 document this behavior as an erratum,
> while SPR and newer CPUs appear to follow the SDM and #GP, should KVM
> continue to inject #GP for writes that set bit 63?

Ugh. It seems like we have two options, neither of them all that appealing.

1. KVM fixes the errata and raises #GP. To ensure consistency, KVM
always intercepts the MSR on affected CPUs.
2. KVM mimics the errata and allows writes to bit 63 when virtualizing
affected CPUs. This allows the MSR to be passed through, unless an
unaffected CPU masquerades as an affected one.

Sean? WDYT?
