Received: from mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D56A33D6FD
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790742270; cv=none; b=cW6ITXiReAtYlhugsp6bt2UXkQjL4ZgawZNTtFs5J2F45Cn2TO6TfrkuqWStHvfejqO38K00+SRmT6qEhjC9aFeloUO3nosmqdTqnIl5Qu+AipZum/Pcidr6n3XRpsRVayGv1OX3xaWX5tL3NbGWAT/sGs4SpAF7+P5erw9i0bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790742270; c=relaxed/simple;
	bh=G1OKfOOyF6BwRdf3CIc0O5VCRioxKKHcn1/LjJVvnXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dPP0xhOPj9WKb8kLrUizHvFTrs7BOwOZVk5CYnlS9VXyw3CmqMNKs7v3f7UohP9KDxu+Xl/Dflo7M3eWZqhJe7LSm+GnJs7/5DeoeU5x5vDv4PfixZknHzBMCQ2hD4risyLX5NpFnbtV0IaIa1vy/PAtHVgUaKi2oxCq/EG2D3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GwMm2MUW; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GwMm2MUW"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=G1OKfOOyF6BwRdf3CIc0O5VCRioxKKHcn1/LjJVvnXI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790742265; v=1; x=1791347065;
 b=GwMm2MUWijBhthBi8hG8zZ5Nm1s/1YA6iUBGg3xheXoxv0Li3MlB1DXSu2Eqigdq9+vEWr7Y
 v5i4LqfskpFs4rhHdhZKa1FQMDHEuopfA0whBuycBuGFESUeWH3Sj7RUfU0ZXqyQOQYVR8/u4Kg
 0rVGxYkNhN2r3Lnl4ctR72qs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e9b7e58d84d31462;
	Wed, 30 Sep 2026 04:24:24 +0000
X-Mizu-Trace-ID: e9b7e58d84d31462
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: songmuchun@bytedance.com
Cc: maddy@linux.ibm.com,
	rppt@kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	qi.zheng@linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	muchun.song@linux.dev,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v3 1/6] mm/sparse-vmemmap: drop VMEMMAP_POPULATE_DAX
Date: Wed, 30 Sep 2026 12:24:14 +0800
Message-ID: <20260930042414.97599-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260929053231.66085-2-songmuchun@bytedance.com>
References: <20260929053231.66085-2-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Tue, Sep 29, 2026 at 01:32:26PM +0800, Muchun Song wrote:
>VMEMMAP_POPULATE_DAX currently distinguishes DAX vmemmap population in
>two places: it keeps allocations on the normal path and takes a reference
>when a backing page is supplied for reuse.
>
>After Device DAX switched to the common per-zone shared tail page, both
>conditions can be determined locally. DAX supplies ptpfn for every shared
>tail mapping and requests an allocation only for compound head mappings,
>whose PFNs are not optimizable. Therefore, vmemmap_optimizable_pfn() alone
>selects the correct allocation path.
>
>When ptpfn is supplied, the caller is reusing an existing backing page.
>Once the slab allocator is available, take a reference for each reused
>mapping to balance the release performed by vmemmap_free(). Although the
>buddy allocator is available before slab, no vmemmap population occurs in
>that interval. Earlier mappings are backed by memblock/reserved memory and
>do not need page reference accounting.
>
>Remove VMEMMAP_POPULATE_DAX and the flags argument from the vmemmap
>population helpers.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>Acked-by: Qi Zheng <qi.zheng@linux.dev>
>---

LGTM! Feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>
