Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB33A36494B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787793865; cv=none; b=VkwsUCodb0Qobiyxle6y1a7nmd4C2rqTrHaZwnomfIpEJHqBOSLffGJaG2Dy9hhqKIL6CMFJR6kYtYOMjgAFusHUvs9mb+ROMJoDuz7R59NcpSLXtsHGeWjmxhxNpfs31wOR9QrR1kQetNZ1taLrw1UOh+SZEINC9ot3jM+vdfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787793865; c=relaxed/simple;
	bh=PQaF2XYCw0UqjA7wFgy6Ma0exqCO9jPfwIWCMzyga1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=owV+HupTcnabmd/QzR3avDezRNgqIODXRgBTNSgq+VEWrHMhK2AsLcOY4oWORZTVzkHhuSP9AOaFLKdBHxvP0BrQiY3igR9/VtTUrUQ8lL8toE5fVpvoIuGLNLF19eL8sleRzwFiZ81ogMcwsE95mLnHaFepOnwhK1GNYLwhT8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNzUrhEs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hNzUrhEs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 773F91F00A3F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787793863;
	bh=PQaF2XYCw0UqjA7wFgy6Ma0exqCO9jPfwIWCMzyga1E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hNzUrhEshXc26SmGiGBHoB439gJYfw9HCnrwOSDQlFVDUMjwa4I+PLxuhBt+9iSF+
	 Dv1Kk19HGzwkwbSDu1bG0vbrk/At5f1VsiqDa1knU5ewaPyN8BiBoz0SeUSMzur4yP
	 63K1dwnahsY8v5dHhYlCdmcKGjV3GYFW36zUHAWJygq/lztFerRcauPelQ5i24j9hY
	 8zJTbm0tTb5rLf+oCNVlMLYseNOCm4pA9sMUrb/CmYRIEs4tZxT9vZ1SMO/FheF6GQ
	 tNl/1djzxxU8ncUshFmOQ9mOGKvuaQYmvtOqq4wjF8xdiXB55KaZhEuzvvt3r/VpMK
	 /a9zuwSl6ZKUw==
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-52f9e79ed93so6764791cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:24:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rro2vUkB6ezSGOkeuXHon32gVS1bLAG42TSzB0hHfxNf2R0NfgQGY1kd0qLpi4kmf23hwVSTnvUj0q57Tw=@vger.kernel.org
X-Gm-Message-State: AFuF++nvWi4Noz1nyJ2b5znPaFkT4jWKjpPbYxd/FJboeaVH+J0e1LSC
	fdWRnggbQPEvhXQ57k4Y6jIVv0glwuimi3rKfDOpCCGPYy0+0U2MFomD29qSRzuIxZ3oLgfeWyf
	bWLIcQUiwIyPSJCIhotGZLgFJAaS7kKU=
X-Received: by 2002:a05:622a:5144:b0:52d:6096:b398 with SMTP id
 d75a77b69052e-52e423193c5mr121277711cf.10.1787793862520; Wed, 26 Aug 2026
 18:24:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821102538.22642-1-baohua@kernel.org> <20260821102538.22642-4-baohua@kernel.org>
 <ao6qTTtk2xkkeKob@fedora> <CAGsJ_4ywk7mA1xfk=emtqby1UAwFsaH9PChmk2TuZoDKrMzuXw@mail.gmail.com>
 <ao-I8rYv_G5j4wz4@MiWiFi-R3L-srv>
In-Reply-To: <ao-I8rYv_G5j4wz4@MiWiFi-R3L-srv>
From: Barry Song <baohua@kernel.org>
Date: Thu, 27 Aug 2026 09:24:11 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zoXvyXG6-qAH+=nv6V92w_U_tk78YAPKMihRniqvTe8A@mail.gmail.com>
X-Gm-Features: AcwNN1WjsBANY_EUTzkF7Ra3M4p0_sIYtGKnM5C4G_HdYSDH8YFZQRvcUca6J2M
Message-ID: <CAGsJ_4zoXvyXG6-qAH+=nv6V92w_U_tk78YAPKMihRniqvTe8A@mail.gmail.com>
Subject: Re: [PATCH 3/6] mm/mglru: enhance cold/hot inversion handling in inc_min_seq()
To: Baoquan He <baoquan.he@linux.dev>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, axelrasmussen@google.com, 
	baolin.wang@linux.alibaba.com, chenridong@xiaomi.com, david@kernel.org, 
	hannes@cmpxchg.org, kasong@tencent.com, lianux.mm@gmail.com, 
	linux-kernel@vger.kernel.org, ljs@kernel.org, lyugaofei@xiaomi.com, 
	mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	stevensd@chromium.org, wangzicheng@honor.com, weixugc@google.com, 
	yuanchu@google.com, zhangbo56@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 8:46=E2=80=AFAM Baoquan He <baoquan.he@linux.dev> w=
rote:
>
> On 08/27/26 at 05:43am, Barry Song wrote:
> > On Wed, Aug 26, 2026 at 4:56=E2=80=AFPM Baoquan He <baoquan.he@linux.de=
v> wrote:
> > >
> > > On 08/21/26 at 06:25pm, Barry Song (Xiaomi) wrote:
> > > > During aging, a folio's generation may already have been updated by
> > > > folio_update_gen(), even though it has not yet been moved to the
> > > > corresponding generation list. Such folios are hotter than those
> > > > already in that generation.
> > > >
> > > > It makes sense for inc_min_seq() to increment the generation of
> > > > folios that were never promoted during aging and move them to the
> > > > tail of the new oldest generation. However, folios that were alread=
y
> > > > promoted should instead be moved to the head of their updated
> > > > generation, just as sort_folio() does in scan_folios().
> > >
> > > While sort_folio() move protected folio to the head of next gen too.
> > > It only moves ineligible folios to the tail of next gen.
> > >
> >
> > Hi Baoquan,
> >
> > Thanks for the review! I=E2=80=99m not quite sure I understand what you=
 mean :-)
> > Could you please clarify what you=E2=80=99re suggesting?
>
> Sorry for the confusion, Barry. I meant this is a good one, and
> sort_folio() has the similar issue in which the protected folios are
> moved to the head, wondering if that need be adjusted too. One consistent
> rule for both is better.

I think it might be fine for sort_folio() to move protected folios to the
head, since those folios have either been accessed multiple times or have
reached a tier higher than tier_idx. They are sort of hot in theory, right?

if (tier > tier_idx || refs + workingset =3D=3D BIT(LRU_REFS_WIDTH) + 1)

But for inc_min_seq(), it is just catching up to make sure the newest
generation doesn't overlap with the oldest generation. Those non-promoted
folios themselves aren't hot , so I feel these are actually different?

Best Regards
Barry
