Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7AE2701D9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789347877; cv=none; b=RKD7wn00dAKAj433mQi4knk0MGz7eTXGty4htFk3rvBtaB+LjbbbqGEddKM9wfyZ7g14uCGoIuz/CnXGkJUgK6imLH5AR9NAzOasehoaTaXrOhuN7jGqKNtUHRYLM9XV1HhBtJZ2IxK2/PUOqjWzFhC5pwCdNFqxfM7pzxQhXxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789347877; c=relaxed/simple;
	bh=ra69LizY9Yn+Lt0zqA2Cr6upetRX3FTneILtrin14b4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h3WtSwz9cCdlFDsksaNfZhBimAvAVH4lHL+HONc/KFbNtZGbNbcyf1v2Gxt5wOUjwVQuPtGMdeL7ysD5In/acTvoL8xw6ib5RP4OZ9cqRY0ZtoS7AVcGqttuVd85sm3+AwRtBsHUEQbFDoJ5VBYHh1e3xLdoQADa7dQqORqo0oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ST4ld+Ek; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ST4ld+Ek"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99cd5115bso2196668a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789347873; x=1789952673; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QKgDcK71/erfF5BOI6E4ssRD8I7BhRBZSyvO51I73v8=;
        b=ST4ld+EkZv9yNfdT7KlY4WbfXGooFfAV228+hWHjO2n/iTa6hHEVt5yJC3Hl1YQOf/
         clv+HWNVc1r3Vf3ma0yL3cXqZt3F5+vk+8BN5S+jKAuRNCPwPy0U8P7k1/4yabRUtJrK
         09ZEwf9pEOaoGPtbCvgP1TAYftY1JAcrzCrbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789347873; x=1789952673;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QKgDcK71/erfF5BOI6E4ssRD8I7BhRBZSyvO51I73v8=;
        b=ikF32Adeg0DH4o4SC24gpHvb+df9WHseOs9Abow2HLDB15zE6butxwNNRAS892ZF8t
         mLIPug7PQxqxFr9SIKvt6iqReJ4okbkobFJiLJAPtq5y5WQ8VWAgnYorWPhEy3B3tc8y
         IRNU/NA74hQdl5ZHMNZ+9loIKIR6kdJtL4Yk2KoawFSIwx0uiYLOr10mj6ltqQakpvQe
         QsO9Y1Z/LE9h2oqLhcGQ9bYnp2JeHBbqy9cD2h8mQATn2Xb3VQ0ScWhErXJJ8jo1ttYX
         jMhMPfTE2YFzZeMomNl4omBUGXX3dbhdm/WujFJO96Q7dP9zCZCeMezpRa1j3lRMxh5K
         XKrA==
X-Forwarded-Encrypted: i=1; AKwUvBx7wq/CloHa2D1D8jKzCzEESozp0RljczbVuEqKWOCcQa8bPbUoUkrUeJ+ieCprVaZH0EM+1XjiA40acP8=@vger.kernel.org
X-Gm-Message-State: AFuF++kT/wmeX4q09/oj+a47UNSCzS+MG5Ww96+pwCnMNRh2iUpQgtBE
	0yLY4olL087gd2u6xBBfMHUXdSPy/lSih2Epkchfxmk5FkmOOX8yVLu/svvgI3QXsus1si9y+Dk
	Tglp++j8=
X-Gm-Gg: AYBFou3vinDj0Do1WcY3SwBomG3QeWpGkqxMdLqdJCFd+M86UkAsqe30j13U0JDUDxq
	izOXuQHSFXfZL4iriMXdcDzIbPWYIUOlhrGUfUSQpgJaHGS33Na1NXskJQBQ9E/8QZFktOJ9ajJ
	GbDyvsRd5IYdRKWoDJl/NKD5OCiGLzTJfz/FnjWZPH58ISyRZuZQaLXKQ/APk+tg+U4I4zpskhG
	Bm3b8C2sIqZeGuao4nVTCYH0LNwoxhgRdLwv52fvUi2SItGp63hh65cBav6/wRb5KpyYk498Zu6
	RkK4SHu122HnTgt1VHyshf4jG24ZBSrPvRXK5qa8j2NuEkWaPjvVhxthwt3xJKqWtgOgVOmmVhl
	ldsRXdyNnjiXjdHgpoqKxGM6rpnwfETQWCATBlCzoJR+fujSnoW2Rfct5vRFE6dtp6Ja0qgAG7E
	7X8nGc8GXhPrM1AGzLgic9zF6WoY9zmtq1Y0K280Eb7TYsmxDQJvwLGMHLH3EzHKEXe0VW93LEk
	nNujziHajbwhUtDFAweRt/VwWP0p0VSLt/jJFIMmOwDng3K
X-Received: by 2002:a05:6402:4144:b0:6a9:87d6:40bc with SMTP id 4fb4d7f45d1cf-6a9f6154797mr166617a12.0.1789347872963;
        Sun, 13 Sep 2026 18:04:32 -0700 (PDT)
Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com. [74.125.228.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9bc808adfsm3265890a12.4.2026.09.13.18.04.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 18:04:32 -0700 (PDT)
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a98604f6b4so1894121a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:04:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxrz/UVgVGWp2ra1YImPKDQlCLpGjqQOO8cyn/XBPtYhkFXUhid9+owUAqWcL6BkP9k56DZnaC5PfzJQQQ=@vger.kernel.org
X-Received: by 2002:a17:907:845:b0:c26:19de:9ad1 with SMTP id
 a640c23a62f3a-c29b871d15amr19840966b.41.1789347872426; Sun, 13 Sep 2026
 18:04:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913225356.1033865-1-dave.hansen@linux.intel.com>
 <CAHk-=wiSPMB4tZB4mngU5wUJ3qJj5HwKc7x2E1dj4YnxCGadeQ@mail.gmail.com> <2a15ec49-7b83-4881-a9ec-a1193602eb4f@intel.com>
In-Reply-To: <2a15ec49-7b83-4881-a9ec-a1193602eb4f@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 13 Sep 2026 18:04:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj3H5DdeRqnWWz7PwH1Qzb1PgQWf9S0Ce3BjZ+68LjXuQ@mail.gmail.com>
X-Gm-Features: AcwNN1Xkf0HBdUoKyTB1WIiHyZGlXo8tlOzdWCKYcbsC698BDhlKgLjslIvhj2I
Message-ID: <CAHk-=wj3H5DdeRqnWWz7PwH1Qzb1PgQWf9S0Ce3BjZ+68LjXuQ@mail.gmail.com>
Subject: Re: [GIT PULL] x86/urgent for 7.4-rc4
To: Dave Hansen <dave.hansen@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, Vernon Yang <yanglincheng@kylinos.cn>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Orson Peters <orsonpeters@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Sept 2026 at 17:18, Dave Hansen <dave.hansen@intel.com> wrote:
>
> So the problem isn't with the data which was around at MADV_FREE time,
> it's with the "subsequent writes" that the kernel frees.  I _think_ the
> main way the kernel tells if a "subsequent write" occurs is _PAGE_DIRTY.

Yeah, so it looks to me like the *fix* is correct, and it's just that
blaming MADV_FREE is the wrong thing.

And if I read things right, this only happens for HUGETLB because the
normal page table code doesn't use pmd_modify(), so all the common
single-page cases get this right.

So it's really just pmd_modify() that is buggy, and the patch isn't
MADV_FREE, but probably something like

  mprotect_fixup ->
    change_protection ->
      change_protection_range ->
        change_p4d_range ->
          change_pud_range ->
            change_pmd_range ->
              change_pte_range ->
                change_huge_pmd ->
                  pmd_modify()

and the "Fixes:" line there in that commit looks correct too.

I still don't understand why that  whole

  & ~_PAGE_DIRTY

was added to that commit back in 2023 in the first place? The very
same commit did all the same changes to pte_modify() *EXCEPT* for that
dirty bit thing.

So the more I look at this, the more confused I am about why this happened.

The good news is that I think the fix is clearly correct. The thing I
reacted to was the misleading wording of the explanation.

This does not seem to be a bug in MADV_FREE at all, and isn't even
really related to MADV_FREE. I think MADV_FREE just happened to be a
way to trigger it.

And *maybe* MADV_FREE is the _only_ way to trigger it, but I'm not
even convinced about that part. It literally feels like mprotect() of
hugepages is really just buggy. It feels like that HUGEPAGE code
basically expected that "PAGE_RW" is always exactly the same as
"PAGE_DIRTY".

I dunno. Maybe I'm still missing something. But I did the pull, and I
just removed the comment blaming MADV_FREE, and I just rewrote it to
"THP not silently losing user data".

It still mentions MADV_FREE in the text that talks about having to
have a few things align. THAT part I can believe in: clearly something
has to align just right for this to actually be a user-visible issue,
explaining why it wasn't an obvious bug.

I'd love for somebody to hit me with a clue hammer on how this all
happened, but I guess that's not required for the fix.

            Linus
