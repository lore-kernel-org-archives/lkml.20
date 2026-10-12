Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C67E4BC007;
	Mon, 12 Oct 2026 17:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791825605; cv=none; b=HdCHhltu21Lgc1rnNtc/iHQbsURRs2tYHJlxaDF8U/dHWlx9geX5qDsoqukzmvLkS6DUoQJwILH0TijcS65ntMdDPovoQvIfq+HPckazTv5tPKXmo8HBmlDImmT15EXvawCb+pmiZpNaXV47MHN8lGZKxS2zoKUQv9k+qCHK7ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791825605; c=relaxed/simple;
	bh=ReC683xLMLHgfyjyrGz2xE73qadaayonBN5dJNWSGf0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uTvuKP9JLNvxADuICOqItQidaHR7dl8LQGc4coZc56OjyDP1Bhldpr9e0CODrwPbJ9RQKJ+Z1O/p1ewM1j7jI7X+Nm91fs/WS8ULwEU807yX1AL6sNaU99hTgp1/w9+qJBcSLg6rCI/ZFvixjIFO/MUO/2225T1gFeR0fQAWAd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WCZIeTx4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WCZIeTx4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 195A71F0089B;
	Mon, 12 Oct 2026 17:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791825604;
	bh=/+kYat3Js03LLBNLv0RvM8p5SjFSuufv4UsSaTtr3vg=;
	h=From:To:Cc:Subject:Date;
	b=WCZIeTx48JYsbkqPJ8oGRb8Z6K0VhXDe7aglI7KhvjXQyj2HPezQGvCQXRlWz7804
	 oE4iRPBXmYgyFKSCVRSoKRduwu69Gk+uz9eDqcPNFRnTgmAHK6GXE2iZsc6DlgcF18
	 AilMXoUHzDoe82GDn6aFzLAZPLpa5waoW+EdBo1+cNL9PsrXc0kvTzlEp9bkw/p20i
	 WG/QZabuOj+/PZjv2ozkwd2qRcRgRk5gxO3CaOuA2YAwsIBESkETY67uW9SejIjyhT
	 zkqcFBLJrU73NjDg/vuLs8HWLVL2KDZqoxTc+PSPBKPg7GIBvaeCIWNEFuyd4ghqju
	 J+xFKtK7Iv7Qw==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	dakr@kernel.org
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v2] dma-buf/dma-fence: Mark two callbacks as deprecated
Date: Mon, 12 Oct 2026 19:19:40 +0200
Message-ID: <20261012171939.390365-2-phasta@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dma_fence's backend_ops functions ops->wait() and ops->release() are
problematic because they prevent fence producers from unloading.
Moreover, they can easily be implemented through simpler means more
aligned with the dma_fence contract.

Since the declared goal of dma_fence is to move towards an
implementation that supports driver-unload in all circumstances, we must
prevent more parties from implementing those callbacks.

Deprecate ops->release() and ops->wait() and document what users should
do instead.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Changes in v2:
  - Drop confusing sentence (Christian).
---
 include/linux/dma-fence.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index dd07d128adc3..388c07d11e70 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -220,6 +220,8 @@ struct dma_fence_ops {
 	/**
 	 * @wait:
 	 *
+	 * DEPRECATED!
+	 *
 	 * Custom wait implementation, defaults to dma_fence_default_wait() if
 	 * not set.
 	 *
@@ -243,6 +245,8 @@ struct dma_fence_ops {
 	/**
 	 * @release:
 	 *
+	 * DEPRECATED!
+	 *
 	 * Called on destruction of fence to release additional resources.
 	 * Can be called from irq context.  This callback is optional. If it is
 	 * NULL, then dma_fence_free() is instead called as the default
@@ -254,6 +258,12 @@ struct dma_fence_ops {
 	 *
 	 * If the callback is implemented the memory backing the dma_fence
 	 * object must be freed RCU safe.
+	 *
+	 * Deprecated because it prevents the producer of a fence from
+	 * unloading. No new users must be implemented. Parties with a
+	 * hypothetical need for this callback can instead simply and directly
+	 * perform their custom release operations one RCU grace period after
+	 * they have signaled the fence.
 	 */
 	void (*release)(struct dma_fence *fence);
 

base-commit: 3e32932d3626d0279f9b3531bd648f8c0a16cb08
-- 
2.55.0

