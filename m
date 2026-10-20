Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501806;
	b=AYATJSaIQ5w+zDo+WKj4xR38FqoxkxGE/E6PWKMsQ/EerdLP9uiF5P7smTPxKa5RFA4T
	 w6kjfXsEh3bw+vn6aiDyGZsyQTiEmHj/JeR+RwIXYeu6XkwYvf9uJv0WqwlzRXVZUaxL3
	 JUrehz7CAXEqWkjxx0QWca/9rLS8/OUmi2N4kIS9rwt8qmWJKYAmrq1tKUVFLZp7asHbC
	 Oekoaw00MGhhSuQGn2jcVlATdtDdW3V4sFyY+PR+lZ2yml4Vl8ybj7kTh4kHbgduN1cXd
	 0pqrB0jrMD+zkHvJWDGDd0DTgy9uCzkUt6D0MH8lBe3oIbjEmFwuwsKK9QJ38mEIHjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rli4VgxJjcOffz1T4VqacG0mFNteJvCejK8yAgJ1Be4=;
	b=q9Ls+k4FBTPWTYglM6V+gJpzY7xuOdZdMsIr2TG+LOirhe+NQh+AnOT57QIM+cO4FBm7
	 WxNC5uAZ1zKU1RjunBavp5sKye9wC57M/orPwni7JKXrpmN1cbR35gBEqTNB7MQznXXu3
	 W3SzAemuamOUBXCLreDicmswbAGZJch3Pj78NutkGz0LObGgEqwbuAePz2r/sQwVjoCGa
	 rjA6i6lRcMf3CJPZHQ4o9CLv+6Jc55ticjmm2E38t3nOmB7SgnlKkv6Vchv2fxUUmj/n5
	 4tYHmj18wBpJHHVrQnTa7C/8GEuc/jmIpY/62zNZI3YQZxbJiUQRXO22VouKIJaiH2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sqNz7Zsr;
	arc=none smtp.remote-ip=74.125.227.128
Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338AF606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 338AF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sqNz7Zsr
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-3a476ee8669so900168a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501805; x=1793106605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rli4VgxJjcOffz1T4VqacG0mFNteJvCejK8yAgJ1Be4=;
        b=sqNz7Zsrxd55uG/B6us92Pw/TLQNulXvvIfer/shQmXOMbcyz36wr0dN0EplY99W0q
         ZBmeLwHr3bInkhrOVWq1KxTwQ/srXxN59IZu9Gwpnl6kHqEmZl1m6/MgNeCJXEvj4DGS
         6pcJlbNfVlahs0Lq0369ogt+7Enxqbf372/QJxzPc+S3lly+6yZT8/XbjlTA1i2IigQC
         YF7XJPpMjF9JCBvom98uE2OP7xuvkVb8M0e94VAb8lbZlscxZybA63sP0fUHCniNPw/I
         CMcCuE9GlrEyxE6iZnQe4BQHeYaDbMtwm09zayCj9o5/3vZvtsNfaK59P4/mZxGDtGhc
         9HJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501805; x=1793106605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rli4VgxJjcOffz1T4VqacG0mFNteJvCejK8yAgJ1Be4=;
        b=2xgYuak6ZeV0zzKzwV7o1zKI7KneNS4F1xJxIzZ1bHe99bO3w7r/T9TwFzM+yQixVK
         2sN3eu3UFh0fBWPGNNUVOM2jqE4gnV4hqvvzLcaZIS/Xju1OMtblbwsJHxVuGHPt2m5l
         JaoKCF5ipgNlvIAeMXukmsFZ8JGbYE8QPFiew9ivtn8sWq7CqCGjvF9Db1I2lEBLBDoi
         ZeB1wvrPYXiq4BN7acri38baXxGTEWpCHDIDY9MbyMrXeg8Mdi7YpGpKr2K/jeHw2uYP
         CYib+0dWdT/hB6Y4fi+PPr/9B6syE6HT55edc2JFVW0BT+lZW+4JKeOX7GFWNVGgLqiG
         hgJA==
X-Forwarded-Encrypted: i=1; AKwUvBw7unDYWWTbIfbSvh50G787AiXhQLwDD7CQn0ORL9lBX2crWgqox3Gr0TlSjj1WovHwOtfXiI5kBajmHms=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTJBhyycwSI1uM3o4VVW8Mx40z7tEyJjS9/W703P6gVtbokDCD
	907vnlMFriazsBp6d/7SkgNyT3pnuCykGpaIa0uQ51LB08Et8VJ4+yEQ
X-Gm-Gg: AYBFou12VRkjYJEau+BJGiOw547eKxMCtdQTwhTLgolCvdMawhjPjpyvj8IQS0QZCTQ
	aMwtKlHOu/u7mqeD+h5nPeTV31Cf7iPLP1VxsxXI1Dbs1sJaNd7T/iyMMyObyZTxM7kSmvgekSf
	Xjo5dfAOTFQQzQOH7nvAkZHONMer2/m6qH0y61YyEokdc9u6NNQaPFzeRo6NK3aPUMXO37XBjWD
	OnfglQqi109KBP0XMeHkGwynvScFM0Z1gePI5vl0vtxXUVbGNUgXWT2w9gV3yOUZ3442zoejoLd
	aj4btjjxz/szjig+yAg2qI0N1GA8FhfnaD9pcbXNQVZbCvmA0y8kYzfT2sUj9dwjY3i4P2QEKtk
	VJM1XcZmVQcjiU0qnbOJ/5GfiOYYUaX+zieY1mzdwnPvs9D6MRsrfcHtsCCgRCZtNOHBk10QHTO
	GzncFbOoeErtN/ylmCvHyjmkWn9kanRPfMfTaAa9gEl2ygt7xwSZJc75k=
X-Received: by 2002:a17:90a:d010:b0:3aa:ff61:9504 with SMTP id 98e67ed59e1d1-3acef134b64mr9027170a91.20.1792501804482;
        Tue, 20 Oct 2026 06:10:04 -0700 (PDT)
Received: from Linux-PC ([2a09:bac1:1980:20::1d3:a8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3cc73c7sm10131496a91.4.2026.10.20.06.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:10:03 -0700 (PDT)
From: tianshi12127 <tianshi12127@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	Lu Chen <tianshi12127@gmail.com>
Subject: [PATCH v3 0/3] drm/panel: Add Smartisan TD4362 panel support
Date: Tue, 20 Oct 2026 21:09:31 +0800
Message-ID: <20261020130934.2289011-1-tianshi12127@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261017083531.766557-1-tianshi12127@gmail.com>
References: <20261017083531.766557-1-tianshi12127@gmail.com>
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

From: Lu Chen <tianshi12127@gmail.com>

This series adds support for the Smartisan TD4362, a 1080x2242
command mode DSI panel found in the Smartisan R1 (trident)
smartphone.

The initialization and power sequences were converted from the
downstream device tree with linux-mdss-dsi-panel-driver-generator,
and the driver was tested on a Smartisan R1 (trident).

Patch 1 adds the "smartisan" vendor prefix, patch 2 documents the
panel binding, and patch 3 adds the DRM panel driver itself.

Changes in v2:
- rename lab-supply/ibb-supply to vsp-supply/vsn-supply (per review)

Changes in v3:
- drop <linux/mod_devicetable.h>, drm_mipi_dsi.h already provides
  of_device_id (per Uwe)
- carry review tags from Krzysztof and Conor

Lu Chen (3):
  dt-bindings: vendor-prefixes: add smartisan
  dt-bindings: display: panel: add Smartisan TD4362
  drm/panel: add driver for Smartisan TD4362

 .../display/panel/smartisan,td4362.yaml       |  75 +++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/gpu/drm/panel/Kconfig                 |  13 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-smartisan-td4362.c    | 262 ++++++++++++++++++
 5 files changed, 353 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/smartisan,td4362.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-smartisan-td4362.c

-- 
2.56.0

