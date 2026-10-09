Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0974EA398
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560536; cv=pass; b=sI7Wyj1uJ1vGcrTHsiX06UmggeYTAokOVtoIWloCZ0L8xIQ2JbLHYRVKu6T6Fh6PIVB4TfD7AFhau4FPFUVDAgipMIisaiycICdNHSR4H2H/uVglJ1AXzp64gnjeEyfAVnTarnGeifNx63x6rPJx4NVQMLa3YsIs14c9n/II6aI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560536; c=relaxed/simple;
	bh=ODP9oLFkSTTxNwHzgn/OPjr02NM8N6qGs+/FJBL1okc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G4IFZh7Eg3z7tLb+4eQvgjiN5T8me31DI3yP1k4U82mbATtXMh49RqwoUSC+BGSJIE90jpkC4Le9ZPmqHOwKu1myr7LFoFpgGlqYTx1FbFBcZjKtQYTeCWHP54/Q43MSG8lCB+PJ4j8mgddjvFhE8AFXEOp/4AJX2DSdPHCizws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OpWNGM9H; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OpWNGM9H"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6aae147ef9dso12566a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:42:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791560533; cv=none;
        d=google.com; s=arc-20260327;
        b=JXFqdbPZHyA1TwqnfUUK9TkF2GZ78x3fL0fHxJ4P5wMW8BCnik6b8aEE+Rom0iBWDb
         ySKxsynog9laUkp7VoUO9rdPnsntwvXJdYs8/R3lFEZCd77c9SF2ra0E5ZM51UQ7+nhB
         LdcBrf9ZbILB7cWsEikX7ivibH2m8QMC5cbePEnsCkiB4q3IxfjIylYBLMiC9G6cUqOE
         48T8A3/Y4k7Q+7jGZa7jNocNZIP+EYKfk0tVSMvbyOl6gvUOYJCvVadY8wUNmWmH2F7k
         RtaXlVZEGFQz/TOp+1EYCx9Ho75quKd0BCy+Y1V7G/4MvM7BriQlZur34ttl0FLeKUvH
         ftsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lyiu94Q8CWOzAbPl0E5395hB8F0rcFgV/E8an3zhytw=;
        fh=tmVsEa2YoCLRZsCGuQ7LngJXEyfkEAGwz8/kI2VSKjA=;
        b=aDO/rd/6h01/tWJZY4JjFl9ghtmcNA6HvynpJWhJhneNbBwR9H75O20BIx8vYkSov1
         aueQ98Hxele/kNE3QG7IXEjFZiWrNFwbGwObvpHbv96NyvI78JusHr3NvThbXKcHNlvK
         2kxoUT+9DO6IVbQ1mctU5/+FWTsg9jxGkK8hKqAPN8w3Q0UjuVGqIL2Vee8Z5hA9zDh1
         Hsj2jO+qcUye65CwgTLuMFUPdpWbfW0zu/7lDz5J/wyE6/J48B3UGTV0ZNiLN5u0pvbq
         cJ+rE6q/Q+MV5Mnzy+VcVUcNCTfxjZDldjbQkCHzS+4aPJmn0dOj9xD7QqtYjwiuEUJ4
         Bypg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791560533; x=1792165333; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lyiu94Q8CWOzAbPl0E5395hB8F0rcFgV/E8an3zhytw=;
        b=OpWNGM9HITmmWSeHCLHNZygXvrbRXZTpgSNet7PIJQyLHGQotT7mi/q2rCg2Ci6i5T
         etqnW0c+vAJPRoLb4NLKqpg7EdyGWSgCFCMpinHioKNroNs4qoIsIk9qoDPfNBrqgfBl
         /EwfICwupKgSGzQvQxJxi33xzcyRMzVTh+F9lgSdNXbdK2Y7DzKarxHBW028MxYENpkx
         xJgCbJmyNSmGRu7fUt6KdcNkRV3PvcA/wC8PUUzxcMB08Q/DezG/eyoPquHPxjkivk1G
         d6nfjdcbFmoqKsRTkOi7fhpv4Ut9AeMFQMMd+t18BFwYgm0WSk1v995wvaHySokz72PG
         higQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791560533; x=1792165333;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lyiu94Q8CWOzAbPl0E5395hB8F0rcFgV/E8an3zhytw=;
        b=ek/eoHrsEHanJhguGhJVFYeg8Ja2/MUfhpWl666jka3xLTSs33bpqYurqAoQm4L2SF
         ZclsCA/pMExWpaY6aZ8ttI9auEdUkrQ5MoFcIptgWdXZFa1j4t+jgBNdDabzp814hzFj
         E43OVq/04v3GYXplozNjyd0zYxtOqiys8URELEZfXJbgW/tHqe6AQb1q+KhQwArvwKD2
         u5Pv8TZGJp0R2XDTse7bavPRJ6ae8Xxh2EWWdt7kyDzgzAjvj2o01Ptbl6tX2+dW7owe
         /FmKgz2Eac6tp0vi/t62G/n0DTx28dRhK6utjQk7ZnEmZLdewx/c7kZbYm2fRB8lTie6
         obiQ==
X-Forwarded-Encrypted: i=1; AKwUvByB7ZTG7k4d9mrY7NiY2Aw5GPvGNREEyTiJWX4aWxTFlfCICDfZUm7tcZ5byaw5qMPSbXzmVbuJHeUzPKI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvCAxZ7r3arB5TdY1wIsUh5raQnNohoMLRAej05THblX2w6eDJ
	fF3OD8BLyCIb73+/OzDHClzWOF7uvzMKAnSbb4UOYVfQLenvUf8Dx7+ZWB5OgIOKlNXsN5Dn0l3
	F6LqMWGfK5kc8ovdCQClwIBIvygAnAoFN8qUyq0uOAJlDzp2cj+PZ7XVt
X-Gm-Gg: AYBFou1ENjauagHde4sixsHcjPqXh+1t06jmIxZB65RTHGutCT9jUOv+hWZ9mkHyeY3
	/8AwDjnD8iaVd6sdsJm+EVIeb63bE8d9nTB98za8GUgXrj95+w0u301UPF7Z0YdSbC7XWNRY5Vd
	Tpp/+Dw7nF769xEA2qlF11o3D+ozVsi5Dk5TFWbVtaMmfFVZSby9IbYc99B6HFUvwlhy7H+OvJP
	Em0a7CEzHi/W/q3diVfa734nsTDEl1jkBKFWBIIBTZE/0KMRAAzJrl+F2EzSP2qwUCsVnBIBB8l
	s4TcQYdnkupu4L5wwc+W3ZoEoo1mRXXS/YWBe+ZwZSPiJvH8da8nR180IWFJJXPE
X-Received: by 2002:aa7:d743:0:b0:6a6:7dff:61ab with SMTP id
 4fb4d7f45d1cf-6b17b963117mr40705a12.15.1791560532616; Fri, 09 Oct 2026
 08:42:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-b4-skb-segment-nosg-unreadable-v1-1-7e2334a55fe8@toxicpanda.com>
In-Reply-To: <20261009-b4-skb-segment-nosg-unreadable-v1-1-7e2334a55fe8@toxicpanda.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 9 Oct 2026 08:42:00 -0700
X-Gm-Features: AclHuK_-OS7FzcusCgigYqbLXBGGgd8VVdGqpOopI3dxHJrjPaF9OMOOxoHmqMY
Message-ID: <CAHS8izOAGUcKKBuU8uyANr9-xCacBq43PHfqW5yyR=35PXxi0g@mail.gmail.com>
Subject: Re: [PATCH net] net: skbuff: don't segment unreadable skbs without SG
To: Josef Bacik <josef@toxicpanda.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 6:32=E2=80=AFAM Josef Bacik <josef@toxicpanda.com> w=
rote:
>
> Without NETIF_F_SG, skb_segment() copies each segment's payload out of
> head_skb.  With checksum offload it uses skb_copy_bits(), which fails on
> unreadable frags, so skb_segment() errors out.  Without checksum offload
> it uses skb_copy_and_csum_bits() and keeps the checksum that returns.
>
> Since commit ab9414ed70bd ("net: skbuff: don't leave stale bytes in
> skb_copy_and_csum_bits()") that copy zero-fills whatever it can't read
> and returns 0, which is the correct checksum for zeroes.  A devmem TCP
> skb keeps its whole payload in unreadable frags, so every segment ends
> up with a payload of zeroes, tcp_gso_segment() writes a valid TCP
> checksum over it, and the peer accepts the zeroes as stream data.
> Before that commit the segments carried uninitialized memory with a
> checksum that almost never matched, so they leaked but were dropped.
>
> This is reachable when both SG and TX checksum offload are turned off
> on a device used for devmem TX.  sk_setup_caps() still gives TCP SG and
> HW_CSUM, so the dmabuf send is accepted, validate_xmit_unreadable_skb()
> lets the skb through for a NETMEM_TX_NO_DMA device or a matching
> binding, and software GSO then segments it with neither feature.  With
> only SG off the copy goes through skb_copy_bits() and is already
> refused, and with only checksum offload off the segments keep sharing
> the frags.
>
> Refuse to segment unreadable skbs without SG, which is what the checksum
> branch already does through skb_copy_bits().  Check the frag_list
> members as well, since their payload is copied the same way.
>
> This was found by the Sashiko AI review of that commit.
>
> Fixes: ab9414ed70bd ("net: skbuff: don't leave stale bytes in skb_copy_an=
d_csum_bits()")
> Fixes: 65249feb6b3d ("net: add support for skbs with unreadable frags")
> Link: https://lore.kernel.org/all/179148235783.434549.1432237422747783281=
7@kernel.org/
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> ---
> Follow-up to Sashiko's review of ab9414ed70bd:
> https://lore.kernel.org/all/179148235783.434549.14322374227477832817@kern=
el.org/
>
> Tested with a module that hands skb_segment() a TCPv4 GSO skb whose
> 3000-byte payload sits in an unreadable frag, with SG off.  Without this
> patch it returns three segments with all-zero payloads and a checksum
> of 0; with it, -EINVAL.  The same skb with checksum offload was already
> refused, and a readable skb still segments and copies normally.
>
> Thanks,
> Josef
> ---
>  net/core/skbuff.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index 41beaf625421..4ba544b5f3ba 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -4782,6 +4782,18 @@ struct sk_buff *skb_segment_list(struct sk_buff *s=
kb,
>  }
>  EXPORT_SYMBOL_GPL(skb_segment_list);
>
> +static bool skb_segment_unreadable(const struct sk_buff *head_skb)
> +{
> +       const struct sk_buff *iter;
> +
> +       if (!skb_frags_readable(head_skb))
> +               return true;
> +       skb_walk_frags(head_skb, iter)
> +               if (!skb_frags_readable(iter))
> +                       return true;
> +       return false;
> +}
> +
>  /**
>   *     skb_segment - Perform protocol segmentation on skb.
>   *     @head_skb: buffer to segment
> @@ -4842,6 +4854,14 @@ struct sk_buff *skb_segment(struct sk_buff *head_s=
kb,
>         sg =3D !!(features & NETIF_F_SG);
>         csum =3D !!can_checksum_protocol(features, proto);
>
> +       /* Without SG every segment's payload is copied out of head_skb, =
which
> +        * can't be done for unreadable frags.
> +        */
> +       if (!sg && skb_segment_unreadable(head_skb)) {
> +               err =3D -EINVAL;
> +               goto err;
> +       }
> +

For this one, IMO we cannot have random unreadable checks in the code
because high level functions will eventually do something that
requires readability deep in the call stack. The code deep inside the
call site will change and we (the LLM) will forget to update the
accompanying unreadable check way up the stack.

I would say for this one, if possible make the innermost helper
requiring readability should perform the check, and return an error,
and then update the callers to handle that error generically. You may
end up with a larger, more complicated change but I think it will be a
more sustainable change than this 1-off.

Thanks,
Mina
