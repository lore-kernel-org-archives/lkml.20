Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289729;
	b=g3jTIiQw8XSZsFTL6j/ddB4m4WBbEGW4c8bqCUWdlkd2ExnWfus6pxtK9Gj4T9sS1xoL
	 ASMGQ9GfcA4Ud/7jW5PJU2Hgo5i36o2nV5hSt6356FObrms5v1DgypPxad7rvP0ORzAxw
	 bJeUIj9+NxT01sLJVVvd/W8sPwdllBnYflP2kpMcE7oSshN4xIiTPuzpUhn8r+lqHqHX4
	 +hOX5iXgKoo70DfTYn8TFlJ2axovo7GzofAHkT6JFc1DRHYPkihfo+mVyQl0vHv9HAqs4
	 uP50H0z78/ykdJwyndn/sdS50q/ZM+byDOOxa5QKk5oXA/CjqqAUvPuL4Pp8Nl6rMCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289729;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qlHsy27E5D3YFabLkscnO6Hr0slQj6Qu+mskenxvEzg=;
	b=Qp8BCo4LLcqXSsFujRam3CSBxucAIDhz1eLKM4LMQMWw+Q+k07n62ZxBUt8Ls4YNChP3
	 5GG2//hbxa8fi1tQpKYGYykVIEv0aRPqFjwEewTSt3iTBfdb1qmUJwqO9+WcJPZoaiRWQ
	 HR1XTms5sf326P6ZuGDp+T5rfNTjdVekybCOcj5ZMiLZFhU+Spr0G4/1HqoiS/mHHAt+s
	 ojEJVDFVpTQPksbp94VX7q6VUwu/GW1569JUasQPf0T7IQSVSTsHErVD53dDVRReFK7Ju
	 BPrlZXPxVSHkXeUbMnk4TTbwINYofW0tm7VtkeUy3kxB8EWju5rWZduj7CKT6FDOBmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UrMkwU5d;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3547606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3547606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UrMkwU5d
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdd4dafdce9so649810a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794289726; x=1794894526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qlHsy27E5D3YFabLkscnO6Hr0slQj6Qu+mskenxvEzg=;
        b=UrMkwU5dJFPj0lHRqxwYyPE4Xv29hrwlH1N/nziQ1cXBKEANU05Y/4SEcDQ8iBGk3G
         1ESJ5TbAE9JHFMbEYl72ogNknH1tIJMY32+UtTKYKpxZkWActMFFWBovE2d5LUTowAwg
         iU2qwPXogAKNSN1LwOGsmqgHIoUXxcbRvJy78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794289726; x=1794894526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qlHsy27E5D3YFabLkscnO6Hr0slQj6Qu+mskenxvEzg=;
        b=RulZ8yTILRyP6agKPUKCfbxm49NKR+0rPPI4n9UPLypv6UFshIS2sCcqahMfLfElnG
         OSiKUyMQjsT8tUukIbdg9xN2XKT6STLwSupa9s/wbj0/1tDFpW0a++XETTmqagfZHNHD
         dlnW8bQaGCJDYKEJxyn3bu52KwbmG7BFVb98ikjY1OkGq/UR0UAg146f+RNiZavSrQqE
         zC1ITIm3HOOa0z1see8Ld2EA/xwCdNpBVx3Ye645yo3OxZW+8j4JpnJOKo1sTepROt22
         eqXFHJ/2r35/EcWUuAZdwXXl3t+J9VqbXr7PZ7NOLzM0pux75rFYJXzOBHsDoHNj0WCT
         cz8w==
X-Forwarded-Encrypted: i=1; AL+hErF2raQFn2Xg82O+gjxAHx2ZLz6wqAqaCQGPEIi9CJ5tlStQnlYlMoUEvqcxnqeYHPBC5h5w5ZGRc2808Lk=@vger.kernel.org
X-Gm-Message-State: APuU4Z87tXowQj51afUSdYfEcd1ntcYt4lKN01IlGgpfgxcfWL7EM4le
	q+Iaee5pcoPKC1qxlhQKKOZ5Chrb9oAMVCjKrokcnLnnAihzZP5CsqIUISzVz24MMg==
X-Gm-Gg: AYBFou3Wm4FENmKIRHXw6tx0sqcd+JN2CgdJwXUzRM4N7U3Ic0SqUV+YqkuumlgKljh
	P/y2SFzGtcM72g+DPhbGVUOk7sOsXBOoTQyrjxtsFCQ75TwScUAJan8E5mjRKiH5qH1lgSiX14s
	HGKG10QxEaFofn0WRWYUGOaRMN6t1mNADW/uT8UMFmMjUZwFCslxD/Q/xc5FOLo7GFF/MWGd7iG
	mLfLk4IeL77Ug6c1dcdmHHK2N7pi4hsxSCVdVez93DVNw8gWouvi+CoC5yGJHccNx+Rd9oh5WEK
	BbRmeiiELe92kTrFvRrNjOiB3zPpHISODWrJc41khGHuPAY49d7GOG/AbmWZPkO5sBY7DpjO/ge
	iJ0I4o+wf+jA+GRF8+eBRnne06BZD/qA9BHPHJkunVT3hrf7bKDJ7Pmpst0RCFbkx1M37q8L1Vk
	7eFN/bn5j8DgXt43QbOVVzN3pDivj94Qt3fSZJw1VYXc/z+H6hMDElRBAUpuD3YE6o5qW3nYRNM
	/4kC25+1CltD7l74/BLYhIXvv9lOpTx4dGk90A45RwfYPqTxP86H/jBIoc5vzdWoFhB6ZlbmTf/
	uqCOE46XV8s5yEGkLwmLYHbeKD3ppdFGKxgOBIMqihlbR+Cd++G0SCnIRuxWTE1vHm+hx/OrFLt
	k/FdMfyu0/xEPBU7obQ==
X-Received: by 2002:a05:6a20:244d:b0:3eb:39fd:badf with SMTP id adf61e73a8af0-3f188c51a46mr1510768637.0.1794289726009;
        Mon, 09 Nov 2026 21:48:46 -0800 (PST)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:e137:9384:7cd8:6e40])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d67e53asm444634a12.5.2026.11.09.21.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:48:44 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v2 00/11] zsmalloc: redesign object alloc API
Date: Tue, 10 Nov 2026 14:48:05 +0900
Message-ID: <20261110054836.1515030-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both zram and zswap already have per-entry structures that store zsmalloc
handles, so allocating a separate handle_cachep object per stored page is
redundant.  This series embeds struct zs_handle directly into zram and
zswap entries and drops handle_cachep, saving 8 bytes and a slab
alloc/free per stored object (2MB per 1GB of swapped out 4K pages).

It also folds zs_malloc() and zs_obj_write() into zs_store() so we don't
take pool->lock and look up object location again right after allocation.

A simple zram test on a 24-vCPU VM
==================================
165 fewer kernel instructions and 0.7-1.8% fewer kernel cycles per write;
lz4 single writer +2.3% IOPS / -2.6% average latency;
24 writers +0.9-+1.0% IOPS; no regressions.
Memory: 8 bytes less per stored page.

v1 -> v2:
-- addressed Yosry's v1 feedback (too lengthy to mention here, Yosry
   posted over a million comments, or something very close to that):
   split-ed some patches, squashed the other ones, added handle
   alignment run-time check, added 0 PFN defense, etc.

Sergey Senozhatsky (11):
  zram: drop stale comment in write_incompressible_page()
  zram: drop get_slot_handle() and set_slot_handle()
  zsmalloc: return handle from obj_allocated()
  zsmalloc: switch handle type to struct zs_handle
  zram: check mem_limit before allocating zsmalloc object
  zram: allocate zsmalloc object under slot lock
  zswap: do not free the entry if its pool is NULL
  zsmalloc: encode 1-based obj_idx so valid obj is never 0
  zsmalloc: embed struct zs_handle into zram and zswap entries
  zsmalloc: fold zs_obj_write() into zs_store()
  zsmalloc: populate new zspage outside class->lock in zs_store()

 Documentation/admin-guide/blockdev/zram.rst  |   4 +-
 Documentation/admin-guide/mm/slab.rst        |   2 +-
 Documentation/core-api/memory-allocation.rst |   2 +-
 Documentation/mm/zsmalloc.rst                |  22 +-
 drivers/block/zram/zram_drv.c                | 146 ++++------
 drivers/block/zram/zram_drv.h                |  10 +-
 include/linux/zsmalloc.h                     |  36 ++-
 mm/zsmalloc.c                                | 285 +++++++++++--------
 mm/zswap.c                                   |  28 +-
 9 files changed, 293 insertions(+), 242 deletions(-)

-- 
2.56.0.506.g506a7eabc5-goog

