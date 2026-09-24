Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6E2381E92
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790222865; cv=none; b=kwNipnLsY3alpI/TtoOit5IgO4haydaA7MjoR56JvJP8cUrNj0wZrfATTuM+FDq4iLL+ID8smBBSTYDimcSloH/y884Z6CJRmVSV+mMdYQ9yb3gCpekyIzs3YppaWYxr6yZd1OxhUNwhNHV90D1plzAuNvgMNeo1rmANFjY+kAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790222865; c=relaxed/simple;
	bh=uKNHX1AEIFkhasNIc08NvBKSlR8RmcmWvLxYc+HcP5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pPsmYMzGuJksFkwXA3Oo1S4PA2DMz5WrhuuQCxWaf8HbjbaKbwlg87ZKnJN0GqOqmRCyfJJHNfQ6xgKEtGHR0DGQyJwSyDp+n7GV0mlVlKvWW+N5cktFPochY51GXc6p4jNFB64rDn5KqSvq1teF5h60Vr0bkSPr2PMZkF2EUUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W+eQpLFa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W+eQpLFa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0B1E1F0089A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790222863;
	bh=wlxzHAl4jd2Dy0VVw5bc0eae7SydK76Gy5QsoWtTugw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=W+eQpLFaM2rcqsBrwxptT+1AE4q8ovSwO3chFMk819v3awDKts+y5Vk6cayF3ClxE
	 Fl5WCojNXMrnxkT4G+aF96bfpimhq6BS3ZvRyNDiIFIlXxQvSXF8INmmLoc+yvkKC6
	 NLx9Q6TnmT5AIco6f2+k549wDAisZdSuDL54+mE/2ctC7zPDHPJrAdVLnnTZ43sgGC
	 XrZQ9MliKDafN8cVGbCYAtNdWJhwGnTqNQOU8jbiieEIHq45AYa9Jp3tzr9Nhn6tC5
	 +B5kJ6gY0a+Qmk1rHyGpvh5fcc8iIMUwF7ja9OFZb1D34FQi7KYflEF0xFN4XYIm9g
	 bO6pNhB4cMVFw==
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910cadeb3so121054285a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:07:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzGhjA5tfw1butrmJW56TDKAUXkQ5UPltk0S5BgfYDbX3KAeCqMjDwXLivSS2qdI9KAOl7/tPS9K04KZ+E=@vger.kernel.org
X-Gm-Message-State: AFuF++mDrlFeAbSd4MgmdxEnYAnwntgtORthO4o+dnmX0fIq1R1PiCf/
	vX+Xl3pT/KuBhJz/HFEJx1jYkWz3+EsvGovI+LlBujVgDBN3H4eI1m+I3VqU9C3XqkMK0ytZskn
	PdtqdOFJlFeB61cpIkCZpbw6gSZWJgdg=
X-Received: by 2002:a05:620a:178a:b0:93b:6113:21c with SMTP id
 af79cd13be357-93c3625bfedmr121073085a.10.1790222862939; Wed, 23 Sep 2026
 21:07:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <apcVhWzEwkwHYjB1@KASONG-MC4> <20260901220430.79810-1-baohua@kernel.org>
 <SJ1PR11MB61051CC2791B67C97BEB2D4B8CB72@SJ1PR11MB6105.namprd11.prod.outlook.com>
 <CAGsJ_4yRJnr4xXdokVHu85b7XPe0p6rZ+Lzv4sE_gCWdOF4YAw@mail.gmail.com>
 <SJ1PR11MB6105505CAF620B23978FBEF18CB72@SJ1PR11MB6105.namprd11.prod.outlook.com>
 <SJ1PR11MB61057EF65B62E06E2C2049008C812@SJ1PR11MB6105.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB61057EF65B62E06E2C2049008C812@SJ1PR11MB6105.namprd11.prod.outlook.com>
From: Barry Song <baohua@kernel.org>
Date: Thu, 24 Sep 2026 12:07:31 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yHZ5ck1hk+Lo-7aQudApm0Nx=4yssUDrRTz681PuW=tw@mail.gmail.com>
X-Gm-Features: AclHuK_Oo5VaIVxMohMOcnCcWX2KkBDujM8Sp4JE6sgnmpi0H7GmNxPODugX6SA
Message-ID: <CAGsJ_4yHZ5ck1hk+Lo-7aQudApm0Nx=4yssUDrRTz681PuW=tw@mail.gmail.com>
Subject: Re: [RFC PATCH] mm/mglru: dynamically protect readahead fault folios
 under refault pressure
To: "Ababneh, Ehab" <ehab.ababneh@intel.com>
Cc: "ryncsn@gmail.com" <ryncsn@gmail.com>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"axelrasmussen@google.com" <axelrasmussen@google.com>, "kasong@tencent.com" <kasong@tencent.com>, 
	"lance.yang@linux.dev" <lance.yang@linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"qi.zheng@linux.dev" <qi.zheng@linux.dev>, "shakeel.butt@linux.dev" <shakeel.butt@linux.dev>, 
	"weixugc@google.com" <weixugc@google.com>, "yuanchu@google.com" <yuanchu@google.com>, 
	"yuzhao@google.com" <yuzhao@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 11:43=E2=80=AFAM Ababneh, Ehab <ehab.ababneh@intel.=
com> wrote:
>
> Hi Kairui, Barry,
>
> Apologies for the delay in getting back to you with these results =E2=80=
=94 my
> test environment got corrupted and I had to spend some time recovering
> it before I could re-run the benchmark.

No worries, Ehab. And thanks very much for your testing!

[...]

> > > > I agree that reverting the commit that caused the regression is not
> > > > the optimal path. I expect there are many workloads and scenarios
> > > > that benefit from the behavior introduced by that commit, so
> > > > reverting it could unnecessarily regress those workloads.
> > > >
> > > > I will run the Cassandra benchmark with Kairui's MGLRU-FG patches t=
o
> > > > see whether they address the issue I am seeing. I will send the
> > > > results when they are ready.
> > > >
>
> Thanks for the pointer =E2=80=94 I gave your MGLRU-FG fix a try against t=
he same
> Cassandra read benchmark I used for my patch (4 nodes, 720s, 100 readers)=
.
>
> Results with MGLRU-FG:
>   Op rate:                  55.0k - 56.5k op/s

I noticed this is even higher than your dynamic
readahead fix: "throughput ~51.9k-52.7k op/s"

Is this a run-to-run variation, or is the improvement stable across runs?

>   Latency 99th percentile:  6.8 - 6.9 ms
>
> For reference, here's where the other variants landed on the same setup:
>
>   Regression (6cbdd9726fb5, "mm/mglru: use folio_mark_accessed to
>   replace folio_set_active"):
>       p99 ~9.2-9.5 ms, throughput ~41.8k-43.6k op/s
>
>   Revert of 6cbdd9726fb5:
>       p99 ~5.5-5.6 ms, throughput ~51.9k-53.1k op/s
>
>   My dynamic readahead-credit fix:
>       p99 ~5.8 ms, throughput ~51.9k-52.7k op/s
>
> So MGLRU-FG recovers most of the latency regression, but the revert
> and my fix still recover more of it: p99 with MGLRU-FG is noticeably
> higher than with the revert and my fix (6.8-6.9 ms vs ~5.5-5.8 ms),
> though it's still a big improvement over the regression's 9.2-9.5 ms.

We also have this :
https://lore.kernel.org/linux-mm/20260901220430.79810-1-baohua@kernel.org/

you once reported it as :
"throughput was approximately
49.4K to 50.3K ops/s, averaging about 50.0K ops/s, while the 99th-percentil=
e
latency remained around 7.0 to 7.1 ms"

>
> Happy to dig further if useful =E2=80=94 let me know if you'd like more d=
etail
> on the latency distribution or a longer run to confirm these numbers
> are stable.
>

Thanks
Barry
