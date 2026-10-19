Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9B1487CC3
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398989; cv=none; b=rAIi3BEw9pzOhAtpeYPqZtDEwGkQQ1Vu9jvChdJAJ6uvALA58ygk0ZWom53NGx2KZPppAsiTp4Tkt8/ic/LOPhPZeWmRYxeGJxb9ajR+00B/EcuIbVDmJ8FEh3e13ivkVVuA/mZcBTFK476kuDTm4KElr2jxO7l+6BsihakyBWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398989; c=relaxed/simple;
	bh=d+2CDp1jet7eKB3vRWlqv+IkY6TyHU2QZVehe24BODA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m21NB/giYk+ykMOuRiiC6DSZSq11bb3GilKMeeGKrwrrMxVoaKshXxnysKW4tQZXvDc6i6VWhQBLHGYWQZ5/J2WP3ds2m8/VPQYH+o1QmfzqKz7rC3g1W5LVUjQqsAVnGoWdr+JVS4QM0NEl3hvgjWLFKRloib6tSwTfD662PJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UaxISxEP; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UaxISxEP"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c445c95d553so64353966b.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792398986; x=1793003786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RwY9VfyV3uydu5UUW7T5oMK7v8+2fcAFPimmhllZwag=;
        b=UaxISxEPIxNXzoTTdWGeAy4YG8wqaWUEHjpgXbSy8ZDzFbZiBNMZGgdkq/+RjoEptg
         0qY5Mm5lfzZIaZdTTDhAlJ0JdNpwMtnPHNrgw0u4pNBcSZqjJle+XyhUZyBDGJuF2oHD
         emNfHGRA5/M3FLs5a69XEdrGqsafp++emNzTFeB23XRcTKNKSA3GcKZYJZSCLKLwviVi
         TCZKTKBivVRRDccQUvs/yuv11KCVZwKazDuJhL9FWV0aTHjO5sh+zWg3Zl9yQ7vQUEhG
         oECvyhd7RWO+SWm1s4axRuEw3Y5Qyl8W0vwlonsaGHqVDpaLcmeqhA42C6IgRtXwe+Fb
         xVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792398986; x=1793003786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RwY9VfyV3uydu5UUW7T5oMK7v8+2fcAFPimmhllZwag=;
        b=hguPf1NxH9WA3YNjhU8/g/9nK70BVkbq7/PiXffDQkM13GOACPfw9a/hqTLlrUZuZ/
         fs6fUzLx9xX9IwxcKNdiyxNhZ/aJcqfB1SA2jm86Q/wIzp07j5UlKH/vJ+WCbwmTGY6p
         fCJgmj2bDpmd3dbrKwK4Hd8OSsx2j4ZSeMzmVcOZh0ul5+Mw18x95G15/Bfp7EpAs7rm
         03Ia/gjOl+ReMlF1hw1FNdkfzGH/lssoUDFuKfES+wvhDHjHPfh98aH8DjBpi9YYqtRD
         kxiWOeuU1163Mo7QD9TAApussTuq6Wiv2dgT8QxhkxvXINe4giOqdBrVZjk5INMhNpMK
         xYeQ==
X-Forwarded-Encrypted: i=1; AKwUvBznxeQHhlc8rOZiJZpUtRjHBw9kJdjtGT1n9qKgnsXsk8v/COTkopInQ6+DJTADwP47UwcH98g1kpG811A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJczIRpvt8Q0ci7m9aRjFAAzHOlTH3m1ajTgvbBCElYleptRAug
	eXXUEahcumvbbd+kg13R1Cqz+MSAWT7JNLjrL6V857UgfFN1bShB39ng
X-Gm-Gg: AYBFou3WKdWNb0bNmQvaV3d7E7PEN3/a9mxDUmWAM9hOjvgT0dHfRFQFJWwIADjB46C
	y+Sf1hd5dwis8gh+ksjT82CZrw8TBm0RU/pi6cJjycglinS2L+9LhK1VXNXMF9Qcxr2WdkmomsQ
	Qeq23W2yJbq6H5YrHxy2Vr1rWrhdvnfw7bEhYtFnFkS3IjtmwQBVIT9QHgPAXI1WFu1ivVXkMxZ
	bXTCFK0whDliInZi4cHrKZFFzmsv9rOhj/TeM/gDXeHXMSNe4Mg0Pr1yErmOrDoXpWguIPOlKK6
	de9I7WsTZCiF0XYQyiFfdZRGXkUL1kLE6AnzdIZffX7DPCRDOea3NIiP3uzPPLVWuugsvEspB0Q
	RkL0kUAoOlf641Dool5unffYkVpK7WGxmslrnoqesWwRqhehS/TIbsrDR+7L5wiOrfSSGvJ/8ys
	xf94p7Ls50irrmfulwiobFM0Ra9hWA+L7b2RdWyPG2HuXbPIGhWfLOmsnzA8kBKxb5fCTL/RYLY
	uhcJW3qE0pYegoEudZCNAl93SV3rRwoZfLefaw83/PwWIWZGqz21+seWPOSyMWaHa0yBKe12hvi
	203iRG9lSx0K0tRC5gzfTABhLnk=
X-Received: by 2002:a17:907:9494:b0:c35:d50a:1352 with SMTP id a640c23a62f3a-c419d34f678mr466740366b.11.1792398985661;
        Mon, 19 Oct 2026 01:36:25 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf98fsm323106966b.13.2026.10.19.01.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:36:25 -0700 (PDT)
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/5] dt-bindings: vendor-prefixes: Add ZillTek Technology
Date: Mon, 19 Oct 2026 11:36:16 +0300
Message-ID: <20261019083620.1285782-2-paulius.zaleckas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019083620.1285782-1-paulius.zaleckas@gmail.com>
References: <20261019083620.1285782-1-paulius.zaleckas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ZillTek Technology Corp. (Hsinchu, Taiwan) makes MEMS microphones and
barometric pressure sensors such as the ZTS8032.

Link: https://www.zilltek.com/
Assisted-by: LLM
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 0ec4e481c64b..1d0ef2d7826f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1979,6 +1979,8 @@ patternProperties:
     description: Shenzhen Zidoo Technology Co., Ltd.
   "^zii,.*":
     description: Zodiac Inflight Innovations
+  "^zilltek,.*":
+    description: ZillTek Technology Corp.
   "^zinitix,.*":
     description: Zinitix Co., Ltd
   "^zkmagic,.*":
-- 
2.55.0

