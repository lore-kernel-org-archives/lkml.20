Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A02355803
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799801; cv=none; b=utICvuyCCQcKuZkRsTJG9HX9p47vjHKRrUVMfD6fFhOHi0b50SWblRoD6y1aYsagZkCqCi/00D+hPBpUrv1sAwrBFo92BLqXYBGtbBtvloXG6YnLg6FHrFHEMVdjmP4zUcI7UFJ0uBp6mD6dHaiDUp3s8nWNVraLlRQwY9zptg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799801; c=relaxed/simple;
	bh=3h/9Irsh6hLdvhKk61bUEKtRVcfu/x6aEEt8IH3OiO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kEzEhhrErgY8tlfQC9njF43LBz7OUCTV2w8J0qM64vxh7PtqkfWwSSlTaXxm9C6zEJpHDrFKR5j+P5vys7ai7wnnOzIGAc1trtmpix2GJ7jb1skgdk6nyYN9EM1KzTj6laLpPRlASvPXX4O3FdN5Nwd2atJnPI7oqPTXOLa6Xlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkhZex73; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkhZex73"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a16c399641so17500665e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799782; x=1792404582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Em+DHux8TygVduIPIQfg6MjS0noelHiEnVwLPezX/Nk=;
        b=EkhZex73SaknsytK3yE/eQKCBNED4ArbU8hmqkWly/Qb67CDG1h2betmYNV6k+rHqU
         jFJiPg4CryUAdMQHYYnT1mFIHHUHJvkzWxIIr4BNzZvf0xkmWCTnLQYzG0KKNtj9Wwg2
         BOldnR6I6XS9v5LGq8IAgwcsQ2GrIHTS5Xw+SYBXkvb3tvu8TJ6bbbqC5ZfMNUPaYFLI
         mwGkt+RCqPqogI+xDuB9Km70sY9xDSdx0vCN8IlOo0yUMjPlVr91F0yap7Jc4sanNros
         lYu+Xu2Y/r5Lr5zFaFVvo/x5cxqoQBIl0vahyH0VFQlIgBDm19o37X6JFrUIXnHZmczY
         N91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799782; x=1792404582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Em+DHux8TygVduIPIQfg6MjS0noelHiEnVwLPezX/Nk=;
        b=VA7rKFG7tVta6IG3dBL0ym8v9nevMOoFK/8H4lem/tBv7UyryDafSlgqJjYEprOSOj
         FmX9FTZVS7W3qUQLOp3kaJtz7mAvmZjQLDC97G89wjeJh4HZiEgsnqdZ6PXd5ouGCYca
         H+ziHL4SwS5MoQKY4wJIhqgMu9KruCNn9/miG63YqFD0TK0o8oCvV9DcfW/FG7tLxbgm
         aP3lRDACfxuexmHaOZOft0t0EKMZsl6OpJ35fsawzZn+/tseDZoupf9LqgYZ0l47djzG
         EuaABQbWcM3eMGPL3LQLM7TGkU/fU+FzDMg7NrJPPQ1QMcAKVCaCFCvpd9VR5Jsi6mNB
         8RsA==
X-Forwarded-Encrypted: i=1; AKwUvBxKj/Rj49xiDvNaZEjjzRAVbIcK++y3f3Pka8VcMzIu69a2v9lxDY/lE3MTf5STJcXHrWyEhuALDdQaK4M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJ8pJG09zn54sRm2RrmfRr4fG37jkQ0zgpJ2hKQSP9rtwxyWs0
	LOylonR2BuTjtKDDLMOdoORd5Wl9nNsI65Pt1EGSsXNei8THa5uO5X3f
X-Gm-Gg: AYBFou3YkhJg8ZxUoXkduxugxwXZndJ1KwwE3fm8Z0j2bNAytykmBpMxPTBxyQOXypx
	b3OggfQxJ+ajdnsa3C0I1M4p6WvYlmqONCZcZ7AUhS3b0PI/Jk64jEquF8k2tm6k8zJ738w3+sl
	/sMMHs+vpLUArPmw5bOhnU7zbUVA4e+GgNeKnUzhbwthsGIZZlJIHBRSBDcxHR+JZXL/f8J6LOO
	ZKgAKqenQJ7q9eKjcE/PdLNByXgzN0DeIREoT12LbBAOVO0kQEGicqStJ1PuKg4mZtsgfsDbuOL
	+poHeusr+Hg716aaJ11f0Lb/FE+Ehb0oV4d4iNkWILNwxxvlV1yl5ZfHMpldwiQei95NKHf3vxD
	5bTFBh4vRQcfykX2dXjqx+bPmNATb0Y9yR/GeAIce/m4FGPBrd1l/V55TYC2rwJS6DDyobpDbrd
	H9b4pjX+OfxKxdn4qXcbp3BwwoWqOMr1ZFxCsiniPhd2ytdQHJ/Q1p4TC2GUBIjRDieiIun8wyt
	20nS/ijw9cF9ENwUu0k8vEt0p3iLc3eYxN2XjZ3XME=
X-Received: by 2002:a05:600c:524a:b0:4a0:251f:a726 with SMTP id 5b1f17b1804b1-4a18e4a54f2mr179156715e9.24.1791799782124;
        Mon, 12 Oct 2026 03:09:42 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:09:41 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 08/11] dt-bindings: interrupt-controller: add Allwinner B288 NMI
Date: Mon, 12 Oct 2026 11:08:13 +0100
Message-ID: <20261012100816.331033-9-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Same register layout as the sun9i-a80 NMI, like the V3s.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
2.52.0

