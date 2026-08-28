Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEF938D6A8;
	Fri, 28 Aug 2026 09:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908513; cv=none; b=KdoOEgSRdCgl4mROoUUCHNizH7/bq8it4AeJoghg9LHYGj+loVhRlT3tyPgS6+msYVqWYAzrh0a+zK3IjoJH9AVTIpqi/prdVdbvuq0TXBmESItKa1tNT91VroEglt8eguGFETHWdisPfv35YS0bt8vAYyOX3e/fcLwj9SZSwIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908513; c=relaxed/simple;
	bh=fs3bdodkwa9H3adavf7QLdjiBeuth1vT4X34ZokAceE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hAEJFYXJg4u34+pMRBOtCqgPZI3SN2Da1uFNMsBCBnkXfphKiEMNfWjfUzpLuGxq9txxi03DmrFVH/mOOB/qad8Mrauzk0oPFpCNLr0mZGWBf5WuJxfyTRVYiTA0akF/mr3xLJhuR8+WNHWvIa3BWEE3xbTSFjITMqyp8Laz1lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowAC3wT+cUZFqlTZ1Bg--.60425S2;
	Fri, 28 Aug 2026 17:15:08 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: ov7670: Propagate clock enable failures
Date: Fri, 28 Aug 2026 17:15:06 +0800
Message-ID: <20260828091506.6732-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAC3wT+cUZFqlTZ1Bg--.60425S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur4Utr4kCw17CF4DCr17KFg_yoW8tF1rpa
	n8KFyYyrWFqaySga92yF4UAF15Cw4IkFy3CrWxG3s7Zwsxtr9Igr18ta4YvFs8GFyxCw1a
	yr40qF4UCry3uw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5oGQDU
	UUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

ov7670_power_on() ignores clk_prepare_enable() and proceeds to toggle
GPIOs and set info->on.  A failed clock enable can therefore be reported
as a powered sensor and later be paired with an unbalanced clock
disable.

Return the clock error before changing GPIO or software state, and
propagate it from the subdevice power operation and probe.

The issue was identified via static analysis and manually reviewed.

Fixes: 030f9f682e66 ("media: ov7670: control clock along with power")

Assisted-by: LLM
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/media/i2c/ov7670.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
index 4d040e9feeac..9c5bb391202d 100644
--- a/drivers/media/i2c/ov7670.c
+++ b/drivers/media/i2c/ov7670.c
@@ -1647,14 +1647,17 @@ static int ov7670_s_register(struct v4l2_subdev *sd, const struct v4l2_dbg_regis
 }
 #endif
 
-static void ov7670_power_on(struct v4l2_subdev *sd)
+static int ov7670_power_on(struct v4l2_subdev *sd)
 {
 	struct ov7670_info *info = to_state(sd);
+	int ret;
 
 	if (info->on)
-		return;
+		return 0;
 
-	clk_prepare_enable(info->clk);
+	ret = clk_prepare_enable(info->clk);
+	if (ret)
+		return ret;
 
 	if (info->pwdn_gpio)
 		gpiod_set_value(info->pwdn_gpio, 0);
@@ -1667,6 +1670,8 @@ static void ov7670_power_on(struct v4l2_subdev *sd)
 		usleep_range(3000, 5000);
 
 	info->on = true;
+
+	return 0;
 }
 
 static void ov7670_power_off(struct v4l2_subdev *sd)
@@ -1687,12 +1692,15 @@ static void ov7670_power_off(struct v4l2_subdev *sd)
 static int ov7670_s_power(struct v4l2_subdev *sd, int on)
 {
 	struct ov7670_info *info = to_state(sd);
+	int ret;
 
 	if (info->on == on)
 		return 0;
 
 	if (on) {
-		ov7670_power_on(sd);
+		ret = ov7670_power_on(sd);
+		if (ret)
+			return ret;
 		ov7670_init(sd, 0);
 		ov7670_apply_fmt(sd);
 		ov7675_apply_framerate(sd);
@@ -1872,7 +1880,9 @@ static int ov7670_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	ov7670_power_on(sd);
+	ret = ov7670_power_on(sd);
+	if (ret)
+		return ret;
 
 	if (info->clk) {
 		info->clock_speed = clk_get_rate(info->clk) / 1000000;
-- 
2.43.0

