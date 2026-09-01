Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3A747A89A;
	Tue,  1 Sep 2026 15:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276550; cv=none; b=n5+oQd3vy+ThsF1W7jFuvrZU0LJ6/TKHbIsuBTfKpqTqdxd/XsB8an5vfJS9RDFI9+4Ll4zpoB13uWtIMRU48loAP8tyj74Lmv9jniawYu02+DCBSQT/stGZZK90GqbuTiXLJAiHcN/9bGLLya+7e7xMI8Oz22UjDSUR0/dxr0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276550; c=relaxed/simple;
	bh=5YQFmB8lqv3EtOU+XXP+/PTilFkO3sisZyeqadexnh4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eg1bcObLHxiIFdwNrT8iwgviOau6hnBgyFr6fCdmtOWngJ/fGikmjmcHq5mXyNq6gln72E6w6iGkI9BJGQQFLJqG3EnEioiEtzkFkR2lwWUuphT9I2gRDj9OlJp0MLGONWkG5ohl7iZWAx3A+WJO3vXZc4NCFbESyL5KbFfy34g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DVrQvg4H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DVrQvg4H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A84FD1F00ACA;
	Tue,  1 Sep 2026 15:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788276548;
	bh=/WzVbpTUmCPXyNzqgeyjZsR0sZaFvYd2a1CGIlBYfQE=;
	h=From:To:Cc:Subject:Date;
	b=DVrQvg4HPEHzcbPcZvxggrXSxir3vZEopI4DzVv/w5mLwuYTDGiQzJrksxWCfYtW9
	 8QDLYrsLZ1er8rym6eavTPLfQqd3iNuXtIk+JT2Oz2AF8xB8QSCMvclKni/XZbeDXj
	 5WPw/KVh3VZ8jDhSioVTJ+9fqE+wgQopkqhyoCRQTejBoiAtjNAss18vh/j5pAs6Wh
	 Uti5A2iuh+3xhGkpVhLDenDsUyGKG9zQK9AchSItl/hSADoL7sI5lba965C5+ARImo
	 /gXHMq8XWNdav2ejCQNxo+aAC1iJk8wDlu2dLeEd/E0dGw+wnLAmHq9lqgEA2DGJPo
	 CzIVr/5bGBC3Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: sta3xx: Fix "st,drop-compensation-ns" size
Date: Tue,  1 Sep 2026 10:29:04 -0500
Message-ID: <20260901152905.797279-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "st,drop-compensation-ns" property size is u32 not u16 based on the
schema and one in-tree user.

Assisted-by: Codex:gpt-5-5
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Split to separate patch
---
 sound/soc/codecs/sta32x.c | 6 +++---
 sound/soc/codecs/sta350.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/sta32x.c b/sound/soc/codecs/sta32x.c
index d6de739212f9..7e73150f6832 100644
--- a/sound/soc/codecs/sta32x.c
+++ b/sound/soc/codecs/sta32x.c
@@ -1035,7 +1035,7 @@ static int sta32x_probe_dt(struct device *dev, struct sta32x_priv *sta32x)
 {
 	struct device_node *np = dev->of_node;
 	struct sta32x_platform_data *pdata;
-	u16 tmp;
+	u32 tmp;
 
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
@@ -1060,8 +1060,8 @@ static int sta32x_probe_dt(struct device *dev, struct sta32x_priv *sta32x)
 		of_property_read_bool(np, "st,needs_esd_watchdog");
 
 	tmp = 140;
-	of_property_read_u16(np, "st,drop-compensation-ns", &tmp);
-	pdata->drop_compensation_ns = clamp_t(u16, tmp, 0, 300) / 20;
+	of_property_read_u32(np, "st,drop-compensation-ns", &tmp);
+	pdata->drop_compensation_ns = clamp_t(u32, tmp, 0, 300) / 20;
 
 	/* CONFE */
 	pdata->max_power_use_mpcc =
diff --git a/sound/soc/codecs/sta350.c b/sound/soc/codecs/sta350.c
index 2ba35076732b..208bf0e22bec 100644
--- a/sound/soc/codecs/sta350.c
+++ b/sound/soc/codecs/sta350.c
@@ -1087,7 +1087,7 @@ static int sta350_probe_dt(struct device *dev, struct sta350_priv *sta350)
 	struct device_node *np = dev->of_node;
 	struct sta350_platform_data *pdata;
 	const char *ffx_power_mode;
-	u16 tmp;
+	u32 tmp;
 	u8 tmp8;
 
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
@@ -1127,8 +1127,8 @@ static int sta350_probe_dt(struct device *dev, struct sta350_priv *sta350)
 	}
 
 	tmp = 140;
-	of_property_read_u16(np, "st,drop-compensation-ns", &tmp);
-	pdata->drop_compensation_ns = clamp_t(u16, tmp, 0, 300) / 20;
+	of_property_read_u32(np, "st,drop-compensation-ns", &tmp);
+	pdata->drop_compensation_ns = clamp_t(u32, tmp, 0, 300) / 20;
 
 	pdata->oc_warning_adjustment =
 		of_property_read_bool(np, "st,overcurrent-warning-adjustment");
-- 
2.53.0

