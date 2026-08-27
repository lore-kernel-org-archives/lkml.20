Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A211A6806
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 21:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787865405; cv=none; b=D5lIk0Ray6191Yp09/2qn7X4po/0iGMQ1q5eIuSubxDCWKAfU0XOL/+vREJnTgSHIA0LLsCBnSDgav4T3pwlQGdRBMeet6lKvFlOsYngpm6+1TJIZHhsax+58wOAaGOAj0Fn8JRKDtYRReN+LfUNUVJBxg23uycpVTNkthOxaFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787865405; c=relaxed/simple;
	bh=AR64SDuxnMpneMLXVmzP4quV6lxzlo+i3B6F+PmJfh4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D9Y9HtIMSeQxD80WW3Cm8kv7gLx/ioRsNARALwKWvZEaTeQo8uDJuIHDRjpLZbeKrxj1a/BQFD8N8pd567HXQHXUNkawbuYPyjW30FErv2HJp+bi2327Z2WblpQ+JWfcjOfsJ7gbONXvTUM8wiiynxVKMOpuonsnaL2qDACggk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=bvV+j1wI; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="bvV+j1wI"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso57244f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1787865402; x=1788470202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2DPEMDKFtcxksuqGCh4W940+4YKssrwswGnRzpjY1qw=;
        b=bvV+j1wIsq5rdhx+ANcVRGtHw3pASZZYsSafySNlUgGOOl9qS+Teq2vh8v2vNVTN6H
         JEQy8KwvzltFqzRLiT1TyE1f9i+NAFjEjrwt7fHpYQYmIBZAD2KOnLCXYbOmi7N144Wj
         K4Ir6KLAJy5P/Di2TcN962KlE4Sf6LXMG1yAGTyrc3D4heQRdZ/W81wnaWY9X1F+sOK8
         ow9Dn5r+IfskFEF+/Y+MI2ygQcGiUJ6ue1YlEz0udpxQtrIRlFbyc8kMHeyNK30kgmmG
         K/cG494W1O1U37n7QPL/UgB8Ky3qcxsq3YZIVI835ebv2/mjf1no9Ab8LRyvH1NwNTdF
         Fzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787865402; x=1788470202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2DPEMDKFtcxksuqGCh4W940+4YKssrwswGnRzpjY1qw=;
        b=Ev9k9DjFLM690Bq1dfqratdhH99O2aBpfahbKmqqJQG9pHi7f2TGeK4Yv0nM8xlY6h
         kdksI60j29K1GsHQrm4SyFWHNNMTyPFsGdgw+60aWrkmrqz8B+L63SuB/vGyGBFdOdPF
         FU1XTsTSS64z3AsJ3FK61FiNHRz2B35okYteJiACpePhS6OJbkvzQMq4ykvSpLlcxLcE
         a53x0Su1lYR/mjjMzqwYvR9LIEYqvheOq78LgkFQqjnbvzAMYUb0nSJFO/QtYlGpRnW/
         gx/LL+Vywro0WLgShybtg781lC0/mn1+12EMNStkPkIKS/DIn+UFUPBLwMTZeuceI0av
         j7RA==
X-Forwarded-Encrypted: i=1; AHgh+RoVMy72bDZIkLq7wgVanFieJUBpRBwuJqOR+gqfU1XwoOTWM1cMZNOoSGMQxE2k+dDzp3biXrRB4i2xJ2s=@vger.kernel.org
X-Gm-Message-State: AFuF++kRYN1Ky3+fmCfHeoEqaIGs+tbGK2U7R1HTkqV0UB+wen6799bl
	iPCd22O8aQ2nibqJbPe9BCh9s5X2M15z/tjhA13dhX8WM+pe224D1lkswAWnAUcyCC0=
X-Gm-Gg: AR+sD10hHoI3c/kkxLkFV4I8d4YtbhX1cerUO9PJRIBwxMi/0MrZ9L8fbWP5Q5//07c
	uy8WsKtycBibXPy3MEk+LiNG/OwDITAOGxd9Qmo3EejGowyHq3M30oGnLcNxABCz5lC+zaxM9E1
	nSnMWOLlJH2Fmo8+gbZ+PyD5tN75DU2wLjD6D3FVVAtjHkk5yieYiVSkb0uGcS2lvQFHQnpHCim
	z2OzTblMqov8Z8F9iMOgVhE9X6rk3xS4KB/XzbM6+envlxwUKWRbteLPBfqZIUTFxuI/rUyByjA
	v+8VtTCDjHUgq7hnc/2L5KMUF+fX9vL0Jk+pJA3yhj9f23haPuazAoQ+qv+PvRZzr2g7Bhi368f
	GulunPFmKFPHkxolo0vCTrKdNF7tP5iyaKlSk25qD3kXu9ehB3TOYLG6eUe/u5L6yAu8vAbESeD
	+yO7272qNcbqjYLspV+9Sa5kTKH8z91AZtrPNCTZ62j7zHYQYGZex6qXPjyT9BMcnEPg==
X-Received: by 2002:a05:6000:4a1e:b0:482:e658:bb8e with SMTP id ffacd0b85a97d-482f79bf4f4mr2483593f8f.12.1787865401526;
        Thu, 27 Aug 2026 14:16:41 -0700 (PDT)
Received: from ownbook ([31.146.92.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e4f0c8f7sm11423442f8f.27.2026.08.27.14.16.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Aug 2026 14:16:41 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Aleksei Sviridkin <f@lex.la>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 0/2] net: fix a stale phylink PHY pointer and a lost PHY interrupt
Date: Fri, 28 Aug 2026 00:16:36 +0300
Message-ID: <20260827211638.63395-1-f@lex.la>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two independent fixes, both found while chasing a PHY whose driver is a
module on a rootfs that is not mounted yet when a DSA switch probes.
Neither one depends on that setup, and neither depends on the other.

Patch 1: phylink_bringup_phy() records the PHY in pl->phydev before its
last fallible step, so a failure there leaves a pointer to a PHY the
caller has already detached. A later phylink_disconnect_phy() detaches
it a second time and drops references the first detach already
released.

Patch 2: a PHY that goes through a generic-driver bind cycle comes out
of it in polling mode for good. The specific driver that binds
afterwards never sees the interrupt the firmware node declared.

Tested on an MT7981B board: an Airoha EN8811H on an MT7531 switch port,
its interrupt declared in the device tree, its driver a module on the
rootfs. lan4 attaches with irq=15 rather than irq=POLL, the line is
claimed as mt-eint 0 in /proc/interrupts, and its counter goes 1 -> 3
-> 5 across two forced aneg restarts, matching the link dropping and
coming back each time, and holding steady in between. wan, whose
internal PHY has no interrupt in the device tree, still attaches with
irq=POLL: that is the observation which says the bus table cannot hand
back an interrupt the device never had. Patch 2's other exit, the one
in phy_attach_direct(), needs a generic probe to fail and is
compile-tested only.

---
Changes in v3:
 - retargeted at net (Andrew Lunn, Paolo Abeni)
 - patch 2: added a Fixes: tag naming the commit that introduced
   phylib, where both halves of the cycle arrived together; the commit
   message drops the phrase Andrew flagged and says what
   mdiobus_alloc() does to bus->irq[] instead, and answers why the
   restore is conditional; the analysis below the scissors is replaced
   by a link to v2 (Andrew Lunn, Paolo Abeni)
 - patch 2: reword the new helper's comment to the mdiobus_alloc()
   form (Andrew Lunn)
 - patch 1: carries Andrew's Reviewed-by, otherwise untouched
 - that comment is the only diff change since v2; no code flow
   changed, so the test results above still describe this code
 - v2: https://lore.kernel.org/netdev/20260824024029.41310-1-f@lex.la/
 - v1: https://lore.kernel.org/netdev/20260822155259.87146-1-f@lex.la/

Aleksei Sviridkin (2):
  net: phylink: unwind the PHY binding when bringup fails late
  net: phy: restore the interrupt after a generic-driver bind cycle

 drivers/net/phy/phy_device.c | 14 ++++++++++++++
 drivers/net/phy/phylink.c    | 29 ++++++++++++++++++++---------
 2 files changed, 34 insertions(+), 9 deletions(-)

-- 
2.55.0

