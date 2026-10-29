Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793310391;
	b=lLET+nlcef53j74sUzAl/FmKvO3lzhd6SYJBTe7qOZwkF7++D97r1Ej3HyvH/ZhVYNFd
	 CWE25Fe8DAELiRkYLUE46b6EQn1I8oX05MxnzcpHUniKfvqh6hLYpY2QVLsa34P2fJAXH
	 qJZpSR/wVfrne60kgPckzW82JIG5VVQ7/cKUt75chg0yhCwLMc5n238YpZbyrAQWn2bTD
	 67P4R0Tkg3gutuiyYi5HVR0/f1/y/vk5zPgi6aUZA5qN8IzPUy8aIQjeS+aVnOAMTvCnf
	 JdAYtBJLXCaOguJ8LawV4KnNlOp71e48bkmhIDdg/jA16wAXIY7Z25ztA/5p7vWG56A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793310391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JYWLRbAAA76l2zIS8Fp/p/vFZPUiy9vOWrroeHgM1YQ=;
	b=NyDK6OgyoAo4jN4zwUbS14RenYGA8XEc/b3j+Rd+nVbq12Pvif5A1aSo3Pzesma546vf
	 MD10kSU/U4lhkuyvjCJOpKl8qWEqVskXEtLrUK5re/xHp50WeehC5ImhmTY6/pWYhsOkL
	 yrZayvHWM0V+hZPizFjjC3i8UQSy/0S8mKzbePVH/iineUqhP5+k1TbwHd93m0Cw0nAHC
	 HJXziRNFPaHFftkdiwiPwfx7ioGqWXfzq8FGs5rfI1AfpEmRmWjfsFIq/MGxpxCDeM7Lp
	 rfvbMPCz5H65cK2bOZxYO/88yTYaUMB9//DvgsjIO+ydAfrpTmaAhPXrWpcwXj4Kv2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=I4dlR2qi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C26606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9C26606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=I4dlR2qi
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso1769a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:46:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793310389; cv=none;
        d=google.com; s=arc-20260327;
        b=rSVxy2QNTZqK5f5iKS3snavVUgYYerJ2qa99nV7mBiKd53MX07mX7ECGd4DNGhr75L
         z5txVm1F5lG6D8ZXFikDkMcHJy4iNFY4E6t1cC2jfTLTtusYsOW1bC8LisiDogaojyMb
         17V0eok4usmBqlQv/dtll60UA2QXt8uVWcQ/rMXOVlR+0vhbEkkTS2JDKCtHrcRUcPy3
         4qq4/trXxpMQHJsD4xSZlksZn6FWmr7hKz0oTEdxgPEXoQkgIRsE4pNNKJvv4GSyCbTv
         ZLdOybwkw9oLiG0U0BmVj2YMCL5dnI41iWdsVknV4x2U/dSTr4GPCpIFCIraI9s70Vdh
         Q4pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JYWLRbAAA76l2zIS8Fp/p/vFZPUiy9vOWrroeHgM1YQ=;
        fh=aPe5ntlvOr0J2rXU+gtuRyCCTMd1cJHuFvDEpc+N/Pc=;
        b=ZwO557uCJ7wG8Js7Se1S9feEqV75NHVE40AxqB5O4l2u4Cigyg06Ev+cHhV6+1iGqF
         avuVHcnTHBKZ0ImUejIlZnx2riDqYSUKqLGggidv0PVv2xRS4q83dgSwzzScST+FIbYd
         MWds1Su9waqO8ZwWMfSjZLgJHn3Fg4wjsugJavvL0cUHf6aT610d/yca/RNS9PTKRx8i
         9nJguiIlE9v8jaZIl7MKv91kuVvSvbyDF63RxTpeOl/Fr+nnZanpSLwe7bhaIJIFRTdS
         zEwmK63zi7zPBDYiN2uQ8NptV6Y7bIROxnRAFReTfuNlU91uZBX8GkOLLn/vBcwgxHm+
         UYDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793310389; x=1793915189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JYWLRbAAA76l2zIS8Fp/p/vFZPUiy9vOWrroeHgM1YQ=;
        b=I4dlR2qix7SJc+PKkii8t3EDI4Z1KNkJtuR7HIXzCQGlrGjd05cDkYsOP1Hy2gc8SL
         Dx7ws/yC2WOhs1JcQ3A/N0YeCBWkN7koRnbZPiPgDxgasN4XOxyJYID4szwRS1IMVvYi
         LaC+kGQz0BCU1J8SCGHJ7uht81XdB5VOtE9MRTvRUBv19uHqFg+20+xsNnBIBA1kJrhZ
         t5LN2BTVIfjEHC6wfin9bGH+9zy99Wrm26cqz09K2LpPwUMS4L4NB6MPSeeHCrx1/aBn
         mkYwEkxU8/LNldnQ74li+oujcyRvQLfzMfjQVjOj+Z2pk8M5iQUcYSy7EA9TwI03aV0H
         UoZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793310389; x=1793915189;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JYWLRbAAA76l2zIS8Fp/p/vFZPUiy9vOWrroeHgM1YQ=;
        b=uTfwWY+fpsr6gOCYUbjXpJzAab4nxY7n8HkyWiMp8PHZxrol33ZSndF/V1mxfP9FDN
         FQSPN17B9PQSzywooHL8K8dsJCDhpi3yacmRfjDxxj8B3z8NCLRdNfh95Ze52z+ubzcI
         9Im8Trj9l7lnqqgK2JAFf2VJM68KYywoDm/pukBjedJ+jbVjuYJjtzBMyrG7HCSz64vP
         j20NTWO4jZIbvBorIHX7hJOyZnknTobTMic8w/1yfPsm9VVmpiZu7iGx2HIKnuu1qPk5
         Og7bg6157I3GQdxXMti2XKXQflJvb2upVH4nXfxCLPv1v0XPLdn/z5WoUmjacJBIdkuc
         CgsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDu5NEmJiRahndabHzJ7tyeHOhmK8gX/y/GGmI260PrD+qYnWdXGUBV9+e7nsC0OZjMAnX3StCXl70TFU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOjkzDURFGMpWJ7+F552UTHXQoFGhN/3hkHe2r5LXLuca70I8T
	YlPP9ErN3sZNabzdqq70jOX3c0WyDIZmk6a1VitHELjJMrn4N4SR4gvvPwCiTr2PBN3aTw2v+Tj
	GyKPx+OSu1lD+gM2r+6apC/Jury8pa+Grcdc4tC2b
X-Gm-Gg: AYBFou2zgjvh/GNE74ZGTeWtdyQXj0lh4uhDVdbwyIWfHQhu/BBG1Uo9WDFZ+YCNC6G
	btf5CUKrDNpPHVpsMWCpf8/sKjDT3bfYavmsnqmOTjeE3OcO0aZpztdxgxGnbk5E/WIPQO4fj+c
	hB13mqkulP+6O7fJy9wuXGbH0R9DIkZuTFs9gSI5Ts27iPdB2e/1eEW7+AYXAhglBW3lYPE8bF6
	l+kEQxkN2LvyY3/BY1ql46cseyF5xaFw0s+ZXhJcFXDveySSL4aOoesu/Nu+YIoR8jd7Zdp7cN2
	Mf+rF6eWYeKMGVz+oYydiPwbnGwvZXLrooYq7hB/lVcvr4cc8bwLur5nqWvr2KeXjb2jKqpRPhG
	6zbEJ6YlyASLde0oRlehV3PpV/CIKN9xL1fRV
X-Received: by 2002:a05:6402:44ce:b0:6aa:b72b:d762 with SMTP id
 4fb4d7f45d1cf-6b4b0e8158emr110491a12.1.1793310388718; Thu, 29 Oct 2026
 14:46:28 -0700 (PDT)
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
In-Reply-To: <auO4UueaV0mTVzzB@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 29 Oct 2026 14:46:16 -0700
X-Gm-Features: AclHuK8NZLJIX8QRthineYRqVAWzP1LKOquD4mrybMuUOVfeI9RwEH1_rstJFFw
Message-ID: <CALMp9eTKXa9v1TxJMPrE-tSXajwJCErCk=g34dOPJtG057t5mg@mail.gmail.com>
Subject: Re: [PATCH 1/3] KVM: SVM: Check EFER.SVME before updating MSR_VM_CR
 on guest writes
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 2:19=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Thu, Oct 29, 2026, Jim Mattson wrote:
> > (Host- initiated writes are allowed to set any valid MSR_VM_CR bits.)
>
> Eww.  Why?  If we allow this, then we'll end up with the mess where the g=
uest
> can't write back the current value (if userspace is being weird).  I get =
that
> we want to avoid ordering issues, but there's *already* a required order =
here,
> unless userspace ignores the failure from svm_set_vm_cr() and continues o=
n.
>
> KVM doesn't advertise the MSR as something to be saved/restored, and none=
 of
> QEMU, CHV, CrosVM, or our VMM appear to save/restore it.  So why make tro=
uble
> for ourselves?

OMG! I didn't look any farther than the obviously broken svm_set_vm_cr().

It looks like svm->nested.vm_cr_msr controls nothing other than itself.

It's just 5 bits of storage with some weird locking rules, and it
resets to 0 on suspend/resume.

What is the point of such half-baked support?
