Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466580;
	b=HQzR2AnxFmBYZENO4VDrpV037aWuZmueYDEtXtYCXkCn9/T5J/t/fJBBYRwzEvZLv5WV
	 GbPzKPYYvCgYfa9ipE/RrZu1D3PLple+RH9+1hiCQgefzDaVuMZsndFkcVlN2kUfliSxN
	 u2OuSCfMv/8CCQwr8gJWMh/wA8WBtQN2RW4K8Qqp8OhQSsEZAFkyC2avRKZj4bTgXVdME
	 +Nq6Cl3UEG287hT8dLJEhfSuWZ3Ed0+HjrydQvnxK2McN/j1V5YRt/3dbYDzExLGLEiX9
	 T8PCgX0QOX0srI9WEiMI+Bkyk3W/yoWMDpimCFow2adTTf5zlVwDEVZ/Ra/zw+YPbHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ISyFWiqCRRUPMHI/QOqOoV6Eq81C65f9fR84q9yGmq4=;
	b=mT4yqYescOzkbZEs2BkXiWMBwExJZpXKi3+hy4NpdUYDLs7RfwX7Pd2kBJC2UwF3Ks16
	 wkR75JlcPrVPi+7Rtk4yYti2Q7qzsdKdyht3BL7Mvue/arymLkazIJO4Z2gBySCFV+rF3
	 jms5O62ef3g3lk4lVkfb5/7+R/53o84CKYQeDH3/edvQg4KPWn21ev60bAJeVxoYS3E1e
	 HX2hlpCEO/5Z+gWPhkYz9O9gLwQMpMdufX/lgh749C9B+m1mck0DbKD4AohHBOBox6FPY
	 ESbaHMbD3qifEWUwTNz5PozniR2jGO0AcIYNyJOlwRfx9n+cydrVf1StpnQt4ljfgbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=odvJf4eh;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A953606A880
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A953606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=odvJf4eh
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53644b28706so59518391cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466579; x=1795071379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ISyFWiqCRRUPMHI/QOqOoV6Eq81C65f9fR84q9yGmq4=;
        b=odvJf4ehN4ApwZaG7qInnaJeVXp00XWchW5Y8c0/6w7/MeOapSJXEGyKLrcXlLPC26
         ThAxZWjnXYDChcive0/WLAEML9ClSaf8uTU44FBNfw2unHz6hmTbPPVxmICioDDDwuHL
         YIV5nV58/M97KY+kL5GNcUARM8ArBz4EdewHvau3u621kjNhcFUXrPkhix6rBDUog7sY
         wXuNRvfDryBXC/56XRa9BlL7WW8dfziobpgJQ8grkbmmdmN5WkapYg6q+OHoHb/2e4za
         lk4IWaIH+8VIuda6tuK66xX8HKvrcQvboyqKBqx1o8hOwZHxL2UFoTPkL/56j3IAQ2fH
         D9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466579; x=1795071379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ISyFWiqCRRUPMHI/QOqOoV6Eq81C65f9fR84q9yGmq4=;
        b=occyEa02V8la1mEq3wAmC5FWuvWMXldc05fOyaXKRxzmHR8lRUtP84se7lCme35WoR
         y+iUh4+0lXPUs8R0kujr20x1zC+JaXOfOEkVGrxzr4ymhdisRnmHbT13nNgk41AyxRlI
         aKqN77fvlogGUKCf6keaRrGWShjDgHrYr5vC8Pgf3rW259GuSzFbnhzmfm+F3rD6YdXc
         Y/zP7ea0gex17NrnA5SYTGlNRcPGKrELOpaAVflZgq5CqnphXFcgiBfEtvz7x5UhIsW1
         78C1Z5L4q3K5owD5thyIb4U+SgK5NyhPUdL0pSyFs6Lwo6HhSabbfnNcq93EB2AKSRbA
         BgJg==
X-Forwarded-Encrypted: i=1; AL+hErGpp2c2TO/3dJfNcyRmov12UWIfIIUk7aWhklYc6+wT6Mo6X2GWlYZdvjpzudSE6ztzyoxoO5N9Id8BVuY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+cEbf0YOD6NYfId28ylHINP5UA5ULohnVmXpH5eerPldYlr3q
	3miysbNa3CxbGZacjEJ1Oe8d8oHQ/gogqAnErgSNP/2vX5lVXpFdkgg=
X-Gm-Gg: AYBFou2j0D+aMM9cyoxVJeoQOHJd19LY4Jmms9uWakIY2vMv7lR+BFXxjf5O8iT0zLX
	a+9N9eiqkwo9sEdC8+8qRXddgvIBWxlL9Ii8C/M4ytVQNEAy5n4ZedJazPUEuYmxcS5HNPhO10r
	RIjf9Ho4KLJ/fmV+k14c73CnViGGSE0kXIDhNConZkO7ONjMIbH0ZUXw5mzCQCekOAe4BXilHbo
	5cU3dn6hAcZZY7mFI3I0oINDPePrBnHh+kVXWnQ51RV+bX/rwoJZlH/maHg4blaByW/Kf2zsi2f
	q0/V5O7qJ9sPjhmw/PaMa2u4bcvs2hAefeB+DVacgj8h0cVOrfC/5q83y7EnO6y0gThyO5fkrvb
	9t69OVd2O2NZtpPeYvbDWzIAzUPwChDA668Dk8vvVCiRqLHD/+ykGOW7za5y6ASqptgh6VKlHfG
	JFg/PeYGxI8bQnYSAM4ezTlHsfl9+UnqmsXnDf1txt8FK/hbFE/RrJCoZxt0smHMi/PSGLAM0Gx
	V6dF37U50ZddFmmuuKp/H7dSVA6T1NoqDk729BVMlkDOU0cu3eYFRG9FsgblOBGCSv3An94nThx
	hzeprXCk9uUraMlnD2ZzW+hrmNckBwut1WS7romhTwpVRL2LHRPQtj7eXCnLPkGfA+kqmlLcM4B
	QRvMkiD3zHZHk9ndWcZjbZ9S4b7LLVg53yenhIGC56A8rENq2LRdKCBcuDa0ogdklk+p5htnWJw
	5w9hmRPrgvztzP4TM/M5n6yJlrDS46hTEQ
X-Received: by 2002:a05:622a:c06:b0:535:1e4f:4ed2 with SMTP id d75a77b69052e-556bdfcf0e3mr75884541cf.11.1794466578580;
        Wed, 11 Nov 2026 22:56:18 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-556f374c4ccsm32807681cf.28.2026.11.11.22.56.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:56:17 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Ioana Radulescu <ruxandra.radulescu@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] dpaa2-eth: free the DPNI interrupt before releasing its resources
Date: Thu, 12 Nov 2026 01:56:16 -0500
Message-ID: <20261112065616.34209-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
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

dpaa2_eth_remove() and the probe error path call fsl_mc_free_irqs(),
which returns MC interrupt resources without removing the devm-managed
handler. Until devres runs, a link or endpoint change can race with MAC
disconnection or access the freed MC portal and net device.

Add dpaa2_eth_free_irqs() to release and synchronize the handler before
returning its MC resource. Use it before disconnecting the MAC and freeing
the portal and net device in both paths.

Found by a static analysis tool under development.
Not tested on hardware.

Fixes: 6e2387e8f19e ("staging: fsl-dpaa2/eth: Add Freescale DPAA2 Ethernet driver")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c b/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
index 7227a35dfaf2..91462b88b34a 100644
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
@@ -4824,6 +4824,14 @@ static int dpaa2_eth_setup_irqs(struct fsl_mc_device *ls_dev)
 	return err;
 }
 
+static void dpaa2_eth_free_irqs(struct fsl_mc_device *ls_dev)
+{
+	struct fsl_mc_device_irq *irq = ls_dev->irqs[0];
+
+	devm_free_irq(&ls_dev->dev, irq->virq, &ls_dev->dev);
+	fsl_mc_free_irqs(ls_dev);
+}
+
 static void dpaa2_eth_add_ch_napi(struct dpaa2_eth_priv *priv)
 {
 	int i;
@@ -5044,7 +5052,7 @@ static int dpaa2_eth_probe(struct fsl_mc_device *dpni_dev)
 	if (priv->do_link_poll)
 		kthread_stop(priv->poll_thread);
 	else
-		fsl_mc_free_irqs(dpni_dev);
+		dpaa2_eth_free_irqs(dpni_dev);
 err_poll_thread:
 	dpaa2_eth_disconnect_mac(priv);
 err_connect_mac:
@@ -5104,7 +5112,7 @@ static void dpaa2_eth_remove(struct fsl_mc_device *ls_dev)
 	if (priv->do_link_poll)
 		kthread_stop(priv->poll_thread);
 	else
-		fsl_mc_free_irqs(ls_dev);
+		dpaa2_eth_free_irqs(ls_dev);
 
 	dpaa2_eth_disconnect_mac(priv);
 	dpaa2_eth_free_rings(priv);

base-commit: 0edbc945eb9edd0086f25b151a79cfe4adc0dfa8
-- 
2.43.0

