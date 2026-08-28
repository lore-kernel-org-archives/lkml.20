Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3637239B94C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787887783; cv=none; b=CPUwOir/WiiT3CEm4ssNrwQp10dazmGBdZni19bf6s0pW/oA3J00V2+4qTp7y/ka7IhKPePELb9Obc9ILPDuCep686hzsHwK5+D6R+HqG5IXSmi0V0NPhiAcy8Jse+A2ekmFpV+desRFuY0XCBNEo2fhmgV+uwjlpP3i6skR3C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787887783; c=relaxed/simple;
	bh=khB7NdtY9eE9c0RZQNdFCuMsTnwmiUsDx/UZLFal7s0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C4mr3tAmISonl5qVFUBiC7oVuRw+s7F6N6+02gONw7JuzpQA0OXeT5yAyqaiBJejV7zhPwG1TCGpi2vATNLnY6qo0YxY63yGj9tsj0RIot+0E4ADAmRBNQbnaGnhNa0z3egP+gweAI9PNeCPoH70VhoWWJkrZ2ZzbfEwjskShqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K33GQRU3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K33GQRU3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0DC61F00ACA
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787887781;
	bh=7M8X0MBMxt76hH5dRrPPwluwtv1i2byXrFlYLC1LgdM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=K33GQRU34x8HB6Y7HBfsB0/e6FwBfNaf7dFW2ibWlwpE92Iw+vDh/+9cJvFraT5rZ
	 tzOHnRGrO3/+ze9MDzYBkix6oZTPSTnsAeHYWBMuavKzbrtN8+Ld2K7QgNyXJjdAV0
	 KpvtEaR5sZa2VlaKZBRf3KwUF4ph2IT3rYuv8MH6goK9+AOxIqTVlVXvdPboDYxH5b
	 b7MBWzEyi6mxzriujenLKGaDwJiWHTvz5YXm4gsIJ86gzSHoaHpllYtEyWoGF0AXd9
	 PUYu6Y2JTDOc3cK+K2MYEJOA+KQor2GM0/U4Id7Wtbbm1mx7hZbd29QVSMOZmp30kO
	 rb2WBeY2K5M1w==
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51bfe810293so3110401cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:29:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RonBByjv8u0ngfkY+xT4HWO5cXvw/AIA0i11AlkX0DyStw4ErEwbW1+o6IJllLS5XBZNO4LYuvr7TxYNWo=@vger.kernel.org
X-Gm-Message-State: AFuF++lyKF5vYa7KijkGjm94N3V0f4WdYt+/XHtauJI2Wf5qiXZEEH8Z
	rIt0eCQ7pCAy8BXqsUo4QIoWwZIKtpoGjFiG5AzH/Mb70Suzq3CQft+jo46boPv1AEjakfZHHGO
	lVIfHT7BiMppsqZMpMWLKm0eil6Y+Vyo=
X-Received: by 2002:ac8:5a4e:0:b0:51c:167d:b345 with SMTP id
 d75a77b69052e-52fb96887b4mr44668841cf.24.1787887781134; Thu, 27 Aug 2026
 20:29:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827234704.63163-1-baohua@kernel.org> <20260827234704.63163-8-baohua@kernel.org>
In-Reply-To: <20260827234704.63163-8-baohua@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Fri, 28 Aug 2026 11:29:30 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zaROZOgxix5biefMJNkTwf_BZMAwVhxOpYKrbztCLvEQ@mail.gmail.com>
X-Gm-Features: AcwNN1VwfytFpUBjCQMB-lWULkgmjEGuuHvJzdATBpIW4xDfMhLj8PCOW7Wd_E4
Message-ID: <CAGsJ_4zaROZOgxix5biefMJNkTwf_BZMAwVhxOpYKrbztCLvEQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] mm/mglru: batch move folios to the second-oldest
 gen's LRU
To: akpm@linux-foundation.org, lianux.mm@gmail.com
Cc: axelrasmussen@google.com, baolin.wang@linux.alibaba.com, 
	baoquan.he@linux.dev, chenridong@xiaomi.com, david@kernel.org, 
	hannes@cmpxchg.org, kasong@tencent.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, ljs@kernel.org, lyugaofei@xiaomi.com, mhocko@kernel.org, 
	qi.zheng@linux.dev, shakeel.butt@linux.dev, stevensd@chromium.org, 
	wangzicheng@honor.com, weixugc@google.com, yuanchu@google.com, 
	zhangbo56@xiaomi.com, Xueyuan Chen <xueyuan.chen21@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 7:47=E2=80=AFAM Barry Song (Xiaomi) <baohua@kernel.=
org> wrote:
>
> Detect folios that need to move from the oldest generation to
> the second-oldest generation, and batch-move them together.
> This can significantly reduce the sys time of inc_min_seq(),
> especially when the other type is significantly behind the
> preferred type.
>
> Assisted-by: gemini:gemini-3.6-flash
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Reviewed-by: Baoquan He <baoquan.he@linux.dev>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> ---
>  mm/vmscan.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 17524e96fe64..2b6f3f05ce60 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3931,6 +3931,19 @@ static void clear_mm_walk(void)
>                 kfree(walk);
>  }
>
[...]

>                 while (pos !=3D head) {
> @@ -3974,7 +3989,7 @@ static bool inc_min_seq(struct lruvec *lruvec, int =
type, int swappiness)
>                         new_gen =3D __folio_inc_gen(folio, old_gen, &gen_=
increased);
>                         if (gen_increased) {
>                                 delta +=3D nr_pages;
> -                               list_move_tail(&folio->lru, &lrugen->foli=
os[new_gen][type][zone]);
> +                               batch_end =3D &folio->lru;
>
>                                 /* don't count the workingset being lazil=
y promoted */
>                                 if (refs + workingset !=3D BIT(LRU_REFS_W=
IDTH) + 1) {
> @@ -3984,11 +3999,14 @@ static bool inc_min_seq(struct lruvec *lruvec, in=
t type, int swappiness)
>                                                    lrugen->protected[hist=
][type][tier] + nr_pages);
>                                 }
>                         } else {
> +                               flush_lru_batch(head, &batch_end, target_=
list);
>                                 list_move(&folio->lru, &lrugen->folios[ne=
w_gen][type][zone]);

Sashiko says

"Does this change from list_move_tail() to list_move() unintentionally
reverse the relative LRU ordering of lazily promoted folios?
In the baseline code, list_move_tail() was used for all folios, preserving
their relative order when moving them to the new generation's list.
Because the loop in inc_min_seq() processes folios sequentially from head
to tail, inserting them one by one at the head of the new list using
list_move() will reverse their relative order (for example, folios A, B,
and C will end up as C, B, A in the new list).
Could this subtly distort eviction fairness and page replacement optimality
during MGLRU reclaim under memory pressure?"


I feel this comment is not particularly useful. We are focusing on
resolving two specific issues:

1. Make sure promoted folios are always placed ahead of non-promoted
   folios. Right now, mainline can place promoted folios after
   non-promoted folios.

2. Preserve the existing order of non-promoted folios instead of
   reversing them, as mainline currently does.

Sashiko seems to be concerned about the ordering among promoted folios.
I don't think that ordering is particularly meaningful, because we don't
know which folio was actually accessed more recently. Accessed bits are
accumulated over time and handled together. The only way to establish a
meaningful order among promoted folios would be to make every access
trigger a page fault, which is obviously not feasible.

Best Regards
Barry
