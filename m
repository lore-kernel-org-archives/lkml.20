Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792682814;
	b=PsCO7mqSHEaz/HQqe/KQZuEbgpITxm4VmU7D4zznDE/ZyoUq8U6tTFAXvrZthsyf8QG4
	 tB3W+mgRJ7H10fCdGN2rfqu479VE54rVrLnrSJyAeGj8BYJNHp/upmdqXaRpd63noN/cc
	 nePg+ZLZYLCitxV/N44uYziYWMfm3n2loIvj6HlcE0fnIAu04i/810BWUNS5v6DFf/2JB
	 qRm8wHcJyh6+Z5ydaa6EElvavcTN77S1fMqKn3JoU/+x84NDaB2fpvpMDdYSNaRXWdbF+
	 myV/s48wa5eVfNQpgxkrLX1FWKGNLDw9tZHMdbyl9r0DHmSGAcQyz7xegtGUXWFPerg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792682814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kKY9lXCqmIHp0E1eSfDqDHg5eGZHzHb0/xVe+f4AVFI=;
	b=kLmIRZPXlycKi+OoDOjcf088kUfJD0A67KkR1TSmT0j3OJHwBe/0H31lo2iFvuCYFOjE
	 JZxLC1JsD/93n/8pHl38n7tZJvg1JwVuvvEJZf+FBNDx65Bs3Xu33rCrlWtT8Ul55Pcwd
	 VFvNnxCz16sGr48VoCMJ9z6NNbBTeNjeL/8QX8VzlFVvQVEjg2loZeqcoHTD23syFCwXx
	 XwQmsPTnJfufP9RQwDhhCgzpJL+XByNrwblcT7Jplmg1fAEP1+YWGHcMIMTT+i/10tWo3
	 B9VaIU2H6XPZkfY3GH1bs6wTDHZ8yJPUBey8cuUl7BshlwqKB3GRCy3rFtRJg0yq4bA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="SRWjhO/6";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D7E606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0D7E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=SRWjhO/6
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5337c7b9937so380381cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:26:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792682813; cv=none;
        d=google.com; s=arc-20260327;
        b=odtEa78JUtOzp3UU+nEV7f5+i35VGN1a/gm2qcvc2svpSJ3b8ibHywho3h+wU/j0E0
         EycPreQ0RwBPBtH/2BqIZdBycBjKJcRHbgI8z2ZM5uWUBZKQAbF9SD4QYAdweqv1v5y8
         KdHKjssVNMPCz63h4PgXKVJsvIpQihJr5sGYpVb53lhSHdG2ze+vjY/wZnyfGzx4udlN
         k/H4jefm7F3s+qvqoFhZMBlzZGGYMXag5RKuPOR92tP2jx9Ku6ZGYclgrDWod0UvUTMI
         boQDDH7eSBQYqVSHapSpbJAlvVofxie4uru3qirYoi8svT5RcoCCfzBl4Ycolu2FXz7a
         7Aww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kKY9lXCqmIHp0E1eSfDqDHg5eGZHzHb0/xVe+f4AVFI=;
        fh=TaDFqkT8Urtvzg9HipZOVRPvbBV0QeMEIQytMit0C30=;
        b=UyN9eKXHKMCW08DJwHgkAtDhEsY0jHqneClI4GZ9Xp8NIzbyw0uLeXWOqneTt8HDAe
         BCSMKESMdPcNAlYp18wK/IfoVnXROgeiiWqZbWqLeb/FfPQqar25LRMlqxuCWex4KUrZ
         XoFbQLcpzUbgno+aaF+X5wleOsXytCQ6pMm0SMWvILJqNirf86XSvvDSSL8WIXH4tenu
         fDgnPnP46Xlt/BXxU4cF6Gv07f+LLdwYyr9S4p2NlSSxRDjLpWWKOBeMM8g0+VmSPpVn
         VJT78d3QyCz98h8wB4/2LAN8lpDwUWcQRxEOJf85BnTiba42mgHRQEtMfD7kiW86GbFz
         LFfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792682813; x=1793287613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kKY9lXCqmIHp0E1eSfDqDHg5eGZHzHb0/xVe+f4AVFI=;
        b=SRWjhO/67mlCwYkFf09O9G2vA27TgXTmnwgcLgRSqbJH1Lg6dJUaG8+Rzn0W0pG2z6
         2W8Qo1E5FjW7K5WD8e1/a6KDnxsyGKWAVrEDDV5nlnlgmY7kGrQEMjqa8A73hbSUD85L
         2kvgJzr64r3pLFa64VOG0yUUZSfG4VOixinpLhQISu2sjyi/vbIH5MzEkYjQBbchxUkS
         PC+G+GejWba2OH5sNeMaYy2F9akpC5BT4k0oUla2IfFSX97ycZMrSP0CkHeZQ5x/UGNH
         rf1ukyhOowrLj01YXdBnmbXZxKOCd/RGd3SyXdfB6ulZw+iQxfAbXZFhjDo/yf0ugTeW
         3uMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792682813; x=1793287613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kKY9lXCqmIHp0E1eSfDqDHg5eGZHzHb0/xVe+f4AVFI=;
        b=Z6NAb/Umh2ZkH7hU4GJgV+HIbPFZ/ZNzbsR+C/36lTv3A8Cclinjvde9fQnp62mQLc
         KammenyKOSMkGtJ5xC1EPPKkW21TmjG4UrBNiTuaV3uB3gerrFYA2TFMLzO1EScHpHBh
         lxR7DpJ8HdRMT0/k9nAIljvEHybjvDRTuKO9EkZOGHYYlcXlmyq6DWk1HzbwEi9VlJfw
         W5TP+/8shUysRYW6RbovmZORqjk1MS4iVyucw2tSQFoM1txvdGde0jGbZt23kmFP6SaN
         +uTghYrxg2t8FgA4OsgRz61FqkFW8oisN/XlbmChvzqrtvCNAOLuuUi97/B9iJ8zw6rL
         8osA==
X-Forwarded-Encrypted: i=1; AKwUvBxYvdTBQxoBkN3zslU7PqX+PLILUhorh49t/PxeObWyUkyw6F8VQ2eb/+HpTnZM+7KqQbMi/+2dGL/TKNw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLL8xaJnoZHqA7zVXQLlLZo71oZhRF0iSrA+iFbx+dYQhyCh33m
	K11phKt9iyQbtYFADhmlUB3qU+VYXnqjYl7qC0LSA+7HtnpUEJG+3NmbDh0Q5xAB9e1Q55NMvpW
	40NeLn1SEHFL/0wHzK8chk6LChFuhUxgn/VXbHERm
X-Gm-Gg: AYBFou0va1tZMKgWASqhNV+SOb0gpqgqGqVXmjUMVxkpgCwhmSSE4OT/D+7dneUuHNp
	mO3biYQxH/1EaqhhsWHqiIdEQXhnEFiqZ3WIigDElOHgNvRrhEmdx6bKQCS16lqu9SM5MTanggj
	TaAr2rK9ItW2i1/37Bu2/RHGUr9qWzsh9BNuAS9b6rJzbkmXJfscZmMP+mFvwspYxTgLRzsIwkq
	wOChbVcf+qwAQW+GkmoXZ1GaRNSQzHHCNb3j/9LNy3h46C35FC3WbQo+Ym841KHj7rf+ldcsoWe
	JOBKmmbqC4C4jvnOYdKOsSE6fUX/rs7BN/Uy5wAlJ8WYroiopb9HswLRSgnNzzTVrSRpOyRYMza
	M1WbyIl7gPl+axp73NrWN1EfJvs5vBaFURkYSmS1ieDJGiP1jV/y0xrANN++Pdx5L
X-Received: by 2002:a05:622a:e314:10b0:532:a17b:9581 with SMTP id
 d75a77b69052e-536aeaf3b92mr12054111cf.3.1792682812079; Thu, 22 Oct 2026
 08:26:52 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792439751.git.abhishekbapat@google.com>
 <9e49a8f68e4e7d25c5a9a73c1926f68e468ef320.1792439751.git.abhishekbapat@google.com>
 <98855929-df9c-4615-84ea-b90acba8c2ae@linux.dev>
In-Reply-To: <98855929-df9c-4615-84ea-b90acba8c2ae@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 22 Oct 2026 15:26:40 +0000
X-Gm-Features: AclHuK98Q_RR2pQhVQuaYAm5_PHt843ZOWGZFsQ6emeYuT-eX4QwHRsne4e1aO0
Message-ID: <CAJuCfpFDT7ZiUaSwcxr5sLNOm7gNr0kibJHzcuMev2fLkJFOMA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] alloc_tag: Extend allocinfo_filter to support
 tracing queries
To: Hao Ge <hao.ge@linux.dev>
Cc: Abhishek Bapat <abhishekbapat@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 7:43=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
>
>
>
> On 2026/10/20 04:00, Abhishek Bapat wrote:
> > Extend the allocinfo filtering mechanism to allow users to filter tags
> > based on their trace state.
> >
> > Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> > Acked-by: Suren Baghdasaryan <surenb@google.com>
>
> Acked-by: Hao Ge <hao.ge@linux.dev>
>
> > ---
> >  include/uapi/linux/alloc_tag.h | 8 ++++++--
> >  mm/alloc_tag.c                 | 8 ++++++++
> >  2 files changed, 14 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_=
tag.h
> > index dafcba2f7e2c..a96054ac2237 100644
> > --- a/include/uapi/linux/alloc_tag.h
> > +++ b/include/uapi/linux/alloc_tag.h
> > @@ -38,7 +38,8 @@ struct allocinfo_counter {
> >       __u64 bytes;
> >       __u64 calls;
> >       __u8 accurate;
> > -     __u8 pad[7];
> > +     __u8 trace_on;
> > +     __u8 pad[6];
> >  } __attribute__((aligned(8)));
> >
> >  struct allocinfo_tag_data {
> > @@ -54,7 +55,8 @@ enum {
> >       ALLOCINFO_FILTER_INACCURATE,
> >       ALLOCINFO_FILTER_MIN_SIZE,
> >       ALLOCINFO_FILTER_MAX_SIZE,
> > -     __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_MAX_SIZE
> > +     ALLOCINFO_FILTER_TRACE_ON,
> > +     __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_TRACE_ON
> >  };
> >
> >  #define ALLOCINFO_FILTER_MASK_MODNAME                (1 << ALLOCINFO_F=
ILTER_MODNAME)
> > @@ -64,6 +66,7 @@ enum {
> >  #define ALLOCINFO_FILTER_MASK_INACCURATE     (1 << ALLOCINFO_FILTER_IN=
ACCURATE)
> >  #define ALLOCINFO_FILTER_MASK_MIN_SIZE               (1 << ALLOCINFO_F=
ILTER_MIN_SIZE)
> >  #define ALLOCINFO_FILTER_MASK_MAX_SIZE               (1 << ALLOCINFO_F=
ILTER_MAX_SIZE)
> > +#define ALLOCINFO_FILTER_MASK_TRACE_ON               (1 << ALLOCINFO_F=
ILTER_TRACE_ON)
> >
> >  #define ALLOCINFO_FILTER_MASKS \
> >       ((1 << (__ALLOCINFO_FILTER_LAST + 1)) - 1)
> > @@ -75,6 +78,7 @@ struct allocinfo_filter {
> >       __u64 max_size;
> >       /* filter criteria only; see allocinfo_counter.accurate for actua=
l accuracy */
> >       __u64 inaccurate;
> > +     __u64 tracing;
> >  };
> >
> >  struct allocinfo_get_at {
> > diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
> > index 9ff9dd04d692..0d4d267c065f 100644
> > --- a/mm/alloc_tag.c
> > +++ b/mm/alloc_tag.c
> > @@ -250,6 +250,7 @@ static void allocinfo_to_params(struct codetag *ct,
> >       data->counter.bytes =3D counters->bytes;
> >       data->counter.calls =3D counters->calls;
> >       data->counter.accurate =3D !alloc_tag_is_inaccurate(ct_to_alloc_t=
ag(ct));
> > +     data->counter.trace_on =3D alloc_tag_is_traced(ct_to_alloc_tag(ct=
));
> >  }
> >
> >  /*
> > @@ -323,6 +324,13 @@ static bool matches_filter(struct codetag *ct, str=
uct allocinfo_filter *filter,
> >                       return false;
> >       }
> >
> > +     if (filter->mask & ALLOCINFO_FILTER_MASK_TRACE_ON) {
> > +             bool tracing =3D alloc_tag_is_traced(ct_to_alloc_tag(ct))=
;
> > +
> > +             if (tracing !=3D !!(filter->tracing))
>
> I recall Suren had a small nit on this hunk in the previous version.
> I don't see this change here, did I miss something?

Yeah but Abhishek replied to my comment citing similar usage of !! in
other places in this file, so let's keep this consistent.

>
> > +                     return false;
> > +     }
> > +
> >       return true;
> >  }
> >
