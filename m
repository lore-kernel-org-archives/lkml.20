Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482237;
	b=DyosGiWLOFMD9OWn17DyVvEhARBIm839c3hxc3tdvg+lXvTsSFnN7Z7RUaHOpJVgTTiK
	 rURgn7YgLG+IWSeo/ybSbK0TTw+y+DQbpulUcSZM6XxJjgJa5je0fFcXTlwklZDD6Piyv
	 bzITXqNNu33S6+DraRFMF6PDkgoX9/I3NmZ0qoBuljYLJODmIfBfS7LwlGlFKj07s8a4e
	 GnGxkGpvuiIJxuTgz2Nvfg2I+TcC9hGA1uVYPQZJvzCyyK2uj2xW2ppFP+3DfulrO2TYB
	 cLM+ytmC/KbVT8I6GPK+vI9icYBJKAXx7ZlA1bP5qlZXjRcew1q+wJxL4hA5GLdtdew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
	b=2N3lZKmlKO5Arf00gzKa8fxGmKHu2q2H615qzxadhKksYVFkKFDl0Lm8ZrcPJYer0+QS
	 Aw4izODlzFRD70JjbGpK4tITbAwhE9WMs8L0Mbn9aQD2hhfCySECIu4c3gcgbyGGefUP3
	 kQvjyfjII22BAX91bX7EZGQZeH1TPp0UjPaTL20igxEcMFv5G74PFbjNYqkHp6jA2DNU3
	 fEx+OZPsYq/lYPKJbFNw3ZmC+p3uH927GD2PSKvF9Ya1cRXgDnVEnwvbKVxPgn4pcjK1N
	 fzSq6hQtCoLa3SAdh2o7RqcziDEiOJEjTcgAL8zvvjdHrbLtP0HQEceh0T2KoZKgqfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=GDn9T631;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B19B606A329
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B19B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=GDn9T631
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35c76e9614aso5524347eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792482224; x=1793087024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
        b=GDn9T631t40lyH1UVbWyfrqO2wY53BDnmdzrehZQ2IJwW6Log2x1p1Bcxo13teXjZe
         S2wsXRftK/azjVLiiVcWlX+aqXAo/U/7DvDfEBj5nLg1jsOxzLmuVHGiWLAglDgo5Nvn
         dl4CbxxzT5t4SxM4WB514iz4fde1by60lK0x7F4gmG0uYoz0aZHQz7eeWP2AOIDM972z
         J/++zzNo8p6AwQRgg6xkmfbAEgf/nkyand6KmdTmPY9H/ONy5pii/tir0nWGz/B64xiG
         7lCFPR1Kcx3KzO1angnGq2Bu/rD2zCxW9qeQOeLXCJwkP8vwuyXK6MjlBNdsx9i+FUGk
         mS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482224; x=1793087024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
        b=YLpymAl/BP4odhqGQ8Mo6TJqnLD2KNrEiapZwDEz5M150lBxGFZsLlJw2zfFi34MqV
         75RUgUSPUKLiHWP/8yOW9zF0br0RAhd36XiKBz0/tbf9ccT1rNQlSbIowaez7w9gjWMA
         Q0FhQRv84tSKOG5lm/fapMRJF0Ijh5quPn5oT5/TaSW8+itjOuGrarJ/WuqgR/hjXAgC
         uR8LxmUJKsWSPrpX9n+BA50nVAIJMolP5YfnB5BPgqStTjSL7cG6O0QrVd0b8QFN8wvH
         74mvnhr8E7S9R9vkJL8HyY0uTWY+wCSm3e5jEbfgSBIi7R4H5l/vE3jxK6A4g+VfhlP/
         /2Zw==
X-Forwarded-Encrypted: i=1; AKwUvBz0oeotFR61HNgxtrIByEG6vsJq+qsJ14j6gBgAhl/nlS4s4RXmnYpRUCtPZZioSidMvQck34Wc/RFjCJo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJq4xrpuBsVOsSRpMWlXjZKc8Ayf56CfqG+1+3ML8mx+0vR9Zmn
	GR3A1G4+VI6NExlmkCJ8Ha43ml2WemcnAoDV9VHWfOnQNd9LlHoDOHQSx4YY88ImV/U=
X-Gm-Gg: AYBFou0tgwVP+i/19QFzIomxwdFLoThwXXrF0NDZF4nYfXJndiyH0/S/FaR+87TAfOD
	upWCY8cPmLTOL8n3+gJSJ05YXzh76M5CrCsg594YjJeV9rMOO++knXo0dahOLyr0JwiEokUy5uI
	3N5mF+C/CCQCDYkMxfGf4dgh4FoJWjyQUPqOUM2n4Q1wDdf6yrKaCMRlrp1aaOjKEkNPFgnEhJn
	PmCi+StBnA+jOwkxpIYw/X2IA/VEN1R71tSalU7B+Pn6xhezfMUw9sK2yelwg1tHDXQQeYZRmam
	2bPDtZ9hT2B2bzIuIVWDpomYuEwH4kAc20E1XLW+FBkOiOgCeeCQM8jxU2TIrS1xDwLAdRKxArh
	1MTWpBQboNL5dVIJlGQvDVhcFdMEo6DX8uMdlO4D4gZBve8N8fkdOJxizspLgR/u9QwyGaOBrnG
	CCxcrubrqmZi6FM7NJ4h5btipsZq92yEStZIO8StzNBLFCKAxyUyIVzpqbtxUz+plExrT0mq4H5
	A==
X-Received: by 2002:a05:7301:fd82:b0:35e:7bfd:4613 with SMTP id 5a478bee46e88-361a302ab1dmr13910871eec.40.1792482223591;
        Tue, 20 Oct 2026 00:43:43 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36083283478sm37010238eec.29.2026.10.20.00.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:43:43 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 20 Oct 2026 00:43:38 -0700
Subject: [PATCH v2 2/4] dt-bindings: trivial-devices: Add TDK FS1412 and
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
Message-Id: <20261020-hwmon-pmbus-fs1412-v2-2-3396c3a08251@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792482219; l=1094;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=TihSnAyU+oM6Z6xKPg8XulncCvOA3Lsm7O7YZANDhAs=;
 b=mp7sRHtCF878AE0rEF4+2BUgFCTEPTTF+jqzbW5O5Fcke5i00ovvP/Y7ZA7M9N0i9MNyG4mPk
 xxLm7V6x2itAYD2v5b+PsbOVOFtGTCznbSP8qYSxGqZRZoJ/NEX7OLK
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

