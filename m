Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793658346;
	b=DdLZmAzwaF5aX1g2H2SAJ48SzNI8bzlNL0DX3OUqQ/LMWpNyiQtUEba1MfWaeIyGBRV/
	 scxt/Oeh3dqfz3VlkHn/aEZm96boG36SewFSm/vpZWAGCtZctc92SI/sdM3S3D/QV/4Fw
	 TIIqb/qiG5CGjPqfHhGWSVdeQEGZGFWcvwGkxHFIaPPNu6oLL40APLd+yZKvCKPnMo4Kq
	 /MjmZf6pt97wv/ESjrClAqfMBjzix5o0ckDcfpawjY+Ce+/1SGkg7kPFdRoA/gPN2kM0e
	 e7/8yAoFjCSMIqkCMD2afiYEV7+OIKMRPcxVp34LCZjR6+Rsp+DHteCO47Dth0b2WoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793658346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Vrq4CVs6mJDEjF2xNX7uMso578nq3pxdhCMsIm+kdqA=;
	b=XNsZ3E/CfxmWtlYT3Hhp27PBK1z21IVmq8qwjLUM0vNUqut3hsbbnI1MpkAT09Jhpl4j
	 f2krAthF43oGSGHaptqrJitCwp9onC4fi+jEMh923KHMaPNt/Top8stFCpnpoAKbELM0A
	 I0UrGwSW7mIKpd6shRJC3UxenwcneaybP9Z/jbkdosg4qmxfMQapxjh7EaOMuS1vqtVCh
	 2H8lf6PhX+IxQcg0nBF7fU1liTmScx3P0nxNyI/wuyPK8S5JhuiAVaD3/B63H0rIeiQlp
	 3KuNDjQvN4ucAVLBa2mOQsD4f/j7A77YFXmYkHU7YIVp6lCpv9DJVYaUjwC76GrlWwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="og/PJlRg";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571A4606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 571A4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=og/PJlRg
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso944a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:25:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793658345; cv=none;
        d=google.com; s=arc-20260327;
        b=f7CsO/d0LCxKwh7DZIIsCrk7dBPb4OHoJKTVDv59WtAmS2aML4sjIWBfpFY80/xZX7
         c34ikfjihSOIUuOMpOhjRU3djCsuRIzzQ3NjlaJn8v+JI0tS6Jgr3rOh0ZEsThXak3vt
         swcXnj1ef2XNfaUvIKy8QrYEjFcukgMJBbZU9Qy/GAvuADo8n4Bswfu1p4E/g8XWtwTV
         aQW6a5GuT8fHwCW0RvLQnsVBQAA2W5OcfiHG841fQHWCcQ/S1MciiNvSvoGQpylKrOKg
         bmLcGjRWztuFhb3ZlsEJ0HGhT/sb4Sfn8UPbkC0nuDFi/1y01hH91rXA5EZEkmVnbo29
         8bnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vrq4CVs6mJDEjF2xNX7uMso578nq3pxdhCMsIm+kdqA=;
        fh=mKhUpUYwvcUOyb0pJOXtJF41nJcNlSBHKxJKBeQ0x70=;
        b=Wlo9m+knpClOBoeSzvne+A6R6nicF3VzIOgJtrHh6gN6wL/iIIZZwwzrp8jgm/USxM
         9WyYMKZQ/Sj5NL6J0H3HiFcUsLllfz1f3Ij5yn1uGC4ucF5rIvz/MXs6fFKNALZ2v/4o
         MysJE0hPFON0mHQsZ86rKnjpJg98mpiutBp2TMDWQE0OKVN+UbDdExB4AzCPXAY+YlrE
         jFdFKEWG+pPdm0jE2oVANWE73hBkB+jKTXucrTw5swQL7JoqZ+79ofBZWVP+L1zlg/Cf
         TCdHioE6g2b+lhINpEMxKcnLwowA++pOaK5PCMOzCLQjBqkHPeYpramDI9OlHdNVa1to
         Qkeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793658345; x=1794263145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vrq4CVs6mJDEjF2xNX7uMso578nq3pxdhCMsIm+kdqA=;
        b=og/PJlRgrFDz11cuit4CTCsoMeTKqnxgm0MQxXtbHlClqvxLWyHJPt4Vhxsm+V1hRU
         hnKj+HTAOJsVfVyst1WMNh6ZIsRwnjiA8L0CL3WWwHhmkv22ZI5NhMJ6Xn8yzaEzonho
         LD7Sw8v5e+CTBLwewuRNengVeamR0TCR6wn3FscdY+1dZNOG8nzdoXv/fOHaynzw/PHz
         mluTkM2PZ52Kx6kGvO/QjKfuF5rT0UniQ+wBbL59XUcaGonkmjCNBiek+lT1mXPeUybN
         oilRH/QGyzjUko+fj/0xTPAdvDpfDE2DVtMK5PDTNFPr0qglYaPJg4JXSyiPVP9QDrBW
         VBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793658345; x=1794263145;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vrq4CVs6mJDEjF2xNX7uMso578nq3pxdhCMsIm+kdqA=;
        b=qoVgZhRfVwD3/csYA7dfwniWuKrHEZkefHGYaSKVQwbHxHvpvgzDt80PMMvuE5p1ju
         4WM6f7saH4mMYLfzh8aKIFla5e3A2DqYLtSj0LHsjnyuHFaSf545ag+fGWwj3vw5YL1N
         KeS/fY9JpJ7cZrwf7R0tvTb9fUwqPWA45nDxb6S+tm+cc7yJUzDvqitBu6aFO7HF9FyN
         TXcZfxUJAdJJXEC+prVtUdKOHkDD4vTSHaJ7+RCpxs4peGcQc0jqlj05BC3KTGDCNhlE
         nOGzW08eDV5ipv+2vGbkNJeWvltv/ikDvtWRd8s6Tv0Vce7ng6Gt5uiNcjRHwUwmAbYv
         ZXKA==
X-Forwarded-Encrypted: i=1; AKwUvBwveVsqy26x21yBkihCtxYzX0IpF6V9GqnG45fADWh9ui3xxuN+pIo/60vFmq+7Creo0G4d0H+8PrOBO0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5Jr0M3/qRIpX5u3ZleEckqvgabC7KlqiF4EY71FcX5tPBuNA2
	PpTZMRNqkqiDp9LCMHBPJDtqB3n0/FeOSH/3Q8fRxdEKO6XbRSd2URTwcL/TCoYJojc+kU53KJZ
	jhXJVHIvHrOfNdEDZik2Eko+51HR2jiHTl8+Re768
X-Gm-Gg: AYBFou36HvX/UssLh/BnYtefCYXwktS8ZmuP7DSowDdJvK11LgMeoT7UPTFrJAdk9ob
	l5qm6gnYyYrkDIGAA4wI/dlkL3KvfeGPZ5CoVkh2bU7eyTda4zoHaPw255xmREY+83KGBwmD+gS
	zAb7KIHL0KqBEkFTi3cEEFkddZHa3neSvDFe5Dkm0ggXxF/dLgYuA0BheLgAjD7eqgDf02QlgQK
	yFq/bsznhuoqt+ExGK3a3DVFOhnb5K7sAgYYUui0X+W2XBhiHmLg1R1eIUpFbwmbyS88eym3uBJ
	qsGrzrrOmrz5FNNWq8IdBsQKB3geoMcyhpRd5q077s84fd3rksHCRg92bs+9q6jHOFLRFdu9Mlj
	tB6FSC0Pb63ZUFLu4LyhVrW5cpMexRe7LIixE
X-Received: by 2002:a05:6402:10c9:b0:6aa:128c:36ad with SMTP id
 4fb4d7f45d1cf-6b53e764c47mr5314a12.10.1793658344205; Mon, 02 Nov 2026
 14:25:44 -0800 (PST)
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
 <CAO9r8zMxQnRLKGrW69rX7703AatWMp6KOXMObL9baHRPs4dW8A@mail.gmail.com>
 <6c9a13c9-e6c1-4540-a8ca-1f0e800f3571@intel.com> <CAO9r8zOWzr61pkkF01AvEp+YSOo6bA1N=L91RYiM=ETtK5+D9w@mail.gmail.com>
 <69c428d7-239a-485e-9494-32b8aa82da05@intel.com>
In-Reply-To: <69c428d7-239a-485e-9494-32b8aa82da05@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 2 Nov 2026 14:25:32 -0800
X-Gm-Features: AclHuK-Cg-hCvFwpQyev-snLvGrjjN8oCWiVCvcXqcfI9YoxexkU_ERZvH5A9ao
Message-ID: <CALMp9eRsR8xaUmQyVu5QmYx1cZ2qFGGk+31bMymhmN9_iaPuMg@mail.gmail.com>
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

On Mon, Nov 2, 2026 at 2:13=E2=80=AFPM Chen, Zide <zide.chen@intel.com> wro=
te:
>
>
>
> On 11/2/2026 3:36 PM, Yosry Ahmed wrote:
> >>>>> 1. GLOBAL_STATUS_TRACE_TOPAPMI_BIT can leak from the host into the
> >>>>> guest. If a host PT PMI arrives while the guest context is loaded, =
bit
> >>>>> 55 will be set for the guest, and the guest won't be able to clear =
it if
> >>>>> OVF_CTRL is intercepted (it will #GP as it is reserved for the gues=
t).
> >>>>> Similarly, the value can't be restored through KVM_SET_MSRS.
> >>>>
> >>>> I think mediated vPMU assumes that no host PMIs can be generated whi=
le
> >>>> guest PMU state is loaded.
> >>>>
> >>>> If PT state can leak into the guest via bit 55, similar leakage can =
also
> >>>> occur for other status bits, e.g. when the guest exposes fewer
> >>>> general-purpose or fixed counters than the host.
> >>>>
> >>>> The scenario where both host and guest can be active simultaneously =
is
> >>>> handled by the perfmon_mask case, where intel_mediated_pmu_{load,put=
}()
> >>>> filter guest-owned status bits.
> >>>
> >>> Looking at the code:
> >>>
> >>> kvm_mediated_pmu_load() -> perf_load_guest_context() ->
> >>> perf_ctx_disable() will iterate PMUs with for_each_epc() and disable
> >>> them, which skips PMUs without PERF_PMU_CAP_MEDIATED_VPMU.
> >>>
> >>> Same for kvm_mediated_pmu_load() -> perf_load_guest_context()
> >>> ->ctx_sched_out(), it also uses for_each_epc() to iterate PMUs and
> >>> schedule them out.
> >>>
> >>> pt_init() does not set PERF_PMU_CAP_MEDIATED_VPMU on pt_pmu.pmu.capab=
ilities
> >>>
> >>> Please correct me if I am wrong.
> >>
> >> My apologies, this bug is indeed real because pt_pmu lacks the
> >> PERF_PMU_CAP_MEDIATED_VPMU capability.
> >>
> >> Adding this capability to pt_pmu seems intuitive, but unlike
> >>
> >>                        the core PMU (which merely toggles enable bits)=
,
> >> Intel PT is an AUX-based PMU. Stopping and restarting it on every VM
> >> transition is heavier, and I'm not sure whether it could introduce a
> >> noticeable performance penalty.
> >>
> >> However, whether the solution is adding PERF_PMU_CAP_MEDIATED_VPMU or
> >> some other mechanism to enforce mutual exclusion between pt_pmu and
> >> mediated vPMU, we can address that in a separate patch.
> >>
> >> To immediately protect guest state and live migration in this series,
> >> I'm thinking of adding the following defensive filter in
> >> intel_mediated_pmu_put():
> >>
> >> + /*
> >> +  * Scrub bits that are not virtualized for the guest to prevent
> >> +  * possible host state from leaking into guest state and breaking
> >> +  * live migration.
> >> +  */
> >> +  pmu->global_status &=3D ~pmu->global_status_rsvd;
> >
> > This doesn't prevent the leakage, it just clears it on the guest->host
> > switch. So it helps live migration but I am not sure if it's better or
> > worse if the guest sees the bit unexpectedly appear AND then
> > unexpectedly disappear.
>
> Right, as long as the GLOBAL_STATUS is passthru, the leak can't be
> prevented.
> > We can clear it when the MSR is read by userspace, which should fix
> > live migration, but the guest will still see the bit, and it will
> > still disappear unexpectedly but only during live migration.
> >
> > The guest still won't be able to clear it when OVF_CTRL is intercepted.
>
> GLOBAL_STATUS and OVF_CTRL share the same interception policy. If they
> are passed through, the guest can see the bit and clear it; if both are
> intercepted, then bit 55 can't leak to the guest.
>
> It's not perfect, but at least the guest won't observe bit 55 and then
> get an unexpected #GP when attempting to clear it.

I'm not sure what imperfect solution you are referring to, but Yosry's
proposal that the bit gets cleared on a guest->host switch is a
non-starter. MSR bits must not vanish unpredictably.
