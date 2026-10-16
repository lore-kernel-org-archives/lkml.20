Received: from mail.nozomi.space (mail.nozomi.space [139.162.184.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4014FE2D3;
	Fri, 16 Oct 2026 16:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.162.184.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792167312; cv=none; b=fh1Uj5DerKXpXQqLTZ8DIC/czu6KZwSQ+q1Jt6FSCd6vpbdDBZ3bnEusEmbOYHczudt5ls8HjkNkDwvMGaq47RyBOjd58AXwJlK2xjJb0cCWGwfHo1GhA6jmtH05FyF2eF1++0Ytf8xaQxF3tjwx9Q8xCXcY2Dc7SIa3mI6Pufk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792167312; c=relaxed/simple;
	bh=+waw1SuLWXrPyq5l4Hyn4lERHBCZwpl+TXBqPNFZ8s8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LdYqtFNStEIwKqlFhGp56a29rj3MuE6rR3q5qgfmbZ81l3iAf8DvZp/WttoOu4Dal8A0Qb+Zk/xvq6Vd2zA53HPtot6C2ewNz7mngA+Dttm74aKX7NaQcXcEnJqbC+JVlP/IwX4L+hej+syNRkyng2J1asYAVgKM+Q1up0elozI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space; spf=pass smtp.mailfrom=nozomi.space; dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b=ZQ66W5hl; arc=none smtp.client-ip=139.162.184.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nozomi.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b="ZQ66W5hl"
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1792167298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fpOnpHUlmYdOv4gPzZ2omqt3CmZEZdq9OSzIodZ303E=;
	b=ZQ66W5hlir9wlHKTxyRZAIejQYiTE71r65GNC8e+3zI19L/8bXcCyf2/P+ugU9jHxlAbwE
	kXKjuovaoxn13FoA8XT7wf75nF1JMiJJjE7R/5S5LecsOTD2o2le53pZOZFWkO65XissoI
	UCrKue2X7BOEwTx9YY3fFvvy4JB/zu+mUyalrBdwX1pdU1yMiKoUmOTZGuqzEnKos3ksO2
	lOMNdYaiF4voVLgXeYPTACJ0jb8KynTEGQS7Si/nidZygn3p1Ihz4IzQizalfiXPOsatw1
	bCDxunfUSkMwia71YSTxc6oKTDosXMSruEvap1CAKUibwOLuTceWLZ7kpQ7VoA==
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
Subject: [PATCH] ASoC: mediatek: mt8188: Suspend the AFE across system sleep
Date: Fri, 16 Oct 2026 18:14:55 +0200
Message-ID: <20261016161455.194400-1-michal@nozomi.space>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The AFE only has runtime PM callbacks. When a stream is open across
system suspend, the AFE stays runtime active, so its clocks stay enabled
and its register cache isn't marked dirty, while its power domain is
turned off in the noirq phase. On resume, the deferred card resume work
powers the DAPM widgets back up and writes the AFE registers, whose
clocks are off after the domain was power cycled. The write stalls the
bus and the system hangs.

Force the AFE into runtime suspend for system sleep, and back to its
previous state on resume, so that the domain sidebands, the clocks and
the register cache are restored before anything touches the AFE.

Fixes: bf106bf09376 ("ASoC: mediatek: mt8188: add platform driver")
Signed-off-by: Michał Kopeć <michal@nozomi.space>
---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 7b1f5d05f4d61..1710a9be2bcff 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3379,6 +3379,7 @@ static const struct of_device_id mt8188_afe_pcm_dt_match[] = {
 MODULE_DEVICE_TABLE(of, mt8188_afe_pcm_dt_match);
 
 static const struct dev_pm_ops mt8188_afe_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 	RUNTIME_PM_OPS(mt8188_afe_runtime_suspend,
 		       mt8188_afe_runtime_resume, NULL)
 };
-- 
2.56.0

