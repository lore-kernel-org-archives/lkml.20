Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBD91DF75A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 00:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788221528; cv=none; b=i2fQT8189aTK/xmdxEl8QdfbuF75BvsAxtaeUsIX6PKJkDqLF+AbhV7Nvsc7k1B4hfoEruO5BxD8oGeysxUdwMOJJv1qMnSpBINO24xE49aUsOt77SdYtEqqU+QEni3er2LwGg9V2ka1HQGtVQfPv9FTAICcQton+8MD0u+3D6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788221528; c=relaxed/simple;
	bh=18Cb1Nr1Y8p9sY3wKWl++lsV8JeseEf2to6XHuHOR6Q=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=mZgf17Mx8AALNbUfylKLQcGOM7D6QbuHIvaPsNZZiE1/v3Eu4bgCjCSD/BHH98zq69h9biRrB4PbDZA93TYme16ZqmsNgmCsdosWXB4pLcluYLfSCnXQ6HI7zkkoQsjhNvDOp1ZGxr0x3L1/KBsD2CaK5kDmiR6ZuyKcjJFEC0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=0G/0Jcyb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="0G/0Jcyb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57EDF1F000E9;
	Tue,  1 Sep 2026 00:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788221526;
	bh=bdSr+i9cBp7FwG5sfqW1agj3CB0fz+rTkg3Azl7c2h0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=0G/0Jcyby3mLtIFfRj9YYzME6z+ZmSLTmcxgR0x5iTwgW5ZoRT7thYuOiq5Poa92+
	 UKxQTOlPKsnhIe7GDmY8oWUEVEs+M6UrqvfFDzluqf1zlFHKGeF8/2qfiLQRBXh5WJ
	 uREfa7XESaC18PPOPJ8HgXzYoGcELmuXx3bjO+6w=
Date: Mon, 31 Aug 2026 17:12:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: David Hildenbrand <david@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Kiryl
 Shutsemau <kas@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/gup_test: report actual pinned bytes
Message-Id: <20260831171205.9463e83d82da2a0b403da26a@linux-foundation.org>
In-Reply-To: <20260831101304.162867-1-sarthak.sharma@arm.com>
References: <20260831101304.162867-1-sarthak.sharma@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Aug 2026 15:43:04 +0530 Sarthak Sharma <sarthak.sharma@arm.com> wrote:

> __gup_test_ioctl() advances addr to the end of the current batch before
> checking if GUP pinned the entire requested batch. If GUP pins more than
> 0 pages but less than the requested batch size, addr still advances by
> the requested batch size.
> 
> The next iteration detects the partial pinning and breaks out of the loop.
> Again gup->size is calculated using addr - gup->addr, so it also includes
> the unpinned pages of the requested batch.
> 
> Calculate gup->size using the actual number of pages pinned multiplied
> by PAGE_SIZE.

Thanks.  Sashiko might have found a somewhat-related overflow on
32-bit.  Maybe fix that while we're in there?

	https://sashiko.dev/#/patchset/20260831101304.162867-1-sarthak.sharma@arm.com
