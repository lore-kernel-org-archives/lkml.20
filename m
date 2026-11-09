Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246479;
	b=MGHvAkO0Vm/yBHaSWGFXTcs4zrf4kBzlyXioNrQQq1ZCdnMklKvSAU5OaJl8QLRT5cSo
	 CLg94FI6jaz2XdpvDal6+QBN0t26ehUVVdLflXyy9blc5P3TZQqGwdma7OxIzWC1AX6SH
	 ZnsWKvBPLhyU3BvI4gXWtIwUSfqgi7/afo7WaMkr+GAOhHWXsvKdV8Jkc1LU5qn0y5pfJ
	 tMv53OO44qIQcarGD8qpxjjvNRNf6sRpmPneWytRIktGnHCzGeENWmMi7wYLC18qHkCrA
	 NZWXVY2UOzmcnkQ4C0FDoitA4KWu80BFK8BNznB5g3l34+cTKh3+R9fQMfwiInoV5ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g2yTl4PVSyd+fgLTgPgtlO0e+H5KFW8y2uBPZ5q/jBQ=;
	b=QGFxgop8CGNMKUspMjySlbe/ISXjJ/4Kbyk95248ei8sGVcSaaKcaL4FRjRo5jk58ORL
	 PDIRzObxPNO0cJeEHP3BcCJnmu7w00U8vEQFOGHQClRUCbK0OgCtGVhl9GRYDtax30HEA
	 TxK9lMCXHOjj2R+1dmQZSvT8g8BNTh2NcNVIbpXqfQPo1rbfJrgB8kh0JmWfvY/InLfsT
	 Vg9WWCf3C9Cm9I0o+q8EFqHbEcftF+qEVukeCDY0/P6vMj3O6CBzd4PPIDhHSdly5MvDq
	 l93Yt6mQSLmrlObj7mqFhFFx4J1fm2GdgYSDukbJWGf6oxgp1xex9OeC9R5G8p7BksA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=MFMPWOpo;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2660B606A331
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2660B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=MFMPWOpo
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e10a70540so737155f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794246477; x=1794851277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2yTl4PVSyd+fgLTgPgtlO0e+H5KFW8y2uBPZ5q/jBQ=;
        b=MFMPWOpo43dn5I1qLYVi+siaves6bKUxpU+2z6KSLJOGW+k6XXXCZ/2Zq/3TzkKRq9
         rECDoRbS+9RSxP6R9UjtOXuRjxwLpqWKonygKkfVyZY8yQjaQn/u3wYCOjPf42hWeCwa
         CIBnG7qOVkvrOT7lqfXuY0b3qC+lOYprtBpVfQBB86zDLQ3oFaJEYufBcEyJib12Zlqh
         0yvxgJXlHscZ+tfG0XB2HKmEl8VYO3k9LY+LQlKUHRtktaRfYwBr9QLN3Ha79m/TyaKt
         npmafvEiuFD7uPqa4LjQ0IuZDAWzZGMQP6tZDSEtUa62nOo4TMBBQoUcfFVPs1K947wk
         oQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246477; x=1794851277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g2yTl4PVSyd+fgLTgPgtlO0e+H5KFW8y2uBPZ5q/jBQ=;
        b=C3e1uXFKsJBHQleoubA1/Hh1Ivu2N19ukzukx1F2h3Hkzu56qQg7v4V29CItSg+jj3
         CQSI0On2ctmRS8nW/ofWtLP9wtB9/18/CIE3C/rQSfcs9jiN6xzpS1DqVBryhKiRn41O
         Upq1fCm/ifL3uOUXXQlA3I46poUE4UHHEoxoOh3fGHioHkb3WxxSEIQrUSs1fDhgLkZn
         VlaSbYmAK4cCItPtXIEvt4PdWWRbwN0kQhN0yLEBuymgxvkB388QVzwbflP4nY2PbluZ
         mN1GmQbrpwGFw/ceZxIVxNqsKN+WxzeRS6nabHV3WXiT9svSTOXfjscsVNn/lgAM0uKz
         J6eQ==
X-Forwarded-Encrypted: i=1; AL+hErFyLam5vgsCUaWez0DmBDVsEEB0f7QgLzVlp9Fn5eDLM4S3UuMatBCkdepD/o6lLDXj64j0NGOV7laCFwA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9N3DDciogbJoDNLeJjd8obszfP2O4y3fLI9P0442acM+GBrbQl
	e/t/buC1ZKauusdW969cts7giQPk0vIUcgm+P4WOMvWjWFmo1XzCmOeKo6kz6pqoeKs=
X-Gm-Gg: AYBFou035THbQuFNxZnY/3RI/uu5N/QpMrly7+NjhsDL5aXIm2e4fKQYfqrTfhUsSyh
	DVvzRDvEs4bYkpj2oSJ5Se6CFclOWKtPGVXy6kOrHe+Q/8JrLkUzQ9w2lC+YPF+ZsOjaJN0O2se
	B5LqcWobTsTAV8y3YOhsFT38u3ao1kipN+FB+tg1jRGu0QKFtk+yZz6+e0vIM+puUmijPiEHpET
	Z+dAezVaB0WfGLlqf7f77bKCulc8gJs66kYQs8YBBYFv+VBzRv0Zu9vKIT+NHy6kd5dahnoaohD
	OM42MHkkOT8J9qfa+FTd98IUBXjBLs+iyBoxDxKF/g4X4LUqkk/Pj1W6z/ksayZdekoQLYHFQ52
	l5dLUskTvVAb05q/NXO40RPaKe2G8uzzuBuSExHrWRL6ESp7NiIz+FuHWW/40eA5Ud5CMY6yIrF
	Wqip47sZKH9Ptn2xRtoSdgWQXSTjWEOqR12LDVswQV2t2AaAALEF7IiUM+ANngWyfCES0383syg
	Kyr+ZZ0q1OiM4KVV0d+Yl6Wna5zJeYkVYjSExfWbhybsu940Pl+/2OP5FsAJYIId24A1hmyRAfh
	5WGEZAa+1V/w7DUTIWRWpUlvw1lN+/I7cXF4Y/yDKf7DZOWWdjoGt8rt2iOkbsU=
X-Received: by 2002:a05:6000:40cd:b0:491:4e13:fde5 with SMTP id ffacd0b85a97d-4982d03bde3mr421828f8f.8.1794246477535;
        Mon, 09 Nov 2026 09:47:57 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:e834:fd4d:2ecb:b787])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm167322f8f.53.2026.11.09.09.47.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 09:47:57 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/5] dt-bindings: vendor-prefixes: Add HiBy
Date: Mon,  9 Nov 2026 18:46:36 +0100
Message-ID: <20261109174640.96951-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109174640.96951-1-olivier@mgcrea.io>
References: <20261109174640.96951-1-olivier@mgcrea.io>
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

HiBy makes digital audio players, among them the R1.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 7602034374d7..0bbab57d6c25 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -732,6 +732,8 @@ patternProperties:
     description: HEAD acoustics
   "^hechuang,.*":
     description: Shenzhen Hechuang Intelligent Co.
+  "^hiby,.*":
+    description: Guangzhou HiBy Technology Co., Ltd.
   "^hideep,.*":
     description: HiDeep Inc.
   "^himax,.*":
-- 
2.39.5

