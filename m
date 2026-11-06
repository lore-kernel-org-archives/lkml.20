Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956818;
	b=RONC0ht12fDv6Eepplq0e0ivx5JL/ahNU1bCe5kpjYZurb14Pmv3NzowI26AmCXcN8Tf
	 O/jNTknd33Zr86J83Wt4XCBmcjBgS/Z3dgO93QxlAyW1E6oFyo3TAf9mq8FVS6mAEQfmR
	 qt4EPJkKDfQmlwmxULXq6vRPsElAjr4ektoiU9Pz2G/kwb4Ji9E8Y2i+6oxjljmeot6GM
	 KX3uEnmg66sYJ229hrZyZrGRsqNsIKZU/3ULOviMLWqzF1K7vb9siCIkE6I0CuSzQc1F3
	 XN3GSaoyAB/Grjuohn+3c9w02z9VCkH6d8WVQZWAg5Hcf+BVXXLtIcTHSIsnk897DUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xu7FC3Q8JkhKAZXkmoQyecqo7Y03cSTT/z26JLOH2q8=;
	b=5FpZSIA8G2wpY3Q0z1D0Njr6Zu6uqY4X0mX3IpnVkm4trPVCgtnAu0Wwe+K/XFTV9jJ1
	 tohebqudoWHw5zyL0gkBMA1lEa5dJkTzYf1jjNXiqtVNEgEqG2qnDcplcuidTkAG055fc
	 xTjx2v8uC7aYHtkmzJ5KWAgrTdaNMGfe/wLLs/HhCDGMSsiQYmig1ID6sxsD4MbtGRD0I
	 u3A3lPjdPP2Wstb/uw/nQZad5E6nLjeKnb67StmWDIVmETbBF3pnj47g8PmwX+z/faiQ2
	 c6pXo+IwCI0YbrXS+Gbeuh7b3G/D7x6qZ3AyT7yCpKYcwdJtfizJXJtnMztpVlpIcIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oN93Xil6;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4B5606D836
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE4B5606D836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oN93Xil6
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so3093385e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793956816; x=1794561616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xu7FC3Q8JkhKAZXkmoQyecqo7Y03cSTT/z26JLOH2q8=;
        b=oN93Xil6UfBn7yVRhg6frgSrSIimFgqT44JhM7qqaPimBhIWP5FBUZFJkH+KfzHsgZ
         2SLQnmaAStlJcdtt00AdNoLKpHgC6fl5p7Ml7m7Q+2AkatDQYyPZJ8iwaRsZL9twxKR3
         81tb4SRPMpBNziBbDUcidG0uKjjXEiGk+zoGZCh/gX0+Vx1abnP74JwqEAaXqdc5g1gS
         zdFkhDe7CPMRRpxsKmzwYUXTTST3k/RzVaQL/Tj8+PQrvXCCrhIcyO0wiW9/BX8QbwkP
         QQ0LD54NiFGhmcOnDdJlDKQXXao/roCWrl5WZrg0KzT8ydxhHdvmu88vvR+EMCE15xed
         4maw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956816; x=1794561616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xu7FC3Q8JkhKAZXkmoQyecqo7Y03cSTT/z26JLOH2q8=;
        b=EfQAD3/4O7CKfcAhpc0t5h3nGe302tuwpRL4BICqxXmzUpN7AjMJJzjGkxIeH24zP6
         UBapWkz2LfKyGKzxnEkMMsG+rgj3zIWRWkWxDpb13ub13VJ86v+hqkwTgrsv2rxdYJ++
         j321pIlXDDl+aWairb1q5E+xtnFGCckR33JmtS2/qv8Ce8RCKUulruqBU9M9m4uxDBmY
         2C+8upzQejNEI3nNCykOY+7aSzVCMkt5ztoLID9WXedg+CabeqPSSHpMl9NRgJEeFUvb
         HZTJVOY8ishO/DMVE7g7VOJBLbiNAwfjjFleOkb9Hc6rvAlWUmll0/MRzwxf04QtML5V
         0JqQ==
X-Forwarded-Encrypted: i=1; AKwUvBycBOBH2rvATMkR7NeJeG4J+uRO2OhHW2AfviUtHN8lb5ii4+HxKtJ76JlRFnTgh2NO2Q+hJTqGMVP7Fhk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Y314Mc/8k5DNUBodxk+hefgCMjPhA8ZH2y2VxJw1MkEXgCtK0
	XND+NXvB6huNMlNcogxOfJRYd8RaJGMMcZf0B8j2IoPveZDQNK81jS9L
X-Gm-Gg: AYBFou2NeVOppLdxwlsrFug/AHOs8CjHscOKqmEHesZ4fqiNTQPqw8do3ALcssLt4zW
	07mPBB9L/X9vt2U/tjLB7i6N6MtIJGWuhLlHVLHFE0iUPUnB8c2oIFRR3k5I4BUildojWlfmiHu
	26v4jjkuj9N0Hc6U16dSHgPf3n1IltRQeuBYenVhCPdlwh80lYsHaS3Kcj8SrA6DNGSjl+QqgEc
	6MiZgdU18I8v3cTdvsmql1ccv7ddigQt35iJQngSewooXtQanWPEyC8z4xfG0wTM9WKjgc+pTDP
	sGiI404PFFuy8yqTfXUNQEx/3CGVH643w2w4maX37G4v/OCjXNEndUH3cXB2i4LA53jU6cAI9t0
	YaGTGNLxs/MJBOs8F9qmdcfNXdO6K+vlTmzW/ZWCeebTXEyM2C5fg3o5/paA4+OVH/DNd3cXlwL
	SHZ50wWGSlog46KUsUuieLjjPjJU0gTWleLeZps+jPYi/H3ekcADUH0yVgNMbdEGeOiIZWGvjak
	AzVCms7CzQr4gi5oLhOegMr/YaccdxfvOKOIkI3y1mpurONqnDMcbUuBfJyCGjESHzT0WNzDHXz
	vgWBU5Z2On4lZmBpWI5c83mlgfxqvc7BoGUz6wbp0+lgbRhx7Dc4/h9FZt36WArgXNJ/nQMfy6K
	NqplQQt/MmQ==
X-Received: by 2002:a05:600c:1d0c:b0:4b2:612d:908c with SMTP id 5b1f17b1804b1-4b6df9beb91mr29536225e9.34.1793956816082;
        Fri, 06 Nov 2026 01:20:16 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57203a98fsm108358935e9.4.2026.11.06.01.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:20:15 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Esben Haabendal <esben@geanix.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pan Chuang <panchuang@vivo.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Nikita Travkin <nikita@trvn.ru>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] dt-bindings: iio: light: ltr501: Document LTR659 proximity sensor
Date: Fri,  6 Nov 2026 11:19:42 +0200
Message-ID: <20261106091943.35783-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106091943.35783-1-clamor95@gmail.com>
References: <20261106091943.35783-1-clamor95@gmail.com>
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

The LTR-659PS-01 is a proximity sensor similar to the LTR-559ALS-01, but
without ambient light sensing support.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml b/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
index 20abd7da080d6..85ac3b540c206 100644
--- a/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
+++ b/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
@@ -17,6 +17,7 @@ properties:
       - liteon,ltr329
       - liteon,ltr501
       - liteon,ltr559
+      - liteon,ltr659
 
   reg:
     maxItems: 1
-- 
2.53.0

