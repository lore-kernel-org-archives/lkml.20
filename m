Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689FC4A4EEE
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790001590; cv=none; b=I7FaYKww8slHgUdCZQLE7gXXFjBYNgZiT0tcc0maoLN4rdJjNTRzrYs7uTIA6r3LUvLPjLFnxH7THTOq6wqIVHC5QD5ahIIzqEaGN91EfRbujTwxqlgE+0vyPQP7Qvya+Uv5qXvx4MyGtj2IuQCvWfvYRCsrnbDda0XU54auox4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790001590; c=relaxed/simple;
	bh=aAE5j6SrbqONZgGTPePo/gdUPdVE5UeJQ6LeV/17nq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tf1f3aMKnbgAnVLA5RKEcrXaKn/XDlXQwFEJxczCBHQ9mwjKvaq8Fzv5vdDATDbu9aQnOn1ubFPa4X6SAtWNi1725+9CrCvVBi3RRzUEAmuOiTHasexUcQ6FbSiHKJX7xKG/nnEnTVB3jNCKF3paNTMSL5io/ebvK8zbia5fEgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=cmzQjMyL; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="cmzQjMyL"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530c602630bso37924051cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1790001586; x=1790606386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6JeVamdoCa9AA0LbUgrFt2azIreJSKrfNCLuX4lcnQY=;
        b=cmzQjMyL8Mj+ja7qee/yD+Y9H+hZ2xp+Rf2fhsnpQC1AHpeXAyW12OXMBClUF+iIn5
         FytH95byVR+5ovfjpunPkGVcuK10ZPlEvpJzHg3JgaPgfc+mi3WQiNrr+DY+qPcsIXpn
         fO/DeNF+hMrIoIlA3b+N29jckrUZBXsusqFgdQBoAc4e0tj4FPEOPJIzp0oAUJkNrhOX
         +Et8XHYI92zxIcJTsd2/gMfGMZRwRNXfSw132UlH67GuKADGul1HDiDT1vbVB9IymwND
         7bRacuuXa1iIs+CSPOFF6eG41YnwI+Tvi/6axH/VHj6QVxSbc7JycHRvUenzbzf57/gI
         NncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790001586; x=1790606386;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6JeVamdoCa9AA0LbUgrFt2azIreJSKrfNCLuX4lcnQY=;
        b=ksQBD/Hx3FpaoivXn/O7Ka/h1eMhrk1MphfLPyv/sepLSoJOixFd7CUxw5GahXGUDW
         zsEWQJexbtK5XaWr+ToI2UkkTFYcwimUS195uoxd6HT2cJavqeWY3JJh88AO1EuqJJwQ
         9BjbXrf7W6afsCUhd4x1YmbhrcXUUasCh506K6MHE6ChXb0JfmlX0pVYsBmnqf2Qfplm
         TzaF11v1WvecS+nbbOVYbowihLp7ucNtHv/5HzZUplH7Gxb6A7az8yDam7YeXqv8UUv6
         lTf0/JgKga+P0s1/rnDwqtsB/eHxAbx0XedwbOenaCZ+6rZSZUR907nXZcg+9malsMMz
         31sw==
X-Forwarded-Encrypted: i=1; AKwUvBy6+wtHQOEAaJSCO99HB9zOyiRxUyQ6U1nvzgWgPCLZGl3fE4l7bVZWsomsMjKIfOffkma8IPpS74IbLO0=@vger.kernel.org
X-Gm-Message-State: AFuF++lIiqCPIM28t42+Sz5IbH39UZhPAEJFehONtUj5fIckExsfFftE
	eFfVIqsi7lXZAQmZ/fKYAzb44hm94gnxpBJkhERXz3af0ApqsPIOl6NvFf29sdfgAsA=
X-Gm-Gg: AYBFou0vsQKhnXH3vcQQosJ5HRyEcXwL1CwuUCJnY9QUHXnkRkzvIli/UwCPPRBogmt
	poATTZOkU5dEkAKZ5jfolGlnEuRtM1wLMl5Izr2N1NOAaNSUhsEhW/fBYsBJOGa0BFSUlcrpBD+
	kJMUQOcbKPVS+nu7+8mvjy+aQ4li5Nhwb4XaoSASdNKTnJ8mHdwpd+QLJvpwFxbVsEV4bcKoXFt
	FLT7+kYMrGRRfPn8NGJVEqJtb7yhTtHhqtOm/r+72CeoI+dtw5xRwmf4hj5pEwxZk2GxGusG1sh
	o1FNxZ5W0Sw8pJmG1CGRJG5f+uama/IbVim/eMwUyCJYbQta8P+actifm2CIbHxUXRtUpSa009X
	K4K3jGWVIOpS7ijKq6Co96Qc3wEoOvoyrevhpWe+OuHp4mGD0WGJb1jJPY2LkLx5OdPP/VWYjPR
	x5BryXsP7nwBdAKxVsH/wdsthR87ckDMuLni79gu/CUBzOpm7jsIZVAcPABwbpw0jQi1QM
X-Received: by 2002:a05:6214:2422:b0:90e:8cae:7fe9 with SMTP id 6a1803df08f44-913fc94a61emr8317866d6.24.1790001585748;
        Mon, 21 Sep 2026 07:39:45 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260aa2065sm69381076d6.42.2026.09.21.07.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:39:45 -0700 (PDT)
Date: Mon, 21 Sep 2026 10:39:43 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Matt Fleming <matt@readmodwrite.com>,
	Salvatore Dipietro <dipiets@amazon.it>, akpm@linux-foundation.org,
	abuehaze@amazon.com, alisaidi@amazon.com, blakgeof@amazon.com,
	brauner@kernel.org, brendan.jackman@linux.dev, david@redhat.com,
	dgc@kernel.org, dipietro.salvatore@gmail.com, djwong@kernel.org,
	hch@infradead.org, hch@lst.de, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-xfs@vger.kernel.org, mhocko@suse.com, ritesh.list@gmail.com,
	rvvandan@amazon.com, stable@vger.kernel.org, surenb@google.com,
	willy@infradead.org, ziy@nvidia.com
Subject: [PATCH 2/2] mm: page_alloc: remove ALLOC_NON_BLOCK from
 ALLOC_RESERVES
Message-ID: <arFBr22V60BMmVpl@cmpxchg.org>
References: <20260905174239.99e31515fabe220aa7d8e6fa@linux-foundation.org>
 <20260910114602.926944-1-dipiets@amazon.it>
 <aqQlUr-1h07G8JWM@cmpxchg.org>
 <8d6a8a63-4adc-458a-b548-a47bf5ff8eb7@kernel.org>
 <aqq8pWI0u1IZNWHT@cmpxchg.org>
 <9f415dc7-adad-4161-b20d-7c3173f50ff3@kernel.org>
 <arFBJdYaRx_iJNDA@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arFBJdYaRx_iJNDA@cmpxchg.org>

1ebbb21811b7 ("mm/page_alloc: explicitly define how __GFP_HIGH
non-blocking allocations accesses reserves") stopped handing out
reserve access for ALLOC_NON_BLOCK on its own: the extra 25% below the
min watermark is now only granted on top of ALLOC_MIN_RESERVE. But the
flag was left in ALLOC_RESERVES, which produces something odd:

With the ALLOC_RESERVES match, __zone_watermark_unusable_free() doesn't
subtract the free highatomic pages for them. So in the slowpath, they
get to consume regular blocks below the min watermark by the number of
free highatomic pages. The highatomic reserve is capped at 1% of the
zone, which on any decently sized machine is a multiple of the min
watermark: GFP_NOWAIT can drain regular memory to zero.

The user-visible result is brutal hiccups during bursts of GFP_NOWAIT
allocations under memory pressure. On a 32G box with an anonymous
working set, swap, and a filled 290M highatomic reserve, a GFP_NOWAIT
burst drove regular free memory in the 28G Normal zone (min=60M) to
28M, 0.8M and 0.6M in three runs. Swapout failed to allocate its swap
table, reclaim scanned 13M pages to reclaim 200k, page faults stalled
for tens to hundreds of milliseconds. The machine survives it, but not
by design: direct reclaimers eventually fail and start unreserving
highatomic blocks, until the allocation succeeds or the reserve is
gone and the OOM killer runs. That reserve exists for high-order
atomic allocations; here it is destroyed to bail out a GFP_NOWAIT
consumer that was never entitled to the memory.

Remove ALLOC_NON_BLOCK from ALLOC_RESERVES. With that, the GFP_NOWAIT
burst is stopped short at the min watermark. No direct reclaim, no
stalls, no failed allocations, and the highatomic reserve stays intact
for the requests it exists for.

__zone_watermark_ok() is unaffected, since everything it keys on
ALLOC_NON_BLOCK is already nested under ALLOC_MIN_RESERVE. Update the
flag comments accordingly: ALLOC_NON_BLOCK just means the caller can't
block; the reserve math belongs with ALLOC_MIN_RESERVE.

Fixes: 1ebbb21811b7 ("mm/page_alloc: explicitly define how __GFP_HIGH non-blocking allocations accesses reserves")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
---
 mm/page_alloc.h | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/mm/page_alloc.h b/mm/page_alloc.h
index ad89f83d1dab..c8af79decbd0 100644
--- a/mm/page_alloc.h
+++ b/mm/page_alloc.h
@@ -32,12 +32,11 @@
 #define ALLOC_OOM		ALLOC_NO_WATERMARKS
 #endif
 
-#define ALLOC_NON_BLOCK		 0x10 /* Caller cannot block. Allow access
-				       * to 25% of the min watermark or
-				       * 62.5% if __GFP_HIGH is set.
-				       */
+#define ALLOC_NON_BLOCK		 0x10 /* Caller cannot block. */
 #define ALLOC_MIN_RESERVE	 0x20 /* __GFP_HIGH set. Allow access to 50%
-				       * of the min watermark.
+				       * of the min watermark, or 62.5% if
+				       * the caller cannot block either
+				       * (ALLOC_NON_BLOCK).
 				       */
 #define ALLOC_CPUSET		 0x40 /* check for correct cpuset */
 #define ALLOC_CMA		 0x80 /* allow allocations from CMA areas */
@@ -58,7 +57,7 @@
 #define ALLOC_NO_CODETAG       0x1000
 
 /* Flags that allow allocations below the min watermark. */
-#define ALLOC_RESERVES (ALLOC_NON_BLOCK|ALLOC_MIN_RESERVE|ALLOC_HIGHATOMIC|ALLOC_OOM)
+#define ALLOC_RESERVES (ALLOC_MIN_RESERVE|ALLOC_HIGHATOMIC|ALLOC_OOM)
 
 /* Flags that mean GFP_ATOMIC */
 #define ALLOC_MASK_ATOMIC (ALLOC_NON_BLOCK|ALLOC_MIN_RESERVE)
-- 
2.55.0

