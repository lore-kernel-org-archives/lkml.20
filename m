Received: from mta0.migadu.com (out-96.mta0.migadu.com [91.218.175.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4879C511235
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789751689; cv=none; b=CoSSwBbs/2wVB2+CscHavh38tAnZ2vgbr8neErAvdooUb3ZBkO9wJJG1q9fBaIz/njMdyVbPEJTJmJwzcBgaqcEWmKZ5WlxY/+VQQXfxNev8NJLNJKjq80+CtGBb1g93VZz129aIGch8xHY5f6uV/KvcYrWOsKZ1Kx+ZvMOypPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789751689; c=relaxed/simple;
	bh=ilKUCNcdIV4WAXoOcsb8yjDuQjldO+Yd7+nPVMQEjpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8BsTv/BJgLzSDZ2CsdBCWCAZff3DUHRiED7H5gzpNSdbRQdY7tIZfyPJNScFtw6zV/xUJpN8+Ub7eG1dTlNVF7V6nKT8fjACXWA7ZaWoDYxPuRQvqcPPbuhn2gL36uJ476ccKBEKk1aYQ6HasgEgu40bq14TUtq22EC3wsm7ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VtLwXeno; arc=none smtp.client-ip=91.218.175.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VtLwXeno"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ilKUCNcdIV4WAXoOcsb8yjDuQjldO+Yd7+nPVMQEjpE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789751684; v=1; x=1790356484;
 b=VtLwXenoZo7UkDBFwdP3YNhdV9laGNaweh7aEmGnZDcHQWEZiLzYqqMpuyPNKp9NCbfnuiLQ
 52CEgh2gcWpBa+7SpyKPXWNpeQbmJdLpRGBzsdQfyuN7rGZOQNOrlcp9wYKI7asXxoFOuR5x0fT
 /6POQAnWTbHBRAWXj9xaihWs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e631f011be8d44f9;
	Fri, 18 Sep 2026 17:14:44 +0000
X-Mizu-Trace-ID: e631f011be8d44f9
X-Migadu-Flow: FLOW_OUT
Date: Fri, 18 Sep 2026 10:14:38 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Muchun Song <muchun.song@linux.dev>
Subject: Re: [PATCH 2/2] memcg: remove unused mod_memcg_page_state()
Message-ID: <aq1xZu9-QtHDO1SS@linux.dev>
References: <20260918165601.1014666-1-ekffu200098@gmail.com>
 <20260918165601.1014666-3-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918165601.1014666-3-ekffu200098@gmail.com>

On Sat, Sep 19, 2026 at 01:55:58AM +0900, Sang-Heon Jeon wrote:
> Since commit c466412c73c3 ("mm: memcontrol: switch to native NR_VMALLOC
> vmstat counter"), mod_memcg_page_state() has no callers.
> 
> So remove it.
> 
> No functional change.
> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
