Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD00420477
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788386322; cv=none; b=mQu736Fs4g6zyMNUN6CHhIQsWFcxUYXfeLVeIIQbAvNo2DtKe8Xips+SCDMxUtclcAi6v+NZR5iQBakVKNhiLInsrVWL3M546g4r8BK4fOUS3PRH28FAlwppIUh7PFdKpaJQ4UsaUNyVnByNuVSad9Jq1z49PzQdvJ0I8afVzIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788386322; c=relaxed/simple;
	bh=+fCJlfAKaO0YjY15wV7HdNzDL7/0/z719Qhg+sy55MU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TJchVzx1XF0npg/4Q80x19PIBBqkg1vIATvP2VpeCMFhvEUbV7Use+P6fU5hgOi09iDNUaeAvAtjxguPUZZM8Bpf2zb6lsiZnzHdbQCnIPl6EzPhlOPegVNa/i6WG3HtOJDllJHqeqXmPZ9u0rVar3/RvwdTfE80W/JqIDwv9iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y9gTzEyE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y9gTzEyE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D4571F00A3F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788386314;
	bh=ZUEKUVKXoWUOR+E5mhSVvS9WmDqloii4ItdH3VZMoHg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Y9gTzEyE1D2IE5W5pz95T3iFb+ofXbWImJd7iRdzou8DSZBItv6wctqhjtO8dJZrm
	 3s8h9CUVHqZ3aqzzhNj0kJkXJIkmFU11bELQlkzXKbA5kjVM3c8hTKmpX45xtikA7o
	 5ZSrTmFuO/FFbancEG/OWyU420bZrYWCx8Y65pv1TuOWPWyjmyC2znViJ9HnOyv7ku
	 1TJSGEd0liAjcL6uL1T7yiO60WaFQbMUGoTQaVWDMGAnIfUP396eoGmfp/sp10Sr06
	 C5pFeoooHIuYQAd+a8PlHJVX17d1xTtvP/gBRvcyAbwa023+SR+n1iSUbN9Ev6gtxC
	 3WY8kuhE3cIaw==
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-938cd95b06eso43548985a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:58:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxXjibuvONTvOO1B1DIkMb8KX0rpNtmCMAgdNB0RRwY0xsKlyZB8H8GdpOueOlaQ2LN59fMbAGtg4X0MSo=@vger.kernel.org
X-Gm-Message-State: AFuF++mpfSfPsjP4DMQIVwiHmaYCao7GaixMLK2EBdwvcKRY59O63ttr
	QICaoQBx3qAeBx0Gq0Jblx0/RMuaucZIvPcBn6hY6fGx3pbOZgMIpKaqtHBrTG7vWsNzVa2aHbN
	Zibu8Vk94hXlYTaIIH3pBqJiyPACEaNA=
X-Received: by 2002:a05:620a:4916:b0:939:3f4f:7254 with SMTP id
 af79cd13be357-9396e00fbb8mr203781485a.14.1788386313684; Wed, 02 Sep 2026
 14:58:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <apcVhWzEwkwHYjB1@KASONG-MC4> <20260901220430.79810-1-baohua@kernel.org>
 <SJ1PR11MB61051CC2791B67C97BEB2D4B8CB72@SJ1PR11MB6105.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB61051CC2791B67C97BEB2D4B8CB72@SJ1PR11MB6105.namprd11.prod.outlook.com>
From: Barry Song <baohua@kernel.org>
Date: Thu, 3 Sep 2026 05:58:21 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yRJnr4xXdokVHu85b7XPe0p6rZ+Lzv4sE_gCWdOF4YAw@mail.gmail.com>
X-Gm-Features: AcwNN1Wb4YyzIhIHf2Y_bgeEi3d3VmYjR46Ow-3xSRFk6c1cEBew419BsDFxt3w
Message-ID: <CAGsJ_4yRJnr4xXdokVHu85b7XPe0p6rZ+Lzv4sE_gCWdOF4YAw@mail.gmail.com>
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

On Thu, Sep 3, 2026 at 5:52=E2=80=AFAM Ababneh, Ehab <ehab.ababneh@intel.co=
m> wrote:
>
> Hi Barry, Kairui,
>
> Thanks for the feedback and suggestions.
>
> > -----Original Message-----
> > From: Barry Song (Xiaomi) <baohua@kernel.org>
> > Sent: Tuesday, September 1, 2026 3:05 PM
> > To: ryncsn@gmail.com; Ababneh, Ehab <ehab.ababneh@intel.com>
> > Cc: akpm@linux-foundation.org; axelrasmussen@google.com;
> > baohua@kernel.org; kasong@tencent.com; lance.yang@linux.dev; linux-
> > kernel@vger.kernel.org; linux-mm@kvack.org; qi.zheng@linux.dev;
> > shakeel.butt@linux.dev; weixugc@google.com; yuanchu@google.com;
> > yuzhao@google.com
> > Subject: Re: [RFC PATCH] mm/mglru: dynamically protect readahead fault
> > folios under refault pressure
> >
> > On Wed, Sep 2, 2026 at 2:21=E2=80=AFAM Kairui Song <ryncsn@gmail.com> w=
rote:
> > >
> > > On Tue, Sep 01, 2026 at 11:06:43AM +0800, Ehab Ababneh wrote:
> > > > Commit 6cbdd9726fb5 ("mm/mglru: use folio_mark_accessed to replace
> > > > folio_set_active") introduced a regression for workloads that rely
> > > > on readahead to keep sequential file access efficient.
> > > >
> > > > The problem is that MGLRU can place fault-path file folios in older
> > > > generations, so memory pressure can reclaim readahead folios before
> > > > the workload touches them. In our Cassandra read benchmark, this
> > > > raised p99 latency to about 9.2-9.5 ms and cut throughput to roughl=
y
> > > > 41.8k-43.6k op/s; the revert restored the workload to about 5.5-5.6
> > > > ms and 51.9k-53.1k op/s.
> > > >
> > > > Readahead is important for sequential I/O and mmap scans, but it
> > > > should not be retained when the workload does not benefit from it.
> > > > The goal is to keep the optimization without keeping readahead page=
s alive
> > forever.
> > > >
> > > > This patch provides a middle ground: keep the original behavior by
> > > > default, but temporarily protect fault-path file folios when
> > > > repeated file refaults show that readahead is actually helping.
> > > >
> > > > The mechanism is dynamic and self-tuning:
> > > >
> > > > - add a per-lruvec readahead/refault credit
> > > > - accumulate credit on file refaults in the MGLRU refault path
> > > > - consume credit in folio_add_lru() for fault-path file folios
> > > > - keep the folio active while credit is available, and otherwise le=
t
> > > > the
> > > >   original behavior stand
> > > > - decay/reset the credit as generations advance and when an lruvec
> > > > is
> > > >   initialized
> > > >
> > > > This means we only protect fault-path file folios when refault
> > > > pressure shows that the workload is actively benefiting from
> > > > readahead. If the workload does not need that protection, the
> > > > original optimization remains intact and we do not keep readahead p=
ages
> > around unnecessarily.
> > > >
> > > > Benchmark results for the Cassandra read workload
> > > > (4 nodes, 720s, 100 readers):
> > > >
> > > > - with commit 6cbdd9726fb5 ("mm/mglru: use folio_mark_accessed to
> > > >   replace folio_set_active"):
> > > >   p99 ~9.2-9.5 ms, throughput ~41.8k-43.6k op/s
> > > > - with revert of commit 6cbdd9726fb5 ("mm/mglru: use
> > > > folio_mark_accessed to
> > > >   replace folio_set_active"):
> > > >   p99 ~5.5-5.6 ms, throughput ~51.9k-53.1k op/s
> > > > - with this fix: p99 ~5.8 ms, throughput ~51.9k-52.7k op/s
> > >
> > [...]
> > >
> > > Just an idea. For an short term and easy fix, what if we simply rever=
t
> > > than, then only protect in_fault && folio_test_swapbacked folios with
> > > PG_active?
> >
> > Hi Ehab and Kairui,
> >
> > Thanks very much for your reports and discussion.
> >
> > I'm not quite sure we want to revert it entirely, as that would immedia=
tely
> > regress the workloads improved by the commit, such as the kernel build.
> > Also, for example, Kairui's cover letter mentioned the LevelDB benchmar=
k:
> >  "I also retested the LevelDB benchmark from the cache_ext paper [5].
> > Interestingly, mainline MGLRU already beats CLRU on this one after a re=
cent
> > change in lru_gen_folio_seq that bumps new folios with refs =3D=3D 1 to=
 the
> > second-oldest generation."
> >
> > I guess we could instead try to mitigate the cases where some workloads=
 are
> > negatively affected while preserving the original intention. Does the f=
ix below
> > address both of your cases, or is Ehab's case actually different from K=
airui's?
> > (The kernel-build test on my machine looks quite positive. It not only
> > preserves the original optimization, but even provides further gains.)
> >
>
> I agree that reverting the commit that caused the regression is not the
> optimal path. I expect there are many workloads and scenarios that
> benefit from the behavior introduced by that commit, so reverting it
> could unnecessarily regress those workloads.
>
> I will run the Cassandra benchmark with Kairui's MGLRU-FG patches to see
> whether they address the issue I am seeing. I will send the results when
> they are ready.
>

Thanks very much, Ehab. Could you please also run my proposed quick fix:

https://lore.kernel.org/linux-mm/20260901220430.79810-1-baohua@kernel.org/

Best Regards
Barry
