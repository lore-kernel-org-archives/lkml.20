Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551736;
	b=yMiAISfbHcEalq9ENEN6Zt9CdZAgd4XGtW0WYUwvL3dA85JXz1qaXYMFHh2Nh/kT+u/Q
	 d2HqOJ6FzXZBC+a9CGD4WoQzu9Hczva3s9VKZnyk0rDcV9YKJnRs0xCHN3SPYWZShWoET
	 4nNBeV8h0mCXYJ+6b/w1eiPa6nUoD8eozMSONissZMbAoLbjFYBma0KJIsHb1bYOMiDAr
	 zbMYkCC+f8fx2NjneuslfzYR/tDSDN5aijtpuCcMzSmXxh8DGa/M9mMKf147VKJPJYgQf
	 ku4smAnuRaXv4sahJGP9ptWA0Bdr8ljwoqhljIK4i1EeTJBx+hJsSU0UMrC4Ewe4zaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
	b=bsdctey2UdsfRGgmxPeNYM4l59eTxMpLAodDDToTAVmxF4ROtJQwmwdMfxHlWaz7y3a+
	 HIImUwWNq5w2+TQ4TqhwT3UEugRqgOZclkEBLQkrkDCMxnvTl1jl2BLg3gVE8AFF3c+D5
	 MtgRCw9QzPnOpsSdsd0pncAtxMN0u6fD3qj2+Z7f4Mf8XaoSdasbFTOnZG5wpiIs9P9bT
	 Z9FjYxX+XQlz1CiI9BYPrnL2ChG7Cf3YvSPARzRnkNQoIMElS4h+kjwcbtE9hFT2hZ8sl
	 2+lgEIS8slCZEpNUGAAgd8/KwoRN8Tvpb8EjQeAsphj/tQauxAiZj5gi2f13Y1vg+RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=RHMhcUl5;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D07D606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D07D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=RHMhcUl5
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35b2c599f43so482732eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792551735; x=1793156535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
        b=RHMhcUl5A8hr72VA9IgonSsmVtWMrKoTFnFZ+J38+axHl/9ITRjuKat2kfGWHF/k40
         KBujvkCkEEUgzBl7n3DXq93bOySak2VyYPPCpqKqVpLTWzLNGs8vSu42sbK7JMZayCr0
         ac4Xj77hBf/iJG79oYuVe/hg761P4Oi8+e+cmCN9ukux96V/SL44Q1PP8o9uZzj1KK/x
         8uYsS0zWZ/FNB0spnCPeb5017Y2BiGlQrmVyBWjWjyg113zvYD1yAwGJ/SLE16bAAnpy
         o0YkhldtMFxWvmvXEQCkc9SCK7YmyUrNV6hgsdkdvhfHDAqIKOGquuze0HV2iWs/z18B
         VxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792551735; x=1793156535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
        b=cs3mVTSkqh10hJ6vDZ/To3uqazTYx1HTNGlzNOQNXPL1aggFEjH5mvbIvRuBMLZi0V
         kRGJwrxDNHcAJ7jvYLtJiFyaLKMCjYq0UPJsohP3XmmZil0qeFT8bKrB+DIpe583KD4D
         FsE0j/xeU+LsCgFMWzmFCMNkEja1pyqYDZEazxQIR8N+fhX2k17jzhEL4paLDE2SYD5o
         +7gjmMdkc4laRc6+g06ATqLiy24H65QLDmY0h5W4W4x1P22eNot4vnfXSTYkdxJG7KY6
         4Ip9CId/aO2kvQWsOCrzzIvE4LqplzaLTikXD5St4vsvhkwGaBW+FJwbE3i3H7rJmCi/
         OT9g==
X-Forwarded-Encrypted: i=1; AKwUvBwBpK2pQrHbeechW+5mtoaObLwiIG/ovEYAT1yCBbSpHoNyzNDqLMLgA3hFAP6/GGCwgbpA/YsG4nAUlB0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVHiMchEr7cVhdHP+SK9PHDPiDVylaCIBTUxnuidU41EIidMJe
	22j4Fn9nJPiuozt+jn1jgjs+Ydy2eMjE2qfF82DQM5jfnFZW6zAEelpnYTU8Tatve7s=
X-Gm-Gg: AYBFou2eShQFxwFZfrJAQ1HKH/yKKgh7Wpbt5ypV64h0z8soBgF1ZoAIS0ZzK4LR3U9
	EhHeD0YrsH5b6b0EErJvidK4tnzQzNubMTknL6TPgduCua3tSqo4EAQwi/rPgvXXi/vLBGkQLnv
	yiJqf/H4Nzm7LgeiV5Ac0cLVnA0lQXl8DRlduEigOhtqodrCtkxQgu8A7jHhalK8CIzIwlAzmRg
	qcGgXM+iXjVVekn/BerlTTlDpF1PXpIweeyOtCv36xy/h9gmebPFiP72doHAoOJaYn/7qeGW8bg
	WLVm1XfgLZJZmubGk7o21au5KxcEBN2crvCl/u7Wy/8Eowj4F2C1Ga5frfPG0S0kxBHTSVz7sj7
	J5TcC2PQyMtEAiMowMWp6uxC8ngGaiX1jPdmUJ6ui21oAFwNy7aU4/4aozVq5KCC4ugsCOMqjnK
	O4eEWX+ns4xa3zQuQ+AZ+JnQ8nUNpvj5CQYK6vjzmhgOfGENPuk6zkN2goiNceE9fjKJl7MV9sh
	g3Eaaz5W6UHeACHEH+NIbJ5WhhWrTltYHBhRT+UeWCRudlVLny103FBZr4=
X-Received: by 2002:a05:7301:860a:b0:366:6ada:a052 with SMTP id 5a478bee46e88-3674d84d319mr1455767eec.8.1792551733311;
        Tue, 20 Oct 2026 20:02:13 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e15353csm4436294eec.2.2026.10.20.20.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 20:02:12 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 20 Oct 2026 20:02:06 -0700
Subject: [PATCH v4 2/4] dt-bindings: trivial-devices: Add TDK FS1412 and
 FS1525
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
Message-Id: <20261020-hwmon-pmbus-fs1412-v4-2-27ece4e43d04@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792551729; l=1094;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=TihSnAyU+oM6Z6xKPg8XulncCvOA3Lsm7O7YZANDhAs=;
 b=ZR+1jUcctG0ML9NJYbjTUXiZ8OahgDHMRTQAoKHG93om+tIlU/j0W9gBsUuED/bEbOC9JNX7F
 VW+Hbti7lLVDZsu/l9Qg2XhvBk8KokV79WhdB/IsNbYhtchl42/JUIF
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The TDK FS1412 and FS1525 are 12A and 25A uPOL regulators with a PMBus
interface. They need only a reg property, so document them as trivial
devices.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 2de8eb09cb7d..996e1eab52bb 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -469,6 +469,10 @@ properties:
           - synaptics,synaptics_i2c
             # Ambient Light Sensor with SMBUS/Two Wire Serial Interface
           - taos,tsl2550
+            # TDK FS1412 12A uPOL regulator with PMBus
+          - tdk,fs1412
+            # TDK FS1525 25A uPOL regulator with PMBus
+          - tdk,fs1525
             # Digital PWM System Controller PMBus
           - ti,cd9200
             # Digital PWM System Controller PMBus

-- 
2.54.0

