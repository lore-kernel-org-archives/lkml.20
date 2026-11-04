Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829195;
	b=t8UKWncfBCuRi/MhVruLiH4EWSNcNva1EYrnlBE6WdH8o9qOleNu1M/Sd3Q4EKz10pge
	 fINFkF2aSTciYhv7kCYorMivbIO4oM7j0Iiv9zTaQ6ZHhL+uc4NupcusWF82pAk91u/o6
	 XbyCq25gdbEnTYssd1aC2SySXdXVjDpJ0+COK0DNw8CBhDj8+OqEshLVBQNZZttKRmhzi
	 +Fbb7+Vrw+Rwbus7VM6sMIcTrbUE4vyLY2cbcg9Xc33IOmyuAWCU5ZhRlVFAEBtHepBM0
	 LuXUcQAfX1t/7Z0zzBvQVuUbmGOIZcxTydybZ+f08HGzDTh68wpHRnl10R2HQBllnyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829195;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dXhZP77Jedhgmh+dWAEC7Sdp0jRlMNTtA9C+vIq2qKk=;
	b=vJGWW5e5Iw6/haVIrrkR9+u6n6U2vSaPysMaOSSd0IRK7ACUIIvPvhNamt0xSjCmTPkn
	 tC5CPmKS3O0jQNO7sMBCMAG+JJiAhI5a/vbPp80ra4OOHi7W72v+tKBJsBZqrXEkuXof7
	 Xz8OqQIQJC1/wC8xkzWWDyJT+slXRmWo5CnqC3n13lHPN2ivhPsCYN/8kArb+Iq+oYcZL
	 hwq0tN1y+Abp1HP9s8qwKUxMCw+5KmII5Wi+k28MtN4X2dS85Qne9sYIFQ1ZMYY2A1Rz7
	 GjmT5AubsltQn2kVsspSj8t2hstMBYC2uEo+DEt4Ep8yKJfPqPvrjMMHEy02Z3jpIsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CNrR6Ix7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8977606D83C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CNrR6Ix7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9975A1F00A1A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793829194;
	bh=dXhZP77Jedhgmh+dWAEC7Sdp0jRlMNTtA9C+vIq2qKk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CNrR6Ix7wlD5iLKxN3Z8zTQhCt9Zp8e6xd6x6nEqnwCKBg4eSnPPpx/JWe0rYD0Qw
	 BzsY2eEaIin/b+CbeGCK9lf6QcrAn0ofCPaRHBrxkpfbvNR5kFC9JyaZr1ac2gIeoN
	 HmpnXlTWeppbhZBIGFtntBO8as/fPBw9fQbb8MnsEaZ+H9CEoB4/mQKzvZErE8iIOV
	 r9+jc1gNeR+TBJc79Qq0jEEuYbokzeybjh247r++eEJJvTvkkXdBaF0PVnRuvZmcVp
	 pwqmiHyBguLONcX14bwkPGhid1pggD5il6BUQUfFwmeBOFigY65+4Mtx/U8JIvRybz
	 4ZA97ByiiGsVw==
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93cb9e9405fso70104885a.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:53:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwGLqNrWiTEm6eiK/aA1MiShdU+dfrhyH5Owr9WEN8gefmoNe2UGMD3aJT+GVERaNuEOjIOileK+A/6imM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uuW+/DG2SZ2SUw8JN8pR5wdqwpuIBb4MkLgm4GAGlrkmy5PMk
	SPT/Z7+z49aBVY+FvxxcAThh51irz6kJuFN5CSSDVf8bfJi/24GE3iX+vR7Aoseqz9TmuVxHQ4R
	8WhK1YHcLtPGWIcNjJKeOZ4dHYZujy9s=
X-Received: by 2002:a05:620a:4555:b0:943:f301:49b9 with SMTP id
 af79cd13be357-94421738a60mr2860432285a.53.1793829193621; Wed, 04 Nov 2026
 13:53:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022220203.91911-1-baohua@kernel.org> <CAMgjq7C6htO2bp21Bq-dU2feN2tXuxHaqgNcG5sD=u1bwbEuYQ@mail.gmail.com>
In-Reply-To: <CAMgjq7C6htO2bp21Bq-dU2feN2tXuxHaqgNcG5sD=u1bwbEuYQ@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Thu, 5 Nov 2026 05:53:00 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xp=B+oJCZCP0V=OCKhcWzru+VuL4G=rA2VnA7Ah++aVg@mail.gmail.com>
X-Gm-Features: AclHuK_6pK_SD1WSi63iVUPMSwF_6r0P_xsPznQpqb35-KPgBQKMXG_bepb5-Dk
Message-ID: <CAGsJ_4xp=B+oJCZCP0V=OCKhcWzru+VuL4G=rA2VnA7Ah++aVg@mail.gmail.com>
Subject: Re: [RFC PATCH v5 00/14] mm: mglru: fix swappiness behavior
To: Kairui Song <ryncsn@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, hui.zhu@linux.dev, 
	axelrasmussen@google.com, baolin.wang@linux.alibaba.com, david@kernel.org, 
	hannes@cmpxchg.org, linux-kernel@vger.kernel.org, ljs@kernel.org, 
	mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	weixugc@google.com, yuanchu@google.com, zhuhui@kylinos.cn, 
	baoquan.he@linux.dev, liuxiang.277@bytedance.com, wangzicheng@honor.com, 
	lianux.mm@gmail.com, liam@infradead.org, surenb@google.com, mhocko@suse.com, 
	rppt@kernel.org, zhangbo56@xiaomi.com, lyugaofei@xiaomi.com, 
	ridong.chen@linux.dev, kunwu.chan@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 12:10=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wro=
te:
>
> On Fri, Oct 23, 2026 at 6:02=E2=80=AFAM Barry Song (Xiaomi) <baohua@kerne=
l.org> wrote:
> >
> > Classic LRU respects swappiness, while MGLRU only partially honors it
> > when selecting the scan type, resulting in a much smaller overall
> > impact.
> >
> > For example, when building the kernel in a memcg limited to 1024 MB
> > of memory, with swappiness=3D200, CLRU barely scans or reclaims file
> > pages, while MGLRU still reclaims a significant number of them.
> > Similarly, with swappiness=3D1, MGLRU does not reclaim as many file
> > pages as expected for such an extreme swappiness value:
> >
> > pgsteal_file
> > swappiness   CLRU          MGLRU(no patches)
> > 1            5,894,538     756,589
> > 36           799,998       497,282
> > 71           548,331       415,612
> > 106          407,012       383,814
> > 141          253,737       354,249
> > 176          189,003       347,805
> > 200          0             346,078
> >
> > pgsteal_anon
> > swappiness   CLRU          MGLRU(no patches)
> > 1            3,962,404     2,768,654
> > 36           2,830,250     2,976,260
> > 71           3,121,386     3,142,954
> > 106          3,521,720     3,382,383
> > 141          3,504,471     2,970,859
> > 176          3,592,335     3,163,130
> > 200          14,095,617    3,209,132
> >
> > pgscan_file
> > swappiness   CLRU          MGLRU(no patches)
> > 1            10,270,808    886,997
> > 36           1,010,341     569,036
> > 71           656,136       490,972
> > 106          460,326       436,042
> > 141          295,184       403,132
> > 176          235,147       390,358
> > 200          0             398,363
> >
> > pgscan_anon
> > swappiness   CLRU          MGLRU(no patches)
> > 1            19,341,957    5,960,884
> > 36           17,530,774    6,394,951
> > 71           18,624,264    6,673,569
> > 106          20,088,558    6,976,364
> > 141          19,686,813    6,206,580
> > 176          20,936,177    6,344,854
> > 200          45,313,873    6,295,581
> >
> > refault_file
> > swappiness   CLRU          MGLRU(no patches)
> > 1            5,795,115     678,254
> > 36           720,877       419,659
> > 71           469,270       338,518
> > 106          331,584       308,983
> > 141          174,509       277,375
> > 176          113,352       272,390
> > 200          0             269,349
> >
> > refault_anon
> > swappiness   CLRU          MGLRU(no patches)
> > 1            738,618       578,308
> > 36           451,410       665,723
> > 71           514,961       657,870
> > 106          633,161       786,893
> > 141          648,640       662,673
> > 176          668,779       708,969
> > 200          4,816,312     672,514
>
> Hi Barry,
>
> Thanks for pushing this series forward!
>
> One nit pick so far is the test data seems redundant with the one
> below, maybe we can just keep one of them.

make sense to me.

>
> > This model also allows scanning and reclaiming from the two youngest
> > generations, including the youngest generation itself. This can help
> > resolve OOM situations[1] and reduce the need for aging.
>
> Right, the OOM reproducer is demostrated here previously:
> https://lore.kernel.org/all/20260318-mglru-reclaim-v1-0-2c46f9eb0508@tenc=
ent.com/
>
> That series is merged at V7:
> https://lore.kernel.org/linux-mm/20260428-mglru-reclaim-v7-0-02fabb92dc43=
@tencent.com/
>
> The problem is largely eased as described, but it isn't 100% fixed at
> that time. It will still go OOM with higher pressure. So before this
> series, I could still see OOM after hundreds of loops. And problem is
> gone after the fixing patch in this series. Unfortunately it's very
> hard to reproduce and that reproducer is the best I have so far.
>

thanks! I will put this into cover-letter in the new version.

> >
> > Patch 9 from Barry fixes a cold/hot inversion exacerbated by patches
> > 1=E2=80=938 (which also exists in mainline) and improves reclaim effici=
ency.
> >
> > Patches 10-13 from Gaofei and Barry optimize aging based on folio
> > distribution imbalance and improve reclaim behavior at extreme
> > swappiness values such as 1 and 200.
> >
> > Patch 14 from Bo Zhang addresses the GFP_NOIO issue in MGLRU.
> >
> > After the patchset, the results track CLRU across the full swappiness
> > range (see table below), with more file scanning at low swappiness
> > and more anon scanning at high swappiness.
> >
> > pgsteal_file
> > swappiness   CLRU          MGLRU         MGLRU+patches
> > 1            5,894,538     756,589       7,394,183
> > 36           799,998       497,282       526,176
> > 71           548,331       415,612       433,353
> > 106          407,012       383,814       347,647
> > 141          253,737       354,249       314,437
> > 176          189,003       347,805       261,677
> > 200          0             346,078       188
> >
> > pgsteal_anon
> > swappiness   CLRU          MGLRU         MGLRU+patches
> > 1            3,962,404     2,768,654     5,362,153
> > 36           2,830,250     2,976,260     2,736,749
> > 71           3,121,386     3,142,954     3,246,589
> > 106          3,521,720     3,382,383     3,074,851
> > 141          3,504,471     2,970,859     3,178,409
> > 176          3,592,335     3,163,130     3,650,544
> > 200          14,095,617    3,209,132     14,538,399
> >
> > pgscan_file
> > swappiness   CLRU          MGLRU         MGLRU+patches
> > 1            10,270,808    886,997       16,246,260
> > 36           1,010,341     569,036       614,389
> > 71           656,136       490,972       484,769
> > 106          460,326       436,042       367,969
> > 141          295,184       403,132       328,943
> > 176          235,147       390,358       268,142
> > 200          0             398,363       188
> >
> > pgscan_anon
> > swappiness   CLRU          MGLRU         MGLRU+patches
> > 1            19,341,957    5,960,884     7,646,122
> > 36           17,530,774    6,394,951     5,914,405
> > 71           18,624,264    6,673,569     7,167,762
> > 106          20,088,558    6,976,364     7,821,921
> > 141          19,686,813    6,206,580     8,495,970
> > 176          20,936,177    6,344,854     10,585,375
> > 200          45,313,873    6,295,581     30,313,342
> >
> > refault_file
> > swappiness   CLRU          MGLRU         MGLRU+patches
> > 1            5,795,115     678,254       7,315,064
> > 36           720,877       419,659       448,199
> > 71           469,270       338,518       355,269
> > 106          331,584       308,983       270,736
> > 141          174,509       277,375       237,643
> > 176          113,352       272,390       184,908
> > 200          0             269,349       102
> >
> > refault_anon
> > swappiness   CLRU          MGLRU         MGLRU+patches
> > 1            738,618       578,308       1,383,725
> > 36           451,410       665,723       543,071
> > 71           514,961       657,870       683,874
> > 106          633,161       786,893       669,716
> > 141          648,640       662,673       719,231
> > 176          668,779       708,969       901,918
> > 200          4,816,312     672,514       5,511,787
>
> Right, that's really nice result. Do you have system time or
> performance readings? BTW for the performance reading I think we can
> focus on the 36 - 176 range. If a user asks for extreme bias towards
> anon/file, they strongly favor reclaim priority over throughput, and
> the behavior is arguable at that point.

I think the changes are really minor with the default or
moderate swappiness of around 60, probably just within
the noise of measurement.

With higher swappiness values (>140), I do see an increase
in system time. However, I think this is expected behaviour
as swappiness starts to take effect: we're swapping out and
swapping in more.

real (seconds)
swappiness   MGLRU(no patches)   MGLRU(with patches)
1            110.1               159.2
36           108.8               109.2
71           109.2               109.7
106          109.4               109.2
141          108.4               108.7
176          109.2               109.4
200          108.9               122.8

user (seconds)
swappiness   MGLRU(no patches)   MGLRU(with patches)
1            1519.3              1496.0
36           1531.4              1526.9
71           1530.6              1532.3
106          1533.4              1533.5
141          1536.2              1536.1
176          1530.9              1541.2
200          1536.1              1563.4

sys (seconds)
swappiness   MGLRU(no patches)   MGLRU(with patches)
1            218.3               392.7
36           222.8               216.8
71           221.3               225.3
106          227.0               225.6
141          219.8               231.1
176          221.8               245.1
200          221.1               496.6

As for CLRU, this is also the case:

*** Executing round 1 ***
set swappiness to 36
real 1m50.203s
user 25m23.168s
sys 3m38.826s

*** Executing round 2 ***
set swappiness to 71
real 1m49.654s
user 25m30.618s
sys 3m38.215s

*** Executing round 3 ***
set swappiness to 106
real 1m50.021s
user 25m31.175s
sys 3m51.513s

*** Executing round 4 ***
set swappiness to 141
real 1m50.912s
user 25m37.081s
sys 3m51.816s

*** Executing round 5 ***
set swappiness to 176
real 1m52.159s
user 25m41.676s
sys 3m56.990s
...

Best,
Barry
