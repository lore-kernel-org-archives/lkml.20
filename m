Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3C557D22A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194999; cv=none; b=eualkWatGFzIvirBm+BY3fI/RJXCtvlYk6C4bu2P2qhEmlTUoi4aBP5UBBS51agll3xBPOcofb/wMu9SL7PRobjfSzUyKiXUDUO3RnhndY9V+nqUFMf2MTzKHmRitQn/q0c3ofi+EkthB+TSTbwIUFofnCuPDv1YWUjJx2xI80o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194999; c=relaxed/simple;
	bh=HqfZG9G5ZIenBJJAaY9rfjLXNR0FjaP1nUhMOUSdumE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZNUbR6fY3QSDhwyHhvI3ZraxzhVJh5mRXMONB9sYNFpL4csq/fgPUPbRxUySBNOlIXAYPmjPg3DtYO2Wl52hC0Li0aNG5RYV+HICxirv/I2SC2P8BdTm+ZkK2Lulg1SiAU4Xxrek7PZPY/pfgfCe5nM6sx1wdnI+yMq2B56HqVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+7yDiyi; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+7yDiyi"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f5603a0so200422866b.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194992; x=1790799792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSdVTPRqn06pkAsO84XJHQb2v3v0xthABnxiNhSpNuo=;
        b=H+7yDiyimWvAj4n0Uv32CAQtUJ9aYA0/YgwNR964k+YIw4nhYUG2w0qDxu3/NBxElC
         IrZeN6OeC0x7KihzqwPnH/7laZxSSrmc6IvM7yUvq6KZYe1c+2rHQaNyti+xDnjAnNk/
         +IGemOM7RsJ45awkWLOEZiChQjXvRyHHw9TtnLR2OqM+oEPKD1vGwOkwnO7EU1sqiQDj
         sjN6KIFFIy+Dcf2F5zY2Pz3zB1QcH5KrXSWRfFSMyF4+mMXgNdiWBjQj0wywTa3kRuoK
         DtEdGQKoHMOvy3sOSJFI4V2yB2ZodEpjqL3sEgLDrTGAF5pEK1T3ySrzJqFxMDJh8Htp
         GA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194992; x=1790799792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gSdVTPRqn06pkAsO84XJHQb2v3v0xthABnxiNhSpNuo=;
        b=zMgSTo+FVv2iSZmPeTrmfq/IDUiqQJFgVCAgULimTR7rsjRI31cHZbKmwpjtC2uL2N
         ZxPwFHMDjnNmi9vXuaALWXhWNTKKGSLZui3eDuU30078CAQNUBc+FDZxA89V7SsEN31f
         jaQGq3PZWdscRlpfNc5wEXG9wi71yaRuNkEH5mGV1afSKupzkENs1pqXu1fwm2Nz5SXy
         i07wT2Coolko3yhkMGL+6aGGVIgxJVxECii71KSA00jt6UHo6nZmGsZirfF7uPj73Iiq
         +U4493B2tJZjywkzb0BKzXDIUHhCusSd2V/97kaGnNxmkj/11ur1hOfs30VPQnxCoH4h
         dEZg==
X-Forwarded-Encrypted: i=1; AKwUvBxkIn/VEjOwNlANC/FFGS2fOunuPj3JuK43OVgJLustsrbmj4OzfOd/FUDrt8OLZnbZ3t+GzER8KXpPDX8=@vger.kernel.org
X-Gm-Message-State: AFuF++ngGbhXYcKSULdmXv2oV8a5/UjO2CDEPQ5kuGZjGCJhrkSUkTym
	q6dD7skQhFOlCp23CIeivgaayDe5+Xh0mOBkdsdC6X+oP3YNUFSXfw6u
X-Gm-Gg: AYBFou2VosNembWvztYoThJpGSGV6YAx4WHCvKeAYHMBpWqnkl6m8qRHSuK2w4+tMTO
	PHJoV6YkAtyss+/JFDWg9c7jAg9cHzYKqSb6vNplCBYfuCSLCBucezbKi0tuoEqfuiRNlr7/p7B
	W+sPgvJvAN1JV3j4D8F4vb0Qb3k4hOhuV9iOejp4nEG/NvdAYV+NKjX1XiyBy87dXuaFb08jEcS
	tdlAdp5C48puLk+Q1/GeR7/MchSsiQhM0kelrmnKhTeP1IQ9mjS5e0dpUisJ/nUbrOYVCNT8IMw
	RCiT2TbKbCdGpyPvcpAcAiq25m4/9asehN7jGsyeexSUGn42MUhpuFJ3dMfmRDw/QDq8hU30Ihl
	pquGjSegMzsBwP1e5Ucm1u0klcYU99dq6Qv1Wd8wZBC/i1nlw4oO3GwKwrHma7I/aFg6On9gWWL
	rfRoqbvhKEQ8SiYb+8oxh3v0xDRchUyLZnhzkzw3MQg4OQF5gXR3GMwwAgtQmQjf9i9rl8RF+5Q
	b7+A1t49KL215IT9gJEWlUZEzOOmKg4
X-Received: by 2002:a17:907:e8f:b0:c29:63f2:99bb with SMTP id a640c23a62f3a-c2ac26820b5mr19501766b.47.1790194991761;
        Wed, 23 Sep 2026 13:23:11 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c8a44sm177243566b.20.2026.09.23.13.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:23:11 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v1 09/11] dt-bindings: interrupt-controller: add Allwinner B288 NMI
Date: Wed, 23 Sep 2026 21:16:59 +0100
Message-ID: <20260923201701.43391-9-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923201701.43391-1-pmazzini@gmail.com>
References: <20260923201701.43391-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Same register layout as the sun9i-a80 NMI, like the V3s.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
index bb9273ec2457..179e7842bf46 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
@@ -29,6 +29,7 @@ properties:
       - const: allwinner,sun55i-a523-nmi
       - items:
           - enum:
+              - allwinner,sun8i-b288-nmi
               - allwinner,sun8i-v3s-nmi
               - allwinner,sun50i-a100-nmi
               - allwinner,sun50i-h616-nmi
-- 
2.53.0

