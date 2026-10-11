Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE5C2D97B7
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 16:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791735647; cv=pass; b=gSJfJGoiJuSonYKGJt5qZCufapFAhRZOQ+2Tvmvceek9RZjWpmmaIy2Jy5sn2xrLvIQKsJjHakhEf/MI9NZIxsrWS0oSHDrtxpClllrqkIGNuGe8M6UIGPtm1wWabqld+i2ZRnM9CgAWOZhL73Vk8n1nEi4dpCxK/07tepFRG9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791735647; c=relaxed/simple;
	bh=QUiNdW6VFdxYMeVAMHDcIzKBwB4DCuWygXNIK8VM5JY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L488onrK2NdFYWDMVQcWn8Z45IZhkCmog57zTzaLVc7vRkSv2cRXUh+HD1U5KCH5HxbgfbBEiFc+1uMLfCTMQXWPjHa/Xib1We45xHRmnkhRhFJiXNhaFIewJJ2KlG4/2J5+Q0pQBWeo9Ucff4Vxt7XUtgY0zK/3fVPB0uRE0P0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QG2kYRMS; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QG2kYRMS"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-34c522572bfso130527eec.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 09:20:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791735645; cv=none;
        d=google.com; s=arc-20260327;
        b=j7iNBA14acZJY62BWHgK5q5u9v/pfGGMnDb3c2l1BNzWGPUXXoj76dtirqHyaTgfmC
         MiILpSi+UlTbGi1BU6znzSxbw8NomQrt/77AJIEBjXNgVjhxKUX+CYDnsEF0Ag3yXsva
         Flf17ogOtmRqe6f445lh53MTSy+2xoCnXsD0tdnkP6EJ0KIUfD58kI/vuUoRJFdk+Pu1
         4j2OifLKG4+s8TdobZ9LbOkPS9p2PXd2NZ09b/sVWhivPC53ujIGiUOnGqIZCgQ5Wt2U
         ux89G5WaUjg8eNChcVHEWsVUJ08c1DqXA/f4M9pzHm/5uAAFO4E+Rf/se3Qr6ZNwz4qa
         ABXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pzp6+YC7TXvsEpHQZBAKMbTQLxmMNWdshnXk9liYwgM=;
        fh=XZyg0Bg6iclfn76GraCjVyRnQ59tA+0QLwd9FmlYXkE=;
        b=h/9gAZ6eCDFw/qYQPxWLwrbG9/YzmymyREedbHH/qLl6DLir1t/9pX5qTrjOKG8euB
         35bpj0VhgJHTXmh5mCVfMul0AGcxCdr32pm6aJjxFYyvAYGMEYcHXTrrwQfCP/0LlWi4
         0y7xGxgWglASRrA/BRpBRVZ4RDYwgViu975rHuXMTZXEYLYmlvTJHjpHelgnhfgJNAlO
         +1g75irwkp40nNAwNF/yY0wMHBYktBEDfcvQS/gi7v2INTk4ddo5qVAO4Jvr1n/acAZG
         BzOk4NPzgLTQZcQQ/enmO8IgIQujyihMVn99HeY6ssUOuUFOpyOVbYEMMleRBU7QUBvY
         +/Jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791735645; x=1792340445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pzp6+YC7TXvsEpHQZBAKMbTQLxmMNWdshnXk9liYwgM=;
        b=QG2kYRMS4i3OrV5onbdj0jIQ20na/j6Qt9IiEoEby1sFgEnD2dpq/Z+amNR3LqlipD
         uAuxNIYHEQJDS0LE2J9ufc6Bm5F/fHUgMCalizWPwfKBDtCO2pix7DLxGXT+B1K8gAB0
         XguEpKW7LydITFy+Gl1/Rhsw+xwlCEF7C7dvrzDc5aRvxH11L0XJUOJ/9uGpndmyvmHM
         gCzI+D3QKPYzlQ03C3fIhwV5s4nFh0EYLDYQy8aTl1qJtOBuOMNvOBfp9jHP/GKdmKyV
         H3OGVf5fS88hl+tBZC58suSWgN5tKmdzLZcoBK9Wsry0JMrmmEPYHfP9rE3t9GMeHQTD
         qBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791735645; x=1792340445;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pzp6+YC7TXvsEpHQZBAKMbTQLxmMNWdshnXk9liYwgM=;
        b=qhgzP40zS+MV8gsr+5ZT5KRYEaVQ24x10FY4pVXG5psLv2j2t1jJ6KLpTvlqAd/lRA
         S5WAmEI4q0EO1xn0gyqcTOD2pH+enDkkSuTvV/d5A+uZGFO0m8QTMMKx0vwwlsHDzsA4
         xzE9xvomsoveHfNWbjmkHh211EO7S5Eg5nxuzJX3VSdQsuX331grUJy6QQLff3vL5vB1
         GNmsdJNb5cJOqxzN8pD3Yy2658Nf/TWXv0t0ikW3UaMDJlJbWb32yIB+UcbQ3mgy72rA
         8qhnOMFghdmST3NFhfLKtZirJ3AXNm6CGqTP+YrZy/Mxn2jq14GZl0R/ATVW5wyJKt6x
         poQg==
X-Forwarded-Encrypted: i=1; AKwUvBwe/5OmAZXQBSF405xF7Htv0syW1Ie2EJf+Uw8lp/arrPQtp8wUPFBqh/OYPkrsd0ljSJ93bEguS/aLo5Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYL76aUtUQC47xAr2egqFYvJO4Tag9tIoVJq+jyrCcOFDsxhm/hx
	mpHEZFKvBXbq/F9NgTXygW/QBNN/fE0EzvGFdByfhk7xcA/vvn3cnMKg5h4AMTTwUfLfiAqaA6e
	9A4/4bSE/jtTe58+UcPG8nPqtu4SGEBwtvzI3WyI=
X-Gm-Gg: AYBFou3RZlvqQlBsSGTbwiVkjlnuOdGKali3vFjUHgENQq8qcXm+7yVFeSOQfs9mec6
	WOJrDrtoPn9o+lIeVl/x1WYnpeAQYbK2L4ULfEgx14rjCuGr+Jnw0FYdP8qzNMJ8uFTMaw9YCLw
	mYWsh51e9MgpUUVpjVO7BZ1b7zmMbYJF+JuydZTZUk2tz2Sok8DWLVjiUxsEaJaBI2nQ5olh+f4
	oAC6o4noYKGZevA65HDLtKJBmC6ip4hOjQEN4unZYDfqPlaDTX6JRcPkvZh1REfeowBKrXnNzsY
	j4+V3OdRk2+1vn67GrJuZNMtmQe3WAMbfmmOiF8mBgVM8//aZMdBLyhZ1OpVIjw1IGX69hcIItJ
	q29GKZYiED5H/YBONo0lgCH2bluQ85PaqMtKQzhpfpBvskfTF1y7xN/G9/OW4KcJ46SeC+K/+dl
	qZcJK3qh9X3jBlz9dFqZoY4bu65+Vfia3Dc8M5nzbjvF4eirXCWlo=
X-Received: by 2002:a05:7301:5413:b0:358:c9f3:b055 with SMTP id
 5a478bee46e88-358c9f3b260mr9244966eec.1.1791735644658; Sun, 11 Oct 2026
 09:20:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010095001.265759-1-julianbraha@gmail.com>
In-Reply-To: <20261010095001.265759-1-julianbraha@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 11 Oct 2026 18:20:29 +0200
X-Gm-Features: AclHuK_w3Y4kAwcZA7SbeHM9fSvSzVE9w0UyxZwltGRDETa14I43fFQK9NA9AuI
Message-ID: <CANiq72kyZpDa1YfLjPYQbatogvMONM0SOww1iQDQaZ4atcu+9g@mail.gmail.com>
Subject: Re: [PATCH] kconfig: wrap long expressions in menuconfig
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, ojeda@kernel.org, a.hindborg@kernel.org, 
	nico@fluxnic.net, rdunlap@infradead.org, grahamr@qti.qualcomm.com, 
	jakub.git@horky.net, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 11:50=E2=80=AFAM Julian Braha <julianbraha@gmail.co=
m> wrote:
>
> In an offline conversation, Miguel Ojeda reported that scrolling
> horizontally in menuconfig's search to read RUST's dependencies has been
> slowing down debugging.

Thanks for working on this!

This is definitely useful, because users (and ourselves) have had to
scroll horizontally too much for `CONFIG_RUST` :)

Maybe it could help to clarify here that "debugging" above means
understanding by users (i.e. not developers) why the dependencies are
not satisfied. `menuconfig`'s search is uniquely useful because it
shows the expressions with the current values; i.e. this is useful for
most users dealing with long configs like `RUST`'s.

Is this patch the live one you showed me back in the conference?

By the way, for context and future reference before I forget, I
suggested a few other bits:

  - Wrapping on the top-level `&&` operators.

  - Even better, wrapping on the actual `depends on` lines, rather
than every top-level `&&`, because sometimes they are logically
grouped, even if they may use themselves `&&` for the condition. But
IIRC we discussed that this would require tracking more state and/or
reworking part of the parser.

  - For completeness, I also mentioned potentially considering to show
(a subset of) attached comments, but that is not really needed and it
is really low hanging fruit that is most likely not worth its
complexity: we already have descriptions and most options are not as
complex as `RUST`'s.

Cheers,
Miguel
