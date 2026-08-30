Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CE83F1055;
	Sun, 30 Aug 2026 13:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788097575; cv=none; b=gC6yIjFEFfedqJbxK2uwi5ogWTWxHgluxS/6t+nMSf6d0nwo60bj9cLDwF7dRXVqZu1eXRYWctYbS0VRzOSvch4CtMD0b1mL89m21lvKbqHrVx8eKWGnLyYsvGJ+D6MJIQYk7mhE3wKpvkkEbrRAAIcqiQV3wIgvyWGnl2CXZXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788097575; c=relaxed/simple;
	bh=jwBdHh12JsBV0JrS/Ow1x28K/yiNaoO9Xd/vtF+myNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cIe1H52UONEULQowxq32a/TvxDf0X7j+8h1+Z4w3WJqLb33leBRZADJ4biBKzAtm4t/9CoZtAtUmuugrbD6zu+WQSuhnojy1Fa0ntVJbAbCfHanXcolpQ3d8g0GEb4zRL/g8WbJ2a9SNsO9K6PTO6uPNo89F2vvnpi0ClDPSw/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowACXnDojNJRqVUybBg--.16609S2;
	Sun, 30 Aug 2026 21:46:11 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: mali-c55: fail power-on when safe stop times out
Date: Sun, 30 Aug 2026 21:46:09 +0800
Message-ID: <20260830134609.9886-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACXnDojNJRqVUybBg--.16609S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WrW5ZF45KrWUGF4fJr15XFb_yoW8XrW8pF
	48Ka42vry5GF1UKF18AanxuFZxG34Sv3WDGr97Cw1xZrn3G3ZFqr1Fka47KFs8CF18C3W3
	AFs2qrWrGFnYvw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvj14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j
	6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfU08
	9NUUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The power-on path requests safe stop to establish a non-streaming state but
ignores the polling result and publishes runtime resume success.

Power the block back off and propagate a safe-stop timeout.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/media/platform/arm/mali-c55/mali-c55-core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index f28e9f4354aca..288fba4831808 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -730,8 +730,13 @@ static int __mali_c55_power_on(struct mali_c55 *mali_c55)
 	/* Set safe stop to ensure we're in a non-streaming state */
 	mali_c55_write(mali_c55, MALI_C55_REG_INPUT_MODE_REQUEST,
 		       MALI_C55_INPUT_SAFE_STOP);
-	readl_poll_timeout(mali_c55->base + MALI_C55_REG_MODE_STATUS,
-			   val, !val, 10 * USEC_PER_MSEC, 250 * USEC_PER_MSEC);
+	ret = readl_poll_timeout(mali_c55->base + MALI_C55_REG_MODE_STATUS,
+				 val, !val, 10 * USEC_PER_MSEC, 250 * USEC_PER_MSEC);
+	if (ret) {
+		dev_err(mali_c55->dev, "safe stop timed out\n");
+		__mali_c55_power_off(mali_c55);
+		return ret;
+	}
 
 	return 0;
 }

base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
-- 
2.50.1

