Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57723484888
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936026; cv=none; b=IqvX66pQXZ7lZRb84Mjuj7IMQ1rKT9oZw5VEPnfIL84H9PEfjKUte/s2UBwNFm9nmdg9bYTjbudkW5msK1W2p1/rDmOcSJSTqfS5/fxVeVhtHeWcXhIJZe6l1UCyz6soD6OcVVeMRNM8tgYKtAeA/wnAldjysMdX95ix923Sg8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936026; c=relaxed/simple;
	bh=2OOzTr+UGlB8Yby+MV9MTu4EtYfJMCBzcpWw3KyfdZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KZ2V6wAxRb0+/akU5LF60wbIfJC5QR18HjC/O+o43hKLeR6Wj6ywSgIud3RK+E4RIqp2rjSAX07d5+oQFOllrseGxtfOw3s4elHJzlBXalCTCide2kdUTCOdQnT9uH9RrrzFPj2eAbm3b97w+uKAQB0LMvgrpOXXg5HbTD6rp/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfIh0NK1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfIh0NK1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8493A1F000FF;
	Fri,  2 Oct 2026 10:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790936023;
	bh=0NSMuld+VGxflFWT8n3/nqhpMJD6xn84J+GEaVrz9O4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EfIh0NK1SGm+E0Ts8YAEKwXF8Hi3TuqI/rLv2RLVLSb67VnCGYyBNQY01Ew6X5XTX
	 3Lym6U6RJNfLnkBPTiWUm1yM32r57sXo3DNpZZ4C1tJbZ+HfLGfMBUbZNxqtvZYBbv
	 X1sIb+82N73We3LX43dtDZSb+mRSeb9DfFrR9kCq5WDuT4KJgQfIYfx0vBXe481ZD6
	 juuJWJyot0KZxNF5Qyt97rmS1Eb3LS+KN9LPglD/1Z1vadgOEFJRy7M2ehDgBmpoJL
	 uyIET9Q2kM5uYFRJ2aZHAjuYAdewm5WzKLue6GN4cCcg71R4k+Apn2C66We4Fh1o1g
	 o3YPPJGfvTMCg==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Leo Cheng <leo-cheng@vip.qq.com>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 2/4] nvmem: layouts: sl28vpd: fix device_node reference leak in error path
Date: Fri,  2 Oct 2026 11:13:27 +0100
Message-ID: <20261002101329.1084348-3-srini@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002101329.1084348-1-srini@kernel.org>
References: <20261002101329.1084348-1-srini@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leo Cheng <leo-cheng@vip.qq.com>

sl28vpd_add_cells() takes a reference on the child node via
of_get_child_by_name() for each entry and passes it to
nvmem_add_one_cell() as info.np. On success the created cell entry
adopts that reference and releases it later via of_node_put() when the
entry is torn down; nvmem_add_one_cell() does not take its own
reference. On failure it does not consume the reference either, so the
caller still owns it, but the error path only puts layout_np before
returning, leaking the child node reference.

Put info.np on the error path as well. of_node_put(NULL) is a no-op, so
this is safe even when of_get_child_by_name() returned NULL.

Fixes: d9fae023fe86 ("nvmem: layouts: sl28vpd: Add new layout driver")
Signed-off-by: Leo Cheng <leo-cheng@vip.qq.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
---
 drivers/nvmem/layouts/sl28vpd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvmem/layouts/sl28vpd.c b/drivers/nvmem/layouts/sl28vpd.c
index e93b020b0836..79de1e6947d0 100644
--- a/drivers/nvmem/layouts/sl28vpd.c
+++ b/drivers/nvmem/layouts/sl28vpd.c
@@ -126,6 +126,7 @@ static int sl28vpd_add_cells(struct nvmem_layout *layout)
 
 		ret = nvmem_add_one_cell(nvmem, &info);
 		if (ret) {
+			of_node_put(info.np);
 			of_node_put(layout_np);
 			return ret;
 		}
-- 
2.53.0

