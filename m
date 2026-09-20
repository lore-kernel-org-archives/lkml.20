Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B78E476CE6
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 21:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789940199; cv=none; b=R33f1b5S0zOhJRvD9Srk/C+FnoeC+uyapC7/1humWqw+xSq7rgp/0ttLFv5jWp4Ti6zmkqdg60jFYtaBXnOs12oxDcaSda2+qRN4sgwzTCy3wEQd3fXdJr+pUnOwRf1pM2dFIYA4yXn0L5u/l7L+VapTL5wPxLoAplAE/HNCuVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789940199; c=relaxed/simple;
	bh=8gJvxKlSlLRxRgGU0LA9tcNF8Jq0UD1ZJojciTkYzOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c+DGM0o9jbLvvaBowdjq3i2g4S9NhQIDSetk6uL/np5Ro5nYK/RMz4+XxWh9F9HqtFNQgsc/lZTZpUa1kdzSl9hvYh9nbwyWXCzH/vmKSz6D14bz92BkKItCpJGJ1yCFw1Bw/SbjlrFFm7L8e64CwShMdaRuMdbeMhsA5fa7xu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h71QUjGJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h71QUjGJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 110561F008A6
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 21:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789940182;
	bh=1ysO1eS/gbFmXaGSAYXx6cmDf67S5mq3GFCVWQ+iEO0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=h71QUjGJIWCd3yVn9woISzLbm0JrVjoMvEw/0rpLkb0mWYrzICHVvkRajGg1EB8zx
	 siqf0aCbKtGaNLpCfLSL39srXVvI8mO+482+PAlOUx2bkOjnOIuWkY6SUxDyk1eQt0
	 oNmNnjHgBnsDrEBu7nRxlIvXu/y7FJNzn37Ag1pI87MqHYUibBWxsdNl6+llY3Jzze
	 exe22yi+4fvS9qTiRjh594C8C5Y28VO+ZaFOHsX9BN093HyRcWsRAqHStPBrQVPUQq
	 GnvYxzF1bwgWwNTBsF3FQMEAVffL3W5lPBTaZOrPPS69TyOvAG7z5Re2lKhMYZ66Qb
	 joOiYgIf4hglQ==
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910ad2273so308340285a.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:36:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwAREz7P8cSLq1AijW2AE7YwgQiEjUS2tjLfEzOFu0w3NTrTBiVjQG+Hd0YbSuKAMcns3y6jk5OnIDtzvg=@vger.kernel.org
X-Gm-Message-State: AFuF++mO45nLrqoSqNIl13KiqADdWquqKkbNjmt/OMuYKd5FUFyxDfth
	3bM3pp1owrCRsZdveej23aIxUm2CVg3/xPjRkGck+d1bOg0dcapKjGYQqovx1yCE/6faEDV3BGg
	r7Wpg7bIv6L/V2KmnUE3S2jimmRRSWAw=
X-Received: by 2002:a05:620a:d8e:b0:939:112:d526 with SMTP id
 af79cd13be357-93bf556607bmr808731585a.18.1789940181413; Sun, 20 Sep 2026
 14:36:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-batch-tlb-flush-v5-0-db943a0d0d6b@icloud.com>
 <20260720-batch-tlb-flush-v5-1-db943a0d0d6b@icloud.com> <CAGsJ_4x7W3Tgr_VNY+RLK_pXnFdehGGbjaVH29JsYipXGf7Z9g@mail.gmail.com>
 <20260920143816.39827-1-zippermonkey@icloud.com>
In-Reply-To: <20260920143816.39827-1-zippermonkey@icloud.com>
From: Barry Song <baohua@kernel.org>
Date: Mon, 21 Sep 2026 05:36:10 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yGGAcS90dRLfpUNWGdPhR-foAXM19b84nCtvkvcRstSA@mail.gmail.com>
X-Gm-Features: AcwNN1Vs88-26THz2KPr3veJEo5PNRtGISRfbbm2vSV-eb78W8hJfEeBnDC_28s
Message-ID: <CAGsJ_4yGGAcS90dRLfpUNWGdPhR-foAXM19b84nCtvkvcRstSA@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] mm/vmscan: introduce folio_activate_locked() helper
To: Zhang Peng <zippermonkey@icloud.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Michal Hocko <mhocko@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Qi Zheng <qi.zheng@linux.dev>, 
	"Liam R. Howlett" <liam@infradead.org>, Kairui Song <kasong@tencent.com>, 
	Zhang Peng <bruzzhang@tencent.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 10:38=E2=80=AFPM Zhang Peng <zippermonkey@icloud.co=
m> wrote:
[...]
>
> I've split the series accordingly. The four cleanup patches, with the
> explicit-outcome rework you asked for in 2/5 and 3/5, are posted on
> their own as:
>
>   [PATCH 0/4] mm/vmscan: refactor shrink_folio_list()
>   https://lore.kernel.org/all/20260920-vmscan-refactor-v1-0-ec04d71cb761@=
tencent.com/
>
> No functional change intended there. I'll repost the TLB batching on
> top once that has settled.

Hi Zhang Peng,

I am happy to review your `shrink_folio_list()` refactoring series, but
I really don't think it should be split up, as the refactoring is
closely tied to your final patch, "batch dirty TLBI".

Without the last patch, the refactoring doesn't really stand on its own.
So I'd prefer you to keep all five patches together as a single patchset.

Best Regards
Barry
