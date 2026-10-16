Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2CE3BB57
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792114763; cv=none; b=o57I5Y1liB+/XYdubxJoWcVx8XFHOhrLN2bh57gEJB9c35HGncQuFPfq5DBFYMVS6DZd1xxn2Dk7pXT6U9E15K+wq4+dnx3dxqWS2uFrBIpCU37qeIKuHlAMfyY3+1Ogtu8o7BGtk4p/2UvTdHi51Ceps/6ZNMBbwK+LuiLZpYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792114763; c=relaxed/simple;
	bh=VH/sJji9MaAJtXetVMAL0kmvwh0rIDcGnsVGqynD0Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TMJDAemblYfOgCVVKpir86RMRreQ0vQGYA+rJxS94KRy8ruHYBN579RKMRxHTtLrLA/ksW8ElScpnu7pWkq40gvQ+fa354O0QhRugxJDHm4aEHhUlQB2edkK0i7Vz9WoT2TnmKm13y5Tkny+Pvbq65Q8NuEEANcvhCB9TIpcc28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bz6kM4r7; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bz6kM4r7"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5361e313e63so12607501cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792114761; x=1792719561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z1IfMfNgxmNnTVwhoMZ/I9bCV5F2hA5W5b2zHBAEC4U=;
        b=bz6kM4r7FE0HPFIExfW8r+d0G8ZTHTXtumYV0CnPGG2d3/oBQCDVB/2L6TCmAtaUmU
         ymuiZErxr1xdT97L8/fqb4Hzi4VUymyP6JC6EXtfdZbnIY09S9f+gLrdXCyOsnZS5pXY
         Q1lm9yGmvDXX9iRUzOOHGNQI1zTIsXj5YGLNkrAmOtnH3y2Vfm9AjI4vxDio3jT9tLdh
         /C87VsyK7jsNjNGYGkuIIuvpK1GR57XEQi24rOalHYe+iGsAb2d8S27E2v2c+A9aQN4f
         T3J+5hdkvp16zApI2jijXymXyMVwa7qV0iYlFgLwUDaRjgDTYEXqt5hBWen7A/cnMm9B
         Ctkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792114761; x=1792719561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z1IfMfNgxmNnTVwhoMZ/I9bCV5F2hA5W5b2zHBAEC4U=;
        b=2x2yTmFifaAd5+QpF5/pFshrnYZL/IDageEMXGI4KN8ihrgmGBDGCy1yQ0mGoedDJt
         7esXPfZXNixXhAZfaSHwPv97BFlH8osqrfzRxn77zZukhAsTO11NeT4tgoS+Yzv3ZQfp
         pFTe4n+3QMkxY5zFSIBxXZ6+JC1ojekRK6XhvTeFL1/DBrgq58SILCE91UfZODOz+FG3
         QSQDuiK5Q11iLAS4Qd+vn74/HOsBs2ytN/hRuPqUvERmISVinuio2hfkaJEK0Ige0TDl
         byPo+Dtnf9yxzZndNOddkHOVEGfeprmKWROjm0spDu3Bp/fPbaD0+E65biL9A3YfyCH+
         H1ew==
X-Gm-Message-State: AFq9FYImvO+MVGhzVsITSoXPvid0Rv5KXKKOBq88HKWViiA+uTfxzys4
	n0nxc6uNZDHbDNNefgflfBZB3PrX5HFcRy4lOZYjoQHdKP96NnJtSUc=
X-Gm-Gg: AYBFou09idcNoNWs7vyEv3e+yNT2JwQ3T+RsEG37iXQRPJVcU+BxzlCmas2r7Fe6qGi
	ZoBOU2NWeHIq+dogwat/uXnRu9vG2B5LA//jxKIAqcPKpunyWS2rdOUJ8rXBzZZFuQCd9+MuvNT
	VYEN1Wqfs9mJMIFl9H8awbQD1sHvJqwhRsB+3QrNv2WDk4O7o2EZNHUKXT5Vxfl8hq4IrV/6uHH
	ItBxZy5hu9W4NuBFixE95PQRlM4cwQX23glvSr4Zlf3CNTcEA7ns6W+ZHXadIch7W6HgA/F8uRm
	t7eO79BfLrPaXEjH8E5Pc6QoNv69WsLGyMoRKJYiQTKYGpZvp7nZpfgYmvGO8jN5L8d/74+Ztxh
	w9b7ctChPgZwO+XvjDwA+a3mCEBz1VTCBwF6lWnWIfxwlnXjE+cBU5GSM7KxVe2klmE8GIfqS4e
	+VXSwKRPRlMquBzJeqbSY+rx6GQdtA0plMlIKT3lMbmVWRbwUz/3oQyOiScJuipFKU9+fWrjrt5
	bEB99AcPp1fLC9FcEc1YOtbhVC4w1RP8XltOGMgU/QpjOXEP4FAames1aMVugg4XcbhGVP3ELj4
	KcJrPAOSzLniUNzXDH6SiBiM8BrJvQ==
X-Received: by 2002:a05:622a:1441:b0:535:864d:b821 with SMTP id d75a77b69052e-5359fac48aamr342803671cf.17.1792114761291;
        Thu, 15 Oct 2026 18:39:21 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362a9c273esm8981861cf.20.2026.10.15.18.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 18:39:20 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	soc@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] platform: cznic: turris-omnia-mcu: stop button emulation producers
Date: Thu, 15 Oct 2026 21:39:18 -0400
Message-ID: <20261016013918.3492835-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The legacy MCU IRQ thread can requeue button-release emulation work
after its managed cleanup has canceled it. Since the IRQ is still active
at that point, the newly queued work can outlive device teardown and
access freed MCU state.

Use disable_delayed_work_sync() to prevent further queueing and drain
the worker before the IRQ action is released. Keep the parent IRQ active
while the worker completes. devm_add_action_or_reset() also drains the
work if action registration fails.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: dfa556e45ae9 ("platform: cznic: turris-omnia-mcu: Add support for MCU connected GPIOs")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 .../platform/cznic/turris-omnia-mcu-gpio.c    | 31 +++++++++----------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/cznic/turris-omnia-mcu-gpio.c b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
index 4e430d6c3fc4..8f43bfa92373 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-gpio.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
@@ -11,7 +11,6 @@
 #include <linux/bug.h>
 #include <linux/cleanup.h>
 #include <linux/device.h>
-#include <linux/devm-helpers.h>
 #include <linux/errno.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
@@ -841,6 +840,18 @@ static void button_release_emul_fn(struct work_struct *work)
 	generic_handle_irq_safe(mcu->client->irq);
 }
 
+static void omnia_disable_button_release_work(void *data)
+{
+	struct delayed_work *work = data;
+
+	/*
+	 * The IRQ thread may requeue this work while the IRQ remains active.
+	 * Disable and drain it before releasing the IRQ action and the MCU
+	 * state used by the worker.
+	 */
+	disable_delayed_work_sync(work);
+}
+
 static void
 fill_int_from_sts(unsigned long *rising, unsigned long *falling,
 		  unsigned long rising_sts, unsigned long falling_sts,
@@ -1082,21 +1093,9 @@ int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu)
 		return dev_err_probe(dev, err, "Cannot request IRQ\n");
 
 	if (!new_api) {
-		/*
-		 * The button_release_emul_work has to be initialized before the
-		 * thread is requested, and on driver remove it needs to be
-		 * canceled before the thread is freed. Therefore we can't use
-		 * devm_delayed_work_autocancel() directly, because the order
-		 *   devm_delayed_work_autocancel();
-		 *   devm_request_threaded_irq();
-		 * would cause improper release order:
-		 *   free_irq();
-		 *   cancel_delayed_work_sync();
-		 * Instead we first initialize the work above, and only now
-		 * after IRQ is requested we add the work devm action.
-		 */
-		err = devm_add_action(dev, devm_delayed_work_drop,
-				      &mcu->button_release_emul_work);
+		err = devm_add_action_or_reset(dev,
+					       omnia_disable_button_release_work,
+					       &mcu->button_release_emul_work);
 		if (err)
 			return err;
 	}
