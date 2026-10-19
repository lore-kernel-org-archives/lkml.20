Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792435551;
	b=BjxniwWZ7YxGoheShxVBpIrZkfq53z2ODLWr58uCJYhEnaE2KJx+ea4Mn1KQyGC1Jbxe
	 BAvewHjIUbRFfL7YIzIaNNoWiSDA0e0RBrIT47vHljDOzgQ0sUSfFS2HEYAu49e8T9fDH
	 rTEWIYKLYzUr1g8GhcFFNMo6D9Z1c+b1AFEbIHT1qEPyNkzZo0ggTXZNchpb/j7h3towU
	 p8bKcAuRIg2ty4kBjhEqcb8kfSB7/WEFtkHF+6XcmHapuK12X2YdiQpMQT9jYRCAvNIat
	 oRngG932qZUBkIKYNmCsOKrHXRXOnAXOnXo/b2JIjlaNzvkawDMhJAvMdxkEW4nvf6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792435551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+5EOVY9DUNw8s72Nx7os6foE09oFwHGfwPgDFCi+jYM=;
	b=qVdW4wRhQ92U2yUrWxFoZZc0AGHbRnFMiT+RgWMFEFxqQaFyYE4GS9h2fHDJo08+oA+A
	 QBvU//qLk2Q7O/R8PnObSzrw8rLVzc9UXY8LLTw5prLqBZw7E+nbB/KSWhoIps/8i73Dz
	 yMxCoRtqFLu6QsQE5iO9jylgBJ2LnMLy911rVUieBlWiGoUHtSikuX+0VBGcAN9FUlbNL
	 OwQLSgkEDRrdcnl3btBA88TicKxt9TL7v/auksDQyPfD0CC2zWGqTMg3G9B/02Gr2ukYB
	 PeKeRuky6+fHf5NvFK6J31Q5/69hfm3fIZJZoGplQW1N/WapII5vgG3adqIWNq4vEMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=CROF+cxV;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DEE606A327
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73DEE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=CROF+cxV
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-18cdcfc05ffso899673c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792435545; x=1793040345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5EOVY9DUNw8s72Nx7os6foE09oFwHGfwPgDFCi+jYM=;
        b=CROF+cxVEiQyCpnV1Ol+NzHGgnxT88R0BFkUrod3jp1qyJ7/I/GHJIX1pjnufC3RC/
         ME4OtYwxOG2Z+oFmXjUkYoN5GAvf+zrekJVQKECUa1xfnKibOZYk31oflHTnbBYwIutp
         5/fq+mxjPPz6IQNFabdq9vjeD9W09bc/k+5+nljvtz0d6+0KrvrAjh87LydLiL8SxTyg
         9VcuD61HvEFIV9gZb0dmRGPXYSoRZHpXlJ14rarNUTq/REoCvjFzaPbxhxPKgmWxrdgt
         GiFzOHkr6uMOwHjIgXPq4MHaYFYw+Wnpmxczlv360BFsjRlnxG4mp5M4g1J7Ueamh8mn
         3nYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792435545; x=1793040345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5EOVY9DUNw8s72Nx7os6foE09oFwHGfwPgDFCi+jYM=;
        b=XEPjgcm1oAj7EoMTz/Jq0B5DghinWtgogD7eB6/CeRN7O+DSXSGM4r/PXOkYvqh2AG
         3b2acOIlEqhq0bMGEHhTT6iJVJd4RkPUKilCFSfbjXCcPlfBel/jxvsVmU+vtpmqwkAj
         wLJJ6klacWhbcRjhxIuExqXzfYOAxRUBi2EvWPgT8ABK6dEtWXrNMWXKCVzHOdPVVlbI
         Uebbmth8ndSDemAur9XLRfXd8xBcvCOY9p4hODpHzqgbJ5Bv0okQhmMAgknAJcqOEjzP
         sbb4Qx1uKLW2Et5aqmNZboGEZXLx1Oy6DlvNbDqtSIkof/LAOUOmX7rJPKlPtd8etmCO
         VNTg==
X-Forwarded-Encrypted: i=1; AKwUvBzXkDtq7TWPRVw4PxhJIDk1P1q/DQJRVHM6TvxWCCFz107MMs4WibGXf1D/lgJml3BTcT6ZNboykAYiMSw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzWoL39MtDhAOHFgtDW2OBYnRVaS+1YMjf0WsWDjYKzEYrbI3C
	T0CK3XdH8Zhm96dKPmSPzPldJ2UrfMawPvtuzf5m0QXgy3qIsX9EVPGIrmgxafNv0WY=
X-Gm-Gg: AYBFou1ZuXrNdJyEB776lfhJtT+1xL0hglCN1fbbDdi6aN6rp3ghjVGzkd1lqgtYcim
	GhusZDcU2CIIV8BySxDqnGTJa9znYw+/UTLwM8bqOASMqytaIVvyhw5JVziriWh0d6wMd8Nq24y
	S9AP2WvzR1UegQ2ZzqNTjMU9/UdEEt9S9NF8W8ydKEqNHE3AkHIvYQeuxPVW9wQxprT0qhHUh9q
	t2eN9BzYU6PF2UlrD1sFX5T/z9vXKhGm2vsQP2Ej1ehAKApbXqwB0X+Bb50e7FzvDRUj/6Ys4X3
	g+MEZA0sITJZzHLgwWBujQUZ+8xT/5aqo/gRUlfQLsvhLyVPcgUjH2tQ7BhLgeGjfn1g74k0aWq
	41ssv0UGU1i7Pt19wDBrXclbeJhMvrvZygJFzgMdu5XCxpYfLIH3K8L5LKtqz2EoS5eNv+A90TK
	7OhZ0hkCKcOgDhGITsFaFmwq1vilrJA9UgiUutdqdwXrMvMitlqWojVYs+HJRVTlAjdyE5bBznU
	Lo=
X-Received: by 2002:a05:701b:4183:10b0:14f:4b01:40a1 with SMTP id a92af1059eb24-18507fca393mr12939427c88.0.1792435545495;
        Mon, 19 Oct 2026 11:45:45 -0700 (PDT)
Received: from [127.0.1.1] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm29907576c88.21.2026.10.19.11.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:45:45 -0700 (PDT)
From: Kevin Jia <kjia@nexthop.ai>
Date: Mon, 19 Oct 2026 18:45:15 +0000
Subject: [PATCH 2/3] dt-bindings: trivial-devices: Add TDK FS160x and
 FS1006
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
Message-Id: <20261019-fs1603-v1-2-8adf972386c1@nexthop.ai>
References: <20261019-fs1603-v1-0-8adf972386c1@nexthop.ai>
In-Reply-To: <20261019-fs1603-v1-0-8adf972386c1@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Kevin Jia <kjia@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792435541; l=1668;
 i=kjia@nexthop.ai; s=20261016; h=from:subject:message-id;
 bh=vv7jc6T42fhaJkWqiEeKPohXQukidcy6joILhcZ0eqE=;
 b=HII5ZHZ2cEzr6ZQ/XjUeiKk53W1QW46O2/OsGyl1EYsF4RSfn6+1k5/9ZFqIGdPzQ9eBYU7Gg
 TTkqnYQGH9vAuwL2Di/mC8zwqZG7d0WgXEHuyclQQ3UGjf6wx+ysP8A
X-Developer-Key: i=kjia@nexthop.ai; a=ed25519;
 pk=TcHV4RjX7qo9R0iryPJ/gWzq3O9yq1SUw0VO2QXQ3Zs=

Add the TDK FS1603, FS1604, FS1606 and FS1006 uPOL converters. The
FS1606-0600 and FS1606-2500 presets scale telemetry differently, so they
get their own compatibles.

Signed-off-by: Kevin Jia <kjia@nexthop.ai>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 42527c7ee9c8..73bc8c130802 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -466,6 +466,20 @@ properties:
           - synaptics,synaptics_i2c
             # Ambient Light Sensor with SMBUS/Two Wire Serial Interface
           - taos,tsl2550
+            # TDK FS1006-3300 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1006-3300
+            # TDK FS1006-5000 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1006-5000
+            # TDK FS1603 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1603
+            # TDK FS1604 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1604
+            # TDK FS1606 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1606
+            # TDK FS1606-0600 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1606-0600
+            # TDK FS1606-2500 uPOL DC-DC converter with integrated inductor
+          - tdk,fs1606-2500
             # Digital PWM System Controller PMBus
           - ti,cd9200
             # Digital PWM System Controller PMBus

-- 
2.43.0

