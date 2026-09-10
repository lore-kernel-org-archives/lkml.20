Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37BC3F413E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045082; cv=none; b=QQwM/dDCEg5dwqVVMK+18PKWfgoevvqVFrjcAwoah9NbwaGFO/7DJzxK+y8ZT+1VIWqk9x/ee9YwBUSfBlJmTOXfh4RwMhJ7b+8Tz0ZKYeGRiRJRTsxbEjG2btHP6mlBgrWMFg8pXT/Q4P+//ZlkDtlfRNVVl1IQcHR1jcvSn+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045082; c=relaxed/simple;
	bh=QU6aWdGrPrs9sm29TPY3TTfbdgnUIvDUFW283zBRxI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QMTwA7iYviOHoIBmel3zA/I0qDJI9w805xFpmFgcLqD2egT4TbiKzBjqONUMdMlceHlI5UDvpNCLpKMo0RC25JDLSXce1sKN/pV+fx4A4IsF68C/Ih1wKsZ+N0ZyRxigsLrZEl56TJH7PzjZ5HYEcdRhonO7pP3EDErgpTFFFxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpo4a6xu; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpo4a6xu"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb752so2236495a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045080; x=1789649880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4NZ9nNqE+pb8sFgTxYUMCE97tLV2sG+CG+J95kQTKcM=;
        b=jpo4a6xuGRjX/OPY1hPWy5SI9OoPFfJFzUufWecuNV/9Z5uZC75ns6mf+zAxL3EBVv
         78paC6OjCZu9pqOhRf8JWSMJCEPfnSOBWXFzANblQypKveJStKoolrpcMEBusvg93aqH
         iFbLlRv9da5SWck0UnasmG+DkWYGom1Dv1DTxvYfJtnkswDiyCrGU9wPROEfQct/y8mw
         uBIfy3czjn0yXEUzzF2UOxAjJeRcHJMOTGHfXt5r5Ye9rvUvWT1+JcJQvrH9RxC3/Hh0
         KtuVSYTXaSlMT8kuFnEeYoAyqJAsL+nWmBqm0Pmiy0kRgusXcT48A7eWL1OnyN1AgRQa
         PpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045080; x=1789649880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4NZ9nNqE+pb8sFgTxYUMCE97tLV2sG+CG+J95kQTKcM=;
        b=HxH4pkVzFc7cA7g4ZQFmRrFOPSZoP4wWcD8tHcQlur8vHq3aW63Z5DgOF94ApqeihX
         76atSUIIl/oTVIhdCPdZ1/GDSq8DxSTtBJL6H+hgZqownRymOPrV1QnF5wQjDWkEoH07
         oQKiZ8WLWbu1IsKBnVtZVJGUmj2q5MVpAQfJyPyF/E/JLPusCu/L/+GqogbSFXYvgGyB
         0vm2/qox3igwmryYVhgbh8gDuzYLOIt9XabUJ+r0K42ffuvr8mLi3kQWYceOKkrQtYQ9
         q7uyqpoB5nDqwHyOP2LQxr0Dk1YAf9b0qeExwddJkMXTqAY/ZmKYt7rgZXrLRpEwrYny
         NKow==
X-Forwarded-Encrypted: i=1; AKwUvByptezBaZAQRii8oyOlVY/mwkN1qACbC+4x368XgbMmIT5uSY7GsglhyjuAUdgFFxp9oUyYiXF8pZ+Ddic=@vger.kernel.org
X-Gm-Message-State: AFuF++k5ojLtkfC1aIGWcWJkN0YQDS/NzWDPYvd/FQI36zDc7Pcg63LM
	ZOuz+zmN6Bg4N/CC4DIXCVoWnMbmJ+LkqO/kuychzVhwxm4uJTOqftx8
X-Gm-Gg: AYBFou0nsx7JnefC7ok4g1QBY6jfpZKlE/E+DfVv8dzAxHu2PlCb/U+7paEhtEylK3x
	FbIhR542U4uslS/7vp6LWMpnQaHc8GvT80rx38xezX7FqqEkbe7R51+hV6O89/QZi+NphkNhoak
	/wm3spWJXIBbqrc88yYbrVLSIj1SbmrS79LzMMxB+EfoROpPklJWbCHhBZgMuFAQn0PWrs9WSs+
	kUdcdEoI5wV+tCRnQW2+kesmCW87XYA14FTm8IvNvsz5KiddCFowyLjnv+kJ/JTC4W37yc9dF0G
	5V30vIQp2Uu08mTRsJSxgfx/RpnyGszJ6sjGhT3J2qKse3/jj20pjYPQsqgK2hJfucNsGSFzBBY
	LLWsqZmoyH/0Uj9byjxcYQ56Ss+oh12+hTidjrCy7zWlpegaJ7a0VY8IP47yhMbjMgwRGj1AmUr
	u7XD86eWQqSWhrDDkxQnXS2nnMpaeKVvNz9SWHzVBrgtZiO7lqiNCuUNJrMORA1OjUKIWDjyM0N
	VL56I3x4P6Ma8EmEdFlmgk2DOo7SaZMBsGqu0ob4LUof0rKXr88aSmofyaq9+2Ih58vvQONmx1n
	IuO+UsZGwps7hbU=
X-Received: by 2002:a17:90b:1d45:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-39bac1d89b4mr18062671a91.9.1789045080229;
        Thu, 10 Sep 2026 05:58:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:57:59 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 00/13] ASoC: mediatek: mt8189: Improve error handling
Date: Thu, 10 Sep 2026 19:57:29 +0700
Message-ID: <20260910125742.150902-1-phucduc.bui@gmail.com>
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

This series addresses part of the error handling in the MT8189 AFE driver.

It propagates errors from clock operations and runtime resume, validates
clock parameters, and removes redundant error messages.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (13):
  ASoC: mediatek: mt8189: Return error for missing regmap
  ASoC: mediatek: mt8189: Propagate APLL enable errors
  ASoC: mediatek: mt8189: Propagate MCK enable errors
  ASoC: mediatek: mt8189: Validate MCK ID
  ASoC: mediatek: mt8189: Propagate reg_rw clock errors
  ASoC: mediatek: mt8189: Use dev_err_probe() for clock errors
  ASoC: mediatek: mt8189: Propagate runtime resume errors
  ASoC: mediatek: mt8189: Remove redundant error message
  ASoC: mediatek: mt8189: Propagate APLL errors
  ASoC: mediatek: mt8189: Propagate MCLK errors
  ASoC: mediatek: mt8189: Validate sysclk frequency
  ASoC: mediatek: mt8189: Propagate TDM clock errors
  ASoC: mediatek: mt8189: Validate TDM MCLK frequency

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 136 +++++++++++++++------
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c |  49 +++++---
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c |  17 ++-
 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c |  17 ++-
 4 files changed, 155 insertions(+), 64 deletions(-)

-- 
2.43.0

