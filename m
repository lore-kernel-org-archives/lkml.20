Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77ABA414A1F;
	Mon, 14 Sep 2026 08:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375280; cv=none; b=hSoUsvOFpx2OK0tCWKaEZjd3/1S2IbhKjieM+IM0Rt337MzSXRuaaBVaXwKGDIvKq+Nbba2+mPSwTdAOtQVQRx4qJLikVAL1PWeSepaPtB0nyBysZJLe+khs/1TRi4Eg0FguaQTAQGUD+nHWEQ7oIYg+boKlVwZjx3WN7a6DNvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375280; c=relaxed/simple;
	bh=cFmVSaZo9VycGh/nPhdXICFa1DKaYSdhu9nyfwbN2m4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dyvaeGdYYBkCwGF8A9WZqlQWBk035YG7vyR8tZc+8zPmDV85dBIIEaL0OWAseh+o0fv9bt7hxNqutw13eqC5khHS5NgodPUcKiPjiumTKs2kIT+MDpfhuJMYAwaaIbaND69ZUnpo4n8Wf6liO916NXuckoF8jbuBtoNwzHZIXPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=FMwbpYfi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HFJ1ZFje; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="FMwbpYfi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HFJ1ZFje"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4BA7B14000C1;
	Mon, 14 Sep 2026 04:41:01 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 14 Sep 2026 04:41:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789375261;
	 x=1789461661; bh=r63YwR1L/ofpHxLT6Q3OA+2f7mAGpLh9Y4XDj0L07nc=; b=
	FMwbpYfiOshCroUvDo8PQ4W/JiDenRkDjx1VPlirkTI8kco1jLmEfunOju7r2gYi
	OQ3Zdth5gBjr+uUXOVkPNmWQPN2WfpHkw8pZikv6xauzJ2LJRZefdl1K7ai5Lmlm
	6m3hB9pPYLnD3nX6N8nTdso5DZikTtrwgI9s48WKNo7HvE4tiflcVbL7hqIBsRi0
	/ae18kgVRDzS9R9Qmtp1ryz6r1qtHBm2mIWGIR16FUufwRTqsU++Enzv3GQk+e1X
	gdbqbWLinoeVLAqt6RSGW8/4ORrUbmraBzkBsnHqyfMvisWJKZuKqPoKXMlJIuAG
	GHRq9zW35KeK7UtM+e8mew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789375261; x=
	1789461661; bh=r63YwR1L/ofpHxLT6Q3OA+2f7mAGpLh9Y4XDj0L07nc=; b=H
	FJ1ZFjeCUhV7Gk1Kwal/PPc7mEX+iAiO8CSE0OnM7SbWzsy2mtRdaIOFTdV4So5d
	/OY3oNZaKlHz5fIKMptAE+e1c3XhtftKwgmoJwb8Mpyq8AZnGGKsC5NGjPUTMKiE
	i+rSud9nQAA1F03yipDhS5ORzuGKcM0e+6f7EWJrUVnZiAN59E7L0mQY6A1IlY10
	4rBd8+at3078u5TkEhpkqUV2npkuIn5BC14XLku7rPguQmFULLu8uMxcZzitpeWe
	Kn2e86IcW+gtDbbCSHtTARiI7zo4XrBFizPmyvwnAmlTjD97JAxepD/2h/XCLXD2
	/QhryZmfShK0EBl4zKs5A==
X-ME-Sender: <xms:HbOnagQGt4OB3ymB-kV01o5DriFYUrx7BwFEdQhTcJvJmLnmlIrQwg>
    <xme:HbOnal84d0qHr7K3R48YhDYM2NEQ7fHe5Zs0haZN5bt8RvJpGQEw14J7eBseHCFeV
    N0_VqlTJl061ZSNTV6PU5nMsyIyLEe5k5LxOr6b5S_zn4f-UNILw3M>
X-ME-Received: <xmr:HbOnapYcd7QhwJZycu294J_nKXcNQ0i2xLjnndVDOfvVvH5z9k0HcuO1ETl7UNVhXyiCwS68O9I7mtkRzHjaAsL9mu7s_dUnuSAcHg>
X-ME-Proxy-Cause: dmFkZTEDLHr0shzxwhX+29bUrq2gfJ1+uzQ4b4gKQs3bZHRMEcVi5+3e+WWMmXn4weJHF0
    3tXMcFWQblGPPDQI4M9zHrzHMMgs0LXrEWCtY0HOKPhWUiTU65Hq4BSITitLFMR/nfR54A
    QBr3yt2+EqSebK505dZuX4BQiJBC2YrhM1cKA3YLwTBOhpwZfcQEF5yaMpHRvipvp5nbhM
    qXqI61aj3JPw2SHELjXQTGsoBh2Y/LuJTzIJZd7IArzAR6+91M7O+W1wr1s1KNxWnuZkuF
    hsZ8YwXBQsE0gAiTRFJnmiV46ucM1Ygc8cn9Pw17HkJ3S5rNQ8lRntZ8AGSg3kYW6wJPdL
    83fxU2zWEV5wmioHAb8mbUio1x3EuvEGyBZKDuxzRLjylbCD3pmK589O6UCfgEhyuwyobl
    jqPAEjFd5AtZAhl5eFzMz4Aa6g4XQDGTAYdPu/ctaPrBZERU+8gCmVkQcbLMHhl89OcHl2
    tlyTDskvTtNGyq1s/T4YiKIrMTndMvt//qdmgQsguedd1eYB73QdrUOfTDlqJYp6d7bfYx
    KwOxFb2JFiqp7btfgy2fjc+/526br1JPc33CptUZOFS2Cwrqz7GdlRHldGTGlv9PIXwpQs
    P/TvpmOe8WFtjyHbgjjSQ3hWLIubYmqdDjHANi4qhzz/WzMjcbzLWfxL6+ZQ
X-ME-Proxy: <xmx:HbOnaup1Jqu6Wwz-Fcpqg_HbnFPADJtKWv5SMpw4Xq4gEBKbSDVARg>
    <xmx:HbOnalS0VgR7NECQMBSmnxCwI3ZfGanrKDsO38zI6zJHQLFX3W4fow>
    <xmx:HbOnaqoSQ8saFh7OFw5R6PfSZj1p9Sr8LUDcqj7T_DESWHnUeDXEaA>
    <xmx:HbOnan3J1j5ydiPjlO0g21cpcjJ9kGvPX-qGInWfRVvcjSHtvQ8cJw>
    <xmx:HbOnai7hMz8Piem8g_oL4wneyrtlaLjPRUm0l6ATqxLmCzkZ3MRc82wI>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Sep 2026 04:41:00 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Mon, 14 Sep 2026 10:40:43 +0200
Subject: [PATCH v2 13/13] arm64: dts: apple: t8122: Break overly long lines
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-apple-dts-m3-dt-style-check-v2-13-e3e89c33f562@jannau.net>
References: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
In-Reply-To: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1203; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=cFmVSaZo9VycGh/nPhdXICFa1DKaYSdhu9nyfwbN2m4=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqzlm1kyN12Vs5zd5nXGb6bWlu85Fi19z2/MfOhePUFJL
 /O9g8byjlIWBjEuBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABO5JM3I0CL3yX+75JPXtgwH
 lTZtvDZ113sPq8/7bkqcMje41fY57Agjw7zE9sMcto2TeeKVBNmcLLd9i9S0DDE5um/lK43IGwm
 XeAE=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Fixes "[line-length] line exceeds 80 columns (N)" dt-check-style issue
with N > 84.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8122.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8122.dtsi b/arch/arm64/boot/dts/apple/t8122.dtsi
index 173c05a55fc1..52257fa22631 100644
--- a/arch/arm64/boot/dts/apple/t8122.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122.dtsi
@@ -341,7 +341,8 @@ i2c4_pins: i2c4-pins {
 		};
 
 		pmgr: power-management@2d0700000 {
-			compatible = "apple,t8122-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			compatible = "apple,t8122-pmgr", "apple,t8103-pmgr",
+				     "syscon", "simple-mfd";
 			reg = <0x2 0xd0700000 0 0x14000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -394,7 +395,8 @@ pinctrl_nub: pinctrl@2e41f0000 {
 		};
 
 		pmgr_mini: power-management@2e4280000 {
-			compatible = "apple,t8122-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			compatible = "apple,t8122-pmgr", "apple,t8103-pmgr",
+				     "syscon", "simple-mfd";
 			reg = <0x2 0xe4280000 0 0x4000>;
 			#address-cells = <1>;
 			#size-cells = <1>;

-- 
2.55.0

