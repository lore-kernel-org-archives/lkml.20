Received: from sender-of-o53.zoho.eu (sender-of-o53.zoho.eu [136.143.169.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960CE478E38
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782442; cv=pass; b=utBVmemmBbFJxTlIr50TTh/PJcL3cKi2r646OUgWYXDeOvNJpM6n909XJeT+K1cbEKEIRjGvkch6tcLW0/sbX71ijSKAxomTnZDn0XWBnNWw9YfBpdSua/svlqOMOEMOBdO+D9sZyPYD1PI1lsXLB6sIhVPn2HqL3Q3wqcmMI0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782442; c=relaxed/simple;
	bh=a936yDy7C/UhvyUD5UdTv4KkR1knIKB795l83CoRsZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rbu7dNrgxCIz4Z6CD9WVcibNAGVBfcBlwAxR6ZT77PxgglxtoQLXSD0+J5oRZRbyvQJowytu6FLfHi0D1LPtrFtEZLd152+o464HInXbDPvmP0UcEbc+IgnJYUnpEqerfFzRSE68K1+ArvMegn01wEmzDi35NfDem8spgyOvohQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ruairi.uk; spf=pass smtp.mailfrom=ruairi.uk; dkim=pass (1024-bit key) header.d=ruairi.uk header.i=ruairi@ruairi.uk header.b=gmWmWL3p; arc=pass smtp.client-ip=136.143.169.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ruairi.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ruairi.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ruairi.uk header.i=ruairi@ruairi.uk header.b="gmWmWL3p"
ARC-Seal: i=1; a=rsa-sha256; t=1788782416; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=MqQV1PhDppkXR2jQyp6UHjoBgS/cFRidieUnhCRNWCoMS+HJi/8WSJgVbp0FXIWuLReeYD7ZYpGwUiEhmnhvVWBdW344Z1AMs7BdQYHOKAJ6fGcTYISuah+u3Kvfr6UGySaJZpyff2VoFCXh6mdaNjWR2pgdxPd0PrKE2FRLBKU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1788782416; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rTIzvVSXUGH+hxHAHFHxRXYMgOBOMTNVhvpFkJAYVxs=; 
	b=BCLJcFeL0jsf+DCWRcTQEHpgmyaR5Ln8sz6LlRS9180pz+sV8JsmhlUJV47NM9ut+fWOkKcu6FmHZiq0+GfRMIKR4GlNjF1E1vVP57zlgr25IETcUQI9Z3+vIJ+Dd1S4VJZG8zk4nyZ2MejtTcd3XWmIBsqV507NAXZEToQ+epQ=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=ruairi.uk;
	spf=pass  smtp.mailfrom=ruairi@ruairi.uk;
	dmarc=pass header.from=<ruairi@ruairi.uk>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788782416;
	s=zmail; d=ruairi.uk; i=ruairi@ruairi.uk;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=rTIzvVSXUGH+hxHAHFHxRXYMgOBOMTNVhvpFkJAYVxs=;
	b=gmWmWL3p6UqVkR/YWo2zTJAiqLJKgmTii/SHj8V8cwgUWMiswBFbYn9gFXwLz9TW
	G/2L+5BlCzAf/p8CS3FJSD9Wo1Jv2PpL6K1J/rFnt3CCq0V4dWxmMCHl4Yl/yfnSFJN
	qLJ95yw+BJEbyoAWKUd3Cy63j3GGAiEoVzojINjk=
Received: by mx.zoho.eu with SMTPS id 178878240936060.9642866697302;
	Mon, 7 Sep 2026 14:00:09 +0200 (CEST)
From: Ruairi Anthony <ruairi@ruairi.uk>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruairi Anthony <ruairi@ruairi.uk>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for HP Elite Dragonfly Max G2 speaker
Date: Mon,  7 Sep 2026 12:59:42 +0100
Message-ID: <20260907115942.19286-1-ruairi@ruairi.uk>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The HP Elite Dragonfly Max G2 Notebook PC (SSID 103c:8890) uses an
ALC285 codec but is missing from the existing HP quirk table, unlike
the related "HP Elite Dragonfly G2" entry (SSID 103c:8716). Without
the quirk the right speaker amplifier's GPIO is never initialized,
leaving it silent while the left speaker plays normally.

Apply the existing ALC285_FIXUP_HP_GPIO_AMP_INIT fixup used by the
103c:8716 entry, which resolves the issue. Verified with speaker-test
on both channels and confirmed correct routing to both the downward-
firing woofer and upward-firing tweeter on each side via the board's
passive crossover.

Signed-off-by: Ruairi Anthony <ruairi@ruairi.uk>
---
 sound/hda/codecs/realtek/alc269.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index f7786e1b0878..7b356998f09d 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7451,6 +7451,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x887c, "HP Laptop 14s-fq1xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x888a, "HP ENVY x360 Convertible 15-eu0xxx", ALC245_FIXUP_HP_X360_MUTE_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x888d, "HP ZBook Power 15.6 inch G8 Mobile Workstation PC", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8890, "HP Elite Dragonfly Max G2 Notebook PC",
+		      ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x8895, "HP EliteBook 855 G8 Notebook PC", ALC285_FIXUP_HP_SPEAKERS_MICMUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8896, "HP EliteBook 855 G8 Notebook PC", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8898, "HP EliteBook 845 G8 Notebook PC", ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST),
-- 
2.55.0

