Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792994338;
	b=dbDZOvGq4YMnC+Eq7ZIY2K9CFf5nL6+btJFKvIUAayNz4ib1BOX990xdWUpBL15G4SBl
	 7a0/0JGPjIMYfHvbG5ar57Bf50NY5a1fteLWEs0SfFXrnUuvrzV7JUS4ue7vMClf5glIL
	 rnXQ8AZI51I05+WP3sBD9E5ABF+8L7Mfk9PeCvEv0+9FuDd7cOKIUaX9pjK0iPtFKEl58
	 d4m3sM5cTERsnsBtEcyFCa9KF0a/7tJtW3GwUDUEfntZW/5IvpUE53fWlFd9VHnn1oewS
	 dnulQ619l9zt6wKwhe71v8mEM9ag+jE3zQyI2fonGOBZ9cCpUoAhUpWcZC7Sflvm16A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792994338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3gJomeBmHPSa1nSKsQOjrx0jFw6wNV5cIGdR0fKlHFY=;
	b=I+Y5KeX+XfNMcilu03bk6nlHBg9LxRGDbG2CSJxHrJATYhQRyu6X0mMDvOKggLxzd5j+
	 OpxJsRthtIVQadpDe2Lzp/GB+wusS0VysbEcOwtSH1BovyR3tQTL9yUMtqBVW5zAa9ZnH
	 tTI+cJs9OOHLQjnwT0KtdepsWMvh/JddlWEF1f47tfJp8m68aUT7juaSMka0OwMwmalLD
	 lo4D1mfbgHVxoCUmbr8n3cSR+HoIpzcZH17FTT5UVynhJ1mvd6v4lGLz5uNhaxNpyNbS0
	 xZFmTUtrtSTWdSI27uD0JPr3xREQAFcyrsnIZEGnwVZFdJVReP8YAullfxJolGaCrKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="I/iLmABM";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDA1606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEDA1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I/iLmABM
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e0d885929so1619998f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792994336; x=1793599136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3gJomeBmHPSa1nSKsQOjrx0jFw6wNV5cIGdR0fKlHFY=;
        b=I/iLmABMgLUn9YNum9Hg49oTL3h7Cgb6pHXIH8fdZZisy50s+0le+XnLFZRaztOoq8
         kiVk55sAcoIyKG5AMrHzYIOtdmPbyyItM+5VXPxZot99yRKlEnf2HK+u6EJ37PPaKh1T
         A9IGPd689WTuVRYUVu6G9K/HLRcoZXoOTWXLA49rxpkzSzjHsJl/11roSeOpko9CgKIJ
         MmYghK+ZOoM3x/iJnxDmc0DEmaFlD1Uxz3u+ZvhK5cMcGckfnIl5UExSIFZHAExIBD8B
         5VJkAlSjhO8SR+Nav4rDBYxypUA0Rr3JTsjvfwNWTeb6PA5iw+1SU1J/JT2w0Y0P9kmZ
         SWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792994336; x=1793599136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gJomeBmHPSa1nSKsQOjrx0jFw6wNV5cIGdR0fKlHFY=;
        b=JCHb/hqAD9IMzZza1WCzeBje6X49qUcRNd3wOFg1rhJuQTuvaCx/2ew6gHxPaK7z8K
         Zex5axrVA50cCALJjtnIR0cksC7gmXMTBDV54dVM0JZg6FJOuRDhK/yKQf+jYfCFhnWc
         YTypUOvMKtYIqKr1Prh3X3tvHhcyepmqF2EkeqK7/X9iUGNjCo2imZsND9S1Y06s27cZ
         Q05nHwY0QQripMc7Y5u1VTrLEf8kYvMQgxSzV4BR5Euf0rgWet1GmnBf45O+HABRblpy
         5oh62CF3W7qNKrS6AFKiEmmDd5u7bG3SA5Y8CFMYNNRJM5hTi0HiH4/X6WkXsab8iZ/8
         P+og==
X-Forwarded-Encrypted: i=1; AKwUvBzdCwitwBMVv27uuqSIgehI4pGYbsRfXFxISPbzs5ivw2YERLoQUjTfDzkGG14OH90wTvK/fgjTyHrQDbI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVtolSGhIkGt0+HtSjzV+PiFlO0s8ibSOIsWmceLOma+WJzxgS
	iDJwkB7Z5iP+J3jch7ixUW9JuDrWqMjXKZXQcYeovyDJovMPo69m+3WK
X-Gm-Gg: AYBFou0wSD8lS1MD83dHXhWZaQZXjW608whnloV4/urQtCzaDsWyjZkHzMw2HzvMVX+
	bsyDtqFg8qXuS/v2cDOo2+Ce18pPwzpt+OXc4Zqwka1wkTWlzIQIoygWCwd+SthsoTroxnJdJW8
	ANyNpn525hi8/9xEm1XdsKeuQqjTLO27tY8FRnKnfNeCFjzBtV7j7ld+VBgTV1UiIXNLRtwbru0
	FEXU1gBU7T0WVEVD7j66RK55C6/mLtKol2g4053gJ+cQ7Crgv9imEDkl+cVBYPmVOu5+i1vTkcS
	CeKs9j3d+K/2oofCNnlKcHsi/roz8/xtg1fFMTzz1yGAE36HBVA4AvNwErRDjTQbb1HaZV/uH6y
	xk4Hkz7jm42HE2IOHsjJamWQvu8/HeU7X5F5KxBU8BWGRNpdtDi4Ofu8sLJmq2b0W5kR9LgMqph
	mI49dAHyt5qSAh98M803QoxhlC3hw1h4I2mcDB4ybhPSN2iAq4ty8mEGPj+B3nBZ1Bo3bOFE3Gi
	5n+1oLY74ScwhzJYFNVoZJ7ew7Kn4qyBWfdoWtfabK0G4fAk7N5Eczsv3Xuidn2leMicHudutml
	L0gsvvtwEZkt1kG/Hp+JSyq73fwc0ktVuCb/KdT6ok4+Dwzbwz1K/QYG0o+WMYSIcvLHveX8N6A
	pEJlziNso8H5SqNHP361P4l8hX+UCaR77mTY2PY0rkT0oy6dl2pFB4LoBUdSjY1g+
X-Received: by 2002:a05:6000:4386:b0:48d:ba3b:af36 with SMTP id ffacd0b85a97d-48e3eba7fdemr8948523f8f.37.1792994335994;
        Sun, 25 Oct 2026 22:58:55 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b1a4-1201-5c78-89f4-99d8-70d7.310.pool.telefonica.de. [2a02:3100:b1a4:1201:5c78:89f4:99d8:70d7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f25fsm13901379f8f.2.2026.10.25.22.58.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 22:58:55 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/tegra: Fix dma-buf reference on import errors
Date: Mon, 26 Oct 2026 06:58:42 +0100
Message-Id: <20261026055842.96484-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

tegra_bo_import() acquires the reference retained by a successfully
imported object only after all attachment and mapping operations have
completed. Its detach error path nevertheless calls dma_buf_put().

drm_gem_prime_fd_to_handle() holds a temporary reference while invoking
the import callback and drops it after the callback returns. Consequently,
when mapping fails after a successful attachment, tegra_bo_import() drops
that borrowed reference and the caller drops it again.

With only the installed file descriptor and the temporary import
reference present, these two puts reduce the file reference count to zero.
This queues the dma-buf file for release while its descriptor remains
installed, leaving the descriptor without a live reference for later use
or close. On a Jetson Nano, forcing the mapping to fail after attachment
produced:

  VFS: Close: file count is 0 (f_op=dma_buf_fops)
  imbalanced put on file reference count

Remove the unmatched dma_buf_put(). Successful imports continue to take
their own reference before storing bo->dma_buf, and tegra_bo_free_object()
drops that reference when the imported object is destroyed.

Fixes: f5b8794e17e4 ("drm/tegra: gem: Don't attach dma-bufs when not needed")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Found while auditing Tegra PRIME-import error handling for
CONFIG_DMABUF_DEBUG testing.

Tested on a Jetson Nano (p3450-0000) with CONFIG_DMABUF_DEBUG=y and a
separate change that rejects zero-byte IOMMU mappings to exercise the
post-attachment error path. Without this patch, the forced failure
produced the diagnostics quoted above. With this patch, 100 consecutive
failures returned -EINVAL, preserved the original dma-buf FD and left zero
dma-buf objects. No file-reference warnings or DMA-API errors occurred.

Additional regression coverage passed 33 dma-buf heap selftests, with
three vgem-only tests skipped, and all seven udmabuf selftests using a
volatile 2 GiB HugeTLB pool.

 drivers/gpu/drm/tegra/gem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index f76af73..ed35a34 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -502,7 +502,6 @@ detach:
 		dma_buf_unmap_attachment_unlocked(attach, bo->sgt, DMA_TO_DEVICE);
 
 	dma_buf_detach(buf, attach);
-	dma_buf_put(buf);
 free:
 	drm_gem_object_release(&bo->gem);
 	kfree(bo);

base-commit: 21a7f44fd0765fcc5194130b28767786eba1d1e7
-- 
2.39.5 (Apple Git-154)

