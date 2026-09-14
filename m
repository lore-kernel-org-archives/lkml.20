Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4804446EC
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385713; cv=none; b=LEM4Q9tDLXI25+FuMa0yedtDxYSPBquphAgCdSShmR8Z6ezmJ3ieh7hWzMBI+QDQOZYM3c/oTFhphG61r5qMNdGDGHsuoZDEH7+FhxOGKnB23J8OGE3TLF/cZ0sWE1mfzcsoGwp+MaSCJtMC/2rwDn6rvra/WFpksPM5DbaF7Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385713; c=relaxed/simple;
	bh=2tYt6Xz3Ww2Nu03hw+VbVfk++p/qUxznZgUfL+6yi/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y4qFBjBPwBwnHUWzSZWhYzaoUtY4Cu+9s7zd0jpsNYg4cBoPuiQHNIb3G3jJWr+vpMZA25trPWxaj5EPpDKc22Odm3vXU2B9ifxzn1N0qCa40N03isYbgdcRhP1YUz2UHuggfTEvCxW6ofg2qGvXqP6Mnx4nhYxDEoFbUY1N0iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DGoXq2aI; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGoXq2aI"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633cd80so766558f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789385709; x=1789990509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZIkGfv940lwcDRBFVlKYwWw1ZND7s87QEgBkPEkik3A=;
        b=DGoXq2aIZQWqUJjAUArkGHF/cCKgwHGvAOkMIVu5ysM+unvWLqUvysBdf1W1dmOs4Q
         1qaT5J8LxWVsJHGVPBH8C6KFG3LGYy8rl77Fh9iTZ1pPXbXXVwqzrKakHswq0t3kcwOY
         GEz9gYux33HBcob2QXyQKeoYuAgL651iJBMmBwprPqCuKwk/59++1wNVIKo1SWtYPmdr
         tHjmJBLthxMIP4CFEMqGeYWzcR+sR3OXAy6Fyf4elRDpBz4NvzqIUtqmbNTUvZLKKmbJ
         b9PNRcwfufovO3vlHg3P9Tbkk5wsxVGVdkzHCMuO5Ew0Afs+PRngxxL4yiHPrwy7SXhI
         6kbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385709; x=1789990509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZIkGfv940lwcDRBFVlKYwWw1ZND7s87QEgBkPEkik3A=;
        b=FF4zKXfjgY0AGZrLXf26BQsYfOPqJiN+smjcwXihMLwWvb01h0c1q6LObtNsWs0p2E
         4xd1waoJwpyp6oopbcnIrMaO+WN3mg9xNxdDrF7paCO3BAbUkLoMZmImw35EOObBhHER
         lqUyivB3aftli4uHncu0U1nSHkw4qSi3D+1bHkExF9yyG73y/9lewjkzjPb2QGQj0MAQ
         l5O+TjEVgtM5y9/rhXX6J2jvlVsA52zPHxyFQO+SpxfXX7+2reVy9X3tLfazep4vRDd8
         J3KLdthsbHbB2FpA6xUe2tP0FRDTL65GUeQeGIvWIW4VQfAZxSrTYPG711UKlmwVTOoQ
         6z2w==
X-Forwarded-Encrypted: i=1; AKwUvBzXnqObevURgTE60/HETJtcAan9BcCH/2kCB0g+88mRIQULNK6DUkSt2uKh3uw3M2NIB1jJvFi7RqzD1js=@vger.kernel.org
X-Gm-Message-State: AFuF++kpE7tf2uJtibTjTNzf6wc0OvtBFNQypU7oYSMfsmlxKpdLiTnc
	8ktHS5jE/XvFxuGHVcVh9trRfYfd82q2FM+IiMY0bGqOjpA2aQK03j5n
X-Gm-Gg: AYBFou1s4/yW1Zj35Eu7VWOAe3JXisNkO9zaq0d1744A/LunLKCtV3jcexY1yGtNVAV
	mMGl0Byy0B7CrB9GvovF6JxpNrjcXlBvuxsDVmPI5DamZDGeQtWRxKrsPhaOYB3uB2jhAzviHBD
	b8qRPkbpIOyIR5o9UJBQL8X9UgJLe0PCHVB0QBeu67WXOaiw5IP0DAPGlA1rX/lDVUdy9FKjP99
	3bG2h/aOcGdetdHgAfCvgKmjXhvplTYPXNSUNS2v7LAGDU/q7I6LeseGhPOSr7YGsTcy078FqSp
	pqlRG+Q62cvyieE/qQ1mtdr4GLWYAdC1BQD6UZfBW+nEmwpOQZt6AKjk5us6jhT4vXFr0rEBiR5
	U3p44TCcbZEhwUpYqKX7LhCZghO0uHHvV4hrriyLDVctVAjRd+TCtKG2dAnkmBd8FEZZ6ibmwOG
	cOworKXggZG8RFWIfET6IWg7EXhifRFY8dAFpd6ww1bgTtzYwlluBb5KArNZzqh36CkZuVCrNLm
	HYXkWkoG16HHqcNty5yfSs3pA==
X-Received: by 2002:a05:6000:2891:b0:486:f780:9be7 with SMTP id ffacd0b85a97d-48702ae4dd3mr2401139f8f.3.1789385709124;
        Mon, 14 Sep 2026 04:35:09 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb36e4a6sm27906531f8f.37.2026.09.14.04.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:35:08 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 1/2] dt-bindings: arm: fsl: add MR-NAVQ95 board
Date: Mon, 14 Sep 2026 04:30:09 -0700
Message-ID: <20260914113010.988-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914113010.988-1-laurentiumihalcea111@gmail.com>
References: <20260914113010.988-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT compatible string for the MR-NAVQ95 board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 338dd9eafb17..c91ae3ab7cd1 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1536,6 +1536,7 @@ properties:
               - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
               - fsl,imx95-19x19-frdm-pro  # i.MX95 19x19 FRDM PRO Board
+              - fsl,imx95-navq            # MR-NAVQ95 board
               - toradex,verdin-imx95-19x19-evk  # i.MX95 Verdin Evaluation Kit (EVK)
           - const: fsl,imx95
 
-- 
2.53.0

