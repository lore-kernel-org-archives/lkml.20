Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BD43DDDD9
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792364484; cv=none; b=ZgC3kcJgua3qhCjN7zQ0y1gb3cdTLCByzIPckSn8+ZmvVSFbobeQGp6hTvAEM6Mc4E6asmXqL9L12Hx+g5wQqitHwG9eiZRVdmoNES+ytUtkuO+d545SQll/FQR2oD/rkx+0Xng2ZruE4dfKywh5PEhm2rTYSTRbzCAo2MbXE1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792364484; c=relaxed/simple;
	bh=VAAVgnyv25zFG+/2rW7vJvNefKZzWh2RCM8Fygu986c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JFvECqfogSp8nL6eE4WKaCwN6qCp5n+syRdMO/eWNoybZwrYMFKT1Epmoxlz3aaX1cvll3PICtyvBUJTpMDKk7ie9drAf81oVixE3xQKRIVFp1rFfGITJf4iZ4Cpd1XpXw9yGGvESzXRW/y7zbgktdJlaic/LAeRUGq1u+Ali0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHa/ttRs; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHa/ttRs"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so899654a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792364480; x=1792969280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wcQqMGsW7EjVun/qknWTz0LgUBV6D0ub+c+QzohLAeI=;
        b=IHa/ttRsvnLGvoh+eYDMfRE2GcpDB/qzcnbZkOL/KVgklSrwaXij1A7c44MrhxhGlc
         vo1qawANapIP+fC4qX9QnLKQC92B65v03khpMHpbZvSD1aeLX9gsT0e+Tb73BUMrb289
         ynACSgp6j4MQ1ydfSbu2NTDbqNm6k9mRu7gjy0KqbWbaBD/6yNldfzvFGx3wOw/WKkan
         Nn8AWJp/b/Lyic2G7jzeELqwW12q2II1ZrMaqtvvt8RjxfJ3iO9zTpv1T8tfLeeKp85W
         P0PZZrMrp6DMPlNU/Wa2F42ErKe+eNk/yI9u7PgWzRRFCeYIZv4RPGAzEKtadn/wHcvt
         pRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792364480; x=1792969280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wcQqMGsW7EjVun/qknWTz0LgUBV6D0ub+c+QzohLAeI=;
        b=hT/+TtX9BYE5EPYDoRPCRzicoiKPI397GCMuh8CmoZf6sG1Y2QHy7pORBms0EP4jzb
         NVc8UBLFsrCJO7DM/RLDForiF/51ZS5lrNoCBALL9v7234qkCLNMhWJ0RzrlOLbl1HXa
         zxNdxapIzXdTWEPz4O6rk60aoD5JUWnio5eQ55Dj6Oy2J3BohkC7mAHu+gOsguLQ8jQ1
         1v9KQCgPOiiPRo2NBJX905jZLQ11f2taQMjw4jl7c7sHURVufllJ+PYrFsvbtK7c1zJ1
         91jkIvuLWc+dwwyxC8glS3ftvuVxaAj4hVfUr64UNYFbabs0YbUHPvB4zknGd6BjIk4E
         c98A==
X-Forwarded-Encrypted: i=1; AKwUvBxDtmjD3gG5Illo44EVDrI6yVh3tWd3Nn9pPVqPr7rIyw10JUXCGUsQgam2Cr/+vSiK5F7oqV9Dn/H2E5Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCFgXHSl5erov3FC5qhlDruDv7MHBjRuMAqQcLmAoO/YBbRkWs
	9dQ/pXb7TgoeRhW0OXKRpM92zGNrqeuvjUXF+CtHVsnU8Aagcwf0NV9D
X-Gm-Gg: AYBFou2mHfNVZHmzsMBMQg3/jr/wLZJ7mxMuPt4C6ipf6kgRBQ1vr90Kq9Nt8e2PWxp
	RQJq5ILQg2bxWQ1lEV+5n5m6kpcDVrtWOJQYfn2wjUjKd262BR5lvHEs6fI2kDLHc0XL+lyapau
	u5IOCWknQoCRNuHLL9NihBJ7fTmJeg4DCgyN2jQ+rjkklZv6+xAhZ3/5PiX6h487M6let+03gPs
	hf0C1C72xJDgvetxKcxK1EAxMsR9NMQ9iG8eXRmYd5MDeSQKDvLCjRqpY0u4v5WnZ0LvRImrRAk
	pJSRsORoL3kktNv5fO9+v9OZQTqg/J8Rnrzo0CVKu656XYZQsgafoXPJJeFODfuOutJSPjKbd+/
	2Ab9DR86VdN0ewN7HW/wAgesuCtruoLtUcbjCMCg4GV6j1i4aqphQutlDraWHAVrPFKrcnobKhg
	o4UMJfZRtS5RubWAmukDfl25oQ3WOqG0L+pEaGcOXSWoEuQvRYT4TFcX6JxnYoaycV9pSp1SHdw
	D3HwNsqt29KKwJLErCx/P4kq4pTtinrW665JHCOrFWaqevNobWUa7pfSZOh6pHwQGwjbSjlQlGL
	A3bRnZsbTHtvKHDosAjQefyHDk3xxu/Exu6GG87YieqMbKic
X-Received: by 2002:a17:90b:5743:b0:3ab:f38:2b3b with SMTP id 98e67ed59e1d1-3acef134c18mr5103166a91.21.1792364480253;
        Sun, 18 Oct 2026 16:01:20 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3cc73c7sm6831641a91.4.2026.10.18.16.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 16:01:19 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4] gpio: mvebu: fix Armada XP per-CPU mask register save/restore
Date: Sun, 18 Oct 2026 16:01:17 -0700
Message-ID: <20261018230117.23497-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Armada XP variant keeps the per-CPU edge/level mask registers in a
second I/O window (percpu_regs) rather than in the main GPIO window.
The suspend and resume paths however read and wrote them through
mvchip->regs with the per-CPU offsets, which hits the global
GPIO_EDGE_MASK / GPIO_LEVEL_MASK registers instead. Per-CPU mask state
was therefore lost across suspend/resume, so a level line could end up
unmasked behind genirq's back and trigger an interrupt storm once
interrupts are re-enabled.

Use mvchip->percpu_regs for the Armada XP per-CPU mask registers in
both the suspend save and the resume restore paths, matching the
mask/unmask handlers and the probe-time masking.

Fixes: b5b7b487431b ("gpio: mvebu: add suspend/resume support")
Cc: stable@vger.kernel.org
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v4: rebase again
 v3: rebase again
 v2: rebase
 drivers/gpio/gpio-mvebu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index c57758019e92..03e977c2a629 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -1028,10 +1028,10 @@ static int mvebu_gpio_suspend(struct platform_device *pdev, pm_message_t state)
 		break;
 	case MVEBU_GPIO_SOC_VARIANT_ARMADAXP:
 		for (i = 0; i < 4; i++) {
-			regmap_read(mvchip->regs,
+			regmap_read(mvchip->percpu_regs,
 				    GPIO_EDGE_MASK_ARMADAXP_OFF(i),
 				    &mvchip->edge_mask_regs[i]);
-			regmap_read(mvchip->regs,
+			regmap_read(mvchip->percpu_regs,
 				    GPIO_LEVEL_MASK_ARMADAXP_OFF(i),
 				    &mvchip->level_mask_regs[i]);
 		}
@@ -1080,10 +1080,10 @@ static int mvebu_gpio_resume(struct platform_device *pdev)
 		break;
 	case MVEBU_GPIO_SOC_VARIANT_ARMADAXP:
 		for (i = 0; i < 4; i++) {
-			regmap_write(mvchip->regs,
+			regmap_write(mvchip->percpu_regs,
 				     GPIO_EDGE_MASK_ARMADAXP_OFF(i),
 				     mvchip->edge_mask_regs[i]);
-			regmap_write(mvchip->regs,
+			regmap_write(mvchip->percpu_regs,
 				     GPIO_LEVEL_MASK_ARMADAXP_OFF(i),
 				     mvchip->level_mask_regs[i]);
 		}
-- 
2.56.0

