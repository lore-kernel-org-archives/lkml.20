Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.25.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738041;
	b=FObdV73Spn/lzdeXQ/vHw5PZToJ4splBaS6Caed+oP+QBq7VIp29QkOpFJRJ/NksviFB
	 gr4iXF1ITfbPSEIj0rzX00Z7c04P0hZHgSalz0N+zhRLbG2yDq1XncSSmPnXhtJYxYwBG
	 CMcJh1AWtDd+w7aHn70/H3cTKxokNdPCb8HHcrb+Ju0WYYghM70yaFf37dOhRpqsOlPrI
	 4ahn1tnHqEWUnULOk1AHfDeq5UwmL+C3z6OIkm37vOENEoRSovXhIAUkrYXy4/Hss3B44
	 m4eOesP0OxRtbxHbtafvyS+9fDBk0QZzUQ3BopkGz0/4om84vW2Fy7gGLFPKUjGv3kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738041;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Received:
	 DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=g4710mBwVYs967K4QgLDYfK9fIoxHjIzWDjvzQBbfyk=;
	b=C4/BvQigaxBvwNJenf3ywAHULOI1eMDk3VNQNkS9b2BAa+UMdEP+nvhr2i+pgTc1h6Au
	 upbQM/vQVhX/cXE75HsSHTt7ew6v3hK7UN7S74KLhcH6uZj+A+Gcg208aIB+0Honp+y73
	 mQF9OdpYrKv+q60K9yxhMsaInpVCrFM9NoD21IPa1GA9XMCFy3poXGZEYU5WUEMjoJ+Uw
	 BHhPScbHqoKPLZxUFpkBVZlGkHH4vayraYpE7V46YtWk/CzQbunXnXAGX1X5c3uTIVh5v
	 iTze43en0eh3zCycEYxcNxrGCfNW4NuTg0gaxXm+s5RHVqs50StMhEMAGFn0Q3BYkng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rnplus.nl;
	spf=pass smtp.mailfrom=rnplus.nl;
	dkim=pass header.d=rnplus.nl header.i=@rnplus.nl header.a=rsa-sha256 header.s=dkim header.b=yacQ7jHi;
	arc=none smtp.remote-ip=178.251.25.70
Received: from mail.rnplus.nl (mail.rnplus.nl [178.251.25.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5A2606A33D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C5A2606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rnplus.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rnplus.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rnplus.nl header.i=@rnplus.nl header.a=rsa-sha256 header.s=dkim header.b=yacQ7jHi
Received: from localhost (unknown [127.0.0.1])
	by mail.rnplus.nl (Postfix) with ESMTP id 17A17379790
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:33:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at rnplus.nl
Received: from mail.rnplus.nl ([127.0.0.1])
	by localhost (mail.rnplus.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s2iO0sOkhTgT for <linux-kernel@vger.kernel.org>;
	Tue,  3 Nov 2026 21:33:46 +0100 (CET)
Received: from E595 (unknown [185.10.157.158])
	by mail.rnplus.nl (Postfix) with ESMTPSA id 3ADF337977E;
	Tue,  3 Nov 2026 21:33:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rnplus.nl; s=dkim;
	t=1793738023; bh=KQcSAMUy4mMylL+vIJL0oe+1qrtpcizOgu4lI9jmLEg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=yacQ7jHivL8PsuyI1WDkxXn4tspokbJO8Hq5MtcItZEAOTmNgB1lrkVlGbx6LO1AR
	 FesrC4ttYXhRIwoAuWxCphIVxLbh3f0SrnymVyqKgqj5MxP9h3mHDD4OnO5O0OvUOZ
	 odp0g6diFx4d8oMPoy8OjDGfGHaSiClCLxww7k6I=
From: Renze Nicolai <renze@rnplus.nl>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Renze Nicolai <renze@rnplus.nl>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] ARM: dts: aspeed: x570d4u: Give unique names to MAC address nvmem cells
Date: Tue,  3 Nov 2026 21:33:04 +0100
Message-ID: <20261103203308.54789-4-renze@rnplus.nl>
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

The eth0 and eth1 MAC address cells in the eeprom's nvmem-layout were
both named "macaddress" (differing only by unit address), so their
NVMEM cell names collided once the unit address is stripped. Rename
them to eth0_macaddress@3f80 and eth1_macaddress@3f88 to match their
labels and make each cell uniquely addressable by name.

Signed-off-by: Renze Nicolai <renze@rnplus.nl>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
index 6e7e3e7ec101..fca14320829e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
@@ -233,11 +233,11 @@ nvmem-layout {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			eth0_macaddress: macaddress@3f80 {
+			eth0_macaddress: eth0_macaddress@3f80 {
 				reg = <0x3f80 6>;
 			};
 
-			eth1_macaddress: macaddress@3f88 {
+			eth1_macaddress: eth1_macaddress@3f88 {
 				reg = <0x3f88 6>;
 			};
 		};
-- 
2.56.0

