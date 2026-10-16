Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256DB3AF656
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131135; cv=none; b=hxoGY2EZenAvUzGgDxuFTleXoZ75+3i9ZwMjgEYpcQFyAAphrejlNBZWmWaUNlQ0cPet/iwoeDuy6VV5jfUQTpFY0UK887iQNSOqA2BXjmngKIBqoLDJYFpL536lz1jl0MM46pyd/9t2MPTwtyp7TiwecAGgeEngQxbqPGJTptM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131135; c=relaxed/simple;
	bh=+8u8/e19AlhCP7ZcBLcWul/CcxHHWq6yEhKJ5AL0gE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qhk8j44pdULrylqk6vPGb821Mejn+jg2yNZOHfjdudbtGgqyVgHljfrudcseKixHdPjxJlvLtuUvR4rFo8BTPhN52F4rnzNp4Q25IcRlv8CPQC4ZChataUhdkY7mydp3u0+vQ2LK7+gr//BiOTRxeNKp2SizmeK6g0cnvmkbOGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWcpGR5S; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWcpGR5S"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-16079d54c17so296624c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131132; x=1792735932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6X6wzE3wvd9aUwN+DPOs4etEkN6w/QmC2PVX0ZhQI4I=;
        b=JWcpGR5SKJ8KhSGeUEb0cC3WqGM4zdczBxxh2RV3lrn/ETteOzc4qzWeq+RMkVvbnA
         WJupc6/bhRPgNG4ojWqsZfTnjDdloD5mvAA6j96gujlA20IinA23O2IAoW0gNk1Erc0p
         /Ps3gjfJ/iCmwbqLpI/eQ42Jl5olzqMlGfBvQxYpF4sTna7Z5oR66AmqovLobfmuiUcp
         sHOSv1ruyp4YmszNBddBQvVlEq8F+VGfI93D6KNqPAdZx5bvncF+21OL/WtVVynYw+t/
         saal3oWhDyVm4HSJtyAsBKpCWU2XPfKpNP7O4e1oteS1b0GCgbWmjmy10P39ebpCy4OK
         um8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131132; x=1792735932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6X6wzE3wvd9aUwN+DPOs4etEkN6w/QmC2PVX0ZhQI4I=;
        b=y6TyjhCJo6MkO4ktMPHBAgAR/2doTWzxkMHw4VsYXwDXSqeu2rZnGCqV2JWvgpJgpV
         TCEIAA9J2WoqNXyuRpjdiPZ88anGqAY6yln55BFjTOrAFdfModKsVQI3Vc9uKOnQOgYq
         l6FVJSJyrXaZsbfFfjb6EYy/YnicKyWhWHkE06VZH3oDfDu1WJjcosspebUrxIJ2bZm0
         y/C/pD1a+sAIIa/FNpIrW8ONBdCVdGTAuALmt0m+8368zr6nkH9u578LQwU85wbtMg7z
         gBIU11R+No/lRgMLomWfz7/kSqofdi7GtT2YyHBe7oO8Rxrd5/CqK49TL58Q/fL4bG6O
         t0og==
X-Forwarded-Encrypted: i=1; AKwUvByx51TPjvzk1JDKRcoapLjoRX8Fc4TqnKKkHsb9C50utH7s+wemRA/vKfl6V0CV67Tj0wezYU/nWBYf1m8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6giju5C6jmXpr8vCchOnp5AUjtU5cp3k42j29JbigUY9wSWw4
	SjISYC/TYAcUdcYlsOgzLiZ9xUishoYVfq1t4brZ8LPwb1M9L1PB2vUk
X-Gm-Gg: AYBFou3+P2C4KPfPrXfbrzt/A0S/fTY8YLC554pQ4qTu+b1RjDSVmUtuOKWlqexhP6g
	1Nm6jQTNavGuh1qZrNsug2Mt8Sldmz2xtZy1vY0Voh6B+BJhke9ihlCxPJxiTNDL9p7g/R3rCHL
	im65UhkFZj6SrN/rgTk23JeKhTXAnwI56Y/Rn8Uxb30wwZENj4KcDMA9RXFcwHUzVint7aroLpB
	Kc3XZ+CbC16UtYKMR8k9XMpR+CaZ0OfQ/D5tT1VRJhe3C2bYy/A8CSCrrWkwLAZQomjn1QrolHT
	8ydJPMxxnzX0OvUwkJdvyWjQmQ4F0oG1ht+abxi+DnhZyuDvF7W36XhXRixWQsMEAjTQC4hdOMA
	vMqsdafeqwcSNhjuMbILVDzspkV5Yp+gOnNgph2xX40SkaT2QrQTTDlp95/M8RF2lowQEx1fyaY
	5ZzVy2qkVq537Nm16DwoWzZzQuFUvVjQvvZxf3cLa7CrR8zPUveV8M/mGX5BlbafhN47iOzjZoj
	sBOdWcgTJweQkWTOtPuhoLg/PPaTKWGAst/JsGj2/AqU5k=
X-Received: by 2002:a05:7022:ea8b:b0:16b:fdbf:4a9c with SMTP id a92af1059eb24-16bfdbf4fe6mr23611687c88.23.1792131132120;
        Thu, 15 Oct 2026 23:12:12 -0700 (PDT)
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan ([183.242.161.82])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831acba710sm3755480c88.13.2026.10.15.23.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:12:11 -0700 (PDT)
From: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 4/4] can: ifi_canfd: don't discard the IRQ lookup error in probe
Date: Fri, 16 Oct 2026 14:11:39 +0800
Message-ID: <165f3fccb8faf1db65e8f18dbee4694c95266e31.1792118040.git.chaosheng.qu.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792118040.git.chaosheng.qu.linux@gmail.com>
References: <cover.1792118040.git.chaosheng.qu.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ifi_canfd_plat_probe() maps every failure of platform_get_irq() to
-EINVAL:

	irq = platform_get_irq(pdev, 0);
	if (irq < 0)
		return -EINVAL;

The driver matches through an of_match_table ("ifi,canfd-1.0"), so
of_irq_get() returns -EPROBE_DEFER while the interrupt controller has not
been probed. The probe overwrites it and the driver core stops retrying,
leaving the device unbound even though the interrupt controller appears
later.

Return the lookup error unchanged, as the neighbouring CAN platform
drivers do, e.g. commit 057bd6168d98 ("can: cc770: don't discard the IRQ
lookup error in probe").

A device tree without an interrupt now reports -ENXIO rather than
-EINVAL; the driver core treats both as a failed probe.

Build tested on x86_64.

Assisted-by: LLM
Signed-off-by: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
---
 drivers/net/can/ifi_canfd/ifi_canfd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/can/ifi_canfd/ifi_canfd.c b/drivers/net/can/ifi_canfd/ifi_canfd.c
index 9eecfe5a87bd..e0f5abd934fa 100644
--- a/drivers/net/can/ifi_canfd/ifi_canfd.c
+++ b/drivers/net/can/ifi_canfd/ifi_canfd.c
@@ -965,7 +965,7 @@ static int ifi_canfd_plat_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		return -EINVAL;
+		return irq;
 
 	id = readl(addr + IFI_CANFD_IP_ID);
 	if (id != IFI_CANFD_IP_ID_VALUE) {
-- 
2.43.0

