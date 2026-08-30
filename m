Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9568A3BB665
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788101839; cv=none; b=PGu2o4rjbIPUn0jPk3YNvhuzGxzSLCnTI+otbgDc0gdhXGcgB8JQ9IGDKodQkvHpDbfUcdQcE9fdJPqy121bD3B3WoixQAM4B8/IOQJ17dHj1EpTSZYhg96cktZCc69xJM0pRhdF/fa6S1q9tsC+lwjTSpDnmjGm1yscysYpYGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788101839; c=relaxed/simple;
	bh=ulyweVAO3xblz6gR0VkVmV8opw1DJmqYu9eNvaueW4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uCYFIUIjaFJdK0QcEvV2LS2oczCRSvXwJY8YaWi5t5nOqGd6n6J7/GMz3pFOqtj/QyYts9bHIwI90z9jiQDprDtnegEapvOkFqAAJx9BCO08rfe53TnCPE8tchTswu4iYDLlwiKJ4f4h80ApioMqTWkXCVPPLlB/qvKdqR90xVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MPbGS0fE; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MPbGS0fE"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1cc97b84bso2264729a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788101837; x=1788706637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=97SbbetLO4aPKEfOa796LFYimHxy5eRJIJYvWLy1xc0=;
        b=MPbGS0fEjCCsD09aY0QT5HXvwoNAryUiJR6Bfav9HTamOsU9e9gQ2Q5C/Yanq4UyKu
         dilZae2Kg+geUypES0dJ30Q+2GbbKOLwYSaircMqJElnULXHzRfPMk5nko/xCxQiSZ6x
         wZxsNJnzGD87uppSlMw0/+26U2lFOBZrws/IBrf1NqSeQ/mgY/jHQmyKnvVTsMWtS1EQ
         gGHBMcPlFwpmRBghA5A3yX5bHFcFYRJek7oky5eUZfvQ9DqbB3g2GIYF+rkdGOtQIyK5
         wAfyhEQBhVVQ0pEziVlBwhXE4nvojstvdsXHLe77mSgyvIsXCkHbqa8jxnFB/h8R9Ka/
         cX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788101837; x=1788706637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=97SbbetLO4aPKEfOa796LFYimHxy5eRJIJYvWLy1xc0=;
        b=jITlwDc69kF7ICq5A9p4Ri3jK/WHDAn7NLi6YeZc5V+47j6DkqJFMJYPcp5yxbh6AC
         gNuFg5nwaHoBR+hNMoAOovog0JBTIpmmEgG4WBe8LqKiB9eUTS8OA+qQUHkKmqiJHuoe
         SVOAiccGBiTevIQEKuThf3uF4X9eyqwiHLLavm3RHsRoRPxzkIU6DwPQvjT9ZkYNI4AS
         bhRh2aO+8jyldkco2yvzCCLNatt776YtCSkVOP/GygXY5lk72T9ygugk/xdnlgZCGXe1
         oMXpwACkXjMO2ZI5aGJtpVTW1N6tMZ4+j6dL5NpJtETVNpceBSum8i69FWCxS33n1c+1
         Gllw==
X-Forwarded-Encrypted: i=1; AHgh+RqzMGGbHmvnESF/fOksx5we1xQnuNFFNZO00vE0uyozaeiCYazkgyhukhVJvRYgg3TDgLsYqKQh2KQEtcI=@vger.kernel.org
X-Gm-Message-State: AFuF++k0wELXcqqmNJxC5jg8ty3HCWnzE5lU4DP69Ro8AxPEtJjwWc/0
	AEM4bYR6tv+YNOomuzoRtTawTmakmHzqhBFPcAUJABIGueT58w3Ly7Le
X-Gm-Gg: AR+sD13zo4esVkKxuYR4xVfSD4E7TJnV9oim5u/f4omOxRUU2x3OJCYSTJo3bP+30e7
	VOdePKUSHQL5My5b59OrbxHP0LMhucOZyJoQrcnv0Pn4aFRaWVmHV9jRI5TCRmuqgz1KUG8Si5U
	5maJa/bPdVEQ/jJoXmzcRp+OuiX1kw458LRxHuUjiI0e1OsS+aXhzf/lAY4DISwASUSs/NPoLPl
	i2fZDMnu1IJ56dj9STZzHAAMvgYT+5DZjEDZqPR6HiTxRWVGXU/SmoVTELqRUcFX+pSl1dS/bBg
	B7QCF/sxH/ZUN8SwGJh3xY6+qKIM3Od7G3g6OURdlX9aO48kMS1EhBflTnDdKodJC9YQ8up5/v+
	iCTcJ96S1Ex0nQdgT3u7Xb2qxY9GKEgUiJTqv2iSqq2+hhtoTt3RkRcO0iQ29aEqoKsalRpktqa
	Khd5slPngm6shgHI4gF7LbplY0havGh1+uCdOI9kvQZP9s254i+PcdyUmeZ2bvZnCgysRFXHeiA
	iLH0CvT+H2vjatvpDvfy66UV2A99Q==
X-Received: by 2002:a05:6a21:8882:b0:3d3:adbf:7784 with SMTP id adf61e73a8af0-3d3adbf81c3mr16403243637.25.1788101836698;
        Sun, 30 Aug 2026 07:57:16 -0700 (PDT)
Received: from localhost.localdomain ([103.16.69.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f959575sm23198024eec.15.2026.08.30.07.57.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 30 Aug 2026 07:57:16 -0700 (PDT)
From: Aditya Dash <mradityadash@gmail.com>
To: Benjamin Tissoires <bentiss@kernel.org>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] HID: hid-lenovo-go: return configuration request errors
Date: Sun, 30 Aug 2026 20:26:55 +0530
Message-ID: <a18c5147dc7a0699523c62013d64cd1d8ec40690.1788096668.git.mradityadash@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788096666.git.mradityadash@gmail.com>
References: <cover.1788096666.git.mradityadash@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Any decoded configuration reply completes the shared completion. The driver
also ignores the result of its interruptible wait. An unrelated reply, a
firmware error, an interrupted wait, or a timeout can therefore be reported
as success.

Add pending command state to the driver data. Match replies by command ID,
command, sub-command, and device, and return request errors to the caller.
Clear the pending request after an interruption or timeout so a late reply
cannot replace that result.

Keep the existing 50 ms wait for every configuration request. Corrected
calibration requests on an Original Legion Go received their matching SET
replies within 8 ms. The final calibration result remains asynchronous.

The firmware has no sequence number. A late reply with the same tuple can
still match a newer request.

Fixes: d69ccfcbc955 ("HID: hid-lenovo-go: Add Lenovo Legion Go Series HID Driver")
Assisted-by: Pi:gpt-5.6-sol
Signed-off-by: Aditya Dash <mradityadash@gmail.com>
---
 drivers/hid/hid-lenovo-go.c | 107 +++++++++++++++++++++++++++++-------
 1 file changed, 86 insertions(+), 21 deletions(-)

diff --git a/drivers/hid/hid-lenovo-go.c b/drivers/hid/hid-lenovo-go.c
index b937d11dd6f6..dbfacbb70394 100644
--- a/drivers/hid/hid-lenovo-go.c
+++ b/drivers/hid/hid-lenovo-go.c
@@ -21,6 +21,7 @@
 #include <linux/led-class-multicolor.h>
 #include <linux/mutex.h>
 #include <linux/printk.h>
+#include <linux/spinlock.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
 #include <linux/unaligned.h>
@@ -31,13 +32,27 @@
 #include "hid-ids.h"
 
 #define GO_GP_INTF_IN		0x83
+#define GO_INPUT_REPORT_ID	0x04
 #define GO_OUTPUT_REPORT_ID	0x05
 #define GO_GP_RESET_SUCCESS	0x01
 #define GO_PACKET_SIZE		64
+#define GO_COMMAND_TIMEOUT_MS	50
+
+/* Lenovo replies identify a command and a sub-command, but have no sequence. */
+struct hid_go_cmd {
+	struct completion done;
+	spinlock_t lock; /* protects fields below */
+	bool pending;
+	u8 id;
+	u8 command;
+	u8 sub_command;
+	u8 device;
+	int result;
+};
 
 static struct hid_go_cfg {
 	struct delayed_work go_cfg_setup;
-	struct completion send_cmd_complete;
+	struct hid_go_cmd cmd;
 	struct led_classdev *led_cdev;
 	struct hid_device *hdev;
 	struct mutex cfg_mutex; /*ensure single synchronous output report*/
@@ -331,6 +346,62 @@ static const char *const os_mode_text[] = {
 	[LINUX] = "linux",
 };
 
+static void hid_go_cmd_arm(u8 id, u8 command, u8 sub_command, u8 device)
+{
+	guard(spinlock_irqsave)(&drvdata.cmd.lock);
+
+	reinit_completion(&drvdata.cmd.done);
+	drvdata.cmd.pending = true;
+	drvdata.cmd.id = id;
+	drvdata.cmd.command = command;
+	drvdata.cmd.sub_command = sub_command;
+	drvdata.cmd.device = device;
+}
+
+static void hid_go_cmd_consume(const struct command_report *cmd_rep, int result)
+{
+	guard(spinlock_irqsave)(&drvdata.cmd.lock);
+
+	if (drvdata.cmd.pending && cmd_rep->id == drvdata.cmd.id &&
+	    cmd_rep->cmd == drvdata.cmd.command &&
+	    cmd_rep->sub_cmd == drvdata.cmd.sub_command &&
+	    cmd_rep->device_type == drvdata.cmd.device) {
+		drvdata.cmd.pending = false;
+		drvdata.cmd.result = result;
+		complete(&drvdata.cmd.done);
+	}
+}
+
+static int hid_go_cmd_finish(long wait_result)
+{
+	guard(spinlock_irqsave)(&drvdata.cmd.lock);
+
+	if (wait_result <= 0) {
+		drvdata.cmd.pending = false;
+		return wait_result < 0 ? wait_result : -ETIMEDOUT;
+	}
+
+	return drvdata.cmd.result;
+}
+
+static int hid_go_cmd_cancel(int result)
+{
+	guard(spinlock_irqsave)(&drvdata.cmd.lock);
+
+	drvdata.cmd.pending = false;
+	return result;
+}
+
+static int hid_go_send_output_report(struct hid_device *hdev, u8 *packet)
+{
+	int ret;
+
+	ret = hid_hw_output_report(hdev, packet, GO_PACKET_SIZE);
+	if (ret < 0)
+		return ret;
+	return ret == GO_PACKET_SIZE ? 0 : -EINVAL;
+}
+
 static int hid_go_version_event(struct command_report *cmd_rep)
 {
 	switch (cmd_rep->sub_cmd) {
@@ -654,7 +725,7 @@ static int hid_go_raw_event(struct hid_device *hdev, struct hid_report *report,
 	struct command_report *cmd_rep;
 	int ep, ret;
 
-	if (size != GO_PACKET_SIZE)
+	if (size != GO_PACKET_SIZE || data[0] != GO_INPUT_REPORT_ID)
 		goto passthrough;
 
 	ep = get_endpoint_address(hdev);
@@ -707,7 +778,7 @@ static int hid_go_raw_event(struct hid_device *hdev, struct hid_report *report,
 	dev_dbg(&hdev->dev, "Rx data as raw input report: [%*ph]\n",
 		GO_PACKET_SIZE, data);
 
-	complete(&drvdata.send_cmd_complete);
+	hid_go_cmd_consume(cmd_rep, ret);
 	return ret;
 
 passthrough:
@@ -722,7 +793,8 @@ static int mcu_property_out(struct hid_device *hdev, u8 id, u8 command,
 	unsigned char *dmabuf __free(kfree) = NULL;
 	u8 header[] = { GO_OUTPUT_REPORT_ID, id, command, index, device };
 	size_t header_size = ARRAY_SIZE(header);
-	int timeout = 50;
+	unsigned long timeout = msecs_to_jiffies(GO_COMMAND_TIMEOUT_MS);
+	long wait_result;
 	int ret;
 
 	if (header_size + len > GO_PACKET_SIZE)
@@ -740,22 +812,14 @@ static int mcu_property_out(struct hid_device *hdev, u8 id, u8 command,
 	dev_dbg(&hdev->dev, "Send data as raw output report: [%*ph]\n",
 		GO_PACKET_SIZE, dmabuf);
 
-	ret = hid_hw_output_report(hdev, dmabuf, GO_PACKET_SIZE);
-	if (ret < 0)
-		return ret;
-
-	ret = ret == GO_PACKET_SIZE ? 0 : -EINVAL;
+	hid_go_cmd_arm(id, command, index, device);
+	ret = hid_go_send_output_report(hdev, dmabuf);
 	if (ret)
-		return ret;
-
-	ret = wait_for_completion_interruptible_timeout(&drvdata.send_cmd_complete,
-							msecs_to_jiffies(timeout));
-
-	if (ret == 0) /* timeout occurred */
-		ret = -EBUSY;
+		return hid_go_cmd_cancel(ret);
 
-	reinit_completion(&drvdata.send_cmd_complete);
-	return 0;
+	wait_result = wait_for_completion_interruptible_timeout(&drvdata.cmd.done,
+								timeout);
+	return hid_go_cmd_finish(wait_result);
 }
 
 static ssize_t version_show(struct device *dev, struct device_attribute *attr,
@@ -2362,9 +2426,12 @@ static int hid_go_cfg_probe(struct hid_device *hdev,
 	if (!buf)
 		return -ENOMEM;
 
+	mutex_init(&drvdata.cfg_mutex);
+	init_completion(&drvdata.cmd.done);
+	spin_lock_init(&drvdata.cmd.lock);
+	drvdata.cmd.pending = false;
 	hid_set_drvdata(hdev, &drvdata);
 	drvdata.hdev = hdev;
-	mutex_init(&drvdata.cfg_mutex);
 
 	ret = sysfs_create_groups(&hdev->dev.kobj, top_level_attr_groups);
 	if (ret) {
@@ -2388,8 +2455,6 @@ static int hid_go_cfg_probe(struct hid_device *hdev,
 
 	drvdata.led_cdev = &go_cdev_rgb.led_cdev;
 
-	init_completion(&drvdata.send_cmd_complete);
-
 	/* Executing calls prior to returning from probe will lock the MCU. Schedule
 	 * initial data call after probe has completed and MCU can accept calls.
 	 */
-- 
2.55.0

