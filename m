Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C89943A808
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751488; cv=none; b=cn+x1LFclu+Rqh4pD7M0jbr4Uza+Z6RLXv86061xRBnblWvzoCcuap5geTLshkJSeNUw3vd5HPM530pT61738xfSqVwMmTdypKt+Tb2NWjcsE7/a5ntUIdKNX6gmMf4UYFtZioL3emN7xet3HiwzwFJhrTfHqiBxo4ZBrwYa6go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751488; c=relaxed/simple;
	bh=uyOfTAk02QIOXjWu/5aFDewOPExwJC2z9PD9LYVmPdI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jFoua6DkRKtXZLkSsNGFIRgwUE3i6/cOHg8XgiiOn8QTNAvQK/iLvvGaO6qKl46QOVHbcAmd3B1SD5jJ0GZUvt4b2eTnPWTRX7LJLnQNH2J4ZnV71G3BDY30X3hHcuqyHpuMz057ONdljAD6wLqfnQVK1V5xKlqLCeleD6uikl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RwKkQh+c; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RwKkQh+c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=e2
	8iCUdzTCIXmJO0+kxY85695yfYq1EWE0mmUTBSb+E=; b=RwKkQh+cBcUUAqYYn1
	LYjD3qg7I93VaQUL2Eyt1fGucekPc78PA+BexyUewfVR/RHFDF1iqiIgVTA7lJhx
	iT9fHJihEZJGPQXaGLA4nKeuDS0UzvW7UDraMwH1+JsSo40ceFB35AZLRyewNcMe
	J048TsGH/QnRNe2rYVQcdgMpQ=
Received: from pan-u.. (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3PwhKsrxq7NlhBg--.27857S2;
	Wed, 30 Sep 2026 14:55:06 +0800 (CST)
From: Ren Panpan <rppxj178543@163.com>
To: tiwai@suse.de
Cc: perex@perex.cz,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	renpanpan <renpanpan@kylinos.cn>
Subject: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Pavilion 14-dv1001TU
Date: Wed, 30 Sep 2026 14:55:04 +0800
Message-ID: <20260930065504.24151-1-rppxj178543@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3PwhKsrxq7NlhBg--.27857S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrW3CFWDKF4xKF4UZrWDJwb_yoW8AFykpr
	4rXr95WF97XF92yr4fGF4UCry8Ga12ga1rKayavr4Sqa429r4vga10vrWqvF4kAryvgF13
	Xr98AFy5uw4jqaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UAGYXUUUUU=
X-CM-SenderInfo: huss5yirxykkqt6rljoofrz/xtbC6QuIh2q8sksFnQAA3a

From: renpanpan <renpanpan@kylinos.cn>

The HP Pavilion 14-dv1001TU (subsystem ID 103c:8987) uses a Realtek
ALC287 codec. The mute LED on this machine is controlled by GPIO bit
0x10, which was verified via hda-verb, but the subsystem ID is missing
from the quirk table. As a result, the ALC287_FIXUP_HP_GPIO_LED fixup
that drives GPIO 0x10 is never applied and the mute LED stays off even
though the associated LED class device toggles correctly.

Add the missing SND_PCI_QUIRK entry to map this subsystem ID to
ALC287_FIXUP_HP_GPIO_LED so the mute LED works as expected.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221810
Signed-off-by: renpanpan <renpanpan@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 5127a111c59c..de31eb6a1627 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7483,6 +7483,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8975, "HP EliteBook x360 840 Aero G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x897d, "HP mt440 Mobile Thin Client U74", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8981, "HP Elite Dragonfly G3", ALC245_FIXUP_CS35L41_SPI_4),
+	SND_PCI_QUIRK(0x103c, 0x8987, "HP Pavilion 14-dv1001TU", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x898a, "HP Pavilion 15-eg100", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x898e, "HP EliteBook 835 G9", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x898f, "HP EliteBook 835 G9", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.43.0

