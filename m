Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.199.235.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223032;
	b=TiiyODz30b1Qrle0hhajHCMOUgenS8DSRmL+vwLOhmhsKPdmDo0oLYhaMMCgPnd1HofP
	 2RV1WQOZvtOCsaKvTmGc+IBWPmilrh+t/qQAgSAQgesohZuLQw/NS8nCxk73Q7Syd1tZo
	 +kL+mwQzNR8XpGODsvgDBRSa2s5tKW6D11LfMbOgfL2SEwKkLk5UQrhd2ptIsSXlGeHoz
	 LYhnsOgg52Oa/l39TtnN95jTB5NiJSu94W3BTkx0l7dv66SaqnNaHwGar/8UqSvu1XWDB
	 hI36jLAs5+IdQUDq8duWgItAb2gT3saVXzpK9ZyCBxfxbe9iSFi4dU7DO+8nO0iaomw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223032;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=PZfe4oWLWSXVWkRAXMmfFFEV4XqGyrUM8E5llLlnI4Y=;
	b=C3R/ci3YJmB9fCwdK7E0FCI75+prRsUp3B+nBxWyBNkEJysJ0rzCpkAbeTPoWUVi9LK6
	 57GsEpTGu4mRBaGUqNW7wGAlokWL6knHd0QBLc+2J7P65NgMkX0Q9l1ZcO9riMhwAse4r
	 rwdkTKPsKh5mK5oZ5dp5Q0q57WfxjvAGpMczcF9mveGkt17QJ+JlTeCOUQ8QqKuZrFcbg
	 BlTlU4K2GM5jU0sT69iPFgEdvKNVyLyoYjkNAIbPc4ZDX/L/Sjb0ghT1l/o5ynwgLup4u
	 05CxunK1cC4a/dr+t861bDD8NuqnjX1mw2Mb/QbD2ZxawlXieWcko6mCn/vr4Zzyvsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cirad.fr;
	spf=pass smtp.mailfrom=cirad.fr;
	dkim=pass header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=PPrw5SkG;
	arc=none smtp.remote-ip=194.199.235.221
Received: from retz.cirad.fr (retz.cirad.fr [194.199.235.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63FB606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C63FB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cirad.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirad.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=PPrw5SkG
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id A8F1820D1AB6;
	Mon,  9 Nov 2026 12:17:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 8F5F320D17DA;
	Mon,  9 Nov 2026 12:17:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 8F5F320D17DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794223029;
	bh=PZfe4oWLWSXVWkRAXMmfFFEV4XqGyrUM8E5llLlnI4Y=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=PPrw5SkGuN9ZiZGUySHRwqIzFep8rOpgYPynydBAGQmbAfoCC+KTx2m/Tj43zu1vM
	 r1xi09e7RE6fpaCNHhYme0jkqdBk97wRkulceffz1qJXQS620qIDpPRFrm+0TdXlVh
	 jPLdzwdfM8rNHBhoKGx8msNjxg5L87gwa42aNPV9oCOxN7OrAT24/3G9zRDoJInr3C
	 PCzOt3fL3Ux1nKtpaZen0MEJmV19X8sC3lLhw+iLz14v3zuyQlMZqd9pbyLiO9+alS
	 cF7ozIGdqYIiHJ1Z+fNdh2wcFmLBGjzGMPIhaFGti044Mf2p5c2pj7o/CEFKUapqev
	 V4mwHwGHtzTMA==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id w63RYqua67b1; Mon,  9 Nov 2026 12:17:09 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 2C34320D1AB6;
	Mon,  9 Nov 2026 12:17:09 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: defconfig: enable GPIO LEDs and their triggers
Date: Mon,  9 Nov 2026 12:16:33 +0100
Message-ID: <20261109111637.294236-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Many riscv boards describe gpio-leds in their device tree, 13 of them
with a heartbeat trigger, but defconfig does not enable the LED
subsystem, so these LEDs stay unused.

Enable LEDS_GPIO and the triggers used by in-tree riscv device trees
(heartbeat, disk-activity, default-on), as arm64 defconfig does.

Tested on a Banana Pi BPI-F3: sys-led blinks with the heartbeat trigger.

This patch was prepared with the help of an AI assistant (Claude),
which also ran the build and boot tests.

Signed-off-by: Fr=C3=A9d=C3=A9ric Mah=C3=A9 <frederic.mahe@cirad.fr>
---
 arch/riscv/configs/defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5..670380a9f 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -245,6 +245,13 @@ CONFIG_MMC_SPI=3Dy
 CONFIG_MMC_DW=3Dy
 CONFIG_MMC_DW_STARFIVE=3Dy
 CONFIG_MMC_SUNXI=3Dy
+CONFIG_NEW_LEDS=3Dy
+CONFIG_LEDS_CLASS=3Dy
+CONFIG_LEDS_GPIO=3Dy
+CONFIG_LEDS_TRIGGERS=3Dy
+CONFIG_LEDS_TRIGGER_DISK=3Dy
+CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
+CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dy
 CONFIG_RTC_CLASS=3Dy
 CONFIG_RTC_DRV_SUN6I=3Dy
 CONFIG_DMADEVICES=3Dy

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
--=20
2.47.3

