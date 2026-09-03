Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E205C45FFDB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788435011; cv=none; b=UbSf0HY1MqXTjxYqvK0V3ArpWVnC3f3wipZbIX9z1PgygIr41mwABqhqi2HtZFCiMzUiI5R/6402dxz+iIEhK15wb+6YmCjngb8S9X5ganMF/iXL1kr4N8trQsccyDRzCY334dniyl5yGIjLtzYF5mOFAM44DaY4CRzEul/Nelc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788435011; c=relaxed/simple;
	bh=W2Q173Jx1jW3/V91z2hGu+9hALqHOEA6Pbicw8VsZ4o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FzFCR4NdrO0Q64/TXETPVG5nVNklBH1an7g0CKgJ/hcoQRju6wFbrpc1758mj9GfL4GRprjA2p4VpijTsgwkM5agUGQUOmg66gqhThiy8dEa6rNVAwOht3mGOElz7RjIvNpCmUHcJwVf2/vOlXmyHuy91g6frWxjzSE+kwPPsVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JaE37wyW; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JaE37wyW"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc1c3c90074so2018972a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788435004; x=1789039804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EJJMAnT9oKLd953Y1xfwdFci9mEMvZSIOLBSXclrhvc=;
        b=JaE37wyWIKSMulxQLkUN4WPf6n46sP0tuYsqZyIbaICQWzV/fguiAF4u4r7plZeKQQ
         S/vZ/kXkSH92dZGVASRhPKgV13FdImIHpJZ0a1ugUtyFLe4Qgn995hi0Cc+XtGX4ldIM
         D2wyObE1GemN7H2ryh1IuJ4TeGYFhjYDU0stHlUD957dDgvO2q+oqybaiP+T1+4RdUQ5
         WwPWV0TbtMujA2qn69QDbW/wMwowSNjP7s8CCcK/FHlq78o22YG7I6R3tFiGZ+8NwvA/
         h/LreJ3Oh07nk2k7q3+h/2m0KlXX71oXMKb3g2dulEybJ+AF5ba4hr+gZMzF4yP73EnD
         lJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788435004; x=1789039804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJJMAnT9oKLd953Y1xfwdFci9mEMvZSIOLBSXclrhvc=;
        b=m0rqdOLPg53JX6epF1RqEAms2uNEDFuIscyFpnAvH6CQpfazzegogsYUaNvXNmNXGi
         sjII24ruFonqWUqul7wMw4Vbg2qGOyyCvdn0lSqcRLxeOHHhtsctizOYqoedw+zaT+oe
         m17M5mrX8aqlJxYzfz1YkHKEmUor5VFRmyofXPMAEvq2i/Agc/Mt5RtFi13GIoHdfytc
         FRGhWwvv6Lp1WtIRnnN6/HwDJJKlRiXc6ZNeAix1QarYTn6ZhD6pBJ9Nx39162AhUQm7
         UoxoqzxWi7lLIFO067y7vlZFQs3ok6Gq5AKpaKlcxjiJMinmas1gF/VueMAw+8je3L5m
         3lmg==
X-Gm-Message-State: AFuF++kHO1hRgldQm73bDjLxZj+7NWtZDieripQfs+hBrNGl51wZck6S
	qBQqvvhcUa2Tl4Gdid42rzbN4/9nC7V4nphlsv1noEVxKVxGVJOrcj96
X-Gm-Gg: AYBFou1KXvMA2s+15XGefaEwWPPmNah7XTSC02GU/Yrn707KCtJkDiwSd0Ufrepr7mv
	ey9nGHTFhdIfdzPtIIA1hb0S8CrPwq5FpOqxYprTUJ8jSwKgkxnWduXhCyhKgHH/xCR5/vbR6I+
	Zej0Xhj8iMpeEBrwxWE1QSgiwPDqHwbidNCw0wzJQBbe2OfSXDvATKOzgaAcezHQ/ZYsUR5Hvc9
	vh9y4y0IfBj4FWhfXpDZqjhm+mBvVoPt/2iRnPE4Iapya5uFSJtvXzkOpiUarAmPHvXiBI8zjUY
	gY08eOMdHIsCIH18EJiBWxMnzRbzg7NP0vSI+Ul9O655xNYf/bChiLTwUno9cXGqBV9cO98DB8r
	xBXxkMHqJ1Lxgt0C238MQFlgmsowO44Wc5nSM8EXd1hhg6/pC7Y6GR528rhOT3HOshKJK9xVq00
	2gVliLc2Opt7hyThtP+WZVo3My1Q6FMDs++/GK6LWMM3BZsiv4VB8BPN5KiLBL5Vl6+7LV7TJMD
	VkzJM4Zm4Q6GWhfwVtc8hxhVmVwMYYNnqPxFb0=
X-Received: by 2002:a17:90a:d44b:b0:395:4de4:92c7 with SMTP id 98e67ed59e1d1-39aedf22512mr18575514a91.3.1788435003296;
        Thu, 03 Sep 2026 04:30:03 -0700 (PDT)
Received: from localhost ([2409:40c4:308:cf6b:b55a:ea5c:9de8:72a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325367238fsm6511267eec.2.2026.09.03.04.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 04:30:02 -0700 (PDT)
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathieu Fluhr <mathieu.fluhr@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	stable@vger.kernel.org,
	greg@kroah.com,
	stern@rowland.harvard.edu,
	Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Subject: [PATCH v2] usb: hub: use shorter 120ms post resume hold for SS root hubs
Date: Thu,  3 Sep 2026 16:59:03 +0530
Message-ID: <20260903112903.542719-1-lovekeshsolanki00@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Holding a USB3 hub PM runtime reference for 200ms at hub resume triggers
an AMD platform issue.  Users running Android adb report crashes after
adb has been polling and waking up the USB subsystem once a second for
some time.  Vendors are working on a solution.  Disabling USB runtime PM
is one way to prevent this issue, but it is also proven that reducing the
hold time to 120ms in resume also mitigates it.  See Link for more
details.

Reducing the hold time to 120ms for the USB3 roothub is in itself a valid
change and optimization, as the current 200ms is excessive: a root hub
has no upstream suspended hub whose wake propagation needs to be
accounted for, but still need some time for USB3 link training to
complete.

Keep the 200ms hold for external hubs that commit 8f5b7e2bec1c
("usb: hub: fix detection of high tier USB3 devices behind suspended
hubs") is intended for.

Reported-by: Mathieu Fluhr <mathieu.fluhr@gmail.com>
Link: https://lore.kernel.org/all/CAPyJwA_D9qw0T72f8zwM1yKjP+To=maVANbcdsWM7yRmbBxYvw@mail.gmail.com/
Cc: stable@vger.kernel.org
Fixes: 8f5b7e2bec1c ("usb: hub: fix detection of high tier USB3 devices behind suspended hubs")
Signed-off-by: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
---
Changes in v2:
- Reword commit message per Mathias review
- Place root hub timeout define next to existing
  timeout define, and edit the existing comment per Mathias suggestion

 drivers/usb/core/hub.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 3345b3298daf..b446905b48be 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -73,8 +73,11 @@
 /*
  * Give SS hubs 200ms time after wake to train downstream links before
  * assuming no port activity and allowing hub to runtime suspend back.
+ * Root hubs have no upstream hub whose wake propagation needs to be
+ * accounted for, so they need less time, use 120ms for them.
  */
 #define USB_SS_PORT_U0_WAKE_TIME	200  /* ms */
+#define USB_SS_RH_PORT_U0_WAKE_TIME     120 /* ms */
 
 /* Protect struct usb_device->state and ->children members
  * Note: Both are also protected by ->dev.sem, except that ->state can
@@ -1358,7 +1361,9 @@ static void hub_activate(struct usb_hub *hub, enum hub_activation_type type)
 
 		queue_delayed_work(system_power_efficient_wq,
 				   &hub->post_resume_work,
-				   msecs_to_jiffies(USB_SS_PORT_U0_WAKE_TIME));
+				   msecs_to_jiffies(hdev->parent ?
+				USB_SS_PORT_U0_WAKE_TIME :
+				USB_SS_RH_PORT_U0_WAKE_TIME));
 		return;
 	}
 
-- 
2.55.0

