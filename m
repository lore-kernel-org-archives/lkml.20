Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794369267;
	b=S+uN7513ImtCjosroApEFJEGtz11iKl2/ycOjjzUNAL0W51NSNjc22KWtcgz7MLDhjBA
	 SjvtpmQbeBsAIg20smYQT6lQj/w8NBn2g0MxKmW0pYhnOctmwmOv2/2/SAezfXOTzcizI
	 dijKu4ap1kkszXEeUNee0RAleq/ChBDzQKlRkwO22Rns1c+vqOLSWje9nXXZ2EgtRxSwK
	 tWvSp8nu9imy/PPvRMiVTT2tM2lljavnXfXwgUq55BxV/oY6RdyOYTlaU/SkNGHF3zBIP
	 r6MbpSu+8seJTdU1HBP/buiz0gKlCeah473lgt9nGrUYJ3jZrmKWPoH1q7GnlXyN4eQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794369267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Q40CG4k2plWZZZHeVxKy1553B7ISjHFgclJYmcBytJs=;
	b=tAct5iLFS/3kA/4t3dwIZE6/UowbXFAkZQMYV/R2ofMyblhYkmL/BTN481bMJ2zYWj59
	 yybIgeqFpYj3OqUJlWB+hQnhQOPLBheECqOoqR72qb/pbQBHpdXh9jEEMzJPG+/RJrKtU
	 7YhbJ7YypY+D+iehe+QsN7kLMfpyW8nYJSKi+9cf/bfnivhX0zUZG+6lU42KDh1cP/Qoh
	 PbNLZyYBJIOFUQGB8XlyzIVUP5vgAzeoayqzJoTNnGOA45AF7gc58AjGaKvMQ32MuxYyY
	 jN36oFrAefwRBnw+iJm2Wsh1usoF0ogS8s4CeTo9ai/Ee4yr4fMJ+M/FrF1xksG3dpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QbLaQ78J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D734606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:54:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D734606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QbLaQ78J
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-150ef97e790so1171c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:54:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794369266; cv=none;
        d=google.com; s=arc-20260327;
        b=a9H3XyiQJgEq8SKMThEkyHdVQrPG9Lr6TCVCnOvqMvIf8loIr6xE4CTe0jgbW5RRma
         F3e9B5qLEDNU/awqLAiYhtHf6M2BEcbrCbdwEejYA6zvumsiWaHRgRZlUttCZXClSUpK
         /pE2/C85CZ853/qqb0QEhiOFNjWSS2UXQuA2JT4czC6ckqxiEWs1z75C1Dg7R3aPPYDy
         /KLUuh4WDEQOWZezTGebDyNXV72h9aZimLa1KM7JSzSBBLmkcCfHfXtFxUiMTFbGMJTe
         /BXT8p5Apy2i7wnH4P6MoW9HQuVMuku2Et6S3yCXBhgF9mWwqzVGfVJv8uva6cYX0xcR
         Ld/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q40CG4k2plWZZZHeVxKy1553B7ISjHFgclJYmcBytJs=;
        fh=NLebwANmMdIKRFBxs2oKJ9NW175nD0KmhDp4kl/i4L0=;
        b=W2ww6b1cVSp5WIJhtLwc0p6ONRo4r/qcgzmrWdH2/Uzo5VmyHij5OYbCbQl2mfOsXy
         p9n/9t2dkIiT7INDSLoNMVmztm2A5tYCyoL18DymaD2OlmW852qnZkFdjzok9ZiNHe5Q
         fo6oMN/DtHU0eA6GpJ3ljrPqt4RJ9Xgmhfo9u7VfZMdvHBAV3dIgOqMzhOJAIvuGqZm/
         ny3NghsCFk9jyaIneYj2k87EJ1/m/tFuEHB1rWdQiIKfSY7PaVnreO9OGGhmN3vmSDJ0
         1yic5KQfWGn5Fq9e31n2Lvphp1b64ShpNz+of3IbpxSDLqkERfzDmVt9CLFHtLI86P9Z
         Or2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794369266; x=1794974066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q40CG4k2plWZZZHeVxKy1553B7ISjHFgclJYmcBytJs=;
        b=QbLaQ78J3j5IRaccLWErIYIP7lFdwJcEdAsaCKFo8ufMt0QKCdlz+FDOjBBiLoxpJI
         X9RjD2rUgotcKWWUSNrvElCmti/cazFK9MEPaOcWnxbNA+q2c0a6dqHd/KGAzMvJOxFN
         qO/P91o+WQBIVS/DKLdYHL1GbtRlCQAevdy003/9rH5ihAJbw8CcY4PuCHTJN5wQpc8y
         bfqFWAsLBZkmF7XV/hBzNO4xcbHr5e4kiSpeAhCkmzLtMGlEhGOTtNnseubVKSUGLZ60
         Eg2n9AxPO7Drz5B9+6+OOXY/Klx0DnCb4K9PW+XXLQq46K+26+yAm8hJWTbi39v0Aw9h
         uAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794369266; x=1794974066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q40CG4k2plWZZZHeVxKy1553B7ISjHFgclJYmcBytJs=;
        b=YOow/rQBzjSWyWSbaMQfubBxemUd0155wOjdbJ2SxtZOLl0PxoY+J7QcAUhNCZsD8o
         dkDntwrc0H7nmwtkGjbw1Lvg9HIqtDBQ++zKBJUuAE3BhiQGMDzyRQveOKagZcD6ogdu
         bb9qb/PZMXy/uiVKJC5vmQoiOqZEejiQI/PVHH51gNGYx/qvyZvDttjTnI9DCMNdUdSA
         NSB8syv4Ct6qxOaYARnEPCRij+Sw3+95D8/X0ZCAT0Q/fCtDFQsr2qsmaR6us5wfYpQR
         0xJTOqkG811AoVHnrvhJu+AY9GTvSG35k8xC7zR3ndDkooo8/eTcFjvHozLKCTPHmJzJ
         muuQ==
X-Forwarded-Encrypted: i=1; AL+hErFEzuaVkzu0F28OgiTR3jxzFh0P/5+F5TaBRpKzO83DCFubplfSnawKZv6keR/SpU9/lZ1OyhJvPApUmO0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wKApOgth2PH6dXknig1ecxNr6f5+kHUNP6RKAdzR35T/cPLoB
	qEwxKEfRRCFwAjNeplT4ZagNBkR4zpzPTkPMEVvdyVHFnjfORk7ERG0i+PLigHXr7MuBZ4LXFWp
	wdIkFOXH7uOKsGFhxfXRJffHpA76OExRFb6cAg4s/
X-Gm-Gg: AYBFou13DsX4KP4h7jOzXDvD37uNiMD5ov7Wlfw3+3CYWMVuBaN2SbN3BOQI2ScT23x
	mMD+gMaD/2WU2GAt1/PDXYirhmhB4ggjcPr/yiNmfetwKbxQ/Q8oEOfJyALNvBeoeUkkKuQdGyx
	gD6kEJN5w5StoHYF2g+eOUWB756MrTJENpvR2+6CJ81yoJfnlP65KdjhAMJIFseICBGeofuF4dR
	Ek0m0B+QGFGwIIovDJmUih9Dirnfd2ZqyhyVALhRLGA9LcE5vQKqEL8NoppGjrGCoEvgbVq+6Lb
	LV8VMLcKljEOXrWC+hlzPLsHcMgDg42Ki3Uc5j4NVeMT10D5nq/Lvj0pimGAOZHcULLYokBIG49
	vI7XOEkiCi+9QRZjqaFX3Ag19dHhwNPipr/fS3tokU8Zpd13cl46ZsaTN
X-Received: by 2002:a05:7022:287:10b0:184:da92:298d with SMTP id
 a92af1059eb24-1b3c02ec4eamr144581c88.14.1794369265615; Tue, 10 Nov 2026
 19:54:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108013838.1454450-1-almasrymina@google.com>
 <20261108013838.1454450-3-almasrymina@google.com> <avIRJ3vdIj6Jr9zJ@devvm16445.scu0.facebook.com>
In-Reply-To: <avIRJ3vdIj6Jr9zJ@devvm16445.scu0.facebook.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 10 Nov 2026 19:54:09 -0800
X-Gm-Features: AclHuK-JtIAVd6VP5d7vzEq2SapeoytwLPH4YiLGKJljtfdYyoUDCkIMXYehBVU
Message-ID: <CAHS8izOxvUxCND3R18_HfZhB=2RS4_RNfAmx7S=Ex6b5z_CQuA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 2/2] net: prevent mixing frags from different
 memory providers or bindings
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Willem de Bruijn <willemb@google.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, linux-kernel@vger.kernel.org, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 10:33=E2=80=AFAM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
> > --- a/net/ipv4/tcp_output.c
> > +++ b/net/ipv4/tcp_output.c
> > @@ -2692,8 +2692,9 @@ static int tcp_clone_payload(struct sock *sk, str=
uct sk_buff *to,
> >                                    probe_size - len);
> >                       len +=3D todo;
> >                       skb_shinfo(to)->flags |=3D skb_shinfo(skb)->flags=
 & SKBFL_SHARED_FRAG;
> > +                     to->unreadable |=3D skb->unreadable;
> >                       if (lastfrag &&
> > -                         skb_frag_page(fragfrom) =3D=3D skb_frag_page(=
lastfrag) &&
> > +                         skb_frag_netmem(fragfrom) =3D=3D skb_frag_net=
mem(lastfrag) &&
> >                           skb_frag_off(fragfrom) =3D=3D skb_frag_off(la=
stfrag) +
> >                                                     skb_frag_size(lastf=
rag)) {
> >                               skb_frag_size_add(lastfrag, todo);
>
> From [0]:
>
> Maybe easier to not merge niovs here? Add '&& !skb_frag_is_net_iov' to
> that 'if (lastfrag' check? (or your new skb_has_net_iovs)
>
> Looks like it is tcp_mtu_probe path, not sure we care about merging there=
?

I'm guessing this is not an issue with pages because they're
PAGE_SIZE? But, seems maybe a bit lazy to just hammer all possible
net-iov coalescing? Is there a slightly cleaner and more generic check
( && skb_frag_size < PAGE_SIZE or something) so that we don't add
net-iov tech debt? Technically this will be an issue for hugepages in
the tx path or large folios or something.

Also I think it belongs in your patch series maybe. That's the one
adding the large niovs :P

--=20
Thanks,
Mina
