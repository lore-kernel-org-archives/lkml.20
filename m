Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EE7483833
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936027; cv=none; b=eY7F60BRUblXdHYNYL9Ieg1StElWZNqf1DBbyAaRkje4LZcniPtCRYynpvBsBffZbIsUzqKNHnja5zwAshxIWNPROWN1xGA6xn8c6Jtkf3CZX12QkCgY+s53/HjyG5DOxUqyg8xuXuPh7du72TgriTZRX3vnoegx7AYjv0+UoB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936027; c=relaxed/simple;
	bh=jrDuSrgBBPKExPJ4WSG42l/rCyBOpI1C4ZG0wHF3YgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eUeRvMfygtIdq3ZkZwmWymXe4MlGkau6UbO5tUQRklNlUkeaIgu2GgpjC3bNQbvwYG+pI3YzN0JFa4gTzLO4o5bIR8TjDsrsvOyONhBcUlPRDEoYG7c/NkCCw/EAr/AE+RNjy4XhTl72ctjsWapKTFRsmsBpshXsBvsdk0myeBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KN5OVrId; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KN5OVrId"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245761F00893;
	Fri,  2 Oct 2026 10:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790936025;
	bh=pBKHwD9Se18RGIJ/FjLCjUdYXLvf3Z/c1r3/zqMeXUM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KN5OVrIdOc85zn1VKxjXIOlHVaSrImm0OObprYv84uQnsXtRGmzSIDEIxhGiXQFCQ
	 4GaiyjhG2kVZTmZNEs5MRCJFaovroh4zgL08u+A0xECVsTbTGbfhte4BUNRdV4a1cW
	 4edUSqVSGvoG9F0JDl7ofXW79Iy2v4rTgWBndulCuxGTT7cWFH95j+IIKnweo5RFR9
	 N8J+1HKqBCvk6IsgwsUwTaemGw/6/jnO+ILHLixclUrk4cOGL5QkxgNYpEQACwE9uB
	 qVoFw+ZBeTsexCE7FqTE+GHuDh+x6OypQmLPg9arAgAaPy6Rdvakno3kbyPJmZT6Ew
	 iXm42fA95OHGw==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Leo Cheng <leo-cheng@vip.qq.com>,
	Michael Walle <mwalle@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 3/4] nvmem: layouts: onie-tlv: fix device_node reference leak in error path
Date: Fri,  2 Oct 2026 11:13:28 +0100
Message-ID: <20261002101329.1084348-4-srini@kernel.org>
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

onie_tlv_add_cells() takes a reference on the child node via
of_get_child_by_name() for each parsed TLV and passes it to
nvmem_add_one_cell() as cell.np. On success the created cell entry
adopts that reference and releases it later via of_node_put(); on
failure nvmem_add_one_cell() does not consume it, so the caller still
owns it, but the error path only puts layout before returning, leaking
the child node reference.

Put cell.np on the error path as well. of_node_put(NULL) is a no-op, so
this is safe even when of_get_child_by_name() returned NULL.

Fixes: d3c0d12f6474 ("nvmem: layouts: onie-tlv: Add new layout driver")
Signed-off-by: Leo Cheng <leo-cheng@vip.qq.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
---
 drivers/nvmem/layouts/onie-tlv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvmem/layouts/onie-tlv.c b/drivers/nvmem/layouts/onie-tlv.c
index 8b0f3c1b8a0e..4da3a704388e 100644
--- a/drivers/nvmem/layouts/onie-tlv.c
+++ b/drivers/nvmem/layouts/onie-tlv.c
@@ -128,6 +128,7 @@ static int onie_tlv_add_cells(struct device *dev, struct nvmem_device *nvmem,
 
 		ret = nvmem_add_one_cell(nvmem, &cell);
 		if (ret) {
+			of_node_put(cell.np);
 			of_node_put(layout);
 			return ret;
 		}
-- 
2.53.0

