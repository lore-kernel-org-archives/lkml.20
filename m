Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89AC584969
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789156499; cv=none; b=M84Yt73GYdyWMm5Y5tEkWakLHm7ew4TDoQZ1X8v3N8VQrL5NcHsdyuMuNU6CGtswgADCXO/9DHTyT1wBpsiUci8PpBuVHpW3Inm4dQbnp0QSumX8Wk6vmeFMSzmeGLWYbGDRYzZOvskHngdHDZCp1uv6/d68Ne73tjUVM2IaQiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789156499; c=relaxed/simple;
	bh=XbeleruLc3fvHSxZ/JCm4Tu9QVL6ipJwYJ10zXJUJTY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=vBXArNOXMBCIydlzVr5MDEFADaij0AedQf28XRooQG6L9o8VHMNyLSoDYxktszCuHdQXTfva+OuKsn7Rh/jIYgVKD+FI3G32jCT66vjJYkFFJu/62rg3GWqROB6fBrUEvKPAuF35+5asmw8FZZ/XD+Uu7tLMutMLUv6VrlssgEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+ZAwuia; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+ZAwuia"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-486955ae01eso1290449f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789156489; x=1789761289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+i+YV2SDOJ/fUOjXL4JkdG0lXGyDg3CLUWfYcCyxsKs=;
        b=W+ZAwuiaQZ2rrjBpWhRhkN+LNzi8o2prkxvqLSXMWkJPl1T9AL7a/6CGtshMKBT/qm
         d/cQT7Wr7ClL3gUrbHvzedCdIlWNqDG15dDPWQ90z13zWVhrHzoC7qpEzu4GYzf7E3ya
         kgDzFh7bhG7R9LoGolrfRpzC04vZ0vZzCTtFwvduo1aDFH5Wfm/96maL3iIB8mRL2x9a
         yYu87njwQDCYCbrkcgg/ZmLJHuYomPnaE03DFwZoI3L5LKC41j8wdEPz41Epo4zHnTCn
         Z+XIltXnB95wlFPQIIxnGCX++OvZl/5sq0TrpXzp0mj0m+Fpg4dzdz++34M8wC6aizMG
         c9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789156489; x=1789761289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+i+YV2SDOJ/fUOjXL4JkdG0lXGyDg3CLUWfYcCyxsKs=;
        b=kb0aW6blL5PdgNv/xXsmfDSYMhLBdspqNt2GCPijLdeZuoNcQmag2H4Esv2B1/fIPL
         oY4ZNvBre3TVQ5D8uiChVWgJLwyvJ4L/DelbJ+2czWPHG2E4H+h1mv0QqChJ9fym36kk
         kxmHJZyqVi0YNEkepj4GHbvVUF17TdvH4qJ5slWe/Es1DTv+MN5PcRZQZdqWs/8OlB1q
         3U/gqZczkzj0E3HrAByGmt3M7yCWC3vVts8ifrUXw8Tj/URKqgVY5fVoevR4FHGQFXXZ
         i2GFmInkOwTlfrQi9to2zaeysM4Crt/iEWsptVaRfUASbsrBpUuNfHcnb2vGRTRYJY5c
         yeFw==
X-Forwarded-Encrypted: i=1; AKwUvBxj8lG8Va3j/iXC9Kb1E9qrJZKBrR52IsgpXiGD4vsZmln2OpgkXIfMty1teq/rtnLuWWM2OtszuASR6Ik=@vger.kernel.org
X-Gm-Message-State: AFuF++laRhdtt+Ax8yJoLON7Z6Qz5aFU4LlAT2l0YxIo4LzLxlXlFKZ5
	41zhn8lzowUQwN4BeznkP9yqewLGXtBTMOfNpw++DMpyoEQ9X+pJq3cH
X-Gm-Gg: AYBFou2iC+hs5fIrpQgW2QzazDTcjSVf1KBZthpydGgRpDikoaeeMTbEwARqYfqQjRl
	xC6KtCA+wk/U2q0UIh4rj8p+mVMKDdQlfbrk7L+F/ZebJ6O4ZW1SVFG4cpMhGbo50mcpykSu/o3
	pktdoM8cPQY6XEMfkXHvzbk5T5eBor84i3YFZXh7WDao9j01Yf7t8hprA1oL3gsxWku5Yljcl7W
	qUbqDP/a3s3Gbno0AoNLizujbrnkL8gjD5OiJB1+t5SLSSRiA6Ra2QhFkrLeZcEc8RZaOzXFdjg
	ZB2ymHwf9mXA4QMVvKlyGy4TgzatFjN/hFGDemBnhtFZ5rsWnQfyhGX29FZsBDabnhUqOhviVBq
	na1E4gtcNeXu6uup941P82Ey25IWdcbeaQJqXP0xAX7kicEbuQrefCCmXc41aE4tFdHbxuMBqjX
	nNQqq8ggBxuAimXi8bvMgDzkQm9Z+hlK0+/wNgz59ch17y3N2jQ3m7Aparw2V88ALRS0IOeij/b
	O4aK8XijFf8Cjp4kGIwjBl3oIR7V1jTk67y2qyVFBrK8hPnieaOCPpGchRO2e4tRkOaus8CWj8I
	oqPmeb4EOkB/T15PaGfZ5LoVv25wMN7jCI9q
X-Received: by 2002:a05:600d:6501:20b0:49e:69e3:8848 with SMTP id 5b1f17b1804b1-49e69e3916emr21708305e9.30.1789156488932;
        Fri, 11 Sep 2026 12:54:48 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm92640705e9.2.2026.09.11.12.54.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 12:54:48 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	=?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Antonino Maniscalco <antomani103@gmail.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH] drm/gpuvm: Fix names that do not exist in kernel-doc comments
Date: Fri, 11 Sep 2026 21:53:28 +0200
Message-Id: <20260911195328.78529-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPUVM documentation refers to drm_resv and
drm_exec_prepare_object(), but the reservation object type is dma_resv
and the locking helper is drm_exec_prepare_obj().

Use the existing names in the reservation object and map locking
documentation.

Fixes: bbe8458037e7 ("drm/gpuvm: add common dma-resv per struct drm_gpuvm")
Fixes: 471920ce25d5 ("drm/gpuvm: Add locking helpers")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index d1c80ad3deadb7f2e78abf7e50e61ad085391e3f..c43708be348c3659bc7888c1aad25b470ff2cee0 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1051,7 +1051,7 @@ static const struct drm_gem_object_funcs drm_gpuvm_object_funcs = {
  * @drm: the drivers &drm_device
  *
  * Allocates a dummy &drm_gem_object which can be passed to drm_gpuvm_init() in
- * order to serve as root GEM object providing the &drm_resv shared across
+ * order to serve as root GEM object providing the &dma_resv shared across
  * &drm_gem_objects local to a single GPUVM.
  *
  * Returns: the &drm_gem_object on success, NULL on failure
@@ -2718,7 +2718,7 @@ static const struct drm_gpuvm_ops lock_ops = {
  * @req: ptr to drm_gpuvm_map_req struct
  *
  * This function locks (drm_exec_lock_obj()) objects that will be unmapped/
- * remapped, and locks+prepares (drm_exec_prepare_object()) objects that
+ * remapped, and locks+prepares (drm_exec_prepare_obj()) objects that
  * will be newly mapped.
  *
  * The expected usage is::
