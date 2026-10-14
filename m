Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D15F41B8F6
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959578; cv=none; b=XYj9Xr6Iq3ArNvkswIFxkGs9n0EtSun/EJ/SqJG7BOMuCtc+ciUZMzDQRJz4WWwZyUnlLoq/yc8n1XL8vHXiJNtvqcyyRmpZNaDtoLTxu8mVkDrzXcYr9qGWaFnOtufgPPvGyjhQmfR+0OoXUGdsQas65wlRr7dMzA3UxQZF8Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959578; c=relaxed/simple;
	bh=vEN/UMx1zrNjObbZCoyXanSLOqnUY3l8miD5NqL+GXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=icq654QK4e2iHZB1hE/1MnQ3nB6w53In4JvmfYDF029TKcyLcZfizPiTPjGFfzt4luuXo2fKaQlVZZby8+knF249sUc2t9Imhr6vzs3hwwTFFl6czoffxFQrTPoPa3Bq5XHoQAFeJV4dy39p5xV3MLVpqf4i2i3NnjrgsV518VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+tG6Ntb; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+tG6Ntb"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac397836fbso1272572a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959569; x=1792564369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trefKx5Yq0uo+Qdmy9TW5HcZPt2sVHZtYHhu/AZ7XXE=;
        b=Z+tG6NtbFv720808LKrj+zmPHf1yEndI7wBv1asTJCpCQSqAZkL8Aj7TTaRNAhGzhC
         ZaDTFGLt7WUrOHo5WCN4izH4Cyy9HX97W9VZ7ECbz2M9EWb0sWvUIfdl8r+PKX4k0PeB
         Y+wR+kEVH4eu8bQMrZyjcTxuPXriwZUdpkSFaOjmwxpcDVFo4/gQmBtOGAufIugpsa6l
         OzoAVwW8AkqzswvtgOE/DrsjbTExktvsGXIsiYRtmaVvHjnezAMG3/hJe4A2n3x+DQHf
         jUjdlUa70i89H9WF/OO3sNHeGZWZG7mPhLv//UwefljHEfT7uUks11xH7fgIw6JHNDBp
         OILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959569; x=1792564369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=trefKx5Yq0uo+Qdmy9TW5HcZPt2sVHZtYHhu/AZ7XXE=;
        b=pVMQxjRajPs+h9oomVNgDXs5XTFaypa4QJhP5us1Wee1qj17JZWTpBmQoQ5Bj+f+T1
         548ESDcIWTd0hJB5JMzh/YRbhZd0miTrP1pf63tdjdKNEIgqj43jKS+9tyk2oA+vb1xA
         jecP6hAMDNYKgEIUE1Y+Vovc3bxH8OTHBC08vo0iAUjElh587n0hALLARUwSVggpddhe
         oQ5PPIPBCPXpRcc1rSS5B/pO5zCSHi3EAhQ481+utjD5xR/cJgold/9qG5PApN3oiExt
         XZqJErekqtFvDYw+FwV9BGVYWUSFF8rkTRZGYAaITj7Qaeek6bwuD4pOQFEmyWz/il+v
         N1bg==
X-Forwarded-Encrypted: i=1; AKwUvBxhtriGE7rz9cHoOdC2WmD2ifY1nk14jc7cpHTbDSWOy8hjtYJsVHc8vw3+Jcod1GUJKLA2kxc3wGX/gPE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJA+nz8f7ae8Owdjum9t3PIHREMPzWyGarXSBfGq4Fqw1jiXrL
	yTCrummLyhz9YmJnRKiH//GfC1u0JDiFJOzEz9FhXi5OJ89RYEjYX8xI
X-Gm-Gg: AYBFou03fZlVxorBEgiXDYtiSS2LOGg02CiRuEPL+fpEaqEhx898D3Bf8QTsBshIyMl
	IwGjy3FaOUWUJCo+cQPhZvZ0+z6uMNVNS1SVAiCk2D1zviD2PHIW8rpQnb/Soza6J7gyc6KuUbH
	dT7JXTG28A+YWeoF2MRKBQfAyPYZMd5H9ssdoWIpC9FZAIR3nnND4rOSLr1UU6fySlyivTI77vS
	8v1Kyy4/1hTFSjfktKu71QLHGSax1vMfwwPrybVHPbGxFXjZoUuuZCb9vKzYt0pMZlqkmOWIH3T
	QKVzHrbLSRRyDhCLaL3YFUxYxSdPb7p2jZ7Q0nfQSRtkC3Yd28zrwWkQLGVUNJK0ivf3VEumPfB
	d8yulEuJbmH6/RSuCLcXKfuoJ6mKWxs9qczgMa2V9XKGyiGNfKqFbDqMZBIWcWV1tBS+sPVt22l
	uh+CFbEMyulR2enoIeC2SK5a7uUum0rfOhlYPHoMxGFCwBF8IxUisuoBiwvlfVz0AMTDgQpUgQG
	CpkZOboOketpia6xEtCQkbApHjaIuZy9hhEYtq0F8UJAhoIXecbhJL1A2SjNIm5aEAo1RVAxrM=
X-Received: by 2002:a17:90b:2d86:b0:3a7:d2b5:2e99 with SMTP id 98e67ed59e1d1-3ab3a60d1eamr11437513a91.20.1791959568855;
        Tue, 13 Oct 2026 23:32:48 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm3384495a91.7.2026.10.13.23.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:32:48 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/13] ASoC: codecs: wm8990: Fix definition of right input PGA controls
Date: Wed, 14 Oct 2026 15:32:28 +0900
Message-ID: <818cf8d7ae81fa46c67cd5b4d01291a63f44c9a1.1791959026.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791959026.git.sammiee5311@gmail.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The right input PGA boost (R12MNBST, R34MNBST) and routing (R12MNB,
R34MNB) bits are in Input Mixer4 (R42), not in Input Mixer3 (R41),
where these controls write the left channel bits.

Fixes: f10485e79882 ("[ALSA] ASoC: Add WM8990 driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/wm8990.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8990.c b/sound/soc/codecs/wm8990.c
index 11dfbbbdcd92..a3843094866b 100644
--- a/sound/soc/codecs/wm8990.c
+++ b/sound/soc/codecs/wm8990.c
@@ -97,8 +97,8 @@ static const struct snd_kcontrol_new wm8990_snd_controls[] = {
 SOC_SINGLE("LIN12 PGA Boost", WM8990_INPUT_MIXER3, WM8990_L12MNBST_BIT, 1, 0),
 SOC_SINGLE("LIN34 PGA Boost", WM8990_INPUT_MIXER3, WM8990_L34MNBST_BIT, 1, 0),
 /* INMIXR */
-SOC_SINGLE("RIN12 PGA Boost", WM8990_INPUT_MIXER3, WM8990_R12MNBST_BIT, 1, 0),
-SOC_SINGLE("RIN34 PGA Boost", WM8990_INPUT_MIXER3, WM8990_R34MNBST_BIT, 1, 0),
+SOC_SINGLE("RIN12 PGA Boost", WM8990_INPUT_MIXER4, WM8990_R12MNBST_BIT, 1, 0),
+SOC_SINGLE("RIN34 PGA Boost", WM8990_INPUT_MIXER4, WM8990_R34MNBST_BIT, 1, 0),
 
 /* LOMIX */
 SOC_SINGLE_TLV("LOMIX LIN3 Bypass Volume", WM8990_OUTPUT_MIXER3,
@@ -377,9 +377,9 @@ SOC_DAPM_SINGLE_TLV("Record Right Volume", WM8990_INPUT_MIXER4,
 	WM8990_RDBVOL_SHIFT, WM8990_RDBVOL_MASK, 0, in_mix_tlv),
 SOC_DAPM_SINGLE_TLV("RIN2 Volume", WM8990_INPUT_MIXER6, WM8990_RI2BVOL_SHIFT,
 	7, 0, in_mix_tlv),
-SOC_DAPM_SINGLE("RINPGA12 Switch", WM8990_INPUT_MIXER3, WM8990_L12MNB_BIT,
+SOC_DAPM_SINGLE("RINPGA12 Switch", WM8990_INPUT_MIXER4, WM8990_R12MNB_BIT,
 	1, 0),
-SOC_DAPM_SINGLE("RINPGA34 Switch", WM8990_INPUT_MIXER3, WM8990_L34MNB_BIT,
+SOC_DAPM_SINGLE("RINPGA34 Switch", WM8990_INPUT_MIXER4, WM8990_R34MNB_BIT,
 	1, 0),
 };
 
-- 
2.43.0

