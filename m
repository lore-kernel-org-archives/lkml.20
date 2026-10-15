Received: from mta1.migadu.com (out-163.mta1.migadu.com [95.215.58.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E36423C51D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792039542; cv=none; b=EAsLBXsuo2UWqFGkb1p8xAKWsnGy25uXOHAQfFkt09FOVpXi/BVkWwn9Cy+kRezdFj0MIr6RquMLs0ZvCk3+9K6n2tUcKusFcTuLD+0xxlQZyVVAV1bwmF50u17JIYo/Ncq3TO5IJOE6Wkz2CwhH1tYQU3HLuoz1JDFcLvwGYn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792039542; c=relaxed/simple;
	bh=Zwdqyn7Po0/V3YhxFxmEYdA8u2MbDZLmE5svy+085sA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lst8TnSiML5LpyN5aPPqBD06Dc7/ZSSvEypazJ7We43IY3JmeSv0RGpE7Zks+bjeq+44I+1TBBEFPOIz4cg5OgyaeeIrS56b7E+aVfPFO/nU59cTWd5B+o/tqOsZwjkHtout2Yvc8vLbFj0N8Ex+pVj6cqm+ZJednBiZ5rfLxuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XaJP8who; arc=none smtp.client-ip=95.215.58.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XaJP8who"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Zwdqyn7Po0/V3YhxFxmEYdA8u2MbDZLmE5svy+085sA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792039537; v=1; x=1792644337;
 b=XaJP8whoD8zIwv8Zmxv81EjqP1MRdtt/6QYShjsgwUh6tbednZAbaWz+z4QtAagX7qWHLX9v
 4RQwC4TH0rgaLOOj4KX9nQduvniSzyu3nFUwDY9eiUqnBJftj5g+uGeHb5QA8eIjQOOp8OJsjD4
 n1qxPJSI4qYr2HoPuEe/RB5I=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2f3efe6c18917ed9;
	Thu, 15 Oct 2026 04:45:37 +0000
X-Mizu-Trace-ID: 2f3efe6c18917ed9
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: kas@kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	vbabka@kernel.org,
	jannh@google.com
Subject: Re: [PATCH v5 6/9] mm/collapse: drop the collapse_possible() wrapper
Date: Thu, 15 Oct 2026 12:45:30 +0800
Message-ID: <20261015044530.58786-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261014171145.3292736-7-kas@kernel.org>
References: <20261014171145.3292736-7-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Wed, Oct 14, 2026 at 06:11:39PM +0100, Kiryl Shutsemau (Meta) wrote:
>collapse_possible() only forwards to collapse_possible_orders() and turns
>its mask into a bool.  Its three callers can test the mask themselves.
>
>No functional change.
>
>Assisted-by: LLM
>Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>Reviewed-by: Zi Yan <ziy@nvidia.com>
>Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>---

Reviewed-by: Lance Yang <lance.yang@linux.dev>
