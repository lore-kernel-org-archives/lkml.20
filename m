Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC77135F170
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788980762; cv=none; b=r7fqLdFbucBAF5IAcOz4THBf81ml07yP7K3FtMnJ4lktjQRxGwSWh0WyiyDvqvdvESARISxMSFQAVrH6DCdRMTP4Xwg08iw/T+rBXPY3lpmd17OZeyBCSsQqJ9yA+FPTa/rhu1f8godtjVdWBvW1d53iQGKBNpkpi8gQKNnNQe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788980762; c=relaxed/simple;
	bh=csUnlEbhOeXy/9jTUSoOBwNu4P86P77sQ0DCQP3q2DE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eWnlQzb9k9X966Cmz5dXq7xsLdOYJni5yBNgmVwKnU0O9v3v/0qg10eMwiOxApBaiQzdSRp6TkgMwDFgZNN5VB2YAiYrP2rbZHr+tMsOA62qfkdZevue9UmoQzzZFxkR5zMBjX/ctsWieSg+nGxtRpM8E0yD05ew8X06oMPO+2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N9Qrbn53; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N9Qrbn53"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d560775ca2so44908925ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788980760; x=1789585560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zv3r8Pr/gPLGPaKoMMMXq0qLzS1CADwZNQKVCLAM70c=;
        b=N9Qrbn53V45zV1pFOyY4MTEjWsvzW27NbMKAt4B9520tFgu8astcXKaeXYXIRv/Q1m
         e5L19M26r30pIpvXgNAy0bQHwa1eTMkZN4KDRfI+c8V6koYE6KCNzUOq9eg/PmAe2FbN
         iHifLmHedPNJl5BkT5A9V8XBhPWZZZrF/wr5M40upKLd8JZvwLcUJrxdcjPhizAa4uGk
         zvEvrgekDXMvQeLIumyb2/dvu9lBnqTG3vg/gmu55M9RrKFwQ18jZA4GszErT14sombf
         6uhZ4C5ekooUby9YNcFq8NhMXzpLpZCtF5KuxStDVMdZSpiC95YNMDoFTR1G14r7rFVl
         hvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788980760; x=1789585560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zv3r8Pr/gPLGPaKoMMMXq0qLzS1CADwZNQKVCLAM70c=;
        b=dhq6rmImktMB0EvPMMbl/1lyZz8nRiFFz7mEmz/1DVR/EX+7EKJGWy1j59vlMUycxT
         NRaBPpA+2L3WDTfM/Ot5wdqpZoMbQX9TD9OUj1Cf1xQbGOCZoWTC5t9VyGFcY+OLRQbf
         rvXLGPRxtqopacU9adWE5SAj9yg83n2RaX8XFM69wg8pzDGZze5kDrq0DT+1NXuq0bL1
         FTn7Jbzyk1x9IWVJoq9b9ZAyUaWlDuU0quA8sFqfO6NsWd6BTgnfAtIDMHyFbSsHdz73
         DylhaoIgweEtuNZ1taIPtXj6PD9roEIKr8RnizC28E93s9C4aYbA7AU+sQ3d3xByEB8Z
         xCLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzG6CbUKiNT07zKyZGYtHASSH1o65pJdY6q4UgVf0T65RQwuh7UjGbKd3vMN077FBrVfltWDehhh4Bv+tE=@vger.kernel.org
X-Gm-Message-State: AFuF++knSHY+UqCW2/fjoH9kk3gF9b5I/8FQn3pv4anDrNg6TyeTn+vC
	j4iLqnqY1goFloQYlJ8yt80HvB4VuN59+N1Tb0Q1Jf4neA7h/a0tR2Jz
X-Gm-Gg: AYBFou0JMrDfB93FKEytugQGcLAWv1V7IgFZQotAtT97gcwcGbbldBbmBZ8M/bM6XkU
	b+QIJKDDsxQD0YATsqjn++j/cSGoU/TQ0Jbdrh6U3v/ANachNtRh1EaFM44eQkCgORvZ02hOwoh
	lwxoeSY8qlcHakQl3InFEE41BkFi9bJLPi+vNAacBIMLXNUbE5xydNYLFUoww0E9Hc2ljob0fgz
	e3UwZTJG/hvaEmYS4/zTRS8owXosBrcG2GMaWIKr9yHzStx2MB5+8z3ubOPhyYO60MSUj7po8XR
	07Aczq+GW3/utV+XV1CCSDz/e8z3142EHe11IDlq4L1NnOkp2rGYbRIrRdJipQINN0YABb3oA8W
	D29W2JlwcTvNYY5kbuanoo1WlQJAM+9cKDJBTGatPYb4Rc4X+9ghPq/ysRQ6CcXH94yg6Sj5zmy
	yUI6raBdmoyGvJLZLPRBvHOiXDqq8JXDGmz+kbxigbeKjDewWGfinGPH0CVJSyAiOhb2LNGTfGV
	BazWJpEv5Uc5g24Bj5OM1HP
X-Received: by 2002:a17:903:1a70:b0:2dc:feee:3963 with SMTP id d9443c01a7336-2dcfeee4413mr68077395ad.9.1788980760004;
        Wed, 09 Sep 2026 12:06:00 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:d30::4d0:7b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dcffa9827dsm13988515ad.66.2026.09.09.12.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:05:59 -0700 (PDT)
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
Subject: [PATCH net-next 0/7] net: dsa: motorcomm: Add SerDes PCS
Date: Thu, 10 Sep 2026 03:05:28 +0800
Message-ID: <20260909190541.466476-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support in-band negotiation of the SerDes ports.

David Yang (7):
  net: dsa: motorcomm: Split xMII and SERDES port masks
  net: dsa: motorcomm: Check port type with runtime info
  net: dsa: motorcomm: Fix port control/status register bit field names
  net: dsa: motorcomm: Introduce yt921x_speed
  net: dsa: motorcomm: Hoist port_to_priv helper into chip.h
  net: dsa: motorcomm: Split MDIO bus module
  net: dsa: motorcomm: Add SerDes PCS

 drivers/net/dsa/motorcomm/Makefile   |   2 +
 drivers/net/dsa/motorcomm/chip.c     | 490 ++++++---------------------
 drivers/net/dsa/motorcomm/chip.h     | 129 ++++---
 drivers/net/dsa/motorcomm/leds.c     |  14 +-
 drivers/net/dsa/motorcomm/mdio_bus.c | 302 +++++++++++++++++
 drivers/net/dsa/motorcomm/mdio_bus.h |  51 +++
 drivers/net/dsa/motorcomm/pcs-921x.c | 209 ++++++++++++
 drivers/net/dsa/motorcomm/pcs.h      |  13 +
 8 files changed, 769 insertions(+), 441 deletions(-)
 create mode 100644 drivers/net/dsa/motorcomm/mdio_bus.c
 create mode 100644 drivers/net/dsa/motorcomm/mdio_bus.h
 create mode 100644 drivers/net/dsa/motorcomm/pcs-921x.c
 create mode 100644 drivers/net/dsa/motorcomm/pcs.h

-- 
2.53.0

