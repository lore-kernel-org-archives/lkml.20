Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793836192;
	b=QKEm2DTtetYZeI3IB+1jg8MhJhwOT8t4XjyGaq37WmClQsz41KClDhrGUPRXqpV47nMh
	 1EcDdSQb00qkOgWNUjEzMNyY+SyFxptn8YtPtwp7Pb8zxrWu3S/4XufrTNuoLPzw1+qfL
	 JZgySrBpOKsd5Uk1fLn/OgcjI88pwcCjk6zwN2Qn7kvwfPcHiHSuX/zHGSnH81fQ8e5WN
	 zw7UTazFgt1WJ5B2LFO07xzg0/tzY3MFKYKzkjw+2eUnIiZgz61pbLq9J+pPD9kMrAByF
	 zf/5Yi6e27mpFU5oN2+BxHhNapQ8JLOmVyjI3wap3yGU0FElyI1pCSurbQiTvELRMsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793836192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NUKXnf2zRVnphDvWIJPgNPk0+Yxezthn/bgjikrOQVU=;
	b=kxue2T/yiIWBMf3HfH2uM+xtuBFzUrzVysdQxa5/EfKI+WlJuKtEVdCX8K8ac8ow7mYB
	 gCzNyP8H2b8jx702rl8gh3CUq1gXxOj0eLsL+YYkTRosjGO1QXfQVqeCIqa0hs8woPRsA
	 KxV6QLIHglElaWJJ4gJVmgr68QbjGcVyCEdb436qcxgCexE+k68ovnYPR5DLtf+hZG+kX
	 5yszM8NcLPUYc/OEmBEgi6HIihVDnCdKkd6JYI9PS6/3QCu51/9s/oifq9fREO7n293Pw
	 Y51tZRiNXq1VPmvJpYQEL1qLxldnoa/oKYLFhNXYq1Eq6HO/2fT+1YBRVA+Ju31FrIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LOCKWL1w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97636606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97636606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LOCKWL1w
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso2459a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:49:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793836190; cv=none;
        d=google.com; s=arc-20260327;
        b=p1kd46PbyQetiIuRYzL/CmBbPiGPGGYhpTvAQN41KEcKKfnhM4hdefJWVTNF3fyTe1
         9lib2JxgJAVzDgX0PV+Keu8e/pHhyAyp7rF+WQ9+Gec87UY0t2aW9zrM08+H00pnMLZ+
         QbLLPDQu8VLWAa93fQSMCEonnENdFsEgBMxU1/ngkFnQOTqNRKcQP/uSzeCH6TILJ409
         iP/KgYtFI9wLl5SKVK3bfpyV6LeAU+NXVsuRXp0/tm5etZZDjX58Faix7zJTO1ebZHPO
         cOe58ziBJvWDSvfjc1TQ6+5+JqhjMsA8+U2H3oaf7/TiHdTAxLWjkSX3wSE6FLgg2iMJ
         XH2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NUKXnf2zRVnphDvWIJPgNPk0+Yxezthn/bgjikrOQVU=;
        fh=7tZL6EYYF03u8yGDw6VFFhLpdOtHfkKJmlBKdYx2u+0=;
        b=cb1uSZFtTq4xJlB+MQF4v+HWWOZiizWzl/+mEtB6QXEiCtiQZrk8o0kms/ldyDT1W+
         F5o4Pk3ZuA6RE9hQjHAC8AmN3+3d4XnZ3WNxsFmzFRMFuJABeT9Ac8SKSKIbXZeLgFgk
         1VP31dXEhoGT5II/tH0oB93my8ZLFWTtGeyB3IPFF1+x/81qbeaTzIDxIOkXE5H3rscc
         epCGHTA00aOmFA99vA3vdhGmDTSEYGk4v4duV5k+0CFce5PtTDumbzLRvcFLzBDzODDN
         ftB42ZFpNuF4dh51Q60B8OLEjKlIuJ+81D5tgP+L/gYddSLg+8fgAwpRKLs+jljBJn9e
         g6Sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793836190; x=1794440990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NUKXnf2zRVnphDvWIJPgNPk0+Yxezthn/bgjikrOQVU=;
        b=LOCKWL1wvKSW1uuETVBSc+7qqp1PzGIzHAP+Uros1fuOIBAPEzBSwpC0UJ+I1tzFVX
         f+gD9FJI+nKStfEI775giljQXjuR5F1aCTV/9gG71Dxtz/dNG9MddBnSJRJWFTC8pA1u
         KsWWbOC32wZ1UHU0b7SVXbxwcH7M6CDM38v0UUeeF30VT7eGffugx7+gw6qupZcATfOU
         crQGq8b5f8m5gVJt8wY/OMfA0BeZzHLvzdNvTvFOmCj5xJrQpWC4gJZK5rg6XLWD39y6
         fgfK6Uah7rxjWM1xdj2/wGOtdElIqqEGxTGfOs+5FFTJhcNXih9IYUmo1ffThwpLZS9C
         nEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793836190; x=1794440990;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NUKXnf2zRVnphDvWIJPgNPk0+Yxezthn/bgjikrOQVU=;
        b=Ck651pqRS5w4M6/Y3J6glZ/kFYgtSM/aMDLdmzLi3zblAbdrmbJZ2qFVFc52nynmzT
         GfTFWsUKCPlHeUj0kdglxUgIzVVF+q5BqVJAySVuXy4OcY2hyDrnc5jlhGjQpCQthGmq
         DvkvaYb6W4N3djFSqEoYZ7pj0bEbUpuptX0Ldj5CVnyIrAt/Nr+FPdacFAcbofHkDTXe
         PcOcECYoSd82QdjhKs5tcW4uDEsdu083rs2HyvNLQC9ERAZadySocMqKrawmSoqpV8lA
         BLrmGFkpHz+UIrQKs6xKznLEkfX+PDTxSLEY2pEbjwX7BwL2r22rLPdS4qZQWyRZE82K
         xE1Q==
X-Forwarded-Encrypted: i=1; AKwUvByrM+AYPyqUS2vy/xohNIN8MQBowgD8Uo1iP5XiEECkC/SbWJFpOey13pc7m4zFjZYV22iZF1Vi0v2lhIk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RmCNF2nyJ0ggdY2YgwAuMdZAytFD4FpLysrYzS66CKjSu/GTn
	1NRvJVMtNtrTJS66YtWkOHSRTtU6lBIUvxCjWAV8/znjEaggwqCR60cbVC8/Fy6SJ2MkqXdFpfk
	f47FhWAqdXVr85LFnsYB/6X9RZoyjI54k9hgmkTHpnoxF7DpUzm3/rm3e
X-Gm-Gg: AYBFou0tFIFOWnXesoEMo8V2omtqUSQaQVYqEnNrgi2FMXCCR8UHtztWzgvK/pRWPqK
	KMKbev6Z0sqDBaQvls9mifaMET4gJLzLXLkPBUkA0dtvq80Xeu6dQokieFveihVynmk6a6VQY0A
	f0QBtUUA4jNH9wzcWCEMbges7ZX3ONFE4nSKaSBVSyo+NRDVwOv0gKBLIro8bVacpHDmQ4SbrG/
	ETrZ8ML0JIT2+Z6xHUYTtk5CAXjognDu+C5qRo5LJjX4EDZNt2eC1PSYHQ9KL4mbp4hFVijfmfu
	0f81l9lAFlNhppI069n3gTDxN8/S8f177EN09RzL6MJ5+XXLgRudLfxAV86z9twv/S2/YGJ3quh
	539ml3S9CZdCiimf4kzHknGXKOh5ORBfnbRJT4ze1NeS93wWmLjmNbCbeKw==
X-Received: by 2002:a05:6402:515b:b0:6af:b196:68bf with SMTP id
 4fb4d7f45d1cf-6b57bf23d30mr13524a12.7.1793836189727; Wed, 04 Nov 2026
 15:49:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020234535.3182385-1-jmattson@google.com> <20261020234535.3182385-3-jmattson@google.com>
 <auuZcZhBhrkZd9qM@google.com>
In-Reply-To: <auuZcZhBhrkZd9qM@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 4 Nov 2026 15:49:37 -0800
X-Gm-Features: AclHuK_NOce6L67eEel5xBWyuJ8EA4SaVhlYOcLwPr6ufXLfVFjSolSkCGb1uQw
Message-ID: <CALMp9eTpWP6XSYPJQjBwPsNWmPzLNh+EDGivMFZsUnixqpGkVA@mail.gmail.com>
Subject: Re: [PATCH 2/4] KVM: VMX: Refresh LBR MSR intercepts on full MSR
 intercept recalc
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Like Xu <likexu@tencent.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 12:45=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Tue, Oct 20, 2026, Jim Mattson wrote:
> > Re-apply the LBR MSR intercepts in vmx_recalc_msr_intercepts() if the
> > LBRs are currently passed through, so that changes to userspace MSR
> > filters are reflected in the MSR bitmap.  Unlike SVM, which can simply
> > rewrite the intercepts in either direction, leave the bitmap alone if
> > the LBRs aren't passed through, as a filter can only force interception=
,
> > never prevent it, i.e. the bitmap is already correct.  Note, clearing
> > msr_passthrough to force vmx_passthrough_lbr_msrs() to re-apply the
> > intercepts on the next VM-Enter isn't an option, as doing so would
> > leave stale passthrough bits behind if the guest LBR event is no longer
> > active.
> >
> > vmx_recalc_msr_intercepts() is invoked in response to
> > KVM_REQ_RECALC_INTERCEPTS, which is raised on MSR filter updates, but i=
t
> > skips the LBR MSRs, and vmx_enable_lbr_msrs_passthrough() does nothing
> > if lbr_desc->msr_passthrough is already set.  If the LBR MSRs are passe=
d
> > through when userspace installs a filter that denies them, they remain
> > passed through, and the guest can access them without exiting to
> > userspace.  Conversely, if a filter forced interception when the guest
> > LBR event became active, relaxing the filter leaves the MSRs needlessly
> > intercepted.  Either way, the bitmap remains stale until the guest LBR
> > event is torn down and recreated.
> >
> > Only x2APIC MSRs are exempt from userspace filtering (see
> > kvm_msr_allowed() and the KVM_X86_SET_MSR_FILTER documentation), and th=
e
> > filter is honored when LBR passthrough is first enabled, so KVM's
> > behavior shouldn't depend on whether the filter is set before or after
> > the guest enables LBRs.  Drop the LBR MSRs from the comment claiming
> > that they can't be filtered by userspace, and clarify that
> > lbr_desc.msr_passthrough tracks KVM's desired interception, which may
> > not match the MSR bitmap when userspace filters are in play.
> >
> > Fixes: 9254beaafd12 ("KVM: vmx/pmu: Reduce the overhead of LBR pass-thr=
ough or cancellation")
> > Cc: stable@vger.kernel.org
>
> Meh, this isn't stable material.  Unlike SVM, where LBR virtualization is=
 tied
> to a pile of other crud, if userspace wants to filter LBRs on Intel it sh=
ould
> just not expose LBRs in the first place.

The functionality is not equivalent. For whatever reason, MSR
filtering can be modified dynamically.
