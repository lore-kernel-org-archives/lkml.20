Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B6C3DE45A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792032680; cv=none; b=Shfj0RU9pr6L9/IUjh3zq7MYlFa/CDRlM5DNgZcHZbsU9cwt8amDeQ7HUeV3RFuprwumToSe+jrcJ7FVW5FnTJFphQiTYBqZOhWF5JdXEywqcRkHiAZ/ncwZLaYFxJTl5Hroh9+gk/kqWBvJxw84l9e9KMXrkbTxcQSk6OOGBWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792032680; c=relaxed/simple;
	bh=e9jjZAPNzrxWW/JlkWDVUF/F8+yzODdFPw7fP/04PhE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=U7EOsIp2PeoH9N6jR7m7mS/MVr5D4BtwgQtjKjA8ING33QPziZRyZcWU4zR+n9OPzUp4WqI82+DdcxYxC/qPXahrdg0XiONy299FsAMwlLLBkNfZovV9thtVJpnaQcn1M4ScdK/S2oAdFZh2fZVqTWXhdI5TYihLNwjeee7/kRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+iX60ZL; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+iX60ZL"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93e63522076so359169085a.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792032674; x=1792637474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3s/K9W0bzEgXYrBLh/pWzV43lciN42ZkCpUYTHPiWIc=;
        b=I+iX60ZLBuN4IyG752jzqnBesrQsUlMlgHIXLMMKF+QFn7Rc6oidrxclU9wqawt+NN
         dDXHy5AdGU5m31Ve6gVBLy+eMe4PNMVAK/FUSPouejgHPvVvcFD9Lqz6vAVGiRBwjS1l
         hDQ/6/ngeRuo4mD9fBefVN3Szv64J6kL7yVPEeNAQtahbffEjdoIkpftuWNPNlorUojl
         jllrH4UFfvuDlAI2qTTR5B6w+2oZpYE3zHZxQdi0yXwy66qEkNgt+IQgz5bs9cINNvZE
         vc40KyfCVsEvt+bDmmpnt1WYqCitQGWgQHmgOr+W69Y+XKWnWKdJiiEQ/uy4vf3CLCaT
         Kmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792032674; x=1792637474;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3s/K9W0bzEgXYrBLh/pWzV43lciN42ZkCpUYTHPiWIc=;
        b=DTByAeNtqWl8gcTCnmUZ2KSOEE5knfVJ+OzeYOcNvber+zm+DD7QTg1/cLlB1wH5dE
         NWOSHSNTCt6qfob0VAL1TBX9XdRmC4WtB/oAsmrsZPFBDyRQnNymvAKhptYP9GN7njCI
         r7OviXOlGGcCqy3snFO2Naoe3oqT4QqDi2hPbartiZG7O9K8JCrTBuWYYn6uA0oWMDLw
         hns4bJ/AFLY9jyQbGdqxCCyEt5xpjpK/xL3FDDmY03TPWaTusTgQTPQdKH8UFsAti3uW
         OvFkRQDgyOBifuCYnQ8dJhs6PMCGgMu3/eh94b+xmbTA9EbI5sr1VYuSoxtxPin4S8hT
         JYfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVwgeDke8/Uceqvi2i8Qb06s2WErE2soqFyxY2wZZO7KXPajp0w8PBrSP+6Vk0nw+AUMUiaIPb33IDPx0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPhbiUzxs2A6lb8XJZOQ/i3yw8rsnJ+xMX0/wLKVX20dBd39ie
	0FJ829CLbGhfk0W2ZKBN8BFBYGGJkNVP3M5LT+pS0Y028DCH8e1wc2ZUSNg+OP4=
X-Gm-Gg: AYBFou2RSIIZ+a/mFNhU1VeROXiDSOZuA3aaOCgMcMwoRRtGvjkyrik6wj9X6YeycFw
	DD1sGPudqVES9JLadhNL87nzUkDP9vNRsoNT6p9G3AgAJGJJArLhFMaSfUEPE80x5EGL79Tstu0
	WGWPSPHqY1FMB6XqBH8jS7YO3MGNyRisRlBmxh3MTzoNXKfHjWQoHkL4vOjOevh2RChfP21f2f9
	NCe0NE563od0rG6Cq+fvJjP5Me7SaN9L4pKjEBp3kc8veIVf4d+3taVQKB60e6S1A88Ziuv3JBB
	/vRIS4UnhzRNyZg1w8QTQgY5Ddr7IglSSu7gbuQVTDMX/4ITAmOqJqHEmTezNF0vBzo0fsrtKdu
	SmsPUEWwDeQEHUQ+xyiY1pCWona+wwBxC6IFCZlJwjZr22PwyleTgFx2xMbqsclhl9UUjfWw/pz
	nHsanb50ZQIwTbgyxMFxuSc3wnlMjnEbu3AjhFSO2IdhfAr66lExVbBbnfBdPQndkBMEX/XlWAn
	TXro4fv07mtZ8ZHNRxYgYd7DWJLu64+pHV1pkdF8LWdUCVgBzAbQbd/fRYQ9a2OgKIdFuanDNsD
	m9QbP9mu9kUrXyTmh3zJelWKYtIL
X-Received: by 2002:a05:620a:63c7:b0:93b:d79b:9a57 with SMTP id af79cd13be357-93ebd274840mr2644083185a.56.1792032673996;
        Wed, 14 Oct 2026 19:51:13 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef500643bsm654053385a.13.2026.10.14.19.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:51:13 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] ASoC: rt5645: Shut down the button timer on removal
Date: Wed, 14 Oct 2026 22:51:10 -0400
Message-ID: <179203261324.2681924.5002100194676410503.rt5645-button-timer@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

jack_detect_work can rearm btn_check_timer, and the timer callback can
queue jack_detect_work. Deleting the timer before cancelling the work
does not break this cycle: an already running worker can rearm the timer
after timer_delete_sync() returns. The timer can then outlive removal.

Use timer_shutdown_sync() before cancelling the delayed work so that
subsequent attempts to rearm the timer are ignored. The IRQ producer has
already been removed at this point. Keep the restartable timer deletion
in the suspend path.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: 7ff6319e7da5 ("ASoC: rt5645: use polling to support HS button")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with GCC, W=1 (x86_64). No runtime testing.

 sound/soc/codecs/rt5645.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 7313ea7..3c4354d 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -19,6 +19,7 @@
 #include <linux/acpi.h>
 #include <linux/dmi.h>
 #include <linux/regulator/consumer.h>
+#include <linux/timer.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -4292,10 +4293,10 @@ static void rt5645_i2c_remove(struct i2c_client *i2c)
 		free_irq(i2c->irq, rt5645);
 
 	/*
-	 * Since the rt5645_btn_check_callback() can queue jack_detect_work,
-	 * the timer need to be delted first
+	 * The timer and jack_detect_work can rearm each other. Shut down the
+	 * timer before cancelling the work.
 	 */
-	timer_delete_sync(&rt5645->btn_check_timer);
+	timer_shutdown_sync(&rt5645->btn_check_timer);
 
 	cancel_delayed_work_sync(&rt5645->jack_detect_work);
 	cancel_delayed_work_sync(&rt5645->rcclock_work);
