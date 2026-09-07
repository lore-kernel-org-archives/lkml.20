Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725CE4FECD7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794593; cv=none; b=ZzJDwbmSE4l2OzXsyMOxA+0My3DiHnJTcwSwZ/+FbZhQ/aLIvj5YYzq6bVzXU+FSdPEx+mFoBX3zypjuttyoSp/vujU0uPaG7VdkEclJf90htU9uGIVjrbzzgTls6Hj/XRQum6+iKJn9yj4tgGG54B4yzf1X4byslCR6rr9juyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794593; c=relaxed/simple;
	bh=rRqt2DkRwkgR8tWQwQ/ymaqvmLFKJ2cuYcMhprDy/xg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RDFUP66nCi+AehrXxysUdPTNFgcz8YweAfhIb/Mr54Em3uCEre/kbWBSvGeeG2bEyBof9ocMGjZ5nzlFjpKBOejtdgKhbFrM7vdf5B2HnEJDjnDTkXLK7JhzsiqJz78/ERn25XzJIEyGTIxQDyel1jPG76tl0esgR5kIG0hQGjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D6QjMjbR; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D6QjMjbR"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso34966025e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788794590; x=1789399390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LGXRLOWBLjDeRkzuVxlsTvsrgZVPRLz7bQm8bEcHaDA=;
        b=D6QjMjbRdcBVAavHOtnn8BrmBzuj7cJXHuTatURtV7qyXHGgecRMEUELQnaJR5SE+3
         ckmQUo+otiY6YfzQjb56m/tc3Ysi6WFVII8eedNuibGMrf+0If+AwJPhoOKaJjCG0vMF
         mRDFkQ2llRF7e2JJ/r53ZqpmnW/ABsU8TFhPYgu/8kGt/yj0vCIT69mPDrYgAPIN3d3l
         UL0CgmTgZSxQzpnJwYldm+dxa/rptcncuqPn8zkUa5QxbSBLTeZLACugsndGwehUgIuc
         olwzvnwJfpJ18Q34Grf42Q/bOvLttQwKeLfvRZI3te8L3Q/ugpgDHyQErE58bAmPlrMH
         D8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794590; x=1789399390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LGXRLOWBLjDeRkzuVxlsTvsrgZVPRLz7bQm8bEcHaDA=;
        b=IDTxcfJB2W114mXAlAE/03lL9YNstrsrKlLnN7iqrysa/pHjC16qekDygsm3uSN3NZ
         Bfqq/14ZTsy/9zTgmC9/7gp2dJQ1HMHW0fGelKcbtNiq/ZFE9nL0f9o36HQJOzlxn61L
         B2D4+7oSK2qaV0msJTQ5WTXGF1frDCklwOD94oEhqnKJMHa5njDdO0gkz3jg77CTP7ls
         xyzVaJWP3c+Qv5gUBXOn2whHPanS7R46RbIUlW7/RlFSSVLZd5jfRRCtpnq8OV7W/r4X
         AZ1gNYQO6M1NfGVSAy/07KzBU7nvyAZkEBxYKOHtA1YDhtvamyNbhRyq9iYvXSrfkIKr
         FROQ==
X-Forwarded-Encrypted: i=1; AKwUvBygw+TjRlyDwWNeIHTJLlUzGkvAcoEfAEwnX2lysCaWKt9i++UiiyXtZ6LsSJigcxfwh+D0VzG5ZlYMvCw=@vger.kernel.org
X-Gm-Message-State: AFuF++m8R0g5BmTvp33ZeMi8C4rlKKpeNwip/UvAda7dp0VxyDBc6rGU
	yvMo3eGEFCBHgryGfSC+T/OCgKp+9rYANh7a9sQ/9eE84V6qM4dCK93L
X-Gm-Gg: AYBFou1Ohm6YS3sP6M/ZoH4x3MzhjQ/GR5NHH6VqxVFtzzBOvruT2UGBE3UUrYJflRf
	wFxCYtwx/n8q8kGR3s4HFT+jFdpyVZUIvGWYjx/UDVlGwrPzAEvM9XVmtM67PBujhwLJIKCG1h2
	6KwyGUwowxlAmEn9yhLX/qsuT+aKu2FQahxxpFCI0+iX8QDelJKtDq1spl+UTWbEKlHP6upkEjh
	EIlS2A4PA5vbZS4UDHrrk8QeH6Aem81ZmDXJb01Mer9nlI71QMsDruJw5MZSY2oVOt/6VyJM2T0
	3ubAjJtFok5XDeNxLbESqHLkOAORQpeHzZxiYtdzaoFD6cQ9x0wJ+UysXzDlfhwZtzI97THQrgf
	ljSXMl0wQns6QBKljV+3y8gLyjbMWLNWc2+mUyH5TH3NulkwKZOltaSqylN6magBJhrlc9oFQod
	o6lPQy7p4QbyXZhSu62Y2zTLGBcTkZcvlBApjG5D+uWJzxNNNi4+Iw1l6DE/1k819irC/3Ukr/e
	tIqnhIA7EVEf0G30sD3EiKM9uiGibaeyFCh8H/8HQ==
X-Received: by 2002:a05:600c:4e89:b0:49c:fa21:1c81 with SMTP id 5b1f17b1804b1-49cfa211d6bmr203694125e9.22.1788794589574;
        Mon, 07 Sep 2026 08:23:09 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.248.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f912esm413785375e9.4.2026.09.07.08.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:23:08 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: iio: adc: ti,ads1015: Add label property
Date: Mon,  7 Sep 2026 18:23:03 +0300
Message-ID: <20260907152304.4992-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for an optional label property per channel similar to other adc
chips. This allows assigning distinct names for each channel which can
match the schematic signal name.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml
index 718f633c6e04..777a75c21d7f 100644
--- a/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml
@@ -66,6 +66,11 @@ patternProperties:
           - minimum: 0
             maximum: 7
 
+      label:
+        $ref: /schemas/types.yaml#/definitions/string
+        description:
+          A descriptive name for this channel, like "vcc_ram" or "CH3".
+
       ti,gain:
         $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
@@ -125,6 +130,7 @@ examples:
                 reg = <4>;
                 ti,gain = <3>;
                 ti,datarate = <5>;
+                label = "CH3";
             };
         };
     };
-- 
2.34.1

