Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936361E47CC
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789433135; cv=none; b=YqMcnlJKHjO3P1cJ9vjZdsNgDGXfMbZgMjyPu79oz7nvM29+w71mt6ksdoCl7temdkUrPLotvknO/Pbh6Xp8HqxFSjpwlhv3R//WAhV/hjBfV8Kc1ybGvdmjgdNCtAdlonclDMcriEvwh6EJJ3+cESLbLtsej2kJL+AipzT33ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789433135; c=relaxed/simple;
	bh=+AskDzR8lGHWFka5SFrvHMBBBPNv4cx16eifV7sVM6M=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=AaDYjdFsOYTmfbbC/Y3+c5OZfEQHWBzPUZupqjfsYMnc0ZkT/h9wwn7mjhgk12VTMiExSXeTLatQ4sAe8tiL82lWTGN0tNpCKw9MMCRjBkj8spLIZd1+PsddqR/yw2LoVbQRZepuNfceMt/WOnbT8eS8hRsmQArm2CdFuXekQHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=AAQSvdrw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AAQSvdrw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FBCC1F000FF;
	Tue, 15 Sep 2026 00:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789433134;
	bh=CwnBmXu+Cm2L3rkXgurvwPvyEX3pI8+xK1duHUjRx2Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=AAQSvdrwr4NNADTRz+gNg87kWuU5fpErVqpb6tusYGKJQXBNa52EkuXFMdT/Exyhf
	 O+Q7baeJOvVgymMRK/0VXlhBU/Un1yaDTNjXl4sKAMZemU5eK4MsRaPFEJE2jsNCll
	 kTwRXjrYEJ7SBojl6BkHtXL8bBlvirEghTFi+sJw=
Date: Mon, 14 Sep 2026 17:45:33 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kasong@tencent.com
Cc: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, David Hildenbrand
 <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan
 <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Lance
 Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Vlastimil
 Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li
 <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham
 <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Barry Song
 <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, Yeoreum Yun
 <yeoreum.yun@arm.com>, "Kiryl Shutsemau (Meta)" <kas@kernel.org>, Shivam
 Kalra <shivamkalra98@zohomail.in>, Kairui Song <ryncsn@gmail.com>
Subject: Re: [PATCH v5 00/17] mm/huge_memory: clean up and decouple the anon
 and file split helpers
Message-Id: <20260914174533.6b5dba602fb66209a700df09@linux-foundation.org>
In-Reply-To: <20260915-swap-thp-cleanup-v5-0-39878b37dfb0@tencent.com>
References: <20260915-swap-thp-cleanup-v5-0-39878b37dfb0@tencent.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 01:14:41 +0800 Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org> wrote:

> The folio split path handles anon, page cache and swap cache folios in
> one routine.  That mixing is what makes the swap cache split
> restrictions hard to lift and to review. We now support uniform split to
> order-0 only, and no mappingless swap cache folios. And it has left a fair
> number of dead or redundant checks behind.
> 
> This series prepares for lifting those restrictions by cleaning up the
> code first: split the routine into an anon and a file helper, and keep
> all swap cache handling in the anon helper.  The file helper never sees
> a swap cache folio, folio_check_splittable() rejects them up front.
> 
> Apart from two bug fixes (patch 1 and 2) and a slight adjustment of anon
> splitting (patch 12), this is a pure cleanup.

Thanks, all queued up in mm.git's mm-new branch.
