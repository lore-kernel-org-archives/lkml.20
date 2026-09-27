Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBCA39099C
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 15:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521960; cv=none; b=aKy28UHo6tLvALJxTJ6QeSSDxhP79X0kYazbKOIEd1tyPCzvzeSFafg435ffy7oV5DJmVlaD1yW68RHQozHJ5m3CLRd80MRGf0c3tFUE+A8Njnn9kGGQ4yybaxVLaW0e+l25t0bSHoMxY90Fp4hdvZU5clYluOKDCVdzXlCl1nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521960; c=relaxed/simple;
	bh=ctaMtyihF0ajmk4Gl6vHmDSDBA1iaCLst8FkJRBGR68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g8Q0cjJ+NFgx7P6onDC32hztzQwM6na0uvCMQAtjKd3yrZWWIBSjAejnklTz14tdHDHFcPJHcflkew25ZwTu+l8ucMqczrioGaaBsr0HrEMVp6tqzsSO/JVgtKZA3tp3uVkbzF4k+/ya1VEr9e+m/K+Wkgx32p7RDzAkySjApQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MY1fthwo; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MY1fthwo"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b24c3so1304780f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521956; x=1791126756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OBwIwOCuc7HMhoKI+9bOx8aeWrQw+h7eCYLVVq2oCws=;
        b=MY1fthwokASau9xDvRMAK+bGptM3O0akRvHwq1EVlnvAl5ymgXTVLkx15odWYHaEJb
         gaMTg3EaNZPUJZum/u32pFE4v+KXQO6WnwhwmlUpetR8uAB1bk6Uw/N6fWEJTUgp6q8X
         wsZ8Yne1aRLGVjTpABWwwIiKISWMRLcJapAFw6aEw1/JozhC8DjtIw+fyjcf86n3cQDH
         4v7GrVLhac1wCpD+NWevcq7vPHIe6bONIYylr+nEkNZKGZ5N0Vi0hT/TyOuWzGnhmccq
         iqmOfc4xm+ljh/+lVK5x2mjw9ZoTDZDXQXImM1UoETLimnAw3Sva4RJtRrFyIXQIG9kf
         B6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521956; x=1791126756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OBwIwOCuc7HMhoKI+9bOx8aeWrQw+h7eCYLVVq2oCws=;
        b=IqgDhKfqVsPVpGoH9e1IwlzZXYdJUVavH85RAvB3iD4FV+w/qI+CD1YG1swbiuazRF
         m4xa4HLGAUtrGRfYX+k8qOFmPUhaX6wMiUmcMuc3W6/I5Pc8O2rvmOvmVrSXx/6lpMma
         YHbrPKaxTnVVTlx+ldupNZAfUM0BI3vNFq2V7SCzHFWcyOVslBdFPA7q3e8F9Zf0tiR5
         0LuajORcG+JUk468IJyn7lWp09o5c0zcrbjUb10X/gGSk+CR4UlllzmI9bDtQwvfOc6w
         Z+DcuqbvtXPX4JwMKuB6etzEoeKwOzzTICdybojWhe7pgE3cDk0dPFE4+vAWF2BLYcdx
         2/Ag==
X-Forwarded-Encrypted: i=1; AKwUvBxmBs1LBBcs4YHnevsbDMklAs30sDc2KW1RyHO6OrxGyQk5s8u8Lqd7HMdjOz2H9px84meZXqAm9XT7GUc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLH7t9Xl6jMNxVqG2gO1GR8bZJbqiKSgM6ayOhkxTkoPeh9BRIj
	dLt0QiYK7bakMeN9eVUg6Mi9EBoz5uFVolsa5RRJPPPtfUWGjXFjaV4g
X-Gm-Gg: AYBFou3RVZ4pWowf6avsQ3jElsuMJDxvEIFDJIBSTE3zjOHF+mGNJPvMJpVSOcqR4Vk
	+eZ5vtRgN1BMhGCHu/yAmPj+8mnD+KmBs/Q287jfMdJ78ym5fqputvPhhEgr1m+rJZm+YeRr+P+
	tGEOJGLznang4CZd7kNAyecQ8C+AGmkqybBQ1NehSbKdqHgNY54fF8XmVslnhg0BC1eCRwzAahp
	6LhoZSvV6RAEm2qHuMdrC/PxfrDv7gaacOwgDKWe1J03aEFDq3tudRt8aOocURoazeap2iRODFr
	bmuIIsh4aPayrjiyQU0GsSYlS8ai4XnIdFOFarMbKhilsvMpCP120Z1btA0qDXVZ4J0FKDK6ReA
	Of7G+oatQ4KEFig1xdOwvb5gztLneyhHzkao2cEkEeano8ZNY0q6spEYflxm7ZK9xa4vU/xuvrw
	ctbwi6SoerQ9uO7Dmku9MT/4idJEHbps3cT7Gsnbb35tRIfYm6LXtmAKaG3tQQ2bbJU7V9hdeha
	ZMdvkfwquNvXITBjA95cHrsv8UBrOk4
X-Received: by 2002:a05:6000:4b09:b0:487:767:b301 with SMTP id ffacd0b85a97d-48879df7009mr13521375f8f.57.1790521956427;
        Sun, 27 Sep 2026 08:12:36 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:12:35 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 10/11] dt-bindings: arm: sunxi: add PocketBook Verse
Date: Sun, 27 Sep 2026 16:10:15 +0100
Message-ID: <20260927151016.186493-11-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927151016.186493-1-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A 6" e-book reader built around the Allwinner B288.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index f04db28c630a..f66c681d3788 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -811,6 +811,11 @@ properties:
           - const: pocketbook,614-plus
           - const: allwinner,sun5i-a13
 
+      - description: PocketBook Verse (PB629)
+        items:
+          - const: pocketbook,verse
+          - const: allwinner,sun8i-b288
+
       - description: Point of View Protab2-IPS9
         items:
           - const: pov,protab2-ips9
-- 
2.53.0

