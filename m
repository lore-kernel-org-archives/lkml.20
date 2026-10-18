Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B403B4E8F
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792343145; cv=none; b=fJoBWYjEhzU6+OGy7PzbdFu0KfNjHr7kHrITT39ILaegex455yBH1wxMhO0g7aYiotI48LtS0ddZwTm8wO0oXkI3dP8lPN9MmzuNnDt9i93fu2vgC5Kl+rWWIW05yoRN9ojuadj/SaqUj9ktqz8MNls23eBA1tqeZjMYzaLaACo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792343145; c=relaxed/simple;
	bh=so/mFx2Ao2GsJpBhafP1pe9fktRMxxMEgCjCSX2y/b0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OHDJzLtIh4dP3/MuZZq2FlgdloXe+Zu6fRD0F8X/YeZSNhZRtsRVmoaB2g/xv2iLAdRfZEuI6p5XvJB5jW13BBKHllM601u5KUjSesIZtIIP8L3i5h9eKx0I1NJC/lOrUPhYwcr3zhCeOcZ/BgcwppiagkHU8TQCtnQNHb+csy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ney9zHCt; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ney9zHCt"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e95bd1c14cso11261435ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792343144; x=1792947944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3W+MZb2eOKpPBttwcKlbbD/WfEQPKdgJ9KWbT5a3vI4=;
        b=Ney9zHCt6Np26Oj79AbYEf6EmM7tOjGQZspkshvYeRUnpymI7l1W/8j/J7T7tzEO4F
         DeSxc7Vdx0jaoYq9Kgv0Zn+Pwq/4iWJhRk8FhBLI2H55SL7zC0SdZZCiJ7HF8XCCrc4U
         TLu2eU3EEhaEu3McMEi3fgNVTHzaZWlk/pGuhFsaD12XlnObXtvIGTwVt5MafAnYnKJC
         ZqEMuPl10bqJe+YRsSJfFfBdBq6DufdMwJYnJI2phew7/P823EE+Krk0TzyiMEbRWJQl
         eU4RH5VQxdOmyAi4AdZkwfhnLpUpktsDGJGsloN0Me0VkPgRQh8bs/8ALBht34gRY8+X
         R4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792343144; x=1792947944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3W+MZb2eOKpPBttwcKlbbD/WfEQPKdgJ9KWbT5a3vI4=;
        b=n4eJHViyIZtmQj92H5Zl0A3k/odXwvK2TPPWRzOEDZSTEHBKsI7G+IkJ6aFpBTZUqT
         NNMmM4tB5XD9bBXGp/Ms7Pq0CJjxugLey42NwEPKl9M+Jhet/eYSjWoe45xdwv4auNg3
         pm+xOkQGuXaSDXkvNp1F7O6RJGnzwft/6s3RdVnJ6n2ObzqUqoGo0Ifd00VO7DN5ZzEo
         SpZxImV2u4uI0xQ+vb+22g31FonZjfOWSFwQQCVLCvBt7RxW3hXrVEPwzagg4Uwa8/lt
         M9w3NhL/eJigYx578lUgl2aDUJhV4Q21NrsziLnY4MYctFO1405Kf8mVJnQDGkMWM8ek
         0NAA==
X-Forwarded-Encrypted: i=1; AKwUvBw4G+v7FXTsNmORn/ruZ8FTyj8G8lrljOO1EjKEfjgehucsSpiF3sWrv+ymSTrCew7FucYg5quP7LjK8PQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYImIkUmmXzH5WwgFtmoaLKqlNjIVNCHIq1CsdM24NlT8vWGPDLG
	Vzoq1in/+lWzl1ab5ShHNJg4PvoFRme5UyezAaaCDjg4UPM7eR5cNH4j
X-Gm-Gg: AYBFou03Ts1TAh5L4uaa/Zw8LrKdH6P34d5JjW2kYSMnB56KRZGpZajtV1oqULpb8aj
	5CKdWlo53E6hTRZpNrPKKOvvceargQqXb8vq73DtW2EU99jclC1LurY0XoTzLen7KB5OTb3QA1Q
	MRDcQYxs7rd1W8VqyIS31NwkCOmY+c6A8oy30boYZgbj1ca0CZOrviDojz05vsLVYXQ2HhdtA1Z
	jRlLbsoerxjHzpwF5L3r4XZHRfEFDv1DCqMCrvd+sgD8Qy1M5ckZjgmD805wkUSOqi3L9RvO6eJ
	Vxb1Ft0l8Q4DUngOGSqZOjQJfFMV5rbgBehiSnJ4SLqKghZqLhAQG86swMcBABHNC8gqvvH8we0
	fhEg8xiFhVstIILYgU2m0Thli0GJCEOtmOaIwFV12YKpfsH58V6Z5Q3d5lfDvQVjOli6hOxnl1r
	RYxKVKZGhn+OCGFp/jwfbMc/+nVkNsegyLPH4lGh/Rbjoz0RUtYqSqr2AtcsJvvQQdqv1lQ2bGA
	B4wDAdVTONoYVPzncjtFfaGEjIhBPsYkM0jg36wVaSO
X-Received: by 2002:a17:902:db03:b0:2e9:502a:ddbb with SMTP id d9443c01a7336-2e9a6c201f3mr47934555ad.45.1792343144127;
        Sun, 18 Oct 2026 10:05:44 -0700 (PDT)
Received: from obadmin-Precision-3680.atlascopco.group ([167.103.3.1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8758efsm28757625ad.55.2026.10.18.10.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:05:43 -0700 (PDT)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: Keerthy <j-keerthy@ti.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Devarsh Thakkar <devarsht@ti.com>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Aniket Limaye <a-limaye@ti.com>
Subject: [PATCH] gpio: davinci: Clear interrupt status in every bank on suspend
Date: Sun, 18 Oct 2026 22:36:22 +0530
Message-ID: <20261018170622.3406158-1-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

davinci_gpio_save_context() saves the registers of each 32-GPIO
register bank, but clears interrupt status only after the loop. At that
point g refers to the last bank, so pending status in all preceding
banks is left uncleared.

Move the interrupt-status write into the per-bank loop so that the
existing suspend-time clearing covers every register bank. Single-bank
controllers retain the same behavior.

Fixes: 0651a730924b ("gpio: davinci: Add support for system suspend/resume PM")
Cc: stable@vger.kernel.org
Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>
---
Testing:
- Built an ARM64 kernel with CONFIG_GPIO_DAVINCI=y,
  CONFIG_PM_SLEEP=y and CONFIG_SUSPEND=y, containing this fix alone.
- Booted it on AM642 and confirmed all three DaVinci GPIO controllers
  bound, with an untainted kernel.
- Validated the extracted save-context function in a standalone
  userspace harness with simulated write-one-to-clear MMIO, using one
  through five register banks. Verified that every bank is cleared
  exactly once and GPIO register and bank-enable context is preserved.
  The unpatched function fails clearing checks for two through five
  banks; the patched function passes. Ran the harness natively on
  AM642 and under host ASan/UBSan.

The suspend callback has not been exercised on the live GPIO hardware.
The regression results above use simulated MMIO, not real pending IRQs.

 drivers/gpio/gpio-davinci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index cccbaea1dec2..fc2b9bef7efc 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -611,10 +611,10 @@ static void davinci_gpio_save_context(struct davinci_gpio_controller *chips,
 		context->set_data = readl_relaxed(&g->set_data);
 		context->set_rising = readl_relaxed(&g->set_rising);
 		context->set_falling = readl_relaxed(&g->set_falling);
-	}
 
-	/* Clear all interrupt status registers */
-	writel_relaxed(GENMASK(31, 0), &g->intstat);
+		/* Clear stale interrupt status for this bank. */
+		writel_relaxed(GENMASK(31, 0), &g->intstat);
+	}
 }
 
 static void davinci_gpio_restore_context(struct davinci_gpio_controller *chips,

base-commit: ac46dac1613a7c971e28e16d3a7a6ad4b1ae6c5a
-- 
2.43.0
