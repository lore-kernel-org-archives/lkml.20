Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808B240B6F4
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 19:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787857883; cv=none; b=oGk1Sn7/TcjW2dyQ9di4sKHwK6ubAac7PiMKg+1cZOc0BdP5OYI1ofIP9q2W5Ug2G8KUplGAPP7Y5MM0b+DRS6BVHjmBo4eI9D18cbgIXhSVl9Lqq8/WB3dPVG7NCsUl8FkJrMcsoLC/J59rEch1enbfqOcda7m0ABiI/jDoW3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787857883; c=relaxed/simple;
	bh=FrkLLh51z7/E9eOLs6G8CsVUkCbPu+E8RDHpKYVjKic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WGDa05Ev+xgUJLzHwrsQu0mHhxi+dcCZClPi02QuOZ+Ty2+haXqCwnlPUZKGl/Ujf1HvSwJI0wHbJLqSnyjq2HKbwJYQY039Kc5okshrpBt/Y3i7heFOnwTwOLN9MNfmyY9dJFxmGo3tsw7xCTW1QCNd/mnvXh4V+KzHspE+CKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gyBqQhQW; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gyBqQhQW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=91R3l1V/uOl03V126v1cFNRh0hJ1Q8Z9vQ2ulIXNDfU=; b=gyBqQhQWSUlpKmkDdVZfEWq4jC
	6Hn05OsO+eGBDUz0AAmCUEB8dWDSJmRIrRRmJjlK6HFS+x9kWb9Lu9gWKzDjol1WfGMTi7t7NMIN0
	VWiiU82QKosQg/iEoVdatEQU1vueasyXko0mWYU4KN2egNMRYMsj6pLR75wquzW36Ad9tlRcEAbeZ
	HfI+ZL/4ygNnv+qG3c7nh5elZzcg+I+63ohE3j5fqgx39c2GRiCbrmcRZrXHx4aBN6AFfeFLxeLpn
	9kNSe8uFVHwuGrBkfCU7MPZ6YyE27qsmSJf+8cf+peQXfCmqIg5VU63anBDtlkGHfABhRaSUqgTLe
	1bQfMvzw==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzfVF-0000000DNOM-0LZD;
	Thu, 27 Aug 2026 19:11:09 +0000
Date: Thu, 27 Aug 2026 20:11:08 +0100
From: Matthew Wilcox <willy@infradead.org>
To: artem.kuzin@huawei.com
Cc: catalin.marinas@arm.com, akpm@linux-foundation.org, david@kernel.org,
	ljs@kernel.org, vbabka@kernel.org, cl@gentwo.org,
	linux@armlinux.org.uk, will@kernel.org, mark.rutland@arm.com,
	liam@infradead.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, wangkefeng.wang@huawei.com,
	panov.nikita@huawei.com
Subject: Re: [RFC PATCH 00/18] mm: arm64: Add kernel replication feature
Message-ID: <apCLzAaw6oRIqbSH@casper.infradead.org>
References: <20260827161158.3618409-1-panov.nikita@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827161158.3618409-1-panov.nikita@huawei.com>

On Fri, Aug 28, 2026 at 12:11:40AM +0800, Nikita Panov wrote:
> There were several prior submissions with some sort of replication
> for NUMA systems, including one from our side for the x86_64 platform.
> In the last couple years, several research articles related to solving
> locality issues on NUMA machines through replication emerged as well.

You're lumping a lot of different NUMA replication things together in
your list.  That doesn't give me confidence you know what you're doing.

I *think* what you're doing here is kernel text replication.  Other
architectures (mips, arm) have managed to do this without core MM
changes.  Why can't you?
