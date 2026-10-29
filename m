Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793287068;
	b=vt9M6DOqnHTzZIeulbxcg5sb7dLcfBqIiUeOEY+s3G2XvVwqKVcA2HDwyaTaU30gnY1Y
	 6iYBlANG2dE0ozuQaII/Fpud62C44fegQBJq028LbZSpWlJ2NBEEPU1MomBNN9bSCNDUV
	 mqDpqWWVJkysm131P2xoplcUwDe1mEy9hriIiZfOHz8X7IHMC5EFkNGG7tr3ViJf9Oo1f
	 AOGJHX/fNiH+gK7qY/q2lgf8twl5llMdkBXXQDTJM8spfE6tnl7cvv8bOGeSfZOIATZcp
	 GSsFJoZz4zE5WTq9oucDUk27tpwRKk2V1nwQ9V3ZoXGSj8aC0z4w+8RGt762JOhllQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AbTJQnBlN+pvqKG1klAFs8PHaT7iP4av50nNUNBWkKw=;
	b=LwUHqNah0631YF8uDF708L5rZis0fu9AnCzT07k+99o5A+sFvHf7803R7I6P0yH9InOo
	 TJDDAHqUCykUco4IXiVFFejYcSuMpqLZ1eIegypTOlWrw/xX0SjHQSvbJrD6xaSOloZuA
	 /uxk3UDZah/mo1TyXMraHAd6gqHo+1RQB9ne9ra218VCNZGklconxDq9eouGhrj2By20o
	 RGRx6oFqXSu6Kq1w2YxBBvok8brRbJ3rednn4yqqechfhHhC5SzYPv9NDhRp+5Ajv6KnH
	 e2yFlHX0t58ERuxYlrsYqslMW3J8m6mbWDBWuoXrB7+mHvHmbQpHmkfQ2BYI4lMNwVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pdkgTWm7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70020606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70020606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pdkgTWm7
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so13309a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:17:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793287067; cv=none;
        d=google.com; s=arc-20260327;
        b=o4Gt2YMMY1VdvNG4qYbjHwtfM6Bk3PXafQusMDKxDg4+lt2C3YHoQJsu1YaXP0Gkwm
         8icO+Tq5jYAt6GIVXlmrH/rG19fHWxcHb9qSxGlIvCvmKtKw/EmdpbXstiHRuxBXmwge
         XWLDLaO29e5C8KP2Aa9NOskj7vEGlHMfoWAvhJJFQtoTYjgWQRK+L0aTnMwHXnN0Ngy3
         wHcXnr+6EVvWsGIgyjcZnBEdQsBD+uPt+4Ijz649gIq2zXvAdJbdZWIAnrkprvpBq/dD
         aMOam7O2TsOVSet8aY5jOSe3hphuUk/dsTByKkrjBqeMB9uGFU9DXDEsqmQ+ph34EfF5
         JawA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AbTJQnBlN+pvqKG1klAFs8PHaT7iP4av50nNUNBWkKw=;
        fh=2FuVTbEgRjv6EJwwQy8jBJUBD51Q3susap8WthWHIaY=;
        b=NRtKnvk4N4BVEXSM79y0QV5hWEO3veh91Qkx9ABuLEgErp1A32/M6SmKhM3CISJt+w
         pTNDImw0092OKNdPKE1kpUJb3M8cEQbe85WxVaf8HU58lDNwx6qwukzVYjuyPAztt1S5
         sB2zjCKVxIZ/x3derVJ74nJUIGCIpzsqqM0pOMm2L/S+dc0WW3JQxSw8ljNSoeu0SS98
         UFpYf9Ywy0E3d4/wcnjFlbIJ5EcFlbY5tXZobgL8OKxNF6bQAZEErRfN1p13HfFpbGG1
         eiKJeb4ejhHge9aYA1eAi2O8r6uIA5f6ljqzUe+m3uS4Y/Fu23EeT5nK/d7nWfqnB856
         fZGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793287067; x=1793891867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AbTJQnBlN+pvqKG1klAFs8PHaT7iP4av50nNUNBWkKw=;
        b=pdkgTWm7tofy1O2oXfWkE6Y6P9fz0F3R+LY9mPxymq4mh3t9QTc+C85u42unFHOkgP
         1nJrysrqvWDmImETri83vopaH2eAaWAYDmkD662fqjMriP6igDBB66tnFswHkOj2kSUp
         FmEB2l9BSB7fnGylR03Isbbpa3HbHG+d2gNFBDI2XQohDomQ6XrQs2xeD9DyzMQNb77y
         tE6QK85CCp8SCPmCFShGCgVxR+e4dJvt6fR4p2+IJbn0OYwnq8bDxo2t3iIoyIO7WmfF
         WSXcFRJHq61aV0GkPrzwKaRcQNMRjzj0bkfjZ1EP5v0Xfuc3UOGd+owErnAT8Qlhkwr9
         FfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793287067; x=1793891867;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AbTJQnBlN+pvqKG1klAFs8PHaT7iP4av50nNUNBWkKw=;
        b=CzSpDTsGD6I6awr6bKMV5LlXSmHZcyrmF6T2vuLrGiz69ODl/tfYZxwxtSnpf49DwT
         g9hG/9S3s7aYRIrSoYzPzv1b8a2XWloVTeVeNNqnk+4LM+FkTnaMxE9iqPfYs+p84+8R
         +h8cb/hDaXrVxqp7LvmDJBZil4Pr4uA9nPsOeCY2/WN3M3VG0HHAn2D85ZqFH2/b6bN2
         qCBvonV63Jcweo/rfXV5yItkZ5ZC4RIWQvJ1vCYnsIvgOf97L3XY8m22nD4XXRMmIZM8
         cGM6/skflwg7RbLd8KGz+dnODVKhMG5OjlhfIPwtQWAjT/gyna3VZp/hwm601agqPxHZ
         gFOQ==
X-Forwarded-Encrypted: i=1; AKwUvByT7VYX0oXGTrlxL9xvl31KAbPurao3v7K7HL+hWVJZPmw53fCmm4Kl5EcKkwsFTgI0sI8zr6ZgJFFypzI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLv3VNcWZSR83xMBWM4FZh4wLVzClSIa5v/LqXxETItGxYQG5ws
	uxRlW9fa3chIfP6RXfnMJ+RwkSpu2zQGedpPpz3E/Fs9jWCFGRUYhzIkqv+4JMkYCOSob+Jf5fb
	WLNPlIE0YqEMP5siMNqK3mExysf56gyGB5QiMkXa+
X-Gm-Gg: AYBFou2knByahll8yiCXrUM8S3Znc44ayBlZhQbBNcRMaeM9GshygXCGsiahCJBowNb
	nOpge1CBvYwXd2cwpjRb3VeocThuRP796w02KT9rYMGJvTeF0101dJPO0K+JYFxrfrnYM7cVqcW
	hqou6ZIQS5S6yJeXrHoV5HiLe0pA/W27+4f82Bs/GWVhD9o21W8M52ls26dvkVKin5McqUzyS9y
	YZ5OEgdbOGW47o6O2GhHw1Jk4OIzcKDPVjYgEh9B/eHNEojPK2n5DvLZyKqdZBaj22KuojW8V1R
	rLoiaSaRAXZoU2W+Fi9D2Bj0RrvM8m2qlxbfmjOsb8F4a+cAXFynjT0zKSptjpS1fi6j7eX+jaa
	GcrL1hCynOzVfT++6spSL9WTl0ki+zDDdjU/t
X-Received: by 2002:a05:6402:305b:20b0:6ae:188e:e119 with SMTP id
 4fb4d7f45d1cf-6b4b38e71bamr62668a12.9.1793287066191; Thu, 29 Oct 2026
 08:17:46 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029024005.575065-1-chengkev@google.com>
In-Reply-To: <20261029024005.575065-1-chengkev@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 29 Oct 2026 08:17:34 -0700
X-Gm-Features: AclHuK-ibUT22cMMhhMbZ12t_iaUe3kZdk_OoF1b8jtJuWxJeYHY-_Y434LwOJ8
Message-ID: <CALMp9eSvG5Kfur_3JfmrBjwAGi0+oJqCnFk4LqADCJfeh+0k6g@mail.gmail.com>
Subject: Re: [PATCH] KVM: nVMX: Synthesize advanced VM-Exit info for emulated
 EPT Violations
To: Kevin Cheng <chengkev@google.com>
Cc: seanjc@google.com, pbonzini@redhat.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, yosry@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 7:40=E2=80=AFPM Kevin Cheng <chengkev@google.com> w=
rote:
>
> When synthesizing an EPT Violation to inject into L1 in response to a
> fault detected while emulating an L2 GVA access, populate bits 11:9 of
> EXIT_QUALIFICATION, i.e. the "advanced VM-Exit information", with the U/S=
,
> R/W, and X/NX attributes of the L2 linear address' translation.
>
> KVM has advertised VMX_EPT_ADVANCED_VMEXIT_INFO_BIT to L1 since
> commit a0efd8cb221f ("KVM: nVMX: pass advanced EPT violation vmexit info
> to guest"), but has never correctly populated bits 11:9 for synthesized
> faults.  Originally the bits were pulled from vmcs02.EXIT_QUALIFICATION,
> which is stale and/or holds unrelated data when the fault didn't come
> from an EPT Violation VM-Exit.  Commit 96b067b59ad9 ("KVM: VMX:
> Synthesize nested EPT violation GVA_IS_VALID/GVA_TRANSLATED bits")
> correctly stopped consuming the stale vmcs02 data for synthesized faults,
> but nothing in the synthesized path sets bits 11:9, and so L1 now always
> observes a supervisor, read-only, executable translation for every
> synthesized EPT Violation.  Per the SDM, bits 11:9 are valid whenever
> bits 7 and 8 (GVA_IS_VALID and GVA_TRANSLATED) are set and advanced
> VM-Exit information is supported.
>
> Fill in the bits from vmx_translate_nested_gpa(), which already receives
> the effective L2 pte_access (for MBEC), rather than from the EPT walker
> in paging_tmpl.h: the L2 page attributes are not EPT properties and so
> are not visible to the EPT walker, and the nonpaging L2 case (CR0.PG=3D0,
> where every linear address is architecturally user-mode, writable, and
> executable) is handled for free as nonpaging_gva_to_gpa() passes ACC_ALL.
>
> Skip the synthesis for EPT Misconfigs, as the walker doesn't initialize
> exit_qualification for misconfigs and the injection path ignores it, and
> leave bits 11:9 clear when GVA_TRANSLATED is clear, as the bits are
> architecturally undefined in that case.
>
> Explicitly strip bits 11:9 from the synthesized fault's exit qualificatio=
n
> in nested_ept_inject_page_fault() when L1 isn't advertised advanced
> VM-Exit information. Previously that was implicitly guaranteed because
> nothing set the bits in the synthesized fault, but now that
> vmx_translate_nested_gpa() does, relying on the bits being outside the
> "take from the fault" mask would leak them to L1.
>
> Fixes: a0efd8cb221f ("KVM: nVMX: pass advanced EPT violation vmexit info =
to guest")
> Signed-off-by: Kevin Cheng <chengkev@google.com>
> Assisted-by: LLM
> ---
> Tested on hardware with advanced VM-Exit information support by running
> the vmx kvm-unit-tests, including a new ept_access_test_adv_info test
> (will be sent separately) that exercises bits 11:9 for both native
> accesses, where the bits are propagated from vmcs02, and emulated accesse=
s
> (string I/O), where KVM must synthesize the bits.  The emulated cases fai=
l
> without this patch and pass with it.

Doesn't this break tools/testing/selftests/kvm/x86/nested_tdp_fault_test.c
on hardware that supports VMX_EPT_ADVANCED_VMEXIT_INFO_BIT?

In that test, l2_test_page is mapped writable in L2's page tables via
vm_alloc(), and l1_vmx_code() asserts exact equality on EXIT_QUALIFICATION
without expecting EPT_VIOLATION_GVA_WRITABLE in TEST_FINAL_PAGE_UNMAPPED
and TEST_FINAL_PAGE_WRITE_PROTECTED.

Also, rather than only adding a test to kvm-unit-tests, please update and
extend nested_tdp_fault_test.c to cover the advanced VM-Exit information
bits.

[ ... ]

> -                       exit_qualification =3D fault->exit_qualification =
& ~mask;
> +                       /*
> +                        * Always drop the advanced VM-Exit information b=
its from
> +                        * the synthesized fault, as they are undefined u=
nless L1
> +                        * is advertised support, in which case they'll b=
e filled
> +                        * in below from the appropriate source.
> +                        */
> +                       exit_qualification =3D fault->exit_qualification =
& ~(mask | adv_info);

Why set these bits in vmx_translate_nested_gpa() when
VMX_EPT_ADVANCED_VMEXIT_INFO_BIT isn't set in vmx->nested.msrs.ept_caps,
only to strip them out here?

If you gate the synthesis in vmx_translate_nested_gpa() on
VMX_EPT_ADVANCED_VMEXIT_INFO_BIT, then nested_ept_inject_page_fault()
doesn't need to be touched at all (or better yet, the mask dance in
nested_ept_inject_page_fault() can be confined to the 'if (from_hardware)'
block.
