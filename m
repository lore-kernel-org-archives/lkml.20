Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EBA4457AC
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789912418; cv=none; b=nl2YO65X/g9TwYdhcFtIMsyYghxDJJ6mhqPLcQxY6wvdXEi+pJU/YpnjW7l5/He45nTdPmYErSNbEz98h2LfLmUtWC73LCxkruLgKEfjgf5NM4I52/7sH505LIxocd7wT7QR9U2j0EunjoAxBs2p6ZdQqgNTIP6bselGURzvQWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789912418; c=relaxed/simple;
	bh=uW+z/E+3Nf0l9eOVLYAYFxYc51vyvoT/poRq9xAMQqg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D5dukFG4aa3fyuHw1DVh7H4yaptS+vQ2akB2iPk2EreQVQEN81Z0SBsOfsR25Fg9Fqw+FPfIIWQSawA9PAJT9qYDlTV8N+iS+LxgQ/oPLwr4OrlvFcvKPyoVOTadIirdNBLIOr6rM9AUJcYuwhwlb94ETxXrXUPhocfycIWKJcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CeGFIzxs; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CeGFIzxs"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8686f46e4adso1861577b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 06:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789912414; x=1790517214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ra+b4sm+WuJgb9+5+fBPfFdOVsdxf2Vh8VhRH35l2S0=;
        b=CeGFIzxsO3CIF+ifCad/axI2H/Kpr25RewsuAbgEIOTwNPO9vHdfTq/riNKqXlP4+9
         tOQmAxg2YB5nbElXEf9+w7QJ+Iptfh8gJJjCnVL5c7tK9waOhXkmDyZKYILSNxc/C+Zm
         0NSiBdPNVEQDYWgYEeAUgVOTx/8TOKrvBAgc5aWtUK7w2tvKlxOWyptPleino33qF+f/
         NJQ6llMtjXlykdsRpLSbGMa9VMcdoazUPlyVCnyBIjnGicyx6jwv62BKEf51HUpqXvlD
         eOS6j2XxyKnvFHAesj11mzSaOLx6i0MiSL7zuE5kF+NFKqyMseboC6IhKlmj1jl3zqCy
         eHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789912414; x=1790517214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ra+b4sm+WuJgb9+5+fBPfFdOVsdxf2Vh8VhRH35l2S0=;
        b=1DOTF6fFv5HF68dfFom/Q5UvIQ7HEidR2E3Oqos8A/c3DWcORiDDwdZsypWpr1QGxx
         /2/yDwlV9lkNFNIVyAIM9aH9zPQtcGghNdpJ2CHyouxpfQJ+0HtwB50r++nSQOfctUpv
         vaMmVHj86QtVzmbcmIYpqAzVDXJtOjUXhTvBRM0tXehzz4/u9JOPn2RXVVfyRlKN5nTS
         k1BMb0MKmCCuK00yp5bHXlFCJSemqAqj2o9x+JaoAYW4OMCTKiGTVHCP/TTjg98lZbpk
         nKq443QEjCKxiGeGe3FlBLwjfrIAYGYH8yI+ffFPf+oS+zNXufyM+ixE5h/L3NvPDWh0
         ThHw==
X-Forwarded-Encrypted: i=1; AKwUvBx3TuPnlHDEQ0OaOOTFdDGCRw7h7YdgcODH0MEXPgxlK4VGwL21KdSe4nEfsmXhoVXHKQspUZY5b1RrBhc=@vger.kernel.org
X-Gm-Message-State: AFuF++k04iZ4kWOQyz2BDp/XT8B9hgRJz5VHslummATYr5AbXl2lMEH2
	Dvq+iyKGIqcy+xAyVkh6B7l3FQQorU83KLTv0qbBR3hdzaGjQTKwK96d
X-Gm-Gg: AYBFou0rVRvnT4DBEAA/z1QTFWH4Iudx9yF6EznydPRvvXv29jRvHkBFcfeCLwjR0HF
	dwaU/K3McufW08ync2wav+70Y4bVIXfjTxP1en7nn3VVF+3SVIb/5sDpYongq4Isml3kMI+RznO
	n4ij9doS3+Nz5nTvX/laiJKzgYwHN3EULE7jrloaLOrJ7a5Vq2WSEaBLWGjOPnzce3DJSqvnupn
	YV5tyitpmD0UH5Htm4Rt32sNdlRqKJSHyNf+K3SQ6Dbovsh14cyQ3cR8Vaezx7zezz/W8xd4eap
	6q/Ggn3Wn1AIH6od5s6YWAVCpEGSDtSXuACy1vjwW1IkcMl0v858EnPDTk8mUGmnyXmkjXQgSLq
	7H/+GQpoSAY5wGIpZ5CNgvzXPLI1KjN3FiC68X0z9CzfypxeDDW+Lu7Ouzs8zysW6WVjZrrwVLB
	xN64lfheOscFdTMmSi4EoDHcMfsJjH/FFiHayQ09tvfKVzLEqdlQuGWhX7bU3VuaFMsPt5llXyd
	MPSzR7EwD/akDVjONNKL3QVA8MEen88HvK1jir2r3qe0PxAPXkQ/evDxjxgkccT7C8UAavfk9sJ
	VfSpZTuvY/g=
X-Received: by 2002:a05:6a00:856:b0:878:34d7:6a2a with SMTP id d2e1a72fcca58-87834d76ec7mr4506194b3a.44.1789912413762;
        Sun, 20 Sep 2026 06:53:33 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa4fd913sm2034729b3a.55.2026.09.20.06.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 06:53:33 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] ASoC: wm8903: Move the DRC QR threshold to the register that holds it
Date: Sun, 20 Sep 2026 22:53:27 +0900
Message-ID: <20260920135327.3628704-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DRC_THRESH_QR field is bits 7 and 6 of DRC_1, but the control sits on
DRC_0. Its shift and max are right for the field, only the register is
wrong.

Those bits of DRC_0 belong to DRC_STARTUP_GAIN, which "DRC Startup
Volume" claims as bits 10 to 6. So the two controls share bits 7 and 6.
Writing either one moves the other, and the quick release threshold is
never reached at all.

The six fields of DRC_1 tile it exactly, so there is nowhere else the
threshold could live. Point the control at DRC_1.

Found by a sweep for two controls claiming the same bits of one
register. No board with this codec was to hand, the register map is
the driver's own wm8903.h.

Fixes: f1c0a02f32f8 ("ALSA: ASoC: Add WM8903 CODEC driver")
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
Assisted-by: Claude:claude-opus-5
---
 sound/soc/codecs/wm8903.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 156e1e24a388..fbf388cf966d 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -676,7 +676,7 @@ SOC_ENUM("DRC Decay Rate", drc_decay),
 SOC_ENUM("DRC FF Delay", drc_ff_delay),
 SOC_SINGLE("DRC Anticlip Switch", WM8903_DRC_0, 1, 1, 0),
 SOC_SINGLE("DRC QR Switch", WM8903_DRC_0, 2, 1, 0),
-SOC_SINGLE_TLV("DRC QR Threshold Volume", WM8903_DRC_0, 6, 3, 0, drc_tlv_max),
+SOC_SINGLE_TLV("DRC QR Threshold Volume", WM8903_DRC_1, 6, 3, 0, drc_tlv_max),
 SOC_ENUM("DRC QR Decay Rate", drc_qr_decay),
 SOC_SINGLE("DRC Smoothing Switch", WM8903_DRC_0, 3, 1, 0),
 SOC_SINGLE("DRC Smoothing Hysteresis Switch", WM8903_DRC_0, 0, 1, 0),
-- 
2.43.0

