Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE4A3451AB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 21:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788471479; cv=none; b=TFIbdo/uY0yF6kPpcwAlQ4FWA3Hk3xNEtZGCauRFwf481LEDVsACT1/3ybVZOGncthYzKoQDBxjW1T7g3RsFvgHhBwJC2noUfCp00ukdclF0Lm/C2IkE6TjBB1RdP2ILVrDYoGV/nNnzoFKau8jQjJMh3/oLf7UQrMQ2aundKAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788471479; c=relaxed/simple;
	bh=ZWXfFhaxSGrn3meNQaIxGLwzBI/Ju9Rl5OqPBG7Rizs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MgeTVAoP0eYkLQEkImqELpj8KJPsrFH0CV96j8lVy4gfjrlz+l4LZDr7U5uLTdAdsODj1eoaJiLnYSt+Ator/yeMrbAS0XheRvqP3n4A980xO5onnWvo7koLOnNqIhXHmJB8tjb5gN3gE+HPBJuPCrDYL78Bf+Jh++bkYRH2RRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B8KxvLlq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B8KxvLlq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204831F00ADE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 21:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788471477;
	bh=VXfExNiCEICkaycvhoRHapQKaCEaUNeca5cgqczZcwY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=B8KxvLlqeoNTdlLVRctwOTiqZO2iTCY6hKK7smhp2VTh5CS9cFt5WUfrHzCZJINGR
	 Rj8MoI/qzEIT1vxt5v6EO7GgPFnVci7CY8txWSNaL8VMwrBN/tZlXH3ZN70HOt+H4z
	 yUMr2SfcDHrHzLqhG26wwYNSRgzDF9XV/Gce3MiWcgt/YV8Q00JottqWIQNmtFzQo8
	 QTKaNHv/MXLsUU5uQt/7b0rEzptspm1vGPZJK7BwAWyRM3Q8HkF3n4lpbAYTDsM1kp
	 UDGURBj3h4Q9kj/pU1bguMlJ9se8KlJeepJKxN9jn4H9tej0qpmH4bTk5pblm4s+li
	 UaKV25MZt3NLA==
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5303557a6dbso4793901cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 14:37:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByB+BU57NZLvuBpN+qP0GPwfE8eQ9xYSCa4OVUC7qGGBgk8UV7v0fs2pPl24mYXA9KGR7jKwUmwzh8BNjc=@vger.kernel.org
X-Gm-Message-State: AFuF++k9J5da7idfDHuu7/3qmLSz7pe+WO69ILO7JiKRI8V8faVtxd1j
	7UeThv3kheS8aqgFMH8V1SzV7Qfw/0yNUnVIHaKZfQjTOKa8pdnpIko7qVc5fOu5262Ifxu6d+y
	knPtQvjY4ve2hXzlBU2XCrLKNejRr0MU=
X-Received: by 2002:a05:620a:43ef:b0:939:7aa2:8268 with SMTP id
 af79cd13be357-93980435391mr140170785a.29.1788471476428; Thu, 03 Sep 2026
 14:37:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <apcVhWzEwkwHYjB1@KASONG-MC4> <20260901220430.79810-1-baohua@kernel.org>
 <SJ1PR11MB61051CC2791B67C97BEB2D4B8CB72@SJ1PR11MB6105.namprd11.prod.outlook.com>
 <CAGsJ_4yRJnr4xXdokVHu85b7XPe0p6rZ+Lzv4sE_gCWdOF4YAw@mail.gmail.com> <SJ1PR11MB610566E5520AFF142D8C45168CB62@SJ1PR11MB6105.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB610566E5520AFF142D8C45168CB62@SJ1PR11MB6105.namprd11.prod.outlook.com>
From: Barry Song <baohua@kernel.org>
Date: Fri, 4 Sep 2026 05:37:45 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zSP7tKuaFHXH98dKKniGjauy7RSEDPnDR-ppCkVXhsqw@mail.gmail.com>
X-Gm-Features: AcwNN1XTaRurTpdI6Qpk2m15sLshhyfTOeFG76mwFcGFZVZgAtw6J9Lp1lqozEw
Message-ID: <CAGsJ_4zSP7tKuaFHXH98dKKniGjauy7RSEDPnDR-ppCkVXhsqw@mail.gmail.com>
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

On Fri, Sep 4, 2026 at 3:46=E2=80=AFAM Ababneh, Ehab <ehab.ababneh@intel.co=
m> wrote:
[...]
> > > > I guess we could instead try to mitigate the cases where some
> > > > workloads are negatively affected while preserving the original
> > > > intention. Does the fix below address both of your cases, or is Eha=
b's case
> > actually different from Kairui's?
> > > > (The kernel-build test on my machine looks quite positive. It not
> > > > only preserves the original optimization, but even provides further
> > > > gains.)
> > > >
> > >
> > > I agree that reverting the commit that caused the regression is not
> > > the optimal path. I expect there are many workloads and scenarios tha=
t
> > > benefit from the behavior introduced by that commit, so reverting it
> > > could unnecessarily regress those workloads.
> > >
> > > I will run the Cassandra benchmark with Kairui's MGLRU-FG patches to
> > > see whether they address the issue I am seeing. I will send the
> > > results when they are ready.
> > >
> >
> > Thanks very much, Ehab. Could you please also run my proposed quick fix=
:
> >
> > https://lore.kernel.org/linux-mm/20260901220430.79810-1-
> > baohua@kernel.org/
> >
>
> Hi Barry,
>
> Thanks for sending the suggested fix. I tested it with the Cassandra benc=
hmark,
> and the results look promising. Across the runs, throughput was approxima=
tely
> 49.4K to 50.3K ops/s, averaging about 50.0K ops/s, while the 99th-percent=
ile
> latency remained around 7.0 to 7.1 ms. This represents an improvement ove=
r
> the baseline of approximately 43.98K ops/s and 9.025 ms p99 latency.
>

I am happy to see it is much better, but it still doesn't seem as good
as it was at the very beginning?

- with commit 6cbdd9726fb5 ("mm/mglru: use folio_mark_accessed to
  replace folio_set_active"):
  p99 ~9.2-9.5 ms, throughput ~41.8k-43.6k op/s
- with revert of commit 6cbdd9726fb5 ("mm/mglru: use folio_mark_accessed to
  replace folio_set_active"):
  p99 ~5.5-5.6 ms, throughput ~51.9k-53.1k op/s
- with this fix: p99 ~5.8 ms, throughput ~51.9k-52.7k op/s

> The underlying idea in both solutions is very similar: A credit-based
> system protects file folios when readahead proves useful. In my version,
> I further tuned credit accounting and used per-CPU batching to
> reduce atomic contention on multicore systems.
>

Your benchmark seems quite likely to access readahead folios.
Let me dig into your patch a bit deeper and see if we can find
a combination of the two approaches.
BTW, does Kairui's MGLRU-FG bring your benchmark back to the
performance you had at the very beginning?

Best Regards
Barry
