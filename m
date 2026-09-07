Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4184E66DE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787598; cv=none; b=gCR/64bpauQ3CBevb0cA6RQqLzIS2jtVVUHxrcOnNQu6uXbi2P/3pftzTC89jEna0KsjEcM+Cc846Wg0ymaKqaM2ladYNjF8WEX526XqBt1Ny+cgn/3IUDHpMK+raBIBjzRqGhn2AzzuOlprZz7JsByintUzM7DveledZep1zQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787598; c=relaxed/simple;
	bh=1fyQQQPzmxyCPUj7mMErj8lT7aXLJp7Cxl4JDzDEaTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fej1tJTotUQVtbdlm54nHhvuBdPyXRAi2/vO/9pTwIZ5og2omUC7RrXRmAlOFmLZJRODd2SuplT6Ohn3f/E+f19ql9I+Egc1oHMnFccFZn/eqnZtQU8brz9ChLvl8yxaQhEEvUo7sq0kALk20+JMSINYMb/clPiXLi8HAAyTSsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=uZMmhbEw; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="uZMmhbEw"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c255c58156bso687287766b.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1788787591; x=1789392391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NzXqym/+h9eePTEnyy8uEsFGr3+cylfN0o74nGuJQqc=;
        b=uZMmhbEwV1CFzeujc6w+O+fbRQYBrY+pDgJv9T2d8OKYdOvhxJYuW+yiFrHpGAhp2Z
         A9Xl0vdYn5vI5uaoChi6J+0P8G+D8QDnwjrm+RYrQTeIekKxtgjjT2zGeipi9mmen0Zd
         MXTidfSpsoqncNcGSChKM/2Fno6cHl00Av5MwP86vN24+UXPzd8YKH2qVUah0BjaaDYh
         JF/KMJ+Wnr2Z1eXtEJKHYslo0Cjk2aZ3X85X4Y2T7DCGWIoZFczZW4t+6UCXzma7rufA
         Gc222iR3xd0c1dJxTFuRIV0Au5Me628ClxkFFWf4LxBZ/czoqZYhltyujWjWuKjdp64D
         UqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787591; x=1789392391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NzXqym/+h9eePTEnyy8uEsFGr3+cylfN0o74nGuJQqc=;
        b=IIgpF0U3Tjhhri5O74LuGIoaixcjplZWWk/yQpVgeCllbMCS0qleYVs3uTdu2iebKT
         AR6iAxk2+XFKvuQ9JzRjT1+xjVExS6xcqa8rOk84D0Q74Ew56GcVbDb5FHEVBChtgpqW
         zBR++l0LYqK2RwZbctfDNqSk+asWXIrkr9r36/aldMjMpF82jeFTv39NfKqaqSU1LFNq
         pSr+EEI5gUcyL5bmJ5izDsCb1z+hROxa0JF0lR/0TVV8lP7hI8hjjAPdOHUofTGSnwzQ
         meOjsK3ii0OJfx+rDBWSE60Sj1cWKSSV3qK2F2H0xwPp8gNUa9KzsfVoMxSYTfS6GQUe
         Sf7Q==
X-Forwarded-Encrypted: i=1; AKwUvByTxkDiyco9tC55v+n1sz5rBXFkRMehc/pnq6QBtaOzEYoWIzkILmOu4c1I4ZQQ0QJhXRvklHvir5bnsd8=@vger.kernel.org
X-Gm-Message-State: AFuF++n2OlGcPsaYiVyvt8QLb0nviM2e/GKYl56yRnrwrI8K8zBBRToT
	Fqt/ZTLz7XEgufd6HrcUfALI8teNGimQ/mrDvYAo2z1tmcioPuQN+vjMZQn5fl4o2qs=
X-Gm-Gg: AYBFou3P/VCCx9fwcuTXzI9YA8OyJdn8TeCRpN8Rs3oDfsxTdZ3u93WzxTIEKeLHhxX
	z1QWnJQJuUr9O/jFevr/uYHnzQXEudJZZmsjEo3Hy0JavYe/AplgNBBYC/jp/7bDVQ3H/WJzlSn
	NwCe67SRbNhBDDL4KsmOfFzCg+gsTcNCR8IL60mCpjbJWdW2iQzJyroB0VQA0FflXqFt6tQNh6/
	jj0Ubmex6dB/Rq0loW7Zij81UvZkwOPFnt3D5OehYKVqgrM/H7J0Op660DQVaqWe2NWHmRBjNYQ
	+EapzwyygIm/tnmjtqJg6WXWapuVHUrwXayYKOITQ0JzXhGj5HQmiQmIU4MMMxWG4zOeKxDoBHj
	Q3LF4B8TQ9zQaZ4dMdc2VC+F/VU5lY2rmKc8Ft2LzaCehGZZDbdVb/AWlNWSQStKIer4f/gMx+s
	6W2GS5M5pc5mduxbf1A6J/kCWEgLTsUARPV8lrjrwlzIpJcGZX4XlEoY/KBJu+nFatTlMkEP04Q
	tQNHR6YwWHbUNUQQqYula/1gL+eQVQMkqMmm+oPdsmCQZMij4YXH11ZhpSOk8dcx7rjb2KL+K18
	1rKYb1HXI37HpHvvU4hCSp0zRVWMe0C0XiZTCw==
X-Received: by 2002:a17:907:3f2a:b0:c28:fb3f:fe20 with SMTP id a640c23a62f3a-c28fb400053mr139347066b.30.1788787590853;
        Mon, 07 Sep 2026 06:26:30 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-94-253-164-142.zg.cable.xnet.hr. [94.253.164.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2622a7c677sm366362766b.9.2026.09.07.06.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:26:30 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: ulfh@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	adrian.hunter@intel.com,
	aubin.constans@microchip.com,
	ehristev@kernel.org,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/6] dt-bindings: mmc: atmel,sama5d2-sdhci: add LAN969x compatible
Date: Mon,  7 Sep 2026 15:25:29 +0200
Message-ID: <20260907132617.1198548-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907132617.1198548-1-robert.marko@sartura.hr>
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SDHCI controller in the LAN969x family uses the same register layout
as the SAM9X60 implementation. Add the microchip,lan9691-sdhci compatible
with microchip,sam9x60-sdhci as its fallback.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v2:
* Clarify the relationship between the LAN969x and SAM9X60 controllers.
* Add Conor Dooley's Acked-by.

 Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml b/Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml
index ba75623b7778..af1c66a1f882 100644
--- a/Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml
@@ -21,6 +21,7 @@ properties:
           - microchip,sam9x60-sdhci
       - items:
           - enum:
+              - microchip,lan9691-sdhci
               - microchip,sam9x7-sdhci
               - microchip,sama7d65-sdhci
               - microchip,sama7g5-sdhci
-- 
2.55.0
