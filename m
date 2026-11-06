Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973759;
	b=vIRDqym8zBiannYLGUhjPgSiUGvEJlIdM0sWAdX5aRT3kHReoRmvAYmL+R0C8A40mdd0
	 OxqGAaNItwoSXdqymUC0YLKL/sQzIyn9e9mhcwf0RtkAiGrXfNnTtYtdJhaarTMqqhS7+
	 OSpF/Zyw1TtrrxAOXqA4iBHArd+lib0Zv4uUgBc+Hl7NEJy+4/T1U/W1ZZg1Xr2ilZ8jv
	 9GRd4gk6xc37pAzfUv6+/JKQXihqgPpz/Am7jYdHqWVsAKGiUml4XWtCguJsvOnponEmE
	 KliEN3aL3IztxGsUDypoYNYr9ktRUEXOJVdrbRdorMpL+CkVfe8lM30vo2W57riF10Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=e+M+r/A/rmCJPclkzBuO9rIhmUCkVtBIaA38ECscytI=;
	b=od8Z5u/0T0ERNQZd+FyIJ5zp3xBs79sJdlQs10tzyI0MeqNui9xTmx6kOHOnl/euEVaa
	 QiNkMHxJf59cQggtmQaTkhGGZ9HdFAWeTGMZEo/A16qaLNCTfmh6oAGvbs7EzzVTqDHCt
	 wUucDghACVNi/CvzxYu/Ui43yY9JOXQJWELuWAE5wYdmvGJVp2/Qv21mjF91t6PfeT1+l
	 WedmVPnTXKE6j2b3nAZ3nM1i8ZyAsAdYtLGUEfdbsPSWyYT99Pm/7eqYFG6oZEVbbMFg5
	 Wy13Fk+Xf4HsoWr50jwJeqKUlPGZ4AcjMq8jULebpxEjCJngxSCSp4oQD1LiF1MmmHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bBQIyl8A;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06292606EEB9
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06292606EEB9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bBQIyl8A
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b3402105b9so4339457b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793973758; x=1794578558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e+M+r/A/rmCJPclkzBuO9rIhmUCkVtBIaA38ECscytI=;
        b=bBQIyl8Ao1yDGdhQgCePrYk9aDAvursFCsFmA+R/DIb6ng3gytJlFVrxAMmDLQpJOY
         sQzV7bOMTAO0k8WZn9LRGklPByPLghXu7c0bbCNhhnWVHimytqN4UXeH2ZjwzK6YOXaI
         a6RKKK9OZ8Xca0sS9m8eeXT4JC8FEXEzww0/zJRFZKenAH/G39jHiL39ZlzOQqLsIiZn
         Lm2/ao8nFVN3dy+96CW0gcFV+PT7iQniWtRMmKbkwFkbxgR1GaWwV0/8JC44GKr/fF+J
         2xQl0KKNdXjGFMHpI2qzLENiACI2oOpJEGVeiNoCS11C5bffakIk6C4PN23/U9eoVpnP
         gzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973758; x=1794578558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e+M+r/A/rmCJPclkzBuO9rIhmUCkVtBIaA38ECscytI=;
        b=FKQQk3PEoNtjk838RGQVBQr/vfsMJUCfTJnLX1KP8SrMzBvSHYc9SO9Z3H9e4QmKE/
         br7jF66yx2mDl6f6iUjxmPlQaoubo+okZ2IXvFaHNSKYAXUg+5QLZkWfUqOEFB8pJmPi
         wboxkUoKkYgwTT1guE9LN7sS56zxwxR0u1utae8DTmViQsTvvBIEJjphTZbnz8OBUVBe
         +FUTY+D6TlfkAOeWRG4HMAT75VrYeTdJrG0Od27AZDmQKV6zgbutCzBmKbZ/KA6TvMWx
         HEMW2Vq3tFhmGTKwrX7oQJd00/NargDyYtCOfXky939qelvqANFTGrCBm2E1Kd7Ydp9F
         BjRg==
X-Forwarded-Encrypted: i=1; AL+hErFh59I99YUa3mtiK3wgkuUp1RoXoULFa4p/WkQblN4ae/JrIT7tcIchu6y+PGxoo0ykN0bnEcoxog5z3p0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yrSIziVNg2HcoEqdygoe3QEaEVdbWGENj3VWMYRymtCDmOxAX
	mVoDhLTs679UqzHLdc91ceuj157LVZQgQjp0Wwb7BOl8XNFfVnLxUUmn
X-Gm-Gg: AYBFou3nKXNNBUqoxkUXsymAF7BZl0y0hIO1mw6QKOD0tYdwAXcRTJEZ/dHl47nm4v1
	f7/RBy3rxfCr3cmT2tnhSBZTyXax8jy8ebTdXxTaY/NvhBdTeCZbCv4KQPcIg3bXl2ny/50ay4L
	8V6e4QcIYbEGUGQrqyjoe5b72xlPAMh5B3CBbx7t8Bwjfv5ZJJf37FwDpq8irm5P6RR5F0jhR97
	CvhezHXVsm02HN+upv4wQNQTpxMm5Nn/B98HU/O5mFLEXOrUfu2ocF+tnqs0qlOpUaRPrQLyaRI
	nSbEyTwMAV80a3C33YMIo8BgdLFBW6+BMu8zwO9P2tux5Lns838ibz5bhraxdfRpEQkgZrFcH6g
	Pr/ATwpSVO3Yq1HOc26jJwJYM1as8wi6mdvM1Hmx0tovOnIL1SjpMRfQaq2gb6Kq/PZYEoh+fYa
	YGAXY2jWrSe+BghYde05XtMStQhGZJN7HbtMpFbf2dbE85LrHVJjy5XAtjJuTen5bBWAYopKKO0
	tESXMvSRnGFK4CajG99Ba0tT7lBHWvZT9lg+8fgd2CiPwbkBzqwO4gmHEmb5cS2VRyCMyvnY0r+
	KM2l2CIM2J/GrmErZXXH0mad63cB+Ej8Rkt2jlYDmwttrYsncx+zhvIGg07euqd7dsWZ2KwSj3x
	pj/+8CNhr+odnEasAWwBK9/GQH2ANyfpFwmit3TVVBLPLmDz0sTbDE0bRgr1T0WgmDS1+RRX+n/
	Ae/2gIHX4=
X-Received: by 2002:a05:690c:6e86:b0:8b0:effc:5d92 with SMTP id 00721157ae682-8b341920f73mr9340237b3.29.1793973757610;
        Fri, 06 Nov 2026 06:02:37 -0800 (PST)
Received: from lab01.myowncloud.network ([2601:cb:4000:1c5:5396:7ba1:d08a:ebca])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f5f525fsm19090677b3.5.2026.11.06.06.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:02:36 -0800 (PST)
From: Amit Patole <amit.patole@gmail.com>
Date: Fri, 06 Nov 2026 09:02:32 -0500
Subject: [PATCH 1/2] lib/genalloc: don't dereference a NULL pool in
 gen_pool_dma_[z]alloc()
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
Message-Id: <20261106-kunit-genalloc-v1-1-ba1ea397dfd8@gmail.com>
References: <20261106-kunit-genalloc-v1-0-ba1ea397dfd8@gmail.com>
In-Reply-To: <20261106-kunit-genalloc-v1-0-ba1ea397dfd8@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Fredrik Noring <noring@nocrew.org>
Cc: Christoph Hellwig <hch@lst.de>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
 Amit Patole <amit.patole@gmail.com>
X-Mailer: b4 0.15.2

gen_pool_dma_alloc() returned NULL for a NULL pool since it was added.
Commit cf394fc5f715 ("lib/genalloc.c: Add algorithm, align and zeroed
family of DMA allocators") moved that check into
gen_pool_dma_alloc_algo(), but gen_pool_dma_alloc() now reads
pool->algo and pool->data before calling it, so a NULL pool is
dereferenced instead. gen_pool_dma_zalloc(), added by the same commit,
has the same problem. The _algo() and _align() variants still return
NULL.

All in-tree callers check the pool before calling, so this is not
known to be reachable today, but the four entry points disagree and
the original behaviour is easy to restore. Check for a NULL pool before
dereferencing it.

Found by a KUnit test for lib/genalloc.c, which crashed in
gen_pool_dma_alloc(NULL, ...) on UML. An AI coding assistant (Claude
Opus 5.5) was used to write that test and this change; with it the
test passes.

Fixes: cf394fc5f715 ("lib/genalloc.c: Add algorithm, align and zeroed family of DMA allocators")
Signed-off-by: Amit Patole <amit.patole@gmail.com>
---
 lib/genalloc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/genalloc.c b/lib/genalloc.c
index 841f29783833..40ca25cd87c8 100644
--- a/lib/genalloc.c
+++ b/lib/genalloc.c
@@ -340,6 +340,9 @@ EXPORT_SYMBOL(gen_pool_alloc_algo_owner);
  */
 void *gen_pool_dma_alloc(struct gen_pool *pool, size_t size, dma_addr_t *dma)
 {
+	if (!pool)
+		return NULL;
+
 	return gen_pool_dma_alloc_algo(pool, size, dma, pool->algo, pool->data);
 }
 EXPORT_SYMBOL(gen_pool_dma_alloc);
@@ -418,6 +421,9 @@ EXPORT_SYMBOL(gen_pool_dma_alloc_align);
  */
 void *gen_pool_dma_zalloc(struct gen_pool *pool, size_t size, dma_addr_t *dma)
 {
+	if (!pool)
+		return NULL;
+
 	return gen_pool_dma_zalloc_algo(pool, size, dma, pool->algo, pool->data);
 }
 EXPORT_SYMBOL(gen_pool_dma_zalloc);

-- 
2.43.5

