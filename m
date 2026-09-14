Received: from mta0.migadu.com (out-98.mta0.migadu.com [91.218.175.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF4A22A7F6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789367617; cv=none; b=mEU3HmkKV2GiQhSTcTEuf5S/xDUMdKoFK0PtTHZT7u4xDbFl5n5iflt6sONT/lFnE26ExAFSYFsmkoy1VVzh6DOk+LH/1xTDZU+IFuIVyt0fkDVWemu18onilial1jFyNFZ54I/pR3nvR0AxBh8eTeJWVs+kAqEO3ecQQXF5Tl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789367617; c=relaxed/simple;
	bh=lNz9DH9e6AnUZooDBSooza8NOTOURgctjC5wmMiwXvE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=eb5iEW88Nru/aenl63z72444IU3eI9bfAsMwCw58mgGhJdg+vY4BKtdgpOwP64zBKXQIFx31FjbqfFhHQBZGhWhdiJuOdzUVJRxfL/T9E26CuNgPqqGliS4uigAumr+BZtu1HTI4BvTcaJ2VsADJewjj0v/lVwTH+YuXi35IZx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wtt6Q5TQ; arc=none smtp.client-ip=91.218.175.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wtt6Q5TQ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lNz9DH9e6AnUZooDBSooza8NOTOURgctjC5wmMiwXvE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789367614; v=1; x=1789972414;
 b=wtt6Q5TQ892Gzj/x1j7Yh0bdZp9xKG4y+EjUb2IXcQfd8kmO4z/EoXp2zp/8wtdvKYIcjDkT
 k31IOL3Ki1mp0BeR4rEnesuAn4ajGDE6IQ9gn5aYaMA6oKGpqXxkjWDP+JO9ixxvUhInkL9s6gH
 a2y1KJWKCNhVXuDufVaMOLe4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 4202f23c312eafcc;
	Mon, 14 Sep 2026 06:33:32 +0000
X-Mizu-Trace-ID: 4202f23c312eafcc
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH] mm: Remove unused exact_nid parameter from memmap_alloc()
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260914055130.44543-1-kaitao.cheng@linux.dev>
Date: Mon, 14 Sep 2026 14:33:14 +0800
Cc: Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Kaitao Cheng <chengkaitao@kylinos.cn>
Content-Transfer-Encoding: 7bit
Message-Id: <271883C6-95AA-4C60-B99D-FF93BEE695EE@linux.dev>
References: <20260914055130.44543-1-kaitao.cheng@linux.dev>
To: Kaitao Cheng <kaitao.cheng@linux.dev>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 14, 2026, at 13:51, Kaitao Cheng <kaitao.cheng@linux.dev> wrote:
> 
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
> 
> Commit ffe55393137c ("mm/sparse: remove sparse buffer pre-allocation
> mechanism") removed sparse_buffer_init(), which was the only caller of
> memmap_alloc() that passed true for exact_nid.
> 
> All remaining callers pass false, leaving the exact-node allocation
> branch unreachable. Remove the exact_nid parameter and unconditionally
> use memblock_alloc_try_nid_raw().
> 
> This has no functional impact.
> 
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

