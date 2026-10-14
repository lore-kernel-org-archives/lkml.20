Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88A4481AB3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792014347; cv=none; b=EfTKFDuT5HgLGOC4JY6grvJcrVWhRdvxCI+/bIln+Q1brgeei0v6jRHrOa/jR1bXJ5jhf1kYBiEscL/UX4kk/EwBgdjXiL6WdyFVr4F1dTgkfoNZU7vSRVj2YEP+MGRed6m9HCfSLPHBvcZOjzhWquKn36drmvgyUBHH2Gu50K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792014347; c=relaxed/simple;
	bh=kI1/CEYNAj4Fdv6wThuC0jJmOoS4Xg8SPY5cfihhk/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rPXrQ+xXR5tmbg3OBB+3WByFdqK2Tx87lStTazp38Vi4Cc6UnElX8Eni08czgVTny5tk0H3WAaEY/00nRnDnZydRAKuCigyGQfUQ1Z6lOnuu83Xg9ctzAJlojku+3Fao4UkKrN7lpbq6Z+mdtc7qEBj5NWCZAwxabMuYoTVYCR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hmed+UF3; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hmed+UF3"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-89d4030cc57so884499b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792014345; x=1792619145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l18nddR02Ly5yUEL8+YeO6wSXsyRxbRSYGcpS6xzygo=;
        b=Hmed+UF3h/2kUTGTrc6Ti+m6K0dbuxD/MkxIsrlB5Q2satveenSB2lBzlke0KVXmo+
         u/2HTqw40e/zEoTeVz/ztP4K20iB6LtaM6SQl9nn+AezXP/Hkgi9r+ZQXJKWqXQsxRCT
         S2oLLP/Duw3YRhWox2yDFIULIXOfjU1iL8+U+8V3FCZ8MuDHyUjFwn/vmto12SdQzMxb
         ji02e2v9/9NaTnDgco4wL3YlwI4P9r7lrAM/wwBF+5vE1t7Heoiv+abd3CX81LvRTIwQ
         i+YXLoEUldAah4V5IfGri0igX9oarZmbxYjniK4Pezqj0oHAbpA97eRon2kekzdUEP6h
         lakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792014345; x=1792619145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l18nddR02Ly5yUEL8+YeO6wSXsyRxbRSYGcpS6xzygo=;
        b=x1bCUhHZSDs05kRswIBG2Kchu00ZdFY5DHvg6m7CIx9iVfoB2usf72GSY9xf/80e9j
         0L0YqSLgt+BWBBxaOKE+yAjjcG/jCBBWyKSCDaSlhsMkv6FQM4aTnwpymjROY0qpKJga
         Z2eJ8AunyFRVNsKo06MbPB/wR0qUo36WGQlxEj9niG8epQ++i4NsavN/ZQLwEeAZueNO
         2LJaQPW24cCRpE0+duyvzwoQtJVfsBwmyIHV8bSLUAGnyjTVFYDk871i5v3/Rpm+NBJf
         x2fy4VReq0cAB53UhcT8aX2j5XxzG2TLykWjzlsYJop/DgxjObXrbBv90P8mk6DprGZ5
         NcOA==
X-Gm-Message-State: AFq9FYLipIBSET5m1UnBVGR72YYZB76D48wzGkhyYkDCiVGvGa/HLUpK
	RhvJvprjFYmyAnJZhA3FCfh9yedjC5kPtKlQF/WE3zCvuPYzHgriYvbzUPBABVvf3UI=
X-Gm-Gg: AYBFou0o00Vl4JnL47QFboqLxyVTQGWr6m1tHXn4gM7eiAjeei85aKyQtknznbYCLkk
	UpQu39V1L75xsHivFW4PRpXLul4ao7K80CQBZxy8JAksBSfry/hsfJXFakFUdFGGbnRHrNCSZNo
	90LDObQ0RAnrPeN7m896xynaMDgeq8ndvOMX4b69njVcL3jljkI5Hhj2VBPobzXNT24DO6McN3j
	j9qCbyTft3SJiFM6PqxBaW9hOgIf/N7iMFaE8Au4GH05atDaNbJYTHwgzG04SLkIB9Wwliuodj9
	x69k9DgzcNNf19LE6iFdnVujVK7oT0SOvHsoIGs3kXiEBwsVee0yfKWsjTBAHOvn/yxzixmNIzW
	Owo0i3+5rXQUq9PKQUYfnMnJtUW0tdneHfl0mV1HoeF85PC0Nl1yMmXzcpOal8Ns/ESzjF6KFH6
	fUYXiKcwpj89xbGml3ciKh/506ig9pzTIPgP842FO86j2jHtpuLiKmJ0Fh/NKrJZjMCXDJ0u0BY
	5U/TpIwy2Wj2lT0/LB/PbwlG//+XkHb0DNtCj3WPGQQ8bh2DDavohZ92HrBQ5zTcXN6YYfBvBIK
	LskamHGFKmeQ3Fw0aQWVQEtYDiiiYoCAPQ==
X-Received: by 2002:a05:6a00:1818:b0:886:4070:ceb8 with SMTP id d2e1a72fcca58-897c7ec59femr15310243b3a.56.1792014345179;
        Wed, 14 Oct 2026 14:45:45 -0700 (PDT)
Received: from DESKTOP-TJS95SS.tail460ce2.ts.net (36-232-253-46.dynamic-ip.hinet.net. [36.232.253.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d802c33fdsm1539946b3a.22.2026.10.14.14.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 14:45:44 -0700 (PDT)
From: Yuan-Hao Hsu <aa9736195201@gmail.com>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH v3 0/8] batch lookups in follow_page_mask()
Date: Thu, 15 Oct 2026 05:45:39 +0800
Message-ID: <20261014214540.574-1-aa9736195201@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811025157.1632867-1-riel@surriel.com>
References: <20260811025157.1632867-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 10 Aug 2026 22:51:49 -0400, Rik van Riel wrote:
> This series changes follow_page_mask() to return a page count and a fill an
> array of pages, instead of a single struct page, so a walker can hand back
> more than one page per call.

Applied the series on current mainline (3857c2fe5449) and ran it
through the mm selftests with DEBUG_VM and PROVE_LOCKING, a race test
that drives get_user_pages() and pin_user_pages(FOLL_LONGTERM)
against mprotect/MADV_DONTNEED/MADV_COLLAPSE/fork on 64 kB and 2 MB
folios, and a core dump of mixed 4 kB/64 kB/PMD mappings with holes
and a PROT_NONE page.  All of it passes with no unexpected warnings,
and the fast path numbers did not move.  W=1, sparse and the cross
builds for arm64 (4K/16K/64K), i386 (with and without PAE) and ARM
nommu are clean.

pin_user_pages(FOLL_LONGTERM) over 64 kB mTHP, the whole region in
one call, median of 15, base -> series:

    16 MB      138 ->   15 us
    64 MB      566 ->   60 us
    256 MB    2318 ->  249 us

(4 kB pages at 256 MB: 2361 -> 1065 us; 2 MB THP unchanged.)

One thing worth knowing from the 256 MB run: the unpin side goes from
94 to 180 us.  The unpin time is the same on both kernels at 16 MB
and 64 MB, which points to a cache effect rather than extra work: the
batched walk no longer touches the tail pages' struct page, so
gup_folio_next() in unpin_user_pages() takes those misses instead.
Net 2412 -> 429 us.

The one change I would make is on 7/8: the pages[] fill and the cache
flushes now run under the PTE lock, up to a whole page table per
hold, while 5/8 moves that same work out of the pmd/pud lock.
Details there.

Yuan-Hao Hsu
