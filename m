Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588189;
	b=fqGqruBMZGBEvnrkRzMQNbU2v5HhtdU4Dfrkb63KhaNpUU4eGx0wiNIDnCO18eJzPEoS
	 vP2EKjOC14IpTfpts4mhMqXtbeG7Iz++E+fNDdQHoSAfLYRpQ4bxY4zCrD9Rl1KGVzURa
	 uQELcs8TCKe+ZlHaAClV6RmrxAy+lhsGcVeUi0mZaTg2l1874iGFB+BSlm+FNNK5fGF7i
	 HFfBtHygoHVh3lnnXQCgzaj0ihP7S7OL4nLMdf19EnqM0/0ObjrRkys1H9389xM1aLu8w
	 A47cECgw5LyB/DOBJrp8ug7v5oEYF50Bx5/koFTl/jmnHEXKKisEFbs9TeJQtwx6b2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588189;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=2WozcIpvm/P+agvQCkA2mMwvHzAgsOPP2NKplsRrsSk=;
	b=4Yi19aAh81jonC6ihnVNkZp65UiGbhSPgkLOAKjffuk46Jw7qYIJaj0C4nQum63Hyqfj
	 VRPDlJnryW2qXGgUjhGxsWmSr+iI723zx6HYyG81IFqSTYbcuCalzbHPjmNdKn3pOb0KR
	 1DpcA86/y20LFEZcNU899xDNJIcb1MOmaTH8vGcGBoWKBktH2lpHSThTJhj+svgfdyu7A
	 CYk5MN3iC4+l7U0B71fZ0j8q8HUK37m86UlDxPIrVxedUJWWCSIFI2prlM57xU4zabG+3
	 jC+2Q80xAZ1SbiIakvjOBkoNbhb77Pl/6jCwMbXiTbiya6VK2ZPxxSJYBS8Qk13ehfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=pi0mE35V;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8F7606A8A2;
	Fri, 13 Nov 2026 16:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C8F7606A8A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=pi0mE35V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794588180;
	bh=aPT9SaRq5IqvaePbt4GmJ85MCVmVPjKbwvPnFtra8Wg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pi0mE35VbI8Qo3RmdUt0eSmrJG2Lbv0HgjUnOXnJD9jcZrtsPflXpX+LeMTz1YdZp
	 E9Sxofh2xJD1fBwMKdPfzB521joAQIml65L/fiw1kgZdOGicDrTvES2YBgsPkIU2BM
	 iq4jSaR0Q15GX/JZKjEg+DBl1QpaDZ+LxR1a78SfFZowVitNkfFFu3KUkFyWdrBwD2
	 2J059KbMuFI1dbiEPbaBjnKDgEUoqnrnHYi4HOF6KqUipqTOkx242TmSWE02o3Jju9
	 viyyQ1CGDaYgGTemIYEX7z9NWLojCPgv95l+Q+/3smTqCojMjUIrhnu/CKSyi0KpW1
	 xA91Raloo4jPw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A6DAB17E09BC;
	Fri, 13 Nov 2026 17:43:00 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 610EF480030; Fri, 13 Nov 2026 17:43:00 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 13 Nov 2026 17:42:38 +0100
Subject: [PATCH 2/8] usb: typec: tcpm: add device managed port registration
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
Message-Id: <20261113-fusb302-probe-cleanup-v1-2-e5c65a8c58c8@collabora.com>
References: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
In-Reply-To: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1990;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=aPT9SaRq5IqvaePbt4GmJ85MCVmVPjKbwvPnFtra8Wg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr3PhTMpifL9Oj+ud0Gm/wAiaER4AbvuUJhN
 p8LXySufyyUxYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq9z4UAAoJENju1/PI
 O/qaVKoQAIAOZnBzSkIVxlrTf3sof9w5wSZHmGaBojs4RKiXRXxJOOCzyLch+Fo1gxS3MHSheLq
 K/6fyBq8XvQ6bXvfeD0fMUxQtjvEEPhHho2b2vyBEzokaGGF7yBl1d0UVyAksBeuVnc1qOBB2A0
 ryg0AO8M1clvUlBcTDPGKTvkviB22uvWownwoDo6Q6Oy8VycKAo+NVIKI+ELmCcROqk0M4rmF/5
 wqvtEBmyTuzqg0yQ3mFqDmadcVhkjo82ImJ369D8ex+N3O2MN3pgU43VYU8A1fUmMs9XIIMO3v0
 tOPvndQp6dADrF1IRuGmwHAgsv5N+np+Y0D+TZhD/vVIe0aA70UbjUoBvgNkcVqqD4MkMIYwAuG
 cJN30mhKqb6BCcXayo28Ik5CUg/95UIZLTCuyaY4bJ9dAVQ3vMLpQtACqr1UDX02DhSwPw7opLO
 jtW9qSGs4wA5axnYDWzSTgaackXBNmKbSnaQBR+eW4Y3fCl78P2D+Bpqj+GzuOPCTZlNbKKQJ58
 O7ia65xMqONOWILMFgDOmjByoWs0wSzppfYWpOm2jNgPoUaInFRs+HsG7jx9fLvyARn206hMh48
 a4iNpuccvnWyhCuMdp9+TmCbzsxpSLOm4UsC52bEsD1ompmcI+uW7hBt76NFoGZwZxvp7U7kBmZ
 gDQPIj1cCrUroqPDhPgwmHg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

A few drivers would benefit from having device managed TCPM
port registration, so that their probe routine does not mix
device managed and non-device managed calls.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 25 +++++++++++++++++++++++++
 include/linux/usb/tcpm.h      |  3 +++
 2 files changed, 28 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 07d2a03d2b8d..7d6378acf018 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -9013,6 +9013,31 @@ void tcpm_unregister_port(struct tcpm_port *port)
 }
 EXPORT_SYMBOL_GPL(tcpm_unregister_port);
 
+static void devm_tcpm_unregister_port(void *data)
+{
+	struct tcpm_port *port = data;
+
+	tcpm_unregister_port(port);
+}
+
+struct tcpm_port *devm_tcpm_register_port(struct device *dev,
+					  struct tcpc_dev *tcpc)
+{
+	struct tcpm_port *result;
+	int ret;
+
+	result = tcpm_register_port(dev, tcpc);
+	if (IS_ERR(result))
+		return result;
+
+	ret = devm_add_action_or_reset(dev, devm_tcpm_unregister_port, result);
+	if (ret  < 0)
+		return ERR_PTR(ret);
+
+	return result;
+}
+EXPORT_SYMBOL_GPL(devm_tcpm_register_port);
+
 MODULE_AUTHOR("Guenter Roeck <groeck@chromium.org>");
 MODULE_DESCRIPTION("USB Type-C Port Manager");
 MODULE_LICENSE("GPL");
diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
index 93079450bba0..fc60980f9f41 100644
--- a/include/linux/usb/tcpm.h
+++ b/include/linux/usb/tcpm.h
@@ -177,6 +177,9 @@ struct tcpm_port;
 struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc);
 void tcpm_unregister_port(struct tcpm_port *port);
 
+struct tcpm_port *devm_tcpm_register_port(struct device *dev,
+					  struct tcpc_dev *tcpc);
+
 void tcpm_vbus_change(struct tcpm_port *port);
 void tcpm_cc_change(struct tcpm_port *port);
 void tcpm_sink_frs(struct tcpm_port *port);

-- 
2.53.0

