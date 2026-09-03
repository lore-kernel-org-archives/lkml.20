Received: from mta0.migadu.com (out-217.mta0.migadu.com [91.218.175.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DF2390992
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427036; cv=none; b=D6zBIE921q3OXky+pykvGkum+2yhxPkr5AQv5oW8EKKwTKT+NDuEoSe1UqHRbHTPl+mxjZlxrnObbqRzleWoBd7ScQI17qmjHM0rTR0MseW3UR5VgRj3bkhOfCzQ7Em7GmvPP4wuPmk0y+n+EAENCe636FtG2JuZsN22kqCm1OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427036; c=relaxed/simple;
	bh=gZ6TEKe+uz2mOa4JtXWVQU/xuG2dYvVMCUpJ1gBLUnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJFausiUEU73uZxyNduLFmx14E4ZqHcXJ+5XKw9eNB2CgjDYFM0cQtsp53SY1sgyJ8RFTXCQfJZ9R/oe66N/UYpSsd741zZroOGygyCK8pMtCYFObBZr8F15CiHK7iMjsU1IuAbswUua4cj/61M4hnTVg+X18xHLFQHKCBMx+VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=F5LwbcdB; arc=none smtp.client-ip=91.218.175.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="F5LwbcdB"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gZ6TEKe+uz2mOa4JtXWVQU/xuG2dYvVMCUpJ1gBLUnY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788427032; v=1; x=1789031832;
 b=F5LwbcdBRBmgoZD6y2ZmY0NxZrvr6tm8II9tejWY7TRqpneH7a3NFB4+2hLlfs/gIq75DlHC
 KO1F6l6dhwjw6mZ9Jq2VRAhx9JJmIyKQOZt5EgxZk3jNq+1dOphpy97/2FjyARvW72wFSNE+tnM
 yDCwfnJ7f1szxUew32+ce45U=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 2edda1273ec6a1c8;
	Thu, 03 Sep 2026 09:17:12 +0000
X-Mizu-Trace-ID: 2edda1273ec6a1c8
X-Migadu-Flow: FLOW_OUT
Date: Thu, 3 Sep 2026 17:17:00 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Baoquan He <hebaoquan@kylinos.cn>, linux-mm@kvack.org,
	akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com,
	baohua@kernel.org, youngjun.park@lge.com, hannes@cmpxchg.org,
	yosry@kernel.org, shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev, david@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/16] mm, swap: defer xswap shrink to workqueue to avoid
 lock recursion
Message-ID: <apk7DG-QRHMCwRDL@fedora>
References: <20260827094509.1016740-1-hebaoquan@kylinos.cn>
 <20260827094509.1016740-14-hebaoquan@kylinos.cn>
 <CAKEwX=Ovm9DTLE_8E-dQ_47SVrOQBY0hLbF7vS9MpDy2bUThCA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKEwX=Ovm9DTLE_8E-dQ_47SVrOQBY0hLbF7vS9MpDy2bUThCA@mail.gmail.com>

On 09/02/26 at 10:50am, Nhat Pham wrote:
> On Thu, Aug 27, 2026 at 5:57 AM Baoquan He <hebaoquan@kylinos.cn> wrote:
> >
> > xswap_try_shrink() was called directly from __free_cluster() while
> > holding ci->lock.  The shrink path calls xswap_unmap_clusters()
> > which unmaps vmalloc pages backing cluster_info, and on return
> > swap_cache_del_folio() tries swap_cluster_unlock(ci) on the now-
> > unmapped address - crashing on a not-present page.
> 
> This reads like a bug. It would be a bisectability problem to not
> squash this to an earlier patch, no?

I intentionally keep it as an independent patch. This is a new feature,
we don't need to worry about bisectability problem. Mainly I want to
the code change explained clearer, any people can get it from the git log.
If I squash all them into one commit, it's very hard to let people know
which paragraph describes what change, esp the commit is big.

If it's a logic unit with a reason, I would separate it out as an
independent patch. People review it and ack if no objection, then go to
the next one. It's better than a big patch with which we reviewed one
round, this place is changed, next round, the other place is changed. 
Then next round, a new place mixed the 1st place is changed. We sometime
even don't know what is settled, what is not.

