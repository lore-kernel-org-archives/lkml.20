Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717ED36F915
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787852281; cv=pass; b=JeI7+7vSCH+iOrNN/vL8zJRV9TQ02Qhahm0vhAr1OJGNKn7VpaVTm/h86w+PsMbGRws8GnoJvlp01kgD8WHFa6WV/qNedExdw7jEqfW/S/vgxTo1PlkDspjvBv4z9G8SIcxoq4EQ+TQtMNjJoIaFOoE5S0LVGzaA9gPoK56WEhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787852281; c=relaxed/simple;
	bh=6ex3kovo0uNMrsiAnnka/VhNOgHQ4ndsnxBahUyagcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pwY9hTTUHES00lbHu2o5gvMKudwQGW64lXuf4uWy1jmwFESG1V0gnabEwXl32YqpWpTtQ8xo3YQphHg9Djobq80IRXBOU9CnCO3Odwu/kX9QjOkemVgbk74PjX4qaYcusNT4gq/shzMmWNHJ47J4kXCUnlrKmyGecDajwaMGK2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dmDlnspH; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dmDlnspH"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a38098734bso94889a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:38:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787852279; cv=none;
        d=google.com; s=arc-20260327;
        b=KSs+GfecpBp5iEj9PGY20XrszuUzGYqP4vzV5/UBPgMqT3QyuX3qkG0Sm80Hmqbe7k
         H4cw30Netj03cPvN43oGlnU1Ign6moeACb2tVy/8Rt/olKn8rSOOm6z4CYNLeYr17yCj
         udcJthtscKWzIf7QO0EHFiL2lPkya4bFMNzSEGxBDuja8j9y3Ah12rBZJaMChMxN5cyS
         RF3rA852wZMcw7yP2oFc5mlKazQ/kxUI/K0VOWfnG3XDcG6lW2ERkmB9u0rBJc700Mqx
         2fjCzuOft/K0OVSEx60D0+22aooeCaTsTVCgZwzviDKH/DBqHWtIxwzoR4SHp4/arGB3
         KmAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kPHaEe57cuLcNj926FYE8F74J4KSg+lREB21aJh7hOA=;
        fh=Jk1DGrn6N74RlzinPvp0SiiCqa1pQlF4M96bNraEG5Y=;
        b=U64QwfaH+fGJ0JsWutJFIrj/LIkNc+lQti+2OjAHaozdq285sXzaxEgJaJ2CfIXP/y
         bpFcOQoQbOoCJXNTm9HF8TLP0k9+Lqwd1yQROfSfLTtt3H80t7vlQriBxGdnrnx5K6T0
         aWpiFk3tPJM8LbjhsVtVsynAr2sL4EEkFZh9+AVgugUQfTGicfpv1TX2cXjuIIN8mb0d
         8blyk7unsRVx6+a1iq7HdBuGkA1m6OqmF4Mk0j7b7fVec1OwVIorHsMGEK7OHI/KAZS0
         YY3hufnKJvG48ctarJQnFbNPIoC96ktDGJPQyexAoDY41/P0j+ZtE+F0gj8riXWK1/yA
         efYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787852279; x=1788457079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kPHaEe57cuLcNj926FYE8F74J4KSg+lREB21aJh7hOA=;
        b=dmDlnspHSxVU9eFYABJs3fIjmj691zdfgRpAJbFMWaQF6LSBBPoq9LytqeunL+0chC
         BtYmWwwdvf15E4d0vzS4/XUt2NBitwTl4+RiTAC7pSgLGKb6mIAZ7R61blvj1tEl3ekO
         mIbZwQkkH043nlkr6St0uYjbZTKvchY1qa0Cvhn6s7MzPSCzPGJg4zmdZZRh6ElyRNK/
         CrIuUiKQ69kR4wiiIT25tCdMnfJSYhjDnytMNBGz8X7JoHGTmDItBZ2YtrXORhAIPHtd
         RW3htk5KL4+vW/6L74cSH3Bn0sPmydQ9kFvyXuKl8cE8WRt1U+S1KXGZaXZDwxrCoG33
         rq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787852279; x=1788457079;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPHaEe57cuLcNj926FYE8F74J4KSg+lREB21aJh7hOA=;
        b=eUjpIL/Vv2XTGp6s+n/UBhSJjx5W/qcwP4tbazuXWFqGQhXIqwvYCoV/eGEQbJPlcu
         ABVV3AwA5U+B+tMJD/+0q2adlWHdisy1eN83lJWDU0+XvL3h0Bx0Qc0nuLAH0NNyK9sG
         PfT/dwokm8NiLx7EdqVZjOHKY4sz50TLF6DJYQ2n84N5Q/RFJPQ2fP/85VZLXRnmGPd8
         nNHKrcCl9W2lIE0X3vYA7z2t6bj6bYB11ON242Dq6o59Ar//+MTo2CyVpUWojgVaXwiH
         geKqMlN3GDEIn/iYxuHnvUPPFXTL6AXB9PxmCFph2UzyCiPpYrsULKL5XZ6VSaotYvdL
         XaZg==
X-Forwarded-Encrypted: i=1; AHgh+Rp4fEFHQzLo2TmEFf2u9TLVoddani2gjwskmg43LbI/oO3yxCWaXb6HJy0adB2FWrDnt3pUf2gQpQ3djLU=@vger.kernel.org
X-Gm-Message-State: AFuF++n1pI7SQGX8Q5z5Nc04Xx6aQmu+JdLODkWKwMgeq4d+BK9nRR9M
	HhdfceyjA6kEpC2KOiCf7rgKYBmZA9vZQlZQB91Cog8lo4WqbJXBPg4D0Vli3gon67Ubpqz/nUm
	g74kS7MS0WX2iWd+POJ6ScOox5UYRNys=
X-Gm-Gg: AR+sD10tVzTx8l9lwHBn3JcyKWTeBcxDuGktq3HzLgjLAOSTMmr3cboVnfujFMYN+Wn
	PcY7YEF/dCAmM9HnldD2Ku+rYYAgj9GZWLuXPGWsHHHgiNcOkZJEFHyjFubgUpsbFoQQIqIjRMG
	ZhJ8fNpPjt9W0wXp9WOaz1xFtJQaHSl4vXczpWMeUiOFuPqQtx2JxJ9dhNTLLRCS/g65baY4oBT
	NfyEdZx+UlkIKeTdgtrFTueIHS2Gg1as72l1LJCbRkDAMTf1/qw4ChLAiHUbg3fJXPGpHh1rAil
	aBY2Ebi4Vf3gwfQPWMBVD0BtdUUB+vhL9zE774HADG2jNk/nicVcZIRYT/YCRCVYjmws0XnQeh7
	+atmkRY2Zt5o=
X-Received: by 2002:a17:907:6d05:b0:c25:5a7:87f with SMTP id
 a640c23a62f3a-c25566499e8mr34430266b.0.1787852278645; Thu, 27 Aug 2026
 10:37:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821-swap-thp-cleanup-v3-0-9b43f5163238@tencent.com>
 <20260821-swap-thp-cleanup-v3-9-9b43f5163238@tencent.com> <acdfa561-0690-4c78-bc50-92d308f4dca0@kernel.org>
In-Reply-To: <acdfa561-0690-4c78-bc50-92d308f4dca0@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 28 Aug 2026 01:37:20 +0800
X-Gm-Features: AcwNN1XusF7KPTBCbFIorg-MpoUYcu7AsrCOyjMNN0VFuVbYt9OK7HHTzHSMN6Q
Message-ID: <CAMgjq7BExecZ_Yo_ehoisUUDDMpvPxw2H0BWFocAMNMjMSMLLw@mail.gmail.com>
Subject: Re: [PATCH v3 09/18] mm/huge_memory: move anon_vma and filemap
 management into split helpers
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Shivam Kalra <shivamkalra98@zohomail.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 12:36=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 8/20/26 20:55, Kairui Song via B4 Relay wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > Only anon split needs vma info, and only file split needs the filemap
> > handling. Move the related code into separate helpers so they are
> > genuinely more self-contained.
>
> This patch seems to do more than that, like relocating the
> folio_expected_ref_count check (and duplicating it, which is not so nice)=
.
>
> >
> > Reviewed-by: Zi Yan <ziy@nvidia.com>
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
>
> [...]
>
> > -     /*
> > -      * Racy check if we can split the page, before unmap_folio() will
> > -      * split PMDs
> > -      */
> > -     if (folio_expected_ref_count(folio) !=3D folio_ref_count(folio) -=
 1) {
> > -             ret =3D -EAGAIN;
> > -             goto out_unlock;
> > -     }
> > -
> > -     if (!is_anon) {
> > -             ret =3D __folio_split_unmap_and_freeze_file(folio, new_or=
der, split_at, &xas, mapping,
> > -                                                       true, list, spl=
it_type);
> > -     } else {
> > +     if (is_anon)
> >               ret =3D __folio_split_unmap_and_freeze_anon(folio, new_or=
der, split_at, true,
> >                                                         true, list, spl=
it_type);
> > -     }
>
> Inverting the conditional seems to produce unnecessary noise in this patc=
h.

Will try to make this look nicer.
