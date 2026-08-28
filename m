Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9724B3B42C4;
	Fri, 28 Aug 2026 18:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942216; cv=none; b=JDgk3SzP4Pwerfzr2VaQCj8OYskri83JivGnKvMtSCHtJRiral3HVBuGI0ua5mvBAZ+grypVMhIgbUtsl0VS00vlgkDKvSuPBcGTbRQ7dxaaDtNfhDw+tQ79JA0OfjAdiMgIzEudBkNwzA/ShD/TFbaJL0zXM5wz7a+TjlpQZc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942216; c=relaxed/simple;
	bh=ybJ76zQUL8VN4OJYyTX1Wsg/oFaOaDFLGV+k0QHh1b0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=QYJBHkXOFCd+reWkpgCbPWntzbXeC7+twoAoDrxorNIAzS2p9lJfNFyxRTzptVuKY1AMA1CEivUvWaZiNRxfvo4N0nb1JHZm7JynwONMpCfQEdmBgUOi1h6QRCGt0qYKPstmylmN6kr4rA5NTQqXK19FwQwE4QVF+s/XDjli5l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=yQyk69T+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="yQyk69T+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C266B1F000E9;
	Fri, 28 Aug 2026 18:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1787942215;
	bh=gbn49kAAPUgUC+oEM+rUHWn7hXR94lgTDWdzdwQhvBs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=yQyk69T+hrkrj6khDh9IxOsJiuyHv14Nj+E52yTtQdaqGJ4G2In+sdgqdeJKUQ0G1
	 uICrkPblJSCQ2wdbbLRv7D93URitNuMpUU+E7AzFMO9LrGXpOnxtpBHm7LkBuld4yn
	 qEplW5wtIrT+4CEGo+YWUYYv4ApomHqA7C0yRZPw=
Date: Fri, 28 Aug 2026 11:36:54 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Zhen Ni <zhen.ni@easystack.cn>, David Hildenbrand <david@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Brendan Jackman <brendan.jackman@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] mm/page_owner: Add PID/TGID/COMM and cgroup
 filtering
Message-Id: <20260828113654.d01abd8baed3f73e87506eb3@linux-foundation.org>
In-Reply-To: <apEx0wT_hWs1Q5Wp@gremlin>
References: <20260828031339.1270699-1-zhen.ni@easystack.cn>
	<apEx0wT_hWs1Q5Wp@gremlin>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 28 Aug 2026 08:03:38 +0100 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

> On Fri, Aug 28, 2026 at 11:13:31AM +0800, Zhen Ni wrote:
> > This patch series adds process and memory cgroup filtering support to
> > page_owner. Following the previous series that introduced print_mode and
> > NUMA node filters:
> >   https://lore.kernel.org/linux-mm/20260707115411.1714314-1-zhen.ni@easystack.cn/
> >
> > This series adds filtering capabilities to page_owner, allowing users to
> > filter output by specific processes and memory cgroups. Users can now
> > filter page_owner output by PID, TGID, COMM (with wildcard support), and
> > memory cgroup path. This makes page_owner debugging more focused and
> > efficient for tracking memory allocations in specific contexts.
> 
> The majority of this cover letter feels like it should have been
> documentation put somewhere :)

yes please.

The only thing longer than the cover letter is the Sashiko report ;)

	https://sashiko.dev/#/patchset/20260828031339.1270699-1-zhen.ni@easystack.cn
