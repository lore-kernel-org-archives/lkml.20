Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF773A9D99
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789506054; cv=none; b=BgmtQT8RXJem7KtQ3Ke6hFVHVZynOP/VFbyTgLTbME24DjO88cVE2W1CQXJvERI8YwS/lTfrvHHC0VNXrjoxwgUq9nRRHGG36wm0QF/F+t7dI6++du75lZTeQu7SE0wS369qSWG0hih0+84ciAR/EfctTRzMlimL8+YlYONkiZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789506054; c=relaxed/simple;
	bh=rfMWPtcSIAIJGdrg7gkea6Scilcnn7TJdjakZa4mvTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=poP6e4Kr9LhtKi4SS4qMYI40PbAjTHcxGiYVkKc1LoGzsnR/xsn5KRwaAAgJo4/qLPnc/9HrUG6mWs2speH+bL1J46aZjQ4SlnIzS09lVbw9U24EJrI/a97BNjcp/NsbdSSa9QtURZMvup2rSB2JYcr8lA0wYlegf5FLDhsvs6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJGf+s9T; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJGf+s9T"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1ab18b3e6so25579a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789506052; x=1790110852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7laVkgHRi16E4ELzl2jg8fUQVb6gDweW/ylOjj6oIsc=;
        b=hJGf+s9T7QRZJLQL3qORFaGVY6G+AwlaTvpLP2jX8Ouxs8JD+seYoldw5xNR0/F8BW
         9WWYnTKI2cwDrZwfRNpdziy0bAX4e1mAxx+Fd2nZyh7uxDP0xA5pVIwhVDD+VccEESaR
         cxk2ewc2bzB/ai4zmy2cicbGm0rQi5+wV6uf4PxLWvn+oC7nTQs1o4NadBp9TTfHkOil
         zT7awGsCNVs/urRkD7c7yrYfHGBaSfbz0Kk6iA+H2YVm9N/tokF6cUDMe8pA8ruRz9e4
         R6ddQeKN0bWOFPW+I8aU3uq6vDrma4cYtEApbBT+A2HbThD3xut6tOJ5c+k2nVZkvUpz
         BGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789506052; x=1790110852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7laVkgHRi16E4ELzl2jg8fUQVb6gDweW/ylOjj6oIsc=;
        b=Zv+HwAp/Hm0an0hjgYM++/CGjr9Qdr+6iizAi0tvOdsSI/hA75KtEPPOuRwRFsQUkT
         i4IFVB6ITDjNJ4PCaIBQb17subnXKQn2tXh+1ISLZhYUq/5TuWTbMzHciX4qBBe5IiZ0
         mPCa43e3srDWfrAYXczsmEHL2QACPMCIQOFqI3bjkXolYl/V0e/553n1Zix+6vtmH0Vd
         E1RUlOuX16x0L4nxJusQ9jSgufCoUXLprPc+ftNkrIP5lTQvfyb4JoGHnsAqS6oP/wX5
         rgxrMMMVUjYmET+v7147KJ1QhGuUahaTNSZg/EBpaDgEBLHrSrCzeN0Wzix55yxEGSYX
         q33w==
X-Forwarded-Encrypted: i=1; AKwUvBxskPy3hnbcSOBqSJc4O437+Z09xExySB4viFoMh+IjHG3aYk7jTHWgDrJaRllNtkboWBZWO7Xgc4B23y4=@vger.kernel.org
X-Gm-Message-State: AFuF++mTE4iONEmMJZNyhqX5ItzX2EKoGuyCE4zII3SGAt52A0sZWtp2
	Vii6UQyIWVUPMTeyTp1cuw35DfclI4oS0IQ4pRQscL4sdrj1auy7vn35
X-Gm-Gg: AYBFou3Qhyf5zWT4I1cuLfgGpYFm+damWoGolttK4OaOLp56sTOkHu14/8qszUC8JWz
	Fnt9fa+AuprwQPYOfi9PDEa/pCt1MUdUaE4vZXlmPixsbfBwxsfHiyj51OLticzkBeV/LnXddBG
	3XrI67wNZxTPF0GgQReD3ONBIfVEoBV4yMfuRqe3yCmw1vGPJkG8t9TbnDl5Gxq9lDl+y5syJKZ
	SaNRbpaW7/bw2YyTXqEBg87CQR1SxCIPsiS6m2ErEJkwPCEi5KbCWt7wyi/kjcAbhfI6TYq7z11
	o2JGaRqMOoEV2zRabfuHURtINHQPGvJQ9iMqV/XOa+8XQ9/NqZ//6AA8QG0uHBQFAAv1RJKOcUC
	eLijuNZ3skcSubNanyShO3H4ZdYk9mDJ5Gxuy2eR/83Duz6XiDRr40YZeGtk61tY3nDkgBapiIJ
	veZbD8UGz56Ixtu7VnAxfMFIO3mOO8RoX0PjwXtwNWEUS03MmI0AmErtCz6W0K13+V5mMxQ3LWH
	if5ja14j58H
X-Received: by 2002:a05:6a20:549d:b0:3c3:7f50:fc39 with SMTP id adf61e73a8af0-3dd5f0808abmr276964637.0.1789506051685;
        Tue, 15 Sep 2026 14:00:51 -0700 (PDT)
Received: from [10.107.92.252] ([2409:40c2:5413:87f7:9fa7:eb18:a8e7:30a7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1483sm465432a12.26.2026.09.15.14.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 14:00:51 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 16 Sep 2026 02:29:41 +0530
Subject: [PATCH v2 4/4] dt-bindings: crypto: ti,omap: Fix missing
 subdirectory in $id path
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-ti-dra7-omap-sham-fix-v2-4-4eadb60081e5@gmail.com>
References: <20260916-ti-dra7-omap-sham-fix-v2-0-4eadb60081e5@gmail.com>
In-Reply-To: <20260916-ti-dra7-omap-sham-fix-v2-0-4eadb60081e5@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
 j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789505986; l=1640;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=rfMWPtcSIAIJGdrg7gkea6Scilcnn7TJdjakZa4mvTI=;
 b=lEoeEdchCi0ox9ZpRBIC2oxd/dKgaGOWHkFsUI27sQyb+Kv9Sr0jv/s7FcF39KlU8Pk6k5j1o
 z0mndXDNZNWDcqZkBce+bjL6WLUsSHFT4MU/JdlrDSh1CJ1t8Kbi9Eq
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

The $id fields in the omap2-aes and omap4-des schemas are missing the
crypto/ subdirectory in their paths.

Add the missing crypto/ to $id.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 Documentation/devicetree/bindings/crypto/ti,omap2-aes.yaml | 2 +-
 Documentation/devicetree/bindings/crypto/ti,omap4-des.yaml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/ti,omap2-aes.yaml b/Documentation/devicetree/bindings/crypto/ti,omap2-aes.yaml
index 90e92050ad2e..54e1d6c9bfdf 100644
--- a/Documentation/devicetree/bindings/crypto/ti,omap2-aes.yaml
+++ b/Documentation/devicetree/bindings/crypto/ti,omap2-aes.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/ti,omap2-aes.yaml#
+$id: http://devicetree.org/schemas/crypto/ti,omap2-aes.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: OMAP SoC AES crypto Module
diff --git a/Documentation/devicetree/bindings/crypto/ti,omap4-des.yaml b/Documentation/devicetree/bindings/crypto/ti,omap4-des.yaml
index 2ed6f77583d4..3e7eed297c81 100644
--- a/Documentation/devicetree/bindings/crypto/ti,omap4-des.yaml
+++ b/Documentation/devicetree/bindings/crypto/ti,omap4-des.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/ti,omap4-des.yaml#
+$id: http://devicetree.org/schemas/crypto/ti,omap4-des.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: OMAP4 DES crypto Module

-- 
2.55.0

