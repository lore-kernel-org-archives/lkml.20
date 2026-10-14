Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89A63537E8
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982961; cv=none; b=CyMtILX8MNX4kSXXfIh+pcbp5XuB7VzDbjao8DLvWdBd35ZOQudC4CAenOPEoPgOEmi8DR0lnj7vklGMYLF1VmOHnVkFmbmmafCxdiJDWTS06aYBqvYTvFllx/NHOENtgHuoF+onhKWQbzNZm2pgiSXKtwf6bsUiNM/BuI2zBjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982961; c=relaxed/simple;
	bh=618lZEj4J6PxaEmGpFoPKRIGN5uod/rBxdxIH2fNG/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m+ZIxpGkzuRYF8pHvxHab5fMJkxPDOhKEJCTTBJhFFCnWP4jY2BYz+2nku1kiUxdJfHyabVBboo8ZSfPcVlk15XoVEwrLSJlOIwGlhWfMzHR841HCrS/sjoOuGsHnPygLOR4AT1OLISQplnpT8pV3pjfcqaNutI74Gx81P4hXRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=orjDfi9e; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="orjDfi9e"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so39701295e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1791982956; x=1792587756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6Xglxzig/oF1VgPKgOC631Csxaxo7kJhuv3JvcuV7I=;
        b=orjDfi9eWorHE/KfDG4kaaZ7XN2q1+XnDDtZVmI9v5CKru0IcCKvZjcsK1/Vj5rnlH
         28PxJBDORxfHb1/0s6kiXdOGkk5eEm5360KW/iympZFJ8a/yH9bctOmhX4s1Qyrl0V1s
         +8RghXgBgTe8IP0Of/TH4TNB1nNHtAsbYV6mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982956; x=1792587756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j6Xglxzig/oF1VgPKgOC631Csxaxo7kJhuv3JvcuV7I=;
        b=VvLEm/OfudMF4ZlS3jGNt3Bvv20kAcVKUEKknpgw2IOBt2qh7dy83Fd5JYAEhM/gR9
         55GdWupLj6XJDNEKlsPdLJwfpCw8J3kmSov1G2VgTOCkMKvNeOm9PSySwZgXu6yegYp8
         XmS5rBOKaR952RpzaVFURv06Bp4xkX1r73zDU1wgaQ3bg4g2/fM9GqGxwQzMqrkiCYRu
         /uUJPWJhEjBBYOBI4DMXYuYtjSHd01oHA5jahX5BIgrAxZIfEFgw5M0Cuu2z5KuFQH68
         u76XFI0tl45b1UkwAu6DZS4eEdDFXOGFqaaON9n2kwYAfKIz3RhXfEcqvYDPs7cV7vq3
         CU4w==
X-Gm-Message-State: AFq9FYIVuRzPCSjqTnLGrikyQOUVs1P7zlJJ6X5r96+sdAxfqWz9WDT0
	8rQcKS2UAb/cQ1v5Cw0J1PTcz32feFsmhG7I2QjM9eDzJsOOMT75PG4GVffuX2YpHbXToG1cNAj
	irmWb
X-Gm-Gg: AYBFou2Ar9jwdyhPgi0k0sf5fhCTmPRur+4kf53ESTsdEe282VBtMSBf/+t2Ky5Oclf
	/Aj/osbo0kBdgN5cR1gOGg2m+Oi7z/7wxXerbzGZMeVrO+Z4YlMyCSnOi5v928R5AlvvEHOoWA7
	NRIg/SqCt78YBAuaxITuK1u021BAl4nA5wB4GraOK9PgXbRXmcfuSEXR9MlPy/q5CdkOuTgNIFd
	iT7W+nrVd0QKnN00+dDwRzirtVi/3oIrBshvHIwDn17X5EJPDU7NkiVolx6cz2Sh2rpfWXOVLYj
	pfsJyXf7JNFLHSER1awe/nST1G6KMG/RpqcrIR4XhKZftnanBRKY4+KshmlxnX8RSVb9UUfjKIf
	CiTxmOIqrdlCL7EXNV+K40LGPibc4yzkMkkOawea5VD5EoE2K+VdJBw8grznaSiaS4WM8wPe2gK
	TvPSWmxPCd4wa5BX7IKQkOaPgfVE96bzHlT++R2m2EAFH8rxYlYhbjDYOvn02DVxo6ZgXwBJ175
	Uw833U/TF5aJ2k=
X-Received: by 2002:a05:600c:580b:b0:4a1:688d:a43f with SMTP id 5b1f17b1804b1-4a18e4c9908mr226269495e9.35.1791982955907;
        Wed, 14 Oct 2026 06:02:35 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab5b03sm12608292f8f.30.2026.10.14.06.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:02:35 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v9 1/3] dt-bindings: vendor-prefixes: add Draeger AG
Date: Wed, 14 Oct 2026 16:02:24 +0300
Message-ID: <20261014130228.2780803-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261014130228.2780803-1-petko.manolov@konsulko.com>
References: <20261014130228.2780803-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a vendor prefix for Draegar AG, which is Draegerwerk AG & Co. KGaA
Link: https://www.draeger.com/de_de/Home

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..276d62b848d5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -467,6 +467,8 @@ patternProperties:
     description: DPTechnics
   "^dptel,.*":
     description: Guangdong Dapu Telecom Co., Ltd.
+  "^draeger,.*":
+    description: Draegerwerk AG & Co. KGaA
   "^dragino,.*":
     description: Dragino Technology Co., Limited
   "^dream,.*":
-- 
2.47.3

