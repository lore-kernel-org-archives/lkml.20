Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305812;
	b=ba2tdK12qy700UpMH+yrE9tpN9BqXWIKx9s8HEwugX2lOgG1i8IUv7ZDeQ9ljXOI5hiG
	 ex+kThQKY3W/9LNisnwJqk9IWgiRhD0g6ncYDcOIhI5l6HGjU3tVVT+J2tKzx77/RVqeI
	 bDJAQQa7LECuc96SAczns9DDCZR2W078FFgPcMvdwEWUiGV2QDd3y1j9nriYAtWEpBLjP
	 HpvtpwtfVdbzLSVz3RLkHxpb5qEbqUfB6D/BJDBbPeZ8IHwKs+V2/mp3a019n0XErNLKp
	 YGn4YvE91F+2s0pJLpbyelNbdS9WiosDxRz3+a3wcS7Aoiqfy73RqrzwcYySxG6WNuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=uXSeg1mwXsdfU65lCvMy2yLqWgpkOlopYKKBWO91XDU=;
	b=zfEEziSLQ28BV9JmWMfV4f5vPZ4kN1ei6o9a7zLwpv8j+s/j9KYrZuNYjJuyyG16cTFf
	 4MGNuv8/jh3WCqd+Pn4d5jdqygUjIr+dAGxuyHkGfvxWZFj0RFv2AdZ9e5CYSPgqBu+Fn
	 5Q8QCy+n0k4BWSPzUzK9w5lDQm9r+Im4VrfwzdCoan4vF5BExDl+eEzvDyEoZ85cOKIU8
	 4eaMU0DaZID6vmoFRnnRcR+OczfiVzPux3Pgk1Ncyr/imrX+tYjBST+j0OHA/WtAVwKN/
	 Uk8On9Qwt3ZzaIDkRW1TuLm9pe7I9zHyTkAm6wWTvclfn2MR6yKmLsKIp0DRB25xStg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--scollyer.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p+SfqPC2;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802D2606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:30:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 802D2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--scollyer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p+SfqPC2
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-18eb2616974so2849381c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793305812; x=1793910612; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uXSeg1mwXsdfU65lCvMy2yLqWgpkOlopYKKBWO91XDU=;
        b=p+SfqPC2TKLRYRGAQKYdsg4hvSGOYSaZPNRCmZwI+OWG8JYu/encDCWEy0hXGlPSv9
         o1v0sXKjKRfTMIepr680LUYxQiwlaGtoGMnp/IU46MF9otqe2IuIf08h01lBR7NYDYkb
         DPc5J5C4qGaq4+DlEWItKrD1uIAhM9tuXV2ThzshWc3C5Qk+Xqydk88V32KhIXXR7U5B
         3+RnvrWZIc+dxmRrBJ+ZVdxy3WV2TzU9NRk4LoDOwnjSnbaBFaXoKqR42GKN+nBKanSC
         +6hC84OuOlRiYstRrUjNQ3DFQabLGKLJ2o0VbiNWPo8BXzXGYgNDxkQbcuDSx4+ynx6E
         5fQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305812; x=1793910612;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uXSeg1mwXsdfU65lCvMy2yLqWgpkOlopYKKBWO91XDU=;
        b=0YtNNK0hX9i6kX9C1+sfM5emP80TCt+rjy6OIMckUoHa6gpBtA/oFbWwfMWeh7L2G6
         YLuoMQkTkTddBRr9pRB/+Vrq1i8AmAJ5MmGZCkH+0R+XOi1H/kniBGf6RXLaZH6XljqI
         v6tesUo3yTyI/qnlH1ct6sd6Sijn0eo8i5/l8hJE2nrzHunHVmiOeecnmkmKxUV3gdhf
         iHXGbPZsiZbnnsTUMmMTY5DxRzH+FRMVjRFZTdZ0+hcThFUkv8vXlXm60ylEB6hB0ebz
         wDb8cZCPL7kDExcPIRJpcyUNOrl+TzadPXcMY+1UyBknNiDdgL3Aj0RvnUBhEV+mVAMY
         A1qQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkBViYAsmMovXZ9keJC7ZhU+asnTzOO+shR/Rw78SUWXi8jkwQJ1OcbhUtnPyyBFcoZDbyxQMnQjWWJbo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK57D4/DE4mivl7qWjw8HXEBzqAQ+jtaCxebQ179ZurHkZO6lIz
	U/0WSJaq2wBI9gq8xPIvpHpgaM7Q3epa9vfmt1WuOvXZke/TK9cfsiSESbVUJKE1V9DCxE+2t+S
	tSHKPxj76RcV2rg==
X-Received: from dybmx2.prod.google.com ([2002:a05:7300:d402:b0:369:ff7f:6354])
 (user=scollyer job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:ea4b:b0:1a7:979f:ecc0 with SMTP id a92af1059eb24-1ac5b7e1074mr150741c88.27.1793305811259;
 Thu, 29 Oct 2026 13:30:11 -0700 (PDT)
Date: Thu, 29 Oct 2026 13:30:08 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261029203008.419808-1-scollyer@google.com>
Subject: [PATCH v3] platform/chrome: cros_ec_ishtp: report EC_HOST_EVENT_PANIC
 to userspace
From: Scott Collyer <scollyer@google.com>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Scott Collyer <scollyer@google.com>
Content-Type: text/plain; charset="UTF-8"

When the ISH firmware encounters a fatal exception, it resets and sends
EC_HOST_EVENT_PANIC over the ISHTP MKBP channel. Register an
event_notifier callback in cros_ec_ishtp to log the panic, invoke the
panic_notifier chain, and emit an ERROR=PANIC uevent so userspace crash
collectors can capture the panic dump and handle recovery.

Signed-off-by: Scott Collyer <scollyer@google.com>
---
Changes in v3:
- Use ec_dev->dev in cros_ec_ishtp_event() and drop the client_data lookup.
- Register the event_notifier before calling cros_ec_register() so pending
  events dispatched during registration are not missed.

Changes in v2:
- Move EC_HOST_EVENT_PANIC handling from cros_ec.c into an event_notifier
  in cros_ec_ishtp.c as suggested by Tzung-Bi Shih.
- Drop kernel_restart() and instead invoke panic_notifier and emit an
  ERROR=PANIC uevent so userspace can collect the crash and handle
  recovery without forcing a kernel reboot.

 drivers/platform/chrome/cros_ec_ishtp.c | 43 ++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_ishtp.c b/drivers/platform/chrome/cros_ec_ishtp.c
index 3766cef81fe8..d3a00dc6924e 100644
--- a/drivers/platform/chrome/cros_ec_ishtp.c
+++ b/drivers/platform/chrome/cros_ec_ishtp.c
@@ -8,7 +8,9 @@
 // (ISH-TP).
 
 #include <linux/delay.h>
+#include <linux/kobject.h>
 #include <linux/module.h>
+#include <linux/notifier.h>
 #include <linux/pci.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
@@ -117,6 +119,7 @@ struct response_info {
  * @work_ishtp_reset: Work queue reset handling.
  * @work_ec_evt: Work queue for EC events.
  * @ec_dev: CrOS EC MFD device.
+ * @notifier: Notifier block for CrOS EC events.
  *
  * This structure is used to store per client data.
  */
@@ -133,6 +136,7 @@ struct ishtp_cl_data {
 	struct work_struct work_ishtp_reset;
 	struct work_struct work_ec_evt;
 	struct cros_ec_device *ec_dev;
+	struct notifier_block notifier;
 };
 
 /**
@@ -538,10 +542,30 @@ static int cros_ec_pkt_xfer_ish(struct cros_ec_device *ec_dev,
 	return rv;
 }
 
+static int cros_ec_ishtp_event(struct notifier_block *nb,
+			       unsigned long queued_during_suspend,
+			       void *data)
+{
+	struct cros_ec_device *ec_dev = data;
+	u32 host_event = cros_ec_get_host_event(ec_dev);
+
+	if (host_event & EC_HOST_EVENT_MASK(EC_HOST_EVENT_PANIC)) {
+		static const char * const panic_env[] = { "ERROR=PANIC", NULL };
+
+		dev_emerg(ec_dev->dev, "CrOS ISH Panic Reported\n");
+		blocking_notifier_call_chain(&ec_dev->panic_notifier, 0, ec_dev);
+		kobject_uevent_env(&ec_dev->dev->kobj, KOBJ_CHANGE, (char **)panic_env);
+		return NOTIFY_OK;
+	}
+
+	return NOTIFY_DONE;
+}
+
 static int cros_ec_dev_init(struct ishtp_cl_data *client_data)
 {
 	struct cros_ec_device *ec_dev;
 	struct device *dev = cl_data_to_dev(client_data);
+	int rv;
 
 	ec_dev = cros_ec_device_alloc(dev);
 	if (!ec_dev)
@@ -555,7 +579,22 @@ static int cros_ec_dev_init(struct ishtp_cl_data *client_data)
 	ec_dev->pkt_xfer = cros_ec_pkt_xfer_ish;
 	ec_dev->phys_name = dev_name(dev);
 
-	return cros_ec_register(ec_dev);
+	client_data->notifier.notifier_call = cros_ec_ishtp_event;
+	rv = blocking_notifier_chain_register(&ec_dev->event_notifier,
+					      &client_data->notifier);
+	if (rv) {
+		dev_warn(dev, "failed to setup event notifier: %d\n", rv);
+		return rv;
+	}
+
+	rv = cros_ec_register(ec_dev);
+	if (rv) {
+		blocking_notifier_chain_unregister(&ec_dev->event_notifier,
+						   &client_data->notifier);
+		return rv;
+	}
+
+	return 0;
 }
 
 static void reset_handler(struct work_struct *work)
@@ -665,6 +704,8 @@ static void cros_ec_ishtp_remove(struct ishtp_cl_device *cl_device)
 	struct ishtp_cl	*cros_ish_cl = ishtp_get_drvdata(cl_device);
 	struct ishtp_cl_data *client_data = ishtp_get_client_data(cros_ish_cl);
 
+	blocking_notifier_chain_unregister(&client_data->ec_dev->event_notifier,
+					   &client_data->notifier);
 	cancel_work_sync(&client_data->work_ishtp_reset);
 	cancel_work_sync(&client_data->work_ec_evt);
 	cros_ec_unregister(client_data->ec_dev);
-- 
2.56.0.317.g454f8302e1-goog

