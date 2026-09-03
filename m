Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36D43932D3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.23.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418763; cv=none; b=CXEGhgCgqTMoiTiHB/fqcCKpAqP1pOoARoHwylzTjn6iCFToESPcbgQHQ2J6ldKDqp7aQ/ikwZvtv5+m+yqgNekDu8hl/I6FcKsLK/poI3k7kNsww6nGqwGljhHM06A8sK8/tvKM7TpJcnn0LT4QWxlflSdaXbZmNXPMa9FiJCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418763; c=relaxed/simple;
	bh=sO+bGB8VEmL+TiqKdI5fg0/1g3w20rhyL2+wPvVChH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pFE8TkAOXv7At6BabzlIj7fzeFKkul8JLOXaZplKk6+eu8+ivlbS1UPHE/O3BiTK2qVrmhseIGtfZJPhotWsMQ2QmQuMGacjPRWIq8z2zvmn5AQizos5Hqd553vkBm5TqxxS2F2HUiGdf++yN0O0Zkc0sbM5qfgU+QsEd7afH2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.23.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.51 with ESMTP; 3 Sep 2026 15:59:16 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: youngjun.park@lge.com
Received: from unknown (HELO yjaykim-PowerEdge-T330) (10.177.112.156)
	by 156.147.1.127 with ESMTP; 3 Sep 2026 15:59:16 +0900
X-Original-SENDERIP: 10.177.112.156
X-Original-MAILFROM: youngjun.park@lge.com
Date: Thu, 3 Sep 2026 15:59:16 +0900
From: Youngjun Park <youngjun.park@lge.com>
To: Baoquan He <hebaoquan@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, chrisl@kernel.org,
	kasong@tencent.com, nphamcs@gmail.com, baohua@kernel.org,
	hannes@cmpxchg.org, yosry@kernel.org, shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev, baoquan.he@linux.dev, david@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 14/16] mm, swap: refactor swapoff + add xswap_destroy
Message-ID: <apkaxIJRdo4zwnS1@yjaykim-PowerEdge-T330>
References: <20260827094509.1016740-1-hebaoquan@kylinos.cn>
 <20260827094509.1016740-15-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827094509.1016740-15-hebaoquan@kylinos.cn>

On Thu, Aug 27, 2026 at 05:45:04PM +0800, Baoquan He wrote:
> +/* Tear down a file-less xswap device by its swap type. */
> +static int xswap_destroy(int type)
> +{
> +	struct swap_info_struct *p;
> +
> +	p = swap_type_to_info(type);
> +	if (!p)
> +		return -EINVAL;
> +
> +	spin_lock(&swap_lock);
> +	if (!(p->flags & SWP_WRITEOK) || !(p->flags & SWP_XSWAP)) {
> +		spin_unlock(&swap_lock);
> +		return -EINVAL;
> +	}
> +	/* Refuse swapoff while the device is pinned for hibernation */
> +	if (p->flags & SWP_HIBERNATION) {
> +		spin_unlock(&swap_lock);
> +		return -EBUSY;
> +	}

non-blockfile swap device must not be chosen for Hibernation.
There is no space to hibernate.

Thanks
Youngjun

