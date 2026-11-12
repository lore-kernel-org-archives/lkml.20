Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794516591;
	b=qmOG2m30SW714mxvu1yhQQ+gq9oT8NnJfo1eyP8ST0Inu/09bqZZ8cnPVbCfL8vZylZ6
	 ZTWOWgW5ZTDM/0W7v0/X5o9SlyWmdbVLURq9ypK0L/CpVmFAI7yoraxZctu7Q2NkFChl+
	 DmWfgMy45Esb83iSyVnNeEa0TeTAZU7M/t2IHx7mgszPtTRrV378R2PZxzrIwN4DXmDM6
	 nwniK/7ScEhlRF3vr2E1gRfBobLPxzup5pZplkCTLmIf3C6v0Qek1tNJ+anu0wkek4LQy
	 QYhUYSIWNFifh+dc5H7Yfcan8/oRrwBP2CeJIzB6LrnIrLnGESyhEEIrG35BlTKe72w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794516591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RNeeQDnckMo2sALbJ1N7r4lh1eJheLFFD2HxmOutfIs=;
	b=G4LhgI7KJ9KbnRv00vvohnR7GFa+O24RcbZaSeJTSCnaqOV9PaHrtmOTAfbiBTrl53tG
	 qqx3SeJb48j5cqDCAw3MP4rwEtHrXz5e04LkmQoz4BO3d50gvj8vpETemvdQAhfe2EIkP
	 v1ANrJFSHXOKmpgcbouMeFE1wCpm7ATcUolIaqAOXBWN44L7sfgneU7iISwoA5dg4Oyrw
	 Nl5pTZaB1ytvTqT1c70/ubyfWebXrQQ7/+SlFZqGJiao08JjKwDWXt83WCsdd9YYZLXck
	 wxGEGRt603bIuUC/NRB4mol0zRpjqzJ9Vow+JujvaLOhaw0aQUcpuGoVk8VywS81j7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Arh4QoUC;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14B1606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E14B1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Arh4QoUC
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91ec396c93dso2141566d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794516590; x=1795121390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RNeeQDnckMo2sALbJ1N7r4lh1eJheLFFD2HxmOutfIs=;
        b=Arh4QoUCHdK9bQ2lGysSwXFp2MrPuPnYI3O6xdOShbRi8v+0lftG/nk/YGKGvuGljq
         7p4YlL6ysU4hHjjkXfh1C3lc+grgHbgnkhdWumia1VFS2rhsN9M1fXnR/sO8qyD6FnRa
         rWx1gXXaLBBNwssc1Qt5/ywa29ZsA7X3z4JcafbIR5/4Og4PlcmSpOEKfg5e9Dx+IhQa
         Pf+AVBYHcgbhKm0TdKeEw8tukIKFtB3t7uyXd1smo5KHX3Mzem7GnMetoKbf7iHkdXEp
         DKGS8/PtEAHHucft8pDAO26uJwzxVAbFnzzlMR4mpEwM1FfqvMNQjwW0yAzv1K3l22n5
         p98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794516590; x=1795121390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNeeQDnckMo2sALbJ1N7r4lh1eJheLFFD2HxmOutfIs=;
        b=Ewqgv+IwAqUC0RiTMmyIGK7oAm7Y9l2n6TtqpQAzADXQx/7l081QHrku5yg7Uejw2C
         fbUqF3GeY+5RrLjrfvXMxiX5sRWZUjl2XWx55hUEu3iQ0XgshvHXkx4bjxHSgmUVdg4I
         q2WecPZibWkDEU0KhWF9YSAONs0laSMtDg8K/lU333CNIXEZ6ed7Zx4z7PYrspzglo7K
         aVEVM5ga90TVcTv3Tx6hNLSmFbOs8FsPz9KfOYHZIW0K8L6p3iRRJOUYJHWRMnS5wktz
         cvPDBv7a/U+M7HWRlH6Mbp+83BFFsfJ7+i/1p0Z3yCoycJu9tNIWSXmf9mZRZKVErukW
         OaLQ==
X-Forwarded-Encrypted: i=1; AL+hErGFJBStkssIZD8LOFIn1Et0ECyR7IP+cvWViBghLEPK5oym+M1s11wiofyQ2aSTQib4NB7aQ30mSUn8pBc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JlgWhunWf4prp2NuEA6egYGQiA/5E3lpU52vc3DHr0dk8Rvq2
	i2RAOE5hRXfcm0uk+cis+/fpmGIUBrM8+F2eherS6xC48Z+fMmDQjG5t
X-Gm-Gg: AYBFou2YRb5ZsnHaqNsWQvzUN7YKTp5qtU9emMg01YBf2SyN5bqhMh1plUNxxU1mMtj
	6GqXZe8s5XG2egbMVcderXDiWPFa0fZeDJdVqYt5QIKTipHYHR583+U6YsxvL4t+t1nGDUoKmTM
	IuvGxH8ArlapOvX/kVGyq1ak4zno+mHTbOCvkqLIESFaZlvyQwBl3HEVkT3/pR+LUz5fHcPrJf/
	3k4Qa5keSg2OqaeCgJ8GT0KmsEfFFAfAqzpojIo5/ex9wJOeqDiDIYI0qBENM6S8Fv2M+mUH1Tb
	c3Jflps+OxcdBDeHlxH5NDPSXc2E8KQCV1tFwOQhbNQQqGFPJLFq2K279QtfR8Z1qM70S6x21MI
	64rmNvFDsrrsgnKjYUo1ULcnRZDHZUdlaRk+6hAxwtRGsPRv+FPcWu264McPv8YfnYCTT6sg9oG
	jnJ0DMpnLQXpgdCEpAsMeGYSKrpBqtS5hyTaSH+dO7ZiTwE/9g7bv2ofRkNOpvvf/kUh1rGwEWk
	CO5u6QQAi50bitJAjfhKSnlo9qpeRyYQVRFBFvfroUA80KJLlGyjXN4cYRUgdiT6LgGg3x0YqMq
	BhpGotGEBBJN/9ThvQ+Qy9vT30C9rbukdz7UCqkbw/H10d/m0Ic9
X-Received: by 2002:a05:6214:4801:b0:91e:8baa:f132 with SMTP id 6a1803df08f44-91f241504a6mr8465936d6.14.1794516589727;
        Thu, 12 Nov 2026 12:49:49 -0800 (PST)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d9f3cesm4439086d6.35.2026.11.12.12.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 12:49:49 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v3] irqchip/gic-v3-its: Drop ITS node reference on its_of_probe() errors
Date: Thu, 12 Nov 2026 15:49:37 -0500
Message-ID: <20261112204944.1427733-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
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

its_of_probe() walks the ITS nodes with of_find_matching_node(), which
drops the reference on the previous node and returns the next one with
its reference count raised. The loops are balanced when they run to the
end, but the three error returns (a failed its_reset_one(), a failed
its_node_init() and a failed its_probe_one()) leave with the current
node still referenced.

Declare the iterator in each loop with __free(device_node), so that the
reference is dropped whichever way the loop is left.

Fixes: c733ebb7cb67 ("irqchip/gic-v3-its: Reset each ITS's BASERn register before probe")
Fixes: 9585a495ac93 ("irqchip/gic-v3-its: Split allocation from initialisation of its_node")
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
Acked-by: Marc Zyngier <maz@kernel.org>
---
v3:
- Keep each loop's __free(device_node) declaration on one line (Marc).
- Add Marc's Acked-by.

v2: https://lore.kernel.org/r/20261103201817.1259660-2-oss.patchbox@gmail.com
- Use __free(device_node) on the loop iterators instead of adding
  of_node_put() to each error return (Marc).
- Rebased on v7.4-rc1.

v1: https://lore.kernel.org/r/20260923165447.619477-1-oss.patchbox@gmail.com

Compile-tested only (arm64 defconfig, W=1).

 drivers/irqchip/irq-gic-v3-its.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 282e4bafb084..ddc07cda5539 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -5572,7 +5572,6 @@ static void its_node_destroy(struct its_node *its)
 
 static int __init its_of_probe(struct device_node *node)
 {
-	struct device_node *np;
 	struct resource res;
 	int err;
 
@@ -5582,7 +5581,7 @@ static int __init its_of_probe(struct device_node *node)
 	 * reset, don't even try to go any further, as this could
 	 * result in something even worse.
 	 */
-	for (np = of_find_matching_node(node, its_device_id); np;
+	for (struct device_node *np __free(device_node) = of_find_matching_node(node, its_device_id); np;
 	     np = of_find_matching_node(np, its_device_id)) {
 		if (!of_device_is_available(np) ||
 		    !of_property_read_bool(np, "msi-controller") ||
@@ -5594,7 +5593,7 @@ static int __init its_of_probe(struct device_node *node)
 			return err;
 	}
 
-	for (np = of_find_matching_node(node, its_device_id); np;
+	for (struct device_node *np __free(device_node) = of_find_matching_node(node, its_device_id); np;
 	     np = of_find_matching_node(np, its_device_id)) {
 		struct its_node *its;
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

