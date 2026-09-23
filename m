Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E5D25B09D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790128964; cv=none; b=q4HXxYID2lXceGBwERsE3ngHwjHBWtyqN6e2O8GYIIruCA38y/KtOQ3NO/lrbwpYkckeh2qjZnGAIarN3sQa+I+GuJy1UhEmdqfA0ZKSpwlHElO7wwy69P/sDNtfrfUpqfaxT4XeFIcIPIvEFahrFsKAgYQUuU5vqxVJACD9Vm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790128964; c=relaxed/simple;
	bh=TsIX6yQSUwoWVAC5HopS7rehkR5EqUx4oETahpbNGoc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=nUt7XFOZFY0gdUpLEY9ryxg+AOLTwsnamiH0tsGmpofIoMS2jz16nG9uY8ylio4ah3sfXlZYfF4zOUtsXGakAg/uchk/e5O5YohW43mnPPSO9/EwfdnVqoF9vnNq7HLoRNhtddrqZywxLUA/Xgur96zv25ZnbeP1VC/qJ0Gri2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NpYuJQTq; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NpYuJQTq"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so345238a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790128963; x=1790733763; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VbKm/kGIQpgW9tqIi8f/Se1qKBM5wwm+Pgn76ddL94U=;
        b=NpYuJQTqoaADIo7O6R1WO7ONzkSQswNvBDzp9OVOlwirnoZQjSCmoYYhrv9w7+q8p/
         j0DaLZgvUd0FfyVrre1/VSO1wH1tqbJpWmVqVDJR6O/LWAOA/s6jiCOR8nbGwPciDLHB
         GgD6wJguJPt2+sqcKz/BmpwFNlamLEeuzPVL/xxIiXHj5uEV83ITnvMCbM439DdOG3Un
         7jkv6j+wvn1r73+mG/pTxfqHNsUS7zssw/b7V4/PTHNF+VtDX5gxkiAfQD2TGVF29vKc
         o3fgZCaNtPJPLA1JCtg/LuVsFe2Zj4m+YFMK0mtYqv3r1125byZaOOePyZNzBy7+Ho4c
         dQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790128963; x=1790733763;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VbKm/kGIQpgW9tqIi8f/Se1qKBM5wwm+Pgn76ddL94U=;
        b=vS/3FYVQbaMHEy8TlUU/WPiYK0mNi2s2E3vi+jQDBRaLbMsSljwwKQqnmmi/nJJKV1
         Uozyh55ADFr+3cCjAHHp49ni6j8dd7CwM3wNGAOqsl/NNI/BYmlvfvDwYSP7YKKy+z7m
         oISn8MFi5iqqErNOZl0eqicYLVAmDNfWd6p8RVwgAhMs5p30Jg974w6E1w6xNLvXkXef
         UqTPjzikPEJUijePPzUPY1HtLxrAiJTPUYbcBiUpxTPQbmNrF1LcOlpyxCMMVk20aLwa
         cXe0fNU6OhFaHL6h+joQ1ACOC94UtrB7yF8zGhF4CTJ9blzpgcfGDNMzHo6d9QM5chT7
         Pgig==
X-Gm-Message-State: AFuF++l0/0en8f4c3i22fCL+ZqWzDyma8J4ytT1mAtBQhunghJruCBl9
	PEvvt49ummtpkaj3YsLRFwawpRvrRj84KNN3WFTvWeykwkcaE296jM7a
X-Gm-Gg: AYBFou0GkI9Ld+qFzNnijZF0Q1R9NhhJIjPeOSuYtPEAsEMshT5fYKJ8A8SdKS/r9D9
	VMTzcjZFDIaHdPxKobSnqSBRm1aIq2ftYOacwXjzate6qa5jlMPkUyBlHPjo9X3wDLR9Ohqmq6K
	9ksPKFVxYn7cPXaZTNxkGtumNZgpsM3soLqQiO+WfCGcT6tUCd6Jm/OH25bFUub6a38ey+19P8r
	hiVZAHotJgc67lDedyHgLlEWPpNtD0txdEhuDcK/QCu8/Z/h4zzQkl7I955xV5paE3of4o5Un3v
	EBw+/UEvXRkaglqNwRNgaM/W6mQWvGMZoNCw+KzNXjsFI/JRTAqRy4KRTXhYX6hmsl2nCT31Zqu
	jWfEZWPoJNjvY8q7DgSKW0DDA8ahadnDEiQhKMRVcKZ0YZbhGeuGvA0bcMVRzfDJG1h/wj8eP5/
	JSnGxqsj9mYkEpXf4/AK5KjDN/cTDx/vy85tsR6BB3u135SVml5hsJVvub04dCtTaaXeUUDjdHv
	lwrvRaM3gt9HDZr5M6Mo2dpcsma1xtojdZNatip+1sdrClQkd4CjRjuj2QVb4/LA72XDf1DBEOe
	eU4=
X-Received: by 2002:a17:90b:5825:b0:39e:6c68:c77d with SMTP id 98e67ed59e1d1-3a07e6b5b65mr1128100a91.51.1790128962632;
        Tue, 22 Sep 2026 19:02:42 -0700 (PDT)
Received: from localhost ([153.61.198.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddee43dsm1937830a91.7.2026.09.22.19.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 19:02:42 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 02:02:41 +0000
Message-Id: <DLMBR82RJV2B.3401V0ZRMT392@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Yuan Chen"
 <chenyuan@kylinos.cn>
Subject: Re: [PATCH bpf-next v6 3/3] bpf, arena: check range_tree_set return
 in arena_free_pages and arena_free_worker
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <chenyuan_fl@163.com>, <bpf@vger.kernel.org>
In-Reply-To: <20260922072116.3570973-1-chenyuan_fl@163.com>
References: <CABFh=a6QOjBv1c7B0fw0AEqaBXiQJRh=8on5DUfqPC7hYuGBxg@mail.gmail.com> <20260922072116.3570973-1-chenyuan_fl@163.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, Sep 22, 2026 at 03:21 PM chenyuan_fl@163.com <chenyuan_fl@163.com> wrote:
> range_tree_set() can fail with -ENOMEM, but the arena callers ignored its
> return value. In arena_free_worker() it ran after PTE clearing, so a
> failed update left the range marked allocated while its pages were
> already unmapped and freed.

That's not a bug. The range is allocated in the range tree and has
no pages. bpf_arena_reserve_pages() creates the same state.
Nothing relies on an allocated range having pages.
The cost is page_cnt pages of address space.

[...]
> +	ret = range_tree_set(&arena->rt, pgoff, page_cnt);
> +	if (ret) {
> +		/*
> +		 * range_tree_set() is failure-atomic: on -ENOMEM the range
> +		 * stays allocated and its pages mapped. Abort the free
> +		 * instead of unmapping pages the tree does not track; the
> +		 * program can free the range again later.
> +		 */
> +		raw_res_spin_unlock_irqrestore(&arena->spinlock, flags);
> +		bpf_map_memcg_exit(old_memcg, new_memcg);
> +		return;
> +	}

No. This makes it worse.
range_tree_set() fails when the system is out of memory. Today the
pages are still unmapped and freed and only the address range is lost.
With this patch the pages stay mapped until map free, so the prog
leaks memory instead of address space.
bpf_arena_free_pages() returns void. The prog cannot know that it
has to free the range again.
arena_alloc_pages() calls arena_free_pages() to undo a partial
allocation. Now it can return NULL and keep those pages mapped.
Same for arena_free_worker().

Drop this patch. Pls respin 1 and 2 only.
No need for a separate series for arena_vm_fault() either.

pw-bot: cr
