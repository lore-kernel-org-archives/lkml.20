Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558993;
	b=n6BXJPEIHVsGhzOHibsB83eJiYDf+Jlug3nCqakGJ0qQbTo1UYW6z678Bg5bzpgSTGRV
	 +2m1rh64EaTF5D+4f1u8TwMnzkPFChYT+AJ80rQY9/pywJIWy7jOoW90cvakAgBR3Wcqk
	 d6yWMR3f0nmcoNNb+24ZjAuPulWTF7FuBLohKzbBF3COz5ao5BnDr33BPz3hbsQ4oNVDi
	 JYl4zBmABkV/YOhXwueGipCo4mG2yBLN6clkWd7z4v15/O8AQH22oGDXKEBKCXnKT8/Sw
	 QERatNy8yLZRm5WXQXVBBd745FTgvMXRPJYd/lWd2cE1mJ5+br0JWUHIENGIDXlEqKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558993;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=l9kfMR86ElYYCZwwYlolbXG4uTuwxHX0suLqEOraFiU=;
	b=hbGTPPxwJaA3qURYb0OG9OtfOL9M2P8vKUNXgHuPFNkTbEO6YBtqaG8v/dOrZhkqBTPh
	 8F+BpFO5yIzj7ajzEUDCLJh7V+HhYjpIE7F4vKqTWeqoocaNPLA7FyEVdAsU7GNeuN6tS
	 qUY2qfC2Z8d6P9rPy2Q6AdyaVv9VUQ1OrgxWE2apD30JGK/XS08/qNiHhqSIwTT7Gv6K7
	 48ToZTrvjVsVKnku8csrMWA2DsHqf9X7JtrKkpwh/7q88QlQmTEFSTs6FKUG3dG8idhfP
	 8HIOGiPNL0AguUCFcOg7SS6w+EVztxYtjvaOj4rHkkXoujiaJNlEV6GxRLb/fCJtB1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=VNXsSDia;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 714B1606B1E9;
	Fri, 13 Nov 2026 08:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 714B1606B1E9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=VNXsSDia
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=l9kfMR86ElYYCZwwYlolbXG4uTuwxHX0su
	LqEOraFiU=; b=VNXsSDia8txI/8+tfEHgpXHGgHWN3KxNx4rj7HLaZInMJDkakw
	/B9RJhpc2grMKTE529J574E5CpDv/sf24FDMXl96+k1pzSr/RGSt0L4CgBJya5mL
	/I7pe7Y22Yljr9IoOkZvenE+VOy9QBH/wiXFlxaqKK+Cq9fR7aRSyKOw8=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.188.15])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgD3g0j_y_Zq+ze4AA--.520S4;
	Fri, 13 Nov 2026 16:36:18 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	taniya.das@oss.qualcomm.com,
	andersson@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] drm/msm/mdss: reset all block resets described in DT
Date: Fri, 13 Nov 2026 16:36:14 +0800
Message-ID: <a545b3898ac87742b57a6f44fb5fcd4b4bcb99da.1794558882.git.xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794558882.git.xiaqinghuan@mail.ustc.edu.cn>
References: <cover.1794558882.git.xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgD3g0j_y_Zq+ze4AA--.520S4
X-Coremail-Antispam: 1UD129KBjvJXoW7tr47Aw15KFWrKF1rCw1UGFg_yoW8Xr1xpr
	sxJa90yr4j93WfXa1UJ3W8ur1fAayfta48G39Fv34fC343J345Gry5Ka45t3y8AF97Xry5
	tFs3KFyrZF1qyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPGb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7
	CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
	x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
	v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
	x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
	Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
	yTuYvjxU7Xo7DUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREJB2r0wlk29gAns8

msm_mdss_reset() acquires only the first reset listed in the MDSS
device node.  Platforms can describe more than one MDSS block reset: the
SM8750 display clock controller also provides a reset for the MDSS core
INT2 interrupt controller, which is left out of reset when the
bootloader hands over with the display block still running.

Switch to the reset control array API so that every reset listed in the
device node is asserted and released as one group.  Devices without a
reset in DT are unaffected, and for devices describing a single reset
the assert/deassert sequence is unchanged.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 drivers/gpu/drm/msm/msm_mdss.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9087c4b290d..84b8b4bc9b1 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -310,7 +310,8 @@ static int msm_mdss_reset(struct device *dev)
 {
 	struct reset_control *reset;
 
-	reset = reset_control_get_optional_exclusive(dev, NULL);
+	reset = devm_reset_control_array_get(dev,
+					     RESET_CONTROL_OPTIONAL_EXCLUSIVE);
 	if (!reset) {
 		/* Optional reset not specified */
 		return 0;
@@ -327,8 +328,6 @@ static int msm_mdss_reset(struct device *dev)
 	msleep(20);
 	reset_control_deassert(reset);
 
-	reset_control_put(reset);
-
 	return 0;
 }
 
-- 
2.53.0

