Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C55846A5F2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420281; cv=none; b=OEL4M3yoVOGP8kj8gx0FUFm39ku6ZgWiAm64EpClbovRwt4byUvfjJAuKHKZEzw0On9S72rnlkCuw5Qzi2SUeSOktl60x20cvmSxrOy/SWbQ4ff8p2vRkSpWh+BOsFsBI3lECZr61uuvXfEm+NPZeiItY2SfSAfDJf25sBkXX/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420281; c=relaxed/simple;
	bh=zwEor6K8yGoFURlxDvbOjCkK1oLF41ASBn1v919rW7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o37KFNDfv846KS74aXbF6ASGxvlVqpIar8MEYTVDgW+9uN0U8TKoHUKMcvIEVFXApIe27XhN7Gh2Tbe0cPUTm108Kawv3H1HgrNKcwDOmw3QS7ZpWrcZyMTT8ImdGjZAPex0oo7kXF2ho4AlB6/EO2dYx9x9sRzpaX/2nk/o6jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lp2gqsoA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lp2gqsoA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE9511F00893;
	Mon, 14 Sep 2026 21:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789420280;
	bh=S6FY7ZetqMty4OJBLyaiR50VfGzmS5JdgvQQAtmW5og=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lp2gqsoAekT9AER+Ra3HmDDAHtx3rK9F7YiixZaWEgpRL/IH+ilZ5xeofYb8OGHbo
	 a2XYrRxI0gLDG3vQ8yWTQHdYMQOIUi6NxP9gGCq3hM/ViwyI1dEm1jxwKBrKtLvH6w
	 DIj56zVCjPqj9sCSkUqndFcRs/4j21tceveiTAV8e6jWF8pTAiAE1wMZo7NZoeUofW
	 05E3DxHSs5cCJWaLENRYXAAd3LjBObePgYOqVSP2a05H9Q7+eylPvFGgqgCEko7hzL
	 y8KWjZFNl7eAwz+e9dKgMSa3zWnJlTVLuLbrDf1OyI4neAsw9RG7PycwxK2Qsh19WR
	 jqwf1xaEkcL5A==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 23:11:14 +0200
Subject: [PATCH v4 01/10] regulator: ab8500: Fix AB8505 VANA voltage
 selectors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ux500-dts-snowball-regulator-v4-1-dfc453a3031f@kernel.org>
References: <20260914-ux500-dts-snowball-regulator-v4-0-dfc453a3031f@kernel.org>
In-Reply-To: <20260914-ux500-dts-snowball-regulator-v4-0-dfc453a3031f@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Axel Lin <axel.lin@ingics.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The AB8505 VANA voltage table assumes selector 0 represents 1.05 V
and all eight selectors increase linearly. Selector 0 actually
represents 1.2 V. Selectors 1 through 6 cover 1.05 V through
1.175 V, and selector 7 represents 1.225 V.

Correct the table so each selector reports and programs the documented
voltage.

Reference: AB8505 User Manual, DM00046744 Rev 3, p. 257

Fixes: 8a3b1b8703fe ("regulator: ab8500: Add voltage selection for AUDIO and ANA on AB8505")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/regulator/ab8500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/ab8500.c b/drivers/regulator/ab8500.c
index 3705c98b0713..ca59406d42a8 100644
--- a/drivers/regulator/ab8500.c
+++ b/drivers/regulator/ab8500.c
@@ -264,13 +264,13 @@ static const unsigned int fixed_2050000_voltage[] = {
 };
 
 static const unsigned int ldo_vana_voltages[] = {
+	1200000,
 	1050000,
 	1075000,
 	1100000,
 	1125000,
 	1150000,
 	1175000,
-	1200000,
 	1225000,
 };
 

-- 
2.55.0

