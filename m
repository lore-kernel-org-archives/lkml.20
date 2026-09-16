Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE4848FF79
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577020; cv=none; b=c/OYPpWW0HVr7lAfOSsr08US89MwoWNXBIEkXLiacyug/T0h3wq8OFLJa1cc8lUkS7+fegIhuO6USr9QjLwX+exeujAeqjJTuXiWkN1OLwOW+kp4TaGm3WGZ23LOkLEVtbNr69sSJZwIwHK8Q8gSKa0uk8QcHsua3cw3ZWNo/Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577020; c=relaxed/simple;
	bh=cRIImi/lPk53n1lWQ4BsxrEtpf2R34//cfhxTWVnMy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M+DYu1/jn4I3MW17qZC5NnFwXucagSrhQG4vYs+OdEQNgrbpJCahiwVOyD+rIMYH2fBoyBqpwUAeMttOx7ostpGZzKvJPxEQquI6WHLx9aQE172kTLKvgRcDiHUwnYNfvOpXhRix8z2amIgtnslx/6Zkfo3MeX4pl6tgjSE6Dgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRus32LU; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRus32LU"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2dso701636a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789577009; x=1790181809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0VTiuPg5ZB9LmT2MDT455GVREdoYqL1EhzCrifxbyUE=;
        b=JRus32LU/EnkGj5DeuL5SLHyT1OD2lCGh1d+YHTlCbRk04adSiTFP3zQj1vSlsfgCY
         57tNl7brpwFsYy4fTQQyAEcfXpJBIbgqcLv1Gfuy37h/HY7bL7TD038rNCgZAFTQTRLy
         Jhg0voYfBrhywPUNd84UGM70kiD1Zfkrkomf/N9XhKp84dyXDmFg58/jXMsGzIsBtiUZ
         2ZLo9T4FOvjVYCfOEeodedJymBRADJDb5b7tOV8WgU/ZIH1WxLON1EXduj7SlVaVdKrZ
         jor8yuHKNtUgGFa1J5U7eDGFc4Zyr4NtKojZNsogHBgbWNtnjVlG9fSdJLs9KJXDrE82
         QtOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789577009; x=1790181809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0VTiuPg5ZB9LmT2MDT455GVREdoYqL1EhzCrifxbyUE=;
        b=Y+uRnhRfH9kpijmugKvNmk3Wah4jzyy0MmoBqHXpViUi8i3Un6YUPLTK/1nektoQuR
         U5qsjL6ePMPXXs83RNscJyXG7BZj7shcmBwUPXkglT5zOmY30/Q+Zlek2ePMIXsCyVpR
         8fA+4VmLCGgoxmxmSgDJ21psmnsElr1eLeEl5NrJUcxEMseOEidXLMFbhcGbpltCx3/1
         5Mhfc4OMi9Nf0qHAfTh7Iqz+rurd3x4TVHf3qQsmh9b9H/CTeOYE6qR6Mj0j2iS812vr
         ZE2HKMjcw2apxisyjsAptkL5yw50YRoApPaPrx7rPsufaqC/ddKHWZqtYLJpYoINWDQ5
         zzZQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+3wzWSUJ1Rr0pwPnWie89pnIHdbQgpCcEwWwh31Ioo1EG1viR8tNbMDXT62rY6CdAftRPtLmx+2fa77A=@vger.kernel.org
X-Gm-Message-State: AFuF++mlRSQAjmhJ5z+dW6iHhRv8jd5UgqZfz/qoLIqbdj1LDanteO8H
	Ax4CNsn0TH6byhU1Ki2B5XIsjy0InJRAUHTZUVqSYCnZ45bgFwZSdcqRqlZqOZAS7Vg=
X-Gm-Gg: AYBFou2Yf7vqnCDL8Hy/sUIQOXE35veiV41AS2sNiM/QivBgvmu++3L6cEBQ1mJX7OE
	2ygRMRDYbh0kpxFBuR0MQgPtIn6I+zH00kAe/9er4KEK+7y55RMeTNzwNvTZIcq5Z+9BXWr0rdP
	ewXekBxabd7df/h4pQmxoGj4WIXPZH2CU7XCqnvPSSbUQMubFVXOYDX3pcxrG09ZLFbnPYb9XOk
	v0i9muO3X5XUGPbsthLDIt4Vr6CYjMnlYZkx/bDshEyMTIYl71LYnAvlWFHMwVAo9kTuoFbztOb
	1SpSfXBJhms7DR9lnu0SrFvOg9BgrM/svjwy5Mtla0k9YhWfPd2p0XHZkTjqbtGkwectec1Ju1y
	eiW1orWlcqE+8Z+cYnbYxde/4QoKLcAJ26WCHfJvwDnxhpbqksQ8EigUKiSxbbiwCWIur+7wZiO
	vgy4dmKA14HJ6VB9DjsTVgyM8xLupoj8WWc1h4R7aSuDUdU3dVcrMUVXaaXPFfpHG29E0FK+rmm
	DHy4nn8nEu9xAwDIUVYiwZvDMbhmmM9U7G/
X-Received: by 2002:a05:6a21:e8a:b0:3d3:b00b:50fc with SMTP id adf61e73a8af0-3dd5f7b3ab7mr8788940637.28.1789577008744;
        Wed, 16 Sep 2026 09:43:28 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661a:1232::1d0:c5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50acc757csm1902278a12.32.2026.09.16.09.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:43:28 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 0/8] net: dsa: motorcomm: Add SerDes PCS
Date: Thu, 17 Sep 2026 00:43:00 +0800
Message-ID: <20260916164310.3168269-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support in-band negotiation of the SerDes ports.

v2:
  - Remove YT921X_PORT_MASK_* macros
  - code style nits
  - unconditionally write BMCR_ANRESTART
v1: https://lore.kernel.org/r/20260909190541.466476-1-mmyangfl@gmail.com

David Yang (8):
  net: dsa: motorcomm: Remove YT921X_PORT_MASK_* macros
  net: dsa: motorcomm: Split xMII and SERDES port masks
  net: dsa: motorcomm: Check port type with runtime info
  net: dsa: motorcomm: Fix register bit field names
  net: dsa: motorcomm: Introduce yt921x_speed
  net: dsa: motorcomm: Hoist port_to_priv helper into chip.h
  net: dsa: motorcomm: Split MDIO bus module
  net: dsa: motorcomm: Add SerDes PCS

 drivers/net/dsa/motorcomm/Makefile   |   2 +
 drivers/net/dsa/motorcomm/chip.c     | 525 ++++++---------------------
 drivers/net/dsa/motorcomm/chip.h     | 106 +++---
 drivers/net/dsa/motorcomm/leds.c     |  14 +-
 drivers/net/dsa/motorcomm/mdio_bus.c | 301 +++++++++++++++
 drivers/net/dsa/motorcomm/mdio_bus.h |  54 +++
 drivers/net/dsa/motorcomm/pcs-921x.c | 235 ++++++++++++
 drivers/net/dsa/motorcomm/pcs.h      |  13 +
 8 files changed, 793 insertions(+), 457 deletions(-)
 create mode 100644 drivers/net/dsa/motorcomm/mdio_bus.c
 create mode 100644 drivers/net/dsa/motorcomm/mdio_bus.h
 create mode 100644 drivers/net/dsa/motorcomm/pcs-921x.c
 create mode 100644 drivers/net/dsa/motorcomm/pcs.h

-- 
2.53.0

