Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323653;
	b=YpVZB/TawzL+ooeaTO8LdPKZYGMhHr/bx22c69Jqfj3+h4GWLF4mGJDum/cC+/0wP8B2
	 tba2S8k/3rhkpwrn/k5sfKcymw36tWR5CgQEZv78+z3fwo6BeTvn2CkMvsxxV48ewcIhB
	 bO9pLQiGJzJoKihg42iQ6vLSY/1M2ONOhvZKiDysPwcuPnHMfQy+lz+1j6L1N4xmSGvCL
	 HuqNLHkkPG777SG6hHiOcnNzcNhIfRpJTsZcEJRGxwyLnOAawb1IQQhH1GMENNdDSLQxr
	 O/enWklO8p52TzV+ARipR5qoDDvaXN7WbU1Y6hrK//nfA/4VJIHgcHdxR/qyUyVUZrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bcKBtRZaFb+mZfYAGiwpdRY8hHzgqYhO1XHVeJRGJgE=;
	b=dpfrTUh96pnj057AT7lEWtGkcQfcxAMDGGsR3WtObOVFbRNPU1eBVj/PGKgNbpd6DlDM
	 gcqUYLg0jlMga73lHowQFjJO3sFFcikJHJUCvNfYLvCnzwgJpeLRYaHtT6ZnUuIhzWGWg
	 2e2xr0yJe+aeMzFYqd7qWRERg0w+zk1xTtltYYS4JuVl3CRnsoS14KZmZLOWmETk2rhVx
	 A1+t1oq8spM8Qm9rUYCnI7y8XpEliNuEWlpfqVuGkFD5OEhusObfnpzI4zQ3Rav1X1YNC
	 otyFCqe+ibi4YaGjEk3rVM6lZHVSaK/CEyxEzJZhYQgev7Lf/5PsGyOrZjX8iG392NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oR6cMwq6;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE60460A260E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE60460A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oR6cMwq6
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b309147589so22989707b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794323652; x=1794928452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bcKBtRZaFb+mZfYAGiwpdRY8hHzgqYhO1XHVeJRGJgE=;
        b=oR6cMwq6lxh/Ii7xNi2aaSWRcP6NXX1MsgAn/+sd3oXpAmgAgClUrW9ZXOew/9q6Mn
         XdiOy2cS7Wb+oDXUsz9FuZ39PWSVhGV/pZoQBunW9LG8w5oLjawb6DalitUso75qeacA
         bSnwLovpdZusV3D1/LJug71TBKjz8uyRNjp5Lhl84RkklYyGnyz9SEDITlxiW8lRllNZ
         gj3NEJqSJWgIOcthpUHoXzGg+iMkot4w8Y150XN5UPLwZKpnOUHcBd1l345Lkq86eeI0
         xrIhX9IAk75wOZdz8bKeJFq4CiBOWwooSOhkPAYHE1wo2oCfJ0CpfpTN7A7gI2IYPs+c
         dwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323652; x=1794928452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bcKBtRZaFb+mZfYAGiwpdRY8hHzgqYhO1XHVeJRGJgE=;
        b=D1Iu1FP44tfro3h21rnDeeZh+cJbCTqpW84NGpFAL2uh+RySTrnnREgMe7dPsBXJUG
         gZZoXFv2zOpT4A6gOLuLo2RPEHaaRGiWIVBgr7RD0Jbgj88vZ5v4qOXPe4nIUt8cN2G2
         c3dDV1lSEvXLV80lxHfJ1Z13fAk4tEYZZ9ZQmWbEaoCYCUfLW+Rf/s4hG/Lr70D/C9B5
         hfIdAYoaRDDCUfMewpxnlPGidZTkkFC7/qUnMw5CNXo1ls/ana9qWQ/ncdCxLOrwwSDM
         HuXuDiiIV0VhWnCBxi97FtQK8EOhy+WGsnNaLnitknT2Lw8KIPfV4ylmkCc4EK/ODh62
         MgeQ==
X-Forwarded-Encrypted: i=1; AL+hErFeU+GnM0g3xE0FU8c8wDLnfRQBxKxaKmcV/VceOypMDb3DimOmIrfyt8NGVY6lqPjNR3Vxsk5sPbEhqv4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2uVxOYbjveQ4H1XlDdLBqjnH/yRD0rfi0XXx8/Qny3sN6AHDw
	JLXC5FSex9sQRZ+tf3xUoPjKQ3K6ZVTfHpU8833lKak8ZLUh1+eV55wg
X-Gm-Gg: AYBFou2qdkqRl/reLXKR7lhzaeaNHjoMVJRd2IsUn+FnpTckAZltMpekQ3yp2e/dZ/J
	w0PZqBR/+nUmQ80izU7YtfpZFQ1XDyPj6uyS6ieS893HF4CRNp0PIH4j9xOO2hpEkaiyC/6H+g5
	sETa4hrI1aOBf8olQr9VGW4Swb7s/+D2i+QW/NxAOBcD6v6YfXBbGrtrAnIAiLlAHafH/Q/UmQm
	atfzt9ur3rV86CLC0RPb1gwVh6bLBHKh8ALcUokqS+GpR73b+n4AP21L6LxtVIjtGBwfp6kjUhK
	f6dOUH6DPRkjEJg9sphF1PDP3gVJPc4SYn0BLbDAVlKp4ofnsg95E34vUxIv/pRZDIFAl1gK08h
	0Mv3z85RngtXES1/AV7YY2ylmpHcF9o3YR37LS9AavryZGH8CzztGfIZU/94893aU3wdcHYFxV4
	iTvU3fVASZFo9NN1gFbpY2IUEDmEFTsAU9MGLDaKY+A3ncksDIdH5UCBAUibogFBrqPuVDl5X2h
	h0FvmYaouTDR4/G89945qoH5GIcmJC1ztEjKCQHJR8PR4b+WvFT5AFKVIOMRyEmL61AltqX/vqk
	FNq5okk3V2cRAbPAsjIWiCmAQsYRmdj3KRuguF7fvFtaLeH3sY9ZOhXUcAWmkRCfoLbIxgsC2th
	uDX5egPvdKefYDeiCRVPpU7LcOv/5EqlJGXKaBA==
X-Received: by 2002:a05:690c:660a:b0:8b0:e7a0:ac5b with SMTP id 00721157ae682-8b39288d821mr18964047b3.1.1794323651688;
        Tue, 10 Nov 2026 07:14:11 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:45::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b39343d4a6sm21481757b3.37.2026.11.10.07.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:14:10 -0800 (PST)
From: Nhat Pham <nphamcs@gmail.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	hannes@cmpxchg.org,
	david@kernel.org,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	ljs@kernel.org,
	kasong@tencent.com,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	willy@infradead.org,
	brauner@kernel.org,
	linux-kernel@vger.kernel.org,
	chrisl@kernel.org,
	shikemeng@huaweicloud.com,
	nphamcs@gmail.com,
	youngjun.park@lge.com,
	ryncsn@gmail.com,
	sashiko-bot@kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/3] mm: vmscan: allow writeout of swapcache folios without anon mappings
Date: Tue, 10 Nov 2026 07:14:05 -0800
Message-ID: <20261110151407.789960-2-nphamcs@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110151407.789960-1-nphamcs@gmail.com>
References: <20261110151407.789960-1-nphamcs@gmail.com>
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

Unfaulted zswap readahead folios can be dirty and in swapcache without
an anonymous mapping. pageout() rejects them before swap_writeout(),
so reclaim cannot write them out while their swap entries remain
referenced.

Allow swapcache folios through the filesystem folio check. They already
have swap entries and can use the existing swap writeout path. Anonymous
folios outside swapcache have no mapping and already return PAGE_KEEP.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/sashiko-outbox-181078@kernel.org/
Fixes: 84798514db50 ("mm: Remove swap_writepage() and shmem_writepage()")
Cc: stable@vger.kernel.org
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Nhat Pham <nphamcs@gmail.com>
---
 mm/vmscan.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 061fbd168d98..96201eae0ceb 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -607,7 +607,8 @@ static pageout_t pageout(struct swap_io_ctx *ctx, struct address_space *mapping,
 	 */
 	if (folio_ref_count(folio) != 1 + folio_nr_pages(folio) || !mapping)
 		return PAGE_KEEP;
-	if (!shmem_mapping(mapping) && !folio_test_anon(folio))
+	/* Anonymous folios outside swapcache returned PAGE_KEEP above. */
+	if (!shmem_mapping(mapping) && !folio_test_swapcache(folio))
 		return PAGE_ACTIVATE;
 	if (!folio_clear_dirty_for_io(folio))
 		return PAGE_CLEAN;
-- 
2.53.0-Meta

