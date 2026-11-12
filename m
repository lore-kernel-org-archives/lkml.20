Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491961;
	b=SS6mhGu+mbf4UjaZH6ljZYUZE0rpr1G12KAKQT8qgjZcHMIaHzzSbyDUmLpPwuhjm49r
	 OwycLZ2bvuagH1MP63MnUyjHmGHKXMCBom6MH7UpcOGqqlKaOgFDtMCpItKSJDWFL0csg
	 jWrh01ex/RencZzZ4cY1QJFrXSRnkAzCoAwXXtn+ajbG29rCs5eNcgo2YsCNMsUjNQ+Aq
	 5C5bqiX4/uHTKotitydegAr0N9qrJuXUDbTaWWyNjsOHZEl8duVOgOOtRAudnV45ttzob
	 /bDQS3rraJieJNsVH/RhNVkFkRwQ8UL8nKtDfSmIzby0KxvIKTf7k36OoYA1vPlp1dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491961;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-HM-Tid:
	 X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=lXG9MBSQhDrGOCZTWj0nDvoJTqPM2YbPFRE/i7Hzskg=;
	b=4RlLMOVIBi+X4ocAsQGZ4ROnvAn7ROlPq2SvTyxac7RtskAndwGP7Rz+mafa6wNcs8g5
	 O3DD39WPcWr1RrUQpm5sK9cPDkhbMdt+PgYfwQgHIajp4bu/os/1fVVuCK9PvF7wxmopo
	 sOGv+hcRDIuL9s96Ip1FFwUab/70NEhnIBAZWVXijOgWS6fKiBk33aXpI+TaQlgsybdSc
	 rIcnTNijMsqulNjv2BNYAP8/mwGV18CYGEt4LKPvUY2Hyut3v2g9KYIBzPvIDanruaROC
	 jOlwqqLexpIZIQcSi7/jDkkfKzKWrd/UtT7QmWfFvYpET+/TktnVcE7utlm+h+4LFtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b="WW/cxJNs";
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A070560A6F73;
	Thu, 12 Nov 2026 13:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A070560A6F73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=WW/cxJNs
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 547738931;
	Thu, 12 Nov 2026 21:59:15 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: wm8994: Fix potential DSP control text array leaks
Date: Thu, 12 Nov 2026 21:59:14 +0800
Message-ID: <20261112-88a3a7ff32-asoc-wm8994@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1d00e382803a1kunm5dcdbc1b2a0b
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHk1KVkJISx9DSU0aQksdTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=WW/cxJNspN3aJBbC9EvDLguQurxe2MAVR9yW4k/IhpjaR16Ym3ijDg9wWuV8SuSVjjfEsvdDqyeZBEB5A0AzX8Eh8k0Jg3Qrgji1sEk3ljVk3ogk11ERmfGql5e0bZm7D1Ky5a5EAterOcttTmu6S/Ark3hbZ49wcBsEtFBS5OE=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=lXG9MBSQhDrGOCZTWj0nDvoJTqPM2YbPFRE/i7Hzskg=;
	h=date:mime-version:subject:message-id:from;

wm8958_dsp2_init() allocates text arrays for the DSP mode controls,
but component removal does not free them.

Release the arrays on removal and clear their pointers so a later
component probe that stops partway through allocation cannot leave
old pointers for the next removal.

This issue was found by our static analysis tool under development.

Fixes: 131d81061eba ("ASoC: Allow user-specified WM8958 multiband compressor configurations")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 sound/soc/codecs/wm8994.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 6b91e02f130b..1c7619f1d481 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -4640,6 +4640,14 @@ static void wm8994_component_remove(struct snd_soc_component *component)
 	release_firmware(wm8994->mbc_vss);
 	release_firmware(wm8994->enh_eq);
 	kfree(wm8994->retune_mobile_texts);
+	kfree(wm8994->mbc_texts);
+	kfree(wm8994->vss_texts);
+	kfree(wm8994->vss_hpf_texts);
+	kfree(wm8994->enh_eq_texts);
+	wm8994->mbc_texts = NULL;
+	wm8994->vss_texts = NULL;
+	wm8994->vss_hpf_texts = NULL;
+	wm8994->enh_eq_texts = NULL;
 }
 
 static const struct snd_soc_component_driver soc_component_dev_wm8994 = {

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
