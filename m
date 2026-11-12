Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794513895;
	b=4SXKmNRFJbHMoqMLx9Zf+bazpUe6dIUWwhfQ3Y4Y2ADegFXl2r5hAVbWkQrcBOOHT1Hg
	 1tTXTxuZe7sAmqbEgNpDgbeV0MXmKnlQN3dwM0yHcuFM3ZUu9ezQu7xcdwH1H/ZrqVp/J
	 Ue5714NsfXUD247VdOdvoLH0HwjpLDbOoNI6si6FOHUEspPq9jhdxanyfUqMVYGQYZWGS
	 1ZDBElIg0NeScwvj3KhbKqZMJ3l8XyJ5LqYyzUI7AYPNKqRVlu7GJTTUXqgkCZNw2d2a0
	 ruTLZv89wyD1cq4L5meuUNMly2I1ayZMxxD+GK9QqvqrrSGE3SQKM7MtQ9O9+SXdZMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=WcAHgOOesRnpg5Fo7kmgrPBf3yTrJRhLe8HkoymNW8o=;
	b=E2i5dDKQ7SlC37xTJlJnu+akKkgzeAu0ONyRsGWxwwkFsyXl4jy9JEMW/6/+p1RMXRxG
	 krDtaYlESHUynXVry04QkpEWvrBhshb7sBfbHiDI2v4i4B7CeD5EMR739z1KTa/kvlr1N
	 W7Jr9if/qz6zEC+bfMoWIPEH0SJamhP9XMfOki59u3OJw0fDzpdzMos3DbItpyUg5++3T
	 sDJBwCJPmFWP2RASecOhUpT6avkfZdz9ao3Qq4brmRUw7ITLqWdHT87B3JP/0EFLdRxDz
	 zL4bBPlNQ8q5qC+up/KiJQQfeXSxslTJcV18pzGOvw8HyrCu/t3q7U0Qn+/NLkNli9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vggPxoWo;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F64606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95F64606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vggPxoWo
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e987a2ba0cso1341395ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794513894; x=1795118694; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WcAHgOOesRnpg5Fo7kmgrPBf3yTrJRhLe8HkoymNW8o=;
        b=vggPxoWoiJ/39E89qJZJH9FH/Pf989NSXBHeza98erDwU1o04E6KcfuzghMwxyqzrq
         8DBZXZvES0wlkSqPXtaZWtHFrYsS7Gm84DIAkiGqHuYJED5N4SS4iOtPr2rDTR8fE/OH
         SND5G9fli5Z9ZKhR/L5taQWjs6a9O5XLC7S86BCxzz4+Rk7/p7uho1Im3fDnYrDb7rpz
         6fGQM6eHHQ6gZXSt/92od+AN1MoZ4Xq61XQ/AvsYfoIait3kbgDNKbw2ZOxvdKr9rojj
         BMS6VQr38yYO58k9M0QK0gXMc0qKx/t/q7HvC5TtiCCNxTiJKzTsmQsNaTGZ0lE6uzm1
         UhIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794513894; x=1795118694;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WcAHgOOesRnpg5Fo7kmgrPBf3yTrJRhLe8HkoymNW8o=;
        b=tRjeGbSDTDmnVnGARjqyedqGMm5LER3//1ETa+4WhI9Q0rBISOKYZoAvIPNmwdYNvJ
         dth2ILNn0urCSwq/qHIaIJFsUJq+XNOoLj0KsnQijEhOm6TKwNjBPeHZSR3fl08nWqe3
         3Zr02MIrYse/VCOOiUTbugOcSAH6gYaNpfzynlox74JI6a4dsAup7s0uNfatsTTMDzBG
         umHUW4dt3E1ZDtiHv0eOI3CSJa4zhu/kmJGhXPaQ5fyMSDsiv8LJepagYpNcohAnhqZo
         Xeumcz1rR8iBSzbM6wIuYo9e/icE3MsLY1BoxXWXUZVoocV/ZQb473ZrQLncw+pgS6lK
         58yQ==
X-Forwarded-Encrypted: i=1; AL+hErFE5ew+Yid09aAYT0gawtdlQ2GYxpkG895OnKS7x1e3UNUVGsKL0hf1tADv6I9IFiU/OSBnDvbxi/LGetg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+O78dAkPgxhAOWdtOQjM/nZopga1WpDnBLMev7pPTXzZKE4B75
	Pgz9A12rYk5zKpfKFAIO6SPreUrwENBMmQHY0ibvJM6e3kv0u5U9Vr6Y
X-Gm-Gg: AYBFou2a8hBse2fwZE/cX1S524wgoqgTu9MMSWPrEmci7gH4vu5mvFoZcPTGxGRYMP6
	1t7q1QRZz0wyqklEow17SgEv0UbraJMMjY24eh4eD8Md/MMIOrvDNGNTjQd4oJxHf+a2ltgSHWh
	4w8+mrcxEWksbwdwDtKNui4D6Q+JUm67r+48uffo8JM0LhMX2ekFo0M0lWy6/mq2EV1i3Nn25st
	IqSGIPHMHX/2yiFDYCpGhmgnjir2y/V9FYFgFmDeO8FJVjii19pN7SqtZm2ZWg4PajVHXVVxPEj
	0UKn23HGkqvq6o5YYYmN63c/dpWjmX1WK2hopVRm4lZafCSILhqAuliaqDx1vXCUnlfVOW8m97B
	vPSrC75C4iwsY/9besJ9Ukc4gpDmVF+4bmM/96QnUOvuS7wWItYvnStWUfYsJ9PE4QsMUwGKpVq
	dLxGVLaY2LVo4oD2BtRYekY7/Zmc1qdM+lY2R36+aijsh3rYjHRm0pneBZpFAxoQvfgTqlDbzNt
	/JoUHUD/tdLIMzWSlux8vGQCbgpPWjgDXm0HOKMPc7fFcsVSYIeh0iAE/0xoVglukTNwVyj22Zr
	o1IT+tNp+CHPpyECE1lystA0Wq5PuIdue5lyUEfEqHKp5BQ4t0W9vJHY8zuziBBZTs1IXQ8fbR8
	50NWdgQl2S89VCZHaC0hk4Nu2ygSd8pJY4A==
X-Received: by 2002:a17:902:fc8d:b0:2e8:79d:15ec with SMTP id d9443c01a7336-2ee0d664b70mr4529905ad.6.1794513893558;
        Thu, 12 Nov 2026 12:04:53 -0800 (PST)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75c980sm536275ad.25.2026.11.12.12.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 12:04:53 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 20:04:52 +0000
Message-Id: <DMTI31CK7EAZ.TT2P5ZN7BIVR@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Sumit Semwal"
 <sumit.semwal@linaro.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Philipp Stanner" <phasta@kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH] bpf: make dmabuf iterator stay drained after NULL
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Kang Chen" <k.chen@smail.nju.edu.cn>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
In-Reply-To: <20261110125106.2935677-1-k.chen@smail.nju.edu.cn>
References: <20261110125106.2935677-1-k.chen@smail.nju.edu.cn>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Nov 10, 2026 at 04:51 AM Kang Chen <k.chen@smail.nju.edu.cn> wrote:
> +/*
> + * The iterator state is one pointer wide because struct bpf_iter_dmabuf is
> + * part of the generated vmlinux.h ABI.  Use an invalid pointer value as the
> + * "drained" sentinel instead of growing the state.
> + */
> +#define DMABUF_ITER_DONE	((struct dma_buf *)1L)

+1 to T.J.'s point re: DMABUF_ITER_START.
bpf_iter_kmem_cache_next() does it that way.
dma_buf_iter_next() leaves NULL at the end of the list. Let NULL mean
drained. Then no need for the 2nd store in next() and for the long
comments.


diff --git a/kernel/bpf/dmabuf_iter.c b/kernel/bpf/dmabuf_iter.c
index cd50024..1bef87b 100644
--- a/kernel/bpf/dmabuf_iter.c
+++ b/kernel/bpf/dmabuf_iter.c
@@ -156,6 +156,8 @@ struct bpf_iter_dmabuf_kern {
 	struct dma_buf *dmabuf;
 } __aligned(8);

+#define DMABUF_ITER_START	((struct dma_buf *)1L)
+
 __bpf_kfunc_start_defs();

 __bpf_kfunc int bpf_iter_dmabuf_new(struct bpf_iter_dmabuf *it)
@@ -165,7 +167,7 @@ __bpf_kfunc int bpf_iter_dmabuf_new(struct bpf_iter_dmabuf *it)
 	BUILD_BUG_ON(sizeof(*kit) > sizeof(*it));
 	BUILD_BUG_ON(__alignof__(*kit) != __alignof__(*it));

-	kit->dmabuf = NULL;
+	kit->dmabuf = DMABUF_ITER_START;
 	return 0;
 }

@@ -173,10 +175,14 @@ __bpf_kfunc struct dma_buf *bpf_iter_dmabuf_next(struct bpf_iter_dmabuf *it)
 {
 	struct bpf_iter_dmabuf_kern *kit = (void *)it;

-	if (kit->dmabuf)
-		kit->dmabuf = dma_buf_iter_next(kit->dmabuf);
-	else
+	/* Once NULL is returned, next() has to keep returning NULL */
+	if (!kit->dmabuf)
+		return NULL;
+
+	if (kit->dmabuf == DMABUF_ITER_START)
 		kit->dmabuf = dma_buf_iter_begin();
+	else
+		kit->dmabuf = dma_buf_iter_next(kit->dmabuf);

 	return kit->dmabuf;
 }
@@ -185,7 +191,7 @@ __bpf_kfunc void bpf_iter_dmabuf_destroy(struct bpf_iter_dmabuf *it)
 {
 	struct bpf_iter_dmabuf_kern *kit = (void *)it;

-	if (kit->dmabuf)
+	if (kit->dmabuf && kit->dmabuf != DMABUF_ITER_START)
 		dma_buf_put(kit->dmabuf);
 }


Pls take T.J.'s selftest as patch 2 and tag the respin as
[PATCH bpf v2].

Also you sent fixes for css and scx_dsq.
bpf_iter_task_vma_next() has the same problem.
It doesn't hold mmap_lock between the calls since
commit bee9ef4a40a2 ("bpf: switch task_vma iterator from mmap_lock to per-VMA locks"):

Pls fix it too.

pw-bot: cr
