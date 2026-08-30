Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E747E282F34;
	Sun, 30 Aug 2026 12:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788093991; cv=none; b=iFhHjzt91DBdNXKsVRRU7FHO9RQGthDckfxDWhOZuzKGcVmqbWGYYqYgTuDbxlge5tR4i2EL9hQYyQ77WsJdxgGIFK7vSUoxRE0rUnwcv+m/gghf5sUkwvdoww+TKfKahZ2fAUb+x3/ZYVjQLuoHa/CYD2a+AXRzGO9CbCzc4Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788093991; c=relaxed/simple;
	bh=yVQ1lYDqRkSpd2tVXe+kEQYJUHFOJLO9si0Cdi6KwVk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kS7PCXWLpeUv14RFymRiiMJMVXlY1PKeL0aLHwbPGxLdLneMDX05E357RH/1qs3kDUIi9xwPf2S6A6hcSa34HCMdVxl7viHmN4rWvfLi3JI/k88WDCPpRKVbuuhxJzFZuY9JcL4BEGRSOrtYSrxKz5Emxn7T6Ui8Sw1B8hWX8Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowACXnTshJpRqPpKaBg--.45504S2;
	Sun, 30 Aug 2026 20:46:25 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvb-frontends: cx24116: validate firmware size
Date: Sun, 30 Aug 2026 20:45:38 +0800
Message-ID: <20260830124622.96693-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACXnTshJpRqPpKaBg--.45504S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WrWUZF47ZFy7ZFW5KF1kuFg_yoW8JF4kpa
	yjyFy5tFWjgw43Ja4qya1Du3sYq3Z5Ga90ka9rJa48Zr1fWFsrWrn8Kas7Xwn8Jr4xJay2
	g3ZrZryUCFZ7Kw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUYDGYDUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The firmware diagnostic reads the first two and final two bytes without
proving that the firmware object contains at least two bytes.

Reject undersized firmware before the diagnostic and upload path consume
it.

Fixes: 0d46748c3f87 ("V4L/DVB (8986): cx24116: Adding DVB-S2 demodulator support")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/media/dvb-frontends/cx24116.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/cx24116.c b/drivers/media/dvb-frontends/cx24116.c
index c10053a7cb829..e9f8ff5231287 100644
--- a/drivers/media/dvb-frontends/cx24116.c
+++ b/drivers/media/dvb-frontends/cx24116.c
@@ -556,6 +556,8 @@ static int cx24116_load_firmware(struct dvb_frontend *fe,
 	unsigned char vers[4];
 
 	dprintk("%s\n", __func__);
+	if (fw->size < 2)
+		return -EINVAL;
 	dprintk("Firmware is %zu bytes (%02x %02x .. %02x %02x)\n",
 			fw->size,
 			fw->data[0],
@@ -1494,4 +1496,3 @@ static const struct dvb_frontend_ops cx24116_ops = {
 MODULE_DESCRIPTION("DVB Frontend module for Conexant cx24116/cx24118 hardware");
 MODULE_AUTHOR("Steven Toth");
 MODULE_LICENSE("GPL");
-

base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
-- 
2.50.1

