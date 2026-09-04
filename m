Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BD13DB63D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509538; cv=pass; b=ib9slB3DZpBbVK89THPTVRdM7MGhKgZ6LsP6lOZtqRMBVgHvp+pCBF4kKqMfFfr1o5yJthrecU5crlQv82Dz1XqAxwsAuEDJRJdemtrzGRoTNGlFTQEp8Edu8/mUXj/V0AfPLB78p/Ie31wRK+ChzvjUplpQfhDolysqu+G9M+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509538; c=relaxed/simple;
	bh=L9fPtb18qNFGerwlKwgAv77KnNtBL/YO/sJ92kShLww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dUDiq/eAyqbeWTAhSkgt/zCXEpT0ihKhlVaOhu/C5rcRdp0F8EerDxTEQB8yInpW5XYp87Db69Ab2PzMk7FfozHHgFE0Mxo35SYwQrqyKfgQ3L51II9QKQnW9LyNuk6yM2hgO13u+FLJyU4wpxInjExeaWnmcvJN7oAD8j37PjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YrDuludh; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YrDuludh"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38f0f3c8da5so87932a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:12:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788509536; cv=none;
        d=google.com; s=arc-20260327;
        b=dCa6Y9f6V94gFST5evJm6d5FC9GibAgMKja1P94TocZeDM2NhpBExGkQDqj/EDBYnp
         zX0w/Qz+samFwGizJd7VUh9w7idYTdCzI9Vwt4py9uagjj6SsLjS9CiEmOixdMWfaiX3
         ZABvjva836GZHsJ7E1X2vGdjrvBfJMouvaAPEpYkKZRbxLT6O2lqMdMd20GP1h2lbWoI
         aRItMgz1rIdcP7Ro/4hABUUG/741Y2wX+0CD/V++5bKhiUzVvdrekLsQxn8tNsZYB57h
         Muc3SBc2GDtruc7ZHKtBAj4bFnjDN6T58t7yG7sHSDHkcoRdrc3E2CXWgFrpcijBfG+4
         WqmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e4baweyUVAVnbygzUZ7FIkRZaq3IJOdN+OGuALK4gMM=;
        fh=ek4Gwe4iU/O657W120/wi4HRQ0pHn5N5mUnCQ9blhtQ=;
        b=KsGcWs0Hu0UqGK47BsX6LkbGt/T3AzLGDZKPxUwAie6dN1cdSWJv/CAOcMlrr8QIz4
         EQBTe5dDMbQpViEXgEyHCphtCTnI5wC6gN+LhAcXSt6J/tyH/zJ4xD8A1cWQMQufwhf4
         mbwYK/fqRK/OXSlfRtkRmW5lpZscwzrn6ndKnFYZumwGBHcjyXbxwiSsobE6/3S9vyme
         X7V4RsNx/8Aj+Q39so+L21SGwjiG4+iiqRGfJ5IO2gVrDmyotUJMDVJ/8zDxHychNNzu
         LPi64Knga0zBuif6wYKQBoJImaLhwvFPgmDHqQwP4CsAvapKMI5dJmyVYEZdC1MQLQc7
         Vn9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788509536; x=1789114336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e4baweyUVAVnbygzUZ7FIkRZaq3IJOdN+OGuALK4gMM=;
        b=YrDuludhpdnEZjBi4t0RQV1WAlzinhLIO4rFbeTIrJt2uACJp+taD7Fg7y9+Ob2+PM
         ERxxw8h7efevwl7zxbKXFRv0BukGtHQ1T+DdZ0aD7Ayg8YTx7PBp9lR08x7VG7FjBDHQ
         dasoCKsOXczZSKxueNjADHdUdPqPMfbeDjprn7Dv7Cxdg2t6dYq699qH3PkOWr0OrY3w
         Zc0TZHj1h9skCiUlAFoV7vzqO7vvtXQPJzu5iDbURD2p+7VNzbc9h1QyEixTqMuUcikf
         vkhBTmEQBuIH382TdyUjISp6lvuLbMKdAI4h4+vqcZQfqh7kp3Ppwczw7hqa7P03XWK+
         pcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509536; x=1789114336;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e4baweyUVAVnbygzUZ7FIkRZaq3IJOdN+OGuALK4gMM=;
        b=qhr/5NxteH5ani+rGO0uCHjWph2uguMr/3iIaUEMTmH6Wu0RQyKIwexVkN3py6RiHy
         G4usQAxCN1AcIwzOKopjy0Ji31iLFdQEHKfRDnfVlxpuZ32LsqjXCz51YGULzDhVuXqu
         wo/y6bcW5cVPxmObckFeYsRwAKgl4tAwt+HsY1qJv5R2ICf90A+n9RCLML5+1dYDWHst
         chSUdecxAbViP/zVARAU7YSY0POP4Wea3XNkAXKqfsTnFsAK6oOV/7Qn46rPRxMUSjcJ
         uymZAtEv24VneHM/WqlgOcV0BFQde6SgolaXdKLVFXf/sQaFVCoaPQK5NpXaFHalJBrd
         BdHg==
X-Forwarded-Encrypted: i=1; AKwUvBw65e/tSU2EsZ8szNb7V0SjBQjcQ+B4C6Ras8vUmLkKwEAbgPuurH15eidRPSGss8KQMHb4fzGsyIA78GI=@vger.kernel.org
X-Gm-Message-State: AFuF++me6Kqg7gZU06EC7xv73SixzDkBkwGwTA+nwGX0SJQIi1NX915t
	vN9+/MovkreUgXtKKNF+K8Wdg4KBazdYjMX44fQRvt2EtaOBXVNiFNZnsF/SyB2oMfeBCjZiEVh
	BnbzzynQ6RzZijyCAanLg3s+xsgER31o=
X-Gm-Gg: AYBFou30uCUYniw7MoFD6klX0YA2190chetk47s+cVULbH1XHKJZCSN32nny+Hmonfa
	onMyILwGTEM8gqwVOONODhttnWlfdypuZpZBg0bUi5im0JcpgigzCPXAbsXALmrymSHfIUCtAEd
	iqDug/Fs0gkoqpOhBL4KWn5KfCNvgpYTtq6KCk7349AVendHzJWQpzeuEgAzJBCr3i4cL84kQZR
	bxDB7RWLYmh3DE/22rOM6GBnuJpSpI236xuulAwJ6Kw/4T5Jx21n5pHjeWymQPOC0ywMoOR9tB8
	wqr3OlY/SuXTo72AIqQ/pGErmJpHexwI6riONA9ZRvmEq8YPEsUV632EQ3ocHqA08DwbQPR9who
	TcjiiyVPFJhsacDIBnYqkHH+mCjQv9tq2ogbu9SV8yMHP5YiD4PksE1MgMRiuqy4qrKPuW6rDUv
	5LVVvRHJQ=
X-Received: by 2002:a17:90a:ac8:b0:39b:34ef:3b24 with SMTP id
 98e67ed59e1d1-39b34ef3f26mr333101a91.1.1788509536376; Fri, 04 Sep 2026
 01:12:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202609020931.48FF902461@keescook> <CAHk-=whZQzNuBZdV1b1TBxRf+asBGtvnC=Ggu755GaOg_TYXgw@mail.gmail.com>
 <202609021647.3F67F66B@keescook> <CANiq72=7msFj95ZYf5u5MfODci3J__KRxYEjZRL5Jj4gVyssLQ@mail.gmail.com>
 <153F0BB6-98A2-4F53-BE82-16385BF01760@kernel.org>
In-Reply-To: <153F0BB6-98A2-4F53-BE82-16385BF01760@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Sep 2026 10:12:02 +0200
X-Gm-Features: AcwNN1XCP9w6fY32mDVIQXz1wp7XbNeJd1MeVcSYDS6o-MOl9i0zoXGcxHEnp0g
Message-ID: <CANiq72nEfuiessdj_7EwQcdUsdUnO1vY8WC9HJ6fZaoih1ZuqA@mail.gmail.com>
Subject: Re: [GIT PULL] hardening fix for v7.3-rc2
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 3:38=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> Yes, this latter one. I was going to send it after rc2 and we could let i=
t bake for the whole dev cycle.

If you prefer a single patch doing both, then I can integrate it into
mine if that helps; but if you want to drive it, that sounds good too,
of course.

Otherwise, I suggested back then to do 2 patches, e.g. one simplifying
the C side first, and then the one adding the Rust side, because that
sounded cleaner:

  https://lore.kernel.org/rust-for-linux/CANiq72n=3DhgH4bqJjp8MsMHAaxaAo75G=
SBcHGTvFT3NTSaVPGWg@mail.gmail.com/

(We could do it the other way around to keep the Tested-by from
Andreas, but a lot of time has passed, so it would be best to ask for
a re-test -- Cc'ing Andreas).

Cheers,
Miguel
