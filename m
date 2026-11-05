Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875429;
	b=pElN3zKZUKIhzgUAo6o/78++4jKnfNXR67AtHHPzcbDx1mK8X2cyRe5e1Jl9qpw1ivmY
	 PYpZ++QBqGp3WLgoNBzTfBeDzn2ebnRWHFNP131bvbKT1Ud3xRIQw6VTjWN9m3+4MEBaz
	 ejK/783X7gw6n7Wi7zJwx9A4fZd87wdIXDhUI7HDuSNvAA0O5kpSx67foTHlVu/hZU1IO
	 Ud4JgG/UzkcLUnD2Or1qeLxC7ofG/UYZZXPU/3qowneuoCbZoFyAUmgUhee8BgCuSCcPH
	 vsdS/STD/d5lLqZTY5Oax/7fA5CEVCStXdtj/Ajt6nFL3kBmCCLjX9ZlH9BHyN4vXgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XIRj/VHtFRarv0lZNWmzV0C1FzshlGUywm6oQSCzwkE=;
	b=r8jhiujZkvodyw/ZQmykPyxsLCVo5JFlseQUSqeIap150tgXc8be+vZmAGHWJ1ejEZ4C
	 M0ZsV6LSzNXEikOOdeoctH1emzXdyf5mfNlvd0Vx7+z2orDGh1P3SMipKQ+tcfJJ+k5sP
	 1Cv1sx+brwTs6mnj8MSKD2NCxZEOvuXcNyxPfauncN/Gfi3U0/suzXg+ruwjAH3wvkRKs
	 j8tAb4zeJTmnJut4SAi2cd372vct/w/OQUNyAm21JwPQWeNqKOmdigzfSgwm73wBpWXaO
	 yLta7nqIdXA/AxWdr1/1NE/HKb5OPRbekbi1buPkp0lsiKFsFGP0ee8scAaY6/6oL3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eejIlaPH;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9EF606D810
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B9EF606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eejIlaPH
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a8cc11ac42so1735063c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793875428; x=1794480228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XIRj/VHtFRarv0lZNWmzV0C1FzshlGUywm6oQSCzwkE=;
        b=eejIlaPHoVCdN+3ll6UyV4g0vciZtl0gpdogZFJ21OwGNoqux3wetKknXg5Qjh6Yn4
         kbqdMhXbY92b/8Gnb6duxvaFK9zpGGXeShusSvmVvODyferwCxJ5CGYD+Phm9sIxzzzN
         4aRy10JDjXagAGn7ZHjdeAbsh3uLu8sV/EzarHAr6F5GJzbQrksG4Erqz1yOW8h9UIX+
         thsPAq2LUvAXn1U9Z4treehgUjMtqM9hhA5+g6xueaIz6oDJ9KOv67rElf/IZd4u+CFk
         GwR3w0mRSTqgjMHBd89xJ1PMlcYAn3gAHQ7vOPrykqzBSeP5kJlZR5zfs5HeOS69h4al
         eJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875428; x=1794480228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XIRj/VHtFRarv0lZNWmzV0C1FzshlGUywm6oQSCzwkE=;
        b=pCo/8A1u8oA7kSa805k4kecPzFd7W/ZMsDiBg6iQzkNCunEOQpHZiee1sibdUrzgXA
         AUoUnlUy2J70JdYmPNvpcmsOzhG05Pvjoza+Y738TEWvQ+jNis5Wqndqi76US7ZCLX2E
         kveZ2YtMrfC9GCnrg/wEmgxvQt+bLvuIzNJQlGivG3euFwgtMjo1fs7NpHgRkot6Err5
         QhoK5cfOlZVjnI1/CsyO157HN2E7kWvfmyPs4vqckS9Ebl6SKkuT4+APsoW3qiwXqKXG
         9e/odc0cWyb16jKAajwsW56f4UBaVw6jvN+u43+llXsNgjfbcN8fpgNkl+N2xujSisLy
         swqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZ2pobAxoA2dX0OAzTR+7vTKoBvnS4eapj1pBWILi4lv3HcnTlQUPwTtQkXL37b100GGwHK1T+2amovvs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vXRLm5NwuWmYGXB8sNhxgI6k0Ed+ZVR3vTqg8y2EqWLRdca2c
	TXC81iP2PkBZozkxgIjTzYJS2mlJFb6MEri+6+5OvWJh801LCLSosdJx
X-Gm-Gg: AYBFou3aOje/plVaYWe0jCLw8Hgfl6PSWc2/DpTNIll3/vpVsm41YWubxdTP4vho0//
	7aj9HQwd/hNiOfpUpsVVITbGIb6H5nZHyRLgQL4kLhItsXVSkGZxyfCEDqaHTuCfcMaMtJ83IQA
	Mj2OORbANF6wlbXmdeLPoQLTuMLplsC1yAzOm0fl2rdhm1iWUgiA6+TPz0hZ1Wsv2G1gRhapk2k
	UMnh6TFjkMPnq9URpBdd5R9X4V/iuSbnUFzDdLtNvOYGkFw+dqslQH4eY1jwC5kmdSrVmBi3d/T
	Ht34vzkdUT/pvfiI6EZ/k2sWucNWiuz2hIBSVk5j3zJsEi+bJh0/putozuY8W9uR59ki/TMkXtY
	D06LwpQtpE7n+X4ogCayp5y2XAat2LMIKS2czhvNpyD1Cvs3lnF9pVFKi9osNrydu8i/2Gvd623
	ODmOjehUre8wOJbpG2Z6cSTT7DI/Y/wtuGnhuFjN42A4Qd3sDtkTknhv/N5qW5WvLDnZfJs/3nh
	4cPL2T55TYUkT2nmrWwWLPg+zDMfgFae3MNjeYZrkS0Gna1aWkpFb3iROsx15Br3ho2OTwyA7aF
	pC/MyCk3z3EE9Sn14SRbO/zy6w7yozDkFXCfaC2cJSzNN3UIKjJJJPcQ9MrDawOd6UvM0LE7Pj1
	i+ndhse31Rw57zlFmTWStK5ENc4gtTz3LTyi3BZPnyJH7PofmZ/IaE5DF2WDbnzL8JA==
X-Received: by 2002:a05:701b:42c7:20b0:1b0:f0f5:e38f with SMTP id a92af1059eb24-1b0f0f5e3b5mr20779490c88.34.1793875428330;
        Thu, 05 Nov 2026 02:43:48 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm15595215c88.8.2026.11.05.02.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:43:47 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 07/10] ASoC: fsl_sai: Clarify fsl_sai_dir_is_synced() documentation
Date: Thu,  5 Nov 2026 17:42:34 +0700
Message-ID: <20261105104237.38542-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105104237.38542-1-phucduc.bui@gmail.com>
References: <20261105104237.38542-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

The summary line of fsl_sai_dir_is_synced() reads as if @dir follows
the clocks of the opposite stream, while the function returns true
when @dir provides the clocks and the opposite stream is synchronous.

Reword the description to match the behavior and document the return
value. No functional change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index f75a1d61d7b7..25243b6859d6 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -88,14 +88,16 @@ static const struct snd_kcontrol_new fsl_sai_timestamp_ctrls[] = {
 };
 
 /**
- * fsl_sai_dir_is_synced - Check if stream is synced by the opposite stream
- *
- * SAI supports synchronous mode using bit/frame clocks of either Transmitter's
- * or Receiver's for both streams. This function is used to check if clocks of
- * the stream's are synced by the opposite stream.
- *
+ * fsl_sai_dir_is_synced - Check if the opposite stream is synced to @dir
  * @sai: SAI context
- * @dir: stream direction
+ * @dir: stream direction, TX or RX
+ *
+ * SAI supports synchronous mode, where one direction uses the bit clock and
+ * frame sync of the other. This function checks whether @dir provides the
+ * clocks, i.e. @dir runs in asynchronous mode while the opposite direction
+ * runs in synchronous mode.
+ *
+ * Return: true if the opposite direction uses the clocks of @dir.
  */
 static inline bool fsl_sai_dir_is_synced(struct fsl_sai *sai, int dir)
 {
-- 
2.43.0

