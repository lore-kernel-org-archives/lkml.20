Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1B238DC5A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831771; cv=none; b=QgGSgR6Aa6LousQ/pDOUvBvpfTjFielpBuDFKBi1uF0s4VlWSrS+3RX3XFzKUVrWp5+Kp0otAJviKGoPEdgMN+pLR8Ncqys0l/JZ8tf8vPWS0jNGcVnSAGKSNJBnMQhKmj/MafEfANd3gYv5gzvJjWLJ45JdKCEmXE1kn9wAphg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831771; c=relaxed/simple;
	bh=UVpA8AD0Gyn5+hbqHWxl6qLl2xoAn/CS31SBxbju2AY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S/VqdC/+tpj+q6YjPOt79Rio0uUWl3zk/VLoWQdry6sKk6va2F+BAVX1FEBlfGEKwuJ5e+OLZ55fQBP/bAl5wqNAkZzUzVKX8clNMHe8OCfmvyYcGjj7R4Fx3J2QgCmg7ujl4TZAwLSRSn03aBZSDSEvhsMgOhBCcXjk2XjfysY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=JS8RJEy1; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="JS8RJEy1"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91b54d1e9cdso23855526d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791831768; x=1792436568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NsX5ifbIFiwOB5Fk2usg+ffCVqV4aLQttHMxiozc+Xw=;
        b=JS8RJEy1WooUDM2iPczfpTThXGwudZdzZ1I7ZsdRI837ZeY3pj5U4SxF6oa9a4LYyT
         Z5+W16VW1yHIpmseFf3ndH+7CG1OGMkvheiQW44QlDMO65uPViJr89ShsTdHOI/80uUz
         qan15LLh5EsssIZktSQiMeA2Kc2rhDP/SptwF5D5HeApsM7DmAsxKq8uT8fhJS6sTCyY
         xbZWHInUAedu3O8KfqfnOyLURXSbnIon4NyJE+osteXDNTT5/5CNDBil3YDKByXtu9X5
         U9fvaqdLb2D8x7pBwsdCUpN0IzaaggzHrm/NFHIqYrCKg/tYBIEYaQJFrhqYS0rvcJ25
         lm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831768; x=1792436568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NsX5ifbIFiwOB5Fk2usg+ffCVqV4aLQttHMxiozc+Xw=;
        b=uLBLLpDGgBF9XknbYQSnJ44/6dv4w4S63kE8L1iDkxPg57chhjvXE64+JSmLSlUA86
         FUYwJG4BK0D8dba9jnt04LWpq/9xHVdHLQWdHpFdY6nALyi0WkqVnYjnFx6HGfufX0FN
         BW6UDoDRPYNqamI9CM0teGJXTWNIg0HySE6hMLHYJE4x4KKxecvWb0faM8STvA4RxS7Y
         jtHZHSFyLqUcNLPNsAXYWwhhBYqX3qIT/igX6MKSHPbm0Sc3C/kG164yV/EaAlESldyQ
         3cWP4+gLv/Wu7s9lPDnVT2Ucys8VCPaZa/rKvdJN7YAYMEbZUJ/ldLEEZgp2NcwxD3NB
         XUfA==
X-Forwarded-Encrypted: i=1; AKwUvBx568aOeQGShWF3B1ryp26fS2w5y2OczkJb62Oix6c+rypJEIg8KlxNvY/u3MNLnqN1KgoRKP6c04EF0kg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJe+zblocoDlDLlb09cyRXYzSdAZqbIHn/EFos5NKPpRFX8Jt1U
	Ne9a92NZnzGEt+NLwIw508fXZYuIgq9T5IwaeYDNJzFYqLSrE/519oJJd6ThgSYiQUI=
X-Gm-Gg: AYBFou2PZ2jUbE+XGJXJ6rFiLUFVysT5Yv2T0ZLzzmK3SMbe+WiNn95pB3GSWdsRKyv
	bz11eIVMCia1jod0qGG/KSnMcr6NAcVb/orEaiJl8tzu+3H5K8ZsDlO/HdJiI5xhd9CloaEbsMw
	MpxsfFIvOFrhwCZU06IaJiyIff5f8dt7QaPqrkxH310d2f8JAd+PJ8yaY53MNlrAXR6iEdv/PW9
	9zcZx2x4HD6ADw4aQRxSRHQ4Cuh13TshMKlYHkGvBMhNEtRSjty6jDfKFT+LmAv/dVtRSXDl1ON
	iRkTC6hVkr77bEI+MA9iLhFd2PMwBMRP8rdsNmF1APgsjwGiUwWj31QWLDgspeTzOh5uaxKTubR
	Yn3N9kWWd9Bk+pUDcx14oN4bMaLoG5XcOA9qbLh7NiRyWrjUGFbUVn5qZTJWyTAt6n/rK9vdj54
	qEMphAWDbW0VyW9MrXbKbF+YYdswmrDqN7Ngjh943ovLf9zQ3kWL/QWwb/lcz6QpZHr8Gl8qSLx
	lA=
X-Received: by 2002:a05:6214:4508:b0:91b:82a6:d31f with SMTP id 6a1803df08f44-91b82a6d953mr60928806d6.35.1791831768296;
        Mon, 12 Oct 2026 12:02:48 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97c4a7cesm4815216d6.48.2026.10.12.12.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 12:02:47 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: tglx@kernel.org,
	radu@rendec.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	danielt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] irqchip: add TC9564 support
Date: Mon, 12 Oct 2026 14:02:42 -0500
Message-ID: <20261012190245.3988619-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the "MSIGEN" (MSI generator) interrupt
controller present within the Toshiba TC9564 SoC.  This device
collects interrupts generated within the TC9564 and forwards them
to the host as MSIs.

The TC9564 attaches to a host system via PCIe.  It includes a PCIe
switch with three downstream ports.  An embedded PCIe endpoint is
attached to one of these ports, and it implements two PCI functions.
Each PCI function implements an MSIGEN unit.  Access to the registers
used by an MSIGEN is provided by a PCI endpoint bus, which exposes
BAR4 of the PCI function it is associated with.  

					-Alex

Alex Elder (1):
  dt-bindings: interrupt-controller: introduce
    toshiba,tc9564-msigen.yaml

Daniel Thompson (1):
  irqchip: introduce TC9564 SoC MSIGEN support

 .../toshiba,tc9564-msigen.yaml                |  70 ++++++
 MAINTAINERS                                   |   7 +
 drivers/irqchip/Kconfig                       |  10 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-tc9564-msigen.c           | 203 ++++++++++++++++++
 5 files changed, 291 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/toshiba,tc9564-msigen.yaml
 create mode 100644 drivers/irqchip/irq-tc9564-msigen.c


base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
-- 
2.53.0

