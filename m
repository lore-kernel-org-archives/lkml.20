Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793746379;
	b=CkhCl8/fRa8475IK7jtXLTQdgT7ysAA6tnqEhtyND+ALzVGusq8PkxYqjX6NT1hfbEMW
	 8GVoMSYxPZul/67rT5iqQhyk0AFGxsmMIpthXU5Sy6i3timqSIY1OYsg9vONkf8dSB2j9
	 /RHpmz2sGVk1acKmuZG66eA/CTS7+LKTfXOM0vbNwr5h6J/FNdDeTTDcsar8uHPE30k55
	 ijsoILt4HjQIEHOde830BRe2oXFFGDXg5fe8CkqNXmksQrvIzVQxBEg0zTweZizJCkkqq
	 /Cimg7xyUxiDoD01DechZZuz/4L/FUzYelB11Sq++yFb5TBihGIP5+8PEWz46Ro/3Yg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793746379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wU8VIKFjJ28dxbK4Nnp3pL9e9+Uyw+0nyAWTkSUuFuQ=;
	b=wUGEkCHX5GdyDEFCH4/oy1zSUw5kMQrETV1TMBlmGalsFWQ6KDGhYjoS1CLlDYS9fDTO
	 ojjB192S4q117N35h2sw1tcwrbbAgjdH9DvITiA0icjVoK4bsVAcgqztpXAMihu0tRoQm
	 MXx7PZmQRpARqPrK7drG717oh1Ou0evHqasJGMUd3KW+wHdbRiuWUtL0hs5w9EnzTZfvT
	 /WomUhe9cm3xdGus+Q20AWE7/a7TlQD/pkod8zqnplJMPOOEKyLh3HN9aSrwCrnd66Nlo
	 9Acq5P6WwZC8dtFoA+OAIhwXRyMXuHGmyW8SKazLmxw1DHBuyFaiV3gAmQBevwMjWdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eNGImLt6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7855B606A335
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7855B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eNGImLt6
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso1722a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:52:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793746378; cv=none;
        d=google.com; s=arc-20260327;
        b=HHPNk7E7MgLM6nb/RhfsU+KnY/3xhAJ9zL6Drr972TTvCs9perXpPIa02DrwsOFKow
         BeT4+fJ9sZ205znmwx8YYEXhCULxc4CrD+6KMdvfU/0c9dE642YyTB+ZeVCaKpPZ5eVj
         WilwBxuT1Ep6/G3F+KucXg+fnzOrZmFJ/A2mRLMasaCP/TGOIbZ6u4c72LZQ7OzwP4g6
         odw4rzjiqammFDN2jVA5t2U9eDW6v98QKzxEOrTZ57FdmmCOtcl2JhhYN+fo5oVYO63A
         oG38H1Gb9NHgITj6YY4IojVGFeeBAkUl2vvSmjVeN/ryWVkPwex8Mlhs1KRTvpjK2RcF
         bciQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wU8VIKFjJ28dxbK4Nnp3pL9e9+Uyw+0nyAWTkSUuFuQ=;
        fh=TY/J9xO7XI/9RddNPrTDl/+Uxc+qdVVTNGrlFAOuBx0=;
        b=EOgIOqKWmZg0Yr0lcW4k16MZAwKvlfeVMts4n70jkAFCoZZZO2o/eMDf+u4Aols9V/
         YhfYdc9j1E+EJ1Y9NFX0JtLKAyC3cXhxQ9nv3qX/7vaTJQOp8kVrxYEKi5cXybrEF+md
         3tO7Wv8wpt9i7Ju7DS7Gqz+0tV2FSLinRKQYn+ikzHYxFOuFxZm5r1pNUEHTQn7dVezG
         hkapfouizMyqEvF2dEHrx+OXmbT+SKT9lMVAtNw25FrG50m00XAaHNC/NFE2wiV0eatn
         yLP44xMwUjQH//Zq4wiuKkL6ZtbTizWJ7Q+VGS/FTvL9HL6/AhkFVI4ugkcTRytkXn2X
         mMpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793746378; x=1794351178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wU8VIKFjJ28dxbK4Nnp3pL9e9+Uyw+0nyAWTkSUuFuQ=;
        b=eNGImLt609/blukDHj+qIScHQh00PJevkjX3mOAgLa5iI/zNT/9ZVwf7BvzZ3MWt9E
         UGNWsaFthxVOeBQOZmvYjIqQtaWMKVFtVBHnJJHEfOhPJ4TQIOh4hwZCCNkEgzGFQNny
         iAyfqYKaBvouXJOxXlq/xRAzQBYVxsVVa1NvpILAnHkCORsuj13nMGb4GsOhCnRKx0Li
         UPqngc+U18phoHm9bPxQDopmqX/WqOMgvZCW0bb5kxfLQ4xupEeOZT4Q6q4BsQxuBX0V
         TsA9YPykslpZNErJZCYVnQNxm4L8C4nF2XEkCvdMQ6bgUFSXsu1kfQ5r8YBQAiWKQz36
         YvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793746378; x=1794351178;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wU8VIKFjJ28dxbK4Nnp3pL9e9+Uyw+0nyAWTkSUuFuQ=;
        b=h4y7ZqjYQcX1XxUG5qQZa4AJ+5h9+QoJj6vuRHVXU+ZGuyOZpOyske2M75XG0gVRsn
         xEef4omEdwKMieS+kNALu1qkcEEQ7JzqgyCA3CqL+FoIwR4fZwNkIi2vYMmLxMt8WIYI
         +A3v1jrhRQTSXgOaWWBKCuGew00AMJCbFsZn7ABUYnDoaDSXtwNuVmiiNsEINj1zCBrZ
         m8U7p1P9pYjwVL8XDmCe//MIZYsYfWvLTV1apGCg7sFOXOu0OIDuFkDoVRMbCf5Bhw3l
         7mLligxxA5r8Kbaj5T3vNaxwFhXS8ohS2IgjsE4WgmSZ58fEkfBbAw6F0NnDCQ4PRKzl
         WhfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMTfEDMIFA+ofJTqrkNj4zqxjDIBTWzQVGI8WDoZWNmYf5lCU1HTQEeJFez2QcCup1qhSkGOFeXx+IrJc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gkK6Sivx4uSSm6T2jpArL21Yo2qmHx73c+kE/cKSaD3djSZL6
	qhzpl0DRuPSxFqO5TO4J5bVea1J+OyMzpYn/a1Uv6nDQi6f66ByRArh/YK5KwEOxhDzznUNVFa5
	u2q/mDKsz8zOjCIJf9ds7O9JsscXg1WcN8E0icuW6
X-Gm-Gg: AYBFou3dLY3k9pOhoO/MrhBwVKrVLSnHdXqHX9DH3hAzKwMxl+QGFGn4lbbKG4bBI4Q
	0pIenb9UbWZFdCymz5rL2JneKKPAKpTN/ROl60GwJ5jlibJ549poILoxia45nqe6bk/H3zN6ctu
	N/7KD/v8gOVdN31cfbF1KhDXa9yqlsI2NF5MRwXppfg/FB9zLBOcxfh32RrUQq6kqMdrxH1x6Ly
	bKQjBFjIR5LCSY5F9AyKkX0SQjvwXZyHAFWH2rQ9OZCjWnOfrTt2OXKP3MHcoDLS8jneyqk4k+2
	1bkrCgcjgePfwFTk2KW8ZRt4az5cC57VkPwJbEt9+Q1FvnXtVUvO79tzWAZfF2WVBDAflQI0IdE
	YrdH2hVWpJedtp9lLu02uFoF/J/HDymba13Xr
X-Received: by 2002:a05:6402:c103:b0:6ae:188e:e119 with SMTP id
 4fb4d7f45d1cf-6b55ab86764mr7858a12.9.1793746377460; Tue, 03 Nov 2026 14:52:57
 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102231428.13523-1-pbonzini@redhat.com> <20261102231428.13523-5-pbonzini@redhat.com>
 <CALMp9eT7cnBf6kSXZLWuMyG9a52QveWjzzLz3Z9E=kPuX_ahVg@mail.gmail.com>
 <aukmeb9mV8b504T6@google.com> <CALMp9eTdY3=1BrOYgov852VeAy3+Os7bvhWogvB0YF-JQrmtig@mail.gmail.com>
 <aupLRleTJSIDTE9M@google.com>
In-Reply-To: <aupLRleTJSIDTE9M@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 3 Nov 2026 14:52:45 -0800
X-Gm-Features: AclHuK-Z7OQBlFOF2zRwnhwZ_UDz9nzcNqJTQa47B2hjAbqqScBEB0lSSXwokYA
Message-ID: <CALMp9eR9=JTv80HuG5zAcSj91tJos2ecFA_Sc5Qbs4s5XetKHQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] KVM: nVMX: Process each host MSR entry at most once
 when unwinding failed VM-Entry
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	stable@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 12:59=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Tue, Nov 03, 2026, Jim Mattson wrote:
> > On Mon, Nov 2, 2026 at 4:10=E2=80=AFPM Sean Christopherson <seanjc@goog=
le.com> wrote:
> > >
> > > On Mon, Nov 02, 2026, Jim Mattson wrote:
> > > > KVM needs to do better.
> > >
> > > Meh, KVM is doing pretty darn good, all things considered.  Yeah, thi=
s code sucks.
> > > But I'm not convinced the alternatives suck less.  We've gotten the s=
et of missed
> > > consistency checks down to effectively zero, module the TPR mess that=
 I do test
> > > by running warn_on_missed_cc=3Dtrue.
> >
> > I don't understand the TPR mess. The SDM says, "With the exception of
> > fields corresponding to virtualized APIC registers (defined in Section
> > 32.1.1), software may modify the virtual-APIC page referenced by the
> > current VMCS of a logical processor in VMX non-root operation. (This
> > is an exception to the general requirement given in Section 27.11.4.)"
>
> Oh, I wasn't aware of that.  I agree, that gives us an "out" for vTPR, mo=
stly.
>
> > I would argue that this prohibits changes to VTPR between KVM's
> > software VM-entry checks and hardware VM-entry to VMCS02. If the
> > hardware VM-entry fails because VTPR has changed, section 27.11.4
> > gives KVM the freedom to implement whatever "unpredictable behavior"
> > we like. Yes, that probably does include loading MSR values from the
> > VM-exit MSR-load list, but why complicate things?
> >
> > Something like returning to userspace with
> > KVM_INTERNAL_ERROR_EMULATION following a prohibited write to an active
> > VTPR seems far easier--and cleaner. What am I missing?
>
> My biggest concern is that KVM could kill L1 if an L2 coerces L1 into try=
ing
> VMLAUNCH/VMRESUME with invalid state.  KVM simply can't *know* that an un=
expected
> VM-Fail was due to the vTPR wrinkle.  Even if KVM re-checked state, it's =
possible
> for the vTPR to be "restored" to a good value.

The only way that I can see for L2 to coerce L1 into trying VM-entry
with invalid control fields or invalid host-state fields is by
exploiting an L1 nested virtualization bug (i.e. L2 is running an L3).
In any case, if L0 has already performed the checks in software, then
failure of the checks in hardware implies either (a) misbehavior on
the part of L1 or (b) an emulation error in L0.

> I.e. if KVM exits to userspace with KVM_INTERNAL_ERROR_EMULATION, then th=
ere's a
> non-zero chance of a false positive.  KVM could exit to userspace if and =
only if
> it caught the guest red-handed, but then we'd still need this horrific co=
de for
> the other cases, so that seems rather pointless.

Let's go back to the Xen example, since by your argument any L1 can be
victimized. If an L2 VM somehow coerced L1 Xen into trying VM-entry
with invalid control fields or invalid host-state fields, and somehow
L0's software checks passed, but the hardware checks on VMCS02 failed,
you would continue to run the L1 VCPU with L2's SPEC_CTRL MSR. Surely,
the possibility of a malicious L2 exfiltrating data from L1 with the
assistance of L0 has to be worse than the abnormal termination of L1?

(Note that I'm just playing devil's advocate here. I don't actually
buy your argument.)

> warn_on_missed_cc helps, but in practice it can't detect cases for which =
we don't
> have test coverage.  So *if* there was a bug that could be exploited by L=
2 to DoS
> L1, odds are good warn_on_missed_cc didn't catch that hypothetical bug ei=
ther.
>
> Maybe with AI we can be 100% confident that KVM performs all of the VM-Fa=
il
> consistency checks?  Again, I'm not opposed to alternative approaches, bu=
t at the
> same time I don't feel a sense of urgency.

KVM *must* perform all of the control field and host-state field
consistency checks. Otherwise, we risk priority inversion with
"illegal guest state." If KVM is missing any of these checks, then it
has an "internal error."
