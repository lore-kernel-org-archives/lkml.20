Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398879;
	b=yGuD2ln32Wf6rW0JmJ6FWuVS6c5IJJd8riKXi4qqF/Hov3ETXLI9sI8nfyQkMifG3YcR
	 lBcQrNAxDdquYz8DkT1gbgQSWc4cuvuW9VvNTw6bL5cyANWwkX04pV/OdgY7CNDKt5HY7
	 W/IkrKMlJJDh2UU0g1FUCrE4aXUxXuJslHK7d9MR13dKpZPUCVegE3isz0OBX9RUbWbRJ
	 g96fz95m3spSyoLx6CVXV4GIWQbqI6ACSgbSDnwFp2br9RC04MgKYNpenbJRZJrerxHQi
	 UVCTM/YzVlZkhx4qbVAn4Qz0BC90yDxMEwCSupXbfGp9Xy3wOT5z6ZGmkcYgiGBFvoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398879;
	h=DMARC-Filter:From:DKIM-Signature:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mKcm1dAoYoORZVjG1XVEegV5B3AmCIUI2s6piPJ7UtQ=;
	b=k1dNJL2E4ByNTX1z77t2YKowP9xeinN8uQO2k3zL595dF1Kz/9OcbK9/iSHLAzKV+R3d
	 ukM/+p1Clfg8eZbpc1tlCztMIJo5cnRYpHCMXlB6GiBv9YIFYs5FaJNiemngVNZsIYuJa
	 iq7nZRZKRR1mL/ONb8H7eg4quWQLR58MWc9p9kpjH9n+bWgrPQ+A4xGidhg/w3vSIu1gN
	 ZFtwBflHDVKT7b20nWDpDclgtkUR+n4TH5TXor2sIM/qjS+UonosNvirpsF4BbiNdfvtV
	 RfTOMcUFBqtKiXRiGFlMw5kySYPALG3dqg+xW+bliEHvH1o4QB6PYDJyJXbxt6qQaQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=MnmTvoyC;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B654606A338;
	Wed, 11 Nov 2026 12:07:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B654606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=MnmTvoyC
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1794398875;
	bh=PsYaUokuUjE2AS3GVmh9VLEWFesqZswSzdg7BzKWSRI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MnmTvoyCQcS5QT0eDt/KkUK5JtNpW/aJs2co7BWsvbU8oMdL9QW1q0Sf3L2n06Amy
	 9yEWadMkd9CaMYQYutGB9pr/5JBoRRTI5M3HV4Iqks1wnPVXrtB5sibLe+o8c1MzjC
	 Juw+9VlHN+Gotzsp+k9k81ikjYA9D+BGdVRMrSWWUNqt9eVbpsadFla6/O9KE18Izr
	 O3VmgXoxYF06iv/ooCvDHrxvsJnqNd3OgB1E7rBxT2DB4qF/kYFYWFD1ovJNznu30n
	 O4xmpH287iScUcc3iLtJ3W7jOIlFDdJghIBzgh4JlQKWxDBCRUhS876nxkFJDcZygX
	 RAkcC2QJxKceA==
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	michael.reeves077@gmail.com,
	marcan@marcan.st,
	j@jannau.net,
	asahi@lists.linux.dev,
	sebastian.reichel@collabora.com,
	Andre Eikmeyer <dev@deq.rocks>
Subject: [PATCH v2 1/5] wifi: brcmfmac: pcie: set the state before D0_INFORM on resume
Date: Wed, 11 Nov 2026 13:07:44 +0100
Message-ID: <20261111120748.23795-2-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111120748.23795-1-dev@deq.rocks>
References: <20261111120748.23795-1-dev@deq.rocks>
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
