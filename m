Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736136;
	b=X3KPCheF1Yr9WJIvldLPmdSmEftISaAVWHexRPnL07I8WYFi81zl70slIu8mx1Nt87e1
	 BANnpUs7ODOpDz+uCpMTImcW/YYYyLYpISZfUM1cy5rrYPmcqyWX3Pu0dBuk8bLzDVV5I
	 sL4nCCEDHD+tHW2TUJiUsEjMRN+QN2vNaIkZhPtMjEzZ0T14GjsK9kfWMEKg5mit6XyKK
	 p+l2eLglNyO/m/9+JEq+qTM/n571tZtUUPyCrsZ1OQZXouMvxlWQyAJZn1XBWLFeVKBz5
	 t7hHKDB2/BNHiX9Hl3KWDI7F7Eo7r3Pt3WJ59M9ctxjGQp56WgMyzzO74RD59M1Kyyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Q52uD5mO5l7I73CKeFvIMYM58IICKJHs7MHknkb2HSk=;
	b=119thdqdL4QF0VZBAZZPLXNqKH7PpLBvGvPpnaL2f0mrdKnFMEVJiPP1Lmppv/4p+DN9
	 Gt7mR5Ukb3dvuD0qM00lV5dYO2eSXzj6nga80UEQ30CZ4PDaDd/cPhS3IEUuJTRGUYMFQ
	 D/emlVh7mbdHgsqlO8jaiOdfMWdGSxhe4FINGi4j2k/SkrCAHF7qnHr/ELm7Dk1X0L2Wc
	 q20tlpJl+kghyjPhGYSidFBeShskKVWxifmUg7ZeHBvjnSsEhw7Ht4g2bNDrfRgczoTVu
	 ljyzUO4hVqXSh99zlnwiGnP/AEzB9T3rrfdgM9fY1eG/iAvN0DpgSO5KlXZLYeHWacg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nI5xhvfq;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CEF606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4CEF606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nI5xhvfq
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67be7b9abc8so41893d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793736135; x=1794340935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q52uD5mO5l7I73CKeFvIMYM58IICKJHs7MHknkb2HSk=;
        b=nI5xhvfqJJqz/LKU3zu9PbzpzfQ5Va50DydxwoMOt8UGt+zI2aGOnKnPmhWE4PvpgO
         /jTWkeTivaXjLbzL4+7hJGs+vGgdNVRC4351EbuQnq6oPZrzzQ6uS3j9V5D3NV5yYtW+
         CbkFsNgBvcccolvTvLKds+5z5XXUJCRRXYGDya4kmX4KMrbgPKbUm8TMZ9rA8+Svw1QM
         8Bn8rVQdvK8VcVczpN9jw6uimilyL6otP697wUg+DpBEnweVU2NOlW3Iz4mYQrB4Q+0U
         dtuVH8TH8z+VORkTnLGEc0w0t/QwxZLluGu93dj4Ei1eDPPa2xF90n3EI5CGWdpgAHh6
         Vd7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736135; x=1794340935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q52uD5mO5l7I73CKeFvIMYM58IICKJHs7MHknkb2HSk=;
        b=ywRFToRZXn9Df5Cu0UpzFnAyj1Vkh50MZvTQp+uSQ6bhUVFmaAEClU//ZO3/vgOy7P
         6uwwa3nt6UyE2eYJDyLbvhewOlo9gXvN/bip9aBw6J/HY5qbxL9B6MaUeuL9MWpFdCsO
         gxgbsDOI01GVZgUjtJTmFRmoQhx+4WyOKWGQ7OUmJpnYoab00wZt42eOw3vpGqupIsem
         V1G13YdB44EXKL63fG93D3jfhmvSYHpEe/mtbR8RnDOrBWGTfvEp0lDLtvl3gI/3qTSG
         ts+EVDD+aijLDgUHouH0iuul6hG2tCdy5A7CLLrideNNfHbfROYTaA6MjThZioaP7cdP
         17Hg==
X-Forwarded-Encrypted: i=1; AKwUvBzDb0rULWzwtl+nD2m2B7jBN411B9/rTz31dPu6Du/oPahCWYn7/PSFxlW4kpxJOVM2/cCKqXNKqhFmdDY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DsmW2i4hNvHT+j3OCwWt8ZJ0ccxlRybSOfMQtBcHlAHM7gdtp
	OEGjm6Dmvy7mwRnytAeZD2rZ/naY2toJ0xzHfLcEDz71lffZZuR7AzP7
X-Gm-Gg: AYBFou1eMbcPTy8n+y/q1Rq8/S7xFHNPLYrGYOq5cqWRMkpggdGEb+BB5Dj8H8pKJvE
	2pua2Teva9osMHJAeBWga0LAU821nLOU6fJUvWCNj2a/FrwVRPLDW67D0k6DHWsUwKuFJ+01Ia2
	uEt4gf/1l0bIJ8unfp32P/C7I8Yo3KFHvftmJjuZpWyMHsqHHIlM51l0tHmc6cuq0J8otI/EYZX
	PttVO0XvhQE35M2ISuMjk5N0G89t9Ez1GdcO/Lb+XsUJt1DF1IHUc0d+xB3/Z2QFhDLjK/7CfdR
	4TLefUAOHax4s3/UEIckFHgh3P8IuOOjc3GNeSLmwk0ZJ9wMVITEYd+m4/HbfPE3+Px4I4p/H+w
	+edu7Tj4OvVsZVPg3s0kIzCQKo8g+u61RKLuEWkoDOv5mUFTn+dx6RTDmAlBfgc62AgzMulCuFB
	6mcQYO9T7ZoqIlPih62+d6+Mgqv8gnweXfJHpdEcYgb/KZhJc/tA+hVvIfC72Zfuc31B8qtwLEw
	kxmh7qQb+Jp94AtMvUV9cKZXz58ZDZpyw5V/chD3qxX1V8txSI8oyA8pFdLCIf0vY540FFoZlN+
	mhQJbL69Z0PD8J3LFAZm2SzwC9bC7IErXRE8eprai8XhiaG9sIcp
X-Received: by 2002:a05:690e:128b:b0:67b:d315:7770 with SMTP id 956f58d0204a3-67bd3157831mr3828276d50.27.1793736134436;
        Tue, 03 Nov 2026 12:02:14 -0800 (PST)
Received: from Abelha2665.autotrac.corp ([149.78.105.186])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee245f70sm92764d50.11.2026.11.03.12.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:02:13 -0800 (PST)
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
Subject: [PATCH v2 1/2] dt-bindings: usb: microchip,usb251xb: add battery-charging-enable property
Date: Tue,  3 Nov 2026 17:01:53 -0300
Message-ID: <20261103200154.125681-2-jhonwilker0112@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103200154.125681-1-jhonwilker0112@gmail.com>
References: <20261103185514.72144-1-jhonwilker0112@gmail.com>
 <20261103200154.125681-1-jhonwilker0112@gmail.com>
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

