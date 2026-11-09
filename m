Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794242671;
	b=Nz3yD8cMkamkSGafRxQ8EP8hh6gmi8yIfGYpFdlY6o5JMzB0EPy667vRDccgkXHRtJdN
	 L4BomkasyX3e7J6XJR9W6x5jinrdJfIY5RcSe7MtsbY675mx87iU1xwcvTqeIB+GHpLbB
	 Ds8bYABDJqO6bnJlEvUOFN4lrQ6BrsMnuKGQudpGNmfwNhAmmaiwMi0Ya2GBHvqLtr+4S
	 R58Sx987HTa6w74ggmfJT/L1NTlsJPSaclXnZ1ALI2+Dybl/BFQ/vJXz9VrykseHW/GyJ
	 WnUIedinRttohrUEg5tgUCZD0AEY4Dd5/DUYvuzK9+z6LRjs4nZINAzkYIgLqTLmDBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242671;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FaQpaw1ViqVEtbZKMtrSqTL8JaUridnUO54SRbvqDw8=;
	b=nTIg/mrq3kvZZl6ysxkeNRbNmhoji41ikEGl9DvVfKyhytu4si9vGh7vvM4y6652HHQ+
	 3ZWYfVEi4p7KIZdDHD/zr+s29FbWJSWlKIKiUShFXTR6lL8YpViq+oCU8SPCDh20iPGw3
	 bF98YMPkdi/XKseBEQeUV/ljQZe6arZEm9J+Qrekl6pcL+Hd16V0+sldu9qbk6E6urOzk
	 YoMJqaa7t3Joo4SEaUnVLWGy8o5tCWaiwRYeBvK/uJoZI+Jxy7jvCanJKFqets2so4sS+
	 1OrMf3HMMiCHo2hghAMyTOuo3/kRfpnl0qT27DGFHbUb9FkLCWKMoQaB8/5QKN2aVsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LS4Klp2x;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6663D606A334;
	Mon,  9 Nov 2026 16:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LS4Klp2x
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794242671;
	b=yywKRDYANNMDUXf2ef035KaF0qI9YstKzJrZbXsiNbV5IlNO3jYYe1B4WFjGfSYBIzk7
	 Ds4xuudhNuKFQcoOWjHs2rr1Wj9w2rLiphueZaBlJdGbkJN5m0yEpzz+1TS/cmcnOjEAl
	 HtHTkY/4EVZkhzD2yW9WljQmke0VxCdP59cLMbpoeBxUFAV7f8Ji46JZIC8br7qfjStkY
	 HjF8fXyn8xPLQxsfXWEx/ttW8r8Y6+GDb9UNk/RuSymcXgK61Jt8dCxLy4Ahc01jh3BYR
	 P1NLfC04KDdwqG9Xal872M7ydlEIZXczTGkOB5QncBVN0KCltOrTWmJ7s0WFuaImH6Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794242671;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FaQpaw1ViqVEtbZKMtrSqTL8JaUridnUO54SRbvqDw8=;
	b=MtyoUPtqC4wnPVfVbwegnDLxJbFSdxkeQA1Ia/xi+LH9hxWAgmyNt1Gxjtn5rmr0/tUf
	 IE0jTthl2e2JxPf9EJnqeEG+M6THftGgeGIDsxiqoM0nl+nJc8PAupSZpIbXWJHM4PB2z
	 0OvFdlByu/pCBObFO0sts9DipxNEPo10fwJcX7nsoAVWvVqunpOCpxgzhiPte4JxCxGHg
	 5AekflJJ3OizYge4tD67Wx8kRr8bKpH9X1gpwx5J9UQROpZ31Mnj3PYA/agFAKy3rkwfI
	 +pl6Hs1KvsYMvXNu5UBAHRNEYXoJElkMgiD6aHIB2tm061iVwJNkW8pbooqm0tq1lxw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 900C41F008A2;
	Mon,  9 Nov 2026 16:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794242671;
	bh=FaQpaw1ViqVEtbZKMtrSqTL8JaUridnUO54SRbvqDw8=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=LS4Klp2xqmwkt8CvMsztAShscuqRoRT5GId7f0IDRmqc98uBIUkHqJDvC2RC8u3rJ
	 iWfxKIH77wt2NVcrFhyOaqn8WX464TBJv/hBfebuQp+9hEwWt8ZbFahUc4354vPK9e
	 4k7lUP9HGjVgMHQDB5ZMp7n9lrIDWUyfULVTJa3VV0ftv/MIEQtA4UJ3zmW2MO79vW
	 xNyDLyj3bI0wOy6iKYlK1aSE06Aq842fg7NzVuc4qk9pv4kX3Kr44qH9uyuwJfktZT
	 mUyUlALT6vGNUJqn8e6+o2uBMp80rtr+HfCAntpXD+0ySlgPguvLPmrcd7p/nm/odn
	 PfA5L881m43RA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0F5C44853F;
	Mon,  9 Nov 2026 16:44:30 +0000 (UTC)
From: Lukas Hahn via B4 Relay <devnull+lukas.hahn.codewrights.de@kernel.org>
Date: Mon, 09 Nov 2026 17:43:37 +0100
Subject: [PATCH wireless-next] wifi: wilc1000: skip RSSI query in
 dump_station() before firmware load
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
Message-Id: <20261109-wilc1000-dump-station-v1-1-501094b8e786@codewrights.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMywrCMBAAf6Xs2YVNCy3xV8RDm111pcaSTR9Q+
 u9GPQ7DzA4mScXgXO2QZFHTdyzgThWERx/vgsqFoaa6dY48rjoGR0TI82tCy30uBXLXeN813Ia
 BobRTkptuv+8FVk0yihlG2TJc/9rm4Skhf99wHB+LGxSniAAAAA==
X-Change-ID: 20261109-wilc1000-dump-station-d739973d6cbd
To: Ajay Singh <ajay.kathat@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lukas Hahn <lukas.hahn@codewrights.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794242618; l=2855;
 i=lukas.hahn@codewrights.de; s=20261109; h=from:subject:message-id;
 bh=w74s3Tm5Fitkvt7/EPKLuvfTmHfa4AYDV30NGcrNsQg=;
 b=gTuaQjBKrkzC6ldqTIGCi0Z1yIy3wJ5LPWrwqEai6jiyBSXAQFYTQp4IlCKm7jwJZc016MHR4
 Ow3XgSNbL7ED9gFXFVlT8WpWZWfnkdHUndj6Z9tFthxkjjgham2V2Ee
X-Developer-Key: i=lukas.hahn@codewrights.de; a=ed25519;
 pk=Mg1ixrNH7vyHiaMBzg5Dc0STeZSinfuImTLfUFEjR5s=
X-Endpoint-Received: by B4 Relay for lukas.hahn@codewrights.de/20261109
 with auth_id=1462
X-Original-From: Lukas Hahn <lukas.hahn@codewrights.de>
Reply-To: lukas.hahn@codewrights.de
Content-Transfer-Encoding: 7bit

From: Lukas Hahn <lukas.hahn@codewrights.de>

The firmware is only downloaded and started when the first interface is
brought up (wilc_wlan_initialize()), which then sets wilc->initialized.
dump_station() does not check this and always sends a WID_RSSI query to
the chip. Before the interface has been opened for the first time,
nothing processes the queued config packet, so wilc_get_rssi() only
returns after WILC_CFG_PKTS_TIMEOUT (3 s), logs "Failed to get RSSI
value" and the station dump fails with -ETIMEDOUT.

systemd-networkd hits exactly this window: while enumerating links at
start-up it sends an NL80211_CMD_GET_STATION dump request for every
interface in station mode, typically before wpa_supplicant has opened
the interface. This was observed on an STM32MP157 board with a WILC1000
on SDIO, running Microchip's vendor driver, which has the same
dump_station() implementation: systemd-networkd, and every unit ordered
after it, was delayed by about 3 s on each boot.

get_station() already returns early in station mode while the firmware
is not initialized. Do the same in dump_station(): without running
firmware there can't be an association, so end the dump with -ENOENT,
which nl80211 reports to user space as an empty station list.

The problem was analysed and this patch was prepared with the help of
an AI coding assistant (Claude, Anthropic).

Fixes: 5625f965d764 ("wilc1000: move wilc driver out of staging")
Signed-off-by: Lukas Hahn <lukas.hahn@codewrights.de>
---
Build-tested on wireless-next: ARCH=arm multi_v7_defconfig (gcc 15.3)
and x86_64_defconfig (gcc 12.2) with WILC1000_SDIO=m and
WILC1000_SPI=m, both with W=1, no new warnings.

Runtime-tested with the equivalent change on Microchip's linux-6.6-mchp
vendor driver on an STM32MP157 board (WILC1000 on SDIO): "Failed to get
RSSI value" no longer appears at boot and the boot is about 3 s faster.
The mainline driver itself has not been runtime-tested, as the board
runs the vendor driver.
---
 drivers/net/wireless/microchip/wilc1000/cfg80211.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/microchip/wilc1000/cfg80211.c b/drivers/net/wireless/microchip/wilc1000/cfg80211.c
index 3db290875..7fd165241 100644
--- a/drivers/net/wireless/microchip/wilc1000/cfg80211.c
+++ b/drivers/net/wireless/microchip/wilc1000/cfg80211.c
@@ -1335,6 +1335,10 @@ static int dump_station(struct wiphy *wiphy, struct wireless_dev *wdev,
 	if (idx != 0)
 		return -ENOENT;
 
+	/* Firmware is not running yet, so there can't be an association */
+	if (!vif->wilc->initialized)
+		return -ENOENT;
+
 	ret = wilc_get_rssi(vif, &sinfo->signal);
 	if (ret)
 		return ret;

---
base-commit: b8e5b0ae8ff47240366d38e5d12c65f878724316
change-id: 20261109-wilc1000-dump-station-d739973d6cbd

Best regards,
--  
Lukas Hahn <lukas.hahn@codewrights.de>


