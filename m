Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794426865;
	b=ukUNjHeyg2YWmvqht5p7DnfIj/6JI+nPl0qAKCI0SBtgV3YcAgLzBRNoI3JBeFUaOCcz
	 j3Cow+Y7/bTM785+Ujz5om34CsCUC9KOVw4VLOlgZZXHQBLoBmYtzjQhQ95s8QW2Reafz
	 kwBpH24xxjZSaYWseCaeORxbwvKXraoQiDH3VvsUCOrolHht+VBTJ9w2Pu1smLf0fcr9T
	 VjyTq0HrUlUSIHpSdwc4hDLOrlcxQzEi9PETnrAfrYCVFN7ZWrqXk0P23YTWhiZY6LOyG
	 oLVKZZbAycHpROiP50H1OCMQ1Y2SouHmkytRdsbaVNG1ocntxdeWaV/0npvW0WcrNJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uz4m71nRD6f+qddgfa2gOOtoUGlSJn5F5ou4PIom6y8=;
	b=TQwgaaumv/0TRiF+1TdOXTFONiZ6RpnJXdGSIxvDKUukE22c8qP7MDLR4NvA3KPJCz6s
	 brnMdK7/G6ZCwQgB/oWhaS0K4+KLbSQwmcZQK+PTwPhdm75HUaNaXB8yyoRiR4SLRyAsw
	 R4p3+B72F4ODdX7urVgdj4Fu8GhHEyVH11DoV5dpbCUPvIMQWRo0OiCKV+KP4dUApDWWh
	 EaHL7mdIdjXvZJo6WPxERlyDb3H2ACmtE5haZMSGa+Ap1nf69SA1WvIYY9DbsqN9Dvaag
	 0OtPoEkGdDT0RsSpdnwi0rraNW9YgnbkW4W7T7xWEDzAHo7Qf2phdfn+ykSvoyH+7/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UyUZKoyQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E864B606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E864B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UyUZKoyQ
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-535f598d126so32591cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:54:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794426864; cv=none;
        d=google.com; s=arc-20260327;
        b=LZ/ylRjB/aITlAf5Wg/kIofG/VrPx7D2yFDqP+yT30aCswHgXUrcIbPPnpCsrHZRYc
         jm43W9t7jgBb5H9oN8X7cjgXQkJoiqbztK/VSyYqWNTc+noulkyeZgzET0TUQb7uW9vE
         eKqKxTeVeFbtxalIGFOb1lHiFI8xHXxTpETna3gllvSoyrLB8mIZGIkkH2/vMo9crdiR
         mZdImoMkB1SYX62Pbe6NJeQv6/qq1A3YO3KeSXXGQBBUL+iKJfHqMZ9sBzOdXH71k/bI
         yNowMb49SaYZUo13InLcUFljSUsgv16gm9eHKUfuW2d/yyc9Vlqd530mYZsWjxd1EuZf
         DNOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uz4m71nRD6f+qddgfa2gOOtoUGlSJn5F5ou4PIom6y8=;
        fh=K6AIZtRQb6U1IhcMs3qJmsNkz/ihqlVBZEH7bK66/Ts=;
        b=kI6H+bNBPV+tINEbfsZ13OZGXARGl+VKa1GP8Q9Df/wnoFfms/MUiURtLD0GH8IMib
         9eCdjuWMfLcMXIGj0qAFrWxbXAmVgTk6H+uDBzWlGeJzaP0jgyXgtgG+DITL8jNxzjVE
         u/nBpArJF1mrj4/noIky27YnZ1XabiNb0EGSHuL9mVRyovhlzpApQKjoh6pps4k2Sqxo
         RMTj+dL720TSCmMS4M0qPcpNtj/GGYNN0v16aQ/FUxWyo/yqVuLDprKEJXbxWA8JI7rf
         3fk9eJyOoXZ0OWm4qgaEUoOEIKBERw6kVlsv3YypwZjfnIrgiFD1tPfBZSdPzFpwneUS
         gUbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794426864; x=1795031664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uz4m71nRD6f+qddgfa2gOOtoUGlSJn5F5ou4PIom6y8=;
        b=UyUZKoyQc0C0giSLwUmxi3MjzDIMTkNydYBrUKpGmXE86lj7P2571vjHiVadD3usgo
         G2eI+g1ON6s3QZHWVAyr7MgPtq8nMO+pMx7BbLCgWOmoY/jaZ5NJGWm/b9Mt27iqvUW+
         ZHxX3KnWpNdxRbCKWGatvcZulAqvLgyfEAqDO39YYc5aiGTltRysfpYqwy7Nsr8bhlyT
         XTkSQTJ0yqM5343RIt+l33F44sTt9lFHYDFyAvv8nrPkrbsCGcnROBJ1Ui5pXOWJzawK
         zRjTymLwLhxhQ+rxlHrdIiYV0b5dK9mK7yTdtdLjBuq1zt1BxM3yYSL4sNtNa98eq/w2
         mSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426864; x=1795031664;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uz4m71nRD6f+qddgfa2gOOtoUGlSJn5F5ou4PIom6y8=;
        b=GjzCWMHu+IcPaZbdn3itV2tKtZIsojcnRFnLipgEckxcKj/C+chh0rrQDr4AkkuYLU
         m88GnoCnmdUIfFaQgr2pQ6B/y25E8SArfnYppXA23g76Uw3oZ2moqW+RJm5POjM1xqnW
         +BRgMs1P7WV7Xiy3jMlExuu0RzOq5iMuR8ksREwakJURWZZm7f+zMLp7ciK/3r6ZoQUQ
         R1hIsXflu6waiDK/g9alHDtL+ZyDoVcAKHoenBwBfAXOcWK38yjIyFolOUs2v5jHbBgc
         is/t2jWAiGmHGO3KnxSLYUbufNOwK2Qym9Xj0m/N6OxqxEH/sPmG30Gry1FXtT5+MJeY
         1L/w==
X-Forwarded-Encrypted: i=1; AL+hErEQNkUOJbTDkdENcxhNr/UHX6fWi6vhFU4YuPzw3XaH8BX/LZ97nvb7MlHN9hL+4KJ6acO2TJ4eMg8WUGs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1YjhZRmRkbhDBXS49HGV+U729MJ8VDVnl25lZKttlioYF6fQY
	0ByxjmRIQlB22kZP7HaFhQqHZ80CEQqIz1Jm6cY099/XBtKsjYAFvHcwhEnirvH137bq7xZrHIe
	68g/DLxdb6qAgNp3DqW+4rgTOgFjGTQ9cehYbRXGQ
X-Gm-Gg: AYBFou198noFbojE+yWR+738aRm+ZaZzfVPkSVSMUNG7sZZn3cMlrZ2vFS0UOzXCjos
	XFj2sdQ1rNjW9SeOw+i/jzKA9MEZ8NMxijs3jcZLl/AF893Fleva6fSUB/oL7sA3P+wnA6ujdAn
	KkDeCKFV7DNY5Io1YhaoR+rxpaXPqqSkldwdo9PTxvNIbyzuV8wI1cR8YfhBgVsbBO5zAtUSIos
	QsXQlSvRy9Nwv/FqPZJfuP49G5rs5uE0IN2FiYBZIx8SismAw7gTTNE7an3Jhgi//26ZPO/PKKI
	Ni1vRIVStIZBV++6PLwMDe559XKuckotITSJ3Oadxo4fAVcbRLblj/EzGLAaPXKWaodltRRGshv
	McJaWX30omuvkhMWd76+sUwidye8hZ5N9FF2bPTVHqO3yolGv6Ot0PUCBUPVCSMia+Nexa+GL0Z
	3HGmsFGA4vcPAA3eLeEDzaSg==
X-Received: by 2002:ac8:610a:0:b0:536:6ea4:e6a0 with SMTP id
 d75a77b69052e-5596dcd0110mr2182331cf.11.1794426863094; Wed, 11 Nov 2026
 11:54:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110125106.2935677-1-k.chen@smail.nju.edu.cn> <1e7fe0eb-2b06-4db0-98b1-3535218847b3@amd.com>
In-Reply-To: <1e7fe0eb-2b06-4db0-98b1-3535218847b3@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 11 Nov 2026 11:54:09 -0800
X-Gm-Features: AclHuK842ds_mKapn9TcQRUw1syxLEFrhFQUvpEEkUm30hfHXep4Wlia77qvmLs
Message-ID: <CABdmKX2hLTrxmZCRRLKFd3GuYP7tr1TX0-JGuXiKAZ+ZV8U36A@mail.gmail.com>
Subject: Re: [PATCH] bpf: make dmabuf iterator stay drained after NULL
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Kang Chen <k.chen@smail.nju.edu.cn>, Yonghong Song <yonghong.song@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>, Philipp Stanner <phasta@kernel.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 12:18=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Adding T.J. to comment.
>
> Regards,
> Christian.

Thanks I've had to aggressively filter emails, so for the most part I
only see stuff where I'm on To: (and I still can't read them all). I
would have expected get_maintainer.pl to add me here.



> On 11/10/26 13:51, Kang Chen wrote:
> > bpf_iter_dmabuf_next() uses kit->dmabuf =3D=3D NULL to mean "iteration =
has
> > not started".  dma_buf_iter_next() also returns NULL at the end of the
> > list, so a next() call after exhaustion restarts from the list head.
> >
> > The verifier relies on the iterator contract that once next() returns
> > NULL it keeps returning NULL: process_iter_next_call() marks the
> > iterator DRAINED and treats the result of later next() calls as the
> > constant zero.  A restarted dmabuf iteration therefore hands the BPF
> > program a kernel pointer while the verifier believes R0 =3D=3D 0.
> >
> > Use an invalid pointer value as the drained sentinel so the iterator
> > state keeps its one-pointer ABI, and skip dma_buf_put() for it.
> >
> > Fixes: 6eab7ac7c5ee ("bpf: Add open coded dmabuf iterator")
> > Signed-off-by: Kang Chen <k.chen@smail.nju.edu.cn>
> > ---
> >  kernel/bpf/dmabuf_iter.c | 23 ++++++++++++++++++++++-
> >  1 file changed, 22 insertions(+), 1 deletion(-)
> >
> > diff --git a/kernel/bpf/dmabuf_iter.c b/kernel/bpf/dmabuf_iter.c
> > index cd500248abd9..a2b7c38f9ae6 100644
> > --- a/kernel/bpf/dmabuf_iter.c
> > +++ b/kernel/bpf/dmabuf_iter.c
> > @@ -156,6 +156,13 @@ struct bpf_iter_dmabuf_kern {
> >         struct dma_buf *dmabuf;
> >  } __aligned(8);
> >
> > +/*
> > + * The iterator state is one pointer wide because struct bpf_iter_dmab=
uf is
> > + * part of the generated vmlinux.h ABI.  Use an invalid pointer value =
as the
> > + * "drained" sentinel instead of growing the state.
> > + */
> > +#define DMABUF_ITER_DONE       ((struct dma_buf *)1L)
> > +
> >  __bpf_kfunc_start_defs();
> >
> >  __bpf_kfunc int bpf_iter_dmabuf_new(struct bpf_iter_dmabuf *it)
> > @@ -173,11 +180,25 @@ __bpf_kfunc struct dma_buf *bpf_iter_dmabuf_next(=
struct bpf_iter_dmabuf *it)
> >  {
> >         struct bpf_iter_dmabuf_kern *kit =3D (void *)it;
> >
> > +       /*
> > +        * The verifier assumes that an iterator which returned NULL ke=
eps
> > +        * returning NULL (see process_iter_next_call()).  Without this=
 check
> > +        * the NULL left by the last dma_buf_iter_next() would be inter=
preted
> > +        * as "not started" and the iteration would restart from the li=
st head.
> > +        */
> > +       if (kit->dmabuf =3D=3D DMABUF_ITER_DONE)
> > +               return NULL;
> > +
> >         if (kit->dmabuf)
> >                 kit->dmabuf =3D dma_buf_iter_next(kit->dmabuf);
> >         else
> >                 kit->dmabuf =3D dma_buf_iter_begin();
> >
> > +       if (!kit->dmabuf) {
> > +               kit->dmabuf =3D DMABUF_ITER_DONE;
> > +               return NULL;
> > +       }
> > +
> >         return kit->dmabuf;
> >  }
> >
> > @@ -185,7 +206,7 @@ __bpf_kfunc void bpf_iter_dmabuf_destroy(struct bpf=
_iter_dmabuf *it)
> >  {
> >         struct bpf_iter_dmabuf_kern *kit =3D (void *)it;
> >
> > -       if (kit->dmabuf)
> > +       if (kit->dmabuf && kit->dmabuf !=3D DMABUF_ITER_DONE)
> >                 dma_buf_put(kit->dmabuf);
> >  }
> >
> > --
> > 2.34.1
> >
>
