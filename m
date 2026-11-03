Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732134;
	b=AdqboVlJueatsAGvxf64YdexZDbdruAKCWsQyak6G6ta7CFzuw8aiRAemAnSGXyew7UN
	 Xx1I9snteKc4Jyyc145D5x3uH5xGO9Czm4gijpuKjIh1WbYoIhh/R+X6JZ3S3tpesZeD3
	 NJyJwROvATiSLFthX9YXSHyORNWg2ZHDJXhyn652VleTUtbDstrsLm+80xLZ084mdGIkY
	 JRtOt55SEx9ugWmQwbwZWT2PZ5yVymYY/DA87H+W6l1z/HHC7+IJQ9Fmqn0HyxXbz+s2Q
	 j4iu3MS7wYjUhGTuWSkmo/p9MLH5GOu6jdN8jXTXhcqjZbLc10rB7cStlftzP32hpJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Q52uD5mO5l7I73CKeFvIMYM58IICKJHs7MHknkb2HSk=;
	b=hePOFjrAXTnim7EvXNnEjblpibRzT2yFj4/ZaIFbKj2SRv9qfOupvIwewYM/wFESiq0x
	 GD079dDqMcTFHFhDrDTDWte8NCEwp+AD+6UPgl8IxkROZX0ME9g2KnJZniQidVU1MEjeg
	 mYBjW8G8hjBEfUcMLeZpVNk2ybcL4A1vEawp769NjQDY4nhwJylowx1nAaQ1Xdcc3Q147
	 prn+uwFq1DvdZ68n6AYjKxTkoByoHPtzH6KbZT62MsMM3neF8fL3RaHzezd55UvYYbDf5
	 w2PPiAsQblArzaKe5E/VAJEQoFi/dT5Pzay7HA1uD6N4RA/gea8BE2HTPRgGXXgSfYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=syg6yrif;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71AC606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B71AC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=syg6yrif
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b0d126f631so44959787b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793732133; x=1794336933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q52uD5mO5l7I73CKeFvIMYM58IICKJHs7MHknkb2HSk=;
        b=syg6yrifhO5FTvdzlCEBvgnMjoFlztt1yUAw6S7eTwC9mV5HKfSS4MR8FKC4czBFHG
         6xs1rkdd7ydVYl+mog73EOkUDiSCMZK0ULtxNLHv+IyYqzDOfqq8v2C3fVtch9yQYiec
         VN9WXayjq5nFdA1VK5ngCZ0JjXCCusjw3SRrYmj+Z9ZZ4g1iYEhesbZ6QP29LpZlcpoO
         spx32SIImKCS9MgneH5mH3qGEBhlHKRHdh7RY+ujLpIzWYW8mLaPMEDcluMik4vY5lhi
         jJTy9H7PB2Dr6SsB/PwUyzigFVjRzhchE5jRD/STHi8T1Bahm69tZAJqtIq0vr/5+gVV
         FeJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793732133; x=1794336933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q52uD5mO5l7I73CKeFvIMYM58IICKJHs7MHknkb2HSk=;
        b=yNuNqsWiPd2by9dxG0veixQjfBJPSFgy14ILAbpMd2F4zGuRovBjTaZ3ezPf1trTd5
         +n4oCqy5y4dKNHAoN57eha3WMIfJygQhet2jCob8NfHLyRQshFIFMkzKaKtsYesnsvF1
         EoprAFlHtnZoSArlfx8DRALIV5zO+b1Nt3x1riWJpDJsW8wcKjy4GLNxEe5zXhVI2SvR
         COGWQWjKydABKq52od82ONqHpIu4dSKTHM6S9wNMWFmxbCFfuNGNfw7tMx2xErCZ30rJ
         gX3Fo+I4Ihjog8Fb2tXYpPWyewh9T4hxSrJDNxS7NH4Zv+f9pQ03ON/FMJIpihgJJV+f
         bK3A==
X-Forwarded-Encrypted: i=1; AKwUvByh7JpnLQjplMypeSSGOgUJ9DKfAMAB//1OvVIV1QuN2xAG+OTJndtbP6uhNP+2vebnsdi0JRpd31TIzh8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+s4NGw2P4asyQBDxBiz7ec7WcU/fG5z9CecRvNL8nczO6c/T5b
	QIEvT90n7IyRqe3Gw4dHArVIYqlrxgcuSTrfwbikspLh+e8FZuuHWP++
X-Gm-Gg: AYBFou0y7LbwUeRAWZkgyfKk5rO6FIuMEHTuX98IHM3BcIvPRdh4lZjccrpnfLZ8iw/
	ti4PIiTqNMQMbbn6kswfg6QmBD1kSZ77MRZsx14eUGip3cjdwjmRIlCQXFX3XaxlmyEvfXgjwoN
	SA+76Jm+NLTkw5Z8Lq7zhUn+thKCzePNbjmmVIAIdvxR/hIrZplYaoJjtpLNQmJjaAejEBrNoe0
	q4Wc+8tt7UjeorYBTts71X6RVpRdYvYUPXMPCijoVAgBxgbZ7ldym1F5Vm5P+LB5ACVX4ZO77uX
	z4SZT2z4wEbiqD6TjDnevfKhOun+zfoGkM3dfz+OY/m7q5gNjKWevv+MYdwehYY0kp3TVCvLxh4
	I5VJBHLtYM+V7nAAjQs5pqY935TPrBW+45Jktnf+nmJvCjbws5qc7FWg20D80O1xZhLUx184Zbs
	X58ByP62xezo2EGReSw/umPNQMeyXaCdr1KNXZubLDaZR/eIlg9/nPRWdZvyam/jdpvTphQmNxX
	p1vg69ftPjMG8c+NgYZZK1pbygb2aeiOop3p+c2KnswEcQaclRTR5esd1cERV+4CG0F4hyrtApe
	ZuVRAgOJdx9t/QCJu8JLgUUMLorLKKIBPumC7JExKjyK8eKMYXA=
X-Received: by 2002:a05:690c:68a:b0:8b0:aba3:a3e2 with SMTP id 00721157ae682-8b2b671ae36mr104605737b3.37.1793732132595;
        Tue, 03 Nov 2026 10:55:32 -0800 (PST)
Received: from Abelha2665.autotrac.corp ([149.78.105.186])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b30992b0aasm2880387b3.17.2026.11.03.10.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:55:32 -0800 (PST)
From: Jhon Wilker Rodrigues Aquino <jhonwilker0112@gmail.com>
To: Richard Leitner <richard.leitner@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>
Subject: [PATCH 1/2] dt-bindings: usb: microchip,usb251xb: add battery-charging-enable property
Date: Tue,  3 Nov 2026 15:55:13 -0300
Message-ID: <20261103185514.72144-2-jhonwilker0112@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103185514.72144-1-jhonwilker0112@gmail.com>
References: <20261103185514.72144-1-jhonwilker0112@gmail.com>
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

From: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>

Describe the battery-charging-enable property as a list of downstream ports in the USB251x device tree binding.

Add an example that enables charging on ports 1 and 2.

Signed-off-by: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>
---
 Documentation/devicetree/bindings/usb/usb251xb.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb251xb.yaml b/Documentation/devicetree/bindings/usb/usb251xb.yaml
index 0329a6aaaa928..0eb3035553c37 100644
--- a/Documentation/devicetree/bindings/usb/usb251xb.yaml
+++ b/Documentation/devicetree/bindings/usb/usb251xb.yaml
@@ -230,6 +230,12 @@ properties:
       Specifies the time it takes from the time the host initiates the
       power-on sequence to a port until the port has adequate power.
 
+  battery-charging-enable:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      Specifies the downstream ports which will have battery charging enabled.
+      Battery charging is disabled on all ports by default.
+
   swap-dx-lanes:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     description: |
@@ -264,6 +270,7 @@ examples:
         manufacturer = "Foo";
         product = "Foo-Bar";
         serial = "1234567890A";
+        battery-charging-enable = <1 2>;
         /* correct misplaced usb connectors on port 1,2 */
         swap-dx-lanes = <1 2>;
       };
-- 
2.43.0

