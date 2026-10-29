Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283870;
	b=MlqJ5bHOwlrqqfpfC/rarbMppTWN5HGx1a/qk8q9OuGPbE2MFJbTKyAuHKiqPPukDizD
	 hyYWz7j9sHahS5NMR/zXQKodF/fJn7BYyx0xe/zsyUJBzqcMoLvM2YLqE3utIQuQod00M
	 b2jJqPXj6Nt5Z91nyRwEHD/yzyVrNSSFLtRgLu++cy+kg+nSRJSVgYK/TzPuIEcsIXW/N
	 3RzQjVpYwT02BzGx6a7885ImKk7nKH47mGiw1FW19Y2TkpgKrAVVNgZL99DdTCObMrvJN
	 Ks8bQlygy13Owkx7Ldubnl78IpXsSaQ/PB0uzDBSDG4kBR1ZIJU67BtPygGOaQEfqBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283870;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1pA3DY9nQInHYQwlk8Wnkgx76yLI3u5rBh/HejZE858=;
	b=aSfvAbPpbwm5RR2dXai220WXAZUL6t6sbPv4eNJH9fL96iQAdGDxWYlwaVaB9PVVLAM7
	 4sazIrYIBk/DVMEoRPAq5gLpLyh1GNlQ3eIVi5mO3LGDXdRHkliCzWHFzWLN2r0JcawoD
	 Cakih79+8dy4gSoV61/wRF5K4bF1iNEjXvsjPrOlP88oWarcMXNbTiuhsfYNrCtTn/S5z
	 zqzE9+Ei3pMYkhzEclTwY6ovA/0Uwh1aOCRYEUFiSlVwjRxiPz7cLT/hGA7ptP1Nz2bZL
	 B65XpzKWKbE3peZuXP4beONPI4iQfKWgF+qVeoLXkaFGAH61+Y+176R4pPCwyn3BuMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WeRS5xwe;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C801606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C801606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WeRS5xwe
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ab98332238so1339293a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793283870; x=1793888670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1pA3DY9nQInHYQwlk8Wnkgx76yLI3u5rBh/HejZE858=;
        b=WeRS5xweJrCPfHAVsJ84vdSOreP4nbG3hoz9M2Oz4HfEbCDi8eFSIGatj9A3zTpaDU
         e0Xb1CR9mOasKFnmkH4s0q4rxR1l3VaHPpPEFCPplPCvgeXF3x5UKJaBVSO6xRzIm6ai
         18bGbUTir6UDPtH2If9oz1KovGWFEb0ADOc+3L8fqwB6yy5043o/LIWB7ILqUBBECEPT
         l/2ticNxD4e+xcQTwCUurzwk01S0NyNGViDpnRQxpSqTI2yo+1d0kONgR+pFnFUe/iNM
         o+3EkCsald3/H4ODpuovHFss3zyM45Vu1kxYeE7PbZTzla5crd2yIcJzGopbHxdw38Xp
         cibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283870; x=1793888670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1pA3DY9nQInHYQwlk8Wnkgx76yLI3u5rBh/HejZE858=;
        b=1bjxM6d4H6vmryTzytkxutw8vAsqLiPJbw+AruGkavRZZd3AA6kjP0SDIaqvjM1dhF
         RhGo0w7nZ++tffgyEjCLla7o2rKthbmP5bnXhIB9Zhe8O/uYC+CN1d9j8+ekDLzY0v/A
         aDQQQ0a41bx5w4hrbmJ6gV+TRpuU3uXQFpdZGmlMCH5TUtgvzzZ+zJ5TTTskfYbT3ksG
         Cwd58mXypR+Xr3XI1nNhG0hU8+tZUxpjASXvXFJJrsdL1PZY4wwO2hUgHEynkenfRcbg
         I2YJQnECrfAEYOYLlg/18qxUgxIHAXe8pJm11V/UIx8AGzoLMbvFI3Z9Va4vEURgeFdH
         feRQ==
X-Forwarded-Encrypted: i=1; AKwUvBykmLSTtBzu2Bw0RdVCgGgXQrExjAbo8sR3Sd6lkxxCKa4i0RRnATaQM2m3eOPfYgMWu7ThEFxvzRQMfMk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpKviGSv60UjWDcQ9HPej9HQtwpkFPEIVez2v3Lcsm0f3pSIKK
	KR47Tj8tL5RfM/vAvF8uZdBT8eCVaFAl0AUSv8PeNGPlrvyNv4XbIoYIpsTDVw==
X-Gm-Gg: AYBFou0p4ztFz7qKsudzMZl+Qf/muY+5VjfL5hXXcE6DIRWCd0fUab4Rg4Uqy7+v3Pu
	4szk5oUqsQAuYRptt7hm42Xcg5paI7KiFKJtntyudXasiQ3Q6rgobftrhGhw2QitgkFP9X/27/H
	Yk9pkKjiO2sVisNXCMJQYtb+nNhgSnMgMyoFfnlhOSjyTGm2V3c48XfAw7LUKdUK/N6/mJ7GLI0
	YZjsBkSOowvMSCYvDELI5qJjdnxEyP7CN5yVHUIP2EllRnyA5XJDSyqXro3ZH2qpqkttaxY6M/a
	gDyopgAxevQGAR9xMGMN23nMcQrnJ7Vs08XIsJnDnlW2NYfD+uzLHzzWgDKAxHoPEkmQafNOoIb
	mZPNSYAMZlRNTBUM9HCavwvaWTvoZnw6nI51q8Y346kwuVmwtINXnIJz7w68KAbSC8C+5pQdEIq
	llyr7zieaBHE77Mzwn1UyIDeTNuQQIsO5CPDDPwoqTNmRl2qHWdhorLArsJPvBh31F8N4c1N5s+
	AakgQ/XCgDYjFam2X5+i06S6f3uVH595Yd1WPEtRxmcr91QRWtqd6Yl9qtplqLVmizAC6gu1ZKP
	lyt6ZrHH8DUKM7lFXg9yqt0HdzqmTYE=
X-Received: by 2002:a17:90b:1a86:b0:3a7:a463:54c2 with SMTP id 98e67ed59e1d1-3ae580a0233mr4500501a91.35.1793283869733;
        Thu, 29 Oct 2026 07:24:29 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac5:d459:16d2::246:73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8441a6f0sm16691a91.1.2026.10.29.07.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:24:29 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+583f42a41879bb60de32@syzkaller.appspotmail.com
Subject: [PATCH net] net: phy: don't require RTNL to detach a PHY from an unregistered netdev
Date: Thu, 29 Oct 2026 21:24:23 +0700
Message-ID: <20261029142423.93573-1-ngocthang2710.1999@gmail.com>
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

phy_detach_internal() reads dev->hwprov with rtnl_dereference(), but
MAC drivers commonly attach and detach PHYs while their net_device is
not registered, without holding RTNL. Before register_netdev(), a failed
phylink_connect_phy() or phy_attach_direct() unwinds through
phy_detach_internal(). After unregister_netdev(), a driver's remove path
may call phy_disconnect(). Both trip lockdep:

  WARNING: suspicious RCU usage
  drivers/net/phy/phy_device.c:1831 suspicious rcu_dereference_protected() usage!
   phy_detach_internal+0x6a5/0x830 drivers/net/phy/phy_device.c:1831
   phylink_connect_phy+0x22e/0x2b0 drivers/net/phy/phylink.c:2452
   ax88772_bind+0xbb1/0x1520 drivers/net/usb/asix_devices.c:925
   usbnet_probe+0xbb3/0x27e0 drivers/net/usb/usbnet.c:1812

syzbot hits this with an emulated asix device. phy_eee_rx_clock_stop()
fails on a USB MDIO error, so phylink_bringup_phy() fails and the PHY is
detached from inside usbnet_probe(), before the netdev is registered.

hwprov is only set through ethtool, under RTNL, on a registered device.
reg_state also changes only under RTNL. So if the device is not
registered, no one else can reach hwprov, and RTNL is not needed. Tell
lockdep that. A detach from a registered device without RTNL still
warns.

Fixes: 35f7cad1743e ("net: Add the possibility to support a selected hwtstamp in netdevice")
Reported-by: syzbot+583f42a41879bb60de32@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=583f42a41879bb60de32
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Tested in QEMU (x86_64, syzbot config, KASAN + PROVE_RCU) with the syzbot
C reproducer on 6b4b543fa187:
 - before: "WARNING: suspicious RCU usage" at phy_device.c:1831 via
   phylink_connect_phy() -> phy_detach_internal() from ax88772_bind()
 - after: 11/11 runs hit the same "Could not connect PHY" failure path
   with no lockdep/KASAN report

 drivers/net/phy/phy_device.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 5d4508bcfbe9..06c5a8c8cc2a 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1826,9 +1826,13 @@ static void phy_detach_internal(struct phy_device *phydev, bool notify_bus)
 		struct hwtstamp_provider *hwprov;
 
 		/* hwprov may technically be protected by ops lock but
-		 * not for devices with a phydev, see phy_link_topo_add_phy()
+		 * not for devices with a phydev, see phy_link_topo_add_phy().
+		 * Drivers may detach without RTNL while dev is unregistered,
+		 * but then nothing else can reach hwprov.
 		 */
-		hwprov = rtnl_dereference(dev->hwprov);
+		hwprov = rcu_dereference_protected(dev->hwprov,
+						   lockdep_rtnl_is_held() ||
+						   dev->reg_state != NETREG_REGISTERED);
 		/* Disable timestamp if it is the one selected */
 		if (hwprov && hwprov->phydev == phydev) {
 			rcu_assign_pointer(dev->hwprov, NULL);
-- 
2.43.0

