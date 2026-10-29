Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793307520;
	b=FJVH3Yof92RKC0nNYz412EpNxsZyl9uSgOSip8Kwe+pQRsrsf4hZ2c7KDlWyew5n9CwG
	 ZOWjXhWRUko5cXqqLdin0w/H9UD9G3YLlF9e+1gT3qJMB6RIWFod79CnfRfdbu3NY2uaU
	 OZROFrsuAzgZ0RUbyeqoSH5WiSs4msoMAw1FvWK1HnnyXuSpxqmZFi3eSshmFEMG/ZAsj
	 kG7It7+Ia/5SvqlIxg6aRS/Lx3YxxBiQ1YF7D6QLNZFiwX1vUQlc6zb+HDhZkQuLKsuHF
	 3AEZZJDJp4YDCcN0DKrurTkOO9JmgCk3mm99H/QnRV+CHyjdH1z1e5RR0+f95Lb+Kjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793307520;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DqR3VaUxV5ZL1mlLLS8dI5+d5I/tI6arVdpvogwVwQc=;
	b=ktqYGAi2zM/kN93KQ1S2shg7U4ZC80Yy5XAXCKhPR5Bz/M58mEuJVi5LysSizyZ6Ai4W
	 Epkz7t1SJTGx2UT+2E4fiKdMojHjmvvmViN+sNuwxqo5S/xALNCkPiH8owu9uJn/Kjymk
	 KmYvJcIUzaTYgFe8VZJQLJpytxBOtlDu/ohrfnAcK0fyNLkkDKHr+xUBA7CusjbSg9wV/
	 FqNhpEAHnPHZ2nZbUBTbd0xJYvFpJdI4SULL1z7F74Z0fuU9VZmikqFGQeYInSl2ydBBa
	 Z/bRF2vUmhL5dA3uCOMFkDWSaN2jWrgMgVgCS7/JzPfUgGQlcpluKwvo6RgjLofDsog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WiDYzNkZ;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFADA606A323
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFADA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WiDYzNkZ
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-917a707f37eso681006d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793307519; x=1793912319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DqR3VaUxV5ZL1mlLLS8dI5+d5I/tI6arVdpvogwVwQc=;
        b=WiDYzNkZjYE8JPyIxV4QK5mnAsTJmlWSi23JOYTqh3HCEPY941Gwh6yzoOURamYqBP
         fKwTX+cx1sDQYY0GHSjEghju02hSanl1aJNgI+SSiT9+fX2hqKuMnrgLroO1mLuLjAiX
         goNKarXR2TKGnoPbI5EfOyI/KcKiw/3A5CpYVdaO+1I3rA5mx1MUzFDxJAGC9o4f4Rjn
         HTNUqgP2IrWrF6kMZSi5pyXMRGZIpowU4Bk/eZg1d7bjtGFHgHI83fhGmt9RcOTRBaE8
         VpdNang7zhdmsp88BV/TqWrNKSiMAeRxcV6YsFt/KULEyFuxCJgviOBxVjyVchaTpUOh
         qEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793307519; x=1793912319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DqR3VaUxV5ZL1mlLLS8dI5+d5I/tI6arVdpvogwVwQc=;
        b=2pIHZbhhAepGiW3oR1x2LD3HkEOKnGRjJKxr6YnKCymqSYmOp2gUVB178nC0/CWqWx
         IPLEppuZONLyFlVuG2wFTLHQnYHqXCAj5CFRBNVysEur+5lgx7s1FcbgExEVmip6j3Oc
         lpbFtzbrrPJeg3ZQ30zbdCFFxGfMXNluHt0+KzP/rHtzEfPoGLHHMhaFh+gVH4WNCyqg
         0Kv124fVhxbFacPStP9dLJCQvFMqyKjsxbiaGk2wRRIYwZtAet7qyHND+G0ed059WnMJ
         PMdpYbMprCowYrO8ohcQLUSfOo0WDg3RhR6WISpr0Fp1n6dpgKxlgEsbAkrxP1RcokpS
         9c/g==
X-Forwarded-Encrypted: i=1; AKwUvBxuLZRBJUue2GEkeXCl9ueOt26LnH17gst69PyFtrgle4tTqjaRvWvob3FEbLarH9hl8/SETbVD4DHxzd0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5zLQtRtbGop23OsTMCA6c77TewOVqgny9rnbNr2I7qrQQ6HQG
	NHWRJxU9DZVgwh+WHKshlUYMvaB1TY/CbCSE0OOZ+EVLQ37e9BFJ5UkX
X-Gm-Gg: AYBFou2RXZtIxNCz+3FuuBr4eR2qJ1OuK17F7Ct1A5b0/yFsRfGqQWF5eoxOLz+/ead
	6TEXr2/5zDyzkSFeC+4llZi4yhm9+7FmAOlJIrhSyIEbVEPxQko7FkQ11QBVbKY5MuVrcE+UEyf
	We07NU3XTU7NxgQpQLOLnKyOQ36tgDYF8nrPlPA57AaIOBLt6nsCBGBGRw/DB7xvH+6BiKa5FBs
	/RfrvIDwBo1paGdHwD50WMdjcKrx2zc4ubpH8K31Otmwicmz+VLPHQCR+ZL+w/KTp3eUw3n/G70
	lqdM+ysClR2tI2a9MBhk6laDeS63Kp3XiV+vELYZfD1mc1edm2TgiwBP8c5PrrJ+QLiRoCfUxkS
	IdNwUNOTQtbPYqvlYg+Jqvh4HBwOgpHccKKK2W3QFEjn/t9p1m1YS/IU4qfgOHR3CCO1/cf9mr9
	Atp5Dbz6U7OkgopvX1kDdNp7/cTAn7V2Q3lpXilLuHFm6Mfjd8ilR7dHKA0WsXI3Ut6Had8qEVp
	JnPO7eC9HFCkUK5dm8PDkjRd/X22jXSTe9qGfBBO+m4SI+sxewYgknpu4rJJXI/eiiwQISBvIJv
	lBwiWkt4X8JJg6WQXTGHGr/0+Pf9kXdXYvCg7dMuOjQ0QUw=
X-Received: by 2002:a05:6214:3212:b0:917:8ea8:cf48 with SMTP id 6a1803df08f44-91ca4ae7fd3mr2661636d6.11.1793307518784;
        Thu, 29 Oct 2026 13:58:38 -0700 (PDT)
Received: from holowork.tail3176d.ts.net ([71.104.86.121])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca31032c9sm6006136d6.21.2026.10.29.13.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:58:37 -0700 (PDT)
From: Fabio Piparo <holofermes@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amit Barzilai <amit.barzilai22@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabio Piparo <holofermes@gmail.com>
Subject: [PATCH 1/2] dt-bindings: display: solomon,ssd132x: Add col-offset and dclk properties for the SSD1322
Date: Thu, 29 Oct 2026 16:57:50 -0400
Message-ID: <20261029205751.3513474-2-holofermes@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029205751.3513474-1-holofermes@gmail.com>
References: <20261029205751.3513474-1-holofermes@gmail.com>
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

Add solomon,col-offset, solomon,dclk-div and solomon,dclk-frq for the
SSD1322, to set where the panel sits in the controller's columns and
the panel's refresh rate. On the SSD1322 the clock divisor is a power
of two, from 1 to 1024.

Assisted-by: LLM
Signed-off-by: Fabio Piparo <holofermes@gmail.com>
---
 .../bindings/display/solomon,ssd132x.yaml     | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml b/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
index dd7939989cf..6c7830af0e5 100644
--- a/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
+++ b/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
@@ -16,6 +16,29 @@ properties:
       - solomon,ssd1325
       - solomon,ssd1327
 
+  solomon,col-offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 119
+    default: 0
+    description:
+      Offset of columns that the screen is mapped to, in units of four
+      pixels.
+
+  solomon,dclk-div:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024]
+    default: 2
+    description:
+      Clock divisor.
+
+  solomon,dclk-frq:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 15
+    default: 9
+    description:
+      Clock frequency, higher value means higher frequency.
+
 required:
   - compatible
   - reg
@@ -46,6 +69,9 @@ allOf:
           default: 128
         solomon,height:
           default: 80
+        solomon,col-offset: false
+        solomon,dclk-div: false
+        solomon,dclk-frq: false
 
   - if:
       properties:
@@ -58,6 +84,9 @@ allOf:
           default: 128
         solomon,height:
           default: 128
+        solomon,col-offset: false
+        solomon,dclk-div: false
+        solomon,dclk-frq: false
 
 unevaluatedProperties: false
 
-- 
2.53.0

