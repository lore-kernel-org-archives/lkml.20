Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.25.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738041;
	b=O05wZPVHKdUdV+ZxYW3YdnC0NBX5qa+J7/U4JoSwqBHf5wKe3lzdQpKQ1B604RD91cN+
	 BMLvVcHX2EQ8vtk4uBIk5XNaFQMVlOS33GM1R2heP4APjpCo+hVfXXaLvHexWqf8j8Qto
	 FVF+BhMYHo0u/xyWX2M+3UnY3Pgm0Qp6k3XokzSuj0x+R62BCL+iipNKXaYwQzEO64E26
	 Pz423jpbHwd0PcUs1Rrm4n1awjQH8fBBPHMq9VEgnI+fdiezkmUtDBlltt3Lt0ET/Qf5z
	 lnVTdAqgOR2vzNy9OVN0m8l5vRQOY7IpIkcxjdNIbhSJFfhmEdJv3/+4PrEBSCiy4pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738041;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Received:
	 DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=IpTAQdRgdhCJhb1hvxDKWghah7aGv6NZyMkxYCZ92Rs=;
	b=OHKRN1IytW4y0wvo/moQK1vaus/OodzgTTuFGczRvpCVXYW/c610gKtVUXMXLqtKG+xk
	 ucGg4E7gDzO5S4jU/tOMnJDQMi4dxL6EHVJftCmee2489/+eA6WXd9mdgWFo2k48W3xYe
	 ohDyAFPl43SGBTEAuYWql1nlKuV9duxJe7KIGnQWvVZd19vOFJr6TxXHwnEBmNuDPtTZS
	 w5OV2c22gFmvqqNzD9mYzwMSLjZOoscajIVuLJZ+LQF1K2YjitGQKdg39GAawq49rM9EE
	 laIJo5J7mfdRLiBq9doDujxQ8/eoepqt6Nf8/pXkXRKEFCv92wN8GDMdmj5oaiR0eog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rnplus.nl;
	spf=pass smtp.mailfrom=rnplus.nl;
	dkim=pass header.d=rnplus.nl header.i=@rnplus.nl header.a=rsa-sha256 header.s=dkim header.b=Jsn76HXz;
	arc=none smtp.remote-ip=178.251.25.70
Received: from mail.rnplus.nl (mail.rnplus.nl [178.251.25.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99221606D805
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99221606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rnplus.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rnplus.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rnplus.nl header.i=@rnplus.nl header.a=rsa-sha256 header.s=dkim header.b=Jsn76HXz
Received: from localhost (unknown [127.0.0.1])
	by mail.rnplus.nl (Postfix) with ESMTP id C1305379796
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:33:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at rnplus.nl
Received: from mail.rnplus.nl ([127.0.0.1])
	by localhost (mail.rnplus.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6BJcyTyQwrOV for <linux-kernel@vger.kernel.org>;
	Tue,  3 Nov 2026 21:33:47 +0100 (CET)
Received: from E595 (unknown [185.10.157.158])
	by mail.rnplus.nl (Postfix) with ESMTPSA id A6BC737977F;
	Tue,  3 Nov 2026 21:33:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rnplus.nl; s=dkim;
	t=1793738024; bh=a4vWSx9rLNvabRu3vIDBn7/4YymkwBrYWvlKnKwfxas=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Jsn76HXzv4eFOOwgUbSQIOLIMAQKaYgXoVJs1tbb10Zi16awRA0nzypxAAuD7oPf5
	 ErykmkbQDhlSf/z/v3DVS7gRqu0J7U3IRopvcx7d9Rmlkm3cXH5s5Of3IlzeiAKXBS
	 LxB5ravxMejTgXwNveef187G1bdaVUpEVvS2l94Y=
From: Renze Nicolai <renze@rnplus.nl>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Renze Nicolai <renze@rnplus.nl>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] ARM: dts: aspeed: x570d4u: Add some GPIO line names
Date: Tue,  3 Nov 2026 21:33:05 +0100
Message-ID: <20261103203308.54789-5-renze@rnplus.nl>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103203308.54789-1-renze@rnplus.nl>
References: <20261103203308.54789-1-renze@rnplus.nl>
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

Several GPIO lines used on the board had no gpio-line-names entry.
Name the NMI button and control lines (GPIOA2/A3), the BIOS flash
chip-select and LPC reset outputs (GPIOJ1/J3), and the hard
power-off control line (GPIOAB3).

Signed-off-by: Renze Nicolai <renze@rnplus.nl>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
index fca14320829e..0089845a6f0b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
@@ -79,7 +79,7 @@ iio-hwmon {
 &gpio {
 	status = "okay";
 	gpio-line-names =
-	/*  A */ "input-locatorled-n", "", "", "", "", "", "", "",
+	/*  A */ "input-locatorled-n", "", "button-nmi-n", "control-nmi-n", "", "", "", "",
 	/*  B */ "input-bios-post-cmplt-n", "", "", "", "", "", "", "",
 	/*  C */ "", "", "", "", "", "", "control-locatorbutton-n", "",
 	/*  D */ "button-power-n", "control-power-n", "button-reset-n",
@@ -92,7 +92,7 @@ &gpio {
 	/*  H */ "", "", "", "", "input-mfg-mode-n", "",
 		 "led-heartbeat-n", "input-case-open-n",
 	/*  I */ "", "", "", "", "", "", "", "",
-	/*  J */ "output-bmc-ready-n", "", "", "", "", "", "", "",
+	/*  J */ "output-bmc-ready-n", "output-bios-cs-n", "", "output-lpc-reset", "", "", "", "",
 	/*  K */ "", "", "", "", "", "", "", "",
 	/*  L */ "", "", "", "", "", "", "", "",
 	/*  M */ "", "", "", "", "", "", "", "",
@@ -114,7 +114,7 @@ &gpio {
 		 "", "",
 	/* AA */ "input-cpu1-thermtrip-latch-n", "",
 		 "input-cpu1-prochot-n", "", "", "", "", "",
-	/* AB */ "", "input-power-good", "", "", "", "", "", "",
+	/* AB */ "", "input-power-good", "", "control-hard-power-off", "", "", "", "",
 	/* AC */ "", "", "", "", "", "", "", "";
 };
 
-- 
2.56.0

