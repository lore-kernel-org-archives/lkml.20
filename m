Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299909;
	b=W6g7a2/58/RuBEfoylBhz1D2b/61MIbqZNSd5rOc1Ll0D5W/jFJnMFuKHoWL1oqNlYZI
	 uPbplM++Fwhlp1XuNvoetXTdZYf6H0HIkrtsxYHMrBg66Lv4k/xOb7UYwO2M1xXWxyOMq
	 KdKi0bFq5glp4H/xmI9SrHDjomymFv66ydAeiqMo3uYi0TkmRi2I5om4U6eX4bx5qU41Y
	 /wZCQUkZ/hs52khY63T4l0f7xCQQNhi+hD/XWTzWJsTuZOcaiTy0rn5gpuMeT/o6QhThF
	 LvzhV8WfDxKSz/OZ37Wq19R8bNpJtBKql2uT2KqautgHVXwgy93BHK+vW0f3F7ZIlWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=GWMxi99EI1/rh+WLLJC5B+V1WHZ8pLpiyq7ZBqK3M7E=;
	b=TE0lDArYTcGiySnaS9aDsJK7h/qXEBNY5ufB5gmUDp443PuC2czdU/Yxzhrj+tCwPbHY
	 zuTAqwISdjmX+oI5GBB/y7G1PoTssoT5dFM58yUzzcmFZ2fPyfpAk8H8PdQbYIZ1sLI8x
	 +CgGfz5c1TRj0WSD/PngJ/1myOO2MSpjZk2nNC1lDX0tdvUiBSoROizwPQZmVyJDCTBSp
	 szb9W77FZQlDbKROuVAYZzw+gEmd1hyQoVe5QhranQldzvLUgAn/Exjf+psmAIdD7RHBI
	 Llkf1w3ZRtwhquA6nJEycgj4LUoU0dr3ZLHuVmi0RNWpgh2BFJsUKrPIhppoVJpJqAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rj3xUhgH;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117B4606A334
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 117B4606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rj3xUhgH
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so1330887b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794299908; x=1794904708; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GWMxi99EI1/rh+WLLJC5B+V1WHZ8pLpiyq7ZBqK3M7E=;
        b=Rj3xUhgHX8/hIDcBwsM6tDvaceP7eAdXFVtO5ZLJJY3jxpLi0FFfuGgZcsXd+2q5bu
         VA7s6XdIktWwS/zpsUETFMfGZK4jdsTZfrzZ0AaVBIq0d4FUC0DUPLmPjayAfRGNjkz/
         c90xln9t4vb9MspNqc8UWcgq2eajtcXDdG7P9ot92ssnEiKWMP14GRh0kW9KX4lNck5l
         Hbk/aTqE+OE9zQU/FJ5fuXiYUOYD+olUDdRfAEBXw6quXFEOFuwBnRNZkzcjljbMgRCR
         lOBTQd6Q69lk9C8sQWnOIyvZj42TmtBwytvetRESKT/oK1/gSu/d32aENsINwEOO/FRv
         NHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794299908; x=1794904708;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GWMxi99EI1/rh+WLLJC5B+V1WHZ8pLpiyq7ZBqK3M7E=;
        b=F5N7TH+s58H1dlYw6LiFb8YBUjw0zOgY4ZOYOg2QD8ak6t5eUV8r9PHLkNszcbyCVI
         Nxw2KkjAyV9emQWuPXri5bU0qPbmYIGVtw+oqctP1iJb3WyllaHblArihu9W1GF69+j8
         zvw3rHb26E/bIZhkrWYUUHz2pn0gabTar51ZkyHGeMEBNAHXdxuuuswl2o6Hoei43MKI
         65LQRzZFvqT7cxrM2uQpYXRW8s3sdUd1Q+znuimUTS2S5iMZohAvkTyqwzTAa6fPRegz
         C9djM1HuK5QM4q7H3Gxum9bBwrsNfpPIV/Ow3Kyl/+k2sZoe7zkbCtyeNEKKdcXF/bB2
         yi4Q==
X-Forwarded-Encrypted: i=1; AL+hErEdSclVRtblkVsJhgMYNo41TSNl9UEXi6wqtewSBP/X8bT6LTfxvc21tAExjpG2TkFkh7p+uUQ/brxXPr0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eUYdkGB10N0NK2Pyrc6Y9lZuZOnW0iwji+++gYL9tPysCfnrn
	cQs5n0+x40V3JkXKidsnxOnyYN3LwkKFngYghFKbQCy1qV2dT4nIAkiZ
X-Gm-Gg: AYBFou1A6fyndLN4wbzyrcf0l9gKL0TZyCud2gSNQ8xW3eJX8UIkiPlWClfdLtxYqnY
	ZnZAjADGvo8ppMKlRCIhz/Ppf6W7wctdL6IrLAx6insF/KbufmcBzFTttMMVtUdO7ILe1f6Ivrp
	YUF59xHlHEQpx2LCmAyJCsQGqm/SVsYy8fS0y/4tOoSpaBhwfMAr4+en2tYtZ9M/eecxnluFcED
	FRRlE6pf+MRGR5FTrsYAYMc/CWSHpbs67PI8d+3uEwWO6r9fN4hmg41nlW4hU9RtPR0QdGsDoLf
	wGZr5U0LerKE00V4LrB/dUFVRhdvFD5Jskcwh0243CS6MkwWECAgVcIk86+AaBx1aKx94GqlA3l
	LdmAqmN/LC3WNxyhvU48vYE9abBNaQLfW6Qka96sgCzNy20BGT57Nf5ByKf+bkCBb7BQI3PDCsF
	iLTeUS8U2SkvLDb0qQJDuODp+uH0Evzl/4EbuK79XTp9H/LtY9bHrJxE2lsE0l89pzV4HCAGCJe
	PGqUMRpgIjIv/kbowtVX16yRo1mcq8B1YYxHJrWZJKJai9t5S7qZNmRB1k7aAgoSEv29TzqO51F
	EoH0yyhywe8Ccy7rk2Gz2966hm7i3RPEDkIsi/Zlp9d0jxyX0DooIs6KWeDbyxabrIxm
X-Received: by 2002:a05:6a00:4507:b0:89e:9c7e:fd5e with SMTP id d2e1a72fcca58-8ba860d431bmr2106680b3a.9.1794299908192;
        Tue, 10 Nov 2026 00:38:28 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa1b28d9sm628165b3a.18.2026.11.10.00.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:38:27 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Tue, 10 Nov 2026 16:42:59 +0800
Subject: [PATCH] dt-bindings: iio: adc: lltc,ltc2497: Make vref-supply
 optional for LTC2305/LTC2309
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
Message-Id: <20261110-ltc2497-vref-optional-v1-1-35c9657f3c0f@gmail.com>
X-B4-Tracking: v=1; b=H4sIABLZ8moC/x2MSwqAMAwFryJZG+gnKHoVceEnakBsaUUE8e4Gl
 8ObNw9kTsIZ2uKBxJdkCYeCLQuYtuFYGWVWBmdcZa01uJ+To6bGK/GCIZ7qDzvSuHiaq9F7Q6D
 fqKvcf7fr3/cD4lxAemcAAAA=
X-Change-ID: 20261110-ltc2497-vref-optional-4bf34d6b3304
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Beguin <liambeguin@gmail.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>, linux@analog.com, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1948;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=mFMj3f//Gs56CTuMwMEdVyCw7B32N986wH/eEQpIYL0=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq8tkU0h+F6hQKFY3u8YXVOAq0gB3L2FY0h/K0/
 KgCl3tJ+sOJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCavLZFAAKCRClg0K3CVbE
 gZxJB/4i9PB81n6Vgx4KImpgzWc++mn0PrAKmhxfzTkct7MNhnqrt7cghjzssGwnkyQCJ87xxyU
 U0PGiAlm/85L3F2PWr98EK702yrnQBKv4T2c0oyhzcrfrfL+noDI47fE2Zq/zk2JgkHEU9rIwf3
 JtWqxBzLln8SVeHkmiOLiYPAik3ZvYAZIsE6HNGJzCi4UtKpcFuuT45BVPwIFmWsrx/a6rHNw4X
 Y19kDF7D4Q/BzieWm+3PW3Xv/l/S9LZi8UWQuUXS1e60O+hYNVkvz0WUSZ0hAErUdpgQ9fDaHsB
 hlfEG0GWiRwqsmiUOugUmwNNSIbHTOraH49ozgeJn0fhTSb4
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

The LTC2305 and LTC2309 have an internal 4.096V reference, so their REF
pin does not need to be driven by an external supply. The LTC2497 and
LTC2499 have no internal reference and require one.

Only require vref-supply for the LTC2497 and LTC2499, so boards using
the internal reference can be described without a dummy regulator.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
The ltc2309 driver already uses the internal reference when vref-supply
is absent. This is needed by the Meta Ventura2 BMC devicetree, which
describes LTC2305 ADCs that use their internal reference:
https://lore.kernel.org/all/20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com/
---
 .../devicetree/bindings/iio/adc/lltc,ltc2497.yaml      | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/lltc,ltc2497.yaml b/Documentation/devicetree/bindings/iio/adc/lltc,ltc2497.yaml
index 4df5aadd1e1d..22abc6885b5a 100644
--- a/Documentation/devicetree/bindings/iio/adc/lltc,ltc2497.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/lltc,ltc2497.yaml
@@ -47,14 +47,28 @@ properties:
       - lltc,ltc2499
 
   reg: true
-  vref-supply: true
+  vref-supply:
+    description:
+      Reference voltage supply. The LTC2305 and LTC2309 have an internal
+      4.096V reference which is used when this property is absent.
   "#io-channel-cells":
     const: 1
 
 required:
   - compatible
   - reg
-  - vref-supply
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - lltc,ltc2497
+              - lltc,ltc2499
+    then:
+      required:
+        - vref-supply
 
 additionalProperties: false
 

---
base-commit: 1390ca4953a7400ca932cb49635f02c727f885a6
change-id: 20261110-ltc2497-vref-optional-4bf34d6b3304

Best regards,
-- 
Kyle Hsieh <kylehsieh1995@gmail.com>

