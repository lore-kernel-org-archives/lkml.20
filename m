Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6754E9C1F
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982480; cv=pass; b=P8TBv5boecPe/0eC4S56XjWyUOQwXyn7ExBnn2fRpj1hIqwjf1SaNySUAjMRTmuzSYvPTZtYKPrnn4lFuAU7MawFBVcQS3VGNw1gaanAMPVxgj+d9oROkCIB446f6xfteKQruW7FIsfgNiYZSHBoG+i2n5fYKlNgH428Rs1MKXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982480; c=relaxed/simple;
	bh=KYS/c54vQeVbWBTD+IBBHhIs4+bHOZYRw7A3ClKDlRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qT/j1cEz66fTTkLHGrUv4Ee+wVPlrQTXr8nNWLbltcRc5ArR+bORK425hM7y3H7Oy/NzRG9yx3NyA4GsYuCdYWYbTckJXX7A+Nkb63Yixp3vJHI5KwH1XC6uvYViWPavCf/F6Y8IC0Tw2FUNJBlne+BMSycN9J2a4Did7xuU/MQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GhGkwpJT; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GhGkwpJT"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso38188a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:54:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791982470; cv=none;
        d=google.com; s=arc-20260327;
        b=Lh0HuNojdPDfb9Q0rnJ1HrUd10qsOTdUW8y1s65lKuMlrze+BrOMtr+C0/ZfUr2e9f
         5T88DLyebY5HDkAbhG98pANaewY1F3jlUxHeC/InoWmo+9spX8PkXpKtzm/TH+jqtcUX
         dAyENFjvvVFBEwJlD2f2qmxZOiJ+F3kuB3SQLCFrnUikkwiyqxNerdXmvJRi+FHRSGku
         rjImZ69VFWX2nKuy4LdrijUK6Z3l1WUy1TF/SoAMj+GCw4U+dvuE67p/05vMSYMxKgDH
         43/RkNCKojYcrmmqTtheNGV0PyUJVy9T2P3xGJs8v+cSjvDKTdQ4d3p9aSribrXUHJ+q
         rm4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KYS/c54vQeVbWBTD+IBBHhIs4+bHOZYRw7A3ClKDlRY=;
        fh=9TTo0gh/vunJ1euJccuLOEg2qTg7c6qpdaau7vVJEYQ=;
        b=B/PIT4kCFUjhBVxRpxXPTwdzzGGA9YnqH7q1Q8vSl7b1gEYhU8BIMhd8F5WGGTYBjj
         2xWXi1lPJVoLXSNetfe1EGUnCh1s5WLvZ4N1iAVVNjK9Lf5Y9MAPMmNWm1W0vi+LgMlz
         nznkXksAKjwF8pTxX6AGo7siTxGNtQfqy7bl+Uj+H2+MbXHBQwe/NKuq3uSURdp8I7o0
         wG2esWVQ/N7BTFqeAlAiEAFReM0KDil5p7l0jcRGuytFxspQ3tmVgSQ7gpngk/RVwqJP
         KwX192W9qUIIOlffxwj5iZGGUt7cpKK89yP44stZJc2nsLtCqdozIKI6ljn7GP+K67vW
         0dsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791982470; x=1792587270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KYS/c54vQeVbWBTD+IBBHhIs4+bHOZYRw7A3ClKDlRY=;
        b=GhGkwpJTT6fXiF9yrbpcPpLZFt8cagCklO27tAT0GOlKOZd10Pt5nn2X1ARx/ukQ/0
         5MGj8JFAUPzR/X6RJDy0A7B9xmrxOP7FNsGVL950MyNWwmqTQKvmH2bilzrC4KPSFWQh
         +/8p25SEMCixJ9FCt3tfk50NMJPhfsf2m5ezWVA39gXJPC9GgHm3Vs0U+ZLVX5ZB+IJ7
         aUrmRaRnNhG41Dq8PlivhI0WZ0WR4Szgy9m5XpYbsKeetYowEMLxy/JkCC65WublRiTm
         LQXjmw+pZIuW64Onl2Zos796QocP86vo7CFhe5oCbBXxaE46ksmfhod6kC5xzBKUPqYu
         HuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982470; x=1792587270;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KYS/c54vQeVbWBTD+IBBHhIs4+bHOZYRw7A3ClKDlRY=;
        b=X0vwYpaZ0XJL7HAahkgg3UNpceen2NxsLtLiAiFOmzNZs/ZTCAxD5WNB6OnOgjxaTS
         j3uYeKpm8tX64ju3Q6ph/aKN0m92RCHvDyA4LuIu0rUan1ir7nNg9m8iBI/i8Ro/DCgl
         Dn/K3eMYwtDKK9xXpuL6oX4FbSyRa9ZN4gOkoUCr1YjKGFF8p8fBClqsKqK8PgZ+7JUZ
         82s1LLtWcoLTKXuha7wqTba8jSj+o/WMSNKB4cWjLTd/IZieoWf8MlTFlyoo2CrnWe4W
         wKykgRsTXi1eIm6CAZzkRuCaQyHVgGsjZG0PDzCBqVIUOfc0AMRe/dUDIIpDk4kESaF0
         I48A==
X-Forwarded-Encrypted: i=1; AKwUvBzT70sF7U6pCJFGhX2hv1R/cHs1rQuHjz9mRwptFALyUfurOziJAVNnMpgvwL1J4rWIbqhLUgm+cv9w6Bc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLha1F2lDu6qJtrGwMA9e+PqTBaavudnfiUb+GTftxMVR4hrm8M
	hKHpJAsNq8FmrDFnxlOmlff4kPtYR0Pp31GR+xAGSdQexP36nuGhZzN8WdTz92K7mU5mfRQJMWu
	RpIbxkffnhdplUBIG1ZB2nrm4dXfe05BpA1uVIknw
X-Gm-Gg: AYBFou0GUMA9vXWMa+CfKdkH87es5gfhIbv0femag/Yxvzplbf5SBsN2sw8+y0LWSsH
	YjFB5LHZRNp61LFjQ4vBfCO20jWawUIaUOf3zuum28obFtKHxFzQQQzfNqMwi5SI/JX2VHUOU/f
	SAw5jabZl+a1KczYFeytNyqv6+nubB+kOAQq5/6isNXfED3XaJ0RLVzJshUvHeQAAt4Eu6L5Ybv
	oyLB4gXB/ttKSXTvNcu4W6ig9StLjYyri9QqS1sbg0zFYO26N8DROZjT6hOSIBTXEJuFF4zh0L6
	0B7WFbmSpGAG8Ap0C/OlGDXA6G9JBLGty48YmeO3MdE36FrJJ/mjkB0=
X-Received: by 2002:a05:6402:c548:20b0:6ae:1503:5a27 with SMTP id
 4fb4d7f45d1cf-6b20aae063bmr28860a12.8.1791982469402; Wed, 14 Oct 2026
 05:54:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013231728.883001-1-yosry@kernel.org> <20261013231728.883001-3-yosry@kernel.org>
In-Reply-To: <20261013231728.883001-3-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 14 Oct 2026 05:54:17 -0700
X-Gm-Features: AclHuK9rxlY9ryi2n9m2aAdyaSNARNmcvyrOyG0s9ziCGiHhPOebsZRxyO6FDgo
Message-ID: <CALMp9eR-CPo2n_7uN7paJQZvmPXA6=7Fpo0xJePeadXwuD600A@mail.gmail.com>
Subject: Re: [PATCH 2/4] KVM: x86/mmu: Drop for_each_shadow_entry_using_root()
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 4:17=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> Drop for_each_shadow_entry_using_root() and open code the walk in
> __kvm_mmu_invalidate_addr(), the macro's only user, in preparation for
> handling failure to initialize the walk, e.g. if a cached root was create=
d
> for a different MMU context and so can't be walked.
>
> No functional change intended.
>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Yosry Ahmed <yosry@kernel.org>
Reviewed-by: Jim Mattson <jmattson@google.com>
