Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A2D64AA4
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908559; cv=none; b=QGRxVpJcEitZ2jmh0hYULfBk4FHXzJ4gKt8iKkq/oouDVmZ6ojmc2THkLuwVMBIAxGvMmvw8PCHlYm90z8FMDiQL9cBhL6oLh46SW7zynVAvCJPlnSbzrEm5gb3refDNqzu8GaXpF0ynNAsqets9gVnK/2rYSWTO/zDG4QPSEZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908559; c=relaxed/simple;
	bh=wQzBOC/Hf/ei5wMX4dQCdaP/CAlEzxlG0QrNSkvCxEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L3ubeRldbYwszCq5iA5Zu7CkoS6izz2IylyCKHxFGt8Bf+V3eeA3muMd2GUNEbMFr43iyGRO17IDahX1GcU8kC7ULvWPM0SSurP0+RaD9G6DZrn9rwP97e7a3V3e0/RtzGV+yP0CqFt+JmiZO5tjCNh80mdb5uVDKTKDSiMaZug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RtcPk5lJ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtcPk5lJ"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-85339ed040aso809164b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787908557; x=1788513357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oK69mOzh/nTQyD5btplCU6IorcHxRfVNJ/HUqVvgcgs=;
        b=RtcPk5lJuf0lqaFSxYruYpMljc264DGJyk6AQNmzTnri4lW1bdkUS2MP+dfyUsM4hs
         rwGaTWDmSXXrhn2ydLh/gY8t+aWhmGJEiqZnT41LaGIyX2cJ2n3zPtfNRmKRYTDqSxX+
         wP6Gz00BSL/7Ib6++6T9LhTgSnHxJtal6bMo7tWU0Oi3Byn5x+2lYeUpGUm1VoC/rfXI
         cFH14e+xaT4mRgj/ghNyqdgKwpJZT8lF8TxKZkTwhPaSKuhuwLL9Yur0JjL8IZECcihZ
         17LoOBAggUFum+aUIqIcCqaXJlOKT2x0y1m7fm0iRfsxxuGmcGWDLbeAitsoGO9WUTb9
         9egg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908557; x=1788513357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oK69mOzh/nTQyD5btplCU6IorcHxRfVNJ/HUqVvgcgs=;
        b=a2TaWt4X1yAQTcDrFokK/Vc5iInFvlIaPw5F+SKvy1LyWYGGgs8SdSLEopByaWD4Xx
         VITXucDZr48x91IOiggFRWlmfthkv425QfUN3RtwjpdkW3E9UUDFpr1IBhX6FjDssBuD
         NT0HKf8+1hAE8rex4EwlmaK01/wRshN8QkFPuosqH06uAeL2jxh3nFjc0VVysoK2TOmd
         gL6jLdm4Kqz07TNbc2558Av5u5U0XM5EH9iYtFC81I22r+TJN4iTYacJYeVo4hnRf14x
         5RrvEqViyFcKtA15rJOTmnjIKhnRdAHEwHoLh7PLEx/2gFybLJ+FeCtfd9f9c6jZycnb
         f6iQ==
X-Forwarded-Encrypted: i=1; AHgh+RoliUELETx/C/dpqT9yLHk1tr0HiG377jIt+2Q+a0KgO78ABNHyiw1GXidLlYoecVhBW/usTbz/eNXJvkg=@vger.kernel.org
X-Gm-Message-State: AFuF++nWhvkIGREDeAeC8WMWEq4iXdVQPh15NC9Dqsqm0nMn2ri8dXLL
	5UitmG6ojuYxouohOzj5Mht5MKxL53q8yS7GrV6xI767vxtw/Ad7q0Nq
X-Gm-Gg: AR+sD11fE3YER0Qy4JTz8LndJpnuYT7ow80THsn8zKogpgNSpZ/7pZuLYSttDRRZE4B
	wx+pkgiOQtUfDTgk0jE7lN0hVFo3m8Xu6Xjrlj3L83k3y5hOZiT01jwuiWLlLlW/TEAogZegJFL
	WSuoHkGuKXEk59S82UJRBMAHJTj5As1z++qcfEdNCzEJY4VvkwVeKz0/TpDQWLAoJc9c0ET1FnZ
	/Hj1tbsg/3N5s+18YE2AJffFJBawqm2nWQV35hjIQVHKlX0UPAez766FCMgXPVcoLshfOYEhFr6
	WPhN+mVp22oMNrmqRHsbaPqo9VVeDZZIZLqaIK7zUgQCGOxYyGTY4RSp7t3MvBeYrIh8eFuP4Lp
	6Ly3hwjgdJAxiae2PpfetdFLfkijI/GkMG+3R86VNcoerwylorEf7rSPj/aVAXjeRJGZ6WSXdua
	yjlSw/ImhV9sFNi4RKpbhs8ij8MtDTnTGidVbVR94qXGjgokd2P1dCQTNd6U5gN39M3GlnhOBPq
	NbPJfONv1Nj6cWbA4S/wXl8a+9tu3ToYya0BflH/trBMlBVRIO4mo6uJfmvegoLw85nZntmd6MI
	ss+0
X-Received: by 2002:a05:6a00:1da4:b0:847:973b:3cf6 with SMTP id d2e1a72fcca58-85625541a6emr12204502b3a.0.1787908556977;
        Fri, 28 Aug 2026 02:15:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm381248b3a.24.2026.08.28.02.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:15:55 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 0/8] ASoC: mediatek: mt8186: Fix clock error handling
Date: Fri, 28 Aug 2026 16:15:24 +0700
Message-ID: <20260828091532.600047-1-phucduc.bui@gmail.com>
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

This series fixes several error handling issues in the mt8186 ASoC driver.

The patches mainly address failures during APLL/mux, clock, MCK, GPIO,
and regcache operations. In particular, they make sure that partial
failures are handled correctly and that resources are left in a
consistent state.

The series also removes redundant probe error messages where the errors
are already reported by the called functions.

The changes were found by manual code inspection and compile-tested only.

Link v1 : 
https://lore.kernel.org/all/20260820111253.97866-1-phucduc.bui@gmail.com/

link v2: 
https://lore.kernel.org/all/20260821123021.41390-1-phucduc.bui@gmail.com/

Changes in v2:
 - Update the cover letter.
 - Drop patch 5 from v1.
 - Add Fixes tags.
Changes in v3:
 - Add a patch to fix clock handling in the mux disable path
 - Return directly from apllx_mux_setting() instead of using a goto label
 - Add GPIO rollback handling for partial failures in ADDA DL/UL.
 - Add Handle failures from regcache_sync().
 - Add a patch to remove redundant error messages from the probe path.
 - Update the cover letter.

Best regards,
Phuc


bui duc phuc (8):
  ASoC: mediatek: mt8186: Fix APLL mux setting error handling
  ASoC: mediatek: mt8186: Fix clock handling in mux disable path
  ASoC: mediatek: mt8186: Fix AFE clock error handling
  ASoC: mediatek: mt8186: Fix APLL enable error handling
  ASoC: mediatek: mt8186: Fix MCK error handling
  ASoC: mediatek: mt8186: Fix gpio rollback on adda dl/ul partial
    failure
  ASoC: mediatek: mt8186: Handle regcache sync failure
  ASoC: mediatek: mt8186: Drop redundant probe error messages

 sound/soc/mediatek/mt8186/mt8186-afe-clk.c  | 163 ++++++++++++--------
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c |   6 +-
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c  |  21 ++-
 3 files changed, 116 insertions(+), 74 deletions(-)

-- 
2.43.0

