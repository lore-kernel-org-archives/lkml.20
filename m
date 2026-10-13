Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C283ED5AC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791911840; cv=pass; b=uItSHJvTXw0gR9HkpN5n2OY44lRuX59+RpAXmq+kjE8pBx/PMpHY/r5Vha6rVCDuYK+JLIl5gar8ID4mW4gs80a2aMi9yxCdeu9OgB9nRMfnsoIBT1xrnRkLVQigptRss2PXvZtoBgFUkynpEst6PfmuSReno9Js7l7Od+reJ3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791911840; c=relaxed/simple;
	bh=+XQaT/ideq5TFXn6sLz6MKqdp6lKnHb00yMCE/K7wq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sQf7xoHv8snWUIHy13a/rVbCHXKQ/oIa0ElKPZB7JlF3y53Ses+uRF9nT4t/T5OhMsoa8c+KfCcUTf6Vjv6tOR7qqbb7qQWbM4AvV5rDUsJ2iHpEVmFYusYsjOxjDndlocowKL7Osbsl9de1efm4JqtX6peWbPppseVHbTOfLBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ewbazzXd; arc=pass smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ewbazzXd"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7ca917f9f52so1865939137.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:17:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791911838; cv=none;
        d=google.com; s=arc-20260327;
        b=RByZusln+885EBJp3EYK8zZugT7oAqcdwREPpcFFhgtLZEGZzDG/bo4o2QctWrVozI
         hIrdxl3Mh4txso4Q5/WrTtJm3cgaT8O2L2xaYwAl1Wdrb/Wde28ZYHY6WC10iFzc1hiq
         zIVF3GDwYBa+HXSLt0tU47Kk51lgsRKGQ9WR5DLTl8Ek+DiFFqYhiRBqzNxaAmrc/rYx
         DoMmH5rHGpXHDsnFWg4dHJ7NnnyUpU3mA+dkjsV164ZUf2qY6x6f5lb7wBV6dgQwjYAp
         ckiEHyAYZXYyGsHA6Qevw4RB3WVK1MIGLkW0cIlphirXYaVGWYKvf+vP2A2qkuGoOCTR
         pASQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DaQpwDjYu505Vk63Cf/nZMg9BHMHTPNDB+uyyd06enU=;
        fh=idZsqcwAjy+4fo8wPxHyx2vgWvNBe8kxkzUwWsotthc=;
        b=JKwpz6LHwL/IpCcKYEB3LyfNMxGV0BG5bKuvkPnarVa3ENS7Cyw4GkeMtm5plpewa7
         q1eUvrTq5Y1ddeiwsS1ZTm459gh57aUC3Xw4RmzthYIyY7tKGN5+/qrpRcY/96+8ENKK
         gOZTbsfWyktnqNhVyvpstVsou5nY/SMmRHjmrTVa04FRYw4QwGVXNgvzGYANowfjPfAA
         0+YtsuQBiyHN4v8gOhdMOqKUToAh4PEZx/1+I9V6mbNjNd6gdxK5PVbEsNj3jTBpUWFu
         /0CwzyhOR1/ifxWx413BuwLH1GOKFvqEdclEcUYONS/LNxhG/Yxr/JUdkn0CAoVR4cHa
         CDkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791911838; x=1792516638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DaQpwDjYu505Vk63Cf/nZMg9BHMHTPNDB+uyyd06enU=;
        b=ewbazzXdz4B0TIaXwFKjoKnYE1s8B9Uh4GfmPibXxkFhfBH8hMa0v2uPq5or1KeTyq
         LA3f/QgKh5DdOr6d7zlwo6gbpFMg0qz423CIs2RqhFSq4YO+Xog6QeboZM9V4CGX/6X8
         YxvZp/7mlEdIfFssQQPrkjgntLwZHM1QUFmMcbocmkGJGhJrez3ek/pQzOnerihVCZfr
         rl20nMnWSIzM8ZlQoMzpxToLLRaHRRebaQf7Qf5Nya50UNbvx2hS99yLcCpWP2iP3Kxh
         IMo9hqZG7br5TKwVOBKuQKB4BxoXMZJiifZKvtHn855bFQ591ZWk9isK4ierKEFg7PDp
         REyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791911838; x=1792516638;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DaQpwDjYu505Vk63Cf/nZMg9BHMHTPNDB+uyyd06enU=;
        b=Yno7NnSh6ytJTbVFa0TTJz66KeotUBnx95zZRW/mKk9qy0yimKBa+5ZVWryXluzCHE
         ZMHnHlzHQ+Q0gFi3JJdp64MX49Id+OPb4G8iLhwp+z6Cuq75SDbjjrG234HSwxMHjUnr
         2ogXn5thAcFyoXaPh2qUkQt0Kb2hQp1M5jZh3Mq028U+8ymh62SGSb3wMRcUN8OH5H07
         81hqmGn2KC6caiHlHrzieUXCB4idnWGJrAEjkirqpDmR/TayVvTrcVjA97Y9KSoG/ZAv
         4OcUl/7xZRozLM4MzxzgHJMdMLaBsNDSIX69U3Aw8x12Etsf1Dp/wvjHvSLYGzSwkRpm
         XoCA==
X-Forwarded-Encrypted: i=1; AKwUvBzw0qocJ/Zx+KtdEvsDSxHLDFTFKevv60BKc1F4CUx1oIW+evC/yuWoaWRMhGqh8PKcEXpkaQX8WgWi8PY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDjrduu70WeB/wQa1DfeJxGe0OGSZ7H+kCBTzuaFNCUcYS+QNW
	zNlIzdjSAPVIqj6bAl66YyBcdMlkj+Yc26dXTxhsKiWDzTs8Ebs1aKivQE431j2Qux2AwD+VV+X
	r/KKCJK8SQNWp9Gn8Xm9qT/P6TbTfdj5ftLH4bgo=
X-Gm-Gg: AYBFou0gVMwr8Da+c4bEcqeb8qF7rzBp+TdB12vqQIbyd5u+LEXenAgNl8L0C9OMTYu
	A5h5aBXmmQ4wE93c2gmzrfmcbjw7Rilghc6dIxlMkxVVYpfXLigXK9B5YLIWDlMiZ15TUVAv3Q1
	/PzHaDZ5q/5DZilc+LcOB4SBbgo3Rlna2iNkdfAmq4AmXEpYSww/ejyY4A/HXWKelHD6s7waxIv
	fZPaTEt2Zu6Z91Ds9tI6k1Qm2t8LzuSoAf5h1VdKALoqMIlOo13ezT7hXVUr5Q/OOKZE9jNSbCQ
	co20CDv1+ZpCKJRcs8gJLBKjxs1DjGSKc7Oss4/PUOLD1dRZ5+Uz/i4aTF6qIbpynxpR/jOAIpG
	7nOrEuqebpGg+raONDBSug4K0Q1MWHT8Zd966ROhlSRbj46I3hreasDXK9xFkA6I=
X-Received: by 2002:a05:6102:a210:10b0:7cb:9e72:cee2 with SMTP id
 ada2fe7eead31-7cb9e72cf94mr1843126137.10.1791911837552; Tue, 13 Oct 2026
 10:17:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012205919.4012405-1-morbo@google.com> <202610122028.BB0EDC98@keescook>
In-Reply-To: <202610122028.BB0EDC98@keescook>
From: Bill Wendling <morbo@google.com>
Date: Tue, 13 Oct 2026 10:17:01 -0700
X-Gm-Features: AclHuK_zjWeKjy_Jgf_XC5DPdhU9GiaJNj2dnrZl8y2EXKvi_bVuDtbq67siMPQ
Message-ID: <CAGG=3QUx5oTiwoGbASYrQPZdtA0LGEop+bagegsrdPsrc-_Bhw@mail.gmail.com>
Subject: Re: [PATCH] overflow: Match arithmetic in both parts of __builtin_choose_expr
To: Kees Cook <kees@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 8:30=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> On Mon, Oct 12, 2026 at 08:59:19PM +0000, Bill Wendling wrote:
> > The two parts of the '__builtin_choose_expr()' had different arithmetic
> > expressions. This patch correct it so that both parts calculate:
> >
> >   COUNT * sizeof(*MEMBER) + __must_be_array(MEMBER)
> >
> > In practice, the call to '__must_be_array' is meant to assert if
> > 'MEMBER' isn't an array and return '0' otherwise. However, symmetry is
> > less prone to subtle errors (and far more satisfying).
> >
> > Fixes: 230f6fa2c1db ("overflow: Provide constant expression struct_size=
")
>
> A Fixes trailer implies a bug being solved. What problem is there here?
> I only see downsides to this change: this adds even more layers of
> macros and inlinings to gain the size_add() for a constant integer 0.
>
> ?
>
I wasn't sure about the Fixes, sorry about that. Why not put the "+
__must_be_array" stuff outside of the `size_mul` instead, since it's
only there to catch an error? So something like

  (__builtin_choose_expr(<pred>, <true>, <false>) + __must_be_array(...))

It simplifies the macro itself and makes it explicit that the
__must_be_array stuff isn't useful for the actual value.
?

> > -             size_mul(count, sizeof(*(p)->member) + __must_be_array((p=
)->member)))
> > +             size_add(size_mul(count, sizeof(*(p)->member)),         \
> > +                      __must_be_array((p)->member)))
>
> --
> Kees Cook
