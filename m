Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816668;
	b=yfleWpZmo9GkYBxjwVc+g5/HjcRTPlb4U+Pi6NBJg6SVBxb7z18+BfwVG4epvoj0cqB2
	 13zqYjMNc4zabwZNRx0w8h36JZpFoF/bkGbFAD4b9hPmvshWP4Xc7XVsz507hLEk6S0db
	 /2jP5RiZaTZN+EmyuMAK3uSLz6NJfydnGWvg+kHL9HD79v5U2aTfkHpLKJmp0G/RRAz0/
	 Vlb39kmJSepA+F7p287wRLLq+24kVGjBxL06kEcIy1k74DtszPyXyBJjrqVW+u9gcrXEK
	 uiMM8lbsz6kEqoX2eGM+nP5+77cjkqLP2VWos5D57gKhaxlHL3prAFIVovbTrb1YwCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816668;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:Date:X-OQ-MSGID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=XusKqhnxM/yWQdrnmEkU+hu9+GGtSe+ZGMgwKQgdJAI=;
	b=eGJ2xDL87RTHBZQyN/12Ljr6dwWXQYxUGaNKkFY2TU9I/hNlMn81OUZjQZFJaD/jaSjE
	 5110w3Znj3EV16Xk3nLmOzqnu7nYtZAFwtgYOsrTzM6/ppBZQ155gSQ7/fxaOGUjNC4kD
	 3LsSmkYc1mYQvCi1xz+E3jQxWyep7i6PdBdTFbKMTiY0pSLeF2Mf2nrxw0rT9atMwLBOH
	 lXvMWqACj2R/6TkzSQOw/9Lb/Njs5xtGeo/hTYEIrwb4Rua+jYClnkGlHkWzddMNZMMQI
	 dK/n4GEIAHPkvCj0TJ+HYYsaqUykIS5Bb9G/LOliCHIOGCBEd9LuBLCo9YleITUUFNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=FPRWlP4P;
	arc=none smtp.remote-ip=162.62.57.64
Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D22606A323;
	Mon, 16 Nov 2026 08:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57D22606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=FPRWlP4P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794816654; bh=XusKqhnxM/yWQdrnmEkU+hu9+GGtSe+ZGMgwKQgdJAI=;
	h=From:Date:Subject:To:Cc;
	b=FPRWlP4P4HOyMGheFZ7wlvbtlYdPW7bv34aE2uLrid0UchNj4lBEVJQ73/uj+UdcZ
	 p0wD5dRPds/7toLeyZ8/9IMET1yQXW26XzUAGpJEf3aFcgD68SgAJX1Hu6zsWWefi6
	 bzzpP869HsmRC7fLr8HDsQN3mt7VYgUvS73qXJI0=
Received: from 2508871010 ([240e:36f:15d5:9321:d492:2643:ce55:ff7e])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 2B422A84; Mon, 16 Nov 2026 16:10:52 +0800
X-QQ-mid: xmsmtpt1794816652tb8u1sujy
Message-ID: <tencent_4D458B8B4F511E5B0F06C5C858627990C306@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb5NI1TIG5SPgjauQhtlI8otlmJIpTkeKE4nyh3+pnZvnLpZeHCHK
	 WYG4fDGByf0oSQ5ekYkhCNmOas61Y/VHyKVld/08994HkCHixYctnPU7jNJMQZx+xAjATf8KUc59
	 QkHmPwzJimcC/iQQv1uvpiPgI1HmbPzS2StRscJyBX6hwBR82EKzYta9D4D2jS8v9OrZM3XM3H05
	 1Y/Y2dLDWou/mg6TEdI9y+76jY37UlQ8hqJfZb4rMKSaBv2efgxHeE7Yo858vVL6TGu7Htb+MIDg
	 SBN/oaGEx7uDC5H8Ve8tqoO2kdzXxxzfk+OopOkaSbu6moSCaV0kgSLkbOtlIT4rJQXujWpvoLKe
	 /Vl7gnggClDyc7scfAdxcG7zOLTkXtzQlAsjTKKh/dAmrO9KBdyQCc5RiEhs0PrBHb1ez+0ZmEFt
	 L6rwZIRanP3UHHWmDA8BrtLZtJlGhwKrXfMfpj8B8vQjpYIN10S6kue/GqEIWdGh9VDEIHT6XCWU
	 cOmvbwdBGlFxgjUIO+2/HYlwcPJt02z0z3NnnvtMdsk4jh4s+AM3dccE/Bl0tvcDvEe8188m3CUQ
	 8onpEOO74x024dyqAD8vG50kjGlSKjy5ERFAA9f393eipyhh8kxyl+h/saMYuv8/1J/iPxwyMF5I
	 nOssYIwcD2UdLHcqqBh+NeyJ2csnKFBvusJyyWsQInVolxBXEGIoJKVzR1fpXBN3tgnp9xYTMV/m
	 zPNUvyy5GEYs7HkzkwN5+jdVY1BPmIZQnA3GbErdqQVCdHOw37p2Pl8rY0+qLeDFZrQF0ztgMyCZ
	 h9YktZs1RTsHI0fTtnldAjIhjLJhHWK4XjXSGFAX7pryf5oBMNmIH/ufM4NsDejtvoPGqpD2mhJ4
	 daaltlVC5E7vP/NWmegm4rWW8lPe9mRlx8C9/iz8ZJQE3RmQW86DlELhyVkkRqUfPevmBeFO0eHs
	 gDB92uyK2IEF1kOCvLQno+M2889avOP6xPARba/xF2klpZTM2XEdCrq30ezDM0ueZvrfnL5xyLKe
	 Li8ULU2aIFrMdehQVDW0XuAzQxY1p6dK67oeaLi7SpT7POm4/Tdhiu+JCpk4UZXg8ZxDg7ogec5F
	 z4hLQ7SfnnHERhYaA=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Chen Liu <2508871010@qq.com>
Date: Mon, 16 Nov 2026 16:10:52 +0800
X-OQ-MSGID: <179481665225.482942.4973717177724251703@qq.com>
Subject:
 [PATCH v2] ASoC: wcd937x: bound the DT channel mapping to the channel tables
To: linux-sound@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 2508871010@qq.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

>From 1121be9da86c87962c365f844af9b13dce9a64e3 Mon Sep 17 00:00:00 2001
From: Chen Liu <2508871010@qq.com>
Date: Mon, 16 Nov 2026 14:16:10 +0800
Subject: [PATCH v2] ASoC: wcd937x: bound the DT channel mapping to the channel
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
WCD937X_SWRM_CH_MASK(4) =3D=3D 0x8 into HPH_L; the codec then asks for
SoundWire RX channel 4 (EN_CHAN =3D 0x8) while the AFE keeps sending two
channels (active_channels_mask =3D 0x3).  The CDC DMA never completes a
block, the DSP never reports WRITE_DONE, and playback on the RX codec
DMA path fails with -EIO after the wait_for_avail() timeout.

Bound the length to the scratch buffer before reading the property and to
the table size before filling it in, so that an over-long mapping is
truncated instead of corrupting the RX table.  Only the upper bound is
involved: a missing property still yields a negative count, so the
existing fallback (the read fails, "Static channel mapping not
specified ..." is printed) keeps working unchanged.

The overflow was found while debugging RX codec DMA playback (no
WRITE_DONE from the DSP, playback failing with -EIO) on an SM7150 phone:
a temporary printk showed exactly one entry of the runtime table
differing from .data, which led to the 12th iteration of the loop.
Diagnosis, patch and this changelog were produced with the help of an AI
coding assistant (Claude, Anthropic); the submitter reviewed the change,
built it for arm64 with W=3D1 and verified on that phone that playback now
completes and that the codec enables the SoundWire RX channel it actually
needs (EN_CHAN =3D 0x1 for HPH_L) instead of channel 4 (EN_CHAN =3D 0x8).

Not done: qcm6490-idp was not booted, there was no KASAN or reproducer
other than the phone, and the DT binding still advertises 12 TX channels
while the table holds 11, so the last entry of a conforming mapping is now
ignored instead of written out of bounds (binding update left as a
follow-up).

Fixes: c06c4f7cbea1 ("ASoC: codecs: wcd937x: Add static channel mapping suppo=
rt in wcd937x-sdw")
Signed-off-by: Chen Liu <2508871010@qq.com>
---
v2: this is the first resend of the patch.  v1 reached the archive with a
truncated Subject header ("...to the channel"), because the sending script
did not unfold the RFC822 continuation line of the long Subject.

It also addresses the Sashiko review of v1:

  - The fallback diagnostic is preserved: bound the length with min_t()
    instead of clamp(), so a missing property still yields a negative
    count, of_property_read_u8_array() still fails and
    "Static channel mapping not specified ..." is still printed.  Only the
    upper bound changes, so boards without the property see no difference.
  - Fixes: now points at c06c4f7cbea1 ("ASoC: codecs: wcd937x: Add static
    channel mapping support in wcd937x-sdw"), which added the property
    parsing and made the tables writable, instead of the original
    SoundWire driver import.
  - Author/Signed-off-by: full name instead of a single-word handle.
 sound/soc/codecs/wcd937x-sdw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/wcd937x-sdw.c b/sound/soc/codecs/wcd937x-sdw.c
index 575495187..5ad6b30d6 100644
--- a/sound/soc/codecs/wcd937x-sdw.c
+++ b/sound/soc/codecs/wcd937x-sdw.c
@@ -1003,6 +1003,8 @@ static int wcd9370_probe(struct sdw_slave *pdev,
 	if (wcd->is_tx) {
 		master_ch_mask_size =3D of_property_count_u8_elems(dev->of_node,
 								 "qcom,tx-channel-mapping");
+		master_ch_mask_size =3D min_t(int, master_ch_mask_size,
+					    ARRAY_SIZE(master_ch_mask));
=20
 		if (master_ch_mask_size)
 			ret =3D of_property_read_u8_array(dev->of_node, "qcom,tx-channel-mapping",
@@ -1010,6 +1012,8 @@ static int wcd9370_probe(struct sdw_slave *pdev,
 	} else {
 		master_ch_mask_size =3D of_property_count_u8_elems(dev->of_node,
 								 "qcom,rx-channel-mapping");
+		master_ch_mask_size =3D min_t(int, master_ch_mask_size,
+					    ARRAY_SIZE(master_ch_mask));
=20
 		if (master_ch_mask_size)
 			ret =3D of_property_read_u8_array(dev->of_node, "qcom,rx-channel-mapping",
@@ -1023,6 +1027,8 @@ static int wcd9370_probe(struct sdw_slave *pdev,
 		pdev->prop.source_ports =3D GENMASK(WCD937X_MAX_TX_SWR_PORTS, 0);
 		pdev->prop.src_dpn_prop =3D wcd937x_dpn_prop;
 		wcd->ch_info =3D &wcd937x_sdw_tx_ch_info[0];
+		master_ch_mask_size =3D min_t(int, master_ch_mask_size,
+					    ARRAY_SIZE(wcd937x_sdw_tx_ch_info));
=20
 		for (i =3D 0; i < master_ch_mask_size; i++)
 			wcd->ch_info[i].master_ch_mask =3D WCD937X_SWRM_CH_MASK(master_ch_mask[i]=
);
@@ -1040,6 +1046,8 @@ static int wcd9370_probe(struct sdw_slave *pdev,
 		pdev->prop.sink_ports =3D GENMASK(WCD937X_MAX_SWR_PORTS - 1, 0);
 		pdev->prop.sink_dpn_prop =3D wcd937x_dpn_prop;
 		wcd->ch_info =3D &wcd937x_sdw_rx_ch_info[0];
+		master_ch_mask_size =3D min_t(int, master_ch_mask_size,
+					    ARRAY_SIZE(wcd937x_sdw_rx_ch_info));
=20
 		for (i =3D 0; i < master_ch_mask_size; i++)
 			wcd->ch_info[i].master_ch_mask =3D WCD937X_SWRM_CH_MASK(master_ch_mask[i]=
);
--=20
2.43.0

