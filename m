Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793310745;
	b=2BVcRKAeXQ5beH3M+B+StYtJBOu7mzazaW0KDoMV18TjAyeexIfnlpLShjnjF9C0e0wf
	 NCvnn94f+DodpJhEr9MJH/S3p6z2+gqV8GnrsQhR097DGXxFaOuTlAvwzI0jfGuIaVanC
	 tm5t6y3qRMzh4yVVYpjb0l7iZMUyHAuV/SmRFEGW3uC4k2QGTD4uBOtjgAFVZ6O1Zz5Z1
	 zAenG/gWnKDGCImCBAUYxJkSxRHTJgJTOcl2mIn6rmtQ6S3sKA2kzdlxEBqaX8qgIZ/NT
	 7ZO9Uaq+ol/M7wHDX6wCO4f30SBliQBa4a1a191guzlkZ5OJNMkriR4B03qJziOUHYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793310745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=9hubGuaWBIVJLpBbvvkgCy68Va0Ble3qI+p4rrOMI8U=;
	b=dCGFVCj40Vy4YS8HqhJRP8mt1Z7YPYEmSrN73MOjiyGeCg2b5Swop+sLB/t8zcvt3Rdn
	 cfxd6Vo/J6x8IDGvQNuEy+TwO0y3NLFu1Hf9QMyz5pTY2jAVkbOSmNOQiXMI5TrH9Lc8H
	 EiLCx0D5M6Xh6pRq5rOtzARsyGXi5zF+yFxkoPOrkrs4MYft8T8YjPXQ3s8Zr7VLJ1sD0
	 uyB5Fj7CGXZKNnyrA6+CloKLqj3nf6k/5LRsdWwRDJi7YuSsUaqx4hxjB1QxH9nCOuT6I
	 9z5MIMb5ODKPi89LQLG8vi2BIVqwLx/UD2D2fWujUoqclhn+UFCA+c3Maz6A5yoe+7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UoxpmelK;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435DE606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 435DE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UoxpmelK
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e8dd9b9743so1173785ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793310744; x=1793915544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9hubGuaWBIVJLpBbvvkgCy68Va0Ble3qI+p4rrOMI8U=;
        b=UoxpmelKpm9qa5OtKA90jq22WU41dhObIzezb/KbNxjp4D01x9arfXHeALX1Iu6dUA
         qh4EzHDCOPu6kRFUE5b/yVwfE00nZv41AIa4b0fL5/NS/C+6pxNJhLq4aH93SsHR/yQE
         MDpIhRbMfbmWOgMS7H2m3C86V0PEVq0mnr0Mx9ar5jQaY+p2HmFbT2U8mCAMopjeKueD
         tdn4mdb1JX6FN/7BTE9RUjs/eNtWXR9F7E+RFhmtUGBo+lddAmiWJZWP6ULgdIe50p8e
         iC4QZXXNIsF6pMajwI/5v8chznRe3nKCEUyKjq1NSJC68qOFe67YRDEUCXbVp+qUNvh6
         poJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793310744; x=1793915544;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9hubGuaWBIVJLpBbvvkgCy68Va0Ble3qI+p4rrOMI8U=;
        b=uatYWm32DfvLQeXvv+rkkEvhO44oksZeMGroWcT8JPQonyXEybsNKhGo/c5QcDPqlW
         D/jGQdNXXw0wwyTuwinBUTpPPjVvTFtYl7403o/Xgdy8BgwVZoLrTwojw10QSZMqhTJy
         uBzlI1VZMe05uzZnhT/1MUDdyuk7CTv5iaIJwML+rP+wpLTPB2AJXxja9HWHn2yw2rT4
         oa0xSYrr49MJeLhV4PC3XuBmvgwEYov/sdU9J32F66UAMmlN8Zhp+pgFatRvlO9PJbmB
         eyTlTfhSjJ49E/jZOieHQX6tOzTh8fOMSCHFdx9UJ3lIgUHXsQtTjDsf8tZC+uBWgDLw
         sZCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZE2Ex7dCdwZFo8UoGN9EoTVDv0iVXMQFpM/q2W2nJbtJfqNnx65G7tW8hqjpDxWJr2a18Kc50jE/xqxc=@vger.kernel.org
X-Gm-Message-State: AFq9FYInjsmZG6zxHEwCQwmydDdcQolMSBEfFpsW6wjt51qDxsS5jTiS
	cpptpfDXuOnQAz6rnaBReygoMKELu+wx4NfsdlT5UnmIRLy1bncoEbvmr8SwMTFIEQTE5LyTmZl
	nfa9IBw==
X-Received: from plrb5.prod.google.com ([2002:a17:902:a9c5:b0:2e8:8642:f035])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:986:b0:2e9:7719:40f0
 with SMTP id d9443c01a7336-2eb364962ffmr5977675ad.19.1793310744369; Thu, 29
 Oct 2026 14:52:24 -0700 (PDT)
Date: Thu, 29 Oct 2026 14:52:23 -0700
In-Reply-To: <CALMp9eTKXa9v1TxJMPrE-tSXajwJCErCk=g34dOPJtG057t5mg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261029202817.901145-1-jmattson@google.com> <auO4UueaV0mTVzzB@google.com>
 <CALMp9eTKXa9v1TxJMPrE-tSXajwJCErCk=g34dOPJtG057t5mg@mail.gmail.com>
Message-ID: <auPAFxXy4ulcK_jq@google.com>
Subject: Re: [PATCH 1/3] KVM: SVM: Check EFER.SVME before updating MSR_VM_CR
 on guest writes
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026, Jim Mattson wrote:
> On Thu, Oct 29, 2026 at 2:19=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> >
> > On Thu, Oct 29, 2026, Jim Mattson wrote:
> > > (Host- initiated writes are allowed to set any valid MSR_VM_CR bits.)
> >
> > Eww.  Why?  If we allow this, then we'll end up with the mess where the=
 guest
> > can't write back the current value (if userspace is being weird).  I ge=
t that
> > we want to avoid ordering issues, but there's *already* a required orde=
r here,
> > unless userspace ignores the failure from svm_set_vm_cr() and continues=
 on.
> >
> > KVM doesn't advertise the MSR as something to be saved/restored, and no=
ne of
> > QEMU, CHV, CrosVM, or our VMM appear to save/restore it.  So why make t=
rouble
> > for ourselves?
>=20
> OMG! I didn't look any farther than the obviously broken svm_set_vm_cr().
>=20
> It looks like svm->nested.vm_cr_msr controls nothing other than itself.

LOL, nice.

> It's just 5 bits of storage with some weird locking rules, and it
> resets to 0 on suspend/resume.
>=20
> What is the point of such half-baked support?

More than likely, so that older kernels didn't crash when writing an MSR KV=
M
didn't emulate. :-(
