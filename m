Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFB73F9263
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 19:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791661934; cv=none; b=TcbcaFTOax5FE6f7SPrIknkZdwWDFsxV+28k2uz146pH10qJmXkajZvSzuoBndLvbSaEQlwbsnOpKuTH0uAq4LnSp5P891o/Lbv0A2O9nFPYaBrERaneotFu2Relv0XQf3PyJSC78zuOLbT5FyPWkOZ4S381ew8CsJBZZ12/D0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791661934; c=relaxed/simple;
	bh=dL4opDuSGM8SqBsN/dyfejmt4RUNeFM6kqBSJ8frFoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W9lPcIVBMT7MM+ee53+nTGFP5Zmd10nK8WC5cO6mQkdExQ7FuJYF8RAdaUuUW/+ll1jqfz08aN8xcMSWr0pgbaFH8IQrYcOvBWLEDzevNUxRThQfRGTgqv4NHL7XNe6Nt491B453xABg993f4KX28LX0ZR3modT0T0RJD2Ti+S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDt3vNJG; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDt3vNJG"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-887beafb714so320017b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 12:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791661932; x=1792266732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OmemQ6H4HcfXPuin0N8xQGUXoQ66JkiD41KqXO9jNc4=;
        b=aDt3vNJGT3YYlss6aN8p3sAngMYdT3gJ2u5Jm+ew26GLRk9jx0IBpKjahPDR0Mjj0e
         X+pshDwj+NwsVJZtOJJLSlpzl93kgV8ENgLuR2J+It3oBOWwxFo+HUd+W1H8ZkUyjjLy
         XFPukWNI6rPgUjmRlcsBCKwHcs3HwWWCnVNS4Gbp+gFmTHJRfwAdJGLuEYQZ66aDDrma
         UmjcnyYastNFFxIqULxI44hHo7U2GPfpMDsEGXXqVMlLy1LYkOiKgV4mhfuywNGXx7qE
         QNqpLCCG4vmM+PLYFtN3dFlbuPQlF3+67zopENQI+WzCOjCT1pxToach6V1ghzYx8H0B
         XSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791661932; x=1792266732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OmemQ6H4HcfXPuin0N8xQGUXoQ66JkiD41KqXO9jNc4=;
        b=MTN3oP1F43HkDY+pSLQUPPvqrsVKhOIeLoqT1tVJMKbksg4pE/HNTSSo0udSPxT284
         IA9Q2q9bBRrRzzpi80/moInDEWbqrqhn80nkuoAdGD81mbBEP3wUTnkpDdW7CgtKC3dx
         M4kSF9P7axmiNyGOWvWTy+J0uEPZhkbmyiPbZ4+K3Yi1ohsEpW+h3GwjcL3utgGy+PuH
         WJBtuNPn4VKj67c4lRXP2bONlzKxX5zu83lLadBWhQ7tmGvLRSXSEsgD38yBfNWYp1Cs
         6O60Tutj2U3aOci45MnXEx6vjsEVanc7vSrq1CPI88F0YnScxR+yUfS/rVIgoHt2ykZF
         ObWg==
X-Forwarded-Encrypted: i=1; AKwUvBxnbp3sAUY7z0Eh6HWoJi09w6ayWLJlOK1gHEEZxX98sEJS+qwguWC+g91HyBBEKVipheWkDYpe3wLPbAg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK10iE2PmvSOYAu6yriR6JYRCZ8WGtqDrFmHBkr5fdXvU3vZH53
	1GcSLYlK6Uq+tsdvt6EMO4QCmY8M8Q+tY17EUx7xvuL/yBYAJuJ6qp6i
X-Gm-Gg: AYBFou1Am9fFRoqF1yvsLc1HCVxtJyi65kJoxCNWH6OQFTC/WXsEpw32rSG9tOOwz9y
	c8NKjiJgB/8sV7t2hRJpPzETku8m2nmpfmRxydQHUsVMbmSHmcZlNxW+MLepvS+W4TbR60B/OdM
	NgbK6K+EBjiSqhiMm4zQgYL+Ev3o/nC0aHWnYnmpdYzIfNDmyxVBupKfhT6DzDA/DVxpsnNOcfa
	6rtw+m2VUJDNi/pFgkqNGOhiFiGTX4viCcubXIPkpNsFQ9cWJnkmCHax2yhs38pU6UZWoNMkPuX
	der6m91pYAOwF69h/WneHyCAYmlEft+xbbnFN8XasgvRzg5bE5oRnN5CXYJiNCuNo70aVcjiuSe
	h/TVcZpTccSKtmIioLlhsVb9V8FO14SoDQVx150M3crHtLfnaOWJlhf/MB8TbHoyjm8EfKpm9FG
	p0IM6RGGfwNREWtGlZMe7sk8bY4EnTrp9xpi9NCC1BeAxogfgjNyyw5sYhpgP6MjKbxxf0+xAm+
	WPxDZHno77UyykY6t7JIOrPC5HFrnTfQBGzqblP/rnk8gmVxJi39yV5JHmd2BdEjF/BOHBdRpwy
	xvgsdpB1eh3paJzfsyh2E462YuAN6verqw==
X-Received: by 2002:a05:6a00:1f06:b0:881:d48e:7138 with SMTP id d2e1a72fcca58-897c43df755mr4695645b3a.4.1791661931668;
        Sat, 10 Oct 2026 12:52:11 -0700 (PDT)
Received: from DESKTOP-TJS95SS.tail460ce2.ts.net (114-38-131-92.dynamic-ip.hinet.net. [114.38.131.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-897fb87c459sm2153250b3a.50.2026.10.10.12.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 12:52:10 -0700 (PDT)
From: Yuan-Hao Hsu <aa9736195201@gmail.com>
To: Rik van Riel <riel@surriel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	liam@infradead.org,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Aristeu Rozanski <aris@ruivo.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/gup: batch PTE-mapped large folios in gup_fast_pte_range()
Date: Sun, 11 Oct 2026 03:52:02 +0800
Message-ID: <20261010195202.689-1-aa9736195201@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <7dd4ec994502233cdc09fe5c4369adc89168d738.camel@surriel.com>
References: <20260917083747.786-1-aa9736195201@gmail.com> <7dd4ec994502233cdc09fe5c4369adc89168d738.camel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 07 Oct 2026 06:47:06 -0400, Rik van Riel wrote:
> Since this is lockless, the PTEs could change under
> us between when we walk them in folio_pte_batch_flags()
> and the batched try_grab_folio().
>
> Is that race condition safe, or do we need to re-check
> afterward that:
> 1) the ptes still point at the same folio, and/or
> 2) the folio still spans the entire range, and was
>    not split before we grabbed the refcount?

It is safe, because the batch only runs after the first page of the
run has gone through the unchanged per-page path: the folio reference
is already held (and for FOLL_PIN the _pincount already raised, with
the smp_mb__after_atomic() in try_grab_folio_fast()) before any of
the other ptes is read.

2) With that reference held the folio cannot be split: both
__folio_split() and folio_split_unmapped() have to folio_ref_freeze()
the folio to the expected count and back off with -EAGAIN otherwise.
So folio_nr_pages() and page + i are stable for the scan.

1) The per-page path re-checks the pte because it has to pin first
and look at the pte second ("(1) pin, then (2) check pte" in the
comment above gup_fast_pte_range()).  For the rest of the run that is
already the order: each pte is read while the folio is held, so
seeing it map page + i is the same state the per-page path is in
right after its re-check.  A pte changing after that is the race
GUP-fast accepts anyway: the other side clears the pte and then
checks for a pin or an extra reference, both of which are per folio,
so it sees ours.  try_grab_folio() only adds references to a folio we
already hold and does not look at the ptes, so re-reading them after
it would not tell us anything new.

The pmd re-check after the grab is the batch's counterpart of the
per-page pmd check for THP collapse (pmdp_collapse_flush() detaching
the page table while it stays readable with interrupts off), same as
in gup_fast_pmd_leaf(): if the pmd changed, the extra references are
dropped and the next iteration bails out to the slow path.  The other
early returns in gup_fast_pte_batch() happen before any extra
reference is taken, so every bail-out leaves only the head page's
reference.

fork (write_protect_seq around the whole walk) and the read-only
FOLL_PIN check (gup_must_unshare() per page, after the pte read) are
unchanged from the per-page path.

Yuan-Hao Hsu
