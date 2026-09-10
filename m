Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEAF4C9544
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053342; cv=pass; b=Yt1CaTEHIAQzaHIxF//eSpDYcrb4g71gZZzzT3J5u+sK392rSAEcPSGNLNGLNt0L5h04yTOmKqFmIb1XDP82kyzSXoqm2XgZJY0WVM01CuWgyRTvLBfI/IxHKifEmk2xMJT7zCbCiprnMx/zz0z2Mh8kJkSVzj/uUAFmBB6QuDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053342; c=relaxed/simple;
	bh=i0qyr2C0ENgPCQGsh4QhYiKOgzXs/bwuuJYt5R71+JY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d4dTHFsh/fi0vMK21SkRDW2Il61dhpu8MdFPud97vK6xUMXhnLmEhJu0/f0NLxgnAxiU5jKsk4WatJpPuf7vXerKnzDk/cfsEPHYpA9UwfXZZxnLefY7ahzYqC9/XW+XolTtqpiXh4bwPb2nETmH1sfHXuw7V956luo3bDgh70w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=imB4GUPW; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="imB4GUPW"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4956869750eso65108225e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:15:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789053336; cv=none;
        d=google.com; s=arc-20260327;
        b=HyGtkkRXtj8FhL/tvcIpdIiatCUFfETPKIb7GHxdmpgveESKOCVkroNpYAp96QAb8d
         Ashzt3GCz3u86J6vugqstdNoXL7jbHgIiYda6k4DnWkSIQ2VrosDWVvWyLjE/8oL51Ep
         jIsCDgnTw65dTmt+cLmFpJeD/FieiCshB+IWhWoOBO6XEBNVqgxWS8aN7lsfmJ8dd1jm
         9c6x2rLySh9yo0QzNV6allPDzCn7SpcnRDd2c4J98i3sPFKm6nSvu+EnQFQUD5XTIvjF
         aMdEnvvkfn/00yB8yvnH1+DcMp9wZCMxg3QDkECbVHkIl0Cf6OawnN+Ke0ePu61o1TWm
         CAtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i0qyr2C0ENgPCQGsh4QhYiKOgzXs/bwuuJYt5R71+JY=;
        fh=9cah4x5qWZ3yQgO4F5RmILwhpZF4AlKnmsvohRr69lY=;
        b=FyvN3ia43IuedLVh21hyr+JoFLkAp6Qg5ZlOGsTBlx8RlpfEf0AdUCjo+su86eGnDq
         wwQPjJN1M8xINCFw2jRxe+gIZiBka9UAgjtExM+Ig6uerlrS/Hry6UTC+ATuoz7loeYL
         A2/5JTJ5XCxVA529kwOj8FOEBePq1n19FU8iocB0g1xdUGkKkPab4n8qE8DbwDt3v50s
         g/BEExCBQ+s1X0v2prUK9L5vqFffS9UHbjNkiE/hM8eMmWJ+NfvaKkIlrpkzIEih1akk
         FN1B1h8fV5aaK3+L7+pwAvLjWPjhJPzDYlyyaZ5u4eHd4SEy0JHsOLw8kPWUnhi72huL
         +yOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789053336; x=1789658136; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i0qyr2C0ENgPCQGsh4QhYiKOgzXs/bwuuJYt5R71+JY=;
        b=imB4GUPWYRB9n5uEeYH1k10nz0FXOI8gBScrMUfZkeO+Fr+FHa55uMRuCClC1CUJaD
         KsrWa9HIwp2DIbUsVk4d1LUfJ2eCUh06Wjb4+Tj2US1C2KamtSj+rFINO/oCoOfU2Xpv
         aPPfd+4fGPUOV35rsiI3fFrtQ+a24u8auHg6LhP8biFQkQAZt0zE9yylJvhuc/OhKfBE
         iuKGppTiGEi4w4zvJEC7jBBiY5THlSEDrTKj9wCWyf+gyZueNJ/wan6ol1IcTsQUwGuc
         wQV4OO4A2bhCVa81SYU8dnRrprvKVcicHQ+EL9SvNrO21atGozNj9yidsBkzUqgKQ2xV
         g9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789053336; x=1789658136;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i0qyr2C0ENgPCQGsh4QhYiKOgzXs/bwuuJYt5R71+JY=;
        b=AIObEb7uR36Hmf70SxMHD7J+1nj+0vnmpN9BON1J3KF36TYD4B3iN1qla3pUd9N/vD
         NtDTmGqf489dkUT9b1ZnFk1YAV5g4VYTRPHqHNHpPL+N+hMQc57kVVZr86xpejiPvKyO
         7xe+CDS7usjm5e/oaz69AKczy+IgeGmpSUUJr7vmh6opQAPLQuFnemXW6RmFia93nr9E
         qHKHewstOX8T0oXRDWWkUDVz4w8S7+DP92ERREiaWCJGUvT1q657/VyC7ug82TOEEhVz
         oAcp1cqTifCjwVxydxxy6HrqVfrynJYboJT3C0NRl2ofV6Q9+L17l57LY4NwegU2GOL2
         Y3DQ==
X-Forwarded-Encrypted: i=1; AKwUvBxczVfCZwJinN4n+2LqeIMzl/E/smlIAK96BVhDEs6OnlgrDvYusz4oaPwa7PLsSMF9exFRa9QpwdlY+vs=@vger.kernel.org
X-Gm-Message-State: AFuF++lZtYhJ3MU83W4yj4p0zQRXNKsVmrOh7x844c8vApVqQKIAAmhm
	qM/L7wXFGgOj2TqZrbaQzqh8YVbeOS0LgTSnE0mZ9OWEf0smRlZ9ZVxgzcsg8d9QT0J/YafMfRg
	VoU5Juxf+qAGDYNveuysZ0LpCqaOtDvyN2zAlNtMs
X-Gm-Gg: AYBFou0yH/dzFMqzxblgmge6eFA+g7QG54SE37SuJ1MAoP87vY8FueBrnvISLkOlxvN
	mlfbPKyBRm9WJNo17VqzV3rL6C3+Gq4wZLkm6tmvbzWRaA8l12u4NPHSPyGKsIGNPqfuvwm04Hl
	HcUVdDhBsEHFKkMtwEFBVDvMhXvZUR4xwct9yALUAvjcfARXmUT/kSwHP3qXhyTyWye0WZsaaOR
	TCMSYPSMq+YbP3K+SH4uNcszSAt/pwOCizoMOnNj57kVeo5Q4JLorTweYrq11AZWYUUgG5yZ7BV
	LgzieQEh1Ghc982wFy8DrffCExpyqddhAJ2RQHLKr4cR2bRy77xcEHyfcOpIdRrxd/+yq8FfJlD
	HKMOuj+vHB+sN+d5gVAcM
X-Received: by 2002:a05:600c:3495:b0:49c:dadb:18a7 with SMTP id
 5b1f17b1804b1-49cf8244260mr429288325e9.10.1789053333570; Thu, 10 Sep 2026
 08:15:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828024335.946-1-nils.lehnen@proton.me>
In-Reply-To: <20260828024335.946-1-nils.lehnen@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 10 Sep 2026 17:15:21 +0200
X-Gm-Features: AcwNN1Uzoi8lwGKaGFrFRU-C5_p6rCaJZlH12ISlamLuab6ijiQmyc1yoeBy_qE
Message-ID: <CAH5fLgib5D=nk4OwoREHAqzpC7=Ly=MZoU3gUGpTgGTZLS0mjg@mail.gmail.com>
Subject: Re: [PATCH] rust: security: replace `core::mem::zeroed` with `pin_init::zeroed`
To: Nils Lehnen <nils.lehnen@proton.me>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E . Hallyn" <serge@hallyn.com>, Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>, 
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur Ozkan <work@onurozkan.dev>, 
	Atharv Dubey <atharvd440@gmail.com>, Ke Sun <sunke@kylinos.cn>, 
	linux-security-module@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 4:44=E2=80=AFAM Nils Lehnen <nils.lehnen@proton.me>=
 wrote:
>
> From: Benno Lossin <lossin@kernel.org>
>
> All types in `bindings` implement `Zeroable` if they can, so use
> `pin_init::zeroed` instead of relying on `unsafe` code.
>
> If this ends up not compiling in the future, something in bindgen or on
> the C side changed and is most likely incorrect.
>
> Link: https://lore.kernel.org/r/20250814093046.2071971-8-lossin@kernel.or=
g
> Link: https://github.com/Rust-for-Linux/linux/issues/1189
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Nils Lehnen <nils.lehnen@proton.me>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
