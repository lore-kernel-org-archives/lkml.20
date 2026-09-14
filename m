Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39B343CE70
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382506; cv=none; b=p8IPwJ5wCMV/YVLZoCNVDuK3x4kiOZS10csvMulQMaumEfhmvXRKPZRyCNG6s6k2BEBHFhgID4RdpXNvN3KFERiTodUEAqaTyN9dmVYPj5v/BmWgtVoHvpEgbyKg0/yZWPClxrR3s7JCe7RmToXW5xhLSq7S6osVlw5SOuxzmO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382506; c=relaxed/simple;
	bh=8RMjW2GZiFLdZ5ZhXAK6hKwmt70RrGO/ubTXCPobtc8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uJ1nScumdzDD9zqJrZiUbh5AnjY18M6MKdVuQXm8PapelTrP3dNwj6gv+8RtPTFNzFOITbTn51c8O5suk/huX4eXjl1iYkoi/wPXJMZkhOzJwNVeJozxqIs/WzgZYv6lrFnCR3e7KXVanEIA6Fc0ecSDCvaxMEl06VYLoR0dIIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fncPsz6e; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fncPsz6e"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6aa9606ddadso2630768eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789382504; x=1789987304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VeYhK5Bct0822vB0fqa5xHImLPh+u4sb5Rd0DXecL4M=;
        b=fncPsz6e+TJPGaLubeOK2THYTbEXgq+KHuDX5sxHfEH8kYwIoDrjy0jsfR7eGO1qD+
         gfJmomiCJLKwgYJpt0Ko2h5XpUJrs0RJnTeUt9MzUrDn5j+43p3Au1Kt9YEvrIeEkG22
         OeGVQ0P/Mf8wBuThBzAT/ILl5LpEwoPR/zhdCXtR7m7SHKMdCNMdfkKEre8Dt3cB47+j
         VYOQNpffM95Gk59jGI9lMdBaEGIh8qjht+FUPyZNuHwFTeWA3yEShUcm9ApQVXkDZAbg
         hZdh17WyJ+mTScVjauk/z5riZ8BpP8uuytu7caymRAtL184l1bkxdQqDZ8X8WtZ7W7Ze
         sdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382504; x=1789987304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VeYhK5Bct0822vB0fqa5xHImLPh+u4sb5Rd0DXecL4M=;
        b=bS585h1p681nSnS6QmpOxAomowKUbFRKegs3JX34r+MOpEEWrPVH3+T6iP/NtUo3E/
         e+iA1gHA+viNl8Or0ZI8ETddCYs30IodmtkLG3hY5wQx4i5xQC4VkaNzF0VDtU96Pvnv
         8BHun4vLYmneF+gHcIArqWJXD52mJSytgDfIbti5L5keA+9d443EZzph8h3+7mYTRN7j
         0yfqVjSUK88qz7iq4LCr0go0TKo9AcMyWPg3SdICw80/6Or9ynhtqagGXVvRX3Hkzcwl
         17wCdbxSLjhhxufKNjMT1Bb6FLch2eYnyPWd4rofuhzg1IJBQl404IzsfekMr0RLoVxp
         aF2A==
X-Forwarded-Encrypted: i=1; AKwUvBydWZEzmbcLKUBJ76tUqwsGXz/GvZWds/xBXXEn9Kr3QFNs6jO1nsUAXJ6Z1SKmaKfCjzGGKS9pqpR0WtI=@vger.kernel.org
X-Gm-Message-State: AFuF++k9JA+icMAuDZT9GBWOx9gQpSejemYOghSnXLOypPxR/ydKmCBC
	M/CVJifr6cdpwFSXi63NrnC70ydW2mJ1rOy08rsvvzdEdTKJkFEoxE0H
X-Gm-Gg: AYBFou2ZGzXJlTZWupRWhrbMIe5IZC5vHVkifzbb2peb6jVhJ1wUFfbtKb4nW+PyaiI
	7Kf36r1xpO86JVlkxWSFcvRlHrmfgQ13Rni0LVSnvUjsa48f+fnafa9xq/6W453FP/KTUKWuW88
	M6McfRxDjLrvXFOzmlvr7irb4muMj8z9X/nMR5PA8QICoHZYbNzPYACv1Nx5saR7enkI20RZ5Jc
	NXYU0s9bI8+/fzM+YzBEM5vRoQI3Tpco5J7aGE+7fHxdAR5ICjNOJ3u7/BLc7MvCwkKETa15XQN
	FlBhB3D3oClzDTvh//avQHc7bpACVpJIpZTlJEdFwZpscRM4yrx8o7yzfDcGjlUV4/2grSlZlBl
	Pb/5P2K3H20XZ0QRrpWMPEF02drHwJ3PY2RDQi9BOwo2hq4ssccmRrsBHTfno3N70uyXWZ+Fgm2
	3eCZBMzzAtizdOJ0UW3ya8+WEAJInAI2X0TDzYWf/AjilXogS+blN9qbRK+rz9Rys2aAPYrfBH7
	aop0yb0RKlGmyhB
X-Received: by 2002:a05:6820:81c5:b0:6b7:8415:d77e with SMTP id 006d021491bc7-6c541f45b3bmr748644eaf.41.1789382503583;
        Mon, 14 Sep 2026 03:41:43 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b347e6sm23213037c88.4.2026.09.14.03.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:41:43 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Simon Guinot <sguinot@lacie.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmon: (gpio-fan) return IRQ_HANDLED from the shared alarm IRQ handler
Date: Mon, 14 Sep 2026 17:41:36 +0700
Message-Id: <20260914104136.1797979-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fan_alarm_irq_handler() always schedules alarm_work but returns IRQ_NONE,
so the kernel treats every alarm interrupt as unhandled. On a shared
line that risks the whole line being disabled as spurious.

v1 just fixed that, but it was still IRQF_SHARED, and always returning
IRQ_HANDLED there defeats spurious-interrupt detection for the line --
if the interrupt ever fires without a real event, nothing catches it,
and a fault could spin the CPU in the handler.

Sashiko flagged this in v1, and Guenter confirmed: this interrupt must
not be shared. So v2 drops IRQF_SHARED too.

Fixes: d6fe1360f42e ("hwmon: add generic GPIO fan driver")
Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/r/20260901160931.DD3811F00A3D@smtp.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
Changes in v2:
- Also drop IRQF_SHARED (Guenter): always returning IRQ_HANDLED on a
  still-shared line defeats spurious-interrupt detection for it. v2
  is a full patch with both fixes, not a delta on top of v1.

 drivers/hwmon/gpio-fan.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 084828e1e281..0dbd07f5dc53 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -67,7 +67,7 @@ static irqreturn_t fan_alarm_irq_handler(int irq, void *dev_id)
 
 	schedule_work(&fan_data->alarm_work);
 
-	return IRQ_NONE;
+	return IRQ_HANDLED;
 }
 
 static ssize_t fan1_alarm_show(struct device *dev,
@@ -97,7 +97,7 @@ static int fan_alarm_init(struct gpio_fan_data *fan_data)
 	INIT_WORK(&fan_data->alarm_work, fan_alarm_notify);
 	irq_set_irq_type(alarm_irq, IRQ_TYPE_EDGE_BOTH);
 	return devm_request_irq(dev, alarm_irq, fan_alarm_irq_handler,
-				IRQF_SHARED, "GPIO fan alarm", fan_data);
+				0, "GPIO fan alarm", fan_data);
 }
 
 /*
-- 
2.25.1

