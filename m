Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F14B1DEFE8
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792039825; cv=none; b=YCXrN3uMWqN/OQ0LQ80FybkCQiMgLWXZRYwYrFHp8rMRs7XDepx7SvsGK4E2mDj/H1ztbU66BOANpD8Jj/P77pZIasu6V0YkqnCHWzPmaoSRe8jkN4AHh0SCzo6wtja2tDpn01qk8stk3LRA7dvqw/JQFNzITH/LQUfpW3wA/H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792039825; c=relaxed/simple;
	bh=VZ3Tr2gFB2e6AncKRZFku5qMT3/qdFawvSt1vkMJhWs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qUiOBHPv6Bc6IdgUWlRrmW/Svzl7XXuKSsSVMqUo5HFZDAtAlO9KXn2XkDi3Rfh+shu5VTkwo050KKt8/vekp3YTjxz3EJakyzB4ISWY6ilmPiwIEvk8RMewEFBIL3jZ3mAJ3HJQBJ0wtXtNfBjJB2c+TyjLIN7Zq+4TVeQKh4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qX9JESsg; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qX9JESsg"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c5358fc28so916380f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792039822; x=1792644622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qZeTuZ/4qQQoQ+0qzys9AulwqpOfOPP73+MEdMRLt/A=;
        b=qX9JESsgvezlEjZyV6FYO0FazvA7RN1/EqBBrae/pVjkquCTR+zKSWlJ0LZouKFm6T
         hzWKy/7ljk7jYCXEU1AyO1EsXOrOwrqKn+eBKry24VkpvOGx/B5gS5wpGNH41AynWj6c
         LgUlVlNOrhPs9i0dnhObDXbruYz9OUbjqxNjN+0NHy1O9cTcwiCKhGXIzY2OtvzaGYXR
         mpC+wBrFEQw+HEf5lnA7PF38xzGGqf1KcQ9q/QWop8fhefag1EmUYUofFhHb/AMgmC90
         w9e45za83XXoLEGb37uANYX3Kt58HPZMFaX71crDwKZ1sfp+Pe09xmM78oLBw8zf1XOJ
         CNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792039822; x=1792644622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZeTuZ/4qQQoQ+0qzys9AulwqpOfOPP73+MEdMRLt/A=;
        b=g4nE7ze6u9YjucaIFIVtDsUeeS0izTAwsKzq599pK0Njz0j1Kc9MVWVzCsvsXWbWA8
         D6BEXIcm1S+5rWaPGr5LdEyEshAfwlZf4PpZfIMHJ7zWOw3mxBwbYYCUaD4EhpwCOT9e
         w/aQt3twFlKsibxwgoHTp9hn0xpoVQmamXFWM2ZwaXBA13S1GzkbeR4d0BYvTKp4Czg9
         n2Xcb2G0g9XM5FFe7xfiFS9dqbY9/W/1HOC9NnNgatsaK25ZyydDhJO114cz/TyNbXp/
         nZfU+zU/t0BVCztvVenKLyiAFargtA0jKhVaDxjO2B154ZfCdJ7S8WMTN4qdWfwDtRkP
         djAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzF8fBsrXJIDT1+jzROviYnLX3mAOqJcGA7x1lmuPw1WP4NeKFHQvRe84J7L9a5mmTFX9gltZVheQP1gI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLds5MkARm3waVYgtqkZpHZ4bBJ4jlMjgEK4v5hxeIOzzBZm3aT
	rvvxYGCTwU03gL1IC3X5eJ65i5dDdM/L21eLLvFmFC5iLzU81YZebonq
X-Gm-Gg: AYBFou22xGEsXqiCZIhEFhsU5UiXR/ab49Uz/O2KzrDfKsK14cI6IywakdQpqonDH1a
	QY2r25lYPIFIqBCwr1yTeaiw3y4vjcosCpjdQQ6/yVBHRb9pNjDH2zj/UwR70hfSbKhj1lINTz0
	B624uKCrdkDBS64f/7MhVYrNuaYBuG75AurdG1sNw+73tHpI+shhaIF57O3fah2qLL9dHfIn0zO
	WmvGnZNjINmChfDyXanlbI/2lytYN9nmqKEcC+nA7VE81fqhjrFZ8SCFG1w2pg2XpdZf6czQ89L
	ElXFDoICpzCx9VdZY0UdA+cQw5dVMTRVIVqmGjW9D9Rywua50OO8n8YyVdaYR3YlEN3319pYb9w
	MFzwDyoqP10QgQrKeXoEq6CQ7jPvvvOe3X2qod7pyuy4m1TpsLbziAS+UwR+awo47F0laaiAfDf
	NJHxvmYQ9PGygfBkrvaljiPTgI37GpYV2Y7at1NSAsUjqzElGCJtq5hB3A4tES1GznrCDq0yx8o
	4lLAkjezA8dHLEJ6BC7dnfQ4JmwgfdMXUc3/Pe5VLT7e8RJFbzHkLLxZI0G49J97nugop8ULsup
	6AGKOfRZ24JtWyfnWogsz3+O/OW4K34+d1YH6CkHrU3nBdiz0Byw5feFtzVVeAT7z1cnSpBlHTx
	Nbk4lcJifrIoIXQ==
X-Received: by 2002:a05:6000:25c4:b0:48d:db43:4ba3 with SMTP id ffacd0b85a97d-48ddb434e27mr20529379f8f.2.1792039822104;
        Wed, 14 Oct 2026 21:50:22 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-aeb3-cd01-f139-812c-65df-b930.310.pool.telefonica.de. [2a02:3100:aeb3:cd01:f139:812c:65df:b930])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bd1843sm16398919f8f.56.2026.10.14.21.50.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 21:50:21 -0700 (PDT)
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
Subject: [PATCH net v2] net: phy: realtek: restore RTL8211F RGMII delays on resume
Date: Thu, 15 Oct 2026 06:50:01 +0200
Message-Id: <20261015045001.83986-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RTL8211F and RTL8211F-VD both use rtl8211f_config_rgmii_delay() during
initialization and share rtl821x_resume(). The RTL8211F-VD loses its
RGMII TX and RX delay enable bits across a software power-down, but the
shared resume path only clears BMCR_PDOWN and waits for the receive clock
to stabilize.

On a BeagleV Ahead configured for rgmii-id, carrier and the negotiated
speed return after an interface close/open, but the receive path does not
work. At 100 Mbit/s no frames were received. At 1000 Mbit/s all 11
observed frames had CRC errors.

Reapply the RGMII delay configuration after the existing resume delay.

Tested on a BeagleV Ahead with an RTL8211F-VD at 100 and 1000 Mbit/s,
including close/open without a link partner.

Fixes: bb726b753f75 ("net: phy: realtek: add support for RTL8211F(D)(I)-VD-CG")
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
v2:
- Move the shared RTL8211F/RTL8211F-VD resume-path explanation earlier.
- Add Andrew's Reviewed-by.

v1: https://lore.kernel.org/netdev/20261014033659.95196-1-kmehltretter@gmail.com/

Hardware test results on BeagleV Ahead (RTL8211F-VD, rgmii-id):

                               baseline          patched
 100 Mbit/s close/open         RX silent         pass
 1000 Mbit/s close/open        11/11 CRC errors  pass
 no-link close/open, reconnect 15/15 CRC errors  pass

The patched kernel also passed bidirectional 1 MiB SHA-256 transfers at
100 and 1000 Mbit/s and eight consecutive 1000 Mbit/s close/open cycles,
all without RX CRC errors. An s2idle suspend/resume test passed on both
kernels and did not reproduce the bug.

Testing on an RTL8211F (non-VD) would be welcome.

Built with ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- LLVM=1.

 drivers/net/phy/realtek/realtek_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/realtek/realtek_main.c b/drivers/net/phy/realtek/realtek_main.c
index 177b62a7b2d16..c867e5213216b 100644
--- a/drivers/net/phy/realtek/realtek_main.c
+++ b/drivers/net/phy/realtek/realtek_main.c
@@ -1375,7 +1375,7 @@ static int rtl821x_resume(struct phy_device *phydev)
 
 	msleep(20);
 
-	return 0;
+	return rtl8211f_config_rgmii_delay(phydev);
 }
 
 static int rtl8211f_resume(struct phy_device *phydev)
-- 
2.39.5 (Apple Git-154)

