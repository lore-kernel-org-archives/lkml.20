Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875050;
	b=Qkkb4L4tNfkKP8+atKuV8z+sXC/11o6SMyJvgzzbutx4ccTFogN7LZaj/go+VuDMr8SZ
	 GENTN22sE1HwRGWjBNlGGKbHAAwsTb3YsCjAsf6I46YBUQxVvcsv3AjFV2oqyLiPUr7pc
	 uUlrSau3QYy5oCMx4HvnxPot36L8alaxSlgUPqeD3mHSPemsEv2HzrrYIsZqmoG/DNPnS
	 ggA+PexD7d+idX1StGsE5U45nez0CVptzXz7ERXj/hTgPXB34WcXOzDF5FlPNjIs3UYBw
	 2PowTdQVcEcKu5iSuK8CYRbccRqLHXisHd93WSkem18QO7QC3I26CQcPKmE2e0c/W5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875050;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wKTLV6LjhmAfEMMbSEaJYuctRKoiNgp1BndAcbyARuA=;
	b=W9M7RZ/i8tjde+5VOHCkeM58Qqu+14JThN0LN/biElAoDpGsouAU2ZKwXtKh+OBXQWyd
	 ahXavRhI70AQV+NPf7ZwplThYAC+K89yV12Ns07DHAESKsbBpgo64AWss7ct+DxbQ3hUx
	 +GZShV19Lbg5HAG+77UiM/eOY8XnW6lJh+KomgrzgiF/LlXfxnTQnlwYxPyDTZ1w/AQWG
	 fOwLJPRRUe9umTHITG1rQn2pgN1ezx4JKHrwY4McRdFe+k1J0+4S8ivwDXF/eUKkU1Aaz
	 z/MLUjvBE/uSip8kO/z5flnJGA5ER1ApVutTcSbweFV4qPHAFmQdcYDFFQf/8m0t2dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=RxzcW3Ud;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8FD606A328;
	Thu,  5 Nov 2026 10:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC8FD606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=RxzcW3Ud
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=RxzcW3UdmzmO+qdSdO8BnjOC2EyiVegIgXhDy1N870FZduNzwDpEMI21WyJD2rm9KLO+IdTUAp8fa
	 p4djEYZS71qfZUzVAzTG7isuCnMIgWanoMsveYpMJRcJwyL20MbmtxU7r2qUTqhhZzcEb7fIbVfpjJ
	 1Ey0/62+XL6qrdxc=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66aec5c64eef-73736;
	Thu, 05 Nov 2026 18:37:24 +0800 (CST)
X-RM-TRANSID:2ee66aec5c64eef-73736
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from cmss.chinamobile.com (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46aec5c62a04-7e186;
	Thu, 05 Nov 2026 18:37:24 +0800 (CST)
X-RM-TRANSID:2ee46aec5c62a04-7e186
From: Yuehong Wu <wuyuehong@cmss.chinamobile.com>
To: linux-sound@vger.kernel.org
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: tlv320adcx140: zero-initialize the GPI configuration array
Date: Thu, 05 Nov 2026 19:05:00 +0800
Message-ID: <20261105-tlv320adcx140-gpi-init-1-yuehongwu@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

adcx140_codec_probe() accepts any "ti,gpi-config" array with 1 to 4
entries (the DT binding has minItems: 1, maxItems: 4) but then always
reads all four elements to build the GPI_CFG0 and GPI_CFG1 register
values.  With fewer than four entries the remaining elements of the
on-stack gpi_inputs[] array are uninitialized and the garbage is
shifted and written into the codec's GPI configuration registers.

The binding documents a default of <0 0 0 0>, i.e. unspecified GPI pins
are disabled, so zero-initialize the array and keep accepting short
arrays.

Found by code review with the help of an AI coding assistant.  I do not
have TLV320ADCX140 hardware, so this was only compile-tested
(CONFIG_SND_SOC_TLV320ADCX140=m).

Fixes: 3c35e79cead3 ("ASoC: tlv320adcx140: Add support for configuring GPI pins")
Signed-off-by: Yuehong Wu <wuyuehong@cmss.chinamobile.com>
---
 sound/soc/codecs/tlv320adcx140.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index c29584d..511d691 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -1018,7 +1018,7 @@ static int adcx140_codec_probe(struct snd_soc_component *component)
 	u32 pdm_edges[ADCX140_NUM_PDM_EDGES];
 	u32 pdm_edge_val = 0;
 	int gpi_count;
-	u32 gpi_inputs[ADCX140_NUM_GPI_PINS];
+	u32 gpi_inputs[ADCX140_NUM_GPI_PINS] = {};
 	u32 gpi_input_val = 0;
 	int i;
 	int ret;
-- 
2.43.0



