Received: from mail-ej2-f26.google.com (mail-ej2-f26.google.com [74.125.228.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CF7446067
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789562569; cv=none; b=awnfmjVJjUNhCttxI5B3oXjkCwBnoA5lA2SCNeEmbqSz1G8GKrPUjOxbrt2w15bU4mNCs9DEbEkVpI/OcuQv1TbVzgiq+BxNY6dUk9QmTOy51hnDczToIZCk6E3wsw7HqZOCA/XtGbkoOyTN6pIMbP4bsRTJDaz6qU7VTE/nVnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789562569; c=relaxed/simple;
	bh=O3kCx8wll8cftRShmLU6mCy2LT8u/tOsraI5NQjuTag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dCo1Jt1uQcIO7dPuAKZ+0MxT5AWHANmVnK2a6Nym2+/oKW21lwf1jyw6CYR8tU5H9RM7HHViKZF8WIUI5G5pobPPdT+k93hdXlCVO4a1/Ccf6638dSt4a+uzdaXqHUTcYzACzg5w+38nYOb3oopI+6wcEJpYAvcwmUurCQZw2mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LU9zegG/; arc=none smtp.client-ip=74.125.228.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LU9zegG/"
Received: by mail-ej2-f26.google.com with SMTP id a640c23a62f3a-c2940ef15d3so126302766b.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789562566; x=1790167366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CSiRXz+rk1x+flrUjYGBzi7758ew3AZ+JbhIvlUn8pA=;
        b=LU9zegG/RgLOwltPk1hhEmW1xq1jVj5bL8S3hbpUP6TuyE7XoRre3JcXeTU4ZAVQpv
         RFYrllxITghVI/g16sOlp82o9yo1k4Te31ys62a90kOy8GLQ1a3lkfJaUSgTCdz3Sul0
         39Z2XpHdtjDr34tNt1mxdUlc+hGOVu+xZfRQch7Kg6EBYwCEvS4357kZ1kDtRLsnBjiY
         /DT/PH59/GM092u4TpL/V2PRp2KdHKO5nvIG3/MrBBhK2B7JUGz6ep71vgGdLJWLbPsY
         GCr62WWoKRjOjTejp0HlhjTLgweGB792zGIYSak9ANclj8wtYM5aOhQZ4a5/zpqn8wLV
         nwfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789562566; x=1790167366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CSiRXz+rk1x+flrUjYGBzi7758ew3AZ+JbhIvlUn8pA=;
        b=hqGjtEtaF94JbaXz2ughO7avm5NHA0ZX77qooJ55V7DZoi/tzZcNOImphf6KnsjFhB
         Wnkp4fL4e0ZoJt4MW5ucKSXADbo1uRwugfR7oHUPd42wgxq6rbkmJ77lT1xm8cfTV3nl
         j3GkkLpTInw+cN6vMKxS9XJ5T/sioWCyHzwCOhB3RnI+o6KMywBi2ekhMfSTSRfHpEJm
         PNo/r+Fu1sIj8jtufxZ5TsiYEXGtB0nT2WAzi/PSjc77aXV85UEONk9qphta1vqleB12
         xPe+67hacFd/G84OMN2M6CqVNFHw7JjSeTyw98jD22Rx3WNbF2U1jtJzjvATvEzs3dRJ
         3EWQ==
X-Forwarded-Encrypted: i=1; AKwUvByar+H9P4DK3mig5U1qDpjE+L4UTOPw2ArXtM+s+t7nUXP67dupi0UETgHACDRWOmEJZ2hrx3TW95xHJIw=@vger.kernel.org
X-Gm-Message-State: AFuF++k98K47YPtl58IGscauv7RsW7agz7sc3OYh7pTqB56DU8S9giOS
	TcSh2P8ac0Z50DdHqgTfLfFXCoYwbWeTzk4CotuwyO1tAsEfcwwVvB9UQ+N7AGmjEw8=
X-Gm-Gg: AYBFou3lIWTH74I0EbVUdF9VTgJyS8mB9s7syHF9DJYg8NoDmzAxL2sOybBAshXVQ69
	fulO07y1h4fJ4h43SD/xm3Z2+H81A9GECBJxZAzE4X2OPI3X9NMaoHhTbrYNjZJkCyGNVCHgiCc
	R3wV16C1gnwRoxKXf7k5eW1PYYu9tbV7EFWJDbBzwmHBaUI+Vb3rhZIUXrllbmstBKqa2iV0gYD
	pS+9HTiNVcneqTaJH9e4SOIV5Uau4Q0nhMTtphpHfse5otZOcxTlqfvbiQkgTjcbp1lHpBZjX2w
	Qb1pwWzmDZrL3C+YWPyvxR79ifvuRrIhqb1XGybi8448Fm/j3/0lC6LHyIXfwtyxNZIoL8TPeRH
	OUkJT2fVV3yISNSTecUmk8/9ujX071u1EGyjAtLNgTvXqptlE9alDqXFwySnv/dEdSYrgYj6hys
	IAzf9BuNykavJS+MpBadv6bCibkS0zDGiv83ACVheLvgPdwtpAquJXOt5BFs0gYRtWjIYK2CgyN
	MkU+5LFqZLSmhv0lJFL5BAjDxNa2a8tBrGz36+b3YHgGXXk3r/DyZj7MVtNz1Uj6jk1b/lnP487
	rXJENacO54cnoIUdkM+C4uSCsXPhbCjsKZ1X6xYUt455GXR2GHQxENFSx6rX1YDuaRJCI65fL0L
	Jitj71nkM26HIrWQ8ah1rV6qbtjg4/H8xVUq/O20Mz97v0ytRkpj7Lh6ztjxlwBhhAM5CU+CUIZ
	oNZr5th1Ky+9hZqPceiQrfsZZ6p8jjpqG8ik2aHKjt1W7P9lcekYUB5SCCEkCWIjdi6MCgAVMkF
	1XQuGjp5XA2dRnArUI=
X-Received: by 2002:a17:907:c22:b0:c29:c531:7525 with SMTP id a640c23a62f3a-c29e523eff2mr323459366b.7.1789562565839;
        Wed, 16 Sep 2026 05:42:45 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.oa7bb030819b2a894-tp.internal (225.220.204.35.bc.googleusercontent.com. [35.204.220.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de5baa11sm132865466b.40.2026.09.16.05.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 05:42:44 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>
Cc: linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] can: m_can: pci: add missing pm_runtime_dont_use_autosuspend() call
Date: Wed, 16 Sep 2026 12:42:36 +0000
Message-ID: <20260916124236.1389-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

m_can_pci_remove() forgets to call pm_runtime_dont_use_autosuspend() on
teardown, even though autosuspend is enabled in m_can_pci_probe().

Add the missing function call.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
Found using a Coccinelle script I'm currently working on [1].

[1] https://lore.kernel.org/cocci/20260916095616.1394-1-joshua.crofts1@gmail.com
---
 drivers/net/can/m_can/m_can_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/can/m_can/m_can_pci.c b/drivers/net/can/m_can/m_can_pci.c
index d11a7c88fc32..3c595749b5c7 100644
--- a/drivers/net/can/m_can/m_can_pci.c
+++ b/drivers/net/can/m_can/m_can_pci.c
@@ -159,6 +159,7 @@ static void m_can_pci_remove(struct pci_dev *pci)
 	struct m_can_pci_priv *priv = cdev_to_priv(mcan_class);
 
 	pm_runtime_forbid(&pci->dev);
+	pm_runtime_dont_use_autosuspend(&pci->dev);
 	pm_runtime_get_noresume(&pci->dev);
 
 	/* Disable interrupt control at CAN wrapper IP */
-- 
2.47.3

