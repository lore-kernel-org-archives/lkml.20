Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6414238166
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194999; cv=none; b=CYg87pxgBvfHFMpsICsP2DTMKYAwyxTZdFpOY/tCGx15PQfiGY+w8Kyf1q3A8VGnP1cwU1coWCxp4ynbHxeI353phgj1/ck3qLF23o32S8+Xpo/zhBjG7l3b5g3e3uUUqG6T09Vqk69AJbYc7vIUO1CyZokb/8SCpTog8sWB74Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194999; c=relaxed/simple;
	bh=dplioYOzQkTgB7OtXIdIJ8d7kiQ1EMlzvR3wJI4xDb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DXNqQxZ/QWQ6dAL8NQ4OrHLpuAVlDdCcyiO4bAC8jj6BjCGwrTVBuYVLYp9gIyveeQq2eqdEdOc0NF51EoLGB82Iz5NHozf1HjQ9uB4brH4EAGR+W3VHyeWjVAOt84ddX4R7El+QCZqte98ymY2xu18UPFe/mfVZhWRL3E61TZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aVx3nFqc; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aVx3nFqc"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a1f611461so98506366b.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194990; x=1790799790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JVRS8IDqRClJGzLh+AyZKtdvQwPlkBwHKoeRoTOl5Sw=;
        b=aVx3nFqc5RSXsBi/t/8ozLsswb7DlaVULRelW9mYvE+4Jbx1F+WnagcCQwk7PyWotJ
         H94aBTvMh9yZ6PwmsTq/mhwHwquGquOYGGZGimjSGJInruRlWbc9X3zszpqh2BWOxr7n
         itoSNkNwkUBvR2hbnjae5nEr3pmWvHWUGqNApC3n6Ad4yYT6bEY5hnCnoST8/MSr83/M
         PHj3t9ql7qe+gAfFHAewLqvR73ZQvVzO/YMwD9UhuJc66I0/zWOAFFohxDp2n1/lDNG9
         oZA+zgzGOsGDORpoNYL6XZuVup2ipPvDTuPR7eRhqUsVX/6qIA+1kn1ynNMAfdG37feM
         WU5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194990; x=1790799790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JVRS8IDqRClJGzLh+AyZKtdvQwPlkBwHKoeRoTOl5Sw=;
        b=dSuibtZOojs7s8UBxGMCH8C/vWvJmaRvwJN8TZ46NqiQZd6nx/fQkE9fcfJH3yrfBg
         l0Omk7G1ewY8yH/2F2YRQCAdB7F4VZtDniM0Lon2NFiM+3pejO7WobI3f0P1IiWu93kY
         df/kqdLr2V4LPep8Jku1C71A35uSVxQIThHDjMw5o9JGIDRPi+118nwQwp2huFKeFqiF
         7hunMHGAxE8FWgzLN5KPPKwIpV8yWZ6y8N5xu1DNiI3U9GOGw+Z7GCFU9yFgAgr9y+gT
         BxhjxZYvtqoX6G9PcvFHTYnvlplR4Gqq0hi/CQvRyIqOfQsjAyRyd4GM6klu5IM94B6F
         BUTg==
X-Forwarded-Encrypted: i=1; AKwUvByPByVyTUYUT/XJBl8SZhPtoF97EfukvSzOElNlaawBg/iH9K0z2SuUONTfWj7agM5JwymbFJl3rGNAKWU=@vger.kernel.org
X-Gm-Message-State: AFuF++kx9OlNCAcBS8XVhSJ14ku6EB99YxsnMPGdPuXaohlH0jE9PqzK
	CNo81Rxalq9rQrlL2fXjBqIKUtC50Qppw9O1vme44weihVe3vXeaRTmc
X-Gm-Gg: AYBFou3v6voFu2uYzlbIjJ1CtO0oPQgeCse1sIIdRaUZ8Vp6LHHKA07qxiX+dADo7US
	HJwOZmQaLDM1auGFUYmtYEeobVv5MCTTB1SGgvaaKb+H8a3eTSwpV1gmaotA3cv2kEq9580f2MR
	HwQJ4nuI51mgHIZyd+vi59G5Wh51OBbeNRcGlZveQo4o26QOFArZJp8SMb0ntF8kkC5aUm5S4Om
	43FL5KsVNZVkohXfDrk3v54efLEP8zGO9PokxcasSV2QKkNt3FaQTuXmDRDPFU9cGWfHnx1lCXY
	9wff7Y0klNODZ3FDfWoMoWuoCwr0sT9chwNEDazAQbsAtX3ts/yeEqZwNG9J0FIWIgVFUQHhZiP
	Rx6f07hkfvZwEnB/PcvlAYpv2u3gb9o+Ndg/B5mebbJ+lmStEvjaQ8c8W/jltQD9LW65/L0l7uH
	5DL44oACB3IDk2gA/MQJDc5KYZx9YI26EpcUugad6UaPgWS5OsOFmiIRFMnEzMx+xfHFqncizme
	Gi+QUrUT22jaaOfT6wMxvhdHrn2fiuc
X-Received: by 2002:a17:907:6c17:b0:c24:6382:2648 with SMTP id a640c23a62f3a-c2ac21f98famr25358866b.5.1790194989894;
        Wed, 23 Sep 2026 13:23:09 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c8a44sm177243566b.20.2026.09.23.13.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:23:09 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v1 08/11] dt-bindings: mmc: sun4i-a10-mmc: add Allwinner B288
Date: Wed, 23 Sep 2026 21:16:58 +0100
Message-ID: <20260923201701.43391-8-pmazzini@gmail.com>
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

Add the MMC and eMMC compatibles.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
index 9e9610bb1eda..c2ec7151dccf 100644
--- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
@@ -32,10 +32,12 @@ properties:
       - items:
           - enum:
               - allwinner,sun8i-a83t-mmc
+              - allwinner,sun8i-b288-mmc
               - allwinner,suniv-f1c100s-mmc
           - const: allwinner,sun7i-a20-mmc
       - items:
           - enum:
+              - allwinner,sun8i-b288-emmc
               - allwinner,sun8i-r40-emmc
               - allwinner,sun50i-h5-emmc
               - allwinner,sun50i-h6-emmc
-- 
2.53.0

