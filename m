Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588189;
	b=5Ux4EH0Whvx/SpTLMgCKlK7/vk+WKOTcxqu+eZT3/tT0RTdrM4NYdfeK09ab/7jd1QDV
	 1vvoCiwlQ/CKWbxDevEBNbZyE2HfGcpkZ7a63SiMXZ04VUo0UQJL7wda5UtZPp+KNlUIv
	 cOZJY/Tbe92zMDx1HxfW/O684dPqhQ+PZ5QdvMG8q6iQoZvZdOxleoyuykeyyDChrQwa5
	 ORY8C4ZoM0OIt0hYaKcldNWTr84oeNxQirL4V+lPItWspYk4QoPV/biRfXK/Nz5/ytAu/
	 aWoI2wZGaenBr8q3pNWIlVlv9mLzCtVRnN5JM95hdsWmO9GDiuTZunfUzvvIbH7iHpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588189;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=4kDSkP3+CBRkZ/DsssLpzy0WpGFhZMWcwapcnFjbK0Q=;
	b=smW7/5J9m/o05XC2Yvm+bUpVyFVZoC8rhqCNxSjb0iyqTkKN420S2A8YVeRo5YDNwZ3v
	 c6/UAQ2Fl4weKGW4o1fQCAVljNGUbu+FS8V6w4h6a6Cyf7cuiVThlcoODW8KlY9GMJKHZ
	 5TGqWeJ/9J1QPEpLUbzaO+O5tyJ5/9xy0GN151jTPMT/YbX/O5IKt70RKyWSPGnLBB04n
	 z+WNLK6LIdNKxy9qmHuJbLXQQCZ8lNmlGAXDUrDNgsmwEhITrgFHbcCR7Z0KIH4fND4Wt
	 Y4r2smVu2cAKjlFUR/TFIHkIXA7iB1ac/04Csrs6KH6hzDNAytSZyOCEq38KHTBMCuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=DrnQ5Eql;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C837606A332;
	Fri, 13 Nov 2026 16:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C837606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=DrnQ5Eql
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794588180;
	bh=yT1OptzDb1CcrpGTjyrVj8mzxLH86xz5dBhJdd8dk6U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DrnQ5Eql+UYVadQN4b0GzGE9wRkMC3tybGjqsHTHiACkuKwdovlajNaJ2wc6FlTMf
	 dSGZHgGMXfBN7ipip9XbEBmogxHRT+Iu3dxGQ2pGB4Q5EDEgg3zJfbVHSppEo7vb04
	 XuHw/Eauyso3U+2IKw2J2iqwa+bj5vhYOaq0g/WQw4LT1l1Ar95iHQJply+VKVuq5C
	 OH9kcjzLxp5zRhgHUnThXmq+q6DBnK8fR0df5BPCuSXu/OxUlW9Lc+B2tq0B47u/bP
	 xbl/eI8cr1MvyAHP0xUu/xQi0IYhZtOI7Qea3cZrfz1bw9ACfe9QhszlzFrW80y/ov
	 hc2xSDrE6SrOg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A456F17E078F;
	Fri, 13 Nov 2026 17:43:00 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 5FEEF48002B; Fri, 13 Nov 2026 17:43:00 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 13 Nov 2026 17:42:37 +0100
Subject: [PATCH 1/8] usb: typec: tcpm: allocate pd_list entries non device
 managed
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-fusb302-probe-cleanup-v1-1-e5c65a8c58c8@collabora.com>
References: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
In-Reply-To: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1370;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=yT1OptzDb1CcrpGTjyrVj8mzxLH86xz5dBhJdd8dk6U=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr3PhTELfGUWF4Lsn2S9p6nRB9xvqnAgEq1h
 QD51mv/6QBUZokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq9z4UAAoJENju1/PI
 O/qaLvkP/0Gd8a4LHIWy3qujn3wxjykuktMN2aMl4eTZBgKsmly3nL8E4YaqYz43G+yX6r3z33S
 UjRU4hnKoky6A5lAdkJ08WB6tVpBnssaHZ2LvneobNQ/QJHjgbPigVbXfrY+VVtznRraO919YsV
 v19rpLQGtgA0bwQY8rYdnneAgd7LUaCtzR1zU7KDL/iCWccgZjn3PS+aT8pbR1C8gVBkqkXDelJ
 6Gl3Oiw/kni4Z7yD562OkSvS1dirzYFYh8Saq1pE60mWDrB/V34fi+TB3BkXVVW30p2b8hdA2UO
 pPS5MhruXCObOPhyf8D+g0/Ln3vrocQyVIzMfDGFg4HoC+eLXUSfGxqv1rhfkRzcv6UuiVO9noP
 H7rkcWi0fODyATfmAWZJdY5OxEBEFeHZvd3TpqcPekszkrkgP2p6BwSw9tgrGTivLShsEiwUezQ
 RqMd8/fTstQAjVZlxf5PF4F3OiNEaHcGqgQbBR5ez6JmhCqWv51ACETUFlsEhc6bYmRTzZr1z71
 mKpPJxr0OIBmrNg1D99i+N0gZYDW2RNvUbwbb+SlBK89lPzrNlsz3GrEfICu/iPUDVKSbCi8nSy
 31DR3ZhD/HZiVe9+soNfpBug1MoXIiupCFeUsT4fKrkFiLN6/lBTTVgA5tKoT8E9qejxjR704BV
 chNNLuk0/hjA1NtQM5DowGQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The data is free'd manually, so there is no need for the device
managed overhead. At the same time it conflicts when the TCPM
itself is registered device managed (not yet supported).

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index bb90211660ca..07d2a03d2b8d 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -8092,7 +8092,7 @@ static void tcpm_port_unregister_pd(struct tcpm_port *port)
 	for (i = 0; i < port->pd_count; i++) {
 		usb_power_delivery_unregister_capabilities(port->pd_list[i]->sink_cap);
 		usb_power_delivery_unregister_capabilities(port->pd_list[i]->source_cap);
-		devm_kfree(port->dev, port->pd_list[i]);
+		kfree(port->pd_list[i]);
 		port->pd_list[i] = NULL;
 		usb_power_delivery_unregister(port->pds[i]);
 		port->pds[i] = NULL;
@@ -8391,7 +8391,7 @@ static int tcpm_fw_get_caps(struct tcpm_port *port, struct fwnode_handle *fwnode
 	}
 
 	for (i = 0; i < port->pd_count; i++) {
-		port->pd_list[i] = devm_kzalloc_obj(port->dev, struct pd_data);
+		port->pd_list[i] = kzalloc_obj(*port->pd_list[i]);
 		if (!port->pd_list[i]) {
 			ret = -ENOMEM;
 			goto put_capabilities;

-- 
2.53.0

