Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BE746E000
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461902; cv=none; b=MlTgTKovSwiZa09koS53xFZjT2k7xkG4/Ltd6OL4bnziUK5Dq+xrQKewyYDKBD+D4bpOz/FUs9FytXSeipgg1jTJ7Ei7WsOYsY6F8HyUdqpuSWtAqV8CpBj39X8X2norGIOcNBvrNdPHdot3jv8y275crWKf+aezDMBwAIcIM54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461902; c=relaxed/simple;
	bh=9lltDihzzJHKbJzSaGaaipr8NvQ1MAjoRyhSsUT8bvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ji4h5OAzXw4/bPPuKYnUVLGjWO0wWQaZVFomjCrEc87xolCFeuZ7W59VI3i3X8wBsAX08VVBAmIBzR5SmcE7T/D1UiLbEFGadUMOx9uAawmkLJzOOtPDNXtxdqtGSNBaXhDWxVdOggJDDptn2jyMH4QazJ4VjM8Gfs8f6z8lOL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qf1UDtWL; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qf1UDtWL"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4c7a0so12933a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461900; x=1790066700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ODo/pPzqKbReI+aI7w11jTc+qrHbOYIPwBg1VaG134=;
        b=qf1UDtWLZqwGMzQmErivha81qR+WUyh82tHWXWVcujNUQ1weTzFnNeu3JycYmUR1S3
         J+Nue79Mw5p7l+7FM0uw72bwjhubwfTr3jJOXrf3tD5oUoMfxLLIPQUVKR35IngDYdUk
         IbsGBCeGaWXowbJnrPQlCFY+o8UiTJsVcg+HCNphRAbhU6e/HrTyQwA7Zupjw/9p8A4s
         CBqowcmpwGElbhbZeh5KitbMXy5OoqqwUDtcpohYt6ocERRc9yeO3J0clMyjLSUmVdjk
         Jt/XbKAAuy+lOjAngbluHZqTsJ20S8JFD1CVVfyflbd4GR/I/0PnHZarZtE2Ab3g/3d2
         xwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461900; x=1790066700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ODo/pPzqKbReI+aI7w11jTc+qrHbOYIPwBg1VaG134=;
        b=JX7zo1goOk0RISQGQmbtWtSvrJzWoOhJvYePWs+su8LYg+3x/rt1De3VlPfB6Au9YY
         xI7dgBiAG2ALpPziURQmxq1kxnN1jdlPioeN6vMhfJ/MMLfo52Re9X1zPo7GRg8zz0K4
         uKktpfOz3u6UVCXaxIsW/bCAwsSGsC0LU+h4MiRx5TCvQjmZhx+5LFMrU7fsZ5nZGjZB
         7tKtdgadI46OC9TorOXNDW/kn890vUiKZGplelh2RpHwzo5ZN9QVM0RP4RQeZWwdrWEe
         qKOMDqRlzYXinMk6zrZu7pw/R2Wqnt6JhbOO1JcLJCaP4J6SEu6lMTDtJ86o2P82Fmmk
         P8qQ==
X-Forwarded-Encrypted: i=1; AKwUvByiOKtGOlV55u8LSkHASt4e8bllJthbkVCvhVb6Z+RCJLoCa7/DXLMxDq6dIqOkR1UIjfVMDMlBbgOeX8M=@vger.kernel.org
X-Gm-Message-State: AFuF++kTRpR+N5ZM8Mq4Nk1Y0jXIZELjWriO6ZWS5IDiARr6shptCzVV
	XdwQq3V3cSl9TzIalyMZntKbsRr68mQ2fM44q0jUc228gtxqx2r5hPRO
X-Gm-Gg: AYBFou1BM46N3mUCnODhSH8agyRTp+qzIWZapfR5x973ixD0cHCMuvKRYMCvmpR30Gr
	FyBgfkWWe1wICU+car8O8TMbFGEc2tbsViUE5PB3hOUxSe81pgiSE/j0R4z+WS1IWBa9MP9MtEm
	rx+dCkRBb1/zCADzuL3wTFNxRHffeK5FcbWcmsnqAXv7V65Dim2HG2laSOqJJd7ybqItjKpUD0T
	VNnn7g/0utwh4rxpyOoNijzWnAVHeOphBw4AIEHtQjdEC40RSH55LLKPZ5pY1ITeupjXqffgaJo
	rOdkJZVg9AskkYPbNbbD/qPSUoTpr0h2Hb9OGdjdAagXjuYxS3vNmWSceSPLpDkjBPOf+j3ZiYZ
	AyqYlcVRB/nJ1gwmGTGhNUxkuWzR9svMMAEuZAjbOGuwQ6P9cnHyNmZmbou8+tFa49bDIocFoZq
	EJGFJTm7n4pFC6q46Gq/da9+uHZoVQLe6SN/ff3j2nGjkRXR0P8sqgocIYKCCTI2zSg2hzIiYg5
	1x5/M2QOj68ODtEafu+wvzO/RM=
X-Received: by 2002:a05:6a21:517:b0:3c3:a20f:f729 with SMTP id adf61e73a8af0-3dd52688949mr540524637.7.1789461900477;
        Tue, 15 Sep 2026 01:45:00 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:44:59 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 11/23] ALSA: ac97: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:12 +0530
Message-ID: <20260915084424.1007757-12-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/pci/ac97/ac97_codec.c | 2 +-
 sound/pci/ac97/ac97_patch.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/ac97/ac97_codec.c b/sound/pci/ac97/ac97_codec.c
index 0bb65be021d9..207ce083593f 100644
--- a/sound/pci/ac97/ac97_codec.c
+++ b/sound/pci/ac97/ac97_codec.c
@@ -2960,7 +2960,7 @@ int snd_ac97_tune_hardware(struct snd_ac97 *ac97,
 {
 	int result;
 
-	/* quirk overriden? */
+	/* quirk overridden? */
 	if (override && strcmp(override, "-1") && strcmp(override, "default")) {
 		result = apply_quirk_str(ac97, override);
 		if (result < 0)
diff --git a/sound/pci/ac97/ac97_patch.c b/sound/pci/ac97/ac97_patch.c
index 64cc39dd2008..8577a2e0510c 100644
--- a/sound/pci/ac97/ac97_patch.c
+++ b/sound/pci/ac97/ac97_patch.c
@@ -430,7 +430,7 @@ static int patch_yamaha_ymf753(struct snd_ac97 * ac97)
 	/* Patch for Yamaha YMF753, Copyright (c) by David Shust, dshust@shustring.com.
 	   This chip has nonstandard and extended behaviour with regard to its S/PDIF output.
 	   The AC'97 spec states that the S/PDIF signal is to be output at pin 48.
-	   The YMF753 will ouput the S/PDIF signal to pin 43, 47 (EAPD), or 48.
+	   The YMF753 will output the S/PDIF signal to pin 43, 47 (EAPD), or 48.
 	   By default, no output pin is selected, and the S/PDIF signal is not output.
 	   There is also a bit to mute S/PDIF output in a vendor-specific register.
 	*/
-- 
2.48.1

