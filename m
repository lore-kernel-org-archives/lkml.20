Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA271DB92C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788803788; cv=pass; b=Zq5Bs3bGaNKnTkrWnWrH0bahvbi3PPSdfJ7lZ9fW9en8M0WysM0kQl9+OBM2dTt2V0EZMbU+8xSXMQMb+/apHdXn/rUdiDLwY9jYlzIYS8qbABSDj46kJKwtUUyWgMEiz+Xzi4GcBpfVRY5mmVwsVKu3dFDjjuFxOTKk0JPyNsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788803788; c=relaxed/simple;
	bh=/KPgRFuZ3mNSSPL8cJczIgbdA3OlCM2eaUn/vupPT4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n0YikSBeVI7lJnHDCemaau7Zl+RTMPAaZnEhAsPJvgwnqnd90hX3OL2eIxkMW+3Gh5y7cyGbQX+eL/AE8hltn6uISwelMUbOiCfLJJMkpVtzkeOT+6Bdh1Hx+lWtGC7ebzJ7wvEpeW16EX8qu9+A1BRkJQtkBrc9/zyT6VsoO9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTOI12Ka; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTOI12Ka"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c262204cc80so354787366b.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:56:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788803785; cv=none;
        d=google.com; s=arc-20260327;
        b=pJLSEURdk+9COOQkNnEqrbouSeMSjggqP5ISRuhJNDybeUNP9FVSLvXKPL4QDLuwQw
         qVt0a03HnxQzH41RRiWdYwPA/hwIjXvq+Lxo8MqtM3rNzJpfNVb1+z401t5N2C3RLd0m
         KQa52X249jVHC7InFTjngvd9g/tbcK3Rq00i3eyO3wvymWrxRCz7DAm8MgJ50LFfQJJv
         4/bl3nuXKDhFuDKSUmJSdKxBz/fZvHf8ZFkmBWNSsCVmXM1D8NObkRWN2bjIFLehg1GH
         LMnqG1KmikVcuVygxvbfcrDcQsWZfZP+PdyvJjUUaYXXJgt4UjhWfJ58HCc2492LcDJ3
         pWlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/KPgRFuZ3mNSSPL8cJczIgbdA3OlCM2eaUn/vupPT4w=;
        fh=N4JJe3hNJIccwnJQeTOq9QZd9KBUKnYPwTQQk5gHgrI=;
        b=Q0OlGPnFcdYLNkZVr3++lZVn88uFETSs/H1SDnd3QHrbLHVSo0l51Ovs3dKmci627e
         DyrSRR/oTk2Tw7kdE7TwRuDw2pCdzvQd/vEY9k3WGCN7x01oycNyzP5gb6ZgcyWBDdF1
         TNJGnDkXObZ0qxiAUZQNJ/x4zcNTg97hqcDL6WRZoTA27tFtXZZ+C2wNyZAN0azQSYg9
         BsIM8znr4wIBn29nQa/gulJdtSLyC9Lt6ISboGfLYV6HeeBXVdQixnEJgmWUa6ECEIqS
         E6nRe/dUb132lWnIW7IGNvk2LiHqUbVhAjP+kRxA1sBXJilbhRdc4efYnvHKGmRl/OB8
         3NAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788803785; x=1789408585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/KPgRFuZ3mNSSPL8cJczIgbdA3OlCM2eaUn/vupPT4w=;
        b=PTOI12KaaQzE74VXYgDvFEalErLhqRMrOEpGU5DGLvFzjQve8VVukuFZ9/lNbPZ3LF
         Ju1ALbI5QYFyLCpNNUxdyimT/nqZ62DR0DiNUPFS/DMwltza6jXRXRI3kTCog05AtuUt
         qWP8Eiyrvz6EF+8iG5S2RP5kOvCRs0RidWJ45BG5Q+G/FNi3AF3Jks3Kdh1Z9Ffk7xks
         KUuVQ5CWuJlFeL0vQdEAwkQEOrwnLdzqh4i6lW9NhzmnSQ/aMWtvuPXSHIJjrnvsl2qT
         nnk4iOEgMLJ61X5ktyW08OQDmJCHRLD9/gIPauI1XdFS8wbupdR++eydeddi0IOeCQUJ
         B/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788803785; x=1789408585;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/KPgRFuZ3mNSSPL8cJczIgbdA3OlCM2eaUn/vupPT4w=;
        b=YGh2ZgdXQL4tEBY9TFpTQVOgvcQp4NmNAM7fKWNSD0OdbOAx8UHJIjQL+EfwsT7iLE
         tGwjsaT+qVH6DAHtRBohU+FQApuPlxGKlvhDhCSe1dUZ1TY02NUdwlL9jgFw4zFnL048
         rv0OEjuW60DldwjsQoNjhIiRB6xAhkPV44JtP+Cti5s2iJ42r8f1PQQS1b/4PFSU+7Yy
         SX4S5i/VfXRUFjN/6Txy0UVH1nmZtaNUJuuiNnlsVsE73TuC9OLXy89/psB+gdWnZFX1
         GijzKb0YL7oLz/sDMPbUfEZ7av7NAqFV7vMHprOxC/izdnAPnrxcCaI/Jh6tpIq9CZLe
         Ma8A==
X-Forwarded-Encrypted: i=1; AKwUvBxqTdXe9nQwLSAUyVyDOv3IbZn92d6CLgCVPiGnBc9QxzH+3j7rT1fl/iBJjjANUV85BL13oFNJLgYUtl0=@vger.kernel.org
X-Gm-Message-State: AFuF++m7Z42wCkmSjNzB/VScAQ+mSGrXMkemdk/+KixTiYWigbDlArWL
	lZMLohddmP+XOPfKkYUOtGtkcgrDQ3THyzAwOfE/K7aBnCuS4kxyP8sAQ8Mu71mql4xTjXcoswk
	tPTLydTjmyNi2w543CS593LM6yWT3/go=
X-Gm-Gg: AYBFou227gIbBCBdXqmq+c2DBYLSKpyxPU6mTDm1cSHxjEVTuOW+vRGKsvZGvmxmS6U
	zQsf39SJX1KaUHy4VRyNXXwU7TPspIsB+w3Y4FxkomxV7mLkHcLN9JOJcq4D8MHBXlLXHQePpmd
	+8dp5JiUbjpwHdX4UHJbvdtpJxYfyuJcdWlSbYVGZ0i2qYb6rYkp32Qt37yZWvvdPvMI+fkynEF
	4YR2z3KFDkQwoleYTChYeA1G08DjcY3MhLHq5S+smw237ra1aBjDNrysjyZMH8372kQA3qJu+DU
	BVdAqCqwr1gtAV6qVjwJ5BVD8zPAxuCtTDa+cPyzEI+h1dcpBKIxQkNKhXCcPbtKP9koMFHDZxW
	JIU1lpQPR4dB/
X-Received: by 2002:a17:907:7243:b0:c26:19de:9aec with SMTP id
 a640c23a62f3a-c2619dea86fmr702552866b.43.1788803785017; Mon, 07 Sep 2026
 10:56:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821-swap-thp-cleanup-v3-0-9b43f5163238@tencent.com>
 <20260821-swap-thp-cleanup-v3-9-9b43f5163238@tencent.com> <acdfa561-0690-4c78-bc50-92d308f4dca0@kernel.org>
 <apRHC9Hk9Ve1gO0o@KASONG-MC4> <6e85fde9-9314-4854-99fb-3582b13486fd@kernel.org>
In-Reply-To: <6e85fde9-9314-4854-99fb-3582b13486fd@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 8 Sep 2026 01:55:48 +0800
X-Gm-Features: AcwNN1XLFDfkd5CLWNE9FrQD_b7WIPlsnBT5hO0bC6nv4FVVuWbaObQoKl3tCII
Message-ID: <CAMgjq7AUeb0nrpt0A=EP1ZCX8SBeE5unYQ6LnhDz0BO8KiqaOg@mail.gmail.com>
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

On Mon, Sep 7, 2026 at 8:36=E2=80=AFPM David Hildenbrand (Arm) <david@kerne=
l.org> wrote:
>
> On 8/30/26 17:23, Kairui Song wrote:
> > On Thu, Aug 27, 2026 at 06:36:18PM +0800, David Hildenbrand (Arm) wrote=
:
> >> On 8/20/26 20:55, Kairui Song via B4 Relay wrote:
> >>> From: Kairui Song <kasong@tencent.com>
> >>>
> >>> Only anon split needs vma info, and only file split needs the filemap
> >>> handling. Move the related code into separate helpers so they are
> >>> genuinely more self-contained.
> >>
> >> This patch seems to do more than that, like relocating the
> >> folio_expected_ref_count check (and duplicating it, which is not so ni=
ce).
> >
> > We can keep it where it is right now, but this patch is moving the
> > anon_vma_lock_write and i_mmap_lock_read into the two anon / file
> > helpers seperately, so keeping the folio_expected_ref_count check
> > outside and before the helper call will cause a potential higher
> > false positive / negative rate of this check? Leads to unnecessary
> > call to unmap_folio.
> >
> > How about moving the folio_expected_ref_count check into
> > unmap_folio since the purpose of the ref check is to avoid
> > unnecessary unmap? No more duplication that way.
>
> I think the crucial part (for anon folios) is to also check after we unma=
pped.
>
> See __folio_migrate_mapping(), where we don't do the !folio_ref_freeze() =
in case
> we tun into the !mapping scenario.

If I understand you correctly, I think we are fine as is? The
folio_expected_ref_count() check here is just a racy check to avoid
the PMD split for a folio that cannot be split anyway, not a gate.

The gate is the folio_ref_freeze() immediately after unmap_folio() in
__folio_freeze_split_anon() (only a local_irq_disable() in between).
For an unmapped anon folio folio_expected_ref_count() is uses
folio_swapcache_ref_count(). It might be worth optimizing, but that
could be done later.

Or did you mean something else for the anon case?

I think I can send a v4, the patch should look cleaner after removing
the swap cache behavior change part. A few commits changed a bit, so
it might be worth some attention. Thanks for the review on V3.
