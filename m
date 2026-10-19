Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=104.207.68.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792447819;
	b=RxrrmEkoD5HdK6XVUfkW5fnyBd864BG6gMIUUE00T0PMkNPM7fGdPGFPmS8P+EAYJ3ik
	 4z9MhimwSJJ3Kkuol6t6OEqifoc8M3ldTN6I1xkMBnS/B/nxU4FeuJg13ApLyEfQvBr0N
	 hLfyhzshM6I8otODSi0mZ5/DV7eMV6ZQ5AbqBUy5BFeAMolUHLy85ROmJe+Opv8C2aPpi
	 wv4xkA9SxzNGwTpSraZIGpPJd4gthgnAwzIo5Nt/PcsUqLMxy/0hWL1x8D2BskQsqwPEv
	 ppr9zCq1AdXMzOmCOcZfmg8J/kpAsLsYF1s4s7R4ituZmnwRJSAF0EwUBzxJks9dV3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792447819;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Envelope-From;
	bh=A9M+eQGTgrKJjVISHFIRHuM3Rvm+gb3HgdVuKPjSkV0=;
	b=21T0wdiu8gQGfKcntXaKj2zMq1MlC7k5hbcTUr3FWMzbrJjjUX0xeXXtMoGQCMhHY7Ir
	 Q0e5B04poaIZ6nQMI19OA2XTcuExTragMo/OlHFezWYFicODDmzK/uly6afWtUZLaFmqQ
	 1wIAFGcvwRyK5owUhAm8O2L9bIOv/NMeC+KOGyNkyVeGRr44HzugdoNfdwUQD9CkAKbBN
	 NV7GL00PVNOFMs1Aw3Ch/bNmHvqfv9EoS/xz5z1pR7Q8iaz6D98un+JtmpxeQ+b+AvmWh
	 u+O/gdyEoc9LvecZSAD7Qm35wIMH8Hkl7W6bVHU3OgDhbH9pinVy7wwg4HJyVd/V5Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=r-sc.ca;
	spf=pass smtp.mailfrom=r-sc.ca;
	dkim=pass header.d=r-sc.ca header.i=@r-sc.ca header.a=rsa-sha256 header.s=spacemail header.b=PZdai8wY;
	arc=none smtp.remote-ip=104.207.68.28
Received: from out-93wp-a28.jellyfish.systems (out-93wp-a28.jellyfish.systems [104.207.68.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0681606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0681606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=r-sc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=r-sc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=r-sc.ca header.i=@r-sc.ca header.a=rsa-sha256 header.s=spacemail header.b=PZdai8wY
Received: from DESKTOP-290OH2S (d207-6-150-133.bchsia.telus.net [207.6.150.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4j7qV854FLz6tkL;
	Mon, 19 Oct 2026 22:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=r-sc.ca;
	s=spacemail; t=1792447809;
	bh=A9M+eQGTgrKJjVISHFIRHuM3Rvm+gb3HgdVuKPjSkV0=;
	h=From:To:Cc:Subject:Date:From;
	b=PZdai8wYQayJZfOy5O+qN3ZhLQejDrw8jwduUTMX+f5P1pD0FIuj8ny1NC1YqVX8l
	 9KlchquCstkf6woO0H0stvGHQQ6DYQNSEEemH+k5jL7XcN3QAE9kvzC34nzjYAoSbu
	 KX4HBHkCHudILQoC1WNNAgebFNp71twgBm0HkHQ1WvUQ3HihbyzM8VdIs2URBVghjd
	 ny4+c5PKDR/Yuf8nP6phY22X5M2fTfOtpBbBTB0YuSxwWriyn+JoG5r7wQ0rYcyeeH
	 +Tyy98Qm6GmXJhhZU+SND8etd08NhFTR+3mlp28zSGprcBrYDjBMq+gvvgIhOsuU92
	 COIDyZ+JgFLAQ==
From: Ross Cawston <ross@r-sc.ca>
To: netdev@vger.kernel.org
Cc: kory.maincent@bootlin.com,
	github@szelinsky.de,
	o.rempel@pengutronix.de,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org,
	Ross Cawston <ross@r-sc.ca>
Subject: [PATCH net v2] net: pse-pd: don't enable a PI again while disabling it
Date: Mon, 19 Oct 2026 15:08:34 -0700
Message-ID: <20261019220835.613-1-ross@r-sc.ca>
X-Mailer: git-send-email 2.55.0.windows.5
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
X-Envelope-From: ross@r-sc.ca

With software power control, _pse_pi_disable() frees the power budget
of the PI and then retries the power delivery of the PIs waiting for
power in its power domain: those that are admin enabled, have a PD
detected, and are not enabled in hardware. On an admin disable or a
disconnection, the PI being disabled is one of them, as its admin state
or PD detection is only cleared after _pse_pi_disable() returns, so it
is enabled again right away:

- an admin disable of a port with a PD keeps the port powered, and the
  next admin enable allocates its budget a second time
- a disconnection enables the now empty port again, with a new budget
  allocation that is never freed: when the port reports the
  disconnection again, its PD detection is already cleared

Move the retry out of _pse_pi_disable() into its callers:
pse_pi_disable() and the disconnection handling of pse_set_config_isr()
retry after they clear the admin state or the PD detection, and
pse_disable_pi_pol() retries as before.

The problem was found while testing the budget on a switch with two
Realtek RTL8239 PSE controllers, whose driver (not in mainline yet) uses
the static budget strategy like the TPS23881. Before this change,
"ethtool --set-pse <port> c33-pse-admin-control disable" left a port
with a PD powered, and the budget allocated in the power domain grew
with every disable and every unplug. With it, the port stays off, and
the allocated budget is back to 0 after a disable and after an unplug.
Tested on that switch with OpenWrt's 6.18 kernel; the change for
mainline is the same apart from context and is build-tested.

Fixes: ffef61d6d273 ("net: pse-pd: Add support for budget evaluation strategies")
Signed-off-by: Ross Cawston <ross@r-sc.ca>
---
Changes in v2:
- Move the retry of the power domain out of _pse_pi_disable() into its
  callers, instead of splitting out a __pse_pi_disable() without it
  (Kory)
- Keep the retry after pse_disable_pi_pol(): without it, PIs turned off
  for a PI of higher priority stay off even when their budget wasn't
  needed (Sashiko). That the retry powers such a PI again right away is
  left for a separate patch.

v1: https://lore.kernel.org/netdev/20261018182005.1193-1-ross@r-sc.ca/

 drivers/net/pse-pd/pse_core.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
index a5e6d7b26b9..c71acfd5337 100644
--- a/drivers/net/pse-pd/pse_core.c
+++ b/drivers/net/pse-pd/pse_core.c
@@ -469,9 +469,6 @@ static int _pse_pi_disable(struct pse_controller_dev *pcdev, int id)
 
 	pse_pi_deallocate_pw_budget(&pcdev->pi[id]);
 
-	if (pse_pw_d_is_sw_pw_control(pcdev, pcdev->pi[id].pw_d))
-		pse_pw_d_retry_power_delivery(pcdev, pcdev->pi[id].pw_d);
-
 	return 0;
 }
 
@@ -493,6 +490,8 @@ static int pse_disable_pi_pol(struct pse_controller_dev *pcdev, int id)
 	ret = _pse_pi_disable(pcdev, id);
 	if (ret)
 		notifs |= ETHTOOL_PSE_EVENT_SW_PW_CONTROL_ERROR;
+	else if (pse_pw_d_is_sw_pw_control(pcdev, pcdev->pi[id].pw_d))
+		pse_pw_d_retry_power_delivery(pcdev, pcdev->pi[id].pw_d);
 
 	ntf.notifs = notifs;
 	ntf.id = id;
@@ -709,8 +708,11 @@ static int pse_pi_disable(struct regulator_dev *rdev)
 	pi = &pcdev->pi[id];
 	mutex_lock(&pcdev->lock);
 	ret = _pse_pi_disable(pcdev, id);
-	if (!ret)
+	if (!ret) {
 		pi->admin_state_enabled = 0;
+		if (pse_pw_d_is_sw_pw_control(pcdev, pi->pw_d))
+			pse_pw_d_retry_power_delivery(pcdev, pi->pw_d);
+	}
 
 	mutex_unlock(&pcdev->lock);
 	return 0;
@@ -1229,10 +1231,16 @@ static int pse_set_config_isr(struct pse_controller_dev *pcdev, int id,
 				ret = 0;
 		}
 	} else if (notifs & ETHTOOL_C33_PSE_EVENT_DISCONNECTION) {
-		if (pcdev->pi[id].admin_state_enabled &&
-		    pcdev->pi[id].isr_pd_detected)
+		struct pse_pi *pi = &pcdev->pi[id];
+		bool disable = pi->admin_state_enabled && pi->isr_pd_detected;
+
+		/* Cleared first, so that the retry doesn't enable it again */
+		pi->isr_pd_detected = false;
+		if (disable) {
 			ret = _pse_pi_disable(pcdev, id);
-		pcdev->pi[id].isr_pd_detected = false;
+			if (!ret)
+				pse_pw_d_retry_power_delivery(pcdev, pi->pw_d);
+		}
 	}
 
 	return ret;
-- 
2.55.0.windows.5

