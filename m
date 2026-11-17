Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907263;
	b=jHuYhDFxzRNbW/hrldS9K8J8nCVw0RkMAFnYA5CRFi6dYwlNGyN0/0tkmdPZ/Y07P8jX
	 G6cbzJxKJY5COrAU/Q5oE3diVUpTbs4B1cC6utVgfgiCEDIKU+1fpragHOQn8bqZ2BV4F
	 lqNRt1am0eeTxlo/S5xk8foPeNE66//wX+IMyfVcuv9emfQY8djMBFYjo49WSloqJCbeb
	 wTSwuh8tgCVabMtNGOxqH7nSrgwt2U51a/LoMptaDD+zSPQe1lO6OFQo8Rl+vNKOobjr7
	 IEXJpHFnDmbUaKSQ/SWpsfmi0bLzqVOkd9Y8cHdoj7KvsDUQw17cSTxYOqwvki9vWtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907263;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=TzwsEBgKW8jB9RMsf+8WadAiOdNeN3ARQQcwnDStTM8=;
	b=h71mGw5a42h004ImkP8rbYobN6x7DU9thjU+dyMl6nP0oFQcwfagSXdn8ZrDDRAgE7ET
	 4rpKB0gucjJC89zUD2R1xNHm3KyIUAeH3Gm70lz/VMjoQ6+luf/GBj88Muq3t+EGUz5q3
	 m55cVmaMlL+Zybn/2g6UNNTMeliqkZS1ktGJDCcJzlXjazgRvx/L2kNWo5xL3ykZSdo40
	 ILdhsFJDEt/Ai5Lk/ON7B/Fe7nD48EPuhNsGVK9QI5qRCtAj5hzGwXKEpVOpbSS5QqbTA
	 e8hLh+4b8h2fEOcqn5vRS5OKgYshBt5niQsJjgxWiOvIrVZ3tSCs+4fsKRvX9HcPPfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=TFQzJ0X0;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC82B606A338;
	Tue, 17 Nov 2026 09:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC82B606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=TFQzJ0X0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Tz
	wsEBgKW8jB9RMsf+8WadAiOdNeN3ARQQcwnDStTM8=; b=TFQzJ0X0q2vlmw/mVN
	4HstBU6y2ZF9k/HfpNBWvWYfT3lpvo9rar7UWNw2elcoJLOqAGZ9E7komHPFbJQ8
	rcJ39B7hE80opKlNM8qxbKBoPOjrRs24mqg53Z+HR81k+m76l276q/lo6elFEw1c
	obCVyJZamu/g1alRdRKym+T9A=
Received: from SYPC (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDXl39jHPxquf0OFw--.36174S2;
	Tue, 17 Nov 2026 17:20:36 +0800 (CST)
From: Yang Siyuan <hsyysy@163.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: allwinner: rg35xx: keep RTL8821CS powered during suspend
Date: Tue, 17 Nov 2026 17:20:24 +0800
Message-ID: <20261117092024.12163-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.1
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
X-CM-TRANSID:PCgvCgDXl39jHPxquf0OFw--.36174S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7urWfGF47Wry7ZF1rJrWrZrb_yoW8XFW3pa
	yI9w48Gwn8uw10yrs5KFy8Kr4UZr95Gr45Zr92y34UKw17ZFsYgr4akFn09rWjyrWrJwsF
	yF4rXay7uFnIk3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UXa9fUUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7QT5Lmr8HGRs6QAA3V

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

Signed-off-by: Yang Siyuan <hsyysy@163.com>
---
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

