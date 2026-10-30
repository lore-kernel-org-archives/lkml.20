Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793384645;
	b=yNo82PeHK3eY7L24lx6ds4Wmy1w6/xldyEBpn6zcipy6pH3Rjqk7KtwZIcb+0IzD8D+e
	 UKusgzXAc/zL7UdfQ7JZCFTbpkvQ87Lbc5gm1nTC8UlEQDj2yHE8OctoQ/N4e6OREGHXu
	 qN4+70aa7L6+XlYhN9KAqRFhVYdF5JwWCG6Gex2UGtW4EyS1wyZYw26NuFS4m9E4NLv1Q
	 p8C0FYXrWDFP7By5YMaGSkrv1xH8Nb1BsbSQdioS7VKm/C1kkjPcl2kAK8X1GSEVzzXsV
	 GVOSg8RgDljzy4XUre/uwBwY/ilwvqZLtruXIW7YoXltHMat/SCOOCdVWI4k9maAShQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793384645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Fw1kmg+I1ASrdCP1OUgNo/WWfGRAnAaqRKHEspPk4Vc=;
	b=5fkrkNd31JG+QhfULiJNyWXkuLStztdTWRxV27N7Kp4gy/T55UD3HUEdFkwg03DR1LXw
	 BUchzWEmVWYxSTmU9pczVpZgz1KmOzDOzAh0qNtVGmhR++Pn/e4bJ+qf+MYnk6YUkmBU1
	 gfr0rTULotTtTHsGpSssAwpGiPqE/7A/bL2BdsAKan/RfLW6Up81paJqWrYOv6pA/TqmO
	 V4WHDs4fwDPynOBlC4qy3HNz0c9yA5AauuEUpBc7TUjOiWAII4Ulzy0HpQaTbnpNdj8Zg
	 5wD3CcYVIW+FxoMZmdTv5F9Lex7+JpZiTophGgmQ6wR9XPKp/7gd/IkKbSLsXkcyiRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T4ruIAOd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA5A606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:24:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BA5A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T4ruIAOd
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5337c7b9937so26511cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:24:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793384644; cv=none;
        d=google.com; s=arc-20260327;
        b=nt6Oxz8s+D38hkhtovldRdzIyAROGGYmMxhol+/HQSi4mNkC1mp7DdcrNiPy5oVaA8
         0uNHSZcZV3qCf9SjazWf7SProAS49JOaDis04o4SkaP4MMKwJPpjustJMoqcVNCbblf5
         mAuD8uPZ0yeYoso9ftdDT/G6ggCXdoNi3zefXFd7y9jDk2USvMTqSQkEXfEKT+ILJ/P7
         b5GiXogUGN9ipxI0aHeDDl9m4FXg4xuXazhlQc1L5AHP6lbtxNpuoMKvz+70bGaKq8Er
         ZDdkKeXBKdyv80dNlKvagb7flPEYP7usbE7LPu78DSzodBtqUntC0LRk/V06O43SXjun
         3UrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fw1kmg+I1ASrdCP1OUgNo/WWfGRAnAaqRKHEspPk4Vc=;
        fh=op3JSqQhSKF4ZJ5vPy/6pH9EX1R5+HRUlfRVQBwZPXU=;
        b=meg24Gqu2TOaoNgMRV+jbOS+96NVCsS1AQhcjZLx1QMoqNj+dUzGyqEd0kwb/B9mnO
         GeXHYhy1PgeZp5qAre+o7ncLfzvkiiXHdw8QrOPcw9cQTk0EMdjW5syKdfI9jNrDmYMc
         ZRHFpGiUO6x7vqJC4LBcp+ENvxtf+3mp1GkleHRrzXzaDNyWh92AyuUpBBCGF5bRLNhF
         uQV8qQw9TyUfdlQn7oZ+C4tnSw0wHk10WobteVO3VsE7YDFmUUtp5NaXyBQbPt4WDi/X
         o237O7QY2ClNZoCZRn/VftW5ecJzQylqe1p0JPm9Swgf0hapsgxICiO/fYMcNmps9otZ
         OirA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793384644; x=1793989444; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fw1kmg+I1ASrdCP1OUgNo/WWfGRAnAaqRKHEspPk4Vc=;
        b=T4ruIAOdTtx8ZxacqgjXIAGV0SmNNSJS/QwhXKBiHoOxBRoufgxlPFqxFtfAdR5jIK
         ZY18/LZOP3HAqOCVCF8ukpR3+4Ho7nljIaFW7cb6jqW2BesfIOfq2iCD6Acn7FS2F3Vh
         Z3PcXBbgdSzvAoecIdCPDeiDInqQdAQugWDRUXYlNI2+Y8+xNBXTpjFp0PCNHSBkMjtd
         EQUTVGE+GQGh4rphuXx/jPl15iRNpvjEW1lHLxbsmqSUQEHQrKYQsqOoUi33bRrJsk/J
         K3QF8A/0P7XhKoJkkDZxlG3cbWJ4hMCZsZuiwZ1KmMljE7OpGR0Pa2/3FFcLxQK/2aQX
         4/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793384644; x=1793989444;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fw1kmg+I1ASrdCP1OUgNo/WWfGRAnAaqRKHEspPk4Vc=;
        b=CZqkSjNldqD+rA6cTx64Ap6HmyabyvbKq3zzNnqEoiGKOYENOGa4Xk62ymx4+YfNZQ
         4m6lnVBi4ieDRr8dDj/zg6KzYfUu5WufX9XdxZPQir+AIKprmy4NyuSHIIa9tqmk08kC
         xrWhocK/cPrhBQksiXPmE5I2SAtihskZhnWFgq18A055TnkQbTb7dUz77EDxzQbDhaiC
         HzdILi0JaU2yEh5E4HIOY7LI2qkiwHZcmTOOTeN5awV+jSn32H2HxXj1DgAJuyanQdYs
         fLoV0UdmicCnytFhQRTiGCLIYBS/oPU/WH+jVi0HcRv1NT3qbMZlhX00C2Q0Yx+2n28h
         LYCA==
X-Forwarded-Encrypted: i=1; AKwUvBxcqnvMgk/K1IJ0AT49XqSwpya/npFtp/l3Ocm+1Gjnu96NjF4uAN1Yza5kWu0GijkNfu60XFU5tGUdEN8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIl796N+5IYvb3dA+dh5ORvbkQbq4FhwNjNTjSb6xIUw5/rdIf+
	TSu0KUS/VToc4VJqEf30ExXIkdKkiyqH3TweV0lNXFlXGCH5WX33+5cr3TskKyLNuCH7vpiR7JC
	V1BMCp2usW+Vv5+prMd30ZfqMqzpaD1kBBEMTxYQi
X-Gm-Gg: AYBFou0/ORv06torGhAkoNPwovQGg6jfiIBONo6sl3JOMlkuVatdpjUH63bv0d2uPul
	aKgHD3f+QM/E2RfpWOuj7b/RAg3FnDv55XSsKEChFCx0mTKjVuP/+/hICrfI+OBujjHn2uxT9sC
	wKUozVqiYnVv7LvNxDVfNROMwSC3aWGo8bZmIuvL3Xdmn+lVnn9bt2kJJ6sir+Y3+FhHe6Qj1+I
	2eDAlBf9L6pkWPn3DYS5d8m83MD0CwGqLZOVEBqsP090ct0Qw2zWNMZpVJH6sNEpSsZECLsOn1O
	SvT5pRj2PVaimlNOtWSSZj/FXDsv39+KmJ70g813i3zUraIOjzNRay27gKBNvGySMXvw97Nonf8
	PKAHo3SBi6MvD4sqWdUkYfnKf1sWNjgPn22uk
X-Received: by 2002:a05:622a:4d46:b0:535:84ef:2e26 with SMTP id
 d75a77b69052e-5414de1ec9amr50031541cf.7.1793384643499; Fri, 30 Oct 2026
 11:24:03 -0700 (PDT)
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
 <b3dcb403-ec19-4d23-9bab-336e2eb344bd@intel.com> <CALMp9eTHRzXXm1gpKR3u1nzJU3i9M1a_wUjp9+bD8_r4eoPQ_Q@mail.gmail.com>
 <dc0e6998-6b8c-4b0c-a04e-b6af0a1cf653@intel.com>
In-Reply-To: <dc0e6998-6b8c-4b0c-a04e-b6af0a1cf653@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 30 Oct 2026 11:23:47 -0700
X-Gm-Features: AclHuK9E07m7dz2wKjkFpXS9KkhXE21jPyyRBCg8pZLGFJS_nCKIByMBt2PJplg
Message-ID: <CALMp9eTRTLGziPtrSG9tQWLqoUuz9zmrRwUis5gb-wSeJeA7-w@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] KVM: x86/pmu: Emulate the GLOBAL_STATUS_SET and
 GLOBAL_INUSE MSRs
To: "Chen, Zide" <zide.chen@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, 
	Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 10:20=E2=80=AFAM Chen, Zide <zide.chen@intel.com> w=
rote:
>
>
>
> On 10/30/2026 6:55 AM, Jim Mattson wrote:
> > On Thu, Oct 29, 2026 at 10:45=E2=80=AFAM Chen, Zide <zide.chen@intel.co=
m> wrote:
> >> On 10/28/2026 4:24 PM, Jim Mattson wrote:
> > [ ... ]
> >>> As I pointed out in patch 04/16, we can't pass through the PMU global
> >>> controls unless their reserved bits match hardware.
> >>
> >> Totally agree. Then the handling of bit 55 breaks this rule as well.
> >>
> >> if (vmx_pt_mode_is_host_guest())
> >>         pmu->global_status_rsvd &=3D ~GLOBAL_STATUS_TRACE_TOPAPMI;
> >>
> >> Always intercepting GLOBAL_OVF_CTRL and GLOBAL_STATUS_SET can solve th=
is
> >> problem, but it may impair guest performance, especially for nested.
> >>
> >> Instead, I'd propal to have separate reserved masks:
> >> - pmu->global_status_rsvd: unchanged, strictly tracking virtualized
> >> guest state and preserving live migration validation.
> >> - pmu->global_status_{clr,set}_rsvd: unmasking all architecturally val=
id
> >> hardware bits for the corresponding MSRs on v4+.
> >>
> >> Any bits allowed by hardware but unvirtualized by KVM are
> >> scrubbed/filtered in intel_mediated_pmu_{put,load}().
> >
> > That is a terrible proposal. MSR bits that vanish at unpredictable
> > times?!? No. If an MSR contains bits that aren't virtualized, that MSR
> > can't be passed through. Full stop.
>
> OK, I agree. I will intercept GLOBAL_STATUS_SET (0x391) and remove the
> nested_vmx_merge_msr_bitmaps() for it.
>
> However, I propose we keep GLOBAL_OVF_CTRL (0x390) passed through, even
> though its reserved bits don't match hardware. Since it is
> write-1-to-clear, it cannot manufacture unvirtualized state or leak host
> data.
>
> The only divergence is the lack of a #GP if the guest writes an
> unvirtualized but hardware-valid bit. If we want to eliminate this
> behavior by intercepting it, it will force an additional VM-exit on
> every single guest PMI.
>
> What do you think?

That seems reasonable to me, as long as the architectural misbehavior
is documented in Documentation/virt/kvm/x86/errata.rst.
