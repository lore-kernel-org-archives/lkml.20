Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E719175A7B
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 10:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021770; cv=none; b=Y4siudKPWqVjzQd2w8IJ/9hrZXQxN5/iavXpX6sXvRW/RTJMB1SrvzO6PikrQ7xSVrpu4tAtAPH3byppniWGmZSbB6iTmrBwnG7G+dZLgqtdv4ZsMQXosSTW+u8Gp8gmj4OlsjtgFErCFKqAqPb5kHLBR5VTpSpXv+B6kY5WCSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021770; c=relaxed/simple;
	bh=txJhP3xHU6aHEZHW65/OvHMokn7SJcUz8M8GFBsYKGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WTjBhvLFbIbiZ8O4H5LFTdDi4JCsP7GY0QI7oKe0pDzJHZwweGyRh4XNonHBDoWf3zNIAR4TNQkjTU6bumqzHKkTmNvWMABC6K86Ojx4gY7DYadLoF7avi56R72GAf8rlodn0/EAaa3/rVWv4Q/8v9yyC/VU/nkSbV2/FaBz5qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbPkUkr0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbPkUkr0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3BD91F0089F
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 10:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791021768;
	bh=CINEjaQKfqAZPwBrbQreJnxCjhJLGPy7LWkHQXklSnc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cbPkUkr0XYdE8+ZIbbi9i8lK+HB0OiP8AJesP7l7WyFTmGTfx4iCKDdGwVmpcmD1N
	 X1Skp9yjZcBCLYCtJLeKa8LYM0g2fGrbOYibnOJknCeVgTkeyINLpLntZp9JaWbdo3
	 B3ba2/41L1iwhr0yb/xu1x6Qwz0Fn6tAXVCo6MMuWZGvLL82QO+Bx9bySCTcF7ohJr
	 gNaVEp2LZTRUUo8nnL5cxND358VxyvVcVrm+TN4amJxV0SF91qZOHOrZ66aYQIwZz+
	 FE38duc0emlzkCXJ64loBzj31lr6plLL50ka/4Dw58spqN7J3ZfQ5qviZ3vtzOTaHO
	 G9zajQX4zVl/A==
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93e58478119so21109185a.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 03:02:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxTsN7iRykPz5tfU5ivgq3k3voKjshTS9pOy3j+t2pcyADQ2m7tfiMGLzgK9+TL2TiLmi2bOJ1Yf0nKU78=@vger.kernel.org
X-Gm-Message-State: AFuF++njvl0t1x+X2PF1MdB9xvDQKj0QjQEjGiAPskoWmMrjpMyhLU5C
	MuuVLS5UnUkDo2Wm5I4FwcHSDQOp0BGWAxdAMGEUAPlqTsTfCW6/CZFQLCllzz2xd14T2wsKXjn
	MsLR94gItUbQ4Yl2/VQFPEEsS7R0CEZ0=
X-Received: by 2002:a05:620a:414a:b0:93c:677c:778d with SMTP id
 af79cd13be357-93e510b2f5amr326716885a.59.1791021768309; Sat, 03 Oct 2026
 03:02:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003090430.91664-1-jiangwenxiaomi@gmail.com>
In-Reply-To: <20261003090430.91664-1-jiangwenxiaomi@gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Sat, 3 Oct 2026 18:02:37 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xWAd=VHPdGhS2AHKag2WhFA=_3MSOPuyt3ksKH9ezQ7g@mail.gmail.com>
X-Gm-Features: AclHuK8clB5bMzNPhaWHp9TdGXPrszsdDwE5fUfbLLA9dhcHefwAYdXz5_pN5jU
Message-ID: <CAGsJ_4xWAd=VHPdGhS2AHKag2WhFA=_3MSOPuyt3ksKH9ezQ7g@mail.gmail.com>
Subject: Re: [PATCH] mm/vmalloc: bail out early on invalid page_shift in __vmap_pages_range_noflush()
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: akpm@linux-foundation.org, urezki@gmail.com, dev.jain@arm.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Wen Jiang <jiangwen6@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 5:05=E2=80=AFPM Wen Jiang <jiangwenxiaomi@gmail.com>=
 wrote:
>
> __vmap_pages_range_noflush() currently only warns when page_shift is
> smaller than PAGE_SHIFT, then continues with the invalid shift. Return
> -EINVAL instead so the bogus argument is caught immediately.
>
> Suggested-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>

I have checked this carefully and confirmed that this is a correct cleanup.

However, when I applied your patch, I noticed that the author and
Signed-off-by do not match.

Author: Wen Jiang <jiangwenxiaomi@gmail.com>
Date:   Sat Oct 3 17:04:30 2026 +0800

    mm/vmalloc: bail out early on invalid page_shift in
__vmap_pages_range_noflush()
    ...
    Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>


So please send a v2 to fix this, and feel free to include:

Reviewed-by: Barry Song <baohua@kernel.org>

Best Regards
Barry
