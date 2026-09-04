Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD8031716D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 23:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788565288; cv=none; b=Ze+s0f11VFq/2YL1rePtELR9t4M9vQYBO2vvvfuHE7FhlHIIAShjAWe2j7ma/y1kLAIpohA7CjShMiN0etN7qJATk2f8lv8Ik3hXRusQ388h++PVbJPVALcKZMORXBVdO7QuiqqNKcaJG+lwHI2ZEPGH5pQVW2pXenD21yI+hFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788565288; c=relaxed/simple;
	bh=DSz9S52m+W1ZhrbXFkwAlE3vh4BFBbbk21BQZZCZTOM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=HqSkp066c4GWjiNR+Q5l5EdxWbppkB5mM7qU50ty/D48igOSdYn1ur8eKxcxj+i51RH7Vg+xWrp15d+BKl61/ZUxBSsGSCot0e5LyX2LE3wf1gp2Xf+nT+fGzrPAlBv5zP3jWwsxrlAAlyfH0ld5wdUVBbVYN6YUfRA28j2orE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=coae25uc; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="coae25uc"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso2663596a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 16:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788565287; x=1789170087; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Id+QMxIQOXsoU2o5RxxVpZ3Kq9WEtUULvXCquKMDJIM=;
        b=coae25ucxfu94pTGbVWgbmHTWJ/nHXQeJ+Xgd1M5JxH/f8wctofIhzdTWxRyyZQk9I
         OH/+iE7AxhccanDDsJUs7EmobrzIyb8SinXd4RQvN2arMw470yJJlHsm8TBUu5+2J58A
         tdGBp2yIryabsEd686r1c//XcvdeJV9Rdh2RNIuEWAg/219Qf1QMkOEKXem4FwWgGqnA
         NviyNPCasPEVafRHShzr9lYjh3kTc+f9oUMtuWO8/fspBpsqUwIN72pKAbwiC0zi6qeg
         hv4Plps9AhlG8lRQJw+RMR6BUxLIkYRA7qgx8HkgKXepHqJjjNm0/VUJEQyu5950uZSk
         Ol3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788565287; x=1789170087;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Id+QMxIQOXsoU2o5RxxVpZ3Kq9WEtUULvXCquKMDJIM=;
        b=IC3IhWZwlwudGU20Jg3e8bsHRpf6pAa6eEGlaCRTxfx7c6gtOAgyEXNvO+9XTKfFMD
         ojXXBP5Xs0eYykjLOoJCJS7MIuZIiXl73oJmNMBEQ7yRY0ey93jp47yrEOm4HkEEr726
         t+KiocM8diRtFuGS6mcyb6mnWH5DswbM88IPFAlutswv3oYVDB1RNEYJORXvRkZmvYf9
         7nMli+amSkF4AfJd3sK+f0XID6yMj/QCEd1hBudNBF0atJq/E8RbzvaIvectPTMx8ts+
         OqpwsJnbqxniAy7kzsaEdBMZe23z9gs9aLs1JwOgsOJxCpcYZfxRQ47w5Gqy5vBFALEd
         dwPw==
X-Forwarded-Encrypted: i=1; AKwUvBweSSAdBOwtTZJoQXJx9Fm8ztvTwzHq56ALH3zEuM7hQC300KS3fX4GMMJNKfkJ6O5kvhjYbGIZUrIZeX0=@vger.kernel.org
X-Gm-Message-State: AFuF++mBV0c6gIyCv0D2GHgqeZD6OhqpiM7q7MiG8WKTJFlwMRV9jzsb
	SUl0s4IPZta3/tdN9kHCDY7f4c1kjwXuOmShUC5PPNIbJm/m2um39BYx663Z472j6hlbmsB25Zm
	e5WUcKQ==
X-Received: from dleb14-n2.prod.google.com ([2002:a05:701b:424e:20b0:143:2ff5:276d])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2ccd:b0:398:9c00:29f0
 with SMTP id 98e67ed59e1d1-39b2628fc25mr14752794a91.24.1788565286742; Fri, 04
 Sep 2026 16:41:26 -0700 (PDT)
Date: Fri,  4 Sep 2026 23:41:23 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904234124.2336922-1-jthies@google.com>
Subject: [PATCH v2] usb: typec: ucsi: allow retries of ucsi_resume_work
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, bleung@chromium.org, 
	gregkh@linuxfoundation.org, akuchynski@chromium.org, 
	abhishekpandit@chromium.org, marco.crivellari@suse.com, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

On resume, the UCSI driver will re-enable notifications by sending
SET_NOTIFICATION_ENABLE. The LPM/PPM may be busy during system
resume causing SET_NOTIFICATION_ENABLE to fail and preventing the UCSI
driver from receiving connection status changes.

Change resume work to a delayed workqueue to allow retries on failed
SET_NOTIFICATION_ENABLED commands. Additionally, cancel resume work
on suspend to prevent pending resume commands from impacting suspend.

Signed-off-by: Jameson Thies <jthies@google.com>
---
Changes in v2:
  - replaced system_long_wq with system_dfl_long_wq

 drivers/usb/typec/ucsi/ucsi.c | 18 +++++++++++++-----
 drivers/usb/typec/ucsi/ucsi.h |  3 ++-
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index bef3f9b71d71..459aab574b29 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -2158,7 +2158,7 @@ static int ucsi_init(struct ucsi *ucsi)
 
 static void ucsi_resume_work(struct work_struct *work)
 {
-	struct ucsi *ucsi = container_of(work, struct ucsi, resume_work);
+	struct ucsi *ucsi = container_of(to_delayed_work(work), struct ucsi, resume_work);
 	struct ucsi_connector *con;
 	u64 command;
 	int ret;
@@ -2167,6 +2167,11 @@ static void ucsi_resume_work(struct work_struct *work)
 	command = UCSI_SET_NOTIFICATION_ENABLE | ucsi->ntfy;
 	ret = ucsi_send_command(ucsi, command, NULL, 0);
 	if (ret < 0) {
+		if (++ucsi->resume_retries < 5) {
+			queue_delayed_work(system_dfl_long_wq, &ucsi->resume_work,
+					   msecs_to_jiffies(500));
+			return;
+		}
 		dev_err(ucsi->dev, "failed to re-enable notifications (%d)\n", ret);
 		return;
 	}
@@ -2187,6 +2192,7 @@ int ucsi_suspend(struct ucsi *ucsi)
 	 * EC is stopped for suspend; state is re-read on resume.
 	 */
 	cancel_delayed_work_sync(&ucsi->work);
+	cancel_delayed_work_sync(&ucsi->resume_work);
 
 	if (!ucsi->connector)
 		return 0;
@@ -2200,8 +2206,10 @@ EXPORT_SYMBOL_GPL(ucsi_suspend);
 
 int ucsi_resume(struct ucsi *ucsi)
 {
-	if (ucsi->connector)
-		queue_work(system_long_wq, &ucsi->resume_work);
+	if (ucsi->connector) {
+		ucsi->resume_retries = 0;
+		queue_delayed_work(system_dfl_long_wq, &ucsi->resume_work, 0);
+	}
 	return 0;
 }
 EXPORT_SYMBOL_GPL(ucsi_resume);
@@ -2299,7 +2307,7 @@ struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops)
 	if (!ucsi)
 		return ERR_PTR(-ENOMEM);
 
-	INIT_WORK(&ucsi->resume_work, ucsi_resume_work);
+	INIT_DELAYED_WORK(&ucsi->resume_work, ucsi_resume_work);
 	INIT_DELAYED_WORK(&ucsi->work, ucsi_init_work);
 	mutex_init(&ucsi->ppm_lock);
 	init_completion(&ucsi->complete);
@@ -2365,7 +2373,7 @@ void ucsi_unregister(struct ucsi *ucsi)
 
 	/* Make sure that we are not in the middle of driver initialization */
 	cancel_delayed_work_sync(&ucsi->work);
-	cancel_work_sync(&ucsi->resume_work);
+	cancel_delayed_work_sync(&ucsi->resume_work);
 
 	ucsi_debugfs_unregister(ucsi);
 
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index dc594388dcd0..1996f04ed5e6 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -484,7 +484,8 @@ struct ucsi {
 	struct ucsi_connector *connector;
 	struct ucsi_debugfs_entry *debugfs;
 
-	struct work_struct resume_work;
+	struct delayed_work resume_work;
+	int resume_retries;
 	struct delayed_work work;
 	int work_count;
 #define UCSI_ROLE_SWITCH_RETRY_PER_HZ	10

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.55.0.979.g7e5102b832-goog

