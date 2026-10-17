Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE1E33938D
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 14:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792246093; cv=none; b=SAe7e32hUsBX/7z1TFdoEh408rAeIHIwHU0vVGcARXdBQ7qE/UDievScO9pDf4oGKDdGpUgtQR383LVpJszXZf7j0j1BmMIoJcR7XFptswCoFzzjIaBI++x5zqNBf5O7fiWoFKizE45rISlZN66XkusN2NdgyMx2OPWenxRGiL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792246093; c=relaxed/simple;
	bh=c3zAGnbXG00dTHAYCXYMyd4rQBtIZC6Bxn8dsZvWsHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Evfx13hpdTcpx18Sv5xQxm8MPutujOl3mE6+W8K/GhC7girAO0/icBC1PIISYMd6lyeBFAoqnwjsWHAyAtxr7L/3+dfFUfXMap/7vjCz7MBisbSb3x/TlVslICRl00d7WzLuNA1PIDO8c+IT7T9P1/HEo5HbwPMFHzgGp64S8pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiIlhsU/; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiIlhsU/"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso1905648eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792246091; x=1792850891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6GqqVEdUv42zaBEqCnBmiwK+siq8auSXn02n9bIP0WE=;
        b=eiIlhsU/AqmxCJlhtHep1inxoRnfphOw6lDkS8Z4Q+y+ZTln8ZWrnnQo2djTaN01T7
         BW26+KI5D0casQPRe9DeNB6meFk9zQYx1b8aCiyEK82WhMZptullnxjdrmLCqaAn/ROC
         8aUsVnJ9wec3PcuSCdHzRroCdthvWZSUvBedvLWSVnellKTezrKWFElWfPe/qlbhGQjC
         9QgOrunTN1fEIxM5IVtUKuLY0WaVsy1dXtEDuFEDJ76fR5NFALl58P9WgMkrP7Md6ZO4
         JFTUAJDZqwlkSfYwpLQsY+YSqBYJojehKp7Gv93RIJXmO9DuolvK9gaQPt55g9ghy81Z
         Jdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792246091; x=1792850891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GqqVEdUv42zaBEqCnBmiwK+siq8auSXn02n9bIP0WE=;
        b=ysoSRdpQa65LvFqThDumvOvtwqm+itW29e5Q7tRwBEwJO/dcfbgrJqS//eX48EKx9N
         vjfJR3nSWLhotBcy3WF6EJQ3AMvG1AdIlb+1/BdZg84Qh5I2nTfWtxEYJZuRSwMevEVv
         b/CvplbNvsTTMlvWHdLHLtgvNvitRmXK0EL3vOoRByT2ZgTB6SLjLgAq1e+a0uJssvId
         dtWWkJNHJMmFtQzfIVW/7NswTZX4q17YQnvfgiNLmjDxwMphBu+0m9nwtkOmNBKF4Vmk
         jZ/jo6yVpFLD7QMaJNk8NFwR2/fuGnk6CKZsSJeKzHkc+Nnspd+l5RQvQdlKPQTddnVk
         wqag==
X-Forwarded-Encrypted: i=1; AKwUvBzzvNQyBo0e2YC1AM0xb8jR31qBsXcYuxTGhTi1rgODoyoxaRuVlGbLhrKZboo5OHj4qLS7xaqUU3StrkY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKINKWjAcNsgaESTB6wKUi5EDP5XH7Ab8pvA2zXMqgzxENbyydm
	dmfFK8z9kS5VqsgtKZAcjvdIb8PE2Uo5NyS6LdFYkADRp2V2iuTBR3VZ
X-Gm-Gg: AYBFou1o1h5jhFRDSl62EtFgPv0FH2cEwwVTGLjWqfoRVZB6SjFfWN8X/GZLPvVWJpZ
	Th6Nnw+Sn303v2H4cs7DQffC7FBxj3ZhYhrcpuELOdoveSZZjvZNhnIx6aKT8yLWTXD1ISm0Ix7
	jOkA1BI2nM2S/Mukuo6Xs4sCa4HQ3q9dJw89qOVrIdKgo98b+9sY9rSpFMsbmKHf96W1NE8ZkKc
	+cw8XoYn/XsqydSzQoERZ6zQs/PVhuRk/1Ms8myniGrYwEjJQ8bJHI7jS87OSb+Uh8ZeBxqBYcn
	BZiRSmDo/ldfgbfIuRUljsuAade9DzAMiWRLaGnTxAN4QNHCErT8q4nlf/44Vw10ii6ZUr+gMBR
	9Wyjkc86GfPrUBTAIinrIgML1vtHxaxvd7Kslc/ZHii36vbxm6XvlV6QTiaRQXW2tMjbp7o/hNH
	sCeo1o3fqQ4rhQyaxVu7ga7vFAZ0brFz4FD6y5YrG4YgluWNP4Q6F6L2SVkTppWpTnJFTU0+lZw
	cB4aSrKWCxVJ3TXGyzg/6OfsNBke9OiYTi/X7TQ+6AXdbOS1KV9YWX3Jd/lefUhZzaU2MA65NC6
	S3vrNE4oLCbwvqN6J4P8+gcUrdu2HTEXQxFZc/cGbaVV3N8lq7zSvg==
X-Received: by 2002:a05:693c:8943:10b0:351:4a80:d94c with SMTP id 5a478bee46e88-361a2054e07mr4084483eec.21.1792246090528;
        Sat, 17 Oct 2026 07:08:10 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a02b8sm17766277eec.17.2026.10.17.07.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:08:09 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Guodong Xu <docular.xu@gmail.com>,
	Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Alex Elder <elder@riscstar.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] reset: spacemit: Fix the RCPU2 PWM reset registers
Date: Sat, 17 Oct 2026 22:08:05 +0800
Message-ID: <20261017140805.3278709-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Every entry in k1_rcpu2_resets[] uses RCPU2_PWM9_CLK_RST, so asserting
or deasserting the reset of any RCPU2 PWM from 0 to 8 acts on PWM9
instead. Each PWM has its own register, RCPU2_PWMn_CLK_RST at offset
4 * n, as k1-syscon.h already defines.

On a Milk-V Jupiter running the vendor kernel, which uses RCPU2 PWM2
for the fan, the RCPU2 registers read:

  0x00: 0x4  0x04: 0x4  0x08: 0x1  0x0c: 0x4  ...  0x24: 0x4

Only PWM2's register has its reset deasserted, which matches one
register per PWM.

Use the matching register for each reset. No in-tree device tree uses
the RCPU2 PWMs yet, so this has no effect on current boards, but it
would break the first one that does.

Build-tested only (riscv defconfig, W=1); the fix could not be tested
at runtime, as mainline has no RCPU2 PWM node to exercise it.

Fixes: c479d7cf06c3 ("reset: spacemit: add support for SpacemiT CCU resets")
Assisted-by: claude-opus-5-5
Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
---
 drivers/reset/spacemit/reset-spacemit-k1.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/reset/spacemit/reset-spacemit-k1.c b/drivers/reset/spacemit/reset-spacemit-k1.c
index 8f3b5329e..dbd783c13 100644
--- a/drivers/reset/spacemit/reset-spacemit-k1.c
+++ b/drivers/reset/spacemit/reset-spacemit-k1.c
@@ -154,15 +154,15 @@ static const struct ccu_reset_controller_data k1_rcpu_reset_data = {
 };
 
 static const struct ccu_reset_data k1_rcpu2_resets[] = {
-	[RESET_RCPU2_PWM0]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM1]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM2]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM3]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM4]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM5]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM6]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM7]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM8]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM0]	= RESET_DATA(RCPU2_PWM0_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM1]	= RESET_DATA(RCPU2_PWM1_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM2]	= RESET_DATA(RCPU2_PWM2_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM3]	= RESET_DATA(RCPU2_PWM3_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM4]	= RESET_DATA(RCPU2_PWM4_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM5]	= RESET_DATA(RCPU2_PWM5_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM6]	= RESET_DATA(RCPU2_PWM6_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM7]	= RESET_DATA(RCPU2_PWM7_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM8]	= RESET_DATA(RCPU2_PWM8_CLK_RST, BIT(2), BIT(0)),
 	[RESET_RCPU2_PWM9]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
 };
 
-- 
2.43.0

