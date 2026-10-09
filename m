Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9A232470F;
	Fri,  9 Oct 2026 04:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791521075; cv=none; b=YdoAaz08kw1PRObt1wDM2MbrukdaP3WCQecoGXfazGaWuevrwozrYaGRhBVvO+Bv1h+rVWBm7NcaMO827ziG0U45rtxNnmwPR9ACHocjEhPKb7RBIOEl0SweQMKkFJNJafHnUAIqEUJ3+WjWZIHBNelCvt/0nyLAaZ30vDjHR2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791521075; c=relaxed/simple;
	bh=lL8HWwwNwg3MSeUp2x/Qa/mWO/uDxVg2XhvS+/3YIbg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fnT597N60CoVHrOUdkA+MKD2q12I7FZ/5fZhLDryGckxDTZ30X6Uhbb7F7KuGm5JuJB1FA6lxX6ukcRZ2RSG22bfDE/bhjxIeynonyfCHC839IVv1qjk72/qoovSw5ycUUL/s9P1vhXTK18x10K0l6df5kWqP9xcKaXIBa+cop0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowABHTjwscchqiyEcCg--.2413S2;
	Fri, 09 Oct 2026 12:44:28 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	David Mosberger-Tang <davidm@egauge.net>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: host: max3421-hcd: stop SPI thread before freeing its DMA buffers
Date: Fri,  9 Oct 2026 12:44:31 +0800
Message-Id: <20261009044431.3115704-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABHTjwscchqiyEcCg--.2413S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tF1xtF17Zr48WrWfGF4fGrg_yoW8Gw1Dpa
	98W34UArWrCr18AryDWay5J3WrGayvgryUuFyxGw48Zw15Aa15XryIkFZ5XFy5WF4fXa1Y
	yry7ZFyDurWqyF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUySb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWxJVW8Jr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC2
	0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
	0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
	14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20x
	vaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8
	Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07b05lnUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgIPA2rIYxAmOQAAsG

In max3421_probe(), the error path frees the kmalloc'd tx and rx buffers
with kfree() before calling kthread_stop() on max3421_hcd->spi_thread.
The SPI thread entry point max3421_spi_thread() immediately starts using
those buffers through spi_rd8()/spi_wr8(), so when usb_add_hcd() or
request_irq() fails and the thread is still running, it can access the
freed buffers, giving a use-after-free.

Stop the SPI thread first and only free the tx/rx buffers afterwards.

Fixes: 05dfa5c9bc37 ("usb: host: max3421-hcd: fix "spi_rd8" uses dynamic stack allocation warning")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/usb/host/max3421-hcd.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
index 73e76d0e6973..f7cd3e8d8cae 100644
--- a/drivers/usb/host/max3421-hcd.c
+++ b/drivers/usb/host/max3421-hcd.c
@@ -1922,10 +1922,14 @@ max3421_probe(struct spi_device *spi)
 	}
 
 	if (hcd) {
-		kfree(max3421_hcd->tx);
-		kfree(max3421_hcd->rx);
+		/*
+		 * The SPI thread uses the tx/rx buffers, so it must be
+		 * stopped before they are freed.
+		 */
 		if (!IS_ERR_OR_NULL(max3421_hcd->spi_thread))
 			kthread_stop(max3421_hcd->spi_thread);
+		kfree(max3421_hcd->tx);
+		kfree(max3421_hcd->rx);
 		usb_put_hcd(hcd);
 	}
 	return retval;
-- 
2.25.1

