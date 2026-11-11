Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413794;
	b=AOUx3jxck+/NskHt7FKmnGXG6A3Gs5/gjW7JzQkB5Y/uLH6DrZeHmNce+v+5sc3vivlb
	 pcDFVz0kL2gBm/YXGTNwHd6xPyQMn5yvE7OfnulcTf0upfyxP+0cfpi95kfPexDX5TpS3
	 MiETBnhYJFVLsHZ7mWGMdyY+nnDFG9PSroRAP/ca0jbRpglo80kyeoZ37oL9k65wjE115
	 c4LDRW9Bim+lkT/GYo8QlrH6XSeiGrcgJL0wc4hGt1mVUsvrN2exa0vMPXnyQd+8VVOn0
	 CuDwP7t5xWakMagBek6+Pf6EA/a+B8a1FTVeTXD7ysdVKf8iUI3pqiUHR/OUaylYqcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OWKya5sSJ9j067I6HNGIq62Mm3D1tDLxOBn52Ir8mow=;
	b=rx0UhfWBtzCeHFzmSbPdGZT158Cxjzfkmtga7PSXX2hffZ2phDqqptZ63xB3cKqwSKN1
	 RpwUEd0xeBPKh08rSEhdDyNq+aYi9pJ2qz7CPhiKnGqJp5xq6Kjt+t5/ynMK7jO2r+pNw
	 iXiHHdcIrgzHPx/BbNnYEbx7r52Hpi6GHfw05E+H+p/fuNRarWBzTysk59n58y9SbxZMl
	 UatQMZXJF7y+weOrcADqbzc3lPQqnKvrr6hrzKHrilrEQ39F1hllAPc99RBGVETAxlJyF
	 5xIAsTCKDEmDxokNk1NW3YYlzv/G3zXqFyMN8z9DKYA1pQyZZDq3Ys1FML5FBNTLZ6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=l7LxDYNQ;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8C4606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB8C4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=l7LxDYNQ
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso21221005e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794413791; x=1795018591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OWKya5sSJ9j067I6HNGIq62Mm3D1tDLxOBn52Ir8mow=;
        b=l7LxDYNQO/ktuoSV8CAdZ5TDHuJEAW/pzLB0sbQ0wOpmhAl7anQ4L1+DrgtEFMHXTi
         qPszFxpwtRiPrtM5FHhfHHjGOOkJbv4lDlpEnSGomlz6tMwSYv7Vcgq+ZndRH8td/Dc/
         7RtyNgIYqr89gQ82DAQnBor2py8ks/BVoCJPCcHZCwfbaozBctN4ATrL6931ZzqdXDZP
         UOguDUjcJwm+W7lEKIy7LoyabOnqyDnI+JJarCo/FLj8HR2Iv0jNn/b/4cq/Liv5MntV
         MZ/TFVTYRhWico5wfus7vRP4XOk4IThG9z5XjfZ7JjecTWNXSXhqcGpatjK3dMs/TPgo
         ho8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413791; x=1795018591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWKya5sSJ9j067I6HNGIq62Mm3D1tDLxOBn52Ir8mow=;
        b=SCip7OLMswMG5/UBFnUYGKrLTCW90BrnfQTe141xjrlZsjnMWGInd/SpeCCWrDW+w0
         dxYO3DaF7AXIu5fF/6p7/KUh9a5P2An0ZWpkTk9RFDa+ROoRxhtzisaiAz2zGFThACgg
         +fKjtz0uxcojqvb923xfVXNlaG0mrX0kTEI2ZhznDuxFVOSDYz3bBg/crtSO5nGh0jYd
         COZPBrob7bVl2soaErcMVYpPHp9gbSjF5EtiTooxz/1vhPC8Z1oIrFt4goId3pXGf2bH
         XfZHbRAXQPaRqQfBjOkeWjEVpW0q/Y1+NBsDkeVirurDR6ZMl+2yP4I50VnMGyOGMkQ7
         2uKw==
X-Forwarded-Encrypted: i=1; AL+hErE8ho1mKOl1x4sxr4uI9DwWiKu0itmaFteJJgcPk66w+CnL1WN9COJaiGI9NBUMMcBeUo4KN/k1Nhtuyno=@vger.kernel.org
X-Gm-Message-State: APuU4Z9h8Pt1P6YcNgJEhsWuAK4ljrvJoUYTBaMngywdIkRQNJTjeIMo
	OyWCSByi5myagEjThAXDkfil4m3t5QqYJ3rk9fFZJCbK01vYAqGhbtpMhRMK9zoO/dI=
X-Gm-Gg: AYBFou0hwLCWcLXL5F1dRl9mGUZVgqY3dpDcOcl5oTFR9WINLsv5KsR+ZkIykYLAZgL
	r89S1d8MN3tcRpp6PUoVFAa7QsLWslNgFDbQBTFSrj7K8RcWkfSUyfRfhe+PC0L9gmca+SXthAE
	yzhsBbrVChKy3IUUT8Wr4xUhZQq1+AB5kbT3LbQh6csT0nc69jwVTCuT33VTEntw4/mA9mXSAUD
	CJvHbfAZ5adTWXqA6OsIjqsf0wXrVzkZsMuag6FG8MssZjy6aq/vu3EUFnoo4l8x7c4Rx2+nHDq
	a8+aJEgfyNgliaD0lNuOHR5BeBQR46YsXYzZc1nLcCpVCfOPAcilDWil38v1eO3AifAFfckHpjs
	iq77iI6QWWT3zck1JGJHV1ZD34xb6QyP+/eIv+Kyn0fvPASwrF3jtET9y+c9TE01LTTAlefe+mw
	e9iGIjKWZs/Fz3BuZckCVl0xJeFRsgWQrUPW8iMjsHZBECgEJUawqQJoFPZmUSZt6/ENljwR42Y
	dH4RbLZ3T/+lqRkRJUb71kUQ67dYKeuQ2clb7hGmiI39t2NXbwex0I2X1d7AxOU7uf/RXnvI7dj
	ggF2eLkMmepJKQFizy6viGwioXKPT7XdZIGwkPbXTiQUVApfkHnve7T4wAplhpEoruChGn7FmKC
	GKWR/aU8zeZHu21sxfN/K3+YX2epZ44EQx54CTYVB9+FBUOaGREbd6BlwAwK0qLyewRvk0gXOVH
	/VadMnc2l7teTggraM+AZo1Jk=
X-Received: by 2002:a05:600c:4e87:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4ba0938ae31mr51209845e9.32.1794413791046;
        Wed, 11 Nov 2026 08:16:31 -0800 (PST)
Received: from threadripper-fedora-workstation (d-zg1-240.globalnet.hr. [213.149.36.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c52fd01sm8374925e9.4.2026.11.11.08.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:16:29 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 1/4] dt-bindings: hwmon: fan-common: reject zero pulses per revolution
Date: Wed, 11 Nov 2026 17:12:45 +0100
Message-ID: <20261111161619.232141-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
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

A fan sensor cannot produce zero tachometer pulses per revolution.
Add a minimum of one to the shared fan schema so every user rejects
this invalid value.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
- New patch: require at least one pulse per revolution in fan-common.

 Documentation/devicetree/bindings/hwmon/fan-common.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/fan-common.yaml b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
index 0fb7380816994..63a369628a3a1 100644
--- a/Documentation/devicetree/bindings/hwmon/fan-common.yaml
+++ b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
@@ -27,6 +27,7 @@ properties:
     description:
       The number of pulse from fan sensor per revolution.
     $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
     maximum: 4
 
   tach-div:
-- 
2.56.0

