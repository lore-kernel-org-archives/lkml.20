Received: from mail-pj2-f31.google.com (mail-pj2-f31.google.com [74.125.227.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C3543DEB2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 22:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790721960; cv=none; b=XfQ76pESVL6gFJG/9qo8uWEFg8LZWCcMU01EgYns3E+eGQM7U8UYLYYaiFaojcELfCT5vAF82Fl4S6qpBiWW9hlHnFcq37Igmx8gzhKNHgdffI3LTq47Dds66+gKMt3ESDC5fMxnHLF1oGId1oXs/dEETW15T5DYNwxLhd2FVKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790721960; c=relaxed/simple;
	bh=QlZhMBC7erX0o82v5eBZqAvu+h54fNvPvft6OtXD0Wk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s0Xxss+eVHyd6vSGSzfMQkA+wT2spKI7htYFSdvn3uL3d9qXah/FTDlAnDJiu1uKiAoKe+Dc6aRWe4lQthWvalT9h8f0lty/P4WAQd1SWs9Ya10FbNhYneFsW+g9NozxTVPFUVKkRBDxRav9VyBs6fLGaK6sPppjW4qydXYSybo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpYF5XYG; arc=none smtp.client-ip=74.125.227.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpYF5XYG"
Received: by mail-pj2-f31.google.com with SMTP id d9443c01a7336-2dd53691be5so30994265ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790721958; x=1791326758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KJpn1LLVw4O01H0xs9gRR2we3Er9QCOaDBy2tAq0mzk=;
        b=jpYF5XYG+YZU/VSpx1jWbQ1iN/5SP7gdQaLC9ZNw1apkmbbF/yBJqrEdHL7VWcQYud
         fZdmVXGdY0vUrW+WGyL+Y3kyM4u6hAo3pmIpfdVgsJGBlmpEQ1/8VV0D/adZd6Hi/K2D
         Or88/EFpGrrHy0QUxOQgEnSiE2ZFnPipyxjzjpluvONV4jL7/Uy6MmEyyx96kaZKA3EM
         tn3Ho240f4KbvTHZHZPgvzZgwo3jsCiGyQWihSGjOoOpZ3OJqB8uQ9321JuLUpfbfW4q
         NFvbGkx9IsOP6tnQTbg+m9GnzbNzUMVwi3KoJHMyqrXqN8DZSXvXcndwz8/ki1DtEDcB
         Qw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790721958; x=1791326758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KJpn1LLVw4O01H0xs9gRR2we3Er9QCOaDBy2tAq0mzk=;
        b=bF516PnfCw8DGbA3jf3gBvJKkgyW+VylP1kzGopnlENtpep8KHOaxw5kb9Hf3I+N+U
         Ih45yfwXZ+M9TrONKCh7fG6Tz0mc10pdck85othH68LGpPObZDnPaTKplcSJl4oFXMY/
         9fNo2LHih7pdIL5kOzi8ZlpUBfuBSsNU9INgL+I4kksFbReS9cmUUGaDBWAhPPw5beMN
         XFHYvLUiFfrSRyZYF3/dekv1y3vGtPb+5mhw+ELurcBTnNiv7il5g4S9xp+sPts9f4nT
         iIlTzZqv4oD2LEWJ1WRed8jmBXhsP4pomwQcI1igB7OG2qk1jJDtitHnEUweA9N9dts8
         0aUA==
X-Forwarded-Encrypted: i=1; AKwUvBzAoV226D+RvMGno1TYDNDOCL2kWOgsEKrNc/4KYieVv9NdCm03rlCz7T1H3WULOKxh2746AQVvS6i70pY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKlKO1l3Mll1s+LovM414IN7cnCT2iuSB0dWKglw+/yhZDhjpG
	Pmqqmpm69MJNPrvS86U7krYE1DSnQJ08/X3pBW7imOQDu3m3eIPJ5g+/
X-Gm-Gg: AYBFou2NISLJVkFZbRiKhSsolgYLcIyMeyKLWU5aF0XzNwU0aeLTJqAh/UsEQRtZz9z
	zAoyCtFZ1DoKb7RKlXu1sZ+jvFBEt/hciKaa4fhBolPIdzmg39PMcahwHjp00nc+52uI08h1Ysb
	1voz6srTJNztMlidXDnSPpPqI40PRPsAKrNb1cGyVev9Y0CmwPnoTvozTXwizDS0cIiL4L3zFLT
	dOD9mK/QzPCs3Z2tLzZo5xXIEy0sM5d8qDHHoaOjNpZwiryRmt0dknsLd61As/I1e5DPsaAErQw
	jM906selEyyw2i1BOBP1oGDPxma8I6ZCbVGRNgcuLZkVmhDk/myAy5TmJmyvjR7pfWmk9dwTeD7
	zwe5e276+X8Whs2VVNkZ6bFc4zGbVJ2jeCYaHpkXkYiYcNBQDspYzqpBpgxDgQSeWPHfvgN3lZr
	4j7WcVlzmeck6iHUrXqtUG/8OeKbQg37WDD25urSZVhYPOOhop6vCd1VpKVLAgH00SBp2/c6+U1
	wUY27QKzecoo3gSoeT6pCARDHH8ej+nvQTxRpXYJLjHde/43gjnWpBU4aqpMX1TpKqqj1vQG8im
	MskPsWohAGSGKoDuJgsY
X-Received: by 2002:a17:903:3847:b0:2d9:2149:57c0 with SMTP id d9443c01a7336-2e2de5278dcmr4178115ad.22.1790721957951;
        Tue, 29 Sep 2026 15:45:57 -0700 (PDT)
Received: from DESKTOP-TJS95SS.tail460ce2.ts.net (36-232-241-4.dynamic-ip.hinet.net. [36.232.241.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2dd859988sm1759625ad.61.2026.09.29.15.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:45:57 -0700 (PDT)
From: Yuan-Hao Hsu <aa9736195201@gmail.com>
To: David Hildenbrand <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	liam@infradead.org,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Barry Song <baohua@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mm/memory: reuse 16 PTEs of an exclusive large folio on a write fault
Date: Wed, 30 Sep 2026 06:45:52 +0800
Message-ID: <20260929224552.467-1-aa9736195201@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <82738d2b-9c2c-474e-b90a-60a1140b5bd6@kernel.org>
References: <82738d2b-9c2c-474e-b90a-60a1140b5bd6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 24 Sep 2026 20:46:06 +0200, David Hildenbrand (Arm) wrote:
> The patch needs work. I disagree with various decisions
> either you or the LLM came up with like
[...]
> I tried to see how to implement it cleaner. I think we should definitely
> start with:
[...]
> Entirely untested:

Thanks for writing it out.  I took your two patches as they are, on
238650ef6c7c, and ran them through what I had for v1/v2.  Nothing
broke:

- builds on x86-64, arm64 4K/16K/64K, i386 (+PAE), x86 without THP,
  arm, arm nommu, riscv64, powerpc64le, s390x; sparse and W=1 clean
- DEBUG_VM + DEBUG_VM_PGTABLE + PROVE_LOCKING + PAGE_TABLE_CHECK_ENFORCED,
  with the mm selftests, my 12 COW scenarios (vmsplice, PROT_READ VMA
  inside the folio, soft-dirty/uffd-wp counts, mremap, holes, pageout,
  FOLL_FORCE) and a fork/pageout/mprotect/vmsplice stress: no warnings
- arm64 under QEMU: 64K folios go from 8,200 to 520 faults per pass,
  contpte_convert() from 512 to 0, and contpte_ptep_set_access_flags()
  from 512 to 0
- x86-64 (i7-12700KF): same fault counts and pass times as my 16-PTE
  version; the fault that handles the block takes 720-730 ns instead
  of 740-750
- Redis on 64K mTHP (BGSAVE, then 1M SETs): faults 262,100 -> 18,900,
  CPU 1.53 -> 1.38 s, 640k -> 715k req/s; THP-off control unchanged

> * Hardcoding WP_REUSE_MAX_NR_PTES, likely should be determine differently.

Same patch, only the constant changed; 256 MiB of PTE-mapped 2M
folios after fork() + child exit:

  WP_REUSE_MAX_NR_PTES          16     32     64    128    512
  one byte per page (seq)
    faults                   4,161  2,113  1,089    577    193
    ms                         5.6    4.7    4.2    4.1    3.9
  one byte per page, random    7.0    6.0    5.4    5.2    5.0
  one store per 64K            3.2    2.3    1.9    1.7    1.6
  one store per 2M: the fault
    that walks the block (us)  0.84   1.13   1.71   3.01  10.32

So roughly 0.35 us per block plus 20 ns per PTE, and the gain is flat
from 64 on.  For where the number could come from: arm64's CONT_PTES
is 16/128/32 for 4K/16K/64K pages, and fault_around_pages defaults to
64K worth, which is 16 on 4K pages but 4 and 1 on the larger ones.  An
arch-overridable default of 16, with arm64 using CONT_PTES, would fit
the numbers.  Your call.

> * Marking all 16 PTEs young+dirty. It's somewhat the same thing as we do in
>   map_anon_folio_pte_pf(). On arm64 it's already fuzzy with cont-pte. With
>   transparent coalescing we'd actually allow it directly. So it does feel like the right thing.

I think it's right, and for a simpler reason: nothing looks at young
or dirty per PTE within a folio.  try_to_unmap_one() marks the folio
dirty from the merged pteval of the batch, ttu_anon_lazyfree_folio()
checks folio_test_dirty(), folio_referenced_one() adds the young bits
up.  The faulting PTE is young+dirty anyway, so the other 15 can't
change any decision.  I tried the most sensitive case I could think
of, a MADV_FREE'd folio with one store per folio after fork(): two
MADV_PAGEOUT passes keep and swap the whole 64K/2M folio on today's
kernel exactly as with your patch.

> I also wonder whether some part of the function could be factored out as helpers for
> other code to use in the future. I also suspect that there are more cleanups to be had.

One candidate: numa_rebuild_large_mapping() does the same
folio/VMA/page-table bounded walk by hand, so a "batch around this
PTE within the folio" helper could serve both.

Thanks,
Yuan-Hao
