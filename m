Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDA748DB4B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792174607; cv=none; b=Gqx9CSNRlhQj/KEj09BVbh40GslhNP6iXr8yqJgikcuGaM+dMlpJLtON6PDeFNYjVbs1ygM3tYM8WjnqeqtVPEqZyu3gk29Q9/4PaC3GYY8eumQF1Hr3T+EIkA8lAtqCAYJdNr3vPcJwvH1j80P6rEM6W+VywL5/ZJ8qLsaFaPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792174607; c=relaxed/simple;
	bh=DqflcV/RqFAj/t2vSgmqfLJY75Mk5JB6YjJ7FP4DcN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iJ7iLWcv/0Iw6ZaIb7x8TSrKHChIKt9JCjbb/lOySaI1vrCs7ICx/kwlEtHwBa0aanTWXewo5i2o286WqufydH+OV7L9hufGvXjhWKl5D1BxcSfoAuom0fV/E9TLCgUBKX+gbqbwoq1IzMsolMgXTV7yMumBXu5ar8d07FaGq4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gEbQLhPw; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gEbQLhPw"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35f1f76ea84so278625eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792174603; x=1792779403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q6dRr/6E4CWwavS8NI37Pzp4k4CwPuNJ3xuBxfSy/XU=;
        b=gEbQLhPwDo3lq2pRyC3ShIi9C+DKmcH3qtndN51fE1sswQS+1J4s5eAO0WY3+qqoH9
         c7tTS+kBXobd1cWL1ik2Ttt0R2SWU3vdGNSUjDJEJXvON+L3Os5p/VVjHanHfRPVme1h
         8SL7ibAbZc5FnIbxqq2ljdEgqJKFj2hbsJAB8Rob6RJTqmOKusETinkvCEF9dR01MBSO
         2DkJO4RwLayuT0iXUyaiKKmRxwm3N1RKLgkuCBlgy5vnKh9euq0k9zS6a5GAl0hAQVnL
         eQLeC7yKj3owjzbDNBFM2t3t9ASFCJuWR1InspXmhK1ufnoiiTb6hCtALAnQ3xV/P1LU
         FhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792174603; x=1792779403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q6dRr/6E4CWwavS8NI37Pzp4k4CwPuNJ3xuBxfSy/XU=;
        b=nScS3R0GCiC2/YlZliRrnmV+lpLr6+9fCo5pDV3EXGlZO9NuRChF8ZNmaALNuKI+K8
         yFWsfqhu9IDmb3n4xEyxb4F/8F53TYi/7PS1gZTZSSlEAo0hR3v8riGamoqFak34X6p9
         qFFTLbGsEbJzRDGjHvYwn6kYuvPd4kpF5JIDIks1ripggnYvyzu5omi/wYqhfz9GcZKh
         eE/hLVo5vbuLJfBeRrSps2oMH0HgorgBvoAFX8IZVXP3ZMYUlcHeHZAqf81ABo+/L5GJ
         1qRldGMUBtUPPKWzWsJPsYskjsoEeqAiT54t+2Kg5ElK/HAv2HILP4DREZUgG5FhKh3t
         Iq1Q==
X-Forwarded-Encrypted: i=1; AKwUvBythZYZzYXaWE4mVNF6QOXTExImli0KwgA8HM4lrfXYgVorz4ct+Pb6NGUvyXZnvIKnbExVNVF7tNTVrUY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPWGHRnm2Z/qw/pGWtKQueFF3niKNDrdr2CBb/7fFM3ViHBl+s
	0Q5EmR0zpgHIdVKmtTMz1caZ4KhquJbEMddciO3leMmKkSo3VQ2bZrMS
X-Gm-Gg: AYBFou1H20YVZ4v4ydm4c9iUyNEgXIIie9iECzThlD5U8g6rY2x8jJ2sOQh4GPbat4j
	vibA38d74V+H+g4HBxKhKxCGrp6yCpNCiG7zpzEQqUqagkPuMHoN2soDffaI54/mPRyGuZ6brjS
	0GaUz0CESQshT178dBW/RobINzRPoBUHJDncupNu94YVRE+3rNYyJVgNGtAoCi6zyaiiCSiBgi2
	eaebDLfQQj+iGwXQpiRxcASJ7fodoT8j0KugBvIxS1qzI4vLU2vHRjE3SY1oNGH8HfBemA3LHcE
	xhZBcEwsSn2IowxnazljGABa4OsNz5qO/lXwkSpJwdj8/5dVeHnV/kkgyi7Dx74CTlPiOJcJhfh
	9FxkZvdgHTCp63TH5w1PP/oBlD55U82KMoDkn+nnH+vQIqIsb4StVpgifdv5EaTxBSXmkDjCrec
	2EcvsnUY+ZmCnJMDj5HQmK90YuBHhhWM1udunJ6fvbgY5mrNY8OZsbKgOIRusHBf6XnDsC6DPuM
	bDEN634M2X1qmLNHy8SxljP
X-Received: by 2002:a05:7022:170d:b0:143:3617:c595 with SMTP id a92af1059eb24-1850c223bb9mr852508c88.1.1792174603289;
        Fri, 16 Oct 2026 11:16:43 -0700 (PDT)
Received: from eldorado (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm11570790c88.11.2026.10.16.11.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 11:16:42 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: manuel.lauss@gmail.com,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thierry Reding <treding@nvidia.com>,
	"Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Dmitry Ilvokhin <d@ilvokhin.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MIPS: Alchemy: Register interrupt chips with the IRQ core
Date: Fri, 16 Oct 2026 11:15:59 -0700
Message-ID: <20261016181602.2152632-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alchemy initializes its interrupt chips through the set-type callbacks,
which use irq_set_chip_handler_name_locked() to assign the chip and flow
handler. This bypasses irq_set_chip() and its descriptor registration.

Since /proc/interrupts switched to iterating the IRQ descriptor maple tree,
the statically allocated Alchemy descriptors are no longer found. On an
MTX-1, the file contains only the CPU header and ERR counter even though
the timer, serial, Ethernet and PCI wireless interrupts work.

Register each IC0/IC1 interrupt chip through irq_set_chip() before setting
the initial trigger type. Do the same for the Au1300 GPIC. Keep the locked
set-type callbacks for later trigger changes.

Fixes: 171cc0d9eed1 ("genirq/proc: Speed up /proc/interrupts iteration")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/alchemy/common/irq.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/mips/alchemy/common/irq.c b/arch/mips/alchemy/common/irq.c
index 2403afcd2fb9..d2fa8731fb3c 100644
--- a/arch/mips/alchemy/common/irq.c
+++ b/arch/mips/alchemy/common/irq.c
@@ -892,15 +892,21 @@ static void __init au1000_init_irq(struct alchemy_irqmap *map)
 	mips_cpu_irq_init();
 
 	/* register all 64 possible IC0+IC1 irq sources as type "none".
+	 * Register each chip with the IRQ core before setting its type so
+	 * the descriptors are included in interrupt enumeration.
 	 * Use set_irq_type() to set edge/level behaviour at runtime.
 	 */
 	for (irq_nr = AU1000_INTC0_INT_BASE;
-	     (irq_nr < AU1000_INTC0_INT_BASE + 32); irq_nr++)
+	     (irq_nr < AU1000_INTC0_INT_BASE + 32); irq_nr++) {
+		irq_set_chip(irq_nr, &au1x_ic0_chip);
 		au1x_ic_settype(irq_get_irq_data(irq_nr), IRQ_TYPE_NONE);
+	}
 
 	for (irq_nr = AU1000_INTC1_INT_BASE;
-	     (irq_nr < AU1000_INTC1_INT_BASE + 32); irq_nr++)
+	     (irq_nr < AU1000_INTC1_INT_BASE + 32); irq_nr++) {
+		irq_set_chip(irq_nr, &au1x_ic1_chip);
 		au1x_ic_settype(irq_get_irq_data(irq_nr), IRQ_TYPE_NONE);
+	}
 
 	/*
 	 * Initialize IC0, which is fixed per processor.
@@ -947,6 +953,7 @@ static void __init alchemy_gpic_init_irq(const struct alchemy_irqmap *dints)
 
 	/* register an irq_chip for them, with 2nd highest priority */
 	for (i = ALCHEMY_GPIC_INT_BASE; i <= ALCHEMY_GPIC_INT_LAST; i++) {
+		irq_set_chip(i, &au1300_gpic);
 		au1300_set_irq_priority(i, 1);
 		au1300_gpic_settype(irq_get_irq_data(i), IRQ_TYPE_NONE);
 	}
-- 
2.53.0

