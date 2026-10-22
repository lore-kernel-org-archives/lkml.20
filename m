Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658863;
	b=edYItYvkdE60iveVSQNXD7VcSVKht8l8FpOprwcqiETDfuJ74jm86sbALTiNgQP6lFb8
	 Z3uDST9/X0dreLBLzBQ75hcirSPTDSDirarxjv3rmLuv6OcRfVDGs+n9+z43uoxZwcW76
	 LmU5WZY7r4GspeZ/RATG6v6MHNTvd2MQ2lcITDkGMh262ZyR0NcdpkkeV5BRBmEEti6/G
	 UcPcw8GATrreHFfWdfyyr1kWDEod4dfB21mfp2qZQkRJJSfupr0hKjoFXjLwz7InZK5O4
	 lOSqMnl00CsB2SY3QlHkFRGk1xgZsy13Mzp4LMkBtKBJbk8CQE64b8ut5w/f3EAX65Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658863;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0KhNbGiKqMdAzgzs/EnRYikYSYyFDYoWRp8GQTlZbP8=;
	b=C6uNGoUJ4MHPJCk4LaTzTPQsHgdnncfns+xTCP023bZIyZZyGL1HbQ8d68FDHkL4nsPx
	 3TlMfgdGFRpXhEKOKc8AbbTc6ShoRbUmR1fi80KCp2TdbHWu9bl7B4JkJ4ZtR8p4SaMRW
	 wxJ5/YKYZPAhg+dk8PnR50bk7/tSmhXjNgTievQVSwrsELq/Ayo0sggR+1av0EPF3tBQT
	 FnYRqSEZOKZby9XQR2jSQpQKrXv89RQpaCnZaYALqJJAKcEn+Tu70q29juHxjZ2MxRB0Y
	 DIrhlQDWy4EbTogSXKRpOr3Sgt8OB4tCY8GhsB5U0uH/UiP5ZzRg9FxC5/7SCJfXhlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kf+SNUl0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82B9606A324
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kf+SNUl0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC4AA1F000C5
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792658862;
	bh=0KhNbGiKqMdAzgzs/EnRYikYSYyFDYoWRp8GQTlZbP8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kf+SNUl0IYrzEyHlJOp2Tsxdcz4Z3jerFxsf7Tbyxnq95JVlJuNSCrco93/c1U0+v
	 dpeoUSNPK159BkKPrb63P8YOndvCiipdl8vRPm8i1+9e214sYUM7atDL6+QmplAHCb
	 XsUP4p5e0BRGgjTZupqA3+9h607WUtFTJemd6Z9USjRsHxX08ykxDB48NgwHt/Xsc1
	 NO4ASc3h/G/j94YeqU5fLVxucKCNcUnp390iXitDa9DyfvDOiuEnpO/X8FHpM2OuL9
	 h30gYjj6WOZC9yBPdWE/tljQg6m0Eo+3fVvVGt7a4TuLhdMY9jNLueGu5J435AANuR
	 Fup4aKQDk+e5w==
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93f1ca4132bso155703885a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:47:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBywAjTkudyh4kUub0/i1iwf2v8DgPe8Io8Rztpqtl6ipEJo47YsQiX7RDQtuuONZjk+P444ATUlF7wWWYo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJrBVnCmRkE8RigpaSZwsdl0NX/jHeR/BIFz23HzKx2UY3gmrD
	Q4bqx2ZcNL6wHKMNHCQECj+7Rc5Sw6FIHCpGUGnX9fBL0Q79C54sDWADyEPMbQY0s7flL1apIlv
	shXGN9QQx9JSQHvoyAnnr1l5D7lSCoW4=
X-Received: by 2002:a05:620a:1a15:b0:93f:192b:513c with SMTP id
 af79cd13be357-93f57f5c444mr887910885a.62.1792658862135; Thu, 22 Oct 2026
 01:47:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260920-vmscan-refactor-v1-0-ec04d71cb761@tencent.com>
In-Reply-To: <20260920-vmscan-refactor-v1-0-ec04d71cb761@tencent.com>
From: Barry Song <baohua@kernel.org>
Date: Thu, 22 Oct 2026 16:47:30 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yBqZVfrpbXsBJDHhitsHZEGWJhZsHG+uKC+QDxZp42HA@mail.gmail.com>
X-Gm-Features: AclHuK8XLVqPGA1mX7YdC2w83sO4AOeusxNOJ8q432NXaa2xo-Ms6397XexgORQ
Message-ID: <CAGsJ_4yBqZVfrpbXsBJDHhitsHZEGWJhZsHG+uKC+QDxZp42HA@mail.gmail.com>
Subject: Re: [PATCH 0/4] mm/vmscan: refactor shrink_folio_list()
To: Zhang Peng <zippermonkey@icloud.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Zhang Peng <bruzzhang@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 10:25=E2=80=AFPM Zhang Peng <zippermonkey@icloud.co=
m> wrote:
>
> shrink_folio_list() has grown into a very long function whose body mixes
> several independent concerns: folio activation, the pageout() dispatch
> state machine, the unmap step, and the final freeing path.  The control
> flow between them is expressed entirely through a chain of goto labels
> (activate_locked, activate_locked_split, keep_locked, keep), which makes
> it hard to see which decision each block actually reaches.
>
> This series extracts four self-contained blocks into helpers, without
> changing behaviour:
>
>   Patch 1: the activation block at activate_locked, into
>            folio_activate_locked().
>   Patch 2: the freeing path (buffer release, lazyfree, __remove_mapping,
>            folio_batch drain), into folio_try_reclaim_free().
>   Patch 3: the pageout() dispatch state machine, into
>            folio_try_pageout().
>   Patch 4: the TTU setup and try_to_unmap() block, into
>            folio_try_unmap().
>
> Rather than returning a boolean, the extracted helpers return an explicit
> result enum, so the reclaim decisions the caller has to make - activate,
> keep, or reclaimed - stay visible at the call site instead of being
> buried in the helper.  Where a folio may be returned either locked or
> unlocked, the result also records which, so the caller does not have to
> infer the lock state from an invisible internal decision.
>
> This is preparation for batching the dirty TLB flush before pageout,
> which needs to call the pageout path from a second place.  That change
> will be posted separately once this cleanup has landed [1].
>
> No functional change intended.
>
> [1] https://lore.kernel.org/all/CAGsJ_4wrQRGjqavMzWgi2+PrRr1ztf4QRZEb6HKm=
02OF8nEBUQ@mail.gmail.com/
>
> Suggested-by: Kairui Song <kasong@tencent.com>
> Signed-off-by: Zhang Peng <bruzzhang@tencent.com>
> ---

Hi Peng,

As suggested, I think it would be better to include patch 5
("[PATCH v5 5/5] mm/vmscan: flush TLB for every 31 folios
evictions")[1] in the same series as patches 1=E2=80=934, since
patches 1=E2=80=934 don't really stand on their own without patch 5.

The whole series is a really good idea.
Looking forward to the next version.

[1] https://lore.kernel.org/linux-mm/20260720-batch-tlb-flush-v5-5-db943a0d=
0d6b@icloud.com/

Best Regards
Barry
