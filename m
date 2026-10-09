Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190572E7635
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 00:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791507374; cv=none; b=GjaYy3DpegBz9s36uQ3EBFr+94GKzXVjt3ijxL4xdzY8tUp5u6UgAWUsjpD6oGiV9GD2xe8lorHXgqtV5TjPbPoQDSs4yid7nIn41uoq4TNY5eYOq1+SnPS1AROUVOTTBfthxhEUdqxXqS9Vv6gawaPo7uoqExuSi6zkCzHOKE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791507374; c=relaxed/simple;
	bh=3dS5bZTVOT7DSHDRVN8MKXXtvwU8qyib2hA3utIdjME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RLyEctqRr5WRwIfOfRds0H0jtXaxpZ9nKSUMwLrHA5Sogl52GLleR6noZ/vGiCOtXeWymhI+k5eVlwLz4JCKGvzU3KzwmA2/RCrbq74f+oabsG+4oEIHE81ky0GWQdPGI2fqmKlKbXmgfcVshtgWub9k1jT5BRR1A79zH1iTwDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Mppaamx1; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Mppaamx1"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33fb4680717so2729172eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 17:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1791507368; x=1792112168; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T8PlKZWA7ABkYR4Ifs3ujznF9xvsTKqdGNGAzO86F2w=;
        b=Mppaamx1MF1+rCGnnt0y03i85TmVgqZew6U1RC7kwN4yqalSPlVzHVk4BoTqZ6HLg8
         M4oaYapYQNAglozi37t65tZtUUiLmP39Jc2e3ho99KxVw9TabzOK8LClF8Oow9Cy14nr
         tWUEPSiOPa6UaDQnMz9+Jm2Qhk38+h/2hAIWFDv/9sYgxq0uwOMLk2QQ8RUjBD1rC/8p
         xbVsTp6fLwIHF2s7Rdg2FRyFfVSt1ieK78z0BPid0qcIaPWlQwwbvAC33JCyz+30O8RP
         wQsy8PWEbD+2x/HS20squP0EMEXzzlOsALUhrgMsOyZXUwC5QucSg/Rv7QecWL/gGIJL
         zhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791507368; x=1792112168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T8PlKZWA7ABkYR4Ifs3ujznF9xvsTKqdGNGAzO86F2w=;
        b=JWqGaQZt02cvc5KmhmVy4AMSYxJgxvGQhgsZ2x7lrnRMIaoBTa9+B077LseRyDHsWH
         qof3OCJpw2rWNsLA0A8vyn6W9MFNJWL9onims6vkUQP8Jy9WwNFCq+OwGKfRULPubqAc
         B+CN7GvlSOJNnb1o+rAMS128dFG9TIW004bLcgln9EzQ6LXM6TvJO5uS+3KPan8zshrP
         /9HcUchJH5dXri3ZC10AQz1SU2dajQ4Dz0gvi2mfKnZZIW86PSe8wXkYVtP5QrVU/EZb
         P2VDaj3UdLXOFbC0pN/5XdQ+EFZJHSynqF90v+3onAx/KhDzTCkmdcyLmUiRcbod1K5B
         fMHg==
X-Forwarded-Encrypted: i=1; AKwUvBwHm7NQHMRyQxSf17w92hj1xIv4lGunUnn+F0SPMksggVfX0qXp6t2YSRsFgFvksfsYRL5BI3Xx0bNcsxQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBqdJiCe83rU1L+5WbWBLyRpCULQc9B4WZLv0D2o4l/B/wcdKM
	f0KNARZxXWJkglJonXz54+L+b5L9uY08lanqTVYBi7e969zYczccBP+oP9dGy5QTspU=
X-Gm-Gg: AYBFou3AyGir9W4OxP/tZGYKrsDbRo8/dEMA9LRBvIorgZ8VTiYCzSaoB2UTt4ZZaAO
	lo0CNuILXrRadJrCSiNlX2mlDgoFizrFgaUYBd/kXyR9+q8BUNDTM6XTfZybdQkBMx5p/40opEt
	rAPsckGAKGZkuqAzw1NRiosJmG1Ib5e329hksNfOFUcSNVcc+7WP/GamETXXLkyED3z+NDFxrV+
	7OQJbpLLWTXn0Tkm1/Z2FEB2mQkwtZ+dAMMb8IYBdm6iRu9UOZzrWqGKahDOGkA5ce5s3SfIQ4I
	ROtY7p2i5GiiETC+/btUNghHPvX+2A/i9EkZxcZEN84cltjmoTqt0RrmO+F3VEtXji43CXZbWfr
	z4VpxX6VHCrHwYQd30YD8se8NqmVxqqD445ZCz/XO1OjvUh5G12dECsCB5V+pBDoBmI4/78nVq2
	YCsdSkFXz2rC5T8UQ9MK/gZmqXWew9F0KLFVYeW1Ae+UKYNY94nVwqttS+wWV6e6Pb8kOaLVeZo
	g==
X-Received: by 2002:a05:7300:b905:b0:353:7e33:665a with SMTP id 5a478bee46e88-3537e3368b8mr878553eec.37.1791507368107;
        Thu, 08 Oct 2026 17:56:08 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb61asm1760205eec.21.2026.10.08.17.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 17:56:07 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Thu, 08 Oct 2026 17:56:03 -0700
Subject: [PATCH 2/3] dt-bindings: trivial-devices: Add TDK FS1412
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-hwmon-pmbus-fs1412-v1-2-0ae7e5ee4e41@nexthop.ai>
References: <20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai>
In-Reply-To: <20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791507365; l=987;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=3dS5bZTVOT7DSHDRVN8MKXXtvwU8qyib2hA3utIdjME=;
 b=vzUnvSUv3IoTSrnibtT+Ynn8TjePYTpUjU6Onw2MLiS5CNXbQqXQmR8VDQfcG+iwtB0heUIfO
 3b3ce8E/f3qD0eboKIKiUVS81szS0bkKWWglyR5jP7cfLrdVc5JSccw
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The TDK FS1412 is a 12A uPOL regulator with a PMBus interface. It needs
only a reg property, so document it as a trivial device.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 2de8eb09cb7d..d2dfde1344e5 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -469,6 +469,8 @@ properties:
           - synaptics,synaptics_i2c
             # Ambient Light Sensor with SMBUS/Two Wire Serial Interface
           - taos,tsl2550
+            # TDK FS1412 12A uPOL regulator with PMBus
+          - tdk,fs1412
             # Digital PWM System Controller PMBus
           - ti,cd9200
             # Digital PWM System Controller PMBus

-- 
2.54.0

