Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6396C4D0CEB
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873542; cv=none; b=XclbRQ+FwGxE2m0nfPSucBWaVtZWjY45D2qJVmmcP+9Umfy6teiZPpTzLkb2ttXAGqq2KjxqRoYUk2CFKetuAJK8pjWDdHQf9B9kgXzSFzj0oepreeVTqVzPo7kExqnVhrJ0lwTbWpnbTo4DpogwENXdUyjrQcafKn2CvWQ9pLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873542; c=relaxed/simple;
	bh=/4c6htHbY/+pTDzTjgO76aMfdQ2UmFpC3eU2LEDgX34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VWlQSgjGjceNO/vBzgEnCLwBLQbH8PLxUDAHnV/lbYWxVomuJfJtK7ynXpiI0IMDVVBAt+Mc6Lq+9qdr7FuQo/EiCx/85n+UEqk/gPzc25ItVa/P/FdKX0vN8nZem8aN7HQmtOCTL6BGurrEDjZkQ0rCZkOLUqpUyZvl2Y7l+WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IzMnP34f; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IzMnP34f"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so37837505e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790873533; x=1791478333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XLK7hUg8XDSDCbDtdKxO+z/jFp8LEc8rnhxAY0EynGc=;
        b=IzMnP34f6Ei8y7ngpA7BAVCYcTb3gBGSlJ3Byb5HRla+bSIHNqqtClj6gIrw7oJSjU
         wfqdywjlQ1xuy4g2f/jxSFWfrbNlGiVxFb4VzrM4oL8UNHbX1QgIbXaJVSdPBvL7jnSW
         E4VFZRUJS8LsFxeQfgFKOSpcZuE5hKrKPufMGjD8Rwcpl7rzIAA1qMGQq4kPX45tO4ok
         K84ZlfmLF+qYQ8YDDkcb/3GjxaKVHQ3o3ZDi2KZE4jnu7ptO5S/sm7XYE52xDTPIN2j/
         gnHHSnXUpkmZGkOlPI9ugQxEG11MyfIarNG8Xkng1z/posf+7KFFn/C9KDiHuHyg5f92
         LTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873533; x=1791478333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XLK7hUg8XDSDCbDtdKxO+z/jFp8LEc8rnhxAY0EynGc=;
        b=01CfS5nmkqaKse12XaVqG4B3vio4a8P/u8OwNP7yxUQL/lak+JuQ2/iuw9Bo96tcdq
         jPLWiCG287nD7lrSSseIUVXIFdIKKn8V2gcIuKsGGcuHNPCLjd8ET8xfixO6WFsWi8PX
         5TBharMwa5p+BTRQyJRWe52FJWlbo5VWQFBPiFN0xLVIpMITZNIWMoal7NcMY8D7BuS1
         tZXjIg6jQxAyjT1vd+uX+drLRnRaDWWlu3ko6gnzPloWCX0fmeuNYB0N7OJBMUOlGnAO
         rBiVte+zxfUa2eF7b0N97pzbPVKYWk3Z0HyfhkuXhfdqFwSx2qbx4Sf0hqwFzzUW21iB
         MY6Q==
X-Forwarded-Encrypted: i=1; AKwUvByUoNtZgBeSqnYWF7QhDDMf+A7QzT9LBd9VAZYKRa1jr7aaFmZL3tn/VgXxxYjRrCXn72VTfg3YtNg+MBw=@vger.kernel.org
X-Gm-Message-State: AFuF++kKStNHiuqqE9ddP9bF/utLiM9CR8YQ3yS8H0wIDbryVOuPBAj2
	vb7QMam6VOUQFPEEWZNK4Kg7KJt1Q7zFhci7o9139wrpXSKiRPIWfa1x
X-Gm-Gg: AYBFou3/2MrJuckUsp1eIwOTufQGQlf4ar653Dvr2rhcXzeJlmjNCNzSsP6JKCW66Pp
	W74bNB6XkMBY9Yy2tYARPBJkCZtbVf9qWbhU8jq6eZ2F7UwdPI6ixhhvTHbZyw9af8+N5LBLY/X
	jPEt/rkOl6TSpCiOKcsUstmLrLEM1RAwsPstL0/jRySTGqkK8j1b75mrNoBapzCuFKZIUjWIo1N
	3tGRWYVnWCEvaqJQCgU7rNfgQmWGY0rssaIRFYp1HbLajYeMzMsCqYoxrtxlwDVl4n45IQp2djP
	Kr355y3CIGeDUWzB1Za5+qEPXDzCPgpFz2JbrZzuYbTDVoxwaAJRmHH7KI3sKYdqsKCOGT+/QLz
	82Pk4oJRte22zob0JyMoT2S+1djy0PvRPhGvXxQiw2ipBAxjS5ltCTznIsbPjctK56OmYzmnH0X
	hoKkyrNPza14TZeyWrxy55swEP0HaRZjFYaN6sBdKUsHs1I5DN2VvEeVNe/IhCON+Cmrm07Nqhm
	Jmrgi/ocDck6WU/OXOw2EWp3gazDF+uLvHWlfw53avH22OrzNKQbeyqN7hrJF2chX+pnHp5C+jI
	2R1QRwD5
X-Received: by 2002:a05:600c:4592:b0:49f:ffc7:2099 with SMTP id 5b1f17b1804b1-4a0276ab7bbmr3757495e9.26.1790873532595;
        Thu, 01 Oct 2026 09:52:12 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027ae146csm480985e9.11.2026.10.01.09.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:52:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v8 7/7] arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access
Date: Thu,  1 Oct 2026 17:52:01 +0100
Message-ID: <20261001165201.763882-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The WDTDCR registers for wdt0-wdt5 reside in the second register region of
the CPG/MSSR block. This multi-function block is now exposed via a unified
syscon regmap interface.

Replace the direct mapping of the individual WDTDCR registers with the
new "renesas,sysc" phandle property pointing to the CPG/MSSR block syscon
node.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v7->v8:
- No change

v6->v7:
- No change

v5->v6:
- No change

v4->v5:
- Added review-by tag.

v3->v4:
- No change

v2->v3:
- Renamed the "renesas,sys" property to "renesas,sysc"
- Updated commit message

v1->v2:
- No change.
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 68c8daed557b..abca7aa89458 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -327,61 +327,61 @@ channel1 {
 
 		wdt0: watchdog@80082000 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082000 0 0x400>,
-			      <0 0x81295100 0 0x04>;
+			reg = <0 0x80082000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 0>;
 			status = "disabled";
 		};
 
 		wdt1: watchdog@80082400 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082400 0 0x400>,
-			      <0 0x81295104 0 0x04>;
+			reg = <0 0x80082400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 1>;
 			status = "disabled";
 		};
 
 		wdt2: watchdog@80082800 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082800 0 0x400>,
-			      <0 0x81295108 0 0x04>;
+			reg = <0 0x80082800 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 2>;
 			status = "disabled";
 		};
 
 		wdt3: watchdog@80082c00 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082c00 0 0x400>,
-			      <0 0x8129510c 0 0x04>;
+			reg = <0 0x80082c00 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 3>;
 			status = "disabled";
 		};
 
 		wdt4: watchdog@80083000 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80083000 0 0x400>,
-			      <0 0x81295110 0 0x04>;
+			reg = <0 0x80083000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 4>;
 			status = "disabled";
 		};
 
 		wdt5: watchdog@80083400 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80083400 0 0x400>,
-			      <0 0x81295114 0 0x04>;
+			reg = <0 0x80083400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 5>;
 			status = "disabled";
 		};
 
-- 
2.55.0

