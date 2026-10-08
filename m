Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649F53A901D
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 17:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791479661; cv=none; b=Gx9FqrZhQErNZHPhi9Jss0FQWsZWLO7pxNfYBtWZHxzom9MC/wTeqzE3s81I9VgMnGn5pB6Y/UhquksZkwCa/IgoZTsmu4KzUUket8St6adycRvPt1CSRXCSryw/1JJxPn9Ly6urQ1lG8O15j4324dZeochZzCUJooojpHcoanI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791479661; c=relaxed/simple;
	bh=yeVOfm7KBijFYCFwgrOsh4BwTiakVRjx63wA1xd3aT0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eYgpv8/+IPhvk27Gq7/e46hy+gWrIBs6+POmkUmYepmmioMWrbzx7Ws4nSCnwX2nVGswcpLNhD+wlbkEKz+onwbYT8/dB/GY0PSBFe+CgHyi2BoQq5SKg2VygOivNEjSHX0y/Wgu/NdHALxkXP7JFDV6CxwrLkuRAZvaqVySxNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowABnbjxfz8dqR+cOCg--.12118S2;
	Fri, 09 Oct 2026 01:14:08 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Jason Cooper <jason@lakedaemon.net>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: mvebu: mvebu-soc-id: fix missing clk_put() on error path
Date: Fri,  9 Oct 2026 01:14:10 +0800
Message-Id: <20261008171410.2717704-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABnbjxfz8dqR+cOCg--.12118S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw4rurWUWF4UtrWUGr4xtFb_yoWDZwbEkF
	1Sg3sFyryfWFs5u347W3W3uanIkr1xZrWUZFyxAr4FkFW5Xr47urW8tw15Kr1aqrsrKry3
	Gry8Ca15Ww13JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbcxYjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1D
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JV
	WxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5-txPUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAMOA2rHpfVfIgABsD

get_soc_id_by_pci() takes a reference on the PCIe clock with
of_clk_get_by_name(), but when clk_prepare_enable() fails it jumps to
the clk_err label, which only drops the device node references and never
calls clk_put(). The struct clk and the clock core reference it holds
are leaked on that error path.

Release the clock reference before jumping to clk_err.

Fixes: af8d1c63afcb ("ARM: mvebu: Add support to get the ID and the revision of a SoC")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 arch/arm/mach-mvebu/mvebu-soc-id.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-mvebu/mvebu-soc-id.c b/arch/arm/mach-mvebu/mvebu-soc-id.c
index 850ed3ea3cc4..84831798357e 100644
--- a/arch/arm/mach-mvebu/mvebu-soc-id.c
+++ b/arch/arm/mach-mvebu/mvebu-soc-id.c
@@ -85,6 +85,7 @@ static int __init get_soc_id_by_pci(void)
 	ret = clk_prepare_enable(clk);
 	if (ret) {
 		pr_err("cannot enable clock\n");
+		clk_put(clk);
 		goto clk_err;
 	}
 
-- 
2.25.1

