Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792442028;
	b=q28iBHedPtzpTugEGF0oGQgnQxuxYLu0g28xgO1+EH70GbhVd1R9OqzTNSBDnGl+lNHF
	 uhhBhsZIKtQkJV6TWvIXC97S9YgDReMx5bgwYvwabJD6TkgLXzH4pr3eVNRAk3GY6XU5T
	 4yM5eZYhfvDFGesE6Bt7B4iu9S2d02Ybg6wVvgzIjsDzuuX78EUpyxjTgwuPZjeSGv/Yi
	 urJg7yQD99wvqsUL9fBY1/z0l7zxL5sXbLm78NHime0NfVRSp6gfMconIzP2Aoxk2QaBT
	 txRoxD6gpwWmGvmYfl0RNJdlY8//CnQScfXzNUm1Ie4qWu9/86cjBFbqfxL5eW9FmVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792442028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Y7T5iwCFDP7hg0heh3HDw1oJbqflVFC2TJRQE7Ow7l4=;
	b=kPCNEXtGinMfz7XDW9/3SiOryEYPqC94l+xzwaUjMfN1F8mEoJ8AKe8GDYkaRVrBsVHx
	 BsiR6tVgk9xxMFpi++sVSbfkoctB6LvNowgiU/HPc6djwHTIB9cSQ+rW1d2+ITD7LVLxJ
	 XkjSV4qIP0czcyDSWG5ovPaOpTddOtCKJCzFkAcu04SfeQlaj084F+BbexvUiQuv1dNZD
	 Xo64sLKhwslZ2Dnkqeeb6lsB5o21s7GUTGSzIyJsvc0vbAdUnhYAy45zihIaRklft2voy
	 6kdndyHysUSvX5TR09Xds9kL3ercUFZdxTLulFHh3dOHNfmICiVy9RVIREAugqW4Pxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WgWTrwn8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1F8606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED1F8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WgWTrwn8
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8ac9d666d4eso19693867b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:33:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792442027; cv=none;
        d=google.com; s=arc-20260327;
        b=eV4eAgM0AIxmL7tlNgdxL3eQRgU+ZwMlh51XaJupHK0X0Gv267Sk+PGapBpRpm3liS
         mVeGsCLPIVpWVq0eiz7CEQyhW78sPa2iy7Q6ee0a1wpQb0Po9XhYib4q1oBRcNlHk5Nd
         WSW4DVhXhPucRXiBX2SW2/ssm1nKyFiPgc2qai/XuGUPRUGnAh7B99L8LaXvWWNB5anf
         R9gIq7VbU1CvB0HwXz/+1xUp5fROIfZNVczWhRdKnolhQzsHmBoAV+rpQz6QXs9OnrA6
         r4itpa4x/qtYw+q3mMFnOS4Lqj2zCFVG9yguP7Kc9UdV4zSBKaB7+avWrj/Tg6W+3HRN
         wqRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y7T5iwCFDP7hg0heh3HDw1oJbqflVFC2TJRQE7Ow7l4=;
        fh=5o40FucELyU4LLG2iEstO2vp7ijLM/5+hCsTSIcwgO4=;
        b=Uh5PTBXj6rVcOSTPD4Ug6gID9xIQsLpsqKcd6w4pE+T4Ivk1Gx9JBVIBBpTYcrpjGP
         sgLNhRsuvxzwD8gKTno/Wt9Z5R6vO8PDwgCV2KDkg18vbEt2Mvvkd4fWMfRvUWOONAPm
         7df3Qy8pPjtk9YayZGn9XadtQUh2tjq4fbRYlMckvhi69cQcAEIR92VHTcuCDrDSLprX
         46zBzy46JDMIoyXPc8a51hD3rskuGrpolY0vrjXLDK7udUB7dJDkp2MPjgB9B+PhjlpT
         8USJ7LIEOEePlKd1QX5eSBjKpl25Eebx3OLgrq1VynZEaCbB8w+v4PA0c5w24XPhPybe
         Iepw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792442027; x=1793046827; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y7T5iwCFDP7hg0heh3HDw1oJbqflVFC2TJRQE7Ow7l4=;
        b=WgWTrwn8K2+bsQFKs2mSvb25qUO0dNSUdjAG1ns3/fwEJG1v4obvdOXd2y9524Bk7Z
         CkULqNa5b9XA3zD+OK6Z8S3/tJCKxr/+r1LGMJBoObGIvxgNrsKdNvpE882PMX9CCA77
         hi0OG55MWEtZNvfEpEa6+OxO7FAj65Gs7ZF2zkBDKCUbMfw6KT5YF38bVMc4oPea6zOj
         E+zFFKmOdDgARKskI2/7YJbE8FAI8hcVwGxC0fgWDFwc2hbUu5TOJSNdi5M0b9x2RLPR
         pnYPWEbzIloqumcgfYdhM3lzMnc6dvrpOlSlGdlnZ33I+/Zmls6DSKCG9imw6BALnaAw
         Y8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792442027; x=1793046827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y7T5iwCFDP7hg0heh3HDw1oJbqflVFC2TJRQE7Ow7l4=;
        b=tQTnJ24gZTY/B8eb0wXptpQGt4cO7NpjIXEYERdfuj3sjJavsYBBIequUV9oyDjdnj
         eWEcPeH18VCk3R+abKUNA/m351y+wk7dTf3z2WnXPjSmCWfoVTxmnzQG9gQ3VPykgjcl
         rVtztDzJgjT5oreaAHwqoNdRSL+LRzKLmmBkatE5nKmCBkIRstrZE4HzssmP3ed5ACuk
         aCVU6hQV6y8Za842UToi/5zadclzaRM2DV0ZTqjaysX6xBeJhQv8DXaoVyK08oOHaLe4
         y8AvIGDlDpb41pjFkU7NSlhFBbW3dsJ1BEP+s+uDc/24QZSzdd7NIhCYIAU5vaIFDKVc
         Wvyw==
X-Forwarded-Encrypted: i=1; AKwUvByprsyfthZ2yq+6bExkhbiT25xLxnGBam9Iqc/SBnqGLpqpg87Lee0SrxHrwt647O7b1w0g/5leExvMUuE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/X+/ijrvq3E+kYJSDIsyj9q+IDYm1FmzvosjoSTMg+S4/x4gL
	pReGBPXujZZPLDOCzy0fnuW1K5nkgtLKmk8qtAtWQUWdBwWQxlpTkenBxZqHhLsEnYKktjrQCBj
	gwAJrxdsauhsoo8JemLxW94gFMWPtroM=
X-Gm-Gg: AYBFou3IzVmnn9DCPGqyy9hi3WgaS9Kl78yoLTx7/9bOyKvozqBNGO0BDiz0tFW+rtg
	pxocbfxbo1TCfLLGAipDnFoQfUeQ28Yj4KaKkZAzqCbUCjiDMShd9ZGy2lLnb1e41/BN0jX4hMX
	2RdYxlhkOhAY3nQzcIFsVSbCxbIRutKNOmyPe5PrUX2trBu1jB3/C0p/qlapXlxAms3+QDsptSA
	nlsJLtcmKTsMJYPr6c5MKOkworB4ESIOdvMr/2PKmlFQQ2WjBvGTRGPXiaK6oybuZKb+Ui7q/m4
	yPuhmMJh7oIVrgfqfZDIJJI6ecs/xMtxupTQ4WeZe9rqvtVb5LpBO1AkCiz0CUefkW6O4bGxG5c
	iOln3OiEAmsY3851wSFRhTW4hBY5wg0IUWlOwZ/f2sxWyWOOaBFf66jsSsK2dozE0T8kDJTPpxh
	2YySH37DgkTrV58HB8ierNNgk=
X-Received: by 2002:a05:690c:f91:b0:8b0:e680:615f with SMTP id
 00721157ae682-8b0f2072ae6mr28736617b3.9.1792442026685; Mon, 19 Oct 2026
 13:33:46 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017050928.128582-1-sidchintamaneni@gmail.com>
 <20261017050928.128582-2-sidchintamaneni@gmail.com> <CAGsJ_4wGq9oc05=-g4aWptLdCbTwUjMjXk4Rd6KjJ6x=tzMm+g@mail.gmail.com>
In-Reply-To: <CAGsJ_4wGq9oc05=-g4aWptLdCbTwUjMjXk4Rd6KjJ6x=tzMm+g@mail.gmail.com>
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Date: Mon, 19 Oct 2026 13:33:35 -0700
X-Gm-Features: AclHuK_VFblb2-qRhJWRPlqaC_e3NKRbx_LiB-tHmq77IBIhW4V1ck4pMMbCmjE
Message-ID: <CAE5sdEhGFtGF6LC4xNkMwGj3vTxLOW=GNBXnk3-JmsgjntXx0Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mm: multi-gen LRU: fix NULL lruvec->pgdat deref in get_lruvec()
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, david@kernel.org, 
	mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, ljs@kernel.org, 
	kasong@tencent.com, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, 
	yuzhao@google.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	apais@microsoft.com, rlmenge@gmail.com, stable@vger.kernel.org, 
	Hardik Garg <hargar@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 18 Oct 2026 at 14:24, Barry Song <baohua@kernel.org> wrote:
>
> On Sat, Oct 17, 2026 at 1:09=E2=80=AFPM Siddharth Chintamaneni
> <sidchintamaneni@gmail.com> wrote:
> >
> > Andrew Morton reported that get_lruvec() has the same problem as
> > lru_gen_shrink_node(): when memcg is disabled on the command line
> > (cgroup_disable=3Dmemory), it returns &pgdat->__lruvec directly and so
> > bypasses the initialization of lruvec->pgdat. The MGLRU debugfs
> > interface calls get_lruvec(), then dereferences the pgdat pointer in
> > lru_gen_seq_show() and other paths, so these can hit the same NULL
> > dereference.
>
> So userspace must have booted, since otherwise we couldn't read
> debugfs. The reachable case is therefore a memory node with no
> LRU folios when debugfs is read? So this could happen on a multi-node
> system where folios are landed on other nodes but not on this node?
>

That is my high level understanding. I'll let Andrew to comment if I
am missing something,

> >
> > Fixes: ec1c86b25f4b ("mm: multi-gen LRU: groundwork")
> > Cc: stable@vger.kernel.org # 6.2+
> > Assisted-by: LLM
> > Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
> > Signed-off-by: Hardik Garg <hargar@linux.microsoft.com>
> > ---
> >  mm/vmscan.c | 15 ++-------------
> >  1 file changed, 2 insertions(+), 13 deletions(-)
> >
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index 0c57e4f1eb15..99e9f07fa2e1 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -2745,20 +2745,9 @@ static struct lruvec *get_lruvec(struct mem_cgro=
up *memcg, int nid)
> >  {
> >         struct pglist_data *pgdat =3D NODE_DATA(nid);
> >
> > -#ifdef CONFIG_MEMCG
> > -       if (memcg) {
> > -               struct lruvec *lruvec =3D &memcg->nodeinfo[nid]->lruvec=
;
> > -
> > -               /* see the comment in mem_cgroup_lruvec() */
> > -               if (!lruvec->pgdat)
> > -                       lruvec->pgdat =3D pgdat;
> > -
> > -               return lruvec;
> > -       }
> > -#endif
> > -       VM_WARN_ON_ONCE(!mem_cgroup_disabled());
> > +       VM_WARN_ON_ONCE(!memcg && !mem_cgroup_disabled());
> >
> > -       return &pgdat->__lruvec;
> > +       return mem_cgroup_lruvec(memcg, pgdat);
> >  }
>
> I've been struggling to understand why MGLRU needs its own
> get_lruvec() when mem_cgroup_lruvec() already exists.
> With your patch, it feels like we're one step closer to
> getting rid of MGLRU's own variant in the future.
>

I agree with that! I'm happy to send a follow-up cleanup patch to
remove get_lruvec if that makes sense. Not sure how it will affect
stable backports.

> >
> >  static int get_swappiness(struct lruvec *lruvec, struct scan_control *=
sc)
> > --
> > 2.45.4
>
> Best Regards
> Barry
