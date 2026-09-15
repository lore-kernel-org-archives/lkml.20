Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC48040F753
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789443336; cv=none; b=F2a2U+1ZVKeyddMlp2pp36sZosrtel9T0U9xOJ7617iDmuPgeBTf4DIRPju5YaLpQa9jt2paKzGTyEOee0nflfL4rztbl6iSVVzM412vsFZyrqxYZXw3mmKT71LXDsIel8rzvyiIx/BNYgkbCC7Znncxba/Dys+lSU4maYIGBPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789443336; c=relaxed/simple;
	bh=Rsm5FfQEdrBOp2wI5hcX+c4HgcZK07/1ZVb6APf/fww=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=trfvMss8IDxmD/KMFaC7gbI4Tf6LnKviBjnPq5HQRrf+ced5bAF8ckGho+BoHNwWHuLKiv5t78DnhEUW2XQAh6XGc2IW3crbibTdFv4gfeV/CKkHYd/YUtO4GrSA7R2961PI+HcGmAB3L0xULsi6Y69I6ky4COo35igdjgjzuFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=V1RQ4BBB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="V1RQ4BBB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD421F000FF;
	Tue, 15 Sep 2026 03:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789443334;
	bh=vycjVsdvdL/Q00jPIQ1cuSnd7h6q2v9Vl0G0+pf20mU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=V1RQ4BBB5iWxnvLsGmQ6REaJ5XmLOM//fRNynr/+jY9esATY0P6Tv5Kb/aLVsGn+g
	 rHa5DFQqWPXhlDvVXN1pwIZUdw5jHYYC8KDtauL1OaSKrc/as/F6otmcR5VbxXDMvD
	 +t+gpofGq6ijGYfKvzOhVyxDPb6CImZdfhtNZNv8=
Date: Mon, 14 Sep 2026 20:35:33 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Michal Hocko <mhocko@suse.com>
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>, linux-mm@kvack.org, Jiayuan Chen
 <jiayuan.chen@shopee.com>, Zhou Yingfu <yingfu.zhou@shopee.com>, David
 Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, David Rientjes <rientjes@google.com>, Shakeel Butt
 <shakeel.butt@linux.dev>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/oom_kill: fix hung tasks queued on mmap_lock behind
 a long reap
Message-Id: <20260914203533.3544ae8dd0903c7603b385c6@linux-foundation.org>
In-Reply-To: <aqg-oG2HDIUeK5Us@tiehlicka>
References: <20260914113239.367200-1-jiayuan.chen@linux.dev>
	<aqg-oG2HDIUeK5Us@tiehlicka>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Sep 2026 20:36:16 +0200 Michal Hocko <mhocko@suse.com> wrote:

> > Call Trace:
> >  <TASK>
> >  __schedule+0x487/0x1870
> >  schedule+0x28/0xb0
> >  schedule_preempt_disabled+0x16/0x30
> >  rwsem_down_write_slowpath+0x1d4/0x750
> >  down_write+0x60/0x70
> >  __ksm_exit+0xb4/0x230
> >  __mmput+0x12c/0x150
> >  mmput+0x1e/0x30
> >  do_exit+0x283/0xa30
> >  do_group_exit+0x34/0x90
> >  get_signal+0x952/0x960
> >  arch_do_signal_or_restart+0x41/0x250
> >  exit_to_user_mode_loop+0xd3/0x560
> >  do_syscall_64+0x385/0x470
> >  </TASK>
> > 
> > KSM is just the one LTP happened to hit: __khugepaged_exit() has the
> > same write lock cycle ahead of exit_mmap().
> 
> Why is this a practical problem we need to care about? It is kind of
> natural that the oom victim exit path might race with the oom reaper. They
> share the same lock that is mutualy exclusive. The whole point of the
> reaper is to ensure there is a forward progress achieved. So before we
> start modifying this let's talk about any practical/real life problems.

If this situation is expected, unavoidable etc then perhaps the best
change is to periodically poke the hung-task detector?
