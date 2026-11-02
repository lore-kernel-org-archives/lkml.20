Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649331;
	b=q5j73Z480GisjN+4lQuH1fohwfwOQ4ercF9YTTkSxorw4O3O51QysX9p2UduIVHlecVh
	 YsctSR4CHjexXdq+0WEWn0kn6RIXNXsaVsXF3VtQZcW++DmRRM03mEf25ALzLCBB+dRnX
	 I5A1vhSDZ0hLw/oVu6mXeFZyHeu9AHc9dpWXGQGiGUYxPh8pET7W/fxYBhkVjrqoos6wq
	 drNDL1FYHxsR0MHWHLsEMnjfM9BI/bVleDANwyDZ3arCVbm7VHdHQxvcG0doULuHvet9S
	 vzGOLpjFm2InGhP2sByn1vNO89zl+eViJ2Iq8+o0k6VexsBedJgc/VcYOcYnD3Ok4AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
	b=js7A2MTWKsmHTHgwKnOFp8muXQoU3F0zk0c/A4pn9X6IgQhBykBU1TAjZQFIb4d1D6Wl
	 KNutCyxw/+Ty14K5a+MetdDWbIfnI18Nrw8ULcm7koVXEW2bFwtneQz5IvcGzHD9rETxh
	 /ynRuzQ3S/0ZagPTUhTvHMV9ku+R9ZewAdPUCXeVttLKPAnKeUZRNPn/K0KNFOVfQmQUc
	 96xKUh2mREqxi6rVa/eI5wotWAHNdC+U+UtwyQcN55TrLbdZ2c64qMltixL0VG/VbGbUJ
	 OLr74hBo2wY3GRfLH8mKrxv7nCgmaBncTlcxU9KSsiccoLXuh5Xc8fgXbkDdcPp1Zbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="W/VHu2Zp";
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA71606EEA9
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FA71606EEA9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W/VHu2Zp
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-48eee44b908so1909864fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649330; x=1794254130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
        b=W/VHu2ZpXW2zipVHX/rXepXOiugOQtCaQnYvpUHnQkWjuFZfbFX0eq42B5jR6wADzc
         h4YjznTb2sYaRbl5uNBwLJgB4U9u3WReakR5px2gq0M3QEqxD/svXvEs5Mf9uvy57UYj
         H+LHqnhM3vq5WsVC2aUXbXX0dBeTAzRHCRxOuEdyQAYMdesUNkn3EZfYgAJhdHEsMaTn
         LJA82YROAkMOcidx5K75HK2IR0HUUsj/8aPck/+3giSmxK3oMKYmJTwjYo7/x5Wx6YUj
         DAGa+SiPKyMyxb3zgroXYtOYgayiHnZnrDCBWKLwFFLOnb/5yeoidrd1fMzXm8FfRxgh
         KB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649330; x=1794254130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DRBWX4J/Ak94TbpMM7HoAnpLEmSCyB3p+1+fdXZAg3w=;
        b=GmKf/eWTzEgX13C+opv6hogtmenA+JRxEmTABoVlYh+E7w50uagdNjnCw2JPYaILUe
         Byn1dAFMA94RF/xryelEAGlXr664b6K9GUSTfzzVLw9j7uzySGdOO+xpg0hG7Q4vE9ag
         8MDOY2l5peqvuDYiJqq2e13jvG+VE2yzdlk9isGadPjdyLWuU0U1eJvklaQn7hr3pRMW
         C77PKP+KoL5QGgdqa5iWi8YiVhgL0lvbE6IKsHuOM9zdrO+X8jPrrUMHLGvNQBbq/w3g
         wHLTfoaCvZB53DJeLx3lLPPPmi3jO5IFWqtFQPEZa8QvDMrYN2SiN7e0+b06D2cBEjNo
         aBMw==
X-Gm-Message-State: APuU4Z8in4oxnjXF3MieKV6r45MwXKXSvifbPvsFeTLZPhXFawjz95HY
	5J4B54FeawbICiId61vh6w5LxxR5ryhwY34jf0aIr1cxqyTxGrryRtAh
X-Gm-Gg: AYBFou0vRNLQ5zdkRGGzgAArdFAfiGBKAndoJ14ZlYN6SkRHBo7351/X+Sd7OK4hPuY
	wUD4mZfMI3CWb9S2Az8klNgFpvIFfa0uRSfWUS/4Rltm1DjBuA9JLjS19bky8Many/gbvO/CQu1
	ueVH2Wn5hFybrFMzNHVxc+SEHQ8Vkk9npL6Ro8CIznekO0+M+eL2ieYOM8N4cOLH1GHIXZ7y05/
	ov7jzg73r7ay7gt3gYObod3uCx/juccUMsr/e9PwTY73xnoBIwR2eC5QiaQkFYHiczfFHy/ccEB
	xEp3fPFFZSoXftjBFltNmncJP7+m39DwURSlOU9VGz/avp5tDQqwZelSrKbhGjzJz3w32yTo+ga
	Winm2+nid9lUp9jjRTtx6oUF9wSs4+nuWMk7qOqw/pQ6SBHKr5CKFBPthW2B+Kmy5vbBvFn5xdH
	RzEJyCDS0glisjWrwjoW7ZT6bsehfWyF8LfSLqpiR04sdf0mVvgx6iSWCr7ARbYq3L679Fcv8uN
	tfeDMvUpLu65bmwL3E89+upJIeBJQRDuZ9BcgK8+ngZKAmUOk8++gyxvGIkvkKHBBM2k2JEhrb7
	v7iwTVGkoZ84Q8DsBQpZoPMsnBdl4/oMWLh1rW3hgIjwQ49A+QIC2CtF9uJlDjorrYenZoGNH3j
	tAZPdtkEsFHK5gre1vrnQ+qmOtLP6DELUL7mfMaP20c3u49lbukzvd/H41tEdIbx5r+y0e9cnS8
	ON1EE+hsSHpMTjUa7vMty/SZBgydX6oTgXXQ7cPxuSnbhCjMC/ZmIFyHVa3UbbBgJ2EuTLEk26
X-Received: by 2002:a05:6870:3d86:b0:4a7:4cd1:6f37 with SMTP id 586e51a60fabf-4a90764ba69mr6695598fac.19.1793649330169;
        Mon, 02 Nov 2026 11:55:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm7809249fac.0.2026.11.02.11.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:55:20 -0700
Subject: [PATCH v6 5/8] arm64: dts: allwinner: h616: describe the UART
 integration
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-submit-h616-uart-fifo-v1-v6-5-25afcb346b0c@gmail.com>
References: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
In-Reply-To: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Identify the H616 UART integration on each of the six controllers. The
specific compatible describes the fixed FIFO capacity, register layout
and receive-trigger mapping.

Retain snps,dw-apb-uart as the generic fallback. H618 includes this DTSI
and uses the same UART integration.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index c6b3a3f8359a..b4b2f85726e0 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -550,7 +550,7 @@ mmc2: mmc@4022000 {
 		};
 
 		uart0: serial@5000000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000000 0x400>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -563,7 +563,7 @@ uart0: serial@5000000 {
 		};
 
 		uart1: serial@5000400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000400 0x400>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -576,7 +576,7 @@ uart1: serial@5000400 {
 		};
 
 		uart2: serial@5000800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000800 0x400>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -589,7 +589,7 @@ uart2: serial@5000800 {
 		};
 
 		uart3: serial@5000c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05000c00 0x400>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -602,7 +602,7 @@ uart3: serial@5000c00 {
 		};
 
 		uart4: serial@5001000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001000 0x400>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -615,7 +615,7 @@ uart4: serial@5001000 {
 		};
 
 		uart5: serial@5001400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun50i-h616-uart", "snps,dw-apb-uart";
 			reg = <0x05001400 0x400>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;

-- 
2.53.0

