Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794914001;
	b=O80kyqG1bWNJlbklWNsjYbawKRy0IZZO4rFsL3IVgIHMkTGgpayg/zSKlbHXs7xXGRRD
	 DKbLGSNHSx5lBqfQjzATq3Kk3ozHBf82D2HysTvr+uFcfCshAtMOJuEDukaGIGzCNtse3
	 5DA8LGHQDlbpt3xWmP7+5Y0rHQuEh/B81JcXDOtexMBr5jP9ZeHtg1RFHy2jz/wjOWtaq
	 MHS8xgI7F2B6wmjLUhb8O0V/7/+kA9XSk7uiM/4E+K1vtARxfPqu69i9YMUnacQFKrbXf
	 /6PU5uJo252m1j2YdkDISghsNAIwWOnzyHOdxeDk9qIYknrA4ZB2htgtIIRzb0DS5ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914001;
	h=Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QTEZW2nWC55UuE9DW+9e1IUg9ORKcAYM0UMArIkFnKs=;
	b=gbYXwv57vg/0lKUFMxodIL1lNFXEQbiwYSdeRCgTAxiQAYNRuepSUC8+/TuNF4iiJcmj
	 GYstX9k3JYmZlpMkYSic2h14SITJuXpXkcbu85Y/9wQkrP/7pZ4KRpsLOruU7BuQYZllc
	 uX9c/97woP05RwsaTa6LZeEUagnrImFzi2VeX8GRVlPjdYx6gkhImrrlNJMAKqQTUQTeG
	 4/412fAWAZ3fWGW/z2vcTs3f3idejNUJtZF4ad5YDUHC9GNrz5QcYXhAEStn314WBRtWj
	 0qvWOTfM566ne3womzO/2L9o1E9ief4qV4aRm0oXcL5k7LrG6BwlfjLhVOZ2XQ3gUZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE751606A31C;
	Tue, 17 Nov 2026 11:13:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B301F000C4;
	Tue, 17 Nov 2026 11:13:19 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Arnd Bergmann <arnd@arndb.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] reset: rzg2l-usbphy-ctrl: Permit disabling POWER_SEQUENCING again
Date: Tue, 17 Nov 2026 12:13:14 +0100
Message-ID: <0b1c87b3173a789f6227f13658e4befdac8e47e0.1794913893.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
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

The power sequencing part is optional, and only needed on RZ/G3L
(SYSC_R9A08G046 selects POWER_SEQUENCING).  Users of other members in
the RZ/G2L family may want to enable this driver built-in, while keeping
POWER_SEQUENCING disabled.

Fixes: eac3b292a26e2210 ("reset: rzg2l-usbphy-ctrl: add power sequencing dependency")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/reset/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 60fa039cdbb7f92b..673bca1e594e041f 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -280,7 +280,7 @@ config RESET_RASPBERRYPI
 config RESET_RZG2L_USBPHY_CTRL
 	tristate "Renesas RZ/G2L USBPHY control driver"
 	depends on ARCH_RZG2L || COMPILE_TEST
-	depends on POWER_SEQUENCING
+	depends on POWER_SEQUENCING || !POWER_SEQUENCING
 	select MFD_SYSCON
 	help
 	  Support for USBPHY Control found on RZ/G2L family. It mainly
-- 
2.43.0

