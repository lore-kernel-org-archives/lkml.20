Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD613446C5
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789082049; cv=none; b=lvxgr1flz5C17UZxBJrMbnFRoBPvGuWhPXq9V7wzeVp4Ggx7tMkbk315icCoPRVoylW+Gz4giflOAcO9y5dD3xmtibmohmvJhq55aB/UjBjTZ3UkreavofT3htATLu3d4gVtXD/2Kf+sKhwYAC0TTnO/I+4jCXm606oJj0wgokc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789082049; c=relaxed/simple;
	bh=ImMK4mcH1Y1VoDsvqq+9Jdwp821vUOZvfhYMZ2UEkuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s6V4yrymx/Zw0sy1sRrzKUA9llb/quLQWpbztR1TMg8PiSdqCKasLC/+PAx8kx9t79p9WOO/2rT7TWR9WkglJWfjh3M8pd5SC6nM1v1MMRok9aCzadA6yLLIEUx3gNtZzTy02U9RgfTNf8/9kRvG+RrQoCDK2mSuYx6tEOMyrv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MhiUD1k3; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhiUD1k3"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76ef1d0so4048151cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789082047; x=1789686847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kocMm2XO+eODS6jg8KDsoCI9b/NcjZhZ8Qzw5ERTUwQ=;
        b=MhiUD1k3dto3IznuBEFveN7ehjP3ugJyCSiuZjE07myFuvlbb0foPugN499J6/kXrz
         28Uin+QC9ZmlpWfrZQZpyq8y7cTNgYS5GrlbHT4qbbbKHbEYSWfBYHMpAfTEl+qbZole
         U4JA2q7M6pKXWGNKbx/d5i3pANoe6WkZqixkK3i60GI7Qub7mmD5JpxtwW5YBnflw7Q7
         U5miC6mNzTYruS7ListdCV4xpkASHVsFooJ1dVSiHV6236G1Pu0wrvKC0UtgR/0PFtqZ
         SrwSGPHbkfrSyEcv7IkXzp6rPahcWQbcRiYp7IsmHws9+l02hl0z8A37ma6SqVnOEF+V
         Pg5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789082047; x=1789686847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kocMm2XO+eODS6jg8KDsoCI9b/NcjZhZ8Qzw5ERTUwQ=;
        b=VmbY8JT2mMpmL8MElW9WgjqNLl0fXfY2n+ZSNrAUw8zRR3wBYc42ywkAV+lmufAtbt
         pxgoDZhwkBf5LksRUmP/EMdymTTFEF2wzuQcklG3Heaz4IfNcYjdQ6CgExQAKiif5eFo
         XiKy94F3wMzAGP1L2gASlIhalo3IOsJyN4HzbrIRXZ9+s6zrQuRrQYX/YP8QbRcsPFZf
         6dSSULQDchGo6qHenbk9ab+z+p9BT6vA8JPSEJZw44S1dUQ+mx/5zetM7LQ6HoUqkjf0
         BmQ9+OzN5RWP/K8Ncjzl96+VZGhSQvJxIHat2YEXpd202CpjQLE5jtm0NCXfM/vhXI7C
         w0Uw==
X-Forwarded-Encrypted: i=1; AKwUvBwb+vELI1IuzHZvOLjq9F+0zcQNX0/wcZGQxrp6jX7bi28MbQfhv/8DQouO2+LfZQRsXAxIfMxVOWA7Qmk=@vger.kernel.org
X-Gm-Message-State: AFuF++mwTlmyVTBfUG3hrqXEvIRw7fNizgsgYr5aMW/jjFFgZG2zVn8X
	zTRCMcR2y6OwzW0hYg3xfX6llQJ+P62Eh8B4kb1R6V2pJsdfII6xZvk=
X-Gm-Gg: AYBFou2SCndfHOf9dvRZYmkZXdCJPbtDU+1tg8ZUdjTveghX2SEc5V41CeMT1NO7qj7
	yQnu43BY9KRp+a7NgANXvEkr1/W9pQJy1zmVunZEk++UcC5Ufl2ngfwD0qfERZaMe/dVnfOADkG
	7PqVvhZt1lRlDEFTqTlXaBnYdL2BzjtTnwtu6WxUNuJaDUnXCku+L86DDnQrR11P5HKYc9+yVMf
	W0gGxjm3KEv5z1pgdOboVexWVBL9uYx9CEbmC9eKneh7FgOBD0oQJJe/rT92GjyHbojHf1RugN8
	cl5ZCZZSZCTBCsQcBBLVrrFlxE+8mcHsdGg+Njq4Ct5chPf17TPZnkNjxVJe2HxEuqbdMaQ+/Yg
	guz4RW+L57NlpCpa389rvOYYA0svggxY4OvdSrLeYXpE+5VbhXBvUGFkaGn15Hgb67OAmaVPyXt
	2WRzxSIgG+eR4v0Gz9qf33P0rSvc3hdfKOWhppxbGnXEPvrswV1G1HjcKs+6n5R3ZKsNbpjPwTC
	rNwr0MouvpqBHvsLLRs1kkVznxjsoubbHGk5X8ZQ+FizpTq3fOlyqSxaejQO2sRQNrXfLE3B24j
	3HzVCQ5XF6/9C2Y0l9aCjFfVSdjD0KxcdQ==
X-Received: by 2002:a05:622a:390:b0:530:9c9e:d9e7 with SMTP id d75a77b69052e-530c85293aemr28082171cf.5.1789082046602;
        Thu, 10 Sep 2026 16:14:06 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca103b90sm5778121cf.0.2026.09.10.16.14.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 16:14:05 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] net: 8390: pcnet_cs: release PCMCIA window on setup_shmem_window() error
Date: Thu, 10 Sep 2026 19:14:00 -0400
Message-ID: <20260910231400.31919-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260731161740.44955-1-mhun512@gmail.com>
References: <20260731161740.44955-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

setup_shmem_window() acquires a PCMCIA memory window using
pcmcia_request_window(). If pcmcia_map_mem_page() or the subsequent
ioremap() fails, the function returns without releasing the requested
window.

pcnet_config() treats shared-memory setup failure as non-fatal and falls
back to setup_dma_config(). Probe can therefore continue while socket
window 3 and its reserved iomem range remain unnecessarily held for the
rest of the bound lifetime of the device. pcmcia_disable_device()
eventually releases the window during teardown.

Route error paths after a successful request through a new release label
that calls pcmcia_release_window(). Fold the existing buffer-verification
cleanup into the same path, keeping iounmap() before the window release
when a mapping exists. Leave the request failure path unchanged.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Clarify that the window remains reserved only until device teardown.
- Make the DMA fallback and continued probe description conditional.
- Avoid claiming that every request failure leaves no resource held.
- Restore the surrounding indentation for the new goto statements.

Link: https://lore.kernel.org/netdev/20260731161740.44955-1-mhun512@gmail.com/
---
 drivers/net/ethernet/8390/pcnet_cs.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/8390/pcnet_cs.c b/drivers/net/ethernet/8390/pcnet_cs.c
index 19f9c5db3..0cf3c0f3c 100644
--- a/drivers/net/ethernet/8390/pcnet_cs.c
+++ b/drivers/net/ethernet/8390/pcnet_cs.c
@@ -1434,14 +1434,14 @@ static int setup_shmem_window(struct pcmcia_device *link, int start_pg,
     offset -= offset % window_size;
     ret = pcmcia_map_mem_page(link, link->resource[3], offset);
     if (ret)
-	    goto failed;
+	    goto release;
 
     /* Try scribbling on the buffer */
     info->base = ioremap(link->resource[3]->start,
 			resource_size(link->resource[3]));
     if (unlikely(!info->base)) {
 	    ret = -ENOMEM;
-	    goto failed;
+	    goto release;
     }
 
     for (i = 0; i < (TX_PAGES<<8); i += 2)
@@ -1452,9 +1452,8 @@ static int setup_shmem_window(struct pcmcia_device *link, int start_pg,
     pcnet_reset_8390(dev);
     if (i != (TX_PAGES<<8)) {
 	iounmap(info->base);
-	pcmcia_release_window(link, link->resource[3]);
 	info->base = NULL;
-	goto failed;
+	goto release;
     }
 
     ei_status.mem = info->base + offset;
@@ -1475,6 +1474,8 @@ static int setup_shmem_window(struct pcmcia_device *link, int start_pg,
     info->flags |= USE_SHMEM;
     return 0;
 
+release:
+	pcmcia_release_window(link, link->resource[3]);
 failed:
     return 1;
 }
-- 
2.47.1
