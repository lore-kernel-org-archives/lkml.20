Received: from mta0.migadu.com (out-19.mta0.migadu.com [91.218.175.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036BE33E346
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131386; cv=none; b=Y9WWJDKHHJFzgORoi4mXk0j6YDTG3FcJ2rsXbzgBRJ7eBdBRHdrc59n/QD2Krwpo4tWwgpp2DPEUBE5rr8aQ/8lq0gY4ppqbFy2+d8vWgTcgOYghQa+EAPNSZDIebn5SMP4BlJUf4+/o7h1LFYPNDDfhPMBw2gz9JyOuPGOBysw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131386; c=relaxed/simple;
	bh=7DO70pOSnKfl2ZBvK6u/JIg2H0ORCq+ZJeqhlObG650=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=bXDlZFJWSOxjZdg4m2p5IyBjwXykQcwg0BJ5U0ZhxIb8KusdNL58btSyCMpHGaaic41/z3+T9+x6FnQ1o/bxTwLrkJqu2bBMW81cD4jPidIH4AKJMmpdsDBiFlpSDlYVckeUbTZvOgGHygig0lnNyhw//tHQ3zXgEiDMtX5ctR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eJzc0IdQ; arc=none smtp.client-ip=91.218.175.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eJzc0IdQ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7DO70pOSnKfl2ZBvK6u/JIg2H0ORCq+ZJeqhlObG650=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790131378; v=1; x=1790736178;
 b=eJzc0IdQI2Gx9shnrH8ambz6QEno0qMBvK3H0qciolkTaUN3mKoaOTsN9A0B7TY4z7fbpu09
 s9sLa3DsrLUKKYOnnJ2wlRSCbmNUwOx3dRIay2UgAU+y9hMyeeFlbuf16n3D0zZiAJqmLOY1RlK
 Dp/a+EP5VKad0sBvdEbPT9nQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id f8f061495026a087;
	Wed, 23 Sep 2026 02:42:58 +0000
X-Mizu-Trace-ID: f8f061495026a087
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH] hugetlbfs: fix stale comment in hugetlbfs_file_mmap()
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <tencent_AA61551D1F50E61F46C8542F5C8874512C05@qq.com>
Date: Wed, 23 Sep 2026 10:42:41 +0800
Cc: linux-mm@kvack.org,
 Oscar Salvador <osalvador@suse.de>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <7BFA772C-FC76-4414-88D8-A0E77087C533@linux.dev>
References: <tencent_AA61551D1F50E61F46C8542F5C8874512C05@qq.com>
To: Zhenghui Hao <zhenghui.hao@qq.com>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 23, 2026, at 10:28, Zhenghui Hao <zhenghui.hao@qq.com> wrote:
> 
> The comment above the VMA flag setup in hugetlbfs_file_mmap() says the VMA
> address alignment has already been checked by prepare_hugepage_range().
> That function no longer exists: it was removed by commit eff41389d824
> ("mm/hugetlb: remove prepare_hugepage_range()"), and the check now lives in
> hugetlb_get_unmapped_area().
> 
> The comment also mentions ia64, which was removed from the tree by commit
> cf8e8658100d ("arch: Remove Itanium (IA-64) architecture").
> 
> Point the comment at the current function and drop the ia64 reference.  The
> rest of the comment, which tells future edits to add any error return only
> after VM_HUGETLB has been set, is still accurate and is left untouched.
> 
> No functional change.
> 
> Signed-off-by: Zhenghui Hao <zhenghui.hao@qq.com>

Acked-by: Muchun Song <muchun.song@linux.dev>

THanks.

