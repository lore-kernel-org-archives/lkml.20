Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102469;
	b=jX988Qjv1i3jZDhtq7SQmHuqSuTikRe7eVBvonFFWMy0RX+Yoj9nEo5wps2Ryo/5bTjY
	 ErFE1Pc5XFK5cKMULxhdYjWmsAY3CD5ps1+bEotqBuKNhxJFIUjuT4TPdNnhXIx2E46a1
	 8saoJcQUGktJplHSHMFoL/G7Eg0NXSfCpW4cDw/aIpf71vbkKLjg2yxYZYh7kJdMNw/t/
	 6QiTQAzW/r3KXLDXpVJisv6cMu04cOXGSp7McReLqxibYiU4hdF8MTzwmon4fMHYxfDQB
	 8UhlcU4f8ctVU2DAdKOWz7IhI2CcdzPFIk37H0tPcuBgrr128ZE6RG2K1FMWRMfgq1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RdjRDHrcIiXMUN/fjmZNsI8ZO/4b+azgH+uf19hYTKE=;
	b=US+b7YW+4iGy+vKYTEb77XcHWLdryLxXdzYK8L2RtARInUFC63SzS/7YEaFhOmmsPdFZ
	 HwX0Z+nWGX/Ib4MwCWvjzHq2eIz/08W1Sq0xHnGZduYdTKir0taWg4iHQZOOoKbBOWPaI
	 DEemZv1YjT1vIhveltOu6rTy661nGwIfbfDbNtvMGFQ34FI9l0CI1sw2nMdRIGapmJQ3x
	 v9j+8vBHls3PQDuo+fLrW3DXMAwMTrfXMdkw9iET1tx+t6EFI/ifQCkolhebW9iobeeOC
	 5+h8UuEnYCaqsLsv6HiLKJ9ayoEmiRQok2UsdFB3+qNnVvfPSdKWlv4UGrc5WCl4BWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="f/lWBDEk";
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB75260A3803
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB75260A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f/lWBDEk
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1a86c0316so6323604a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102467; x=1793707267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RdjRDHrcIiXMUN/fjmZNsI8ZO/4b+azgH+uf19hYTKE=;
        b=f/lWBDEkfIPYFql3vPWiiT0rc3kWE1tCkHjWfg1CKxziyIZSDJ3v+JAjoHedbkvtho
         8Cm/kuiTJKwJvHx6CCRVdEGS1z9ABZ9tUjnKP67gzJA31Rd7eGJaCVkvqC5m4OM5Fy6t
         NYXMRa8we68AinGC9pbbxsO5Z+xeo/AYq/QoqXNtOCPutbu5qnFeAflJi0Eo4Ptc2gub
         qZUcENewFIXSny4FMvENO4D/KDg4YI77snagNteSZRUsl5PyWekoAEt7l1kL5qNtx/wy
         MmRTbLXTQWua3o+U1KtLi99yEXXzgPTjtO74lpJyjKd/DJ6OcI5LnyCuTst+PYNCy4uW
         tfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102467; x=1793707267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RdjRDHrcIiXMUN/fjmZNsI8ZO/4b+azgH+uf19hYTKE=;
        b=IPAloJGbl5EFyhWFSWOgHHaPEsGvzz8N+cEAhGtl6BcjuHag5HQvE7wrhubDVlQoU1
         y/PMnikxQhHEIWF0TgsiD69IX3XTxz6fNorEhA4PQHl5s5RziVS0GeO9LJFVMvsHI6mU
         x2kxGT8XQoJEi2MzQhDpi2i6j8l++Y86cAFnyTqbbgBkSmr63FdGh6+YV4oXUNHwUCQ5
         0b/7KmMNHClOU9oILG0zMWk2Xo0bTQ9j/JJbRG+mUyor4f+kW3DZKgEbavtwdGv92pnd
         Wo4RIIvOn2vTkjzxynI8oNkUnceAko9hDl9EQhcWALk19ifkmdKEK35uDFdVk22prVmA
         YNMw==
X-Forwarded-Encrypted: i=1; AKwUvByB1KOTAa9GP5iSgnbyBtIGCCmlMTk4wSc9TjbuD1nL2QQI+s3BAr1j0Pa/+uQGm/A+SlRQSkVplqdfHyo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvGHIrBYebjxVYCXTnV3+PWRYidpY697mNDfsFaEMiDBu5K1F1
	qtcfA+TGoHqUWYRw0i5JC/Mrhx2TXbwust4xRbB0hPBKWRNz/lN2xWEr
X-Gm-Gg: AYBFou1nIQQraFA9kaJyg8aQh6U2o70f5jMou/Uz6r2TpQs13RCyGon0XJwnmKupcsa
	zzRhQSTGJ7GaMUvnqPMgqYors7sGJScS0S/ATtWd0Zzmq6kE/qrIx/eKD/3r9pQoK1CNL710d2g
	Zw27HlD/r6ujCm+to1eXDJOjw+VjkJYzYVQX+F4rCrTqN63eZr9/HCH0lB46xutS/wpVZSSNhf/
	HxC74zs5MOjb+Ax5we++o/0nOyd4J1l/yrd9J+pXk/LfS2TzPo8XCYPoX45DsQVWSpPat/BTWaQ
	Lx2Z9Cgu/XeUjZLQMZcw302LldTij+/HAAwin8H0wYJvAv7zyYFKJkJkNu1J96KnzqeWtwn2aOE
	Eb2Q4a7tclcjSDkwMvJlmC9mT1QGv5gRyGIlbyRW8zs1P/+hZYCVYwEB4dfL4sJxXG3BoO1nXAy
	43kAPd5GzBAGPTullhB79uTTkkGi0rJzjnGSL7H+lombnYMAnnHk2ERGT/8Xp48/ZqeBp43E7gE
	1a4P5TZRaS1KYOgi0pNkk9xRceF6YZQi5U3wTCraf/W+8lgitZ/XeLJHUVBfZFMYdRA6S/B7cNG
X-Received: by 2002:a05:6402:a6c3:10b0:6af:5b14:78e7 with SMTP id 4fb4d7f45d1cf-6b44324f449mr6887681a12.34.1793102466212;
        Tue, 27 Oct 2026 05:01:06 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm4717844a12.24.2026.10.27.05.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:01:03 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 6/7] ASoC: dt-bindings: nvidia,tegra20/tegra30: Document #sound-dai-cells property
Date: Tue, 27 Oct 2026 14:00:18 +0200
Message-ID: <20261027120019.93611-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027120019.93611-1-clamor95@gmail.com>
References: <20261027120019.93611-1-clamor95@gmail.com>
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

The Tegra20 AC97, Tegra20 I2S, and Tegra30 I2S controllers each provide a
single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/sound/nvidia,tegra20-ac97.yaml    | 8 +++++++-
 .../devicetree/bindings/sound/nvidia,tegra20-i2s.yaml     | 8 +++++++-
 .../devicetree/bindings/sound/nvidia,tegra30-i2s.yaml     | 8 +++++++-
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.yaml
index 4ea0a303d995d..19e242f6cf028 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.yaml
@@ -10,6 +10,9 @@ maintainers:
   - Thierry Reding <treding@nvidia.com>
   - Jon Hunter <jonathanh@nvidia.com>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: nvidia,tegra20-ac97
@@ -45,6 +48,9 @@ properties:
     description: AC97 DAP _FS line
     maxItems: 1
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
@@ -57,7 +63,7 @@ required:
   - nvidia,codec-reset-gpios
   - nvidia,codec-sync-gpios
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
index 68ae124eaf804..9a17866da7731 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
@@ -15,6 +15,9 @@ maintainers:
   - Thierry Reding <treding@nvidia.com>
   - Jon Hunter <jonathanh@nvidia.com>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: nvidia,tegra20-i2s
@@ -49,6 +52,9 @@ properties:
       limiting number of supportable audio rates.
     type: boolean
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
@@ -59,7 +65,7 @@ required:
   - dmas
   - dma-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-i2s.yaml
index 89c3c6414ab13..fbe4cd4619683 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-i2s.yaml
@@ -10,6 +10,9 @@ maintainers:
   - Thierry Reding <treding@nvidia.com>
   - Jon Hunter <jonathanh@nvidia.com>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -42,6 +45,9 @@ properties:
       - description: rx (playback)
       - description: tx (capture)
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
@@ -50,7 +56,7 @@ required:
   - reset-names
   - nvidia,ahub-cif-ids
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0

