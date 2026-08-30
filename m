Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC03E3B42FC;
	Sun, 30 Aug 2026 13:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788095693; cv=none; b=nMJOPKZ2Q4N3s0YIGu7Q4iCU0NrsHBY7FXMHx/mgvSf2p2ZPqkiZKp+BmZqJJs83hWHms/OSVtMhBdH1KAHI5Qn8ikpiDAOVUfHFrA3cocpbUc14eZGawtEhDLKDQHlCY+zUbzqmIRi2baIIK2cw+ylcM6yjWq2QqtrFDfy/S1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788095693; c=relaxed/simple;
	bh=H2T1EFlS4xKVb2USQwFBMq4a9Kam0lpId6NkNxCdpk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bazOKXaU9+jgFoeaq24N5BeAEGk5s0i3SVosCvTi/7dB+Et0cdGLTJaZp5THwMCvd1FgBZRnmQce8N/jFKIGAg6FnMrX6BVU8DU6XEg8HpX+HM0f6v8cHZJVruRL89pNKR3xeBxOvnTP5rsxH5AkeAmGZr0IHaysXzI6Tpal0/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowADHzz3FLJRqpuyaBg--.25859S2;
	Sun, 30 Aug 2026 21:14:45 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Vinod Koul <vkoul@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: qcom: m31: propagate reset errors
Date: Sun, 30 Aug 2026 21:14:42 +0800
Message-ID: <20260830131442.3025-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADHzz3FLJRqpuyaBg--.25859S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFW7tw1DJry7tryfCF4rXwb_yoW8Xr4kpr
	WDWr9FyFW8Zayfta1xAw4aqF13Wan3tr9rKr47C3yrZ3W3Jr47uFyavFy5XF4rtrs7C3ya
	gr4jyFyFkF1Fkw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j
	6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUeT
	mhDUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

m31usb_phy_init() enables the regulator and clock, then performs an
unchecked
reset pulse before reporting that the PHY powered on.

Return reset-controller errors and release the clock and regulator that
were
enabled for the failed power-on attempt.

Fixes: 08e49af50701 ("phy: qcom: Introduce M31 USB PHY driver")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/phy/qualcomm/phy-qcom-m31.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31.c b/drivers/phy/qualcomm/phy-qcom-m31.c
index 168ea980fda03..f46c7ec87496a 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31.c
@@ -228,9 +228,14 @@ static int m31usb_phy_init(struct phy *phy)
 	}
 
 	/* Perform phy reset */
-	reset_control_assert(qphy->reset);
+	ret = reset_control_assert(qphy->reset);
+	if (ret)
+		goto disable_clk;
+
 	udelay(5);
-	reset_control_deassert(qphy->reset);
+	ret = reset_control_deassert(qphy->reset);
+	if (ret)
+		goto disable_clk;
 
 	/* configure for ULPI mode if requested */
 	if (qphy->ulpi_mode)
@@ -247,6 +252,12 @@ static int m31usb_phy_init(struct phy *phy)
 	}
 
 	return 0;
+
+disable_clk:
+	clk_disable_unprepare(qphy->clk);
+	regulator_disable(qphy->vreg);
+
+	return ret;
 }
 
 static int m31usb_phy_shutdown(struct phy *phy)

base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
-- 
2.50.1

