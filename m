Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22EE331EC5;
	Mon, 21 Sep 2026 06:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789972005; cv=none; b=j90LgNy9e+i6rfxfZ+KzVyGPaa/zXjlE7q7/Gl9NirRo6Rb+RDSOzbxs5gAetcH6ooNN27MGT97TS64WDV3LL60oulf9Qm5Oxvzup2H6ESoqYGbEKDgSUZ2DmdJHKzZWWMr3QBU9oo0/cgpxoz7C5Q6NqvGeefKj9tInP23foPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789972005; c=relaxed/simple;
	bh=NmGN6e8J6coRAC42nWLIGI+S2PP+7A8W5HG1gMG093I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gxqx3qgfzo866W8PRNV/I1cw2I/l0XOnAAlcGM7UfGIsMkcyeZUs8+oZbcL4A3lz7HYXKgt4FhAxnDOCtQHS3mz6FpbsRn7qW+DWE5Q6ZwhRGJDE8tOApsQ02PklVsbhDpJBj/uc+tWbhof2hXrjlnaMx6S+bKypBSwbXEuvbtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 66f378e0b58511f19a56ed5b684f684d-20260921
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:f32c37c2-ce9e-4767-a67b-29758daf25ef,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:2deeda972b34a92ef3b5b386088d1f70,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|865|898,TC:nil,Content:0|15|50|99,EDM
	:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 66f378e0b58511f19a56ed5b684f684d-20260921
X-User: zhangheng@kylinos.cn
Received: from [172.25.120.77] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 308103737; Mon, 21 Sep 2026 14:26:38 +0800
Message-ID: <cff155e7-5391-4704-9f8c-915663e23071@kylinos.cn>
Date: Mon, 21 Sep 2026 14:26:35 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda/realtek: Match Yoga Pro 9 16IAH10 quirk by
 codec SSID
To: Matt Barr <matthewjaybarr@gmail.com>, tiwai@suse.com, perex@perex.cz
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260921024011.2115055-1-matthewjaybarr@gmail.com>
Content-Language: en-US
From: Zhang Heng <zhangheng@kylinos.cn>
In-Reply-To: <20260921024011.2115055-1-matthewjaybarr@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for the patch.
I agree this needs to be fixed, since it affects other sound cards.

I think it might be cleaner to reuse the existing quirk and drop the 
separate entry, something like this:

--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8214,7 +8214,6 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
         SND_PCI_QUIRK(0x17aa, 0x3834, "Lenovo IdeaPad Slim 9i 14ITL5", 
ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
         SND_PCI_QUIRK(0x17aa, 0x383d, "Legion Y9000X 2019", 
ALC285_FIXUP_LEGION_Y9000X_SPEAKERS),
         SND_PCI_QUIRK(0x17aa, 0x3843, "Lenovo Yoga 9i / Yoga Book 9i", 
ALC287_FIXUP_LENOVO_YOGA_BOOK_9I),
-       SND_PCI_QUIRK(0x17aa, 0x3846, "Lenovo Yoga Pro 9 16IAH10", 
ALC287_FIXUP_YOGA9_SPEAKER2_TO_DAC1),
         /* Yoga Pro 7 14IMH9 shares PCI SSID 17aa:3847 with Legion 7 
16ACHG6;
          * use codec SSID to distinguish them
          */
@@ -8308,7 +8307,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
         SND_PCI_QUIRK(0x17aa, 0x3912, "Lenovo Xiaoxin 14 GT", 
ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
         SND_PCI_QUIRK(0x17aa, 0x3913, "Lenovo 145", 
ALC236_FIXUP_LENOVO_INV_DMIC),
         SND_PCI_QUIRK(0x17aa, 0x391f, "Yoga S990-16 pro Quad YC Quad", 
ALC287_FIXUP_TXNW2781_I2C),
-       SND_PCI_QUIRK(0x17aa, 0x3920, "Yoga S990-16 pro Quad VECO Quad", 
ALC287_FIXUP_TXNW2781_I2C),
+       SND_PCI_QUIRK(0x17aa, 0x3920, "Yoga S990-16 pro Quad VECO Quad", 
ALC287_FIXUP_YOGA9_SPEAKER2_TO_DAC1),
         SND_PCI_QUIRK(0x17aa, 0x3929, "Thinkbook 13x Gen 5", 
ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
         SND_PCI_QUIRK(0x17aa, 0x392b, "Thinkbook 13x Gen 5", 
ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
         HDA_CODEC_QUIRK(0x17aa, 0x3936, "Legion R9000P ADR10H", 
ALC287_FIXUP_LENOVO_LEGION_AW88399),

Since both entries use the same external amplifier,
reusing the existing quirk seems more consistent.

Does that look reasonable to you?
