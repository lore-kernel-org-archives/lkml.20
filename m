Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470770;
	b=fLGoqHnofeca0WWlXuxEVEmQBjbvc64F415/iqmGAk3/TUOgNmKRSAm7du+wDUn0SfQU
	 a+GP8QaTi/HmyAsUqfVRd1Eij9NCV+6HCdcnAC6kw/tByIa6aE0LyZgHatdUCEKlFsRyC
	 lNb0rDsukVHOqninh0h9V0YFRKJm4o56loWYt4nroeAjiVdyH/SdkeVjpdNi00Vwtac54
	 paRKZaqtxNdue9/UHQ8ZSR+oW2KcS7CBYnf+RPKUZfzyfI98uU1jpIvlFgyS1cp7LH1cB
	 0/lBj+m46WyBIhqSu5fES2Q6v9bQ66AQ1J2AoBj9sEtKCyHuRosO4T0fPKQ6uq/IPYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gma6tEKKFClTNwQqyrudA9xAP8hDFuYrKZEMjTt+5oE=;
	b=se8GWqhakg5nTxX35A+6ni2N+BFnr4dFBgCKgMPdz475WPHQweE6rPLitmugtIBr3SKX
	 Hhv/82Ez0DCM4qWmiwF/R/O59QSMjV68XZkMV+YOavij1noeRcMX4ktSF615poiVNXYjM
	 kr4UKBpIiVbGrsTf+N/wQZRnZGybCiBX67pAyfWfcUFWN/PnaC3GwjHBDO5LoY/JdKIo6
	 JSovJ4VNFT3oho4BLUZ3MnX3IOpwpYOmvu0EdJr0sxZWyruf8po5gZ3/DIeZKSoC2cI4M
	 IxyyWHsmoLm6cDNpHJ7I/CzPLjsm4irTE97Sf2peoJNdndns5mF92xDzPJMWgZjtZhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KVaAVW+Q;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6741606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6741606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KVaAVW+Q
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso2274759a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794470769; x=1795075569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gma6tEKKFClTNwQqyrudA9xAP8hDFuYrKZEMjTt+5oE=;
        b=KVaAVW+QM8Qx3j8rarPWiwsJXaC2P/laffzehB8YUNEvHeldzttyvEEpnwiIasZZij
         d9C9jV/ULN17NwW3Vd7SzB7d85B3JweWpfMqgwkGZLiChDdlg1PZCOE7OwcU4bxkZgSS
         bA7zci8Rp2Uqz9suxo/viyCn+BATWcUxYE/Sv6U0AguJQ31sCKKfx/y6I1onYfjoesvy
         Wk3onyOhVjl7XlciOSFPuas+0kjJYJtip0a8uaTdkGMrcrbXaRAg58tjdyP3LHtrWHNu
         hddH0qGarYPjb/sJno/LE2qcOOkmmWXPr/MCsJQIKh9IT/g9WULFkKLiFPD7zgLx0c3D
         Ip3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470769; x=1795075569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gma6tEKKFClTNwQqyrudA9xAP8hDFuYrKZEMjTt+5oE=;
        b=cHpYqTEGvDOTm+enQmnGNMYXzcg0x88iLKfpuYTzfXb3Ac90onaEgjjOnmbv7NVFOM
         GnbEVBGSapIGyZ+F7LaQFHkbjU8009Jlq6TK9cZGK4P//5mtjNz6lTQQdCFVkEucsIfA
         KVnSNDPGxz+HtmWkUmnpmLtgzz4mNucj/VhREp6zNHzJS2luvh5axBdYIEirHVYqdvXa
         wZ5aUu/kBvit7LMnIGtkWEU2auYBhzsFRJy9oGbgg/Y3tyXPdl3gI81Ku/PNKbc5AS7d
         M4xvip5hzISfTCqVUfzCU721Xzv/AeSHLcW5Id7Zmge97k1IA+S3QCcBShWYJDCWZkU+
         D7bg==
X-Forwarded-Encrypted: i=1; AL+hErF95SffsK7UwiZUzhUit4XxiUcZl3/kU5axTQQD9gxbY8I3G4zMRVDRIGIye1Efz0Bz0H9bZBqC8RN8mnU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PH3I7k3hLV5Vra+Ex428VCX0AWiDFnw/+pfUUcbQ0SNkjVsHm
	O9qNYJmjl6s83FBFLFKeQFX8IxTUgoAC+m8VhjzvVWqmF8J6wlzRj1zt
X-Gm-Gg: AYBFou06+mHk0QKNwemfPeZx0GqpRkIwe/oa6sY8lLaStqEGGEk6yAfGmo0f2CTBe9G
	SnfbJxxoYRq194MqdZFAiWejSpNLpbJ/DVZarAgdtPIV9z4g+cXCTSbvcKnEe6BwCqM0Mt9tAVv
	xap3xcuVXohS0Ba61bSNGSP6UPEH0ZhxdUDNXPeZrj2bd4ZU+p7RKtvKVU+NE7UvUeoGsVduZh8
	JY7mHSTap0KWY8gI6tHQRkDctjxFaPcWEQ+OSwew6RMF0CLGaIKQmQcmvTShFxQ9Bn5IXGGVj11
	z2fDBtgyI6MMseNFaZRbOx9CU4BY7zXGAWKDrbtX168InRxgyvkN9S40+YvBeqkngysHD0OW855
	NBEcL5UPpBIuWbd5IXuixn7+qvnR1/7/aKlNOWinqVIDvqmKg9eyHxeTIrNnNwjtj/+M2oZ/pnN
	hRjHBZcT/TRb87LwpqB58TvDhUoLZs4bQ0f1pwXKD76yIOinIe6WgTO6EIzsQlpd3duoLO9IkvF
	SuDl6g5pnt19ngSFQYyjxu7Ru79tiNEbg7vICalqFr5KXegj0PwhrMXfIk/tvlJRt9t2MFimADK
	JpI6wTITjyDzrawVvo8FQnIkv+G6m4yelkqTEjI2UqEyVMTYnr4soWmj/s+I
X-Received: by 2002:a17:90a:e7cd:b0:3ad:6090:a189 with SMTP id 98e67ed59e1d1-3b182f93b3cmr4879918a91.45.1794470768965;
        Thu, 12 Nov 2026 00:06:08 -0800 (PST)
Received: from shaunak ([43.242.208.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce49d6sm3474383a91.4.2026.11.12.00.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:06:08 -0800 (PST)
From: Shaunak Datar <shaunakkdatar@gmail.com>
To: rafael@kernel.org
Cc: daniel.lezcano@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shaunak Datar <shaunakkdatar@gmail.com>
Subject: [PATCH v2] dt-bindings: thermal: marvell,kirkwood-thermal: Convert to DT Schema
Date: Thu, 12 Nov 2026 13:35:32 +0530
Message-ID: <20261112080532.30774-1-shaunakkdatar@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Convert the Kirkwood thermal binding from the legacy text format to YAML
schema to enable validation with dtbs_check.

Signed-off-by: Shaunak Datar <shaunakkdatar@gmail.com>
---
Changes in v2:
- Fix the maintainer property to use YAML array.
- Add the missing newline at the end of the file.
- Rename the schema to marvell,kirkwood-thermal.yaml to follow the vendor,device.yaml format.

 .../bindings/thermal/kirkwood-thermal.txt     | 15 ---------
 .../thermal/marvell,kirkwood-thermal.yaml     | 33 +++++++++++++++++++
 2 files changed, 33 insertions(+), 15 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/thermal/kirkwood-thermal.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/marvell,kirkwood-thermal.yaml

diff --git a/Documentation/devicetree/bindings/thermal/kirkwood-thermal.txt b/Documentation/devicetree/bindings/thermal/kirkwood-thermal.txt
deleted file mode 100644
index 8c0f5eb86da7..000000000000
--- a/Documentation/devicetree/bindings/thermal/kirkwood-thermal.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-* Kirkwood Thermal
-
-This version is for Kirkwood 88F8262 & 88F6283 SoCs. Other kirkwoods
-don't contain a thermal sensor.
-
-Required properties:
-- compatible : "marvell,kirkwood-thermal"
-- reg : Address range of the thermal registers
-
-Example:
-
-	thermal@10078 {
-		compatible = "marvell,kirkwood-thermal";
-		reg = <0x10078 0x4>;
-	};
diff --git a/Documentation/devicetree/bindings/thermal/marvell,kirkwood-thermal.yaml b/Documentation/devicetree/bindings/thermal/marvell,kirkwood-thermal.yaml
new file mode 100644
index 000000000000..00edb4c8f8f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/marvell,kirkwood-thermal.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/marvell,kirkwood-thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Kirkwood Thermal
+
+maintainers:
+  - Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
+
+description:
+  Thermal sensor present in the Marvell Kirkwood 88F8262 and 88F6283 SoCs.
+
+properties:
+  compatible:
+    const: marvell,kirkwood-thermal
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    thermal@10078 {
+        compatible = "marvell,kirkwood-thermal";
+        reg = <0x10078 0x4>;
+    };
-- 
2.53.0

