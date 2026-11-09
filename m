Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219961;
	b=ZyYpa581RApalRPYvFTXdMdgJwqXl3x5UrtVI19kxNZWn+KOHqTl1FzDzQn+XFhxzV5R
	 jDbkevpH6zA+GQZkVmGIjVbfHyihGN1HAfUB95Zk/VkN7AGwX4mNvA8MuIIeoncxexEKO
	 LBt8oOEucT2jYk1BPv7A86yky/599dPRXhomWjvQqRYqJTHDhdYwnDYlcYUFIFI24Xqqu
	 428KbFB2bBCEIOY24uYgsUU7deNzIVIoUiu0GJ8me0yomJAMpUxeE5KdSlmACciq1MebL
	 FpxSotvU53CH5KVEAgy/ctvRl35chfW/kUN0j00ON7N22jp2YQt2cfHm7xFB2e8ebRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uHPeML+Gj2Ysyid/5nBfP8omp9YpKenMsUd7Cm1Nnmg=;
	b=kS9M06mM6LvU1YKJL0ZNouLsWPD8qj3yD0fRkMkpSYB4AAqaidi6Itck81PreHDRgDKX
	 RGmjoJii8CbpSiZZGCjnC5uP6q+4PLP9V5nXtQwwsn+GdBYzg7JnczaiBXI/7v3gxNOGm
	 /qVOomUyAUF+efbN8NMg0H1doFtWqz23Bd1v/0j36+uyr0ci37nivpoB2htnpXGqsFXOG
	 drT6MqBd75wiNymbYmjzjmyJHNNWAhcr4ibj0Ml8VzvLvEhuHSGOaX95+7uoIDhj5iv2x
	 +D2gadASlVRY477sKy676hutc9TAVHvZx2GY96EI/9BsWHrV/7mNSvAYcbUDKJ5dGeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lg73tQk8;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F27606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93F27606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lg73tQk8
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-497614c95f0so185342f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794219959; x=1794824759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uHPeML+Gj2Ysyid/5nBfP8omp9YpKenMsUd7Cm1Nnmg=;
        b=Lg73tQk8Ygi5OLpl6XZxHqCz2vd7pk2pZtjs5xQu5TZ+YLl6/ScJdYY7jI7Cals4FH
         qepztcy5IfS+SfS2Nnge0UZ8DJnBW1jh4/iwnN8N2CSqadh31idvtYCSAeYz//KdKMM2
         xagjOGRGKPXzIeFbsbONbIsy+ilTqy8nJ7XEF32DQasWL1cWsskAW3F+/beoWezYsfez
         jpwU8ajOa4UcbEqZx7sxtYzb3Iw53XVmD0h4uLvYNLHUuFHJFp+H4I3sxKtuJk0wAQNA
         8Tzybw1ruBG8h2znvmi0Xoract6pXBCkZvvnZNx5UzfTVreszMNumyBc71V9aOhtLVNU
         xkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794219959; x=1794824759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uHPeML+Gj2Ysyid/5nBfP8omp9YpKenMsUd7Cm1Nnmg=;
        b=mTW3h0JTYudfsDEfSJKd0Zgb7VOTAjhlgc64MBqx46lTKqzkIUV64IzgBPcGEMaVJB
         pWX071xfEVpj5SXwMxUAxmdDx5T68Uis5a7S1EWfgUBr1wgHr1RIUQktMse6CKINZeAW
         4FBJW3a82asgAuSAD1Pqu0k/hTx4DKZqDlbKpY/oYyT3uZ378LFF76Oz78/Xhm8c/cHv
         Id/wmT/mVV0ArqFqcG06yznrj5d8BbRMxyw7ErY2WbDeCEV1SbWcJemnmXMF4Qdx2wr+
         uOhDpop/SxdngBBlGhG+UMeOkjaAuxZZt7nwv1+Ye60flfYFcFZ+QiRoFfFTnLy4aVyh
         5PrA==
X-Forwarded-Encrypted: i=1; AL+hErHCF4svqqeGZsbLBvSpXx+8hvsBBgEgyEe+ovh66d4IbIOJZUP4NbVFLkxtwJWSwhaDTIgXqS5/kqnI/9E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Sw9h5IQWmj0lo8BQILrLEVuNPIdskkcPMWt11bErHCaXZnoaZ
	pjBIyXq2MSi2Hks+Xm8Qwz/CSqS8QVzahrqh00DgOTfmQVXTo/S36U+s
X-Gm-Gg: AYBFou2Chwj4XmU2pEtWw8GtEFBCLd0p+0dKnddtj8zKPUDn0AMCLAjhxtWp31l0rY/
	vmHI8U4eWLeJJbgSa+67mvdAOvVHe0stKAFjjVsIim8EKYiVkZCPhcy19WrwKSs5w/5vsSqhEMs
	uGVKrhRuYRaVjMbHCmx6XjsEzkP4FFQ2nyJuGD/0SkgIL++Br/tqztUpySicxFS01XeHjvTGc9N
	5Vca2Zd8GaoLmqOAw5jBKdrmK3IHJ9itQ7P3QAxmCVYq820/sgLMHKCzUe/SR0noFDwIiIiHfNR
	vI6DvNUJAd6wOM1GWbDqwsUlkB9H3G+P+vqKIslda7sFrzPcTuBMjZ8+4jwPOwnGxLbkLKbmFfF
	MsKZ3LFAGSffpgga1HkplFRpPfKQbdRTVS5CelYmpphrBPrPhYsP0SHt9ZFh8Ro+/Y6w73DE/d5
	JoUx5CZup4PoE7sieNGTXX3bVCi8LQa9HevEWLhmn/Wya8NA1sQT0yCD0J7D5eWAT2PO1f7f+GY
	/ORtuOTNNvNQqrspqTlqPoEO1gSvfBK1gmgJs2mv4RyFhYGlH8Di4pwXy8G6rAIN6/s2kf1qqPF
	pAAeAJvyLCr/TYnq/mwYjcohfCPcJps8mK7ef+YVpAcE9FrOFx8YPzKCNfahU7uJY2065V2N8wJ
	+PhGWvQ==
X-Received: by 2002:a05:6000:260a:b0:491:f150:caa7 with SMTP id ffacd0b85a97d-4958487b45fmr6791123f8f.54.1794219958787;
        Mon, 09 Nov 2026 02:25:58 -0800 (PST)
Received: from emanueleg-nb (host-87-10-175-32.retail.telecomitalia.it. [87.10.175.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4967003fefbsm5057940f8f.13.2026.11.09.02.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:25:58 -0800 (PST)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: soc-core: reset rtd->num_components after allocation
Date: Mon,  9 Nov 2026 11:25:20 +0100
Message-ID: <20261109102536.357134-1-ghidoliemanuele@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>


Commit 4dd10fbbeb9c ("treewide: Convert devm_kmalloc() family to the
devm_kmalloc_obj() family") switched the snd_soc_pcm_runtime allocation
in soc_new_pcm_runtime() to devm_kzalloc_flex(). components[] is
annotated with __counted_by(num_components), so when the compiler
provides __builtin_counted_by_ref() the allocation now also sets
rtd->num_components to the number of allocated slots.

snd_soc_rtd_add_component() fills components[] one entry at a time and
expects num_components to start at zero. Starting from the allocated
size, for_each_rtd_components() stops at the first, still NULL, entry,
so the runtime has no components: they are not probed, no controls or
user-visible PCM devices are created and the card registers empty,
without any error message. In addition, each added component is stored
past the end of components[]. On the tested board these stores still
land in the slack of the kmalloc bucket that devres rounds the
allocation up to, so KASAN does not report them.

Reset num_components after the allocation.

Seen on a Colibri iMX7D (simple-audio-card, fsl-sai, sgtl5000): the card
is listed in /proc/asound/cards, but /proc/asound/pcm is empty and

  amixer: Unable to find simple control 'Capture Mux',0
  aplay: main:850: audio open error: No such file or directory

Tested on that board with v7.4-rc2 built with GCC 15.2 (first seen with
GCC 16.2): the failure is there without this change; with it, playback,
capture and the codec controls work again.

The root cause analysis, this change and the testing were done with the
help of an AI coding assistant (Claude Code, Claude Opus 5.5).

Fixes: 4dd10fbbeb9c ("treewide: Convert devm_kmalloc() family to the devm_kmalloc_obj() family")
Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
---
4dd10fbbeb9c only reached mainline in v7.4-rc2 (not in broonie/sound yet),
so this is based on v7.4-rc2.

The other devm_k[mz]alloc_flex() sites added by 4dd10fbbeb9c were checked
too: none of them fills a __counted_by() counter one entry at a time, so
this one looks like the only user hit by the preset counter.

 sound/soc/soc-core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 68b54e509b65..06a1d5718997 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -387,6 +387,12 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 		device_unregister(dev);
 		return NULL;
 	}
+	/*
+	 * devm_kzalloc_flex() presets the __counted_by() counter to the
+	 * allocated size when the compiler has __builtin_counted_by_ref(),
+	 * but snd_soc_rtd_add_component() expects it to start from zero.
+	 */
+	rtd->num_components = 0;
 
 	rtd->dev = dev;
 	INIT_LIST_HEAD(&rtd->list);

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0

