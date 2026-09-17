Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD2F4B049F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789660248; cv=none; b=GPGEb0Rxc5YjrdnHZa4TTjYEd/FwcGJ3zBdJI6n/qI23glLOfQG9AV39ng8Ka2x/4xpZ5ZJcVf7jq+Mb7MUJhEEmvbH2O24y4mVEk+BdRxOlHRMCXTS6NZbu/Bn+whI9/UkyuSD+iMi+jnVV6RpnHU34ZY8AAPmSmfyj3l9Jifk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789660248; c=relaxed/simple;
	bh=e/5r8qTF1bMZZN0wolU+Wgtd2IwCNa6QA+NqR4+6wHw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mOkyjRz1hOrSi+5510E6UHR0MzPAPq3P7vnO1xp3EjmHzK+uR1k51DW3a+YoWRn9neFUtI43UcuEANRikb5YBIixEvRuisrCryMWwwnnZ2voaSoLpm0+qcxMZhRitlGvSvHU/brx62jyd1KXNFojrGp+MCSv9hPoQaB75cuk4k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowABn0TtNDKxq896DCA--.6140S2;
	Thu, 17 Sep 2026 23:50:37 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: angelogioacchino.delregno@collabora.com
Cc: gregkh@linuxfoundation.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	nfraprado@collabora.com,
	sboyd@kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] spmi: mtk-pmif: Fix clock reference leak in mtk_spmi_bus_probe()
Date: Thu, 17 Sep 2026 15:50:37 +0000
Message-Id: <20260917155037.2161027-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABn0TtNDKxq896DCA--.6140S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xry3trW7KrWDZryfWryxAFb_yoWktrXE93
	yxArZ3Xw1xtrsrWw1DJFn8XFZ7u3ZFvr40gF18ta43ZryDZFykJFZ8Zr9xJ39rZrWkK34U
	GFyDZws7Zr1fJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbfxYjsxI4VWDJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4
	kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_
	Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26F4UJVW0owAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0E0s8F02x267IIx4CEVc8vx2IErcIFxwCY1x02
	62kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr
	1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr1j6F4UJwCI42IY6I8E87Iv6xkF7I
	0E14v26rxl6s0DYxBIdaVFxhVjvjDU0xZFpf9x07UXJ5rUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRQNA2qr9LY3tgAAsR

of_clk_get_by_name() returns a reference that must be released with
clk_put(). If the lookup of a later clock fails, the function returns
without releasing the clocks that were already obtained. Put those
clocks before returning.

Fixes: 078117963b2c ("spmi: mtk-pmif: Add multi-bus support for SPMI 2.0")
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/spmi/spmi-mtk-pmif.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
index 1048420b5afb..9323a4adefe5 100644
--- a/drivers/spmi/spmi-mtk-pmif.c
+++ b/drivers/spmi/spmi-mtk-pmif.c
@@ -726,9 +726,11 @@ static int mtk_spmi_bus_probe(struct platform_device *pdev,
 	for (i = 0; i < pbus->nclks; i++) {
 		pbus->clks[i].id = pmif_clock_names[i];
 		pbus->clks[i].clk = of_clk_get_by_name(node, pbus->clks[i].id);
-		if (IS_ERR(pbus->clks[i].clk))
+		if (IS_ERR(pbus->clks[i].clk)) {
+			clk_bulk_put(i, pbus->clks);
 			return dev_err_probe(&pdev->dev, PTR_ERR(pbus->clks[i].clk),
 					     "Failed to get clocks\n");
+		}
 	}
 
 	err = clk_bulk_prepare_enable(pbus->nclks, pbus->clks);
-- 
2.34.1

