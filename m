Received: from mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70D73B6C05
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787786193; cv=none; b=PXEY7vRX43F/v7b74OqRjtm57A+QLM5sM9q9Pef+uMwC9iqlp70WeHHr0pqA1nc+/TE9eMp0JI3IOMVu86hoVBDUH5Up6QUNzosF/l2Dea60S17Ydsaj+3VY/pUteqTGW3tfCekKvOqo/oX7nFil3xeDGedoiZEYUoihpKfHxyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787786193; c=relaxed/simple;
	bh=7GB9LDGc/ehsf2MrGh51/UolbCmkcOrybX27TcwbBiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tjGBRzbnKv0jmnHzywF3MMQEfUhxr2LGRk0bkLPjP/f1hRX+2bsQOweRDO5AvOZwcxs3IYmgsr7euVB6TNvIUNt4HnNLSINCQNlXz1tRd/8BdcA8nhe38j+H1rEC8DK3a/SgV0PiYq8N57pU477FmYe4zvpboff9cmvTbpAhggk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=B+mMWDpf; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="B+mMWDpf"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7GB9LDGc/ehsf2MrGh51/UolbCmkcOrybX27TcwbBiM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787786187; v=1; x=1788390987;
 b=B+mMWDpfye8MXWiJqFkip5HSbBBs6Z++TQ+Ia3t4UqA62aNsRoZsE8ToiGuL6VCrwoqfIX35
 fy6xHdiLiiHZ2ErpKmoVqEIU60+UYn07aWvKaJLKYhAQbbNwMcp0xoojO+DPm4QmTZ1K1L/CAIW
 RGNmPXb3aTuTgMu2dUJFRleU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: from localhost (2a03:2880:10ff:45::)
	by smtp.migadu.com with ESMTPS id c343a924b13046c4;
	Wed, 26 Aug 2026 23:16:27 +0000
X-Mizu-Trace-ID: c343a924b13046c4
X-Migadu-Flow: FLOW_OUT
Date: Wed, 26 Aug 2026 16:16:26 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Ye Liu <ye.liu@linux.dev>
Cc: Michal Hocko <mhocko@suse.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ye Liu <liuye@kylinos.cn>, David Rientjes <rientjes@google.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/oom_kill: remove unreachable __GFP_THISNODE check
 in constrained_alloc()
Message-ID: <ao9zZMgwva6nMXxN@linux.dev>
References: <20260813093810.573302-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813093810.573302-1-ye.liu@linux.dev>

On Thu, Aug 13, 2026 at 05:38:09PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> The __GFP_THISNODE check in constrained_alloc() is dead code: global
> OOM is never triggered with __GFP_THISNODE (blocked in
> __alloc_pages_may_oom before out_of_memory() is called), and memcg OOM
> returns CONSTRAINT_MEMCG at the top of the function before reaching
> this point. Remove the check, its stale comment, and update the
> following comment that referenced __GFP_THISNODE.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
