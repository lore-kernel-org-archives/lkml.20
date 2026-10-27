Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117648;
	b=owgVGhL4sWjx7CViN2pFw6qDAzIGFuuyAmQ/UEOhZ7KdyCe98bug8AleiYVZPaDqIWhB
	 vp6jdeDh4JtOWaMamOet5LoEKYZXlQEinzYBEUxAgP0tN3bXl2sUtY9h3zZXJTFot+nnL
	 +uPW8o+M4uAJY/+bVekND+g1UEbq2O2IyQGM/0Xn4opGaazdQTrpyXR5Qg9H6XO4ae5QW
	 akraVUoRDpo3dqvpIOgaMaPvUB7nJlN/+Nr9RA1s8IbD6TYNRC3P2ikLR+1zSVYS+ETGN
	 u3gYnz28VWMXcxHxBmlbsbsNGC+Ig2Ebcbg6UEDHMQkJUgRqiu2hsYtBI+WMcpShoHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=toOq0XEZ4M3UIbIsRm37gKrEflyWkQwIZA2AGozjzx0=;
	b=BqfgSRXodjwlc/K9fKvOC2QOba1SGYQs7X51bfOX8S4aa/q4KlfucNoNwFElpdSM3a1q
	 o3DfJIX8wHyVj4rp6kzxwHGTpIFe32KZ31J0Qqee6fzrx37nTFHFYf9V4REUajWi+nY7E
	 S/biVv2ZIeSWGehcfQc5319pITN6IsRs9LwrKmBgKQD/l/Lt04nKuuk0pduUHa0bUI3Rt
	 FtHBrq7jCSzosk/WSqPpdkdH0WTAtvNZMqcgWxoosOeaDjiOqqFhEiLA5RNKfXM9ApwSE
	 LpRlfQno+SZfUcEAtLa/1+jD0xvrd+KZozXc8/WfGab2vfn1aFuP9yEyAoT9xxfiPEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mHn0C1mT;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68460606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68460606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mHn0C1mT
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e942864693so23144475ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793117648; x=1793722448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=toOq0XEZ4M3UIbIsRm37gKrEflyWkQwIZA2AGozjzx0=;
        b=mHn0C1mTsr5R+NeQ9MfIk+cOrVZwhjLS694g5z6BnC4yQya4ZkRKKax43UExLBZdeS
         X8Mgv/GkWnR62c5TgNWAoiYkXUpEz9QbwS3AbniQfRIEewdtF5mvtwy0/8Ivc9hbXE2p
         kW+p0A8Fm5nORbO1uEQ7lPnGcZFnvu1NqLncBZi6y0j1Hr+3UKIFsgD1WoOIBsO5wqqh
         yv8AzCWyTihb9tk9jWeadRLE3weqs7eJ7a40D6TAe2BVB0dX3Na0HVefAd/WYu0Q/y09
         Zu4L6SucoyrmFwvSoA+toz7mY6Cw0fjiMXGL8jWGjiOjc4SPRLCQjz/h1UBB4az3qSd8
         MQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793117648; x=1793722448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=toOq0XEZ4M3UIbIsRm37gKrEflyWkQwIZA2AGozjzx0=;
        b=nlLSV+Mx8qOCWUNgZNAQAfPLhnMKYvjCfAc/iPpFH96Y3Uxgg46Iqt9PSrulLRhv0k
         Vs1p20lFKYV6Wfu2IfzAqV0Bh99QWzqHQUUKs3NIszU2UHXLVm+jpqViK1CvAxULH4Bt
         +Yik7oJP5UbdBPaCfR9XiBX5SnjD7n2LySdUXUrLKirCF6Ghm+HQMb1elx1D/mbxPNCK
         zo/chE4WZ0kKdAJq02GfjCHK6YCb/sxUtKFYi2fgLAGynJCrLSZd+wVfVjAcXC89roy4
         0mYvS9nakHh51i1kpZj8zfVCkzR9szzr0LL2DNI3GfQPUmhkD/TTHsZBQ1dqSnHamr5+
         vmEg==
X-Gm-Message-State: AFq9FYKucxQFVDscwKqmk30DYGI5qhA8GKR80sHmrUnMO5ucPdsSryVt
	OOM8zB+oxsjbBIfMzNeACDl1f8C0lFjNOzWr4WZmY4hghk0qhlqHzml7
X-Gm-Gg: AYBFou0zJy/xJ3ID/NhlI3xGiJhQsxQcQBkYCJzeVOEwbnmoalm4Mq4xGCS1rfV5Tbn
	rUxwuAMCDNws5qeWV1UP3vvzyW8z1xK3NxOyN+SVB/d1CioHnOJ5UP6j8bCJW73jTy8NYA//hsc
	NVe+S5Zzo0UubaoUTrqhsZmbZVvw5rQuT6GtPCOWp1XhJt+Wt6wTtC7dlF5a1Lm8qzM+NWjh2mM
	j1VpNpYdhRLl7Mux+C7ksBMzEiDlksNl7ExhyexZX9xUEuMyv7jFWPEBTf9eWWGFvZk/Gk4oukS
	QWGwoCYbnZ0cJyZEXjdM50x3nLwb+zNnKQnp1mQTwFRf5sAOgtXyLRz+xGhbfMQ2GWiqIHs64e3
	h8JjQnZb9143zj2pZNu5ppYGHLsEBS+JIsU0DAWJMQFCYRRRne8Rki2encgW97OYSHhFjVKDT63
	RoXLxbxoBjdaEnKhMEHZtJdYxc2aNkQGPE7+bPwnJADLh1rwtiA/MqF40KtmSfmKX/HGG7ZPqEZ
	GlGVoyuTTtTTVkPZno+/PQklvxZiqhEqhKvfEsLoLyMfxPzD9csLtMLNzp9yHkH0dQZF9LCBJWg
	RZ5vLtWLlZ6+bzIrlpk=
X-Received: by 2002:a17:903:2389:b0:2e9:6788:9379 with SMTP id d9443c01a7336-2ea9c821072mr82928135ad.32.1793117647793;
        Tue, 27 Oct 2026 09:14:07 -0700 (PDT)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6455a00sm12395875ad.2.2026.10.27.09.13.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 09:14:07 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	chrisl@kernel.org,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	shikemeng@huaweicloud.com,
	kasong@tencent.com,
	linjh22s@gmail.com,
	kunwu.chan@linux.dev,
	kees@kernel.org,
	gustavoars@kernel.org,
	tglx@kernel.org,
	linux-hardening@vger.kernel.org
Subject: [RFC PATCH v3 17/18] mm/swap: skip reader rotation for single-device priority rings
Date: Wed, 28 Oct 2026 00:13:30 +0800
Message-ID: <a2183392a7222d0a6070639a0a45ca86e2d922ae.1793106426.git.lianux.mm@gmail.com>
In-Reply-To: <cover.1793106426.git.lianux.mm@gmail.com>
References: <cover.1793106426.git.lianux.mm@gmail.com>
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

A priority ring with one device cannot benefit from rotating its starting
offset or maintaining a quota. Read its only entry directly while the
caller continues to hold the topology read lock and migration protection.

Consume the cursor attempt and check the full/disabled pointer tag through
the common path. A masked singleton therefore terminates or falls through
with the same bounded behavior as a multi-device ring. Keep the existing
large-folio same-priority failure boundary.

This removes reader-local state updates for the common single-device case
without bypassing device lifetime or availability checks.

Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/swapfile.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index bbd114f043ab..9e90f815f99c 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -333,6 +333,11 @@ swap_queue_get_device(long nr_alloc, struct swap_queue_cursor *cursor)
 
 	/* Consume masked peers too, so every walk remains bounded. */
 	nr_iter = cursor->nr_iter++;
+	if (ring->size == 1) {
+		si = READ_ONCE(ring->dev[0]);
+		goto check_device;
+	}
+
 	local_lock(&swap_queue_readers->lock);
 	ri = this_cpu_ptr(&swap_queue_readers->ri[queue_idx]);
 	/*
@@ -362,6 +367,7 @@ swap_queue_get_device(long nr_alloc, struct swap_queue_cursor *cursor)
 	si = READ_ONCE(ring->dev[dev_idx]);
 	local_unlock(&swap_queue_readers->lock);
 
+check_device:
 	if (swap_device_masked(si))
 		return ERR_PTR(-EBUSY);
 
