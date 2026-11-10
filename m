Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794307146;
	b=ZtkZ8gs+D0XCOkv4ws3rTmCz/kEJgTkc9+o9KAc8SlRJekQ/DMdAe17B7mhWkYRD/BfB
	 3VeBhaZ+1ZFDDJCbasUFrO1JKY0gcyCAzBU3AouLKCB5AyJnA30bPKlXjWrebCcEEkyta
	 EEPAKuaROM1p0rNNO25vYSQcgLlWH4QTKcf96FPPlJ8rcgwbCUZ+a8KrlPBeuY0JtJKmx
	 F6cf99C4n7AXyQuOMqDPQfdUwLnmSnHQ1MMh4vZOo/R9RvkNC7mgZ3Ve5t8jCf2ee0eO0
	 2QjD6Q1U+KeWHZ/X6VjpOpXXLlrLIjAaM0XE/F2fGqTfHfXpCdZyOBry8X1q4EEKjyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307146;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+s3QLWhK5+XffDeSaQE3jpsoa5D5UZgrc3cahLkVVlI=;
	b=fy7bAaeoflQBOy6q8qJV5yW2REUUWhofZ/cO4JQ6teiyV7IVW9qhfu2KdWcfBHvB0Czh
	 3WXP0UDx+SmD+8R/P5tJlRbyeLywAoNhWNoTkXUk0bRez/svNtDyUv2cT7Zck+OH2N2aN
	 g+Vj0bV0Sc3oYYQi8S1Kqg5w7n8vAhBQ3Uygju/Q4XUX5uvPh7EcZsCQI5lrHlk8L/Aiu
	 XLawX+d1S75QRLxhcVSoG9Fxc56qienJB/4aIBlnJ653sbYIR7ub7QyqeeMiLzmxDkeuC
	 /TVSrE/a+vGG1qiaarXuKfR/JdgJiWndTW0PYYq5vqwIyRdwNMSe2nzc5GA3R52garQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="QEiy/VpL";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E687606A334;
	Tue, 10 Nov 2026 10:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QEiy/VpL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794307146;
	b=Xi47REbIc58XJ6addkbCt1S13GrItDYrprzt3pgqmr0LnWeVy7+1Ri96taFBLa8mMHZ9
	 YY0ekSYPqzo4ju5oAvenRuzf6mf5wUh1TgJTfmr/4Q/QxBKuXouM5NBiHH5qZ96MAlB5J
	 jGWjumK0MzxkQJ4IGiqVnyRGNlOLGESZmoVeUyWeGXjuuxh2RxjIzZ4mvf52RaSuui1pl
	 ZbPngEcOJ5M2iqXTt6YWTeuMqSBq+UdOFvC+a3Yfm8wDda3jcaCuc/qXdj6Q42yOUSVgi
	 DmeTbPVGb2fdAuFW9px7PJdBrbk+jreUa7a70xByEuSfXyf5L1ozIO7LSRGKyE2odnQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794307146;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+s3QLWhK5+XffDeSaQE3jpsoa5D5UZgrc3cahLkVVlI=;
	b=r/YIG4W3ZXJsCBG15EewY84tXyVSymaSfldqOgbiUl+/89ijmjDEBA0GRsrYQdsbn0cs
	 cRCq7D2RGWgWkN021tQ/aVFJI4hz+Ol4KiclcimOlUx5RsLSeKDvcuwfhi3mffQHvp77l
	 gVkf2Y0UDwfC8y0s4O1xUeu8DqUTLXoVA7NWaZNTGVzKTJ6uppxXAG4xuNzEMgoLsTOdA
	 twnN93baA+ne9PHqcygACC+K3znF4oVlfz/D9H7fNYSvX5iEKDHhkdzPYjt6b2wgrjf68
	 7/FMz7QRlCWJxSj+dXJGkRYT6us9Ix9r++oVbBXUiB2wsaVBOciMGMMChwXYhXj5Ivg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C51F01F008A5;
	Tue, 10 Nov 2026 10:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794307146;
	bh=+s3QLWhK5+XffDeSaQE3jpsoa5D5UZgrc3cahLkVVlI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=QEiy/VpL2zphZSdfqmM6MU42g3GfzaT+1HDqdGklsbDSuUtJPVbmZhmaQHpFOQv+Z
	 n6pRUwRRo8kMoZJlhe6jUeP8oqsZ8+KpP8cRchNUQCe5Uqgl9NcDUgIqUX4KNNmrQf
	 aX42/ladmuaUJ0f/rNCLuCzN0zlCIvesKQuko9RS8oEDOzyAZCrsjYSTZBDoEBPfkq
	 EmOLzhEUdGozWoCcvpIzAnwxGgHnVLOK16YS2W8zHCmXwsaWYmqB3FitT0w88uJsh/
	 BBj/SVyxJ6+p3T2Sndwsiq7UlSLCfXv0At/iH8d0KxyT5WxAN0EfKC6TL0s+jEAExo
	 zoY8x9wOQP6rg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 50CD848AEF;
	Tue, 10 Nov 2026 10:39:04 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 10:39:05 +0000
Subject: [PATCH 2/3] usb: typec: fusb302: Toggle with the default Rp
 current
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
Message-Id: <20261110-tcpm-attach-reboot-v1-2-7657cc1e2dca@gmail.com>
References: <20261110-tcpm-attach-reboot-v1-0-7657cc1e2dca@gmail.com>
In-Reply-To: <20261110-tcpm-attach-reboot-v1-0-7657cc1e2dca@gmail.com>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794307143; l=2135;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=G9r74JoIhZT94dJ6tTMGjq0F8LLdb74sZvrJnDecsR0=;
 b=4ve0PIDBEv9KVX3vtBywpv6RlFkDS691ExgWB7vxo6V65qFCXSE+QaqPlcyo0s4kkMibchjm0
 X3umfOMvTA2CVsw19M4Eit8Q5x3c3ta13/EZwUMa9evBqZWqzHwYkYZ
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

tcpm_start_toggling() programs the Rp current that tcpm asks for, which
is the current of the source PDO (Rp 3.0A on boards that can source
3A) when the port starts toggling from Unattached.SRC, and the default
current when it starts from Unattached.SNK after a detach.

A Genesys Logic based USB-C to DisplayPort cable connected to the
Orange Pi 5 is often not detected after a warm reboot: the FUSB302
toggle state machine raises no interrupt with it while it drives the
high Rp current, but finds it within seconds once toggling restarts
with the default current after another device was detached.

Unattached sources may advertise any Rp level, and tcpm sets the
configured level through set_cc() once the port is attached, so always
toggle with the default current.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/usb/typec/tcpm/fusb302.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 3319f6a2b0c9..53c5671fe45b 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -942,10 +942,19 @@ static int tcpm_start_toggling(struct tcpc_dev *dev,
 	}
 
 	mutex_lock(&chip->lock);
-	ret = fusb302_set_src_current(chip, cc_src_current[cc]);
+	/*
+	 * Look for a partner with the default USB current advertisement.
+	 * Some sinks (seen with a Genesys Logic based USB-C to DisplayPort
+	 * cable) present an Rd that the FUSB302 toggle state machine does
+	 * not detect while it drives the high (3.0 A) Rp current, so they
+	 * are only found when toggling starts from the sink side. Unattached
+	 * sources may advertise any Rp level, and tcpm sets the configured
+	 * level through set_cc() once the port is attached.
+	 */
+	ret = fusb302_set_src_current(chip, SRC_CURRENT_DEFAULT);
 	if (ret < 0) {
 		fusb302_log(chip, "unable to set src current %s, ret=%d",
-			    typec_cc_status_name[cc], ret);
+			    typec_cc_status_name[TYPEC_CC_RP_DEF], ret);
 		goto done;
 	}
 	ret = fusb302_set_toggling(chip, mode);

-- 
2.55.0


