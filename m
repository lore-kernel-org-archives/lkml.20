Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A69486B89
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 22:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789944599; cv=none; b=dp4g7usMXEJvVNyxbfkJ8RI9+3epVTaAZRZUG9Z1xlGjUpk4v7tjF8/BLs6o4dEt/XC6cMm9UNXjNTlJgo20Dt2wcQfVpDLopgA+1i8p7RmNT4i4UciV1BI54i58WPCvH2YmR5IQocGSDrO5BX7FMGm12arS9Z5bcS6Mv5ed9wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789944599; c=relaxed/simple;
	bh=a/jOE2m9Ch51z9p7oKxI3tH5sq6/wRKzV8Rhifg4Q0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c1XMww1RW3Juiu0OoustBS/kKxnj841UaWkFc1Iy2JwPQebiyOp5BMzWfhue5IYScuBdTubBHy7VR+4KVSxg2gopxGZUqCK0pKsa2uNPMm6A5+ETrjELhmvRZHSsevlPYkpUOIMShKrZKvQe+7LyCfwcwAQ4SxxAP06E7+DmV84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nwr373SN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nwr373SN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 035631F00899
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 22:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789944598;
	bh=NMk7jaay0yUcgsKzFwtFeWuGD7mhNz4wMBMZfC59/pA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Nwr373SNLgDGYScjavq88LgEb5fyddf/ewPH30t5O/01C5LLWGrmxdCYxPdGY4nA7
	 l5imwIpx+J8wAvBy62eiOEGMfx1mCoQU1OOrlWBCB4wNgD+gkzjZKCy6hmoCa4YrWH
	 jxo9kNWdPnNSJYaCyFVaRu/Ob4jAy/70Rz8CW1z1yQyZLpzLXmPHBKm6rRdkr6SWS6
	 GOx3XpUcxIxTrYESHynifMvRqzmpA0IBWz+4tKuBWjwf7XjGIsvqUynyhEMQdX17Ry
	 5a7ntrBv4+6HckO0vRSBjwKzSKodI8/UlC82+eXHkzpwEYOgVeTCyJTHq7qK5rbViw
	 6HYXbPxKXr/xQ==
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-671563fb8beso2112107d50.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:49:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxItWVU5L3L1u0IgY2755PgJfioVOkiDCLTGLnJVk2Es9WMlTMPSBQMohI5GZK3x2wDxWw1elc4FUGU1mg=@vger.kernel.org
X-Gm-Message-State: AFuF++njmuPh3MjGCIeSTh0y2nFRYRr/nEbert78HYOTfiuG3cuBk31i
	Dgt2g/zldQwKgEEmbmeL5XnE3fzRTj81jfqUgO+PGoRfUaRNPG2jMJCzdSsAZFauwzKkWHoxV3M
	khzXVw1fj7jwYWTl//xTwqQombSg61H+y5UqK2WnhQw==
X-Received: by 2002:a05:690e:b47:b0:66f:c1be:84cd with SMTP id
 956f58d0204a3-6717fd8ee5dmr2897101d50.59.1789944597408; Sun, 20 Sep 2026
 15:49:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918165642.1014988-1-ekffu200098@gmail.com>
In-Reply-To: <20260918165642.1014988-1-ekffu200098@gmail.com>
From: Chris Li <chrisl@kernel.org>
Date: Sun, 20 Sep 2026 12:49:46 -1000
X-Gmail-Original-Message-ID: <CACePvbWuLfu1Dj=OcmWVb=szC1W=rDpkmsrBOtjouWEnN47P4g@mail.gmail.com>
X-Gm-Features: AcwNN1UYc0e_xzOQI9EqMW35lm_YvbRGUF1mHBw6FnACM5oNTXxYG9NQXrOTi7M
Message-ID: <CACePvbWuLfu1Dj=OcmWVb=szC1W=rDpkmsrBOtjouWEnN47P4g@mail.gmail.com>
Subject: Re: [PATCH] mm/swapops: remove unused is_hwpoison_entry()
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 6:56=E2=80=AFAM Sang-Heon Jeon <ekffu200098@gmail.c=
om> wrote:
>
> Since commit 93976a20345b ("mm: eliminate further swapops predicates"),
> is_hwpoison_entry() has no callers.
>
> So remove it.
>
> No functional change.
>
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Acked-by: Chris Li <chrisl@kernel.org>

Chris

> ---
>  include/linux/swapops.h | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/include/linux/swapops.h b/include/linux/swapops.h
> index e7d0d529f3e0..603f9e3f909c 100644
> --- a/include/linux/swapops.h
> +++ b/include/linux/swapops.h
> @@ -261,11 +261,6 @@ static inline swp_entry_t make_hwpoison_entry(struct=
 page *page)
>         return swp_entry(SWP_HWPOISON, page_to_pfn(page));
>  }
>
> -static inline int is_hwpoison_entry(swp_entry_t entry)
> -{
> -       return swp_type(entry) =3D=3D SWP_HWPOISON;
> -}
> -
>  #else
>
>  static inline swp_entry_t make_hwpoison_entry(struct page *page)
> @@ -273,10 +268,6 @@ static inline swp_entry_t make_hwpoison_entry(struct=
 page *page)
>         return swp_entry(0, 0);
>  }
>
> -static inline int is_hwpoison_entry(swp_entry_t swp)
> -{
> -       return 0;
> -}
>  #endif
>
>  typedef unsigned long pte_marker;
> --
> 2.43.0
>
