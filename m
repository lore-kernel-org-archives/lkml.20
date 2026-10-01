Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E634A3862
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873535; cv=none; b=mPq2eKiM6Lm6zNffREdQ7kocuky0U+Baj2v/TPcY3+UsYIhYN8ItW6AhNKrgYwRDuBp9ZF+f4anKFnhtJtN9OOWoquGyf+yJGIIhP4BuydBzl7oFzc2uFSXwBEWZZOXHKhfJl3TNkOSYB1b5qbSYosuN5CM6OeDuivb51qH15ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873535; c=relaxed/simple;
	bh=YGepmHEEE28SCic71nixtmEJDhkQEownVeSMq//+6dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ifTeTobUKSfE1Qu3kxH6HIPQMP43ECBe74c2ZH5iL6BxNy4+n9RUjdoaCrXPfY0gnPqi6zy3ZEeamXV7GoVVgZ7KPcTGo24YyovhHKkZxawXdMmgJeAAMBHmDvlZnsI8goQkMkfWFQZANo0owCwht1QP7X/B3PczSKof+gTQxd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RzmLlBSY; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RzmLlBSY"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b00a0ac65so1277671f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790873529; x=1791478329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Xb6lAl/hZdRjzKQnD3UKmfHUlfFp2Vv7i6DL97ttMs=;
        b=RzmLlBSYbAbRVdIOZlIqBWbf3F7NB1jZEzGvpDlNn5Dto02cD++MorCI6FPBDQW5wN
         uU/1fjq3zsJcXWNfx5ZxrymXWREOcmv+Owud/1cTYsNMAlnYITKpLUjSds/eoN0F94Z6
         FaBPMzFVuPflDIkTNlEZ3xDPvJAAgygcAIrbIYlDDcubag7AsknmrzISX5aAxYtvyFtS
         JF+zGiw4BIaIXUD8sAEzI52tU9+vn9lCmlooVmZ85SA+pY7j2hDc9TyCLUuCYHp5EX+u
         3zHdZ+7H4+fJmrA65a91UiuPluVNQfL+6mZmXH0RcpbM1HlZIQoyYLkGJdRwAGxff/CF
         Ivrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873529; x=1791478329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Xb6lAl/hZdRjzKQnD3UKmfHUlfFp2Vv7i6DL97ttMs=;
        b=Nm6yKoiLX/5sslC2HazucCKX7KsbsEeB4iiHyn0rwx2lvSVf4udbu96C7cJVSr5ezy
         Hr39jqTy9panwQ2hJdsJxDVUkz+d1bY7fq9DhxeXozCSVDPhMUJtO9CP+9YVJdtAcLNa
         lSwb9zB+kyBj1CqFpi8tgQIR6OiU9ICrG1cfIQNzYc0SD8X1gsG/wN7d3OcizcGes9Qh
         mUcJu7VcGJ4HfB2dZDnyujKPEzpdUf51xQ5SQ+BB0cztQeMnZoosBAcrGPJCfeKytL8X
         3jDMnRkr7rb2GG/xJ1m0lgLShGDvzHo/l4SVE3q0kDdtE8yk0a6lOOY8e81xj7JM1xPW
         6Slg==
X-Forwarded-Encrypted: i=1; AKwUvBzN6L3znBl2IZtSKBalRGgINBRHFzLKZ+tuCFlggtyPpO921bKu2Pm05vtg5JQKHt0OC0LNGSe6osUBpuc=@vger.kernel.org
X-Gm-Message-State: AFuF++lqhw3lZTFtG3vUQhBAUyhRC5wBHHWHE8fxZBGu9cxTo7FlUbFJ
	C3PTP2f7rv1224G/pFtpbnVULDWfFfabYpZU9Pi2gr1+KIDrm/yH6qIy
X-Gm-Gg: AYBFou0pS/VKAWCLvr5lJ2hZjkgx4umQLPO1SfYD9D6JnUkRX/fTvp7IGmAYHR3ztE3
	8+SbHJGcYCYKCVhr8z3SzSnXOES1rWYO8ZZ1swmTIcd6Rp8yGfbYEfLfgDoNgeKAiWdbM3cjY7M
	VTJHWrcsxvSkM2CkybYfWl1/8qdNumddhD2WbGvblA5+sFNckkvCrciNoS+QmuxAVskx+HHISr9
	1moIChv+z2knWHEXRgB+CRHkgw/JL0tzQ/bzTLohhJM6eICgyrM4zTLQAp673I8vgw/VYy0kMul
	2jILxHwMZ6DZy1U77HbnNV0+b/v4idcyPdkXJ1WDKjqs+0v+xDrQk1LRJ+JMo26oVLx9OlXWPPC
	LYShfWlFZTYrAia4a3qdIkyqMzTUFi7v/Jqfg6XM2gdx0AIu9SCveEtz4bQj8oDjH2vFnhNCQS1
	VqdR6P6nx3HKQmtMavM5syY51IOJtrHutByWzOBwO02A0TMC1e2M+5hOV83QcJ5md4XRI03UltY
	pvHw0aHkzNtIQ4fTyViDYtnY6zCOr8bM/ENnMS7tWWW/56ZMeJ2v3vvQAnpxg/qE3nyo/dNsqGp
	bE4dL4W/
X-Received: by 2002:a05:600c:3e07:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a027585dfemr4054005e9.12.1790873529179;
        Thu, 01 Oct 2026 09:52:09 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027ae146csm480985e9.11.2026.10.01.09.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:52:08 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v8 3/7] watchdog: rzv2h: Drop WDTRCR_RSTIRQS define
Date: Thu,  1 Oct 2026 17:51:57 +0100
Message-ID: <20261001165201.763882-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

WDTRCR_RSTIRQS is unused, so drop it.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v7->v8:
- No change

v6->v7:
- No change

v5->v6:
- No change

v4->v5:
- No change

v2->v3:
- Updated commit message to reflect the change in v3.
---
 drivers/watchdog/rzv2h_wdt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index f247e42d54f5..4beaac44d027 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -40,8 +40,6 @@
 #define WDTCR_RPSS_25		0x00
 #define WDTCR_RPSS_100		0x3000
 
-#define WDTRCR_RSTIRQS		BIT(7)
-
 #define WDTDCR_WDTSTOPCTRL	BIT(0)
 
 #define WDT_DEFAULT_TIMEOUT	60U
-- 
2.55.0

