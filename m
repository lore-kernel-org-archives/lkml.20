Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793037863;
	b=VL5EdYdPft+d5nQd6MANu7R8KXZwfQeIkNjSgBGqhS/a2a3aRjj8eOjbQRjzYPyei0cT
	 EWAPC+g94R4ZNqxn0tqx0p3ZC3l2biDW3F/309XPHXOXsNJMunm/oFlRJjb4ur+yBQwRj
	 QEQjvdIu6LnGcuN9TiGzLEqV7ApAssWcvmLGwOwuSsQ8yljo/AaLo1t+dQyU4j29HllPP
	 p3VvJL8L+5+/92616kP0WPG7/68E/bmihgnYvgGwFWOFMufA6zktDKxCihh84rv0pFy9u
	 q7QM7v0CwsfZOy/zdI/X2JY9hK93p0IA7cZdsMdPak4VeVd8uNqLHzdMMvZxT3IZfMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793037863;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9uxlLJEsA1bXTEHp1c6LcwARsGRwFYTcu3KTbRjTHlA=;
	b=gF2B0zhvpLli0TP5aKc6TXmHMO1l7dShYXqclEZAdDR0NjkM2B+lEAw8JutTjuvjOofh
	 aYakf3JD9Qgbb2OLKGs8SVLE/s5o4dDemcX+Ae//CX2+DeFqlKAlqMqa5xcn4bjVyrJSk
	 1HwhyZTKt1XvvpjEkjvqvXTDW4TmCkG6nFuehwNMyjbWYkNkWZLQ8ut8hY0gvbEqPeZKQ
	 n1Kv/f6INswONMCSHxfr9VJyERCTqm7sWxSxZcCDXtbdGMTBe+q65vuBPX4n1ukSg1eLK
	 S3Y4D59hXmwUVMzAotOH9uwWBPMc52fJXHUMYjg3hNNd1r5e4WVCxQlKP2nuFH1dt6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="nbNDw0R/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF2C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nbNDw0R/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B4D1F031E0
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793037857;
	bh=9uxlLJEsA1bXTEHp1c6LcwARsGRwFYTcu3KTbRjTHlA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nbNDw0R/EpYHYoifQ3AZeula7uMg6lFVErZjDVExn+hx8a2bL4/rSPvN0FJYwK7ln
	 DCqyTsBm431pvy/lhvvKteMb9mGXbuUBTT37epr7Ka/AHMMxplEnenbqSdPpey5d0p
	 p/CqYUnu3MRiOQ2M5BN7wRGtKMi0rfFqQPmoPEQ/97KjyXKbrKK7W1KP6T5DNBKmzX
	 jC6iFfanNZbxiUEUuJqS4ql8ITCmHnXvqbgeF/MLzxZ4f9ZK3rHSdcE02bhTgh8QCc
	 NQ6QMG+BB/yl4lY4JPgZVDHrQrRu2GDFEYCM03HSxzsca5raoht9A/2rpxjPyyFXon
	 CryRac76Xjoqw==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4682977f9aso385476466b.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:04:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzJvXQJLpQEw5pn2WTrWsX4jQeeeaxTa5L8H8IU2LSid/7w55a9cd//AqqQiJXzcUS4yUJYC0gJ5EW0xP0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJm1povYAlntlbyiaeQj4OCb1Q1ia0ZdqrkrvKYT9bqJrrIQUiD
	qpdrRIMMf5+29GvnxjhpgSDb23PoU4EMnMMvhNMChIiW1I+BijHiGZ/Z56OajW6HQYZqnwMEKIZ
	1Tl8moogb4GO64cunNzwHgcqVZMLULNw=
X-Received: by 2002:a17:907:7fa5:b0:c40:dead:7466 with SMTP id
 a640c23a62f3a-c46bdc0ea2bmr844359966b.20.1793037856284; Mon, 26 Oct 2026
 11:04:16 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022215541.631694-1-seanjc@google.com> <CAO9r8zPFEwUVYSTePWN-FurHLzGN6cY8bd-BOj3sjRmjj4xQbA@mail.gmail.com>
 <at-Pfgjt__PJl55M@google.com>
In-Reply-To: <at-Pfgjt__PJl55M@google.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Mon, 26 Oct 2026 11:04:04 -0700
X-Gmail-Original-Message-ID: <CAO9r8zPAvi0vCENtj+7+gVrojB2nOHEoYfyhgdgxpmiUA2kWgQ@mail.gmail.com>
X-Gm-Features: AclHuK-_mV-_o8oyTvjNfVPUxDkJ4-4h_LvJxqYkxEhvrUiyoB5NiBgnQwLbofA
Message-ID: <CAO9r8zPAvi0vCENtj+7+gVrojB2nOHEoYfyhgdgxpmiUA2kWgQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] KVM: x86: Convert all runtime WARNs to ONCE
To: Sean Christopherson <seanjc@google.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 10:36=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
>
> On Fri, Oct 23, 2026, Yosry Ahmed wrote:
> > On Thu, Oct 22, 2026 at 2:55=E2=80=AFPM Sean Christopherson <seanjc@goo=
gle.com> wrote:
> > >
> > > Convert all bare WARN() and WARN_ON() runtime usage, i.e. WARNs that =
aren't
> > > strictly scoped to module init/exit, or similar, to ONCE() variants f=
or what
> > > should be fairly obvious reasons at this point.
> >
> > Do you wanna CC stable?
>
> Not really?  Maybe?  I worry that this will generate an absurd number of =
conflicts
> and also have "misses" in older kernels, to the point where it oculd do m=
ore harm
> than good.
>
> I could be convinced this should be tagged for stable@, though honestly i=
t might
> be better to omit the automatic backport trigger and just rely on someone=
 to
> "manually" provide equivalent patches.

I can just see this ultimately preventing a DoS and if it lands on any
stable kernel it should be a win, but yeah probably manual backports
are needed :/
