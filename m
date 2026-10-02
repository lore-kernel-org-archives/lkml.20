Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF3240F731
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 18:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790966611; cv=pass; b=CQhge4k6aqB63bEpGqr+Db/Z5straY5GDajw8SltyFi3lulpAfhVqvhL/0a3NFXg9zVNrOsSwbtKjCi2ytc+90TZfKm52Bg7McJYxgKrXqsR9J7ddgGIMVHQWQvH4c35l1JjqDdRxN2Xa0V1ipPlzDONUIYcFFRJYPmYH1vDNqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790966611; c=relaxed/simple;
	bh=+8giRIva8Xtt/QGhLW8m0S2kVNxw8aKS2XZv/pRromw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H70gppVUMhY/UprkmjGr9mwyPRVROFjbeEZjSc70Nencsmg9aYTS1Kv2a6I9lfuQdaz8NfdO186jJ2Fnrh+ghFR79hHtjMJFlCx2Hz4UUvdJmf1jTfwWn20/iSHKRPWDrKwNYahka4uiBl5RikdzpMYZbSnq7777+xKKxa1qE8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lf5Ggxx8; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lf5Ggxx8"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-350e6de7dfeso97957eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 11:43:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790966609; cv=none;
        d=google.com; s=arc-20260327;
        b=SikGPUac6k82a4uVpA93WEKczZ4PzDPSYlAsvQFmXD32HkDw0yzl9fIiElKlPBWIEM
         ipmZjTPtSacek8Y7cZtBja8ZMiPxAKJF54q0610hytDoEkb4UliElDiTLixgyLqjt51c
         nd4xsOEZQ+ZCUrhdaBQqW20e6Rni/ujbcN6ZhYZ4DwK0GZl8SEAaY+M72cusUss9Xtkg
         UEisKYWIqBEX8pOishnJs/XRDjQfzUDbxAXqWfXAVPyY9lO13biPnPwypvWlqASiWQJU
         XYO5XdIxqWX3OrVh40q8kcRRe5qsqW/QD3VLAC8CaFds8eDGaMw2P/0N+FFp0xay42Mn
         wxcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FAlTpdA3JGK4S+vpVZN9wxh+KybxUcOpKKtqidXNLgA=;
        fh=r3Do8R9yWjB2eVJrDia1Kxp0xvsLnUMjunSgHsMmpyY=;
        b=OepngQIw/uPMW+b1KKhtp5kF7LZuQ71M67NTO15z7UtC/VK9K1zejefaHK+Ue3t+ek
         0Zsn0FbBrWQ4J/khMMxDrImHPiljp1++tnQqCJL/4pleQ7HQpJtPPTa28iJMSMAic9+s
         SFMIWERSPuCieKwDFg132NW5SM66l9iPjlKdZeA0kDik1yJ5rqwvmMSw+h9xsuSZHRsg
         z4iTrV/WLA7LKdE7IseS0Yp1x6msoJDiimqHl+aSWHScaeV72ls0lbuVR4ACrtzjmiQe
         DfoZ4lItnCP/Bs7UWvR8MbnhuxySoNx+6bqtO3GVglgmQRMFYVolCTBcO80LwJu5hTCQ
         i72w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790966609; x=1791571409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FAlTpdA3JGK4S+vpVZN9wxh+KybxUcOpKKtqidXNLgA=;
        b=Lf5Ggxx8GWy4aPvdZa66ytK8Ld409DCpR7scK1g9D+QFLkWC126tIaiIPiBt+3KToH
         CImLw6/J/UE0L1+zr/iIfArlBpMw/WSgL72fW9Md77f92Q2FVqWDZvYfFOiXHrEqMZds
         6BrBn4fe2pNWjIie5l06ix6r9pn7Al4q0yxHkjBTJ8dor2wQwmH1u0qcjwfuOrp/va1Y
         NFoFq6Kbz5xJwIoclwlxaTCqWGJwam74Q+jxjn4HLdkU/PXJbz0WNNebjvilvS0WX3Lp
         d5XTzCdmu7nfQZi6/+6sp1cLVa02KC63d5vEVAwbU8jhePyAHIX76y+uTNCHqnRWJfe8
         mObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790966609; x=1791571409;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FAlTpdA3JGK4S+vpVZN9wxh+KybxUcOpKKtqidXNLgA=;
        b=j8URNDXKwTNHa7aaqZ4rarlLWhfQt1yqeTv9NZKq+p0yoVsqsRKT6/Zyltay8KGkiu
         k2tkNOcx7TV/AVJ0YIBnlb928XEgTKC7KYpIxa5ZPaK3CL6YyvmqAU6c/FgrXvOCS1dS
         RQ/3OtOdhgqdY9eW+E++dzYkecP8cZpQ+recN8fvO8JVa14sLPaRieAnCXeFKULbYFpc
         We1lUaQWJFnWcQGBQLk0HOcF7UQv28nw8ZAsWL2bfQla58ywUTHze7rmQKeVNQHehc3s
         DoTQ24AkK/zj07TTGy2EZkXDGuHzgkXihkGWSQyhVkItmg2uUzv52hzWm/K5WHqMWhPb
         sPqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjEAVcZlNLb8z8CDU46txBJo0oCtpQElQK/G6vYDefD0n9F4+ZjhCAHOHjnU2OOiGmO+454jQo9RxcOdM=@vger.kernel.org
X-Gm-Message-State: AFuF++nseVL6bRIgf9yaxd+CYLIJ0DLoDqJfoG83S8tFTH7cgv7W1MWy
	f6eoi8GeQW3xC8TDGXWV3Vg/zk7T9FIG6fegC7nf01UNSx7eZjULlmr6cQRj66Bgjwnf5FYi/BP
	y9/aR0oUgoUbJHUfQe/9F2Me4kjhlGyyrbTvQAAI=
X-Gm-Gg: AYBFou2Sr09gRwQkGSxVaE99/O0+ad2ZbJgL+EFV1ssWw6oPsjWPMucWnsPVhawKFHT
	4XyQHuA4z9q346QhEQLS5mGHwIRRmgf1OQgW8epdVPEoedZjMEABrh/oK8WAP+E/IL84TEP4hEi
	rMHLg2GQ3zIsMM0QcmO1p10h0EL14CCRbDOphuq3ZOSM98KKeK/MaGhhmipXAMgh18LXy+U/ZUa
	kZpGgDoJn7mnqTRWCaTY3wlsPlCSFAwGOKbBIVpDZdORs5TgKyOz82pL2XW+q4f95cTwpl354iZ
	dMDuizw82KGf7DDV/S41/z0fq4+AIwwWqfyadq+cX458DiNmNWneuOG2aLCiIAHnump09odt9DK
	zLp2Ahr+Ti8VB2kYLusjeMh4iJ6fZybKiB/mrVV9OBRwnMpKyhs5ItSICQYTVcYJ5WF+XFxN7cZ
	gSWR4McLX8P4Gf+Tu3XNkTDoRkM0s5GoA5BfYA2VtJU9xilkq/in0=
X-Received: by 2002:a05:701b:424d:20b0:146:ffa9:2117 with SMTP id
 a92af1059eb24-14f5aa4188fmr6124238c88.1.1790966609380; Fri, 02 Oct 2026
 11:43:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ar_0MTEPHARiUqc0@sirena.co.uk>
In-Reply-To: <ar_0MTEPHARiUqc0@sirena.co.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 20:43:14 +0200
X-Gm-Features: AclHuK_alLvtcNxx6cLAevu_sz8QC9V6lp9CNOOyfxNDgqInLbQjnJK23t8fUyc
Message-ID: <CANiq72nR4sz5xvTVqqnwvoVJ0s-sDETQyPc9MUKo2698Ocp-Kg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm-rust tree with the rust tree
To: Mark Brown <broonie@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 8:13=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
>  +// TODO: `Alignment` should be moved here as well, Rust moved it upstre=
am in 1.96.
>  +pub use crate::ptr::Alignment;
> + use crate::prelude::*;

Ideally we would do:

    use crate::prelude::*;

    // TODO: `Alignment` should be moved here as well, Rust moved it
upstream in 1.96.
    pub use crate::ptr::Alignment;

since one is a re-export and has the `TODO` message, but apart from
that, it looks good, thanks!

Cheers,
Miguel
