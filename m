Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46363BE14A
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 16:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788109091; cv=pass; b=fOK1Tgcm+bHXTHsomz/MK74uMKGgqccGGchIYmkN/qiAItkHvp0VFSjLWzBnkPPoesZ1FrC6ylMhUcTpxeO8asICmoUoDJbQ6zuoyJQRpSTFd0ib1bj1dmGk6Go94Oca0EQGFDa9XQ4Fc4n2CZjWPJ/Qw1ZpiIaRWoebEMRwvwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788109091; c=relaxed/simple;
	bh=E815F+dIEHf1oXFrp0h+rhmpQKySt4t8/mljLKMC7bU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eTUJvcZCaJYMXdJBQgB2oLpEL+y38do3/acNnvCktnp17BlFKRhVp8eF395yrvv8x/GWUObbIIgXJ/hhXhZUGDa6FDK3ZmBNoOt5Q2unITczRBAeGUMwDD5feQm0ZIx8wD/Al4hc6r4MebbrRD/8dOuk3zX5z+G9AgdgNkTHjBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HkmT2Dm7; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HkmT2Dm7"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-52faa58bff5so227271cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 09:58:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788109086; cv=none;
        d=google.com; s=arc-20260327;
        b=P8GmnNWP5vI8yzw4KdM7yCQk4GkV6+yKO6ovvi+R9NmOC1gkEqn2Urkm2m9jcMX5CY
         DlIOjoOJVK9yi2b/eZ9YJbfHwbZlh3PRSdb7bWExaGehlOT2lUfffIae3e+WHyAOMjz0
         Iul0NdUiKCNPmdEFpyWjj0hhcqGHd6gtFV2qItUMqIMUfuBc2FWML+phbQr9ocUG3FXZ
         1WL8GO9/BJ5/LGem7dyg/yhnx8nusGhkbYiXJ+eoUvyuwTGuwdibWJZtEM6rZeOw4+9z
         2XD4t91g2zqjW4TJT7o92BoG0X1Z5AS51cmBM2D5ghiqXdTZywzlgl35wahy8Os7GF+n
         oiag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eY6S1CuOxppKERshHyMUDaMx3fFTWDyqBYaQ5/cHRXU=;
        fh=EoqBc8anyKQ4lG9k4sfy1ApTlhsCocYubHbHiY5Qink=;
        b=SxEwrnDQsE1Pi6EmDpe8wLcw+YfZZJmypudR7Ay7ao3cmtjm+ltw7xsKfgdv6kwrPC
         SUQh/8NKXAXO/0mxGeTw+ZmwhouFULrrOsYHPPKBx+iO06vdb+xeoHkIQO+JLMeR6tQ6
         itToXZ3jgf9ea5hj4XnQbXZRNoA0o2v+L3Zz6mEgdMDLwHk2uuFMNbqlqZ7C5CeXIbTn
         DVe/IydkWJ8DChmnRDwoxalKIGeKMIfVQeANjbigNmGdhyN1hTTiLkebiX7/5dNrOGze
         Y6MDUCFSZqAwf+/JrmkluW70w6wSsB+3XIhvyDpC3iza5K5YVLCEZhDRON7b8rx78FiT
         5HNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788109086; x=1788713886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eY6S1CuOxppKERshHyMUDaMx3fFTWDyqBYaQ5/cHRXU=;
        b=HkmT2Dm7x5H8V48D4QbjMtUKO/kKmwAqc4NXTMBQP90uRZLasNJ5zGKnzu5utSdMGm
         BchOBT+zc+qUK5Y2BWS7ztc7zSwbFzJ/c1b7UvUPQBKhBxpYNEVElCjIom9wLGBOrFKg
         X5rxv6IEXkS24RpzwFQ+jcDizGP+UY7OKaXao28/3FjTw2NvFwa5MILRYrtvQXIdfa42
         8zY+ErqpwI1wZsP6qUYRxub5IScmbZJF4YBhJqCw+evFIhmmRyxAcOMYjdZMZKRyThvH
         0wfAYpy2BWywYVYUnZc+c4hmrJgRslUUsQQesGp60hli2+oSB7ZBba954Bom7xA+I7KD
         24qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788109086; x=1788713886;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eY6S1CuOxppKERshHyMUDaMx3fFTWDyqBYaQ5/cHRXU=;
        b=k1La8x9hoFtm8MC/IwDEH26Ephtq3P514JbwpLiP81kgL3nkWIZHoyv6V28NsStWZ1
         AWAtEHoi95mEDAKbdJzhCFoQE4au7WPwEtE+wW87mE7yC/k6lqs0mksNkrUGDYxQAJtP
         7ERGIMaBn9Ml4SJlEjz9LX8p1Ugz7LY2Rllf/tsBDbgxuj6k+ipdOmelbaX/A7PqdzX7
         X5fkhp/r6n1hdHnYZbJnJgN7SaJ/gmDdViC10hixV5gK3hAqwQ7PXNVrB0qkywpO+Dg6
         quSA2xx30oKOe31/MmuJE0Nkt3xFp5stvWTz3rvQ/9P/sDrNrJvhsfAlZmSBqJLc/S9B
         nftw==
X-Forwarded-Encrypted: i=1; AHgh+RoCmZSbnogtH4XdUEKYu2kxFlmv9diS2hBmvddqJJc0GARNigU9aIC0ynU7LJGFjtrzYnKIB41Hw8pgoeQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kAFgaDPyIQPf+k7OHFMoSWh14o06V0QyUSHXz1BkOKWmK75T3C
	VpZLzQlyd4p3yqblOuDvVw7BZQFnJ9v7bMwc2ANLTtKfIxp7vGoZE4fHMzLFbcO/397eDtWe54P
	IlATSQ1Lq8P3gGvoc0KIHMeN1PKm2eemXZiNiKxKk
X-Gm-Gg: AR+sD104uFJvatYRngwXmthPSALApzvGhc40QAjVhEiZnumg8t8J4hIh+8MulUYOvrE
	CTq/0QXdk6agHl96YPlrO0GBKc32HHGKHAPTKEHw5nEB7ja8oPoIyJcwAH5fnpAsxZrNNve5LEJ
	+ZSPssRKAJ1aJSbA/t/OgnKrG/FqMpjmoRNyA/U1j+eVikfB6svBidwO3z1eXkaXY4R9LmiJkYc
	eLcp/jFFar9EhLLyJCsp5n5XQoo3nHTGZV/RjmQBwv4YmJQTerZKfvo3yXHoVz+D95lbafL8KRa
	Ff2a6Q35a9l+qBffz1fMM1G9qC3PZS38ragskxmtyDE=
X-Received: by 2002:ac8:5a4d:0:b0:52f:6e06:89ac with SMTP id
 d75a77b69052e-52ff7392cdbmr18296591cf.13.1788109084962; Sun, 30 Aug 2026
 09:58:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813193433.3318288-1-surenb@google.com> <20260829185625.f5ee1b2931818843a78af88d@linux-foundation.org>
In-Reply-To: <20260829185625.f5ee1b2931818843a78af88d@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 30 Aug 2026 09:57:53 -0700
X-Gm-Features: AcwNN1Uwp2PnQgLvcaKuLpOXbpaoKSzdckjfmxjUMDcpe7gynTwxBKZlGUetcPI
Message-ID: <CAJuCfpFtq4Y-dDXNHJWDEXayhyCqqjTdJUCM3QTdbeBB1rXUNA@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] mm: Unconditional per-VMA locks and cleanups
To: Andrew Morton <akpm@linux-foundation.org>
Cc: dave.hansen@linux.intel.com, Liam.Howlett@oracle.com, ljs@kernel.org, 
	david@redhat.com, willy@infradead.org, shakeel.butt@linux.dev, 
	vbabka@kernel.org, jannh@google.com, aliceryhl@google.com, arve@android.com, 
	cmllamas@google.com, christian@brauner.io, tkjos@android.com, 
	dsahern@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2026 at 6:56=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Thu, 13 Aug 2026 12:34:28 -0700 Suren Baghdasaryan <surenb@google.com>=
 wrote:
>
> > v2 version of this patchset [1] was written by Dave Hansen and per his
> > request, I'm taking over this series.
> >
> > tl;dr: Make per-VMA locks available in all configs. Simplify some
> > of the per-VMA lock users now that they can rely on them being
> > always available.
>
> It's been 2+ weeks so perhaps a refresh-and-remind would be helpful.
>
> But it applies well enough and is adequately reviewed so I put it in
> there for testing, thanks.
>
> AI review might have found a couple of pre-existing binder bugs:
>
>         https://sashiko.dev/#/patchset/20260813193433.3318288-1-surenb@go=
ogle.com
>
> and a small rusty thing which you might wish to attend to.

Ack.

>
> > Binder and networking folks: Your code is the target of the cleanups.
> > I'm cc'ing you now on v2 because there's emerging consensus on the mm
> > side that the approach here is sane. I'm not quite sure how this pile
> > would get merged, but ack/review tags would be appreciated if this
> > looks good to you.
>
> As said, a resend might help with this.

Will send an update on Monday.

>
> More binder/net acks would be helpful, please.
