Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790425;
	b=M0P0HPMAHeIHqrMnqNLeQ5N1WW2bC6OSPzVE3nArAuwLkykeUfL2wJH2CWLD0cd3ILy3
	 uHUNdjsYVrM7/6LoUHl7EOiEMcumkFI8TzdSISHFD1XU+XNgllpmVE4Uz/fU3O2gcI9hQ
	 XLFOaukjOJQ1LdhbjKZ+2/+oRZoq6JERZoD1YV6d3ugkqvOmoP198ZKhFqo9BHIAVn9cW
	 phImxMWvczCpFSvRI7T1I+pGoCjaAGled12FTvV6ExHmcaYz2EZKQ13pUN3JJdPvceKOR
	 xoFv/J6x7+uUUtZ5MHCh8xtW+9aioUnWhg5XZ8ULMbYClRq/tRbb9bKv/fnvvE/2ehw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790425;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=fo9bEsW5t26Hc9SH0ejPTKShLNAh7V21GEp0Jx6py20=;
	b=SGOx9rklVhzCPZ5oNTfWdj7kq3XvSztv+QjeIlR/wiuALx5blVqSppA6Tp+7fX4cmZVA
	 eMVso6PsSK4sK8yyyumnokWEMZZMGTWeATGsnC6dgSy87E03I+RSTVW1EBBzkERKgyEP5
	 7ftLntgJMU0fbBK3D/C3Ua1nVeUrFSglx6kMByl7i16yTq0wAZzCu5BzcjoQqs3ZGBU4e
	 pjIZZjBbxrg70y/XAN0/rHPXg0g06tZMHxgy+ecGqiZs7xEscxoU1gKWdjV/81LKss3c6
	 xPHzJYy8n80kjxgvOzcqn1wtMUkdTi6MzvRafexlyjlxzZHnsCP87DWGxdcqk78hBMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VCsr8u1R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FD3606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VCsr8u1R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 834131F00A15;
	Wed,  4 Nov 2026 11:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793790425;
	bh=fo9bEsW5t26Hc9SH0ejPTKShLNAh7V21GEp0Jx6py20=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=VCsr8u1Ra62dW4YSWnEHydsTVfubqQtSd11B+fhV37dsyWPqT3agEg+tjCNIJ/KIv
	 7iJWhJaTa4fdDb6ogncyOdgwRiK7QIHSntU/yQue6D3w3oMfOUNN/Gy3rt63L2Kdfb
	 3QF7i2wbhHMb9KoLC8tpOcZg0qXSDthXEGEj3g1COl9rrvGmqMhfZDi/UEFj3QwAGE
	 FMb8DnzAPkyExiRjQeYcGtL9YboP086ZsmOlNKzUf+iUgL0//lKks8ic4KnM/CbSex
	 M2EhPZz/JnXJZkt+L+/V6pURniCYTrifPqM3TDZ3mfySnw2RDeLfxX9othgyzdVARY
	 AmIMTrfBp1X2w==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 02/12] mm: hugetlb_vmemmap: unify
 VMEMMAP_{SPLIT,REMAP}_NO_TLB_FLUSH
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Oscar Salvador <osalvador@suse.de>, 
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Lance Yang <lance.yang@linux.dev>, 
 James Houghton <jthoughton@google.com>, 
 David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261104023510.260766-3-songmuchun@bytedance.com>
References: <20261104023510.260766-1-songmuchun@bytedance.com>
 <20261104023510.260766-3-songmuchun@bytedance.com>
Date: Wed, 04 Nov 2026 13:06:58 +0200
Message-Id: <179379041864.1868318.16588818729228128190.b4-review@b4>
X-Mailer: b4 0.16.1-dev

On Wed, 04 Nov 2026 10:35:00 +0800, Muchun Song <songmuchun@bytedance.com> wrote:
> VMEMMAP_SPLIT_NO_TLB_FLUSH and VMEMMAP_REMAP_NO_TLB_FLUSH do not
> describe fully independent choices. A split-only walk can defer the
> PMD-split flush to a later global flush, and a remap-only walk can
> defer the final remap flush. However, when a PMD split is followed
> by PTE remapping, the split flush must happen before the PTEs are
> changed, because stale large-page translations must not overlap with
> new small-page translations that map different physical pages.
> 
> [...]

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

