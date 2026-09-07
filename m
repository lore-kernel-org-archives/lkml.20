Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA6D1DB92C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756538; cv=none; b=HJbowuAwRZSe0kdpVT0SliGumpUbnCTKxisYV9IskQNozh4IAeLpHnz5iJBx+4d0Thws17dO+0N+jmEgvdFzZHEe2CBz4TRBDWx3vfIZbuRRt/Co0j8dYIxpNeKBtk5BzFrsXi1J4wcvoI/0v0UE67mYqsxBYWBlxnRE5RQG5MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756538; c=relaxed/simple;
	bh=GaHTEdmNzzzlNBmR+bArB7XlDc1phrEHMtjnhtvDAgI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FXYvPP1sSFBJgw7OhcBIsyCkfzERpAZmo5hasLYx1pK10+DjT2UBWF+wQr4pjwJLxGf/ViW7l88a4oRUNv6lAM2wadxkxFMwEXbMUm/Kkye7TONuLDQePzYT/u2b98n1J3ZqwwkfaE8EEHMLwbAeWTvAruImAQyYGKggXVFTQ2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r5ppAvA/; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r5ppAvA/"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d8f265cbe6so22522065ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756536; x=1789361336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ofzc/Gj2NFvW1nQHd8NV9Yu7XtABoRJWurs6AjAsQWs=;
        b=r5ppAvA/BT4uEZd0O8Pe6xXU0NoJ83NR/H8NP0qYFsB4S4lLWXlOBMC5l4YlUi6nlq
         xZ6IAIMMMzw9/ZEBRnLwmMUGhhqmntG1PMYfAllj4HmzLFw0HmQlNDBgwxmOkwzUxY0e
         v0k1zBBe2ZJrbY4rN+nBkhqMyhDNJkEDdVakdR1PXJYptkBCvGHCL1uDEwWje++EmHq3
         NMwHu6MDdXKHO+C2Z+1xpm+j1xfwew6btGJbij5X4JCC2707E/w06QEUbfHRS/LEnkxG
         GK9PICvkgpkMd1fW5MnxZXyK5/A5TPUtuaiyhxtGjex5Ravo6H4XCZ9ZOoO3dBfHCDcS
         c0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756536; x=1789361336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ofzc/Gj2NFvW1nQHd8NV9Yu7XtABoRJWurs6AjAsQWs=;
        b=epnG2b3ZZ4bhLwoGnF8L8i6dBGi4LlrPQfNM9uJEf5eU2isHTOywGOhpGSDlkeuRor
         5yL5qphwk90N0thdnkOxyb/D9XswIdjao4xJsp03uLL3J4SsLldTQ5+I3v3ffoi+3pcg
         1MKLlIFpP3DjtcnTcVEfNyShAwdIx5eQY18cCLS2RqIRk5yRVShJC9nl+N3CBzQTbZDL
         8jrAW9ARSPEPBEbf1PTRG/ZTekFaio6d4RZRtsM00w276Cjd+pFTGP0stHyhRGe8fnQI
         jKZC6dBng5L0AYGxwXPSMXVnB9jxhrPn/xUak7ByJabU66bmGlJ8ivYRk0cwD/wmRcxI
         5tcA==
X-Forwarded-Encrypted: i=1; AKwUvBzhI3u9vAfpW1v3srE7yVFHSR+9YMFkuR9ZuR8FgMPbc6PxqWPRw89WEf00D42Iv5KS8hyvX82ROIvhD88=@vger.kernel.org
X-Gm-Message-State: AFuF++mU4Qpg6ikIkNak53FhWs4PLnUsewmk3tW2IYrtHXnDVI1dFsHh
	4B704hZnL9g8dNsTMVL7dYgvglW+7PSMez4uUut9PfYhcMh0cS01cr3m
X-Gm-Gg: AYBFou3xEv9lKqhVTr/TBy3KqTwBMj3UaWMQ+NUkzqDs03EtNySRVCUylkcv4X1nttq
	vHufMtermbj5Sj4lIl7PPw+HFB3WNs+A7NkIeh/wseCbe9mRWGtSsllbX5hpzVbNDkHKOxEjNUC
	aaqb01vOzL8ACD4OFliop7/QuWKvOPowseWwLUSdqnHGsSdcnhMvv1iLBH6lA87kWwVEMbYU4NO
	IY7k/hIyXtXQqJ4ZGd4cAV7JQfT3KKzKqGdqk0cCV7teSpdbI3xVXZmAZg76t4a9f3IQ5z0psCo
	8MMSshnMYltlT75KypP0Z8BiYuiwW5uv1517VwFLsR/xhvs5k8z41x+Xk+5viVS9fk6dlpp5fI1
	83jjidarjKsbEH2knbewE4SXKt8t9atwA+GlG4CZ0GRSnmegFdIxmTm96E1Sj8TFUjHswx2WrYD
	lffVngFN01Tzj8vzNaqtJ0rcgdGkOEchHLZuZX1KbYMS4Rktxc1MMfT1OI35cbRGzestfMdIcQy
	05K/W5GJd++Hw==
X-Received: by 2002:a17:90b:578c:b0:398:e6b6:acc2 with SMTP id 98e67ed59e1d1-39b261e7649mr33250077a91.12.1788756536244;
        Sun, 06 Sep 2026 21:48:56 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm23834001eec.12.2026.09.06.21.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:48:55 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Jes Sorensen <Jes.Sorensen@gmail.com>,
	Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] wifi: realtek: fix typos in comments
Date: Mon,  7 Sep 2026 10:18:49 +0530
Message-ID: <20260907044851.9884-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of the spelling fixes for this tree.

Changes since v1:
Split into per-driver patches and the single-line comments touched now
carry one space inside the delimiters, as Ping-Ke Shih asked.

Only comments change; no code is touched.

 drivers/net/wireless/realtek/rtl8xxxu/regs.h       |  2 +-
 drivers/net/wireless/realtek/rtlwifi/base.c        |  2 +-
 .../realtek/rtlwifi/btcoexist/halbtc8192e2ant.c    |  2 +-
 .../realtek/rtlwifi/btcoexist/halbtc8723b2ant.c    |  2 +-
 .../realtek/rtlwifi/btcoexist/halbtc8821a2ant.c    |  2 +-
 drivers/net/wireless/realtek/rtlwifi/core.c        |  4 ++--
 drivers/net/wireless/realtek/rtlwifi/debug.h       |  2 +-
 .../net/wireless/realtek/rtlwifi/rtl8188ee/dm.c    |  2 +-
 .../net/wireless/realtek/rtlwifi/rtl8188ee/hw.c    |  2 +-
 .../net/wireless/realtek/rtlwifi/rtl8188ee/phy.c   |  2 +-
 .../net/wireless/realtek/rtlwifi/rtl8188ee/phy.h   |  2 +-
 .../wireless/realtek/rtlwifi/rtl8188ee/pwrseq.h    |  2 +-
 .../net/wireless/realtek/rtlwifi/rtl8188ee/reg.h   |  2 +-
 .../net/wireless/realtek/rtlwifi/rtl8188ee/trx.c   |  2 +-
 .../net/wireless/realtek/rtlwifi/rtl8192ce/hw.c    |  2 +-
 .../net/wireless/realtek/rtlwifi/rtl8192ce/trx.c   |  2 +-
 .../net/wireless/realtek/rtlwifi/rtl8192d/reg.h    |  2 +-
 .../net/wireless/realtek/rtlwifi/rtl8192de/hw.c    |  2 +-
 .../net/wireless/realtek/rtlwifi/rtl8192du/phy.c   |  4 ++--
 .../net/wireless/realtek/rtlwifi/rtl8192ee/fw.c    |  2 +-
 .../net/wireless/realtek/rtlwifi/rtl8192ee/phy.c   |  2 +-
 .../wireless/realtek/rtlwifi/rtl8192ee/pwrseq.h    |  2 +-
 .../net/wireless/realtek/rtlwifi/rtl8192ee/trx.c   |  2 +-
 .../net/wireless/realtek/rtlwifi/rtl8192se/hw.c    |  4 ++--
 .../net/wireless/realtek/rtlwifi/rtl8192se/phy.c   | 10 +++++-----
 .../net/wireless/realtek/rtlwifi/rtl8192se/reg.h   |  2 +-
 .../net/wireless/realtek/rtlwifi/rtl8192se/trx.c   |  4 ++--
 .../wireless/realtek/rtlwifi/rtl8723ae/hal_btc.c   |  2 +-
 .../wireless/realtek/rtlwifi/rtl8723ae/pwrseq.h    |  2 +-
 .../net/wireless/realtek/rtlwifi/rtl8723ae/trx.c   |  2 +-
 .../net/wireless/realtek/rtlwifi/rtl8723be/dm.c    |  2 +-
 .../wireless/realtek/rtlwifi/rtl8723be/pwrseq.h    |  2 +-
 .../net/wireless/realtek/rtlwifi/rtl8723be/reg.h   |  2 +-
 .../net/wireless/realtek/rtlwifi/rtl8723be/trx.c   |  4 ++--
 .../net/wireless/realtek/rtlwifi/rtl8821ae/dm.c    | 12 ++++++------
 .../net/wireless/realtek/rtlwifi/rtl8821ae/fw.c    |  2 +-
 .../net/wireless/realtek/rtlwifi/rtl8821ae/hw.c    |  2 +-
 .../wireless/realtek/rtlwifi/rtl8821ae/pwrseq.h    |  2 +-
 .../net/wireless/realtek/rtlwifi/rtl8821ae/reg.h   | 14 +++++++-------
 .../net/wireless/realtek/rtlwifi/rtl8821ae/trx.c   |  2 +-
 drivers/net/wireless/realtek/rtlwifi/usb.c         |  2 +-
 drivers/net/wireless/realtek/rtlwifi/wifi.h        |  6 +++---
 42 files changed, 64 insertions(+), 64 deletions(-)

