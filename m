Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703928;
	b=dPbCD69ozE7Dwk+oGunQmCqjcQj9yc08KOqHZGN+iC6hXug6HuTrDk1N1RPbE3+jb9Ks
	 X6fcNtr1v94T9MNU50GYWJXoPBsQc8BLMIdnMeVMxhrzY0PmnHCqeTnDB97giH7YNUy0U
	 0F5KQIIGUuKHRLfS1zfTUaAbVKKlpjflfSr6bKUrySpxWLJJ3zqu5sbcXOaSFsamK426a
	 SYddyWxaSofdN7EPWQbiamds2nT0tmSA8oNU410biEu2q7rpzhQAVIgjBZDsZRgcX6Mf1
	 OPFCrJA2Dv9WALbyJ9dDW5eiqv2kP2SQm92Tz5BQxM64ccElikfDbrHWdzHxVLj24+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h5PxuAlAW6HHJw+w6VONBfKxYmNAlUHhklYCRR6Yodw=;
	b=faLHhpwmSgGJunVa14wkcbTqGqj97OyH3lliEI/sO47v4agXT9qBp8nGddaOYroepABj
	 tvofTOxnmCPNJ4NwyRSXfqSGITU3fvrDD5Byni1E99nuhcyGCiJH5NmJfH+77/tky3CQ0
	 p3ZrptpWbdAzTRbeB0KmwK8yYfYInAo/YnXLXASyW/CGOA6mq+pwcHz/mqoTdN7+ITrDn
	 BCrVcIursIW/v8xG6NkTlBvJGhmoR5IZnWCTCQaxiXsgAyn2qGWUjgBczc5JxIyxkmSj2
	 Q1rzprdnIRcR2/BIetXVZCTTOPDoSw/azTkY6LHkJ67DWXVoOgcSnjLuXbNNz3Kj/GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qkb1MIIg;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81564606D82E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81564606D82E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qkb1MIIg
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so30337495e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793703927; x=1794308727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h5PxuAlAW6HHJw+w6VONBfKxYmNAlUHhklYCRR6Yodw=;
        b=qkb1MIIgmABsjc1rkpRsG9E3H0z6JGawO3d7CoBPCvVtpaFp7DwlA4g7tjZuXmm6TZ
         6jVpjmwuCEXBTioJ5JVTXL+mPIKjCcjThKNAGS2PrpSWn4kdsV9mI9HVJMazfT9oIuml
         XvcsyAfEDuD56wQQlpk0bO0cjsGBAWWdD152qP3OioKkpRgZ0aFBGiBcUl0AQbY69ODf
         LKKe3PucahQAdpf2CVVGbJ1WsaQE+3X4+Auisq2shVWsQQ65Mo2uVGhQZXCpAADdoirs
         iB/JnwiPa1Knx2XK0koCJolIv7kmnq2VnF5+3N7Ly1+2FRKe8pAMyVZKy8cjNNh8KujK
         +dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793703927; x=1794308727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h5PxuAlAW6HHJw+w6VONBfKxYmNAlUHhklYCRR6Yodw=;
        b=UO7/V+bKURz0zwU0quRvaQ/wJI4VtLU4DEPJmYtnK5pyKySrdVvTlBW6DN1Fni3dA7
         tcpfMCuArtarxrntI5jCKqPDL+fqiXOOjZOwwKOwjLs2kfAVZ/OGF8su1KoPyOsPNqVN
         PhxFnseOQ96GdO/5ppFs9KriBh/5kbV0IGNmUXKrmrBdbrtSEKbGmcLxm8D4+qZiqVDL
         toBe9tWTm8TPt8nqKBEvWjVFb67kMvjIB4j5tiVjmxwH/UNj8p+bRreq0v033g+80r4k
         EPv1ZJ5y6PJC62lZi/d9HRlRbyqXalYj0aL4st5hWN5hzmaI2jRiaMcnVZocGhULQkZX
         8arA==
X-Forwarded-Encrypted: i=1; AKwUvByDOsi1gKfPzlx0qPAsbA/lTXIBO9nOFMdXadidXWZu865rcakPUHv+z4nGcSbfW5lQGiYZk5Z0N5mRc8k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UoR1Zp0CWTF8YYDG2iI9BBB6oGk9Q1G1gQTiqi+ruJQ4A7Z1L
	/QB0KzjEZejaaZzxZ74Tdup7e/kKg+sl6CPxKn3Zw7vdpO0weFZ+1x/9
X-Gm-Gg: AYBFou2EF5BORQ6WYhNuaUb1B4ElOaaFjYqsgqZm2EAu6VKm6hz+h+TvlTBENGdDBn/
	KZvLmPNX4gx1HY65HtUfUDIadXnyZZn+5ZKzahpj9IW1I/GOzA+oViWXJ/jf70qRU+rBDlJf/An
	CCoJ6L0WSfAPI7gu69jU0aS2TjhDB+Pf87ICkzYOeArxn+4d0CLkF53DX4vyNSx7qQlchymvmSn
	qh/scn/nrrOTKDwddu+c1HkclL+UTBHj13tS9x2UxOF0/uzVyzonQF1Awj7ABTQG2GO7JxrKIJn
	8ILXZlFyVyIi4BNbFUcg0MjI5R5Vl1obfVGe6nsdWWOTbVXLbsAE4xGmURh2trRrAqeHCA5mxP/
	dN4Oi3dESjzEUtH3zjHcKQgTycSUy08OlHNQ6gXDef7EbtGMDXgFCVi/0dCjzGX8UJyM2wG2jKN
	OQ9IitNce9xT5vSqORHcZ/zek73HpELbkE2rIPvV02xPQ75i46pP9z1MZjny8o4Kmjt7H/KmR1/
	AEfNA71I63SgyEB0ycNTg2F6yKYH23Mczk2hjj7xQwDlVFz5EZ/fBUY0ay7OqCWCFhsUeY/p+Il
	jyfykCypbIeFuAREGTmyRVE5SRxAJbiH23F+wUeZlHgpCU2Kf04A5Jt/Lh9eYZ9XFm5nwVrCyFM
	i8OO7PbWgBk94e+Yo5ZdB9V7UIOFizmzdTEV+XZFHO7DDWw==
X-Received: by 2002:a05:600c:46d1:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4ac17b2cdc2mr290564575e9.27.1793703926851;
        Tue, 03 Nov 2026 03:05:26 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:14ec:7986:30c8:6bc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm53218155e9.4.2026.11.03.03.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:05:26 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Igor Reznichenko <igor@reznichenko.net>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH 2/4] dt-bindings: display: panel: ilitek,ili9488: make the port optional
Date: Tue,  3 Nov 2026 12:05:22 +0100
Message-ID: <20261103110524.2812831-3-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103110524.2812831-1-romain.tisserand@gmail.com>
References: <20261103110524.2812831-1-romain.tisserand@gmail.com>
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

The panel is a MIPI-DSI peripheral, a child node of its DSI host, and the
driver does not use a graph port. A port is only needed when the host
links its panel through the graph; other DSI hosts, such as the Allwinner
sun6i-a31-mipi-dsi one, link the child node and have no output port to
point at. The PinePhone panel is described that way on the same host,
without a port.

Keep the port allowed (panel-common) but no longer required, as for other
DSI panels such as ilitek,ili9881c.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili9488.yaml        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
index ea7449273022..016a573893b7 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
@@ -32,7 +32,6 @@ required:
   - iovcc-supply
   - reset-gpios
   - backlight
-  - port
 
 unevaluatedProperties: false
 
-- 
2.43.0

