Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A74C3B8939
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750199; cv=none; b=ZWkNY3VCc3fsWjm/OkGhbIeV5xwWB7Dx8Y5ryWsMQfRW9iZZpSpHz5Yhll2G7LYRD08V5VGkz48dIzvByoTMWfNSJV+qrOL2nG6vqSE8FzAl2KWtfGRpuPacP34qP4mtVMb37Yw1rdAYXI49/PAFMW0HjAF0dBHPX0ePX+Y+8Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750199; c=relaxed/simple;
	bh=us9rhZmosXpVADZoaCZ+X8yibytzPx2jG760FMFo2BI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F0BH0M8aIi96sodJg6H20/LZf5IK8z1mCNN7PpAr7k9XMSNfQtG5mx2e8ptnFEuxHLFZGHv8YZnFWJVmpRkgGUX9gYdGWADCf6BDTbQTYu7Qu5vmfiOu0/zfj9VeV4uSUO00pjGx4vzZt6XKbNGJ0BMu2GKS6R1RAX7Fwco3J70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PowgAOe4; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PowgAOe4"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-881269371acso686573b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790750193; x=1791354993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAQzPt1jCqADIyUZfRgn6d5q0kIudDW0bYO4eZIDIzU=;
        b=PowgAOe4wEUCoBUfyTye/WU2CpvgSOIrvY2rZDw0wIXp0gKd7AQHkTQNJjLiJfnT8g
         PXYqjWdoPYcjoGaOi0mrcRNRx7rkvST+Ska+lD+HUu00fd3msOgOuWrNYQ591ao73tmM
         9A+ZaGIqmLKji9E9Zzl7mfPINKkwsGYrJHiBzh7LZJQ9DOwcxD22FLln5dh2h9/ZlEUm
         Hd0qJGjbyd8LhektwIvaOjohj8wIebMwusJ7CKeSziTHogUljcN4HdKLpQbnPnMAOTCB
         oZnHPVQEN776Y5WWDM+6g099xLZ8CUBda0S51xTa49MS4MiqHAsUpLQZlMQ+l8kQKzu4
         TnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790750193; x=1791354993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wAQzPt1jCqADIyUZfRgn6d5q0kIudDW0bYO4eZIDIzU=;
        b=kfybIFEpzbGtrl+4taZ/1GuxP7uMn4N6+bIdkcQe3tJaLW2lZ3y0DfYhFHqYYu4vMU
         bEXgluK54lrmcg3IvTMb68GMAq1KjzKL07H21CNHJqZbzQ/G2WhhXXTSnKe7uJ8q39RL
         bLfFyN7AGT/kSd9n/WQIJQeDfxrukVybKLZSW3K3kplNCCjYAzShinJaEGc7MHjWhyhp
         Tgqx2Zgw6LmQp5w9WXAY2e7tzvoUpswSL3eZyhLe2NsbvO2TkHYwyDBtnUJ7Rn1chbwS
         RUhR/ffc3Q1aiS5lIbpquSQRH3nxtxPP7hGdg2ls95qwnq2YQXn+UBS5ACuwLmwTYdxG
         noYA==
X-Forwarded-Encrypted: i=1; AKwUvBy3MzJCgeWlm0FKjs72mAD2RSu9iZpKpVjdiixo0luM7KIEQhwGMXVcdN7fxR7/j3v5UYdrWYcO4sCAaag=@vger.kernel.org
X-Gm-Message-State: AFuF++myZx1j/vA7SX+9zRM7Rcpq9oJgxkMO6G0NZfwlgjhIEymEHKuF
	EO7ZAaIXmMJAPmChSo4SJSuHr/WW4JrcT2EOlSwQ5uKYRU63Zo6e9kmZ
X-Gm-Gg: AYBFou18gSJqdHH4DxbP+S7IvVPM0MjoRWguX7HK4o0F83Ux0uCBBMaZHH2D4lUPRFH
	r6K9lRjB8ZJXe4IPOlK9b49Ot05x3GZf/L97Ur35ebTFkKMefpBMSJdn7h14zQs8Z6FR1FKw0YC
	VSUkiwFR2vZH7z7pkPWk49VSdmOwbedG3eOrndUnBI5xJJNAsXq0ju+PeaoQVp7N+pZoBTRqi7v
	DYwUeDaVMkadnIX5+bKrmI5F3Yb6+W8+q19nCqP5d15HfZ9ZWRUT3uOqAfIS+UgXb3GEzOLRCuY
	fm5lel/zGeyS78FpSiw3cpx2WZO0qjDKn/v6hr9926b38mryTXuHWMV+2lRvIRiPvlPiuCGVCdN
	jK+EsdTp0hKXA1TW0dvToPdaG8PSn2WHev9g7HBNqvGe2JOnQE5xm38Y31T7xrvIHUra7Qeg6xF
	n8EbXPo9f3in6yH2K6HHfD1JhLH4sA3Xn9g+V+guTEESorRXcEQBAjXSDrMQuGygFJ81SVWl4B+
	L/+N+E9XIOumTDgHVZRQUbMlYBsusjwtZg=
X-Received: by 2002:a05:6a00:1a87:b0:886:d160:ad1e with SMTP id d2e1a72fcca58-8874c7db961mr201750b3a.29.1790750192506;
        Tue, 29 Sep 2026 23:36:32 -0700 (PDT)
Received: from localhost ([2409:891f:9205:88c0:e839:5391:3544:d94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88726a18101sm278467b3a.54.2026.09.29.23.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:36:32 -0700 (PDT)
From: Liang Hao <haohlliang@gmail.com>
To: tglx@kernel.org
Cc: anna-maria@linutronix.de,
	frederic@kernel.org,
	linux-kernel@vger.kernel.org,
	Liang Hao <haohlliang@gmail.com>
Subject: [PATCH v2] timers: Clear pending_map on CPU hotplug
Date: Wed, 30 Sep 2026 14:36:21 +0800
Message-ID: <20260930063621.37740-1-haohlliang@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260823115046.50930-1-haohlliang@gmail.com>
References: <20260823115046.50930-1-haohlliang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CPU hotplug migration leaves pending_map bits set on the outgoing CPU
while its wheel vectors are empty. After re-online, a later next_expiry
recalc can treat those empty buckets as pending and temporarily pull
next_expiry forward until collect drains the bits.

Clear pending_map under the base lock after migration in
timers_dead_cpu().

Signed-off-by: Liang Hao <haohlliang@gmail.com>
---
v1 -> v2:
- remove redundant clear in timers_prepare_cpu()

 kernel/time/timer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 42afdcb229d8..a3c4e20a4e36 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -44,6 +44,7 @@
 #include <linux/compat.h>
 #include <linux/random.h>
 #include <linux/sysctl.h>
+#include <linux/bitmap.h>
 
 #include <linux/uaccess.h>
 #include <asm/unistd.h>
@@ -2541,6 +2542,7 @@ int timers_dead_cpu(unsigned int cpu)
 		for (i = 0; i < WHEEL_SIZE; i++)
 			migrate_timer_list(new_base, old_base->vectors + i);
 
+		bitmap_zero(old_base->pending_map, WHEEL_SIZE);
 		raw_spin_unlock(&old_base->lock);
 		raw_spin_unlock_irq(&new_base->lock);
 		put_cpu_ptr(&timer_bases);
-- 
2.54.0 (Apple Git-157)

