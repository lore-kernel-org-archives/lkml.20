Received: from mail-oo2-f35.google.com (mail-oo2-f35.google.com [74.125.231.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CE2372EEA
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790872758; cv=none; b=KRCWmPJZwSgmP12JF4NygFnGCe2+ZUPQfZA5baWP0fUgxt4lrS3YnvhJlQI+wzf4T7Z4h8TxuOmJoK8K2dk/RO/afKyAWOI8x3mt/LaTk+k5Onhz2rNA4jxFKkM1nzNasVT/eYIwCtyXUux8MJFRVuL0Z6tml+hJ6zcsq/u1UpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790872758; c=relaxed/simple;
	bh=yZ8pEMlr5+04Lc9s90jqT1IHCRskmHMu2STBpntj3h4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sjqyFEkEI1AOTJBqyuUdIMm3f47alZa0oO4GbGw2js82dUyQYtz0rHoTcdVnqkfynPAu9kr+E0b7djXtlJ/tltEn7zGONFu9jZMI/qOMJ0jzSKyvC1MKGAEV3snudseYWAG/DMwscULMnBTHMyahtcXNNAkZ9Qkpi3JU5ROOCZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qFpk/kQ/; arc=none smtp.client-ip=74.125.231.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qFpk/kQ/"
Received: by mail-oo2-f35.google.com with SMTP id 46e09a7af769-8212a719d15so729213a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790872756; x=1791477556; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R9zEVIQS5OKiabn9ip0ahxN59LSxsnePjNAS4ga7NA8=;
        b=qFpk/kQ/hCHYaFB3qmi3YHnRbGHyiRG//+JE4twTURphR82+crRZomlTf1Ri6h4b/W
         liIPON3O2+5p/IefJ+TWPQKcOIJqbv3pupEv/46m7eWIfzbbt/bF3K+aM2vEWzvug7OB
         cH4RA4f7n3ClCsu+GGey6fvaGcLrxwP/QvM0z5/skgkXiwsdIiCmbZ2tLX5WxqmIQDbL
         F67CYx4IOpeS/52TewEk1HRd3WZ70Y44TiJF3znA9FJvq3jSCSxbKtmMmNeJweXr42FN
         6Fgjwkbqtr2Lt15DSpmbF46DzgGf4KwF2o+dvAXs/ASf4xSYZI8wiR3JKCXJMzrnI024
         HQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790872756; x=1791477556;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R9zEVIQS5OKiabn9ip0ahxN59LSxsnePjNAS4ga7NA8=;
        b=uDTJ//Y3G9DOciq5q1KbbPhCrj3/XKs+NXHv8GExQXif9UeLOnWeFNgRNu1Weyd5gx
         9GoBy5XuS3vdyqn6zM10g7SwUcAalcPsAbocNLyuBFpjeAP2Phk2tZJxuLjUCNmCZ9uH
         e/DDAAvjQBzfeZxt2RrOGEz6a/rem72CwPdjLIAl9Vdr1DTzHgyF5y3eEM/rSk4z3IDH
         XYm9W0YDsKKywx1c6pIMEHfG2mQrBEWpdlY+50x8vLp00HGPHQnVjounYTcjEwycBUWc
         x77AGNqXdHVUiJLqqXVKpubkVznDBLLNoXYKjMLVjP/loZN0HGndUfyNhCb1jry92dPt
         v+Gg==
X-Forwarded-Encrypted: i=1; AKwUvBzuq9R5laPrMDE5o5oJjuQhcKzif1XPuI9GFEZUV6xtBA/KXZ4vcGobH4GWheAJaKuK6BeLce8qpuQb7oM=@vger.kernel.org
X-Gm-Message-State: AFuF++mUFy1G63imQXzJ3P5TNQ3Mx6mZA5KQb0oUncGKBQj0YYavMBn8
	rkYe1tsaOJRmL3iFcaNjHP+cYSN5aikTOhoOoYk4feyiW66hRgQHJhV5
X-Gm-Gg: AYBFou2/RZcAnquU2vNup+09ixox27YUK+KohUmkTiEkAUnzQxthI6F2AfophMXGOvA
	p9rnXDqf12vO6KNFHWsYnmZ8Nv0Xeg7c+tCk4A3ncgRrymnOV8AtU2b4msG9+/dg5ETuMn2rVyi
	SST8C+mEarZfVswmLKdvxWc8Z3fOaNaTMeCmSLbYO+irsBKclXe5CJNsY1OCAbxS6sG5XJdmLJP
	iUowGw5zqy4KQOu/mdPvo62gbC0nRJago8HSEaNo23KSQHQR58wQTodoBG9j3GWqMoaFkhbzTdp
	7SXwGdevqm9vzLIo1BnOA5F0k5K8OrUA6Z4ucPmVQBgCBxqFvtQIp381fFfasotDOoct88MYOKh
	PKRx+7C2P5+ArDh+/RKB89lVltY0+zHeuVhsA5tGyoFttLds7rNChLGdFBO0Y8uyQmiCzSmMHPE
	b/F3I+khv5+R/Uva/qJX7BI6T9aSjECrwrQNZM3p9pa25J3UC/aYx/iXyzx9UZH9CKfMCV
X-Received: by 2002:a05:6830:730d:b0:806:e047:cd6e with SMTP id 46e09a7af769-82283f5febdmr204700a34.8.1790872756122;
        Thu, 01 Oct 2026 09:39:16 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:43::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-822793967f7sm287919a34.8.2026.10.01.09.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:39:15 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Subject: [PATCH net-next 0/4] mpnic: add NAPI buffer depletion check
Date: Thu, 01 Oct 2026 09:38:57 -0700
Message-Id: <20261001-linux-mpnic-v1-0-6422ee74233a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKGMvmoC/x3MMQqAMAxA0atIZgMailivIg5SUw1olFalIN7d4
 viG/x+IHIQjdMUDgW+JsmtGXRbgllFnRpmygSpqKksWV9Er4XaoODTUWtsaqr13kIsjsJf033p
 QPlE5nTC87wcZXNEYZwAAAA==
To: Alexander Duyck <alexanderduyck@fb.com>, 
 Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0

This series provides a buffer depletion check to unwedge Rx processing
when page pool allocations have failed. Patch 4 has a more detailed
description of the events that lead to the wedge, but the high level
idea is that when page pool allocations fail, the buffer descriptor ring
can run low, and when that happens the device will drop Rx packets and
not raise interrupts, which causes the NAPI event loop not to be
scheduled, so new buffers are not posted.

There are three setup patches for the depletion check:

Patch 1: convert writes to BDQ ring head and tail to WRITE_ONCE(), so
the depletion check, which is not synchronized with the NAPI event loop,
can READ_ONCE() those same fields.

Patch 2: introduce the driver level service task that runs once per
second while the netif is running.

Patch 3: set the minimum Rx buffers needed per packet based on page size
and max MTU.

With those in place, we have everything we need to watch the buffer ring
head and tail positions from the service task, compare posted buffers to
programmed Rx drop thresholds, and then force mpnic_poll() to run if
needed.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
Daniel Zahka (4):
      eth: mpnic: use WRITE_ONCE() for BDQ head and tail updates
      eth: mpnic: add a service task
      eth: mpnic: set Rx buffer minimums using page size and mtu
      eth: mpnic: add a NAPI depletion check

 drivers/net/ethernet/meta/mpnic/mpnic.h        |  3 +++
 drivers/net/ethernet/meta/mpnic/mpnic_init.c   | 13 ++++++---
 drivers/net/ethernet/meta/mpnic/mpnic_netdev.c |  3 +++
 drivers/net/ethernet/meta/mpnic/mpnic_pci.c    | 21 +++++++++++++++
 drivers/net/ethernet/meta/mpnic/mpnic_txrx.c   | 37 +++++++++++++++++++++++---
 drivers/net/ethernet/meta/mpnic/mpnic_txrx.h   |  7 +++++
 6 files changed, 77 insertions(+), 7 deletions(-)
---
base-commit: eb0c18404c8943356f4aa164e5db9067b79ea93c
change-id: 20260929-linux-mpnic-428998421ffc

Best regards,
-- 
Daniel Zahka <daniel.zahka@gmail.com>

