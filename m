Received: from mta0.migadu.com (out-58.mta0.migadu.com [91.218.175.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C690496D34
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141673; cv=none; b=skN1dfOsBIw73G+U3mTYrbJD0IXB+CQK3CZSwcYtYxergYwsOR0hCMZnv9Q/tTw7hoZ18DVDUwxvvTYMxXehOhkhARYIYCtzF0ySnsOqKnfw0p8PsYJYfqz8RBYM4m660MgoekBpO+oH8UAu8L8MPFxgrWnK8OyHV9EIhSWzTK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141673; c=relaxed/simple;
	bh=3mw9opfOMB3dc75dXEFi6/zB3WIELWle4wCvOjsHcss=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nLBQPhaFX+e5zcLrwhouIi3/K5gYwoc8LngeUCLSNLbUz2iDo+98PiVvoM24V91kUogPX1KgHhK6cLThwDg52w7J9J1hrucN0n0wijYAGCqOtA0Qwaoti0TpD9jsvNLGdXnTYctvYxZ8wrvFS8c288SSEXyLvhXnWrKVXqzdn/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lMVX98qN; arc=none smtp.client-ip=91.218.175.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lMVX98qN"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3mw9opfOMB3dc75dXEFi6/zB3WIELWle4wCvOjsHcss=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789141668; v=1; x=1789746468;
 b=lMVX98qNzhtgsB96w3biKLxvhF5fYLRHW1uYUzs/eZXKfUlJWqOtM8bhpELc4nyRiAeLrMQ0
 Zpa8En8ziw9KF7eTBQ58oBqaH0aareXMCuEKMgOSaxrAIIz8IqDBtlZqeSj0+dCrXxYZEKhoccq
 ObGRlZAS0UF4ALZjSRED439Y=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bbdea84a56ccda99;
	Fri, 11 Sep 2026 15:47:47 +0000
X-Mizu-Trace-ID: bbdea84a56ccda99
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: baolin.wang@linux.alibaba.com
Cc: akpm@linux-foundation.org,
	hughd@google.com,
	david@kernel.org,
	ziy@nvidia.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	ljs@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: shmem: ignore sysfs configs for shmem forced collapse
Date: Fri, 11 Sep 2026 23:47:32 +0800
Message-Id: <20260911154732.31220-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <b1829ac0d3f38217f031854ff0f40abef614ac0d.1789098446.git.baolin.wang@linux.alibaba.com>
References: <b1829ac0d3f38217f031854ff0f40abef614ac0d.1789098446.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Fri, Sep 11, 2026 at 12:04:33PM +0800, Baolin Wang wrote:
>According to Documentation/mm/transhuge.rst, MADV_COLLAPSE is expected to
>ignore any THP or mTHP interface settings.
>
>However, after commit 6beeab870e70 ("mm: shmem: move shmem_huge_global_enabled()
>into shmem_allowable_huge_orders()"), performing MADV_COLLAPSE on shmem
>will depend on /sys/.../hugepages-2048kB/shmem_enabled being set to "inherit"
>(although that is the default), which can cause MADV_COLLAPSE to fail
>unexpectedly.
>
>Fix this by returning the result of shmem_huge_global_enabled() directly
>when MADV_COLLAPSE is requested, allowing PMD-order collapse while ignoring
>shmem THP/mTHP settings.
>
>Fixes: 6beeab870e70 ("mm: shmem: move shmem_huge_global_enabled() into shmem_allowable_huge_orders()")
>Reported-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>Closes: https://lore.kernel.org/all/20260908125105.1510704-7-kirill@shutemov.name/
>Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>---

With the Fixes tag corrected as Kiryl suggested, LGTM!

Reviewed-by: Lance Yang <lance.yang@linux.dev>
