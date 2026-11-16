Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813002;
	b=uPZWfsq0b6zBsSCVn0K6yx6soPUTnBmPsMN6ZWitAHDt69IDsY4ez/kxJho73fFIfIBE
	 vpxQ/cxy1Vuqt3HG2mMepa1T3dAqKpG39IvPz2+rKo3C9uZid7eX0kQamMirEeXGiGlO/
	 geMSS9sQcpHQdxA9/RJvwSJkr96MYbU3d0JvPHPE9R4g9mC7FtDX9fwsLobITjdMQSPIU
	 EVnGYnY6cg+ToA6Ow8G9CRdbPbIMz0N3diGcfwhSdaQbgnswrTL/CYk+M/I6B89+VvWd2
	 bDUo067h4W/wFLme/4J9AZb0Ak5jXvyNjl5nVVh+Q5ziBkgu88rPOGZpAVevSeoAmvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813002;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:Date:X-OQ-MSGID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=6Vw4vQqbY4ssaiJU7C/osmchRqBIQKw09s/DP5o3N54=;
	b=mk4RP4AJnmK2dapz2WCoIDyGUfu1hYjBczTC1ISBL1H3FwBb6VGoo2Lgwm8gA1s6k5aQ
	 ESProWJ3TDefsnRKKY6Ro7VRn+wIX9/HqCzO5J3q9QeW00xXrF69q/RX4GNnEZFrFJzeu
	 nByGR+df0VVLsq/WqPhKZVnlAiJz/1pZ+flptvGyGQ1Po1P0W3Zm2EfbZm8VgLcIsIp8/
	 0n/EwrOW1y+Hvjgl7mTY7EUjB8sUIFJ8ajJEdHpVZzb9iQXvCffm3Dwg6jyCf+cYqzvCP
	 NI/oBhImIwxYtCe1qGp4GOF9irM3vPOslKBOUSsLlheMof/A44zJ6XCfFl9aumsVLtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=poZfvpl1;
	arc=none smtp.remote-ip=162.62.57.64
Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473EC606A31C;
	Mon, 16 Nov 2026 07:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 473EC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=poZfvpl1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794812995; bh=6Vw4vQqbY4ssaiJU7C/osmchRqBIQKw09s/DP5o3N54=;
	h=From:Date:Subject:To:Cc;
	b=poZfvpl168pAMkk4+xT6S2SApHnhWHb8+WcayQ+nDPs9C+kRKTXr5uDIeyMx0Lmyi
	 TlztWwd3hcTdLErz36nz+8KLANFUBHyEldBGCsuKEJy4L8GUqVwOkFKCisYqeTWPZU
	 LzxiH2EZr+MSpLQ7cGWgSfI15f6Vy1xpiiIG6kfo=
Received: from 2508871010 ([240e:36f:15d5:9321:d492:2643:ce55:ff7e])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 27487458; Mon, 16 Nov 2026 15:09:52 +0800
X-QQ-mid: xmsmtpt1794812992t95pdm71j
Message-ID: <tencent_5E8B535138DB2906DF4871E24590DA458A06@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb5NI1TIG5SPgh2grt3SLbTsU6jvSwK7417bQoWRF5vSW5DyuGoXr
	 TemuERD7Nen+wVpBIUNBUJEUIZsUKE5cHc9oIn+xnnfiqlyz88l0ByCTNuBOcaFo72AIa0TYd4Hs
	 38ioIJYbm5vjFjS9ao9sDnkc53eNyFoPrIhzxrf9ncU6GItrf9jYugidqLeM/Ljjtt84aHkPnLYA
	 bRVXlTGsyoNZ89eoabwr+ijFhOj5w1QVSru+xds9fOBOZsQdYUP8A9VvWILGwGwASOS7orIeqLtw
	 fOXA0xAxdyF0LGlxSN+HWMZWJjLVS3Vy+DasLixkXEJpxHnB+dgRRf5TuHK5BDhUumBx8nZi+DqL
	 DSXZnVXQhBWk2cPDK5V9XdefkLnVSWABJWHcC7ix8HDyt74glyEjpVBoxtz662G9Woek2KrLCRH1
	 +BDFwKEB9nri/Gaz6/JQ93vc7yw3j6qQh1LYceEi1n5+gHUWcwog1TLtKbGyzoVpMe6HkHE83PPa
	 gXwl/qei2VxZ6vZ3aXR4CMxKB3sKQF2zhpiwjtOU3Gg+9vDdBsbU/H/a8jccXVDGE1hgg04sopq+
	 tSo1MshQLVpQhAvFvVmUcTkcEbUX7hkKjJ+6zdWxLC7mwJvExr1sW7Ks+UKQfxToQRrYwKiYGQ6b
	 3kTj0YQ/YeywuCZQkp+kj8fRp4UfCh22tmcRb59ed82dhkor/h9yjfnODjJLShCVzqkq4eBvbOhf
	 F/Cx09p0Eq8lNWpY/M/BK2XMYLzKVZs0c54oFPMKeKm7BtRYc9Wt2w+NJePkSkESJN7pprLMkLmt
	 RzRsqISRIiF9X4sH+hBuqt5htAxq3M4DQqDqk73STGhPaquGaK9WxCJ4bgsXoF+Bv66qgcpUOVm2
	 Y1nM8lR7SWr+EMdUKqQ3mS0WBVjza267U2UEJJ59s+PXBhSd4E+AxY0i1fjxx9XlCxP0TeWYWRHI
	 682+lMh56nXhcSsZ1MkfGc3heyfyNGnxGzSJlk9Jkfpkv4eWFASqzSx0l9e2fTf8OWFUs6VLHkaN
	 CYVthTKhAAtUDTSce4ufWLELXzlIi1rIePQctTCyXdx968KpEEjYYrinyTcqmL87MrziwNihjR6C
	 B1ZdaQ
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: liuchen <2508871010@qq.com>
Date: Mon, 16 Nov 2026 15:09:52 +0800
X-OQ-MSGID: <179481299238.413640.12279841344606740793@qq.com>
Subject: [PATCH] ASoC: wcd937x: bound the DT channel mapping to the channel
To: linux-sound@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 2508871010@qq.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

>From 82eb1b88f7971375fbca3c8aedce2da80b189da5 Mon Sep 17 00:00:00 2001
From: liuchen <2508871010@qq.com>
Date: Mon, 16 Nov 2026 14:16:10 +0800
Subject: [PATCH] ASoC: wcd937x: bound the DT channel mapping to the channel
 tables

wcd9370_probe() copies qcom,{tx,rx}-channel-mapping into the per-channel
tables with the length of the DT property as the loop bound.  Nothing
checks that the property describes no more channels than
wcd937x_sdw_tx_ch_info[] (11 entries) and wcd937x_sdw_rx_ch_info[]
(8 entries) hold.

The DT binding requires exactly 12 entries for qcom,tx-channel-mapping
("adc1, adc2, adc3, dmic0, dmic1, mbhc, dmic2, dmic3, dmic4, dmic5,
dmic6, dmic7"), while the driver's table stops at WCD937X_DMIC6, i.e. 11
channels.  Any board that follows the binding therefore writes one entry
past the end of the table; both boards in mainline that use the property
do so (qcm6490-idp.dts and sm7150-xiaomi-davinci.dtsi both spell out 12
values).

Both tables live in .data right next to each other, so the stray write
lands in wcd937x_sdw_rx_ch_info[0].ch_mask.  The 12th value, 4, stores
WCD937X_SWRM_CH_MASK(4) == 0x8 into HPH_L; the codec then asks for
SoundWire RX channel 4 (EN_CHAN = 0x8) while the AFE keeps sending two
channels (active_channels_mask = 0x3).  The CDC DMA never completes a
block, the DSP never reports WRITE_DONE, and playback on the RX codec
DMA path fails with -EIO after the wait_for_avail() timeout.

Clamp the property length to the scratch buffer before reading it and to
the table size before filling it in, so that an over-long mapping is
ignored instead of corrupting the RX table.

The overflow was found while debugging RX codec DMA playback (no
WRITE_DONE from the DSP, playback failing with -EIO) on an SM7150 phone:
a temporary printk showed exactly one entry of the runtime table
differing from .data, which led to the 12th iteration of the loop.
Diagnosis, patch and this changelog were produced with the help of an AI
coding assistant (Claude, Anthropic); the submitter reviewed the change,
built it for arm64 with W=1 and verified on that phone that playback now
completes and that the codec enables SoundWire RX channels 1 and 2
(EN_CHAN = 0x3) instead of channel 4 (0x8).

Not done: qcm6490-idp was not booted, there was no KASAN or reproducer
other than the phone, and the DT binding still advertises 12 TX channels
while the table holds 11, so a conforming mapping now has its last entry
ignored instead of written out of bounds (binding update left as a
follow-up).

Fixes: c99a515ff153 ("ASoC: codecs: wcd937x-sdw: add SoundWire driver")
Signed-off-by: liuchen <2508871010@qq.com>
---
 sound/soc/codecs/wcd937x-sdw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/wcd937x-sdw.c b/sound/soc/codecs/wcd937x-sdw.c
index 575495187..baacfef6c 100644
--- a/sound/soc/codecs/wcd937x-sdw.c
+++ b/sound/soc/codecs/wcd937x-sdw.c
@@ -1003,6 +1003,8 @@ static int wcd9370_probe(struct sdw_slave *pdev,
 	if (wcd->is_tx) {
 		master_ch_mask_size = of_property_count_u8_elems(dev->of_node,
 								 "qcom,tx-channel-mapping");
+		master_ch_mask_size = clamp(master_ch_mask_size, 0,
+					    (int)ARRAY_SIZE(master_ch_mask));
 
 		if (master_ch_mask_size)
 			ret = of_property_read_u8_array(dev->of_node, "qcom,tx-channel-mapping",
@@ -1010,6 +1012,8 @@ static int wcd9370_probe(struct sdw_slave *pdev,
 	} else {
 		master_ch_mask_size = of_property_count_u8_elems(dev->of_node,
 								 "qcom,rx-channel-mapping");
+		master_ch_mask_size = clamp(master_ch_mask_size, 0,
+					    (int)ARRAY_SIZE(master_ch_mask));
 
 		if (master_ch_mask_size)
 			ret = of_property_read_u8_array(dev->of_node, "qcom,rx-channel-mapping",
@@ -1023,6 +1027,8 @@ static int wcd9370_probe(struct sdw_slave *pdev,
 		pdev->prop.source_ports = GENMASK(WCD937X_MAX_TX_SWR_PORTS, 0);
 		pdev->prop.src_dpn_prop = wcd937x_dpn_prop;
 		wcd->ch_info = &wcd937x_sdw_tx_ch_info[0];
+		master_ch_mask_size = min_t(int, master_ch_mask_size,
+					    ARRAY_SIZE(wcd937x_sdw_tx_ch_info));
 
 		for (i = 0; i < master_ch_mask_size; i++)
 			wcd->ch_info[i].master_ch_mask = WCD937X_SWRM_CH_MASK(master_ch_mask[i]);
@@ -1040,6 +1046,8 @@ static int wcd9370_probe(struct sdw_slave *pdev,
 		pdev->prop.sink_ports = GENMASK(WCD937X_MAX_SWR_PORTS - 1, 0);
 		pdev->prop.sink_dpn_prop = wcd937x_dpn_prop;
 		wcd->ch_info = &wcd937x_sdw_rx_ch_info[0];
+		master_ch_mask_size = min_t(int, master_ch_mask_size,
+					    ARRAY_SIZE(wcd937x_sdw_rx_ch_info));
 
 		for (i = 0; i < master_ch_mask_size; i++)
 			wcd->ch_info[i].master_ch_mask = WCD937X_SWRM_CH_MASK(master_ch_mask[i]);
-- 
2.43.0

