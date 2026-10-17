Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3B73D5C38
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792233215; cv=none; b=LaTm/iIwTQA7nYqJsO/OKUU6R11NqDQxMgS/kpDL6tTxVajQqI+cj0Vi5aQ+w2JZZmx4/02OragrrST2ecX4Hn22TXawwcnQBVaMAGcCWPOTRz4NJ29XCc8phI3QxZgX79JPWiJl+f3UC4Xp/yRSOVHSX0/P3HZYQGoK9Ujb9ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792233215; c=relaxed/simple;
	bh=H+/PngVUyrVREnpYqPk0KT7pitaBFyX7wNqwwHkQmDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DfUv7USvKZcdS11UXgmyGyOA+ATlwJiBcKzYocuo31QhTEFxJvo6VHqeaxtJYNDHCqDjXwAjyg4YPHhH2QCGXT6oAfcBxY04x0EiXEC4YlCooXiYyk9VEkPZz4XGFuj8ow2yfG2hhXfhgt0hg3sG+TLY7ngNGhT3P50mfLiQQ9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NqB74/KU; arc=none smtp.client-ip=74.125.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NqB74/KU"
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cc4f2a5c3c8so172046a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792233214; x=1792838014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDddWpoHqTtkxFsBbERUVZlldFJw6rS3OQ/sbeQSp+8=;
        b=NqB74/KUgwesx3xYGyZWogoVMpX9xc+qhVvLA0e/hQSqG21+JpostPRx2Ql6aQPnqQ
         8+XU68WhhSiArbOa+uzLAO3h+Gl9NnIjEvBU9TqZajMM01vqe4K0MxWYa3D0fjXJKLBB
         JbdNZsPEQtIdl8JYy315lUrp9lpgykjTXdf0FHhDjjdhY/81iNRQTqOULLdhCrRVtudl
         ueMzryAWMtB/HiP4pq/6FKdbfhtPLlBW28SCwg7QXTl1f0wXNvrq7p1/eohcZ8I+gnhR
         1Epww1qMp89wGMmu0RY//7d0+qX74UimA8GEsjcn9v7XywyzlxP/Z0WHyokBnrjn5UZm
         V8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792233214; x=1792838014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tDddWpoHqTtkxFsBbERUVZlldFJw6rS3OQ/sbeQSp+8=;
        b=bUj97mYOPLVtInV+PQz071rhT/u5xmA0E2eS6KQT6dBR63FNuUxOKxZxU85ETAmCB8
         bjWuBYA4cfOaxJ74uQkfXrvyOuYzA/1ATpgUAPXzuCa5Imq8tQmfjd5pXC3KUtyyBSlk
         reqIoOBcjgjAfwvf2TrcHV3zSpU1Jm5OaO/zEF2M3XdyurfLl2UQE8Yj4JPZ8HyvIeu5
         K9PZFaMGoTzyPmfzJFrF8MexLltW2nc+M/3VJd+CD3snlF2ATu/C9w2enRL7SOB2qCtc
         gVa97DCJB65/Q4DdwtgvjXJzgy3iGLGlQiRSpaVQAzVakZBLd7ZkaPr+CCvkJcfKJSzi
         fS6A==
X-Forwarded-Encrypted: i=1; AKwUvByssHrD0I5fZ80h3xtuvk5nfvpOTtCJsoiYKnygLVLm47mMslPw3D8EuY5xYO01Np2DSBzTn8XyHmt50EI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFGxsqNPQHQ/v11qpdR7MxLmyoHQ1S9e1Cq2S/6oTb1u5D7RSF
	/uKnkYtNZCtLh9tlTbnVdOlDAKOWO7p7+IiWEYPp00D3WnP7zrURCl/Q
X-Gm-Gg: AYBFou18nTdVNBrXXrNRW/0h3tx9k3yPFvFWyuzid8RvH2oYeHLHbaEk5ri3TJvBdDq
	CF8yQm5mDSlgXK3XxC6OLu/sjI6L/gHSxh2/dnkHWPPknPd8FJLYy2YSU6E6zpLt+8Z3Jnrxen9
	AoVgU55R9D/+lPeIdslM2gYWe8D5u0HavKKfmwAFcPlwDkFXcZNi2yhltaZpxjejLEb5QvmGcpe
	L5pTfajSJRnVdKC4Gg1AxKvkgEt8EsRLnPohEMDtjpgzSpoijIkh8Yj4XcewWNMjCtj1+QIAq1z
	TB8hpZSfiqRqhOI4nZvs8XPMkjWmh6ru14bKEiqwXXuxkw8wubXI2zinSj4WDwPvaPQwBW10Uek
	Bq+U6OihzkBWnBA/u7njUG45AD5vo7tR+gbQgdRoUWSiOV5ceLmkK5Har+xmOJDfj+4IRIJZNhK
	dnut92ZqSQOWYxgQ4+yktGB3nkdbrq4v1ZUuLYbdhstiy+VnnKWiNmSzvF
X-Received: by 2002:a05:6a20:d80f:b0:3df:5190:2275 with SMTP id adf61e73a8af0-3e22607d574mr1478512637.70.1792233213912;
        Sat, 17 Oct 2026 03:33:33 -0700 (PDT)
Received: from Linux-PC ([2a09:bac5:1f0f:372d::57f:4e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f58414986sm2051585b3a.57.2026.10.17.03.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 03:33:33 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Lu Chen <tianshi12127@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: add smartisan
Date: Sat, 17 Oct 2026 18:32:48 +0800
Message-ID: <20261017103250.800109-2-tianshi12127@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261017103250.800109-1-tianshi12127@gmail.com>
References: <20261017083531.766557-1-tianshi12127@gmail.com>
 <20261017103250.800109-1-tianshi12127@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lu Chen <tianshi12127@gmail.com>

Add a vendor prefix for Smartisan Technology, used by Smartisan
devices such as the R1 (trident).

Signed-off-by: Lu Chen <tianshi12127@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..6ad8d3499227 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1535,6 +1535,8 @@ patternProperties:
     description: Skyworks Solutions, Inc.
   "^smartfiber,.*":
     description: ShenZhen Smartfiber Technology Co, Ltd.
+  "^smartisan,.*":
+    description: Smartisan Technology Co., Ltd.
   "^smartlabs,.*":
     description: SmartLabs LLC
   "^smartrg,.*":
-- 
2.56.0

