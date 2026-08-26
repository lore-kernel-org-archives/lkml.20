Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B848E3242D9;
	Wed, 26 Aug 2026 17:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787764891; cv=none; b=Ttt7V+f6Ehc7hFCUUyIeUuiBf+n2VifbPD/N79RQyplkpcAUCXA/FMiTHyAaIUSeZBi3rkmb+k5e2YmhJ7iedf81siNizIfjdX+XPot2l+MT8GEkuGLK9m7W6v9TOeziicVd41RDJ76FbT0FPevAghCKQdO7z3oEYw5I+Nu8+VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787764891; c=relaxed/simple;
	bh=13+NHVoDRaNyxW8YsyAG3yCn4HxBT5OIP8rOD8sKg4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UIANICCtgPTHnX0k9EQY9hd+LpoOeqhD0PIgpqw71uG5XOHW3+MYNKafsliIGMw1aFNKipo32y74JgRq+bTvYgWqFhUEaL0Y0jeRsCmauXGNSufSwTvHSVNJCINHw9Ho1q0zWZA4i2VYE6VRAZw/lr+3BOGDSblvHPy4DHMTS9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=WP5lor7D; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=GYD92rbR; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="WP5lor7D";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="GYD92rbR"
Received: from localhost (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 09B9617589BE;
	Wed, 26 Aug 2026 10:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1787764873; bh=13+NHVoDRaNyxW8YsyAG3yCn4HxBT5OIP8rOD8sKg4U=;
	h=From:To:Cc:Subject:Date:From;
	b=WP5lor7Dxk9nibHY1+vnU5MtfHdysJPR46RJpoTrizWmYKV66NdA/TbCpe4GlEreM
	 iE5ge7/vdVA0XHQehVNITBlCoErFBlYR3BTqZwJjkSxbh1v4iWv8EplwsoLITNSmFo
	 J2sNJkQkz6m/cmzcchd5qyp4j9QlrTlX9UVyuVSRFrBfD65fqUa9P7UCHYwNx2b/A8
	 VJsY9KdO2O+3wlwL15lOoupmAaTrZC5Z7/GaRIexMXGBt2SBqgIKW6CALXIB80vwLz
	 U7ZbQc7K8BQVU5VjBBmrM/QpdlNF6hm0XuiCRV+hjEW/PU8o+qE1t4QlrHhOv510Dn
	 8PDR+hFtlbtZQ==
X-Virus-Scanned: amavis at 4d2.org
Authentication-Results: bayard.4d2.org (amavis); dkim=pass (2048-bit key)
 header.d=4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by localhost (bayard.4d2.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L-s0aNOgtJ2p; Wed, 26 Aug 2026 10:21:10 -0700 (PDT)
Received: from Headcrab-PC-Fedora (unknown [IPv6:2408:8431:4d10:18:a686:580f:dd35:47a3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: wiagn@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 14CBE17581AF;
	Wed, 26 Aug 2026 10:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1787764870; bh=13+NHVoDRaNyxW8YsyAG3yCn4HxBT5OIP8rOD8sKg4U=;
	h=From:To:Cc:Subject:Date:From;
	b=GYD92rbRyoegU7QeKSgmtiM3euXmj4SNdJa4JOHlCDCVxYchSXpiLIkhliK6h0BzK
	 FIla4oqWEs5d9dTMwvkPdewL3F5BR+YtDPlw7Ys3/EEBKK5Gm9ZJ70N9zTy0GCpZp2
	 Ml9oBKPwLGizxO9qUrhs4QaZSIrY42HNTC2KsvRv6PmE3b0BCxAOJp0bNai9zdXe77
	 BWQIHwyi5X5KfsDuQPA+EkrNkfzjHnat2gpkRHGluSYHQnL/vC11qVNurhppgVCmoN
	 iQ78HCg8HX2p0ogjI9WdDw27DIYQYYLblHFcZpgurwdYW7djzPUTxeTloGb/0TGa25
	 iFAVwWD9AHvyw==
From: Shengyu Qu <wiagn@4d2.org>
To: Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	Syed.SabaKareem@amd.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: wiagn233@outlook.com,
	Shengyu Qu <wiagn@4d2.org>
Subject: [PATCH v2] ASoC: amd: acp-config: change quirks to cover all ASUS FA401EA variants
Date: Thu, 27 Aug 2026 01:20:50 +0800
Message-ID: <20260826172050.15686-1-wiagn@4d2.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Existing quirk doesn't cover all known existing FA401EA devices, so use
"FA401EA" to cover all of them.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221310#c49
Fixes: 27d090f3ccd4 ("ASoC: amd: acp: add ACP70 DMI override for new ASUS TUF platforms")
Signed-off-by: Shengyu Qu <wiagn@4d2.org>
---
Changes since v1:
 - Use single item to match all variants
v1: https://lore.kernel.org/all/20260826094209.29299-1-wiagn@4d2.org/
---
 sound/soc/amd/acp-config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 3021dc498c855..75b8e8a1fd7e5 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -54,7 +54,7 @@ static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "TUF Gaming A14 FA401EA"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "FA401EA"),
 		},
 	},
 	{
-- 
2.55.0

