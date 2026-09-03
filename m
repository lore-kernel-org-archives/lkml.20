Received: from mta1.migadu.com (out-218.mta1.migadu.com [95.215.58.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F68F175A7B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423864; cv=none; b=IrdYTRdKteXeBCDuzg0NRSzIhIOoTsnz8JeVm4caMGGqaAw1IcYsjip8rTF/7v4E62P+0kFfbNHhqY93vRvRT/3NHeavRQw9vRmKJ3vaRPfTgmlWvS1p7IsCUzv72jxQcgY1y/0tRCx1tJRWa5gjAQ6yAaJCQk/S7f+421cFOjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423864; c=relaxed/simple;
	bh=bz3SZL//Djx5lNW9Q5WO67qm9+hz2GY8LyxsWp6/XM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kIyRGCpbioAFD0tClgQO6wU6Zyc3zIG44zvYaXwutgP0UxPehD+AhbebcnHnkAoDtVc2njqRlakxniGpsszBL30nF34G7j1hSQh4IYGt33gw6Z/omdwDIYEb5Fn3Kk44AfbhAWfgnSXzPqF6z2dOGABINS2MFVt4dlDR8NLzFVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wjsG91O4; arc=none smtp.client-ip=95.215.58.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wjsG91O4"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bz3SZL//Djx5lNW9Q5WO67qm9+hz2GY8LyxsWp6/XM0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788423859; v=1; x=1789028659;
 b=wjsG91O4sCMpO4xbXF+ikIBHnRT7vR5ABPsokvjo1fSPkPkwn58KdqqGzuNQroHxWD5Kz+rx
 QUiH3J/KP/ZPi6KZmWrLLYpiTHGmY4kVPY2F1FL0c+Vp1CpQKtTIB/yTKLaX9srTHCRCyBb8knf
 XcY48Ok0quYg7JxYH8qmSqAQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 94f1fcd18dd1bd3b;
	Thu, 03 Sep 2026 08:24:09 +0000
X-Mizu-Trace-ID: 94f1fcd18dd1bd3b
X-Migadu-Flow: FLOW_OUT
Date: Thu, 3 Sep 2026 16:24:06 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Baoquan He <hebaoquan@kylinos.cn>, linux-mm@kvack.org,
	akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com,
	baohua@kernel.org, youngjun.park@lge.com, hannes@cmpxchg.org,
	yosry@kernel.org, shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev, david@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/16] mm, swap: add xswap grow trigger on cluster
 allocation
Message-ID: <apkupjBofpvnxyOG@fedora>
References: <20260827094509.1016740-1-hebaoquan@kylinos.cn>
 <20260827094509.1016740-8-hebaoquan@kylinos.cn>
 <CAKEwX=P53GAmyPeBQ29XaHnGw5qpKkiKiBEwuhdRKdkMPT0GSg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKEwX=P53GAmyPeBQ29XaHnGw5qpKkiKiBEwuhdRKdkMPT0GSg@mail.gmail.com>

On 09/02/26 at 10:15am, Nhat Pham wrote:
> On Thu, Aug 27, 2026 at 5:45 AM Baoquan He <hebaoquan@kylinos.cn> wrote:
> >
> > When cluster_alloc_swap_entry() fails to find a free cluster and
> > the xswap device still has room to grow, expand the mapped range
> > by XSWAP_GROW_CLUSTERS clusters.
> >
> > Since xswap is always SWP_SOLIDSTATE, no locks need to be dropped
> > before calling xswap_map_clusters(), global_cluster_lock is never
> > held on this path.
> 
> What about local_lock()? I believe we're still holding
> percpu_swap_cluster's local lock as we invoke xswap_map_clusters()?
> Would this lead to issues :/

Good question. Kashiko also reported this , have fixed it by moving
swap_alloc_slow()() out of the lock scope as swap_alloc_slow() does not
touch the per-cpu swap cluster cache.

