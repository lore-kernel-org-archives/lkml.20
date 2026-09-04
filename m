Received: from mta1.migadu.com (out-50.mta1.migadu.com [95.215.58.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D2A408035
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 05:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788500020; cv=none; b=g68S1SMisnKfJbescenN20887NXWqWXXvbuz46jGGHn92ltUvVWcWhhhGa+z/mG7j4L5f2h/viaMErl2Tzog5Ki2aS8hnCExIEp1OWJWeB9cMO08j0RZAyVapU5yoB4UarDMRQxaYsv+6NwGvIIn1a9zc/B2ViOFjoMpQj0/0vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788500020; c=relaxed/simple;
	bh=7KwgNRUvE81Flv3MCvzg9gLOP2UeUiR1MgUJyPfduP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eh5zjVUkH7eqgPWXO5IidMdbBA2X/9UBpYhevm2EhF1hzr6FFoZ+z2ZyPMI8IPpcP9oAkWVbBLMES/Mw7LBQyCxuBctOGEK60Fs0GVaJnKx/z9ibo5hP/gJlTCrxF7tctyrWhvhng/5H7ONLO51fwO4Q/kLgMhiWnf9o4VB1gFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=s/fXJIUz; arc=none smtp.client-ip=95.215.58.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="s/fXJIUz"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7KwgNRUvE81Flv3MCvzg9gLOP2UeUiR1MgUJyPfduP4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788500015; v=1; x=1789104815;
 b=s/fXJIUzAtbiSf36KY3P7OvzYDYSdjttQUma3z90OPAXzp1iex34YZsj/aVuczyyCnzJvZ0i
 8x0h0pGrJ3TToAZTp+Y57Edb4dC04Yu0xqxOvj92duB1HhWlcJEPoEUV4xc87LfaC4J3dYQq8dD
 RD0MJt2N8pM3PtT2o+n/tBJk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 88679e7f5a2622ed;
	Fri, 04 Sep 2026 05:33:35 +0000
X-Mizu-Trace-ID: 88679e7f5a2622ed
X-Migadu-Flow: FLOW_OUT
Date: Fri, 4 Sep 2026 13:33:28 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Youngjun Park <youngjun.park@lge.com>
Cc: Baoquan He <hebaoquan@kylinos.cn>, linux-mm@kvack.org,
	akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com,
	nphamcs@gmail.com, baohua@kernel.org, hannes@cmpxchg.org,
	yosry@kernel.org, shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev, david@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 14/16] mm, swap: refactor swapoff + add xswap_destroy
Message-ID: <appYKKppIlwJ7vD7@fedora>
References: <20260827094509.1016740-1-hebaoquan@kylinos.cn>
 <20260827094509.1016740-15-hebaoquan@kylinos.cn>
 <apkaxIJRdo4zwnS1@yjaykim-PowerEdge-T330>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apkaxIJRdo4zwnS1@yjaykim-PowerEdge-T330>

On 09/03/26 at 03:59pm, Youngjun Park wrote:
> On Thu, Aug 27, 2026 at 05:45:04PM +0800, Baoquan He wrote:
> > +/* Tear down a file-less xswap device by its swap type. */
> > +static int xswap_destroy(int type)
> > +{
> > +	struct swap_info_struct *p;
> > +
> > +	p = swap_type_to_info(type);
> > +	if (!p)
> > +		return -EINVAL;
> > +
> > +	spin_lock(&swap_lock);
> > +	if (!(p->flags & SWP_WRITEOK) || !(p->flags & SWP_XSWAP)) {
> > +		spin_unlock(&swap_lock);
> > +		return -EINVAL;
> > +	}
> > +	/* Refuse swapoff while the device is pinned for hibernation */
> > +	if (p->flags & SWP_HIBERNATION) {
> > +		spin_unlock(&swap_lock);
> > +		return -EBUSY;
> > +	}
> 
> non-blockfile swap device must not be chosen for Hibernation.
> There is no space to hibernate.

You areright.

xswap devices are file-less and zswap-backed with no disk space,
so they cannot host a hibernation image. Sashiko has reported this, v2
excludes SWP_XSWAP devices from hibernation device discovery (both 
find_first_swap() and __find_hibernation_swap_type()), so they are never
chosen for hibernation.
