Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF6E3BCD28
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791949029; cv=none; b=O5vAmZNU0TzgtjY1kCWly/QTWRq9CpOftX2q+yV8EB3VhailSYADE2z5DdnW5MwEQKhYr6fT6dY+M85YxQryPKIzLPtA/lmyt5rHjA/40i13lWcnLJhFvkfldhO+Qzzm7hboWpVqI9IK5na+N2aanXENTxAVdXkxLn2GEmkUubU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791949029; c=relaxed/simple;
	bh=n8IRbG2adU+JHRw1Weh0pyhEWzLZHxglbxo0UHmAemo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SMMqtKO8LvZ25Y3bp04udM96hnh86EIkhSh/P89+g2lqBeTumgKqDHEa0sYGv3hjXhyMvT7ghMP4EGWD3tLGMjORxfyJU+naW0HxdomjNLuUyYgrlikczJeBVQaVdSrnQhlmyh++26qKI9gqF+/4lZb8yRuUVzOxPGQhwIz/LM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gn4WCkAl; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gn4WCkAl"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so3244687f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791949026; x=1792553826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Erqpv2udLqd8NtJ/EiJJ9aOeRqNutr8eZmBOOfX9tK8=;
        b=gn4WCkAlALhlezF9t0NC0YMHVPbIt1UyEz6nWMEe/HmbPlLpTDVve4LAUttxzcRWtj
         /l/BLQuxWo5IRgV5kar8NOWtBrpmXk6vgg7dtwOx172+vm4ghzKSn3KVrX7wow0LmQHR
         wIU/IdRqnfKXPLkNgqEUZBX6qP9Wfe23/Ih91rV9H/z7YwzxMU2Q1f+ZEA8YlLOrDUI7
         ldYNMyQXZiutUeAfYC95CLO5o+VpJeQU2fAheyjPddLZebEzTKt48ydNT/cTlgwl8xrs
         IwPtT2K9zzxYFF7SR1PIxIDolc2Nn5QBHF2iiA1om7Tus8rSwvAa1WXSqIFbJkWhAA18
         GTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791949026; x=1792553826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Erqpv2udLqd8NtJ/EiJJ9aOeRqNutr8eZmBOOfX9tK8=;
        b=k0zIRPu0Dt8vk/dzVQ9M0v7efjjxFZoh0ElaUH8/4X9nrs9or3UgIVWfXro8wWvUN7
         DXm+Dh2omQTtt8R+xROZQiQJ81SJTlolzla+RE+O99Hc0qiy6yEi1raH0uH6nTXS8kMZ
         22Rao1RXyCcSW7JVC3jBgQKArr+0zkXTit3aHTio9rcYfVvarjBhpNNGKJX/cI+LRLYo
         uW2IVI1CgPRzC61044XSYG39Ox3P1tap2xdmqK6c9gIp8rHY+i5HE7t9s3WEtzRvvMQt
         f4tcAVf+NfedqtxXguTQImVVkkksvpwm+4wP0dEBm16zukAWFlNgxNYG4R7tltke2gSQ
         2JVQ==
X-Forwarded-Encrypted: i=1; AKwUvBynrZtgZl6BY5+yrA13TyO/e+LTVZ3IXPaQ5U0NubrFdTywBQRQTcmD4iZtH3t9tzDhPlLChbSOVQoYNrc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLklJcR+W2DgJ0eJ+0MCmWC/pZLEwmhYdq8abwdsY5TIAZ2MQ3w
	EN+g94tRYH4qJHd+OvV7ewUiLfVItRZrI+g1TgvGYE+eT7UHQwWZ/xdS
X-Gm-Gg: AYBFou3s/KfMk8X9MCsa4TFDdnNS+fkPfHsh5n6/8Zu+8xx+XE7qyUkZYeHBgIUsLLf
	F73aZGvCgPFaY3+rmUNHuv5zlHxFPY3bPPJOe0OC/rxLQ9k1ifW2DXx5uqPnyPqZiHjh4NPv0n0
	w0QaNiGBoLtJ8bpvEf/wZzfgeSgvgKOe0GD9Ru2jxmayUCWWHtC1E2Y3T5XDEphnpiVdbST8uQ3
	VRzQyonFuYrrey9zK9ejpYfCnQZ4XRR6JH+ncnT9qZOuR2Pdkb5jBq4XKfflxXZXqe6Qo8edtIv
	8fz2zDYKH2Iceu3Z9/4stn0ERlUINk82AAReNwHzKFk+SX2zHMyVVhgSka8g22FtQb4je1wYI86
	Fep/eb0fh3fA8wb986IbcVrLc2TYLKl6syDeavGF4vPuMbBdMnWrTMtok2dBGu6xG3eaawcGijY
	x29K/ERAyzopF/nWFBUHOw0SMfQtZnJRumYfXiOylb6blg+AmGzpiaZ9OsJ/keXaoqLpGIexs1j
	xq3ZFxuKBQIWm/QSeHfyDkQKEZeQy8n+cpc4bHqPauckINnzhRLOtUAONcJlRjILGr739Ux6hft
	v9dI5MZmPWOloBwOrFRrnLeSJoX+V9GHp3lV0CTqH4rB4AxWPp6XOE2Q1sY0nki7+QJjggu5epF
	N1uWTGJBmCZ4=
X-Received: by 2002:a05:6000:420b:b0:48c:a08:5858 with SMTP id ffacd0b85a97d-48dbaae6fa0mr26214747f8f.23.1791949025961;
        Tue, 13 Oct 2026 20:37:05 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a0fb-5301-0850-863e-3c16-90b7.310.pool.telefonica.de. [2a02:3100:a0fb:5301:850:863e:3c16:90b7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc6b82sm9066614f8f.51.2026.10.13.20.37.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 20:37:04 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	netdev@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Wei Fang <wei.fang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: phy: realtek: restore RTL8211F RGMII delays on resume
Date: Wed, 14 Oct 2026 05:36:59 +0200
Message-Id: <20261014033659.95196-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RTL8211F-VD loses the RGMII TX and RX delay enable bits across a
software power-down. rtl8211f_config_init() programs these bits from the
PHY interface mode, but rtl821x_resume() only clears BMCR_PDOWN and waits
for the receive clock to stabilize.

On a BeagleV Ahead configured for rgmii-id, carrier and the negotiated
speed return after an interface close/open, but the receive path does not
work. At 100 Mbit/s no frames were received. At 1000 Mbit/s all 11
observed frames had CRC errors.

Program the delays again after the existing resume delay. rtl821x_resume()
handles RTL8211F and RTL8211F-VD, both of which use
rtl8211f_config_rgmii_delay() during initialization.

Tested on a BeagleV Ahead with an RTL8211F-VD at 100 and 1000 Mbit/s,
including close/open without a link partner.

Fixes: bb726b753f75 ("net: phy: realtek: add support for RTL8211F(D)(I)-VD-CG")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Hardware test results on BeagleV Ahead (RTL8211F-VD, rgmii-id):

                               baseline          patched
 100 Mbit/s close/open         RX silent         pass
 1000 Mbit/s close/open        11/11 CRC errors  pass
 no-link close/open, reconnect 15/15 CRC errors  pass

The patched kernel also passed bidirectional 1 MiB SHA-256 transfers at
100 and 1000 Mbit/s and eight consecutive 1000 Mbit/s close/open cycles,
all without RX CRC errors. An s2idle suspend/resume test passed on both
kernels and did not reproduce the bug.

Built with ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- LLVM=1.

 drivers/net/phy/realtek/realtek_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/realtek/realtek_main.c b/drivers/net/phy/realtek/realtek_main.c
index 177b62a7b..c867e5213 100644
--- a/drivers/net/phy/realtek/realtek_main.c
+++ b/drivers/net/phy/realtek/realtek_main.c
@@ -1375,7 +1375,7 @@ static int rtl821x_resume(struct phy_device *phydev)
 
 	msleep(20);
 
-	return 0;
+	return rtl8211f_config_rgmii_delay(phydev);
 }
 
 static int rtl8211f_resume(struct phy_device *phydev)
-- 
2.54.0

