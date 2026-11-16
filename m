Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.208.142.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820715;
	b=DZKOLCQwsFZgpkXnKizcyj6IR0y7894bfOTIzVPy6dKjF6tjw0jGxdZsEt2Q3D3fBibu
	 s9gXnZyLLz+ZzcwFeHipgv2+aFphELw3JxjKXuL3/FUCYtkbLMBguT6GGQEt6TMaskKCB
	 QqEvYqYeEtQHnf22J1i/r30YKJv44X2aa+2sQ/zIF6EARsIqNeB76yYpI/mTmES7mjjaE
	 seDBeGyKexl9vKa5xb78GtEL0mGnu/ICXHXQCAh0LMYXHtsvSPREUngEhGFqJ/VWSQrJ1
	 lBf1Jgh9nKBl4NjkWd+Im4+V2WT3c8i1oytUhLlOs/2F8Fwfl/f505K8x5H/2k/C1KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820715;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LAYAjOiB6YavUWNwzjYK42ueMROpBm7ZZ9Z9jg4H5mw=;
	b=EKzRZ5aZKqFR/bl7mjKRmvDlRbtQr6f98WWZ62NyhsxuiyjJS4LzcF5mfUygGK1cOzPu
	 WuwfaUXohGL7cjbYCcjqjlD+tQNAFVQqeEXac986ffKZvjEFlyvGmx85otHaCeqW6vwO8
	 IOw4oNeKOLyH6KW3JpyFrAzNF8XQMqIPBTHwsYbz+dt4aaz+Rpb9jiTdkHc6O6oDAcAei
	 AGFvVenTj1sB5CHnTa0JOdJsLR7zNkrSS3GSjUWieRjBBh+9V9AKH1HL+SLG8+PAFsAWq
	 RI1pYweNZf58Wfz2VUxrB18girYBXzZ8knzPT/qJ03cfQtrFZThq1PDz6dektdHtZDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelriot.com;
	spf=pass smtp.mailfrom=kernelriot.com;
	dkim=pass header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=aUi9Zpcx;
	arc=none smtp.remote-ip=74.208.142.49
Received: from mail.kernelriot.com (mail.kernelriot.com [74.208.142.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9288B606A330;
	Mon, 16 Nov 2026 09:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9288B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernelriot.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelriot.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=aUi9Zpcx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1794820713;
	bh=NEmzrlhSleob7noedVQsqsHHHILDcHnTIaSn87BO3pA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From;
	b=aUi9Zpcx2XUpYCcJxzV3GVVGeTrThLpiVC8+mTEOwS7yV8L0aMU+aLh7ho+y7IwCv
	 y+50bVgMG7qLszikqaQWtk67+dScsb/qjNX0AUR/6LPbMuj/wpPGDdshGgoChNrvAb
	 Nj6fgmxoY2v++CglgZHi3WxfSixohWs6hkkhU9Qk3eQNrekrZtg7b2Gfab1e5vU/du
	 uQaloGpBoFIEh2CVY+8PlPPoQgxxPe09yiMTnufwYlK1e4HVb8pNBcWSRceqcRYqEk
	 OQbhbsB1PnrAj/AR4FxGJYmUIeFB8sTzL1hjvdjG2oQDPJb0zphckZJew06On6IEbZ
	 sxryOFvoqFTKQ==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id D5EC78D755; Mon, 16 Nov 2026 09:18:33 +0000 (UTC)
From: Magnus Leatti <magnusleatti@kernelriot.com>
To: me@ziyao.cc,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Nespolino <g.nespolino@gmail.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/2] net: stmmac: dwmac-motorcomm: quiesce the device at shutdown
Date: Mon, 16 Nov 2026 06:17:56 -0300
Message-ID: <20261116091757.1656602-2-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116091757.1656602-1-magnusleatti@kernelriot.com>
References: <20261116091757.1656602-1-magnusleatti@kernelriot.com>
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

The driver has no .shutdown hook. At reboot, kexec and power-off the
MAC and the DMA engine are left running.

Add a shutdown hook that calls stmmac_suspend(). With Wake-on-LAN off
it detaches the netdev and stops the DMA, the MAC and the PHY. With
Wake-on-LAN set it stops the DMA, arms the PMT register and keeps the
receiver and the PHY up, as it does for suspend. That is not enough to
wake this chip from S5, so the system still does not wake.

stmmac_suspend() ends in stmmac_pci_plat_suspend(), which enables PME
if wakeup is enabled for the device. Disable it again, since nothing
arms the chip.

A failed resume leaves the netdev detached with NAPI disabled. Skip the
hook in that state: stmmac_suspend() must not run a second time.

Signed-off-by: Magnus Leatti <magnusleatti@kernelriot.com>
---
 .../ethernet/stmicro/stmmac/dwmac-motorcomm.c | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
index 42f0b11a7b60..1e142ad39e33 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
@@ -204,6 +204,27 @@ static int motorcomm_resume(struct device *dev, void *bsp_priv)
 	return 0;
 }
 
+static void motorcomm_shutdown(struct pci_dev *pdev)
+{
+	struct net_device *ndev = dev_get_drvdata(&pdev->dev);
+
+	/*
+	 * A failed resume leaves the netdev detached with NAPI disabled, and
+	 * stmmac_suspend() must not run on it a second time.
+	 */
+	if (!netif_device_present(ndev))
+		return;
+
+	/* Stop the device before reboot, kexec or power-off */
+	stmmac_suspend(&pdev->dev);
+
+	/*
+	 * stmmac_pci_plat_suspend() enables PME if wakeup is enabled for the
+	 * device. Nothing arms the chip to wake the system, so undo that.
+	 */
+	pci_wake_from_d3(pdev, false);
+}
+
 static struct plat_stmmacenet_data *
 motorcomm_default_plat_data(struct pci_dev *pdev)
 {
@@ -374,6 +395,7 @@ static struct pci_driver dwmac_motorcomm_pci_driver = {
 	.id_table = dwmac_motorcomm_pci_id_table,
 	.probe = motorcomm_probe,
 	.remove = motorcomm_remove,
+	.shutdown = motorcomm_shutdown,
 	.driver = {
 		.pm = &stmmac_simple_pm_ops,
 	},
-- 
2.56.1

