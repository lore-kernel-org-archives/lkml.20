Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C270255E43;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789115332; cv=none; b=B5cYGFDw8l5avf0eDB9M7k+tG9cNYZdzqqLBLbqbC1pgALTrZxmhy6FDokV4r9Zin59d+awXuYKrfTAFakrOyR2vljAB7lX8jcWve9SBTtLhPXFjXEnHI/rjbr3DzA2JdU9qz+gnFzWh34AKoQ+NSMZAoDJFiLkQZjIxPufO2gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789115332; c=relaxed/simple;
	bh=6RbbWrcoZScMGk5YexuS8vhIyYx9Gl3h5u8+H0EPJrM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GA/Ft2+V/PZ9e0qyRGSrgASV2SIPDubIyFLIkM/HgYFez/gORpnwcnspqmbNrmIDp7dFLVB0FkId/zmnw3Nzox9MWsMJNYxM5Dtta9nWSza4hK7n2aHKL0j/c02il8wWq8Kp+hkWqpM5ysX7qMARwXTHfSgqHQyo9Gmp3y3rics=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nKqVJRYL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nKqVJRYL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05579C2BD00;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789115332;
	bh=6RbbWrcoZScMGk5YexuS8vhIyYx9Gl3h5u8+H0EPJrM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nKqVJRYLfCalF2Qp/VzKUjAaTKljdXHAzsZRB0bHIZAaLgkMgeac4CEyjUU+9shTI
	 qBst3DEtnrda2RQvn4S+HvJ02vqGjv/BeJ0RNrj5aZctpbZL9zjJ2zZ7UJf1LfERF7
	 CzElpFQytVG7xcSuhe8YRIhJRRu++ta5+lhSmixn/Y3P9fqotWO5o3neePIqpK+wXM
	 9YiJsg6gWwanRKAv3GNATj8d8pWrQbnMzG2db2OLu25hdBqpSWtF+e/rgxGci+zRJN
	 5Asa+awQRO88U17HT+r3hAEBlM7IacEOdCkgbSDAJvbYE+Qy9GoM6UvKsxQHJQ/Zz7
	 +bAfhzK6s2rhw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E49E7C88E50;
	Fri, 11 Sep 2026 08:28:51 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 11 Sep 2026 16:28:31 +0800
Subject: [PATCH 04/10] soc: amlogic: clk-measure: Optimize CLK_MSR_ID to
 reduce memory usage
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-more-socs-to-support-clk_measure-v1-4-940e269aa52f@amlogic.com>
References: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
In-Reply-To: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789115329; l=2725;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=5uBs1UfvmnA5lnpZwSQY5T4qwPJESJ7rRb5slRMsFVc=;
 b=JVJO2L04VaSRAj9p4DlTVpEhj7Oc8SfFhQNBiLAj70lEMEHCCrNhMpEqse4WnslvTcQB797/b
 ss8Z7L1FEKSAKUoYdBymScEpxiwE+H9Oalhx+kSDFLrtjJCJFMd6qx+
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

The original CLK_MSR_ID macro uses __id as the designated array index.
This can waste memory when defining struct meson_msr_id arrays. For
example:

    static const struct meson_msr_id clk_msr_foo[] = {
        CLK_MSR_ID(255, NULL),
    };

Although the array contains only one valid entry, it occupies space for
256 elements because the designated initializer forces the array size to
match the highest index.

The driver does not rely on the array index when accessing measurement
IDs. Instead, the measurement ID is obtained from the id field of struct
meson_msr_id. Therefore, removing the designated array index from
CLK_MSR_ID does not affect the current driver behavior while
significantly reducing unnecessary memory usage.

Compared with before and after modification, the memory size is reduced
by 24.76%:
$ scripts/bloat-o-meter pre_meson-clk-measure.o meson-clk-measure.o
add/remove: 0/0 grow/shrink: 0/15 up/down: 0/-16224 (-16224)
Function                                     old     new   delta
clk_msr_sm1                                 3072    3048     -24
clk_msr_a1                                  1488    1272    -216
clk_msr_g12a                                2952    2712    -240
clk_msr_gx                                  1992    1608    -384
clk_msr_m8                                  1536    1104    -432
clk_msr_a9                                  6120    5544    -576
clk_msr_t7                                  5352    4632    -720
clk_msr_axg                                 2640    1704    -936
clk_msr_s6                                  5064    3672   -1392
clk_msr_c3                                  4896    3264   -1632
clk_msr_s7d                                 4632    2880   -1752
clk_msr_s4                                  5376    3576   -1800
clk_msr_a4                                  4488    2544   -1944
clk_msr_s7                                  4632    2664   -1968
clk_msr_a5                                  4560    2352   -2208
Total: Before=65527, After=49303, chg -24.76%

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/soc/amlogic/meson-clk-measure.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index 671e0c3753de..f2562a37e8cf 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -55,7 +55,7 @@ struct meson_msr {
 };
 
 #define CLK_MSR_ID(__id, __name) \
-	[__id] = {.id = __id, .name = __name,}
+	{.id = __id, .name = __name,}
 
 static const struct meson_msr_id clk_msr_m8[] = {
 	CLK_MSR_ID(0, "ring_osc_out_ee0"),

-- 
2.42.0


