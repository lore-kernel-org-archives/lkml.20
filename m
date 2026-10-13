Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20D04A9D7D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917016; cv=none; b=Brn85173NVaCfxkgTh2pjLVOH3glh/SSGisPYK/NOdeqYChYgEERuXqYpoH0o58EJ+Ec3u9Mt87Jz2XsehT2wEavNBAmU8UohtLrQHlZheDwEjRaneOZ7Gy+rDnNzPikhxHu+FLXKv7OpeQAktmVWdzT2GQseDu3U1ZjBSKWeaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917016; c=relaxed/simple;
	bh=z+0gw9QL/Jn1fgkf2WT1uo/7+2PsXU+OghMmJHAIYTs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=n6uVZpykYYnh8LGfD15PI3Hdow1F3m8aAJ5kxtv9KHk4qC2GGoRjLpc1p47ZIUUQJqEvNPIxaBYS8/rz04C3e8TeBi3yPMwGdnKEtDw5Vf9cchzS4fgF6Qompjh5a5XPwbRkHHzR/aQ2kIFMe/QhvrDaeGNPidx0k7W/Lc+4Ry0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=drUyyMXt; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="drUyyMXt"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2e4df2e26fso443628866b.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1791917012; x=1792521812; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FyhhS++ZDZ4710D8q9ospxwrx6gZ9CGyXuRa92NSCGw=;
        b=drUyyMXt2CjdEFk/PLNpiLq2ZOUwA83fCn/kryWnnn1fp02M/ZTnEZjGKkWSHWJDmD
         nYaypS6g6XZcs/15aLBXq5KMUf01mjxr+b612hNg8d39oOIQsr36UmqwNyprEA9Ld5+2
         RXvsXJmhyb9UXl+UmPIZ1pKwQfm63ZNbshnDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791917012; x=1792521812;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FyhhS++ZDZ4710D8q9ospxwrx6gZ9CGyXuRa92NSCGw=;
        b=rUegElcjSW+d3G5NCaIYmdC4IbFVqPREADlGJox9Bl3w9O18uuEz9gTkZqClfMbF9b
         swyuCzkOQD067Oq7HVM8S+W3xCTjP+9V16V6chfdQeyyW6QXeoPCtkyoFASBPAuPNFgD
         LIaBmPWDmqNZfr+Vre3OdCDosyypx8I8rCGRg1/hBepMestQLTLEDSeF413oQs19xXDH
         0It9gikU5pkfAKo9sxhy2P0/yVWldxOtx98iGf6ZGKz3039T2J99YhtRorKWnPz50p1K
         S4ABAwpyQ4JdLz6ySB45BjOU0hI+N2tAsI2ps4+gAIjDuhtpAzehWLWV6Xf0Hw94iBLJ
         GuAw==
X-Gm-Message-State: AFq9FYI21gXsGl8PzNczs+L5Yqb5BJ1wZ6z81C7YMIfpjKLKubu02LFy
	Fvs9iAoeB8fd/uK1JqlApJRH0dEztsPeOVIUJVo64dlNNIx3Avt121wK+eQ60BBpuf6oVRkSNqZ
	lb1N2xYQ=
X-Gm-Gg: AYBFou2zalbQs6bCbl0HLcazH8GB2vlrxuXdQZgWhX3aGwsPFG1oZrR7nrhG97Ot3dV
	Ik44A4jh3ilF0uPIi3T1JbtEDFwP9YbNHYAEGwA7jnKbN+pX9vu874PKn7zzPlbBEClYtptR3b1
	uWdufd5amwpbCnXplyaJ7CK+8G/oFi7WIWhaAtIeEHxO7ULDwhT3vbuRvKXD1UPV3e+/PBvNu/E
	i+fhp89rJn7K1Q3xsL+za0itw0JsoIAX9yC2WG5bBoq3NQ250ZV7B19BW6/CKLKItoUidCo3cX0
	ZiRPeGyc8Ndn9DRoKLE5jrOCNit46QdxnRxe5Il2zuwUBb6i9ip0Tq1ldROfkh2jIPuGKHKQIbi
	5G4emiJeyNPkYGTSclwYohzEJ5YXf+dMV7qGMlRaoM5hBJjFgnQ4NTyw60jVH/5SAI+wS453xmU
	QFsGBaZwrS+3qppLqbIVrQSseQBDrjhNVmoqP2jq1ij9CX7CSSoubfWYBXpVmGDro3qGxdJSuC2
	NVg91vBSy7eBRA4uYknYc3B3OAlGgfdePrQN1DJ+VvOR3tP
X-Received: by 2002:a17:906:7947:b0:c2d:c739:30e1 with SMTP id a640c23a62f3a-c31a9f8d670mr1299228166b.32.1791917011638;
        Tue, 13 Oct 2026 11:43:31 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c32af0a00b4sm480888966b.53.2026.10.13.11.43.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 11:43:31 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2e4df2e26fso443626166b.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:43:31 -0700 (PDT)
X-Received: by 2002:a17:907:9447:b0:c2e:3307:b922 with SMTP id
 a640c23a62f3a-c31a9d569c2mr1372708566b.28.1791917010978; Tue, 13 Oct 2026
 11:43:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 13 Oct 2026 11:43:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjLjgfwgSZ1RDk4YdNFcV0ntosMO5AmBoHD76Zb3HFY7Q@mail.gmail.com>
X-Gm-Features: AclHuK984DPKXU2i8Zcxsi7Djqyw0wlLXBmXlyYPPwMugYSu0i2ce2acTA9g9MI
Message-ID: <CAHk-=wjLjgfwgSZ1RDk4YdNFcV0ntosMO5AmBoHD76Zb3HFY7Q@mail.gmail.com>
Subject: Improve page refcount scalability
To: David Hildenbrand <david@kernel.org>, Kiryl Shutsemau <kirill@shutemov.name>, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"

So I've shown this series to people in private and talked about it at
the kernel maintainer summit, so some of you have seen earlier
versions of this already.

This was triggered by several attempts at improving on the scalability
of page ref handling over the last couple of years, particularly for
the common case of normal [p]read() system calls. Willy reported real
users having scalability issues in that area a couple of years ago in
a discussion about buffereed IO scalability limits:

  https://lore.kernel.org/all/Zds8T9O4AYAmdS9d@casper.infradead.org/

and I had a very rough first draft in that discussion:

  https://lore.kernel.org/all/CAHk-=wjOogaW0yLoUqQ0WfQ=etPA4cOFLy56VYCnHVU_DOMLrg@mail.gmail.com/

and it was broken but close enough to working that I kept using it
locally in my own use for a year and a half:

  https://lore.kernel.org/all/CAHk-=wj00-nGmXEkxY=-=Z_qP6kiGUziSFvxHJ9N-cLWry5zpA@mail.gmail.com/

until people pointed out just how broken it was.

Then Kiryl had a slightly fixed-up version of that approach almost
exactly a year ago:

  https://lore.kernel.org/all/20251017141536.577466-1-kirill@shutemov.name/

but that too had problems.

After that, Ilya Gladyshev stepped into the ring with a very different
approach to it, which is now up to version 6:

  https://lore.kernel.org/all/cover.1789239015.git.ilya.gladyshev@linux.dev/

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
use for this RCU-delayed page freeing.

Comments?

                Linus
