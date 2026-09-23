Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6807329C7C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174524; cv=none; b=paddZ8n3gxdJX1WOB9uryJNE5EIdyfvCp78gDGiI1S8mVp5E+HkrC3ytIg6QgVsTBkuohW7WjXyQoxyK8+RXzsOJDgNzk5erPyAOiRJkw54S3KOo0QTk4cAw0CWNPN2v+UkAQtgQmjOJ7USlwHUawOiyqDc5zLI5avrpMhrdjVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174524; c=relaxed/simple;
	bh=IjMdTasxJSzQKggQV96e2vlEPjdBTuNIcsgxmMH4zRw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sIl5TiE5xTzEuKscj0SuN9hqCgThh33tPh+2yM4joaQIrK9VsM//KxDuctktUlbgvYcOkC+YCLV+svoxXFnI4E8X0kMTuD3EE9yIK4j7EcmfJHjzAMtD4JMyC5NR1XaUMexCiQUwuMcVY3AYgbA+mf5p2FY7RBbu/NtQTTSFZxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QcVZOIKN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QcVZOIKN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA2961F00899;
	Wed, 23 Sep 2026 14:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790174522;
	bh=OR88A52FEt3lOkvnEZ4uK2ghKDHsLZlk+8865hLTCG4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QcVZOIKNnkHsMtzRW84CuzwqKyR1jt8ezbPvTyPhkRFrP7wXCKIcZtML8YHKAvRZv
	 8tmDA26fqEmDxJfTb0y+7FMG7l/V3xbVf+Lb7TbfsfkmHqOA5aaZlKiU2WrAeA6Y9t
	 pcnLaQV66lMzU4Y5wC2VwGcyVosiqHCXAiDhNdpSMAeeX6M8n7+WKxuDhWiRExAIoV
	 Oj7a67DxYNB6ZqPwTJsFXTYRHC7fJRHzYhoadCScagkQlZFBQje8zGpCCdmC9bZqx/
	 kGBpayNm65fYIe0ijg8pHCeRLOl9lQ9EAGh+nN490WKqUDJbLV0B4tX7Lu8LOeq1Hs
	 0Og3Prdju3L1Q==
From: David Hildenbrand <david@kernel.org>
To: David Hildenbrand <david@kernel.org>, 
 Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>, 
 Wei Yang <richard.weiyang@gmail.com>, Yuan Liu <yuan1.liu@intel.com>
Cc: linux-mm@kvack.org, Nanhai Zou <nanhai.zou@intel.com>, 
 Chen Zhang <zhangchen.kidd@jd.com>, Jason Zeng <jason.zeng@intel.com>, 
 Chen Yu <yu.c.chen@intel.com>, Pan Deng <pan.deng@intel.com>, 
 Tianyou Li <tianyou.li@intel.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260920084946.3266279-1-yuan1.liu@intel.com>
References: <20260920084946.3266279-1-yuan1.liu@intel.com>
Subject: Re: [PATCH v10 0/2] mm/memory_hotplug: optimize zone contiguous
 check when changing pfn range
Message-Id: <179017451853.5582.14450577931941446538.b4-ty@b4>
Date: Wed, 23 Sep 2026 16:41:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Sun, 20 Sep 2026 04:49:44 -0400, Yuan Liu wrote:
> This series introduces a pages_with_online_memmap member into struct
> zone to avoid pageblock-by-pageblock scans across the entire zone and
> improve memory hotplug performance.
> 
> Approach
> ========
> Add a new zone member, pages_with_online_memmap, that tracks the
> number of pages within the zone span that have an online memory map,
> including present pages and memory holes whose memory map has been
> initialized and for which pfn_to_online_page() succeeds.
> 
> [...]

Applied, thanks!

tree: mm/core.git
branch: memhp-7.4.misc

Applied patches will appear soon in mm-next, followed by linux-next.

Please report any outstanding bugs that were missed during review, so we
can either drop the patch series or decide how to fix it up.

It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
though the patches have already been applied. If possible, patch trailers
will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. Further, this is not a guarantee that the
patches will go upstream. If in doubt, please check the listed branch.

[1/2] mm/memory_hotplug: make shrink_zone_span() more robust
      https://git.kernel.org/mm/core/c/1a3fed34
[2/2] mm/memory_hotplug: optimize zone contiguous check when changing pfn range
      https://git.kernel.org/mm/core/c/554e941f

-- 
Cheers,

David

