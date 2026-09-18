Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD84B4A2E32
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789730529; cv=pass; b=RkSOFEUqCQ5JE1n2zoRfsOAG/G4ZN62byDSxcFWNGPb3+NxubFT3+4mnrimGKhKNHTULB2KP+kEWvE5ChICV8tTl0RLHnypkq0G3uyYLjoXyXx+1i+wqpC/Uj19fIE0hQ7Ek1XVO9jwo3O7VXzczyvB6LmwFA/3k6eLe8NGsoME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789730529; c=relaxed/simple;
	bh=/H+f8rE4cmCyRd97Qlb5sVoBG09cTXloUz/HII+jJZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kcRpxwsGBaln0N6oR/PBgV0Rt+AVWBcIzpXzu1EO+jA9n0eva4YckpGfMjBF1I0QSwZvuYz6YEmMq7EMpm+ai67lfWoy6lFUmK8LvRXoiN8Nn0fLW84ubFLvFV3s0dwtyfvgvjyERLnmS5F5l1+qICUsot3woxNmZ/Ii59KUl80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ny43O8F4; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ny43O8F4"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6aa13d8d9d0so6537a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:22:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789730526; cv=none;
        d=google.com; s=arc-20260327;
        b=ZUDnsZyAx970Ne53KIo8wFiPxI4eZ7h2p0L7LLwybqPYHs2k3UiLBsxxfuEmhEgj3B
         HWM5JMeimsBb80L/qvrK0OK/Hc+c3nllhbF+tZA75P7eFT6AI99zJDZSemLWr0/MWCmr
         LNdAsfl5kKCPNwHPb/VSL31d0NlTm/dIEH0YA2oU5ljsO5w94/fuNi76Vl70NFJFbJBi
         CKvUKTPn4KXy+c6NxFrqXYgMQe2p1evvmaFI/q5JsSL3Dcazykm3NKZ1kxqbVkj7WGAW
         2c87Xf7YHjgxqATYeBjuq1DmSHUxwKcbfquL0holHcMa4MbD76rxwsh5X5Sn9D+G6fiH
         ktEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bfl80AgR13deu44SG/KPKuN/OYJwn1enWYpfQyfJCUU=;
        fh=/FMWkOljGhCxdjLsOpYa7mt3brjsJd2VA0wRtV2/U5Q=;
        b=GDPKt7qgB35YijWu6/c5aCgn5kfz/nRQTSUDJjP9MVYp0hcTk92pNtSSdqZ65KBEW1
         RkHP73e2fzhNekTG9zhPOhFPJQGlNyUKve6B9ofG6NtRBkv8QXdnjIuOImUV2Z5fBUy+
         6tnxPnkuM7TWhKk1+xMUMQQoMiVTmmaZUlfuUNJIGJpxYqeARtduGmaqSc95Vy/enKms
         +OUaXhdr9LMxCp1CFlFYEdkvQgkuipVJINnfW0FQxzQBgfjnBH+vDKOtwXa/tZnUCZmb
         YElE+5x5IUTeZE7KDwWeSOPFb1E7xZ7FQUcH+Svp73xTdJk7MZ0+G8YK864VMh4kg73O
         Yk9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789730526; x=1790335326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bfl80AgR13deu44SG/KPKuN/OYJwn1enWYpfQyfJCUU=;
        b=Ny43O8F4P4vxQ7/zMrkI32A43lJHFbDxxSUXs/taJpDHGhIPuIY1CJAnTbTE2IhATj
         3zS4g567bNVkMQFL4SEQJBq4w4vBGQGg0dKBNyu/jlihVksHi2CSOF0JOFLZSQ0mnRbP
         D4aGtilA9rfBoZFqg2o8ZCi9bGrM/potcjJ42lelmumgR6/j4IKmZ3gjNw1EugTPfKLm
         a9snYCFql1wnmPaOQl9awVMRyMnGPbHdwBt+1J7uFDXJI/9k4Z0cH7GNRKK+skcnoMOI
         Yz3FDCL26Wl6qftpL2B61xiTouSOzym87VZZst8aBkb1wj76c0ytBWZT91RS1/pBzLVj
         eesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789730526; x=1790335326;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bfl80AgR13deu44SG/KPKuN/OYJwn1enWYpfQyfJCUU=;
        b=FO0kQ/hoUlnAGiXRCKhHDqNSyrlznSnQeUE/xdNnHkTNJ/TAtClLrNizivMRFPb8xb
         4BAtn4vftYGtVpd4RcoeEAkYQi/HHcqvwtsei16ja4VereJMNcTPkcGPlbtUHJAPB30S
         u8HnX4wJHUCMS2drDh2rOjew9LKRVsIWrqVXtoYgKryJkqGgvjk6SufEuRoMyiHwoFR2
         j8UJiDn+we5MEo93wzv2IifhEw5DMC8ShTH2gL6Wnn21CaXBwdPVVjlct1mDTH9zC20L
         z849H8MawpjE/s1m7nuxg+q852QfM2N5pphOJfr9K1uEa4VBiM8vVyRxhXUDGy81noxR
         LbaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxc0QDwkBUCSAa6mIyqNhYSNdnZV+OqVt4R5Uj4lt6Wow5nPYt5iBcZ9UcApeBaLmb3QQabMMzbIYFsHRY=@vger.kernel.org
X-Gm-Message-State: AFuF++l1DJmRmwX5MGVOqQG1Rc7tU6+8Fn65rDhnOOUCxMg8i/q0ufFi
	+QqP8e43yXz4bKGAqTMalDJVCwZXx1lEWswkUW5zE19yh8CekGD5Rq5Q+1ZekcURU+bZ5xeAm2r
	ucCn38QpzS8Uf/RPi8VRq3lFiFA62QqSO7ItAZ35z
X-Gm-Gg: AYBFou1Er+ySNiftiLrxMRQ6htNYsJd7CcfV3I0G4p03X0Nqlo+ThnPOU+1OLX9W6Sz
	B6MVHgOlsr3e17ea4RhIOAFsdX6FxqqeH9R+D3V7SXSOAUTssD3Dnf4/leQgv7SyVuTJaG/ts4w
	TviIePgF0oxDiObF/hkL8+/EOD3X0m9ezMSbnSI+sozEhJ4txlbHW5ELuRTZbwEfkb4+Vg+AeZy
	ZtgCsLDDDDxBFOQzmsgSmZv822w0xSF2F/y6G4xa0qQMUxGiS/rTTAsFgXQhtp+qtdFKxiEcw3E
	t8OpxI8wQcopgYpoEjB9YqjE7puTIV7cFdFct3RaN1zcSvKOMNxBsX8=
X-Received: by 2002:a05:6402:c318:b0:6a7:ef71:28e0 with SMTP id
 4fb4d7f45d1cf-6aa4de2f154mr26925a12.0.1789730525581; Fri, 18 Sep 2026
 04:22:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789721173.git.zhang_wei@open-hieco.net> <95301258748704c6b63664015ea18d3632739256.1789721173.git.zhang_wei@open-hieco.net>
In-Reply-To: <95301258748704c6b63664015ea18d3632739256.1789721173.git.zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 18 Sep 2026 04:21:52 -0700
X-Gm-Features: AcwNN1We1S9kRVzuD3jSj8IbJp1M4rVqZ6TcYDxFKtZsWvmaACGzUXedXxtLuy0
Message-ID: <CALMp9eTme_QbkN8fuc-JkE9M-VLri30sqR7vxqjeU8xX5iHQgg@mail.gmail.com>
Subject: Re: [PATCH v7 6/8] KVM: nSVM: Use emulator bytes for synthesized
 nested #NPF
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 1:56=E2=80=AFAM Tina Zhang <zhang_wei@open-hieco.ne=
t> wrote:
>
> Preserve the bytes used by the emulator when synthesizing a data #NPF.
> Reuse the fetch cache only when the fault is the current emulator
> exception, identified by fault =3D=3D &ctxt->exception.
>
> Add an emulator accessor to copy cached instruction bytes, checking
> the RIP and cache bounds.  These checks alone do not establish that
> the cache belongs to the current emulation.
>
> Write the cached bytes directly to VMCB02 and fetch any missing tail
> through the instruction-fetch helper.  If the tail cannot be read,
> report only the bytes already available.  For SEV guests, retain only
> the cached bytes because KVM cannot fetch plaintext guest instructions.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
> Reviewed-by: Jim Mattson <jmattson@gmail.com>

Oops. My bad.

Reviewed-by: Jim Mattson <jmattson@google.com>
