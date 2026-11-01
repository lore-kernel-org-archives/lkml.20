Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793520578;
	b=nuQFAhKK0P00YKF25K/s1zef7mXdRitMluVvP3XyS+Jq0/pcZvzB7Z/HgqywxJ2t8RO9
	 zg+zJ0Ocfq+cuDBCScxoa/5CNuy2Lq1hDuQxfkOioYM21GyniXX4w64+f7L9qs4sQlyMC
	 xF3V2h9PZdAxG2yzNo5hqSaEAjSIhMEQxcSlXtqDUNUMTLTem8RkU1+aJMQoynW4PcvtC
	 QtSYDdFEHbOHnwaO9I/h7TqVepy14V2LwZjIfEyUX372gnVaDdHxj6DpRJOE46cIY7YVN
	 NIJ2/MRh+vZw/hT9fotHMPShZiA2wZGC4pme5MgmSsKfAO6qgDexcDBKgAo61DHm+vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793520578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U40/ZwQIGB99gEwVGvIAqyV6gYrXisGSQoDqHe7yhd0=;
	b=g0gr02Xzz8xKEXgL4hk5ruNVOfDpgz+vCzf/FllLQ/XrAgJc1uLU9C6tNeVs8OSAAPUx
	 kVACcyx2HkQjutAsf4k3+0B+wJIAIIIxvHi8gR1VsaZ/gNkPhGXxVm/MHfyZGXSkzmu8P
	 WtqBG7ur+jeYNK811CO+/5bMg6BKWrFecKKy2bSHDERyC6a1zkTDnZ/9IXW1PR3iGdT8T
	 7Rrw2SY3h9QyUEJc4KI/HBHssw8Kpm2ka4mPnJzl5jmkREBx17HkQuT5F3qAxSA72GEBo
	 J0DeoTasMRVGEdqwPZ9/KAJyngTRxvBpQoz8mbWyWaHiJiZEawLd/i1NR89PS6kkBag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rP23xyf0;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96295606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 08:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96295606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rP23xyf0
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-353804b591eso3516269eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 01:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793520576; x=1794125376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U40/ZwQIGB99gEwVGvIAqyV6gYrXisGSQoDqHe7yhd0=;
        b=rP23xyf0arPyjxxhA0OpvCazKXpj/6elzvriPCYljf4aeeqTiu/VmGC/6e8LMJlm3S
         APmcQqI8eYuDlAR+lHMGiPG63ZirJ7KoXkMTBmDmRBQjXr4lkA0bYN4CylbyAyr8cMug
         oH6t98/g3WUnMwiNYGa86xW6+7syOqhkXv4/LxKfuMqyayWy8Nj6i23YmbavCB6N/VMO
         Kuc+ZOLXdcWNCE5/zPyN3C65/jH4rQ9lZJyWeTsPzIKZawXZpfuZmKZVFQ4jJwqc8XOt
         ZUS3NCuGknSCXUH3YQ+E+NZOvH+ttJXYoSFAdJqIDmqNl+FSPekxUKEIEg+hIci3lRhy
         xMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793520576; x=1794125376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U40/ZwQIGB99gEwVGvIAqyV6gYrXisGSQoDqHe7yhd0=;
        b=Ix+nHIvNE2wOuKjoQxvtDzsVLWnZw0w1G+kV1j2wvJqiIqVlMKAuv34dLC5axzypOr
         4fwSTVSDro2U0D7n0+MlL6YkN0m+1+s3QRg3hRKRlCqpjeIYYQwAXCNbb8cPmXDrlqB5
         WJspteMiuC3mxFpKY1HhZGTZ1rzl5PHlmbTLT1sYp8w5aLlLjRGPe3uTKsU+BE8mhG9j
         hGpKqW0yUW3Zuu/DP7IcyT8FfMiW1e3y1YJAKrTvaj1PMxnLtOt/IcibmAbejnp4zDS0
         g4erhxNxqAd1+LIzygHkmviLUdEuDml4Ohv8kUlWfs0BcQVKNd8fiddkCF+6/NOSuEIe
         qqWw==
X-Forwarded-Encrypted: i=1; AKwUvBxGpVQcYJW3uByhmRm4mK4/tpA+RMUh1e3HbAxiOmXEpHAcoO/NjKUMELdoPHsyDvHDMepGDPeX2J59D3g=@vger.kernel.org
X-Gm-Message-State: APuU4Z//00rYY0suhC4rSGViN6rkiVWweeRdA98DArcAgCog1JFdZeMg
	nzlpPzX9gE1QA/ZdY6DLmk7WjiJW1mJ0aBvuM/W7wfb2TKoUyXzbtQNk
X-Gm-Gg: AYBFou0D7DkiD59TJun2kjA7+1NNKV1S21hbgjLiG28l/j5DAIcwkvzWBVgQ/cz7LoL
	X2em4lvUXJFpA7FOVo3Ur1O2MhYvYzFDDl2bz3rdVthMPuaRFZjggVjJ56YuSEzPImNFxYq45w2
	bBuyZSErJrIX9X/lK2AZj0g1svcMio+erxpEvfwdJXIAMut4NnoEfl48ydI0ySBSPJXS4ioxbu1
	tUH4Eq6s5D3O5Z/7xCvl3pSpsOZ/MzRaO5c+aoeiPBMflNLXve2jM4MqNGj2V1jG33v35cCN9jh
	xsRHU11U87HlWBFLX1h000kDU6wjaDJHU94woF9aO8Q7yTOq7kkLnIxvg2va281uamnz7XlmHeU
	SnxloM096GvrHEuLSopSttJT9XypMra0vby1a9iUoVB3Ozg641MQcmiOeSfPaTqpyEweoARUWId
	E5WUPWcTSOUx/M3mcppFaNRoZ4wZC387w7bjokqcMm7ZGAGnKobkj/jEh7toNCeHBp7HScESOa+
	q8o07O1YD7MTHQKi0mzmofnEqRVCaW0LUHeMq+cwvz/jEbsE/QsFv/NQuETqntKqgpkCfE4q3zt
	uDJgLB3l9+OMw6OvkIPLfbAVdSOC4Xg0nioMGcoR
X-Received: by 2002:a05:693c:69cf:b0:369:daea:812a with SMTP id 5a478bee46e88-36a423fae73mr9966452eec.30.1793520576167;
        Sun, 01 Nov 2026 01:09:36 -0700 (PDT)
Received: from arch.localdomain ([152.175.67.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm27611719eec.29.2026.11.01.01.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:09:35 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jerrysteve1101@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v3 0/2] ASoC: codecs: Add Everest ES7202 support
Date: Sun,  1 Nov 2026 16:09:24 +0800
Message-ID: <20261101080926.267041-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This series adds support for the Everest ES7202, a 2-channel PDM
analog-to-digital converter controlled over I2C.  Patch 1 adds the DT
bindings and patch 2 the ASoC codec driver.

The driver is based on the Rockchip BSP driver, reworked for mainline to
use regmap and devm_ helpers, probe the device ID, and report the actual
per-step PGA gain.

Changes in v3:
- Add SND_SOC_ES7202 to SND_SOC_ALL_CODECS, convert the copyright block
  to C++ comments and drop two unneeded includes.
- Turn the volatile check into a switch: the ID registers are now cached
  after the first read and marked read-only via writeable_reg, so a
  regcache sync never writes them back; ES7202_RESET stays volatile.
- Set use_single_read/use_single_write so a regcache sync cannot become a
  multi-register write.
- Use devm_regulator_get() instead of devm_regulator_get_optional().

Changes in v2:
- Drop the hard-coded 30.75 dB PGA gain from the power-up sequence; the
  PGA keeps its power-on default and the capture volume controls apply
  the requested gain.
- Keep the PDM outputs muted until a capture stream starts, instead of
  unmuting at the end of the init sequence.
- Re-run the power-up sequence on resume before syncing the regmap cache.
- Handle the regulator_get_voltage() error return as an int.
- Drop the unnecessary of_match_ptr().
- Fix the copyright header.

Link to v2: https://lore.kernel.org/linux-sound/20261021124552.767218-1-jerrysteve1101@gmail.com
Link to v1: https://lore.kernel.org/linux-sound/20261020143135.623897-1-jerrysteve1101@gmail.com

Jun Yan (2):
  dt-bindings: sound: add Everest ES7202
  ASoC: codecs: add support for Everest ES7202 PDM ADC

 .../bindings/sound/everest,es7202.yaml        |  56 +++
 sound/soc/codecs/Kconfig                      |  11 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/es7202.c                     | 373 ++++++++++++++++++
 sound/soc/codecs/es7202.h                     | 131 ++++++
 5 files changed, 573 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es7202.yaml
 create mode 100644 sound/soc/codecs/es7202.c
 create mode 100644 sound/soc/codecs/es7202.h

-- 
2.56.0

