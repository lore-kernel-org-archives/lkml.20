Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792684811;
	b=st5P4ZdJfr/JukzGE7xkuqGlp2+SFQznx2mQZgN8cW8kL6KOLYXWTXFc2IxsU60xNX88
	 h5TwEwfmE9od33hKaNUXdz2SpaWH4oi+GjGzp0AxaRrUhoN6wyrWGy3NUM+ttlG+nrng3
	 sSeC+8Ja6FzKWm3YqiVFz72OwoUqNrqdBE7sVfCXBq46UbRs7/jwD0Ri7+9CcyTnWaAeV
	 NTYZg9d33kDrYJ3ASDG+LrsoLQCP+7tY4TG1woBYDRG5kuZokfOWCIpazJKCYPyOFo8JT
	 fsNbCXIerMx6ZEQoNfL2jXEszinXZTyusqvRLrUZib3ezsrYlcrGBCCyIhVkAVv6aFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lo4FCreUTiir8SKV7eM8msqoq5RBMwL2rKg855Qwhvg=;
	b=y45z79g1WNrqF2166wIvOD/WTamGjr85yV9iJFsvR5s4aW8Tdnkkx/RlnUNLmtqVnDIK
	 VkMvTx8qArUhsUDgUZ/KIKknMgh/WXBA/GQ6y/kAmNLUZUsvsRnRR+5yg0QJVoyfmc+hc
	 Z0QBKHKCa8IwhV7+h3jh4W6W6h9BnVLjScN8MWU+yBiG057cMx+Etfkx8lnONEYXMdZkx
	 vHBKjlhklLpuhgCnrH/2sYJL2M4o3/IFWaUdeseRRVCTeoKj+ODUopZ3XQmJjk3tjHgJK
	 4+cNbi+9lPwjJ0a3+mE5UzUuEl2tUI81fpweubmImFc+7O4fPDe+p5KeJpjaH7wrsAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nDIvaLrV;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A45606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08A45606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nDIvaLrV
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd61a2dfd7aso508003a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792684810; x=1793289610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lo4FCreUTiir8SKV7eM8msqoq5RBMwL2rKg855Qwhvg=;
        b=nDIvaLrV53bR4F/MUemVE+cfZad5WD81rvNvPGjnY5+oSyyou6RnuoFJaqHKl3jGeC
         2lc8XE0lsXENk6qTpZClnwWIUHKxrzc+NzkILamfd1kQKU9UpECQwmQS48RFQSO5U2eh
         C4IirFlmwzcEhAh0X1xcSBrkue8zn571e07gzKJQ75JJTCvB5oytCwfRhW5GGCjyYGAM
         b5rel3jVamtoH4YMKA5ZpEBaZMazoZ9OUWbYNYxn0ec4j7shlqZvibM2gVnSO1rIN8hJ
         4CIpRrAq54d7Gch0M0VRT50Z9l1ZP8KZrpuhapzCvP7RcWhWh8HDmTQl2FIFjRfmA4Tx
         igmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792684810; x=1793289610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lo4FCreUTiir8SKV7eM8msqoq5RBMwL2rKg855Qwhvg=;
        b=PODBI9ZrCgonLLDo68xmlGc4lj3KD9wRmBOIoaUcwD6r1dP4L81uOk9HwRDLgQiL0F
         Wxl5jinnh900RIZAbi9inFbjx2fU3BfQPfP8ZAGQcn+6i2gBqAhPAfl1iwznCngubg0n
         n3wLyMeYD38GB2hquFPqr5ymCOahnEBzvu0xANzhMtBsX1vaZ0QTCK9c8LCzMdQswllP
         Az3KR23x6JNynKAgfVAAlRKL0gmzbIirEbPUIOJ3KNIM5ZaH1ygEu8uHtenFKvQF0mWV
         m2GfqqszAEMf0Cfg3I9zf/cyTYLoV+KvTbxPI1SmytJ2xWKpFX7KtOXgU00UkAN7Glci
         OYRw==
X-Forwarded-Encrypted: i=1; AKwUvByV536I4q9BAxwmQBkzotQ7GPQ/rOozmYcjq55XvJL/ylACLj9aPD4SCgfFzyP8LdxQa6NIbU4rvHPN2/g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4LCjIfcnhdIEpFzJG0E9csRZY43V2Tq0GssQQC9ziNm+oM8T/
	kfwysXy0fWdeIRsW3bvx2Lk+Qm/1S3ihPOg6p1QTnwcw/PETihYdr28=
X-Gm-Gg: AYBFou0V19ISaLofgDIrmsmmi8ljihaNyCS/vVb4nfdakxr5XpHqhqo3isBcH9edVPZ
	RF+oVYH2LJkFkU2SS8JEVbrJ2BCUFfeL3obuF6t1QToFkjB8GiktamtbJXEWlPTwBERLPumM/5M
	5Db+VKXHgnDageBu58gUIkMg7StTTx4BsghxpUmYlHUT3iBLTVF8xCkDiC5Q/VPwzIyeJCOIQDj
	9fy8vv977yMSfEPSvVv1Yi19/r2vLmeGALTzg4YVpv7DrvEEmyaIIFYylzluis1WTmawbLaAufz
	Z7Jd9D09VU7UQEpSPNjsTVGzRuUVWQuYyqCkpCYQ3iZYoVzaahNA1/g8ln1rdGrpkbFCDM4+jT0
	CSFxW7sKfiIosGTP5Z6+HyoimC1DGhaAdK1Q5WwYS5eAfFNwuZEX0QxiJON20H3Mwi0Bix3QSYK
	nv6z+WmLTZDAGVnElXop/ESnzO6y0pxxJZAFExUFKZtpDBuXWAm824SCEVRjDXt7iqQtsSMadJ8
	oZ71UDU2hLbG+86DNA2D8GWZG1recjdF4g+WGFGpgbkjtPLDBSWhwGd+oXEFTF3PGqJOXyXk/ya
	wG78Uq8WjYhUpNlF
X-Received: by 2002:a05:6a21:7e84:b0:3e2:8f28:461c with SMTP id adf61e73a8af0-3e28f2850d7mr3429241637.60.1792684810211;
        Thu, 22 Oct 2026 09:00:10 -0700 (PDT)
Received: from localhost.localdomain ([2406:3003:2002:639c:c9:b354:e289:b472])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6b85d56c4sm1369348a12.16.2026.10.22.09.00.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 22 Oct 2026 09:00:09 -0700 (PDT)
From: Yige Jiang <yigejiang86@gmail.com>
To: netdev@vger.kernel.org
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ma Ke <make24@iscas.ac.cn>
Subject: [PATCH net] net: lpc_eth: release the PHY device node reference
Date: Thu, 22 Oct 2026 23:59:55 +0800
Message-ID: <rc-review-20261022-ai13-13-8a866c920a94@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lpc_eth_drv_probe() obtains a reference to phy-handle and stores it in
pldat->phy_node for lpc_mii_probe(). Neither PHY lookup nor connecting
the PHY consumes that node reference. The probe error paths and driver
removal discard the stored pointer without releasing the reference.

Put the node at err_out_dma_unmap, which is reached by both failure
paths after the phandle lookup, and on remove after unregistering the
network device and MII bus. Both puts run before free_netdev(), since
pldat is stored in the netdev private area. Earlier probe failures do
not pass the new error-path put.

The PHY device reference discussed in the linked review is a different
reference. This patch only fixes the node reference, which was also
mentioned in that discussion; it does not repeat the proposed PHY
device cleanup.

LLM assistance was used for static ownership analysis and drafting of
this change and its changelog. The review traced get/put pairs, error
paths and teardown ordering. No runtime reproducer or hardware test
is available.

Fixes: 3503bf024b3e ("net: lpc_eth: parse phy nodes from device tree")
Link: https://patchwork.kernel.org/patch/14502432/
Assisted-by: LLM
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on net/main (305deb54c6c2).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
Both allyesconfig and allmodconfig completed kernel and module builds
on the unmodified baseline and with this patch. Unchanged objects were
reused for the patched builds. No new warnings were found compared
with the baseline, and the changed driver produced no warnings.
Both configurations used CONFIG_WERROR=n and DEBUG_INFO_NONE=y;
W=1 diagnostics remained enabled. CONFIG_LPC_ENET was y and m,
respectively. The unmodified WERROR=y baseline reproduces the earlier
arm64 syscall-table override-init failure.
No LPC32xx hardware, runtime or fault-injection test was performed.

 drivers/net/ethernet/nxp/lpc_eth.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/nxp/lpc_eth.c b/drivers/net/ethernet/nxp/lpc_eth.c
index 8b9a3e3bba30fd95258a9f58699af4a8f82ea04c..69098845baac0e4d1fbbb062c2a767acef7d266a 100644
--- a/drivers/net/ethernet/nxp/lpc_eth.c
+++ b/drivers/net/ethernet/nxp/lpc_eth.c
@@ -1397,6 +1397,7 @@ static int lpc_eth_drv_probe(struct platform_device *pdev)
 err_out_unregister_netdev:
 	unregister_netdev(ndev);
 err_out_dma_unmap:
+	of_node_put(pldat->phy_node);
 	if (!use_iram_for_net(dev) ||
 	    pldat->dma_buff_size > lpc32xx_return_iram(NULL, NULL))
 		dma_free_coherent(dev, pldat->dma_buff_size,
@@ -1435,6 +1436,7 @@ static void lpc_eth_drv_remove(struct platform_device *pdev)
 	mdiobus_free(pldat->mii_bus);
 	clk_disable_unprepare(pldat->clk);
 	clk_put(pldat->clk);
+	of_node_put(pldat->phy_node);
 	free_netdev(ndev);
 }
 

base-commit: 305deb54c6c287e586bed92da2375ae1220e8dde
