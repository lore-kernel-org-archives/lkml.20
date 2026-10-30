Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793318458;
	b=ayMfYvP/h8pbmJzPEw2JL9tpmk+6fX3jg2/7yk9KPU2/YGBeQMZXIVwm4ruQdzsZdK7p
	 /ltRPftX/zO2mAT8PnEonJ3nGOw/VEmRKCIu9gRQ91n75PMVcIPx1iCc73ZF8KWFMiAdr
	 ddQ/ULIWNwgmtc9OMRrHZo5hRsHWaLP9238rDiM3LIS5iUD1FULl6XlNQJRsQY8tqQKoU
	 R+o/7hb1VgaYcJpdcV+nkCZwYH4CcPTO6tftPRqEWni5ariFzoaD7u/tQdCn3w6ZP1rhj
	 DSzD99eVbDNAr6XUM6uXuj31ElBUf7OF3eRdfEFpQYGRaHFfW+nZDmrqEIOY/GkL28A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793318458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6AajOicrvuRgSKCOUIMtr9ZDlZu1f1csRJX+CeX/PXg=;
	b=R4t1+FO8S5SvdVwBNc5kyPCGfD2y8xOyjVoCTi3OJUGwMZyUMA4fH61iOE43IsCWi4+7
	 DVEICAjok9eN3YAc9/xuapbXRsNIw88F03wuJa6dzwizoIxuIZiunKu2d0TUdGtC1M1Yg
	 yEp94KAOQUReYubUeytL3/eSMIjVXgiN3h38/GI+pdQZbrLlfQA4SUdY1UyqfpG1MA5xE
	 YwbKZyJODKL8SvzMsz4OsVLyhROtDHayLBbSN/ITWODhWYCpXmTTOfGV245P3cqrQ4/+s
	 vfmx9qziSGP6Pc3+TuRp8l82uTtmz4EYK2GWoTDnCw5hBpMpsiERyhS1X7kfjThL+XA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AW1HInfw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D491C606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D491C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AW1HInfw
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso5774a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:00:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793318456; cv=none;
        d=google.com; s=arc-20260327;
        b=f0+tl2nAGtkns/bA/Fml1xlblWfoCPzy7N25WhSl0PbGZmjy+/Xk/aYV8433LlEuJi
         7mLGoOiH9nf0tbVVfwKKVPkdqPsRnCrE1yseco8dEUo48nzDgMSGZxx6MTw7oUWtM0Yu
         YDfpnx4DofnJBnzINICb6apY67tG8vwtvaOHfkotyMwP9IBimZZf5AG04ykj7s/aFfiC
         1p2SYmdUAgU5Gk/YxFM8gGfQm7NJK+20qHSXhztA+msIWLYoekxCEdbcY+8dGanTBjuF
         GBOiRyNcLQ2Ov8FGgr+spicGCbB0nJ4onYREn4wGt11NHpUngp343FvjqpiAp+MhKeJ1
         WTZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6AajOicrvuRgSKCOUIMtr9ZDlZu1f1csRJX+CeX/PXg=;
        fh=66+QzqHcdpH9xSJD0acqB2QV5aNT7XXPdutZ46sdC/Q=;
        b=i50fTYCiRXzoGSPU584O+vf+YMkLSeJdSvcDRaJPaNNiwzVm54nZZ3JOdH3TE7YBPz
         JjziCSPkLjNva+rrL9NTDYyv7hhhKnoifmiiXRzUdVLu5ahKklcDfvPu+kvCRN6G9UdP
         mD4P3YAX7D36QOMIjdr/IUWoBc/4ei/05dgqK2uffljf0a5iCDm+1vrmIrpLNTELcKcQ
         S93G6L4OPcD/oTtpMb3f0DLR1OkqXfLhAxEn1B1kw6xMNPu8kLHidwAc++4ZshEf160g
         De0OF1ICPjv5CKw/qEoMTpovq6QvZUttK8+0F2ZnZ0I0QwE4ESuImIAYIOQKQCo4AaIi
         nlQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793318456; x=1793923256; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6AajOicrvuRgSKCOUIMtr9ZDlZu1f1csRJX+CeX/PXg=;
        b=AW1HInfw6hVPfoRvD736sYB3zTE0cSDxnVw6yygthKUGTF4onkFNlGmz4/caAqgUU3
         SDwEL5QPayGRF6LFj2d2Yvse1adS39hRumxe2SFEHm5nGZYUo5Ma7D/hvm5HOuoTJYxH
         vLMH4gHyoAjN2cMOL+tNZbe/vcN1I4XdQN+B+dnDclu1g6hPdtWxTTLKHVX6SOhbm1nq
         WDci24T9Kih9hvtVH4F/Oc1Cu+7+rDtAxm1UfsuTZs/TNYHzzBx2cCIZE/LARAvKGlQi
         lJb9LxGzIlOhDcTPXT9GBq2MgmvebgHNmW93Xdp7GyGMYeaCS7FMN4Roth16XZtyV6me
         TI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793318456; x=1793923256;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6AajOicrvuRgSKCOUIMtr9ZDlZu1f1csRJX+CeX/PXg=;
        b=g1WW1eoCCtRnAObLQj4k9ZQN+WvHHxDx0qIb37B89uZXof3Wrla5T1HnM75/cv3pRF
         A2IsnQvfWhZ0Kugza56C3UfiebIR0T11e/IDP3Drwx1e/ofx1TassDvsgM7ZRG2t57vp
         Me7iRKeMggzyxihH6o5HBC439iKyxnDp0lb6MU5Qa2cmyniy3h7zbys9+wMv/p8sNu+d
         932wgmmD+uKrFqJqZcW9byze8gx3DwBaDS3Z4dREztFPnSQv5WuvW3LPil2rFS7hPG/d
         R8Q+y4txeJVtgwJrRyL7ewVNiXt1hISElE6MnzjzGQvuXJgfqJ5sqwuu91kS+gJ4D4Za
         65Dw==
X-Forwarded-Encrypted: i=1; AKwUvBw1jT5FPZRQCRXwXBPT5G6plVdyhcAGXl1VB9a1Jdoe7z2Q1Yz2GkusqFUaPo2NXQ/F99h0JIeW6z8ylmY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDggsfddPvwrx0pbnhu7BkKwfT3OHfDd4Keb08v5E3frCCBBHI
	qTw3UdcjtpM5GhmkDuiQPZa9CSzknGbW6fnUasVRAr7wsuVe6fVzX9m/mjOBhPnNbKwjVC6PeKB
	oHlDUZ5lAuiwfwaQciT2FETaKy6bKaFqVC99taCP1
X-Gm-Gg: AYBFou1Jj1BE6HXyO49lhg4KLq0svCgw03+BYRVawkWemafjhCHJja/b6IPGV1iVdPW
	j9Sa7wbStR8ZJKsNZVeDhflNr5EwYFs5H04SqygqgANM4ZrhIPnof6QFm0lGx9XIKWzHd8a8aN1
	uNa58yJZf1AvWrxMiY+UwFv26NnpDvIMZJ0zV3/jQMVERcnUeedL3rPYYyArvGWuAYqHL+fQ41w
	DLHV5aXAocmfE0xXYR4oxYRPzCQ/S65ASm84nBM0kX2cGjFcO3gRSv8Dg6S2CDyqynj+0orczVr
	k9JDeA0+RYZvgsYeBb+XaRzWvmP12iH1SB++KlaqEaLgw2i86p4QebZIdzmAnB5wSJ65AaJAv6J
	GJtXjwLowcJzoc5bjXHlbR0e4Wbj3lZ+93xMaFwDNsi8JDEpCkMuQJusC3Q==
X-Received: by 2002:a05:6402:641:b0:6b4:597f:50ed with SMTP id
 4fb4d7f45d1cf-6b4b10ef524mr124485a12.5.1793318455914; Thu, 29 Oct 2026
 17:00:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029202817.901145-1-jmattson@google.com> <auO4UueaV0mTVzzB@google.com>
 <CALMp9eTKXa9v1TxJMPrE-tSXajwJCErCk=g34dOPJtG057t5mg@mail.gmail.com>
 <auPAFxXy4ulcK_jq@google.com> <CALMp9eQdtvjQkdgnJ_NTt=2ArdzUtqqzieXLccv9Vb_My5G+fQ@mail.gmail.com>
In-Reply-To: <CALMp9eQdtvjQkdgnJ_NTt=2ArdzUtqqzieXLccv9Vb_My5G+fQ@mail.gmail.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 29 Oct 2026 17:00:43 -0700
X-Gm-Features: AclHuK9Gf9FXwfveb_3CfkAO_qfPf7-qk20lAd5kJcyEb-CP0c5NZ2eSdTbAAeE
Message-ID: <CALMp9eSgWhTFi1vxxnN=1zV4mRVsKD55F=37yg4LmT_xUAc_Pw@mail.gmail.com>
Subject: Re: [PATCH 1/3] KVM: SVM: Check EFER.SVME before updating MSR_VM_CR
 on guest writes
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 3:04=E2=80=AFPM Jim Mattson <jmattson@google.com> w=
rote:
>
> On Thu, Oct 29, 2026 at 2:52=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> >
> > On Thu, Oct 29, 2026, Jim Mattson wrote:
> > > On Thu, Oct 29, 2026 at 2:19=E2=80=AFPM Sean Christopherson <seanjc@g=
oogle.com> wrote:
> > > >
> > > > On Thu, Oct 29, 2026, Jim Mattson wrote:
> > > > > (Host- initiated writes are allowed to set any valid MSR_VM_CR bi=
ts.)
> > > >
> > > > Eww.  Why?  If we allow this, then we'll end up with the mess where=
 the guest
> > > > can't write back the current value (if userspace is being weird).  =
I get that
> > > > we want to avoid ordering issues, but there's *already* a required =
order here,
> > > > unless userspace ignores the failure from svm_set_vm_cr() and conti=
nues on.
> > > >
> > > > KVM doesn't advertise the MSR as something to be saved/restored, an=
d none of
> > > > QEMU, CHV, CrosVM, or our VMM appear to save/restore it.  So why ma=
ke trouble
> > > > for ourselves?
> > >
> > > OMG! I didn't look any farther than the obviously broken svm_set_vm_c=
r().
> > >
> > > It looks like svm->nested.vm_cr_msr controls nothing other than itsel=
f.
> >
> > LOL, nice.
> >
> > > It's just 5 bits of storage with some weird locking rules, and it
> > > resets to 0 on suspend/resume.
> > >
> > > What is the point of such half-baked support?
> >
> > More than likely, so that older kernels didn't crash when writing an MS=
R KVM
> > didn't emulate. :-(
>
> You're not going to let me get rid of it, are you?

LOL! Even the 'LOCK' check is wrong:

 if (svm->nested.vm_cr_msr & SVM_VM_CR_SVM_DIS_MASK)
        chg_mask &=3D ~(SVM_VM_CR_SVM_LOCK_MASK | SVM_VM_CR_SVM_DIS_MASK);

The condition should be checking SVM_VM_CR_SVM_LOCK_MASK.

Well, at least it can be used as a sentinel you can poll to see if
your VM has live-migrated. :)
