Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908799;
	b=m3n+Oer0k/mq5OgH+K276FJ0ycIjli5kmNzi7oHH0Gql9jLt5t5YAO8An2QoP+Mpfkkc
	 7oQ7MxPkQKBoQ/4LKrcTyOHBaJxvSfZnZ+JiOiHXMkBiPkjqmRUK0sn2djl7WIsyW7M9O
	 gHQ4+tzpnXsSxyFz51DFEZ2MINlsG2fZjhyN2HnPVpn8BaKRp1KAZ/r5MgXLITgZyOdgx
	 KHkMbcbsV1kgQrvYH9isOPC5sWhoc6L6Wq9lYG/jmHPVsNxLpiw48sU0k6/4+9SfwxcIT
	 1v2Yl1KTo2+9f8tA2ivchkLUzVWoIYp4YH/hTtIfMdcgWF9ylfeVpn9dQeXUyrN7C7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908799;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=gsr7/IYfcSeGTQy76dVkG2pG06B1UPnep2DEc8I2vuc=;
	b=suRnfwdqPM9+qcC6DwcyI31ru8n2QNOL4oGTBZcpZDnSgNwSFiQCzDCnByn82WKUqry5
	 InajS7DSWHMq4rem44PWHzvt2YSkaOT0arfy8f55lx5LLC0uHk26frJlCT8G+vQ4x4ilI
	 NAAfwZdupDdprXUgp6L4d3e1M2t/VZ/3ZaPVp4SMyH4qq3/Xby/i46q+3cIJrqzRZRSCc
	 H3woWXCaU99XoW/ZigYgpMi8nc2rZaSmeLpGNdS6edrOeYW/kebzpxAiwJbXPyJz4L/Ez
	 0jAmkSGb3TGun64+DUUsxPjPkXU9u2VWQHCpZuZNzb9uVIh3bY7tYnthuuLEbAyiNSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=hJbIwtc1;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03234606A32C;
	Tue, 17 Nov 2026 09:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03234606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=hJbIwtc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=gs
	r7/IYfcSeGTQy76dVkG2pG06B1UPnep2DEc8I2vuc=; b=hJbIwtc1tbNC56jZvr
	digXOxnk6vAVqdEMIKoQCFyRP2RQtKcz3NftbyVvpPFnkXzPhEOIVrTp4b/vRctk
	zhKqz/RylvhnZQOA9GPI1uVPN7TmkhtjdrG0b+zaAlTaojzbmMDy/dvfzD5wlTmL
	gI+JTXBg/NDmgDBw9XcBxVeFo=
Received: from SYPC (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgAHhDpaIvxqyachGg--.34767S2;
	Tue, 17 Nov 2026 17:46:03 +0800 (CST)
From: Yang Siyuan <hsyysy@163.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: allwinner: rg35xx: keep RTL8821CS powered during suspend
Date: Tue, 17 Nov 2026 17:45:51 +0800
Message-ID: <20261117094551.13555-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117092024.12163-1-hsyysy@163.com>
References: <20261117092024.12163-1-hsyysy@163.com>
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
X-CM-TRANSID:PigvCgAHhDpaIvxqyachGg--.34767S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7urWfGF47Wry7ZF1rJrWrZrb_yoW8Ww13pa
	y29w48Kwn8uw1jyr4kKF18Kr48Zr95KF45ZrykJ347Kw17ZFsYgr4akF1Y9rWjvrW8Jw42
	yF4rX3W7Zr9I93JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UWq2iUUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7Rt4rGr8IluYmQAA3M

The RTL8821CS SDIO WiFi on the RG35XX Plus/SP is soldered and powered by
CLDO4.  rtw88's SDIO suspend callback asks the MMC host to keep power
during system suspend:

    rtw88_8821cs mmc1:0001:1: Failed to host PM flag MMC_PM_KEEP_POWER

sdio_set_host_pm_flags() only accepts MMC_PM_KEEP_POWER when the host's
pm_caps contains it, and mmc_of_parse() sets that flag from the
"keep-power-in-suspend" DT property.  Without it, the first s2idle
suspend aborts with -EINVAL before the system can enter suspend.

Add keep-power-in-suspend to &mmc1 so the WiFi stays powered and s2idle
works.  Tested on an Anbernic RG35XX-SP: the board suspends and resumes
from the lid switch, and the WiFi reconnects after resume.

Fixes: 398e5fdf60ed ("arm64: dts: allwinner: h700: Add RG35XX-Plus DTS")

Signed-off-by: Yang Siyuan <hsyysy@163.com>
---
Changes in v2:
- Add the Fixes tag suggested by Sashiko.

 .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
index 60a8e49..ceb25a3 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
@@ -27,6 +27,8 @@
 	mmc-pwrseq = <&wifi_pwrseq>;
 	bus-width = <4>;
 	non-removable;
+	/* rtw88's SDIO suspend requires MMC_PM_KEEP_POWER. */
+	keep-power-in-suspend;
 	status = "okay";
 
 	sdio_wifi: wifi@1 {

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.56.1

