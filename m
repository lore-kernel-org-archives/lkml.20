Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CE7433E61
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 22:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788474391; cv=none; b=cE1/as1g/RJlxj4LfDcHAi/N1xMyN3Mx0X2VS1AUA02r0oFbWPtBzzQNRhb+/epQn0K90jzon9pRsRudPkOrDezZthC4tvCHKwt8e6a1YInse2J4VCYKZ7X8AVOvDmqRUz4DgZ/OFZ3e9rsbEFd2cSquQeii5FgYyUg5scowKPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788474391; c=relaxed/simple;
	bh=2bdMFxW38KE+UffuJKIUNmOAUbf5BQZZNNwIyvoLhPI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WxPKTS2LZnGYViA0birq7Mike+/jsfE1kW6gLsgrBg81YHTL+a7XO9kMoqJResz4doWEZc7+uV2rsGks6/ADpPgzMP+SSrdeylP4EwDpxJ3zY4z5j5ne0DfHmJSLKWx6YShQ790gMwrfjjubsJx5UudTjg0ME4sEVEi8fjodwFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DwdCNdpf; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DwdCNdpf"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce8a76df2dso5856765ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 15:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788474389; x=1789079189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ncKTyGiR16dFOJDzqmLXf5IId49jP4HBGFfL/8iyZ04=;
        b=DwdCNdpfad/9HofRoDMRgX1IjGWSXK1I0aCmjX8eQkBVOiSZ16OOCSvitr7C0SFsgf
         wNOrebbF3/zYq7LwcthSYxzskKIQYB8hWTReEB+Z/sdiCQ9uOy0TLd4NR7fnRQMxHAhP
         YDL7KI/fGvYmyRFzoHH8ukOy6yzDRWP8jelfK3UiGSbed3RO/POfI5eJjeLKfIIk+IDr
         5updOAgkbwWvs0XxuDp9t8vi84GqHACz97/vy6bsf3tmee7gTzhRZR8onUJqgs2FY83j
         c+zqdmk50Pf5tdW7pGiffbTfuL12msg4PHXIE2yAiOXsHMZ25mp6E+1ycc23a5vdWgxG
         HIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788474389; x=1789079189;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ncKTyGiR16dFOJDzqmLXf5IId49jP4HBGFfL/8iyZ04=;
        b=IZn3Zc+8T9LpS0zrG+nGATNZveyJXASQuLU74mcVWr8U72+YzQ+lmI/vQChxCDs1Mi
         EPEh2gkfl9BLosuZxCAGCQbBUwVRNxCRv/X+Wc0l3/CHLtdvTnvtxnJEfb7d5qq1UHO4
         hR7y9ELCHxVt6mQGctAhO87n9FZm4dMGjaTpqIQNmRO6dUfibCW7tP8yQjFRCt9mtLJy
         FceREfvxh4Bv1Z/JhmOWgZmiMs/T6g05VjiLsaUZLUwZHfJkdN0368ErTrCH3cPqfEhW
         SVebUeozxy8WxNIsUivKh3eW5Y417LDu0Dg6gLMC1i8bTU3Rbvjs/6rTxyY/F96OpMVU
         sQeQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNN0cOs1iLFsrwYEIqalgfitlkd24s3pvqTt3Z5PLFpI8E7v9235CS7as5cCDGI8JCxh7Hh4weTrJgeCM=@vger.kernel.org
X-Gm-Message-State: AFuF++l3+ZfMf2l2rObgaJ0HQ5wRQT55cYN4v51e+NvMgtBKaaQuHnp8
	+5HIPzTdsYvjSnEVvZi21micGt+IXQlLiKh0N3017M3ug/pFgr15HNM8n7wHdiP/4uFUiaICqaE
	EVMZ1zA==
X-Received: from plbmt16.prod.google.com ([2002:a17:903:b10:b0:2cf:2c71:64bd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:8bc6:b0:2d9:4871:393d
 with SMTP id d9443c01a7336-2db1267fbf6mr19307895ad.21.1788474389283; Thu, 03
 Sep 2026 15:26:29 -0700 (PDT)
Date: Thu, 3 Sep 2026 15:26:28 -0700
In-Reply-To: <CAO9r8zN2AqpGudeej3VshJek6iy7iaTwO4GgmLSVO0++omHUxA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260903175856.4065099-1-yosry@kernel.org> <apnqonqMBZ2GeGEq@google.com>
 <CAO9r8zPcvZpy=379oWNY_+p2XZ74On5LPL+53evbRqq5OD1H=g@mail.gmail.com>
 <apnyKNY_FKFWtDNK@google.com> <CAO9r8zN2AqpGudeej3VshJek6iy7iaTwO4GgmLSVO0++omHUxA@mail.gmail.com>
Message-ID: <apn0FM-vNTbOCpkk@google.com>
Subject: Re: [PATCH] KVM: SVM: Trigger new ASID allocation in both VMCBs on
 pCPU switch
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2026, Yosry Ahmed wrote:
> On Thu, Sep 3, 2026 at 3:18=E2=80=AFPM Sean Christopherson <seanjc@google=
.com> wrote:
> > Keep the change in svm_allocate_nested().  Or just do nothing, I'll hap=
pily drop
> > the svm->nested.initialized check when applying.
>=20
> You'll need to update the changelog too.
>=20
> Instead of:
>=20
> Additionally, initialize the tracker pCPU for vmcb02 to -1 on nested
> enablement, so that the new ASID allocation in the scenario above
> happens even if EFER.SVME is disabled in L1 before migrating to the new
> pCPU (so asid_generation in vmcb02 is not reset), but enabled before
> returning to the old pCPU.
>=20
> Maybe:
>=20
> Additionally, initialize the tracked pCPU for vmcb02 to -1 on nested
> enablement as hardening, so that a new ASID allocation is always
> triggered when nested is disabled and re-enabled.
>=20
> Let me know if you still wanna fixup when applying or a v2 :)

LOL, just send a v2.
