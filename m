Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96263D8100;
	Tue,  1 Sep 2026 15:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276543; cv=none; b=qkSWQlOYnrX3UKsWa1FGPsCQfUjHGgBcWHTwydeM7aFtARlT+XpeC0zbP9C7UimWtH0Xc8sxhTWPpjE+uTWWH79lHwl+1ufI5bvd67lfNMUt/I0UMkLrLpCIJAPt8AQNhvkEn1AGqmFctNPW6cGMJucGnQYscQEqF0xzKPbYBxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276543; c=relaxed/simple;
	bh=Xpt1nAMHtQc8hLna0AIlONNEls/q6/NWtO858L+UcVk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ubtpw6SEtxey+Q0/cO8xGZtSK5TR146x2SC2ilwYap2xBMKEF15EIkm/p7c8Jg7QpbvMTcBMRcg/KS98Q9/mvKcg4w6A/gxuNFwBwVaOw7ph5gXSSCWhg6KDjZGMJuT7e1rWktBQl3SKddTV8c3kdL4QXdqH2gfYilt644Gnbh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SEnL+hMJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SEnL+hMJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9AB1F000E9;
	Tue,  1 Sep 2026 15:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788276541;
	bh=eTJu7KDV258zV7uvJftrbtiEfhhHZWSHk956oCbUTPs=;
	h=From:To:Cc:Subject:Date;
	b=SEnL+hMJyvV+wUCbXcMip/emymlLeSloLCjcwKt7dumDrZ+nMbE3geQNKqzYqf+Fy
	 c16/rHn0eR7DP6d06nD+MzML7Qa71PAcr+GJNQElK1gx3A1xjD7XGIKCrXYMeGxbs3
	 0Yo4QVUnmgCK1nv/FXVI7o1ZIwDtXNCyUChPhEnbhFbDICSPbeD9nmy9mfT7dyTbdU
	 CvWYDqVitZGGLYV9tbOMns9n8fYtzC75od3CNje8U78oh8IWozhNuqrs7fy4OBZwho
	 m4GRXoJcSZ7VumbUc77EROqIESPXyQsCaCXbm+t+Z1FOlTXsMon1KWV22dcpPQ114s
	 BmSM4RcV6VwTQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: twl4030: Fix "ti,hs_extmute" property type
Date: Tue,  1 Sep 2026 10:28:55 -0500
Message-ID: <20260901152855.796769-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "ti,hs_extmute" property is a boolean, so use of_property_read_bool()
rather than of_property_read_u32() to read it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Split to separate patch
 - Assign the value directly from of_property_read_bool() return
---
 sound/soc/codecs/twl4030.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/codecs/twl4030.c b/sound/soc/codecs/twl4030.c
index 9476cdfd4dde..b11ba908ba9f 100644
--- a/sound/soc/codecs/twl4030.c
+++ b/sound/soc/codecs/twl4030.c
@@ -202,13 +202,10 @@ static void
 twl4030_get_board_param_values(struct twl4030_board_params *board_params,
 			       struct device_node *node)
 {
-	int value;
-
 	of_property_read_u32(node, "ti,digimic_delay", &board_params->digimic_delay);
 	of_property_read_u32(node, "ti,ramp_delay_value", &board_params->ramp_delay_value);
 	of_property_read_u32(node, "ti,offset_cncl_path", &board_params->offset_cncl_path);
-	if (!of_property_read_u32(node, "ti,hs_extmute", &value))
-		board_params->hs_extmute = value;
+	board_params->hs_extmute = of_property_read_bool(node, "ti,hs_extmute");
 
 	if (of_property_present(node, "ti,hs_extmute_gpio"))
 		board_params->hs_extmute = 1;
-- 
2.53.0

