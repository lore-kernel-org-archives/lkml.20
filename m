Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CB04CB8D9
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789553574; cv=none; b=tY3R5pFUgGFj52oIJbLTGSFWRK+k+F/zY3qvonk/SCQo1lb3GDft+UW3frSbZJSp9tBY0LOcKEcoy6hfB+glfCpezeVIqXs5wjNU/PGiLL97pbkGHBlhIQgzXXuqmCdVoX0swv/yW5aauc+rIaYKpJRH0htWtqoJgq7MTbVowFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789553574; c=relaxed/simple;
	bh=6TaFek2+DOgiPwvcVKEEhlrsxhjS+rQPF1bgcrDs+ps=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SWssLuInJ0dEv9TzU4BmLDEFl4U8b0RaDgrygMY56OOSeYhV77lr2rFqXt/VnPM2P8JAFt+XY4NsVq4A63v4tke68LqDUfKiR/B029/iipQGBT9uAZ/yMVMwTKhhffGqOT8rLOAkuFhvLeqpBM0LKiQDV0sI+buE4ctjMzXEpIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowACnrTt+a6pqrujgBw--.42778S2;
	Wed, 16 Sep 2026 18:12:15 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Frank.Li@nxp.com
Cc: Laurent.pinchart@ideasonboard.com,
	airlied@gmail.com,
	andrzej.hajda@intel.com,
	dri-devel@lists.freedesktop.org,
	festevam@gmail.com,
	imx@lists.linux.dev,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	luca.ceresoli@bootlin.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	s.hauer@pengutronix.de,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	victor.liu@nxp.com,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] drm/bridge: imx8mp-hdmi-pvi: Fix next_bridge reference leak
Date: Wed, 16 Sep 2026 10:11:46 +0000
Message-Id: <20260916101146.2015255-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACnrTt+a6pqrujgBw--.42778S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtF1kuFW8XF4DJFy7Ar47urg_yoWkCFg_uF
	n8ZrW8Xr43Cr1qgw12yr43ZasFy3WDWFW7uF12grZ3trWavr9avw47XrykWry7ZF4fGF9r
	Ar4qqFWkZr17CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbaAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r
	4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVWxJr0_Gc
	JvcSsGvfC2KfnxnUUI43ZEXa7sRiNeOPUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwEMA2qqQJWpwwAAs2

imx8mp_hdmi_pvi_probe() takes a reference to the next bridge in the
pipeline with of_drm_find_and_get_bridge() and stores it in
pvi->bridge.next_bridge, but the reference is never released, leaking
the bridge on driver unbind.  Drop the reference in
imx8mp_hdmi_pvi_remove() once the bridge has been unregistered.

Fixes: 7654c807f207 ("drm/bridge: imx8mp-hdmi-pvi: convert to of_drm_find_and_get_bridge()")
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
index 15fbb1be07cd..80e33d810a69 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
@@ -179,6 +179,7 @@ static void imx8mp_hdmi_pvi_remove(struct platform_device *pdev)
 	struct imx8mp_hdmi_pvi *pvi = platform_get_drvdata(pdev);
 
 	drm_bridge_remove(&pvi->bridge);
+	drm_bridge_put(pvi->bridge.next_bridge);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.34.1

