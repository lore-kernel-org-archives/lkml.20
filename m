Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649004DDB35
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791979342; cv=none; b=trvvIs+EZcG0H5Y/9yltgp4nW8W65DlcviWzZg2oxTpM+jtksm6sZB63K1VuFxVYN2lYxPsrWgiZcHJhkyFHCfb1T2oDWblmV0uc1NINHlLIDLgtOr94+pOAx7Hre5S8hWrXO9wI6NYz2DLeryfvBSC1Jy7DpqyUz7v9eWMTgo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791979342; c=relaxed/simple;
	bh=ew6C9tF0Hto4FCznXsHAlkcnPGFhEf22Z2CTdUK92UA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Obkr2IIDrBJEZ1V5K2jxYQ8oAEDHRSt5mKtvn7FVrlLVMzogbgzLahxJITlDS9yJSq1y2k6enEybOWwxYA19VJAntSPolFseMc1Lew970SvZqzkyhrOE9s5qRGe87BQkjztxGGDWZEB4MSyGLiMZgIQW8DqSeM+llU6gs3MO/W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aixumOY7; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aixumOY7"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1aa29e06bso1325495a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791979338; x=1792584138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hfsJvhoEFG+uWSyTw8uJ33oKmHT7ytqNaOzPZrQir/U=;
        b=aixumOY7nnXWzJbjk4sjmVUDbx7viJW1FlqyrKZVXqJ/UC/+cbbMXPk00KtgKpv21p
         D7KGY/amn1M0XetyKWmo4OQrhdbYJcgn8DRIDb8nllS5xMQyk7Qi+36t9ef+R0UP9fov
         0yDOLY5NdtOdkwTmtsMqBlsz+ZXZtqz+iYGgoJny2vaOyNYV/znibMwde4taW9l1YThq
         B0yTvdTp4c9Mu8/nAym/mWkzDJz4RD4FX477xFeoKq9Lvfvggkxx6RFSmzI4aFvuPpGT
         R+Fr5wRtXAtygc2aVNXRa4HcmN60dlVL+3lBVBfEa7sacVJuQi6kDL2tvM2uyQDKXWHl
         YKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791979338; x=1792584138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hfsJvhoEFG+uWSyTw8uJ33oKmHT7ytqNaOzPZrQir/U=;
        b=QlrSpvC7BqX8YOOrOax1gwATcCp8HIR4wesB71xwH50lcA7FQ04Nd40bRbzXuL97gQ
         ThLDsttT4wrMq5ln6eJvKX9gwQG7zc4tVg7OIyeIDuQsGotOBoSQslLNAl9qNrY0pcpP
         5UohJzruEmlo+IRJcs+meeRljS60GcPxWBX1hi5iKlQPBqCAHe4WRL4wFu8HbArmJsJD
         aCsgnwcpEsoUVP8eVIPutsZlNREQcEqpphJ5wYt2h75vdaXP8jHYNGR/PLDU/XnqxQnL
         yTDIneFRGeYJJ6g1ghP7oL5AqCPDRBcG2DpIfkDHuzJ5oG3gnLUJ49LgRkmtHu983t7G
         YkBw==
X-Forwarded-Encrypted: i=1; AKwUvBz7Cp393fWeRcjI8jYLcYZk5X4MB26nko6lSwyjQkksMhB4N4NvEAZAbvyyiu/3lFjQ3iizqyKf4fCCDZY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL18BHHxqET7RI9Wxt3j2yy5k0doBAdGVsne/VPOmE92HwDq+71
	EWGksd1deRJ3l2e+MKjQvGfn42YUNBgw1TsShZJeEbBQ2j+TYQPbauAm
X-Gm-Gg: AYBFou2hOaT6UkVLSSu1DtrFbbkWVtLJSNhpdybucbPBC/UDsmr40/BXDHDuoH2vzmE
	qcRp8r5aTvebPOLQbuRtOuCihGgMS0txTjEXF0oROPqBfUeD1vu4Y/Fvcy9e+vROhnahwWdAdLK
	GNcONFn9tSdO1NQmldqhERSFcrMTCTM9D037LrkBRLXqeDaZdSCucfumYEe8ccQUMKZcPuXVd1x
	KS6V4hTsoTrPeFp8JHKqhh4AA2r+RE9Q+USJVwl6gAlblf2MRO4NU4c/7RFx7urGgwiSDocySlG
	m1GtXR3VSo5rE/J1M753FZueOEODE96eqHd8tDqbcjslwjWrVQL2XAisf3cAuwyyuy7J22xTm8W
	YPcNNaejdTjpDfDM6hUZDtd8zEQsVke3dmAXCXuvme2vkZN2+0WoKhbKtgX+7YQRitiUVHSg4Sn
	trISTJDP1yDHJfV3Wrft8YtFW6UR9nspeVeLdDgTvL1Z1bAzGK2P0Hw3eK2elXxFwQmZtf2fXqm
	BoVjWW++GwhuEzyiWLoSfTtopLWlg==
X-Received: by 2002:a05:6402:c1d9:b0:6b1:b9da:2047 with SMTP id 4fb4d7f45d1cf-6b1b9da412bmr5434409a12.16.1791979337314;
        Wed, 14 Oct 2026 05:02:17 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm10937057f8f.36.2026.10.14.05.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:02:16 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] ASoC: tegra: Support WM8994 by machine driver
Date: Wed, 14 Oct 2026 15:01:46 +0300
Message-ID: <20261014120148.126160-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Wolfson Microelectronics WM8994 codec support to the Tegra ASoC
machine driver. The WM8994 codec is found on devices like LG Optimus 2X
(P990/star) and Samsung Captivate Glide (SGH-i927).

---
Changes in v2:
- added missing dapm widgets
- added owner into snd_soc_tegra_wm8994
- fix jack detection disable and place it behind check
- change copyright comment style to C++
---

Svyatoslav Ryhel (2):
  ASoC: dt-bindings: nvidia,tegra-audio: Document WM8994 CODEC
  ASoC: tegra: Support WM8994 by machine driver

 .../sound/nvidia,tegra-audio-wm8994.yaml      | 110 +++++++++++
 sound/soc/tegra/Kconfig                       |  10 +
 sound/soc/tegra/Makefile                      |   2 +
 sound/soc/tegra/tegra_asoc_machine.c          |   2 +
 sound/soc/tegra/tegra_wm8994.c                | 175 ++++++++++++++++++
 5 files changed, 299 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8994.yaml
 create mode 100644 sound/soc/tegra/tegra_wm8994.c

-- 
2.53.0

