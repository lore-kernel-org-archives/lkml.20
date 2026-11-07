Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794066505;
	b=mY4N2/vC7xW96R1WI2yVginpZBgmF0Shto2xYS7+TbRqkOAUkd8fhsBdr/bPfZhUWSEH
	 NlHL8TdZr+BL2Kw4GneG/DGP65A4EYJ2z3JEMIORQGMxaMUDTIJGlSg77ocfG7qxLWAu4
	 5uEqg/vXAq5DAuOahwjQ0C2J3fJKgHDBOeV2I2iPVNd6R9hL/3AUvCFJFzlyL9x5CCJrh
	 ZvsxeZ7XSBdsjmQZ53Mg93vrJSHw0u1jcVgQ0qOalXM7ZEz5SvdS02qrMAQAXV3kaa3QX
	 Gb22BCcias1uiuKfa+mmjrEVYOy2d0dKWcpZaB58zjx19Wb9xmNM6V01uj7W69NOQQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066505;
	h=DMARC-Filter:From:X-Lima-ML-UUID:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mKcm1dAoYoORZVjG1XVEegV5B3AmCIUI2s6piPJ7UtQ=;
	b=UI8bfq7oQr9VpDAtm8HaqrexMU91l4JtV0dMgU1p3zej3ItK16+m7BJVUkyHIg3chc4U
	 tC+Ry9Ahzf/lqN9oErDyIVlYaWwYHON0+uuafUg7OsDhuilmrlLTctrY9iF2GmREwnpmG
	 useWcPs81WemWgHcqopK1/ZGZZ0RWUjvo4FU/RxdlXqHZVZt1TeFQmg15XTROd0YN4x2/
	 SPB90dg/Lwo2MesVKTxS6rxrsZARq7BEIJVO6Jr3W5SnJTNhoCvlsoTu7GHoIsKmUWSfs
	 DFwGgRYWJzZb4EK6gHWh8kgpQ3BS9MabNRzOH3O/viRm/x460mxPI3oZe1mMQ+sXLaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=USRVK5PD;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C96606D812;
	Sat,  7 Nov 2026 15:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51C96606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=USRVK5PD
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: f96443c8-9d6a-41ae-bb9d-952d8fcac712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1794066495;
	bh=PsYaUokuUjE2AS3GVmh9VLEWFesqZswSzdg7BzKWSRI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=USRVK5PDlaWPt9pNHNnuVUar3BHdu4z7EcLH3I2WUCA+7SeS6dWJsVd+zFGDGLM59
	 synj5MWcdWc3f07iO+7oHRzqu+XYFFwOf0ukeUBV2ms3/pUxy24Uog3mv9NznEfn8Z
	 l9QxDUg6kmg2d0mWffCIco7ZoL7pungPkoxJrktp4X1IpIrLNx5NRMjfSV7OZYkR/u
	 AERL5I05lpmHg910bFQ/oI0/TG9eRvEJSK37dA9A1PytxhxS5eFMFlrb0jKAh+tNhE
	 83okzlklb8ZIEMvEYa/RMrZ8yclIVe6qkJ+dY+KUHOZIUbjhQpIIhn5D3bqIYY7Xiu
	 e4p+zCiJKLkJA==
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Michael Reeves <michael.reeves077@gmail.com>,
	Hector Martin <marcan@marcan.st>,
	Janne Grunau <j@jannau.net>,
	asahi@lists.linux.dev,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH 1/4] wifi: brcmfmac: pcie: set the state before D0_INFORM on resume
Date: Sat,  7 Nov 2026 16:48:07 +0100
Message-ID: <20261107154810.89780-2-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107154810.89780-1-dev@deq.rocks>
References: <20261107154810.89780-1-dev@deq.rocks>
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

With the mailbox on the control ring, D0_INFORM goes through the ring
write path, which refuses to write while devinfo->state is DOWN.
brcmf_pcie_pm_leave_D3() sets the state only after D0_INFORM, so every
hot resume fails and falls back to remove and re-probe:

  brcmf_pcie_send_mb_data: Failed to send H2D mailbox data (-5)

Set the state before D0_INFORM and back to DOWN when the hot resume
fails.

Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
index 4de157d18ff..231a2fb89f0 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
@@ -2838,10 +2838,10 @@ static int brcmf_pcie_pm_leave_D3(struct device *dev)
 	/* Check if device is still up and running, if so we are ready */
 	if (brcmf_pcie_read_pcie32(devinfo, devinfo->reginfo->intmask) != 0) {
 		brcmf_dbg(PCIE, "Try to wakeup device....\n");
+		devinfo->state = BRCMFMAC_PCIE_STATE_UP;
 		if (brcmf_pcie_send_mb_data(devinfo, BRCMF_H2D_HOST_D0_INFORM))
 			goto cleanup;
 		brcmf_dbg(PCIE, "Hot resume, continue....\n");
-		devinfo->state = BRCMFMAC_PCIE_STATE_UP;
 		brcmf_pcie_select_core(devinfo, BCMA_CORE_PCIE2);
 		brcmf_bus_change_state(bus, BRCMF_BUS_UP);
 		brcmf_pcie_intr_enable(devinfo);
@@ -2851,6 +2851,7 @@ static int brcmf_pcie_pm_leave_D3(struct device *dev)
 	}
 
 cleanup:
+	devinfo->state = BRCMFMAC_PCIE_STATE_DOWN;
 	brcmf_chip_detach(devinfo->ci);
 	devinfo->ci = NULL;
 	pdev = devinfo->pdev;
