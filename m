Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030B7495AE4
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 19:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791141046; cv=none; b=hzrZ/XAWm/UWrmwjbBloIPBkcpcS4Bh++BxKj3jt7N4YC3BszDn+U2NZ5mzH5+y+jfFzzGkGu7t8uOyzxIi8B9gFb4XGajHnbqUjrg1Xm6hF9V2KrDfuz7WN7UgzjfAacDO+Pnm/wBD7+LBPz3Qa8kFLdlBWkW7Fc5cJh3PsXbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791141046; c=relaxed/simple;
	bh=yfRz0gCmlse4iaV69rfQZ45cJ6QlHrEv8Tvd40l5z5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IrKJQsGUdGHEztpNzQsFMROZxiZheb5aACChIWW6NMs6oCEBIGEKxOLMjcQIJxzWp7NnsZA9LbIZCrNbSnRAtvCvKR6ERrkoabMho3xlCaInBiqTV7lPMEUQ0w+oXihEanXnloazpCQKOY1mL4t1QNxfL98kjo2HJrLSVY30yqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aVbXhKrN; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aVbXhKrN"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc797656e44so318737a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 12:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791141044; x=1791745844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A7qHCKtt5edtxB2hHoADiQ7fMvPvqmsdZvnwWIudO2g=;
        b=aVbXhKrNSmSjcClkuNmPzZ3P3I/Vj8rp1SyzhWu9uYU/e2opdPBv6C39MU7fE7CxSS
         N3KqM6cJ2QQcCdTHY4xT42rWjL4p/21mDW7srmwFQfSao6E/g49bLW8HYf3W5y/h4BDK
         gJR7aT8eVwWnRQcVetxe1unF110ZibdDkxXItxkCrNz8k/QiipgvC5M9XvnfAWgp8BRG
         DXPVAamdumDo1mhNwK8AW7KkssknKTFlBNqQGw88xUKewqSSv4X+Km66cT2kT/Q+P/Ok
         YQecUpQHNzosDWtVTdoIi9GBaiEB4d5nphsS6T1zDQhTAtYXvG+q3sZz6iuySCd93QdA
         JNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791141044; x=1791745844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A7qHCKtt5edtxB2hHoADiQ7fMvPvqmsdZvnwWIudO2g=;
        b=jjy21uGMvPRIG4asxmaupVp63fcQWFVdq5mVGPn6Ox5rDiapgG43JtAqOcP1GVmsic
         3NH9OcNW6+fQCBgfQNbYcFHkgSzvKVZi9TVbHhqInhrQaOntvqyW4Lu46pOsw+S1fwyc
         88ieAMjZedQ/Z0dv3cIDVW6tkNz3uawlpo0WCEs7vNsdxWnRKE815s3r5nKNzssqpTfa
         4QguL4vBFdyzEVjL8wMjlP515j+kQgtJOX8dx4nnGmS77mTxhnSVrolNR6aL0GjImctA
         IV4fD5ggmnF3z+rr+Yqcf8Pc6d+XNzjO9AVfbUYfkVFLTj3t8kFqrYpgi9DC7QFhh0a+
         yfQg==
X-Forwarded-Encrypted: i=1; AKwUvBxDXsOloXzKfalyCkF48wH8/t9QhJrUnFBAe2KhYxtoYN5Tr0pIQBDCiXkaP/ckB7J/6ta9neeVymK5ef8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgiHftANcrWLimyTN2x+fON6g9z21VuwSLy+EntfITPkZ5cAM3
	ocRCR8FtOGl6iHy/Dj1ztQdV0YIthXHuO1Ceo8c+FmIWGp1Z6uY5KKkL
X-Gm-Gg: AYBFou3FQV4BV1mXgSNLft1zVdGJ1LOSZNl5kOlPrI5SEH2TU4gl/xJtmDfEA/eSm6j
	qLd5tzuPj/MTf16hCUyw9VNANhnPDpqu+nHt+MPW8OmkJAmRlLG1EDg/JBwRlH/4XEV+J3Y+sz0
	4sL5VRJImndB6qpa/J8H6H5q7JXovqY4uCbkYxyCTnArAN4YniubKtOCHRnYiOLtDM0MAlyHwjh
	+MMSRnswr9GZ0/Pc1KKCat+wEzmxBwP2G38L3a/D9Jl5iucs9UebXbN0isYcQ0C0yvFaLoQHJiG
	8MPVw104DHwrxja80QlrAa5hyyvZXsUlJUdt4HpNtyXKhff9dIhQb0ktZTWt7MQ1w+aBpUQ9L7Q
	dNbnQjDeNLb1tm0W6wwV9uCG0akzTINLKBTENdgnZXO5+5uXD2JjLDYBDTg+id34WpWAHHAYJBi
	GXhdUOWX4NNLLlKP/hxrqRZf/9GdR3urEsL+QRgh2Nlt1eCvK+GUu/ioitIkgXubwwmPnDt1gLR
	XEd/nVPPEg6akF/A17q5H+s0mUDQ/wV5rPHqpqca6LY0tOliFu+pCJioTF6uDgGCFEMZwlvt2UN
	DRNFJYSNYI6gS6djKO076ruvypnbk/PU1lvzzJl/N+Ox8G3N
X-Received: by 2002:a17:90b:388b:b0:3a6:fec5:c179 with SMTP id 98e67ed59e1d1-3a6fec5d128mr5479549a91.41.1791141044008;
        Sun, 04 Oct 2026 12:10:44 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d7c64b1sm8318957a91.14.2026.10.04.12.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 12:10:43 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] dt-bindings: gpio: pca95xx: add onnn,pca9655 compatible
Date: Sun,  4 Oct 2026 12:10:42 -0700
Message-ID: <20261004191042.143713-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pca9655 is the On Semi variant of the pca9555 16-bit I2C GPIO
expander. "onnn,pca9655" is already used standalone by in-tree DTS
(armada-388-clearfog, armada-388-helios4) and has a dedicated entry in
the pca953x driver's OF match table, but was never documented, causing
dtbs_check failures.

Document it alongside the other standalone entries such as
onnn,pca9654, without an nxp,pca9555 fallback, so that the existing
DTS remain valid.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610021617.AlVUa9No-lkp@intel.com/
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: rewrite description. Use tags from kernel test bot.
 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
index 4631388a7d91..563f61e6e543 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
@@ -67,6 +67,7 @@ properties:
               - nxp,pcal9555a
               - onnn,cat9554
               - onnn,pca9654
+              - onnn,pca9655
               - ti,pca6107
               - ti,pca9536
               - ti,tca6408
-- 
2.56.0

