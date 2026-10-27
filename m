Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793090631;
	b=GDO5bwnS56Zi/foPb05jl3gEoiNpU7tD0o7dDbGL5p4GTED9cYsVkSwHH14riYnw1IMv
	 3Gm7VnHoTM6vtNyXos4GS3MZsPbhkyPjTbXG7KP8LTxanLij642udrPkS6QiolS13wj2G
	 Zkzv2Kk/M3P5Z2R1B2TlIx3Ta8+S/tAjC/ueqHJ8/PuWkjtDev0FBTbhYdx9d0i4cXPon
	 Px4QybFTWqS2wqrqChwVF0r1bzyF18srWdpjBxGohRVNIz3oGW5jsBdjvwP6tdrTPaA9M
	 EZwXiTeFIg1jObmXBu//f8QzkOZoY5HFL2HxZ7sTwjMOaXdlrA7mBC6Um2TQnTVqxmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090631;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3RB9/BBVxLWwbxPMnMEoxFiT0diAW+H5eMLXzJurFWQ=;
	b=UNOnzDByv9GOk4fTlKy37ZuvDGsBA8ZxPkwOOpfvRfLhwHUQSj4Mzok81RswuBXnjoYF
	 6g+7+CsaQxrOyZLFyzqJPduERBx1knlF6H8S6f+7hxPjr8ZD9Wj4+eGmt2cAJO//HCtHE
	 tmsFksg/UuvVoTEPn/Q2U4WIjx6Gi9JMYMittHG90Ji7ZkONQfywWDGDMQiMuxJmYWnuq
	 iiNHQWe4Z+w5XlA/S3QfXC5pnO0Xm+rhZc/+/uZAr83L3JbMPxvb6RgW3/ezT6iLgTaGM
	 eI6exM0B3FE64cYt92hG5+Q3+OjfQGOUHSUVJ9rsVJKCwhMaIf4RC+dfus3HenTxoRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k1d7V2SM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BB3606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k1d7V2SM
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793090631;
	b=AqQcwigiMYzjy0M/fOGhVM3xui6MqGbmOIz/pPUu7cspDKVtkOfVTsz7FrSO2vFAxHZY
	 KEabLF8ju18NS8zfaDO7ewKCirN8Ig6WqzAF7dr6HjJljDStutFZ5CJRyM2i+wpAFAb0r
	 zJ4b5+yhrOIX1IgAZKQ5NfI1esgJXI/KnRh1pb07HtCSTzoEVtGY4s+H28tYuTr+heVIb
	 RQYSB+vJ+BQOZ1ZXpVjhZFSK6uVvAJb40+Vuq1U20nxjFBhUYVAlALetIcQbZbJLKpFcw
	 IVIlRhDIxt1EqLIkoTIJpzMZ2B2BpWx0ogJ3sVnFqGXqjmJspOXPBUPIBdBldYRE2lA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793090631;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3RB9/BBVxLWwbxPMnMEoxFiT0diAW+H5eMLXzJurFWQ=;
	b=GrV7NLDStmP4UnCjO6tv3U7AAvUgDHq7R+tav27mwX9skWIMsdY8dZZ+k5OVtr6kmm3P
	 b5iFkECaqQ/1XpPSXbbqaTxQsuc63e4pAvBrHwocT1mAh9p93jRaKpGx6NZRjc+gDiUNE
	 GPE5srw09xS7f/8VvbMsvxl0V7y9r9ergGJuyVtD76ozvPRfiKX8/JXCsNTi5yRKLVunk
	 r8AsoMqJrBJDVsRwQpq2q62ZE8JXZMj5gB1FnX3/IR/T+1QX7pZ9IROY71drC2/M7B8Ug
	 FuGfzkmkrqBIs+06BbugElfGwHgJmP+eCozW0IUr2q4+s1ww3LYP8TRdJ4fV3b500qg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 98B441F01825;
	Tue, 27 Oct 2026 08:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793090631;
	bh=3RB9/BBVxLWwbxPMnMEoxFiT0diAW+H5eMLXzJurFWQ=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=k1d7V2SMIPFx9TqnAtkw83vozp/RdSQjO2ygzEjmmABRdaPNBQP+TwgLCLvanU0Or
	 h7QnXaQ+3RQAvw0Mon1APAYl3wTNYWdn3m0Q8Lf0q0/DEAWm2rrp5dpXszKEaBsb03
	 vjCHYoLSsub00fOQwHVvfBQqo/KqgWzU+CdHYTCmWfDgEKWlRSIyoyJVgIKKEOpez1
	 G1/7rnJlLZoAxZUDLx8+0aI6U1Z7RdkmYdun6pmMHMtPIM/bO4ykWTgwQv+fzMbBHA
	 onIZJu4FogzCYsUeYQb9CWyFY47We2K7BQcWEf6LXanIBQjQFaN04wCM43fXdzihft
	 UKS3MI4jDjXKw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EABAC4503F;
	Tue, 27 Oct 2026 08:43:49 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Tue, 27 Oct 2026 16:43:39 +0800
Subject: [PATCH] soc: amlogic: clk-measure: Fix AXG HIFI PLL name
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261027-fix_axg-v1-1-741388f1e851@amlogic.com>
X-B4-Tracking: v=1; b=H4sIADpk4GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyNz3bTMivjEinRdy0RDIyOzlBSTNMMUJaDqgqJUoBTYpOjY2loAfPi
 LY1kAAAA=
X-Change-ID: 20261027-fix_axg-9a1226dd4f1d
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793090628; l=1118;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=wHBJmRVPOh0SOfv0q4EbK9DeqGUv8x9se7z6Xr31Dm0=;
 b=V8lYaYyG4Nu3SIhK5LElEYnwNp/ff94wpX+2hnl69vnHiMjifymPuy/FBED9Q9X9X/PeG22Pt
 GbA3wgEfVW0BSejd/avhTZ++DXq4bng3liJENmCbXDNtGGs4SornlnR
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
Reply-To: jian.hu@amlogic.com
Content-Transfer-Encoding: 7bit

From: Jian Hu <jian.hu@amlogic.com>

AXG does not have a GP1 PLL. Clock measurement ID 5 corresponds
to the HIFI PLL, but it is incorrectly named "gp1_pll".

Rename it to "hifi_pll" to match the actual hardware.

Fixes: 19e0bde7bf6a ("soc: amlogic: clk-measure: add axg and g12a support")
Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 drivers/soc/amlogic/meson-clk-measure.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index 33767f0bc67c..c1ffa2537464 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -182,7 +182,7 @@ static const struct meson_msr_id clk_msr_axg[] = {
 	CLK_MSR_ID(2, "ring_osc_out_ee_2"),
 	CLK_MSR_ID(3, "a53_ring_osc"),
 	CLK_MSR_ID(4, "gp0_pll"),
-	CLK_MSR_ID(5, "gp1_pll"),
+	CLK_MSR_ID(5, "hifi_pll"),
 	CLK_MSR_ID(7, "clk81"),
 	CLK_MSR_ID(9, "encl"),
 	CLK_MSR_ID(17, "sys_pll_div16"),

---
base-commit: a848d72aab71e19ea78180f2502ad7d12818723f
change-id: 20261027-fix_axg-9a1226dd4f1d

Best regards,
-- 
Jian Hu <jian.hu@amlogic.com>


