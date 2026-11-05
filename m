Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911948;
	b=C95NMGHSuqINpJZrXomvb6zKAAqkHJmH1eQIQRrgOJ+NQpmis2JDQOSj/J7T/el/8xEj
	 fLJuBt8QuWou92SP9a8TVqmGbZr8XYKNmiIABxHlnsbR7ivvkfxH73GRDqJq5PjWsIYEz
	 tJgOV3LnpSVBsP0RVMx1nKYZg3ilHSDufAGyPjAvxH2ACZv7umwvdzEmAqhWFPb3RHLke
	 nGtmsXXq2ceobkhsLbUUw76aweSEQpevEUqIWFTE12XpS0idJ4uJzhbN2jSndWS1ntF3S
	 9xPC8iB0n3JRzOJHTXYrTN2ZBHzf+st6K6+2r/pR/M5Uf88yttjmTZqIfEAdf0C2kxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
	b=d/i415Mv+iILwjJkLbOLcVQJDEXsIald+7HGLoksqnJWA53z/MPawL9qedwBOaeW4HTp
	 vBHYhyroLvD05klPPR9GDdVGLTgj0GqKm2uyL0ECpwaVLhyt4I7lVqiNUKs2BmA3XHSQR
	 UcpdCUgRLUxaTWUrhmE6g/VjUb0oc+ACiD49U5Ntvcu6s3Vj/IjzmUbA+EFBEnW11Isax
	 /iO65yvJxzWLYPNX4yMI9aHCORdNMU1Ha+cP9fl9uQWYwMqe2eejBswDlaXEI1NBUfbr1
	 YMYbatQmo0z2fhxwwfCS4mg6iF7Ads3RK3NGHU5JnkBIonVDl7H6LCTKXJSF/hTPPOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LbaBlWLS;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BCA606D839
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83BCA606D839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LbaBlWLS
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-84e513877a3so1087386a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911946; x=1794516746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=LbaBlWLS0+aIP6CHgi2/Vmx40Up/uDbYZsZuAE0S44vPJg+AA1gfDWBpnRrBsXiZ4O
         7TPKaCzdVjiw9lgUjwnFYStS2s8avEYvnkFpOaOJF3OTg1Gn36Ay/8sBLUubkOBK9Olc
         omLf+hRaxeK1gDcLFaEfEaL3+FystFirrlUDs/iXE9Hri4DyAudzSGbN3TaMhc9ECCyM
         7R+lagwDVFhwjbbFyuMLIkW3MN5UnavHOnLi4WDp68VWTgCVStVSKeJxKQEDIRizrOyN
         BWcLIZUmcM0PbDFN+6ipsjqCksdLQ55mB2ayk2z7QpXEicyOJ52Lp6Ke6TLtYy+kkiHw
         KnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911946; x=1794516746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=aH0iDaVka7KJnif/cU/GdxZ4EazZoPz2gOfmbjE6IKK0NhdxBFY7cU+T/DYF6v06Mu
         GAMIZr7ukn19637Sj7thEdDS3tHUP68lNG1N1pMsTooFdVUX0HLuITwxsmuWbeIAjhMK
         tyTrzZhtT/r66FiqqZwReMylG3wq4VcTmdGCIFfTO6LNve7sQmXH24pwo3LI/ZPJwk6I
         5p8Qih6s5VtyF4hwR5saFeva9gAhFb8nLstlrz9Bms1Wag276QFnjBhC2+2Ym41tCAEs
         fZ19igm6tbfWGZxv7pqNJnNXmlb2fcheeT+YmhdcCbvQkctErBUdxtkS54gxPBSMUC67
         TwHA==
X-Gm-Message-State: APuU4Z+4fQiV+piR2v97HyPtScnJRmYJbbWALzdz4iuLko5t3FTaT9BD
	GGKKf29DZZwaPuc4BKkser8lluBbQYXfT84MS4shoBaZDCe23YivoUrY
X-Gm-Gg: AYBFou32exP9hErWIdiqLy/rt1hfHr7iBVzbwwzrpqRLux2YoMS7w1UAciRwqIGTQd5
	jz4Dr5DboDcfAi1d4U1crgQW0CsOLhEZumQ7c+X5i7qo4SnXwruGmCd+rAQ4e//RBtTOuBGNyrv
	1774Psz79P8g009YF1RaYyRFKnVkNz33N1XE/Aqgej9Op8END0+v3eExPxpeyXLmnMiy2LU3mJN
	sWk/v6DBQBahjUJkNP+2loKuWTWC+FDGT85KcnKiBDjPz9ZKxMx9rlTcC5JuGnYhc/gO1lvp7I4
	emnVTh36yEFle+0ZWQpEnlPNMw1Ny2piZwFpjKutjm5pW2XGwJm88hHHdrhD/JHpeiV/jZhnpzk
	dKjNa37fAKktE3wHCI29emq5NluJBlXLEHbr0a0gmwbjGXMCvEDv+7Vf0UWLbtjmwuwiBUm3zlf
	lteLUqWZ/pAGR/KM2jEsSm1zfeoCDNdqGXg08DIK75wNoxIxj4U7qi0pGEvnLNrgLEqgSBa9Bd/
	d02H694c6lNdP8Vro5Q6JA/JpY2gPtpgJMeErCUCbGWumOSQb9HvIuwO5rGZIcF36GxeV/Xyy7b
	K5LaKGPLr1swDOTCcXaf8+RSX5jKeUqH/l+Riq+PLFNXMbWRoCMFQjgzbxw8MAtMzO8VBShVJqn
	lAog9R8z2N3skOIaK+yBQkBTMUU+39Vi5J8GC3P9R8F8FO+AHgkLxmha5WTN2+xdDXBnJF8QTf3
	oN+dGX81Lr1AqEkHxt2b5DoOPT5vJC65jmT7YODAeZ0ZY5RU0EpkNyU8FObpTc7mE7YPXLQ/TF
X-Received: by 2002:a05:6830:2b0e:b0:81b:9104:5ad0 with SMTP id 46e09a7af769-85f052a28b0mr2500096a34.0.1793911946474;
        Thu, 05 Nov 2026 12:52:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:08 -0700
Subject: [PATCH v8 07/11] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
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
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-7-14024d2b184b@gmail.com>
References: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
In-Reply-To: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
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
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The H616 UART has 256-byte transmit and receive FIFOs, but its DesignWare
component parameter register does not report the FIFO depth. Its optional
register layout also differs from the generic DesignWare integration.

Add a specific compatible to identify this fixed configuration, retaining
snps,dw-apb-uart as a fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index e2ca126d58ba..fc1289073241 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -60,6 +60,7 @@ properties:
           - const: renesas,rzn1-uart
       - items:
           - enum:
+              - allwinner,sun50i-h616-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart

-- 
2.53.0

