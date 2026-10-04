Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DF43F58D6
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 18:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791139619; cv=none; b=lxc240ZoaMZUslKbm9IWeNXVMN6X6YYltUy7zGkjW+avc5vantLF3X/gJxFSTChPuQe8A/QZGKoySKQfR/edMs1vENmawW7tdgEdvaSHyxF/lU9ZCeBrr/hKywxZkCUQfr52yT32WpR/h2teq1f0MIZjuRYDWh3mnAPBSSQJBlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791139619; c=relaxed/simple;
	bh=BRr+vwdAsf32XFj/ye3s53koPgv7dr9UfIumPRKd20M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WR0pIkqWNNMl27U4mYdmX6hu7jiAAcRBUP9wEBNufz4pOgKSqhotJ4ywTbSL5YK43C/0OPRovDkfZn2pXcBItGcM+gGjYt2q66dD7zsrbvseV8prtjyhCsA2UKy9JkTV0O0aEsNe+7n4QIFXyVL+uPzjpSWgXxG/T6oOmGC73zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jVD/AjqA; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVD/AjqA"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so10788475e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 11:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791139616; x=1791744416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wGE1OXJENdmlXxvOEniQC7H7TDqRf95SbseW6xkxfxQ=;
        b=jVD/AjqA/fJkvIySOX5sctn3fZxeVMlXCjdloPPDJEqi/t0QBZsvUCqA/Yp5AS7hpd
         26r8G55r3bPLzRfwu+stY7QDEfVgea+if/kLUbeYl6h1ojp8jlfoGjPA5Bo3+mTbGoba
         C82DmepPwqHYM3fAIigz7cFzNO2llkAVGhKp9w0EkpldhdpIuK17DfY+pfuMyysJOKCL
         hyh41ZpMVgjouyIQc/yJL0ZWnyQYmv4ebmsG39HQSH2k5MUTv4eJPvpRx8qFt7f372p4
         9AJZzTzffssEp9C2QFOU7N8ByZJejDwFJI/2P1M4AAYEdFfYtmo0WXuSHumEB9YteM5P
         sszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791139616; x=1791744416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wGE1OXJENdmlXxvOEniQC7H7TDqRf95SbseW6xkxfxQ=;
        b=Lp9nT3qqLS+RqnBUD1OB2zk5Bf0loyNra/+LxWhKC8I4zvRcl+p6akbSu1Gw26j1/C
         b2U3EX4ZatfHxywwLfsZvS/WqWxNvZ9iYdJXWHoYYADV6RmcIqwEZrGfuXaDVwMljH13
         xjYAi2yOcfNWq5B1pCsYZujXHGhqofDmmiAlu0+h0QDNX4bwv9qrzWoD4kUEXOhXL9wG
         pmNyjGJlTtLbcukP3kceDvSiHoFL/4VGKIkSRTMvqSs1V7McWXQfPWb9NUCpKxIB/Umi
         rr2KR1wt0lbx6SW4arA0Vv5BXoxGnN4S8aCtyaCSYmyDzHHKs7O2nDtJOPBsQrk/N95+
         5qxQ==
X-Forwarded-Encrypted: i=1; AKwUvByqPHp43lmWgxKfPlClpjAWXmSLFENHpRCHVvBdKrV91bY+Bt2yQD3aqGLZ3jQGLhEeu4qPU+4IoXaBwbk=@vger.kernel.org
X-Gm-Message-State: AFuF++na1KZ6Cz5flIgyD+2NS1GfXIQ5Ee5vN0uyaqCJUGlyNL0n+KIH
	8jMNdkDylt+iyD4v2maTOANtqDcZfGmfCmTVagu8gPkraGk1GImXi1NK
X-Gm-Gg: AYBFou2BxQzzPqbt49yueHPQVT0CEAazD7xgruJt8vMCDTz5o3cBOOENC4czRWcg4x9
	6JkgKb8dXNyDY4Kt4QVi4VaHH3JD5xWT7fQGe/PMWCWIvWcayjZ8RhDRHWvXDRUYM+hfvm/xNkj
	22xBiC/SHK7BbyTmvjelZVj9xnww4wcck93LRBOzLOL7YWwvJ58l3CBrsLTYa7GzMlIHqxqdD5d
	OmkNAqDcoyKT4UUJBdKJFrqGUrekudkobVnd4BL+LR0TLtdOilmG6KUNHEM0f8S5klalmBEUL1Q
	HkLAm2ld8VCqtabQKc/9x2pXDK0AfGvQyC6WKCH/Kz+gWEA318TxTBphzVT+O0u4s86xyPxHAt5
	qyZHfMuAAyoIElyZSwPher5lmC4axeojavWlGdSaXB3Aw75KJGBKT/xpmXgx8Htu9FDCc+98twR
	zwo7Nw3wTR/evJ7LPu+bvmkRLUOKZ7qRztYVnFm2ww5bknUKsHFPlxGvOczymveSIUJxggwrV77
	yZ3RNHPN2Y/2WTD7mA+4aD42E/TgNZU9oIqHmXbaLu8pZ70/N6ZxRgD6650tGL9OFS7z/cf5mQC
	YOG1Qh9Dl86hh/adho8k+HEwb8Gh0MZhKB81MqRaAeQAxzN3le4ol0XrWY+k91cRM2+4trp6SUQ
	zJmH6HaA=
X-Received: by 2002:a05:600c:4e87:b0:4a0:2375:dc1a with SMTP id 5b1f17b1804b1-4a1680ece49mr82932205e9.21.1791139615573;
        Sun, 04 Oct 2026 11:46:55 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a190-7401-a90c-9d77-a1b8-e6a2.310.pool.telefonica.de. [2a02:3100:a190:7401:a90c:9d77:a1b8:e6a2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f8ab4sm18591274f8f.35.2026.10.04.11.46.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 11:46:55 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Yoshinori Sato <yoshinori.sato@nifty.com>,
	Rich Felker <dalias@libc.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] sh: sh7785lcr: register the PCA9564 as I2C bus 0
Date: Sun,  4 Oct 2026 20:46:44 +0200
Message-Id: <20261004184644.90750-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before commit 44454baa7ca7 ("i2c: Dynamically assign adapter id if it
wasn't explictly specified"), a negative ID was replaced by zero, and
I2C bus zero was instantiated. Since that commit, a negative ID is passed
verbatim, instantiating an I2C bus with a dynamic number. As SH boards
still use i2c_register_board_info(0, ...) to register I2C devices, they
rely on the I2C bus being bus zero.

The SH7785LCR is the only SH board whose I2C adapter has a negative ID.
Its PCA9564 becomes i2c-1, causing registration of the R2025S/D RTC to
fail, and hwclock finds no /dev/rtc0.

Set the platform device ID to 0, so that the adapter is registered as
bus zero again.

Fixes: 44454baa7ca7 ("i2c: Dynamically assign adapter id if it wasn't explictly specified")
Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Reviewed-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

v2:
- Rewrite the commit message based on Geert's suggested wording.
- Add the tags from Adrian and Geert.
- No code change.

v1: https://lore.kernel.org/r/20261003082833.21511-1-kmehltretter@gmail.com/

 arch/sh/boards/board-sh7785lcr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sh/boards/board-sh7785lcr.c b/arch/sh/boards/board-sh7785lcr.c
index 25c4968f0d8b..b93423df582f 100644
--- a/arch/sh/boards/board-sh7785lcr.c
+++ b/arch/sh/boards/board-sh7785lcr.c
@@ -256,7 +256,7 @@ static struct i2c_pca9564_pf_platform_data i2c_platform_data = {
 
 static struct platform_device i2c_device = {
 	.name		= "i2c-pca-platform",
-	.id		= -1,
+	.id		= 0,
 	.dev		= {
 		.platform_data	= &i2c_platform_data,
 	},
-- 
2.53.0
