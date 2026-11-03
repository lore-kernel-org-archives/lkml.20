Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696347;
	b=KbBv5wU1a6xwtrEfw9Fb98cPcPkRHopxhC6F4QNpMtuYHkD4Yo22iCEPDw911kJ3EYs1
	 1I/sUf4KTKV9dK5ha54nIsfTSchcwAlRvEAnYtPqrd6jsIIsj42sktg7ide91wsEaKoN5
	 xNVUW1GXdsR/YCDDxZXLHdammgHIPkdb3/XuLmUaTWIpRzUyTiz36lOqPjhEzVbF3xxDf
	 NKgIwVHaqUKdcgTvsivOPfksacaPKcR3L8/3OWIyhVmtoHKjXDQGVrXNOlFCX8kstJWvg
	 HZ3vf0cgoXuhyXSx26P+QNeNAvzYTJgkWmDDNulDkDZm5CyM6BB4LG5KtK0odwGDZdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XdWSx5jEVXu7O1L25NHaAg46eSzRTcB1Jp91d+n101c=;
	b=zRYZPwGG2wGESXeDavw6Y21vA3Uug2ahPanndzfJXeiLCnnpqwAOTrmBOCvd2cWl8BGY
	 v+4SekWY4ruL5XHaNuGNeYT/ZOIkcHavlfBDz4FngLOJX3oPF0993UORvjcjvG1zUKkir
	 0fHDoteAgqqNMLH9W6eLgk0Cm5tyHlfKg4EcOvPnfLp3cbJN6HDkMZFNmq4ymyTN/RuvM
	 gNQ/RjIc0rRSbykZ86eqUVlVF7O8zaKHINfFXvUN3RXCZCPIfotQ9SJC7fcgPGj2aeQCy
	 99BmB0rHi2eNYlty5pDP6GoIpHmrpmrW0nZHjfflLnViKbQuQL94ewa/1fun+3aezEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LIuF6/hp";
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EA8606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42EA8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LIuF6/hp
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ae1a9e187aso602726a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793696346; x=1794301146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XdWSx5jEVXu7O1L25NHaAg46eSzRTcB1Jp91d+n101c=;
        b=LIuF6/hpv1AgtjFXjp2ShrntXPKcsD88kx0s6e7fdlnL8ABV7PiYqBep30VMoMSMLd
         Z32mVdVeN5AiZHNtTv8LGxnzxyov50oTRROB4Y2AstoEEd72TutJlCfLJSxSeuhj09GH
         kgN4n+OfsHu4f9W1l8Ww+8yYYqWsXdiDWtrXgj4nKb/f7KXO3jg3xEbKCZorhmJq+zCZ
         EBZkSKVVyRgHBonsQPlpYT9sJ4kwlKDWBnXoLiha5WzA0RhfUV7Q7YE4Tri6pJOosH3+
         UHfHrK03cPQliS+K2xbkqR5SIuofSZLwSbm413A3siMLaz/ShIL+rs6MWfP0OiYoSQC5
         3JsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696346; x=1794301146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XdWSx5jEVXu7O1L25NHaAg46eSzRTcB1Jp91d+n101c=;
        b=kH09akN8kR+571F/vNjwSiJE5q3QD7El6dvPq4bRwhPWmbvojeDHxsqppJYkhxXC6f
         KkaDO3pNGKYmwy++q0+tsRJ6k3LXJmqeYanADK75l1cGi7M1XsHa2cd9i7Ht33X69H+B
         3NZS83YLVRUxezGJHNDivDtWXMWWOpcmrnzmiUthHqFojS+fFlZI+h6nz1DzXPgENPtF
         tXDagUU+CVbhOcGua0Yd0/+Twoz6/o8N+aTVD1cU+FO4s7hNtLhrn7Ts8Kizc4xkakf7
         +olmNdH1J+Qw0owbo/03WBYdHju+IRkTrJS6U8FRfnt8jU6NnhkBEUyKPNr1ExdmPsKd
         m8Tw==
X-Forwarded-Encrypted: i=1; AKwUvBwJNPqY7snZzej7xmLfNKrB5+5+YZu+74w9RDxYzca1N0dYdS76/MzAEbhkk6NMbWntIK0bJzRyBv2pQnk=@vger.kernel.org
X-Gm-Message-State: APuU4Z92bAYWwBE3f+cNgVNPXXKvAYIKFPW8gX0Vxvx8EqXqt+u62iuE
	4Rf0CKY9Qli0LO0rqq1RB0K9ov7A5Cc3PWkZtjE/y69vZMhInuz8Tpko
X-Gm-Gg: AYBFou1dYcVhcgRu7iBp1W3EIXtllEoGlZzY7wpVP7E6T1xUF5NRYlfy984R4bVdLR6
	FPVqWaa80eahQ4cu3u1RlkI8voI68FAeLAkP9rr/gNCwHkGDRED80I/SHljQIvy28GR903sC4vh
	OzDaumcmAMa1v+587pCxINBdBh/T6yi+AtDRV/Ba59gWG7iGCD8uQk9QDQoGRSqooTaWBtZm+d6
	rX4/YlwNxukOWt5eMVBd0aONHvujqhLzvxwvRl+b3FcUAeCXBNTChi4kQi17dHVT1CeQj+4Kfk9
	vY3VEf7QzVALn+5bgKL+Eg/JD0Kp+an1mJ3QjRfnSw5eG7LiVpwCazgks+ESBjqEN4pYPMUWWrI
	gSSTvHu9pXEU5Jx8XT1eZhkqeWYzYkn5J+SuVZIwWvgk9aLw4LlQIa1MTzYJTpju/l6XXETZ2dI
	0hC6qwTAhR0achdzyKX5XogbwWX02yvSvXmwXPQrZ0H/1QY5b+fCOkWPVj3+Xkbjke/djCX2M3o
	b3nE0Vz9R6F27N7DJub60HXZVcKKdEq3OW0cUt0Yfluw0YbenOLODg19KaL4Gi4qYporJu/FcAH
	/EzGYT6bLMGRPSYqq/Av9LyhejkhOnlaIYULq1AY/vP7S1+7KGpDnLOoyqskAih7BlWkA8M9pcF
	XpUKgiikq+0XP
X-Received: by 2002:a17:90b:4487:b0:3ac:9c37:9422 with SMTP id 98e67ed59e1d1-3ae89626108mr17481897a91.2.1793696345686;
        Tue, 03 Nov 2026 00:59:05 -0800 (PST)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6740a1sm3345662a91.10.2026.11.03.00.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:59:04 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Chen Wang <chen.wang@linux.dev>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Hiago De Franco <hfranco@baylibre.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 1/3] dt-bindings: phy: sophgo,cv1800b-usb2-phy: Add USB role switch properties
Date: Tue,  3 Nov 2026 16:58:45 +0800
Message-ID: <20261103085847.338613-2-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103085847.338613-1-chenyou910331@gmail.com>
References: <20261103085847.338613-1-chenyou910331@gmail.com>
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

The USB role on CV18XX/SG200X is selected by the ID override in the top
syscon, which belongs to this PHY, so the PHY is what provides the role
switch.

Allow usb-role-switch and role-switch-default-mode on the PHY node. The
default mode only has a meaning when the role switch is present.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../bindings/phy/sophgo,cv1800b-usb2-phy.yaml         | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml
index 2ff8f85d0282..a1d164686b07 100644
--- a/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml
@@ -34,6 +34,15 @@ properties:
   resets:
     maxItems: 1
 
+  usb-role-switch:
+    $ref: /schemas/usb/usb-drd.yaml#/properties/usb-role-switch
+
+  role-switch-default-mode:
+    $ref: /schemas/usb/usb-drd.yaml#/properties/role-switch-default-mode
+
+dependencies:
+  role-switch-default-mode: [ usb-role-switch ]
+
 required:
   - compatible
   - "#phy-cells"
@@ -51,4 +60,6 @@ examples:
       clocks = <&clk 93>, <&clk 94>, <&clk 95>;
       clock-names = "app", "stb", "lpm";
       resets = <&rst 58>;
+      usb-role-switch;
+      role-switch-default-mode = "peripheral";
     };
-- 
2.43.0

