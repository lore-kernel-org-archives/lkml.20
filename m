Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482223;
	b=Gmth6Ay9vIL1gj5818UYxK36UZE4NAG42cydCaq1HZ5iL4O+ufGrgrnyL5huVLJ2OUbs
	 wK26Ob2ggdwr5F3QqyRD2hdyfO+U+0fG719L/qK4Y4U7Y2IVbD45mS9PUS6cYt9BYD1Wb
	 owbyMAnVEw0g5EZwtfMOrLD2F2BqByVF3AaM/YMrMUkSzV6xaGDMjrNVOXbSLnXhKaOR4
	 llGo5/g4xzF4SUv8P2poOzhMgG0c2fsbJah0eTQEyItqQt+YE7S9wnzMunjtlLnx0+06W
	 9/7ZWU5rvi6oVdn5QsQZEaGr0XIE5/UI6w3aQf7u7uVmrx0a1WN0/OK8axXQWcl9SRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
	b=GIbiLEwvVIntKwa3JYNTPYd75R33q3gjwQDv8LZGoGdsC8zPu+9oLF9PDaM8JVDyLhqe
	 0GIa6aq0msnxJVwrkIo5fQ52N0p8vWY3hnNvXCxbZz/IdVG6bdkmFx6jm5q2zWMLoHZGw
	 eccD7tDIztP+H/xnHgj3Pf+SeKFfw18aNQy3SoX9YbcoHAtupChVh1QTjxm9qnRSBqZXr
	 82qaKEfa/BOtZHbtdeNdzq7qWYORnPg/175ugMcsyOmuEKsVFmDrMlzmGpQXMwplndiXH
	 kdrQAs0zuKRLYa9rcNvJZa+/UvVdaWTr8QwWN1F2PjhdgA/k9bjT6gOBSGc/WGjVvgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=jcz2VWjk;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52017606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52017606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=jcz2VWjk
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35c76e9614aso5524311eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792482222; x=1793087022; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
        b=jcz2VWjkuRfgXbBhx/KKl5w3vkhEDoiY+Wlol1+XvK0xP+awL4v9Q10OcBvf4rFcl4
         mO/gUbwhDOwJgHa3+CTRFamicC8LDSXg83G8H2GKq93UyarAqRuppkGft3Muf8i/cpEz
         8cIbYEJLL6oweIwHxr+I1CSZS62dOD8k8EJNS1Rg6GMdNsxGAC4/4U1/46f6YsuHoBFZ
         IUy7jtA/n60fl3/GARvQ8sikZqHc5EvHkGrcUHxWUP0ZRCjEgWxnqBUw8TXkzNuGd5JP
         u/YzV0jowInNgDG43z2AzzZ1Jm0upj4IGqA8LugeJuUe+edGwWHoVzfB57k1XHwcIGzm
         YlzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482222; x=1793087022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
        b=ya9v4GxVAoWpaVCn6zKMcl1LTQmJyEqTS1vIDDbQG8fsZCjyraLqPAXi/fyAoYWHKh
         aqwCE87sQ5kw4O0OH7KqierfcQBMX3VbjRR8jLqor8f4DlIYGrsD5EJYNYQDUo6UQa9J
         w+pvHQNHezGsBHZQWYI/M+mvXcJ5NT/4O5cGam6Wm/hlYypu//VHBBDRB7SCr9PptEV7
         1ma/npdV25B1IghkiXoPi76ICNrVkfToWZ94lNLFlcRRXxfO70N32n8N2WP7rvoSy346
         u+su8t5lTFPZLFkBUPoLbnw3u9XCU3PU0ODj5ZpRF4pYHjJLb3+Yu9uQcNwJOBiy2Ucx
         cRsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzK6F006bTMrscR7vCkd9wQB8Pi1ClQpePClPUIwk8MUHnRz3n6b4rAWHa/FamRz/56Q9yBiawOGlCQgqY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyUa5Ck6OxMmBTz9r8AU8ZLouIXZyb7+eivLUru2lndUDj7C6y
	PhiU1awB8IA4loyl6oQka1MdaEbV+UHyVOWOB8/ed+JVDVwUPt7ZM0kp52dZWUgVyWc=
X-Gm-Gg: AYBFou3WEoOe0sMHK6S1E6bIrOgA+h7jhmN2CbUzQeCDcE7GoFgm/aiCpL6IHSfaBfK
	fWYeYnqbnZn2Cl8pKw3RIV5PqvyO8nYr/PFQiAcSpxtDyUR1mG7rzTVLqKSiG+5J1O55TdClo13
	A0tp369OOnCAdYBMGotekBDElobJQqEbfDFyijaFuVs5xtnwMriiFft9Kz0NbfwlKy3vTTLg9G2
	Io3H+Jr6An9ouD7HOrwyWBf5l5+JyzgAo3rwtq+Cb9FjTSBqGz1iycJXquwLHrUQMlaNGj3HjnZ
	louf3rz6Kx0eJCxnprtGYxsbA3ITSDCuW958pZXspqz+i05dU6MubkGX1PJLfQRCJ9igsUM+QXc
	Ht7B14rtnb7n4hdEZVWCHgG1eVf2JGdFG6aSHG8bHcdNKMSUtwSSe8BcMyJ8NvYc8hk5CpkPQk8
	JiZsNrCq2lT3gO/9HI2okCqDptLWJ7PS4rTDHbHtTyiAxUuDAHanFI0t8dMn8we/TpFxn5xv9VT
	A==
X-Received: by 2002:a05:7300:7aa4:b0:35e:43fa:eea3 with SMTP id 5a478bee46e88-361a137072dmr14671485eec.8.1792482222408;
        Tue, 20 Oct 2026 00:43:42 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36083283478sm37010238eec.29.2026.10.20.00.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:43:41 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 20 Oct 2026 00:43:37 -0700
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add TDK Corporation
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
Message-Id: <20261020-hwmon-pmbus-fs1412-v2-1-3396c3a08251@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792482219; l=969;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=lNuNT+gSUpQSUsDkNUaVAjvOE/3h1o85CLNGkLI/j7o=;
 b=Gc8fMRC2VdUO2eazAV2eIUKk/69CqdZf3MnaUZXQVl+m50iPHpTIDDuZqOY9uzqOQHCX4/rxi
 Yd1BAvbA5N2ApiBCaavG6v3/71xIelOS9dkW1XSGs9FjolgOS1/HLic
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Add the vendor prefix for TDK Corporation, the maker of the FS1412
point-of-load regulator.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..a7c484d1113b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1680,6 +1680,8 @@ patternProperties:
     description: Shenzhen City Tang Cheng Technology Co., Ltd.
   "^tcu,.*":
     description: TC Unterhaltungselektronik AG
+  "^tdk,.*":
+    description: TDK Corporation
   "^tdo,.*":
     description: Shangai Top Display Optoelectronics Co., Ltd
   "^team-source-display,.*":

-- 
2.54.0

