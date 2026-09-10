Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECD149E13E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789078828; cv=none; b=jjgbuOM4JGGvWgb3lUWVA81Fvw1HOITK4lAcLiioBq4gleSR3hjwmWaBBzgTaNrMehdlpBwqprVZCiOO0FiEir7ElFOVBxFVES62b7NhiuPpdSQESRLnlRJ8F2NTElxU5/vw+sXxGCufoAyswn0gbwnwYn3V54y24Pwyam8kOhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789078828; c=relaxed/simple;
	bh=bEmywHbulyVC9Y8Zatj6edUH8CQoI3LdHoN5NmjfjO8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=CgFuXAEuzv+1jjUy9DW5n+DnSMQOAUIOMtjJjD4PcOuz3bBNTJefb+e86HpGNvjCPLm88XA2FhQF+ohhyBjyjeEIWc6P6ID2pNPtrsmxndhsLVrNwJfLPN+CyxOfV6hsTh0h1vfjfiJGvg8tRJeuFDzfZ6C/ZR89QO1PK7pq3cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=pQOpyQ3d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="pQOpyQ3d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD921F000FF;
	Thu, 10 Sep 2026 22:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789078827;
	bh=9UFIgb3ZBn2494arYukIHix4iVeSBcOZDdAUi4RKeIU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=pQOpyQ3ddtUYYsx/DIuFxpsJn9+J96AkQOaBNmO9PT/xEkAEiqCrXDIlDti8ey0U5
	 JlcDqbX8cBHb27zkk6p8U7C+RWhZVDLSxYHMmm3CO9x7a1yIwuMYKDGYeJ5FJPeSUR
	 SOeWmMcY71fqg7yvSLQcT+9YgtLckriBFImj+6EM=
Date: Thu, 10 Sep 2026 15:20:26 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Muchun Song <muchun.song@linux.dev>
Cc: Huaisheng Ye <yehuaisheng@open-hieco.net>, osalvador@suse.de,
 linux-mm@kvack.org, david@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/hugetlb: account for allowed nodes when gathering
 surplus pages
Message-Id: <20260910152026.5bcf5c5d7f1ecdcb0147ceaf@linux-foundation.org>
In-Reply-To: <8A0F6014-4E2C-4F07-9732-2DF32418B986@linux.dev>
References: <20260909074642.7308-1-yehuaisheng@open-hieco.net>
	<8A0F6014-4E2C-4F07-9732-2DF32418B986@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Sep 2026 16:48:56 +0800 Muchun Song <muchun.song@linux.dev> wrote:

> > This fixes hugetlb mappings when, for example, a task runs with
> > MPOL_BIND on Node 1 while the existing free huge pages are on Node 0.
> > 
> > Similar issue also could be found in ltp if the free pages of global pool
> > reside outside the nodes allowed by the application.
> >  # cd ltp/testcases/kernel/mem/hugetlb/hugemmap/
> >  # numactl --cpunodebind=0 --membind=1 ./hugemmap10
> > 
> > Signed-off-by: Huaisheng Ye <yehuaisheng@open-hieco.net>
> 
> Acked-by: Muchun Song <muchun.song@linux.dev>

Should we backport this?

If so, a Fixes: target would be helpful.
