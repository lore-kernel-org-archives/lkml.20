Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3153B47D5;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789115332; cv=none; b=HxJsTLBi0ssMV9uZmWb5U3MOB70QVlYxK+w8rrEhwmm2apLDuxaz2Ik9hb+kxHaOd/1zf6gnczL8tZ1lkCdh1Ixof1UaET3HjG/pU4TEGrQQAfyrnwbUoOyGjYaCuaBrhADHeE57n9bcc1QDF42xpoW+qCE6y0EGmk4Mdx8NByY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789115332; c=relaxed/simple;
	bh=DiPGG6/1y2xmrETzC91peDuTfVXoxRXsfQ56MzCZN9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MwiyetUjQAZNU/TWPS8LBxFwPStNK5IbIsSSKF4cSkzHJSzEYfSdShnCK+sS6QaGFja/Nv25U7OU8Td+54CykHQjxzI7/vk0e8cNcJ1ID+YcTiL52Jr/Nzz9Bz8EDR1M2bDJ3I16pG080lTtwvlcXwroTlH1FJYDjQEbL7nGX7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eofex1EY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eofex1EY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0FECC2BCFB;
	Fri, 11 Sep 2026 08:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789115332;
	bh=DiPGG6/1y2xmrETzC91peDuTfVXoxRXsfQ56MzCZN9c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eofex1EYc4oqSgx/4d58E0WLp/L067GHsx9erfSBOfnH1liGDTxjEdex2pgV5BbAJ
	 aVia89N4jfwihLXA4kKWdxYcnUY3mBbIWAJxlu0QYImFiSap6Zbm4VUpRYhdUY5yV0
	 uksOYtT4KKGOHU4C6KN1gF71RpQ5umL1uDFOn/Y9nLnNA1ZKei600idSSfFv1azyTb
	 odeHrZ5T5C8FBkJOQIF1IcZ/vJppmRnqi8xiJuTMbA0JfMM8ghDllpzosQVLCgQ4RX
	 R3xYvQ1UpyL9XuEwwsHHPZlDKyMvakuyYcmvl2zZnquHhHMK19fg45kjJVWSfNqpy8
	 7s/zeBozfP+Sw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2DE8C88E4C;
	Fri, 11 Sep 2026 08:28:51 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 11 Sep 2026 16:28:29 +0800
Subject: [PATCH 02/10] soc: amlogic: clk-measure: Support more measurement
 channels
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-more-socs-to-support-clk_measure-v1-2-940e269aa52f@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789115329; l=1344;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=e2ydz5bLAgoXoKx1id6ARA1Qq/OeV3kWw0wR36wz9Ks=;
 b=Ni8daolTgIdg3jAm0A8kb0WCYbrmYnKh/C3NyycRuAnk8bFEMRQ6GS22kUNk1VOvJlgWA3y18
 cdffAlfZX26DHdr5MIXWfOtqEv7rTZiJaU19Ci0uE2qA1MwYsQf5+7n
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

On S4 and C3, as well as later SoCs, the clk-measure IP expands the
number of supported measurement channels from 128 to 256. Accordingly,
the MSR_CLK_SRC field in the register is extended from 7 bits to 8 bits.

To support both the old and new implementations, the driver now
uniformly defines the valid MSR_CLK_SRC field as bits[27:20].

For SoCs where MSR_CLK_SRC is only 7 bits wide, the driver never sets
bit27, and on those SoCs bit27 is read-only. Therefore, using
bits[27:20] as the unified field definition does not introduce any
behavioral change or compatibility issue for existing SoCs.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/soc/amlogic/meson-clk-measure.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index 8a1a9fed0e74..0d4ba2555d17 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -20,7 +20,7 @@ static DEFINE_MUTEX(measure_lock);
 #define MSR_CONT		BIT(17) /* continuous measurement */
 #define MSR_INTR		BIT(18) /* interrupts */
 #define MSR_RUN			BIT(19)
-#define MSR_CLK_SRC		GENMASK(26, 20)
+#define MSR_CLK_SRC		GENMASK(27, 20)
 #define MSR_BUSY		BIT(31)
 
 #define MSR_VAL_MASK		GENMASK(15, 0)

-- 
2.42.0


