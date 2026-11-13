Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559755;
	b=oPuM/dcpG+j7EDdEcUYbIbxO5bEzXvVoh7gyCazHZbUTCGCGE2DVozedELuuJ5ILp0FZ
	 UXUNSDXGwnHDPe1vkUisTHQNlOl91WNuumH9NVY2lrVPggnjkpi8l+5Y2QEzOGNf7HTA+
	 NlV/KoQQSxBY2LcklkItsEM+ySYL3qXeAXwkIPF3SjA/ErkekLBjlAWlrngiB6+V1+QnT
	 0ulIU/+lic6nu49X+UNTIZ+iP9rbFEFj0649WkVJNoE69SW9Qmttp5qXdMMM4VfBEY5RK
	 jsL89T9dXNKQpGx0EkcbwGY/lpfv1JXXKwEoT/onSEG9oZPR3Wohr9nIEED1yxk16fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=IuL3dRBiD3SJ5KZPCb6prNb4XCfFwTEE4VTqJH9O0rM=;
	b=Yb3TOqIyNSCm0/T1j0+Ou/805jZ1ehCc0f+7hh0YsyySe2u1/ZzCCz5ZGaummpM+L/EA
	 YqeqYLF2nbG6X8UZgeSQZACezSf9CtWQs+fIHPDoGjnbQI7j0syp428vrZGG+5FnVpE18
	 pbb0IOEezPwGKz9jjUHlZGpiudNiXPNXnE7k5j0rtZBclmB9FH7uid78pva5O1669cS4s
	 vbAIREjPb+laX9BGnmUcVYTsyy79YMvlD9O17UsudPmKAWTzFReioLMUya8myRtRHaCXr
	 wvJp/WmiEMKpdWaBf5I/coG3Q1bmHE1vNxsfz4CI8dVw+wskK+nZIdxi5mt8rylwV6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Qxz1/Avq";
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79990606A8A1
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79990606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qxz1/Avq
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-84d5e56f876so806232a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794559754; x=1795164554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IuL3dRBiD3SJ5KZPCb6prNb4XCfFwTEE4VTqJH9O0rM=;
        b=Qxz1/Avqk0MJFrqIxkdchDZmhqJ94fiLcoltn4yObo5jfeh5z3Cc+J73XF5Ej6YWue
         0d6QVEQ0pLzJxQpWSRGOmr1CWjqw6Hz3ZbRNFQvr+ovz98sjSzlScdld19/EKZi4BQpS
         +hlzlh5ps4IIUz0lp/An7ajphKNCM/WYjfRa5KxW5aKrPdaRkBevLdSKnZWrlCIqMUw0
         DQoaJgyXRkhe1V9B4q6jCHOwHNMbWe/JdlfPxxZSD7j+7KdmYtpcwHGk+LaeaRnpMVAI
         HLmVm6bHIG8CbYTRXjMOtK82uPMdq4mwA9ErYuuaOVvaHP9PTpoQUtU/CXsFIxbGV7wz
         ytLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559754; x=1795164554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IuL3dRBiD3SJ5KZPCb6prNb4XCfFwTEE4VTqJH9O0rM=;
        b=PfOWd/hjK2DP2i4XfUFfSmegfF8tCEypf8hGwfQTBie28IE13Y/nMciY5mIYDJ5bBD
         VAxhnaXssM2vA0KAjzIFi0UR+L9URb8VxTuy8AtUZj+5uR0IpJK4KjZLDdRkMGMAcBn+
         TBLW+h+JknfKF0HCQorI/wslZ1RdE98ncpGcBgtaeQvLlmT8wWzJ2uW2sFTwCTCh6Y9C
         of3xQU4/KzVDimn5gOOqTtlUaNy+S2hEzdGrYR3Iax8y6HCCg0HmAJ2g+yC4m+Hzqyb3
         y2YYpnyMWZTERL3ghEG32pE7UrP6Go9xGHmI/PlL/haMz1XtJgii+xNRuIS+YNZXluvT
         UmCg==
X-Forwarded-Encrypted: i=1; AL+hErEeXvmzgT8jZSKygbb6nGCuJg01Gk305odRj9/E+vsVir8pK794opX4XN34VesEW+S/y/JUKt3myOMV96U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6AILbjwp1PAZZ8HMqMIrMfQV94NfBu4HfhdrnFToDyEnJm+dj
	jIx+bmZhxXb/j6C/6zq/+UeaqH7lexxklRc1wGNP+V4gl4Zkdye+8tJp
X-Gm-Gg: AYBFou0ca7KoicSQIAoy45JCYYKNk1+Tma0j+u1J0WSUhaxC5l/6S4quMQRfKJ3+S/+
	Xk+B0KIdGulr7FgTmVEkaCuyyyoEac6JprLgYC7UyeWNgUi71xUNkkWDqHoyo09eIBLtG2jqq9e
	WFQaNDOv9dvd3mzQGVf4qSyqbt+i5r15Wk6uCvAqTGKQj3c+2W06WbLWiKzn4W/YtvA1JRFH5dl
	Dew9JNFOaOoYB7NfuUdsL9s9waIttJKJ1Zl/GIuYBe1IPpkMUXibSyBTcpDemgvkYZqgrjgYVkq
	ebl8FayETy4faqQWwRp+c/uBMhcfma6CYhwJmtSkViolQpdpbSxpi3j7ad0oe2H+oVSgSgXU5La
	78oo3SnlK4HqymZWnk3om6aPN1BadLUeRCcPRUAH4X4Ys/fGoKWucTLY/8nLHBqDisA8fz4/Jz+
	+iVA/efwtGNRfqqUIHm2bAeghn+dNPZgAJIzYyeiHnd4DI5aARiEFcTN10ef1O63R7KtR3idvkx
	oW1McSnUY/tU2/5rxXq/lE9hA0/2kEdGJdKFwBr5+Zl5AwDO4KgeWqZEn1s2actDhQEVThQdoSs
	S8Rtpk33sMeo54QpLpAZ/TIUr3D3Q1mSnpW77/DNOAOMb4zdNdyDGYfG5C8fT7RiWoJiOd3GTCG
	RUZoLDjD3ab1KSJ9PuU2hwUC97E1bZ517KSHkET3yMjwKhRWREnTfNvbyxf1NuyLfcmo9xb75ho
	HAayU0PNe1ltuQ6WZQ+KFaOU794vDEvISsAwbgKFZCK4/oHbM6L9c=
X-Received: by 2002:a05:6830:4104:b0:821:a0a4:5016 with SMTP id 46e09a7af769-8628985a066mr2039409a34.18.1794559754339;
        Fri, 13 Nov 2026 00:49:14 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm2034202a34.22.2026.11.13.00.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:49:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 01:48:40 -0700
Subject: [PATCH net 1/4] net: b44: keep phylib ioctls outside the spinlock
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-submit-phy-mii-reset-v1-v1-1-02a55f352a91@gmail.com>
References: <20261113-submit-phy-mii-reset-v1-v1-0-02a55f352a91@gmail.com>
In-Reply-To: <20261113-submit-phy-mii-reset-v1-v1-0-02a55f352a91@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michael Chan <michael.chan@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
 Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

b44_ioctl() holds bp->lock with interrupts disabled while calling
phy_mii_ioctl() for an external PHY. That helper takes sleeping MDIO
mutexes and can wait for a PHY reset to complete.

Keep the spinlock around the legacy internal-PHY ioctl only. External
PHY register accesses are serialized by the MDIO bus mutex, as they
already are when called from the PHY state machine.

Fixes: 86f4ea63e696 ("b44: add phylib support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/broadcom/b44.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/b44.c b/drivers/net/ethernet/broadcom/b44.c
index f994636fbd5f..e9f116dfaad9 100644
--- a/drivers/net/ethernet/broadcom/b44.c
+++ b/drivers/net/ethernet/broadcom/b44.c
@@ -2126,14 +2126,14 @@ static int b44_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
 	if (!netif_running(dev))
 		goto out;
 
-	spin_lock_irq(&bp->lock);
 	if (bp->flags & B44_FLAG_EXTERNAL_PHY) {
 		BUG_ON(!dev->phydev);
 		err = phy_mii_ioctl(dev->phydev, ifr, cmd);
 	} else {
+		spin_lock_irq(&bp->lock);
 		err = generic_mii_ioctl(&bp->mii_if, if_mii(ifr), cmd, NULL);
+		spin_unlock_irq(&bp->lock);
 	}
-	spin_unlock_irq(&bp->lock);
 out:
 	return err;
 }

-- 
2.53.0

