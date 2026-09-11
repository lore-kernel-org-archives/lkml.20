Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87194B1285
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 20:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789157500; cv=none; b=WplLm5KCwzi/IDfvlOlYnmQ371tQg/sU8rs4Q0VA7B3njC8mhGXpDCyTIrZh2vGXhk/rz4duREIORylBgiyZjIiPduIrv5p72AfNYAmdNjJvkXkCSXbfRd2jGziHf3/wvQg6nxBZ06MadtOHG5O7wcB4JqQ1xDxOW5IkcvXeMF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789157500; c=relaxed/simple;
	bh=3yZszP7h9D+b4l8Qps4Y4MOGGc25J0O0ar2EHyvPZvI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y3hsjalbb1wkoRhoodIMcQ6M3NcRgVXeEvGSfo0L4hiQgMzb5uca6/aAQiQtnY4WrxRzZ+owca0y/2Cnr3TUorQsKD4h11LSfrUYWaMi4vjQvRC+BoZtIH2VMIOmWlE1WJOvvh4+sgq05Dy7Q5/uwmC+8GPJnmNVe171eJY1JEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0FTxoz1; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0FTxoz1"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4843f205a5bso945875f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789157497; x=1789762297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gh0NEVb4lhSj9DL7AtTXOPiW7ET4oJeisxsXZJlngyk=;
        b=U0FTxoz1Zg6uqMZF2BQEEjYJyQ/k1P7N4vKpj9oHYV6Gi15Fs4yBVE6qimIbKOYeHp
         1eRPFyGrU881gtStYr+JA6B9ENCMy/Dn+a7P4pjTVSK+w8ieYt+VTod/GCtbrqpwXSxR
         IrSykvNZcArru8qVwDJTrMZmAJT2iSnCcKT/BRRgaMDU0ovc1xtEOJFSvGVvmEb/wPMP
         t8FnAuaKr/g8i3hOlVYPg/W2omNHu6UQdQ7EnHbQkg5eJ2qIJuITrQDnnIN8ot9pg/Tj
         3AChVOtAtD0Nome3u9FPsZbJvl2GvFi0UD+mIfAfxD8kvl9KJFkhOCSLEW4qZ0KBanDF
         jlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789157497; x=1789762297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gh0NEVb4lhSj9DL7AtTXOPiW7ET4oJeisxsXZJlngyk=;
        b=OLK8AiIhDdVq8xly8w97lid/BRdBXetA3LuEhe5YaieRnxWtjJ6ZpSCtsMzQ6VL9yV
         UNFodNntSIhnGBCTkzAoNtGzAGdwqcKzLxWOB4jqJLhBbfGZk+QaFoSRR4sgsjFS0wQh
         aEEwwhvIwiwpSwdXLpAf0micIOVzQs5bo3sVWU6VY+oyChbcJ11U7yqDxcPnLvZjWQqO
         jgp2C35/mdkUAfv3SbGsWLi7DpR33sCwPAk56UwGgVEnO521tuO6mL5PEFeXpB/he4QE
         nWEm81JitEou7utjlD23eVNwMbRyUEaGgKxetddOrQtPwxPEu1cbHpp3wP7gO2Hale5Q
         TMUg==
X-Forwarded-Encrypted: i=1; AKwUvBwjAx1t5iuP5kqY6ieoyuHTm+C3JM4TB8PII0Ucs+IYGoSOFOPoyPLAzhu0W4KRpHNOf5kQ0V1YxpnTokk=@vger.kernel.org
X-Gm-Message-State: AFuF++kXQZ0e+Z5wcLeOmowvksYYWVm82NQRbscalx+nXFRVN1uwfsKr
	Qak/sXUxqG2774npue0bPiMaOTwA4M9y6hXCSOfQo0KRUuraEOCqG62W
X-Gm-Gg: AYBFou0WtzKm6Q8Trj5kSSfLV4+d5j7N3LoSXpDxa4vxtQzzDguwMuRoGbKCvMTEesU
	mycBbL6HCw1SPTwYaAuJWDX8Ch7giVmg4g8MdrxxqNwTA/Kb87EboycQfNrt36CF6PiSUXiX995
	9ZYBPpxhaUCNapXHesNoj5eSQPjG74lUn4FXQtRyh4kRx3p6AeE0n+uw2YHvpM+clFrwXPTQqyM
	J/3C9gmhjj77wzwonkZlAxmjgFZMWrcrW5w69QT9/pDpsqnIXqm/jWo4YML2D4c7VqWhe2Wlk3G
	0KSxpwDiyHgH7AJ0Fadboyw9x0zUy+b4rornQ0n6a8JXKSeGr9hGsH2RY+F1q2yxXPcuhdTs0yh
	ZCZ/K+RpWiDI3bsrwziqVX88Pxr2it/VVDrUIlHtAhQDZnDPytl4rjxvi+jtj/ZNmEfa0HGtUkl
	YyrtUHVpO4TkMg6QJXyRAlvvicz8pPUo7yPMobEGCIswmewIlbM6brtVOxIxYQfWfG/PzsEjxYX
	LbUvyraaHfgdq48RpkPaCHEz7rkZI0M4mrNYihVYQzNwtGREM4fAcx0VnLB2fTNX7lNwDRVgZpB
	8O2nbWeeUTW7U2zglO8jVAYBf2lHkPqJbdoeZg==
X-Received: by 2002:a05:600c:8b5b:b0:49c:fa20:cc02 with SMTP id 5b1f17b1804b1-49e619d6e64mr76000905e9.25.1789157496852;
        Fri, 11 Sep 2026 13:11:36 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaeefsm97075635e9.12.2026.09.11.13.11.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 13:11:36 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] USB: core: Fix a name that does not exist in kernel-doc
Date: Fri, 11 Sep 2026 22:10:16 +0200
Message-Id: <20260911201016.79577-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc comment of usb_bulk_msg_killable() refers to usb_blk_msg,
which does not exist. The name is usb_bulk_msg. Say usb_bulk_msg.

Fixes: 416909962e7c ("USB: usbcore: Introduce usb_bulk_msg_killable()")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/usb/core/message.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 75e2bfd744a984a95f5586bcf5c8d79fdca1c463..331fdb8a2c4dc9f9e4c724061eb2ae0ea5d9954b 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -411,7 +411,7 @@ EXPORT_SYMBOL_GPL(usb_bulk_msg);
  *
  * Context: task context, might sleep.
  *
- * This function is just like usb_blk_msg(), except that it waits in a
+ * This function is just like usb_bulk_msg(), except that it waits in a
  * killable state and there is no limit on the timeout length.
  *
  * Return:
