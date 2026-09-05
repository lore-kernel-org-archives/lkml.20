Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E8140F750
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 10:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788604976; cv=none; b=VnGYh0Ffl8A3NNrDdSRUOx/ZH961O6+XyIyDnzymBH50JDq4xeQyM4n24Zhul/ucWbvZTGuEkNSOZACPAGnT6ne4bxmaiBe/OIYGE0Sd6VA0vOadpEO+NbYqe/YZDa7tqBrh3KEeWffNTgwWmRN+ofDe6LixqdErJu05d6LTOGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788604976; c=relaxed/simple;
	bh=FuUHtPZQDagZh2nxRzodsyXQvsg0cgmLkPZFirM9+Lc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aKGkH0E0rtj+IxUBLaWl44aHoLp6gEWPZlFJZ+JvaSB21GBr7mDgM8IgnWaUmc4zOT/dDa4LQlGk+jSyxvyOUo8m+grW2bFCrIqReGkF6d/Fnj6lYD6kx5iC7h3wwcAv9XMyddMPfGM15qOtb3PswrOIqHOtDjsDjIqzZvS2Gl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IKmpDGQ0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IKmpDGQ0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B04E81F00ACA
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 10:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788604967;
	bh=rLJWFNXuPNNNHTLThsNU83PHBMIGxroyjlrmOn0TnyQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IKmpDGQ0el4Idbgrsf83+Czj0k3aEanbwJfSsuvjxQZxp6e/k8sk3OA5z3KpcZJJ6
	 Fck4hPBvPB1Jxz5ABQcNA41TBXv5cVpcV6iMtSoFZ8MFkFiu5zoIHPRb11O0bzncNB
	 9PQsi0G4qk56XSSheLR66QFt9lRNqLg/hMUl1DiKRRR4vrRjmUZuQ6yFKPfw7UHTxx
	 vUV4nG87nbIlbZqHmOExdAxh82ZOpa+hS4y6eojZkYVpwkacqwFl83cWsB0QXSZsLd
	 0MIkRnKvEUqa60tnTxqyXa8pFlnzmqD19pXfb36Iec4E2mk12w/3CEvUfw1Lm+K/gz
	 xbG2Pez972Idw==
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-9390f8a1c9eso132479885a.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 03:42:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx9OrUTM+2Xax+vIRQgm2SYcT3QElrMiIoQyiYPC1U6LeHu8cRki3ctb8PA9rH1Baq270Qcv4c4o9IrF1E=@vger.kernel.org
X-Gm-Message-State: AFuF++mv7jd3K1yVGBd3G2mI8+tpSWgZ80hFQk/L7nrL4ZJmOVB0BeOB
	7VDo98z5TuCfIx9LbMwMhZEOkNF9we82aMgJW7gxaQua4FnfwCY1sCz5Qt34RoEcBJ5rm0qafqm
	ai6WL6K5c+8TWE4029h6Q6SHCJsTZtxo=
X-Received: by 2002:a05:620a:4e86:b0:939:6dea:ce77 with SMTP id
 af79cd13be357-939804a804dmr849282485a.45.1788604966952; Sat, 05 Sep 2026
 03:42:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901054358.4049095-1-dev.jain@arm.com> <20260901054358.4049095-6-dev.jain@arm.com>
In-Reply-To: <20260901054358.4049095-6-dev.jain@arm.com>
From: Barry Song <baohua@kernel.org>
Date: Sat, 5 Sep 2026 18:42:34 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yigbhqkrnufJKC2+rW7StraQvD0gr=4HQkTjKGQ9siGQ@mail.gmail.com>
X-Gm-Features: AcwNN1XGWvWBuJ0T_PK_fgXIydvvLgvH261yKhl-AABkpvYtbUiBkK5uOF9e0oI
Message-ID: <CAGsJ_4yigbhqkrnufJKC2+rW7StraQvD0gr=4HQkTjKGQ9siGQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] mm/internal: rename swap offset helpers to
 softleaf offset
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	hughd@google.com, chrisl@kernel.org, kasong@tencent.com, riel@surriel.com, 
	liam@infradead.org, vbabka@kernel.org, harry@kernel.org, jannh@google.com, 
	lance.yang@linux.dev, baolin.wang@linux.alibaba.com, 
	shikemeng@huaweicloud.com, nphamcs@gmail.com, baoquan.he@linux.dev, 
	youngjun.park@lge.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, pfalcato@suse.de, 
	ryan.roberts@arm.com, anshuman.khandual@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 1:44=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
>
> In preparation for adding a helper to set softleaf ptes in one go,
> generalize the swap entry helpers shifting the swap offset by delta,
> for softleaves.
>
> Note that the soft-dirty bit, exclusive bit and uffd bit preservation
> will still work for non-swap softleaves, since a softleaf entry is
> constructed out of a type and offset, and those bits are ahead of
> the soft-dirty, exclusive and uffd bits.
>
> For example, for a migration entry, pte_swp_exclusive() will return
> false, as the exclusivity is encoded in the type itself
> (SOFTLEAF_MIGRATION_READ_EXCLUSIVE).

I don't quite understand why you mention this. Is anyone calling
`pte_swp_exclusive()` on a migration entry? Shouldn't it only be called
when `softleaf_is_swap()` is true?

>
> Signed-off-by: Dev Jain <dev.jain@arm.com>

Reviewed-by: Barry Song <baohua@kernel.org>

> ---
>  mm/internal.h | 29 +++++++++++++++--------------
>  mm/memory.c   |  4 ++--
>  2 files changed, 17 insertions(+), 16 deletions(-)
>
[...]
>
>  /**
> @@ -523,7 +524,7 @@ static inline pte_t pte_next_swp_offset(pte_t pte)
>   */
>  static inline int swap_pte_batch(pte_t *start_ptep, int max_nr, pte_t pt=
e)
>  {

We might find a user for this in the future, in which case we might
want to rename `swap_pte_batch()` to `swap_softleaf_batch()`?

> -       pte_t expected_pte =3D pte_next_swp_offset(pte);
> +       pte_t expected_pte =3D pte_next_softleaf_offset(pte);

Best Regards
Barry
