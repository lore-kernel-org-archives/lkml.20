Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920261;
	b=nl6Lpd9c4bf/Omw714KZLDULWHeGGNExqg5iLF4W+20anNIpWYd0y+wdfBZSRwrXvFib
	 DesC1uBwTq9tepEU/MRxOJgnpF5sOig88WPAc21FYFAkj4qy8NxEsTEuOFqQt0BYjF6+V
	 R3J2xl6Tm/Xgvo/WljXW0Zuyx6b2Nl9IaWJXfLzigLpzCkkgqXJIlb4dg2fRs2Nz/WLW1
	 fS3qqA/CB4c8Nq0Z9GqompzRttU0UmWiXQhlbql7QK8YxL8k6aCIHcqcrlG7EYSD0oNcc
	 lKCiOzmx5Xt2tovwtxa3nSIY6sRpHVhrGG0w0MroN4m2pRqUIuoKMjb3XGINZvyhUdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920261;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=pq4AjLVwM19r78cOmsBTZmnW52I4hS/grHAe4MpsVsY=;
	b=JIlvbq77ymoAcfW9mkd0FN559zSHSDMg2h/32ZPjn1/6XeAjzd3WwymvwexKT5LKaH9N
	 S9p5Arq6AVeKorllcgMjC4zQE6O/lpmO2cp3r2pis1jUsqL9ViTDhSvTt2I0lfgEyISL3
	 NZvLfdJj0PI3m5KzSRu7jmDcxe9mvqkOqLGZO6NKsSyDOkjxSkFfbm6RoP9Qi8cPD8I0F
	 sBRfqzo51rBZZy4RhClRSPdWjSrGp4t9nxUXjLwasOnhNyueajp/hFYx+e99WZ33w7t0z
	 ZwJQJlJvnKEMHiRKK8akWmErpm3ysoBGdmWDatpOhDqN8PmPw1U1pK0J4cH8tBc90ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=hqbGnlds;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7B1606A88D
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB7B1606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=hqbGnlds
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3282db206d3so12535025eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794920260; x=1795525060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pq4AjLVwM19r78cOmsBTZmnW52I4hS/grHAe4MpsVsY=;
        b=hqbGnldsRnNYQeeJ/LsOxnTjKzWYSBL3+tdT7EhSLvinL0tTzRB6p340IkMHV/b3t1
         p8/5oMc7sOgO/k69d6xeQro9UlUOwxjJKD15HyuuLNvAf04ZelbrXzHWZmx2bj/IcNqb
         cv3r6vpnls1OJYtYo08cymmRO1BTkKmpPodoTARMRyAmGkuYRbQhfi5sCQDDgmooPoz0
         pBuu4RHR43lRX2EN8FIdUYHT6ogk4bILpwK6NYjanSs1FH22geOZ7WOrNlYBSS1/CMRF
         Cbuz9xIvdlZJbSAtn9XQbeqOPkQC0cW2XmQDM/LWud6OFk8cIKUlHmhG0rmb/Tu/pCQg
         CxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920260; x=1795525060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pq4AjLVwM19r78cOmsBTZmnW52I4hS/grHAe4MpsVsY=;
        b=aZ+y97nRI1EoizUb7maAvjwLulX+M9rjBV2i3KGvf7pcN6igRhF840jL8Cmalku3lo
         d54q0hzxMGPQVZrgcuTeuY3u6ux0AhI1nisUZnI6Zw5AoC3t9ADNHUubE+gGx30KPLBP
         O94MytP5cDVpumzjZ3xZwjYqsepeFRSRJg5PYKtv1Hf/DXsiLIeyKAR39lo5BlQJTA1n
         vP4hHnwYNqGt3t1UI6pjJnGIuOQNkFZ/Bo0UExhETI6AaK/7Kw4q+iQsg86dIZXE98J/
         IXifRyFvnRnima2JIttG68Y7ZD7ogIhN73HE8Lqa2Wzo94Bx2gXazlBUGayG8L8+Lov1
         kcvg==
X-Forwarded-Encrypted: i=1; AL+hErGNZFpVLCp1BsnY8FBMIeexcSDHy1zY0KxuGBu+1x+gsWU+vPAAztiibV7MZJQcP6zaBMMVEJMQxNF45wo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dyqUjHmVqBtO9QOeLXrNq7L0wun/VKIDRPSysnPEJSqE0WOTh
	PZzv3Ug/FIitOgEP+j+SHlDfsQUe1gbcRGoACn/io4q0XX0fZ/yMkSAQg/e7eEQWGsdMBf749gh
	DTxsU
X-Gm-Gg: AZFdTZezgr+EvpIA05xUFgjtv6p3fXVlAIqEH8cdTkGAr3utcCv8iC68lb4RxYk2+wB
	wQllu3wJN8TrsFFqIskf5QNYLuDS8POWLRRInNmcdwEKE5wd60RyyaHh5ir2F+WrjMXhLcb1NDX
	CCmbBdXirgOuaQrDjKpTgTDPRfH7+Az+JYYZFtg95yxjPSex4kR1mxtjI00JyaU3G6SUhHiuAQG
	H8Ii8BHFwF2PJKAmk3TZDpEUwM1j6kySiQZlcGW9d2hz+UczXHSNmUWgfnTDlnL/YgWN4ZwTKcb
	ogItK42EneScPpyvCzSxLaODahyGHNGTRCZCcotuPd79gfo3EmFjiC7wDTpW9woSzMA7RcAe6qD
	qN/tfekErs9GCZt9B62qrV+Me35OtwBqS55Ab4w2ZXCDwPD4McNlg2eg/HHBlmH2WD1+Oy8eXpl
	SLWqFeXjgY3FjBXFJceeimWjo0XY3nWuJO/klCbz5C7h3+u3YPeJla3SyS8oybrhgNYwX5ImPJo
	4rcyRvfCw59/voLulTXdBC5RuOisgqnR/MQApGKVK5GWRRPKDorVU+l2dvor/bchqRHnE44i5UJ
	3f0cxbkn45OzEtI+RDa4uTupHTjH9Vi5J00Edy/Ewi8dztM2sHv8EprluekGeNgIrsis
X-Received: by 2002:a05:693c:60ce:b0:36e:8410:ecf6 with SMTP id 5a478bee46e88-37966387d74mr15512381eec.13.1794920259546;
        Tue, 17 Nov 2026 04:57:39 -0800 (PST)
Received: from [127.0.1.1] ([2804:14c:4c5:8bf0::a1aa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379559189e8sm44767034eec.11.2026.11.17.04.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:57:39 -0800 (PST)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Tue, 17 Nov 2026 09:57:13 -0300
Subject: [PATCH 1/3] dt-bindings: pwm: sophgo: add PWM controller for
 CV1800B
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
Message-Id: <20261117-milkv-duo-pwm-v1-1-3f1786ea57b7@baylibre.com>
References: <20261117-milkv-duo-pwm-v1-0-3f1786ea57b7@baylibre.com>
In-Reply-To: <20261117-milkv-duo-pwm-v1-0-3f1786ea57b7@baylibre.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Chen Wang <unicorn_wang@outlook.com>, linux-pwm@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.16.0

The Sophgo CV1800B SoC has four PWM controller instances that are
derived from the controllers found on the SG2042 and SG2044 SoCs.

Add the "sophgo,cv1800b-pwm" compatible string and update the binding
title to cover all supported SoCs.

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
 Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
index e0e91aa237ec..11544b47c1b3 100644
--- a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/pwm/sophgo,sg2042-pwm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Sophgo SG2042 PWM controller
+title: Sophgo SG2042/SG2044/CV1800B PWM controller
 
 maintainers:
   - Chen Wang <unicorn_wang@outlook.com>
@@ -18,6 +18,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - sophgo,cv1800b-pwm
       - sophgo,sg2042-pwm
       - sophgo,sg2044-pwm
 

-- 
2.53.0

