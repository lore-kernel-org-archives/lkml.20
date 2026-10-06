Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D173E49F3
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 20:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791318243; cv=none; b=o4I2Y3n0AjVr1gkkk7c96etXoKC3Rk6hg8PJsXuiEMgHD75L52+GbDqI2REztBlPE+srxaP8GDhKxpBPkFY4h7pzgnh9OQTNWjIvPvvzDWv6mNHPo7m6dJb112p9JRwMqeqjYCTAZ7rMzMi/r0CMPZ4o0jLsp2w2rni0bHge+tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791318243; c=relaxed/simple;
	bh=+URRdGUal9XFQLtRU/xlYp4tgr/16QtNmNlu7sM/K8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sQj8i48nM5C2j469gvPvjlFP54TjxwUWODaqTJeu9uzPbqhTaqbEFSjcFpnjh9B07rP4iaSVqiB4nBhPv/VzPGp+NW9xR/3wWDu52uQAOQ9hLCuBwmAQU+Q90kchAXhosKyu7ugGF+iLYzoIVafN080JjlPyup4dPAbeO+RxwOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sKXIEpOM; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sKXIEpOM"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-88bda150550so704627b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 13:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791318241; x=1791923041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wA3wGwq193kNMSvPv/kcsZwk+hDicBszW8/PKsxbSpc=;
        b=sKXIEpOM32dHHBnWFueKBaF8VczfDTCDTGoJehyKkTrmWaN9vXtB6BTdITTS6Hj4dw
         hjikHayK6BN2GsLZbDTYPv5QLuxrYtQLNxuHxJ8CRhFz2dqvfYwg9A11jKdtnOUbge+T
         izapVKJRAGGKXdf8yucnRo4E2s4ggerRwQEloSCVals0HbWQNrOJE1ZJ+mSdSV240bw0
         ZW8otmPfwdhhtokInUeToDOZGXGyhus2P2Ysfz8vNekH4lAZ0hUMegvSggDoQ5h+s9KP
         2JvTdw/APazgPf4Bw5Eag0iaaclsbSu/9FI3xZ6itPy15ayM+VTm541PX4P+0bOsdlRL
         pfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791318241; x=1791923041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wA3wGwq193kNMSvPv/kcsZwk+hDicBszW8/PKsxbSpc=;
        b=fLWiX9q3gw214MeQ9nSBBNf/IGsHUPBrohdld4TzVA14G9ciQ5JTePEGIzCZCbKY9w
         YK8/9ZESMtpizEyatOvkuG1hEN85Kd4kVfQVs8Nzr5QEtRXF+pnbL6E/y2EMFa99+Cte
         oGxzEeIxLG3m3vBdUMrRoJpnkUgtemBuqeO7buUMtYyE9COKncjVtIpiEP5hunadxgF/
         Bz6oGnTqVi/KZObS+lIZFiiklnlcN804JD0h8hxralGCQR677QwyqiOsLVObTmV4C1Xl
         kSRi0b53+Ub8yFHCD7byM7uaqCGJwklYzd6Q/yxGsbOvu+ROj3+PT4MKpzPaGcUtq9hF
         0eqw==
X-Forwarded-Encrypted: i=1; AKwUvBw81csBp4uviQ0K1oyQj51qZjLVu41J9D6cfIjo1H9eG9zoSOg9fCko9cQzd30fW+V3dxbzo0Jj92xGms4=@vger.kernel.org
X-Gm-Message-State: AFuF++lUXuPob8qu4yiqwt3JG+S/hajtWgihITdkkrOnP0zYJ4tVUANz
	zRO0Sm3a7dxotkl+TjPE9CYqM+W314jfVO9ICzniC2pfnuyi66OUIxF2
X-Gm-Gg: AYBFou1W2CIWD2zXqNQLvu4xGPCSfU546n3dZBbONlw5X97YS/+ZT22W3DAAcjkHF8z
	jvpyiAEC17Cwv8QJa007masCbmFknPOffN3WoHxuL3zK5C/uW5/u3vIRnN0gbKAfOGvmPAeYUOW
	4NuiA10P+wp16SlvpMQpyMtrUJ655ddAsaKuC1dLnBSF+FMmMdMsiQ+Pc2eb/q0+XaAg98BRGaW
	7vWcp3giSet4jGU4NnmaZlPJl1Ofjf7WHk050owvu94fJF7DnZSsMnsfvhEYtcWCKAeF9DzafC9
	ss2YTsman08XKTVBFka08LvoRUCZ1eR4TiY0B58NdCWzeGfrgwc7gCXR20P9LcdKipxqt+/R5C+
	axS+ashOAlHaNCyrbVOYKezK/0MZflc1IGBrpCMaK0YAP/DA3lM2m99Bvg6OPQ1LMEZDMWjsbvf
	OLysxWKhKAITe/2n6ybqRz4AZIgRxclZUiwtt5uqyJ+VGgg+AOTT+omqENcUbP6zT+TG/numXgU
	K7xdRFVy3mL5H8FuCQrDl+SSPDAOFMZ4GqC
X-Received: by 2002:a05:6a21:2982:b0:3dd:ff93:a87 with SMTP id adf61e73a8af0-3e1340e0bd3mr138927637.50.1791318241162;
        Tue, 06 Oct 2026 13:24:01 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a92da735sm383218a12.17.2026.10.06.13.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:24:00 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Frank <Frank.Sae@motor-comm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 0/2] net: phy: motorcomm: Add cable test support for internal YT861x PHYs
Date: Wed,  7 Oct 2026 04:23:46 +0800
Message-ID: <20261006202352.1616626-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The YT921x switches integrate GbE PHYs of the YT861x family (PHY ID
0x01e04281) on the switch-internal MDIO bus exposed by the yt921x DSA
driver. Add a driver entry and TDR cable test support.

v1: https://lore.kernel.org/r/20261004184246.1260426-1-mmyangfl@gmail.com
 - split into a driver entry patch and a cable test patch
 - update comments and kconfig
 - add yt861x_config_init() and apply the auto sleep setting, restore auto
   sleep when starting the TDR test fails
 - use separate variables for the TDR status

David Yang (2):
  net: phy: motorcomm: Add driver entry for internal YT861x PHYs
  net: phy: motorcomm: Add cable test support for internal YT861x PHYs

 drivers/net/phy/Kconfig     |   3 +-
 drivers/net/phy/motorcomm.c | 151 +++++++++++++++++++++++++++++++++++-
 2 files changed, 151 insertions(+), 3 deletions(-)

-- 
2.53.0

