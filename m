Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793017612;
	b=SEXxyx2BlbdGwNXss3y2e+FWt8w5fruqoah1YN5PZ2bIDSlCpxFYrM8cTJS220jjjl2A
	 W9l7kfBtm9L2lF+6PA9wFkrFUWLvWmWAz5P9jdSc+vDWkS5OWScsTpk8RtjS8EsIyZknX
	 61j60AViWRqo5x61bMh5X2fKGpKn2AORj4opYa9DKxmD2lW1R9BYJe5IxbmnG6ldaOtQ0
	 4mKRJr4ssoRqH24rzNgbU3bGGepfckVY5pYY960qeWp+9xUnw/o0DzQcT92S7r6cBHswi
	 DBKvEcwwpbjPhrEdOEjzLbrM4UAmOfX6vBOYQUPw3WZLAC0r1vRADEWHAYP9t4k7OYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793017612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gL3nVuT0zGnPNm3LgLYm/ivg3jkt+ECKsIhuLzMhEdI=;
	b=BJgXYr2KRSj8qb9JeEW/Nfhds59qQqXAPYPIRkI9aoAyS7I3v7YX7u4G2fnwkuol0RMe
	 O5nGxz/dSy81Iydv2SkcjrkHc4Ps/kCdXsMjVA87TCcJnsqliKGB/zYibsntN2aO6aSRD
	 VaVAJMkj/IrC53r+rOlSnCknDeyf2RSFInaSWAvvM9FiJb22kgADNO483Ni8xruHqTdB8
	 iEy4lKL6CuFBi7nCCFUhcCJ9rdtDluZ88O1r+P/Ge97+FJZmirkhYCtglE0ExoEKUWubn
	 Qg8dDE8/cL7P+zfjIepaTQ7K0ZIC+VkIz5GqniopZUTVnf5sH3sq7CGGUVrQJr6mQOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jYqzmHUa;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3989606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3989606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jYqzmHUa
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c45111bebso1311370f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793017610; x=1793622410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gL3nVuT0zGnPNm3LgLYm/ivg3jkt+ECKsIhuLzMhEdI=;
        b=jYqzmHUaTFidnQiGDd6GJ1yixEBci6XwVVdLrqIAwd5UOY+zTVzpopZn8FaDhjOBah
         Sr6XpXo4W3blbckA7f7bz3q/qODbAauETj2KMMlH7ViHImpVwZMx3GX6/TQWuJZuqHDN
         h8xnY5BOgwmBpiaWkZ4o5ZzcSzsAFqxDcsmnwcHVFb73bw7m38RMnzrOPtQNjRDX70g+
         csUxqxgpnh8K778nAClqRWpRGimp3YKyp5pVlaRqGPi+4/IBpbk5hkOGmAijCgALHUZ5
         lYMREsZPzO0gzyx4cN49URVuj1wtay7obE+b77bLRWU1nIv7Ma191X5flNLsRnbRKee1
         aukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793017610; x=1793622410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gL3nVuT0zGnPNm3LgLYm/ivg3jkt+ECKsIhuLzMhEdI=;
        b=Nv/saPRvQLRNoWk7Ms0P5QIxCUQF1mh3ZQCouSzkLcnNj4HglcY+3II/jqmHnsK9S7
         Fi8OvZv8rfK7U6qvEagnuyyH1zJwQTA3/TJp99G4XYI8RB7IZO6EKyKiyGYQOYD1trjK
         mcu8QaOdNck7d3vL2JwF2ztJrCUwRMCm05yosjgfdXLYSkS/jKVvGMC7D8cdtkM4LrE3
         zqlQfZGydV45K4W+LekfTzM75yq1gj9bfwybs7++mUAu71YdaliaNQecyDcj8HBA5kj8
         Fvh4/Y3ixxHe5wV6BBARQeJKodTaD7zB6E1vGFceeWypk6viyCrLfb2uesif36V5Fcgm
         m4Tg==
X-Forwarded-Encrypted: i=1; AKwUvByJt2E5oPn1geU327rnq7bKzrQIf7TLYU2UuCouzqpolM3TMYsPzfjAMS0KrAqjY0gcWd5tZNYTMq4c75w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIZU9HUGrRT6yMZhu0R6AdNIrryttkgU3azLABN+QxCLnqdvPV
	sfRNfjY4zXJkfoGj6nYcIdcyuym3+VlP5Ate+yGQsftYj6l5G/aLT/uC
X-Gm-Gg: AYBFou1A8G9KtrBwR+kwET/AGpjmvZpgMqBnvtMEvY7RNgh+zqGhEFbX4L9zlgzT+Pl
	40WVp40yCkpTGb5H3PzdWwhpzrhSOWNnetn70B0f/rD2xVMcm/pZyuUODp484KcnvjoS6anocAb
	GWIXNGMz2rvIm15zoWeaZFAzpDriYmfJrgMSnv7bsPRc9p6cfvuLkc0gVqfceI8YIqO0cD84Vh9
	0RteV6Z8BH4wVaC9v/+ab8D5f4DuVY3cVrVxUcxg8+oS2zmHyu2opDxu6XaIyh4qiDg6mzkprWm
	Be/IdChxHtQPde5ZCKFGXdyh+Xn5qPf3zpbnO5b3UqDADmFdQXqtd54ZcenLp1eF2PGbqmW65kM
	AvPGBdN8b7xTOG+23uwo+blM6fLdIkvF8j7KabW32rtkUd/6/teM4/NSQCV3AEIjkYqZXkihOV2
	M5a16zVI/T3DOkKhcqH70UBBwEVISw4LrCGbft53aTFHTTCLx2P/RusmSLuQen5BYWmjnVRVp4G
	amnoRAqMYNjwbAo5dGfELv1jaTDV6HEAbGf9NaZ+JYliapYBr3KHc6lKgJ+8zr5Q1pakth3
X-Received: by 2002:a05:6000:24c5:b0:48c:69bd:e971 with SMTP id ffacd0b85a97d-48e3eb859dcmr12177313f8f.16.1793017609862;
        Mon, 26 Oct 2026 05:26:49 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:4409:7786:c809:2fc3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f25fsm15792342f8f.2.2026.10.26.05.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:26:49 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Bjorn Topel <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] irqchip/riscv-imsic: Report successful hardware retrigger
Date: Mon, 26 Oct 2026 14:26:42 +0200
Message-ID: <20261026122641.3292904-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imsic_irq_retrigger() writes to the IMSIC MSI register to retrigger
an interrupt, but returns 0. The IRQ core treats zero as failure and
may schedule a software resend despite the hardware retrigger.

Return 1 after the MSI write to report successful hardware
retriggering and prevent the unnecessary software resend.

Fixes: 027e125acdba ("irqchip/riscv-imsic: Add device MSI domain support for platform devices")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 95ff76e63a69..5f72b2a80887 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -61,7 +61,7 @@ static int imsic_irq_retrigger(struct irq_data *d)
 
 	local = per_cpu_ptr(imsic->global.local, vec->cpu);
 	writel_relaxed(vec->local_id, local->msi_va);
-	return 0;
+	return 1;
 }
 
 static void imsic_irq_ack(struct irq_data *d)

base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
-- 
2.43.0

