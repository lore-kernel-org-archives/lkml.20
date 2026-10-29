Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299657;
	b=R5PEbsmfUIKa08joom3S7yMZC8gwE2b9YKEpHBgo/rhrD7nJwEfit1DhnSSwYLdwIxJH
	 sCl4N2LWsggMHyCig8GSYHlLWfGVbQsCp0MICEezypbRke/RKK6tEDnoIcD2L7SMcUau6
	 zjEXjP2fcK8wR57ndB5sJ7RRrz7RLPHM4r9PDIs592uIuwXAL8q5xOkb4S72NmEGMmfJ5
	 iOdd7BZOEmWj5yXI7WOiufoinPhpUnoYCyo+yju8392Gc2Rr5Jg0K3BOSmapGMPhlFMUQ
	 cpCIJ0e4Kp49Clk/0aIsaF/gRww0ZojMLseNHyp15M6LfxCjELRT0nGPdqv/hj3aPGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
	b=acQuRNjgnFJxz4du7F7hx30LYqqzvhHHupS4m0d3DDHaAqBVwt5TzrknqKzzqogZRe0+
	 RfaXLkjioCBjgTiWmpkjmf3ij8ltuzwFqdxcY1JM2DGN3OcId12yePsxzPdz3fTZCNOjQ
	 G4v5i2r9xqi6o5l1Hx5Ra/AvUnlvjtBHr3NmwevNqsab+SCGOd29Swjbu/Xt/KQFnMQa4
	 2N7NIg6WHebpex8w50rmFBVmFjk7m1gd412HHGNETnYqjg93ZU04AOCjuh/MTW2JLSiLz
	 TPsz3vezu+W7UyWx0zNmpMu66UoWAm7gNhcs6pcnOW+E6QrYEXm4GsGJsUXQzYZXsWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=urFX1dBt;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E6860A2615
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4E6860A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=urFX1dBt
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6aa9606ddadso1981726eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299656; x=1793904456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=urFX1dBtAkSRh7CaH7uplo2mLheuBgHF8ZvinGqgnFBzci/WpFCZ9ZYTt6/TJeSyVu
         mgKRy3jk/MADUQg/ZGVbD+1TSSkvgfbAA+qQBDQn29skTwK/7k4aWiaoYukBC+6Q04Wq
         FLNl7OZUotk/GIqVoTTKVTCpDEfiehKeHSwTASTVd1auo5eFyeN+04mpV4OE49HsuAUM
         lh6ZedEmWOHNG92CjahHYITeNSozDN7o9KbvPDyx4WzCIi9pz2cD495A10L7RUaPN3/S
         Loj6/aXPj+CvFH7lJcbJwYsLWKXlpUAMYRmCgRaBgprES1G924LHW3E1EAn1ZU/WjBTF
         J4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299656; x=1793904456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=UfrgndIvhSCtHuhead8BTddTdSoLiGn0tq4n1zm2Ux+n1h+qBYx56fjYEO5MBHyNYe
         zwbcaKbDHNpmwxa3txXJKPhmrvf6E5BiLMhoDdm02xRdC06t9Ni1qjNGMmlQNI5jw/qB
         EGzIMmLFL9uvdcwm747AXb0f6Wka9cEAEeD4eBIL9raxGBMmi2A3flkiEjHNwHcoRDkz
         tCuQqhbchzkwb85xaZESDS9719jtWFyuVfEjYyEOgA1Rh6WXtbxIhonqaZolzdswgL5E
         nRkHA66p/SNZWTXdZ69QHHl1eiTaSlpqFr4vnzZL6jgUZxfU5BTqpJAa1tibl4kuZzk2
         pvFA==
X-Gm-Message-State: AFq9FYJTNHLqPrWSjtZp++gwmYO7Nnz/aQ5yD78QG37nd6nQOx0joy8S
	DBC2D9JtPqWBhdHBhblzK6jRYHzh7KGoz4PIQmeL5UoG18oJtn1ekq2q
X-Gm-Gg: AYBFou3Hfu59EpTcpahm3+X7k3SaTxtJ3PYHOWXdzf3TK/TsKZYZb8vKxjezVuZ7xaM
	d4ZdM2g1twbD4Doy6OjTAzG6WBY1qZFEjBzbSKQwC6sQttQJBnzQI6o//hYJ9NSNeYGHqoe6AT/
	uFqlStWBefgOVHLiSBL2Qpf0HeH0J4BHF3ZigfFHtmg5oIagtjfaS0rtRuPSvPNc51j7/hG4fUx
	i9JIPIQZd1abb1cbsea1X22GHy8IiHuyq71olOMYFK/QRbUAr4o95WKMfskO0XySjLPG0d5n7wI
	GG+zfkgsfeQc3sbs5JG5rQwn3guJ0Vj+XLbcKwiuMVppmIWTmrXTfTfkxP/U0WdEmiPlsEGM7FU
	UF8/GSWGMZzbP2PW1K+4TYYOxle2TatydT6pVnd5xrxBP5AeHl7YX6NS4WKXKoZytOwu0A5pJCS
	+T1LhZoiH1SSMMvdiusa09aB8XmVRsPBI9H9skATef6fzeZykUgHQZf6S0S40zE4zQScHYoYRSj
	Y9U8QzR6YtXM8rnYlSFYGcIVU2PRyGVnTY/I+t8ZwCYigsw+o1fbW4RhB/IPx527a6xHl3eA2oy
	6HxQMhLuBP6MYybPEOBlDcEviTYHbcbXcIS/crfZgoWvV/CcwIYniivsW+koTRvMC+qFoPfWTGS
	P87+XDVTJB3DxeOO6B6ctu5Kh9cnIT2mj7xlClRgIOgRA40e1/dxvujs1H3sM4JjcNwhORdDA5t
	DUBemfQDkD2MnYnpgE9T+0e8Wu8FkTG+v+gnqOgtbSRW5NqEQ/+KY=
X-Received: by 2002:a05:6820:1518:b0:70d:9be9:5351 with SMTP id 006d021491bc7-714f29c23camr97099eaf.36.1793299655746;
        Thu, 29 Oct 2026 11:47:35 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:24 -0600
Subject: [PATCH v5 3/8] dt-bindings: serial: snps-dw-apb-uart: add
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
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-3-53b433aebbf8@gmail.com>
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
In-Reply-To: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
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

