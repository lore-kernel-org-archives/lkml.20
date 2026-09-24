Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27286444707
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240805; cv=none; b=I1SYsCAnFvHsldwezTo+ygzCfcDiTLlj5LksA/dyZKpFMTiI2g7Nr8t2mYgifT2pP03nTG2yGss5G2N0IaD6utIWQ6llhIuhwKBYBbJbE6tur7LsGkdMQxXJnOtsbKoA6R6ERD+xQOoENAd/fKihlQfFAkTWeVqytF9Q+WhfE6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240805; c=relaxed/simple;
	bh=4dRwls4R8/kpI+9XIG1uUVhIvaRqvFRURWdJz121/9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d8heSngwqFmgATBeRccQv+XZKQpr+LtBo9t8g2rH+RE1mUmI2s0NIoI4HwiW+2ug2tIjhwqFloz9402BaD1Wp7C9i6bcnCNmJZq4YQ7XAEWOMMWlbGoJ4WizUavgyB5ePJnLNF2jimuP3RFpwe21PfPpIrbuAaEAn0TPDa9Wy/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XAMmjRIw; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XAMmjRIw"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so1177460f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790240801; x=1790845601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1fteixIIwblHawz7BNGvMfhTpgCIGOR+rDxVKC84SHY=;
        b=XAMmjRIwfNyOKl9N8ATL1UgRjLrG4GuxegFmvd31KlsWioczYxyAQskcYHoD0POjit
         l9tMWAWP6Mpt8mX63ZX+fk89o0/PLzP7qZS/sGL3zEw6+0pBHyr0zjLCO9mIJd/xYbJH
         9rlXRV82ESkqgGIU4uR/GqQpcn97fsZQtApvfySJPAlLg67yIFGy7rim/pP0/HpkIyGK
         a7twxlPGJsw9r6f4KMEAQ21/WZ+k1AB5c9f0NyekGr5XhvoBWELbjGH1KiNl0RTCjw+b
         L8/By9B5/hXmuuK1t9pq3mMWDSo1InGAgvG5X+6z4e+o2NiSCqXrTS95437fj8I5iXFY
         upkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240801; x=1790845601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1fteixIIwblHawz7BNGvMfhTpgCIGOR+rDxVKC84SHY=;
        b=kbM30wiubcz0a/F0nUcYnmcqHNc5VWba3z0IOnyzK11kX00+6K+GKpCTd2nstf0QQO
         4Kw+KVnrt2DW3mqO8cEF/CEDaAwkuNAhkFZsSpcom0g3bhU6esIZvLd9QMQo6lDjGvXu
         oYg8QMIbYYjYEq0h0Wuth+a349RGRRpIAFjCtQatETDhxi1/BGPrL2VcaQ5X5YjcaDak
         RyvduIh3QXK3s0y8/c/AF0OqbAssqaY8I6mhalYSa6dSY1PpIJyn7X3bxGFVR5PXh0tn
         dI6KoBZ0y5nNjCLMn6o9fflvyK6rVfUguNdtE52bBJMN407dmwFer2AQkr1pWNltPQ63
         4WtA==
X-Forwarded-Encrypted: i=1; AKwUvBxWdPRBHS/6v8Nkc2qH83f5VP9ICOnAOXouKruN6TSLd25xmIz7t3VU5Z1rhM59T62PNto/A6cAbdFFajg=@vger.kernel.org
X-Gm-Message-State: AFuF++lzwyJPTtFL9NG9gaXwfzFC1WgqEc2A8G8GjE9M7ZGiOiNTsRQE
	2ZbCheARMD5d/g3NXw5B0djKr61U+6DRdoQKNeLiVh3ev2Ey9xU1EFsI
X-Gm-Gg: AYBFou1x6yskz7ucPhZ4kXhLXkmJpKpTMjfxO67OrcLSMdszJIjSiJmf2vxvpDsbx26
	SRDOYTC3b4dc+hKT6KRRZyJYMs850oEeS886MB3Qv2h6DTxwQlAU8sF7xCa4+zx+T2ZNt9watSD
	yAFUrQF3BTc4Nr4yyypQD+r1MRUs1QMVymvIn/DPlcGZGAt3k08ubBBiagyFbmamDauBvlOoYdr
	by2zgHGiBheZ0ra0v5/P6jvZOjl7z9wn0Kix5eiqY4ph+tWSM1rxOjCqtcnNe4L0Nd1bTOFyZca
	HLmgAbAifEZohgRkSDGUil6slP9AbHcTHocQA33MDtsIKwjanV9XISPy1vT/rpH0RexgBA6YJYH
	S8vg9mtlfRH6aU8JKmAWrT+oimgaQTnS70YeQyv1s+uvswi6p0j92cgcHvwhgDFXj1aGz0vsNXx
	zUMA+1FBoeFHYkqvhXbKHBsC0CPQ3/DGEbovC13kDn6NrizGOzsdVk4Nj0KSNyDOs8sf9KiWj/F
	6oC+HypfeOnO2x96Eg0yB2zq3DbaA==
X-Received: by 2002:a5d:64c7:0:b0:487:27f6:a4df with SMTP id ffacd0b85a97d-488716b8a05mr3203154f8f.47.1790240801226;
        Thu, 24 Sep 2026 02:06:41 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877c379sm12875561f8f.29.2026.09.24.02.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:06:40 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/7] ARM: tegra: lg-x3: Lower supported suspend mode
Date: Thu, 24 Sep 2026 12:06:04 +0300
Message-ID: <20260924090608.28734-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924090608.28734-1-clamor95@gmail.com>
References: <20260924090608.28734-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LG P880 and P895 are perfectly capable of supporting the lowest suspend
mode currently available for Tegra devices which is LP1.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index 5b4da6ee991ff..5f3273a4dcf46 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -1695,7 +1695,7 @@ bridge_output: endpoint {
 	pmc@7000e400 {
 		status = "okay";
 		nvidia,invert-interrupt;
-		nvidia,suspend-mode = <2>;
+		nvidia,suspend-mode = <1>;
 		nvidia,cpu-pwr-good-time = <2000>;
 		nvidia,cpu-pwr-off-time = <200>;
 		nvidia,core-pwr-good-time = <3845 3845>;
-- 
2.53.0

