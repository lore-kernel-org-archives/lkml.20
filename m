Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287784;
	b=PNgNGfIvHYypxHjcHTgHP1KX375lrEfmEO5JoDHHganmkWGIXioInspgK8ZsKCLqAxsR
	 raWdKB0UzrjlfwNEi09SgCA9voLohAzegOdh64l+9B5WWbcRoWeADbsGOfh4zQiQE9TJ6
	 qkKlA0J/ORT3wF7D2LE05RPPGr+KfManibc4vGKiVdrlBoWGeQXVZhnW/w/RVP/vZrVLm
	 hEjnCoVxOMESzpFRBxrNHpfvw8Eqt0zDHJ9e3gUbsRqpkEeIuQ4v/hpV7eK/H4kEU4QAW
	 azbD/L2MZgXekzJs6Ke4q1gvfyxFzMmhMNQW3LTR5VAySoPt/cvcQioqg9D4b35hNxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C46XMF9ntFd1cNzpW0ccZaBdDtR6GkHK7zbgrzppajQ=;
	b=4NGlcOqa8oDXJEqlC75XNwgH8dkLFGAicMJz+CfHTfyEtmab9eToHIfsv2tn0PBIqixK
	 ER/29gDeL9CRRkZPRpSF5vI+m6xGgCnDAMWlPXgC9tdANiH7K2bWaKEPYM/JDzWuRdr9t
	 BArUpsJuFZ5TZz8pgJyrazohSPqnYhBGRVAHt1vdnIhGSitTMPZs4Yr/jh5ol1nlRPtHz
	 LzS82UmNLhC7MPE30iWoK09YVgKeZOkyeQDWBxT6vxAVV2bIGGJ//givDm14lAfpadJlm
	 QmqWJJNpNzK3QGS7ykgcyLqL4ETmykV7CTgdqTNivhzxuHjzPZgeTzfH1LkWlOsOxiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X762ACNe;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0A4606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F0A4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X762ACNe
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4322d310e7so334210366b.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793287782; x=1793892582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C46XMF9ntFd1cNzpW0ccZaBdDtR6GkHK7zbgrzppajQ=;
        b=X762ACNeqXO2h9IzkxzXoaGb3K8Kfshd40xetGeLUvdcIddcE5GnQSegoqa40UVxWi
         umnYwbH5fJT9GFMwRqEaB2c6dStBzqYLsiJwkQHWz7XpDUm6BCgAfQzcrHWjHq30dusB
         tbnm19P7qJ1Nh81kQyVH5C8BYbD7/XaN2UWkDkDufz6CHtFMdwL0iDB3kFlAAqvUFm4L
         511aBAH/a5j+OYWzO7E5n3+jm+fgoajMr/FvbgHk7kGLpJfhU+qzbZrxT2DXKyjWnWaz
         mnjczFLujENsgwnM65cFHWy8MpP9ghfB7MOqktm5/OGXZOqxUN2OJrFtAfe8uPXoC079
         ng1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793287782; x=1793892582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C46XMF9ntFd1cNzpW0ccZaBdDtR6GkHK7zbgrzppajQ=;
        b=tkOR/WdS9omtnfoDL70pN3NgvGXRA2DE2yAvfyZky0F05YI47HACEDsHmGMd/oEMsj
         UH7AWxRhBemEY4Qz0/qNzOv5bAbtGU6k9hxR+m//7vqzwwdpFhkl6y4hOsv9VsxyrESL
         7pEWFEQILXvgx/Q7H+2OAAEYclOM+YyO5bFnDKnT/cVJFJ0+C2/cjR62i875p+Hp9Hr1
         C3BbWKjKi89OVlONQAjjRSH8H23DxZuSPwFn2eNMjbrcWr8z5LKK9DEhLkl9lO1+6vRb
         yzvZsgCkY9HTeb2fwEcdZw+mJFYKk6jS2NlChqzTWbf6djGZHhtbOIrhg3+6Mkvnak69
         P3Ow==
X-Forwarded-Encrypted: i=1; AKwUvBx6jP41h67ZLoaFeyfQgVaOHg5ycCIun1VAWzbS1cP7KC68GPW6M5SnfFrC3Yepee2f+/HVEKHMGlQD268=@vger.kernel.org
X-Gm-Message-State: AFq9FYIA2zG1tlhRAfNDqhfsMzUnRytTEzsMwoAIVAtL0uReqdhxkVES
	MZq/zwJS4VaThCvT+T1VzHxTj1yLBKN+Ji62cQv6hgbq1R9gOkvLsT8m
X-Gm-Gg: AYBFou04ec8XhyPZoUFbC1gs6Rw7QP3sIiwqU16soW9W+MA2lhKF7o9Tarw+OuOyOjj
	poghI1q1ylva3MDMlImCQD+tW2ybAFRzhmoRmdQnUiMGY0iJIKsVLk/OoAguoKTORop4H1uS+Ql
	1XSDd5D+PV/9rFeiUs9D9lPYcLA+w8V/VmLkoFJ2bgRYHKymYjpLXt6imo++qJ819+PrC905XBH
	3UnHgMSz1jEMkzIMmGJK4knXvLNHmRdFrM0h5M4ZtgpmnIx9aMeMqFv4lRSucB8Mjt8AsDpZGgk
	HFKeV1RwIwWEU+njaZHaC9IhX8kkU1C2a2PvKuueDl6G70EhepmScbbvb7DrAOy9omezqMPEWNH
	BdaCAsCciRV78Ap9jwI4jWeW6a5QpovHArvnLUnPndeYl/pm96MJF6v39IdUGBgTiW8wN411OLw
	zxo0yjalgYsWK7Jd+rOxlHaeAJ7Q7qK/aGW1As2pEjWqem8FdrjpoLYT4YNoWL+JwZHzG2eNuR6
	BxGwRtSkBjqeLP6XAR6gCNqibcDQf9dkJWGPcCYQ1YXGTMsD/D37t3J6Su2qSoTcUqdDN7FVJhK
	JGK3gm3iwm/gDBr6PpWCLYhG7IHPmkBwodoeRtqY6NtBLPPy6Q==
X-Received: by 2002:a17:907:6e8f:b0:c46:ba33:1f0a with SMTP id a640c23a62f3a-c49bdf380b7mr518463366b.31.1793287781542;
        Thu, 29 Oct 2026 08:29:41 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca27984f8sm1252166b.80.2026.10.29.08.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:29:40 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v5 06/11] dt-bindings: display: tegra: Document Tegra20 DSI port
Date: Thu, 29 Oct 2026 17:29:04 +0200
Message-ID: <20261029152909.234584-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029152909.234584-1-clamor95@gmail.com>
References: <20261029152909.234584-1-clamor95@gmail.com>
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

Document the optional port node, which is required for correctly modeling
a dual-mode panel.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/display/tegra/nvidia,tegra20-dsi.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
index 59e1dc0813e73..0f4837648d179 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
@@ -83,6 +83,12 @@ properties:
       gang up with in order to support up to 8 data lanes
     $ref: /schemas/types.yaml#/definitions/phandle
 
+  port:
+    description: specifies the connection port for the dual-mode panel
+      and is required only when the panel is operating in dual-mode
+      configuration.
+    $ref: /schemas/graph.yaml#/properties/port
+
 allOf:
   - $ref: ../dsi-controller.yaml#
   - if:
-- 
2.53.0

