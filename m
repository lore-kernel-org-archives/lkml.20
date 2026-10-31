Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456389;
	b=W2DeBXNQ0/u4sBY5BbDihY3qe4cRKVUp84vuQwLuXk5k4s/6NCdg62Ln4IKvO8TCCa/t
	 5dHl4DsylVki3J9HvQc7uktSuoLNpLv/3s4hZ+5SSqJdYAHi1Qmc7RLmoa1Ku1Pg/x2Pr
	 Pksv7iJgR5dBXVHCXq4Vm5Wg2z1wkekb+eW0CSdqEUrGuwjPFkgdnI8rdxJv4q+dQ2wdA
	 ZMAGkCgfuMUabP3IFQaF9PRSMdjO+qyixRFunSEC6HP8hzAdwd/xFiCvq6yxVdFyywvrd
	 wjHX7y1A0ocEYwNJuCZ3bcrUKaLqRw5nFSNMFlnRRCDrbhUIQvzm6bwE/HKFK3CIS0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DumkLdRaEi2aL/d8oCdFXZcLeE1nyTM9K2F0kvbSfy4=;
	b=18LAwI/U0nv+J040SaEnAx6QSGY4HoOir6fPabHZEQ3cEljxNOdBk9bXjkbxoapv4l+/
	 LCCExjtdap8jEhmKFlkubOyvfwitrLkFIYAZXr88hGXqx7orzAZBq7kWv7iDgGsXED/aH
	 cOiQkUG2w2PUrd9ilLNEg0MEzxTCmppHqe9yoSBA+STiKepnTBJSqX4Sc0fWAHPW2iYcU
	 VNAXodLhZwbdCDCZnwSh6fDHrvUZa7JbjBPSQjoSC1wBXC0fMIbdJljP3FyI15R8manX/
	 JuZd0EPIi+Pg9nUYjvkUvI5uH78+4upOW5RFBMZSYxWspbxakkE4dhOrm0uMYH/WNkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DhioXdfr;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D595606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D595606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DhioXdfr
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so18158385e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793456387; x=1794061187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DumkLdRaEi2aL/d8oCdFXZcLeE1nyTM9K2F0kvbSfy4=;
        b=DhioXdfrgaJlZ22HTvGQPCeRUttiMsmL61Z+mzkS0AjXsZuhKzl0srNgL1jdlya6nD
         WwZOhxgk9Zl2+/au5urjac0KC+ppFbkcoSWXVgE3ToaxC2p2HLqtRLU3vREt9TI1BpFX
         fx4wGQimT6AOUgZkSD5XZsk2mtH+Fik5m+pe0C6e0htIBGnSgyQQxVjppnUyDVnARocG
         VUVgo0sE5dIFZxuIFTa4okxZMMeDfDl7pYVnIHtMaX4vnLo2ZdgDfM7olreZfn9yCX4R
         +fUm5JG/Yu3Ky9mrZBBJZtbf+b/ZZ9taexlyfhvq8+9SIBwfkNYHuL/RuiRCNGS/vD9o
         cYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456387; x=1794061187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DumkLdRaEi2aL/d8oCdFXZcLeE1nyTM9K2F0kvbSfy4=;
        b=RM2D2Q+AvkLfKGjJ2/o3YjgDn0r7K2sKXXYfccN1GefPwY+oTTZ07b6ThHhGSEsnJx
         YYrz+SaBjxpUGrfUewWjBhjfND9plDtkd0dVhr7gRmazwT83g2tLrtjtF2vzVw1JrdnQ
         teXvQo4CIjYaVphHZOmTI4PFtsDfFmT9pKy7bEeWkwEVdc/UOfSTEaCx3Ag2pM9tkKVk
         RSQBYU0arpe9Xr3poiU+kWNsOUflq6wji6v/AaTTQ1PycAw7cyOs3jdzUMsuVB52zzsH
         oiKaziwEjufum8o+1Ozw/941RVqCTwheFIYjp5YXREfZrq1Th7ivCelt5KJNhFgU8lzP
         T44Q==
X-Forwarded-Encrypted: i=1; AKwUvBxnSYpato1Owf1p7nMMfIe4idOWOlhS8XHFWxjwi5Rt1oi5J43Ru1XuD+nTr+9kTFsdPFD9c6Jrzijy6zA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmhf++gHN66Ng6A7FFIfpjK7XyYAuJM1QEgBIPqWkptq29BFYK
	cd1MuLd8CzVTJeid4iZn94+nDQPmxl26vr9PtCbQzFeWXpaThZE/bVc=
X-Gm-Gg: AYBFou1VIXr9TxDCug0FIx0uBJkzB1fdRb+c+sBp6ZJnTb3ftu8c4HABEOLkhz5I/9g
	UTdtFaVlWHZgYOxn5Wo1f3huf8MB/m7cawku4st+9vika4fPahPpd+p5Vu98FDuXXrLkrd5SoQB
	Sme8FWOg3gJUAEx/kLn/p+k7nXTPwnDdhm5fuookJIl+Zl+CQ35EUmYphkf1fD4kfTi5thblYif
	K9aMMR4G8OD/ceDI/oIHXd6Y8cTWVjMq9V83/JudZ6pz8z0DQo7nN9zS6VDWyH03i30W7CzeLdG
	IulzGsLEwN+YbqeH8Yt/jIfIXxh00rQby8yEYpLT4gVgvFWTnMoLg/P3M8bbeiAXBJlARH9HeEQ
	5NiMhOW4IN0dqVS4Vk98lfHbz9ey+iCkfsPk4gkQnNJbZdsKBxMUmdhX0fKBteRNF6b2zfKmfvH
	sWKkf1B9OBqWvrA1wESSTCPrT/SU+SEqQOmnPugOkItjr/dmQR+X0+q0aYq4oSDAMm70Gox0/Bw
	R4TEKlvZU2+QcX99fHe8fmo2+Kz7npVi/ojDszEdXcoeOCzIqz/5IcfBOQkrYmzdsEpv5MYTO97
	f1IFDCOHrkXdE7FzD1M=
X-Received: by 2002:a05:600c:e54a:20b0:4a2:b89:b02 with SMTP id 5b1f17b1804b1-4ac1c361ademr77200685e9.10.1793456387439;
        Sat, 31 Oct 2026 07:19:47 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04785sm209871275e9.4.2026.10.31.07.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 07:19:47 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: daniel.lezcano@kernel.org
Cc: rafael@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ansuelsmth@gmail.com,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH 1/2] dt-bindings: thermal: airoha: Allow sensor indices for EN7581
Date: Sat, 31 Oct 2026 16:19:11 +0200
Message-ID: <20261031141912.1664575-2-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261031141912.1664575-1-sochnev.v.74@gmail.com>
References: <20261031141912.1664575-1-sochnev.v.74@gmail.com>
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

Allow either the existing zero-cell form or a sensor index that
selects the main or CPU ADC.

Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
 .../devicetree/bindings/thermal/airoha,en7581-thermal.yaml  | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/airoha,en7581-thermal.yaml b/Documentation/devicetree/bindings/thermal/airoha,en7581-thermal.yaml
index ca0242ef03788..e7be20d1bd1ce 100644
--- a/Documentation/devicetree/bindings/thermal/airoha,en7581-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/airoha,en7581-thermal.yaml
@@ -24,7 +24,11 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
 
   '#thermal-sensor-cells':
-    const: 0
+    description: >
+      With one cell, the phandle argument selects ADC 0 (main) or 1 (CPU).
+      Zero cells remain valid for existing device trees. Only the main ADC
+      has a hardware trip interrupt; CPU ADC zones with trips need polling.
+    enum: [0, 1]
 
 required:
   - compatible
-- 
2.55.0

