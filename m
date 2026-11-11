Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398880;
	b=If+aOXCRlZOsNdgsD8P5i4eR6/CBljg5Fj+kgYyqOLBxM1k0s5KuoX9vcxkiWILWIxyA
	 kwkDTJDapx/NkeHFG76AqENaUTT3Gj5X0V20vCfyu6mc0r3e4252zvHumfl+gWglxxndO
	 IkexuMpPe8O37toyFUJQzO3PyMJoQoBeEChUmynLZ4XemV91OMHjkXHQ3VugCZD04bxys
	 cirGUv4lkSMOXuknQL7kG4fdVPo9V8ZViAM1u8/ExbUKzEVHFp5EwNYQkU4NFuTGo7p2t
	 shIkTxrKSMAbH0ZTAa16zA4TNqdFPZ877yO+uRnehNF4Ebn0I2SxysoQ2Vu88lccH5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398880;
	h=DMARC-Filter:From:DKIM-Signature:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pFashoEnDZZuvWll98ek06OLO0B0ikHasWYuJ9bJ260=;
	b=ar+so0FWPIGJ5h5bj/wziHx9PIlM3N1eTsvPXulk484L8ZIVtsdJTN5o0+eK9S4HhzcH
	 v9nwnK5mjCQOen4jnn5I0aMaJabSpqOc7KsSIVBKS+rB8/sSt06khKuSabd4xbH5SdGj4
	 +KqTGzyOItH9eSlxX++soRzKs9E7i+US1RPsCkCRHpvNWizhXWCDZf9gmrZdBHj6CnekM
	 7UA0mQI1LFejop27109oPDqkW0qkEM5ITWvovL/+Dy3QlBf2RKtSTZ/m04IAB461+dCxA
	 8VCObza5B7tHuZlLh2q0DfmDG6PY7PwxB24iYEGYjpk/fnLaj3patY6vdFr3Njd6qFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=EmtMasYo;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CFE606A893;
	Wed, 11 Nov 2026 12:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46CFE606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=EmtMasYo
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1794398878;
	bh=Ms21SKXT3u4FNhh3d8KIC89/cHPf4RgidjPrBUptLKA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EmtMasYojmt+mJ5UjbVAyBub+433TgP8Q8rIudiqFTvCRwuBII4YDkW1qb/+HxsO4
	 8QWonKM+szpQuhTvNHknN3HCcbx5CJrA7NKSvgWnGFEYxPABcITfbnGV+cEcqjqUZz
	 7pVFXY451v2EH5Y7+pUKf1U+2PB103Q/eO9QNeslcjuoe9K7qzRCPgQfkLIK5jvZhL
	 Y1aqR6kFYl0KAJsnpxPmSaRzOFV7jJ4WXOr6LoWfhFipUJq4q3ZfC/eH5OUkJ8fReF
	 CzcvUDzqrLBisOGmmDaMwK1T5gXlpQS/voASPj9Y2JPiAVBKdzZb+IN07ARLcoHaD6
	 ersDbPVwFDpDw==
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
Subject: [PATCH v2 2/5] wifi: brcmfmac: pcie: skip the host ready doorbell at init once it is a capability
Date: Wed, 11 Nov 2026 13:07:45 +0100
Message-ID: <20261111120748.23795-3-dev@deq.rocks>
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

With host ready in the host capabilities, the BCM4364 firmware halts on
the doorbell that brcmf_pcie_preinit() rings, before it answers the
first ioctl. The B3 of the MacBookPro16,1 does so on every load, the B2
of the MacBookPro15,1 on some:

  brcmf_pcie_handle_mb_data D2H_MB_DATA: FW HALT
  brcmf_attach: dongle is not responding: err=-5

The BCM4377 stays silent without the capability, so it stays. Once host
ready is a capability the firmware takes the doorbell as the exit from
D3, where Broadcom's DHD driver rings it, after D0_INFORM. Ring it at
init only when host ready is not a capability.

Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 .../net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
index 231a2fb89f0..fc0f23477eb 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
@@ -325,6 +325,7 @@ struct brcmf_pcie_shared_info {
 	dma_addr_t ringupd_dmahandle;
 	u8 version;
 	bool mb_via_ctl;
+	bool hostrdy;
 };
 
 #define BRCMF_OTP_MAX_PARAM_LEN 16
@@ -1599,7 +1600,13 @@ static int brcmf_pcie_preinit(struct device *dev)
 	brcmf_dbg(PCIE, "Enter\n");
 
 	brcmf_pcie_intr_enable(buspub->devinfo);
-	brcmf_pcie_hostready(buspub->devinfo);
+	/*
+	 * Once the host capabilities enable host ready, the firmware takes the
+	 * doorbell as the exit from D3 only. The BCM4364 firmware halts on it
+	 * here.
+	 */
+	if (!buspub->devinfo->shared.hostrdy)
+		brcmf_pcie_hostready(buspub->devinfo);
 
 	return 0;
 }
@@ -1806,8 +1813,10 @@ brcmf_pcie_init_share_ram_info(struct brcmf_pciedev_info *devinfo,
 			!(shared->flags & BRCMF_PCIE_SHARED_USE_MAILBOX);
 
 		host_cap = shared->version;
-		if (shared->flags & BRCMF_PCIE_SHARED_HOSTRDY_DB1)
+		if (shared->flags & BRCMF_PCIE_SHARED_HOSTRDY_DB1) {
 			host_cap |= BRCMF_HOSTCAP_H2D_ENABLE_HOSTRDY;
+			shared->hostrdy = true;
+		}
 		if (shared->flags & BRCMF_PCIE_SHARED_DAR)
 			host_cap |= BRCMF_HOSTCAP_H2D_DAR;
 		host_cap |= BRCMF_HOSTCAP_DS_NO_OOB_DW;
