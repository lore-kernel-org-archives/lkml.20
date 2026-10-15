Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64CF3E169F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102126; cv=pass; b=N1plZgiNR+gusB0Kd20MEnuEZKZb4UHnbARqGQku9beKvlSovF4LA5q5fSWjmhNVaGnEb6EMfsGDxhgYoXwQv66/7oJu4DKYKN1zD2ABfofCP1e35T/fc5dR240u2kdMKwyFfwW10fP+JefimlL9BPP0tMYvL/a6VSFZ6lViguc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102126; c=relaxed/simple;
	bh=PWLpWT9C786BylCeGeYU8YwdUELYM748aZYSZN0Ww1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K8HIEuqcuXTVinUH7UV/AJ7pZXIur0lnbg+KRqIcactGHceHdC8KpQwJQbd/Ebw9tIBvk4P9yUWAgWolRNpuYENusKBUiO+crLSMFEwyaePeleXkgAt0FpFaNyDwIOw9ZTynaAs0PPEPs4iCCm9DsnGcsw0YWf0SvM/jeZGB2hE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MhoPnhnu; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MhoPnhnu"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-533202fe429so115981cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:08:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792102123; cv=none;
        d=google.com; s=arc-20260327;
        b=AePhhqqfek+wSv1GOp9kIbK6ucfpdBoeuRUgBp7szpIyU+95hTa/9A4kcxqAKlKMFh
         WQLqN+cNeBs7sxShmtjbikmESG7HpjJ1fDjKp4gjjo4BSmj49WGEpXjCo01f3WwT8y+f
         rNbEMGo4+MFBc3mLcRfgjr0sflFey+6F8mUJwKtdPpRkB136ug06oUuHm5qEgfvi9XVA
         FGJgkQh58wJHPxAtCM9gnqNhaCGB8WT8NfdbItAbTu/h1vTjh68KZA1JmnJGG5e8JfS3
         eahuufptfFWCgag+R3AXrOHwZNlrRyUjSiQtgUOwcqDqfckZH4n136ZFF77g8x78kp/V
         u4tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PWLpWT9C786BylCeGeYU8YwdUELYM748aZYSZN0Ww1A=;
        fh=oisM462quXyxKaADGeWcaPfXlDcnf1hwshXwS+BrPWw=;
        b=gAFST/9H/OAgRwITOyVSa71MEPms9HmqmH/48smIgql4C8WHZsPxCcRmKUzp9aVfLk
         qpUidrGlSTgyevw5M4GZAIqMF/kbCXXQX4YwtKjAlc6SyNl0p6jweLHqc7QOihWkS/IK
         a1yoUZ188VyPhFeJhY1zy/1D8k73LfPlf72aNxkmrauF3QagNYso31CCkItU9qpF7GZk
         j0eOo9XFrWoezaNefmQVqAdfxycEVnIG5m6t5r/LBo2FukJz0bR2QRNvXE0RT+Mn+h3P
         AIuJr1qpqBg55LFJQx1pB60qnganGEaZK61tsGs4kS7SNtE4eD4mzY/iUgFK8lBVs1C7
         dhXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792102123; x=1792706923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PWLpWT9C786BylCeGeYU8YwdUELYM748aZYSZN0Ww1A=;
        b=MhoPnhnuq4C1X5zitZ2iVormUUWfE0ohRCo9lTZKV4H8ihR6hNDx8c9phHLa4zNSdl
         AD6cYYEtVQROMqbRjwNF6kUSZaS5HU91JqY2unFffHaWc39fGYeIRH0gz4Cjp7iUca5W
         gDKaaRv9sq3l6HHe1JpQzmp9TmvKMkIB41BbWnuG46iK97cwIvcS4BsqzjcQzN6yieuO
         vpf0Tv7Q7cPotnZCFIi/SGJLAkXlmDk3Vwj+tFvuUyBSl5K1jjgzDuM1iaM9uy47XHDy
         dBLe90WTSbCt+Dp3a3Zl/TbNw8zJQBDU0n1jB1yehgPpeJq2SbGAeNEqn8tJj4B/5wiQ
         zk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792102123; x=1792706923;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PWLpWT9C786BylCeGeYU8YwdUELYM748aZYSZN0Ww1A=;
        b=nNGq5+Clu6DsfXkBzAzV6Q/7uGEK3vz2O623xs7EulUtihYUeYPBh/1RKHpQtV+C/2
         okwkwmqHcVSFxK82SviWvQlAKnY54O4WOhjLVXjqK1LAb1wZD+xMexzyFQN8ujYYpulA
         2YBIt2WfZDAtwJyYrt8DCMjP6qv3NHnrzij4oPQPJccGCwbuz4j41Lt4Jv761AthJzmf
         QvzWygoBEQ1X3ym4CK2pbsVt80OMIIeadecRHUpCHHKnQrnNfSJr90zB0T6iOSpXU3VF
         GjXRm80sMkzQqPBp8GX08aSnKWbhKnCNPp569cDBgBXv1rBb64znJI0/HQx9i20jeZqv
         noWQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7vweCP+ke+L9qapv3yn2Do/AN18rRt6qn68FcRP8iaWUa8cWYrm6Ak2LxdNls6Lujr1JEuvJggUOlky4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkTkpABCp8IwvWW7Ia0zXnTUk4Gk7ZIkZ40ybuwXnwmG+AJfZ4
	kmN7wntjc/bmcLAvuTFV8GqH6Lch+QWe8NceG85HYbBKgmyDvAcXvEBCIDC5kLk/FtYlkOCpvRg
	aZ0Qnh+1+resi49UG6EPAtQR/FnyqxpOPIke8RmB5
X-Gm-Gg: AYBFou2QYO5sm9WPasH2pUaDx0s+b/EwonK0unUWynE7aau1wwHaTooMR49pdyF/acJ
	PpMX2of/HUd2SEcGbvIzC2R2rg8cRfLhNGj0At1wIjm86dPCQrDibZGmqRObBhTpleMGy6nUcNd
	Twrj7k9HYYUKpkazOzilc70i1Uub73hHooB6FbFfSyPqaEuBHnVfwwSz91YGJSx+qlXPhSNlBBW
	5iSTIPcdKEDv3tb90+2aRJdGXf0Ec/hVjcTOqkMBCf1hhSvQXzpjvMbo7V6IZqi/SpQdUUNdIaz
	ygi3lBg1wjN0prFZXiyWYYZTidEPiekE+xSFaJ/frr9M/3VC1UTz6eo=
X-Received: by 2002:a05:622a:481a:b0:535:fd6b:1c11 with SMTP id
 d75a77b69052e-5362986146emr5726131cf.4.1792102122196; Thu, 15 Oct 2026
 15:08:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-18-yosry@kernel.org>
In-Reply-To: <20261012233638.2546339-18-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 15 Oct 2026 15:08:28 -0700
X-Gm-Features: AclHuK8_0LbH6j_WeX1v21_TtgStVz7uutnfAORXSKaBZVmBkBYI90seP3yuzXs
Message-ID: <CALMp9eTq2HOq2M3VRVYF2u50BCP4FOEqG3Sff2LW0nb5et+GFA@mail.gmail.com>
Subject: Re: [PATCH v3 17/27] KVM: nSVM: Always switch VMCB before leaving
 guest mode
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> Move svm_switch_vmcb() calls ahead of leave_guest_mode(), as nothing
> between the calls depends on svm->vmcb being set to vmcb01. This makes
> the nested VM-Exit path consistent with the nested VM-Enter path, and
> having the calls to svm_switch_vmcb() and leave_guest_mode() close makes
> it easier to reason about incoming changes that depend on both VMCB and
> guest_mode context.
>
> No functional change intended.
>
> Signed-off-by: Yosry Ahmed <yosry@kernel.org>
Reviewed-by: Jim Mattson <jmattson@google.com>
