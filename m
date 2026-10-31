Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463656;
	b=Ji6GXExIg1jYXJkNq1IIpYGXqfmZbZU2dM/wFuJZ9kxuVrEtvnZMLOIk+u7bak77X0J5
	 LRifDkteWp3wx6KPsEjMCoG3R1GyNo8W9kS0H1TKRvjEzwtL8AkfokmBbYs/KNSQz6tp0
	 4DtWB+OgyNxy0rUI8Yuseoo/OC+pcJWcB32l7C6wSLcs6V/hLrGxS2mWdmLAmefXG7xk0
	 baPu3W7MOL4KgcKcUM2dChayh22M1KFDV8Kp15VLCKaOKOBANQlRSLcVCBOhl/ZL4tsd3
	 Vtx8kvzRR8j62jKdUygp1fDoVgl/VloTMTVVREnfVL0ywpgWB1kl0TNFm4Y++ppYgFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=W6O9uDDdkqX4ekXCbjPTdfdfIwrIVMuQ5XXW4ZXzbsk=;
	b=ShC+bmbqo4TlRY/cInLal0thi+y6VXJ6yMVUCKUQMJ/G6DQwhIKyuKC8eDQC0Qvmf+gw
	 LzLl+OWMgS3XQi3ZxikhE8ejUPC9pVA2D1Nu4dHUYlzFKlR0yEBoP4qbFTPhAXddeSyCI
	 mB+/dSKw6nVtXrGq1OkJMqtOub54i//akvz/w0tQBf6MjhPvrzeG9cLkM+HJcf0UFPu1g
	 Hq6+FLfLgEQtunrRsbxp/Uzty2sXsC+/i7WsJXOlKF/Av895ijtBZ4s7O6oqMwR91VLFI
	 4RIYEARAQAHZBgw/i7+woXPz/99es2E+kkKRE4LgcnrD+V2V/35hKnviTpHV55oqISQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=JczIkbL1;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D38606A321
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2D38606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=JczIkbL1
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36a315ed211so2063047eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1793463655; x=1794068455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W6O9uDDdkqX4ekXCbjPTdfdfIwrIVMuQ5XXW4ZXzbsk=;
        b=JczIkbL1RPqV0NjfLsJpyvphxk7j/5rI9Ezb/PTfbtWFz5+YMiziS+VcXmUynnQu+Q
         1DSH8Xr+deD0f7s5Dm+7F7V73OJZL86pd1joslMAhTW8Pc724QTMlCiNclfIzYtk0Tae
         zWGJMgGnQKCDR4Aa967vtwfpj7x9GAIGYcM30Gj37kVexv9l86MhQud9bjFS3umhsAcy
         /4hugcLQCutRp+dJ1ovUwdfybPSqX2Hdie1WQ8sIfTcVTWR8bJbwXhXXwsj9Ca12lhjC
         BxFmgVoZyldgfpDd/SpWqJnvVE5naA+8r+3j92PVF/htHNh4u0aadl51mo2aFnJNOsSk
         +6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463655; x=1794068455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W6O9uDDdkqX4ekXCbjPTdfdfIwrIVMuQ5XXW4ZXzbsk=;
        b=s9u54FICSX8I/m5WCw9Y/9GPrUNaMrGPh2CyQ0267+MJIZQRtvLMqfAwKJo9qIom7m
         q5KWNYVtzx7tHo6dWFvCcp8BTn+lIbe8t0oyGGmjzPI/Agunk6eCtbamZqWsANA0p2J5
         MCWB1DyzjbC+DmiesU4g0M8hn9QXlk/U1gDQTPvL8FJdbFBdi+sZtqOYl3UHOu4tapN1
         PIbdTnlH9NVchFCM79syFw81i6CgwoOnv6nVUz2Hn3e3foXOarsqG0uYh/gShckjQKZF
         bwfVrahFQ9mMNwlb+BT9pNV+1T8EI+A+cDtEaB26C6V7swi0zJKN326giVJHJOR2bwRg
         my1w==
X-Forwarded-Encrypted: i=1; AKwUvBzCAQleTmMJkVbeO4la9ylM6OvRY25h9IjdrZUdNjC7kbOcjjXhJJX8tEuquvtEXG7L9a1yLSg7GagNz1Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyIwdkLh2WzH2isKiDggrCseQRQIEjVJ+349/EQqzNLA3xa1ny
	ALbluMNyq8YsyogxuhQFcYSspLalLmBDlUDAEjcBwP0XwSj5gy9IRyIMnbkHkS4ZxG4=
X-Gm-Gg: AYBFou39EdxZ060wLKia9CP2jv3zkwKJmUAjhvTW5pTntFsmgEw1hD65PokL2t1EJTW
	KyRtTgAvM7v3tvs2jyE7uk+Y4pl/gAmh98T9K/no5blxat7XrxM1RZsZgRGBpp+pJ9pS9MN9yUS
	9htZ1+EurKHCR6EJqzkYahlRZLV9JMfZPxfIDq18/6tOZiag5jsEW4PRkvFfxiS6iPNHZxdScoS
	9Jw+6/viwrfK1Snjju03A9wko0ffjOkgW2h0u/Cf1ohx92DY/j0OYX86YvGBka7pqlfQVPAtv2Y
	50JXW5HAn83W/K9xaoogeEroccdnbVpZADG+RByGNDQuNIRQNVqE0A25XuxNSNL89f8vtroJRTR
	NDREcuQi31aoqD+RLg0M3nf1F5OTBB/J+L0loTCBO8b6GCjYqpQK4OLjFtR1OHSrtrzJc8cduDi
	lSEzZpPUGNIz88+JbufonCChxAp1VpSn84DyZ82Di06n2ADxFPK8kgtYv6743S/F8hslyGHl5pO
	MDUwhSCBqYheXeMTdMrLBoY0/e8wmAtTRXLxUsNmY8tYGWNllH2QBq2JTkxQM9uW36cen3G4w4r
	ik5f/OrccvnFu6zBbrzKtamra1dwXddK
X-Received: by 2002:a05:693c:4088:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-36a30009ecemr13020159eec.6.1793463654705;
        Sat, 31 Oct 2026 09:20:54 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428aed76sm19185195eec.9.2026.10.31.09.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:20:54 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Sat, 31 Oct 2026 09:20:50 -0700
Subject: [PATCH v2 1/2] dt-bindings: eeprom: microchip,93lc46b: add
 Microchip 93LC86C
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
Message-Id: <20261031-eeprom-93xx46-93lc86c-v2-1-d37331af73d3@nexthop.ai>
References: <20261031-eeprom-93xx46-93lc86c-v2-0-d37331af73d3@nexthop.ai>
In-Reply-To: <20261031-eeprom-93xx46-93lc86c-v2-0-d37331af73d3@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Cory Tusar <cory.tusar@pid1solutions.com>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793463652; l=768;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=xjNPYYVD4NJkISRiv4nk+t+tiwR6bKadykG+okrWRDY=;
 b=G48/sisg0sq6ydpd2JO/2jfaGeMD3D6AztrOOuMMFcnWBoZqitpohPZRWV4sjFMOnw78U1u7q
 UW1GLMJu681B1Ksh0K9btIv1LBX9JClUdSXSLfoBRdQ6BWYjMRmE65z
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The 93LC86C is the 16 Kbit member of the family.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/eeprom/microchip,93lc46b.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/eeprom/microchip,93lc46b.yaml b/Documentation/devicetree/bindings/eeprom/microchip,93lc46b.yaml
index 144e86ce5c0a..8e782b70386a 100644
--- a/Documentation/devicetree/bindings/eeprom/microchip,93lc46b.yaml
+++ b/Documentation/devicetree/bindings/eeprom/microchip,93lc46b.yaml
@@ -18,6 +18,7 @@ properties:
       - atmel,at93c66
       - eeprom-93xx46
       - microchip,93lc46b
+      - microchip,93lc86c
 
   data-size:
     description: number of data bits per word

-- 
2.54.0

