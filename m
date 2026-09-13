Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D593515F2
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789330389; cv=none; b=vGOc6RwHGlPxtkqXbq5rrnOG6bs5GLLw+g9h/oIoL5jwiuQfjhuO1qPCfco9yyZuf63S+ffYpaBM4OmMQbCrjjzYn5UrEs02m+7y8PLXvNVS5D1bBVRbgvyOvCS89T575nBUv4siaOebdLyKldT1D+X6GdMb0xF1yeghYvze3Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789330389; c=relaxed/simple;
	bh=66DBom4GWgzbDmmXuUcW80JqN4f1r6Gxo+iR92PcWzw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jKcjS1msPsyWtis4vyiW2ma0MS4kWmWyW7QKNreQN43qmn9zn2vNfDSDjf5C4hfAEzpMzmzl6O/MP4/VGlhJqLyj2nQdOgQ3zsHmhZLyfQBxy/DYfjalW+vqCA9QJL5GDu61O3cj+s5obAulxjWd5iqBGDHGaRKPYbadwZ5QoC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jKXcscfP; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jKXcscfP"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f17452so1015665e87.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 13:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789330386; x=1789935186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pa8OFY4TTfkGf1f2ba0w2jmPlViOEeXI2aNAgx40u2c=;
        b=jKXcscfP4nQ36XQJ5WrwsLqv7PcWbMlYkPLMiFXLx2CYUvOnsNO5e6lUUxHWZq/j/5
         Ap8z9r3JtWkRJjqMuuR/WFN6ExJ1boDk72MHrLB9C1WEgNYt2LIIhPHarFm/gfGQQh6n
         RqrYAQdODyAyd7ePY9w/GYLumK3dvjB2XHNaHdKRhXQfcOTnwhhOsSaNQ7mkWn/lEju4
         FaCcsD4M6tO6RgCUGGKOeU8WN/7zZhD+ETAc6GjX9ZqfuxrCGkj90TO272H8yxvS4RPB
         JhcUsW1Ra4Bge5XB/IVhqSGsO8KBh3tmGDWr3VaZsKmcvTS13JYJUH0SWt5SAsxQNK6n
         h7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789330386; x=1789935186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pa8OFY4TTfkGf1f2ba0w2jmPlViOEeXI2aNAgx40u2c=;
        b=AsikISGi7NELvB0R21kgaI/5EkUlOREohVB2xZbHkL9yQAjH9Z6LP2yEbuEZri211r
         G1I0/iFTpLKNwP3XmI2YCyd45CKzAUCImOR1C7KnMMoUAHtXBL0E5Z61nOQteTyYKlVX
         UXhkdG6FwNYd21hruI7PECtjALeGYkpUmzw2dvCiwGJwbRi4KbddLRLWrB797XnsklCx
         Uvs6jTQo0TPe0ejWonvQqHSYuv6XAw49YM1wQQvknVzMuO0Brx2yFKMBF7wBGQXIUhdQ
         ZrWbVQnxjhsscWBIE+L8vIBMoph7VNqOWGu5oBt4mStDIJ5GxudrNSr8gABTz55eTeUQ
         dWSw==
X-Forwarded-Encrypted: i=1; AKwUvBxas+pUFXivbeQewif8pCedFSpy6ZhtkZumymyb324/+ukd8pupc6cIqjlRLNI4StlOk7UKbWh0GTkoNhg=@vger.kernel.org
X-Gm-Message-State: AFuF++m+hf6bkDT9ORzKn+wT1nV/PDUCyYQS7FN14q5LZrU1ia60Zt3P
	zWrSPQN9Wi+vbravgP85u3wuYrI1PFUJFOtFzCovb2s183MrjBobClTX
X-Gm-Gg: AYBFou0Ripg6QBePM1ISS3jDn56UCNF0kKSzwxESZP/fkdxSmM4SKThAbVaDGhZugjT
	sMeaAWrIMFumB6uJDTv9El/NQAAOTj0Mx4FOfl3/es36PkjD6j549kA3ViYkUVfEYCCZHNd2yGL
	z3XD/mxd2siNbuQixS8lzmUN8m6ap3J1K6hF0ntbHp07Zn4Kr0fOLhMOE/8VT8RAY5kNbigYVM5
	39UNobSPue5kYrO3II+s6sd1Xr2swq3Q3j8pmwEuXBsmYk55N1CumwbigdK/w+963tUNB2w+Bxc
	zcmaGpgA74oAS39yQIBTdkGj6zSknGPe4KPkQQavO6WkH3bPD7wdgnNqDLOPUBN6LgcYkJN3P//
	LTvZ0jEja+ItQ7uD5Jvz/2pdwdsuk7VkrlL9e8YNrn9LwaCrn0vXnM+1nOJDFA53kTCC+Fv2L5m
	7cb+YMbfSAxWEwOCfU1cDwIfXeOrK/xy761bPumCEaRUhd0bKhKKYkMfmJ2ryCVaaiRTm24tHSY
	V9WppizSwdTu4A3Xojhp822updyZgi6VT0+TjrWd3CM
X-Received: by 2002:a05:6512:3e15:b0:5b6:183c:5ca2 with SMTP id 2adb3069b0e04-5b8a8f0064bmr1551667e87.64.1789330385733;
        Sun, 13 Sep 2026 13:13:05 -0700 (PDT)
Received: from tallipc.shacknet.nu (91-157-240-22.elisa-laajakaista.fi. [91.157.240.22])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a03a85cesm2003345e87.1.2026.09.13.13.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:13:05 -0700 (PDT)
From: Risto Pajula <or.pajula@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Risto Pajula <or.pajula@gmail.com>
Subject: [PATCH 0/2] drm/nouveau: fix GK107 VDPAU regressions
Date: Sun, 13 Sep 2026 23:12:23 +0300
Message-ID: <20260913201225.5975-1-or.pajula@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series fixes two independent Nouveau regressions affecting VDPAU
hardware video decoding on NVIDIA GK107 (Kepler).

Patch 1 fixes engine context mappings for the legacy MSVLD, MSPDEC and
MSPPP video engines. Since commit 8ab849d6dd4c
("drm/nouveau/fifo: add new engine context handling"), privileged engine
context mappings cause FIFO PRIV_VIOLATION faults and kill the channel
during VDPAU decoding on GK107.

Patch 2 fixes a fence/progress hang introduced by commit 55e1a5996085
("drm/nouveau/fifo/ga100-: add per-runlist nonstall intr handling").
Legacy FIFO implementations use a single global nonstall event at
index 0, while channel event registration was changed to use runl->id
unconditionally. This can leave fence completion waiting for an event
that is never signalled.


Tested on NVIDIA GK107 with a Linux 7.3-rc2 based drm-misc tree,
Mesa 25.0.7 and mpv using VDPAU_DRIVER=nouveau and vdpau-copy.

With both patches applied:

  H.264 1920x1080:        PASS
  MPEG-2 1920x1080:      PASS
  VC-1 Advanced Profile: PASS

All three tests completed using VDPAU hardware decoding. No Nouveau
faults were reported in dmesg.


Thanks,
Risto

Risto Pajula (2):
  drm/nouveau/fifo/gk104: fix legacy video engine context mappings
  drm/nouveau/fifo: use global nonstall event on legacy FIFO

 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c | 14 ++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c |  3 ++-
 2 files changed, 16 insertions(+), 1 deletion(-)

-- 
2.47.3

