Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D8C49BB5A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792190533; cv=none; b=QP4aNJqCF0bwh0+ysTQR3RLQZDM9XqA+OJ2iUQIgLlkPLKeYp6ydgx3Dk0QHoVoJf4QcvwQSDbMwNy8ROA+zM5QZEmf3uvxXHwbl3e17ugwiPJio7NIMajcyF0rBo4fOAWRZQ3yQ1L+GgZqMDE+Bnnsse6V5CwFMFBCtJDGkfDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792190533; c=relaxed/simple;
	bh=vD1grLHt6GPMktwFJa96dlD9wop6Of2cMI4rmsKjgco=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gAwjx75J/fnhw4hhmlcJHcLn1o2H04MQao6rrO/CGO5erfXt+loXf7YDzgw9iJzNGeyfEZ3Apnf8rmzlc1LTq8GoqqkZ3ZEzEQZXEzXZEqzwoxSzk4r/jhO1IbeqUnMYgQPyfcckOjDbPerBQcmdUlHZRCYn5kmOWAIu0ehsW14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qCQpA0AY; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qCQpA0AY"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3514b90bb89so964478eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792190531; x=1792795331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAjeV46NrgruTlPtug79XGAt+XjZ6oM38iwo9Lyk13o=;
        b=qCQpA0AYDUG3/4k8+SPTRJZNyd9yCbQhnJxARczhWpv8MWONrd+S0jpv/asdNjqJtt
         ORWqDd0pEIz/B/vj164lb/QQYOqsYSdWudIqCHkEm+fWGgPZd4Fvb775sAg39qLpYuTo
         v3zsFbiywSuqDwVq8BubHZq/fZlEaDt+cohRR+Yin/fVjMDNQjrMdDPcAsKrhEhBX1rG
         8LoKYNfwsXxhr4tXBewzSS9TqbYlSBc9J7uzuux7wLLYL8EjU0v12xd+JM+BGwcs3U/r
         GsXRGOzGm0TH0bJsW/9E9pNld7DWbd2CwvlnEeKF8I5VT4lNdaBq50/z1NMfV6esffKW
         Pthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792190531; x=1792795331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XAjeV46NrgruTlPtug79XGAt+XjZ6oM38iwo9Lyk13o=;
        b=ao2lWtfvORmvT0/zvSvfIV5dVeawrCgEhqdroc7OMpxOHcZj6fNSHF/JBO/IeV8LtG
         yNlZHvVZU39/ALeWt62EIG3u5vv+CeswBbZ0bfgNAvwLJz55SVmda1nJUIoHSr5/DPqJ
         TeH8TjZU8o9V5BDwgou8S+sZcPLoe0/F6JWq2ahXIgxgsUxZHml5PjPUMx8lalvZBL5h
         7nuZQ7Qa3+brtqe/lCKf9VV0J7EL1hdvsg8lNE6/wFEf7u9vopPP1u/bZ6lOTJ1HhPJa
         h/Eat4tJ3b24AwVZVSVPGTH4duBtOkANelFzBcAxJcw76Yl6o9j+thTq8bSGVKvT6j8g
         7/5w==
X-Forwarded-Encrypted: i=1; AKwUvBzaE9PEyAtiFIk955gPc6F3eFQ3UEsNAIovZd0CQfbFP1kq2hqy+2iv8ZJXlIrOuDF0y01J5BfpVOkFP0w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCrb2iDg/4phYPp49qsZQKrQJ9a4dZPVXp+LhFG55sLLDoX45h
	akkvxHtTmVRio/dLnbc+9wPqtOYZoIPzZ2dLT7SPVVCZlkIyl4gbOzZ9
X-Gm-Gg: AYBFou0fjoxWDIN2XMtwBHQ35Hwffl6md+C7o6djJQBn8g3rEQp9X+5MIE20OK5Lune
	K3cbKav0gQwYGxTs7++vkCnIWOJngGPraq3lBf9M1pZ8iU8kN3Vw0lDC/QpK6fu3n1S2PD18WGX
	hjPmENkqd2rkC+PvxdRSvPvRUYv5H48R35vpnPMOlHvkVU2oYmxSKuF/oPuyhGiRtrBhoauG6yP
	6SzxKuHB9+mTw0fC228fuj5A5qZ6Swtmr2OXxjGH5jxJic2kY4wAfXnITMBZkC02rItTH38chwI
	f1pLim4BUb3dWXnqcT4KHc7c9ioV3Txdrqp4hi/jCMdlcaquyQ1VP47W3uGYtT/C9Ol5roMCSQB
	cpYsWiZDr4i524oh9uLYqoRStt8AXrbC4jaxLo7qzd8uLae3qeH5xrZdqQJ+a3EmtH7idNazMAc
	80jbRR82VyNM38r5L6s6NuaNS7vCG+iGVT5dNETNm6xm8MFISQQY59ACbAomnqOVrVyuyBe78KR
	he7iVg2q3Q0AGN1GXmFPPGMi6Mxn8TCCDsYyL1O3S4F2+RE036iQFNYiYZ/jnw=
X-Received: by 2002:a05:7022:296:10b0:14d:f83b:f678 with SMTP id a92af1059eb24-18513e7a0a8mr1537358c88.43.1792190531284;
        Fri, 16 Oct 2026 15:42:11 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:34f0:f27d:9a5d:56e0])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm8252348c88.21.2026.10.16.15.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:42:09 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 16 Oct 2026 15:41:51 -0700
Subject: [PATCH v2 4/5] HID: Drop unused linux/hidraw.h includes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-test-hidraw-base-v2-4-153f67a20cad@gmail.com>
References: <20261016-test-hidraw-base-v2-0-153f67a20cad@gmail.com>
In-Reply-To: <20261016-test-hidraw-base-v2-0-153f67a20cad@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Michael Zaidman <michael.zaidman@gmail.com>, Rishi Gupta <gupt21@gmail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Andrej Shadura <andrew@shadura.me>, 
 Johannes Roith <johannes@gnu-linux.rocks>, linux-input@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Several HID transport and sub-drivers include linux/hidraw.h without
referencing any definitions from it. Drop these unnecessary includes.

In hid-ft260, replace the hidraw.h include with linux/hid.h directly to
preserve the declarations it previously relied on indirectly.

Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-ft260.c       | 2 +-
 drivers/hid/hid-mcp2200.c     | 1 -
 drivers/hid/hid-mcp2221.c     | 1 -
 drivers/hid/hid-winwing.c     | 1 -
 drivers/hid/usbhid/hid-core.c | 1 -
 net/bluetooth/hidp/core.c     | 1 -
 6 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 64c9c940db46..c1a19296ebbd 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -9,7 +9,7 @@
  */
 
 #include "hid-ids.h"
-#include <linux/hidraw.h>
+#include <linux/hid.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/usb.h>
diff --git a/drivers/hid/hid-mcp2200.c b/drivers/hid/hid-mcp2200.c
index dafdd5b4a079..9c82de069b8b 100644
--- a/drivers/hid/hid-mcp2200.c
+++ b/drivers/hid/hid-mcp2200.c
@@ -12,7 +12,6 @@
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
 #include <linux/hid.h>
-#include <linux/hidraw.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include "hid-ids.h"
diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index d52ce3531ab7..0c3dd998498f 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -14,7 +14,6 @@
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/hid.h>
-#include <linux/hidraw.h>
 #include <linux/i2c.h>
 #include <linux/gpio/driver.h>
 #include <linux/iio/iio.h>
diff --git a/drivers/hid/hid-winwing.c b/drivers/hid/hid-winwing.c
index 19b92c2c6579..df34502d2669 100644
--- a/drivers/hid/hid-winwing.c
+++ b/drivers/hid/hid-winwing.c
@@ -8,7 +8,6 @@
 
 #include <linux/device.h>
 #include <linux/hid.h>
-#include <linux/hidraw.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index 96b0181cf819..e398afce73fc 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -34,7 +34,6 @@
 #include <linux/hid.h>
 #include <linux/hiddev.h>
 #include <linux/hid-debug.h>
-#include <linux/hidraw.h>
 #include "usbhid.h"
 #include "hid-pidff.h"
 
diff --git a/net/bluetooth/hidp/core.c b/net/bluetooth/hidp/core.c
index f5bdf9f1ca63..66a0fb731c7e 100644
--- a/net/bluetooth/hidp/core.c
+++ b/net/bluetooth/hidp/core.c
@@ -22,7 +22,6 @@
 #include <linux/module.h>
 #include <linux/file.h>
 #include <linux/kthread.h>
-#include <linux/hidraw.h>
 
 #include <net/bluetooth/bluetooth.h>
 #include <net/bluetooth/hci_core.h>

-- 
2.56.0.176.g3575e65682-goog

