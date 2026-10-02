Received: from mail-qv2-f40.google.com (mail-qv2-f40.google.com [74.125.230.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CD4381E9D
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970492; cv=none; b=uMrT2z/2MUxiGux2q/TG8I+fOy4UVraLnWgx0uxbBPD+ZKuhionY+sO0b0Qe7RN41I8XfaABKCi4cfrzFRTb0TksDGxZGdYrEvZpJ4B5hVoP+dTjDie4brYHAcFvTz91x3bhK5ACpC77abO3iUPfF6l0Bl8XDigBEvBf2UN5WbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970492; c=relaxed/simple;
	bh=0f4pSX5e5iV+0wzPJz6P2GOvHgiOqk97QfB4FM/4l+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BqIGSgur5vTXnogSmE/9WWINxwrdOFVG1phgr6j9cL6iXRn6ASM7WISXjqYR1bTFF5p4rE+9FZZ/YMFDrmRu2/VPs71i7SzH8uTPUkjyDSuYkrkm8/UDXJUeLVOIjpRvQSxIuGwdZpXAXCW2f4YCFB+A9P0TGwssEevzaTBW/D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSOccKWq; arc=none smtp.client-ip=74.125.230.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSOccKWq"
Received: by mail-qv2-f40.google.com with SMTP id 6a1803df08f44-917b200d49bso3117896d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790970487; x=1791575287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=peEOtIWNssxYKrb8NM+ypkApXFH2AI9AHn+rEkEvysE=;
        b=CSOccKWqnAgYu9I3LbKqgJOhlCSgdPJbm2JbIZd4750A7O4ku3tMsa39/I7+zLrwHu
         dJxuF6TrGUHlEYj9hSdh1FiXf1rP5X9A17BlFzfA3D3svtFBlRTFwIYuR1Br1ttxqakp
         T0opZWoukLIyqokeVppO8C1QFI2hso80cn1vWh7nq5HT/lKHpTUsS2CS1mbGArXDv5/J
         8dcUYw3fHnQqE31YbjActVw8FXIhLiEst1mM+ilex5WW14zzKGd3ty3tZL7MO91bPb3r
         BmXg4ZG836j6BdEfr7uHmH3heUM1hpOu0LJ/fRj30Kjz3u2CbvOWm6WUiPtfOjk3NuLi
         7vTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970487; x=1791575287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=peEOtIWNssxYKrb8NM+ypkApXFH2AI9AHn+rEkEvysE=;
        b=v/HT60z4er8+w4GUbDAVT7GJ0wTap2TjwNpJcHfJ9tfAnXsN29HfxDzWtPcy5RD1+w
         vQPBtAj3d9e9VSu7TGfLFg3w/ttg7PY2KD8nPTDW7Y2oTnDDZwKElVM5bjmWRVLjxite
         vZu6wQ/1y5Z3Ui5uoWYenfxtUXRupGubEnXEVVKZyR2+oriwIi3oGzt1SiZh9o9KHJzf
         HvzQOQh71aO/4kd9x54OfZ0EXUWHdH63cuBrlzgpZ9texE7idkRzBF+yyLZ7IZYnaElh
         mRmOFw7n5L66dOHkhf89gFR3kZYYVWydPf9xVgIZ9y4HCRumFhzo5+2tT9zPBwF6YDgp
         OEFg==
X-Gm-Message-State: AFuF++kwZhvdapE3E5GLQSOsdfRbJXArMZbjle6lmV2cKaQMhE8kDSu2
	9RScHR0+yicEc0DXOj3j/iIlkIBSb9VNxOPLcEFmjw+9hm24A+WGXQUeKnVVF8w=
X-Gm-Gg: AYBFou2vhj6VqYy069PrrKaCVq0X6MEX1fF9nmEnOth2YU0YWt4eRDblzbcQo/Qcpe6
	zEuaP0lDqwUqwWJiygLWFnSDOsHhFfy/MWGoPc4RjSNMZ3CzzQThHcBoOkM0LEILWChl+62ea/Q
	SUg9q1xU23eJZSz2T4JiJkBDZ43gnpjMErQWY+dd1hHP/vPsALVrbWFGCCbsGqKrfDdE6pHIYhr
	ZdTeoVLJDis/AAzbfSjX/ZC7emdeQTwt+eiIgiFZwW5pyh6Pvw+Wk42qaFOvW055Ns38lwycS8Q
	1VOCxt4RLg7jZRx2XIuKYOk7I5qWgpML5gM7xO0tkPkEdM6aOI5EB+se10q/wyzlOaQqROy25Ff
	2nPITzR9pHerwcBd9fRmfoud8jJpM+w0F5//TbAn4cFycLHqx+oPRNkbn/vjVZzA93L3acQSrUO
	22cZQNQNT2VlwEBrqove5B31615kOa93vAPVfOf2TM+GwtG0EWigCu68UfBfnA5dkLEaLeE72HZ
	lkDgF861Psq9Ayc6+hs+y/2GNB2AFaspm0f7JQ6UB9C4RTkFqE868F4J6snF78YHfg1IboHuiLe
	8fp4dku6AOcj46c00pjOJCvwEv+x
X-Received: by 2002:a05:620a:4052:b0:93b:db80:e0cf with SMTP id af79cd13be357-93cf1a393damr685608685a.60.1790970487600;
        Fri, 02 Oct 2026 12:48:07 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca2ed5e2sm296846985a.47.2026.10.02.12.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:48:06 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Christophe Leroy <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>,
	mhun512@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] soc: fsl: dpio: Fix cleanup on IRQ registration failure
Date: Fri,  2 Oct 2026 15:48:01 -0400
Message-ID: <20261002194802.375497-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002194802.375497-1-mhun512@gmail.com>
References: <20261002194802.375497-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IRQ registration happens after dpaa2_io_create(), but its failure path
only releases the IRQ resources and the MC portal. The I/O object stays
allocated and published in the service list and per-CPU lookup table,
while devres unmaps its portal registers after probe fails.

Call dpaa2_io_down() on IRQ registration failure to remove the object
from those lookup structures and free it. Reorder the error labels so
that a failed dpaa2_io_create() still skips this cleanup.

Remove unregister_dpio_irq_handlers() from the probe error path, since
no IRQ handler or affinity hint has been installed when registration
fails.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: fe8fe7723a3a ("soc: fsl: dpio: register dpio irq handlers after dpio create")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Remove the unnecessary unregister_dpio_irq_handlers() call from
  the probe error path, as suggested by Ioana Ciornei.
- Include this fix as patch 1 of the two-patch DPIO cleanup series.
- Add Cc: stable@vger.kernel.org.

 drivers/soc/fsl/dpio/dpio-driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/dpio/dpio-driver.c b/drivers/soc/fsl/dpio/dpio-driver.c
index d5198ff..8d31346 100644
--- a/drivers/soc/fsl/dpio/dpio-driver.c
+++ b/drivers/soc/fsl/dpio/dpio-driver.c
@@ -244,9 +244,9 @@ static int dpaa2_dpio_probe(struct fsl_mc_device *dpio_dev)
 
 	return 0;
 
-err_dpaa2_io_create:
-	unregister_dpio_irq_handlers(dpio_dev);
 err_register_dpio_irq:
+	dpaa2_io_down(priv->io);
+err_dpaa2_io_create:
 	fsl_mc_free_irqs(dpio_dev);
 err_allocate_irqs:
 	dpio_disable(dpio_dev->mc_io, 0, dpio_dev->mc_handle);
-- 
2.53.0

