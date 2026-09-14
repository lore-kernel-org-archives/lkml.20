Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9F748D872
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789405131; cv=none; b=uo53293pApc3vkk/lAMOU2+aqos6tdfWeAIxQEo9vyiUPVnDmStn4pBcVE+Iz3i9A6y1lcdN4CcWRNoThsjOtVuhCAp2mwjzEUkGZpeKwnV/N9AG0jJeCP5Ev8kn8OCCQCRYGUKVrw2IdPko7D1e4528Tz8B6m4OoVeQujM/YR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789405131; c=relaxed/simple;
	bh=vQZJxL2K323Aqi0Kksky+b29VDXNl7ZpFQVdjp4dKvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y4DjAu7Ru8RrQMnqpqgZDKurqYZmd61e3r6E3CuRM+Ewaaq48u0OnDNFGw6L1oGy3JTmtnhSod/T3SVPi996zbtAfPh4j8gwhYs8w4uvhiRAhUZb0mJb3GexD0ZcX4RKlQjRou0Usr4PDWfAidzRAR20/TbizgX0RNQOHsUMEYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N0Erb8jU; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N0Erb8jU"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-486fa798933so1586416f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789405127; x=1790009927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/eFndhQmJL2HLUXXHwE0V3+xvGtq4NGEK5ul7Tv7r5I=;
        b=N0Erb8jUYdWjUEi3FT62R+vexD8p65HxHbCIxlEfeWxOOubvsUiKr3O7juwlGMPLav
         dWwLasoiPhJkiQ+peDezDyWdP9bb/SvhXw+PyY9z5BYgLKHFth//AhIJKyhTIX9j+bkD
         JCYxWWNVuIOXKwqW4DOxvHfKmDqyawmD8FSMW7umwzr/NMmMmM6yP2eZ8J/Pu2JaVnpu
         qcR6ebpQm2+Dp0EA4nWo+vCcNCUXDCH03DH5X8EZmXHAHkFPThxjmBMTzF1uwvc7RRyV
         CAr+28nU+Es8bxFR3vt2a2yJgi40wFHZ5OXb1rYzlLdeBe6nz6S1EQY0ED7ZeK544ZVN
         xIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789405127; x=1790009927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/eFndhQmJL2HLUXXHwE0V3+xvGtq4NGEK5ul7Tv7r5I=;
        b=i3VPFTPLQV0xuwAEU2kHW/pIFDPv3JM1Q/3BFBzPTUS8Ach1XqiyAx2d6EVS9pS7jM
         W2mdVXoJyN0b3BOsVWIQ/QgObiNa3dwUYDbyoIJsRb4nhR6tgBuS1W7A60JyYvTNn//e
         UGhWWhD30v18SjO2P9lNhQYga/OrAG6uURTJMQoP++THSFRCRRlqqJbNjfC1GdbHSPrD
         YqhVHlS2PHtw+6E8E7GsO1LNl2lgVDZ1kjGmt0CkOuyhtMRdU3r49TtrByqzUa1a4w/O
         KI4SBU4TyYONjgmHVdec0fHtbXS5n6WDZDW88VLPuY0L4wcPHsKlEKHLSYJyD20sxg0B
         jgNw==
X-Forwarded-Encrypted: i=1; AKwUvBwD4iELEEIJYtcrmxpqe5Tpf0KWe1E40a3NWI+75eNLuk0DE+h2P0ntf+6uymYyXKp1xIe/MZyJ9XULX0c=@vger.kernel.org
X-Gm-Message-State: AFuF++kar752WUp55EIm0hmFCHpngoAUaes53GYQBQAZCyNuZdYV2kXz
	OmnGJ7CZcvh6/2BB8dwzJqX7OkTamQKhl8mzbGjixn7LPYiaQ5+d/+FAopaTnAU7XoY=
X-Gm-Gg: AYBFou0SOdwipplejGMlemjcHfkfbEGWsrT/du270ImFJE0I3LkQaVobLlhZaQTp9Z+
	wbSa3ir6ptZqVAvFoCyTzhgXLiEY0Wbtj8RNKbdq5+lDQ5f1rkjI4SrzI1cqW/H0As879CeJJYz
	quiezubqytQ0V4ZYE26rzhMtb9de+9p0wxTg7jAT8hig6ae6SVu/rMZt6zUEO1DL30/Hxek2TPQ
	hmb/neOsCRJtzVSfuffWWtZgHGBM1lETD+ZV+R2HcYpv5v6lLR/gXWBoZLnbwkB/9aRxI10REBM
	oM5Iz30cW8qc+vWa4Uz4MyRu5TrWGhY/nSDk3yBOEH6nj3Da8UvsGePNXKcSnty+8byChXi1bkC
	5buXvZmsrgP2FnzANjyfch6qo14f592zImnHNdnk+9X8D12vPoyyTMQ1oLKRpxJLwlQD1u839+8
	MH1I5cMCP+bYgLvIy347hQAINaEtnc4F1z/gg2g41fUv7RmQgcpZGWDOnF8bXBMzVtPwKJyqxiN
	W9bXDFcP0N88aHa1k+HSLLwQeVjhEXrsrqAw0icBJ6gtsr0iXZ8dGbW/JCylhg=
X-Received: by 2002:a05:6000:471a:b0:486:f506:2fa8 with SMTP id ffacd0b85a97d-48702ac2429mr4455498f8f.18.1789405127590;
        Mon, 14 Sep 2026 09:58:47 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e81asm29636198f8f.7.2026.09.14.09.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:58:47 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 14 Sep 2026 17:58:45 +0100
Subject: [PATCH v4 2/2] arm64: dts: exynos850: Add acpm SRAM node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-exynos850_sram-v4-2-253871de0f61@linaro.org>
References: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org>
In-Reply-To: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

SRAM is used by the ACPM protocol to retrieve the ACPM channels
information and configuration data. Add the SRAM node.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 911643008b9f..2128749d7647 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -176,6 +176,11 @@ soc: soc@0 {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x20000000>;
 
+		apm_sram: sram@2039000 {
+			compatible = "samsung,exynos850-acpm-sram";
+			reg = <0x2039000 0x30000>;
+		};
+
 		chipid@10000000 {
 			compatible = "samsung,exynos850-chipid";
 			reg = <0x10000000 0x100>;

-- 
2.51.0

