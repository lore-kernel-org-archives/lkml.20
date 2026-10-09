Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124283B47CA
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 04:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791521791; cv=none; b=VfwnBbzsnaRZJoPzmrk/N/ouXWN4WFlYGbQKkBgKrdGNRbh7Rp5wjzcjXZr7AtmnFrs1ETUM9ZvyP6wh9SqtSqiaQY3o+bRlOSelqShxL/yxg/SuRiW/QMKWLZxH3l/LMfq4Q+ER1Rj4rBhebzsmi9ay2n/dngBwqb7LPGaTlqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791521791; c=relaxed/simple;
	bh=WwSckjOBWrCYN9XlarWxC52X/STRxdoPBZuoI6p6rN0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uyM8MiAppZ34c1vJBaM5XMTKys0xaGcvjnz4a2a4DwX3pQ5fL4zMRH8r+0T4iS+So8N/9I8D2mmOeQlKw6hQIWA22P6MJ8A3/I2NHrjq85tYJVl79hkYA0kYND3z+QKDO43co55n2oc7NMpH6EktX1YqORQtbQNqxZIuk+H+w18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAC3wkD3c8hqoWEcCg--.3131S2;
	Fri, 09 Oct 2026 12:56:23 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Thorsten Scherer <t.scherer@eckelmann.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gavin Schenk <g.schenk@eckelmann.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=83=C2=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] siox: fix memory leak of master buffer on device release
Date: Fri,  9 Oct 2026 12:56:26 +0800
Message-Id: <20261009045626.3122539-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAC3wkD3c8hqoWEcCg--.3131S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw13JFWkuFWkJw1Dur47XFb_yoWfuwbEkr
	Wj9ryfCa18Jw4xAF12vFn3ZrZYkF95XF4rKF1vgayfWrWjqF15A34UZrsxK34UJFWxGrnx
	Wwn8KF4F9343JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbcxYjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26F4j6r4UJw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY
	6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU5qNtDUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAIPA2rIZ8odSAAAsY

siox_device_add() grows smaster->buf with krealloc() when the first
device is added, but the buffer is never freed. siox_master_release()
only frees the siox_master structure itself, so every unregister of a
master that had at least one device leaks its transfer buffer.

Release smaster->buf in siox_master_release().

Fixes: bbecb07fa0af ("siox: new driver framework for eckelmann SIOX")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/siox/siox-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/siox/siox-core.c b/drivers/siox/siox-core.c
index 3e8f3b6a4555..147dd1a3e146 100644
--- a/drivers/siox/siox-core.c
+++ b/drivers/siox/siox-core.c
@@ -673,6 +673,7 @@ static void siox_master_release(struct device *dev)
 {
 	struct siox_master *smaster = to_siox_master(dev);
 
+	kfree(smaster->buf);
 	kfree(smaster);
 }
 
-- 
2.25.1

