Received: from mta0.migadu.com (out-164.mta0.migadu.com [91.218.175.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853BD56853F
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002345; cv=none; b=PInvRWyKRMADBa0jygYvHd3eKWnRqIBRaC3b5mBFbsvR68i2SmtnXkG3BdoMlG7bEQo9Lrit5+aQXFsYkYUt8Dm9R86VpreT+swbgDxx4A9Ctn4Hxf36cpwbd0PyXLr7N9uHUXJERf+0LKKou/W+432tlbf+S8NxyspWQ/XS83o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002345; c=relaxed/simple;
	bh=5UxX2FiFo5VA5ijcKXQz6fPD7Az4Sc58UOdLO4SLUNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lC3Ro2KHCKNj+zr52sw6V4pF3tEl2/JdQR0IxCfv/x9AaKmLzIfdeoQyynO11C0glXDgLYPUlKW9/3+K0+x6tKIUPrCzPfhGo4PcTPGPFKU0n1OMFZtthwBSoKZ77/w0yOdmewkLoWiNOLhQsES/NoOEsdcU+csKWh1oO0FNdho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=COUrGZPV; arc=none smtp.client-ip=91.218.175.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="COUrGZPV"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5UxX2FiFo5VA5ijcKXQz6fPD7Az4Sc58UOdLO4SLUNA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792002342; v=1; x=1792607142;
 b=COUrGZPVzyJPUy7oI668mCbm7HAtCt5fA1ZL1JwLDZfBO9NZjRaRbVC+VehuGZmq/NymELHH
 GkSJf4JjqBk+q2sLKHFI5GQEkW0weDF5AVYXg0yAsO4cp13FjuWFyP1J9eCuSmMp112Vl9ZHqs/
 +xOLP55AlT9quqo5PuPuatnI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 15e0d1628d62c846;
	Wed, 14 Oct 2026 18:25:42 +0000
X-Mizu-Trace-ID: 15e0d1628d62c846
X-Migadu-Flow: FLOW_OUT
Date: Wed, 14 Oct 2026 11:25:41 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Tal Zussman <tz2294@columbia.edu>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, cgroups@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mm: memcontrol: remove page_memcg_check()
Message-ID: <as_JE-NHoUr07Mgz@linux.dev>
References: <20261014-memcg-unused-page-helpers-v1-0-240b37c53831@columbia.edu>
 <20261014-memcg-unused-page-helpers-v1-2-240b37c53831@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-memcg-unused-page-helpers-v1-2-240b37c53831@columbia.edu>

On Wed, Oct 14, 2026 at 01:08:21PM -0400, Tal Zussman wrote:
> The last caller was removed in commit 90f095b816e2 ("mm/page_owner: use
> memcg_data snapshot to avoid TOCTOU in print_page_owner_memcg()").
> Remove it.
> 
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
