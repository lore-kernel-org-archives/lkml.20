Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD790262FC1
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564381; cv=none; b=ltvSgMxIxfQl4sQaO5C5hPulq5U3KrgfaavcYjJUhyJOFhcFskVkvDD0OK1XcYAy0dpny+HVB8hrakk0HLVMlyQ7AQsUtIKWeE+ydY8DUb0CCyqpH+YpqwPdVC0mZauS73Eocc9xVoKFqrurMIoiWFjB5ZkOQrzQ6JWfERSmsvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564381; c=relaxed/simple;
	bh=o+kUdx6oM4YKDVkr1OH5tjWm5SLV6fOsv8ZE8kTFeXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UkWCOPdr2/eCAHuOMF1NHE1p0E3a4gdqxnH1EMurH+FwMqSzBMP+lvAo45eztE9YAWRhOwn2i4aI5SZVD6NNUvewSHSeOZ54KNI/MH1sQG5GceQ64qH80U2lTrMkc4KS8+o0u+vuSRnaDZgRRTu2BgMPrjP8WFJSLc5/cE/NlFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUjOZt4T; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUjOZt4T"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39dfcef2896so131300a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789564379; x=1790169179; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aK8SlgHAeovTDqk6LwNJJCxL6zYMCFEkGRKFkqjjE0U=;
        b=AUjOZt4TpQMfheZN5OUULN3BgYd+gWwo58iOQKiYPCRGKxlfuucHW9uhW3FhGC7ZVX
         g9FXAcvf0bYixDSUxhFTyDbsTEJFo5ZU5s8SJWsKjAjBeGDmCF7W0VM1wcQQm4D80yKn
         z4I4MzUMIup/YdHNvina5HG/AiosYZKT6fOa7OPP9BsiDwTsAnz+6NGk3YGjROWh35lp
         GakXiaCiyP8ysD4te/tOkM/xWSfPuuu0ey81S4SfC8XfGKm08k5qW467yS6Zy2WiFZVL
         /M/JMFYcC6c49XEqa5Lcc8IpP00snQW8t5OVFGWcHzW2/MQuFVbF0xOHys5td7fe6CbH
         x/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789564379; x=1790169179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aK8SlgHAeovTDqk6LwNJJCxL6zYMCFEkGRKFkqjjE0U=;
        b=YEHybdF9dJxEVCJ5hFoPv3FVOn/Tj5HRIQKzX07ljo2Zo3ghd6KxWa7mjEjOLZqX5H
         XHa0+V05LfczOB1nHgZ6PQfAN4hamnhezhQEbSDv+cLf1TArktgsTkrAdi1k+bu7QMJq
         2wZMLJAAnZqdPTttdt5Arq8JLZwPU/F+4DUN1t6yxtIepcj6hMv00+O60qVa84wcq2Ms
         R4TxVWgMcsJ147BK1Y+qiP2ybACH0QnV0t0tt7qfx9XNYwPrVvI+VgOyYGXdC8eMLs1U
         1TeYR5PSI39jTivUmaBPLI+PHgsrlIbkZLsqVfSI2cHDUMle5q11IJSq6Y6fCuHUsGBl
         12SA==
X-Gm-Message-State: AFuF++kc5H/4W7lnh87bMUWFa5/v1TKhB+IOycvaRjfwxDnDilufST+b
	6Sci+vJ3FrDKxaGfghsZ+XxpStYsw8RIS99qNZquIKV/NUuFjLE9D4B5
X-Gm-Gg: AYBFou03UGgpFOi5ojA+xyRvbtULrwfExTvzeAvkn4MamwqIinpfgxdw8OhsoLfIuCK
	7UjEmgIS4UKurdRluR6RdII7LdS6CkxitDu3DTmDVgTIpNQrre7B96q7BLVJtABtiBA1Eige0Ff
	qG14TdBEuB/iSt6XOeEBiC+gOuiW3KTqQDytI3VJIYz90knoPycpfYsaXVsaKpQfOVy3zLI92Mz
	3UhLqMqXr/EKvA4H4VTs6jaP7xQZhG+LtYZYCT546l7g7xpugzS/xBo+eK2JRKmLvJOOLOt/nmi
	voPihKAWVIjzefamjhGGmqiXo3RmVsfmOaezf5e9jgz1ufob0kFmjPG3ND25e7zpqoWDNg22YLE
	+Y2xfClAP2ehcPfLpfmMAoZ8KTOP3/ZDl0nwzVMuEboGdUuWwGUxWfKZypQrVPLj17POeHlwW9i
	l4ctCDUloorqAgsVvtBy6RogA9iv3IgEl2Pa1c7ues4L0cwd4ydsXIoir08d8t9nrlYFfMRwMht
	ci490qHIEjS+YF5BompCQ==
X-Received: by 2002:a17:90b:2703:b0:381:bcfb:e710 with SMTP id 98e67ed59e1d1-39e1e4b2c56mr4218286a91.3.1789564378929;
        Wed, 16 Sep 2026 06:12:58 -0700 (PDT)
Received: from [10.107.92.252] ([2409:40c2:5413:87f7:9fa7:eb18:a8e7:30a7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1194sm9422972eec.14.2026.09.16.06.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:12:58 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 16 Sep 2026 18:41:26 +0530
Subject: [PATCH v2 1/4] dt-bindings: mfd: ti,tps65910: Add wakeup-source
 and GPIO hogs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-ti-tps6586x-v2-1-f12cfdfb446c@gmail.com>
References: <20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com>
In-Reply-To: <20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@avionic-design.de>, 
 Lee Jones <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, mfd@lists.linux.dev, 
 Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789564321; l=1169;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=o+kUdx6oM4YKDVkr1OH5tjWm5SLV6fOsv8ZE8kTFeXU=;
 b=tpEvH9KHIwfTAC1OsUi5VlGNptqy0s24Wwu1XzlMVjI2obaXalmbeok/qLK/BloCX1pzhu24l
 n4BFew6fQmaDo3lR3iaTnzSxj6vIqAmT7b7+Sj4GzU/TxtejoEVXMtr
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Device tree validation throws warnings for the TPS65911 PMIC on Tegra
boards because wakeup-source and GPIO hog nodes are not documented in
the schema, even though the hardware supports them.

Add wakeup-source property and allow child nodes that match the "-hog"
pattern.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 Documentation/devicetree/bindings/mfd/ti,tps65910.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
index f1a76f88fc0c..caff9dc0b2bb 100644
--- a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
@@ -37,6 +37,8 @@ properties:
 
   interrupt-controller: true
 
+  wakeup-source: true
+
   '#interrupt-cells':
     description: Specifies the IRQ number and flags
     const: 2
@@ -163,6 +165,12 @@ patternProperties:
         vcc7-supply: VRTC input.
         vccio-supply: VIO input.
 
+  "^.+-hog$":
+    type: object
+
+    required:
+      - gpio-hog
+
 required:
   - compatible
   - reg

-- 
2.55.0

