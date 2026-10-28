Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193153;
	b=BdB/Z4txmtP81ygSui0bJwP8dlGbpK3J7yf3OmkDaX0b7OIvVfZ94HzyFRNrHEaF8FXj
	 5XVJfKylarjYy++uonjEK4JTt2HNDvxW+f9j+fPdfecwJhiMW0ZHkbMb+je0Od88cHBVW
	 ODrO8BOsC6ZZ6LiJ2m5qT5IS4/dyphzpH62yGMVtZw/WxSeXM7/v3Bo3t12Z+Iw1hYi5c
	 8vFS/Vw/k6G2DuOk0gX7FpzeqRimYk5j5/Azg0SOR6w3IzBemROh8dqdxyeLIbP4V2wxQ
	 il+mmgC4AtgL9g+fmd6SWCcXeRsR64UpgQAXUXF/ZRTxR4dewNlAQZClZAwIwqaCapw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193153;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=mHGE9nXbxuB8GQ9t8LPv8LBGWevl1d8ukNIHXAQHhiw=;
	b=JKl/++xRqO35QHG2g67Qd2SPxlBx535bj+Mzi1iOYXBrn7isdNbBBQMudKBUZiINOkyh
	 pMWD7vZUL2bQmvo7uIaboClTGot3Ebhqm8Nm1xC0fKtqM3dRvT799IV/QH52A9LtZXM3e
	 dkvUYnUSFgojC3faXYE0jZOi3cenfjqyXKRgl5tkKd1qeV4Pf959pDTOQKHFXrWFsMGxE
	 LOVRnnV4RtO2NMOl4VXCw9knRSeapfi0o9xpA5drCtYEu1cpdirLEZTOHt/ITeuYhoJmK
	 Knt30+IlQe+P1FcH2+X6vE3napIjBTVeIDF7s0/ZwmhY5kOhcwN4mVHIwvuBq7oP8XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fGEzUaEr;
	arc=none smtp.remote-ip=91.218.175.17
Received: from mta0.migadu.com (out-17.mta0.migadu.com [91.218.175.17])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D700A606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D700A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fGEzUaEr
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mHGE9nXbxuB8GQ9t8LPv8LBGWevl1d8ukNIHXAQHhiw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793193149; v=1; x=1793797949;
 b=fGEzUaEr8w61+lFUJkekZQi4IchHFI1oGuTpYnywD4uq7NYgtMIB4KLVEQTX9tu3L0+pzd7X
 uJGPjUqkyRJ7/LGJdP9Yu5YYeiFDulf+ETYGKM/YTzW7aaDU7ISl7xwUjOV6DayGav6115xQZ23
 2+9Gu5zJq6L2EXkbbQRvZNpM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id db747fb4ed3da529;
	Wed, 28 Oct 2026 13:12:28 +0000
X-Mizu-Trace-ID: db747fb4ed3da529
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	hannes@cmpxchg.org,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	ljs@kernel.org,
	kasong@tencent.com,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	kees@kernel.org,
	peterz@infradead.org,
	jannh@google.com,
	pfalcato@suse.de,
	hughd@google.com,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	willy@infradead.org,
	jack@suse.cz,
	ziy@nvidia.com,
	lance.yang@linux.dev,
	riel@surriel.com,
	harry@kernel.org,
	apopple@nvidia.com,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	usama.arif@linux.dev,
	kas@kernel.org,
	matthew.brost@intel.com,
	jhubbard@nvidia.com,
	peterx@redhat.com,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	osalvador@suse.de,
	minchan@kernel.org,
	muchun.song@linux.dev,
	xu.xin@linux.dev,
	chengming.zhou@linux.dev,
	chrisl@kernel.org,
	shikemeng@huaweicloud.com,
	nphamcs@gmail.com,
	youngjun.park@lge.com,
	gourry@gourry.net,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	jgg@ziepe.ca,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 11/46] mm/huge_memory: properly handle refcounted PUD mappings on fork
Date: Wed, 28 Oct 2026 21:12:21 +0800
Message-ID: <20261028131221.42261-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261027-fixes_core-v1-11-6f74bec9a5bb@kernel.org>
References: <20261027-fixes_core-v1-11-6f74bec9a5bb@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Tue, Oct 27, 2026 at 12:17:31AM +0100, David Hildenbrand (Arm) wrote:
>copy_huge_pud() copies device-DAX entries without taking a folio reference
>or updating mapcounts and the child's RSS.
>
>For example, MADV_GUARD_INSTALL sets VM_MAYBE_GUARD on a device-DAX VMA,
>forcing copy_page_range() to traverse the whole VMA on fork. Any remaining
>huge PUDs are then copied without accounting for the new mappings.
>Unmapping them in the child decrements accounting that was never added.
>
>Use vm_normal_page_pud() to identify refcounted mappings. Take a folio
>reference and add the child's PUD rmap and RSS accounting before installing
>the copied entry. Pass src and dst VMAs consistently instead of src and
>dst MM. Move the TODO.
>
>Fixes: aed877c2b4257 ("device/dax: properly refcount device dax pages when mapping")
>Cc: stable@vger.kernel.org
>Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>---

Reviewed-by: Lance Yang <lance.yang@linux.dev>
