Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EC7541453
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080651; cv=none; b=pZa09op8cbEimfhZAba439l1kDsojXvC6Ubp1rw/3vDujEH7lLipRb4w/OXKezjtEsObkCbn0ews4LzR2wFn6CRX+KKm6dFtR4dv4koms5Rb3pRgTFu2W3jtUiHDXl/VECx+DwpgXL00ZU7ZNbNnKagQgOebZAR+slPCXGCx5Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080651; c=relaxed/simple;
	bh=GNNcznWSFBk9BfsFx6sbFhNnUmqowOVWfdNrSDVGjJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s1mmsksPbd4t06c506Ar3Hzn1Xiaq6gNS2fEXKwrzVkAlIIm7V/8Q0umtzGAmBQ2Dlwh9EeeasdP82FSPdxlwB9nK/CWy0OCCHOLEAcMI+daTrO+IqZ+Aa8g79mFycpDjOXqpJG3UvszeRgGn3/ljWlMPZYREKUJ6DpCbE569TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s9ajlz7D; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s9ajlz7D"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb65437so3162710a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790080646; x=1790685446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOdg97xUtxa8AhSsk3nKT5LmiSCoT1EL2eRC7gkp05s=;
        b=s9ajlz7DsXauqODVhAgShrkCAxfxA22SAojiHI3g4qJaoFVWlbD66tWqYv2Ws4P2UT
         3wgBFWckctcn4iCS+QAlT7K8BAeLgaWXVQMTVJnyCQRH5cA/GkP5u5zP+UgFrI6oK4ph
         buLBP/6mNrXDUHP24p4mfjzUMt+Pi43boGZ2G+gSZNe30iR5iqSstC04cOuRmSFljG9R
         CK9FAQ5GtWylBdfTpIrq2EV0Ux2vq6s6PDVgW6tCZTFKOWGTURkO5N5hxjCn05Rw8mbX
         GKDiOFyPoZwHVRGZKIagz+a/5M2MtdWBh7IV9k02z9YPQpanxbKAw5rptjEtuJo9ArKH
         KRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080646; x=1790685446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AOdg97xUtxa8AhSsk3nKT5LmiSCoT1EL2eRC7gkp05s=;
        b=lE/PHD6WnpUAPsielwotIBk9LZ2rfcw8ssjxRbvmt/IIUa+o3tDsh5U7WmnpIhLKwj
         81Zs6MWG3z53UPmH7HdzyER0INC/MCmM/GTlBwj0oCyHpBWjAmAF62LHV/ysmZ13kl52
         yeNBBnfgzgFr2Ku8LRpn9++cABEr/JIxwJTmbnlvWl4dKz40RrZh31GoNNCTQX5u1rm+
         lvbZK2nMdG4xY2JuXoVOi0OB8n5OvzJ95RiMyjS25jikfgjHPSe2eRVlkhfaTErtdIOd
         T2ITfW4jp0IY9RgMc3Z3SPyQwyyQvvUHXyS32zC+FvOcj+Uso+5W9OeNK3Mta2keIL00
         UlOg==
X-Forwarded-Encrypted: i=1; AKwUvBzIABozjr93DcpxgsJQj1Y+IZ5OlWGTH4ZMGUnELofVB6DkO5sC2SHrViJGF7qMtYvkXiiCLHUihdYfYT0=@vger.kernel.org
X-Gm-Message-State: AFuF++koghNeUURSjQL9v60iYb/GbBXyUajHxaJ0LGUhY1C4wLAkmqzm
	XCDnmVD67BLXK48Kd0YrHKIbicuulFgQnVaByb3IUm8k+4gTuxLLXdQS
X-Gm-Gg: AYBFou1VeE371vsbcZXwTMy3H2nVZytT3/Irt9VKx/vpOByIMZ9Iys4pxWIpxIMPb6t
	YN/QzBgPu4mX6HSuJKH4obnk+wf77ilxis8BzBdo2YjKuMuELqJdzJ+hcoMkHKiGlzWVL4mbSzF
	udHZroMhPFMOxL6dhgW2VAetDJXDqHd2snhyoomBccHYjXD8idx8XovMpbU4iOEr6kLHG30/rKD
	9TJniB2lqqXl/j9mZj4hRAZZLzlYpvemV0O8DycQK4cWugQsKE6KDX/Jl5RORglY9BCbP4IhlV0
	WVVRbYo3WmF1EgplenEfvKl685g5FN2WUvIU33391V4ZvuOAhWHb3RLiLMvxaIKpBLMzWDG61FE
	vHgmjBPJ1TPjiBbeyZfDR8jY9Y2B4q1cErYM3G6W6juNq010utfzYkz+dBw1KaseduZ1FW8k2yy
	EiJtahZkXZEUNEx+3TEqM+ZTZKAFnnDx3k78ScKBS5tF9ov8RhboetrtWHUoN77r7URMyGtJRA0
	+DMboitjviJAFiV
X-Received: by 2002:a17:90b:1fcd:b0:39f:d323:c988 with SMTP id 98e67ed59e1d1-3a073241ff2mr1206949a91.48.1790080645673;
        Tue, 22 Sep 2026 05:37:25 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.140])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e612ccd46sm6453922eec.18.2026.09.22.05.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:37:25 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au
Cc: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	andrew@lunn.ch,
	tan.siewert@9elements.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Date: Tue, 22 Sep 2026 18:04:59 +0530
Message-ID: <017f5ab1176b12a9d56cbc060f3ccc1d6ce8332e.1790079398.git.prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790079398.git.prasanth.padarthi10@gmail.com>
References: <cover.1790079398.git.prasanth.padarthi10@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible string for the ASRock Rack B650D4U BMC,
which is an AST2600-based server motherboard.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9ba195b8f22d..4c9e96801c1a 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
+              - asrock,b650d4u-bmc
               - asus,ast2600-kommando-ipmi-card
               - asus,x4tf-bmc
               - facebook,anacapa-bmc
-- 
2.47.3

