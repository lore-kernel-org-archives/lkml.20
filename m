Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F26379C56
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810680; cv=pass; b=TFwNxTRPj3UNSF8DfK4qd2Bv7jDoPVeyrLE2lX7XJz4UKPQnsal2j5YI/EeQjIDNzJVpZ+8H2iuuhSHOFWfepa4JfDLTNVPlRC0X71hZ55OGeFZXZWVZ9/yXChrcbF+29cLFT5JlLdkNPHv31hRKoJ04VEDV8hPRS1dT2FaK4FY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810680; c=relaxed/simple;
	bh=vZHWFDEmbKduz63d699Nep2aAfQ+Bo8jP6g5WKOHG0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AOCwBbz77tcVy19hIf9iVoIYkylFGa9MbTp0pDkn+WJqGE0I9aNzrhre/HOkZOyrTUbcPD1Oe3QeJn0lPro2ZenmK1bdDDcby0w4nm2WnKvOS4GRv+npV1JokmENFoofjClK1HkCbFf3raHLadF5asMD4Nx2cU7Jp+ozKS4EYnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b=VI//LySD; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b="VI//LySD"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a81c6ceed2so2751971fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:11:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791810677; cv=none;
        d=google.com; s=arc-20260327;
        b=EStPpP+QzlY7ch5aZaoafLllA6klG2iS1M+ZmGAAvTlk7IXa4QAzWaRnLahe9cG+1S
         8M4DZ4qGW4ubcxoi7OxEur0SGeFfid9eIvxSXTUBslLzdNhgK9fvWRHCTMu7yTb49PpO
         RlxTrOOSEAYUMTrxgUmZNKjBiSasQkjEl/5ItHcA3xIXff4ISrUs4qbZfvePp3Q5nVjb
         HpGmTlfeG+qiNN0YllBmpAzVpeorAqFsdA1mMnGF8//NoLKBAOJKo8UrI/8+n+TmfLbc
         V2ga8RhNXfuwtjae/H0/zknqpqcyYn2JMU2CMhs5I01s7hpCeeug8i3Mh0latn3ySnqk
         cgQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z+0/3nkr6N+f3/zaPQD7b048Vl6ulUc+pAZFeOWlLi4=;
        fh=frWFnSY7dIyjhgMbtoDpMg1PPYIJ7I/zB/0yqbW70w4=;
        b=VSRAuXGXuZmugn/iuxFOOglgvfslge6eKqEby7Ng0w21Tqw0CTrQXTdurhiq2y99WW
         /nwtkC3lwz3JC1D3M6fT03f3oAlNOCm60JI3OJMYZHhX+Av4z3paL25wIodB1GW7r2vk
         zgA3dUGkrvw/n593Nl4xB31NTEagsVV1jeiRnEDqlHDk8yT+kKFv9UX8/ulrXtJECiId
         v4xCvl3aDDeKahQfoOWPNJraySDiZ0IO7Y0MsyQJkx8ScddxkUg47qdp0Xg7Bcr4ixap
         WRwbsOyKlZztpfGqjgsgQyeAL6HUeJ/NGXdSZNVLCaDYE3eEQXak19sLFoRlsKPBiBPd
         1fRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1791810677; x=1792415477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z+0/3nkr6N+f3/zaPQD7b048Vl6ulUc+pAZFeOWlLi4=;
        b=VI//LySDVelveBZwPbq4GaS6cEw4S8KniX8uH4PNMll5Vbz8rS5DmMX8JRAnJkFNHi
         MGPsuiPHM5uhR8eY6PrGlfNSBM/n8wnKhzh3feJta9p+8eBTO+QI+jPBq+Qt+ts/9WUt
         glmNSWFZJOciy3caHJrO7izcGMKVHntcj/i3wJwvEf46I/Ip/lJOhPNvLFpTouKA29IC
         q0r/DG4X7yJaUk5WXXFeRCdvvz1K36C/KxBNYyHJpU8+lBCHq8wkk/c4rQrFySGhYJmP
         p9etrRf+6aLPxo1XemXV6d9L1xFft83E64HAcV2y0TB7eHtTvfsYXfC1JcK4WOp3H7Cw
         K0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810677; x=1792415477;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+0/3nkr6N+f3/zaPQD7b048Vl6ulUc+pAZFeOWlLi4=;
        b=c5tIWbQ2wGgzRU0to0XKewyhYR/OSjmVXIVDbpQiYLXkJ6qHM6Rr4JIPyA3cb6Uc9T
         Bgikyi279D/JrTALAWKg/uwunk2E+7MuJdMx79f4GA1uLyPIlbdCfR9rbO++0gpNObqm
         h9yf2oP0TVl4AI9CrlPWrq+d5RV2AbcVZI7oaEn/pJDUEK+YrSvvIIGuRZxq+6YgsevS
         k2rF13MUCSZMWuYVHOYIIOwqsvcNhuZj3aLIkF7IyeQA+0+pfkgjHsA38kgxUyVZD5Jd
         LM2lg2OxxNGMkHDYIZBGC4xgSTIbXo+JB2oT9uJTKNCX1tiKC5QmocvVsQlQ7+oV33G8
         43JA==
X-Forwarded-Encrypted: i=1; AKwUvBxFYDLkevTEiQ2IHWoATIs2BPLKbKACm63xO+P3LH2p/kAOv/hKQmL1CCFVTtkdFApqXj6UeeDQE294NsU=@vger.kernel.org
X-Gm-Message-State: AFq9FYISstQW0F3RSvE2+V2nbK9joewsKXFK+1Vfa3VGnksoKi5Ov4mR
	DtpkQ4oc/ad2Lj0FakREiJEDndxWrpFwWlvNHZA6dj1VU9+INz5ZjGX4aBLAtoopI715XA3GlWZ
	7tPrsGjAlasGQdej87An7R+RsONM3WiZ35JEaaq9eGA==
X-Gm-Gg: AYBFou2TP3a8mVq321Cw2n2+p1/6R/E7gmAQ5Njb6bwIhSAOTNmihoiHLGsa/dgExGZ
	/oQeouy/UWLWK2JY/ChqNQXnYkXzXMNvRH/veixezwm9T9WmknvJ39VYz7/7bkquRBp8zpFmMAn
	BT5fFROUcUfEDM7G020pKk3zzfHU2i1yuGtJtPg6L8eR8NLL/KMnv5vqmDKWPXQWbVlqNpImDGH
	DxVmUJ3zypDt8pacvEbOwpMbMfHqjyKuaddJwduWqlc2WqW7W4XzmhQErC4Mw04MPxKvyc0HZzb
	ooT8rZ2sao3kdVhkH2z+OUa/p1k3p91eK5csJ3tB7e9Zzmlh6ywVilI=
X-Received: by 2002:a05:6512:61ac:b0:5bc:e45b:bf21 with SMTP id
 2adb3069b0e04-5bce45bc064mr3045870e87.2.1791810676631; Mon, 12 Oct 2026
 06:11:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009131715.39217-1-serhatkumral1@gmail.com> <20261012080826.GB219304@unreal>
In-Reply-To: <20261012080826.GB219304@unreal>
From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Mon, 12 Oct 2026 15:11:05 +0200
X-Gm-Features: AclHuK-tL9QNeyAXSqRN8d5FNfYQlOeSFxAyQoXGFxRQ7IA3NK9qBQr56rP8C0Y
Message-ID: <CAMGffEkYWj77M5V_p9W+i=_pKEg+seVV1S_EaFro9-feYaki9Q@mail.gmail.com>
Subject: Re: [PATCH] RDMA/rtrs: Use strscpy() to cache the HCA name
To: Leon Romanovsky <leon@kernel.org>
Cc: Serhat Kumral <serhatkumral1@gmail.com>, haris.iqbal@ionos.com, jgg@ziepe.ca, 
	danil.kipnis@cloud.ionos.com, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 10:08=E2=80=AFAM Leon Romanovsky <leon@kernel.org> =
wrote:
>
> On Fri, Oct 09, 2026 at 04:17:15PM +0300, Serhat Kumral wrote:
> > As the comment states, the HCA name is cached for sysfs. Use
> > strscpy() to copy it directly without unnecessary formatting and
> > avoid interpreting format specifiers in the name.
> >
> > Fixes: 6a98d71daea1 ("RDMA/rtrs: client: main functionality")
> > Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
> > ---
> > found by smatch:
> > - drivers/infiniband/ulp/rtrs/rtrs-clt.c:1906 rtrs_rdma_conn_establishe=
d() warn: call of 'scnprintf' with non-constant format argument
> >
> >  drivers/infiniband/ulp/rtrs/rtrs-clt.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/infiniband/ulp/rtrs/rtrs-clt.c b/drivers/infiniban=
d/ulp/rtrs/rtrs-clt.c
> > index 927e3f30483c..c85e22f670ba 100644
> > --- a/drivers/infiniband/ulp/rtrs/rtrs-clt.c
> > +++ b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
> > @@ -1918,8 +1918,8 @@ static int rtrs_rdma_conn_established(struct rtrs=
_clt_con *con,
> >                * Cache the hca_port and hca_name for sysfs
> >                */
> >               clt_path->hca_port =3D con->c.cm_id->port_num;
> > -             scnprintf(clt_path->hca_name, sizeof(clt_path->hca_name),
> > -                       clt_path->s.dev->ib_dev->name);
> > +             strscpy(clt_path->hca_name, clt_path->s.dev->ib_dev->name=
,
> > +                     sizeof(clt_path->hca_name));
>
> Haris, Jinpu
>
> These names shouldn't be cached.

Leon, you mean the hostname could change at runtime?

>
> Thanks
>
> >               clt_path->s.src_addr =3D con->c.cm_id->route.addr.src_add=
r;
> >               /* set for_new_clt, to allow future reconnect on any path=
 */
> >               clt_path->for_new_clt =3D 1;
> > --
> > 2.53.0
> >
