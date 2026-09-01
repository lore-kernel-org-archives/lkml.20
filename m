Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5613BD642;
	Tue,  1 Sep 2026 08:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250289; cv=none; b=dgz1sifh9+8KX+iOdR2AzgfSNnsCZceDlje2hdIEbinHa674feF3H/mgj9cKm1zpDpkg6SovXYU6eytsJ8fA3Apfv/F1Wos2CH3NEicjcj0cQgHvSebsReRgTrlS8sCaN2KL6LbxmF6g0Y00YhCUSWIqtshFlE/aCH7FbTMJaek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250289; c=relaxed/simple;
	bh=bFd0e3Blb35zm35Bhp82KL6sD39s7WkUNYMeu1XIArI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mlrf/KC2rKnoKn86MREh3Z8e5+hh3WM3QMgMhNWdJvNc6kUs043bAYtSQ8HKjDSSCFjtMhdjDvXxe08l654kU+mFj0E3ippCr+LDbJltp56MhbI7Fto+IJqh2FQ+/5QTW+Nm3lw52P49/gUXto4Si1u/M6euTgw9MjUBoQBB/FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m5iofLpm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m5iofLpm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F7051F00A3D;
	Tue,  1 Sep 2026 08:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788250287;
	bh=wRO50+DIeZsljZuDqKqgAEET3v+I4IRVdzWP9syTz0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m5iofLpm80amO782ShFaFem4kHLHX4bdEWuvGzSjNE5DDDlO8S3l1HNwcHE6lZ2OC
	 T5OVcDmKwiQ8bfEaFcsFyYEzcOPkLO2xff0C5Cj0XAesJDyLLtpitqjBgTq2MBoadR
	 EVrRP99Hyl7/usP5MWsbaBuT79vS4S1VPNkMQ6IvKTjchODTZ6MiSqyJ2K84Rje5JJ
	 61LXit7jEEQRwSIUTwjdc+3nMlEewO5cp9snjuqCAdJU4wnFd2dGCUC1O+39luWvSz
	 Gf90RBl/5Mdl9ZJGJeHR1mzyUMCEehJORKDujY4z2EW0CqIPhhvmzdCXaIHurNkkvb
	 rRtq4+wGtE9+A==
Date: Tue, 1 Sep 2026 09:10:57 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "zhen.ni" <zhen.ni@easystack.cn>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] mm/page_owner: Add PID/TGID/COMM and cgroup filtering
Message-ID: <apaG83-HCFTuASQ_@lucifer>
References: <20260828031339.1270699-1-zhen.ni@easystack.cn>
 <apEx0wT_hWs1Q5Wp@gremlin>
 <20260828113654.d01abd8baed3f73e87506eb3@linux-foundation.org>
 <9fce3210-3548-4df3-ae00-730b666f5d57@easystack.cn>
 <apZ99NHTmNI_nIwz@gremlin>
 <ff7d838c-8ea7-4a91-86bc-f6899970cdcf@easystack.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff7d838c-8ea7-4a91-86bc-f6899970cdcf@easystack.cn>

On Tue, Sep 01, 2026 at 04:01:20PM +0800, zhen.ni wrote:
>
>
> 在 2026/9/1 15:27, Lorenzo Stoakes (ARM) 写道:
> > On Tue, Sep 01, 2026 at 02:34:34PM +0800, zhen.ni wrote:
> > >
> > >
> > > 在 2026/8/29 02:36, Andrew Morton 写道:
> > > > On Fri, 28 Aug 2026 08:03:38 +0100 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:
> > > >
> > > > > On Fri, Aug 28, 2026 at 11:13:31AM +0800, Zhen Ni wrote:
> > > > > > This patch series adds process and memory cgroup filtering support to
> > > > > > page_owner. Following the previous series that introduced print_mode and
> > > > > > NUMA node filters:
> > > > > >     https://lore.kernel.org/linux-mm/20260707115411.1714314-1-zhen.ni@easystack.cn/
> > > > > >
> > > > > > This series adds filtering capabilities to page_owner, allowing users to
> > > > > > filter output by specific processes and memory cgroups. Users can now
> > > > > > filter page_owner output by PID, TGID, COMM (with wildcard support), and
> > > > > > memory cgroup path. This makes page_owner debugging more focused and
> > > > > > efficient for tracking memory allocations in specific contexts.
> > > > >
> > > > > The majority of this cover letter feels like it should have been
> > > > > documentation put somewhere :)
> > > >
> > > > yes please.
> > > >
> > > > The only thing longer than the cover letter is the Sashiko report ;)
> > > >
> > > > 	https://sashiko.dev/#/patchset/20260828031339.1270699-1-zhen.ni@easystack.cn
> > > >
> > > >
> > >
> > > Hi Andrew, Lorenzo,
> > >
> > > Thanks for the review.
> > >
> > > I have analyzed all the Sashiko report findings. Some will be fixed in
> > > the next version, and for the rest I propose not to fix them, with
> > > reasons below. If there are no objections I will send v2 accordingly.
> > >
> > > Will be fixed in the next version:
> > >
> > > - mm/page_owner.c: drop the kstrdup() copy in parse_pid_t_list(); the
> > >    token will be parsed in place. This also fixes a leak on the success
> > >    path and a kfree() of an advanced (interior) pointer on the error
> > >    path. cmp_int() will replace plain subtraction in cmp_pid_t(), and
> > >    pid values exceeding PID_MAX_LIMIT will be rejected.
> > > - mm/page_owner.c: PAGE_OWNER will select GLOB so glob_match() is
> > >    always linked in; parse_comm_list() will drop its kstrdup() copy the
> > >    same way.
> > > - mm/page_owner.c: the cgroup path buffer will be allocated once per
> > >    read() outside the page_ext RCU read-side critical section instead of
> > >    per page inside get_page_memcg_info() (GFP_KERNEL allocations must
> > >    not sleep there). The memcg= parsing branch will be guarded by
> > >    CONFIG_MEMCG so kernels built without memcg reject the command
> > >    instead of silently enabling a filter that never matches.
> > > - tools/mm/page_owner_filter.c: user-visible input errors (empty
> > >    -p/-t/-c/-g arguments) will print error messages instead of exiting
> > >    silently.
> > > - Documentation: the wildcard pattern in the -c example will be quoted
> > >    to prevent shell glob expansion.
> > >
> > > Proposed not to fix, by design:
> > >
> > > 1. Shared-fd concurrent read/write races (READ_ONCE around the pid
> > >     passed to bsearch, torn reads of pid/tgid lists, glob_match() racing
> > >     comm rewrites, concurrent write() leading to state->memcg_path
> > >     double-allocation): multi-threaded sharing of one page_owner fd is
> > >     not a designed use of this interface. The filters are per-fd state
> > >     meant to be configured once and then read, which is what the
> > >     page_owner_filter tool does. Adding locking to the read path would
> > >     put overhead into the per-page scan loop for no designed benefit.
> > >     This matches the semantics of the original filter introduction.
> > >
> > > 2. No "clear filter" support (empty pid=/tgid= lists partially clearing
> > >     proc filters, empty memcg=/nid= being rejected): write commands are
> > >     incremental -- "keep the unmentioned filters" -- and there is no
> > >     clear operation by design. To start over, close the fd and open a
> > >     fresh one; the page_owner_filter tool already works this way. This
> > >     also matches the semantics of the original filter introduction.
> > >
> > > 3. kcalloc() vs kmalloc_array() for new_comm_list: no consumer of the
> > >     list reads past strscpy()'s NUL terminator, so uninitialized bytes
> > >     are unreachable.
> > >
> > > 4. char cgroup_path[512] in validate_cgroup_path(): acknowledged that
> > >     the kernel side accepts paths up to PATH_MAX (4096). The userspace
> > >     check truncates an over-long path with snprintf() and then fails
> > >     access(), so it is rejected, never silently accepted. Bumping the
> > >     buffer to PATH_MAX would only serve pathological paths; realistic
> > >     cgroup paths are well under 100 bytes, so 512 wastes nothing in
> > >     practice.
> > >
> > > If this plan looks reasonable I will send v2.
> >
> > Sorry but this kind of 'summary', 'do you agree with the plan' email is not
> > acceptable.
> >
> > You have your feedback, reply to people like a human being directly to them,
> > thank you very much.
> >
> > At this point, based on past experience, I have to ask if you're using an LLM?
> > If so please disclose this as per kernel guidelines:
> >
> > https://docs.kernel.org/process/coding-assistants.html
> > https://docs.kernel.org/process/generated-content.html
> >
> > >
> > > Thanks,
> > > Zhen Ni
> >
> > --
> > Cheers, Lorenzo
> >
> >
> Hi, Lorenzo
>
> I honestly don't understand what is wrong here. I spent two full days
> going through every single finding in the Sashiko report one by one,
> checking each against the code. In fact I am already working on v2 and
> testing the corresponding changes. What I don't understand is what
> "this kind of 'summary' email is not acceptable" is supposed to mean.
>
> If you disagree with any specific item, name it and we can discuss it
> -- but rejecting the whole thing outright, with just two documentation
> links and no specifics, is not something I can act on.

Again you're failing to reply to kernel email in the usual style, and it's
on you to figure out how to do that, not me.

Reply, inline, to what people have said to you.

Do NOT ask them to read through your 'plan' document and give yet more of
their time to compensate for you not following basic kernel procedure.

I have done hundreds (>1,000?) hrs of review upstream and I have only seen
these kinds of 'summary - plan' emails since 2026.

I am only asking you to engage upstream as everybody else does.

Since you ignored it, I ask you again - have you used an LLM here? If so
follow kernel procedure as per the documentation I linked.

>
> Thanks,
> Zhen

--
Cheers, Lorenzo
