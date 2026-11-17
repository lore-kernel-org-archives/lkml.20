Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794925910;
	b=J7O4BRBljFSGd7G7p7N1nrRcqXhDsheo2p4Oyj0qx2VgjXKs2Ok5MYFu5YvYMpFRmYN4
	 vK+kWq2xisIhYP3ePsJQIGyRulIOkzkS5i+kHZipKwLmS/YIDBfDocOnwDr+4S4CfdLDp
	 l/MRZzlkZ9I79iERfmsB7fj1uNe5Z0j0dgBS0rIN7D+mE/VYqGZzdhIgZRFfLHu2Qb5PC
	 Mq83n0baps0pNvZXSHNPO1QE0XrgFMclnkCutmxOO2ISn8p1PZoHAL0WAGpse+R9VCePn
	 fNugTP4Otq6NpGP/apygaHqfR7I0l1435EbrD83ZSh3yqFVxdZDb4L4v6fhvx+kT4cg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=J8J/dU+jQllMyvNevSPXlfSxT9AbwROgLjn7O3WN4IA=;
	b=CCOegzosC5mwLTc43HWzG8fTPA6unCTYuXxlSDM5S36HMVOMocPr7ueQ1Tz68besXj37
	 E+B01in6l5s73F0hcSGTCV/x0J97fVmyKGJJQfc8Oy1Mn/RnqsfSurQFH0lSOhExWrlUD
	 Z8FTgIz7r3oZOMCWj3ng+21mI/UNt4/mZ6kCXfdB5dD3TwdpJGtdyH3KcY9lRGlLPkoTB
	 VqGDLaa5lm0js9a74y9io8d7Oh6IrGeLEc/vuOu4YF1crNrQbQXKAxhXvCvcHI44AGcjt
	 Jp19N+Z/VkSnGVd538BvJrQJqjWoXb8AHsf4vBnAo0Em6g2gOGkn1+yNwzjWisSB9UA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wtKGVGn0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EC0606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56EC0606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wtKGVGn0
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so707931066b.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:31:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794925909; cv=none;
        d=google.com; s=arc-20260327;
        b=Fr6DLzs+6AmsJh42D3sbmFdLxnp+zIuhDjiE04SdAnuqz78GdMMP2Fci7IsNLIaTIh
         Z2SsvpmAKG6G6njjn/5hibiQ/ZcpKWQtGZg11UeYj9A6Uh9Z66ae5dw5pCuFQEfEfTGE
         2YLwpcINwOv7CxS4+ECajJZx/azfFDb4rT2g33AIeEhULltcmy0n/MQqCaFi0kkuZATw
         kdclR9ulF5Puu7SJAhJPZDTA03luk+3istV7MbChrt5VtBysRcMlozoFRG18wMoXRTrR
         WoySQMaHHsUA7mLO76/D54es2Cua8F8c4GcK0JkDH388G8PZKhxxiYAoPTX/QlsoNc/v
         Mcfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J8J/dU+jQllMyvNevSPXlfSxT9AbwROgLjn7O3WN4IA=;
        fh=qUF2JzNouQjsDyHNUea1OWvACV9mColqXmtSXQhzli0=;
        b=Yj3LnivLhhseAK1ZrsYlYVuRtNaGg2gVuI6UT53vcCKA7EzvBDRFrmsIDnLTzwKFFa
         h0Px1dVYqck/8qzKk+2xOIktSidAmUfVj77z5O18v/NI3bzc4v0RufNZu/2UxOzB/Jl7
         QFQ1dOqw5CUz2du37VnSQNZZHuf7teRwGBqHAa/IjqsvIOwv11WyE7kuqsQCqNJU8r/H
         hfiW0ejsl1JrStUaTAWc1r5pv4RhEgudYBg8GI2deKmOWazBqPBuinVhGNwV6+v8iFlV
         DxRj0GTAr46nRn1B8NkUD32Vu0sVdhlWMKHytW9UAnKdoQA08ePg/wcqFmg7h4YTg0gs
         xQyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794925909; x=1795530709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J8J/dU+jQllMyvNevSPXlfSxT9AbwROgLjn7O3WN4IA=;
        b=wtKGVGn0xuIg9f8ztH4vispZRzPrxenA19/h1TAjvBuP+4Fvd0WIB2CcOZkuGudL4d
         xJnId+eqSALHeE3/PkEg8uVqqyd/tDX+Rr6RjCJFiJQ0ZihepHK14fGjEyRnp1Bvnf/O
         UwdgI8ifrlGm6EIA4NcgTSX7GZg5H/tSmlInPjG8WAPqy5PdauGM2qUrjTnr2LnFLCzj
         a94as4JAHrR1uf+TAp3KypwkaLHmK/oeHEncKbjRxf6usPeFL3l9vdD63fSOIJTVzEt1
         xb9IPXG7EwjHpE/cfjzmkoTUVNFaEgi+eSC6PJer7I22OucBiZvkaMoO/FWaAbtcpSqT
         UHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925909; x=1795530709;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J8J/dU+jQllMyvNevSPXlfSxT9AbwROgLjn7O3WN4IA=;
        b=VoSpt0xksJZQoJc5j6e4RH8QljERJqxrLmU2PdOnVG7AkE6J8I863hswZlzVU2BPvJ
         K4LrDqkeTR2rqnOliW0wr/ngopAArPW+iGjglRQgjA29qFlOrxeoyWCaa888LqiGL3qV
         9Usg2IdXKRl3pItnGecw9mPw4RPnNfOAT0ipLn0QR54zDHRlIkOBC5rbvwxX3g5Wh9WI
         G9HYyHxchhcvKuNK6VSqpai8+Y9F5KhlEyWO6lv8F8Zmfyu+jG9BqVON6oir5N213P+i
         M4hTZ5EbiFob7uwM7ZeVdaZPk9ErDOBxlrvWPIMWSq8OCQBB+ms8+kzeacH/aICz1kQU
         kW/w==
X-Forwarded-Encrypted: i=1; AL+hErHU9A0nmKa53qcDj0db4Jn3ZrSApUY2Dq38JmiA+T4f6XnPjqLReAKHz40LVKQxvhsSVwvFBcdeby8AgNM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HEtAJmdG8z0OfDAlk2dIsaWUgFXCe3XFq4ZRQktAQzV56h1bn
	gjj6+DS5DAeSJMvtTjT3AxzvkWYapixR97Rc1hkArI7ClGuu3uchub5QjkaKokVjOpWwMiQOJJ0
	LrwE0O3s1ps5v/iuHquqFWsGdJnBiMBs=
X-Gm-Gg: AYBFou3JXvWT4/yk6I6gJ8mUrS2pcTNyoF0DNj1Ng/vQCn7HN821Phn/FkMeXAhLVkn
	8As2+teIrb+7k/3GOltoKRglm0or9Bh/ViITKsproVKpOoWtQHB6Snnj7WQSrfN5hZ0gEPuFCqF
	bmSccVA6xfbTd2SrrGQciPOlPoUo4S2ecnWN7TpULCbyBReEOjD7WBcVT46BI9/pQnDMttI1lDv
	Ypo+RnyuVJJzDd0I9LbUzlLQbFKXDttaQvg10f6HnAKqUubXpOy3l1ESBPf8//0NA11ti9CYJ2x
	4pSFvJrs4ZdFpfNEgksGauBPjsQChMH/7eTMWD9rwI2SHi21NlVzwTuRNTWh/vbj99nL/0bDqeN
	NacGp/rbMZX5nWCYPw0qB8kUlX+7wrM7LzX0lAIedWWw1gVdTeen2+MVT5d77+gXyPZGPvs17gu
	8l1hHMkvyOv80SwC4=
X-Received: by 2002:a05:6402:1f49:b0:6b1:cd52:5798 with SMTP id
 4fb4d7f45d1cf-6b7c0d2476dmr11277202a12.42.1794925908479; Tue, 17 Nov 2026
 06:31:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117135146.3174252-1-graypanda.inzag@gmail.com> <20261117135146.3174252-3-graypanda.inzag@gmail.com>
In-Reply-To: <20261117135146.3174252-3-graypanda.inzag@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 17 Nov 2026 15:31:36 +0100
X-Gm-Features: AclHuK-1tfZhKwrVCdjfTj54iWvStsZEppahje6OeA9duQdnuQ1FrAmDZgLv9Zg
Message-ID: <CAOQ4uxiTpRO9ZOFpKRHjGakB03X=8HWEhpMxj_xcMp5yc4tMUw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] inotify: copy full qstr length for event names
To: Junyoung Jang <graypanda.inzag@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Jan Kara <jack@suse.cz>, Matt Bobrowski <matt@bobrowski.net>, 
	Gwanhyun Lee <gwanhyunlee@gmail.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 2:52=E2=80=AFPM Junyoung Jang <graypanda.inzag@gmai=
l.com> wrote:
>
> inotify_handle_inode_event() allocates the variable-length event via
> kmalloc(), reserving name->len + 1 bytes for event->name, and stores
> name->len in event->name_len. strscpy() stops at an embedded NUL in
> name->name, leaving the trailing name bytes uninitialized.
> copy_event_to_user() copies event->name_len bytes from that buffer to
> userspace, leaking uninitialized kernel slab memory. The terminator
> and alignment padding are zeroed separately in userspace.
>
> Use memcpy() to copy the full qstr length and write the terminator
> separately, as __d_alloc() and d_path() handle length-bearing names.
>
> Fixes: ce163918cd33 ("inotify_handle_event(): don't bother with strlen()"=
)
> Cc: stable@vger.kernel.org
> Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>
> ---
> Changes in v2:
> - Use memcpy() as suggested by Amir Goldstein and terminate at name->len.
> - Copy only the valid qstr bytes to avoid a one-byte read past name->name=
.
>
>  fs/notify/inotify/inotify_fsnotify.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/fs/notify/inotify/inotify_fsnotify.c b/fs/notify/inotify/ino=
tify_fsnotify.c
> index 6e3af6452dcc..ecbfc9b4e99c 100644
> --- a/fs/notify/inotify/inotify_fsnotify.c
> +++ b/fs/notify/inotify/inotify_fsnotify.c
> @@ -120,8 +120,10 @@ int inotify_handle_inode_event(struct fsnotify_mark =
*inode_mark, u32 mask,
>         event->wd =3D wd;
>         event->sync_cookie =3D cookie;
>         event->name_len =3D len;
> -       if (len)
> -               strscpy(event->name, name->name, event->name_len + 1);
> +       if (len) {
> +               memcpy(event->name, name->name, len);
> +               event->name[len] =3D '\0';
> +       }
>
>         ret =3D fsnotify_add_event(group, fsn_event, inotify_merge);
>         if (ret) {
