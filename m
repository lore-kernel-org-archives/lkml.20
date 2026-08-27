Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7C2483BD0
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787843312; cv=none; b=OLxBjfclB0sgCQG3gIty2d1EvtD3cBkZesI7SKIZt5tKrv64TYI4MmEp/tffktYqSm7zC0bdUwRXE1FMHZGRRi98JgkORDfSL9dGUo7Lp/QztD2B+DgniIeuAAqxOCRZKGf3YIvTZzKsi/dyFxyPxT4GTv5X4CrJEHVQ6Zp2fmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787843312; c=relaxed/simple;
	bh=otjLY8M+I6ZgbZOeUnR9kBIt/DE5V0fH5Sljc8GFFI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NUV+NlkQtqFregQ+esY59HOYddbbUe7rveyekY9dJBJeIl7NrNE2YkBrEWlhhTiDWGrsuCimmtK9FQHI7a9mRiTkkFYxYmt/QKISOelGNAg7jjXOkqo3CbNlTJRk+qsrfw8jojjst5u77rPs6u409sTfFiZ2nQenIwPLsKo2M+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s2C7/81y; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s2C7/81y"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482dbc9a00bso775374f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787843309; x=1788448109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TqkMmON3N0nWAQFU0GAIUZAQN0hk7LFNlz724oqocVQ=;
        b=s2C7/81ya9j4gwhukBuVlTIpQcn3U4BeulvLbirxaua2wcdc3py17DjPpAhuMzamPt
         XDVNG5/LZED0hXHChdOJt75rmbfJzClxsavjyMh1kYB53TZEIB33QKeH3AWRS0UyIyha
         +KCTpc3U5mCfwn7OSBo7ExIAoRyVIQcNGbCyNOUoi2mgmG9t+KC118v1yMyuLsyBGT8T
         xsNapxff5t5YdCyJurGBSULckztFbn8ZIpgNGwO9j/MUw2v8tZ9LHnSd/kwwDIqDpTPA
         hbsF/Ml9KlSUhF3h4XMGp46Y7ZSE6VimI6BN6/Su/T9GqoOQepO1qDmqCbCabNef0ulb
         +wNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843309; x=1788448109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TqkMmON3N0nWAQFU0GAIUZAQN0hk7LFNlz724oqocVQ=;
        b=aKOjW4UwmoJWnzl+bpSx9T5TWiL5M/5+IM5O0P6qpyxVvGtsPAEuBQk2OOIJg3DX9Z
         E+0h1nn63pPcBXKv6cBubtz7FE3Jow5J5ydW082d1JCxWLF+TobGf7EBmcU8bqwrPV5u
         P/IxJsYiRhaHG97+HlV3hesRHwR2u8Pe8mrIcrWFAmur4yOSErqndQYwgkotIETaH6+M
         1Opt0bk+3dyJJ1ZFk0jJBm1409ySssmZQZAbkoDEfBEISqC8vZy5Z7dSgypUdgaEtQVY
         2teFqs/fN8dVlVFvcjB2y5gXRwmJzeIBG1+Ln/vx/I/w9sRmUJ3ADrxPuN1ppGREuctW
         XUnw==
X-Forwarded-Encrypted: i=1; AHgh+RrbCkwZLILGQqV23sDbzGHCgPWNUntBLMF09C9U2ZPLBvKDAuSU5Ne/0cGwNIdyHqxN7SpByjTDzmBnruU=@vger.kernel.org
X-Gm-Message-State: AFuF++m3Ka78P2Ka797KY70f7hIaOS8t8KBdLGJmVKeH0/IHb9cuxlpv
	qbvqFQ2fIOQqKYMCvAoyL2Jg/BxfFZEZNX2N7cZMZwKvLdkO4Cj7v7zW
X-Gm-Gg: AR+sD13idSc+SmdyxfNdXb0iVeawRUjp67t6AHq4ZcVHm1Yr6U10xkc9+CQ6XiScaMP
	CkE48o2SJiQOM2VuYDQjPTDdu/fhnjmey3HTjp8DtYMTLksXeLkvZoXc2dPM1NB/v9LCCNs5PYJ
	t37eDZEVj283dpd/oGQGopu9h//V57CX6dnfsY+Ql4kwQ7EniM4mXka3sQBOsSZNz2d79yqWHcl
	AUPGb8eqy4hHZP4Yr6IVp5A6xKOq/XiJoMbfOTioPk4dhPModUMxmphHfVSHtgrmt+qf506Jx/s
	lfYAVyFHL8xrhGck+PIPYKQPDbeFe0+i/XKPVum84jmJDeHjqJrjZ+xL+AdaC+pHglcit1vN3Sj
	PsG3c3dFSSGNfjiWXHvLK92y5qzT+kWgDN53eBfU0Xguxub1akJ2hCulxwjHcs/sqDdaFNCkGRL
	1+5q1W52fLiGkjP5Td+ALpEjh95//TqpvFoIgHPv2RK3u4vYiSmsVvEBnANttbP+SYQ0jRqFHkq
	6JvA7ZH62nrgZU=
X-Received: by 2002:a05:6000:644:b0:482:e658:7a39 with SMTP id ffacd0b85a97d-482eaba7f73mr9712719f8f.11.1787843309482;
        Thu, 27 Aug 2026 08:08:29 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([165.85.187.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279eb11sm10247151f8f.8.2026.08.27.08.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 08:08:28 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: add MR-NAVQ95 board
Date: Thu, 27 Aug 2026 08:06:56 -0700
Message-ID: <20260827150657.1657-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827150657.1657-1-laurentiumihalcea111@gmail.com>
References: <20260827150657.1657-1-laurentiumihalcea111@gmail.com>
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
index 656f2596e1d5..5d9da745b715 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1535,6 +1535,7 @@ properties:
               - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
               - fsl,imx95-19x19-frdm-pro  # i.MX95 19x19 FRDM PRO Board
+              - fsl,imx95-navq            # MR-NAVQ95 board
               - toradex,verdin-imx95-19x19-evk  # i.MX95 Verdin Evaluation Kit (EVK)
           - const: fsl,imx95
 
-- 
2.53.0

