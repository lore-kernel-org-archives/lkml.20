Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793183505;
	b=lF5umLyWngLaqbNvXzyzk0SgunTmTkZ8imV7WbF+MLC6kZzrXyMiQqg8Y8dhJtVe9v6D
	 kEXdHnAIgsdCTSUWYWETKHK09ksNDP6b5YAdXEIn00aFw/7de1n55AnpzdgNwkqf9rLhB
	 wU37ZhR7f0IA34zxEoV4FtavB6DPL6m1KUKxnSArKdiDuxm0KGwFw1NDZoSp8TCJdWSMV
	 rovx9WZzmbWZqKN/wpZVuCjnVN0cx3MDYtgFMDfK6kOFTENZng+ONp+ZdN9vGVYd8Fn93
	 QwPw6TgJCXK8yFVAL2FKpsfcAzJt/dIpWJxTFv/JFRgmclUQBwMmI8E65vYkRyGm0Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183505;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=VAjeFdERu4BPExsIO4TdMzxKq+luS4JyFfMYKUdYpiQ=;
	b=l87YtW37VooJ2/qjBZIRFFE8hOmujLFS7gk9oI2f0M7PcIxXEthjUDq/UaulldLEzzsH
	 jm8MT718jBXY4O533msSCSc8aPyOZi3G/T7o4+bYqOqiekT6NJCZywSUdKL/oEpZbssJ0
	 VOBJxmczz8hQhKb2eL3/bEdSjbAV872rQbqHOmkV/kIosoOxHMzS9A+XjCYNiKYkHb6kZ
	 MchMytjKQQkN7sMX/ezefIYrL+vd5So/Ce61iLXVTHtqNs1vPVYXBVq2huVtGiuhgLjqV
	 7gKx0ic8dnxZ1J5lmbXblEWpVp0mT6r5Lc8mV5Wc5Av3VJ0ih1M1VkhepssMheMlpJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XijseRWA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07413606A320;
	Wed, 28 Oct 2026 10:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XijseRWA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B601F01825;
	Wed, 28 Oct 2026 10:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793183504;
	bh=VAjeFdERu4BPExsIO4TdMzxKq+luS4JyFfMYKUdYpiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XijseRWAjYAxPIZEFTF4euy0aj+08AmpRte4GgHYGx6LI/Ju93KF8h0MOMfmgsuAW
	 cIV2NlDajefxjB32WT6Jrzo2szP9h1FTFePZwQ6z6tltZJuSpT2w3QTzQ59wM9Lv2Q
	 wIoB4txqmHJatNmjEtV7HvJX3v11ChUKDz1MA/xS0+X/pCz1hegAvf/Cxu7xCB8JPI
	 fqrULSTpwmep/SYfeeV1qPm539vhKI/90K7OB163vkCPvQB4EkR6M9vJ2SE/4uzFqa
	 kg+9chKOpItlQBVTVozA84qE5qExyAxLPfhlNg/Zac9qn34xNr2Fy77Mk/srp3vMdV
	 TPR2pStZZVQEg==
From: Philipp Stanner <phasta@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 2/2] drm/etnaviv: Remove deprecated fence_ops->release()
Date: Wed, 28 Oct 2026 11:31:30 +0100
Message-ID: <20261028103129.1036380-3-phasta@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028103129.1036380-2-phasta@kernel.org>
References: <20261028103129.1036380-2-phasta@kernel.org>
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

The dma_fence->ops->release() callback is deprecated because it prevents
drivers from unloading. All etnaviv does in its implementation is invoke
a kfree_rcu() on the fence.

The fence backend by now also frees fences with kfree_rcu() if
ops->release() is not implemented.

Remove the deprecated callback.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Just compile-tested.
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index e51a310c8d70..e75dab5e407d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1176,18 +1176,10 @@ static bool etnaviv_fence_signaled(struct dma_fence *fence)
 	return (s32)(f->gpu->completed_fence - f->base.seqno) >= 0;
 }
 
-static void etnaviv_fence_release(struct dma_fence *fence)
-{
-	struct etnaviv_fence *f = to_etnaviv_fence(fence);
-
-	kfree_rcu(f, base.rcu);
-}
-
 static const struct dma_fence_ops etnaviv_fence_ops = {
 	.get_driver_name = etnaviv_fence_get_driver_name,
 	.get_timeline_name = etnaviv_fence_get_timeline_name,
 	.signaled = etnaviv_fence_signaled,
-	.release = etnaviv_fence_release,
 };
 
 static struct dma_fence *etnaviv_gpu_fence_alloc(struct etnaviv_gpu *gpu)
-- 
2.56.0

