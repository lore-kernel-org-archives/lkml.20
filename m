Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1CA47F782
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789596584; cv=none; b=hzbtYVK5YiE9J+E66FRpelGOIuhNbHqVXgmKz9pta88xISfjXAVoa4BGQbHV6jSteZhR1pB3rhhytLLWim/iFFUpRQaDIIEC09azs9cnClcyqGJ4ThmysKt0MhaeMl8sSWP7WLd48FWyj7vuSuXY2u0yJgUFSKy6uDEIx3so518=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789596584; c=relaxed/simple;
	bh=mgIRnJhD7/q5FZgYZI6kuJKUCV6F/Iu6XD/5WNiODeY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ehL+ab4Uq7USnGvCElaaK9mp7gFkGcOpISnu5XufaYsYaI/fyc7HrKSXRUo0aZvQ5avz2IYiiuHEolqFaVTnhlJIPLKffZL+QpmtfqZaxOubL1TWmLec2yEHIIq6til4Kcp8a1VP7XzaqEbrkOrhdVtgyInEVIWfQpcF7npUb2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FG7eBbFM; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FG7eBbFM"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fb334e72so1915455ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789596573; x=1790201373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GOo/om/lDHfRUoYT5QkmCr+jFQv8NIVl7KYNHNpx/+M=;
        b=FG7eBbFMlATJO2NT9x5PCPQMCrBryM02uSk5p/rfxYi0lgbI3vfT2na3u0AwPpTX4k
         43Mk+tiyYcN+PF4fl9M4+43eho6LbPNfnKIiR9q9FnoKTK/72XMXM6lt/WWrxZKtWV4M
         P8ChpTnGXJD2WmScdD6asgWr0QXUjeHxbq1RgY0ie8GBrgjEGm/qjwVxutgg2PIcLtZT
         uZvdSbz98dKbjgYjdgOzESeOXyR0aRp+VGwDqTYvxsKj8TWKDdaCXN8oWPyPch1eVUFj
         uU/IPCVx1C57j4LgENtYwgBDuX6fqbFyhn7PKGi1eTfGt1gR3r0UEc39omXolh01dsA/
         H5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789596573; x=1790201373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GOo/om/lDHfRUoYT5QkmCr+jFQv8NIVl7KYNHNpx/+M=;
        b=BaKFiRMVxldky+f0w6uPx/eitzEsSxrOtPunHMvsLmZEWhf/uMMnhSTTUayS46WMtK
         h8jDvcjd26Oecwif9TRksZRotHpOgBmKxr5MnZlNmwmm8r3KzSqlnFuVQamP6L5AyQ71
         sD61f4tv3D7O/wItNF41oLAkR6BJzDF4yjJ8+d1MU3q6iopdWwZFgC5Kwlfk+NXjXWfG
         LNy8hcrAjzwe2pp7NvMMXZ2yafLbRE3mqf6hkLl+ycUs81bteRvBCgspW0FPF6t6PxjF
         XtKw3fxgLyedKo2WM++zVUajZZxu9MAFKklka6UiuTL7X7Qv8cTvHw5OBLUUGnRsWChH
         L0pQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHXp4kGYMnxKtyyqhDzkvT+rSJnd4lGHoGqPsEHc4cxb/OX7DLSw3oEbINKV5dwUPsAIwqTMPF2dKIHNQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lXYD9JtVdGEakmbKRHNWxGidaTs2aRQ4FPTOnSiWyBEeoUHCTf
	Awg3PMu1kjJVi/w/1qg0FosS/lDywRa7tIC9cRF9pOgtSYI8yDnspBKS
X-Gm-Gg: AYBFou0Pd2GQQpgQFdUDKFQUI5sRY10T+jWwAT0lDaeq/PjyfsxM5uDP3eKPEu5lzeY
	ggUTROz9T1YeBy+pA2PjDgpjS6kbYpDsSe4oE9K1ceken4gk0aGYVXIOYZjys5/Pr8mfg9fxwiB
	utGO+kl80l1DIVisTa4kBsAa2a/ilIXk8d5NsSb3kUclH05j+w28nzAYnNxSVMw5OdYAP/BBa4l
	1W8DgWjlf8AwZdw2UedUc+lgiNOUx2gLP3uRG2Uf1gqP4nVKtDtQpkTyq9bZ5nd+lXkBZyUnmn8
	FjGtTc/jJqaizHzHCgt64lg1IJB2jEjvai0Q3WHW6gey6Nd90qVM+6epTKBMjXbexVar5uytf+8
	ZkM+WULAaiALKBW+xzd2h3EYDwiHkE7L50sEt/X+HJFQYdWEA9lRnNySnbuXDwaE0Fsbooo6bkn
	crxVgL2IOgVF/DD5y79dLIDAoyolrK1TF4seftzWazeT/pI/uza2HvM3G6ub3r3ziZ+/D/ae8oV
	4hHuU4vYWN8EVda/rM0seDPuBNUNFw1syVLRCacLPFTO0XN3mXVZx+dOe1sR36AsmNPCUIU9g/z
	rcNMXvZJo4XigKgPEUTVPXpeUa9dHvIGHTguOwYpIFm7IGdxlt1mCH4T3rQ=
X-Received: by 2002:a17:902:ce81:b0:2dd:64:12ac with SMTP id d9443c01a7336-2dd8e632d3bmr84807695ad.11.1789596573331;
        Wed, 16 Sep 2026 15:09:33 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89e9290bsm17471345ad.15.2026.09.16.15.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 15:09:32 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next] net: fec: gate MPC52xx driver on PPC_MPC52xx
Date: Wed, 16 Sep 2026 15:09:31 -0700
Message-ID: <20260916220931.262932-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The FEC MPC52xx driver only applies to the MPC52xx family of SoCs,
but only depended on PPC_BESTCOMM. Restrict the driver to MPC52xx
platforms so it is not offered if COMPILE_TEST is applied to
PPC_BESTCOMM. Otherwise the following errors happen during linking:

ERROR: modpost: drivers/net/ethernet/freescale/fec_mpc52xx.ko: symbol 'mpc5xxx_fwnode_get_bus_frequency' undefined!
ERROR: modpost: drivers/net/ethernet/freescale/fec_mpc52xx_phy.ko: symbol 'mpc5xxx_fwnode_get_bus_frequency' undefined!

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/freescale/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/Kconfig b/drivers/net/ethernet/freescale/Kconfig
index b34c0fcfddea..d81984fcec64 100644
--- a/drivers/net/ethernet/freescale/Kconfig
+++ b/drivers/net/ethernet/freescale/Kconfig
@@ -38,7 +38,7 @@ config FEC
 
 config FEC_MPC52xx
 	tristate "FEC MPC52xx driver"
-	depends on PPC_BESTCOMM
+	depends on PPC_BESTCOMM && PPC_MPC52xx
 	select CRC32
 	select PHYLIB
 	select PPC_BESTCOMM_FEC
-- 
2.55.0

