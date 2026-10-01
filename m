Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AE736BCDE
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 02:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790821478; cv=none; b=GlviUQovQOv9AcuSbO1VWiW1WO6Z4NQyuPworGNohABTMTgD8R9zqzTKV4xaP6lMMJNvkfUme89hKD1H9bKyWoyPcIVdM82PuWYLQXAruiZj2/yjG75K7SQatWtS1CN+n9e1fWyzRXo5OBFZmG1PL5lFvcaWxLhGnbtHpr/nGdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790821478; c=relaxed/simple;
	bh=ZXJS5JzKrOR11yrKsPhvFOiNFDXrOJb0Qlf/cDD/4pA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LC9ATJX0bLXsXGiZS97El/VsAAhjrC23emjjdM1ykDy/gkSVkCVtzFhVwn6qYVEm+jmIALi8Jm0cNceN4IFIM9SWDHRKxXA33X0qNn8QyvnPJz+hJ6eqDLJLsw3iAkXHAiV2DUfy+EWWWWoLraCCqut7WfKwupEPd46z5fjHgBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ktg9ZE6T; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktg9ZE6T"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2e2e0d89e58so9340495ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790821476; x=1791426276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mHCBqkhS98MALcv63esiOVUC2HsGBxNJ963CzvWZoPw=;
        b=ktg9ZE6TYeiUgeS7JbexePSi59dHShEf0E7OrczJ4Hq1Jh+XvqfrQV/cd4tmojXSzl
         rdVer250PKHH9YTc2LmmHLPQmjPyHcjML1tubjXW9q0VS5I6b+Tq0K3MQyMYNg3Pzur5
         HmjnjAboDfSeEXS0msGDbn6mNmDw1lPvkgEJqtQIYsyXqX78JR82YAdehZjQfrCTfIUV
         6BJ8enWOizYnmoC/LFQjneD80PamUp9swjViaCjDXXhHppSrBYLfTSJtYvfI0GWbXJtm
         +8r1MAe4Rt3TM2PV0nGaBpbSehvDL8TlEdywTym53jcA6+YZqQ0I6fuNRaJVAkpbr/j4
         lSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790821476; x=1791426276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mHCBqkhS98MALcv63esiOVUC2HsGBxNJ963CzvWZoPw=;
        b=oESHk2aSCikhlYl2KuvaWvvV3IFQmQoNcpTi5T2fhzvxWNk9E2gqumgksLPZyD6ePQ
         RjlZ8PZpPM5IeX30qth/sYuNQXlnmlsbR+svN1wntcOfsXAEAK0kyBkDFutLwoToMKhn
         urCQpQe6/pFUpqcftIknDvehnwjb59Xfo561sj9A9BMN+3Qsl2eECpVNQ1AtyNCQGz4Z
         KJxEoCdKBgYnaMNB3f2AmsQ7qdN7fNrdZ5R+IHg76GUkXcTd4lDmPJETU+R1PNCNe2nh
         XZDIxdb0V1EgfxKkInZdxTmAY7znhrebMLUHAq0vtO1DA50P6Xz1TRwBJ15Bb/geMCz0
         PHQg==
X-Forwarded-Encrypted: i=1; AKwUvBzhZ8QXgYybjkgmvJXAYh5nSEseNjXcdPtWMIb1/bU2upZ91gDiruan4Im+DEVyo58Vpn/BAUCICyRjq5Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVKAzSl668WtRTcDHIrSb2zI3dfHHcI39SP05qsDJgmtjo4D/X
	GyeLkHJhjcwFHAT86ENAnkiVvKVDaHR2iGfZEQK6aR70u7h/tPdLTLBa
X-Gm-Gg: AYBFou27GgHAXfTDuozrzWuvKDGpLjRMGwG38zf8ED7Tw6DyLj8uPrDuKza8yDxHG2F
	xqCHoe13uWpy49RF1oeBIrMSHEGyP7XfEfuXoob5hJLv7ETjU1iLDNBmogHDZAfauxzc+bfMP1l
	TbI+ZV+66Uzb+ja8bBLoUBzj6FfcHLtx9pEpubsjPv6ESLUR0c/dwNtEW9j5Q2fWTD7iWZX3C+B
	gLQdVY/fJDfqUZ5ulOd8H4m91erRbr17SyCUUbGdqdaah7rHZ2xNuWf5b0k05RiNcmxkArscX+E
	KlB5UryLfzf4cjM3SiNC1X1K5tHaZf6Z0WfBtLTkq2/paaQxAcvKPZ8BAwAK6xUcP211hUMU7SW
	bRn1EmlrDmw6JXdrWLAno20CS0lehxLLl4Z5Kh8z1pMsYrXJ5K4XyWQ+cX+Yl4DiQywQ52yfn6T
	MWBFavgfs5jNoRfI3bz7Qnnvt6eX6QdhH4JIUBJ59LoalrWCh/yxbsyxONZ9ZA1Q==
X-Received: by 2002:a17:90b:53cf:b0:3a4:77b8:1770 with SMTP id 98e67ed59e1d1-3a4d1524695mr2745133a91.15.1790821476030;
        Wed, 30 Sep 2026 19:24:36 -0700 (PDT)
Received: from archlinux ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f43a12c9sm2153230a91.2.2026.09.30.19.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:24:35 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add vendor prefix for Teclast
Date: Thu,  1 Oct 2026 10:24:12 +0800
Message-ID: <20261001022415.913959-2-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001022415.913959-1-iuncuim@gmail.com>
References: <20261001022415.913959-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Teclast is a Chinese consumer-electronics brand. Add its vendor prefix
so that board compatible strings can use it.

Assisted-by: OpenCode:DeepSeek-V4.1-Flash
Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969..c7c2fcd37 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1694,6 +1694,8 @@ patternProperties:
     description: Techvision Intelligent Technology Co., Ltd
   "^techwell,.*":
     description: Techwell, Inc.
+  "^teclast,.*":
+    description: Guangzhou Shangke Information Technology Co., Ltd.
   "^teejet,.*":
     description: TeeJet
   "^teltonika,.*":
-- 
2.55.0

