Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94F03FB7E5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436993; cv=none; b=ia/tTKhU3BBnDNT2Wkq7Yy2dPjWdmuGaQufScypYMznwIfbYTYH901mz3GUH4yDn7qEIvCxibuQnNoFGS/wVnf7pT1PS5/JSu4x4TNBkXkh4aOMx6vTYV1ysm0FaMzJYI3oH9UTz7Za05FPoJq26nfjJb9owJGTTJTJ+HCmWq4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436993; c=relaxed/simple;
	bh=l4Co6JuYOndWHQnVVqnTOGbgMDy2wQdXzJj0SBv5ihg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JiUZwTvWpQijpu003U41TgRhhcuLn9VsrRdji5SBb40HsPTOqxbgwY5vGvySGemjPpYCnVi5xcP+dMMlWewvBv5DmieKN1PFC24N0gD5Cz5LUOcbm3AjfIGDg80T6juRlXO5vq+dzEDGSCm0HN2epRIHt0qMZzYeCKHnIwmjc/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXJnSGYc; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXJnSGYc"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso3034192a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788436991; x=1789041791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bKHUu4RXgn+ajJEq3dHUEGJdAeTog2hcj4FfProc6f8=;
        b=JXJnSGYc+NdCsYBEtZtF08evm3dhNYwABxDN/ODIuXKd6O37cxyXUu4z2GyauQfU8a
         OQ7wQT048MgMce+xutWiwVfpG2dNBfGzPlVwH0CfGtd07+wGDP0bZramrDp5jtd8KfFQ
         YvTBf9WHBNQEIkpTb53pnFlGLjly3SgjjaTXlVFgzQ7KEjCQHyML2DnN/z2TOjI2Sl0R
         bcSwgPcIJenutptV32zjEMhYpEhaPKBtdmhrOpaA4ZRVc0e3DNb+gP5cxxG6SnrX0iTv
         tMThzXYHF4OMtV8guyp2PnlS+SIZbE9XuDRckkvMefX9F6Co5Vs9arJrXCOwnNZQhXBC
         IhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436991; x=1789041791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bKHUu4RXgn+ajJEq3dHUEGJdAeTog2hcj4FfProc6f8=;
        b=mTuJKV8OckyPVqinIHGyC/yCeTvooQ6UIc4JCSZVgAdcTp7gy/VsfL0PSpuuTeVEMN
         mI64AYGZIeTXQx+YTd7Rb6TSMrM/RRZzDtMQFd+hyNDKCh008MR0Dorz0+Faly/ePaOg
         Rn3xpexPf5ECalkg9zBZ1ScR51EtDXBB294Wid8enfj3aJsYF2MHjmcUPHg6b13lXoso
         1IATvacA2lVoczvUCsKOfNQDlHwx8Xs5k2kc2fii4WHliVEiPZKew+Vss4gmF85lkhUr
         8ri8/4R5/9V8rZvUxYW1XiIQeBdnIPhpyK3HHnBSgv0C73zssUaXnxXpjjJzM29MntkE
         Qwgw==
X-Forwarded-Encrypted: i=1; AKwUvBwB0AHL+zedVy9Ge0nJNgTpK9Du+X/h99be4/aV0WL6S2OMzfRjB4zJfJQO6zNIm5KyTe1J0dNKiBXO8v0=@vger.kernel.org
X-Gm-Message-State: AFuF++l3lixwR4ndNcLnTxKwcEJDSnhqTERE7fURkPkr1nKZhiNK8kd2
	PTHfGbJx3RR2Bxg/RV0Y7bi8pcBrrh3U99ttxKwVtC55KKXdig6L9vZf
X-Gm-Gg: AYBFou1Zu5J/zS4JS4LVHV0mzB9wjnmeEoL+YCYibtadgfAl2tfFLIx1rNEcC17xaOU
	Vj6n8x48vjVXV9QUIox2ySt/ftmv0RgRshp0FK9jy8KgNUDt594dJghPpxmkGtIgCTtJ7GQfcBe
	zb1XzZ1m4g8fxAlB2unqqlw2TzB+ghXoUlqbPwDlMJ13arWplGMbkyrdZcgND0K3lBFG29eBk33
	+iWskP4ypdzS/Tvd8OabW+Fw9Fbx9u4EZ2lc+meqrexSrpR6EPi/CxuOTb9hgmanB5oV1lIQzyG
	ayDucvi9+rvWhCK4nGxqfdDoBF6DMDwsg5TRNXjeQPePea54FMGc8x2HZhPWLBOe4zPtLehuZfo
	Rr9BVxthebDxqOpLsN1cYFn8kcocZNoXarX/4UBUXP8ktiQZDbzJuk5FQY8KoJJiuVw/iN8AaNJ
	4QLW1DoQmyRD8b3xrbIcdgwQDTu4ZRpmji2pMoPd22Ca/5wjGImzzVhRNipgMXJ70dYx8a3gUue
	m3/fG27VBGTEPfy
X-Received: by 2002:a17:90b:2d85:b0:398:9c00:29f0 with SMTP id 98e67ed59e1d1-39aee249bd7mr18546822a91.24.1788436990468;
        Thu, 03 Sep 2026 05:03:10 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875ce14sm6279989a91.13.2026.09.03.05.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:03:08 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: aliceryhl@google.com,
	gregkh@linuxfoundation.org,
	cmllamas@google.com
Cc: arve@android.com,
	tkjos@android.com,
	christian@brauner.io,
	surenb@google.com,
	baohua@kernel.org,
	zhanghongru06@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 2/2] binder: add install_mutex to serialize page install and shrinker zap
Date: Thu,  3 Sep 2026 20:02:32 +0800
Message-Id: <20260903120232.4096067-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831123545.3655557-3-zhangbo56@xiaomi.com>
References: <20260831123545.3655557-3-zhangbo56@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the detailed review. Replying to the three points below.

1) ABBA deadlock between install_mutex and mmap_lock

Sashiko says

"Can this locking order cause an ABBA deadlock with the shrinker path?
Here in binder_install_single_page(), alloc->install_mutex is acquired
first, followed by memory locks (per-VMA read lock or mmap_read_lock)
inside binder_page_insert(). However, in the shrinker callback
binder_alloc_free_page(), the locks are acquired in the reverse order.
If a concurrent writer is waiting on mmap_write_lock (which blocks new
readers), could this inversion result in a deadlock?"

This is a real issue and I'll fix it in v3. The install side holds
install_mutex and then falls back to a blocking mmap_read_lock(), while
the shrinker holds mmap_lock and then takes install_mutex. With a writer
pending on mmap_write_lock, the rwsem's writer-priority can turn this
inversion into a deadlock.

The fix is to never block on mmap_lock while holding install_mutex. The
mmap_lock fallback in binder_page_insert() becomes mmap_read_trylock(),
and on contention it returns -EAGAIN. The caller then drops install_mutex
and retries after waiting for mmap_lock to become available (without
holding any binder lock), so the install side never holds install_mutex
while blocked on mmap_lock. The per-VMA lock path is unaffected.

2) Potential infinite loop on -EBUSY

Sashiko says

"If vm_insert_page() persistently returns -EBUSY ... will this result in
an infinite loop? Because the -EAGAIN return from
binder_install_single_page() unconditionally jumps back to the retry
label without sleeping or limiting the number of attempts, could this
lead to a CPU lockup and local denial of service?"

Good catch. Under install_mutex the PTE should never be already
populated, so -EBUSY is not expected. In v3 I'll stop treating -EBUSY as
retryable: it returns an error instead of -EAGAIN, so it can never loop.
The -EAGAIN retry path is then only reached for genuine mmap_lock
contention, where the retry waits on mmap_lock rather than busy-looping.

3) Use-after-free of the preallocated next buffer on retry

Sashiko says

"Does retrying on -EAGAIN here result in a use-after-free of the next
buffer? ... the error path in binder_alloc_new_buf_locked() calls
kfree(new_buffer) ... If we jump back to the retry label and pass the
exact same freed pointer back into binder_alloc_new_buf_locked() ...
Additionally, if the buffer was split prior to the -EAGAIN failure, the
split is not rolled back."

You're right on both counts, thanks for catching this. In v3:

- binder_alloc_new_buf_locked() rolls back the split on the -EAGAIN
  path (rb_erase() + list_del() of the newly inserted free buffer),
  restoring the original free block.

- The preallocated 'next' buffer is (re)allocated inside the retry loop
  in binder_alloc_new_buf(), so a freed pointer is never reused.

I'll send v3 with all three fixes.

Bo
