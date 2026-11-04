Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796083;
	b=ZECqDkmJhsAmfiZZWoWN90y/c+iSuWGkyGAF9o36uSp9f+aXMuGTj3diO0QFknHBBkjD
	 wgzB944mHl5Tn+yTeyTBdEcNM5mnVapUL43CWxW4187GLIQplViv4vm+mmOAWUmtAYsgk
	 i/91RP0zsMCnk3wBzIiy3QGHpalx5FgoJQ3iptswCxTb9u4lWo5Od8biP9IFL9qEg2ro9
	 Xu87ikT1sy3Pl5H+F8d4sKvv9ktXG+NrXN3efD000KMzLfQ7PnG5BtxnC1jPjJsM9t2in
	 2P0wV5uZbWHC52zA+lMhLmshUNIOtBlGdRtz7cf4jERHJ3ErNs6Pc4pOfl+EYovWEzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RdjRDHrcIiXMUN/fjmZNsI8ZO/4b+azgH+uf19hYTKE=;
	b=FNYdrbmFXEjvO31h5lri+ID+WO5VQL/lBtxPs61CyMm/7ccA/Dn+CrFXBpI1cPKEf7R8
	 /u3yN+NVwA9IDmI1tgzQZEoWx07MmGLYIEjCH6UZU98OV4y8f7w2OwKoH3BWG7xYaMMFu
	 CHM7T/6Xb4D6k6v2K0Yop/leU7xOck/j5CXaXuIsNg+/NEPVvR0iaaZZ9kqSQgcXeDlp9
	 n5Ta2UIhefxRA6JZBg4OlajlsN0im+voCUfCMPDvgoKH3M/BKabhj/amDLSRZMvvOHx8K
	 9PK+KrGdSUABtTe7/+qyDLiYVmUc6WAnvdxliiyyEPfLEZ72pum+x4aJRkd1hkFhUYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="CRzmj8+/";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C28606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3C28606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CRzmj8+/
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49d05d51553so4027215e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796080; x=1794400880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RdjRDHrcIiXMUN/fjmZNsI8ZO/4b+azgH+uf19hYTKE=;
        b=CRzmj8+/NF/BN+I07yf2oD4T5kFJjXjbNL5RcAPCsr8/KRarKHlyodp9inl5fv71Jn
         o7SqXX4rln8aBWEqErqW4hisC4TP1WtD6JdJ/q+ad/HnKWRnTuZU05YCtv1yT1NLHa4n
         UGOqs1zvron1/mHeqNxuqiZX91xIMqNTF01XoJjsoWs5cw9WuvMLlByz0/+gwcdiR8sb
         Fu9GgS6OVoMg3398FtSLpfqztKxtrjwr7qsCXyr4KSlLxF20QjurOq9eV87E1Qaxxybo
         Tszg3VIasQAonxfHIZW5y0AGXwZQneMpzuJ2AQU6QNhYLlvfuBOiYFHEiYwQN4/YL1Pb
         dGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796080; x=1794400880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RdjRDHrcIiXMUN/fjmZNsI8ZO/4b+azgH+uf19hYTKE=;
        b=jrKCl3YEGIjB+f0de6ETrhKna/Y9zmDIhXfUoLT5w/5IgJQJmBVxEBcY7KiSQcvFu1
         k+C6yF0KZzSy/vN8NzF5NAboV7uJoNgUJS5IZMwcLxVl5v8YIBlYyQUa2CXLp+Rn8aJq
         8H5mqhqV0gX0RpCGYXCH/+/SLO+NeoWlYGJDXUGSA5uDlvMQs6BIN0JbTnwVM5hWaOMh
         c11Kg1SYsiSqAjKaAnmOjf3RzseJyiM1UoJbot9pM5TR2piUd3LvbXSolmIJ+4FGo4WE
         H8dQem5Jhv54FIP1D71/+woObUyWpfbjm3nHW02IvY6n4gtU6LiTOUlHO2Ws85RnxtTa
         oixg==
X-Forwarded-Encrypted: i=1; AKwUvByOAxUxCv3RItIwYDFDjbv+R6740/LyvfUTOSrSFqDy+nRBLdjGYZWCnVjh+SSGp9fPufkNzNQ2dKP+C7w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Tb6Zye1m4ftdveM6iUtu9LVuyfaHYbH4IwJbnKDAAHhFkPGfu
	/9um1VF1nJzzoabwiKPhkNFs6IPoaQpACkKEAAlg+W1wHiiYsNhVpBOj
X-Gm-Gg: AYBFou0odNln1lE8eGA2xWwsQbvorPYyINK47RM2u0cYG89meNvLbWBFKNLRLWNsqz+
	5S6J7mYU3YAh9Fz1N0Yy6ddxFJcTjma7EPsQR3ak3CAZoDMUgHgDrRKpPSlBw+9UK4XAQkzLNKd
	raydJE9E1whP3czQxsAS0N+9UdEmCOapDn+d4zd9PdhrTWJbJ9fO4prg3ZwEtpVADbfSNH6boD3
	8/pg+hYjHkraI4oCmQ/lHiv3Lrp1pplybsxlSyMJ+BXl9fO2A757ctugpPKM40f1yryXBz5Ce+E
	ce612U8hCj03xrR81xTykoLTMnJ2njg9h/2F9dJVzpttNSEEf7tSYdfXSSi/zRhkulUfexRU9lE
	yJMtKjJKpz1QtOg367DdVY5Pe5YQy8mQ5aLF2+n4zDObBG/oCVJ4FwcuTHl4/iHAu3pi03SpmyM
	6Tp/LVs6s8bq+RANkCEffzyvAQOs5qWPn5gkVOFfH+cg5ad5lCmg9SsS75IuTLT5PgXY45LVcRr
	eOxaPyuETz0/6uPC/aPeFcHCY05FAC4Pt3qK8yWqb5nuNL5rMwX/nVaXnmv1pWaZ4eUM3Bf/81l
	PdInV6KPaKHDD047tGHcQWx3pN00JHTAUB1bzeIhlgejCASU3sTp5pRJ1xEHkNYVLsKVDIQ=
X-Received: by 2002:a05:600c:354c:b0:4a1:9663:7639 with SMTP id 5b1f17b1804b1-4ac18c7389amr378083555e9.34.1793796080386;
        Wed, 04 Nov 2026 04:41:20 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm46347145e9.3.2026.11.04.04.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:41:19 -0800 (PST)
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
Subject: [PATCH v2 6/7] ASoC: dt-bindings: nvidia,tegra20/tegra30: Document #sound-dai-cells property
Date: Wed,  4 Nov 2026 14:40:56 +0200
Message-ID: <20261104124057.240288-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104124057.240288-1-clamor95@gmail.com>
References: <20261104124057.240288-1-clamor95@gmail.com>
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

