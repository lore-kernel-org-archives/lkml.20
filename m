Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE3A3B3C03;
	Sun, 30 Aug 2026 12:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788093643; cv=none; b=a3g70SMTRcmXL0o6x0wLnjZyODFsQaIatJwweRViSHzXddpXG2OpBehhk/7i8l6Ks8/gVwr6Oc2ThHY1BQhT09NSbNY2AIRhACgiAeFLgjPvIbWk4HD8bmr+cw2jkZhWPrCTqwTjKHxbWEasQTJDKjtu0gE8wD+4rLVydOC0pkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788093643; c=relaxed/simple;
	bh=Old8QB90Ux33BOYGXmtT/hrvEcn532k+LWNFbmLlJfo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZESgiv8qQnuiKPE/aQeuR6XAYyRXvK691ulqnGBh35zi7yIyzPAIgxwQQExwRk4SX0KtVJsoOiZGOw2EQ8d4aVgJ0EccoLKOhA0vHlFb8AJ19sLP+/Rvmo93vehtnihbxtFU5rGWmOPwJIC1xb5yYMI+Sb6MPaYwsk8Hi2Hgdd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowACnc0HEJJRqNYGaBg--.26755S2;
	Sun, 30 Aug 2026 20:40:37 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvb-frontends: ds3000: validate firmware size
Date: Sun, 30 Aug 2026 20:39:50 +0800
Message-ID: <20260830124034.95459-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACnc0HEJJRqNYGaBg--.26755S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xr4ruryxZr4DXr4kZr4ktFb_yoWDXFgEkw
	1DZF9xuw1YgF1kZr1jgr1xX3yq93yUuryvvF42vw43JFW8Z3W5Jr1vvasxtFW5Ga12gF98
	A3Wjva1Uua92kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbwAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJV
	W0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUdEfOUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The firmware diagnostic reads the first two and final two bytes without
proving that the firmware object contains at least two bytes.

Reject undersized firmware before the diagnostic and upload path consume
it.

Fixes: 09ea33e5c696 ("V4L/DVB (13493): TeVii S470 and TBS 6920 fixes")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/media/dvb-frontends/ds3000.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/dvb-frontends/ds3000.c b/drivers/media/dvb-frontends/ds3000.c
index ce7ae424b27cc..76d2eb98932ae 100644
--- a/drivers/media/dvb-frontends/ds3000.c
+++ b/drivers/media/dvb-frontends/ds3000.c
@@ -374,6 +374,8 @@ static int ds3000_load_firmware(struct dvb_frontend *fe,
 	int ret = 0;
 
 	dprintk("%s\n", __func__);
+	if (fw->size < 2)
+		return -EINVAL;
 	dprintk("Firmware is %zu bytes (%02x %02x .. %02x %02x)\n",
 			fw->size,
 			fw->data[0],

base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
-- 
2.50.1

