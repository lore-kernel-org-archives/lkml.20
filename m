Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC36F5FDA7
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790567660; cv=none; b=LqpVBq32TceR7cFUIyLJKC9Ec0cv72yaxW1TNNd2wzatmsSHY0SGEY3doiaEbw6V4lKxeEa9aQ39KhZ1Oa+fC9R2+8jkVLRR1vFXSx/9pt7ksxnGgtC81zH7bGNAcOenVbvhaJsgaF1i6vK4Q7GzVCSgHlPdAd8AKOXWn57bPao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790567660; c=relaxed/simple;
	bh=7eF32BAwWvHa46hCkMDvszKhaveU1FL/Fi8VoTSqenk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Fw8q3n5OlzaNa8KnMhKYtGDpbee5TxktSyzITwhH1gP2EVBV+ub3M00fg0Cq/UEpEvJvHfxCEsbPQp0b1X21271mjyGgNQhhyR6Hd7knl6LKtgeW/RGcxB2pOLBGak3HR5l1Xk8CHaeCRF903ik3l/Tgckxy3tQNHjDrNXW05fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltGbGnUs; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltGbGnUs"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so24432375e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 20:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790567657; x=1791172457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5xVcdOiOb9J5e1Z54m87jRi8taiPSd14uPnyeRFY4qQ=;
        b=ltGbGnUsIcIYrnoLDVo15KOqWB0ydJFmGe7kj5SRbVnQQpCWqj0YaPvHugO0UofGzg
         0y5dR3t+QpN1628LK/1QQHaIPM5dytEUkG7asO1sv1ZJ12wt7VTB0nWGV/R+ZBeZob2P
         UTf/WNeMhuOwk9TZLxIV8W0VlOhyvXBo9jFkIHUPxsniOEjvBYVJ7LLZXdNptFOWLp9a
         AgtotddM/0elAAa1c+uivLF/H0bTSzvYyzqO2EXSZP0grTWi14KNoCKcfB0hVc3VjyEy
         NPzH32WVNKl7t8Kf9EcoqFK82jzwVaYzOMycYNuBHcnNQGFtB5WRP/iHuFluGdk6ykke
         cZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790567657; x=1791172457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5xVcdOiOb9J5e1Z54m87jRi8taiPSd14uPnyeRFY4qQ=;
        b=RKFDba1eK6a6cKCnjh32vmenGqBAabqM5WisG8Ze4Ul2G5jW30NHMpSVuhKk7GDZYx
         JCwba8HE7DckLpIYGMf0xLdiuGB+faqF//gQsDSy1OXlVanZpHqScN734SV69vR4hyoX
         HqpM5oY0MstOirQetss9/rtTSPyiAiw+ql2AHmpkmVQR3tyOuBpPOGEDRUGt0KVgdeA0
         XpGJ9jTDLK3zi43fx2+vTU8zxiQqKS+Gx7KUe92yFIPJyQJA/FBn5yLPhwgaGcB7qf9x
         jC1t62ZxFBfrypo0s/x8Gtd7b23JPdTJS6ZV5XCiK1prTSlXSfmUD/96zaSZ2U0Wed4w
         F9IA==
X-Forwarded-Encrypted: i=1; AKwUvBwwoRnYJsg9mU82Z38kTkOUPNnyNArt5Jgl8Src1IJy9x8B3UeMp1Eiq2yi1knKcRHCfW7bp4KXLQeqXv0=@vger.kernel.org
X-Gm-Message-State: AFuF++kcA6DZJTSTuhsZN0+lfZOXGlLKKK1GvOnMhPDCYRNKKvnqjpee
	AQwLgiiVjxv2XThmgAm/82A/ZHDB8v3R0N4Z5eMfgvEEkubzdv/Mg76Q
X-Gm-Gg: AYBFou3/fxGSrfnXs+6+icbmOqBounLEhRl5RnfZX0UVCU/RSJj5DmYKxAphe4ARoSW
	N1RhBE5ly6hNDY+zxGcfQFkgc9zhM3xFIiABnlukwdosaUjtDQK5pbKOs29dIau13ryIZXNAn5k
	w9mKSuSzHdhs4zQ7UszMYZTGaJpXCNSHtOYUMW0XM6WFPymSyIh53K5qJsifA6bCWSp1qC47h8v
	5C3BwOWXjUWrZusGKdeymn4p6Tko2egKc2OS04WP0dAnOxbA2kA07Z2NipDhmcWwgHDQtz7qeYB
	tkREcwffwFtt3KZAttAEB56pc9Lq26NUoQiDIBUgeP0VJLNw3eW7f+EzKojJCSJF7F+y3SAYFGu
	R0mBvDupmZaagYHIAFtGbqUk+8QWck1nLb95Nd9JI2XTrO1NURDH3cF3RSuZOTgF6pr3cQrlVH1
	Rh1lgbmNt3AHrDBrFIW9JiDGVZlg6SR2gF3odBAtyoFdMPfCblvzjLGW4n7dG68TBNsfAGXKRfv
	E9rsXJtElOfwIiBowRbCSbrB9H33AEswobAZwWuj6JhhDuwHjmt+EL0CtGPmOIQMJELKB2WXCs+
	dfNwD/wPCK3NbvwNJH5jG570XUwuSURe5cJ/jiplL9EM69nd/+tqgDTunvVr7DlO8XlIvQJJVuv
	RPXgRMQ==
X-Received: by 2002:a05:600c:4583:b0:49f:d087:6526 with SMTP id 5b1f17b1804b1-49fe670d05bmr227822225e9.34.1790567656854;
        Sun, 27 Sep 2026 20:54:16 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-acba-a601-4494-3582-465b-0eab.310.pool.telefonica.de. [2a02:3100:acba:a601:4494:3582:465b:eab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a007be0761sm6697185e9.3.2026.09.27.20.54.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 27 Sep 2026 20:54:15 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Marc Zyngier <maz@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Artur Rojek <contact@artur-rojek.eu>,
	Rich Felker <dalias@libc.org>,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] irqchip/jcore-aic: Fix lost IPIs on SMP
Date: Mon, 28 Sep 2026 05:54:08 +0200
Message-Id: <20260928035408.25871-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit bdf4e2ac295fe ("genirq: Allow per-cpu interrupt sharing for
non-overlapping affinities"), handle_percpu_devid_irq() only runs an
action whose affinity mask contains the current CPU. Only actions set up
through the percpu_devid request functions have such a mask.

handle_jcore_irq() passes every per-CPU interrupt to
handle_percpu_devid_irq(). The J2 IPI is not a percpu_devid interrupt.
j2_prepare_cpus() requests it with request_irq() and IRQF_PERCPU, so its
action has no affinity mask and cpumask_test_cpu() reads through a NULL
pointer. J2 has no MMU to catch this. The read returns whatever is at
address 0, the action is not found, and IPIs are dropped as spurious
("Spurious percpu IRQ20 on CPU1", printed once).

Pass only percpu_devid interrupts (the PIT) to handle_percpu_devid_irq()
and the other per-CPU interrupts to handle_percpu_irq() again, as before
commit d7e3fd658248f ("irqchip/jcore-aic, clocksource/drivers/jcore: Fix
jcore-pit interrupt request").

Found with a two-CPU J2 model simulated from the J-Core RTL. Without
this change the boot stalls with both CPUs idle shortly after
"smp: Brought up 1 node, 2 CPUs". With it, the boot reaches userspace.

Fixes: bdf4e2ac295fe ("genirq: Allow per-cpu interrupt sharing for non-overlapping affinities")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

Notes:
    Tested on a two-CPU J2 model simulated from the J-Core RTL with
    Verilator (J2 CPUs, caches, bus mux and AIC1 from jcore-cpu/jcore-soc),
    kernel v7.3-rc4 j2_defconfig with SMP=y:
    
    - unpatched: "Spurious percpu IRQ20 on CPU1", pending IPI messages are
      never cleared (the message word of CPU1 grows to 0x6), boot stalls
      with both CPUs idle after SMP bring-up
    - patched: IPIs are handled, boot reaches userspace on both CPUs
    
    Not tested on J-Core hardware. Testing on real hardware is welcome.

 drivers/irqchip/irq-jcore-aic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-jcore-aic.c b/drivers/irqchip/irq-jcore-aic.c
index 94c05cf974be8..b4fee02997eee 100644
--- a/drivers/irqchip/irq-jcore-aic.c
+++ b/drivers/irqchip/irq-jcore-aic.c
@@ -37,8 +37,10 @@ static struct irq_chip jcore_aic;
 
 static void handle_jcore_irq(struct irq_desc *desc)
 {
-	if (irqd_is_per_cpu(irq_desc_get_irq_data(desc)))
+	if (irq_is_percpu_devid(irq_desc_get_irq(desc)))
 		handle_percpu_devid_irq(desc);
+	else if (irqd_is_per_cpu(irq_desc_get_irq_data(desc)))
+		handle_percpu_irq(desc);
 	else
 		handle_simple_irq(desc);
 }
-- 
2.53.0

