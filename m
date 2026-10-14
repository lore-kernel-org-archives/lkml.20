Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7553531327F
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792004328; cv=pass; b=A8ahIXIPqciPDUYy72BmmfzqRbzU1qcnkR84oOfKgbPNUiCNwuxU9lqSWfKZY9XY9qe7cr1uZoSZGUbjQKm8PqRdI2OmdsOio0SWrfpUNmA1DnTSYsYa8MzwuZGhANj7tZoLFEBr0ZK5k9NoKpU1qc2iAnzlFcwy54ruFyo88Mg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792004328; c=relaxed/simple;
	bh=oQGi52Zv+Rg61x52cly5GAX57DRoOmDyMaccDzINtwA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=TYpMftDDozC2UWvPpF3R6pIgQDmMu1+RCO1KT31EMw9OYDByC2QVj9zFMuCOpebVeU3XeU1DhwsRXzdYsRNBsLQ4fMpaEnBSzY4PzNL4VSpKkwsMQLhWQ6qvzcaUJJSUrzSFJSd6d5QSh2KeksxqO5nfXpkrJeVsa/s+dBqcKG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5tOa1Nf; arc=pass smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5tOa1Nf"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6f74f6b46abso1830265eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:58:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792004325; cv=none;
        d=google.com; s=arc-20260327;
        b=qFWaP/g83xev3HwOTpzdeolJG9GOZ7LbOE4Bf/6zO8jJo5sC0OM6ShobRhahe2fW10
         2Gd4quXZdmWHcB/B17JY15+H3xZqBZSg3kNkng8jQG9sMhgmDVnW8Lpp1RuWvtJqvZKX
         eF74B8XAk6xP9394D8KaPYId3kHjR+3qk2h+0nFA0OSAuUfkxbDQ4kz9jD05WfGMxM3P
         FSIyr4yW+X7Kv6wk8yb3blJlyh8XqxDY1rXUJetXn1221enfAC+4UJj6Erw9hoNQyrac
         FbLZlv5YkXoBp8VvWLSZbqM0ANFNwQAFzGyqFt1bYTgx9hrWXgp8dZfPp/ZsYRNPbMx2
         S69w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=qQYADrrRaAWJPqLNgvfLhamZdgRFbtqBg1GoIOOyW+8=;
        fh=iZljdwEtkx1TrPaPi9mFGGZ6U7wLUb3nyfjJoGIsFcY=;
        b=SRFUzqMOj9LLL+bs7961qhhytO5KpDJ/+NXVnenVVIqepwQoQEj7EHcpdXSQHxrvLS
         koMZtBaKVDSrVJ5mZdMSCmR7iOy96WhuCfggPk/lxvHkjkfn8+bfNTRqDJX6c+wU3hp2
         emywGVcaeuJpgY2gj0AVx7tMYGKtZaCBb52b3kR7RLqYUNeJjmrnjcTM1yBzJbH9Eyxn
         nKeiUmgbnAwU5+QHReG/jn7JXuScyanSUUqBjlrtz3fb91XhixhFV0SOpZG1PwIEowf0
         eENEmhgiLx3I0x8ny3hCBv3JsezgWt/bBWzg1hJWyuvTH604zOqWKDyJ16qNMHeod+pL
         sHZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792004325; x=1792609125; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qQYADrrRaAWJPqLNgvfLhamZdgRFbtqBg1GoIOOyW+8=;
        b=S5tOa1NfsyS+t7Rj4sGa7biH/c3u15VBc65cvuVOWS5X7Ppxd4BvfDjpFLwf/KrG8/
         buC53tci2bwbCKPEry/spa9L0T5SnBintGeFgL4mHSp+bbyW19kZWR7hZXBf1P0edOjY
         o0aP563eShjsYyhNXkJNjC4NWNXSy/dEyt9/HUv4O83P2RDtYstRshmoPJ9JErVrGiav
         I1RibEpePzicxycEncuYu8m3cTQDVnsgXlb04Fe1IeeaYZYUlI1IaIZtS296SL8FCYqj
         70ZHpIj2Z8U4Y6/lpwbrKZQHEqIHi1o2dcf220PHWFuSPlZKa98cZEZ0893RfsZty4DF
         IKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792004325; x=1792609125;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qQYADrrRaAWJPqLNgvfLhamZdgRFbtqBg1GoIOOyW+8=;
        b=Iy3u2Y3pGAJUZo2YudxzyPCQd6w3YjSRZl8Jr2vDxbzCP7AOBtBV1JIK758pIbIt6e
         bb0F5Kjok8GBHekYzHSpr0GtR9nE1H4YRRCPwPjVzu3qpDju1+EPz6pvLm8tyfiDVDq5
         onSP0W4WQAG4cR+1nRLbviamZ+NNLpZ3iZqZhraNqEzbaT89qSlqGuBy+IKhEncWZUF5
         V0qmzioMzqP92NwyEyy/Zv0949ojUzrUGDBiZPfnEeZMZLw7/F8u4hZMJ0yotPLHB7Um
         0qKZEdeCqDjkHtMhLeVfC0ATQumxkI7t5eKQJzD9W+YRGB0Pj+bkc2dzpqM0J6BZw7Yu
         vAmg==
X-Forwarded-Encrypted: i=1; AKwUvBx1yEinIMQg4egFf+us/Fz1GxUGCEhNEfyFMLQ7HdFV1PiH1Us5ymtVGAF+qYQyYRqQLP0EKYPEz7vEa+k=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8af52vkCBAl743gtpF4XKnbDv/B0hPh4JUp3OzP1KFNn92nTu
	E2vERloOpmRDdzGUS/I8y9Ehwl1+AP6empcchizgZICWcW/4XXLRt6e3U3tJdUJZFEfRBNKhILc
	ud5+aWx2umckB1cwIGjdl0KmT0VW+H89h5aoZhVw=
X-Gm-Gg: AYBFou2taOml8x57BeAvDmnILoQqHxqu86GCKAx4l4b5NhbEms+78oE6W8DTIOcuOyd
	kwWv/14l+zx8AKrOqMw2vit4YEdT9ERR5fYNOMSeiRBBDczDjcT9XKoGl44Sc5mwOid7OmsYRvc
	xi/OsWiu60LOCzSvs6LZuOUpl1srHMqfo7D3imKDMI6VRxNN+kuaUDJVn+QpmZ0JqF8Dpzf5t7T
	l9OKp9t7dK71Tq4SLpUCJrsUFOKiNpsCg+jL0mzlblK8e3LRdc1kkBttiQ+nKKyi9MvEI7fLL5K
	18GGrmCJA6gjvUmeJouANpD4Oem4oePuQ6vp6S/d4KyQyjAkLvQGtZQuxFiqGCSV0FRAQf9Z6C6
	3uwT5LMnb9wI=
X-Received: by 2002:a05:6820:198d:b0:6df:cd30:fe7a with SMTP id
 006d021491bc7-6ef10e74d79mr12271268eaf.79.1792004325244; Wed, 14 Oct 2026
 11:58:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: David Kahurani <k.kahurani@gmail.com>
Date: Wed, 14 Oct 2026 22:00:04 +0300
X-Gm-Features: AclHuK9GZwR9je4XtXlIpYdRJKoe9w5rm5gI5FZiieQaa-ys70m4mpv8uYrxGKQ
Message-ID: <CAAZOf26EfiOrr1Y5pnfCsP49+jLc4dRAW-CgrosUKh+g=5eG7Q@mail.gmail.com>
Subject: Comments?
To: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	paulmck@kernel.org
Content-Type: text/plain; charset="UTF-8"

Yeah, comment available, from me. Thanks for asking!

"...So I've shown this series to people in private and talked about it at
the kernel maintainer summit, so some of you have seen earlier
versions of this already.

This was triggered by several attempts at improving on the scalability
of page ref handling over the last couple of years, particularly for
the common case of normal [p]read() system calls. Willy reported real
users having scalability issues in that area a couple of years ago in
a discussion about buffereed IO scalability limits:

  https://lore.kernel.org/all/Zds8T9O4AYAmdS9d@casper.infra...

and I had a very rough first draft in that discussion:

  https://lore.kernel.org/all/CAHk-=wjOogaW0yLoUqQ0WfQ=etPA...

and it was broken but close enough to working that I kept using it
locally in my own use for a year and a half:

  https://lore.kernel.org/all/CAHk-=wj00-nGmXEkxY=-=Z_qP6ki...

until people pointed out just how broken it was.

Then Kiryl had a slightly fixed-up version of that approach almost
exactly a year ago:

  https://lore.kernel.org/all/20251017141536.577466-1-kiril...

but that too had problems.

After that, Ilya Gladyshev stepped into the ring with a very different
approach to it, which is now up to version 6:

  https://lore.kernel.org/all/cover.1789239015.git.ilya.gla...

and still has some outstanding known fundamental issues.

So for the kernel maintainer summit this year, where one of the big
topics was going to be LLM use in kernel development, I decided that
hey, I will try to actually *solve* this thing using an LLM to help
with the issues these things have had.

[ I also did another series for a problem with the assoc-array
library. I'll post that separately - that was a lot more pedestrian
"just clean up the code in order to fix a bug" kind of case - not at
all as interesting, but a fallback in case this more interesting
problem were to not pan out. ]

Anyway, the end result is in my kernel tree in the 'rcu-free-v3'
branch in my public git tree. My 'v2' never saw the light of day
because I kept cleaning it up, but an earlier version with some more
background is available under the name 'noref-filemap-read-with-llm'
and has an empty commit with more commentary and background at the
top. I didn't do that cover-letter for this v3 version, and it talks
about some issues that already got resolved (and others that I don't
think are actual real problems, but should be discussed).

The fairly short series of ten patches basically enhances folio lookup
by noticing when folios are hot, and setting a "delay relasing this
folio until after a RCU period", and then using that RCU delay it does
not just the folio lookup itself under RCU (which we've done forever),
but also the actual folio data accesses themselves under RCU. No
refcount taking needed for the fastpath where we can just read the
data from the folio entirely in an RCU-protected region when the user
copy doesn't cause page faults.

Unlike my original approach - because it now actually delays the
freeing of the underlying folio data - there's no need for any double
buffering, and a lot of the original limitations of my original patch
go away too. That improves performance quite a lot. And by "quite a
lot"  I mean "I see a 23x performance increase on my Ryzen
threadripper". Admittedly that is a very artificial case of reading
the same small part of a page over and over in a threaded loop on all
CPUs, so any real life impact will be much much less.

Anyway, I wasn't planning on posting the individual patches, I think
we all use git by now and probably find it easier than fetching
patches from the list. So it's all at

    git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux rcu-free-v3

and the commit messages are a bit more verbose than I would have done
it myself without tool use, but maybe it's better that way.

The showcase number is in the "mm/filemap: read from the page cache
without folio references" commit:

                               reads/s     cycles    instructions
                                          per read     per read
   ...
  64 threads,           before   13.3 M  19857-19939   1094-1101
  64 threads,           after    304 M     735-736        959

ie the number of reads per second had plateaued at 13.3M due to the
cacheline contention on the folio reference count (and the cycles per
read had ballooned up to 20k).

And with that scalability limiter gone, it zooms up to 304M.

And again - that's not a real number in the sense that no real load
will ever see it, but the takeaway is that it basically scales
perfectly with no writes to shared cachelines. And honestly, the
patches don't look bad, and it's possible that other cases might find
use for this RCU-delayed page freeing..."

Comments?

                Linus

Can we mark everything as RFC until it's provably tested? Especially
if it comes from AI / AI assisted?
