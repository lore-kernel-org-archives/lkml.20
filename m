Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CEF30EF8F
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792006116; cv=pass; b=Q4I+U6N91enI+C/O1JQkeXvdSrmUUwsokEfBOerG98ZRBm6Cj2yMHnsoSTMsPZ7yZ2xMxqbQ21O9zd//wbIjlyhstIrQ+WR3kqfn7NbCblpSgw0iXxNDE5PGfsr2373OOj1CWO9YlDjkmGWvbGkALavfo7BL5HHZclDhn3N4Gq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792006116; c=relaxed/simple;
	bh=7d2khIkbKgx15W8ScWfR2u/qbD/gE92GUxqM9EDA+28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=u+tFbLMzqOp7vpBpTQYF/EsbIyJ5eHtsn1mFQ++WJ1f9lW1q8sS+7GRhhGLQDv6L7FPLigZpdx8TVF8321AyagS7ZJnhnETvzt+EZtt7YqdGPFfmq4bZ9Wg7IdxMLep8UGOFLUrw/0L4BpZczEzkTOttmGQ7ntf0ytIIHBLsAgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8D6gqCX; arc=pass smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8D6gqCX"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-823545ce223so984214a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:28:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792006114; cv=none;
        d=google.com; s=arc-20260327;
        b=clFQZKFmabpCM51c4ofXQcJ0YoGV3qwnyJGvnMyqrIhZPcEI0Mw050jqimzaJeAcGm
         dllqEBdQguzIzn0GQROk3PTMobF7648DORvn+9MbJZEgqq0tM6qR84eJrNVEMgD2pvwd
         iEeOAY5yTyp+vkZdRugW+lX96cpH5gZNqzmjGHmYyUpNlMEILSTl1clBGMIdJ2P0eI94
         wCsRI5gMBZpGnEuh4i+dCvUTdkBXzyKNyWZLcma57eTxkhsWzedLBT2cx2HS2cOjM+e8
         5ueSIFFwpIaa3qkcsICx6J24ZSDlbIEJaSCIni8eUuY1hpqaRpj9APuGS91D0g/JXqZp
         QgPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vFNh0P151ijBNlcg4FGLEU4z0chXiW9yV1YRnR+w3x8=;
        fh=v4MgCT7/AUVqRjXHWTxBVS28htXyawMpPtXLB6j0H+4=;
        b=aDvGrC8DIu6/ag8lvaZhD+vkLmtWv+sQWhu6UqKXExjDw1NzKvHfGtnw/KfzJ/DiXm
         cO70Q8qRAXzREZdGn9TJ/Hv7m5A59/KIKTL1TtvICqr7D/XytYWRtDrDioCpyxH/3FoF
         PfzPgd8vljaDyqMAqWJMktDEOjx6ro0yVktLl5gzRLaiC39yCzp/15b6RbYpjVNp5ly9
         g5BS5m1z01DhbM2T+sB9Gu33u9s6h/jasdBahIQdqIDygPbDiw3L/izmHCgeyaGpWWgY
         PkSLkAYE8GVEe3hDCeprLEiDuWcmRU7W9A1mxshFJ31Cgl8VdCI7J7M4ccdlcxSsZUHM
         RKgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792006114; x=1792610914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vFNh0P151ijBNlcg4FGLEU4z0chXiW9yV1YRnR+w3x8=;
        b=F8D6gqCX9arqIgBPni0r5ERi64Ke/hl8k4EJPb7xA3OH946M5eAKgmjWecBa6mRcQ+
         JVnQhvKVOiYmklmPO4zRM5IN141lgUbtJBzMORVH2Q49yGOjZArYR8CFXYUKvrbb7j4y
         op9krMNpGcrXDjnAQLIEsFXNuFNeP1DHnDPnrjnaRpdsEx1YTeHi2nWm4HQYtbDwvtjp
         ElwPp7L7GuBn/nKJcoxEMmZM+S6w4Zm/mwBqQjYC8dEQ2rrQ+X0z+PCg41JBfIVTnyy2
         RK1vM8CrHABrJ205TZx62wdZrS5G1xWbNMFh4gQqM/sA6tJRBQF9z/de+/WFIS8dPi9E
         rotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792006114; x=1792610914;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vFNh0P151ijBNlcg4FGLEU4z0chXiW9yV1YRnR+w3x8=;
        b=tWp8uGUUsVN7kIVIU2YnvWtLGsaCcjP8ADWQTFHPu8mUAlN4WyHV26k5fyRbBen9iP
         bPUot0EBn2rlVlpBUS/2AOm5bO0YF/ooXp2yDwc1yHa4OyL4Rb7VuPkQIp9IofMK6Ms4
         N9Wm2aXvVBHje2UhFReDM07i62ehx5ejXBB+yzAMOA3jJ8v2I7XuRmuUIelcxR/XaU+Z
         KAeBcfDdfxgIbcw7JZNHAY1Hk6+iwnCiCi6sObw+pofFIwzqNYTIYEbv0wQ+ve6G/snE
         1jcVCeGXhSkNz2K7mnVKuowwPEVgfeVTFnSnw+6gziCZQOQPE4YW//gdS1odBFT3ZIGZ
         +tWA==
X-Forwarded-Encrypted: i=1; AKwUvBzcmtPM88i59DUbk0RQs/rF7T4kJd8m7Ijl5CPH/BFM3Oo+najbN0m8wbaSW6IkVg+3DahazwNg4F/sP5E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJv2r0hyCf2IfVLTcEEs3X+3urK2AlqXyc9MI8+y/uyLo6GsFnU
	ayRNo1D3G6Uu3+vEia941EqmJPnkKGI18QuOR093OaHi+JuCmmXdoLWyoizTMFL14ca9UG9VpXi
	VfboZ4KRBDCaQoX3PCL8a2n+04nba6xTQFdBF
X-Gm-Gg: AYBFou26i3+60/U6p+R085A/F0e/rNffsKweRDinK33Ids/93o90ul7zZSVjtfEaEFd
	VqNf4cjb1ubHwN2vrab1ZeMONybHWPxVn1SDFufOs4vvPfYNyUgQ40S/0KxHrD0Ezwp3zqxCwsd
	DeANa7RkUHNqRZ3eauGwHmDoO0RxBTpxcCSecnXna236kHdBcERoHRR3GxXVd5QiNeEfxNSo4+c
	92Twp7vZK+KggtqAQJhrKvXTCBQ5jCo8UwMd2F91spZEMKVIapJX+ka5zexwRHqYxXvmZMNrBUW
	8KBD9zjAQmBIjuiKZbbVZy50/pxw0oybIvi0gwuCK0KtNQme3nOy6bKPkBO/lFLGlQblrxZ1Yj+
	9+hKHuvGeLhuZe2pqTX/20Q==
X-Received: by 2002:a05:6820:4c14:b0:6c8:fb02:527e with SMTP id
 006d021491bc7-6ef102aa365mr12469082eaf.39.1792006113871; Wed, 14 Oct 2026
 12:28:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAZOf26EfiOrr1Y5pnfCsP49+jLc4dRAW-CgrosUKh+g=5eG7Q@mail.gmail.com>
In-Reply-To: <CAAZOf26EfiOrr1Y5pnfCsP49+jLc4dRAW-CgrosUKh+g=5eG7Q@mail.gmail.com>
From: David Kahurani <k.kahurani@gmail.com>
Date: Wed, 14 Oct 2026 22:29:53 +0300
X-Gm-Features: AclHuK-gJkgeqNJav0HRFqlI1h9gIRn_DJ4uBm5fTL1jyJVN2Ghw3MmSVPDcPJw
Message-ID: <CAAZOf273Qh37o3wLbymYkHm3gX5nKbqvBst=26zBxi8iHE8_9A@mail.gmail.com>
Subject: Re: Comments?
To: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	paulmck@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This would be decent and wouldn't hurt AI usage in anyway

On Wed, Oct 14, 2026 at 10:00=E2=80=AFPM David Kahurani <k.kahurani@gmail.c=
om> wrote:
>
> Yeah, comment available, from me. Thanks for asking!
>
> "...So I've shown this series to people in private and talked about it at
> the kernel maintainer summit, so some of you have seen earlier
> versions of this already.
>
> This was triggered by several attempts at improving on the scalability
> of page ref handling over the last couple of years, particularly for
> the common case of normal [p]read() system calls. Willy reported real
> users having scalability issues in that area a couple of years ago in
> a discussion about buffereed IO scalability limits:
>
>   https://lore.kernel.org/all/Zds8T9O4AYAmdS9d@casper.infra...
>
> and I had a very rough first draft in that discussion:
>
>   https://lore.kernel.org/all/CAHk-=3DwjOogaW0yLoUqQ0WfQ=3DetPA...
>
> and it was broken but close enough to working that I kept using it
> locally in my own use for a year and a half:
>
>   https://lore.kernel.org/all/CAHk-=3Dwj00-nGmXEkxY=3D-=3DZ_qP6ki...
>
> until people pointed out just how broken it was.
>
> Then Kiryl had a slightly fixed-up version of that approach almost
> exactly a year ago:
>
>   https://lore.kernel.org/all/20251017141536.577466-1-kiril...
>
> but that too had problems.
>
> After that, Ilya Gladyshev stepped into the ring with a very different
> approach to it, which is now up to version 6:
>
>   https://lore.kernel.org/all/cover.1789239015.git.ilya.gla...
>
> and still has some outstanding known fundamental issues.
>
> So for the kernel maintainer summit this year, where one of the big
> topics was going to be LLM use in kernel development, I decided that
> hey, I will try to actually *solve* this thing using an LLM to help
> with the issues these things have had.
>
> [ I also did another series for a problem with the assoc-array
> library. I'll post that separately - that was a lot more pedestrian
> "just clean up the code in order to fix a bug" kind of case - not at
> all as interesting, but a fallback in case this more interesting
> problem were to not pan out. ]
>
> Anyway, the end result is in my kernel tree in the 'rcu-free-v3'
> branch in my public git tree. My 'v2' never saw the light of day
> because I kept cleaning it up, but an earlier version with some more
> background is available under the name 'noref-filemap-read-with-llm'
> and has an empty commit with more commentary and background at the
> top. I didn't do that cover-letter for this v3 version, and it talks
> about some issues that already got resolved (and others that I don't
> think are actual real problems, but should be discussed).
>
> The fairly short series of ten patches basically enhances folio lookup
> by noticing when folios are hot, and setting a "delay relasing this
> folio until after a RCU period", and then using that RCU delay it does
> not just the folio lookup itself under RCU (which we've done forever),
> but also the actual folio data accesses themselves under RCU. No
> refcount taking needed for the fastpath where we can just read the
> data from the folio entirely in an RCU-protected region when the user
> copy doesn't cause page faults.
>
> Unlike my original approach - because it now actually delays the
> freeing of the underlying folio data - there's no need for any double
> buffering, and a lot of the original limitations of my original patch
> go away too. That improves performance quite a lot. And by "quite a
> lot"  I mean "I see a 23x performance increase on my Ryzen
> threadripper". Admittedly that is a very artificial case of reading
> the same small part of a page over and over in a threaded loop on all
> CPUs, so any real life impact will be much much less.
>
> Anyway, I wasn't planning on posting the individual patches, I think
> we all use git by now and probably find it easier than fetching
> patches from the list. So it's all at
>
>     git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux rcu-free=
-v3
>
> and the commit messages are a bit more verbose than I would have done
> it myself without tool use, but maybe it's better that way.
>
> The showcase number is in the "mm/filemap: read from the page cache
> without folio references" commit:
>
>                                reads/s     cycles    instructions
>                                           per read     per read
>    ...
>   64 threads,           before   13.3 M  19857-19939   1094-1101
>   64 threads,           after    304 M     735-736        959
>
> ie the number of reads per second had plateaued at 13.3M due to the
> cacheline contention on the folio reference count (and the cycles per
> read had ballooned up to 20k).
>
> And with that scalability limiter gone, it zooms up to 304M.
>
> And again - that's not a real number in the sense that no real load
> will ever see it, but the takeaway is that it basically scales
> perfectly with no writes to shared cachelines. And honestly, the
> patches don't look bad, and it's possible that other cases might find
> use for this RCU-delayed page freeing..."
>
> Comments?
>
>                 Linus
>
> Can we mark everything as RFC until it's provably tested? Especially
> if it comes from AI / AI assisted?
