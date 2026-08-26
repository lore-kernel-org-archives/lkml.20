Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E3F39D3C0
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787781493; cv=none; b=aZ4bFUKPXpurT1P6uzHHr5FNRTXhP5wasIoVfBLH5hSuH8U4WfoIbl1aKdqy+jiiQR8m/8Azc0Bb9Sns+PaI7blJccIi4iYmYe7v9OQJrGlDrb8sNrnxPrpPLIQL73begIE79WKuPgISSmT76HuQQTupm9dFpCG5I4ov3LV2fho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787781493; c=relaxed/simple;
	bh=LJuPTV66Z0j+Lypq0Ur4SxL/XaKpV98C2bS/f305Mys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QFPAcJh2vmNcQfiR34l6sgv+MOsNe7mh5NcI0aGl6AjO8elCgFvHFDkYPoR+MG39cHbRYEkvIpxua2OJr3uUlX45ZgtJHfOypqO8Urx0SSj589b2yERR4xNsSU8xk9QzAX3TxHcBaGaySPPrA/ZTrXMR7eqgwcRz/zjBRObKeUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TD8Z5bif; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TD8Z5bif"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 025F31F00ADE
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787781492;
	bh=W48obZE6+PHj9qZ1VUibazAltzOy+cKkoC0weBFuEaA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TD8Z5bifPIXitj05rARbt7HWazn6f32cyF/TyWMKB/CBMV8rUWbzqZx/U44Ug3CEz
	 TSlbq9yxOIO/UNHno7SSBsZ/OFLwhCeCkaaThYHbQMuMybpRbDzjQx5vezVVPIzpIx
	 mw70vkNBMoAekWUkSLg18IIWVZ3pAstOKlF+LgGRMCvbEJmjnPTk4CbZGFZ0fdTvxM
	 LpwuT9XxQsz3BXLj8XxrhxGxfPIIbnInyAEO3afuPpbcrRdOE9T0WgQq6VBWDKyDOp
	 oc86pURq8/yobPY9awjaOUtKx40YC1xXFzdCOxPKFcnIThKGhbvBm/gLOU3j25MOU2
	 tQ2LGZTbxP2xA==
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92edb12cdf2so99839685a.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:58:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpnIkC9xEU3hA/k/WEk6es67CyILZfKgrChP/4TG6MoXJ3HASFBiSmMd4jHlvx9Q8meWX+FOz99ByNeYd0=@vger.kernel.org
X-Gm-Message-State: AFuF++nRmSHBL1kjprn3hYYqKKc3O/Ac9G1C+HJtkClp0n2c1U+iuyVA
	04sR20f9uF+KBrtYgQhyRPvMPLyU5VBCp5T8PezN02DCtMNK7PWPWS3uHOlIuLHDZHGzOo52ihZ
	hRzfDLVj+tfoSYA2MQ3TbME1QxRf0WVA=
X-Received: by 2002:a05:620a:4553:b0:939:200:32be with SMTP id
 af79cd13be357-93902004728mr135515285a.41.1787781491298; Wed, 26 Aug 2026
 14:58:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826075133.751049-1-zhaoyang.huang@unisoc.com>
In-Reply-To: <20260826075133.751049-1-zhaoyang.huang@unisoc.com>
From: Barry Song <baohua@kernel.org>
Date: Thu, 27 Aug 2026 05:58:00 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4x0Q3D9A_-aR9mdNLw53O9Os5SihhyaqFnSTtN-3v9Gow@mail.gmail.com>
X-Gm-Features: AcwNN1V8L5hw_vaE7IeQCKYBKYaXTeVpzFEpk6tsaOy4dEE_rMgI20fIJoaVXd0
Message-ID: <CAGsJ_4x0Q3D9A_-aR9mdNLw53O9Os5SihhyaqFnSTtN-3v9Gow@mail.gmail.com>
Subject: Re: [PATCH] mm: workingset: judge cross-memcg refaults by generation age
To: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Zhaoyang Huang <huangzhaoyang@gmail.com>, 
	steve.kang@unisoc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 3:52=E2=80=AFPM zhaoyang.huang
<zhaoyang.huang@unisoc.com> wrote:
>
> From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
>
> Unexpected anon folio scan rate is observed in a per-pid topology
> memcgv2's hierarchy even with swappiness=3D150, which is believed as
> the concequences of belowing rule which discarded all feedback for
> the destination cgroup: no WORKINGSET_REFAULT accounting, no
> activation hint, and no tier or workingset restoration. Shared
> mappings faulted back into another memcg could not signal recent
> usefulness to MGLRU in that cgroup, weakening thrashing detection
> and protection for cross-cgroup file cache and folios that moved
> between memcgs.
>
>         if (lruvec !=3D folio_lruvec(folio))
>                 goto unlock;
>
> The failure mode is structural: min_seq and max_seq are per-lruvec
> generation counters with independent sequences, so their numeric
> gap is meaningless across lruvecs.
>
> Store a truncated eviction timestamp (jiffies) in the shadow token
> next to min_seq, reserving at least 16 bits for min_seq so the
> same-lruvec sequence test does not wrap at the shorter LRU_GEN_WIDTH
> interval. Same-lruvec refaults keep the existing sequence-based
> recency check.
>
> For cross-lruvec refaults, compare elapsed time since eviction with
> the age of the middle generation in the destination lruvec's
> MAX_NR_GENS window. Refaults inside that window are treated as
> recent and workingset feedback is attributed to the destination
> lruvec.
>
> This restores refault-driven reclaim hints for shared cache without
> comparing unrelated generation numbers, while leaving the common
> same-lruvec path unchanged.
>
> With this commit, we can observe the anon scan rate raises under same
> enviroment.

Hi Zhaoyang,

I feel really bad reading these AI-generated changelogs. Could we explain
it in more human terms?

* What is the current problem?
* What is the performance impact?
* What is our approach?
* How does the approach improve performance?

My gut feeling is that you are making workingset refault aware of
cross-lruvec refaults. But I still don't really understand the actual
performance impact or how to reproduce the problem you reported.

What is the user scenario? What kinds of folios can end up on a
different lruvec after being evicted?

Yet you don't provide any performance data, such as anon/file refaults,
sys/user time, or other relevant metrics.

>
> Co-authored-by: Cursor <cursoragent@cursor.com>

Do we really allow AI to be listed as a co-author?

Best Regards
Barry
