Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737105;
	b=qBJSGqW9n9xA2vFU6gtPDGUYShUeduJ0spUo+EO31owuXgDrVCoFiuIdIzVpHXaeGIoC
	 zSJ5vYJrFu1TFyuu9v12SJjumC52jhLH/1R6ZR9h9aadlufFn59GAImqwnuzXJAzX2l1j
	 yJZNZ8YsEzsgJMeexDK/o1fzXYnDQOQLMYSQ6e4IajhbPdyZuIS0nuYs4Do18XY9kewcj
	 PEQG80QMe6l6572IRYp/W4lA7hoRkVtythPpl9xw8bEqn2bm2uAQ2khmolOcQ7F0AybT4
	 Zm5bEoPbeb+UDbUB7PzfxxcyXz0q2jqjmo51YtkA3LHdTvfT1Ht0854CmsW8ZVQdEIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Xny6TxdisJDz1rgCYagKSUk768TV4NYM8IYebe0cybY=;
	b=eIynhJp1srVIS20SiLeYoeH/QWSkQf1enh9fO8KLZkBmFLStobTlBR4mX1+d32qbNAp2
	 CErYckoKnXJzfyKAxTq9P8NnU6nQwrHwIB3jP94WHh3RGdaFXDheBs9EjymoO8ITWAL9m
	 f3NMrAw38XenYpkjwcSRS2ltf8oMvUG2wVBZF3/gnZhnFdmYTpvmvyFV1wKwF+H6PxWPo
	 QkZ+S9e61axDfCSXxgC9+X1YhOSFNZTAcoZNnpQ6WWavG1w8JxkkqV480xd+iKmPEByfl
	 Ly54xkPuq4CrpBXCNK89wPNrupPQ+14pqFbsLSZCq12jrbiJftQblw6KUkfsQhx01WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nipKVCTB;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994E1606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 994E1606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nipKVCTB
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91c791d5460so734086d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793737103; x=1794341903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xny6TxdisJDz1rgCYagKSUk768TV4NYM8IYebe0cybY=;
        b=nipKVCTBE9DipRbWBWM8riaSp+ZE5lc1wbL2Tg2pOFblhssBproOupEOeIPs7TfOMX
         xPHcGiXojn400BMFeVVH4rrBXLEZjdnB35uFeiMqNOqvI1CvR4+7MA0ZwiF8DzxVhkRw
         VUocVl0dJr9607/qHbpCjkr+iSYSX/3elC7yfjtP0YKFpPkcxFc8vOslJHB9cMfkKK+K
         Vo8nEbDAoOyLoyfEwlzqf0TlYLdF0pUsGkvMo30ti12hOkNJgss5znGvq3NldLvHIZQM
         9MyfZaTokUIc31x6SAi2Sb2hPJ+CTv92RdjQfdy4tzvAs+fgQnS9jRX7JXhlqmQiGrLn
         57Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793737103; x=1794341903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xny6TxdisJDz1rgCYagKSUk768TV4NYM8IYebe0cybY=;
        b=dxOfkAsDBz2LHQHhZ+M/iP/aYLI7erXnuAe3Lp3FjrUQ6yKOXAmQCJMsthiXDI/S5R
         HizhFt48zAt1jVNeTbBdbWYADZ18PGOLKDhicm3+0PA9ux1iWb34u8gli4tuA2y88g9t
         GuBNCVTSfJlgJbcDNJBLmZkmQpPtmcJsLB13PCsn35njTwYWvfSrcSSkOo2DUdctaXka
         FbLHTrzZx44IIK8FRamIAS5hrtUMB+2Kr69EX/hd34lyDLHIsRMMa4WBaoju8wz/yILL
         UF14IMWFfUISy7XOl5IFKZVo+NTmJyaP7WtkV7hUnUg5ETSzJcgDJBIX8MkRbIKSXP2I
         cTDw==
X-Forwarded-Encrypted: i=1; AKwUvBzYv6QbOgp1oAb/5+b27QQFH2aLS2KH2mMKSJOeBml/9/kvdaxoCmUzWr9Rb2+q8Vo2RQXz88EocDpQ/QA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JQG5S82nlMfFvhC9g6xN7sBweky13SUK8gZ7CmP+jfQtXxY9u
	AfNnwQX2u/vhV2pJmBcym70OysMXGHzpJJ7pJRR1K/DbcZ4YbC9aCnrn6fdQ3A==
X-Gm-Gg: AYBFou2lb2R1D6qEFQ9Q5N1GIL96BSV+lcdE7FiFCvxX7j+5BpbZ6mq5nen+iUBPXed
	gyfAwP5Cm0kqsazPTFpSxTotjpByLoL34MMMoM19uZfQsfrtnwFesvUmadt7Iy3Pj3KBs92+1sJ
	12OqakM9VxRJZleWcTnfp+pz89iRAfhv98QTVjjtX2L1k7Ftik95ZP87cs2oi2OQioi7a03yJ4k
	Ip4n4QZBQyYeAWURvHYmFoUN9L1lfteXDBSpYNlKmwEjhsmIziZe0hsVCPd3xDXcCe/zq/ilSCv
	FmctJ6JX9s650g34o04VFF27j+yrE9GlmAN3HzMhNtNqLoEkDXufZGNYeDx4pYy81aRNiPJo4l/
	PralrLw8F0ACxY5PshiF6ZmRfWAikHS9n6yZrAgMEjgblJ7zmBY83MxD44xjOTTbpYCb29AlnPw
	drEpnPSSKRJXozHC3rcZmLy/viISjb5BxovAn8qoeTLf3afGUH53eH3d5oldzO2fj9JPwfwJkyU
	lBg+pB1WiKZ0DcqCbShy/oTrN/lO0zb3hHe5KNjTgCW6eNtvUJeS0unnQptQEuiHOKJyHY9OM3x
	wqU/3Ot5TaEzLwnk8K05WVyQH6XY504Pk7mVUqKWzTrFrIEY8qDW
X-Received: by 2002:a05:6214:5910:b0:91c:6cd1:8058 with SMTP id 6a1803df08f44-91ca4aea703mr226950896d6.13.1793737103352;
        Tue, 03 Nov 2026 12:18:23 -0800 (PST)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7c79b50asm1854636d6.31.2026.11.03.12.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:18:22 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v2] irqchip/gic-v3-its: Drop ITS node reference on its_of_probe() errors
Date: Tue,  3 Nov 2026 15:18:10 -0500
Message-ID: <20261103201817.1259660-2-oss.patchbox@gmail.com>
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
---
v2:
- Use __free(device_node) on the loop iterators instead of adding
  of_node_put() to each error return (Marc).
- Rebased on v7.4-rc1.

v1: https://lore.kernel.org/r/20260923165447.619477-1-oss.patchbox@gmail.com

Compile-tested only (arm64 defconfig, W=1).

 drivers/irqchip/irq-gic-v3-its.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 282e4bafb084..7c5df91a317c 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -5572,7 +5572,6 @@ static void its_node_destroy(struct its_node *its)
 
 static int __init its_of_probe(struct device_node *node)
 {
-	struct device_node *np;
 	struct resource res;
 	int err;
 
@@ -5582,7 +5581,8 @@ static int __init its_of_probe(struct device_node *node)
 	 * reset, don't even try to go any further, as this could
 	 * result in something even worse.
 	 */
-	for (np = of_find_matching_node(node, its_device_id); np;
+	for (struct device_node *np __free(device_node) =
+	     of_find_matching_node(node, its_device_id); np;
 	     np = of_find_matching_node(np, its_device_id)) {
 		if (!of_device_is_available(np) ||
 		    !of_property_read_bool(np, "msi-controller") ||
@@ -5594,7 +5594,8 @@ static int __init its_of_probe(struct device_node *node)
 			return err;
 	}
 
-	for (np = of_find_matching_node(node, its_device_id); np;
+	for (struct device_node *np __free(device_node) =
+	     of_find_matching_node(node, its_device_id); np;
 	     np = of_find_matching_node(np, its_device_id)) {
 		struct its_node *its;
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

