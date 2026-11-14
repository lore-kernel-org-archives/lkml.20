Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794681807;
	b=O+pUXCnXqa61YTP2RjPHG6Vjnmpbs7fvVBrS+t5DSgHyWnUwNlGgMQqp1BGEWUylH1OJ
	 AnsyXLqm8ky+kvyJgzWvmXvo2F4YKi1iQuMDPbJGA1lVPwJf+FIaL/HxRgpBaVwG9hFeR
	 z1xFscUFAhNme6hxqZouCX7+F47W0C8fn9HqV+9M9L3H5Fcte8ZDeIYsvucNub9GOYYj2
	 6lP3GtPCS90iqDGtM3/miHjudr4LA52obKBhw3d15U7pCn/gYdwevvBdq71mCDAv8oM43
	 dqVOBAAJFNwo34ne4HQ1vmQPNRiEnh/UpJmXaYzF44CxrSgXlQrQ19TBqxm//ruAQuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794681807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5TfgGwSvpWd3UKEyFfVSx8qLB6KqQDyrVVkNkIiwI9k=;
	b=RsBNTrUwISwTLkok4JJT4gz87ZYUOQsCokMokkF4WCPbcikvjIXa4WFDQI+s1+iMn1KR
	 nuU8/6QvhkvhMzel2Ix+VfZjCQW30PsE3iO+2m6GbuNwTwdK2OVJ1HzIenHz4ByrTWuPg
	 vUWlDot43fjfnWNNs3jxhBmiuXH52wICBPztMpQnv0P0l7TBmU61JG8QBlQmpN9O4H3ro
	 oa1rZuPY478OQ6R1ZjWyTym84w3EsWeq79RQExEc0OGE+4HsutoVEtJh2rajam2/i/qLy
	 JD80NwVJ/Va4hx5wjPeaXZekE1/xZpQoquA+PBIkM1B9VtEfQtsXuEGN4SFFKrgOT6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M2GHqvF7;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358E9606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 358E9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M2GHqvF7
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e987a2ba0cso11524545ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794681806; x=1795286606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5TfgGwSvpWd3UKEyFfVSx8qLB6KqQDyrVVkNkIiwI9k=;
        b=M2GHqvF724wS0kGiBHtx8IMO9pTfsh87vMMtqrh0TRHh53vXAGtSa6FsoFW83dLeV2
         un9/GzDNYTMNeNa9ffERXaSfmRfXOo/Un4ca0Rgqo4MQep/6R5F3PxNbkc/BfTXC1eJ1
         72BJBfR8k51ReNpQmJ+Ht24l+iVo3gyF/YKDRl5C6vKWLKOiLfzOdCQa+5a9QOlFlSEB
         rzSeQIUV/ZsOp7QU+s9e+fcHGxJmr5LjP8oW6/JimEV2zwWVHU2nV/sDyutx+szaqZyK
         QVxygWK/FbebtiJYQYDwQuEpkXJT+Uf3tqGkTYhBN8Apz0GwgbFqdVZKVE6RAQttshvi
         RWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794681806; x=1795286606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5TfgGwSvpWd3UKEyFfVSx8qLB6KqQDyrVVkNkIiwI9k=;
        b=Wmv6mrHXN5m9CWYkKJ9XsmTUbE2v+fJjPS4pKbV5ewbFjjlY51+bYaFSfKqY1M5qqP
         Cqx0rUf0tdc9vG+P7ln6XGzAD6Ql9/sELTba8S6lYyjRFyCgOim7surPrOpMwY3rIsRH
         df7IMg3y/87/tTg8fzXABcme4EMTusRRuOUln7GyBKBv3nZuQWZxQlTpS7JZVsfKRLYg
         IJtxg09sGy+urvheJv+KMqqZqvIcgHSFOMkl7SYMrFoR8Fc7Cv5mJeTLJaglwob/HnfM
         0wALBNcxF5DPeZYCLu3pIA7x1wjgq/LRuHZTwthweDuhVvTCIYW/EyquV1JlRNZo0TAy
         lXMQ==
X-Forwarded-Encrypted: i=1; AL+hErFDqs3btMKUmuXz/MyS2ji6vTob6TPtcW0in3Y+topTEG4+YwYPKE8ycVegKmX60C/HK9SIvqHaEKUTKOQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bupWp+uUbItKN/VdEm1LzPtQAfdovZoA99/GHtMHRa2vBl5cE
	vwG1WA06uI1baM8VrQodO2TbXw7Q4PVrUoTrwOWinbUvTm7yFmeGUyTn
X-Gm-Gg: AYBFou0UJ+AzV3+iAifr8Oqg7gKmIlS+8IlATgHnwG8Sz6OTz/yKhF0NE0IIpcZ9hAS
	uuM5nO61jOWQXTuWRyl5sfjs0wmTJO0EIWWUEVUlvoSxgw7MR47NvzNwe3EXGaAPjjm0Sz3ni7w
	yEaO9Ha3NTBg5Pv37Wl0T5ICT4Fuq5enFSie7Q3ZvEKRFUkYJ+HeG5Y3KLlVYLSRgwm/yDsjzUr
	bGSgvYPnC7o5bQHRfv05Isv2adRXSg1XMSRWWXaNKVYGZFcIatdptcaFWZ9SdAZZQL01HTBTx2Q
	obaAfn9J5FENh1chjSylcsD3AMa8ZdYkZPi4NqWvJaHSfMOnmUECYOSO+b/sYUHU6XVDVmnEVOk
	kX030MslsUAb6O5BLwTXvF/M0rPBaYLFqA8FMfG0LQKE0tp27fDYWKo+xtY4MlWke9f0m/EDZvH
	G8RSsseXGzbHf6klAwT3/1waphvFQSKSVQ1XXl2QNUOkGZLBRKKV/YuX95XGIM4E4plBZCn7gKB
	1b5dgw8BXa4WyAtsmWRvQMrp+ahhjq+y2Ua1YscVfROo4OSI/ry/SDp+1H/ErRzBLiT9JWL2zkn
	q4q5bv5aA1q94+drHLnfSFkHhOTxnskPAG4xWVxSkrTCMT+n6Mvs/h9gzqoxXmc9tJe50QXbiIA
	=
X-Received: by 2002:a17:90b:4c10:b0:3ac:9e76:aa9b with SMTP id 98e67ed59e1d1-3b1b07fee23mr6296426a91.7.1794681806420;
        Sat, 14 Nov 2026 10:43:26 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:6e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb17853sm9700940a91.5.2026.11.14.10.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 10:43:25 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: watchdog: arm,sp805: reference the PrimeCell binding
Date: Sun, 15 Nov 2026 02:42:33 +0800
Message-ID: <20261114184257.535546-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Unlike the other PrimeCell bindings, the binding ends in
unevaluatedProperties: false without referencing
/schemas/arm/primecell.yaml#, so arm,primecell-periphid is not an
evaluated property on an arm,sp805 node. Two nodes in the tree carry
that property regardless -- watchdog@a2c000 in hisi-x5hd2.dtsi and
watchdog@8000 in mps2.dtsi.

`make CHECK_DTBS=y`:

  watchdog@a2c000 (arm,sp805): Unevaluated properties are not allowed
  ('arm,primecell-periphid' was unexpected)

Add the reference so the property becomes evaluable; both nodes then
validate.

Fixes: 73d3e43f9813 ("dt-bindings: watchdog: sp-805: Convert to Json-schema")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/arm,sp805.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml b/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml
index bd7c09ed1938..690456839fcc 100644
--- a/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml
+++ b/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml
@@ -16,6 +16,7 @@ description: |+
 
 allOf:
   - $ref: /schemas/watchdog/watchdog.yaml#
+  - $ref: /schemas/arm/primecell.yaml#
 
 # Need a custom select here or 'arm,primecell' will match on lots of nodes
 select:
-- 
2.53.0

