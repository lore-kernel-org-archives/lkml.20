Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8260326982C
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790839752; cv=pass; b=lJW35NuZ3lXdmjdaLMA/Ab0uoLkgdA2myPpd/+3qmlzo9ACxytuIN0DzYEPi+TAEqor4/BgjXwF5rQY86tYzH1/X6bNMoqj7swbwSgZbZa4bNgNs6r93IRy+o8LzGt322x9V9nM76TybVpQUc5SdInL3BF3z8ELBLi0pQGJC4WE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790839752; c=relaxed/simple;
	bh=bSnKMPQZl5T2KfmiCD87MTWzFVfmb9E14C3WiZ0dnb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=afzZ3u9mnm8J8Gym0aLCJiYLMUt/+pnBz5yGVr9RGOA/WPzJ6GuRoqPUEy7WtuWut+M2Krl44mk6m4Dqotqjlfi6Qt6pDwnG0sD10zMivWeSAPq8EogauJwl87fyghZ6pBuSx7PuwY0KSoe+nyscdnwLnVweOnGSrIpqh6ZQjgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PzPop5l7; arc=pass smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PzPop5l7"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144f47a9b57so5788211c88.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 00:29:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790839744; cv=none;
        d=google.com; s=arc-20260327;
        b=QAmD03MF6z5dn211Ry3243zvfgzHAoD5JAAnuc/r4NhI7iFtNlHv6wYpXF5E58/tOT
         yNByCSgjI/NBtIC9c3X64uTNb3wknKoNjM0dYexELHDeZB6h+Mu1rnxw/xIjNWIsI7Zd
         vzt5CJhhDPjod0bdU8//uj+3d+1d9dzwOJGtYrhVsfeNs4+djpzIzOrmNsXPPPpVKE7q
         osS0LOSDVHtlPwwmBWWKsfYBN40jCY+hK1gB8w/lReuxP3DY5aEGPEwc/vM1Iyd/Y2OV
         ERDd7xIbDR2onPQEB7UY4zRE9TpA3Nd7jsr4BgkcSmMnZO7bVuCHA3QGEjIIgOWjXK+n
         GGWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MSkLrXkaOizj7D0wzYU4iL71lfarU60xcuW4v3wm00s=;
        fh=uGZfiNjT/ACHse9HVXhvSI5pRQtUoS9fS0/1AEaQs7c=;
        b=ss8OGXsgN2wgUrPcDL3JCHTYgXuduPJ3haPqR98KLwzx7fUP6AauZi/w6/Fp6+RNwk
         QNqVLZSFuJPIUaY8x2R0i8NUlgkJYJDDX5Elke/giL3cGcDz8T9q4JUagvQeHDCWuP0A
         l/3CpTPYUnkNMvgmT1XYE2pTar4WwtAO60XLJREFwxM9PoLqtGbCHWxApouL39VyW1bV
         AT7P0im0LdRqO+/JdAYHquZkqsFbN5eT8IRbachWxhSsfEDTFq5Q8W+ICJhb83S7VXJb
         Yfpimdnjmkl6M2FUoMln6dPdaeSXtRBnXZXtl0c9qjzpK1lQ/gK/wx8buBXBPxdTd29B
         lQMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790839744; x=1791444544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MSkLrXkaOizj7D0wzYU4iL71lfarU60xcuW4v3wm00s=;
        b=PzPop5l7VsTr5Kt9koLdVHNlAltfhwrjfKcEgU66JErbDQRcCSRL4PmddSXjlDjQhX
         z2x6HTkiUOhFyY071SO2dzu8n3xnTK3UiOFbw5L4/gk5SGLsUpJDU4IV4mYBXYHiI8LN
         8EUyrK2hJ2iDAQxr9hGduuCnrQbjJCBQzzWvgGDbwo47P4JMyJYDChaHwgLrw71XQ55B
         IhrFZQCFK6SXSux+cuytsuVARnxKImQxCLJk9BihcSNe40aXHdeIrtlzsDiEK+494H+V
         8mIDfny+7GrDu5E2O76j1W9fCP1ur7o3LTVPsgcZXicMxlu8a7AFdkkWbGhAh5hZvnmF
         8Juw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790839744; x=1791444544;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MSkLrXkaOizj7D0wzYU4iL71lfarU60xcuW4v3wm00s=;
        b=MmaD97rtAY/SANbcC0yF0nQ/GnR7ogl0JjLo2ids/r63Hr49W8XpTR9dwu004S6afl
         j3ZZ+TYHUV0YyLcsDqEZ+rPzgeLr36lY4b9XI1ussuh7xZ6XIoWIGxsE26YyHOYAEmYg
         67dbxUFvbqOiUGuk1Q6hFFJs5zkK+Hpn36pZdZiP4rryCo+0bPL8CVn1rgr4OiyABCG/
         dKjMXQU40JTW7/a+5QpIW25WQ2+jeNo2Jzoiq0EuLko7vqUZNPsNQD4nCB8giV0ZNUog
         q8yBLcHkz8Tzy7wbzts/5WjJR5ain9y+YxOME6BHlOHIZO2xlkhJR5FBsX3RDdUDs8gT
         V0fg==
X-Forwarded-Encrypted: i=1; AKwUvBwCQn6jX+GQY/GuFl6QtJu8o2w+Kpj8oj1JU0hYNduj262oL/sVT3URd9zmITSSZxAQQFUUQ+mSWos+5qo=@vger.kernel.org
X-Gm-Message-State: AFuF++kNEG6Kevco6pBjLXvlvb8Py9yc5KuaEr55O3FmDkF5T0mQ22yi
	aPwz7Y6anbhUmsQxAcAshNA6KFGTMuukzcRDeRTZJjvyt9AjkTYXDTL/lHOSwMccRvfArIWAicK
	YglFHoq9T80mxvCnRRDau+3sQRGzXL4HJnZs7
X-Gm-Gg: AYBFou1ZMeG9LyQwQysOcwHJRKR7ThzmlQ5nGrfIw1PEN+K9RU6U2XMQci9niurdGtl
	Bkv8wcTycQBwhd8tBDxEGziwYxO5m9FN2o9HyaF3inLR2KHMi3GxdplaWBYmHK+y9vcTcPpS+H5
	7+cHL39lgNoJTdgfWSYdRUPu100rMdkJ2GtJN7D1t5j2LHpy1scBI6MRbnKM39GSzty7kS9D6kv
	iA2K83TuJpLHnv+iAetT6nLdRtEbzpNjQjRwgyHqlfWm5Hzi4HjEkkj0KnOQTRYL5hpag59H145
	XCFesbzv9VwphhHhqDx/1a4QQKD9vf4H0CSzPkuDHhzYb3MOy6A0ZwrbEA+CZTBTu3tZxsiVHm0
	Oo3iTGcQ8Sfs=
X-Received: by 2002:a05:7022:ed02:b0:143:2701:9198 with SMTP id
 a92af1059eb24-14d33491b4amr3415031c88.36.1790839744378; Thu, 01 Oct 2026
 00:29:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930140400.2955466-1-4ncienth@gmail.com>
In-Reply-To: <20260930140400.2955466-1-4ncienth@gmail.com>
From: =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>
Date: Thu, 1 Oct 2026 09:28:52 +0200
X-Gm-Features: AclHuK8NL8zF-fuO6CKIa2qv-pSt6H66vE25JFzy2CmX4sYI7l1OWuYhQRHBVmQ
Message-ID: <CAAUqJDtoYAb30bEOhoRNGTR4KLP2fWJpmXqu7o096GHFJZKi-g@mail.gmail.com>
Subject: Re: [PATCH net] cipso: adjust cached option offsets when removing CIPSO
To: Daehyeon Ko <4ncienth@gmail.com>
Cc: Paul Moore <paul@paul-moore.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Sept 2026 at 16:04, Daehyeon Ko <4ncienth@gmail.com> wrote:
>
> cipso_v4_skbuff_delattr() shifts every IPv4 option after CIPSO left by
> cipso_len, but leaves the cached srr, rr, ts and router_alert offsets at
> their old locations.
>
> With a valid eight-byte CIPSO option followed by a seven-byte RR option,
> RR moves from offset 28 to 20 while opt->rr remains 28.  The stale offset
> then points into packet payload, letting the sender control both the
> length and bytes copied by __ip_options_echo().  Setting the length to
> 255 produced this condensed KASAN result:
>
>   BUG: KASAN: stack-out-of-bounds in __ip_options_echo
>   Write of size 255
>   Call Trace:
>    __ip_options_echo
>    run_cipso_stale_offset [net_candidate_probe]
>
> The destination holds 40 bytes of option data.  In an existing
> uninstrumented x86-64 v7.2 build, __icmp_send() places that buffer
> immediately before its stack canary, and the 255-byte copy also crosses
> the saved return address.  A canary mismatch unconditionally panics;
> no canary disclosure or control-flow exploit was demonstrated.
>
> Mirror cipso_v4_delopt() and subtract cipso_len from each cached offset
> that follows CIPSO.  cipso_len is the logical distance moved by the first
> memmove(); hdr_len_delta includes padding, while the later header move an=
d
> network-header reset relocate the bytes and their base together.
>
> The adjusted input leaves rr at 20 with length 7 and completes without a
> sanitizer report.  Natural remote reachability requires a configured
> SELinux/NetLabel gateway and a later option consumer; the retained test
> invokes the real mutation and echo consumer directly because the availabl=
e
> rootfs has no SELinux policy or netlabelctl.
>
> Fixes: 89aa3619d141 ("cipso: make cipso_v4_skbuff_delattr() fully remove =
the CIPSO options")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
> ---
>  net/ipv4/cipso_ipv4.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/net/ipv4/cipso_ipv4.c b/net/ipv4/cipso_ipv4.c
> index a05aa075de1a5..135b57c2c4f9e 100644
> --- a/net/ipv4/cipso_ipv4.c
> +++ b/net/ipv4/cipso_ipv4.c
> @@ -2272,6 +2272,14 @@ int cipso_v4_skbuff_delattr(struct sk_buff *skb)
>         new_hdr_len_actual =3D hdr_len_actual - cipso_len;
>         new_hdr_len =3D (new_hdr_len_actual + 3) & ~3;
>         hdr_len_delta =3D (iph->ihl << 2) - new_hdr_len;
> +       if (opt->srr > opt->cipso)
> +               opt->srr -=3D cipso_len;
> +       if (opt->rr > opt->cipso)
> +               opt->rr -=3D cipso_len;
> +       if (opt->ts > opt->cipso)
> +               opt->ts -=3D cipso_len;
> +       if (opt->router_alert > opt->cipso)
> +               opt->router_alert -=3D cipso_len;

Minor nit: IMHO, it would be better to move the added bits to the
block by the end of the function where the other opt->... metadata is
updated.

One way or the other:
Reviewed-by: Ondrej Mosn=C3=A1=C4=8Dek <omosnacek@gmail.com>

Thank you for the fix!

>
>         /* 1. shift any options after CIPSO to the left */
>         memmove(cipso_ptr, cipso_ptr + cipso_len,
>
> base-commit: 99b43ede9e355ba35244cc9470bf1819774ce39d
> --
> 2.55.0
>
