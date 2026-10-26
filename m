Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793024450;
	b=G2kVcej2pfR/jCGaGetkYYIWJfA+uQOocg0nWVGrOP8srCdvUjOEuM/xc+6F7hx26lSe
	 lS0+01Tah80+mi/hTCLJ42NvBMPZ8BdoWb5xZINmQv3PnYPMhTpuLC3JRtJcAjIU6YLNi
	 0iNGIXzyfpruIZR74x0QDmeOYz5E7cmuhf06UYSH52AiO1IqRSrd4vK3xvLhoOfHKWI6/
	 Tjz12bytsNZPiMjnZ12zR1NN7phaPLfJpK75DRr8VEf4ZOHPFMY9NDdgJ5LssPPjaye4X
	 GtxWwsWT9fSYvL/qjgqQeMSEC1O8R7T6S3LalyZ/GvektCgEy8TnGjGzyHLmnEfanng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793024450;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C2HHrlRp9L/SfQGFTahAQ/ZmI7daYrPt8M6w3ijLAkg=;
	b=T9aaaNaOJEk0/Ta87JfLaMnFkQTGYt2L+f5wUYaKJjJjFR462fku7mdFT5oPjbzRITgS
	 Fs3qql97QnsVK14a7fUXQ/EQGSWG9vDrra7kebELeudMdzxmzXkXq3P+bnYDQDdkAAW01
	 HQLqFPybiZfLCagzBjXPQUV9qlvAXAf0RV24oKySt4tICCt9EYezp+yS8ruo+8wWsh9dm
	 Fn7qApEHcZ/WJFPoG87PZG5wTPElebMhR8vS7uck2lZZVmlZ8eyg+MW59jrgzIlAKMyJs
	 gYKTPGHXoR6gnwx6LqGXr6LWn/sk9La+ophVE6v5TfxhgUyMSJFL4Q9oA37wdVIr6TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MIai2ghn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C36606A33C;
	Mon, 26 Oct 2026 14:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MIai2ghn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF0351F01825;
	Mon, 26 Oct 2026 14:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793024449;
	bh=C2HHrlRp9L/SfQGFTahAQ/ZmI7daYrPt8M6w3ijLAkg=;
	h=From:To:Cc:Subject:Date;
	b=MIai2ghnQdq34w5JBGVmeA6HhT7WYKC2zTuRfrCr4hC3H5ilmncWdsuMjAlIKj6fg
	 VK7eWvK3pNRV5D/dplNhdij1KsElKKc+1YFXMe/4g7HafD5Xc/T5UweTYgCPt3MvYA
	 nt4m5TZ9BUJvZIUvNSwEkEo4sFIKwUTsu6LbQngDtYMyri/as6WWFdUTOoFkEVphxa
	 nJBcNBkAbrNBEJ4md25m1wAmGIUsivgioHSQ7N2VzqV58iXURCJ4F+YffJL9C1OAHn
	 u6Y4cwZVLiO7YgC3l5aACoghco4Ivvkd4//JMbpq9/UtHAqz56/59JMSCOYbxWpUVT
	 NrF/ikM0bdlWA==
From: Philipp Stanner <phasta@kernel.org>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH] drm/amdgpu: Harden against potential deadlock
Date: Mon, 26 Oct 2026 15:15:42 +0100
Message-ID: <20261026141541.469727-2-phasta@kernel.org>
X-Mailer: git-send-email 2.56.0
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

amdgpu's KFD eviction fence's dma_fence ops->enable_signaling() contains
a dma_fence_is_signaled() check.

ops->enable_signaling() is currently consistently being called with the
dma_fence lock held. dma_fence_is_signaled() might try to take this lock
in its dma_fence_signal() call.

This deadlock can currently not occur because the amdkfd_fence_ops do
not implement ops->signaled. Should that ever be added, however,
deadlocks might occur occasionally once the fastpath check in
dma_fence_is_signaled() is skipped.

Replace dma_fence_is_signaled() with dma_fence_is_signaled_locked().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
As detailed in my recent discussions with Christian [1], I also think
that drivers should be very tightly constrained as to what they do in
the fence_ops. I think at the very least they shouldn't use any
dma_fence functions there.

So we could also remove this check here completely;
__dma_fence_enable_signaling() already checks the signaled-flag, after
all, but I'm not sure whether that might break amdgpu.


P.

[1] https://lore.kernel.org/dri-devel/320b6e7c75da6f05c015e89df0e2c7d11f20d70a.camel@mailbox.org/
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
index 9b10d015671c..61621eebb2b0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
@@ -123,7 +123,8 @@ static bool amdkfd_fence_enable_signaling(struct dma_fence *f)
 	if (!fence)
 		return false;
 
-	if (dma_fence_is_signaled(f))
+	/* The enable_signaling() ops is called under lock protection. */
+	if (dma_fence_is_signaled_locked(f))
 		return true;
 
 	if (!kgd2kfd_schedule_evict_and_restore_process(fence->mm, fence->context_id, f))
-- 
2.56.0

