Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A253C10A8;
	Fri,  9 Oct 2026 05:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791523054; cv=none; b=DyPdX6/IpzhbHBNCrgyvFPzRr0TSzmfM3O5CFejSTXp+yQP6rPiBiv1+/OL7h1EHXaatYXsSOBKvKuG8Cw88crOwQbiER4xObj2P1jNCzQBwfRX/JTJA5NUawpcMYO9ciN8QGS1W7OWGwg7ZtSwS4mYMtuSnjfliQydF8gRkY0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791523054; c=relaxed/simple;
	bh=/MSEaVo1C9RcG4E5bZK2ORmW9hY8YK30CxPCPl/Vwnk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jvEOqIaoBfncnfN9AKN/mVwegYa6yLvoJVcx65jRw1gsC7QXz+fIMJBk4r01SQn4Ll5B+xzh+lt+54OrMgp2oLx0znPD94+RFThZhr5BuzD4aWiRChhlEmhZnD/tjaTgsQTNJ17q0Ir3gVlNpy6O1T9weaQe224YA9RfDk9gCSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowADns0HieMhqH80cCg--.3235S2;
	Fri, 09 Oct 2026 13:17:22 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: meson: axg-fifo: return a negative error code when no irq is found
Date: Fri,  9 Oct 2026 13:17:24 +0800
Message-Id: <20261009051724.3134644-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADns0HieMhqH80cCg--.3235S2
X-Coremail-Antispam: 1UD129KBjvJXoW7GF43KrykCFW8GFykJr1rCrg_yoW8Jr45pr
	Z3Gr90qFW3Gryrur1vk3WIkay2yFy7JFWrGFn8Ja47Z3WrtrZaqF43JFyjqr4jqFWrKa15
	JFy5XayrXFWUAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvCb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26F4j6r4UJw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
	wI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2Kf
	nxnUUI43ZEXa7IU5c2-7UUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgcPA2rIYxA6pAAAsC

In axg_fifo_probe(), of_irq_get() returns 0 when irq_create_of_mapping()
fails to map the interrupt. The error path explicitly treats this as a
failure with "if (fifo->irq <= 0)" and logs "failed to get irq: 0", but
then returns fifo->irq as-is. probe() therefore succeeds with fifo->irq
set to 0, and the failure is only reported much later when
axg_fifo_pcm_open() calls request_threaded_irq() with irq 0.

Return -EINVAL instead of 0, keeping the real negative error codes
untouched.

Fixes: 6dc4fa179fb8 ("ASoC: meson: add axg fifo base driver")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 sound/soc/meson/axg-fifo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index 75909196b769..fdbee44f5101 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -365,7 +365,7 @@ int axg_fifo_probe(struct platform_device *pdev)
 	fifo->irq = of_irq_get(dev->of_node, 0);
 	if (fifo->irq <= 0) {
 		dev_err(dev, "failed to get irq: %d\n", fifo->irq);
-		return fifo->irq;
+		return fifo->irq ?: -EINVAL;
 	}
 
 	fifo->field_threshold =
-- 
2.25.1

