Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6062931D2
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792032116; cv=none; b=jS7Wyq7BvWb+KDsWHi5LTMsBzcHlRBKehpatYl4OfhXDJbT19NVsCpe5ohPigt9aNN6oWosJIYL4y+xORT1KNmhglgzk4E5J4DGKiauJb0NhY9DnJPOVvp8piUFrET+zNt6Rz9KoHIUBkFrucQHrGVUs3p0w5dVMxhsc5bhokho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792032116; c=relaxed/simple;
	bh=oyq+VdzzYbQeA1Lm/IgIDce3G05vQ/QM3uthVUVYaqs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MbkoqAO5vPyQk3LngQVIEbz8rHQ/AA52fg7Mt/J5MqQUoEu5eVJr6FmLjB0FLbaJzDaBDYOQ9tw31kkRCnIIe/HmpgVkqZFmXxZ7G5ozB8vpQWm4gVxq06B5eTW8YDVjkYFnVNyGJvzTUGI4FFxasn1iB/5LGTPbO9XhJ3+Sing=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHR8H5cg; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHR8H5cg"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91ba702cceaso11475206d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792032114; x=1792636914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YTqPyeSiS9COwId/RRKFhimUZVSM+7caPHhUGbIiHuM=;
        b=lHR8H5cgljq4mP8UTaPi0MtV+UiQIUVZDngPYVqdwgdgp0KppmXRKZubJE2NHt818v
         VuhMY+FpBwWg1A9tiTWuPpOf0g3z54c3z+R52YnVUn4FnczEBJI++W58gsQzfX+P/efU
         MbePUR5X7JyrDJVzB0TcYCMo35me6VUHlMBHsIEQFKuCCEC/US76zIYE81U/GSANBg7M
         JixhjzTsTmmmPmfrxRAMa8V4knaUs2oU+gjXeQNpfevQ5RSvJzS7SPb8SyX2A58hfne7
         MB4qp6aY8R7yL+5FvoVl94FoQtyC2aR4utI/xowFK7kg8FV3zYPzuDcJV0tBzdwrqPVf
         OvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792032114; x=1792636914;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YTqPyeSiS9COwId/RRKFhimUZVSM+7caPHhUGbIiHuM=;
        b=qCeyWEKkMC8WjxEHFiLu4nOoqpVZMIRuhgX2QAtDvOpWREaphU/KKI8EJLkhVf7O+1
         swQX4QS4oB+FcXcURlAZI6pw4J+6TIkKnjgtbZSOD2kQ5n9Ptey4hIxC66RkjBWrGer/
         xRkt6cK70mLEtX4IXMBii8tvDDFI62R43nNsV9qcV9xnzRzkn5gN3akv73duhEEsrsme
         bGMRUOSw/XymKVbiIwvUjFriqhRPsi8qNgy809EKsLwuU7glPgZXduH1h1+8JoMO4Zyl
         YQFLlkR/MwhNX9C4eyFwKd5fPQNKU6DZEj8CKUonoUg5/v/BSOM5ni3yPqPz4VmMJ1jZ
         0PzQ==
X-Forwarded-Encrypted: i=1; AKwUvByuLNxePIwuKq3VCLekpEpu0FNbC/KmI9LlSOMPDIKYyJGslcvQhWTows1WmrRbtpyTM+C8RLlj7ShURMs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwrtyUMtlCTolBOw4lR2x9NvvuPd7frOXpL8p5ebLkcfXuKis6
	LC+kq6KA8K761qUcFVe0T2h7MG5qgC5M+3pYhF3ryksdGxZeiZnr2kg=
X-Gm-Gg: AYBFou2Faz/BKHQ0SwqjHY1YmuALJFEXrmq/v3fZjFhttqe9X3FuUgdQN3R1SLNGoYK
	MUE7wFw7xvaR/inea+JJbqPOA7bbSB9K2q/gveLZQydVHORSOZ2jk8d0YC16xFN2X4G/0+jQc25
	eJFH9yyubNkcvzbJnku8J4mQ8HMHNz1Z8JMaT+err/GugQkQDBRMy5BBM0tIkSt5YZdipZgh49D
	iXneUCAbggVIyrVydTYz31Wpd2QGDBe8QVeB+Rc4WpS8PVwev6PlVncXgFd9FK3PP5KcrvhpMUE
	x73qIV8Z1xjiG0KuxHvIuehEIw5Un38AyEFFhztgYL40la55XBT0USyzmQVM+KfrVFBfx0Oz6YL
	Lxvwg5aZUiTt367JI+mbxoe+wkbW/0BavPBfVAePm7unC1VMx3cepDNAMhvFnjBg6NCoWk9NUEC
	I7jxzoVQm82IMYqLrWqp9VuX5IYisZYdSyZsaju7xJIamAOzPGLTzugcDZk+LPqN8vjTW+Cz5kO
	81w0VY/F2r7EpVldlUHr3DMUxaYPkY/CzhcE7sCBfcBDbwvOmIrYs6OeShIWSguhYh+PrcXuZ2L
	dufhIXY7BJ5OK1H3fMzdQBykx6iv
X-Received: by 2002:a05:620a:28d4:b0:93e:f5bd:7e13 with SMTP id af79cd13be357-93ef5bd7f23mr1294170685a.64.1792032114246;
        Wed, 14 Oct 2026 19:41:54 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef50b6c4fsm644965685a.47.2026.10.14.19.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:41:53 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] crypto: amlogic - Free channel IRQs before disabling the clock
Date: Wed, 14 Oct 2026 22:41:48 -0400
Message-ID: <179203206852.2659709.13834828335447558448.G3@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The channel IRQs are requested before the managed channel array is
allocated. Automatic cleanup consequently frees that array before
releasing the IRQs. An interrupt handler that has already read a channel
completion status can still write chanlist[flow].status and complete the
channel completion after the array is released. A cipher timeout allows
such a late handler even after its crypto engine becomes idle.

Release the IRQs explicitly before disabling the bus clock and before
devres can release the channel array. Do this after crypto_engine_exit()
so normal requests retain their interrupt-driven completion while the
engines drain. Use the same cleanup on probe failures after the clock
has been enabled, preserving the channel allocator's existing unwind.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: 48fe583fe541 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with GCC, W=1 (arm). No runtime testing.

This bounds IRQ access to completion state and registers; hardware DMA
handling after a cipher timeout is unchanged.

 drivers/crypto/amlogic/amlogic-gxl-core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 169c6ee..333db2e 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -136,6 +136,14 @@ static int meson_debugfs_show(struct seq_file *seq, void *v)
 }
 DEFINE_SHOW_ATTRIBUTE(meson_debugfs);
 
+static void meson_free_irqs(struct meson_dev *mc)
+{
+	int i;
+
+	for (i = 0; i < MAXFLOW; i++)
+		devm_free_irq(mc->dev, mc->irqs[i], mc);
+}
+
 static void meson_free_chanlist(struct meson_dev *mc, int i)
 {
 	while (i >= 0) {
@@ -291,6 +299,7 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	meson_unregister_algs(mc);
 	meson_free_chanlist(mc, MAXFLOW - 1);
 error_flow:
+	meson_free_irqs(mc);
 	clk_disable_unprepare(mc->busclk);
 	return err;
 }
@@ -306,6 +315,7 @@ static void meson_crypto_remove(struct platform_device *pdev)
 	meson_unregister_algs(mc);
 
 	meson_free_chanlist(mc, MAXFLOW - 1);
+	meson_free_irqs(mc);
 
 	clk_disable_unprepare(mc->busclk);
 }
