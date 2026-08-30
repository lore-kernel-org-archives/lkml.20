Received: from outbound.st.icloud.com (st-2006j-snip4-11.eps.apple.com [57.103.76.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED421DFFD
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 00:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.76.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788048067; cv=none; b=WiEjznVDiVKEdh/iilm2JRDqKWAW4uP01gBqN3Yn9qskRvQAS5OHLdTrBXVA41dH60blxteh0GbXj0MwqpcwxJ00EnSLlisXm6/RjL7Bab6+mo2BxYXEjgo1QoR/9/fRTeVTmEczZLklpEas+zRnfgmTdTVsUOAcf9Sw/50HF3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788048067; c=relaxed/simple;
	bh=Fs9OMltzkjNyRypdyw2q6jgnXvJJwT21izYMgt+u4D4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YyrlBg7JFsbgw81f8x4DrPUJIKwv9MKgeK2ObZjfxYzo0fwJDAlLo31+AS+HWx3mVcW/iQzeQs9giwaRlNRGhmiQGR7a2ezyA6x4jLRc5ymoRvQ/w3wSm06Br1cU315GTaK2LkobWQZqj5jp4qhXxGDZBHHJrvM9tFXFIT49j7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=byyjAMWN; arc=none smtp.client-ip=57.103.76.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="byyjAMWN"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-9 (Postfix) with ESMTPS id CE43318007D1;
	Sun, 30 Aug 2026 00:01:00 +0000 (UTC)
X-ICL-RepId: 01a04ff8-311b-7e4e-9b56-e65ce4562b8f
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhJB0MGXwReAUwdXARfEhVdRUEEVAADSQ5WAC1eCF4fTBwdDlgGEhZdRVoOWwRHFBcbXAAXGVFNDFhbCFsEDx9MDFECQgVWXkoMHQRUB10FXVZQAlpLQgRLRWhcBVwcQBdIHV9qS1YUBBFQAVgeVl5aF15NWgJWTQVKA18BWwpDCUgDXQdbCl4LSgBaBkYDXUsRUAYGUgVeCjhaDlsERxQXG1wACUtGCUkdDgRUB10FXQ==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1788048064; x=1790640064; bh=7MEo6PfhAbSCGd6Pp5tHXnJaBo7Tn1yOdNssC5V67VQ=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=byyjAMWN887wy2KlKbNWE2q2fwV1URLPrP07K+ogvznNgjp3a2ZxD9K4ThSb8IHznP4uuDSUxkbrPt6HXgKVSPnmFkQHuzopRy5L79bo/YyPj+F88FsOXJ/NMfFrmRHtfTgdTWe/FHHpZpFngBDOwuySdnVng00lF3eUDBm28sAtDDzEFmpDMYNvyZLBFbMX1u2s4A63Xgpyfz2x8eVHKU1Cul3r5m/XYwsgjdkyk6xl8XNK8sVuVuYjbZZkalf7IfPEw3a2J9Kgt7TInoDxB9H23m3zSXGNZf6GBFZRTmhcLJVj9M0ULAIWa9vBYilce+Ps3cK+RzxAbcWhuHbMuQ==
mail-alias-created-date: 1788013603398
Received: from vaio-vjs131 (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-9 (Postfix) with ESMTPSA id 727B918007C2;
	Sun, 30 Aug 2026 00:00:58 +0000 (UTC)
From: Riku Matsumura <rick197.3@icloud.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Riku Matsumura <rick197.3@icloud.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for VAIO VJS131
Date: Sun, 30 Aug 2026 09:00:08 +0900
Message-ID: <20260830000008.22371-1-rick197.3@icloud.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9HJly519PNmkvRfXGWoYGt8XEva1eHi-
X-Authority-Info-Out: v=2.4 cv=X7df6WTe c=1 sm=1 tr=0 ts=6a9372bd
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10
 a=fzZKuvliyykA:10 a=VkNPw1HP01LnGYTKEx00:22 a=v3ZZPjhaAAAA:8
 a=2V6XNmGYLCZsKDmTOlIA:9 a=2Wl4p6LbmfKSPKhIh_70:22 a=NXiRo49oMsgu644ZUbny:22
X-Proofpoint-ORIG-GUID: 9HJly519PNmkvRfXGWoYGt8XEva1eHi-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDIwOSBTYWx0ZWRfX5jcNUOzHkY1y
 xZ62tyD9fHBoOWlH7I5+h0hFF1irfHD1n7krUqMKPoOuSyYPwuV0/W+P+/vOpS1y67hNO6fAe+S
 vsSCY+D8jCz3fhbS6ewu9H7gnqSy8e6ifohi0HxeGnj+kgayKlXwGP8EbucR77Qw5RYVqchGHQL
 uVwQAhqbsk1eRxgcCJLc5HKTTtAtjyeTr3Flt6Fr1JZidKfP/c8IaLOAWm8DHYfvZILClmikryV
 op5vrCtMqTEmgKdN0i0n0Z00hyarPWJdHmppYXeyENDlFEr7AoRBuou4I/qwsH1hFUSGWKTP+KG
 8yfNccyATcpQHEqHUdRwmRhAWnWs5EkDlgn9LLtXg/A1ANBxXpUR6LB+a7SY1E=
X-JNJ: AAAAAAAB0bvv207M2zumyD6i6el4P/o/4Myq/KyXWqubSX9iMRrX/A8oTFsbanU8sSOvtgCkliAQJ7DaDAl6DdncrDzC+eRrbuids1wpJ1ZSq5PfPoZ9WfdfYBel7SohCruEiycuc51tdQe720Wx031XTQ8DFTmloK3K9TlxB0Bbzb35urHOTYGkT+M9TXjgKxpN2QdN5KRmN+bzDDCHpPsMEGQK866kt/iORwnLC2mayr/h94bSVcsf4CUf29lYEJ2fi4t6/SSCexlb9zETLYhGx5B/HsKc2TLz0Qne5pNkN+MvLMf6NEGimcZs96XpGaMilQjmKLbciN0KD0lgNmXpIpovhjbxBJj0y/fcN48iZ+3YajiZpkVUM2ox+8E1svleCK7NwABtVZarR7S6Y6ke5leAqlPHOZmO/UJVX+ctD/wdofXB4jqwetaRKzzBM68I+zFwA5G+bSVA8dbrcKmT2oHPIJOsxTIev04gNvMuLoYDZAgjpxUwB6ZXiSAm9jNhxtweVp3PUiCOnPXeT3FraF68NSQIayuTLlnF2XMufZB7egWt/vA39mfxnVuQEno6+o+eE1XPxaNTFiLN78a6XRkAiK7FEoCnOKh4n5wUUUm2DScgaWGU6mJhcLNXjs7K8izRTU1e5MypPKtUeYFBvF+MZkEeaxykwqpzajEEX/iCxUqpfdlvCiMzzv8Usw4O9GvjncOT9mmnAwitavPn4YVc4VQ4ue32o4wJscptmNOHT0r1cSO5o9C9clHAXk9MDhvFkObfkC3NXEGtQ9rBo2VpghAfOdaddy5o++wIeS9H2zpWdrASUt34iGYJRGMBOFAzZxYB4MS4/Sx7BM12yLA+wcgBNLMdvpkM0TTTJTE087FTV3uf3cH1wgShrCNYKXikoD2ej8kFJljI7fAaIoiT3iT65wz61cIGM5z9QXvcdhOyGw5tmCnpcNAATIrLjYy6/MzHCgMcfqL227hNjqjaulV
 8PpIknPvN7o34RlSRBoPc368os5Pci9U6BfU+Q78YJ0mJPaApEEZLzmazW5MBvnknHzCkH0ElCkXq3phXc8/LeTrbSq7DyGHQRGDZRUH1g4Bcg7yIbA4HZp+vwZRqhxdmNFVCYnvp7938456EoJRm2Y6o6uM6daFSLKDbzP7ry5dXpxkPsRR35dQiwUpSkuZhKQzInb14aNy+DpzKbVikrJTtwXza5E9XX6HTVJml6rKowtB1EluKfuoR6a8=
X-Apple-Category-Label: MTY1NzkyMzA3NzI6JGNhdGVnb3J5JF9QZXJzb25hbCw=

The VAIO VJS131 with an ALC233 codec incorrectly selects the headset
microphone when no headset is connected. Add a PCI SSID quirk for
1d19:0006 to apply ALC233_FIXUP_ASUS_MIC_NO_PRESENCE, which configures
pin 0x19 as a headset microphone without its own jack detection.

Signed-off-by: Riku Matsumura <rick197.3@icloud.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index e4349743a251..96bbad376925 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8287,6 +8287,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1d05, 0x3034, "TongFang X6KK45xU", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d05, 0x30ba, "TongFang XxAF5xxx", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d17, 0x3288, "Haier Boyue G42", ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS),
+	SND_PCI_QUIRK(0x1d19, 0x0006, "VAIO VJS131", ALC233_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1d72, 0x1602, "RedmiBook", ALC255_FIXUP_XIAOMI_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d72, 0x1701, "XiaomiNotebook Pro", ALC298_FIXUP_DELL1_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1d72, 0x1901, "RedmiBook 14", ALC256_FIXUP_ASUS_HEADSET_MIC),
-- 
2.53.0

