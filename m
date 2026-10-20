Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792533938;
	b=C0RFcK+BZtCqt/bZUPjFjZXvO6+PYQy2l2MjDYlyVB+ENXik9myWqIB+YGRiGcguM7OV
	 3w2TlR5ufbRiPzojInbIQQs+VOzpHJH6tGk9Om3xkLtC+As12FGLB3hYk1QkYuWZ9dSGl
	 ea8asmpLz79tVa3oaPSHqR2t5WUJfMBFH4UarZFvyAKveLXt2qo/Xw0bPMnAXwG93OuIV
	 vMBy2Jk8xVk7cnw/T2Amy6rLI/p/oLQ8DwJobQA/lbVNL8qIFH4GHbAad139oSXG2x/2+
	 Y7WLZAmoIREcCiuzHuMujU3Kxfvfqfp7RnyUSQ1DsrPmT8t2Zs9R4dZSuHUMqA/og7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
	b=uPsRXTjJH3+yv7LjN5AhHP+aZ7ejWzgSJVnWMtwItJs1aFIQSD0aejEZUBJ2XLsY9EYm
	 3RtVmL7Rq2li3SUMxt+l9H4A7YEVqL6JIR9ec5y7GLwYUScZpV9298HeVDpRau5d+jhrX
	 +k8GSeqD7oJZ35W98SIx+JE4PWLy7swAPSMsr7eE6yNHZQCZ8nf6lwNSmsHq86Ux6987L
	 75vKH/JNUuN3bISPFwrz6ZXX1fgZ5lGgnd5PCLeydgB3D4Js7RpT26CUVJKVBHcMt4eWg
	 bceBEKAAMMTYuL0wKZbjZxdzCBbMIAK2t3XX4PY8lZ4CtLLuFyE04Rb3zVwZL+TrreA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=NPwPE6Kx;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF38606A324
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEF38606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=NPwPE6Kx
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so96825eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792533937; x=1793138737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
        b=NPwPE6Kxyq+m2RXE4/kcOP4buIj/UN5TdSWBw5siUz9I/NaQ9dlqu3Bgx21vt59bhX
         Sl1uKFljcjeQQga7TzMiwfqXKp2tfzS3wdhICW/obgjIpT5MKynYNds8CO4qh8AbskB6
         onT9l3QVU45cAokS3e4XW2M6IBD+GagxwoS+jK/zWeR1AqJRLFSmh9WGAU/N8ETqWsYs
         orZeZLJRUYEfHTifC8DoZ1fmjriQMrmmYy5PLMj5gg5eqChkHPYzpND4/Zfonz7U//x1
         E5D7cijLfTPrSx+8HhMiegzt9BO1NEsr4i3GyMJtJvSsZqN/FuPWyo6jtKwhVahrHoj9
         00MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792533937; x=1793138737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
        b=L46/u9CHk6W6Wc1EFqk6FP0cKZUY7cuet4jIq/JAtlRisa6vAk20jQq7VL3N1MOJ4o
         ttWX+oQ1ZOYA7a1ZG1zdfSgG20puRo4OuC3u+bPfUqZyKtTNte9GeJUAVIzeDxlygooT
         kcRmksXbgE5bC/G9tdFwz1TFQTXPzDJUnQdinqNDdRUsYE8c04ApCfkJFel/76j3alfJ
         QuM3HJK/gVxDVXQXb+XX+s2tni32bwqIaSyMoVqbwplIp+QVr6n48J/Jc6yWYHZ0j7pp
         bQe1BKKuHld8wQvLGmRQeHM3mtDHOf6emXO6OzmiCRQrNmRLYlyhI01f/THCGZ/YkIPu
         g57w==
X-Forwarded-Encrypted: i=1; AKwUvByme6uTwVmNM4QPp0tKPJUV1SpKwKNJAbwN8MsO4HGSu65fPLy6ksRwZC1JHKpVN/K8XeWMRj6CcdwFN+8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJp5kssKWYN0nnQD+wXYs44AEwaZEgA1dQ9oIXww8W0dE1f93OT
	ffu4M/G+NchpVzoY0xWMarCdZxIIyj5bQgsDg4Yz7ihwyzRG/x54L2bJepwNtgkJ+88=
X-Gm-Gg: AYBFou0LrYSWWWqd6aIdb1y52gxZ11F63d6muuxCr0qSN0X+VVfJaaSgDglSGNtNfDg
	XQRAbl4jwjTh0TdwRFD4gx0kS/j2ozG5NNHSSzlyZ4EGi0jNajy4lwabRIbsGeGTOK88ZhB8IVG
	fpyAkmpHWfdWYr+iqOicgcR+3AWNp6Lpe+jMCiMRnh2nJKgjTkEiQoZxcBStgbrdtulYfsYRjd8
	+am/0pltHOXLk95OKtIWcGOQeC9UPuUrlKeT6zO6f3nBK4KfIDv3Liry9u/F4Bdx1sUcjZhpbE5
	s6h3K5TBaEJPhoQS2V+S5suAmMdqdJzCi0mJSVcZ5FLcKsgjVeyJ/4uIAtpvN0Yr6rG9GFoqKSB
	wUN+D/DKvyIFy6g6xEbd579/hRCRmsxwbBDUQTHVyrThIbRFappK6Rh3eosgMWW/GGChLWU63P1
	VLupRTZfgqdb/C/vHtXyLV1uAnCFZnGOrxGPIia9QPkNQMwG+UF+cKCOMV1aOTsWdJwVruYnURX
	A==
X-Received: by 2002:a05:693c:810f:b0:341:5da1:7851 with SMTP id 5a478bee46e88-3674c63d98bmr751792eec.12.1792533936541;
        Tue, 20 Oct 2026 15:05:36 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1d8sm1917021eec.24.2026.10.20.15.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:05:36 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 20 Oct 2026 15:05:29 -0700
Subject: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add TDK Corporation
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
Message-Id: <20261020-hwmon-pmbus-fs1412-v3-1-51df629e13d7@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v3-0-51df629e13d7@nexthop.ai>
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v3-0-51df629e13d7@nexthop.ai>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792533934; l=969;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=lNuNT+gSUpQSUsDkNUaVAjvOE/3h1o85CLNGkLI/j7o=;
 b=l2kS2EcpDnhnFD/N9cvWATlaQCr1yLIqhT8XqoBCuqatXxny12JqA7U9ERy/zmBY7cxBSMgn6
 q+2S73CAQJlDD4h9tItzALF/JEuO3Td0tO+SCm/f1Zx6WEq6nxZotYC
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

