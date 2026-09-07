Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC5C44C65C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782618; cv=none; b=Y1QM+H68iUSUUPA7cwgXuCKgXxd8Av9UWJF5a77iyxZIosjSdPhR9uEtuLAMW3yoLm9A7fiImDdU5vPxgdRA4D8/TRPDa6PYVUR48JJtMeBqlNbcLFYqVbEMFWiIXEsg26U3X8DurJv4dq+ZbIYyxpuXtfpxFCZwKOPyxfPMVkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782618; c=relaxed/simple;
	bh=MOQwV5fgdf+8j7ZOVMqEoztvTTu2JKxSmB9ceKguCDU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XZcvvnqn4bGUfByJaU8PuenOFtJRgw+0VvP9N/uqVOieAHQvTHz2aXIvk9L6U/bfQYadzrPJGgdnpWlRQsFaPUeMq57E44MHotvGSkcOf1fY13NJnac37h+cRmYx4tw/1rg8MzwMPTtxLE9PEwFkzW5drzG+92Fg2uxF6xJuh6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1DqIKab; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1DqIKab"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d944747d41so36491335ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782617; x=1789387417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1DjLmqmU48ErFE5Dn+s01Gf2tFCVAmNdh86WaQ5BH/U=;
        b=J1DqIKabLDbxFZlfF7jOfXzX3Wz9CFcXOuhzQIqoNuCOgGyYIRkfcCOS8s8M3771Xu
         SbMlJBDnkkWdXmgOpUjSMgwpS2CFyx3mDDBTovs+mWvvyNGjoMeov8oWh9GpktKLfndf
         xEpCBmZKAJ5jNL2vsRMTfpoLJ9jKalS8xWCLa/T0/e8JbEzWDg+9wIaAWWADW5T0soH3
         JPVACLKrjpF5UygeHnPIXufmLeYUKrsAVG/lde80LuKXlbT8g3NDVuSyDwtrd1m6PsWc
         zogQJbO9i0zsGMomVK9gWqnd7IzsvL4kyaPudpvmG9CZTZrmJfVkW0xX2MDDgQZdDp+L
         av8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782617; x=1789387417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DjLmqmU48ErFE5Dn+s01Gf2tFCVAmNdh86WaQ5BH/U=;
        b=OlD1mD70aBKr/NZYN0FMEI1YBTmkQTHAdfU3G+8zpPXFoP9v8WPYqf2qOEIGFRw6of
         nFenUuKKa5Gvdean8SkOSsbKySiwyyUVn31Wp3utYAMadA+SDQyv9ZN5vo5KpQcb1aY7
         FUc9C95fu9oJDnNkk7d09R0WR5Pfovtch/MuFPsU6n+oNsQVnNSAEv8WShO2uDIE++kY
         5Xoc9FQ1vLqXrfPY57Mf5VXm+tGp0c96nZwr1jz14x3oZdLfBvrla8UNmskj0dIUMnXz
         KgGFXcyIp/oVZKSVnNYuF7l2Ba+A+sRPy/KeL9Kv/dDH4netAfnPjdvXoY7dil80OBUG
         P1gw==
X-Forwarded-Encrypted: i=1; AKwUvByxjNd+7+gpDKjcRkU13C0OJaNOR0oteYDrhBRa46HDYiTG+eTIWy3XAhypSQaEo+Sx5ePM+gz66Km06ik=@vger.kernel.org
X-Gm-Message-State: AFuF++mVKZpHswrDpvvILPcuuecctqC7Ag10D5Qjh3o++F6rYSEvZ1Gb
	5+CE72ugFAgyuPSU6n4bCy0n9oCyV4E2PWLVgPxME7AuZmvygn4tY2ih
X-Gm-Gg: AYBFou3WulGttMme4HksFJrmGdBghqUtqGIfZoATF4ydEVGjWO6oBJs/aChE4P3MzCX
	hiE6RNhXBy+/pHMB5nt+FvPoCGJFP9brEPGjYp0XOQCLArk/0piXJFBnRb9l9j6WBBcjJh/SKLI
	0IEkz/Nyn4emKAdbTbVba7HecQ93GYgYfd/MOK7DVFqM1jhx3o6AWLbjKmq7U1FU3lPrhD7eRig
	3SNhV/GJSVfblVlweRSHqPhMIgBD0hanYEglEtpGpWC2z66X8bLlNWuHb4PInrJyWXfdhD/oTDy
	cvbFkiab4kFWOBQ/qTfto9RQQwSMR3+Hzg47zQR3XXDIiRVC5zEsH77xNnKtWzcHq6wkgppXtpU
	PMLcfq05Q+wi14lrXnhLZ1s7+KbkvIBKX45U/fLcDfLgqWZQ3wRTbl0pMl1GyJxn17PXD8HNUdO
	6eo2o9FRkk/2Y4Bb8jHsJ0cz8MqdDsUhY06AkmIqmi5i2V2oMP65vYvNsn75TgN1EUWU3zeZmIK
	35RIt40hueh959EVqbYLMuABTadw8uYuXIHuRMr+dduY6Bpwx+uVyA3m1Av5H5fvtjpBv1okUaF
	qYE6
X-Received: by 2002:a17:903:19d0:b0:2d9:2688:8be6 with SMTP id d9443c01a7336-2db126346b3mr282743715ad.19.1788782616991;
        Mon, 07 Sep 2026 05:03:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm43064815ad.82.2026.09.07.05.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:03:36 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kees Cook <kees@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/7] ASoC: mediatek: mt8188: Improve error handling
Date: Mon,  7 Sep 2026 19:03:03 +0700
Message-ID: <20260907120310.135693-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series improves error handling in several parts of the MT8188 AFE
driver.
Propagate errors from clock, regmap, and runtime resume operations,
remove redundant probe error messages, and fix clock cleanup on
registration failure.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (7):
  ASoC: mediatek: mt8188: mt8188-afe-clk: Propagate clock initialization
    errors
  ASoC: mediatek: mt8188: mt8188-afe-clk: Handle tuner clock enable
    errors
  ASoC: mediatek: mt8188: mt8188-afe-clk: Propagate regmap update errors
  ASoC: mediatek: mt8188: mt8188-afe-clk: Handle clock enable errors
  ASoC: mediatek: mt8188: mt8188-afe-pcm: Handle runtime resume errors
  ASoC: mediatek: mt8188: mt8188-afe-pcm: Drop redundant probe error
    messages
  ASoC: mediatek: mt8188: fix clk leak on error in audsys_clk_register

 sound/soc/mediatek/mt8188/mt8188-afe-clk.c    | 115 +++++++++++++-----
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c    |  34 ++++--
 sound/soc/mediatek/mt8188/mt8188-audsys-clk.c |  12 +-
 3 files changed, 113 insertions(+), 48 deletions(-)

-- 
2.43.0

