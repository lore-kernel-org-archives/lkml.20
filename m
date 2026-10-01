Received: from mta1.migadu.com (out-91.mta1.migadu.com [95.215.58.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA72A51B19A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790864850; cv=none; b=XMz0YCsIhsUVQR4Srgi4T55kXA4k5kjkigUnYdYg3GfFBNgrxmAKOaxwsh4tfa3X8CJeRhL6uqN4fAc/coFp6rAtmHiEMvlNqt01OOpKe2XpFCXv3z3dDhzlumQDawSs7FEjRrQSi+IaCZlJvIt2NG98XLnievn42GpqqbHckTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790864850; c=relaxed/simple;
	bh=LJMXlOX6G72KgzwR6NBXyCt54iCm9KoR+tZW/E7WXfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a+f6kB+iZ7XiCC6uL3he+1ErYUQqLQb/oRPxSn0bqePhCQIR3MnyfRVAGPaXTUwOcusZkKHGxz0C99R+9seIJ8Gg6hysZKo8jJlSGUPnJCVfJSYAB1VBoZYn8G0wekztrm6v9t2Rsi7Ykk7EJJXngZ7w5KhvLntOh5j4F7QjdZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LVTy4xtf; arc=none smtp.client-ip=95.215.58.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LVTy4xtf"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LJMXlOX6G72KgzwR6NBXyCt54iCm9KoR+tZW/E7WXfU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790864841; v=1; x=1791469641;
 b=LVTy4xtfopRyUlAYWDLVtKCMj+4EgWXO1nQ0fG46RqRJUjp7fIqMLXmqhthN8jMJf1/v7612
 u9rC6eAzFrlpDUf1pKXbolfDhx9//AQxU/kwLWzht8cVvDU7g1MdZm+gCxheL1w846vXQGwKpW2
 4KX1fUZwDb+3jUNdDVZ1rTH4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 37d698b651d6e08d;
	Thu, 01 Oct 2026 14:27:21 +0000
X-Mizu-Trace-ID: 37d698b651d6e08d
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
Subject: Re: [PATCH v3 3/6] mm/sparse-vmemmap: drop Device DAX-specific population path
Date: Thu,  1 Oct 2026 22:27:14 +0800
Message-ID: <20261001142714.17172-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260929053231.66085-4-songmuchun@bytedance.com>
References: <20260929053231.66085-4-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Tue, Sep 29, 2026 at 01:32:28PM +0800, Muchun Song wrote:
>The common vmemmap path selects the shared page for optimized mappings
>itself, so Device DAX no longer needs vmemmap_populate_compound_pages()
>to find a shared tail page and pass its backing PFN through the generic
>population helpers.
>
>Remove the Device DAX-specific population path and let section memmap
>population always use vmemmap_populate(). The powerpc retains an
>architecture-specific compound-page implementation, so select it directly
>from radix__vmemmap_populate() for optimizable sections.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>Acked-by: Qi Zheng <qi.zheng@linux.dev>
>---

LGTM! Feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>
