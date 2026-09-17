Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E724A43CE4B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789683094; cv=none; b=a2gpLBBcjQAqZbo535gTspi11FIY76uGmmEVRlyT43ajJ2TPW/7ESg+0ZuA6uNRwipeA+urgk6nN6ZdqWg3+FOjHu2uLEyLkj75IkxCYfcv0BtZSpIMjEj2PwMgsBDFtU1Q/jacoGUPFWJIGw99mvKtYvi4Nm+c1pfCOTbj5bYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789683094; c=relaxed/simple;
	bh=U2tRXVEfsRKR4Ot2bBJD3SH826mizFRx3S63Q1h3Mxk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=WMl44Z9uSZpqhWOgLiuiCci5lVmtfWxQqG5Mp/3xZ3ptWlKRfVBs8G+ZiIJwPVk3KZdHJAt8XTHzxS3J8C5K8v+wYPRCh16NePrThL8k7B4FVYjS8ODc3WZLB5LIXOscG4Eo6CtOCgIEB8lNGzoecbELWOUVjO3CZLIkBGtgNF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=h89Ps18w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="h89Ps18w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C31D81F000FF;
	Thu, 17 Sep 2026 22:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789683092;
	bh=Fz/+qqG3YFGhplHyENgnUXZVvp0zQVnLGYilI98zm/E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=h89Ps18wwMDFibSFyyuUTnuuJVsi0PyzpfCtuJEYGc7oAeOnwVeT95qzfzBqq2TF2
	 K5riDxYOeThsiLMTEjB9fPcb1wfhbK96M1QbJPwUFIl6wn50h9sQrBjrcItA5qymy8
	 wkDriZ4WmN/37Y2ec89icgGz94IeXYtu+ayBGnmI=
Date: Thu, 17 Sep 2026 15:11:31 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry
 Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif
 <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn
 <jannh@google.com>
Subject: Re: [PATCH v3 00/12] mm/collapse: separate a collapse from its
 callers
Message-Id: <20260917151131.ececfd158627e58257ca7110@linux-foundation.org>
In-Reply-To: <aqvcElQxmtysJwbA@thinkstation>
References: <20260916093145.4022188-1-kirill@shutemov.name>
	<20260916154826.a55591eec86b5514dab898ca@linux-foundation.org>
	<aqvcElQxmtysJwbA@thinkstation>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Sep 2026 13:26:51 +0100 Kiryl Shutsemau <kirill@shutemov.name> wrote:

> On Wed, Sep 16, 2026 at 03:48:26PM -0700, Andrew Morton wrote:
> > Here's how v3 altered mm.git:
> 
> BTW, is it helpful to append a range-diff to the cover letter on a new
> revision of a patchset? I can do it in the future if it is useful.

I guess so - that would let people see what changed immediately rather
than having me send it later on.  What do others think?

I don't know how useful the heres-what-changed reply is for people. 
I've seen little sign of anyone using it.

One reason I prepare it is for the author to scan it to double-check
that they meant to do all those things.  The exercise also make me pay
more attention, check that diff matches the v4->v5 changelog's claims.

