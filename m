Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4354123394A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 02:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788834913; cv=none; b=OIrdRLBz71w/09ADfMfqFKdmKJvYh4Wg1lDCRr8VntS4e+FEh1gmTVfDYrvx8xV2vXweFgYGPTJpbQMQEQFlyO/5lohWiETCJDdjSFcVlR6MsDJY7JmdfI77uTDqEpTfldP4jZOOaUf3BkM43RGBgPTwvOtUi8SkIXHvnz3g2dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788834913; c=relaxed/simple;
	bh=t2V+S3iIB/c6VgviGUIUQ+kPpX1uCAP6hAtM4xE8kJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WLCls14qnkbXYFTdIYNw/K4SISLA01KSj98JANM+4xn3dFygucHJsk/CPJFvrpfIeEWuvGroCqjQin69+2IoOznw+sa6Xeb9df7NCtskvJtCMld6nCMTQyUIrs3ukjjOzbc2Tp9ds1a2O6t5GlAMKdaZbUdc3evPnnxtoGfsl4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EhPiuI3v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EhPiuI3v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D291F00A3D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 02:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788834911;
	bh=eMmtbVHJ0q3i7VkqBKjhsBvkJHggSH9rxueG+47NtEw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EhPiuI3vzT+vj3AzZG46gCFz2og2UtKkIFYvMzir8gnnbLLJNSxTBDGkSOf1wrv2t
	 bduAzR5i3GvIylk+Q90QGM4ER0q0KjXF38nq1KtSXKqN7S+fDn/9brt32SvBlyfYll
	 /1XhjCTHWgn43Uhs6X+Q48PWqv2jSP0bdAiOjcnyRalVwn3FSEESOPvpzZav7+Xei4
	 NlG0OzbFsFljHNJ+muzHLZ9WP4FjI7g1qVIGSIG71nJJ4xibsTJDzXziWFvc+UhItp
	 onSiay6Qcu+c7LgxDI05C98Bb6+zW2XKGlzT9YOJTRf4v0YmxvkNzt6nlAzJq3A21n
	 7QgpcijD/SJJg==
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5303557a6dbso46590071cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 19:35:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByYOYfP3uEa+hHXZTMiHXzefL73wOXE52ltnnXIOmIT43djUpnTe82+4k8M0IIBKVDTYjo5B6fRegOnEnM=@vger.kernel.org
X-Gm-Message-State: AFuF++lQEXn+wUoYyfp+gDLBRB+lPG7uIs1XyOazEl7Bf/JdKbK1Rrxx
	ZhjCKGcElwtzJV0yrDcSU6njCiOfFj2jZDejodSvxm0vpqAwm72espur9sMY49P1dAAcYFXaabj
	X0WuuZ7EdPiWuX2ysdzCC3D+cbTRy6rA=
X-Received: by 2002:a05:622a:4812:b0:52e:2d1a:6f14 with SMTP id
 d75a77b69052e-5305495fe41mr315608421cf.27.1788834910922; Mon, 07 Sep 2026
 19:35:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8e4db9a298c5ea6ccb192e274caed5b96f0cf022.1788751143.git.baolin.wang@linux.alibaba.com>
 <ap9zPPughaSlfXM2@fedora>
In-Reply-To: <ap9zPPughaSlfXM2@fedora>
From: Barry Song <baohua@kernel.org>
Date: Tue, 8 Sep 2026 10:34:58 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wn5ArqhG9w7gJY7X4G+Lg6=1teCb70dzPdN0k+5H8MbQ@mail.gmail.com>
X-Gm-Features: AcwNN1XJdP_8a8O34UwYY4Ts-BqbCBJU3Y_Odys9qaBt_-F_ZUk2tjclx1aQlnU
Message-ID: <CAGsJ_4wn5ArqhG9w7gJY7X4G+Lg6=1teCb70dzPdN0k+5H8MbQ@mail.gmail.com>
Subject: Re: [PATCH] mm: mglru: clear the reference counter for rejected folios
To: Baoquan He <baoquan.he@linux.dev>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org, 
	kasong@tencent.com, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, 
	hannes@cmpxchg.org, david@kernel.org, mhocko@kernel.org, ljs@kernel.org, 
	ridong.chen@linux.dev, hebaoquan@kylinos.cn, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 10:30=E2=80=AFAM Baoquan He <baoquan.he@linux.dev> w=
rote:
>
> Hi Baolin,
>
> On 09/07/26 at 11:25am, Baolin Wang wrote:
> ......snip...
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index 40d3f1b48a74..42c0a09938ab 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
>
> Well, this seems to be based on Andrew's mm-new branch. I usually track
> mm-unstable branch. Maybe the subject should be marked as below?
> [PATCH mm-new] mm: mglru: clear the reference counter for rejected
>
> > @@ -5021,10 +5021,11 @@ static int evict_folios(unsigned long nr_to_sca=
n, struct lruvec *lruvec,
> >               }
> >
> >               /* don't add rejected folios to the oldest generation */
> > -             if (lru_gen_folio_seq(lruvec, folio, false) =3D=3D min_se=
q[type]) {
> > -                     folio_set_lru_refs(folio, 0);
> > +             if (lru_gen_folio_seq(lruvec, folio, false) =3D=3D min_se=
q[type])
> >                       folio_set_active(folio);
> > -             }
> > +
> > +             /* See the comments on LRU_REFS_FLAGS */
> > +             folio_set_lru_refs(folio, 0);
>
> This looks like a great catch, while the code change could bring issue.
>
> Because move_folios_to_lru() relies on folios' flags to decide their new
> generation. You just cleared it before move_folios_to_lru(). This is no
> problem for rejected folios that are determined to be put into the
> oldest generation. But for those rejected folios that are determined to
> be promoted, this could be wrong. E.g currently gen window is 4, and a
> folio is referenced, lru_gen_folio_seq() decides its new gen as 1, which
> is the 2nd oldest generation. While folio_set_lru_refs(folio, 0) clear
> referenced bit, this causes it being put into the oldest generation in
> move_folios_to_lru(), this is not expected.

The original code looks quite weird. It even prioritizes folios
that won't be promoted by `PG_active`. Do we need to change all
the cases just to call `PG_active`?
