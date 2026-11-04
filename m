Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793809300;
	b=TCoQpg5gRgzp2IY8uiBUK8s7MvVZP31fTv1olm48jJBOfu11X8ywQw1RG14fJofk/igT
	 Wa/2EicSRC5hSsjwoi9u1UaPa0Cx9OhB0dxhRGjFJRtTo4eqUETiWbaS4bS0qs9ehMwI+
	 Vb9DGt6GgQ+rsYJzy/FByBb7jcoO5nZtK5nPtV6NRACaL1/hwdYRvY/YIHBM5auYcIkS/
	 oXQOyNw4y/t4y7KvAc9tODXIeH5aOF96W1SwW/pbkA7LapK0zYOZOtDgH6eCfQ9g22HVA
	 iPQcUDWtxTfcfybX4CKjWy0j8ocfQo2eXOvBXrmTE+/HmGzk+yNDWeYLLccAfVepS1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809300;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=w7eVaBDWu9R5hyOQNNOzwUd3G/ydsQa1JR0D6yp/m6Q=;
	b=TZSzFwJPJ9KopVW9IwPyHd8pUhqDwCMUFy16+a6qQQgHIcGMyLhXeA7565+dfKiCFJ7c
	 i4yilJ9ccEcwbd5CNrWF0MphkaDb65vSTduvmEHYFKPehS6wRUz4A+5QlP3crPE6Pn3c4
	 42nCfdpUeYCmcPh4J4KcuExDJugbNYUzjxx6VPKjxpm9hXdTuHKAm7370b45U8XGTc88f
	 B69FQIBlHh4VCxXAcjhKi+UT8FMsEO2UQgoPpHjhkKMNg622Brr0An2BvEJ792Oo8MzWY
	 h2C5CLtYXMYVuwI6lC9ICtApP3G9JNnohLdmINuU5XOX/j5FHx2dRbGdqXHBIHjOZeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MNkwtak4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911DB606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MNkwtak4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427BF1F0093A;
	Wed,  4 Nov 2026 16:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793809300;
	bh=w7eVaBDWu9R5hyOQNNOzwUd3G/ydsQa1JR0D6yp/m6Q=;
	h=From:To:Cc:Subject:Date;
	b=MNkwtak4tH/qjUIiqUrxN7aarJldGaUsW0ZRvtsqymwIv9ztH+DJzqQHfDue9e4RL
	 Su5YiSibc1FoGnziiSZR1vA95Y9bJGZyiRuC+n0HaGqz4K6KVUXVyMk2rVU7yWoAb9
	 X49fHGI0ShX9GVE9cq1+9+vKaK/dtTt6179spM8Gq/nI8b4zJJDpGVqnKgi+2+nnTk
	 oPrf7zEQguYjWuRrUpWnVF8TMLJJaJ8olfA1QqYXUyuWabHZfe3SRbxgbrahcnISx/
	 ustmiYpIugr56iAP9v96FCjrESiLCG98ILhd3uon00L9hlOm/u2VsDDveZviT3am8Z
	 ehSFvnGv5qq4g==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org,
	tzungbi@kernel.org
Subject: [PATCH v2 0/2] reset: Fix issues reported by Sashiko
Date: Thu,  5 Nov 2026 00:20:36 +0800
Message-ID: <20261104162038.48622-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0
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

This series fixes two issues in the reset controller unregistration path
reported by Sashiko:

- Patch 1 fixes a reset_control leak when reset_control_put() is called
  after reset_controller_unregister().
- Patch 2 fixes a circular locking dependency between `rcdev->lock` and
  `rstc->srcu` in reset_controller_unregister().
---
v2:
- Address review comments on reset_controller_unregister() cleanup and
  teardown ordering.

v1: https://lore.kernel.org/all/20261102155840.20376-1-tzungbi@kernel.org

Tzung-Bi Shih (2):
  reset: Fix reset_control leak when put after controller unregister
  reset: Fix circular locking dependency in
    reset_controller_unregister()

 drivers/reset/core.c | 69 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 52 insertions(+), 17 deletions(-)

-- 
2.53.0

