Received: from mail.nozomi.space (mail.nozomi.space [139.162.184.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6F138887E;
	Sat,  3 Oct 2026 19:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.162.184.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791056708; cv=none; b=XaZASyrkqOq+ky39BTqz4Asp9cXBfIqKlAZP9/RbQTfi9chjSoYqYz4o++Qfhu8JV0TYxvUL6l3bz44ic7agvz8XQ78JpzPEvsZ9pAC1CtKIArkEITr2AfHPLmdhRWaUhwRP7w/ArQy3DpAoynV0Zlc6/FHiJ/vQUZkD24TOE8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791056708; c=relaxed/simple;
	bh=0lqF3e5Bq1LpQXFbq3UNwPgwer5NuXd9sw7UWJSrhPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cD278uRLnwQ5Vmthzj0KbFY0Ut/xg+rYhBA/U7lu88ksU1tcC5uy0BYQ3I/lUGU/jmJVEzV7MQgYu+mYDyqeXh4sabfjdlVBsPgzYc8WDDhwWxENa4SiUP1KPHFDb+9RAJrZ/tX47pRfE7OveRYDA9Z1Ax0taa1rFbOBeFoRIhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space; spf=pass smtp.mailfrom=nozomi.space; dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b=tVthf2V9; arc=none smtp.client-ip=139.162.184.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nozomi.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b="tVthf2V9"
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1791056704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Rrkz7SQZupuPWDT3oGVi7jy5HpE8mbCCyjqfsJLEW24=;
	b=tVthf2V9abfZ5t6twtvBHsQD7En5A+RDKeldAQuCEK7IhGrloWOAo97H3qihxQlGPTZ31q
	cmY52nLMqwUL3bG6xUF/jJAibXGQFIWGcBTTOQY55oVmpzxfKhGjRZcnKx9ZCUErDtNB0A
	gwv1oRIaiMe6f3pSofk03qCQJE6/Ccg2zhvFXTPz2a6XJGkSd/jLVvoRQOP2ucSk9kipAx
	49lRx/MeQOpADj89+MwurqOeLUy31kv4ZFM+rdWNiaDGv0tTZq5QUTwXbQzE7/LEsFI/Fl
	jyIFPUkAgIEKJn/Fh7qB3z9Tub5pf7nhxyY3maHwI04rCbhdHEKGUDM7DBe25g==
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
Subject: [PATCH 0/4] ASoC: Fixes for the MT8188 sound card
Date: Sat,  3 Oct 2026 21:44:57 +0200
Message-ID: <20261003194501.832558-1-michal@nozomi.space>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These patches fix problems found while bringing up audio with SOF on
the Lenovo Chromebook Duet Gen 9 (Ciri, MT8188) on a mainline kernel.

The first two fix the common MediaTek sound card probe when the card
cannot be bound on the first attempt. A missing component made the
card fail its rebind because the codec references were already
released, and a deferred or failed probe left the static card with a
topology name that devm had freed, so the card registered with a
garbage name and UCM found no profile for it.

The third limits the UL8 front end on MT8188 to what its only back end,
ETDM1_IN, supports, so that userspace can no longer pick a
configuration that fails in hw_params.

The fourth is not MediaTek specific: hdmi-codec parsed the all-zero
ELD that bridges return without a sink, which logged "Unknown ELD
version 0" on every open of a disconnected HDMI/DP PCM.

Tested on Ciri.

Michał Kopeć (4):
  ASoC: mediatek: common: Keep codec references until the card is bound
  ASoC: mediatek: Don't keep a freed topology name in the static card
  ASoC: mediatek: mt8188: Constrain UL8 FE to its back end's
    capabilities
  ASoC: hdmi-codec: Don't parse an empty ELD on startup

 sound/soc/codecs/hdmi-codec.c                 |  8 ++-
 .../mediatek/common/mtk-soundcard-driver.c    | 67 ++++++++++++++++++-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     |  3 +
 3 files changed, 73 insertions(+), 5 deletions(-)


base-commit: 0d6ef8b530db8dbad6b06309cf2683f1032f8013
-- 
2.55.0

