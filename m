Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794402871;
	b=VHlygQeDXSKQLP5O4dLLDGWc6X+O04iKlUvjSFME1DjF280wGL2U6Oek1PnuoC0j2wyf
	 9M7cyt52LdaN/fQ8+10qTb2SLKM22PpRr6krsI6/L92mpWo8pRUG9nN0y5OldxqXfl6iA
	 XLecD15JsJfptCL6HL/zf1EHP7qOLAmNTyPzlXGMCuYBKUsAFkxhGJAiobRf3aO9GZ2bK
	 P8Su4t9UxG2ednjEF+pL/1PeC7PhTleKob60pzMaIQrDVtCjgNf7O9ErHB8JJdssF3PNH
	 yNu7anp+aj/BVLK6gW05GZ6z6xvt3W2z/V6Dznq3QukdDfzqalZmsITAziAn8G/NHCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=g/0oI6uv/H1EEuDN9a5C5Hh0fYM+cFB/bWC6crw40RE=;
	b=CzKju5t9hpOT4251VY7Rphj22Uvkg2KaZPQBGsIhVeJ6KHm3IdxhbewZn6bkEFNCjbVN
	 KuKac1C07zvH1hHhfTyMQ8h70Aytdj4LEXO72QOyckZUsmzjebWMnHMweTJI/s37EIJHr
	 wdKYHFDnuUa6YEdu5tBwUku23pYfbqZOCgiD2sqHbBeOFPugonau8+hXm+tyiXcBv9QBg
	 dvPkW0pyaiRqso01QB2JKp0ZoGjJsYcbn/2hNAw1udynoC33cHGSMpwdbworyOWJKvCPi
	 e+iMESvENKor+mitu0ceOcIOfNOeikS8ae1Znf08tNpxvjUi3cwEYe3ucSkB8XQm44g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gmq0kBQM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8113606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8113606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gmq0kBQM
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ed2bfe3252so11839815ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:14:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794402870; cv=none;
        d=google.com; s=arc-20260327;
        b=ddM1qotV98HwSXdaHzT3MCME1GwUmkmhIX3lg0u4JgNjvaxKl1gvFq23z4Xv7hsXJo
         +tFWgFWE93q9mUAYP+WM7POYzy0Kf/INyFkqF6q1tNemSpp6+5CEgXBK89hhJbuQ+gMf
         hFEfNBdzx/nCWe+YTvp63whY1kPenzrxhxZg611z7uBRr5jMvwiM0Ea5HksA9C1dMGfo
         zE/RsUGAPYVbuwpN9vulv2Rikkqo4SwLP5Is12q+7CV5pu+ivVAvk1+fddNQl+xXgZxq
         PxJpANi3EYth0NdtMJMeztvNeLd1ovw9ghxFsSgbjMBgoIiPNVCSdlWfjstKd44c2vBT
         zhHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g/0oI6uv/H1EEuDN9a5C5Hh0fYM+cFB/bWC6crw40RE=;
        fh=Llc8Cskymxwoem4uy5udKl6uxiPRYengGThsbDzMqgg=;
        b=bgav1thrkP6DJ3IYL71vdw2kP0o539MfAJhxUKdA/2ye3EvxYADTTvlTEUVvCQqZRa
         X2saQUm2kyim35MJ99K8ZjHGl5FOXQQQZ+SUoMtsVHGWEau/slRdbhiZOlssqYnu/q++
         YU6nBm7R+g+qQFnXj7GFHlonG8z4VL8p4HQTEW2SdD4jdjjZl8ePZXNsOtB2vSCufdcQ
         aeVrzGBOmswLH8BTBlibCHASdxvsWMH7/QIWHnPFIEFcRTBZe1yqEM0IJvlklAUAfl2P
         Sk7LUv/wbmbpaRMmMNE+v3ASEeCqFw+rYO2VbBsIFJwhpMQAn8RyDe5inWys6rrlCY62
         F8cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794402870; x=1795007670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g/0oI6uv/H1EEuDN9a5C5Hh0fYM+cFB/bWC6crw40RE=;
        b=gmq0kBQMvd5tohH57xbjhETnP2J3MID8+0UCoeIy5SR0XGEc8jONdXfEAYFw1taaEC
         NHteRNa4nDrKPARdPTp5voN3MQp85ZbSBo7zRIrtIDYu0fbfqQ0TRGasTBaDdRU0tbQP
         pCzsrEAR2jjlGVIO2cnReeLJbxhMQZVhva52beE04LdEtbtODWf2p3SnzYMr5SvZHXzf
         gnGNyw3EpvWG/JvU2ZYGcY8RHln6eG0ASqpKJXNmCJkO4mBCCNs+WfWGG07+sukfjMbK
         M9b2/Z4b3EAqT++KMQe04NmusUXV6wBYY/1sItV3Fc9dyfZLIcgVFnZHzUNPHhJR9ubl
         WyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402870; x=1795007670;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g/0oI6uv/H1EEuDN9a5C5Hh0fYM+cFB/bWC6crw40RE=;
        b=1QKZfyZ6MeLYq07l7hOyIAPfIyWcUsDCAxvyNPY3NaH15JQLsPBHGqhEGuE7eKby2E
         RqHrAaSiVaspvcrRP/cl4SwHiOTxZDTULQo2ukWGq+dPs0x8sH03iYjrngxVNlkrmxq5
         3LT/kimwdABj1QTp3vXqeMezWKjHAMSbc3oaYdyz6pPnScSc/mZqZlV4gPGMrGj5/IHs
         cjbMlI57+Gmvhk9d71z+SrhyEQnFQejJmInD5hdm2IcqwxnX0ZbQicDdwd3TPnd4CGaB
         6C+saRZIfTlcRli/SN8GzAepUDTcHi+jfAUBndh7KcTb43e3v7wjRXv58BsbWrGVN39L
         vt1g==
X-Forwarded-Encrypted: i=1; AL+hErEx5zD5FLMZR8yOsltTibLfvdnQhszOkBTuxZ29YzoTZYep/CtEKcDFecKKh2TiRveg9djlZJyog04cUao=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5KTeEJs0Hpzf3dogw7UiJKBR3D10JwjrXn/1QVUm8unEx4CoR
	6kHUqiSClmdns7g0bjyeDQAvLtxBEvvDfPqE7WzyZAnHE8VeFOYKwAAshJtSh1lmeTyEEJpgsb0
	pw2Qp25zywhbh2aPzom8tLy/m/wRqwFgo7zwO
X-Gm-Gg: AYBFou2codCQaC9NVcBA0HOL+2SjJURZU719/T1jM0LoURPhBRFgejcQC28Hp7DmBA7
	pa/vXhmYLz5H2OYpAnz6QidwVyPBg+UN2XQ1aCUK2h4cpkVrzu3ML+rLQ+C6mLdEawYPOFitEIX
	LlZpC/K+CpDDg3dIuHtWBxGCVc8hg6eQZPi2cGvj8i8zn1dH0yzwuM+63rhQQ8nJQbfEXeptTVv
	WtVN0MiO/JmWjy/A/cGwnq/xyG214abysFVVrXqJgA5kTbAJYIYyojJzBVSoNi0kvcMPdpeNg0v
	7DZQ8rJChgGZLSR3D6vPCLCdCQC9gxM0Xo13PgDaEyimyf4llqnroz0ZYSk2w8fuFmziruIePX2
	EyyYrC3klI4L5mYnqcC8woVbhG6sqYA8RVkcibAZxhP8El68/2582SzfHVubv4H3t
X-Received: by 2002:a17:903:2442:b0:2ed:45eb:51d2 with SMTP id
 d9443c01a7336-2edd7a9888dmr27729925ad.47.1794402870030; Wed, 11 Nov 2026
 05:14:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110085132.1023-1-adrianhuang0701@gmail.com> <20261110153907.158338-1-sj@kernel.org>
In-Reply-To: <20261110153907.158338-1-sj@kernel.org>
From: Huang Adrian <adrianhuang0701@gmail.com>
Date: Wed, 11 Nov 2026 21:14:18 +0800
X-Gm-Features: AclHuK_JPlTrjZpaZjohmplxPFoK1WduWQbas8gb3wbIHqUrtWb9Qa3r2Biv8pg
Message-ID: <CAHKZfL3+i_Sq+zgA76O0gqj1nP8x_FKJR8SRa0oz-5N4LrduFg@mail.gmail.com>
Subject: Re: [PATCH 1/1] mm/damon/core: simplify minimum watermark wait time calculation
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, ahuang12@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi SJ,

On Tue, Nov 10, 2026 at 11:39=E2=80=AFPM SJ Park <sj@kernel.org> wrote:
>
> Hello Adrian,
>
> On Tue, 10 Nov 2026 16:51:32 +0800 "Adrian Huang (Lenovo)" <adrianhuang07=
01@gmail.com> wrote:
>
> > The minimum watermark wait time calculation uses an additional boolean
> > variable, init_wait_time, to determine whether min_wait_time has been
> > initialized.
> >
> > Simplify the logic by using list_is_first() to identify the first
> > scheme and initialize min_wait_time accordingly. Subsequent schemes
> > update min_wait_time only when their waiting intervals are shorter.
> >
> > This removes the unnecessary boolean variable while preserving the
> > existing behavior, including the case where no schemes are configured.
> >
> > Signed-off-by: Adrian Huang (Lenovo) <adrianhuang0701@gmail.com>
> > ---
> >  mm/damon/core.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/mm/damon/core.c b/mm/damon/core.c
> > index d36823f4d092..93ec684a113c 100644
> > --- a/mm/damon/core.c
> > +++ b/mm/damon/core.c
> > @@ -3985,14 +3985,12 @@ static int kdamond_wait_activation(struct damon=
_ctx *ctx)
> >
> >       while (!kdamond_need_stop(ctx)) {
> >               unsigned long min_wait_time =3D 0;
> > -             bool init_wait_time =3D false;
> >
> >               damon_for_each_scheme(s, ctx) {
> >                       wait_time =3D damos_wmark_wait_us(s);
> > -                     if (!init_wait_time || wait_time < min_wait_time)=
 {
> > -                             init_wait_time =3D true;
> > +                     if (list_is_first(&s->list, &ctx->schemes) ||
> > +                         wait_time < min_wait_time)
> >                               min_wait_time =3D wait_time;
> > -                     }
>
> I implemented and used list handling wrappers like damon_for_each_scheme(=
), to
> hide implementation details of data structures.  This change exposes some=
 of
> such details.  If we agree we have to remove init_wait_time, I'd prefer a=
dding
> a sort of damon_first_scheme() like wrapper.

Ah, sorry. I didn't realize you intentionally hid the implementation
details. That makes sense.

> But, init_wait_time really need to be removed?  I cannot show clear benef=
it of
> removing it that justifies adding a new wrapper.  To someone or on some
> evironments, init_wait_time might making the code too difficult to read o=
r
> inefficient (system having so small amount of memory?), though.  If not, =
I'd
> suggest dropping this.
>
> What do you think, Adrian?

I agree with your point. Let's drop this patch. Thanks for the quick
feedback anyway. ;-)

-- Adrian
