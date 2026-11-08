Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794130156;
	b=UuhQDc7ovAyLdUZY51sBQhK9y1/4rqbDM5x2sN9IntRQch/8SMX+OVbxKCTpTIuxV0JA
	 uQH2XPxliggKsxKibP/CvkC0h99RgznAINwLl2eM7FkuXXzFt83n0VWs1BxvWSIMcnGMz
	 3TKdHmki4U6t5sEPBRXLOmf3iKsydUCYKTatOeiwfSDVrX/ya3EJUHJQUzbEkhE9YfpcT
	 AmaFEamJgvnjy2rcSkBvuu0+G/+G91wC+e4PnuLr50f+ily/KfhHGlWbT99IfeAXfwkEr
	 FBd2JFCcK2Tz1lQqVJLIs07HyGsGjHPN+y/JEnWpl/jPFHC+cHHqOIqc6MwyAuTIFPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794130156;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=4rU9NKV8P6AGXKGulUrxf5Ec2cx2F/2/MzVzQAFP9OQ=;
	b=Pv1GSdxMVz+9vpkSB5R3bZ3FOhwDTc6fWNBVRQxrIyNiNPBVBH2YAlSCNQmM7evqD011
	 ToOPFQ+BcRyIuUr66LVtS5IqdGJU2iPdKI2kTgeG+U2rjD2DMVspswXbq51aLpO1gJD3A
	 B6tKAhTpyp76sOVeUNsDxqHjgCPh0Ngwh0GufnYb3f79oBtQh2Xm+MWeuDjjuwdRiSyjp
	 Orh3ipuv4bEedSJ+E7scARCB574gqcmaNYF7bRbqAyHzS7dgrTQnvkiQUZgJn6Cv4gA0o
	 vUUZmcIDv9A4R5wgflBxncOc0XVZ5jfE8gpMFoJkcHbKGpe8H4qKQbD2bDyFuMfVipw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.25
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34B7606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C34B7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowABH4LXjQPBqF6SYAA--.17620S2;
	Sun, 08 Nov 2026 17:29:07 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.li@oss.nxp.com>,
 Frank Li <Frank.Li@kernel.org>,
 vulab@iscas.ac.cn
Subject: [PATCH v2] i3c: master: Fix fwnode reference leak in
 i3c_master_register_fwnode()
Date: Sun, 08 Nov 2026 09:29:20 +0000
Message-ID: <20261108092920.314161-1-vulab@iscas.ac.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:zQCowABH4LXjQPBqF6SYAA--.17620S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar1DGryfKw1kXF15Jw13Arb_yoW8tFyDpa
	y3GFW5Kw18JF4UKa17Aa1fZFWkA3WftrW5CrWrCasxurZ8XF1ftrn8Jr1Fqr17JFWrZw1Y
	vr1Uta18WFs8AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvq1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
	w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
	IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2
	jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcV
	Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVWxJr0_GcWlOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0E
	wIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x0JUMGQDUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgQFA2rv4zKUAQAAsF

i3c_master_register_fwnode() takes a reference on the bus firmware node
with fwnode_handle_get() and stores it in master->dev. That reference is
normally dropped by i3c_masterdev_release(), which runs when the last
reference on the master device is put.

If i3c_master_rpm_get() fails, the function returns before
device_initialize(), so put_device() is never called, the release
callback never runs, and the reference is leaked.

Release the reference explicitly on that path. of_node_put() is not
enough here: it only acts on Open Firmware nodes, so the reference would
still leak on ACPI and software node systems.

The candidate was found with static analysis tools; DeepSeek and GPT-6.1
Sol were used to audit it and to help prepare this fix.

Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
Changes in v2:
- Sorry for the delay. v1 used of_node_put() on a reference taken with
  fwnode_handle_get(), which Frank pointed out.
- Use fwnode_handle_put(dev_fwnode(&master->dev)) instead.
- Rebased on current mainline (fa4ad798f6f6), where this code lives in
  i3c_master_register_fwnode().
- Dropped Cc: stable@vger.kernel.org. This only leaks when the runtime PM
  resume fails during registration, so I leave the backport decision to
  you.
- Build-tested with an x86_64 defconfig, including W=1: drivers/i3c/
  compiles without warnings and checkpatch.pl is clean. I could not make
  i3c_master_rpm_get() fail at runtime, so the failing path itself was not
  exercised on hardware.
- Link to v1: https://lore.kernel.org/all/20260916160358.2081087-1-vulab@iscas.ac.cn/

 drivers/i3c/master.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 01e05bad8661..c532693f8463 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -3897,8 +3897,10 @@ int i3c_master_register_fwnode(struct i3c_master_controller *master,
 	INIT_LIST_HEAD(&master->boardinfo.i3c);
 
 	ret = i3c_master_rpm_get(master);
-	if (ret)
+	if (ret) {
+		fwnode_handle_put(dev_fwnode(&master->dev));
 		return ret;
+	}
 
 	device_initialize(&master->dev);
 
-- 
2.34.1

