Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A467419FD2
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790845109; cv=none; b=HuViPnYMfccAMWiz4Vg8CPlRel1gtsbjycqx4jY5JR6hTejBsDzwZWECFdGy/rsk11cHjVyTCjPNtgnT3q2FB7nh9XCeE8hbCVobiwDmxp5rVeRq4WA8htk7NRwQD/yc08MCZnHNSqEVn+ekPLxHmVYJAsaMzuaM66t0UiPory4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790845109; c=relaxed/simple;
	bh=SG5l1/p8ecPYW54jL6ocKKDDW9cv0xxmUCyMF618z/I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=kBm4OgGg8mhJedOl3bNh/MUyKsHwBNusRiHHOXn2Fp4HhgvOKXRWho0Hh4OkGeY94Blm4um0t6KK7iH8b9llVo33V3JWpb25IujZOyXXeb16Lq+dwMsVxaf1/MUFeVaBhHixX9IZrzY5TDRnmKTU0blw0E0HFPn+ZDhhr05mQcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--bszpila.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LBzFo9iG; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bszpila.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LBzFo9iG"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a025178d0cso622055e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 01:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790845105; x=1791449905; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BHxr7P6HLK9FY/BqDMDIVmU6sE2kzbtuiJznajQTYVg=;
        b=LBzFo9iG/LiGFytxwqb2bAWH/T8coBS2bCdhgri8g1Ui+AcyfaO8u3WqJv36J9EX4t
         cfNIJmC0o+T7luCc/TXst7qD149RZ0Zsh3IAST6GpXsE2QhsbJaUG2ucZ/ri3UDIN8ce
         wnmNdRFgY+Pjuu6RjHXnBgG7tu1wFamwkytXRM/jX6kYsILkUDGMX9CGW5q5JXMAqW9l
         leayA94gMJxCLDudSERCIVVxb6T5XAuXF3+S55Y/VUu/1VsHP70Dkh9LbeSVnav4OWYQ
         jms7cVTB4YjLmKrbUlkDKTXVh8sZyKUGiDGJDC+luH67DAae6e51TG4dkxWxjJ5L6nN+
         5Zng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790845105; x=1791449905;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BHxr7P6HLK9FY/BqDMDIVmU6sE2kzbtuiJznajQTYVg=;
        b=nGyVH4NF6AHHCCHOJ68CBgy9c7SFdzYDgGplF3bZazrTm1d+xYJvCpqe8gnpY8wXy8
         207JMRR4San83sJQY3uHlMUmkU1zIl2f0vE50XnYaR9jDJ1nmPc4j67vtf0/ZhFl1kvb
         5HDqAMr7LdqLQ9+9EXsajM4d8i+lCvy7ayssis3Y5S4nwWfo7JF6GzVXI8hXFGZg1way
         imyFyzy3jDTTghBH/5STm2/jx+mBr1V0SYe3Vt1Ztg05fWgLeysLtrcEjhAbg4Qc51EU
         RlKk2LP5DinGffcgM5J7Q11t/sXXPvw7CZKRg/quoPBYlPx2SzvMgVm/FJy5BQqtNn+o
         X8MQ==
X-Forwarded-Encrypted: i=1; AKwUvBzO04HxvOSqoqJuXgdlZxxhCRuGMKOx0+nSdw0VliiWI6OyiMBs6U3b34ZjzwVG+I6VJLhq/H77Jdyb1HM=@vger.kernel.org
X-Gm-Message-State: AFuF++laWOYTlneuP/7lxJfU12RqrHxtlodqHgLrW3hv9cdN4Sg50LZ4
	JW1Xrdxla45JYgSl/gMGtnhA3gwAbFWkxCFvpN5ynxxO1F5Tx32p0pf84bRP8zg3bHRLlCtes0f
	1tqUWrDcYkA==
X-Received: from wmgb4.prod.google.com ([2002:a05:600c:1504:b0:4a0:130e:8c8c])
 (user=bszpila job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c3cb:10b0:4a0:1f90:5951
 with SMTP id 5b1f17b1804b1-4a01f9059f3mr20614605e9.27.1790845105001; Thu, 01
 Oct 2026 01:58:25 -0700 (PDT)
Date: Thu,  1 Oct 2026 08:57:13 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001085714.1086242-1-bszpila@google.com>
Subject: [PATCH] platform/chrome: cros_ec_typec: Validate SVID and mode counts
 in discovery data
From: Bartosz Szpila <bszpila@google.com>
To: tzungbi@kernel.org, bleung@chromium.org
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Andrei Kuchynski <akuchynski@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROMEOS EC USB TYPE-C DRIVER" <chrome-platform@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

cros_typec_register_altmodes() iterates over sop_disc->svid_count and
sop_disc->svids[i].mode_count from the EC_CMD_TYPEC_DISCOVERY response
without validating their bounds.

port->disc_data is allocated as a buffer of EC_PROTO2_MAX_RESPONSE_SIZE
bytes, and each SVID entry contains a fixed mode_vdo[6] array. If the EC
returns an out-of-bounds svid_count or mode_count, the loops read past
the end of the mode_vdo array or the disc_data buffer.

Validate that the discovery response with svid_count entries fits within
EC_PROTO2_MAX_RESPONSE_SIZE using struct_size(), and ensure each SVID's
mode_count does not exceed ARRAY_SIZE(sop_disc->svids[i].mode_vdo)
before registering altmodes.

Signed-off-by: Bartosz Szpila <bszpila@google.com>
---
 drivers/platform/chrome/cros_ec_typec.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 50a68819ceb7..4427897eb3f5 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -7,8 +7,10 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/array_size.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/overflow.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_usbpd_notify.h>
 #include <linux/platform_device.h>
@@ -894,7 +896,15 @@ static int cros_typec_register_altmodes(struct cros_typec_data *typec, int port_
 	int ret = 0;
 	int i, j;
 
+	if (struct_size(sop_disc, svids, sop_disc->svid_count) > EC_PROTO2_MAX_RESPONSE_SIZE)
+		return -EINVAL;
+
 	for (i = 0; i < sop_disc->svid_count; i++) {
+		if (sop_disc->svids[i].mode_count > ARRAY_SIZE(sop_disc->svids[i].mode_vdo)) {
+			ret = -EINVAL;
+			goto err_cleanup;
+		}
+
 		for (j = 0; j < sop_disc->svids[i].mode_count; j++) {
 			memset(&desc, 0, sizeof(desc));
 			desc.svid = sop_disc->svids[i].svid;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

