Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2783D4749CD
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 21:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789939925; cv=none; b=Puu5POxXhRhse/WrUwjUMZPKKVYISN4QvgxZgXKhNGufBf2k5fUDaQh1MxT7P34h9N4qrc3shTaHcTIRUagayZVBIqgnI80Tn+de1Zdrzo/OAjoN/+tUM2YEJSYoXx0jwBc+bFH7wd336xdiI2MiN3RDwdMUUya0v/kpXcObj1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789939925; c=relaxed/simple;
	bh=moBfZNuH9z0HN2cjoFGXyYMMtBKFTBoQMffVjYhg9sQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XE20D9yD9Bt92xJoZT0YJR84ZWRGvvP1oAmo2aoPAc9ZF9Y5iwOEG4DlfCGazlLhOF/zsWUUuIlI1IUj9d8trkkb+0eucGZZhbHuQRt/nyYrpfHQKv/BwpHHN1J/iu1FS4JheKc+l4g6Z3nIjAiylzPSevqiNCr/MXwznNeqE6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5euhC9C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5euhC9C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6263B1F000FF
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 21:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789939918;
	bh=bG+nFrp4upx7MCXw9OUfu9nQHcHxme4Gwg03BFoGo54=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=V5euhC9CW7UAH5UEcChL1S/qro4ntO/ijYqRgvq/7zp8Z73ZWGaGTg3DPFwwIb2z4
	 urB2b1iMJ/qJ0/+r3z774O3Am4Uau6iLI9/7YJq9bBLUc2ZreDhzZWMiR2GqiAbUac
	 COu3YCR3vBxw5eNWy5Q0WRL12tI1TKyRXdu0RipiislQMsE/mDgjZspQI9vcVRN4Rz
	 pF9mUnqa/fBT2DBskiGhbjR4OrRczjfq+2vmI0yK6kOAyaMu1LgAMYB3mAlhtBwwLx
	 FCxmHumey6FktNP89ErQIpTpfWijaIfzcIIffSiNz8N7ph09KCm6L6hW/p3DzWdaaN
	 pYscrQjwy+W5A==
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93be29bb454so252762185a.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:31:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByeZwuCqkw337oRnKn2ib8+98TnSdh/Zp1dqkgQorqpSfqRupV1g3RNWWHLBQQjdL9gI+hWjZId/kNyvts=@vger.kernel.org
X-Gm-Message-State: AFuF++ngMpTXc+66dBHKLGyeezsPqFChbThKv6dGhgDH6hObSyDgvxBR
	FYxX8DIC/eEngyTsNlTv4bSouuYpKP+N3x8+wwtj+W/HEtsiCa2KE+QtdiLWzNDFc6rglL5ri0B
	0juu7AgLHbmD/y2RPfNAvGyyIH1mOTh4=
X-Received: by 2002:a05:620a:2623:b0:939:6dfa:48fc with SMTP id
 af79cd13be357-93bf576d80dmr705850085a.50.1789939912852; Sun, 20 Sep 2026
 14:31:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920132519.3369946-1-ridong.chen@linux.dev>
In-Reply-To: <20260920132519.3369946-1-ridong.chen@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Mon, 21 Sep 2026 05:31:40 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zCADpQDqVj=BFipOztctBMBhw9Wcj+FLVcj-d8e=0bow@mail.gmail.com>
X-Gm-Features: AcwNN1WdPK0ioQD_l4qRGaReDWr4kKpyTe5y6jiJxFOoD9G2B2z4IDYPysX9xBg
Message-ID: <CAGsJ_4zCADpQDqVj=BFipOztctBMBhw9Wcj+FLVcj-d8e=0bow@mail.gmail.com>
Subject: Re: [PATCH mm-new v2] mm: vmscan: put rotation-missed folios at the
 LRU tail
To: Ridong Chen <ridong.chen@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Ridong Chen <chenridong@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 9:25=E2=80=AFPM Ridong Chen <ridong.chen@linux.dev>=
 wrote:
>
[...]
>
>  mm/vmscan.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index e200ce3eb056..91295070ca33 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -1971,7 +1971,7 @@ static bool too_many_isolated(struct pglist_data *p=
gdat, int file,
>   *
>   * Note: The caller must not hold any lruvec lock.
>   */
> -static unsigned int move_folios_to_lru(struct list_head *list)
> +static unsigned int move_folios_to_lru(struct list_head *list, bool do_r=
otate)
>  {
>         int nr_pages, nr_moved =3D 0;
>         struct lruvec *lruvec =3D NULL;
> @@ -2018,7 +2018,19 @@ static unsigned int move_folios_to_lru(struct list=
_head *list)
>                         continue;
>                 }
>
> -               lruvec_add_folio(lruvec, folio);
> +               /*
> +                * Put clean, unreferenced and unpinned folios that may h=
ave
> +                * missed folio_rotate_reclaimable() at the tail to avoid
> +                * cold/hot inversion.
> +                */
> +               if (do_rotate && !folio_test_active(folio) && !folio_mapp=
ed(folio) &&
> +                   !folio_test_dirty(folio) && !folio_test_writeback(fol=
io) &&
> +                   !folio_test_referenced(folio) &&
> +                   folio_ref_count(folio) =3D=3D folio_expected_ref_coun=
t(folio))


I guess this is wrong. We hold an extra reference while isolating
the folio, so I think this should be:

`folio_ref_count(folio) =3D=3D folio_expected_ref_count(folio) + 1`

Am I missing something here?

Best Regards
Barry
