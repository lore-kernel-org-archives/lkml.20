Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792818994;
	b=GLLrTzdrvN0yvcnluyf0L1gce4hEoVZ+od4o3zCoKt7Xggub8/9UsTIzNRkpBjc7XkfZ
	 xX9YAaUw83wA3BiYAYjYe3dMma2ozqcbT8jo8kX+DlORezuXVhI8SHqTHwHc0NlYmqgqj
	 bcojDQk4vrd8aIBA/p0//hsN1TriAPf0s13hJu65KJSEmnpl4pKjGKctd8aCZlKHuAl1P
	 EWPzOObkFJ6NaYyrj784QzkhQB8354CWVym7aAUWawWRXXuZP6N0y48Sf07vSaF1TB4qi
	 aHUiJEoZKWw+UhSyeFD8ciRW8oFtehS7srEK0oro0eek+l7Z9vDJTXdxpM5mnXmtoiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792818994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9+/gnD5T4Kmt2Ygw6Q5XDsq45pHCg8xCx1/EjyDNaxE=;
	b=qZkIbBi8BVRJZ166nFkOfck5HKvpT828INdHYjeJ25nCqF/4l0GRo4w9RYHjub6p0ZIT
	 cMSnLCUwYToYH7ekkf8Lxcp22PjxOqfQktN1eMyGDJ/70YkjzC/mnnLMzHntLdQo58rKo
	 T2F8FM2GLxKYeeIj+T4uIviWUbi6kFaCnVM4z/7zbcGnKrjsX85/zd234st8UxHMT2Jvc
	 SO4fGtFSTaV2OxQlDbkiiGk7A835Gfdn7HTvkuq2Usf+tPoKKRVV8uvbSO8+9iBvZiBHk
	 6agr9/2tKL++jKz/09A6skddZFTc/TCsDrCNTvKJHdJv3w4SNCVMY0T23i31k1WA3jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Zpb9xE3h;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C534D606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C534D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Zpb9xE3h
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso14723275e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792818992; x=1793423792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9+/gnD5T4Kmt2Ygw6Q5XDsq45pHCg8xCx1/EjyDNaxE=;
        b=Zpb9xE3hXNHuQ91xzOw8KF/MyOVXXGXvlmMaJHXkCFR1YRFO12S5FFNknzg2rWNz2F
         OGL2FEA1Cw7SZkQTMtjqF/a/5OwBTMC2E9ejXgl5qmRvp3+TTbHK2IXKr+789NaBnPvz
         Gu9YEza4izl6a/89OK9iTLn7/Jg0yOCl3+yMTgv77b2OgtcorSjGO5f5qoP2KoUOovMf
         72HP+M7hGdqorY3fLEseqhH8pJKpjR5bYkCwmabJPAOPalSZr7mguhggUdJPmUj+X5uM
         cr9PmgGydfXqgWymBYKn4+PhNd75n4uJF2U9X+VBwjdhQAKYg6B2Fu3ccq9FKaNmNzgH
         T1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792818992; x=1793423792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9+/gnD5T4Kmt2Ygw6Q5XDsq45pHCg8xCx1/EjyDNaxE=;
        b=ecI919/NUC+WPmsvrjj3UJ7Ki+IguguIoBPinlib7OXL1/IGbFlYy2nLhTIGhveVEX
         76RglvcPBb+oTw3vkh7+IoHBzPMm7CF3scbfTTosEfXaIEtIBDHKHmLwuAKCATDShMp0
         NuSrHun7d/iEjo1BMOBK3crlMc6utZsQ7Baiy+33+zryFB2e/gfVl5CZ4QRTGaDHcvsf
         ubldSBo6JEKbai2GRcvtvMicGozT4r9Oj4ZICH2fUNUCagz2lVvouulFlkZPkYT+F77s
         RO3gxOCKNF7Jss2LDSBdBQBZ9ms27tEqhSB4npq/bcxCjC9VwZXMliCJJTAgIMT1Si83
         z4zQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/fUo8d3NJ+EkVQHF77yUuyF4nPgDBp8KvFLoMlRcYEUhczy9XNfsRSP7TEtAcDKCJmjsU4qZwlnDKBEI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjHHLyLgFOQ36OwIwZ8B2eIzhF4rBh9PLYfp6RGRIv8UFFOBsc
	zmVIG0y/BJ8xBdskU3kOmkF6l2pFPmIu4FSOf5cN1PZ5d30kFLOWHAz5S4i5NRTZ2DC2MicKi4c
	GcRQNl5w=
X-Gm-Gg: AYBFou3B3VXIyeDJI6IRVcn31RbnwlHUnNeyacmeIZQ4sv2Qcy2JmFt6WiEozIsDvcK
	FGqF6+VTVKYwexRyJ/wN/cz+B9QSibBfdnkn2Cj3OawKXv8m/N6O/s79RfnW+vwfkqsX/oPkkNK
	9cbciYP4oSKZD4ABAv5xPEdanUqlRaaHLuk5NAXYAZDCvneMUT7T2oVMMUdch7e9rrByzBf8cOf
	85+Fr8i6EB3HHIUWMuYDLG/cn+sjE9OGa9g9YuX6eX0nItCnjdVjEYjg44hoDpx9cJGUQykQKDC
	Vn+fR+DRnjk6qI4fqXfLlrW0/UhP3uEl7Deae6Au6UmGnLzhzZm3tRfj0DtoOPrYGaEsj2y2wMd
	ixifTjQdekGOT8bRv4gTBoRIWFGC17tuJrctz/wzZspNxc0Gjn/btxdWX0n4eqBCyh0y0FqvQzL
	oY8S2UmTFEC4JCaGh8FLQ3YvbukCqL9IzlFH0VxjVPtGcE5WLiOOAj+bx1aPpTzoVPuxfyth5B+
	Ezj+ZhoTsGc84WHxGH4DH42tFn0YKlHcFw08xHPh3K7ufVQsC+Qe4atv0gvqUYh4ggAqob0+Zpw
	Z/v/omqdm+0=
X-Received: by 2002:a05:600c:a104:b0:4a3:5c67:55ed with SMTP id 5b1f17b1804b1-4a35c675a4bmr4907615e9.12.1792818992114;
        Fri, 23 Oct 2026 22:16:32 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a55e9aasm27604415e9.5.2026.10.23.22.16.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 22:16:31 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH 1/2] dt-bindings: serial: ingenic: Add the X1600
Date: Sat, 24 Oct 2026 07:15:14 +0200
Message-ID: <20261024051515.55639-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

The X1600's UARTs have the X1000's registers as far as the 8250 core
uses them, but the driver has to tell them apart to set their bit clock
count. Add ingenic,x1600-uart, with the X1000's as fallback.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 Documentation/devicetree/bindings/serial/ingenic,uart.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/ingenic,uart.yaml b/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
index d5f153bdeb0d..635342d43ddb 100644
--- a/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
@@ -32,6 +32,9 @@ properties:
       - items:
           - const: ingenic,jz4725b-uart
           - const: ingenic,jz4740-uart
+      - items:
+          - const: ingenic,x1600-uart
+          - const: ingenic,x1000-uart
       - items:
           - const: ingenic,jz4755-uart
           - const: ingenic,jz4750-uart

base-commit: 1184f87e2790e8af9be3116f608d2e86b4792d7d
-- 
2.39.5

