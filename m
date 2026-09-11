Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E804497B60
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164743; cv=none; b=jau8kJhVAhvxlaWrMVzU7Qxd5fMLPkPOtH0L8/YKZn0paullyJyXO9R3ysn7OAlMOx96TrpqzQG85ojAnufwKA4XDqlocK0avpn7aVnKpY0eM7UKegpX0mEkiZZ7zfKS1foSXEpv9kX6pIsqu0mUlL7wdlpvNhbsTBlCyFIW3N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164743; c=relaxed/simple;
	bh=PCZetLjYXOOHHosyQzzfNeadASgisyGSgjCySHJ131Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Lq7rCkYQOqIPE2of+3XHNYp59AndH+JeBVQJbr73m4vLCIwmKeO9MIJFcGgW0Gez2NVV70EuEbSLkRP2q2TlroRpvRvWMIr4HR+5uV2LmXmfStAXJHlwlPlC7167Qf26OX9Vw8dzEW4LJjjaAAhonhwI0uZfXzd2VF2VrWIghXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bz8UV1ix; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bz8UV1ix"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e65b1cc29so4496395e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789164739; x=1789769539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fFA3Y9RWjyE/MfZqBJ2nbJ8LDh/EERVeVlcRxvEqcnQ=;
        b=bz8UV1ix3rU0mx55DY0l8UhFcpsiErq0qpCDQSqMBZsDl9A1/CFAq9CnYFecCMlNL3
         bAMpU2klY9hzTBsMFE9q2xOaE1+7Pmh2nhIm2nE5itQIiRAjyf0a0/UrB9cA3TXZDdJo
         LoY/TRGMXz7uGm3zsc3o/t+h+3TkYz5bLmKYUNeX+DzhDWxDP4m+hriHq00NXhPgkBxM
         oIeypSRRKbVPwKeuYgIA3cfADchGNptReoHvEm2ClaW+5qSGbSbS/EFkAbti1TFRxE2K
         oHQcY2BU0VtS5UXoZ8YbhyN6SiBeUWS3P4fxv+CQ1T8YC0B+k0UkWkEB7lc+blkDxVyz
         WUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164739; x=1789769539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fFA3Y9RWjyE/MfZqBJ2nbJ8LDh/EERVeVlcRxvEqcnQ=;
        b=gYWtPDfCoDET898f/KHfCqNAPoKg04i15fbgPS5Ew7vclXLuhwl0wgFIZDMntEdfaN
         D7905Q64eYoOhWMTDFZDj1yrrwr5lhWoPe/6rPVGPbtHS0iRiiLeychRnVWxNpnUfQzY
         Gki12x9l6oca76xh5p4tAcQb6fhgUH4JDv1MqGNp73zEN7sTEV0LMhPGUW5wKKS1hFSG
         3Dpw4Uucl/tm4EdYwcq1/JwLiGQuYtg6vYE3oWYXYd/EatTw/Dwbdjy7R9coM7m83GQ8
         rAp1T2vL3T2HNGU3OjLFQx9IHoSI5VTBqGxeLkiPZ+6DN43LyLM2rttV2XSn54Nfuuap
         JjvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLcpyMio3kgBfwwtZloB9cO/KrLssFYbV4dmt1MWGWUYeYePdipPeaE9mRgy4VZoQBPcSPyWQITR9rZ0Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mPd5ChBPd0agRUUhQLLRjCaN8Q4kWzTSDqfZ4wL65Zi1lnRi4K
	Dp7VEd4uWHHrV0Qz3OKajCQu36qcpdslwOJNPjSkMBzDlFQ298y+rcXMBH3w3Fk+
X-Gm-Gg: AYBFou0iN0Gpd1gcZZq+tUEybcsnN3jUi4ksKPwFpH28YFtryAANetjeII5T8MUu8Ne
	wj/k5O0CrQOfX6RWpjJg2i8544E4JGFQ6o5BWZZdmXkRm2f+ncIvE5xR+IviH9W/ESpXZck/xMG
	ZhCbqrCadVr82269PbZYJF2ed8iYlra836n7JsAtTfE8XHmMyjZRX5G2jKpLrdrkX1iIxMX+N1H
	MYMcb+WVd9iglJjPXX8fY87ktG6gWRO7apbB+8g6TeasY+Un3MPzBDN+KuX3OZ1s2Bv8p3DIess
	3+LjSc+TQU/1ZaPmxDeba4d8BUS5PXcgfFCC5CzqKzM4/lJFztoZzJF9lSxZZjf7rNLmfIVtC49
	L1ck5uCMv8bvczRgbA0OPJP6FColhdZbfV7sazoDd1GF7rPukJzV8nTxjdV6y/lbKAlGBdfxNIx
	a9lnpiBcRiIyiNvymHoqD3dFW+cLiZuOYMFMwRR6IO4PLpMnz/bGMewvagYrUnzwXqiN89beiS/
	/BCQl4N94WGLENt7pq/OKTFfezQIKbxgJd6YLqdq7om4N/Rak7pJGn90Wmxvh2HtES9FkFFMQfI
	XEM7NWduFjhBnypwy0YyCRPXgilWDGixrWfY
X-Received: by 2002:a05:600c:1d08:b0:49d:2450:68ac with SMTP id 5b1f17b1804b1-49e619b57admr155349985e9.5.1789164739111;
        Fri, 11 Sep 2026 15:12:19 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c300e2sm204158365e9.8.2026.09.11.15.12.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 15:12:17 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dma-fence: Fix dma_fence_enable_signaling() reference in kernel-doc
Date: Sat, 12 Sep 2026 00:11:00 +0200
Message-Id: <20260911221100.7079-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc comment of dma_fence_is_signaled_locked() refers to
dma_fence_enable_sw_signaling, which was renamed to
dma_fence_enable_signaling by commit 9370a5c664e8 ("dma-buf: rename
dma_fence_enable_sw_signaling"). Say dma_fence_enable_signaling.

Fixes: 9370a5c664e8 ("dma-buf: rename dma_fence_enable_sw_signaling")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/linux/dma-fence.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 158cd609f1036e56668867f092041213cbf30427..3aa85be43aada5a80ea2e1cecc5f76824b434d14 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -501,7 +501,7 @@ dma_fence_test_signaled_flag(struct dma_fence *fence)
  * Returns true if the fence was already signaled, false if not. Since this
  * function doesn't enable signaling, it is not guaranteed to ever return
  * true if dma_fence_add_callback(), dma_fence_wait() or
- * dma_fence_enable_sw_signaling() haven't been called before.
+ * dma_fence_enable_signaling() haven't been called before.
  *
  * This function requires &dma_fence.lock to be held.
  *
