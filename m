Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B33B331EDF
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 06:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791352986; cv=pass; b=X40LjI3PrKMEx10N+JKXiEtpd0Gj1PaxdKj8rl72ICJASFQghub7ktrFAf5Ez6oTrwmxKLMjDhXJB/86dDHjSzO1bLSV3/bCYWyO1HeIL/PbJzktEKz52wrHAdkrNfzSzcK1+3hRoSQCKCFnzQ1PFWtWehPU2iop7Upr/6pAkNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791352986; c=relaxed/simple;
	bh=FieSFhLdozKsUNyoEr9PXiW853gnhNUhDQ5NE6wOnaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zx+Hb5o6+utQEGIk2gsAizzlldzNH9nVihxk1/qzybJfEsXc0CtKR75oNoogQdiq2czEARtZx6dlg3w0/yj710w3Inmdq5p3+rghpUWA7ORP3EQoXoLu2zHUljvTpG1v0UP4jmzcYb47b4VTCMMChUGKLrwgWASaoZu46UqRk6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U81xgbUH; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U81xgbUH"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-487048857f6so1144731f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 23:03:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791352984; cv=none;
        d=google.com; s=arc-20260327;
        b=Lzi42ZUhMZv7o7l6k8+Qw3AyR7573kZz8woxRALVG+AB/bb4iyGC1XP1oBE/DmZEmg
         EC77/x7JA4toew2jWSGKWVaRg7i7paDGN6VVqo1MbqSpgWJHtWawlpCbScQLEMtZM5Yb
         KngVuRfKyNJZlfwAmxZo4w6Dw3X57zDz6XxK9bnJiV7/KqD0sVHK310eGR/w5DcrcV3F
         dP85c59ehOhsQ84JTyNklYtysCwBzeVJwDRonL+luSRjS0fkjtr9W0QslGHO1OTgq9KN
         rt6csaWUUIcP5ZYR6KUv6GYFe01vKfzU0i5vdANXlD2XuteC3HoUa7Opnl0MxWasMoV/
         EfrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FieSFhLdozKsUNyoEr9PXiW853gnhNUhDQ5NE6wOnaU=;
        fh=YcVtoMC1pRZimeaBw7rgxzJH++7drNiN7LPxf/FgA+4=;
        b=j35mBZWdGjDlicTZT7Cvib2MeoFu6oeBMf3Cq6edAdnITsaL2+5tEmGORxzmLPiFI5
         ljgz/FJDOTZQPrBDiANrXRv6Q8gPbgJNZwP5xylRQeaDwxUFvK914iFKYoYiQ5JwkFRQ
         o6lrFxn0ZxCTc1rFheUVftfe+D/diof0eq3pQeR97etj8D3l48f33cuk3TpY7/yBjj8y
         yhcvoHLikPdgsdJv01J+cNDADYSzjWqj5pNWMW18Twp5NXOPvnlFFLy5dfvRJdzWPtje
         J9T3HpxDmRjRnltLZV3EJQnLnq/cB+6OhB4Y63ui5kf6MexPbHdtagOQ+v5lZhVT9Yse
         7DZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791352984; x=1791957784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FieSFhLdozKsUNyoEr9PXiW853gnhNUhDQ5NE6wOnaU=;
        b=U81xgbUHTEHIe+zPE0e5sgxSsNp4Z+8+8Tf0uxVgUtba7L69pBa4pyRqmeIZ61G4MC
         eQsY21rWt9/cHrkQ9PQX3jWtgZQB/YTdRLE/kTz58O6z8BB1jfAJCgyh5rUNEVZV4JGs
         2JiU14f/B4RueP3vHu49LFGDXEIJeRP+O/OhiFxs0AfRrqjP1Epy7XdxIkyEGD92/44j
         N3l3PssF+yiL6hRChw+3c5xI0jNLv6bGgIkPec/zh3Hpn4PyOPqpe8ciaH4lZz8mrua5
         v9Fxx//Tmao35o7LJTP3nYiP/pksSC+kIjhE9dZiQoilqkKHv0EtUEA71nu4GO8ntZgf
         FCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791352984; x=1791957784;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FieSFhLdozKsUNyoEr9PXiW853gnhNUhDQ5NE6wOnaU=;
        b=qolvF3QJ7toyaHdmvGa9V/4+BylElipHswpx3cbXuy3izgFDoChljgAtfX4cavvsLI
         NliLXsZ5yBPSBvySSxShEyX+GbaN/ZQPbE6WIxX/aCzKesITaBo2oJtiSpw6eVMXqB1e
         LtU25tLG0XpzfpXBFcClLOT9tvBj7eBsQ2eap9QOxqE+fjzfrJQFKim9uVjyMHAluZjh
         pZNTKcceIEXDehDNvOb9DkrsCxsgJri6tPnLOXVfD3TqJ/v423QfhbB5ZOguWPyZkdUM
         LF3MNxz5mPvTZdpbLfZl3UdbDeF6AUIfWO98WuyK0JPhFoxFjlHRBJKmIwoxvokrsdP3
         5KAQ==
X-Forwarded-Encrypted: i=1; AKwUvBy76kqbmBW3Km4Gg7XRGzg5NLQ6tIb/p7lH0SdBPQMZwX9fb27PFbXmKHaP/X6V/UO/sGlGXILxm+2vQB4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYvJ/IBQvZr4zEuSPxPtvIDLP9yG5c54HP1va7AKLxrXoSWkG9
	XVL4XVszkOC736mobCtiwNb6v7q4n8jeT5IZtMsNeug996jygYs9u3h3CvCvsjtUIDAj5cHEBML
	rWxGrMln7yQLdPzxd4729No6qKJgsFGXy4doYYA4p
X-Gm-Gg: AYBFou12OFZfRSN6LUgjBxWcWTAzclP2Mz6fZFIuso9Qt+gdnk+YcumyryWG94bGu2e
	TYq2ice3pcL4Cy7dVig7y87N+Si6ePOEaZd+DenlX7TsGwSYlSRNXFJAJlRSGqBFEPsZJWRdMm7
	YJQsyoAzOpHlO5Q3ysO5pu/lHIVjnjIoJlpJFBy5FMJsdFly8DUD8YAVECLJRMilSYdKDGEY/4v
	gmDoaZoYXCT/7B6tvheCmDjSgAEXVR8HZU18ewKUL/SBGEXLEtn6gPloKKe2pc0nlSl9j+CLtwk
	lfeLp70kznOyUnoxAv9BtubFmHV4FO49Ns0Up5tIKnWOP4es0xWKrVo0+3L3ZeKbtpUPfuWvyJp
	VfNnjaiA+iY/WRGmceGN0gg==
X-Received: by 2002:a05:6000:22c4:b0:487:27f9:840 with SMTP id
 ffacd0b85a97d-48c72898491mr2425269f8f.53.1791352982922; Tue, 06 Oct 2026
 23:03:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-devres-6-18-backport-v1-5-06dcf0e592d5@google.com> <2026-10-06-1-daily-reply-0001-rust-irq-cookie-7.2@kernel.org>
In-Reply-To: <2026-10-06-1-daily-reply-0001-rust-irq-cookie-7.2@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 7 Oct 2026 08:02:50 +0200
X-Gm-Features: AclHuK8hcWrWSzFx2gPHGU-ZsxcJZ1WfkgDVOXDwBNO83no3aGdcmvQVaOUlmNg
Message-ID: <CAH5fLghSL4skGJZM3wmvq=PYiHVgB6gRUZTg18wSx8x2rETT6g@mail.gmail.com>
Subject: Re: [PATCH 6.18.y 5/5] rust: irq: pass RegistrationInner as cookie to request_irq
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Gary Guo <gary@garyguo.net>, Markus Probst <markus.probst@posteo.de>, 
	Miguel Ojeda <ojeda@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 11:36=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> > This is not needed in mainline because commit 98c63ce4d760 ("rust: irq:
> > make Registration compatible with lifetime-bound drivers") removed
> > Devres from irq::Registration.
>
> 7.2 has the same uninitialized read. Devres::new() returns Result<Self>
> there as well, since ba268514ea14 ("rust: devres: fix race condition due
> to nesting") is already in v7.0, and the refactor you cite only arrives i=
n
> v7.3. This patch does not apply to 7.2 as is, because d1880d5f5899 ("rust=
:
> irq: move 'static bounds to traits") moved the context lines.
>
> Could you send a 7.2.y variant of this patch? We will queue the 6.18
> series together with it.

Sent! Thanks!

Alice
