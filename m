Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7304D3451CE
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 01:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789867686; cv=pass; b=akh4jJe/NlacOhEInrCYnGHuZNaU4tCLKMlkxdUahLW4ow7QQ+f2UXRYhqmev4tf6Ead1nudd3l/74l54QpsereBb6+LW4yXmGK7nb6ZOv/goXst8ZpD2YYhi51jFLi4E+TnpVbev6cfwx/0zukfy2AYLSJq3iQkd8gSBBXVBRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789867686; c=relaxed/simple;
	bh=58SYG8u0pc/53nUlC52jnU/rC2SgxqQAeHb7MZSbjZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YAd9fbugdgKsr1MM4Fr27F2SvnZHSrCTO33kaiq+5pX2hgCuamtaPQlEjjWh4kIa8hv8qqjAWvmfeyJX4IRwQ4JoaD33n1foA0DrD8n2LFWX+WWmDJITba5akErw/GFiSw0ehLvAbig4Uv1gxlvbR8JJDFlnzMyPcDPLvQFwYU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Oye3jcMX; arc=pass smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Oye3jcMX"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so2224515a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 18:28:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789867685; cv=none;
        d=google.com; s=arc-20260327;
        b=rMK56RZYO9hEGEGLvLpWVp5B3Fl1YaDhdXO5mrdiWqF3g0TIl5Kr8PiEGynoFqZhI/
         xgrOWYZDRsHS+mG03xeIeUKglXxeFLtNfz65xHltGItQrx6jMlIUS4Kdhm+QHYSl9Q/z
         hMlZaAT0ohT8xpqhHu+kDMuxgti6YGwajxRLVQj8T/TyY8k/wQgVTWkLWb3LKuThJNAS
         xriPmxcYwtdF6Ck8W76oXN/p9ORnGxAEpdeQGr7/L/kcjrjt5+evLwruUiVbc6GdMTgC
         1eAZ02aqIrWlQza7kGvRr5RJ1JwgGgJfaJSzrK0QC3JUNCsDQPcRARibzvtbfNN4hv12
         VpoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=REeNKeU2w+4sUIJzVcJdRnI84oWXH0Weq6lkeZd2jWQ=;
        fh=xXrexFdcGuFbV/XlcFaEe2ghB9rVLZHA9fYSKNYhsrM=;
        b=EdCwzTw2OiQyUI9OhefZq3d4ix8n1gX+jxbp2+uhx8ClZ9nz/5OlE1B8+52Vb1o2xl
         CIoEhpiwwxu9Lcu2CT+EZZdg9lc9Fq+eB/F+9YjQiNCqvi4hqxfJ0uOCzExhmYCOkVqN
         UkyeDR37Ydcqealsz5igwBuLh09oW+kQEb07qfaTfkyO3ybYlnnBG2D7rU/2XhbbNxuG
         kbtSFX1cNVNoXcnmHQCqPoT3koDUCgdqy120S8qMIDCz88z2hsRoj7r1SrfYVaDOElBD
         hu1BxFpTCuDnqc6FdRXT87Q2yGTVHudEJNAgtdd211vjgzUrSF+XA+EEtoaozvVuO2Tg
         Tkaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1789867685; x=1790472485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=REeNKeU2w+4sUIJzVcJdRnI84oWXH0Weq6lkeZd2jWQ=;
        b=Oye3jcMXOo+JxGG8lg0tyo01cPzFsTzFwSPst9BvLEqGSGa10jiZlNKw79qgxxXa2k
         FI9TdJpfbNUX38lw6WTLltiufg7psbg6ZhkN9+GE+846FFKTSoEId/ybZ2apmxSgMMPy
         LE0W8gEqHSzp0XDoi1x8HsmzbmaaCelra3DFxYhN3neBAb+PEMRuYjgD8zCe057sWJ1B
         Y4GAduW19STxRo5cwliyVd/iDZJejl7gDPX4fsWHXqAF6ldjFQaRevoZCJVuHUz1+k31
         EDUaRNJrocKF7nWOUz6G6BjlQpgPUhvK3h5mSgDAnFPhNCY0opQYbm3BwV19mw19547R
         rO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789867685; x=1790472485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=REeNKeU2w+4sUIJzVcJdRnI84oWXH0Weq6lkeZd2jWQ=;
        b=EAqX7sD4Czz2uscuSvdrb6tXAyJ0tjaFilZNAi5voy/K5hvo5bW9Za/jTwems6MbM9
         1TOskCV/Ays4THx8ccGrjjYOZ+NOwIma7mK6tlu4Np7EA3BrJYQZIGfr9yo3p4mdOUgs
         CY3LVYPFNAN1enI47PkPRYQpXnfko6Q2ep7OjCBo2ThZfHygFNJsAQvKMGEXTJnEiXT6
         ErxAxEFA841rHx247Hko5qnAqfWuulvUonvgPwFNk429y9ntapYnFiT8Oe0fDps3pEXx
         OPjs4PjaCbt1rof0nEhe+jUWrd0WnXWz+gAUbcBZoAXZPuEMqt5MAN+pU9mIkUSQTWDM
         05tQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4WrOwK2jGgfOsnHwsdAJJNKbbx9uTS9iz//oEBfTFETve4yY3amOI/PnIJ8i06ABic3rXaGHEFGwZ3Xo=@vger.kernel.org
X-Gm-Message-State: AFuF++m1e90gn1maULa2DzV7FDw6e5rzPZkk5If/x0/7jkKgmIwz6PT9
	SOqJWkjfZy0m0p74Xnmyq6OJ0FkwrKBFwrLIHhqOkwPDgsv8M+ohs20XdREt8H/EDaDq8GgH+dd
	ChTty2b4gnXaR0dMX4vgWpGkgwZKxxj/WyhbG9t7M
X-Gm-Gg: AYBFou18/qySqsz18fnbu2XB68wtQgjN0tNw4PfbewsxhdhXpCD6x/4h2YL6U+ukLmL
	8h7Vck3e57ILFZIiQpv5GdAh9s8ccGulT3Jeld9hKHpwh0sPMnS8wQrR+jrjWVMDjoV8FrFPLNZ
	mehJPrOF7XvivKRLlxflc6leSmHXySV2brLcQiPjXS1D0hFuXziO+jWLj+YCLfoap5YLWSBXFcr
	dvtZtHU8krZcB1H+ItV6SOuTs6Qs2PBG0uGdVIqtnWRNx7nHHL7ZmL7WPgAjBJ1dQAxsxAjD82H
	53ktK8+jywy5fyEOEoINECw2y0LypYBij/DMuITP2G6aPrBhDRc+ERFMmC84Zs6p4Mca2I8mpWO
	s2ta51l2TeGI=
X-Received: by 2002:a05:6a21:6b18:b0:3da:e57d:4a79 with SMTP id
 adf61e73a8af0-3dd7263a307mr14783301637.13.1789867684717; Sat, 19 Sep 2026
 18:28:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919210621.3029744-1-benquike@gmail.com>
In-Reply-To: <20260919210621.3029744-1-benquike@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 19 Sep 2026 21:27:51 -0400
X-Gm-Features: AcwNN1VaFHIGGaQ5NtAlsPyN6fZLotOP8OtOjiPI2lLmpI72SuzrZttUCiuI84A
Message-ID: <CAHC9VhT426aweDqPhBWz+16b9zWGj5GsEdn3Jv9dJUnaz5wdyw@mail.gmail.com>
Subject: Re: [PATCH] ipv6: calipso: fix 8-bit hdrlen overflow and missing
 pskb_may_pull() in hop-by-hop options
To: Hui Peng <benquike@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2026 at 5:06=E2=80=AFPM Hui Peng <benquike@gmail.com> wrote=
:
>
> Two bugs exist in the CALIPSO hop-by-hop option handling in
> net/ipv6/calipso.c:
>
> 1. When inserting a CALIPSO option into an existing Hop-by-Hop extension
>    header in calipso_opt_insert() or calipso_skbuff_setattr(), the
>    resulting header length `buf_len` (or `ipv6_optlen(hop) + len_delta`)
>    can exceed the maximum size representable by the 8-bit `hdrlen` field
>    (256 * 8 =3D 2048 bytes). When `buf_len > 2048`, `new->hdrlen =3D buf_=
len
>    / 8 - 1` (or `hop->hdrlen =3D ...`) truncates modulo 256, causing
>    `ipv6_optlen()` to under-report the allocated header size and
>    mismatch `opt->opt_nflen` or `skb->len`.
> 2. In calipso_skbuff_setattr(), when `ip6_hdr->nexthdr =3D=3D NEXTHDR_HOP=
`,
>    `hop` is dereferenced at `(struct ipv6_opt_hdr *)(ip6_hdr + 1)` and
>    scanned by `calipso_opt_find(hop, &start, &end)` without ensuring
>    that the Hop-by-Hop header resides in the linear data area of `skb`
>    via `pskb_may_pull()`, risking an out-of-bounds read past `skb->tail`
>    on non-linear skbs.
>
> Reject Hop-by-Hop headers that would exceed `8 * 256` bytes with
> `-ENOSPC`, and ensure `pskb_may_pull()` linearizes `hop` before
> inspecting it in calipso_skbuff_setattr().
>
> Fixes: ceba1832b1b2 ("calipso: Set the calipso socket label to match the =
secattr.")
> Fixes: 2917f57b6bc1 ("calipso: Allow the lsm to label the skbuff directly=
.")
> Assisted-by: LLM
> Signed-off-by: Hui Peng <benquike@gmail.com>
>
> ---
>  net/ipv6/calipso.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Similar to my comment on your other patch, since you are fixing two
potential issues in this patch, please break this up into two patches
and resubmit.

Thank you.

> diff --git a/net/ipv6/calipso.c b/net/ipv6/calipso.c
> index c6a34334e657..b8b7451a16ed 100644
> --- a/net/ipv6/calipso.c
> +++ b/net/ipv6/calipso.c
> @@ -944,6 +944,10 @@ calipso_opt_insert(struct ipv6_opt_hdr *hop,
>                 memcpy((char *)new + buf_len, (char *)hop + end, hop_len =
- end);
>                 buf_len +=3D hop_len - end;
>         }
> +       if (buf_len > 8 * 256) {
> +               kfree(new);
> +               return ERR_PTR(-ENOSPC);
> +       }
>         new->nexthdr =3D 0;
>         new->hdrlen =3D buf_len / 8 - 1;
>
> @@ -1323,6 +1327,13 @@ static int calipso_skbuff_setattr(struct sk_buff *=
skb,
>
>         ip6_hdr =3D ipv6_hdr(skb);
>         if (ip6_hdr->nexthdr =3D=3D NEXTHDR_HOP) {
> +               if (!pskb_may_pull(skb, sizeof(*ip6_hdr) + sizeof(*hop)))
> +                       return -EINVAL;
> +               ip6_hdr =3D ipv6_hdr(skb);
> +               hop =3D (struct ipv6_opt_hdr *)(ip6_hdr + 1);
> +               if (!pskb_may_pull(skb, sizeof(*ip6_hdr) + ipv6_optlen(ho=
p)))
> +                       return -EINVAL;
> +               ip6_hdr =3D ipv6_hdr(skb);
>                 hop =3D (struct ipv6_opt_hdr *)(ip6_hdr + 1);
>                 ret_val =3D calipso_opt_find(hop, &start, &end);
>                 if (ret_val && ret_val !=3D -ENOENT)
> @@ -1341,6 +1352,8 @@ static int calipso_skbuff_setattr(struct sk_buff *s=
kb,
>         /* At this point new_end aligns to 4n, so (new_end & 4) pads to 8=
n */
>         pad =3D ((new_end & 4) + (end & 7)) & 7;
>         len_delta =3D new_end - (int)end + pad;
> +       if (start && (int)ipv6_optlen(hop) + len_delta > 8 * 256)
> +               return -ENOSPC;
>         ret_val =3D skb_cow(skb,
>                           skb_headroom(skb) + (len_delta > 0 ? len_delta =
: 0));
>         if (ret_val < 0)
> --
> 2.55.0.1082.g2b9226bbc0-goog
>


--=20
paul-moore.com
